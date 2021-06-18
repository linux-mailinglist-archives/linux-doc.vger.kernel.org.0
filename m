Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633443ACA0A
	for <lists+linux-doc@lfdr.de>; Fri, 18 Jun 2021 13:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbhFRLlU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Jun 2021 07:41:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3274 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234118AbhFRLlT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 07:41:19 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G5xbN1PYNz6G7Ty;
        Fri, 18 Jun 2021 19:32:00 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 13:39:08 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 12:39:05 +0100
From:   John Garry <john.garry@huawei.com>
To:     <joro@8bytes.org>, <will@kernel.org>, <dwmw2@infradead.org>,
        <baolu.lu@linux.intel.com>, <robin.murphy@arm.com>,
        <corbet@lwn.net>
CC:     <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
        <linuxarm@huawei.com>, <thunder.leizhen@huawei.com>,
        <chenxiang66@hisilicon.com>, <linux-doc@vger.kernel.org>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH v14 4/6] iommu/vt-d: Add support for IOMMU default DMA mode build options
Date:   Fri, 18 Jun 2021 19:34:16 +0800
Message-ID: <1624016058-189713-5-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1624016058-189713-1-git-send-email-john.garry@huawei.com>
References: <1624016058-189713-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Zhen Lei <thunder.leizhen@huawei.com>

Make IOMMU_DEFAULT_LAZY default for when INTEL_IOMMU config is set,
as is current behaviour.

Also delete global flag intel_iommu_strict:
- In intel_iommu_setup(), call iommu_set_dma_strict(true) directly. Also
  remove the print, as iommu_subsys_init() prints the mode and we have
  already marked this param as deprecated.

- For cap_caching_mode() check in intel_iommu_setup(), call
  iommu_set_dma_strict(true) directly; also reword the accompanying print
  with a level downgrade and also add the missing '\n'.

- For Ironlake GPU, again call iommu_set_dma_strict(true) directly and
  keep the accompanying print.

[jpg: Remove intel_iommu_strict]
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/Kconfig       |  1 +
 drivers/iommu/intel/iommu.c | 15 ++++++---------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 0327a942fdb7..c214a36eb2dc 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -94,6 +94,7 @@ choice
 	prompt "IOMMU default DMA IOTLB invalidation mode"
 	depends on IOMMU_DMA
 
+	default IOMMU_DEFAULT_LAZY if INTEL_IOMMU
 	default IOMMU_DEFAULT_STRICT
 	help
 	  This option allows an IOMMU DMA IOTLB invalidation mode to be
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 29497113d748..06666f9d8116 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -361,7 +361,6 @@ int intel_iommu_enabled = 0;
 EXPORT_SYMBOL_GPL(intel_iommu_enabled);
 
 static int dmar_map_gfx = 1;
-static int intel_iommu_strict;
 static int intel_iommu_superpage = 1;
 static int iommu_identity_mapping;
 static int iommu_skip_te_disable;
@@ -455,8 +454,7 @@ static int __init intel_iommu_setup(char *str)
 			iommu_dma_forcedac = true;
 		} else if (!strncmp(str, "strict", 6)) {
 			pr_warn("intel_iommu=strict deprecated; use iommu.strict=1 instead\n");
-			pr_info("Disable batched IOTLB flush\n");
-			intel_iommu_strict = 1;
+			iommu_set_dma_strict(true);
 		} else if (!strncmp(str, "sp_off", 6)) {
 			pr_info("Disable supported super page\n");
 			intel_iommu_superpage = 0;
@@ -4382,9 +4380,9 @@ int __init intel_iommu_init(void)
 		 * is likely to be much lower than the overhead of synchronizing
 		 * the virtual and physical IOMMU page-tables.
 		 */
-		if (!intel_iommu_strict && cap_caching_mode(iommu->cap)) {
-			pr_warn("IOMMU batching is disabled due to virtualization");
-			intel_iommu_strict = 1;
+		if (cap_caching_mode(iommu->cap)) {
+			pr_info_once("IOMMU batching disallowed due to virtualization\n");
+			iommu_set_dma_strict(true);
 		}
 		iommu_device_sysfs_add(&iommu->iommu, NULL,
 				       intel_iommu_groups,
@@ -4393,7 +4391,6 @@ int __init intel_iommu_init(void)
 	}
 	up_read(&dmar_global_lock);
 
-	iommu_set_dma_strict(intel_iommu_strict);
 	bus_set_iommu(&pci_bus_type, &intel_iommu_ops);
 	if (si_domain && !hw_pass_through)
 		register_memory_notifier(&intel_iommu_memory_nb);
@@ -5702,8 +5699,8 @@ static void quirk_calpella_no_shadow_gtt(struct pci_dev *dev)
 	} else if (dmar_map_gfx) {
 		/* we have to ensure the gfx device is idle before we flush */
 		pci_info(dev, "Disabling batched IOTLB flush on Ironlake\n");
-		intel_iommu_strict = 1;
-       }
+		iommu_set_dma_strict(true);
+	}
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0040, quirk_calpella_no_shadow_gtt);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0044, quirk_calpella_no_shadow_gtt);
-- 
2.26.2

