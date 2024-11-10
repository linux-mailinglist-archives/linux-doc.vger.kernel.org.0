Return-Path: <linux-doc+bounces-30404-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9789C3298
	for <lists+linux-doc@lfdr.de>; Sun, 10 Nov 2024 14:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFE03281517
	for <lists+linux-doc@lfdr.de>; Sun, 10 Nov 2024 13:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5448F19C561;
	Sun, 10 Nov 2024 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HK+eyFX8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831541C94;
	Sun, 10 Nov 2024 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731246522; cv=none; b=Q+2pKolBWy4EJvSga17of3DlvV8DjCvorCLZCHmRR9C0t4RXSxIcWrKsuyC1it++NKIM/uEPA/03Pm04OB6TpcB4cFUYjKYWUmLw1YZl7InyRYnCJZIoNJhEVqoSLcaAkkJc58ldMfkZcDkx2/x7UBsA+yEdjKGet85tKtXntzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731246522; c=relaxed/simple;
	bh=z6fV6jU5Yk4vqhdq9hZv86z2b5l0ykCed/lNYxf+08U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oClHfLw10NIoxPMujHDpycyDtoLxoEEKorYOPP6Xni+251RdG9039sR3Pt3oOynEVYgNC8VTuBBOax6Od7C9rXcl3Cx8eJ3uj0XXeDf0Bm00YSEFpDAWrEX2+FUMzD6+B+RlRzRJLmDMdiwCKryOEsKXFcmmqHXDH7ATHFEfYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HK+eyFX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513D7C4CECD;
	Sun, 10 Nov 2024 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731246521;
	bh=z6fV6jU5Yk4vqhdq9hZv86z2b5l0ykCed/lNYxf+08U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HK+eyFX8Sb8z5DMK2UNyNCrf2NvR2cRX8gO34dkF7+tEait+yBfmJoWIIbXQSq1zp
	 zOrNCcVgOEYT5WUSZZFWQmHg5v68+tbzTNb1dF5ddN2vmpi+x0aJLQMa9fC2M/X4uy
	 zC8GzFkvvgncw+F5onJK87lSf57P471aQwLf/uzK+sfcUHSg76HNRAKqfXT4KdD030
	 mxQ7ImlGFyrxgXhWlL3JTRSsfUQqK5SziDqs6JS2QWEIhZs/MgJOR4sTsw0ZEqcthB
	 EOzzx6Wk8DGqWIkVHAAKy4sn9J8IZDhJxPsRIj86+290F4GqJEbFu2KCb333VUe+W6
	 P/A+TKAdDn2OA==
From: Leon Romanovsky <leon@kernel.org>
To: Jens Axboe <axboe@kernel.dk>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 13/17] RDMA/core: Convert UMEM ODP DMA mapping to caching IOVA and page linkage
Date: Sun, 10 Nov 2024 15:47:00 +0200
Message-ID: <2ad6215a5e9ed0e2a4fa017b11730c4a8021f370.1731244445.git.leon@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731244445.git.leon@kernel.org>
References: <cover.1731244445.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Reuse newly added DMA API to cache IOVA and only link/unlink pages
in fast path for UMEM ODP flow.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/core/umem_odp.c   | 101 ++++++---------------------
 drivers/infiniband/hw/mlx5/mlx5_ib.h |  11 +--
 drivers/infiniband/hw/mlx5/odp.c     |  40 +++++++----
 drivers/infiniband/hw/mlx5/umr.c     |  12 +++-
 include/rdma/ib_umem_odp.h           |  13 +---
 5 files changed, 69 insertions(+), 108 deletions(-)

diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index 9dba369365af..30cd8f353476 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -41,6 +41,7 @@
 #include <linux/hugetlb.h>
 #include <linux/interval_tree.h>
 #include <linux/hmm.h>
+#include <linux/hmm-dma.h>
 #include <linux/pagemap.h>
 
 #include <rdma/ib_umem_odp.h>
