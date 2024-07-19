Return-Path: <linux-doc+bounces-21040-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126E9375E4
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 11:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1391B24159
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C94B83CD4;
	Fri, 19 Jul 2024 09:37:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C2483A17;
	Fri, 19 Jul 2024 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721381853; cv=none; b=dSSseXWOSHmqBVUA9KA940Q0gPo9nOuwp0sk62ZTwCSuM+gdOzvbn7S3sgYvxuetVvGNN7hUbnlOMBKFSieMRx86bsUOIDejsiTqz/raVwkDnTd1YsRkp8g2MAzepssocqB0Ug2aCRQR0lu92NXQqaGDwcMeTrNT8ZWl8ca2oCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721381853; c=relaxed/simple;
	bh=8Inx7QwU368iFB8eE+GxIKlM9m7GCPf+isJZfYlY4Xs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJnBmGNxczFx8jdtFvNTMUzwZdicALhw5H86SVgqzoH6SvMtpdq+pd431sdH/G+7isy1KD/7sFc36aSwq2YhXkB7tKYCXTKVcBTVui1xZoTOmC9CWGxte0SeCdpwCBs4H2IpB7iwibVUfWhwRxG5NudeZ1CJKQt0tvdX7MOey+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WQPhJ00MPzVkrZ;
	Fri, 19 Jul 2024 17:36:47 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id 246CF180088;
	Fri, 19 Jul 2024 17:37:29 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Jul 2024 17:37:28 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Yunsheng Lin
	<linyunsheng@huawei.com>, Alexander Duyck <alexander.duyck@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
Subject: [RFC v11 13/14] mm: page_frag: update documentation for page_frag
Date: Fri, 19 Jul 2024 17:33:37 +0800
Message-ID: <20240719093338.55117-14-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240719093338.55117-1-linyunsheng@huawei.com>
References: <20240719093338.55117-1-linyunsheng@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf200006.china.huawei.com (7.185.36.61)

Update documentation about design, implementation and API usages
for page_frag.

CC: Alexander Duyck <alexander.duyck@gmail.com>
Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
---
 Documentation/mm/page_frags.rst | 163 +++++++++++++++++++++++++++++++-
 include/linux/page_frag_cache.h | 107 +++++++++++++++++++++
 mm/page_frag_cache.c            |  77 ++++++++++++++-
 3 files changed, 344 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/page_frags.rst b/Documentation/mm/page_frags.rst
index 503ca6cdb804..6a4ac2616098 100644
--- a/Documentation/mm/page_frags.rst
+++ b/Documentation/mm/page_frags.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==============
 Page fragments
 ==============
@@ -40,4 +42,163 @@ page via a single call.  The advantage to doing this is that it allows for
 cleaning up the multiple references that were added to a page in order to
 avoid calling get_page per allocation.
 
