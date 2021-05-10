Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322D7377A52
	for <lists+linux-doc@lfdr.de>; Mon, 10 May 2021 05:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhEJDFM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 9 May 2021 23:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhEJDFM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 May 2021 23:05:12 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90F9C061574
        for <linux-doc@vger.kernel.org>; Sun,  9 May 2021 20:04:07 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id i5so7529163pgm.0
        for <linux-doc@vger.kernel.org>; Sun, 09 May 2021 20:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ihN5LHFxlD1f1ahggfdA3USTNjZx7TpIXTL+BvB6Bu4=;
        b=od1qFMLt/0pJgyeysnIQqtzBdEDY1RShDwDj08U3I93HxiMudKxFBB8/p3JOI+eo93
         pZaqVIkx9ytSvE2g/B4oa3Ig/sC0gt5J/k+ugMMI4xwwtAryaiMrLD0ms1EwXlGrM+9L
         C0+RAmAV9pH5MZXjKKNnDaJ43vBcZfaKjOASIbSnHlaWVwi2GbhEqMIOtPxTUPjPy2jX
         UiREk9I5mVl+MvxZBdJg/0zxQGwBw29L9e4mr0YT60ZYXrayLZDFN6GJ0CdsHuM0D2AY
         u7q0skqrU8fhplIQIlsmRrc13S5c8AIkPPsJ52vtCXM8Mjd9VqytfLK4Z+xpQKAkRHtx
         39hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ihN5LHFxlD1f1ahggfdA3USTNjZx7TpIXTL+BvB6Bu4=;
        b=RfFfoakATQtNCr8t1g1GzRE1+F+8UK6yq9w/PtQQE8hfqG/3wOK2Xta9enOOaEPH87
         qgCy4PfSvLOK7Sm8ahm9QLdQkAwOfgdiCtpgk9cCUD5D77ISPebO30V5IIyyIWQ8pSaB
         Ec4CRjoOLLWxnK67Olgt+ntVV5R4/R3GstrP6migMioL0qO02Qvpn9V32yPZF/82fu+U
         w5pASH3IskB96GXCKIg7Yb0K2YVfxXKMJHWbRastg8pNIbF5fOsEGpm3jlkVBU4UfHPA
         wqfSxmXkfqmc4DIesAS3njU5ywNIL8++5T8ifL6mslGGmjQX8deaNvICn4d6ce6FxhZN
         noRw==
X-Gm-Message-State: AOAM5335JT9MvvdgqToVvfh49ODdORyxr9avUYMc0v4cE8geOEvIqRVR
        YuYnuhuSFsXWf42Uwr3PCpwP4g==
X-Google-Smtp-Source: ABdhPJyY2jsfkkkssgZao9/iy2cuQqFYS0IIO1dIND1Aa99NKTo8+QQWu7/0s/7LdXE4YOE5AIrCog==
X-Received: by 2002:aa7:842a:0:b029:28d:f82e:a4ba with SMTP id q10-20020aa7842a0000b029028df82ea4bamr23210058pfn.33.1620615846860;
        Sun, 09 May 2021 20:04:06 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id a128sm9777003pfd.115.2021.05.09.20.03.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 May 2021 20:04:06 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com,
        rdunlap@infradead.org, oneukum@suse.com, anshuman.khandual@arm.com,
        jroedel@suse.de, almasrymina@google.com, rientjes@google.com,
        willy@infradead.org, osalvador@suse.de, mhocko@suse.com,
        song.bao.hua@hisilicon.com, david@redhat.com,
        naoya.horiguchi@nec.com, joao.m.martins@oracle.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        zhengqi.arch@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>,
        Chen Huang <chenhuang5@huawei.com>,
        Bodeddula Balasubramaniam <bodeddub@amazon.com>
Subject: [PATCH v23 4/9] mm: hugetlb: free the vmemmap pages associated with each HugeTLB page
Date:   Mon, 10 May 2021 11:00:22 +0800
Message-Id: <20210510030027.56044-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210510030027.56044-1-songmuchun@bytedance.com>
References: <20210510030027.56044-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Every HugeTLB has more than one struct page structure. We __know__ that
we only use the first 4 (__NR_USED_SUBPAGE) struct page structures
to store metadata associated with each HugeTLB.

