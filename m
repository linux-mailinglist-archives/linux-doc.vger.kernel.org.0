Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CC6441256
	for <lists+linux-doc@lfdr.de>; Mon,  1 Nov 2021 04:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhKADYm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 31 Oct 2021 23:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhKADYl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 31 Oct 2021 23:24:41 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89920C061746
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:08 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id o14so1656952pfu.10
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 20:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kz8Is7/w3HTYzTd0x0esANJetgolSYs/j3QXr973ab0=;
        b=Y46IO+MQEqwDMUM2jwJEyE2me6yJ6OfUBEGat34DjH+gd6IAxXIXmqbHAJ0Tq/wqQO
         otRDCQ8sOSl6sL50QgkdXB6yq5yZKygtiF1+UFK8msGtaptEbCN1X+o+RXB3QmuJPRU+
         fTIrCYtL+r7Zkjy7gRLj9OSScHhLXfaZQ7MbrEje94rrBm6H48v6jrmOFIokSCsqdxmz
         uMS41a3Paess1BNRg5ZCA5yIL4N67QIJebp+dyEAy642sIaH1hrG9z+5xy4/hBrFKR5/
         y5j0bUpCQSKshzxj3mSqAdB9wyY5vfoczzmYPVDIkzchVcgMJhvKCezdie3Tf2J3Mcyy
         el+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kz8Is7/w3HTYzTd0x0esANJetgolSYs/j3QXr973ab0=;
        b=wYcghoozE+F2aRdAGQLTOmWzaVwVTotdfRE2En6hnHnrIwDi9r2wqYESjKtaUmDzPA
         OResjrs8UnffltBE1/OdIM3d0vrn3qWo+y0G3qgD8mqtgeEzdp9Fw654NZT6WebgZmNr
         mOjaVb4+Io4tg+FmzLptTfwDdQBjWWDzuJJTV4GkxF9Hv4PRK0bkM/mTLOTnMhXQVRQY
         MJlkMADR1AQoDK1smJdiTQp2yJjaPN8Z+VcMl434qFaKi4b7vundnvBuN4iMtGFLo5Ft
         WTwo+rIuUiB0vmQSQZ8suNdsST3jGGSxD8Lb3P+KWLHReIcb/4tUsjnbzmIUBYgjLTwv
         ppjw==
X-Gm-Message-State: AOAM5303U5i6nZ+vwf7J4kNp75nG9hsxIPssOCABBQA4Hh1fM3muposL
        yPu0Oor+qO28XfQ6U9EJLgR6Xw==
X-Google-Smtp-Source: ABdhPJzlvfFVzKBIyfdsJ8jdoR5sRXL4vU+awLsmhcjXe18/ZSQXgjrt8sihKysfhx/gIxNFEZ8IZw==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr12029803pgh.199.1635736927444;
        Sun, 31 Oct 2021 20:22:07 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id f8sm11860963pjq.29.2021.10.31.20.22.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Oct 2021 20:22:07 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net, willy@infradead.org, 21cnbao@gmail.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        smuchun@gmail.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 1/5] mm: hugetlb: free the 2nd vmemmap page associated with each HugeTLB page
Date:   Mon,  1 Nov 2021 11:16:47 +0800
Message-Id: <20211101031651.75851-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20211101031651.75851-1-songmuchun@bytedance.com>
References: <20211101031651.75851-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch minimizes the overhead of struct page for 2MB HugeTLB
pages significantly. It further reduces the overhead of struct
page by 12.5% for a 2MB HugeTLB compared to the previous approach,
which means 2GB per 1TB HugeTLB (2MB type).

After the feature of "Free sonme vmemmap pages of HugeTLB page"
is enabled, the mapping of the vmemmap addresses associated with
a 2MB HugeTLB page becomes the figure below.

     HugeTLB                    struct pages(8 pages)         page frame(8 pages)
 +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+---> PG_head
 |           |                     |     0     | -------------> |     0     |
 |           |                     +-----------+                +-----------+
 |           |                     |     1     | -------------> |     1     |
 |           |                     +-----------+                +-----------+
 |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
 |           |                     +-----------+                   | | | | |
 |           |                     |     3     | ------------------+ | | | |
 |           |                     +-----------+                     | | | |
 |           |                     |     4     | --------------------+ | | |
 |    2MB    |                     +-----------+                       | | |
 |           |                     |     5     | ----------------------+ | |
 |           |                     +-----------+                         | |
 |           |                     |     6     | ------------------------+ |
 |           |                     +-----------+                           |
 |           |                     |     7     | --------------------------+
 |           |                     +-----------+
 |           |
 |           |
 |           |
 +-----------+

