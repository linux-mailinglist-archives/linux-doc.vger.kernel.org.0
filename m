Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A122554C0D
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jun 2022 16:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357793AbiFVOBp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Jun 2022 10:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357735AbiFVOBk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 10:01:40 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BDD377D2;
        Wed, 22 Jun 2022 07:01:38 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4753E1F9CB;
        Wed, 22 Jun 2022 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655906497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gL32lOjELK9sqTmo11UROXpbmM52kR7aOueoWDPKbJA=;
        b=KHgSJFhuQdRJhYB9ITAKnBQZqTJYwHQzrMWOjYkUEiLTDIMiU8TTdooUI8jVtfU0MJXg9y
        0fr3clmQTNaqdSFX/aqJ3+IO5QNEOePg4oseu0x7FhBk7NOoPlD3GX53bkOURtJYaICEa9
        qxWRj9HWtd2Y7DUVwuQ/sNFLF7DzBLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655906497;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gL32lOjELK9sqTmo11UROXpbmM52kR7aOueoWDPKbJA=;
        b=SU7GKmbSoqkA4bndjNuAabG6e5kPpA5E0hfUdPk70EM2MJXSfrWNhyhFlC8Z4JY32xNw9d
        Qlqg7UvNoZSZRuCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCE71134A9;
        Wed, 22 Jun 2022 14:01:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6NYBNcAgs2IVRwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 22 Jun 2022 14:01:36 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     alex.williamson@redhat.com, corbet@lwn.net,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
        gregkh@linuxfoundation.org, javierm@redhat.com, lersek@redhat.com,
        kraxel@redhat.com
Cc:     linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/3] drm: Implement DRM aperture helpers under video/
Date:   Wed, 22 Jun 2022 16:01:33 +0200
Message-Id: <20220622140134.12763-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622140134.12763-1-tzimmermann@suse.de>
References: <20220622140134.12763-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Implement DRM's aperture helpers under video/ for sharing with other
sub-systems. Remove DRM-isms from the interface. The helpers track
the ownership of framebuffer apertures and provide hand-over from
firmware, such as EFI and VESA, to native graphics drivers.

Other subsystems, such as fbdev and vfio, also have to maintain ownership
of framebuffer apertures. Moving DRM's aperture helpers to a more public
location allows all subsystems to interact with each other and share a
common implementation.

The aperture helpers are selected by the various firmware drivers within
DRM and fbdev, and the VGA text-console driver.

The original DRM interface is kept in place for use by DRM drivers.

v3:
	* prefix all interfaces with aperture_ (Javier)
	* rework and simplify documentation (Javier)
	* rename struct dev_aperture to struct aperture_range
	* rebase onto latest DRM
	* update MAINTAINERS entry

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
---
 Documentation/driver-api/aperture.rst |  13 +
 Documentation/driver-api/index.rst    |   1 +
 MAINTAINERS                           |   2 +
 drivers/gpu/drm/drm_aperture.c        | 178 +------------
 drivers/gpu/drm/tiny/Kconfig          |   1 +
 drivers/video/Kconfig                 |   6 +
 drivers/video/Makefile                |   2 +
 drivers/video/aperture.c              | 351 ++++++++++++++++++++++++++
 drivers/video/console/Kconfig         |   1 +
 drivers/video/fbdev/Kconfig           |   7 +-
 include/linux/aperture.h              |  56 ++++
 11 files changed, 448 insertions(+), 170 deletions(-)
 create mode 100644 Documentation/driver-api/aperture.rst
 create mode 100644 drivers/video/aperture.c
 create mode 100644 include/linux/aperture.h

diff --git a/Documentation/driver-api/aperture.rst b/Documentation/driver-api/aperture.rst
new file mode 100644
index 000000000000..d173f4e7a7d9
--- /dev/null
+++ b/Documentation/driver-api/aperture.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Managing Ownership of the Framebuffer Aperture
+==============================================
+
+.. kernel-doc:: drivers/video/aperture.c
+   :doc: overview
+
+.. kernel-doc:: include/linux/aperture.h
+   :internal:
+
+.. kernel-doc:: drivers/video/aperture.c
+   :export:
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index a6d525cd9fc4..d3a58f77328e 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -27,6 +27,7 @@ available subsections can be seen below.
    component
    message-based
    infiniband
