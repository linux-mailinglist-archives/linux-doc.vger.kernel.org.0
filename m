Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26BB376D383
	for <lists+linux-doc@lfdr.de>; Wed,  2 Aug 2023 18:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjHBQSa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Aug 2023 12:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjHBQS3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 12:18:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E551619AD
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 09:18:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7116861A40
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 16:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58308C433CD;
        Wed,  2 Aug 2023 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690993106;
        bh=6uGIC+/Vw2Y9dMySJxbrb40WAaQk9hQKgBIIvidUEOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GmM3UX9CLz9dAJ+MlC7o9PZXrFzWIsF4U40F5Jts0nHefGbETH8gqXxOTrENtl+Wb
         do4Xqk4iKCRKI3CRbhxtx77mP/2CFQn1uZrtpHvq+5lGYp99i/BMVPvIZ8M7gKs4RK
         iz62CnUFQ8OZcxJcVKntFkw4Q+gtOe0sfb3IFsvUqkPAj1pNEekeL5CYfcOOYvQhKy
         gXr8kord0Xfk8EVfyBiKrfvAcEdyui8LUjAlN9WJVE187Gvf++gJa7bIgaO1XfQS5b
         pzHdm+NpWpTVbuK73RZYX3oOI85LIdSQHSRq1vgfWce364AxFfs/iaYacz8iiwt6i0
         kFn4lENt1n1Kw==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        aleksander.lobakin@intel.com, Jakub Kicinski <kuba@kernel.org>,
        hawk@kernel.org, ilias.apalodimas@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v2 2/2] docs: net: page_pool: use kdoc to avoid duplicating the information
Date:   Wed,  2 Aug 2023 09:18:21 -0700
Message-ID: <20230802161821.3621985-3-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802161821.3621985-1-kuba@kernel.org>
References: <20230802161821.3621985-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All struct members of the driver-facing APIs are documented twice,
in the code and under Documentation. This is a bit tedious.

I also get the feeling that a lot of developers will read the header
when coding, rather than the doc. Bring the two a little closer
together by using kdoc for structs and functions.

Using kdoc also gives us links (mentioning a function or struct
in the text gets replaced by a link to its doc).

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
--
CC: hawk@kernel.org
CC: ilias.apalodimas@linaro.org
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org
CC: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 Documentation/networking/page_pool.rst |  86 ++++------------
 include/net/page_pool.h                | 134 +++++++++++++++++++------
 net/core/page_pool.c                   |  31 +++++-
 3 files changed, 152 insertions(+), 99 deletions(-)

diff --git a/Documentation/networking/page_pool.rst b/Documentation/networking/page_pool.rst
index eb96a592ec6b..53b5448cc0f1 100644
--- a/Documentation/networking/page_pool.rst
+++ b/Documentation/networking/page_pool.rst
@@ -64,50 +64,19 @@ This lockless guarantee naturally comes from running under a NAPI softirq.
 The protection doesn't strictly have to be NAPI, any guarantee that allocating
 a page will cause no race conditions is enough.
 
-* page_pool_create(): Create a pool.
-    * flags:      PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV
-    * order:      2^order pages on allocation
-    * pool_size:  size of the ptr_ring
-    * nid:        preferred NUMA node for allocation
-    * dev:        struct device. Used on DMA operations
-    * dma_dir:    DMA direction
-    * max_len:    max DMA sync memory size
-    * offset:     DMA address offset
+.. kernel-doc:: net/core/page_pool.c
+   :identifiers: page_pool_create
 
-* page_pool_put_page(): The outcome of this depends on the page refcnt. If the
-  driver bumps the refcnt > 1 this will unmap the page. If the page refcnt is 1
-  the allocator owns the page and will try to recycle it in one of the pool
-  caches. If PP_FLAG_DMA_SYNC_DEV is set, the page will be synced for_device
-  using dma_sync_single_range_for_device().
+.. kernel-doc:: include/net/page_pool.h
+   :identifiers: struct page_pool_params
 
-* page_pool_put_full_page(): Similar to page_pool_put_page(), but will DMA sync
-  for the entire memory area configured in area pool->max_len.
+.. kernel-doc:: include/net/page_pool.h
+   :identifiers: page_pool_put_page page_pool_put_full_page
+		 page_pool_recycle_direct page_pool_dev_alloc_pages
+		 page_pool_get_dma_addr page_pool_get_dma_dir
 
