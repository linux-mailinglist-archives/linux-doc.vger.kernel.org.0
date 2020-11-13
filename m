Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77B42B19DE
	for <lists+linux-doc@lfdr.de>; Fri, 13 Nov 2020 12:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgKMLQz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Nov 2020 06:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgKMLDH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:03:07 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43183C08E861
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:02:39 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 10so7338264pfp.5
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LKuqtFH5JUlrHA7PzKF4ebsglGxF2PGetuaoo/F+Ffc=;
        b=ZUTFcF+BuGjHrqfKr2XgoxuSlbd8ad3D7D8iyRxSENEQlUwf337yPvgLUVuj+g1akk
         SLc5WMKOImbtl0ofAU3lSieeA4ivN4aEEHgMIT6P43lFWdXBvyLMbuU0tlVm7grU+Iui
         d7BfC17I+ggEYcKzMw11dgML2Mf5TJvzD03ipzppfdh2Z0K0ar2SXGE3SFyab1KiltmD
         p8XCNFt5y63AzKkTGiZ18H8QG7Of0sT4HkX+//jmVXCqN5L05qP/JsnES2syVKpyRaZG
         KQ9Zb3Z/wRjSaj04eWlmtidODg+ckjeVGBzH8tpIRAuMilNsfsMIquUol0A13YUjHgyT
         zUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKuqtFH5JUlrHA7PzKF4ebsglGxF2PGetuaoo/F+Ffc=;
        b=JQO9zKHzNMKjBbakz1HuYPyvy4wl6C/C7WqAubTxc8uWGgHLlaufN4vxhLgAsFpY5o
         LnprxpQClM5xIWR5Aq3UzWndONu9lp2Co8jn/QjInmXZ14bhroP13doitpmHmcnCuTAj
         qJ78A9QXV1s9O5D4u2L1GAv87qngf22nsGUo45VgeS3hxjL1G61s55aot0SXqOO854kX
         X5DOaR2jQPlrJTxg7zpOvUnsgRuNsIHPiVxWMQzFMXfcval/ahcIhmfA7lJAHvquhmaK
         S2rUHTWUZhSzYxylu6EH0uVvwgHjAj4G5Cq1P0lZk2BZjoLvuj1By2h1DzJswD/aleyi
         /wGQ==
X-Gm-Message-State: AOAM533xAcfvmXaGHAoTpsv23yLTjX1jDbidcidp8w63l8tkdqPhW7NE
        kpmGCd4Qb50eRahZ2uhuIS6Hng==
X-Google-Smtp-Source: ABdhPJwswcq2YGe+gBHL4WweZ2D9gwxnBPuKfclhMp1MUE9U8mn2gENKmBSoHj3FmdgtBMhuVwu6eQ==
X-Received: by 2002:a63:eb4a:: with SMTP id b10mr1693417pgk.416.1605265358779;
        Fri, 13 Nov 2020 03:02:38 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.02.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:02:38 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 09/21] mm/hugetlb: Free the vmemmap pages associated with each hugetlb page
Date:   Fri, 13 Nov 2020 18:59:40 +0800
Message-Id: <20201113105952.11638-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we allocate a hugetlb page from the buddy, we should free the
unused vmemmap pages associated with it. We can do that in the
prep_new_huge_page().

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/include/asm/hugetlb.h          |   9 ++
 arch/x86/include/asm/pgtable_64_types.h |   8 ++
 mm/hugetlb.c                            |  16 +++
 mm/hugetlb_vmemmap.c                    | 188 ++++++++++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h                    |   5 +
 5 files changed, 226 insertions(+)

diff --git a/arch/x86/include/asm/hugetlb.h b/arch/x86/include/asm/hugetlb.h
index 1721b1aadeb1..c601fe042832 100644
--- a/arch/x86/include/asm/hugetlb.h
+++ b/arch/x86/include/asm/hugetlb.h
@@ -4,6 +4,15 @@
 
 #include <asm/page.h>
 #include <asm-generic/hugetlb.h>
+#include <asm/pgtable.h>
+
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+#define vmemmap_pmd_huge vmemmap_pmd_huge
+static inline bool vmemmap_pmd_huge(pmd_t *pmd)
+{
+	return pmd_large(*pmd);
+}
+#endif
 
 #define hugepages_supported() boot_cpu_has(X86_FEATURE_PSE)
 
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 52e5f5f2240d..bedbd2e7d06c 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -139,6 +139,14 @@ extern unsigned int ptrs_per_p4d;
 # define VMEMMAP_START		__VMEMMAP_BASE_L4
 #endif /* CONFIG_DYNAMIC_MEMORY_LAYOUT */
 
