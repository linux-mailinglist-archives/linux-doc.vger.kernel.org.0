Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749EF2C87BB
	for <lists+linux-doc@lfdr.de>; Mon, 30 Nov 2020 16:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgK3PVh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 30 Nov 2020 10:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgK3PVg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 10:21:36 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291E0C061A53
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:43 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id b23so6642701pls.11
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RkVD+tIIcGq8uk7UUXY/r8WAVAANQ80hGY01fp0h5bk=;
        b=tFn+c3VjioSOHCr964CgLu2WRqEefb1+MsMzNtRVQIXVkgJR05BB4Rm5NcG9/yQZPm
         WbTxp3S3EiNpH1jrsOxjbrguBoIvcO2F+Exdz5WOa2jwc658gSbHIyyqKcM58tWMzJ3E
         Wwzz5qnNt1dDH/bNOtqxDeBkL9eiOVd6JevNcODNQuHWOoQWLV2cldtdRARETHj9djux
         eaDDozm2LRK9qd/+hdoVBuhvBRv9zOGC7jFPUDJIVfioy1S2kBOHjrc6dnYVKLs88WOC
         mmPBjBId69PNLeKpwQoB+8CuKV5rIcOHFqxdoEivESzDjFWUSV1uJEyyV9i0KVDEuEjh
         iDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RkVD+tIIcGq8uk7UUXY/r8WAVAANQ80hGY01fp0h5bk=;
        b=YGJODJkrDnfI/IXgQQ4+xJrtLdNgqGa9JwpDtPdAVeiXdCiYOu4EXY9lLL0yT6EsnW
         ygJd4pq0bmqB4PlDNJc9Q74a0Thv8IgvqkdmSzjEm1+/pFYTfYZ4Eql5lJFAVHq9rWCO
         IoiilU05uLEqzejd4D49/qAXrUHpSJpHJjv5CPS9NMYQOnx2jyjyuPs5cGHRooIzCO23
         kRuMMIwiTXni65SfGCvPKqEwUR9IK7BYGo/QvvWXYTyZ0MFsy+iRP4mp/0wnM+5izlzX
         PQLzDN0Q4IYSljRl4G94YF4DkC1piuqQfGDXSfZYtEExCkGZQ5AnLjF+fGz8Ns07xZxt
         NBvA==
X-Gm-Message-State: AOAM533q35iLthpnI+2+hR1reHvkDsQSbLGcbrm9XCZC3LkFhH//A1Xu
        5yvo3vBGZ30O7s5vOxE5aXE+qg==
X-Google-Smtp-Source: ABdhPJzdWMfRfBPKpEyzMcRxRaxu8dO8VJT47TRaHQ99n5CsBVl0VLqMpVPhlQUOXIeAHZZglSaSxA==
X-Received: by 2002:a17:90a:154a:: with SMTP id y10mr27051394pja.6.1606749642731;
        Mon, 30 Nov 2020 07:20:42 -0800 (PST)
Received: from localhost.bytedance.net ([103.136.221.68])
        by smtp.gmail.com with ESMTPSA id q12sm16201660pgv.91.2020.11.30.07.20.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 07:20:42 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 08/15] mm/hugetlb: Free the vmemmap pages associated with each hugetlb page
