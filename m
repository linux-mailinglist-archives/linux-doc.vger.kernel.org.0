Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7EE2C828D
	for <lists+linux-doc@lfdr.de>; Mon, 30 Nov 2020 11:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgK3KsX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 30 Nov 2020 05:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbgK3KsW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 05:48:22 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56082C0613D4
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 02:47:42 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id i2so15504976wrs.4
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 02:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2s3+1UMveM14Q86dSgKB6KclpUSu0GzbSCNzQALyOY0=;
        b=H1mKBEVPaLY3R+ZSjHzAAaqf4DeLa+ptZ5vjlfE/q/dTLHxUrpgTR1ZPGj5g/D1Je5
         EGbULNaeZEyHklZl1rk4dPNTZ9sGl29mKcxeBs7ZDL95f4hfRGbL3cyRDhm1z8q3bEIs
         OKD6gVPKMd7VgPzRFGelnQPX4E/0BDNii78wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2s3+1UMveM14Q86dSgKB6KclpUSu0GzbSCNzQALyOY0=;
        b=Q8TB6uMwHst46Tpf8YV8Xp8AbWIScVbgLCxe17M5nglvfrRcb32SlOJxXyT9wXn35d
         JB1pDvT05fLfJMXIZFaPxB/t/xlx7wy2rSlb4u42Hv/1QuDYWX96pEPWNRD9Bb8sTHc6
         tRzs34yIB6rLOcZP/TsJbDwOTNwMXmJpIobikJmSyIMl3zqXwaEJVVcnIOmJ7W7gN63x
         JBOX70Ym7Gw1h1egHNBP7FAB2jqDac3BoEhlGXPvNT1nIRx8uV9Ss8GKm+CyrWjGliMw
         7wfs1ZmjMZf/2ElaPORwHz1F3NBW/riUwV4ZjWDnLA+PYSUjq1V8dIwtsd8/dhn9bjJw
         u9TA==
X-Gm-Message-State: AOAM530eOBcR8iGmBFz4sWGWOefrBnwRbubQRyiX0sPeGZTnAVmeahJo
        U551FPJyV0FeRShR+TNuAJHapyHV300wpw==
X-Google-Smtp-Source: ABdhPJx0ek4tBAFG54IQGA02EwOJJlz5jrePLwuaDz2z1+0T0hs95dsUf7Gt11gIVe9PAivP5dUHNQ==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr27585680wrr.303.1606733261092;
        Mon, 30 Nov 2020 02:47:41 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id x9sm19719853wru.55.2020.11.30.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 02:47:40 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Subject: [PATCH v4 2/4] WIP: add a dma_alloc_contiguous API
Date:   Mon, 30 Nov 2020 11:47:28 +0100
Message-Id: <20201130104730.27655-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201130104730.27655-1-ribalda@chromium.org>
References: <20201130104730.27655-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>

Add a new API that returns a virtually non-contigous array of pages
and dma address.  This API is only implemented for dma-iommu and will
not be implemented for non-iommu DMA API instances that have to allocate
contiguous memory.  It is up to the caller to check if the API is
available.

The intent is that media drivers can use this API if either:

 - no kernel mapping or only temporary kernel mappings are required.
   That is as a better replacement for DMA_ATTR_NO_KERNEL_MAPPING
 - a kernel mapping is required for cached and DMA mapped pages, but
   the driver also needs the pages to e.g. map them to userspace.
   In that sense it is a replacement for some aspects of the recently
   removed and never fully implemented DMA_ATTR_NON_CONSISTENT

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c   | 84 +++++++++++++++++++++----------------
 include/linux/dma-map-ops.h |  4 ++
 include/linux/dma-mapping.h |  5 +++
 kernel/dma/mapping.c        | 35 ++++++++++++++++
 4 files changed, 91 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 73249732afd3..2e72fe1b9c3b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -564,23 +564,12 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 	return pages;
 }
 
-/**
- * iommu_dma_alloc_remap - Allocate and map a buffer contiguous in IOVA space
- * @dev: Device to allocate memory for. Must be a real device
- *	 attached to an iommu_dma_domain
- * @size: Size of buffer in bytes
- * @dma_handle: Out argument for allocated DMA handle
- * @gfp: Allocation flags
- * @prot: pgprot_t to use for the remapped mapping
- * @attrs: DMA attributes for this allocation
- *
- * If @size is less than PAGE_SIZE, then a full CPU page will be allocated,
+/*
+ * If size is less than PAGE_SIZE, then a full CPU page will be allocated,
  * but an IOMMU which supports smaller pages might not map the whole thing.
- *
- * Return: Mapped virtual address, or NULL on failure.
  */
-static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, pgprot_t prot,
+static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
+		size_t size, dma_addr_t *dma_handle, gfp_t gfp, pgprot_t prot,
 		unsigned long attrs)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
@@ -592,7 +581,6 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	struct page **pages;
 	struct sg_table sgt;
 	dma_addr_t iova;
-	void *vaddr;
 
 	*dma_handle = DMA_MAPPING_ERROR;
 
@@ -635,17 +623,10 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 			< size)
 		goto out_free_sg;
 
-	vaddr = dma_common_pages_remap(pages, size, prot,
-			__builtin_return_address(0));
-	if (!vaddr)
-		goto out_unmap;
-
 	*dma_handle = iova;
 	sg_free_table(&sgt);
-	return vaddr;
+	return pages;
 
-out_unmap:
-	__iommu_dma_unmap(dev, iova, size);
 out_free_sg:
 	sg_free_table(&sgt);
 out_free_iova:
@@ -655,20 +636,45 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	return NULL;
 }
 