As we can see, the 2nd vmemmap page frame (indexed by 1) is reused and
remaped. However, the 2nd vmemmap page frame is also can be freed to
the buddy allocator, then we can change the mapping from the figure
above to the figure below.

    HugeTLB                    struct pages(8 pages)         page frame(8 pages)
 +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+---> PG_head
 |           |                     |     0     | -------------> |     0     |
 |           |                     +-----------+                +-----------+
 |           |                     |     1     | ---------------^ ^ ^ ^ ^ ^ ^
 |           |                     +-----------+                  | | | | | |
 |           |                     |     2     | -----------------+ | | | | |
 |           |                     +-----------+                    | | | | |
 |           |                     |     3     | -------------------+ | | | |
 |           |                     +-----------+                      | | | |
 |           |                     |     4     | ---------------------+ | | |
 |    2MB    |                     +-----------+                        | | |
 |           |                     |     5     | -----------------------+ | |
 |           |                     +-----------+                          | |
 |           |                     |     6     | -------------------------+ |
 |           |                     +-----------+                            |
 |           |                     |     7     | ---------------------------+
 |           |                     +-----------+
 |           |
 |           |
 |           |
 +-----------+

After we do this, all tail vmemmap pages (1-7) are mapped to the head
vmemmap page frame (0). In other words, there are more than one page
struct with PG_head associated with each HugeTLB page. We __know__
that there is only one head page struct, the tail page structs with
PG_head are fake head page structs. We need an approach to distinguish
between those two different types of page structs so that compound_head(),
PageHead() and PageTail() can work properly if the parameter is the
tail page struct but with PG_head.

The following code snippet describes how to distinguish between real and
fake head page struct.

	if (test_bit(PG_head, &page->flags)) {
		unsigned long head = READ_ONCE(page[1].compound_head);

		if (head & 1) {
			if (head == (unsigned long)page + 1)
				==> head page struct
			else
				==> tail page struct
		} else
			==> head page struct
	}

We can safely access the field of the @page[1] with PG_head because the
@page is a compound page composed with at least two contiguous pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Barry Song <song.bao.hua@hisilicon.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 include/linux/page-flags.h                      | 78 +++++++++++++++++++++++--
 mm/hugetlb_vmemmap.c                            | 62 +++++++++++---------
 mm/sparse-vmemmap.c                             | 21 +++++++
 4 files changed, 130 insertions(+), 33 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ad94a2aa9819..8ac050b9b3da 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1619,7 +1619,7 @@
 			[KNL] Reguires CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 			enabled.
 			Allows heavy hugetlb users to free up some more
-			memory (6 * PAGE_SIZE for each 2MB hugetlb page).
+			memory (7 * PAGE_SIZE for each 2MB hugetlb page).
 			Format: { on | off (default) }
 
 			on:  enable the feature
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 70bf0ec29ee3..7cd386538d0c 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -184,13 +184,69 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+extern bool hugetlb_free_vmemmap_enabled;
+
+/*
+ * If the feature of freeing some vmemmap pages associated with each HugeTLB
+ * page is enabled, the head vmemmap page frame is reused and all of the tail
+ * vmemmap addresses map to the head vmemmap page frame (furture details can
+ * refer to the figure at the head of the mm/hugetlb_vmemmap.c).  In other
+ * words, there are more than one page struct with PG_head associated with each
+ * HugeTLB page.  We __know__ that there is only one head page struct, the tail
+ * page structs with PG_head are fake head page structs.  We need an approach
+ * to distinguish between those two different types of page structs so that
+ * compound_head() can return the real head page struct when the parameter is
+ * the tail page struct but with PG_head.
+ *
+ * The page_fixed_fake_head() returns the real head page struct if the @page is
+ * fake page head, otherwise, returns @page which can either be a true page
+ * head or tail.
+ */
+static __always_inline const struct page *page_fixed_fake_head(const struct page *page)
+{
+	if (!hugetlb_free_vmemmap_enabled)
+		return page;
+
+	/*
+	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
+	 * struct page. The alignment check aims to avoid access the fields (
+	 * e.g. compound_head) of the @page[1]. It can avoid touch a (possibly)
+	 * cold cacheline in some cases.
+	 */
+	if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
+	    test_bit(PG_head, &page->flags)) {
+		/*
+		 * We can safely access the field of the @page[1] with PG_head
+		 * because the @page is a compound page composed with at least
+		 * two contiguous pages.
+		 */
+		unsigned long head = READ_ONCE(page[1].compound_head);
+
+		if (likely(head & 1))
+			return (const struct page *)(head - 1);
+	}
+	return page;
+}
+#else
+static inline const struct page *page_fixed_fake_head(const struct page *page)
+{
+	return page;
+}
+#endif
+
+static __always_inline int page_is_fake_head(struct page *page)
+{
+	return page_fixed_fake_head(page) != page;
+}
+
 static inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long head = READ_ONCE(page->compound_head);
 
 	if (unlikely(head & 1))
 		return head - 1;
