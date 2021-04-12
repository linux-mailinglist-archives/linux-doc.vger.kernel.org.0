Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC1A35BF26
	for <lists+linux-doc@lfdr.de>; Mon, 12 Apr 2021 11:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239320AbhDLJDF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Apr 2021 05:03:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:39698 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239559AbhDLJAo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 05:00:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8B4A6AFCF;
        Mon, 12 Apr 2021 09:00:25 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/aperture: Convert drivers to aperture interfaces
Date:   Mon, 12 Apr 2021 11:00:20 +0200
Message-Id: <20210412090021.23054-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412090021.23054-1-tzimmermann@suse.de>
References: <20210412090021.23054-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mass-convert all drivers from FB helpers to aperture interfaces. No
functional changes besides checking for returned errno codes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 ++-
 drivers/gpu/drm/armada/armada_drv.c           |  5 ++--
 drivers/gpu/drm/ast/ast_drv.c                 | 23 +++++++---------
 drivers/gpu/drm/bochs/bochs_drv.c             |  3 ++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  4 +--
 drivers/gpu/drm/i915/i915_drv.c               |  3 ++-
 drivers/gpu/drm/meson/meson_drv.c             | 27 ++++++-------------
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  5 +++-
 drivers/gpu/drm/msm/msm_fbdev.c               |  5 +++-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 ++-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  5 +++-
 drivers/gpu/drm/radeon/radeon_drv.c           |  3 ++-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  5 +++-
 drivers/gpu/drm/tegra/drm.c                   |  4 +--
 drivers/gpu/drm/tiny/cirrus.c                 |  3 ++-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  3 ++-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  5 +++-
 drivers/gpu/drm/virtio/virtgpu_drv.c          | 10 ++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +--
 19 files changed, 67 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 76f48f79c70b..7b4d18d3c031 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -23,6 +23,7 @@
  */
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_vblank.h>
@@ -1256,7 +1257,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 #endif
 
 	/* Get rid of things like offb */
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "amdgpudrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "amdgpudrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 44fe9f994fc5..dab0a1f0983b 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -9,6 +9,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
@@ -94,9 +95,7 @@ static int armada_drm_bind(struct device *dev)
 	}
 
 	/* Remove early framebuffers */
-	ret = drm_fb_helper_remove_conflicting_framebuffers(NULL,
-							    "armada-drm-fb",
-							    false);
+	ret = drm_aperture_remove_framebuffers(false, "armada-drm-fb");
 	if (ret) {
 		dev_err(dev, "[" DRM_NAME ":%s] can't kick out simple-fb: %d\n",
 			__func__, ret);
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 01837bea18c2..5aa452b4efe6 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -30,10 +30,10 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -89,23 +89,18 @@ static const struct pci_device_id ast_pciidlist[] = {
 
 MODULE_DEVICE_TABLE(pci, ast_pciidlist);
 
-static void ast_kick_out_firmware_fb(struct pci_dev *pdev)
+static int ast_remove_conflicting_framebuffers(struct pci_dev *pdev)
 {
-	struct apertures_struct *ap;
 	bool primary = false;
+	resource_size_t base, size;
 
-	ap = alloc_apertures(1);
-	if (!ap)
-		return;
-
-	ap->ranges[0].base = pci_resource_start(pdev, 0);
-	ap->ranges[0].size = pci_resource_len(pdev, 0);
-
+	base = pci_resource_start(pdev, 0);
+	size = pci_resource_len(pdev, 0);
 #ifdef CONFIG_X86
 	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
 #endif
-	drm_fb_helper_remove_conflicting_framebuffers(ap, "astdrmfb", primary);
-	kfree(ap);
+
+	return drm_aperture_remove_conflicting_framebuffers(base, size, primary, "astdrmfb");
 }
 
 static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
@@ -114,7 +109,9 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *dev;
 	int ret;
 
-	ast_kick_out_firmware_fb(pdev);
+	ret = ast_remove_conflicting_framebuffers(pdev);
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index b469624fe40d..c828cadbabff 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -6,6 +6,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_managed.h>
 
@@ -109,7 +110,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 	}
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 89edc796deda..f4bc5386574a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -313,8 +314,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	struct drm_device *dev;
 	int ret;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
-								"hibmcdrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "hibmcdrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 305557e1942a..51e24a81d793 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -39,6 +39,7 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/vt.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_irq.h>
@@ -553,7 +554,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_perf;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "inteldrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "inteldrmfb");
 	if (ret)
 		goto err_ggtt;
 
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 453d8b4c5763..66de3f4f7222 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/amlogic/meson-canvas.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -156,23 +157,6 @@ static void meson_vpu_init(struct meson_drm *priv)
 	writel_relaxed(value, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
 }
 
-static void meson_remove_framebuffers(void)
-{
-	struct apertures_struct *ap;
-
-	ap = alloc_apertures(1);
-	if (!ap)
-		return;
-
-	/* The framebuffer can be located anywhere in RAM */
-	ap->ranges[0].base = 0;
-	ap->ranges[0].size = ~0;
-
-	drm_fb_helper_remove_conflicting_framebuffers(ap, "meson-drm-fb",
-						      false);
-	kfree(ap);
-}
-
 struct meson_drm_soc_attr {
 	struct meson_drm_soc_limits limits;
 	const struct soc_device_attribute *attrs;
@@ -297,8 +281,13 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		}
 	}
 
