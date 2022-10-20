Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB3E606764
	for <lists+linux-doc@lfdr.de>; Thu, 20 Oct 2022 19:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiJTR51 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Oct 2022 13:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiJTR5Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 13:57:25 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1000D199F52
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 10:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666288644; x=1697824644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZKUcpdSz2jZpMLCeO+PckLfKIjIomT/shxQQcJDfCPg=;
  b=F1UGZCs+S7BsIjQJe832KV3jAt66W6Jb5AvP6x9l5r3QmW6QKwt95VJa
   cIZNdfz0rtBw0hbNATmwm5TrMoxGrldGl4TH9o7ltlfBIE/ZarFgtrp+p
   nd1Vz73GNofj+TaHywKRJcGffJ9c6g7tyhsp76LfQLXyhcbo9e9d5vfe+
   5PD7yRajAWtPEASPiGKQoeY3bJMDzhT/hbfuyYbvkDDP4wH3t6CEcwAHL
   YDVGgTtwXen6RCUTB5SGtwn78SvmYFARCxEAcrA2FFwFG0NIxUcKiJKBe
   bq1rvgqHv3Qc/Y3DS8zNzDUK3e6oSQ0i3OxhG/19adnfoir4ejtG4dfVz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="286510889"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="286510889"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772516967"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="772516967"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:19 -0700
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: [PATCH v5 05/10] gna: add GNA_GET_PARAMETER ioctl
Date:   Thu, 20 Oct 2022 19:53:29 +0200
Message-Id: <20221020175334.1820519-6-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

As this is first ioctl in the series, the patch also adds common bits for
remaining ioctls

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 MAINTAINERS                      |  1 +
 drivers/gpu/drm/gna/Kbuild       |  2 +-
 drivers/gpu/drm/gna/Kconfig      |  3 +-
 drivers/gpu/drm/gna/gna_device.c | 58 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_device.h | 14 ++++++++
 drivers/gpu/drm/gna/gna_ioctl.c  | 18 ++++++++++
 include/uapi/drm/gna_drm.h       | 40 ++++++++++++++++++++++
 7 files changed, 134 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/gna/gna_ioctl.c
 create mode 100644 include/uapi/drm/gna_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d5b966c00155..458ee5ad765d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10179,6 +10179,7 @@ M:	Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
 S:	Maintained
 F:	Documentation/gpu/gna.rst
 F:	drivers/gpu/drm/gna/*
+F:	include/uapi/drm/gna_drm.h
 
 INTEL GPIO DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
diff --git a/drivers/gpu/drm/gna/Kbuild b/drivers/gpu/drm/gna/Kbuild
index 2bda61c61f45..101880869dc4 100644
--- a/drivers/gpu/drm/gna/Kbuild
+++ b/drivers/gpu/drm/gna/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-gna-y := gna_device.o gna_mem.o gna_pci.o
+gna-y := gna_device.o gna_ioctl.o gna_mem.o gna_pci.o
 
 obj-$(CONFIG_DRM_GNA) += gna.o
diff --git a/drivers/gpu/drm/gna/Kconfig b/drivers/gpu/drm/gna/Kconfig
index 820dc8424045..e56b933458dc 100644
--- a/drivers/gpu/drm/gna/Kconfig
+++ b/drivers/gpu/drm/gna/Kconfig
@@ -9,5 +9,6 @@ config DRM_GNA
 	help
 	  This option enables the Intel(R) Gaussian & Neural Accelerator
 	  (Intel(R) GNA) driver: gna
-	  Information about functionality is in
+	  User space interface is defined in include/uapi/drm/gna_drm.h, while
+	  information about functionality is in
 	  Documentation/gpu/gna.rst
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index f1724cbe3963..592478bca526 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -3,13 +3,22 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 
+#include <uapi/drm/gna_drm.h>
+
 #include "gna_device.h"
+#define GNA_DDI_VERSION_CURRENT GNA_DDI_VERSION_3
+
+static const struct drm_ioctl_desc gna_drm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(GNA_GET_PARAMETER, gna_getparam_ioctl, DRM_RENDER_ALLOW),
+};
+
 
 static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
 {
@@ -29,6 +38,8 @@ static int gna_drm_dev_init(struct drm_device *dev)
 
 static const struct drm_driver gna_drm_driver = {
 	.driver_features = DRIVER_RENDER,
+	.ioctls = gna_drm_ioctls,
+	.num_ioctls = ARRAY_SIZE(gna_drm_ioctls),
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
@@ -50,6 +61,7 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 		return PTR_ERR(gna_priv);
 
 	drm_dev = &gna_priv->drm;
+	gna_priv->recovery_timeout_jiffies = msecs_to_jiffies(60*1000);
 	gna_priv->iobase = iobase;
 	gna_priv->info = *dev_info;
 
@@ -79,6 +91,52 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 	return 0;
 }
 
+static u32 gna_device_type_by_hwid(u32 hwid)
+{
+	switch (hwid) {
+	case GNA_DEV_HWID_CNL:
+		return GNA_DEV_TYPE_0_9;
+	case GNA_DEV_HWID_GLK:
+	case GNA_DEV_HWID_EHL:
+	case GNA_DEV_HWID_ICL:
+		return GNA_DEV_TYPE_1_0;
+	case GNA_DEV_HWID_JSL:
+	case GNA_DEV_HWID_TGL:
+	case GNA_DEV_HWID_RKL:
+		return GNA_DEV_TYPE_2_0;
+	case GNA_DEV_HWID_ADL:
+	case GNA_DEV_HWID_RPL:
+		return GNA_DEV_TYPE_3_0;
+	case GNA_DEV_HWID_MTL:
+		return GNA_DEV_TYPE_3_5;
+	default:
+		return 0;
+	}
+}
+
+int gna_getparam(struct gna_device *gna_priv, union gna_parameter *param)
+{
+	switch (param->in.id) {
+	case GNA_PARAM_RECOVERY_TIMEOUT:
+		param->out.value = jiffies_to_msecs(gna_priv->recovery_timeout_jiffies) / 1000;
+		break;
+	case GNA_PARAM_INPUT_BUFFER_S:
+		param->out.value = gna_priv->hw_info.in_buf_s;
+		break;
+	case GNA_PARAM_DEVICE_TYPE:
+		param->out.value = gna_device_type_by_hwid(gna_priv->info.hwid);
+		break;
+	case GNA_PARAM_DDI_VERSION:
+		param->out.value = GNA_DDI_VERSION_CURRENT;
+		break;
+	default:
+		dev_dbg(gna_dev(gna_priv), "unknown parameter id: %llu\n", param->in.id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA) Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index d2357954b245..035c627e33b7 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -20,11 +20,15 @@
 #define DRIVER_MINOR		0
 #define DRIVER_PATCHLEVEL	0
 
+union gna_parameter;
+struct drm_file;
 struct device;
 
 struct gna_device {
 	struct drm_device drm;
 
+	int recovery_timeout_jiffies;
+
 	/* device related resources */
 	void __iomem *iobase;
 	struct gna_dev_info info;