-	return (unsigned long)page;
+	return (unsigned long)page_fixed_fake_head(page);
 }
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
@@ -225,12 +281,13 @@ static inline unsigned long _compound_head(const struct page *page)
 
 static __always_inline int PageTail(struct page *page)
 {
-	return READ_ONCE(page->compound_head) & 1;
+	return READ_ONCE(page->compound_head) & 1 || page_is_fake_head(page);
 }
 
 static __always_inline int PageCompound(struct page *page)
 {
-	return test_bit(PG_head, &page->flags) || PageTail(page);
+	return test_bit(PG_head, &page->flags) ||
+	       READ_ONCE(page->compound_head) & 1;
 }
 
 #define	PAGE_POISON_PATTERN	-1l
@@ -675,7 +732,20 @@ static inline bool test_set_page_writeback(struct page *page)
 	return set_page_writeback(page);
 }
 
-__PAGEFLAG(Head, head, PF_ANY) CLEARPAGEFLAG(Head, head, PF_ANY)
+static __always_inline bool folio_test_head(struct folio *folio)
+{
+	return test_bit(PG_head, folio_flags(folio, FOLIO_PF_ANY));
+}
+
+static __always_inline int PageHead(struct page *page)
+{
+	PF_POISONED_CHECK(page);
+	return test_bit(PG_head, &page->flags) && !page_is_fake_head(page);
+}
+
+__SETPAGEFLAG(Head, head, PF_ANY)
+__CLEARPAGEFLAG(Head, head, PF_ANY)
+CLEARPAGEFLAG(Head, head, PF_ANY)
 
 /* Whether there are one or multiple pages in a folio */
 static inline bool folio_test_single(struct folio *folio)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index c540c21e26f5..4977f5a520c2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -124,9 +124,9 @@
  * page of page structs (page 0) associated with the HugeTLB page contains the 4
  * page structs necessary to describe the HugeTLB. The only use of the remaining
  * pages of page structs (page 1 to page 7) is to point to page->compound_head.
- * Therefore, we can remap pages 2 to 7 to page 1. Only 2 pages of page structs
+ * Therefore, we can remap pages 1 to 7 to page 0. Only 1 page of page structs
  * will be used for each HugeTLB page. This will allow us to free the remaining
- * 6 pages to the buddy allocator.
+ * 7 pages to the buddy allocator.
  *
  * Here is how things look after remapping.
  *
@@ -134,30 +134,30 @@
  * +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
  * |           |                     |     0     | -------------> |     0     |
  * |           |                     +-----------+                +-----------+
- * |           |                     |     1     | -------------> |     1     |
- * |           |                     +-----------+                +-----------+
- * |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
- * |           |                     +-----------+                   | | | | |
- * |           |                     |     3     | ------------------+ | | | |
- * |           |                     +-----------+                     | | | |
- * |           |                     |     4     | --------------------+ | | |
- * |    PMD    |                     +-----------+                       | | |
- * |   level   |                     |     5     | ----------------------+ | |
- * |  mapping  |                     +-----------+                         | |
- * |           |                     |     6     | ------------------------+ |
- * |           |                     +-----------+                           |
- * |           |                     |     7     | --------------------------+
+ * |           |                     |     1     | ---------------^ ^ ^ ^ ^ ^ ^
+ * |           |                     +-----------+                  | | | | | |
+ * |           |                     |     2     | -----------------+ | | | | |
+ * |           |                     +-----------+                    | | | | |
+ * |           |                     |     3     | -------------------+ | | | |
+ * |           |                     +-----------+                      | | | |
+ * |           |                     |     4     | ---------------------+ | | |
+ * |    PMD    |                     +-----------+                        | | |
+ * |   level   |                     |     5     | -----------------------+ | |
+ * |  mapping  |                     +-----------+                          | |
+ * |           |                     |     6     | -------------------------+ |
+ * |           |                     +-----------+                            |
+ * |           |                     |     7     | ---------------------------+
  * |           |                     +-----------+
  * |           |
  * |           |
  * |           |
  * +-----------+
  *
