Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319ED35BF25
	for <lists+linux-doc@lfdr.de>; Mon, 12 Apr 2021 11:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239322AbhDLJDE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Apr 2021 05:03:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:39726 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239563AbhDLJAo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 05:00:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D2EB6AFE1;
        Mon, 12 Apr 2021 09:00:25 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 3/3] drm/aperture: Inline fbdev conflict helpers into aperture helpers
Date:   Mon, 12 Apr 2021 11:00:21 +0200
Message-Id: <20210412090021.23054-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412090021.23054-1-tzimmermann@suse.de>
References: <20210412090021.23054-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fbdev's helpers for handling conflicting framebuffer drivers are
related to framebuffer apertures, not console emulation. Therefore
remove them from drm_fb_helper.h and inline them into the aperture
helpers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_aperture.c | 23 +++++++++++++--
 include/drm/drm_fb_helper.h    | 51 ----------------------------------
 2 files changed, 20 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 929dcbc0758a..e034dd7f9b09 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: MIT
 
+#include <linux/fb.h>
+#include <linux/vgaarb.h>
+
 #include <drm/drm_aperture.h>
-#include <drm/drm_fb_helper.h>
 
 /**
  * DOC: overview
@@ -78,6 +80,7 @@
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 bool primary, const char *name)
 {
+#if IS_REACHABLE(CONFIG_FB)
 	struct apertures_struct *a;
 	int ret;
 
@@ -88,10 +91,13 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
 	a->ranges[0].base = base;
 	a->ranges[0].size = size;
 
-	ret = drm_fb_helper_remove_conflicting_framebuffers(a, name, primary);
+	ret = remove_conflicting_framebuffers(a, name, primary);
 	kfree(a);
 
 	return ret;
+#else
+	return 0;
+#endif
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
@@ -109,6 +115,17 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
  */
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name)
 {
-	return drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, name);
+	int ret = 0;
+
+	/*
+	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+	 * otherwise the vga fbdev driver falls over.
+	 */
+#if IS_REACHABLE(CONFIG_FB)
+	ret = remove_conflicting_pci_framebuffers(pdev, name);
+#endif
+	if (ret == 0)
+		ret = vga_remove_vgacon(pdev);
+	return ret;
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3b273f9ca39a..3af4624368d8 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -36,7 +36,6 @@ struct drm_fb_helper;
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <linux/kgdb.h>
-#include <linux/vgaarb.h>
 
 enum mode_set_atomic {
 	LEAVE_ATOMIC_MODE_SET,
@@ -451,54 +450,4 @@ drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 
 #endif
 
-/**
- * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
- * @a: memory range, users of which are to be removed
- * @name: requesting driver name
- * @primary: also kick vga16fb if present
- *
- * This function removes framebuffer devices (initialized by firmware/bootloader)
- * which use memory range described by @a. If @a is NULL all such devices are
- * removed.
- */
-static inline int
-drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
-					      const char *name, bool primary)
-{
-#if IS_REACHABLE(CONFIG_FB)
-	return remove_conflicting_framebuffers(a, name, primary);
-#else
-	return 0;
-#endif
-}
-
-/**
- * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
- * @pdev: PCI device
- * @name: requesting driver name
- *
- * This function removes framebuffer devices (eg. initialized by firmware)
- * using memory range configured for any of @pdev's memory bars.
- *
- * The function assumes that PCI device with shadowed ROM drives a primary
- * display and so kicks out vga16fb.
- */
-static inline int
-drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-						  const char *name)
-{
-	int ret = 0;
-
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-#if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, name);
-#endif
-	if (ret == 0)
-		ret = vga_remove_vgacon(pdev);
-	return ret;
-}
-
 #endif
-- 
2.31.1