There are a lot of struct page structures associated with each HugeTLB
page. For tail pages, the value of compound_head is the same. So we can
reuse first page of tail page structures. We map the virtual addresses
of the remaining pages of tail page structures to the first tail page
struct, and then free these page frames. Therefore, we need to reserve
two pages as vmemmap areas.

When we allocate a HugeTLB page from the buddy, we can free some vmemmap
pages associated with each HugeTLB page. It is more appropriate to do it
in the prep_new_huge_page().

The free_vmemmap_pages_per_hpage(), which indicates how many vmemmap
pages associated with a HugeTLB page can be freed, returns zero for
now, which means the feature is disabled. We will enable it once all
the infrastructure is there.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Tested-by: Chen Huang <chenhuang5@huawei.com>
Tested-by: Bodeddula Balasubramaniam <bodeddub@amazon.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 include/linux/bootmem_info.h |  28 +++++-
 include/linux/mm.h           |   3 +
 mm/Makefile                  |   1 +
 mm/hugetlb.c                 |  22 ++---
 mm/hugetlb_vmemmap.c         | 218 +++++++++++++++++++++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h         |  20 ++++
 mm/sparse-vmemmap.c          | 194 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 473 insertions(+), 13 deletions(-)
 create mode 100644 mm/hugetlb_vmemmap.c
 create mode 100644 mm/hugetlb_vmemmap.h

diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
index 4ed6dee1adc9..2bc8b1f69c93 100644
--- a/include/linux/bootmem_info.h
+++ b/include/linux/bootmem_info.h
@@ -2,7 +2,7 @@
 #ifndef __LINUX_BOOTMEM_INFO_H
 #define __LINUX_BOOTMEM_INFO_H
 
-#include <linux/mmzone.h>
+#include <linux/mm.h>
 
 /*
  * Types for free bootmem stored in page->lru.next. These have to be in
@@ -22,6 +22,27 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
 void get_page_bootmem(unsigned long info, struct page *page,
 		      unsigned long type);
 void put_page_bootmem(struct page *page);
+
+/*
+ * Any memory allocated via the memblock allocator and not via the
+ * buddy will be marked reserved already in the memmap. For those
+ * pages, we can call this function to free it to buddy allocator.
+ */
+static inline void free_bootmem_page(struct page *page)
+{
+	unsigned long magic = (unsigned long)page->freelist;
+
+	/*
+	 * The reserve_bootmem_region sets the reserved flag on bootmem
+	 * pages.
+	 */
+	VM_BUG_ON_PAGE(page_ref_count(page) != 2, page);
+
+	if (magic == SECTION_INFO || magic == MIX_SECTION_INFO)
+		put_page_bootmem(page);
+	else
+		VM_BUG_ON_PAGE(1, page);
+}
 #else
 static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
 {
@@ -35,6 +56,11 @@ static inline void get_page_bootmem(unsigned long info, struct page *page,
 				    unsigned long type)
 {
 }
+
+static inline void free_bootmem_page(struct page *page)
+{
+	free_reserved_page(page);
+}
 #endif
 
 #endif /* __LINUX_BOOTMEM_INFO_H */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 25b9041f9925..a4d160ddb749 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3046,6 +3046,9 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
 }
 #endif
 
+void vmemmap_remap_free(unsigned long start, unsigned long end,
+			unsigned long reuse);
+
 void *sparse_buffer_alloc(unsigned long size);
 struct page * __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap);
diff --git a/mm/Makefile b/mm/Makefile
index d0ccddae7a45..40ee404e200e 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_FRONTSWAP)	+= frontswap.o
 obj-$(CONFIG_ZSWAP)	+= zswap.o
 obj-$(CONFIG_HAS_DMA)	+= dmapool.o
 obj-$(CONFIG_HUGETLBFS)	+= hugetlb.o
+obj-$(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)	+= hugetlb_vmemmap.o
 obj-$(CONFIG_NUMA) 	+= mempolicy.o
 obj-$(CONFIG_SPARSEMEM)	+= sparse.o
 obj-$(CONFIG_SPARSEMEM_VMEMMAP) += sparse-vmemmap.o
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3db405dea3dc..fd39fc94b23f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -41,6 +41,7 @@
 #include <linux/node.h>
 #include <linux/page_owner.h>
 #include "internal.h"
