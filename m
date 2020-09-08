Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1994626158D
	for <lists+linux-doc@lfdr.de>; Tue,  8 Sep 2020 18:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732014AbgIHQsy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Sep 2020 12:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732033AbgIHQsj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Sep 2020 12:48:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF9FC061798;
        Tue,  8 Sep 2020 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=JBtww2AF0MKHgVJ2NsYCRS8RX5wJV/mnDYAumMky5+Q=; b=VuGsHyBnYzGjXnqB0iBYXJu9/R
        KI1VtrLYPvOSYgOTVINwMCsqxWAgrcMexc9VBvdsGaRmToncZHkXSXxyUEzA5PlBN4oh+ZrQDlhAs
        2B5JMzYsVNWVQU4AjMDq9zj4wANuVfzpKL8BXmS9mqrVyfEFxFValz09NXdYV0S5v/vCS8+FwR5QS
        rxg3ON/tjTwPjAlnP2PgX68vFQRwoc9CP+W7sPEBTMV6EBy15A2hg6qSQtnC8/y7DORQMxAJrms1m
        YcIoWrLLbqo9o9ejH/DJ9FjTy2ecpb/L0HCH15Qcdv5gJ6YyfVRxGm+gJcS0nhEE7AKHcBfrKzoP4
        pgABNtTw==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgn0-0001Ta-Cn; Tue, 08 Sep 2020 16:48:14 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 11/12] dma-mapping: move dma_common_{mmap,get_sgtable} out of mapping.c
Date:   Tue,  8 Sep 2020 18:47:57 +0200
Message-Id: <20200908164758.3177341-12-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908164758.3177341-1-hch@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new file that contains helpera for misc DMA ops, which is only
built when CONFIG_DMA_OPS is set.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/Makefile      |  1 +
 kernel/dma/mapping.c     | 47 +-----------------------------------
 kernel/dma/ops_helpers.c | 51 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 46 deletions(-)
 create mode 100644 kernel/dma/ops_helpers.c

diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
index 32c7c1942bbd6c..dc755ab68aabf9 100644
--- a/kernel/dma/Makefile
+++ b/kernel/dma/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_HAS_DMA)			+= mapping.o direct.o
+obj-$(CONFIG_DMA_OPS)			+= ops_helpers.o
 obj-$(CONFIG_DMA_OPS)			+= dummy.o
 obj-$(CONFIG_DMA_CMA)			+= contiguous.o
 obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 0d129421e75fc8..848c95c27d79ff 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -8,7 +8,7 @@
 #include <linux/memblock.h> /* for max_pfn */
 #include <linux/acpi.h>
 #include <linux/dma-direct.h>
-#include <linux/dma-noncoherent.h>
+#include <linux/dma-mapping.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/of_device.h>
@@ -295,22 +295,6 @@ void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
 }
 EXPORT_SYMBOL(dma_sync_sg_for_device);
 
-/*
- * Create scatter-list for the already allocated DMA buffer.
- */
-int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
-		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
-		 unsigned long attrs)
-{
-	struct page *page = virt_to_page(cpu_addr);
-	int ret;
-
-	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
-	if (!ret)
-		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
-	return ret;
-}
-
 /*
  * The whole dma_get_sgtable() idea is fundamentally unsafe - it seems
  * that the intention is to allow exporting memory allocated via the
@@ -358,35 +342,6 @@ pgprot_t dma_pgprot(struct device *dev, pgprot_t prot, unsigned long attrs)
 }
 #endif /* CONFIG_MMU */
 
-/*
- * Create userspace mapping for the DMA-coherent memory.
- */
-int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
-		void *cpu_addr, dma_addr_t dma_addr, size_t size,
-		unsigned long attrs)
-{
-#ifdef CONFIG_MMU
-	unsigned long user_count = vma_pages(vma);
-	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	unsigned long off = vma->vm_pgoff;
-	int ret = -ENXIO;
-
-	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
-
-	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
-		return ret;
-
-	if (off >= count || user_count > count - off)
-		return -ENXIO;
-
-	return remap_pfn_range(vma, vma->vm_start,
-			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
-			user_count << PAGE_SHIFT, vma->vm_page_prot);
-#else
-	return -ENXIO;
-#endif /* CONFIG_MMU */
-}
-
 /**
  * dma_can_mmap - check if a given device supports dma_mmap_*
  * @dev: device to check
diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
new file mode 100644
index 00000000000000..e443c69be4299f
--- /dev/null
+++ b/kernel/dma/ops_helpers.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Helpers for DMA ops implementations.  These generally rely on the fact that
+ * the allocated memory contains normal pages in the direct kernel mapping.
+ */
+#include <linux/dma-noncoherent.h>
+
+/*
+ * Create scatter-list for the already allocated DMA buffer.
+ */
+int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
+		 void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		 unsigned long attrs)
+{
+	struct page *page = virt_to_page(cpu_addr);
+	int ret;
+
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (!ret)
+		sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
+	return ret;
+}
+
+/*
+ * Create userspace mapping for the DMA-coherent memory.
+ */
+int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
+		void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		unsigned long attrs)
+{
+#ifdef CONFIG_MMU
+	unsigned long user_count = vma_pages(vma);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	unsigned long off = vma->vm_pgoff;
+	int ret = -ENXIO;
+
+	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
+
+	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
+		return ret;
+
+	if (off >= count || user_count > count - off)
+		return -ENXIO;
+
+	return remap_pfn_range(vma, vma->vm_start,
+			page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
+			user_count << PAGE_SHIFT, vma->vm_page_prot);
+#else
+	return -ENXIO;
+#endif /* CONFIG_MMU */
+}
-- 
2.28.0