+   aperture
    frame-buffer
    regulator
    reset
diff --git a/MAINTAINERS b/MAINTAINERS
index d4c091739db2..e86817b0ea1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6474,7 +6474,9 @@ S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/drm_aperture.c
 F:	drivers/gpu/drm/tiny/simpledrm.c
+F:	drivers/video/aperture.c
 F:	include/drm/drm_aperture.h
+F:	include/linux/aperture.h
 
 DRM DRIVER FOR SIS VIDEO CARDS
 S:	Orphan / Obsolete
diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 059fd71424f6..fdb7d5c17ba1 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -1,14 +1,7 @@
 // SPDX-License-Identifier: MIT
 
-#include <linux/device.h>
-#include <linux/fb.h>
-#include <linux/list.h>
-#include <linux/mutex.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h> /* for firmware helpers */
-#include <linux/slab.h>
-#include <linux/types.h>
-#include <linux/vgaarb.h>
+#include <linux/aperture.h>
+#include <linux/platform_device.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
@@ -126,92 +119,6 @@
  * afterwards.
  */
 
-struct drm_aperture {
-	struct drm_device *dev;
-	resource_size_t base;
-	resource_size_t size;
-	struct list_head lh;
-	void (*detach)(struct drm_device *dev);
-};
-
-static LIST_HEAD(drm_apertures);
-static DEFINE_MUTEX(drm_apertures_lock);
-
-static bool overlap(resource_size_t base1, resource_size_t end1,
-		    resource_size_t base2, resource_size_t end2)
-{
-	return (base1 < end2) && (end1 > base2);
-}
-
-static void devm_aperture_acquire_release(void *data)
-{
-	struct drm_aperture *ap = data;
-	bool detached = !ap->dev;
-
-	if (detached)
-		return;
-
-	mutex_lock(&drm_apertures_lock);
-	list_del(&ap->lh);
-	mutex_unlock(&drm_apertures_lock);
-}
-
-static int devm_aperture_acquire(struct drm_device *dev,
-				 resource_size_t base, resource_size_t size,
-				 void (*detach)(struct drm_device *))
-{
-	size_t end = base + size;
-	struct list_head *pos;
-	struct drm_aperture *ap;
-
-	mutex_lock(&drm_apertures_lock);
-
-	list_for_each(pos, &drm_apertures) {
-		ap = container_of(pos, struct drm_aperture, lh);
-		if (overlap(base, end, ap->base, ap->base + ap->size)) {
-			mutex_unlock(&drm_apertures_lock);
-			return -EBUSY;
-		}
-	}
-
-	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
-	if (!ap) {
-		mutex_unlock(&drm_apertures_lock);
-		return -ENOMEM;
-	}
-
-	ap->dev = dev;
-	ap->base = base;
-	ap->size = size;
-	ap->detach = detach;
-	INIT_LIST_HEAD(&ap->lh);
-
-	list_add(&ap->lh, &drm_apertures);
-
-	mutex_unlock(&drm_apertures_lock);
-
-	return devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
-}
-
-static void drm_aperture_detach_firmware(struct drm_device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev->dev);
-
-	/*
-	 * Remove the device from the device hierarchy. This is the right thing
-	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
-	 * the new driver takes over the hardware, the firmware device's state
-	 * will be lost.
-	 *
-	 * For non-platform devices, a new callback would be required.
-	 *
-	 * If the aperture helpers ever need to handle native drivers, this call
-	 * would only have to unplug the DRM device, so that the hardware device
-	 * stays around after detachment.
-	 */
-	platform_device_unregister(pdev);
-}
-
 /**
  * devm_aperture_acquire_from_firmware - Acquires ownership of a firmware framebuffer
  *                                       on behalf of a DRM driver.
@@ -239,39 +146,16 @@ static void drm_aperture_detach_firmware(struct drm_device *dev)
 int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t base,
 					resource_size_t size)
 {
+	struct platform_device *pdev;
+
 	if (drm_WARN_ON(dev, !dev_is_platform(dev->dev)))
 		return -EINVAL;
 
-	return devm_aperture_acquire(dev, base, size, drm_aperture_detach_firmware);
-}
-EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
-
-static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
-{
-	resource_size_t end = base + size;
-	struct list_head *pos, *n;
-
-	mutex_lock(&drm_apertures_lock);
-
-	list_for_each_safe(pos, n, &drm_apertures) {
-		struct drm_aperture *ap =
-			container_of(pos, struct drm_aperture, lh);
-		struct drm_device *dev = ap->dev;
-
-		if (WARN_ON_ONCE(!dev))
-			continue;
-
-		if (!overlap(base, end, ap->base, ap->base + ap->size))
-			continue;
-
-		ap->dev = NULL; /* detach from device */
-		list_del(&ap->lh);
+	pdev = to_platform_device(dev->dev);
 