-	/* Remove early framebuffers (ie. simplefb) */
-	meson_remove_framebuffers();
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = drm_aperture_remove_framebuffers(false, "meson-drm-fb");
+	if (ret)
+		goto free_drm;
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 4e4c105f9a50..a701d9563257 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -11,6 +11,7 @@
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -341,7 +342,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *dev;
 	int ret;
 
-	drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "mgag200drmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "mgag200drmfb");
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(pdev);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 678dba1725a6..227404077e39 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
@@ -168,7 +169,9 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	}
 
 	/* the fw fb could be anywhere in memory */
-	drm_fb_helper_remove_conflicting_framebuffers(NULL, "msm", false);
+	ret = drm_aperture_remove_framebuffers(false, "msm");
+	if (ret)
+		goto fini;
 
 	ret = drm_fb_helper_initial_config(helper, 32);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9766218a99ca..3204fc0a90d2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -30,6 +30,7 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/mmu_notifier.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
@@ -737,7 +738,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	nvkm_device_del(&device);
 
 	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index db92eec07d96..bba0fc39028c 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -29,11 +29,14 @@
  */
 
 #include "qxl_drv.h"
+
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/vgaarb.h>
 
 #include <drm/drm.h>
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -93,7 +96,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "qxl");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "qxl");
 	if (ret)
 		goto disable_pci;
 
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index efeb115ae70e..8885e849717d 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -38,6 +38,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/pci.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_agpsupport.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
@@ -330,7 +331,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 		return -EPROBE_DEFER;
 
 	/* Get rid of things like offb */
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "radeondrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "radeondrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 91502937f26d..af335f58bdfc 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -13,6 +13,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -99,7 +100,9 @@ static int sun4i_drv_bind(struct device *dev)
 	drm->irq_enabled = true;
 
 	/* Remove early framebuffers (ie. simplefb) */
-	drm_fb_helper_remove_conflicting_framebuffers(NULL, "sun4i-drm-fb", false);
+	ret = drm_aperture_remove_framebuffers(false, "sun4i-drm-fb");
+	if (ret)
+		goto cleanup_mode_config;
 
 	sun4i_framebuffer_init(drm);
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 90709c38c993..e32c0dcf2762 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
@@ -1198,8 +1199,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_fb_helper_remove_conflicting_framebuffers(NULL, "tegradrmfb",
-							    false);
+	err = drm_aperture_remove_framebuffers(false, "tegradrmfb");
 	if (err < 0)
 		goto hub;
 
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index ad922c3ec681..e3afb45d9a5c 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -24,6 +24,7 @@
 #include <video/cirrus.h>
 #include <video/vga.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
@@ -549,7 +550,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	struct cirrus_device *cirrus;
 	int ret;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "cirrusdrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "cirrusdrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index e534896b6cfd..6d4b32da9866 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -12,6 +12,7 @@
 #include <linux/pci.h>
 #include <linux/vt_kern.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -42,7 +43,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!vbox_check_supported(VBE_DISPI_ID_HGSMI))
 		return -ENODEV;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "vboxvideodrmfb");
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 556ad0f02a0d..68ac0e7489a9 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -30,6 +30,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -266,7 +267,9 @@ static int vc4_drm_bind(struct device *dev)
 	if (ret)
 		goto unbind_all;
 
-	drm_fb_helper_remove_conflicting_framebuffers(NULL, "vc4drmfb", false);
+	ret = drm_aperture_remove_framebuffers(false, "vc4drmfb");
+	if (ret)
+		goto unbind_all;
 
 	ret = vc4_kms_load(drm);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a21dc3ad6f88..33bf5f53ae31 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -31,6 +31,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm.h>
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -50,13 +51,16 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev, struct virtio_device *vd
 	const char *pname = dev_name(&pdev->dev);
 	bool vga = (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
 	char unique[20];
+	int ret;
 
 	DRM_INFO("pci: %s detected at %s\n",
 		 vga ? "virtio-vga" : "virtio-gpu-pci",
 		 pname);
-	if (vga)
-		drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
-								  "virtiodrmfb");
+	if (vga) {
+		ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "virtiodrmfb");
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Normally the drm_dev_set_unique() call is done by core DRM.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 4e41d8221f06..997dadce3a73 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -31,8 +31,8 @@
 #include <linux/pci.h>
 #include <linux/mem_encrypt.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -1491,7 +1491,7 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct vmw_private *vmw;
 	int ret;
 
-	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "svgadrmfb");
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "svgadrmfb");
 	if (ret)
 		return ret;
 
-- 
2.31.1

