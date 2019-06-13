Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5727044111
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2019 18:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391328AbfFMQLV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Jun 2019 12:11:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:47950 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731237AbfFMInd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 Jun 2019 04:43:33 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B78189A2D36077A28788;
        Thu, 13 Jun 2019 16:43:30 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 13 Jun 2019 16:43:23 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        John Garry <john.garry@huawei.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        Sebastian Ott <sebott@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        "Martin Schwidefsky" <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        David Woodhouse <dwmw2@infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        x86 <x86@kernel.org>, linux-ia64 <linux-ia64@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v9 4/7] powernv/iommu: add support for IOMMU default DMA mode build options
Date:   Thu, 13 Jun 2019 16:42:37 +0800
Message-ID: <20190613084240.16768-5-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20190613084240.16768-1-thunder.leizhen@huawei.com>
References: <20190613084240.16768-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The default DMA mode is PASSTHROUGH on powernv, this patch make it can be
set to STRICT at build time. It can be overridden by boot option.

There is no functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 3 ++-
 drivers/iommu/Kconfig                     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 10cc42b9e541c46..27e25e8e3a9c637 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -81,7 +81,8 @@ void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
 	va_end(args);
 }
 
-static bool pnv_iommu_bypass_disabled __read_mostly;
+static bool pnv_iommu_bypass_disabled __read_mostly =
+			!IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
 static bool pci_reset_phbs __read_mostly;
 
 static int __init iommu_setup(char *str)
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index a8dd69d175fb3c6..bfbcaa24e283aad 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -78,6 +78,7 @@ config IOMMU_DEBUGFS
 choice
 	prompt "IOMMU default DMA mode"
 	depends on IOMMU_API
+	default IOMMU_DEFAULT_PASSTHROUGH if (PPC_POWERNV && PCI)
 	default IOMMU_DEFAULT_LAZY if S390_IOMMU
 	default IOMMU_DEFAULT_STRICT
 	help
@@ -98,6 +99,7 @@ config IOMMU_DEFAULT_PASSTHROUGH
 
 config IOMMU_DEFAULT_LAZY
 	bool "lazy"
+	depends on !PPC_POWERNV
 	help
 	  Support lazy mode, where for every IOMMU DMA unmap operation, the
 	  flush operation of IOTLB and the free operation of IOVA are deferred.
-- 
1.8.3