-/**
- * __iommu_dma_mmap - Map a buffer into provided user VMA
- * @pages: Array representing buffer from __iommu_dma_alloc()
- * @size: Size of buffer in bytes
- * @vma: VMA describing requested userspace mapping
- *
- * Maps the pages of the buffer in @pages into @vma. The caller is responsible
- * for verifying the correct size and protection of @vma beforehand.
- */
-static int __iommu_dma_mmap(struct page **pages, size_t size,
-		struct vm_area_struct *vma)
+static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t gfp, pgprot_t prot,
+		unsigned long attrs)
 {
-	return vm_map_pages(vma, pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
+	struct page **pages;
+	void *vaddr;
+
+	pages = __iommu_dma_alloc_noncontiguous(dev, size, dma_handle, gfp,
+						prot, attrs);
+	if (!pages)
+		return NULL;
+	vaddr = dma_common_pages_remap(pages, size, prot,
+			__builtin_return_address(0));
+	if (!vaddr)
+		goto out_unmap;
+	return vaddr;
+
+out_unmap:
+	__iommu_dma_unmap(dev, *dma_handle, size);
+	__iommu_dma_free_pages(pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
+	return NULL;
+}
+
+#ifdef CONFIG_DMA_REMAP
+static struct page **iommu_dma_alloc_noncontiguous(struct device *dev,
+		size_t size, dma_addr_t *dma_handle, gfp_t gfp,
+		unsigned long attrs)
+{
+	return __iommu_dma_alloc_noncontiguous(dev, size, dma_handle, gfp,
+					       PAGE_KERNEL, attrs);
+}
+
+static void iommu_dma_free_noncontiguous(struct device *dev, size_t size,
+		struct page **pages, dma_addr_t dma_handle)
+{
+	__iommu_dma_unmap(dev, dma_handle, size);
+	__iommu_dma_free_pages(pages, PAGE_ALIGN(size) >> PAGE_SHIFT);
 }
+#endif
 
 static void iommu_dma_sync_single_for_cpu(struct device *dev,
 		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
@@ -1074,7 +1080,7 @@ static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 		struct page **pages = dma_common_find_pages(cpu_addr);
 
 		if (pages)
-			return __iommu_dma_mmap(pages, size, vma);
+			return vm_map_pages(vma, pages, nr_pages);
 		pfn = vmalloc_to_pfn(cpu_addr);
 	} else {
 		pfn = page_to_pfn(virt_to_page(cpu_addr));
@@ -1124,6 +1130,10 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.free			= iommu_dma_free,
 	.alloc_pages		= dma_common_alloc_pages,
 	.free_pages		= dma_common_free_pages,
+#ifdef CONFIG_DMA_REMAP
+	.alloc_noncontiguous	= iommu_dma_alloc_noncontiguous,
+	.free_noncontiguous	= iommu_dma_free_noncontiguous,
+#endif
 	.mmap			= iommu_dma_mmap,
 	.get_sgtable		= iommu_dma_get_sgtable,
 	.map_page		= iommu_dma_map_page,
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 3d1f91464bcf..3cc313678d42 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -22,6 +22,10 @@ struct dma_map_ops {
 			gfp_t gfp);
 	void (*free_pages)(struct device *dev, size_t size, struct page *vaddr,
 			dma_addr_t dma_handle, enum dma_data_direction dir);
+	struct page **(*alloc_noncontiguous)(struct device *dev, size_t size,
+			dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs);
+	void (*free_noncontiguous)(struct device *dev, size_t size,
+			struct page **pages, dma_addr_t dma_handle);
 	int (*mmap)(struct device *, struct vm_area_struct *,
 			void *, dma_addr_t, size_t, unsigned long attrs);
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 956151052d45..e1b4cb1d2e55 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -267,6 +267,11 @@ void *dma_alloc_noncoherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
 void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, enum dma_data_direction dir);
+bool dma_can_alloc_noncontiguous(struct device *dev);
+struct page **dma_alloc_noncontiguous(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs);
+void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct page **pages, dma_addr_t dma_handle);
 
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index d3032513c54b..770c2f66512d 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -530,6 +530,41 @@ void dma_free_noncoherent(struct device *dev, size_t size, void *vaddr,
 }
 EXPORT_SYMBOL_GPL(dma_free_noncoherent);
 
+bool dma_can_alloc_noncontiguous(struct device *dev)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	return ops && ops->free_noncontiguous;
+}
+EXPORT_SYMBOL_GPL(dma_can_alloc_noncontiguous);
+
+struct page **dma_alloc_noncontiguous(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (WARN_ON_ONCE(!dma_can_alloc_noncontiguous(dev)))
+		return NULL;
+	if (attrs & ~DMA_ATTR_ALLOC_SINGLE_PAGES) {
+		dev_warn(dev, "invalid flags (0x%lx) for %s\n",
+			 attrs, __func__);
+		return NULL;
+	}
+	return ops->alloc_noncontiguous(dev, size, dma_handle, gfp, attrs);
+}
+EXPORT_SYMBOL_GPL(dma_alloc_noncontiguous);
+
+void dma_free_noncontiguous(struct device *dev, size_t size,
+		struct page **pages, dma_addr_t dma_handle)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	if (WARN_ON_ONCE(!dma_can_alloc_noncontiguous(dev)))
+		return;
+	ops->free_noncontiguous(dev, size, pages, dma_handle);
+}
+EXPORT_SYMBOL_GPL(dma_free_noncontiguous);
+
 int dma_supported(struct device *dev, u64 mask)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
-- 
2.29.2.454.gaff20da3a2-goog