+/*
+ * VMEMMAP_SIZE - allows the whole linear region to be covered by
+ *                a struct page array.
+ */
+#define VMEMMAP_SIZE		(1UL << (__VIRTUAL_MASK_SHIFT - PAGE_SHIFT - \
+					 1 + ilog2(sizeof(struct page))))
+#define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
+
 #define VMALLOC_END		(VMALLOC_START + (VMALLOC_SIZE_TB << 40) - 1)
 
 #define MODULES_VADDR		(__START_KERNEL_map + KERNEL_IMAGE_SIZE)
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f88032c24667..a0ce6f33a717 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1499,6 +1499,14 @@ void free_huge_page(struct page *page)
 
 static void prep_new_huge_page(struct hstate *h, struct page *page, int nid)
 {
+	free_huge_page_vmemmap(h, page);
+	/*
+	 * Because we store preallocated pages on @page->lru,
+	 * vmemmap_pgtable_free() must be called before the
+	 * initialization of @page->lru in INIT_LIST_HEAD().
+	 */
+	vmemmap_pgtable_free(page);
+
 	INIT_LIST_HEAD(&page->lru);
 	set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
 	set_hugetlb_cgroup(page, NULL);
@@ -1751,6 +1759,14 @@ static struct page *alloc_fresh_huge_page(struct hstate *h,
 	if (!page)
 		return NULL;
 
+	if (vmemmap_pgtable_prealloc(h, page)) {
+		if (hstate_is_gigantic(h))
+			free_gigantic_page(page, huge_page_order(h));
+		else
+			put_page(page);
+		return NULL;
+	}
+
 	if (hstate_is_gigantic(h))
 		prep_compound_gigantic_page(page, huge_page_order(h));
 	prep_new_huge_page(h, page, page_to_nid(page));
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 332c131c01a8..937562a15f1e 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -74,6 +74,7 @@
 #include <linux/pagewalk.h>
 #include <linux/mmzone.h>
 #include <linux/list.h>
+#include <linux/bootmem_info.h>
 #include <asm/pgalloc.h>
 #include "hugetlb_vmemmap.h"
 
@@ -86,6 +87,8 @@
  * reserve at least 2 pages as vmemmap areas.
  */
 #define RESERVE_VMEMMAP_NR		2U
+#define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
+#define TAIL_PAGE_REUSE			-1
 
 #ifndef VMEMMAP_HPAGE_SHIFT
 #define VMEMMAP_HPAGE_SHIFT		HPAGE_SHIFT
@@ -97,6 +100,21 @@
 
 #define page_huge_pte(page)		((page)->pmd_huge_pte)
 
+#define vmemmap_hpage_addr_end(addr, end)				 \
+({									 \
+	unsigned long __boundary;					 \
+	__boundary = ((addr) + VMEMMAP_HPAGE_SIZE) & VMEMMAP_HPAGE_MASK; \
+	(__boundary - 1 < (end) - 1) ? __boundary : (end);		 \
+})
+
+#ifndef vmemmap_pmd_huge
+#define vmemmap_pmd_huge vmemmap_pmd_huge
+static inline bool vmemmap_pmd_huge(pmd_t *pmd)
+{
+	return pmd_huge(*pmd);
+}
+#endif
+
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
 	return h->nr_free_vmemmap_pages;
@@ -158,6 +176,176 @@ int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
 	return -ENOMEM;
 }
 
+/*
+ * Walk a vmemmap address to the pmd it maps.
+ */
+static pmd_t *vmemmap_to_pmd(unsigned long page)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	if (page < VMEMMAP_START || page >= VMEMMAP_END)
+		return NULL;
+
+	pgd = pgd_offset_k(page);
+	if (pgd_none(*pgd))
+		return NULL;
+	p4d = p4d_offset(pgd, page);
+	if (p4d_none(*p4d))
+		return NULL;
+	pud = pud_offset(p4d, page);
+
+	if (pud_none(*pud) || pud_bad(*pud))
+		return NULL;
+	pmd = pmd_offset(pud, page);
+
+	return pmd;
+}
+
+static inline spinlock_t *vmemmap_pmd_lock(pmd_t *pmd)
+{
+	return pmd_lock(&init_mm, pmd);
+}
+
+static inline int freed_vmemmap_hpage(struct page *page)
+{
+	return atomic_read(&page->_mapcount) + 1;
+}
+
+static inline int freed_vmemmap_hpage_inc(struct page *page)
+{
+	return atomic_inc_return_relaxed(&page->_mapcount) + 1;
+}
+
+static inline int freed_vmemmap_hpage_dec(struct page *page)
+{
+	return atomic_dec_return_relaxed(&page->_mapcount) + 1;
+}
+
+static inline void free_vmemmap_page_list(struct list_head *list)
+{
+	struct page *page, *next;
+
+	list_for_each_entry_safe(page, next, list, lru) {
+		list_del(&page->lru);
+		free_vmemmap_page(page);
+	}
+}
+
+static void __free_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
+					 unsigned long start,
+					 unsigned long end,
+					 struct list_head *free_pages)
+{
+	/* Make the tail pages are mapped read-only. */
+	pgprot_t pgprot = PAGE_KERNEL_RO;
+	pte_t entry = mk_pte(reuse, pgprot);
+	unsigned long addr;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE, ptep++) {
+		struct page *page;
+		pte_t old = *ptep;
+
+		VM_WARN_ON(!pte_present(old));
+		page = pte_page(old);
+		list_add(&page->lru, free_pages);
+
+		set_pte_at(&init_mm, addr, ptep, entry);
+	}
+}
+
+static void __free_huge_page_pmd_vmemmap(struct hstate *h, pmd_t *pmd,
+					 unsigned long addr,
+					 struct list_head *free_pages)
+{
+	unsigned long next;
+	unsigned long start = addr + RESERVE_VMEMMAP_SIZE;
+	unsigned long end = addr + vmemmap_pages_size_per_hpage(h);
+	struct page *reuse = NULL;
+
+	addr = start;
+	do {
+		pte_t *ptep;
+
+		ptep = pte_offset_kernel(pmd, addr);
+		if (!reuse)
+			reuse = pte_page(ptep[TAIL_PAGE_REUSE]);
+
+		next = vmemmap_hpage_addr_end(addr, end);
+		__free_huge_page_pte_vmemmap(reuse, ptep, addr, next,
+					     free_pages);
+	} while (pmd++, addr = next, addr != end);
+
+	flush_tlb_kernel_range(start, end);
+}
+
+static void split_vmemmap_pmd(pmd_t *pmd, pte_t *pte_p, unsigned long addr)
+{
+	int i;
+	pgprot_t pgprot = PAGE_KERNEL;
+	struct mm_struct *mm = &init_mm;
+	struct page *page;
+	pmd_t old_pmd, _pmd;
+
+	old_pmd = READ_ONCE(*pmd);
+	page = pmd_page(old_pmd);
+	pmd_populate_kernel(mm, &_pmd, pte_p);
+
+	for (i = 0; i < VMEMMAP_HPAGE_NR; i++, addr += PAGE_SIZE) {
+		pte_t entry, *pte;
+
+		entry = mk_pte(page + i, pgprot);
+		pte = pte_offset_kernel(&_pmd, addr);
+		VM_BUG_ON(!pte_none(*pte));
+		set_pte_at(mm, addr, pte, entry);
+	}
+
+	/* make pte visible before pmd */
+	smp_wmb();
+	pmd_populate_kernel(mm, pmd, pte_p);
+}
+
+static void split_vmemmap_huge_page(struct page *head, pmd_t *pmd)
+{
+	struct page *pte_page, *t_page;
+	unsigned long start = (unsigned long)head & VMEMMAP_HPAGE_MASK;
+	unsigned long addr = start;
+
+	list_for_each_entry_safe(pte_page, t_page, &head->lru, lru) {
+		list_del(&pte_page->lru);
+		VM_BUG_ON(freed_vmemmap_hpage(pte_page));
+		split_vmemmap_pmd(pmd++, page_to_virt(pte_page), addr);
+		addr += VMEMMAP_HPAGE_SIZE;
+	}
+
+	flush_tlb_kernel_range(start, addr);
+}
+
+void free_huge_page_vmemmap(struct hstate *h, struct page *head)
+{
+	pmd_t *pmd;
+	spinlock_t *ptl;
+	LIST_HEAD(free_pages);
+
+	if (!free_vmemmap_pages_per_hpage(h))
+		return;
+
+	pmd = vmemmap_to_pmd((unsigned long)head);
+	BUG_ON(!pmd);
+
+	ptl = vmemmap_pmd_lock(pmd);
+	if (vmemmap_pmd_huge(pmd))
+		split_vmemmap_huge_page(head, pmd);
+
+	__free_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &free_pages);
+	freed_vmemmap_hpage_inc(pmd_page(*pmd));
+	spin_unlock(ptl);
+
+	free_vmemmap_page_list(&free_pages);
+}
+
 void __init hugetlb_vmemmap_init(struct hstate *h)
 {
 	unsigned int order = huge_page_order(h);
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 2a72d2f62411..fb8b77659ed5 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -15,6 +15,7 @@
 void __init hugetlb_vmemmap_init(struct hstate *h);
 int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page);
 void vmemmap_pgtable_free(struct page *page);
+void free_huge_page_vmemmap(struct hstate *h, struct page *head);
 #else
 static inline void hugetlb_vmemmap_init(struct hstate *h)
 {
@@ -28,5 +29,9 @@ static inline int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
 static inline void vmemmap_pgtable_free(struct page *page)
 {
 }
+
+static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
+{
+}
 #endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
 #endif /* _LINUX_HUGETLB_VMEMMAP_H */
-- 
2.11.0