-Alexander Duyck, Nov 29, 2016.
+
+Architecture overview
+=====================
+
+.. code-block:: none
+
+                      +----------------------+
+                      | page_frag API caller |
+                      +----------------------+
+                                  |
+                                  |
+                                  v
+    +---------------------------------------------------------------+
+    |                   request page fragment                       |
+    +---------------------------------------------------------------+
+             |                                 |                  |
+             |                                 |                  |
+             |                          Cache not enough          |
+             |                                 |                  |
+             |                                 v                  |
+        Cache empty                   +-----------------+         |
+             |                        | drain old cache |         |
+             |                        +-----------------+         |
+             |                                 |                  |
+             v_________________________________v                  |
+                              |                                   |
+                              |                                   |
+             _________________v_______________                    |
+            |                                 |            Cache is enough
+            |                                 |                   |
+ PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE         |                   |
+            |                                 |                   |
+            |               PAGE_SIZE >= PAGE_FRAG_CACHE_MAX_SIZE |
+            v                                 |                   |
+    +----------------------------------+      |                   |
+    | refill cache with order > 0 page |      |                   |
+    +----------------------------------+      |                   |
+      |                    |                  |                   |
+      |                    |                  |                   |
+      |              Refill failed            |                   |
+      |                    |                  |                   |
+      |                    v                  v                   |
+      |      +------------------------------------+               |
+      |      |   refill cache with order 0 page   |               |
+      |      +----------------------------------=-+               |
+      |                       |                                   |
+ Refill succeed               |                                   |
+      |                 Refill succeed                            |
+      |                       |                                   |
+      v                       v                                   v
+    +---------------------------------------------------------------+
+    |             allocate fragment from cache                      |
+    +---------------------------------------------------------------+
+
+API interface
+=============
+As the design and implementation of page_frag API implies, the allocation side
+does not allow concurrent calling. Instead it is assumed that the caller must
+ensure there is not concurrent alloc calling to the same page_frag_cache
+instance by using its own lock or rely on some lockless guarantee like NAPI
+softirq.
+
+Depending on different aligning requirement, the page_frag API caller may call
+page_frag_alloc*_align*() to ensure the returned virtual address or offset of
+the page is aligned according to the 'align/alignment' parameter. Note the size
+of the allocated fragment is not aligned, the caller needs to provide an aligned
+fragsz if there is an alignment requirement for the size of the fragment.
+
+Depending on different use cases, callers expecting to deal with va, page or
+both va and page for them may call page_frag_alloc_va*, page_frag_alloc_pg*,
+or page_frag_alloc* API accordingly.
+
+There is also a use case that needs minimum memory in order for forward progress,
+but more performant if more memory is available. Using page_frag_alloc_prepare()
+and page_frag_alloc_commit() related API, the caller requests the minimum memory
+it needs and the prepare API will return the maximum size of the fragment
+returned. The caller needs to either call the commit API to report how much
+memory it actually uses, or not do so if deciding to not use any memory.
+
+.. kernel-doc:: include/linux/page_frag_cache.h
+   :identifiers: page_frag_cache_init page_frag_cache_is_pfmemalloc
+                 page_frag_cache_page_offset page_frag_alloc_va
+                 page_frag_alloc_va_align page_frag_alloc_va_prepare_align
+                 page_frag_alloc_probe page_frag_alloc_commit
+                 page_frag_alloc_commit_noref page_frag_alloc_abort
+
+.. kernel-doc:: mm/page_frag_cache.c
+   :identifiers: __page_frag_alloc_va_align page_frag_alloc_pg
+                 page_frag_alloc_va_prepare page_frag_alloc_pg_prepare
+                 page_frag_alloc_prepare page_frag_cache_drain
+                 page_frag_free_va
+
+Coding examples
+===============
+
+Init & Drain API
+----------------
+
+.. code-block:: c
+
+   page_frag_cache_init(pfrag);
+   ...
+   page_frag_cache_drain(pfrag);
+
+
+Alloc & Free API
+----------------
+
+.. code-block:: c
+
+    void *va;
+
+    va = page_frag_alloc_va_align(pfrag, size, gfp, align);
+    if (!va)
+        goto do_error;
+
+    err = do_something(va, size);
+    if (err) {
+        page_frag_free_va(va);
+        goto do_error;
+    }
+
+Prepare & Commit API
+--------------------
+
+.. code-block:: c
+
+    unsigned int offset, size;
+    bool merge = true;
+    struct page *page;
+    void *va;
+
+    size = 32U;
+    page = page_frag_alloc_prepare(pfrag, &offset, &size, &va);
+    if (!page)
+        goto wait_for_space;
+
+    copy = min_t(unsigned int, copy, size);
+    if (!skb_can_coalesce(skb, i, page, offset)) {
+        if (i >= max_skb_frags)
+            goto new_segment;
+
+        merge = false;
+    }
+
+    copy = mem_schedule(copy);
+    if (!copy)
+        goto wait_for_space;
+
+    err = copy_from_iter_full_nocache(va, copy, iter);
+    if (err)
+        goto do_error;
+
+    if (merge) {
+        skb_frag_size_add(&skb_shinfo(skb)->frags[i - 1], copy);
+        page_frag_alloc_commit_noref(pfrag, offset, copy);
+    } else {
+        skb_fill_page_desc(skb, i, page, offset, copy);
+        page_frag_alloc_commit(pfrag, offset, copy);
+    }
diff --git a/include/linux/page_frag_cache.h b/include/linux/page_frag_cache.h
index 1242bfb53ccc..6e16fcd57d72 100644
--- a/include/linux/page_frag_cache.h
+++ b/include/linux/page_frag_cache.h
@@ -50,11 +50,28 @@ static inline void *encoded_page_address(unsigned long encoded_va)
 	return (void *)(encoded_va & PAGE_MASK);
 }
 