Date:   Mon, 30 Nov 2020 23:18:31 +0800
Message-Id: <20201130151838.11208-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201130151838.11208-1-songmuchun@bytedance.com>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
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
 mm/hugetlb.c         |   2 +
 mm/hugetlb_vmemmap.c | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h |   5 ++
 3 files changed, 146 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 25f9e8e9fc4a..93dee37ceb6d 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1498,6 +1498,8 @@ void free_huge_page(struct page *page)
 
 static void prep_new_huge_page(struct hstate *h, struct page *page, int nid)
 {
+	free_huge_page_vmemmap(h, page);
+
 	INIT_LIST_HEAD(&page->lru);
 	set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
 	set_hugetlb_cgroup(page, NULL);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ad8fc61ea273..2c997b5de3b6 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -94,6 +94,7 @@
  */
 #define pr_fmt(fmt)	"HugeTLB vmemmap: " fmt
 
+#include <linux/bootmem_info.h>
 #include "hugetlb_vmemmap.h"
 
 /*
@@ -105,6 +106,144 @@
  * these page frames. Therefore, we need to reserve two pages as vmemmap areas.
  */
 #define RESERVE_VMEMMAP_NR		2U
+#define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
+#define VMEMMAP_TAIL_PAGE_REUSE		-1
+
+#ifndef VMEMMAP_HPAGE_SHIFT
+#define VMEMMAP_HPAGE_SHIFT		HPAGE_SHIFT
+#endif
+#define VMEMMAP_HPAGE_ORDER		(VMEMMAP_HPAGE_SHIFT - PAGE_SHIFT)
+#define VMEMMAP_HPAGE_NR		(1 << VMEMMAP_HPAGE_ORDER)
+#define VMEMMAP_HPAGE_SIZE		(1UL << VMEMMAP_HPAGE_SHIFT)
+#define VMEMMAP_HPAGE_MASK		(~(VMEMMAP_HPAGE_SIZE - 1))
+
+#define vmemmap_hpage_addr_end(addr, end)				 \
+({									 \
+	unsigned long __boundary;					 \
+	__boundary = ((addr) + VMEMMAP_HPAGE_SIZE) & VMEMMAP_HPAGE_MASK; \
+	(__boundary - 1 < (end) - 1) ? __boundary : (end);		 \
+})
+
+static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return h->nr_free_vmemmap_pages;
+}
+
+static inline unsigned int vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return free_vmemmap_pages_per_hpage(h) + RESERVE_VMEMMAP_NR;
+}
+
+static inline unsigned long vmemmap_pages_size_per_hpage(struct hstate *h)
+{
+	return (unsigned long)vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
+}
+
+/*
+ * Walk a vmemmap address to the pmd it maps.
+ */
+static pmd_t *vmemmap_to_pmd(unsigned long addr)
+{
+	pgd_t *pgd;
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	pgd = pgd_offset_k(addr);
+	if (pgd_none(*pgd))
+		return NULL;
+
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d))
+		return NULL;
+
+	pud = pud_offset(p4d, addr);
+	if (pud_none(*pud))
+		return NULL;
+
+	pmd = pmd_offset(pud, addr);
+	if (pmd_none(*pmd))
+		return NULL;
+
+	return pmd;
+}
+
+static void vmemmap_reuse_pte_range(struct page *reuse, pte_t *pte,
+				    unsigned long start, unsigned long end,
+				    struct list_head *vmemmap_pages)
+{
+	/*
+	 * Make the tail pages are mapped with read-only to catch
+	 * illegal write operation to the tail pages.
+	 */
+	pgprot_t pgprot = PAGE_KERNEL_RO;
+	pte_t entry = mk_pte(reuse, pgprot);
+	unsigned long addr;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE, pte++) {
+		struct page *page;
+
+		VM_BUG_ON(pte_none(*pte));
+
+		page = pte_page(*pte);
+		list_add(&page->lru, vmemmap_pages);
+
+		set_pte_at(&init_mm, addr, pte, entry);
+	}
+}
+
+static void vmemmap_remap_range(unsigned long start, unsigned long end,
+				struct list_head *vmemmap_pages)
+{
+	pmd_t *pmd;
+	unsigned long next, addr = start;
+	struct page *reuse = NULL;
+
+	VM_BUG_ON(!IS_ALIGNED(start, PAGE_SIZE));
+	VM_BUG_ON(!IS_ALIGNED(end, PAGE_SIZE));
+	VM_BUG_ON((start >> PUD_SHIFT) != (end >> PUD_SHIFT));
+
+	pmd = vmemmap_to_pmd(addr);
+	BUG_ON(!pmd);
+
+	do {
+		pte_t *pte = pte_offset_kernel(pmd, addr);
+
+		if (!reuse)
+			reuse = pte_page(pte[VMEMMAP_TAIL_PAGE_REUSE]);
+
+		next = vmemmap_hpage_addr_end(addr, end);
+		vmemmap_reuse_pte_range(reuse, pte, addr, next, vmemmap_pages);
+	} while (pmd++, addr = next, addr != end);
+
+	flush_tlb_kernel_range(start, end);
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
+void free_huge_page_vmemmap(struct hstate *h, struct page *head)
+{
+	unsigned long start, end;
+	unsigned long vmemmap_addr = (unsigned long)head;
+	LIST_HEAD(vmemmap_pages);
+
+	if (!free_vmemmap_pages_per_hpage(h))
+		return;
+
+	start = vmemmap_addr + RESERVE_VMEMMAP_SIZE;
+	end = vmemmap_addr + vmemmap_pages_size_per_hpage(h);
+	vmemmap_remap_range(start, end, &vmemmap_pages);
+
+	free_vmemmap_page_list(&vmemmap_pages);
+}
 
 void __init hugetlb_vmemmap_init(struct hstate *h)
 {
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 40c0c7dfb60d..67113b67495f 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -12,9 +12,14 @@
 
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 void __init hugetlb_vmemmap_init(struct hstate *h);
+void free_huge_page_vmemmap(struct hstate *h, struct page *head);
 #else
 static inline void hugetlb_vmemmap_init(struct hstate *h)
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

