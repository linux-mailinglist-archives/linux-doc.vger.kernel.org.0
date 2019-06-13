Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D55044102
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2019 18:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731243AbfFMQLU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Jun 2019 12:11:20 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:47966 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731236AbfFMInd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 Jun 2019 04:43:33 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id C3A82CF1F307867B8BE6;
        Thu, 13 Jun 2019 16:43:30 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 13 Jun 2019 16:43:20 +0800
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
Subject: [PATCH v9 2/7] x86/dma: use IS_ENABLED() to simplify the code
Date:   Thu, 13 Jun 2019 16:42:35 +0800
Message-ID: <20190613084240.16768-3-thunder.leizhen@huawei.com>
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

Remove the ifdefs around CONFIG_IOMMU_DEFAULT_PASSTHROUGH to improve
readablity.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/x86/kernel/pci-dma.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index dcd272dbd0a9330..8c82b2e28a0fe2d 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -43,11 +43,7 @@
  * It is also possible to disable by default in kernel config, and enable with
  * iommu=nopt at boot time.
  */
-#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
-int iommu_pass_through __read_mostly = 1;
-#else
-int iommu_pass_through __read_mostly;
-#endif
+int iommu_pass_through __read_mostly =	IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
 
 extern struct iommu_table_entry __iommu_table[], __iommu_table_end[];
 
-- 
1.8.3


