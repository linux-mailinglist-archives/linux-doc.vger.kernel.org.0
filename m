Return-Path: <linux-doc+bounces-43548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F21EA93256
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 08:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EFA719E8708
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 06:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1AC26E146;
	Fri, 18 Apr 2025 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAlS9hnN"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666E269D03;
	Fri, 18 Apr 2025 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744958900; cv=none; b=CLYW4rbi0PdtIXemfvOPgqDFH7jlWMGhKyus6oaKT+KZUE3N1PnantTZbCBP8zrE9pJfQmOCofSqtOG/Rkp/igGNoOdZiTLSwBIGEF33aY+m9j+A5w8Cn1tf7SM64o8mHGLlnE/nzb8vLBZdJjVTq5OMdBEU6VtjFY+gOYYBFP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744958900; c=relaxed/simple;
	bh=AmwIpqPWkxc3iZOFyHVxvBZ6k5wuOOT40b/BHCa+YMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YU1sOpaErI1ixfLwEFrNxzlrov3ZC1DVC4UgcRi0uDeckhzuaIyjxkoJSI8BYxVYloxqrnuh8es8GgmVJsj2Vgetj2iyW4EJ+y2zryZJB84ko10p6jbIPxjOEqhXbV0x9L2G3uRuIdReeqrFED72GpCxjmeosqM+ch6OI3OLvRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAlS9hnN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2545EC4CEE7;
	Fri, 18 Apr 2025 06:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744958900;
	bh=AmwIpqPWkxc3iZOFyHVxvBZ6k5wuOOT40b/BHCa+YMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAlS9hnNMbZ0jgPBAXuDqu99kN7G2EskTL4bW94/aHqUKKadF3W0L7Njz/TeDQXAQ
	 kOAGf91obTpptoqHqexUfFbplvOSbkFSn2sTnyAhusmvpJTgqN7Ij6g7OOXUQXCWOT
	 /zkmZqiUWcZHVnGy1vCOxSN6KEwip/GjpNR8ku5uCUthphOMkEyLFCNS5Eg29PhHO0
	 26GgpHeUMFiGC4HUqq0FBBxi+GvmXMWLhMKuce+/ztAGshBgjkC1SxeMO40Vv5hrqv
	 uo44PmPVFTLU3lfIjSWOQA3J7rcGN9w9PRsoa6yZLr/6XFDC/6y3LWpU8AatIWQdqb
	 yQX6r4ej3VwHg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jake Edge <jake@lwn.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Zhu Yanjun <zyjzyj2000@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH v8 05/24] dma-mapping: Provide an interface to allow allocate IOVA
Date: Fri, 18 Apr 2025 09:47:35 +0300
Message-ID: <76cb4994033fddd6057849729c44d28a5f9c94b9.1744825142.git.leon@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744825142.git.leon@kernel.org>
References: <cover.1744825142.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

The existing .map_page() callback provides both allocating of IOVA
and linking DMA pages. That combination works great for most of the
callers who use it in control paths, but is less effective in fast
paths where there may be multiple calls to map_page().

These advanced callers already manage their data in some sort of
database and can perform IOVA allocation in advance, leaving range
linkage operation to be in fast path.

Provide an interface to allocate/deallocate IOVA and next patch
link/unlink DMA ranges to that specific IOVA.

In the new API a DMA mapping transaction is identified by a
struct dma_iova_state, which holds some recomputed information
for the transaction which does not change for each page being
mapped, so add a check if IOVA can be used for the specific
transaction.

The API is exported from dma-iommu as it is the only implementation
supported, the namespace is clearly different from iommu_* functions
which are not allowed to be used. This code layout allows us to save
function call per API call used in datapath as well as a lot of boilerplate
code.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/iommu/dma-iommu.c   | 86 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-mapping.h | 48 +++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 145606498b4c..6ca9305a26cc 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1723,6 +1723,92 @@ size_t iommu_dma_max_mapping_size(struct device *dev)
 	return SIZE_MAX;
 }
 