@@ -50,6 +51,7 @@
 static inline int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
 				   const struct mmu_interval_notifier_ops *ops)
 {
+	struct ib_device *dev = umem_odp->umem.ibdev;
 	int ret;
 
 	umem_odp->umem.is_odp = 1;
@@ -59,7 +61,6 @@ static inline int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
 		size_t page_size = 1UL << umem_odp->page_shift;
 		unsigned long start;
 		unsigned long end;
-		size_t ndmas, npfns;
 
 		start = ALIGN_DOWN(umem_odp->umem.address, page_size);
 		if (check_add_overflow(umem_odp->umem.address,
@@ -70,36 +71,23 @@ static inline int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
 		if (unlikely(end < page_size))
 			return -EOVERFLOW;
 
-		ndmas = (end - start) >> umem_odp->page_shift;
-		if (!ndmas)
-			return -EINVAL;
-
-		npfns = (end - start) >> PAGE_SHIFT;
-		umem_odp->pfn_list = kvcalloc(
-			npfns, sizeof(*umem_odp->pfn_list), GFP_KERNEL);
-		if (!umem_odp->pfn_list)
-			return -ENOMEM;
-
-		umem_odp->dma_list = kvcalloc(
-			ndmas, sizeof(*umem_odp->dma_list), GFP_KERNEL);
-		if (!umem_odp->dma_list) {
-			ret = -ENOMEM;
-			goto out_pfn_list;
-		}
+		ret = hmm_dma_map_alloc(dev->dma_device, &umem_odp->map,
+					(end - start) >> PAGE_SHIFT,
+					1 << umem_odp->page_shift);
+		if (ret)
+			return ret;
 
 		ret = mmu_interval_notifier_insert(&umem_odp->notifier,
 						   umem_odp->umem.owning_mm,
 						   start, end - start, ops);
 		if (ret)
-			goto out_dma_list;
+			goto out_free_map;
 	}
 
 	return 0;
 
-out_dma_list:
-	kvfree(umem_odp->dma_list);
-out_pfn_list:
-	kvfree(umem_odp->pfn_list);
+out_free_map:
+	hmm_dma_map_free(dev->dma_device, &umem_odp->map);
 	return ret;
 }
 
@@ -262,6 +250,8 @@ EXPORT_SYMBOL(ib_umem_odp_get);
 
 void ib_umem_odp_release(struct ib_umem_odp *umem_odp)
 {
+	struct ib_device *dev = umem_odp->umem.ibdev;
+
 	/*
 	 * Ensure that no more pages are mapped in the umem.
 	 *
@@ -274,48 +264,17 @@ void ib_umem_odp_release(struct ib_umem_odp *umem_odp)
 					    ib_umem_end(umem_odp));
 		mutex_unlock(&umem_odp->umem_mutex);
 		mmu_interval_notifier_remove(&umem_odp->notifier);
-		kvfree(umem_odp->dma_list);
-		kvfree(umem_odp->pfn_list);
+		hmm_dma_map_free(dev->dma_device, &umem_odp->map);
 	}
 	put_pid(umem_odp->tgid);
 	kfree(umem_odp);
 }
 EXPORT_SYMBOL(ib_umem_odp_release);
 
-/*
- * Map for DMA and insert a single page into the on-demand paging page tables.
- *
- * @umem: the umem to insert the page to.
- * @dma_index: index in the umem to add the dma to.
- * @page: the page struct to map and add.
- * @access_mask: access permissions needed for this page.
- *
- * The function returns -EFAULT if the DMA mapping operation fails.
- *
- */
-static int ib_umem_odp_map_dma_single_page(
-		struct ib_umem_odp *umem_odp,
-		unsigned int dma_index,
-		struct page *page)
-{
-	struct ib_device *dev = umem_odp->umem.ibdev;
-	dma_addr_t *dma_addr = &umem_odp->dma_list[dma_index];
-
-	*dma_addr = ib_dma_map_page(dev, page, 0, 1 << umem_odp->page_shift,
-				    DMA_BIDIRECTIONAL);
-	if (ib_dma_mapping_error(dev, *dma_addr)) {
-		*dma_addr = 0;
-		return -EFAULT;
-	}
-	umem_odp->npages++;
-	return 0;
-}
-
 /**
  * ib_umem_odp_map_dma_and_lock - DMA map userspace memory in an ODP MR and lock it.
  *
  * Maps the range passed in the argument to DMA addresses.
- * The DMA addresses of the mapped pages is updated in umem_odp->dma_list.
  * Upon success the ODP MR will be locked to let caller complete its device
  * page table update.
  *
@@ -372,7 +331,7 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 			range.default_flags |= HMM_PFN_REQ_WRITE;
 	}
 
-	range.hmm_pfns = &(umem_odp->pfn_list[pfn_start_idx]);
+	range.hmm_pfns = &(umem_odp->map.pfn_list[pfn_start_idx]);
 	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 
 retry:
@@ -423,15 +382,6 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 				  __func__, hmm_order, page_shift);
 			break;
 		}
-
-		ret = ib_umem_odp_map_dma_single_page(
-				umem_odp, dma_index, hmm_pfn_to_page(range.hmm_pfns[pfn_index]));
-		if (ret < 0) {
-			ibdev_dbg(umem_odp->umem.ibdev,
-				  "ib_umem_odp_map_dma_single_page failed with error %d\n", ret);
-			break;
-		}
-		range.hmm_pfns[pfn_index] |= HMM_PFN_DMA_MAPPED;
 	}
 	/* upon success lock should stay on hold for the callee */
 	if (!ret)
@@ -451,30 +401,23 @@ EXPORT_SYMBOL(ib_umem_odp_map_dma_and_lock);
 void ib_umem_odp_unmap_dma_pages(struct ib_umem_odp *umem_odp, u64 virt,
 				 u64 bound)
 {
-	dma_addr_t dma;
-	int idx;
-	u64 addr;
 	struct ib_device *dev = umem_odp->umem.ibdev;
+	u64 addr;
 
 	lockdep_assert_held(&umem_odp->umem_mutex);
 
 	virt = max_t(u64, virt, ib_umem_start(umem_odp));
 	bound = min_t(u64, bound, ib_umem_end(umem_odp));
 	for (addr = virt; addr < bound; addr += BIT(umem_odp->page_shift)) {
-		unsigned long pfn_idx = (addr - ib_umem_start(umem_odp)) >> PAGE_SHIFT;
-		struct page *page = hmm_pfn_to_page(umem_odp->pfn_list[pfn_idx]);
-
-		idx = (addr - ib_umem_start(umem_odp)) >> umem_odp->page_shift;
-		dma = umem_odp->dma_list[idx];
+		u64 offset = addr - ib_umem_start(umem_odp);
+		size_t idx = offset >> umem_odp->page_shift;
+		unsigned long pfn = umem_odp->map.pfn_list[idx];
 
-		if (!(umem_odp->pfn_list[pfn_idx] & HMM_PFN_VALID))
-			goto clear;
-		if (!(umem_odp->pfn_list[pfn_idx] & HMM_PFN_DMA_MAPPED))
+		if (!hmm_dma_unmap_pfn(dev->dma_device, &umem_odp->map, idx))
 			goto clear;
 
-		ib_dma_unmap_page(dev, dma, BIT(umem_odp->page_shift),
-				  DMA_BIDIRECTIONAL);
-		if (umem_odp->pfn_list[pfn_idx] & HMM_PFN_WRITE) {
+		if (pfn & HMM_PFN_WRITE) {
+			struct page *page = hmm_pfn_to_page(pfn);
 			struct page *head_page = compound_head(page);
 			/*
 			 * set_page_dirty prefers being called with
@@ -489,7 +432,7 @@ void ib_umem_odp_unmap_dma_pages(struct ib_umem_odp *umem_odp, u64 virt,
 		}
 		umem_odp->npages--;
 clear:
-		umem_odp->pfn_list[pfn_idx] &= ~HMM_PFN_FLAGS;
+		umem_odp->map.pfn_list[idx] &= ~HMM_PFN_FLAGS;
 	}
 }
 EXPORT_SYMBOL(ib_umem_odp_unmap_dma_pages);
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index 3e4aaa6319db..1bae5595c729 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1444,8 +1444,8 @@ void mlx5_ib_odp_cleanup_one(struct mlx5_ib_dev *ibdev);
 int __init mlx5_ib_odp_init(void);
 void mlx5_ib_odp_cleanup(void);
 int mlx5_odp_init_mkey_cache(struct mlx5_ib_dev *dev);
-void mlx5_odp_populate_xlt(void *xlt, size_t idx, size_t nentries,
-			   struct mlx5_ib_mr *mr, int flags);
+int mlx5_odp_populate_xlt(void *xlt, size_t idx, size_t nentries,
+			  struct mlx5_ib_mr *mr, int flags);
 
 int mlx5_ib_advise_mr_prefetch(struct ib_pd *pd,
 			       enum ib_uverbs_advise_mr_advice advice,
@@ -1466,8 +1466,11 @@ static inline int mlx5_odp_init_mkey_cache(struct mlx5_ib_dev *dev)
 {
 	return 0;
 }
-static inline void mlx5_odp_populate_xlt(void *xlt, size_t idx, size_t nentries,
-					 struct mlx5_ib_mr *mr, int flags) {}
+static inline int mlx5_odp_populate_xlt(void *xlt, size_t idx, size_t nentries,
+					struct mlx5_ib_mr *mr, int flags)
+{
+	return -EOPNOTSUPP;
+}
 
 static inline int
 mlx5_ib_advise_mr_prefetch(struct ib_pd *pd,
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index 78887500ce15..fbb2a5670c32 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -35,6 +35,8 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-resv.h>
 #include <linux/hmm.h>
+#include <linux/hmm-dma.h>
+#include <linux/pci-p2pdma.h>
 
 #include "mlx5_ib.h"
 #include "cmd.h"
@@ -159,40 +161,50 @@ static void populate_klm(struct mlx5_klm *pklm, size_t idx, size_t nentries,
 	}
 }
 
-static void populate_mtt(__be64 *pas, size_t idx, size_t nentries,
-			 struct mlx5_ib_mr *mr, int flags)
+static int populate_mtt(__be64 *pas, size_t start, size_t nentries,
+			struct mlx5_ib_mr *mr, int flags)
 {
 	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
 	bool downgrade = flags & MLX5_IB_UPD_XLT_DOWNGRADE;
-	unsigned long pfn;
-	dma_addr_t pa;
+	struct pci_p2pdma_map_state p2pdma_state = {};
+	struct ib_device *dev = odp->umem.ibdev;
 	size_t i;
 
 	if (flags & MLX5_IB_UPD_XLT_ZAP)
-		return;
+		return 0;
 
 	for (i = 0; i < nentries; i++) {
-		pfn = odp->pfn_list[idx + i];
+		unsigned long pfn = odp->map.pfn_list[start + i];
+		dma_addr_t dma_addr;
+
+		pfn = odp->map.pfn_list[start + i];
 		if (!(pfn & HMM_PFN_VALID))
 			/* ODP initialization */
 			continue;
 
-		pa = odp->dma_list[idx + i];
-		pa |= MLX5_IB_MTT_READ;
+		dma_addr = hmm_dma_map_pfn(dev->dma_device, &odp->map,
+					   start + i, &p2pdma_state);
+		if (ib_dma_mapping_error(dev, dma_addr))
+			return -EFAULT;
+
+		dma_addr |= MLX5_IB_MTT_READ;
 		if ((pfn & HMM_PFN_WRITE) && !downgrade)
-			pa |= MLX5_IB_MTT_WRITE;
+			dma_addr |= MLX5_IB_MTT_WRITE;
 
-		pas[i] = cpu_to_be64(pa);
+		pas[i] = cpu_to_be64(dma_addr);
+		odp->npages++;
 	}
+	return 0;
 }
 
-void mlx5_odp_populate_xlt(void *xlt, size_t idx, size_t nentries,
-			   struct mlx5_ib_mr *mr, int flags)
+int mlx5_odp_populate_xlt(void *xlt, size_t idx, size_t nentries,
+			  struct mlx5_ib_mr *mr, int flags)
 {
 	if (flags & MLX5_IB_UPD_XLT_INDIRECT) {
 		populate_klm(xlt, idx, nentries, mr, flags);
+		return 0;
 	} else {
-		populate_mtt(xlt, idx, nentries, mr, flags);
+		return populate_mtt(xlt, idx, nentries, mr, flags);
 	}
 }
 
@@ -286,7 +298,7 @@ static bool mlx5_ib_invalidate_range(struct mmu_interval_notifier *mni,
 		 * estimate the cost of another UMR vs. the cost of bigger
 		 * UMR.
 		 */
-		if (umem_odp->pfn_list[idx] & HMM_PFN_VALID) {
+		if (umem_odp->map.pfn_list[idx] & HMM_PFN_VALID) {
 			if (!in_block) {
 				blk_start_idx = idx;
 				in_block = 1;
diff --git a/drivers/infiniband/hw/mlx5/umr.c b/drivers/infiniband/hw/mlx5/umr.c
index 887fd6fa3ba9..d7fa94ab23cf 100644
--- a/drivers/infiniband/hw/mlx5/umr.c
+++ b/drivers/infiniband/hw/mlx5/umr.c
@@ -811,7 +811,17 @@ int mlx5r_umr_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
 		size_to_map = npages * desc_size;
 		dma_sync_single_for_cpu(ddev, sg.addr, sg.length,
 					DMA_TO_DEVICE);
-		mlx5_odp_populate_xlt(xlt, idx, npages, mr, flags);
+		/*
+		 * npages is the maximum number of pages to map, but we
+		 * can't guarantee that all pages are actually mapped.
+		 *
+		 * For example, if page is p2p of type which is not supported
+		 * for mapping, the number of pages mapped will be less than
+		 * requested.
+		 */
+		err = mlx5_odp_populate_xlt(xlt, idx, npages, mr, flags);
+		if (err)
+			return err;
 		dma_sync_single_for_device(ddev, sg.addr, sg.length,
 					   DMA_TO_DEVICE);
 		sg.length = ALIGN(size_to_map, MLX5_UMR_FLEX_ALIGNMENT);
diff --git a/include/rdma/ib_umem_odp.h b/include/rdma/ib_umem_odp.h
index a345c26a745d..2a24bf791c10 100644
--- a/include/rdma/ib_umem_odp.h
+++ b/include/rdma/ib_umem_odp.h
@@ -8,24 +8,17 @@
 
 #include <rdma/ib_umem.h>
 #include <rdma/ib_verbs.h>
-#include <linux/hmm.h>
+#include <linux/hmm-dma.h>
 
 struct ib_umem_odp {
 	struct ib_umem umem;
 	struct mmu_interval_notifier notifier;
 	struct pid *tgid;
 
-	/* An array of the pfns included in the on-demand paging umem. */
-	unsigned long *pfn_list;
+	struct hmm_dma_map map;
 
 	/*
-	 * An array with DMA addresses mapped for pfns in pfn_list.
-	 * The lower two bits designate access permissions.
-	 * See ODP_READ_ALLOWED_BIT and ODP_WRITE_ALLOWED_BIT.
-	 */
-	dma_addr_t		*dma_list;
-	/*
-	 * The umem_mutex protects the page_list and dma_list fields of an ODP
+	 * The umem_mutex protects the page_list field of an ODP
 	 * umem, allowing only a single thread to map/unmap pages. The mutex
 	 * also protects access to the mmu notifier counters.
 	 */
-- 
2.47.0


