Return-Path: <linux-doc+bounces-12860-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9CF88E947
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 16:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97D48B21786
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 15:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7B21327F6;
	Wed, 27 Mar 2024 14:13:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713912FF90
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548802; cv=none; b=XB8fsZ3NGLHX54lJkL/R0mN1djdvzW42K+q7tPXVc9FOlkweuPe1gv5bTtGdJEvZRcvvQNIMU5TTp1H4Gz7bxJc7Pd1IWsdmYiU0j8R9vnprRkJU07zO2Xx4vG3X5v//x3/ak3kKNownbntiZdJwJkI/qT4RYXGXxopwiR7+Rtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548802; c=relaxed/simple;
	bh=jh/6aYaWL1Xk9FQQFll5dFO6kPACr31KkWuxgTShIj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jX2/YMgapTS6+lmVEjlTQ2T0lYS/4YZG7XV3lRtezVM4nGa7Tz7owlHM4bTgMjXt5qrvdWStiQZ4nsON1MYz8AzYO813OtFVwooFE8XjsEXZNoy/LRywOOXFs+M5z6ImhZVIz5McZ/eoNIdrg7P6EXIVmgq5ZNABKztZ5EHnnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V4TBy6DS2z1wnbd;
	Wed, 27 Mar 2024 22:12:26 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 4197B140259;
	Wed, 27 Mar 2024 22:13:16 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 22:13:15 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <willy@infradead.org>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Hugh Dickins
	<hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH 3/6] mm: remove isolate_lru_page()
Date: Wed, 27 Mar 2024 22:10:31 +0800
Message-ID: <20240327141034.3712697-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100001.china.huawei.com (7.185.36.93)

There are no more callers of isolate_lru_page(), remove it.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 Documentation/mm/page_migration.rst                    | 6 +++---
 Documentation/translations/zh_CN/mm/page_migration.rst | 6 +++---
 mm/filemap.c                                           | 2 +-
 mm/folio-compat.c                                      | 7 -------
 mm/internal.h                                          | 1 -
 mm/khugepaged.c                                        | 8 ++++----
 mm/migrate_device.c                                    | 2 +-
 mm/swap.c                                              | 2 +-
 8 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index f1ce67a26615..0046bbbdc65d 100644
--- a/Documentation/mm/page_migration.rst
+++ b/Documentation/mm/page_migration.rst
@@ -67,8 +67,8 @@ In kernel use of migrate_pages()
 
    Lists of pages to be migrated are generated by scanning over
    pages and moving them into lists. This is done by
-   calling isolate_lru_page().
-   Calling isolate_lru_page() increases the references to the page
+   calling folio_isolate_lru().
+   Calling folio_isolate_lru() increases the references to the page
    so that it cannot vanish while the page migration occurs.
    It also prevents the swapper or other scans from encountering
    the page.
@@ -86,7 +86,7 @@ How migrate_pages() works
 
 migrate_pages() does several passes over its list of pages. A page is moved
 if all references to a page are removable at the time. The page has
-already been removed from the LRU via isolate_lru_page() and the refcount
+already been removed from the LRU via folio_isolate_lru() and the refcount
 is increased so that the page cannot be freed while page migration occurs.
 
 Steps:
diff --git a/Documentation/translations/zh_CN/mm/page_migration.rst b/Documentation/translations/zh_CN/mm/page_migration.rst
index f95063826a15..8c8461c6cb9f 100644
--- a/Documentation/translations/zh_CN/mm/page_migration.rst
+++ b/Documentation/translations/zh_CN/mm/page_migration.rst
@@ -50,8 +50,8 @@ mbind()设置一个新的内存策略。一个进程的页面也可以通过sys_
 
 1. 从LRU中移除页面。
 
-   要迁移的页面列表是通过扫描页面并把它们移到列表中来生成的。这是通过调用 isolate_lru_page()
-   来完成的。调用isolate_lru_page()增加了对该页的引用，这样在页面迁移发生时它就不会
+   要迁移的页面列表是通过扫描页面并把它们移到列表中来生成的。这是通过调用 folio_isolate_lru()
+   来完成的。调用folio_isolate_lru()增加了对该页的引用，这样在页面迁移发生时它就不会
    消失。它还可以防止交换器或其他扫描器遇到该页。
 
 
@@ -65,7 +65,7 @@ migrate_pages()如何工作
 =======================
 
 migrate_pages()对它的页面列表进行了多次处理。如果当时对一个页面的所有引用都可以被移除，