-* page_pool_recycle_direct(): Similar to page_pool_put_full_page() but caller
-  must guarantee safe context (e.g NAPI), since it will recycle the page
-  directly into the pool fast cache.
-
-* page_pool_dev_alloc_pages(): Get a page from the page allocator or page_pool
-  caches.
-
-* page_pool_get_dma_addr(): Retrieve the stored DMA address.
-
-* page_pool_get_dma_dir(): Retrieve the stored DMA direction.
-
-* page_pool_put_page_bulk(): Tries to refill a number of pages into the
-  ptr_ring cache holding ptr_ring producer lock. If the ptr_ring is full,
-  page_pool_put_page_bulk() will release leftover pages to the page allocator.
-  page_pool_put_page_bulk() is suitable to be run inside the driver NAPI tx
-  completion loop for the XDP_REDIRECT use case.
-  Please note the caller must not use data area after running
-  page_pool_put_page_bulk(), as this function overwrites it.
-
-* page_pool_get_stats(): Retrieve statistics about the page_pool. This API
-  is only available if the kernel has been configured with
-  ``CONFIG_PAGE_POOL_STATS=y``. A pointer to a caller allocated ``struct
-  page_pool_stats`` structure is passed to this API which is filled in. The
-  caller can then report those stats to the user (perhaps via ethtool,
-  debugfs, etc.). See below for an example usage of this API.
+.. kernel-doc:: net/core/page_pool.c
+   :identifiers: page_pool_put_page_bulk page_pool_get_stats
 
 DMA sync
 --------
@@ -146,36 +115,17 @@ with fragmented page pools.
 Stats API and structures
 ------------------------
 If the kernel is configured with ``CONFIG_PAGE_POOL_STATS=y``, the API
-``page_pool_get_stats()`` and structures described below are available. It
-takes a  pointer to a ``struct page_pool`` and a pointer to a ``struct
-page_pool_stats`` allocated by the caller.
+page_pool_get_stats() and structures described below are available.
+It takes a  pointer to a ``struct page_pool`` and a pointer to a struct
+page_pool_stats allocated by the caller.
 
-The API will fill in the provided ``struct page_pool_stats`` with
+The API will fill in the provided struct page_pool_stats with
 statistics about the page_pool.
 
-The stats structure has the following fields::
-
-    struct page_pool_stats {
-        struct page_pool_alloc_stats alloc_stats;
-        struct page_pool_recycle_stats recycle_stats;
-    };
-
-
-The ``struct page_pool_alloc_stats`` has the following fields:
-  * ``fast``: successful fast path allocations
-  * ``slow``: slow path order-0 allocations
-  * ``slow_high_order``: slow path high order allocations
-  * ``empty``: ptr ring is empty, so a slow path allocation was forced.
-  * ``refill``: an allocation which triggered a refill of the cache
-  * ``waive``: pages obtained from the ptr ring that cannot be added to
-    the cache due to a NUMA mismatch.
-
-The ``struct page_pool_recycle_stats`` has the following fields:
-  * ``cached``: recycling placed page in the page pool cache
-  * ``cache_full``: page pool cache was full
-  * ``ring``: page placed into the ptr ring
-  * ``ring_full``: page released from page pool because the ptr ring was full
-  * ``released_refcnt``: page released (and not recycled) because refcnt > 1
+.. kernel-doc:: include/net/page_pool.h
+   :identifiers: struct page_pool_recycle_stats
+		 struct page_pool_alloc_stats
+		 struct page_pool_stats
 
 Coding examples
 ===============
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index f1d5cc1fa13b..73d4f786418d 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -70,47 +70,76 @@ struct pp_alloc_cache {
 	struct page *cache[PP_ALLOC_CACHE_SIZE];
 };
 
+/**
+ * struct page_pool_params - page pool parameters
+ * @flags:	PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV, PP_FLAG_PAGE_FRAG
+ * @order:	2^order pages on allocation
+ * @pool_size:	size of the ptr_ring
+ * @nid:	NUMA node id to allocate from pages from
+ * @dev:	device, for DMA pre-mapping purposes
+ * @napi:	NAPI which is the sole consumer of pages, otherwise NULL
+ * @dma_dir:	DMA mapping direction
+ * @max_len:	max DMA sync memory size for PP_FLAG_DMA_SYNC_DEV
+ * @offset:	DMA sync address offset for PP_FLAG_DMA_SYNC_DEV
+ */
 struct page_pool_params {
 	unsigned int	flags;
 	unsigned int	order;
 	unsigned int	pool_size;
-	int		nid;  /* Numa node id to allocate from pages from */
-	struct device	*dev; /* device, for DMA pre-mapping purposes */
-	struct napi_struct *napi; /* Sole consumer of pages, otherwise NULL */
-	enum dma_data_direction dma_dir; /* DMA mapping direction */
-	unsigned int	max_len; /* max DMA sync memory size */
-	unsigned int	offset;  /* DMA addr offset */
+	int		nid;
+	struct device	*dev;
+	struct napi_struct *napi;
+	enum dma_data_direction dma_dir;
+	unsigned int	max_len;
+	unsigned int	offset;
+/* private: used by test code only */
 	void (*init_callback)(struct page *page, void *arg);
 	void *init_arg;
 };
 
 #ifdef CONFIG_PAGE_POOL_STATS
