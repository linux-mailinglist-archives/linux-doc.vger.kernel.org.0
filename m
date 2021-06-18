Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7543ACA08
	for <lists+linux-doc@lfdr.de>; Fri, 18 Jun 2021 13:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhFRLlS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Jun 2021 07:41:18 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3273 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbhFRLlP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 07:41:15 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G5xbJ6LWYz6G7Tq;
        Fri, 18 Jun 2021 19:31:56 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 13:39:05 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 12:39:01 +0100
From:   John Garry <john.garry@huawei.com>
To:     <joro@8bytes.org>, <will@kernel.org>, <dwmw2@infradead.org>,
        <baolu.lu@linux.intel.com>, <robin.murphy@arm.com>,
        <corbet@lwn.net>
CC:     <linux-kernel@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
        <linuxarm@huawei.com>, <thunder.leizhen@huawei.com>,
        <chenxiang66@hisilicon.com>, <linux-doc@vger.kernel.org>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH v14 3/6] iommu: Enhance IOMMU default DMA mode build options
Date:   Fri, 18 Jun 2021 19:34:15 +0800
Message-ID: <1624016058-189713-4-git-send-email-john.garry@huawei.com>
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

First, add build options IOMMU_DEFAULT_{LAZY|STRICT}, so that we have the
opportunity to set {lazy|strict} mode as default at build time. Then put
the two config options in an choice, as they are mutually exclusive.

[jpg: Make choice between strict and lazy only (and not passthrough)]
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Signed-off-by: John Garry <john.garry@huawei.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 .../admin-guide/kernel-parameters.txt         |  3 +-
 drivers/iommu/Kconfig                         | 40 +++++++++++++++++++
 drivers/iommu/iommu.c                         |  2 +-
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 673952379900..a1b7c8526bb5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2046,9 +2046,10 @@
 			  throughput at the cost of reduced device isolation.
 			  Will fall back to strict mode if not supported by
 			  the relevant IOMMU driver.
-			1 - Strict mode (default).
+			1 - Strict mode.
 			  DMA unmap operations invalidate IOMMU hardware TLBs
 			  synchronously.
+			unset - Use value of CONFIG_IOMMU_DEFAULT_{LAZY,STRICT}.
 			Note: on x86, the default behaviour depends on the
 			equivalent driver-specific parameters, but a strict
 			mode explicitly specified by either method takes
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 1f111b399bca..0327a942fdb7 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -90,6 +90,46 @@ config IOMMU_DEFAULT_PASSTHROUGH
 
 	  If unsure, say N here.
 
+choice
+	prompt "IOMMU default DMA IOTLB invalidation mode"
+	depends on IOMMU_DMA
+
+	default IOMMU_DEFAULT_STRICT
+	help
+	  This option allows an IOMMU DMA IOTLB invalidation mode to be
+	  chosen at build time, to override the default mode of each ARCH,
+	  removing the need to pass in kernel parameters through command line.
+	  It is still possible to provide common boot params to override this
+	  config.
+
+	  If unsure, keep the default.
+
+config IOMMU_DEFAULT_STRICT
+	bool "strict"
+	help
+	  For every IOMMU DMA unmap operation, the flush operation of IOTLB and
+	  the free operation of IOVA are guaranteed to be done in the unmap
+	  function.
+
+config IOMMU_DEFAULT_LAZY
+	bool "lazy"
+	help
+	  Support lazy mode, where for every IOMMU DMA unmap operation, the
+	  flush operation of IOTLB and the free operation of IOVA are deferred.
+	  They are only guaranteed to be done before the related IOVA will be
+	  reused.
+
+	  The isolation provided in this mode is not as secure as STRICT mode,
+	  such that a vulnerable time window may be created between the DMA
+	  unmap and the mappings cached in the IOMMU IOTLB or device TLB
+	  finally being invalidated, where the device could still access the
+	  memory which has already been unmapped by the device driver.
+	  However this mode may provide better performance in high throughput
+	  scenarios, and is still considerably more secure than passthrough
+	  mode or no IOMMU.
+
+endchoice
+
 config OF_IOMMU
 	def_bool y
 	depends on OF && IOMMU_API
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cf58949cc2f3..60b1ec42e73b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -29,7 +29,7 @@ static struct kset *iommu_group_kset;
 static DEFINE_IDA(iommu_group_ida);
 
 static unsigned int iommu_def_domain_type __read_mostly;
-static bool iommu_dma_strict __read_mostly = true;
+static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
 static u32 iommu_cmd_line __read_mostly;
 
 struct iommu_group {
-- 
2.26.2