-那么这个页面就会被移动。该页已经通过isolate_lru_page()从LRU中移除，并且refcount被
+那么这个页面就会被移动。该页已经通过folio_isolate_lru()从LRU中移除，并且refcount被
 增加，以便在页面迁移发生时不释放该页。
 
 步骤:
diff --git a/mm/filemap.c b/mm/filemap.c
index 7437b2bd75c1..2a03fbbf413a 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -113,7 +113,7 @@
  *    ->private_lock		(try_to_unmap_one)
  *    ->i_pages lock		(try_to_unmap_one)
  *    ->lruvec->lru_lock	(follow_page->mark_page_accessed)
- *    ->lruvec->lru_lock	(check_pte_range->isolate_lru_page)
+ *    ->lruvec->lru_lock	(check_pte_range->folio_isolate_lru)
  *    ->private_lock		(folio_remove_rmap_pte->set_page_dirty)
  *    ->i_pages lock		(folio_remove_rmap_pte->set_page_dirty)
  *    bdi.wb->list_lock		(folio_remove_rmap_pte->set_page_dirty)
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 50412014f16f..95ad426b296a 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -105,13 +105,6 @@ struct page *grab_cache_page_write_begin(struct address_space *mapping,
 }
 EXPORT_SYMBOL(grab_cache_page_write_begin);
 
-bool isolate_lru_page(struct page *page)
-{
-	if (WARN_RATELIMIT(PageTail(page), "trying to isolate tail page"))
-		return false;
-	return folio_isolate_lru((struct folio *)page);
-}
-
 void putback_lru_page(struct page *page)
 {
 	folio_putback_lru(page_folio(page));
diff --git a/mm/internal.h b/mm/internal.h
index 7e486f2c502c..7cdf7d3d83ea 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -292,7 +292,6 @@ extern unsigned long highest_memmap_pfn;
 /*
  * in mm/vmscan.c:
  */
-bool isolate_lru_page(struct page *page);
 bool folio_isolate_lru(struct folio *folio);
 void putback_lru_page(struct page *page);
 void folio_putback_lru(struct folio *folio);
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 38830174608f..e9b8b368f655 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -607,7 +607,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		}
 
 		/*
-		 * We can do it before isolate_lru_page because the
+		 * We can do it before folio_isolate_lru because the
 		 * page can't be freed from under us. NOTE: PG_lock
 		 * is needed to serialize against split_huge_page
 		 * when invoked from the VM.
@@ -1867,7 +1867,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 					result = SCAN_FAIL;
 					goto xa_unlocked;
 				}
-				/* drain lru cache to help isolate_lru_page() */
+				/* drain lru cache to help folio_isolate_lru() */
 				lru_add_drain();
 				page = folio_file_page(folio, index);
 			} else if (trylock_page(page)) {
@@ -1883,7 +1883,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 				page_cache_sync_readahead(mapping, &file->f_ra,
 							  file, index,
 							  end - index);
-				/* drain lru cache to help isolate_lru_page() */
+				/* drain lru cache to help folio_isolate_lru() */
 				lru_add_drain();
 				page = find_lock_page(mapping, index);
 				if (unlikely(page == NULL)) {
@@ -1990,7 +1990,7 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 		 * We control three references to the page:
 		 *  - we hold a pin on it;
 		 *  - one reference from page cache;
-		 *  - one from isolate_lru_page;
+		 *  - one from folio_isolate_lru;
 		 * If those are the only references, then any new usage of the
 		 * page will have to fetch it from the page cache. That requires
 		 * locking the page to handle truncate, so any new usage will be
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c0547271eaaa..3a42624bb590 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -326,7 +326,7 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 {
 	/*
 	 * One extra ref because caller holds an extra reference, either from
-	 * isolate_lru_page() for a regular page, or migrate_vma_collect() for
+	 * folio_isolate_lru() for a regular page, or migrate_vma_collect() for
 	 * a device page.
 	 */
 	int extra = 1 + (page == fault_page);
diff --git a/mm/swap.c b/mm/swap.c
index 500a09a48dfd..decd6d44b7ac 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -930,7 +930,7 @@ atomic_t lru_disable_count = ATOMIC_INIT(0);
 
 /*
  * lru_cache_disable() needs to be called before we start compiling
- * a list of pages to be migrated using isolate_lru_page().
+ * a list of pages to be migrated using folio_isolate_lru().
  * It drains pages on LRU cache and then disable on all cpus until
  * lru_cache_enable is called.
  *
-- 
2.27.0