+/**
+ * dma_iova_try_alloc - Try to allocate an IOVA space
+ * @dev: Device to allocate the IOVA space for
+ * @state: IOVA state
+ * @phys: physical address
+ * @size: IOVA size
+ *
+ * Check if @dev supports the IOVA-based DMA API, and if yes allocate IOVA space
+ * for the given base address and size.
+ *
+ * Note: @phys is only used to calculate the IOVA alignment. Callers that always
+ * do PAGE_SIZE aligned transfers can safely pass 0 here.
+ *
+ * Returns %true if the IOVA-based DMA API can be used and IOVA space has been
+ * allocated, or %false if the regular DMA API should be used.
+ */
+bool dma_iova_try_alloc(struct device *dev, struct dma_iova_state *state,
+		phys_addr_t phys, size_t size)
+{
+	struct iommu_dma_cookie *cookie;
+	struct iommu_domain *domain;
+	struct iova_domain *iovad;
+	size_t iova_off;
+	dma_addr_t addr;
+
+	memset(state, 0, sizeof(*state));
+	if (!use_dma_iommu(dev))
+		return false;
+
+	domain = iommu_get_dma_domain(dev);
+	cookie = domain->iova_cookie;
+	iovad = &cookie->iovad;
+	iova_off = iova_offset(iovad, phys);
+
+	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
+	    iommu_deferred_attach(dev, iommu_get_domain_for_dev(dev)))
+		return false;
+
+	if (WARN_ON_ONCE(!size))
+		return false;
+
+	/*
+	 * DMA_IOVA_USE_SWIOTLB is flag which is set by dma-iommu
+	 * internals, make sure that caller didn't set it and/or
+	 * didn't use this interface to map SIZE_MAX.
+	 */
+	if (WARN_ON_ONCE((u64)size & DMA_IOVA_USE_SWIOTLB))
+		return false;
+
+	addr = iommu_dma_alloc_iova(domain,
+			iova_align(iovad, size + iova_off),
+			dma_get_mask(dev), dev);
+	if (!addr)
+		return false;
+
+	state->addr = addr + iova_off;
+	state->__size = size;
+	return true;
+}
+EXPORT_SYMBOL_GPL(dma_iova_try_alloc);
+
+/**
+ * dma_iova_free - Free an IOVA space
+ * @dev: Device to free the IOVA space for
+ * @state: IOVA state
+ *
+ * Undoes a successful dma_try_iova_alloc().
+ *
+ * Note that all dma_iova_link() calls need to be undone first.  For callers
+ * that never call dma_iova_unlink(), dma_iova_destroy() can be used instead
+ * which unlinks all ranges and frees the IOVA space in a single efficient
+ * operation.
+ */
+void dma_iova_free(struct device *dev, struct dma_iova_state *state)
+{
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iova_domain *iovad = &cookie->iovad;
+	size_t iova_start_pad = iova_offset(iovad, state->addr);
+	size_t size = dma_iova_size(state);
+
+	iommu_dma_free_iova(domain, state->addr - iova_start_pad,
+			iova_align(iovad, size + iova_start_pad), NULL);
+}
+EXPORT_SYMBOL_GPL(dma_iova_free);
+
 void iommu_setup_dma_ops(struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index b79925b1c433..de7f73810d54 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -72,6 +72,22 @@
 
 #define DMA_BIT_MASK(n)	(((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
 
+struct dma_iova_state {
+	dma_addr_t addr;
+	u64 __size;
+};
+
+/*
+ * Use the high bit to mark if we used swiotlb for one or more ranges.
+ */
+#define DMA_IOVA_USE_SWIOTLB		(1ULL << 63)
+
+static inline size_t dma_iova_size(struct dma_iova_state *state)
+{
+	/* Casting is needed for 32-bits systems */
+	return (size_t)(state->__size & ~DMA_IOVA_USE_SWIOTLB);
+}
+
 #ifdef CONFIG_DMA_API_DEBUG
 void debug_dma_mapping_error(struct device *dev, dma_addr_t dma_addr);
 void debug_dma_map_single(struct device *dev, const void *addr,
@@ -277,6 +293,38 @@ static inline int dma_mmap_noncontiguous(struct device *dev,
 }
 #endif /* CONFIG_HAS_DMA */
 
+#ifdef CONFIG_IOMMU_DMA
+/**
+ * dma_use_iova - check if the IOVA API is used for this state
+ * @state: IOVA state
+ *
+ * Return %true if the DMA transfers uses the dma_iova_*() calls or %false if
+ * they can't be used.
+ */
+static inline bool dma_use_iova(struct dma_iova_state *state)
+{
+	return state->__size != 0;
+}
+
+bool dma_iova_try_alloc(struct device *dev, struct dma_iova_state *state,
+		phys_addr_t phys, size_t size);
+void dma_iova_free(struct device *dev, struct dma_iova_state *state);
+#else /* CONFIG_IOMMU_DMA */
+static inline bool dma_use_iova(struct dma_iova_state *state)
+{
+	return false;
+}
+static inline bool dma_iova_try_alloc(struct device *dev,
+		struct dma_iova_state *state, phys_addr_t phys, size_t size)
+{
+	return false;
+}
+static inline void dma_iova_free(struct device *dev,
+		struct dma_iova_state *state)
+{
+}
+#endif /* CONFIG_IOMMU_DMA */
+
 #if defined(CONFIG_HAS_DMA) && defined(CONFIG_DMA_NEED_SYNC)
 void __dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
 		enum dma_data_direction dir);
-- 
2.49.0