-		ap->detach(dev);
-	}
-
-	mutex_unlock(&drm_apertures_lock);
+	return devm_aperture_acquire_for_platform_device(pdev, base, size);
 }
+EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
 
 /**
  * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
@@ -289,27 +173,7 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 bool primary, const struct drm_driver *req_driver)
 {
-#if IS_REACHABLE(CONFIG_FB)
-	struct apertures_struct *a;
-	int ret;
-
-	a = alloc_apertures(1);
-	if (!a)
-		return -ENOMEM;
-
-	a->ranges[0].base = base;
-	a->ranges[0].size = size;
-
-	ret = remove_conflicting_framebuffers(a, req_driver->name, primary);
-	kfree(a);
-
-	if (ret)
-		return ret;
-#endif
-
-	drm_aperture_detach_drivers(base, size);
-
-	return 0;
+	return aperture_remove_conflicting_devices(base, size, primary, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
@@ -328,30 +192,6 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						     const struct drm_driver *req_driver)
 {
-	resource_size_t base, size;
-	int bar, ret;
-
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-#if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, req_driver->name);
-	if (ret)
-		return ret;
-#endif
-	ret = vga_remove_vgacon(pdev);
-	if (ret)
-		return ret;
-
-	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
-		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-			continue;
-		base = pci_resource_start(pdev, bar);
-		size = pci_resource_len(pdev, bar);
-		drm_aperture_detach_drivers(base, size);
-	}
-
-	return 0;
+	return aperture_remove_conflicting_pci_devices(pdev, req_driver->name);
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 627d637a1e7e..027cd87c3d0d 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -69,6 +69,7 @@ config DRM_PANEL_MIPI_DBI
 config DRM_SIMPLEDRM
 	tristate "Simple framebuffer driver"
 	depends on DRM && MMU
+	select APERTURE_HELPERS
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 427a993c7f57..0587e21abad9 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -5,6 +5,12 @@
 
 menu "Graphics support"
 
+config APERTURE_HELPERS
+	bool
+	help
+	  Support tracking and hand-over of aperture ownership. Required
+	  by graphics drivers for firmware-provided framebuffers.
+
 if HAS_IOMEM
 
 config HAVE_FB_ATMEL
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index df7650adede9..5bb6b452cc83 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
new file mode 100644
index 000000000000..538f2d40acda
--- /dev/null
+++ b/drivers/video/aperture.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/aperture.h>
+#include <linux/device.h>
+#include <linux/fb.h> /* for old fbdev helpers */
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/vgaarb.h>
+
+/**
+ * DOC: overview
+ *
+ * A graphics device might be supported by different drivers, but only one
+ * driver can be active at any given time. Many systems load a generic
+ * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
+ * During later boot stages, they replace the generic driver with a dedicated,
+ * hardware-specific driver. To take over the device the dedicated driver
+ * first has to remove the generic driver. Aperture functions manage
+ * ownership of framebuffer memory and hand-over between drivers.
+ *
+ * Graphics drivers should call aperture_remove_conflicting_devices()
+ * at the top of their probe function. The function removes any generic
+ * driver that is currently associated with the given framebuffer memory.
+ * An example for a graphics device on the platform bus is shown below.
+ *
+ * .. code-block:: c
+ *
+ *	static int example_probe(struct platform_device *pdev)
+ *	{
+ *		struct resource *mem;
+ *		resource_size_t base, size;
+ *		int ret;
+ *
+ *		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ *		if (!mem)
+ *			return -ENODEV;
+ *		base = mem->start;
+ *		size = resource_size(mem);
+ *
+ *		ret = aperture_remove_conflicting_devices(base, size, false, "example");
+ *		if (ret)
+ *			return ret;
+ *
+ *		// Initialize the hardware
+ *		...
+ *
+ *		return 0;
+ *	}
+ *
+ *	static const struct platform_driver example_driver = {
+ *		.probe = example_probe,
+ *		...
+ *	};
+ *
+ * The given example reads the platform device's I/O-memory range from the
+ * device instance. An active framebuffer will be located within this range.
+ * The call to aperture_remove_conflicting_devices() releases drivers that
+ * have previously claimed ownership of the range and are currently driving
+ * output on the framebuffer. If successful, the new driver can take over
+ * the device.
+ *
+ * While the given example uses a platform device, the aperture helpers work
+ * with every bus that has an addressable framebuffer. In the case of PCI,
+ * device drivers can also call aperture_remove_conflicting_pci_devices() and
+ * let the function detect the apertures automatically. Device drivers without
+ * knowledge of the framebuffer's location can call
+ * aperture_remove_all_conflicting_devices(), which removes all known devices.
+ *
+ * Drivers that are susceptible to being removed by other drivers, such as
+ * generic EFI or VESA drivers, have to register themselves as owners of their
+ * framebuffer apertures. Ownership of the framebuffer memory is achieved
+ * by calling devm_aperture_acquire_for_platform_device(). If successful, the
+ * driveris the owner of the framebuffer range. The function fails if the
+ * framebuffer is already owned by another driver. See below for an example.
+ *
+ * .. code-block:: c
+ *
+ *	static int generic_probe(struct platform_device *pdev)
+ *	{
+ *		struct resource *mem;
+ *		resource_size_t base, size;
+ *
+ *		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ *		if (!mem)
+ *			return -ENODEV;
+ *		base = mem->start;
+ *		size = resource_size(mem);
+ *
+ *		ret = devm_aperture_acquire_for_platform_device(pdev, base, size);
+ *		if (ret)
+ *			return ret;
+ *
+ *		// Initialize the hardware
+ *		...
+ *
+ *		return 0;
+ *	}
+ *
+ *	static int generic_remove(struct platform_device *)
+ *	{
+ *		// Hot-unplug the device
+ *		...
+ *
+ *		return 0;
+ *	}
+ *
+ *	static const struct platform_driver generic_driver = {
+ *		.probe = generic_probe,
+ *		.remove = generic_remove,
+ *		...
+ *	};
+ *
+ * The similar to the previous example, the generic driver claims ownership
+ * of the framebuffer memory from its probe function. This will fail if the
+ * memory range, or parts of it, is already owned by another driver.
+ *
+ * If successful, the generic driver is now subject to forced removal by
+ * another driver. This only works for platform drivers that support hot
+ * unplugging. When a driver calls aperture_remove_conflicting_devices()
+ * et al for the registered framebuffer range, the aperture helpers call
+ * platform_device_unregister() and the generic driver unloads itself. The
+ * generic driver also has to provide a remove function to make this work.
+ * Once hot unplugged fro mhardware, it may not access the device's
+ * registers, framebuffer memory, ROM, etc afterwards.
+ */
+
+struct aperture_range {
+	struct device *dev;
+	resource_size_t base;
+	resource_size_t size;
+	struct list_head lh;
+	void (*detach)(struct device *dev);
+};
+
+static LIST_HEAD(apertures);
+static DEFINE_MUTEX(apertures_lock);
+
+static bool overlap(resource_size_t base1, resource_size_t end1,
+		    resource_size_t base2, resource_size_t end2)
+{
+	return (base1 < end2) && (end1 > base2);
+}
+
+static void devm_aperture_acquire_release(void *data)
+{
+	struct aperture_range *ap = data;
+	bool detached = !ap->dev;
+
+	if (detached)
+		return;
+
+	mutex_lock(&apertures_lock);
+	list_del(&ap->lh);
+	mutex_unlock(&apertures_lock);
+}
+
+static int devm_aperture_acquire(struct device *dev,
+				 resource_size_t base, resource_size_t size,
+				 void (*detach)(struct device *))
+{
+	size_t end = base + size;
+	struct list_head *pos;
+	struct aperture_range *ap;
+
+	mutex_lock(&apertures_lock);
+
+	list_for_each(pos, &apertures) {
+		ap = container_of(pos, struct aperture_range, lh);
+		if (overlap(base, end, ap->base, ap->base + ap->size)) {
+			mutex_unlock(&apertures_lock);
+			return -EBUSY;
+		}
+	}
+
+	ap = devm_kzalloc(dev, sizeof(*ap), GFP_KERNEL);
+	if (!ap) {
+		mutex_unlock(&apertures_lock);
+		return -ENOMEM;
+	}
+
+	ap->dev = dev;
+	ap->base = base;
+	ap->size = size;
+	ap->detach = detach;
+	INIT_LIST_HEAD(&ap->lh);
+
+	list_add(&ap->lh, &apertures);
+
+	mutex_unlock(&apertures_lock);
+
+	return devm_add_action_or_reset(dev, devm_aperture_acquire_release, ap);
+}
+
+static void aperture_detach_platform_device(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	/*
+	 * Remove the device from the device hierarchy. This is the right thing
+	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
+	 * the new driver takes over the hardware, the firmware device's state
+	 * will be lost.
+	 *
+	 * For non-platform devices, a new callback would be required.
+	 *
+	 * If the aperture helpers ever need to handle native drivers, this call
+	 * would only have to unplug the DRM device, so that the hardware device
+	 * stays around after detachment.
+	 */
+	platform_device_unregister(pdev);
+}
+
+/**
+ * devm_aperture_acquire_for_platform_device - Acquires ownership of an aperture
+ *                                             on behalf of a platform device.
+ * @pdev:	the platform device to own the aperture
+ * @base:	the aperture's byte offset in physical memory
+ * @size:	the aperture size in bytes
+ *
+ * Installs the given device as the new owner of the aperture. The function
+ * expects the aperture to be provided by a platform device. If another
+ * driver takes over ownership of the aperture, aperture helpers will then
+ * unregister the platform device automatically. All acquired apertures are
+ * released automatically when the underlying device goes away.
+ *
+ * The function fails if the aperture, or parts of it, is currently
+ * owned by another device. To evict current owners, callers should use
+ * remove_conflicting_devices() et al. before calling this function.
+ *
+ * Returns:
+ * 0 on success, or a negative errno value otherwise.
+ */
+int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
+					      resource_size_t base,
+					      resource_size_t size)
+{
+	return devm_aperture_acquire(&pdev->dev, base, size, aperture_detach_platform_device);
+}
+EXPORT_SYMBOL(devm_aperture_acquire_for_platform_device);
+
+static void aperture_detach_devices(resource_size_t base, resource_size_t size)
+{
+	resource_size_t end = base + size;
+	struct list_head *pos, *n;
+
+	mutex_lock(&apertures_lock);
+
+	list_for_each_safe(pos, n, &apertures) {
+		struct aperture_range *ap = container_of(pos, struct aperture_range, lh);
+		struct device *dev = ap->dev;
+
+		if (WARN_ON_ONCE(!dev))
+			continue;
+
+		if (!overlap(base, end, ap->base, ap->base + ap->size))
+			continue;
+
+		ap->dev = NULL; /* detach from device */
+		list_del(&ap->lh);
+
+		ap->detach(dev);
+	}
+
+	mutex_unlock(&apertures_lock);
+}
+
+/**
+ * aperture_remove_conflicting_devices - remove devices in the given range
+ * @base: the aperture's base address in physical memory
+ * @size: aperture size in bytes
+ * @primary: also kick vga16fb if present; only relevant for VGA devices
+ * @name: a descriptive name of the requesting driver
+ *
+ * This function removes devices that own apertures within @base and @size.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
+					bool primary, const char *name)
+{
+#if IS_REACHABLE(CONFIG_FB)
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
+	ret = remove_conflicting_framebuffers(a, name, primary);
+	kfree(a);
+
+	if (ret)
+		return ret;
+#endif
+
+	aperture_detach_devices(base, size);
+
+	return 0;
+}
+EXPORT_SYMBOL(aperture_remove_conflicting_devices);
+
+/**
+ * aperture_remove_conflicting_pci_devices - remove existing framebuffers for PCI devices
+ * @pdev: PCI device
+ * @name: a descriptive name of the requesting driver
+ *
+ * This function removes devices that own apertures within any of @pdev's
+ * memory bars. The function assumes that PCI device with shadowed ROM
+ * drives a primary display and therefore kicks out vga16fb as well.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
+{
+	resource_size_t base, size;
+	int bar, ret;
+
+	/*
+	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+	 * otherwise the vga fbdev driver falls over.
+	 */
+#if IS_REACHABLE(CONFIG_FB)
+	ret = remove_conflicting_pci_framebuffers(pdev, name);
+	if (ret)
+		return ret;
+#endif
+	ret = vga_remove_vgacon(pdev);
+	if (ret)
+		return ret;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
+		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+			continue;
+		base = pci_resource_start(pdev, bar);
+		size = pci_resource_len(pdev, bar);
+		aperture_detach_devices(base, size);
+	}
+
+	return 0;
+
+}
+EXPORT_SYMBOL(aperture_remove_conflicting_pci_devices);
diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 40c50fa2dd70..22cea5082ac4 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -10,6 +10,7 @@ config VGA_CONSOLE
 	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
 		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
 		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
