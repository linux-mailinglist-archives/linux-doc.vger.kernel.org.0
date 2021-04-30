Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00E636F8C9
	for <lists+linux-doc@lfdr.de>; Fri, 30 Apr 2021 12:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhD3K7f (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Apr 2021 06:59:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:51788 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231361AbhD3K7c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Apr 2021 06:59:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 72394B290;
        Fri, 30 Apr 2021 10:58:43 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
        broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
        emil.l.velikov@gmail.com, geert+renesas@glider.be,
        hdegoede@redhat.com, bluescreen_avenger@verizon.net,
        gregkh@linuxfoundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 1/9] drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
Date:   Fri, 30 Apr 2021 12:58:32 +0200
Message-Id: <20210430105840.30515-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430105840.30515-1-tzimmermann@suse.de>
References: <20210430105840.30515-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The memcpy's destination buffer might have a different pitch than the
source. Support different pitches as function argument.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/drm_format_helper.c    | 9 +++++----
 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
 drivers/gpu/drm/tiny/cirrus.c          | 2 +-
 include/drm/drm_format_helper.h        | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index c043ca364c86..8d5a683afea7 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -52,6 +52,7 @@ EXPORT_SYMBOL(drm_fb_memcpy);
 /**
  * drm_fb_memcpy_dstclip - Copy clip buffer
  * @dst: Destination buffer (iomem)
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: Source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -59,12 +60,12 @@ EXPORT_SYMBOL(drm_fb_memcpy);
  * This function applies clipping on dst, i.e. the destination is a
  * full (iomem) framebuffer but only the clip rect content is copied over.
  */
-void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
-			   struct drm_framebuffer *fb,
+void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			   void *vaddr, struct drm_framebuffer *fb,
 			   struct drm_rect *clip)
 {
 	unsigned int cpp = fb->format->cpp[0];
-	unsigned int offset = clip_offset(clip, fb->pitches[0], cpp);
+	unsigned int offset = clip_offset(clip, dst_pitch, cpp);
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y, lines = clip->y2 - clip->y1;
 
@@ -73,7 +74,7 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
 	for (y = 0; y < lines; y++) {
 		memcpy_toio(dst, vaddr, len);
 		vaddr += fb->pitches[0];
-		dst += fb->pitches[0];
+		dst += dst_pitch;
 	}
 }
 EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index cece3e57fb27..9d576240faed 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1554,7 +1554,7 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 {
 	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
 
-	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
+	drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb, clip);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index e3afb45d9a5c..42611dacde88 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -324,7 +324,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_
 		return -ENODEV;
 
 	if (cirrus->cpp == fb->format->cpp[0])
-		drm_fb_memcpy_dstclip(cirrus->vram,
+		drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
 				      vmap, fb, rect);
 
 	else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2)
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 5f9e37032468..2b5036a5fbe7 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -11,7 +11,7 @@ struct drm_rect;
 
 void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
 		   struct drm_rect *clip);
-void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
+void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vaddr,
 			   struct drm_framebuffer *fb,
 			   struct drm_rect *clip);
 void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
-- 
2.31.1