+/**
+ * struct page_pool_alloc_stats - allocation statistics
+ * @fast:	successful fast path allocations
+ * @slow:	slow path order-0 allocations
+ * @slow_high_order: slow path high order allocations
+ * @empty:	ptr ring is empty, so a slow path allocation was forced
+ * @refill:	an allocation which triggered a refill of the cache
+ * @waive:	pages obtained from the ptr ring that cannot be added to
+ *		the cache due to a NUMA mismatch
+ */
 struct page_pool_alloc_stats {
-	u64 fast; /* fast path allocations */
-	u64 slow; /* slow-path order 0 allocations */
-	u64 slow_high_order; /* slow-path high order allocations */
-	u64 empty; /* failed refills due to empty ptr ring, forcing
-		    * slow path allocation
-		    */
-	u64 refill; /* allocations via successful refill */
-	u64 waive;  /* failed refills due to numa zone mismatch */
+	u64 fast;
+	u64 slow;
+	u64 slow_high_order;
+	u64 empty;
+	u64 refill;
+	u64 waive;
 };
 
+/**
+ * struct page_pool_recycle_stats - recycling (freeing) statistics
+ * @cached:	recycling placed page in the page pool cache
+ * @cache_full:	page pool cache was full
+ * @ring:	page placed into the ptr ring
+ * @ring_full:	page released from page pool because the ptr ring was full
+ * @released_refcnt:	page released (and not recycled) because refcnt > 1
+ */
 struct page_pool_recycle_stats {
-	u64 cached;	/* recycling placed page in the cache. */
-	u64 cache_full; /* cache was full */
-	u64 ring;	/* recycling placed page back into ptr ring */
-	u64 ring_full;	/* page was released from page-pool because
-			 * PTR ring was full.
-			 */
-	u64 released_refcnt; /* page released because of elevated
-			      * refcnt
-			      */
+	u64 cached;
+	u64 cache_full;
+	u64 ring;
+	u64 ring_full;
+	u64 released_refcnt;
 };
 