+	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
 	default y
 	help
 	  Saying Y here will allow you to use Linux in text mode through a
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index f2a6b81e45c4..cfc55273dc5d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -455,6 +455,7 @@ config FB_ATARI
 config FB_OF
 	bool "Open Firmware frame buffer device support"
 	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -527,6 +528,7 @@ config FB_IMSTT
 config FB_VGA16
 	tristate "VGA 16-color graphics support"
 	depends on FB && (X86 || PPC)
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -551,7 +553,7 @@ config FB_STI
 	  BIOS routines contained in a ROM chip in HP PA-RISC based machines.
 	  Enabling this option will implement the linux framebuffer device
 	  using calls to the STI BIOS routines for initialisation.
-	
+
 	  If you enable this option, you will get a planar framebuffer device
 	  /dev/fb which will work on the most common HP graphic cards of the
 	  NGLE family, including the artist chips (in the 7xx and Bxxx series),
@@ -617,6 +619,7 @@ config FB_UVESA
 config FB_VESA
 	bool "VESA VGA graphics support"
 	depends on (FB = y) && X86
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -630,6 +633,7 @@ config FB_VESA
 config FB_EFI
 	bool "EFI-based Framebuffer Support"
 	depends on (FB = y) && !IA64 && EFI
+	select APERTURE_HELPERS
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -2190,6 +2194,7 @@ config FB_SIMPLE
 	tristate "Simple framebuffer support"
 	depends on FB
 	depends on !DRM_SIMPLEDRM
