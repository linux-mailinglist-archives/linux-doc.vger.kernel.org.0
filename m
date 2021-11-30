Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1296D462E50
	for <lists+linux-doc@lfdr.de>; Tue, 30 Nov 2021 09:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236888AbhK3ISC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Nov 2021 03:18:02 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:36120 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234251AbhK3ISB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 03:18:01 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jkchen@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UyrajG9_1638260080;
Received: from localhost(mailfrom:jkchen@linux.alibaba.com fp:SMTPD_---0UyrajG9_1638260080)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 30 Nov 2021 16:14:41 +0800
From:   Jay Chen <jkchen@linux.alibaba.com>
To:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        inux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-doc@vger.kernel.org
Cc:     zhangliguang@linux.alibaba.com
Subject: [RFC PATCH] per device enable smmu whem iommu passthrough
Date:   Tue, 30 Nov 2021 16:14:40 +0800
Message-Id: <20211130081440.12397-1-jkchen@linux.alibaba.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, when iommu.passthrough=1 is set,
all arm smmu peripherals are bypassed. This
patch allows specific peripherals to use smmu translate.

Signed-off-by: Jay Chen <jkchen@linux.alibaba.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 41 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 91ba391f9b32..7ecc7a4c84d7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2076,6 +2076,12 @@
 			1 - Bypass the IOMMU for DMA.
 			unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
 
+	smmuv3_no_passthrough=
+			[ARM64] enable smmu for devices when iommu.passthrough=1.
+			Format: {83:00.0,84:00.0,devname}
+			83:00.0 - the bdf for one pci devices
+			devname - the name for the platform device
+
 	io7=		[HW] IO7 for Marvel-based Alpha systems
 			See comment before marvel_specify_io7 in
 			arch/alpha/kernel/core_marvel.c.
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a388e318f86e..e2a57bd37f32 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -76,6 +76,8 @@ struct arm_smmu_option_prop {
 DEFINE_XARRAY_ALLOC1(arm_smmu_asid_xa);
 DEFINE_MUTEX(arm_smmu_asid_lock);
 
+char *smmuv3_nopt;
+
 /*
  * Special value used by SVA when a process dies, to quiesce a CD without
  * disabling it.
@@ -102,6 +104,17 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
 	} while (arm_smmu_options[++i].opt);
 }
 
+static int __init arm_smmu_no_passthrough_setup(char *str)
+{
+	if (!str)
+		return -EINVAL;
+
+	smmuv3_nopt = str;
+
+	return 0;
+}
+__setup("smmuv3_no_passthrough=", arm_smmu_no_passthrough_setup);
+
 /* Low-level queue manipulation functions */
 static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
 {
@@ -2831,6 +2844,33 @@ static int arm_smmu_dev_disable_feature(struct device *dev,
 	}
 }
 
+static int arm_smmu_def_domain_type(struct device *dev)
+{
+	char *str = smmuv3_nopt;
+	const char *tmp;
+
+	if (!dev || !str)
+		return 0;
+
+	if (dev_is_pci(dev)) {
+		tmp = dev_name(dev);
+		tmp += strcspn(tmp, ":") + 1;
+	} else {
+		tmp = dev_name(dev);
+	}
+
+	while (*str) {
+		if (!strncmp(str, tmp, strlen(tmp)))
+			return IOMMU_DOMAIN_DMA;
+
+		str += strcspn(str, ",");
+		while (*str == ',')
+			str++;
+	}
+
+	return 0;
+}
+
 static struct iommu_ops arm_smmu_ops = {
 	.capable		= arm_smmu_capable,
 	.domain_alloc		= arm_smmu_domain_alloc,
@@ -2856,6 +2896,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.sva_unbind		= arm_smmu_sva_unbind,
 	.sva_get_pasid		= arm_smmu_sva_get_pasid,
 	.page_response		= arm_smmu_page_response,
+	.def_domain_type	= arm_smmu_def_domain_type,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 	.owner			= THIS_MODULE,
 };
-- 
2.27.0

