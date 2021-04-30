Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A91E36F8D3
	for <lists+linux-doc@lfdr.de>; Fri, 30 Apr 2021 12:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhD3K7h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Apr 2021 06:59:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:52162 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhD3K7h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Apr 2021 06:59:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2C25DB246;
        Fri, 30 Apr 2021 10:58:48 +0000 (UTC)
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
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 9/9] drm/simpledrm: Acquire memory aperture for framebuffer
Date:   Fri, 30 Apr 2021 12:58:40 +0200
Message-Id: <20210430105840.30515-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430105840.30515-1-tzimmermann@suse.de>
References: <20210430105840.30515-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We register the simplekms device with the DRM platform helpers. A
native driver for the graphics hardware will kick-out the simpledrm
driver before taking over the device.

The original generic platform device from the simple-framebuffer boot
code will be unregistered. The native driver will use whatever native
hardware device it received.

v4:
	* convert to drm_aperture_acquire_from_firmware()
v3:
	* use platform_device_unregister() and handle detachment
	  like hot-unplug event (Daniel)
v2:
	* adapt to aperture changes
	* use drm_dev_unplug() and drm_dev_enter/exit()
	* don't split error string

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/tiny/simpledrm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 9d522473cd7c..2bdb477d9326 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -517,14 +518,23 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 
 static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 {
+	struct drm_device *dev = &sdev->dev;
 	struct platform_device *pdev = sdev->pdev;
 	struct resource *mem;
 	void __iomem *screen_base;
+	int ret;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem)
 		return -EINVAL;
 
+	ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
+	if (ret) {
+		drm_err(dev, "could not acquire memory range [0x%llx:0x%llx]: error %d\n",
+			mem->start, mem->end, ret);
+		return ret;
+	}
+
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
 				      resource_size(mem));
 	if (!screen_base)
@@ -625,12 +635,18 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
+	struct drm_device *dev = &sdev->dev;
+	int idx;
 
 	if (!fb)
 		return;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	drm_fb_blit_dstclip(sdev->screen_base, sdev->pitch,
 			    sdev->format->format, vmap, fb);
+	drm_dev_exit(idx);
 }
 
 static void
@@ -658,7 +674,9 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
 	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *dev = &sdev->dev;
 	struct drm_rect clip;
+	int idx;
 
 	if (!fb)
 		return;
@@ -666,8 +684,13 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &clip))
 		return;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	drm_fb_blit_rect_dstclip(sdev->screen_base, sdev->pitch,
 				 sdev->format->format, vmap, fb, &clip);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_simple_display_pipe_funcs
@@ -847,7 +870,7 @@ static int simpledrm_remove(struct platform_device *pdev)
 	struct simpledrm_device *sdev = platform_get_drvdata(pdev);
 	struct drm_device *dev = &sdev->dev;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(dev);
 
 	return 0;
 }
-- 
2.31.1

