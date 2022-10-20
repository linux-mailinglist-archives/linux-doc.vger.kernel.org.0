Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABBC6061C8
	for <lists+linux-doc@lfdr.de>; Thu, 20 Oct 2022 15:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiJTNia (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Oct 2022 09:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJTNi3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 09:38:29 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEF81A2E25
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666273108; x=1697809108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+eHuBBWFSm2vc5I+BrV3zHdotqcGuZfwvf1nh7hTspQ=;
  b=XulmmWwrSNuTykb384coWSJ5MmKT1zB8Obo8d0NThfjN0cLqTKaMpq8g
   arh6F/Lp+y276qMwmlTdBK5QFRt0baRJU55NawcXRXRwxRvahsqzOuuHi
   378pSuWNmI6qKwCctWBUsPmwJWjrV+50xMlkexILGlLt9HMdsJUi+KGWI
   +KQsb8QNPRQstZKknr0Z+LLqQHR6r4gVWyzv7qmU7ACm5w9nJor7DYFCW
   cfoVUhPWBHn6/hYrB8Z8UwajTtdGxNJvV7uyUe1W/j01hRKuoWbMcVqI+
   Vk4vKHbGOA/yx/xmYq3GLDr/eYFCiYn8Xv+7f5zOEOzFsxollQzOcRfN/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307805948"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="307805948"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:38:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719064475"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="719064475"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:38:24 -0700
From:   "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Subject: [PATCH v4 02/10] gna: add GNA DRM device
Date:   Thu, 20 Oct 2022 15:35:17 +0200
Message-Id: <20221020133525.1810728-3-maciej.kwapulinski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
---
 drivers/gpu/drm/gna/Kconfig      |  1 +
 drivers/gpu/drm/gna/gna_device.c | 65 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_device.h | 21 +++++++++++
 drivers/gpu/drm/gna/gna_hw.h     | 17 +++++++++
 drivers/gpu/drm/gna/gna_pci.c    | 11 ++++++
 5 files changed, 115 insertions(+)
 create mode 100644 drivers/gpu/drm/gna/gna_hw.h

diff --git a/drivers/gpu/drm/gna/Kconfig b/drivers/gpu/drm/gna/Kconfig
index c66de987d0a7..197504cd1a15 100644
--- a/drivers/gpu/drm/gna/Kconfig
+++ b/drivers/gpu/drm/gna/Kconfig
@@ -5,6 +5,7 @@
 config DRM_GNA
 	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
 	depends on X86 && PCI
+  depends on DRM
   help
 	  This option enables the Intel(R) Gaussian & Neural Accelerator
 	  (Intel(R) GNA) driver: gna
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index 960b4341c18e..b8620b7da205 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -1,8 +1,73 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2017-2022 Intel Corporation
 
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 
+#include "gna_device.h"
+
+static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
+{
+	drm_dev_unregister(dev);
+}
+
+static int gna_drm_dev_init(struct drm_device *dev)
+{
+	int err;
+
+	err = drm_dev_register(dev, 0);
+	if (err)
+		return err;
+
+	return drmm_add_action_or_reset(dev, gna_drm_dev_fini, NULL);
+}
+
+static const struct drm_driver gna_drm_driver = {
+	.driver_features = DRIVER_RENDER,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+};
+
+int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase)
+{
+	struct gna_device *gna_priv;
+	struct drm_device *drm_dev;
+	int err;
+
+	gna_priv = devm_drm_dev_alloc(parent, &gna_drm_driver, struct gna_device, drm);
+	if (IS_ERR(gna_priv))
+		return PTR_ERR(gna_priv);
+
+	drm_dev = &gna_priv->drm;
+	gna_priv->iobase = iobase;
+	gna_priv->info = *dev_info;
+
+	if (!(sizeof(dma_addr_t) > 4) ||
+		dma_set_mask(parent, DMA_BIT_MASK(64))) {
+		err = dma_set_mask(parent, DMA_BIT_MASK(32));
+		if (err)
+			return err;
+	}
+
+	dev_set_drvdata(parent, drm_dev);
+
+	err = gna_drm_dev_init(drm_dev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA) Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index 4cc92f27765a..d269f7da5c5e 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -4,6 +4,27 @@
 #ifndef __GNA_DEVICE_H__
 #define __GNA_DEVICE_H__
 
+#include <drm/drm_device.h>
+
+#include "gna_hw.h"
+
 #define DRIVER_NAME		"gna"
+#define DRIVER_DESC		"Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
+#define DRIVER_DATE		"20211201"
+
+#define DRIVER_MAJOR		1
+#define DRIVER_MINOR		0
+#define DRIVER_PATCHLEVEL	0
+
+struct device;
+
+struct gna_device {
+	struct drm_device drm;
+
+	/* device related resources */
+	void __iomem *iobase;
+	struct gna_dev_info info;
+};
 
+int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
 #endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_hw.h b/drivers/gpu/drm/gna/gna_hw.h
new file mode 100644
index 000000000000..3ca801096fd1
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_hw.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_HW_H__
+#define __GNA_HW_H__
+
+#include <linux/mm_types.h>
+
+struct gna_dev_info {
+	u32 hwid;
+	u32 num_pagetables;
+	u32 num_page_entries;
+	u32 max_layer_count;
+	u64 max_hw_mem;
+};
+
+#endif // __GNA_HW_H__
diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
index 6bd00c66f3a7..14f8b34e5f5c 100644
--- a/drivers/gpu/drm/gna/gna_pci.c
+++ b/drivers/gpu/drm/gna/gna_pci.c
@@ -5,10 +5,13 @@
 #include <linux/pci.h>
 
 #include "gna_device.h"
+#include "gna_hw.h"
 #include "gna_pci.h"
 
 int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 {
+	struct gna_dev_info *dev_info;
+	void __iomem *iobase;
 	int err;
 
 	err = pcim_enable_device(pcidev);
@@ -19,8 +22,16 @@ int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 	if (err)
 		return err;
 
+	iobase = pcim_iomap_table(pcidev)[0];
+
 	pci_set_master(pcidev);
 
+	dev_info = (struct gna_dev_info *)pci_id->driver_data;
+
+	err = gna_probe(&pcidev->dev, dev_info, iobase);
+	if (err)
+		return err;
+
 	return 0;
 }
 
-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