- * When a HugeTLB is freed to the buddy system, we should allocate 6 pages for
+ * When a HugeTLB is freed to the buddy system, we should allocate 7 pages for
  * vmemmap pages and restore the previous mapping relationship.
  *
  * For the HugeTLB page of the pud level mapping. It is similar to the former.
- * We also can use this approach to free (PAGE_SIZE - 2) vmemmap pages.
+ * We also can use this approach to free (PAGE_SIZE - 1) vmemmap pages.
  *
  * Apart from the HugeTLB page of the pmd/pud level mapping, some architectures
  * (e.g. aarch64) provides a contiguous bit in the translation table entries
@@ -166,7 +166,13 @@
  *
  * The contiguous bit is used to increase the mapping size at the pmd and pte
  * (last) level. So this type of HugeTLB page can be optimized only when its
- * size of the struct page structs is greater than 2 pages.
+ * size of the struct page structs is greater than 1 page.
+ *
+ * Notice: The head vmemmap page is not freed to the buddy allocator and all
+ * tail vmemmap pages are mapped to the head vmemmap page frame. So we can see
+ * more than one struct page struct with PG_head (e.g. 8 per 2 MB HugeTLB page)
+ * associated with each HugeTLB page. The compound_head() can handle this
+ * correctly (more details refer to the comment above compound_head()).
  */
 #define pr_fmt(fmt)	"HugeTLB: " fmt
 
@@ -175,19 +181,21 @@
 /*
  * There are a lot of struct page structures associated with each HugeTLB page.
  * For tail pages, the value of compound_head is the same. So we can reuse first
- * page of tail page structures. We map the virtual addresses of the remaining
- * pages of tail page structures to the first tail page struct, and then free
- * these page frames. Therefore, we need to reserve two pages as vmemmap areas.
+ * page of head page structures. We map the virtual addresses of all the pages
+ * of tail page structures to the head page struct, and then free these page
+ * frames. Therefore, we need to reserve one pages as vmemmap areas.
  */
-#define RESERVE_VMEMMAP_NR		2U
+#define RESERVE_VMEMMAP_NR		1U
 #define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
 
-bool hugetlb_free_vmemmap_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON);
+bool hugetlb_free_vmemmap_enabled __read_mostly =
+	IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON);
+EXPORT_SYMBOL(hugetlb_free_vmemmap_enabled);
 
 static int __init early_hugetlb_free_vmemmap_param(char *buf)
 {
 	/* We cannot optimize if a "struct page" crosses page boundaries. */
-	if ((!is_power_of_2(sizeof(struct page)))) {
+	if (!is_power_of_2(sizeof(struct page))) {
 		pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
 		return 0;
 	}
@@ -236,7 +244,6 @@ int alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 	 */
 	ret = vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse,
 				  GFP_KERNEL | __GFP_NORETRY | __GFP_THISNODE);
-
 	if (!ret)
 		ClearHPageVmemmapOptimized(head);
 
@@ -282,9 +289,8 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
-	 * The head page and the first tail page are not to be freed to buddy
-	 * allocator, the other pages will map to the first tail page, so they
-	 * can be freed.
+	 * The head page is not to be freed to buddy allocator, the other tail
+	 * pages will map to the head page, so they can be freed.
 	 *
 	 * Could RESERVE_VMEMMAP_NR be greater than @vmemmap_pages? It is true
 	 * on some architectures (e.g. aarch64). See Documentation/arm64/
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index db6df27c852a..e881f5db7091 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -245,6 +245,26 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 	set_pte_at(&init_mm, addr, pte, entry);
 }
 
+/*
+ * How many struct page structs need to be reset. When we reuse the head
+ * struct page, the special metadata (e.g. page->flags or page->mapping)
+ * cannot copy to the tail struct page structs. The invalid value will be
+ * checked in the free_tail_pages_check(). In order to avoid the message
+ * of "corrupted mapping in tail page". We need to reset at least 3 (one
+ * head struct page struct and two tail struct page structs) struct page
+ * structs.
+ */
+#define NR_RESET_STRUCT_PAGE		3
+
+static inline void reset_struct_pages(struct page *start)
+{
+	int i;
+	struct page *from = start + NR_RESET_STRUCT_PAGE;
+
+	for (i = 0; i < NR_RESET_STRUCT_PAGE; i++)
+		memcpy(start + i, from, sizeof(*from));
+}
+
 static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 				struct vmemmap_remap_walk *walk)
 {
@@ -258,6 +278,7 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	list_del(&page->lru);
 	to = page_to_virt(page);
 	copy_page(to, (void *)walk->reuse_addr);
+	reset_struct_pages(to);
 
 	set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
 }
-- 
2.11.0

