Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B486FBBA75
	for <lists+linux-doc@lfdr.de>; Mon, 23 Sep 2019 19:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440163AbfIWR2E (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 23 Sep 2019 13:28:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:46432 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440164AbfIWR2E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8D217B646;
        Mon, 23 Sep 2019 17:28:00 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/12] drm/ast: Allocate cursor BOs at high end of video memory
Date:   Mon, 23 Sep 2019 19:27:46 +0200
Message-Id: <20190923172753.26593-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

By putting cursor BOs at the high end of the video memory, we can avoid
memory fragmentation. Starting at the low end, contiguous video memory is
available for framebuffers.

The patch also simplifies the buffer swapping by splitting
struct ast_private.cursor_cache BO into two separate boffer objects. Cursor
images alternate between these buffers instead of offsets within cursor_cache.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 43 +++++++++-------
 drivers/gpu/drm/ast/ast_mode.c | 91 ++++++++++++++++++----------------
 2 files changed, 73 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 244cc7c382af..fc35163c7541 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -82,6 +82,25 @@ enum ast_tx_chip {
 #define AST_DRAM_4Gx16   7
 #define AST_DRAM_8Gx16   8
 
+
+#define AST_MAX_HWC_WIDTH	64
+#define AST_MAX_HWC_HEIGHT	64
+
+#define AST_HWC_SIZE		(AST_MAX_HWC_WIDTH * AST_MAX_HWC_HEIGHT * 2)
+#define AST_HWC_SIGNATURE_SIZE	32
+
+#define AST_DEFAULT_HWC_NUM	2
+
+/* define for signature structure */
+#define AST_HWC_SIGNATURE_CHECKSUM 	0x00
+#define AST_HWC_SIGNATURE_SizeX		0x04
+#define AST_HWC_SIGNATURE_SizeY		0x08
+#define AST_HWC_SIGNATURE_X		0x0C
+#define AST_HWC_SIGNATURE_Y		0x10
+#define AST_HWC_SIGNATURE_HOTSPOTX	0x14
+#define AST_HWC_SIGNATURE_HOTSPOTY	0x18
+
+
 struct ast_private {
 	struct drm_device *dev;
 
@@ -97,8 +116,11 @@ struct ast_private {
 
 	int fb_mtrr;
 
-	struct drm_gem_object *cursor_cache;
-	int next_cursor;
+	struct {
+		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
+		unsigned int next_index;
+	} cursor;
+
 	bool support_wide_screen;
 	enum {
 		ast_use_p2a,
@@ -199,23 +221,6 @@ static inline void ast_open_key(struct ast_private *ast)
 
 #define AST_VIDMEM_DEFAULT_SIZE AST_VIDMEM_SIZE_8M
 
-#define AST_MAX_HWC_WIDTH 64
-#define AST_MAX_HWC_HEIGHT 64
-
-#define AST_HWC_SIZE                (AST_MAX_HWC_WIDTH*AST_MAX_HWC_HEIGHT*2)
-#define AST_HWC_SIGNATURE_SIZE      32
-
-#define AST_DEFAULT_HWC_NUM 2
-/* define for signature structure */
-#define AST_HWC_SIGNATURE_CHECKSUM  0x00
-#define AST_HWC_SIGNATURE_SizeX     0x04
-#define AST_HWC_SIGNATURE_SizeY     0x08
-#define AST_HWC_SIGNATURE_X         0x0C
-#define AST_HWC_SIGNATURE_Y         0x10
-#define AST_HWC_SIGNATURE_HOTSPOTX  0x14
-#define AST_HWC_SIGNATURE_HOTSPOTY  0x18
-
-
 struct ast_i2c_chan {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6a517ffb1c5c..b13eaa2619ab 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -883,50 +883,53 @@ static int ast_connector_init(struct drm_device *dev)
 static int ast_cursor_init(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;
-	int size;
-	int ret;
-	struct drm_gem_object *obj;
+	size_t size, i;
 	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
-	void *base;
+	int ret;
 
-	size = (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE) * AST_DEFAULT_HWC_NUM;
+	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 
-	ret = ast_gem_create(dev, size, true, &obj);
-	if (ret)
-		return ret;
-	gbo = drm_gem_vram_of_gem(obj);
-	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
-	if (ret)
-		goto fail;
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (gpu_addr < 0) {
-		drm_gem_vram_unpin(gbo);
-		ret = (int)gpu_addr;
-		goto fail;
-	}
+	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
+					  size, 0, false);
+		if (IS_ERR(gbo)) {
+			ret = PTR_ERR(gbo);
+			goto err_drm_gem_vram_put;
+		}
+		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
+					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
+		if (ret) {
+			drm_gem_vram_put(gbo);
+			goto err_drm_gem_vram_put;
+		}
 
-	/* kmap the object */
-	base = drm_gem_vram_kmap(gbo, true, NULL);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto fail;
+		ast->cursor.gbo[i] = gbo;
 	}
 
-	ast->cursor_cache = obj;
 	return 0;
-fail:
+
+err_drm_gem_vram_put:
+	while (i) {
+		--i;
+		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+		ast->cursor.gbo[i] = NULL;
+	}
 	return ret;
 }
 
 static void ast_cursor_fini(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;
-	struct drm_gem_vram_object *gbo =
-		drm_gem_vram_of_gem(ast->cursor_cache);
-	drm_gem_vram_kunmap(gbo);
-	drm_gem_vram_unpin(gbo);
-	drm_gem_object_put_unlocked(ast->cursor_cache);
+	size_t i;
+	struct drm_gem_vram_object *gbo;
+
+	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+	}
 }
 
 int ast_mode_init(struct drm_device *dev)
@@ -1156,12 +1159,12 @@ static int ast_show_cursor(struct drm_crtc *crtc, void *src,
 	struct ast_private *ast = crtc->dev->dev_private;
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
 	struct drm_gem_vram_object *gbo;
-	u8 *dst, *dst_next;
+	void *dst;
 	s64 off;
 	int ret;
 	u8 jreg;
 
-	gbo = drm_gem_vram_of_gem(ast->cursor_cache);
+	gbo = ast->cursor.gbo[ast->cursor.next_index];
 	dst = drm_gem_vram_vmap(gbo);
 	if (IS_ERR(dst))
 		return PTR_ERR(dst);
@@ -1171,10 +1174,7 @@ static int ast_show_cursor(struct drm_crtc *crtc, void *src,
 		goto err_drm_gem_vram_vunmap;
 	}
 
-	dst_next = dst + (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE) *
-		   ast->next_cursor;
-
-	ret = ast_cursor_update(dst_next, src, width, height);
+	ret = ast_cursor_update(dst, src, width, height);
 	if (ret)
 		goto err_drm_gem_vram_vunmap;
 	ast_cursor_set_base(ast, off);
@@ -1187,7 +1187,8 @@ static int ast_show_cursor(struct drm_crtc *crtc, void *src,
 	jreg |= 1;
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
 
-	ast->next_cursor = (ast->next_cursor + 1) % AST_DEFAULT_HWC_NUM;
+	++ast->cursor.next_index;
+	ast->cursor.next_index %= ARRAY_SIZE(ast->cursor.gbo);
 
 	drm_gem_vram_vunmap(gbo, dst);
 
@@ -1257,13 +1258,17 @@ static int ast_cursor_move(struct drm_crtc *crtc,
 {
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
 	struct ast_private *ast = crtc->dev->dev_private;
+	struct drm_gem_vram_object *gbo;
 	int x_offset, y_offset;
-	u8 *sig;
+	u8 *dst, *sig;
 	u8 jreg;
 
-	sig = drm_gem_vram_kmap(drm_gem_vram_of_gem(ast->cursor_cache),
-				false, NULL);
-	sig += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
+	gbo = ast->cursor.gbo[ast->cursor.next_index];
+	dst = drm_gem_vram_vmap(gbo);
+	if (IS_ERR(dst))
+		return PTR_ERR(dst);
+
+	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
@@ -1290,5 +1295,7 @@ static int ast_cursor_move(struct drm_crtc *crtc,
 	       0x01; /* enable ARGB4444 cursor */
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
 
+	drm_gem_vram_vunmap(gbo, dst);
+
 	return 0;
 }
-- 
2.23.0