+/**
+ * page_frag_cache_init() - Init page_frag cache.
+ * @nc: page_frag cache from which to init
+ *
+ * Inline helper to init the page_frag cache.
+ */
 static inline void page_frag_cache_init(struct page_frag_cache *nc)
 {
 	memset(nc, 0, sizeof(*nc));
 }
 
+/**
+ * page_frag_cache_is_pfmemalloc() - Check for pfmemalloc.
+ * @nc: page_frag cache from which to check
+ *
+ * Used to check if the current page in page_frag cache is pfmemalloc'ed.
+ * It has the same calling context expection as the alloc API.
+ *
+ * Return:
+ * true if the current page in page_frag cache is pfmemalloc'ed, otherwise
+ * return false.
+ */
 static inline bool page_frag_cache_is_pfmemalloc(struct page_frag_cache *nc)
 {
 	return encoded_page_pfmemalloc(nc->encoded_va);
@@ -74,6 +91,19 @@ void *__page_frag_alloc_va_align(struct page_frag_cache *nc,
 				 unsigned int fragsz, gfp_t gfp_mask,
 				 unsigned int align_mask);
 
+/**
+ * page_frag_alloc_va_align() - Alloc a page fragment with aligning requirement.
+ * @nc: page_frag cache from which to allocate
+ * @fragsz: the requested fragment size
+ * @gfp_mask: the allocation gfp to use when cache needs to be refilled
+ * @align: the requested aligning requirement for virtual address of fragment
+ *
+ * WARN_ON_ONCE() checking for @align before allocing a page fragment from
+ * page_frag cache with aligning requirement.
+ *
+ * Return:
+ * virtual address of the page fragment, otherwise return NULL.
+ */
 static inline void *page_frag_alloc_va_align(struct page_frag_cache *nc,
 					     unsigned int fragsz,
 					     gfp_t gfp_mask, unsigned int align)
@@ -82,11 +112,32 @@ static inline void *page_frag_alloc_va_align(struct page_frag_cache *nc,
 	return __page_frag_alloc_va_align(nc, fragsz, gfp_mask, -align);
 }
 
+/**
+ * page_frag_cache_page_offset() - Return the current page fragment's offset.
+ * @nc: page_frag cache from which to check
+ *
+ * The API is only used in net/sched/em_meta.c for historical reason, do not use
+ * it for new caller unless there is a strong reason.
+ *
+ * Return:
+ * the offset of the current page fragment in the page_frag cache.
+ */
 static inline unsigned int page_frag_cache_page_offset(const struct page_frag_cache *nc)
 {
 	return page_frag_cache_page_size(nc->encoded_va) - nc->remaining;
 }
 
+/**
+ * page_frag_alloc_va() - Alloc a page fragment.
+ * @nc: page_frag cache from which to allocate
+ * @fragsz: the requested fragment size
+ * @gfp_mask: the allocation gfp to use when cache need to be refilled
+ *
+ * Get a page fragment from page_frag cache.
+ *
+ * Return:
+ * virtual address of the page fragment, otherwise return NULL.
+ */
 static inline void *page_frag_alloc_va(struct page_frag_cache *nc,
 				       unsigned int fragsz, gfp_t gfp_mask)
 {
@@ -96,6 +147,21 @@ static inline void *page_frag_alloc_va(struct page_frag_cache *nc,
 void *page_frag_alloc_va_prepare(struct page_frag_cache *nc, unsigned int *fragsz,
 				 gfp_t gfp);
 
+/**
+ * page_frag_alloc_va_prepare_align() - Prepare allocing a page fragment with
+ * aligning requirement.
+ * @nc: page_frag cache from which to prepare
+ * @fragsz: in as the requested size, out as the available size
+ * @gfp: the allocation gfp to use when cache need to be refilled
+ * @align: the requested aligning requirement
+ *
+ * WARN_ON_ONCE() checking for @align before preparing an aligned page fragment
+ * with minimum size of @fragsz, @fragsz is also used to report the maximum size
+ * of the page fragment the caller can use.
+ *
+ * Return:
+ * virtual address of the page fragment, otherwise return NULL.
+ */
 static inline void *page_frag_alloc_va_prepare_align(struct page_frag_cache *nc,
 						     unsigned int *fragsz,
 						     gfp_t gfp,
@@ -115,6 +181,21 @@ struct page *page_frag_alloc_prepare(struct page_frag_cache *nc,
 				     unsigned int *fragsz,
 				     void **va, gfp_t gfp);
 
+/**
+ * page_frag_alloc_probe - Probe the available page fragment.
+ * @nc: page_frag cache from which to probe
+ * @offset: out as the offset of the page fragment
+ * @fragsz: in as the requested size, out as the available size
+ * @va: out as the virtual address of the returned page fragment
+ *
+ * Probe the current available memory to caller without doing cache refilling.
+ * If no space is available in the page_frag cache, return NULL.
+ * If the requested space is available, up to @fragsz bytes may be added to the
+ * fragment using commit API.
+ *
+ * Return:
+ * the page fragment, otherwise return NULL.
+ */
 static inline struct page *page_frag_alloc_probe(struct page_frag_cache *nc,
 						 unsigned int *offset,
 						 unsigned int *fragsz,
@@ -137,6 +218,14 @@ static inline struct page *page_frag_alloc_probe(struct page_frag_cache *nc,
 	return page;
 }
 
+/**
+ * page_frag_alloc_commit - Commit allocing a page fragment.
+ * @nc: page_frag cache from which to commit
+ * @fragsz: size of the page fragment has been used
+ *
+ * Commit the actual used size for the allocation that was either prepared or
+ * probed.
+ */
 static inline void page_frag_alloc_commit(struct page_frag_cache *nc,
 					  unsigned int fragsz)
 {
@@ -145,6 +234,16 @@ static inline void page_frag_alloc_commit(struct page_frag_cache *nc,
 	nc->remaining -= fragsz;
 }
 
+/**
+ * page_frag_alloc_commit_noref - Commit allocing a page fragment without taking
+ * page refcount.
+ * @nc: page_frag cache from which to commit
+ * @fragsz: size of the page fragment has been used
+ *
+ * Commit the alloc preparing or probing by passing the actual used size, but
+ * not taking refcount. Mostly used for fragmemt coalescing case when the
+ * current fragment can share the same refcount with previous fragment.
+ */
 static inline void page_frag_alloc_commit_noref(struct page_frag_cache *nc,
 						unsigned int fragsz)
 {
@@ -152,6 +251,14 @@ static inline void page_frag_alloc_commit_noref(struct page_frag_cache *nc,
 	nc->remaining -= fragsz;
 }
 
+/**
+ * page_frag_alloc_abort - Abort the page fragment allocation.
+ * @nc: page_frag cache to which the page fragment is aborted back
+ * @fragsz: size of the page fragment to be aborted
+ *
+ * It is expected to be called from the same context as the alloc API.
+ * Mostly used for error handling cases where the fragment is no longer needed.
+ */
 static inline void page_frag_alloc_abort(struct page_frag_cache *nc,
 					 unsigned int fragsz)
 {
diff --git a/mm/page_frag_cache.c b/mm/page_frag_cache.c
index 74d2a13d12a8..80e16f399f6f 100644
--- a/mm/page_frag_cache.c
+++ b/mm/page_frag_cache.c
@@ -88,6 +88,18 @@ static struct page *__page_frag_cache_refill(struct page_frag_cache *nc,
 	return page;
 }
 
+/**
+ * page_frag_alloc_va_prepare() - Prepare allocing a page fragment.
+ * @nc: page_frag cache from which to prepare
+ * @fragsz: in as the requested size, out as the available size
+ * @gfp: the allocation gfp to use when cache needs to be refilled
+ *
+ * Prepare a page fragment with minimum size of @fragsz, @fragsz is also used
+ * to report the maximum size of the page fragment the caller can use.
+ *
+ * Return:
+ * virtual address of the page fragment, otherwise return NULL.
+ */
 void *page_frag_alloc_va_prepare(struct page_frag_cache *nc,
 				 unsigned int *fragsz, gfp_t gfp)
 {
@@ -110,6 +122,19 @@ void *page_frag_alloc_va_prepare(struct page_frag_cache *nc,
 }
 EXPORT_SYMBOL(page_frag_alloc_va_prepare);
 
+/**
+ * page_frag_alloc_pg_prepare - Prepare allocing a page fragment.
+ * @nc: page_frag cache from which to prepare
+ * @offset: out as the offset of the page fragment
+ * @fragsz: in as the requested size, out as the available size
+ * @gfp: the allocation gfp to use when cache needs to be refilled
+ *
+ * Prepare a page fragment with minimum size of @fragsz, @fragsz is also used
+ * to report the maximum size of the page fragment the caller can use.
+ *
+ * Return:
+ * the page fragment, otherwise return NULL.
+ */
 struct page *page_frag_alloc_pg_prepare(struct page_frag_cache *nc,
 					unsigned int *offset,
 					unsigned int *fragsz, gfp_t gfp)
@@ -140,6 +165,21 @@ struct page *page_frag_alloc_pg_prepare(struct page_frag_cache *nc,
 }
 EXPORT_SYMBOL(page_frag_alloc_pg_prepare);
 
+/**
+ * page_frag_alloc_prepare - Prepare allocing a page fragment.
+ * @nc: page_frag cache from which to prepare
+ * @offset: out as the offset of the page fragment
+ * @fragsz: in as the requested size, out as the available size
+ * @va: out as the virtual address of the returned page fragment
+ * @gfp: the allocation gfp to use when cache needs to be refilled
+ *
+ * Prepare a page fragment with minimum size of @fragsz, @fragsz is also used
+ * to report the maximum size of the page fragment. Return both 'struct page'
+ * and virtual address of the fragment to the caller.
+ *
+ * Return:
+ * the page fragment, otherwise return NULL.
+ */
 struct page *page_frag_alloc_prepare(struct page_frag_cache *nc,
 				     unsigned int *offset,
 				     unsigned int *fragsz,
@@ -172,6 +212,18 @@ struct page *page_frag_alloc_prepare(struct page_frag_cache *nc,
 }
 EXPORT_SYMBOL(page_frag_alloc_prepare);
 
+/**
+ * page_frag_alloc_pg - Alloce a page fragment.
+ * @nc: page_frag cache from which to alloce
+ * @offset: out as the offset of the page fragment
+ * @fragsz: the requested fragment size
+ * @gfp: the allocation gfp to use when cache needs to be refilled
+ *
+ * Get a page fragment from page_frag cache.
+ *
+ * Return:
+ * the page fragment, otherwise return NULL.
+ */
 struct page *page_frag_alloc_pg(struct page_frag_cache *nc,
 				unsigned int *offset, unsigned int fragsz,
 				gfp_t gfp)
@@ -202,6 +254,10 @@ struct page *page_frag_alloc_pg(struct page_frag_cache *nc,
 }
 EXPORT_SYMBOL(page_frag_alloc_pg);
 
+/**
+ * page_frag_cache_drain - Drain the current page from page_frag cache.
+ * @nc: page_frag cache from which to drain
+ */
 void page_frag_cache_drain(struct page_frag_cache *nc)
 {
 	if (!nc->encoded_va)
@@ -222,6 +278,19 @@ void __page_frag_cache_drain(struct page *page, unsigned int count)
 }
 EXPORT_SYMBOL(__page_frag_cache_drain);
 
+/**
+ * __page_frag_alloc_va_align() - Alloc a page fragment with aligning
+ * requirement.
+ * @nc: page_frag cache from which to allocate
+ * @fragsz: the requested fragment size
+ * @gfp_mask: the allocation gfp to use when cache need to be refilled
+ * @align_mask: the requested aligning requirement for the 'va'
+ *
+ * Get a page fragment from page_frag cache with aligning requirement.
+ *
+ * Return:
+ * Return va of the page fragment, otherwise return NULL.
+ */
 void *__page_frag_alloc_va_align(struct page_frag_cache *nc,
 				 unsigned int fragsz, gfp_t gfp_mask,
 				 unsigned int align_mask)
@@ -257,8 +326,12 @@ void *__page_frag_alloc_va_align(struct page_frag_cache *nc,
 }
 EXPORT_SYMBOL(__page_frag_alloc_va_align);
 
-/*
- * Frees a page fragment allocated out of either a compound or order 0 page.
+/**
+ * page_frag_free_va - Free a page fragment.
+ * @addr: va of page fragment to be freed
+ *
+ * Free a page fragment allocated out of either a compound or order 0 page by
+ * virtual address.
  */
 void page_frag_free_va(void *addr)
 {
-- 
2.33.0