-/* This struct wraps the above stats structs so users of the
- * page_pool_get_stats API can pass a single argument when requesting the
- * stats for the page pool.
+/**
+ * struct page_pool_stats - combined page pool use statistics
+ * @alloc_stats:	see struct page_pool_alloc_stats
+ * @recycle_stats:	see struct page_pool_recycle_stats
+ *
+ * Wrapper struct for combining page pool stats with different storage
+ * requirements.
  */
 struct page_pool_stats {
 	struct page_pool_alloc_stats alloc_stats;
@@ -211,6 +240,12 @@ struct page_pool {
 
 struct page *page_pool_alloc_pages(struct page_pool *pool, gfp_t gfp);
 
+/**
+ * page_pool_dev_alloc_pages() - allocate a page.
+ * @pool:	pool from which to allocate
+ *
+ * Get a page from the page allocator or page_pool caches.
+ */
 static inline struct page *page_pool_dev_alloc_pages(struct page_pool *pool)
 {
 	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
@@ -230,8 +265,12 @@ static inline struct page *page_pool_dev_alloc_frag(struct page_pool *pool,
 	return page_pool_alloc_frag(pool, offset, size, gfp);
 }
 
-/* get the stored dma direction. A driver might decide to treat this locally and
- * avoid the extra cache line from page_pool to determine the direction
+/**
+ * page_pool_get_dma_dir() - Retrieve the stored DMA direction.
+ * @pool:	pool from which page was allocated
+ *
+ * Get the stored dma direction. A driver might decide to store this locally
+ * and avoid the extra cache line from page_pool to determine the direction.
  */
 static
 inline enum dma_data_direction page_pool_get_dma_dir(struct page_pool *pool)
@@ -321,6 +360,19 @@ static inline bool page_pool_is_last_frag(struct page_pool *pool,
 	       (page_pool_defrag_page(page, 1) == 0);
 }
 
+/**
+ * page_pool_put_page() - release a reference to a page pool page
+ * @pool:	pool from which page was allocated
+ * @page:	page to release a reference on
+ * @dma_sync_size: how much of the page may have been touched by the device
+ * @allow_direct: released by the consumer, allow lockless caching
+ *
+ * The outcome of this depends on the page refcnt. If the driver bumps
+ * the refcnt > 1 this will unmap the page. If the page refcnt is 1
+ * the allocator owns the page and will try to recycle it in one of the pool
+ * caches. If PP_FLAG_DMA_SYNC_DEV is set, the page will be synced for_device
+ * using dma_sync_single_range_for_device().
+ */
 static inline void page_pool_put_page(struct page_pool *pool,
 				      struct page *page,
 				      unsigned int dma_sync_size,
@@ -337,14 +389,29 @@ static inline void page_pool_put_page(struct page_pool *pool,
 #endif
 }
 
-/* Same as above but will try to sync the entire area pool->max_len */
+/**
+ * page_pool_put_full_page() - release a reference on a page pool page
+ * @pool:	pool from which page was allocated
+ * @page:	page to release a reference on
+ * @allow_direct: released by the consumer, allow lockless caching
+ *
+ * Similar to page_pool_put_page(), but will DMA sync the entire memory area
+ * as configured in &page_pool_params.max_len.
+ */
 static inline void page_pool_put_full_page(struct page_pool *pool,
 					   struct page *page, bool allow_direct)
 {
 	page_pool_put_page(pool, page, -1, allow_direct);
 }
 
-/* Same as above but the caller must guarantee safe context. e.g NAPI */
+/**
+ * page_pool_recycle_direct() - release a reference on a page pool page
+ * @pool:	pool from which page was allocated
+ * @page:	page to release a reference on
+ *
+ * Similar to page_pool_put_full_page() but caller must guarantee safe context
+ * (e.g NAPI), since it will recycle the page directly into the pool fast cache.
+ */
 static inline void page_pool_recycle_direct(struct page_pool *pool,
 					    struct page *page)
 {
@@ -354,6 +421,13 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,
 #define PAGE_POOL_DMA_USE_PP_FRAG_COUNT	\
 		(sizeof(dma_addr_t) > sizeof(unsigned long))
 
+/**
+ * page_pool_get_dma_addr() - Retrieve the stored DMA address.
+ * @page:	page allocated from a page pool
+ *
+ * Fetch the DMA address of the page. The page pool to which the page belongs
+ * must had been created with PP_FLAG_DMA_MAP.
+ */
 static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 {
 	dma_addr_t ret = page->dma_addr;
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 8704127646b3..b3e8ed5241ea 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -58,6 +58,17 @@ static const char pp_stats[][ETH_GSTRING_LEN] = {
 	"rx_pp_recycle_released_ref",
 };
 
+/**
+ * page_pool_get_stats() - fetch page pool stats
+ * @pool:	pool from which page was allocated
+ * @stats:	struct page_pool_stats to fill in
+ *
+ * Retrieve statistics about the page_pool. This API is only available
+ * if the kernel has been configured with ``CONFIG_PAGE_POOL_STATS=y``.
+ * A pointer to a caller allocated struct page_pool_stats structure
+ * is passed to this API which is filled in. The caller can then report
+ * those stats to the user (perhaps via ethtool, debugfs, etc.).
+ */
 bool page_pool_get_stats(struct page_pool *pool,
 			 struct page_pool_stats *stats)
 {
@@ -224,6 +235,10 @@ static int page_pool_init(struct page_pool *pool,
 	return 0;
 }
 
+/**
+ * page_pool_create() - create a page pool.
+ * @params: parameters, see struct page_pool_params
+ */
 struct page_pool *page_pool_create(const struct page_pool_params *params)
 {
 	struct page_pool *pool;
@@ -628,7 +643,21 @@ void page_pool_put_defragged_page(struct page_pool *pool, struct page *page,
 }
 EXPORT_SYMBOL(page_pool_put_defragged_page);
 
-/* Caller must not use data area after call, as this function overwrites it */
+/**
+ * page_pool_put_page_bulk() - release references on multiple pages
+ * @pool:	pool from which pages were allocated
+ * @data:	array holding page pointers
+ * @count:	number of pages in @data
+ *
+ * Tries to refill a number of pages into the ptr_ring cache holding ptr_ring
+ * producer lock. If the ptr_ring is full, page_pool_put_page_bulk()
+ * will release leftover pages to the page allocator.
+ * page_pool_put_page_bulk() is suitable to be run inside the driver NAPI tx
+ * completion loop for the XDP_REDIRECT use case.
+ *
+ * Please note the caller must not use data area after running
+ * page_pool_put_page_bulk(), as this function overwrites it.
+ */
 void page_pool_put_page_bulk(struct page_pool *pool, void **data,
 			     int count)
 {
-- 
2.41.0

