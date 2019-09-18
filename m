Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06307B65DE
	for <lists+linux-doc@lfdr.de>; Wed, 18 Sep 2019 16:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfIROXR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Sep 2019 10:23:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:33302 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730317AbfIROXQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D5D6CB67E;
        Wed, 18 Sep 2019 14:23:12 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/11] drm/mgag200: Rename cursor functions to use mgag200_ prefix
Date:   Wed, 18 Sep 2019 16:23:02 +0200
Message-Id: <20190918142307.27127-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Although the driver source code is fairly inconsistent wrt naming, the
prefix should be mgag200. Rename cursor functions accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 20 ++++++++------------
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  6 +++---
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  4 ++--
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 89f61573a497..648357ad9a4b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -12,11 +12,10 @@
 static bool warn_transparent = true;
 static bool warn_palette = true;
 
-/*
-  Hide the cursor off screen. We can't disable the cursor hardware because it
-  takes too long to re-activate and causes momentary corruption
-*/
-static void mga_hide_cursor(struct mga_device *mdev)
+/* Hide the cursor off screen. We can't disable the cursor hardware because it
+ * takes too long to re-activate and causes momentary corruption
+ */
+static void mgag200_hide_cursor(struct mga_device *mdev)
 {
 	WREG8(MGA_CURPOSXL, 0);
 	WREG8(MGA_CURPOSXH, 0);
@@ -25,11 +24,8 @@ static void mga_hide_cursor(struct mga_device *mdev)
 	mdev->cursor.pixels_current = NULL;
 }
 
-int mga_crtc_cursor_set(struct drm_crtc *crtc,
-			struct drm_file *file_priv,
-			uint32_t handle,
-			uint32_t width,
-			uint32_t height)
+int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
+			    uint32_t handle, uint32_t width, uint32_t height)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = (struct mga_device *)dev->dev_private;
@@ -66,7 +62,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	}
 
 	if (!handle || !file_priv) {
-		mga_hide_cursor(mdev);
+		mgag200_hide_cursor(mdev);
 		return 0;
 	}
 
@@ -224,7 +220,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	return ret;
 }
 
-int mga_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
+int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
 	struct mga_device *mdev = (struct mga_device *)crtc->dev->dev_private;
 	/* Our origin is at (64,64) */
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 37c003ed57c0..5244e3fa4203 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -203,8 +203,8 @@ int mgag200_mm_init(struct mga_device *mdev);
 void mgag200_mm_fini(struct mga_device *mdev);
 int mgag200_mmap(struct file *filp, struct vm_area_struct *vma);
 
-int mga_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
-						uint32_t handle, uint32_t width, uint32_t height);
-int mga_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
+int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
+			    uint32_t handle, uint32_t width, uint32_t height);
+int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 68226556044b..0cf5608c3644 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1413,8 +1413,8 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
 
 /* These provide the minimum set of functions required to handle a CRTC */
 static const struct drm_crtc_funcs mga_crtc_funcs = {
-	.cursor_set = mga_crtc_cursor_set,
-	.cursor_move = mga_crtc_cursor_move,
+	.cursor_set = mgag200_crtc_cursor_set,
+	.cursor_move = mgag200_crtc_cursor_move,
 	.gamma_set = mga_crtc_gamma_set,
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = mga_crtc_destroy,
-- 
2.23.0