+#include "hugetlb_vmemmap.h"
 
 int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
@@ -1493,8 +1494,9 @@ static void __prep_account_new_huge_page(struct hstate *h, int nid)
 	h->nr_huge_pages_node[nid]++;
 }
 
-static void __prep_new_huge_page(struct page *page)
+static void __prep_new_huge_page(struct hstate *h, struct page *page)
 {
+	free_huge_page_vmemmap(h, page);
 	INIT_LIST_HEAD(&page->lru);
 	set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
 	hugetlb_set_page_subpool(page, NULL);
@@ -1504,7 +1506,7 @@ static void __prep_new_huge_page(struct page *page)
 
 static void prep_new_huge_page(struct hstate *h, struct page *page, int nid)
 {
-	__prep_new_huge_page(page);
+	__prep_new_huge_page(h, page);
 	spin_lock_irq(&hugetlb_lock);
 	__prep_account_new_huge_page(h, nid);
 	spin_unlock_irq(&hugetlb_lock);
@@ -2283,14 +2285,15 @@ static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
 
 	/*
 	 * Before dissolving the page, we need to allocate a new one for the
-	 * pool to remain stable. Using alloc_buddy_huge_page() allows us to
-	 * not having to deal with prep_new_huge_page() and avoids dealing of any
-	 * counters. This simplifies and let us do the whole thing under the
-	 * lock.
+	 * pool to remain stable.  Here, we allocate the page and 'prep' it
+	 * by doing everything but actually updating counters and adding to
+	 * the pool.  This simplifies and let us do most of the processing
+	 * under the lock.
 	 */
 	new_page = alloc_buddy_huge_page(h, gfp_mask, nid, NULL, NULL);
 	if (!new_page)
 		return -ENOMEM;
+	__prep_new_huge_page(h, new_page);
 
 retry:
 	spin_lock_irq(&hugetlb_lock);
@@ -2329,14 +2332,9 @@ static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
 		remove_hugetlb_page(h, old_page, false);
 
 		/*
-		 * new_page needs to be initialized with the standard hugetlb
-		 * state. This is normally done by prep_new_huge_page() but
-		 * that takes hugetlb_lock which is already held so we need to
-		 * open code it here.
 		 * Reference count trick is needed because allocator gives us
 		 * referenced page but the pool requires pages with 0 refcount.
 		 */
-		__prep_new_huge_page(new_page);
 		__prep_account_new_huge_page(h, nid);
 		page_ref_dec(new_page);
 		enqueue_huge_page(h, new_page);
@@ -2352,7 +2350,7 @@ static int alloc_and_dissolve_huge_page(struct hstate *h, struct page *old_page,
 
 free_new:
 	spin_unlock_irq(&hugetlb_lock);
-	__free_pages(new_page, huge_page_order(h));
+	update_and_free_page(h, new_page);
 
 	return ret;
 }
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
new file mode 100644
index 000000000000..e45a138a7f85
--- /dev/null
+++ b/mm/hugetlb_vmemmap.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Free some vmemmap pages of HugeTLB
+ *
+ * Copyright (c) 2020, Bytedance. All rights reserved.
+ *
+ *     Author: Muchun Song <songmuchun@bytedance.com>
+ *
+ * The struct page structures (page structs) are used to describe a physical
+ * page frame. By default, there is a one-to-one mapping from a page frame to
+ * it's corresponding page struct.
+ *
+ * HugeTLB pages consist of multiple base page size pages and is supported by
+ * many architectures. See hugetlbpage.rst in the Documentation directory for
+ * more details. On the x86-64 architecture, HugeTLB pages of size 2MB and 1GB
+ * are currently supported. Since the base page size on x86 is 4KB, a 2MB
+ * HugeTLB page consists of 512 base pages and a 1GB HugeTLB page consists of
+ * 4096 base pages. For each base page, there is a corresponding page struct.
+ *
+ * Within the HugeTLB subsystem, only the first 4 page structs are used to
+ * contain unique information about a HugeTLB page. __NR_USED_SUBPAGE provides
+ * this upper limit. The only 'useful' information in the remaining page structs
+ * is the compound_head field, and this field is the same for all tail pages.
+ *
+ * By removing redundant page structs for HugeTLB pages, memory can be returned
+ * to the buddy allocator for other uses.
+ *
+ * Different architectures support different HugeTLB pages. For example, the
+ * following table is the HugeTLB page size supported by x86 and arm64
+ * architectures. Because arm64 supports 4k, 16k, and 64k base pages and
+ * supports contiguous entries, so it supports many kinds of sizes of HugeTLB
+ * page.
+ *
+ * +--------------+-----------+-----------------------------------------------+
+ * | Architecture | Page Size |                HugeTLB Page Size              |
+ * +--------------+-----------+-----------+-----------+-----------+-----------+
+ * |    x86-64    |    4KB    |    2MB    |    1GB    |           |           |
+ * +--------------+-----------+-----------+-----------+-----------+-----------+
+ * |              |    4KB    |   64KB    |    2MB    |    32MB   |    1GB    |
+ * |              +-----------+-----------+-----------+-----------+-----------+
+ * |    arm64     |   16KB    |    2MB    |   32MB    |     1GB   |           |
+ * |              +-----------+-----------+-----------+-----------+-----------+
+ * |              |   64KB    |    2MB    |  512MB    |    16GB   |           |
+ * +--------------+-----------+-----------+-----------+-----------+-----------+
+ *
+ * When the system boot up, every HugeTLB page has more than one struct page
+ * structs which size is (unit: pages):
+ *
+ *    struct_size = HugeTLB_Size / PAGE_SIZE * sizeof(struct page) / PAGE_SIZE
+ *
+ * Where HugeTLB_Size is the size of the HugeTLB page. We know that the size
+ * of the HugeTLB page is always n times PAGE_SIZE. So we can get the following
+ * relationship.
+ *
+ *    HugeTLB_Size = n * PAGE_SIZE
+ *
+ * Then,
+ *
+ *    struct_size = n * PAGE_SIZE / PAGE_SIZE * sizeof(struct page) / PAGE_SIZE
+ *                = n * sizeof(struct page) / PAGE_SIZE
+ *
+ * We can use huge mapping at the pud/pmd level for the HugeTLB page.
+ *
+ * For the HugeTLB page of the pmd level mapping, then
+ *
+ *    struct_size = n * sizeof(struct page) / PAGE_SIZE
+ *                = PAGE_SIZE / sizeof(pte_t) * sizeof(struct page) / PAGE_SIZE
+ *                = sizeof(struct page) / sizeof(pte_t)
+ *                = 64 / 8
+ *                = 8 (pages)
+ *
+ * Where n is how many pte entries which one page can contains. So the value of
+ * n is (PAGE_SIZE / sizeof(pte_t)).
+ *
+ * This optimization only supports 64-bit system, so the value of sizeof(pte_t)
+ * is 8. And this optimization also applicable only when the size of struct page
+ * is a power of two. In most cases, the size of struct page is 64 bytes (e.g.
+ * x86-64 and arm64). So if we use pmd level mapping for a HugeTLB page, the
+ * size of struct page structs of it is 8 page frames which size depends on the
+ * size of the base page.
+ *
+ * For the HugeTLB page of the pud level mapping, then
+ *
+ *    struct_size = PAGE_SIZE / sizeof(pmd_t) * struct_size(pmd)
+ *                = PAGE_SIZE / 8 * 8 (pages)
+ *                = PAGE_SIZE (pages)
+ *
+ * Where the struct_size(pmd) is the size of the struct page structs of a
+ * HugeTLB page of the pmd level mapping.
+ *
+ * E.g.: A 2MB HugeTLB page on x86_64 consists in 8 page frames while 1GB
+ * HugeTLB page consists in 4096.
+ *
+ * Next, we take the pmd level mapping of the HugeTLB page as an example to
+ * show the internal implementation of this optimization. There are 8 pages
+ * struct page structs associated with a HugeTLB page which is pmd mapped.
+ *
+ * Here is how things look before optimization.
+ *
+ *    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
+ * +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
+ * |           |                     |     0     | -------------> |     0     |
+ * |           |                     +-----------+                +-----------+
+ * |           |                     |     1     | -------------> |     1     |
+ * |           |                     +-----------+                +-----------+
+ * |           |                     |     2     | -------------> |     2     |
+ * |           |                     +-----------+                +-----------+
+ * |           |                     |     3     | -------------> |     3     |
+ * |           |                     +-----------+                +-----------+
+ * |           |                     |     4     | -------------> |     4     |
+ * |    PMD    |                     +-----------+                +-----------+
+ * |   level   |                     |     5     | -------------> |     5     |
+ * |  mapping  |                     +-----------+                +-----------+
+ * |           |                     |     6     | -------------> |     6     |
+ * |           |                     +-----------+                +-----------+
+ * |           |                     |     7     | -------------> |     7     |
+ * |           |                     +-----------+                +-----------+
+ * |           |
+ * |           |
+ * |           |
+ * +-----------+
+ *
+ * The value of page->compound_head is the same for all tail pages. The first
+ * page of page structs (page 0) associated with the HugeTLB page contains the 4
+ * page structs necessary to describe the HugeTLB. The only use of the remaining
+ * pages of page structs (page 1 to page 7) is to point to page->compound_head.
+ * Therefore, we can remap pages 2 to 7 to page 1. Only 2 pages of page structs
+ * will be used for each HugeTLB page. This will allow us to free the remaining
+ * 6 pages to the buddy allocator.
+ *
+ * Here is how things look after remapping.
+ *
+ *    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
+ * +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
+ * |           |                     |     0     | -------------> |     0     |
+ * |           |                     +-----------+                +-----------+
+ * |           |                     |     1     | -------------> |     1     |
+ * |           |                     +-----------+                +-----------+
+ * |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
+ * |           |                     +-----------+                   | | | | |
+ * |           |                     |     3     | ------------------+ | | | |
+ * |           |                     +-----------+                     | | | |
+ * |           |                     |     4     | --------------------+ | | |
+ * |    PMD    |                     +-----------+                       | | |
+ * |   level   |                     |     5     | ----------------------+ | |
+ * |  mapping  |                     +-----------+                         | |
+ * |           |                     |     6     | ------------------------+ |
+ * |           |                     +-----------+                           |
+ * |           |                     |     7     | --------------------------+
+ * |           |                     +-----------+
+ * |           |
+ * |           |
+ * |           |
+ * +-----------+
+ *
+ * When a HugeTLB is freed to the buddy system, we should allocate 6 pages for
+ * vmemmap pages and restore the previous mapping relationship.
+ *
+ * For the HugeTLB page of the pud level mapping. It is similar to the former.
+ * We also can use this approach to free (PAGE_SIZE - 2) vmemmap pages.
+ *
+ * Apart from the HugeTLB page of the pmd/pud level mapping, some architectures
+ * (e.g. aarch64) provides a contiguous bit in the translation table entries
+ * that hints to the MMU to indicate that it is one of a contiguous set of
+ * entries that can be cached in a single TLB entry.
+ *
+ * The contiguous bit is used to increase the mapping size at the pmd and pte
+ * (last) level. So this type of HugeTLB page can be optimized only when its
+ * size of the struct page structs is greater than 2 pages.
+ */
+#include "hugetlb_vmemmap.h"
+
+/*
+ * There are a lot of struct page structures associated with each HugeTLB page.
+ * For tail pages, the value of compound_head is the same. So we can reuse first
+ * page of tail page structures. We map the virtual addresses of the remaining
+ * pages of tail page structures to the first tail page struct, and then free
+ * these page frames. Therefore, we need to reserve two pages as vmemmap areas.
+ */
+#define RESERVE_VMEMMAP_NR		2U
+#define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
+
+/*
+ * How many vmemmap pages associated with a HugeTLB page that can be freed
+ * to the buddy allocator.
+ *
+ * Todo: Returns zero for now, which means the feature is disabled. We will
+ * enable it once all the infrastructure is there.
+ */
+static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return 0;
+}
+
+static inline unsigned long free_vmemmap_pages_size_per_hpage(struct hstate *h)
+{
+	return (unsigned long)free_vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
+}
+
+void free_huge_page_vmemmap(struct hstate *h, struct page *head)
+{
+	unsigned long vmemmap_addr = (unsigned long)head;
+	unsigned long vmemmap_end, vmemmap_reuse;
+
+	if (!free_vmemmap_pages_per_hpage(h))
+		return;
+
+	vmemmap_addr += RESERVE_VMEMMAP_SIZE;
+	vmemmap_end = vmemmap_addr + free_vmemmap_pages_size_per_hpage(h);
+	vmemmap_reuse = vmemmap_addr - PAGE_SIZE;
+
+	/*
+	 * Remap the vmemmap virtual address range [@vmemmap_addr, @vmemmap_end)
+	 * to the page which @vmemmap_reuse is mapped to, then free the pages
+	 * which the range [@vmemmap_addr, @vmemmap_end] is mapped to.
+	 */
+	vmemmap_remap_free(vmemmap_addr, vmemmap_end, vmemmap_reuse);
+}
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
new file mode 100644
index 000000000000..6923f03534d5
--- /dev/null
+++ b/mm/hugetlb_vmemmap.h
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Free some vmemmap pages of HugeTLB
+ *
+ * Copyright (c) 2020, Bytedance. All rights reserved.
+ *
+ *     Author: Muchun Song <songmuchun@bytedance.com>
+ */
+#ifndef _LINUX_HUGETLB_VMEMMAP_H
+#define _LINUX_HUGETLB_VMEMMAP_H
+#include <linux/hugetlb.h>
+
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+void free_huge_page_vmemmap(struct hstate *h, struct page *head);
+#else
+static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
+{
+}
+#endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
+#endif /* _LINUX_HUGETLB_VMEMMAP_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 16183d85a7d5..7d40b5bd7046 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -27,8 +27,202 @@
 #include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 #include <linux/sched.h>
+#include <linux/pgtable.h>
+#include <linux/bootmem_info.h>
+
 #include <asm/dma.h>
 #include <asm/pgalloc.h>
+#include <asm/tlbflush.h>
+
+/**
+ * vmemmap_remap_walk - walk vmemmap page table
+ *
+ * @remap_pte:		called for each lowest-level entry (PTE).
+ * @reuse_page:		the page which is reused for the tail vmemmap pages.
+ * @reuse_addr:		the virtual address of the @reuse_page page.
+ * @vmemmap_pages:	the list head of the vmemmap pages that can be freed.
+ */
+struct vmemmap_remap_walk {
+	void (*remap_pte)(pte_t *pte, unsigned long addr,
+			  struct vmemmap_remap_walk *walk);
+	struct page *reuse_page;
+	unsigned long reuse_addr;
+	struct list_head *vmemmap_pages;
+};
+
+static void vmemmap_pte_range(pmd_t *pmd, unsigned long addr,
+			      unsigned long end,
+			      struct vmemmap_remap_walk *walk)
+{
+	pte_t *pte = pte_offset_kernel(pmd, addr);
+
+	/*
+	 * The reuse_page is found 'first' in table walk before we start
+	 * remapping (which is calling @walk->remap_pte).
+	 */
+	if (!walk->reuse_page) {
+		walk->reuse_page = pte_page(*pte);
+		/*
+		 * Because the reuse address is part of the range that we are
+		 * walking, skip the reuse address range.
+		 */
+		addr += PAGE_SIZE;
+		pte++;
+	}
+
+	for (; addr != end; addr += PAGE_SIZE, pte++)
+		walk->remap_pte(pte, addr, walk);
+}
+
+static void vmemmap_pmd_range(pud_t *pud, unsigned long addr,
+			      unsigned long end,
+			      struct vmemmap_remap_walk *walk)
+{
+	pmd_t *pmd;
+	unsigned long next;
+
+	pmd = pmd_offset(pud, addr);
+	do {
+		BUG_ON(pmd_leaf(*pmd));
+
+		next = pmd_addr_end(addr, end);
+		vmemmap_pte_range(pmd, addr, next, walk);
+	} while (pmd++, addr = next, addr != end);
+}
+
+static void vmemmap_pud_range(p4d_t *p4d, unsigned long addr,
+			      unsigned long end,
+			      struct vmemmap_remap_walk *walk)
+{
+	pud_t *pud;
+	unsigned long next;
+
+	pud = pud_offset(p4d, addr);
+	do {
+		next = pud_addr_end(addr, end);
+		vmemmap_pmd_range(pud, addr, next, walk);
+	} while (pud++, addr = next, addr != end);
+}
+
+static void vmemmap_p4d_range(pgd_t *pgd, unsigned long addr,
+			      unsigned long end,
+			      struct vmemmap_remap_walk *walk)
+{
+	p4d_t *p4d;
+	unsigned long next;
+
+	p4d = p4d_offset(pgd, addr);
+	do {
+		next = p4d_addr_end(addr, end);
+		vmemmap_pud_range(p4d, addr, next, walk);
+	} while (p4d++, addr = next, addr != end);
+}
+
+static void vmemmap_remap_range(unsigned long start, unsigned long end,
+				struct vmemmap_remap_walk *walk)
+{
+	unsigned long addr = start;
+	unsigned long next;
+	pgd_t *pgd;
+
+	VM_BUG_ON(!IS_ALIGNED(start, PAGE_SIZE));
+	VM_BUG_ON(!IS_ALIGNED(end, PAGE_SIZE));
+
+	pgd = pgd_offset_k(addr);
+	do {
+		next = pgd_addr_end(addr, end);
+		vmemmap_p4d_range(pgd, addr, next, walk);
+	} while (pgd++, addr = next, addr != end);
+
+	/*
+	 * We only change the mapping of the vmemmap virtual address range
+	 * [@start + PAGE_SIZE, end), so we only need to flush the TLB which
+	 * belongs to the range.
+	 */
+	flush_tlb_kernel_range(start + PAGE_SIZE, end);
+}
+
+/*
+ * Free a vmemmap page. A vmemmap page can be allocated from the memblock
+ * allocator or buddy allocator. If the PG_reserved flag is set, it means
+ * that it allocated from the memblock allocator, just free it via the
+ * free_bootmem_page(). Otherwise, use __free_page().
+ */
+static inline void free_vmemmap_page(struct page *page)
+{
+	if (PageReserved(page))
+		free_bootmem_page(page);
+	else
+		__free_page(page);
+}
+
+/* Free a list of the vmemmap pages */
+static void free_vmemmap_page_list(struct list_head *list)
+{
+	struct page *page, *next;
+
+	list_for_each_entry_safe(page, next, list, lru) {
+		list_del(&page->lru);
+		free_vmemmap_page(page);
+	}
+}
+
+static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
+			      struct vmemmap_remap_walk *walk)
+{
+	/*
+	 * Remap the tail pages as read-only to catch illegal write operation
+	 * to the tail pages.
+	 */
+	pgprot_t pgprot = PAGE_KERNEL_RO;
+	pte_t entry = mk_pte(walk->reuse_page, pgprot);
+	struct page *page = pte_page(*pte);
+
+	list_add(&page->lru, walk->vmemmap_pages);
+	set_pte_at(&init_mm, addr, pte, entry);
+}
+
+/**
+ * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
+ *			to the page which @reuse is mapped to, then free vmemmap
+ *			which the range are mapped to.
+ * @start:	start address of the vmemmap virtual address range that we want
+ *		to remap.
+ * @end:	end address of the vmemmap virtual address range that we want to
+ *		remap.
+ * @reuse:	reuse address.
+ *
+ * Note: This function depends on vmemmap being base page mapped. Please make
+ * sure that we disable PMD mapping of vmemmap pages when calling this function.
+ */
+void vmemmap_remap_free(unsigned long start, unsigned long end,
+			unsigned long reuse)
+{
+	LIST_HEAD(vmemmap_pages);
+	struct vmemmap_remap_walk walk = {
+		.remap_pte	= vmemmap_remap_pte,
+		.reuse_addr	= reuse,
+		.vmemmap_pages	= &vmemmap_pages,
+	};
+
+	/*
+	 * In order to make remapping routine most efficient for the huge pages,
+	 * the routine of vmemmap page table walking has the following rules
+	 * (see more details from the vmemmap_pte_range()):
+	 *
+	 * - The range [@start, @end) and the range [@reuse, @reuse + PAGE_SIZE)
+	 *   should be continuous.
+	 * - The @reuse address is part of the range [@reuse, @end) that we are
+	 *   walking which is passed to vmemmap_remap_range().
+	 * - The @reuse address is the first in the complete range.
+	 *
+	 * So we need to make sure that @start and @reuse meet the above rules.
+	 */
+	BUG_ON(start - reuse != PAGE_SIZE);
+
+	vmemmap_remap_range(reuse, end, &walk);
+	free_vmemmap_page_list(&vmemmap_pages);
+}
 
 /*
  * Allocate a block of memory to be used to back the virtual memory map
-- 
2.11.0