@@ -34,6 +38,11 @@ struct gna_device {
 };
 
 int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
+int gna_getparam(struct gna_device *gna_priv, union gna_parameter *param);
+
+int gna_getparam_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file);
+
 static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
 {
 	return readl(gna_priv->iobase + reg);
@@ -44,4 +53,9 @@ static inline struct device *gna_dev(struct gna_device *gna_priv)
 	return gna_priv->drm.dev;
 }
 
+static inline struct gna_device *to_gna_device(struct drm_device *dev)
+{
+	return container_of(dev, struct gna_device, drm);
+}
+
 #endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_ioctl.c b/drivers/gpu/drm/gna/gna_ioctl.c
new file mode 100644
index 000000000000..21eb7aae4ad2
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_ioctl.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2017-2022 Intel Corporation
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+
+#include <uapi/drm/gna_drm.h>
+
+#include "gna_device.h"
+
+int gna_getparam_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct gna_device *gna_priv = to_gna_device(dev);
+	union gna_parameter *param = data;
+
+	return gna_getparam(gna_priv, param);
+}
diff --git a/include/uapi/drm/gna_drm.h b/include/uapi/drm/gna_drm.h
new file mode 100644
index 000000000000..5a7cfd7e5df2
--- /dev/null
+++ b/include/uapi/drm/gna_drm.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef _GNA_DRM_H_
+#define _GNA_DRM_H_
+
+#include <linux/types.h>
+
+#include "drm.h"
+
+#define GNA_DDI_VERSION_3 3
+
+#define GNA_PARAM_RECOVERY_TIMEOUT	1
+#define GNA_PARAM_DEVICE_TYPE		2
+#define GNA_PARAM_INPUT_BUFFER_S	3
+#define GNA_PARAM_DDI_VERSION		4
+
+#define GNA_DEV_TYPE_0_9	0x09
+#define GNA_DEV_TYPE_1_0	0x10
+#define GNA_DEV_TYPE_2_0	0x20
+#define GNA_DEV_TYPE_3_0	0x30
+#define GNA_DEV_TYPE_3_5	0x35
+
+typedef __u64 gna_param_id;
+
+union gna_parameter {
+	struct {
+		gna_param_id id;
+	} in;
+
+	struct {
+		__u64 value;
+	} out;
+};
+
+#define DRM_GNA_GET_PARAMETER		0x00
+
+#define DRM_IOCTL_GNA_GET_PARAMETER	DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GET_PARAMETER, union gna_parameter)
+
+#endif /* _GNA_DRM_H_ */
-- 
2.25.1