+	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
diff --git a/include/linux/aperture.h b/include/linux/aperture.h
new file mode 100644
index 000000000000..442f15a57cad
--- /dev/null
+++ b/include/linux/aperture.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _LINUX_APERTURE_H_
+#define _LINUX_APERTURE_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+struct platform_device;
+
+#if defined(CONFIG_APERTURE_HELPERS)
+int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
+					      resource_size_t base,
+					      resource_size_t size);
+
+int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
+					bool primary, const char *name);
+
+int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name);
+#else
+static inline int devm_aperture_acquire_for_platform_device(struct platform_device *pdev,
+							    resource_size_t base,
+							    resource_size_t size)
+{
+	return 0;
+}
+
+static inline int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t size,
+						      bool primary, const char *name)
+{
+	return 0;
+}
+
+static inline int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *name)
+{
+	return 0;
+}
+#endif
+
+/**
+ * aperture_remove_all_conflicting_devices - remove all existing framebuffers
+ * @primary: also kick vga16fb if present; only relevant for VGA devices
+ * @name: a descriptive name of the requesting driver
+ *
+ * This function removes all graphics device drivers. Use this function on systems
+ * that can have their framebuffer located anywhere in memory.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise
+ */
+static inline int aperture_remove_all_conflicting_devices(bool primary, const char *name)
+{
+	return aperture_remove_conflicting_devices(0, (resource_size_t)-1, primary, name);
+}
+
+#endif
-- 
2.36.1

