Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1C435BF22
	for <lists+linux-doc@lfdr.de>; Mon, 12 Apr 2021 11:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239318AbhDLJDA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Apr 2021 05:03:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:39678 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239557AbhDLJAo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 05:00:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 403FDB1BC;
        Mon, 12 Apr 2021 09:00:25 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/3] drm/aperture: Add infrastructure for aperture ownership
Date:   Mon, 12 Apr 2021 11:00:19 +0200
Message-Id: <20210412090021.23054-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412090021.23054-1-tzimmermann@suse.de>
References: <20210412090021.23054-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Platform devices might operate on firmware framebuffers, such as VESA
or EFI. Before a native driver for the graphics hardware can take over
the device, it has to remove any platform driver that operates on the
firmware framebuffer. Aperture helpers provide the infrastructure for
native drivers to remove the generic ones.

For now, this only concerns generic fbdev drivers. Code for removing
these is provided by drm_fb_helper_remove_conflicting_framebuffers() et
al. Simply wrap these functions for now. At a later point, code can be
added for generic DRM drivers to acquire firmware framebuffers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/drm-internals.rst |  12 +++
 drivers/gpu/drm/Makefile            |   2 +-
 drivers/gpu/drm/drm_aperture.c      | 114 ++++++++++++++++++++++++++++
 include/drm/drm_aperture.h          |  31 ++++++++
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_aperture.c
 create mode 100644 include/drm/drm_aperture.h

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 12272b168580..06af044c882f 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -75,6 +75,18 @@ update it, its value is mostly useless. The DRM core prints it to the
 kernel log at initialization time and passes it to userspace through the
 DRM_IOCTL_VERSION ioctl.
 
+Managing Ownership of the Framebuffer Aperture
+----------------------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_aperture.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
+   :export:
+
 Device Instance and Driver Handling
 -----------------------------------
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5279db4392df..89e747fedc00 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-drm-y       :=	drm_auth.o drm_cache.o \
+drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_file.o drm_gem.o drm_ioctl.o drm_irq.o \
 		drm_drv.o \
 		drm_sysfs.o drm_hashtab.o drm_mm.o \
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
new file mode 100644
index 000000000000..929dcbc0758a
--- /dev/null
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: MIT
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_fb_helper.h>
+
+/**
+ * DOC: overview
+ *
+ * A graphics device might be supported by different drivers, but only one
+ * driver can be active at any given time. Many systems load a generic
+ * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
+ * During later boot stages, they replace the generic driver with a dedicated,
+ * hardware-specific driver. To take over the device the dedicated driver
+ * first has to remove the generic driver. DRM aperture functions manage
+ * ownership of DRM framebuffer memory and hand-over between drivers.
+ *
+ * DRM drivers should call drm_aperture_remove_conflicting_framebuffers()
+ * at the top of their probe function. The function removes any generic
+ * driver that is currently associated with the given framebuffer memory.
+ * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the
+ * example given below.
+ *
+ * .. code-block:: c
+ *
+ *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
+ *	{
+ *		bool primary = false;
+ *		resource_size_t base, size;
+ *		int ret;
+ *
+ *		base = pci_resource_start(pdev, 0);
+ *		size = pci_resource_len(pdev, 0);
+ *	#ifdef CONFIG_X86
+ *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
+ *	#endif
+ *
+ *		return drm_aperture_remove_conflicting_framebuffers(base, size, primary,
+ *		                                                    "example driver");
+ *	}
+ *
+ *	static int probe(struct pci_dev *pdev)
+ *	{
+ *		int ret;
+ *
+ *		// Remove any generic drivers...
+ *		ret = remove_conflicting_framebuffers(pdev);
+ *		if (ret)
+ *			return ret;
+ *
+ *		// ... and initialize the hardware.
+ *		...
+ *
+ *		drm_dev_register();
+ *
+ *		return 0;
+ *	}
+ *
+ * PCI device drivers should call
+ * drm_aperture_remove_conflicting_pci_framebuffers() and let it detect the
+ * framebuffer apertures automatically. Device drivers without knowledge of
+ * the framebuffer's location shall call drm_aperture_remove_framebuffers(),
+ * which removes all drivers for known framebuffer.
+ */
+
+/**
+ * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
+ * @base: the aperture's base address in physical memory
+ * @size: aperture size in bytes
+ * @primary: also kick vga16fb if present
+ * @name: requesting driver name
+ *
+ * This function removes graphics device drivers which use memory range described by
+ * @base and @size.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
+						 bool primary, const char *name)
+{
+	struct apertures_struct *a;
+	int ret;
+
+	a = alloc_apertures(1);
+	if (!a)
+		return -ENOMEM;
+
+	a->ranges[0].base = base;
+	a->ranges[0].size = size;
+
+	ret = drm_fb_helper_remove_conflicting_framebuffers(a, name, primary);
+	kfree(a);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
+
+/**
+ * drm_aperture_remove_conflicting_pci_framebuffers - remove existing framebuffers for PCI devices
+ * @pdev: PCI device
+ * @name: requesting driver name
+ *
+ * This function removes graphics device drivers using memory range configured
+ * for any of @pdev's memory bars. The function assumes that PCI device with
+ * shadowed ROM drives a primary display and so kicks out vga16fb.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name)
+{
+	return drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, name);
+}
+EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
new file mode 100644
index 000000000000..a9e2a785e09a
--- /dev/null
+++ b/include/drm/drm_aperture.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _DRM_APERTURE_H_
+#define _DRM_APERTURE_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+
+int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
+						 bool primary, const char *name);
+
+int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev, const char *name);
+
+/**
+ * drm_aperture_remove_conflicting_framebuffers - remove all existing framebuffers
+ * @primary: also kick vga16fb if present
+ * @name: requesting driver name
+ *
+ * This function removes all graphics device drivers. Use this function on systems
+ * that can have their framebuffer located anywhere in memory.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+static inline int drm_aperture_remove_framebuffers(bool primary, const char *name)
+{
+	return drm_aperture_remove_conflicting_framebuffers(0, (resource_size_t)-1, primary, name);
+}
+
+#endif
-- 
2.31.1

