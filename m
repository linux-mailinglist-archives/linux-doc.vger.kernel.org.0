Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1B62B19E7
	for <lists+linux-doc@lfdr.de>; Fri, 13 Nov 2020 12:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgKMLSA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Nov 2020 06:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgKMLDA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:03:00 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77278C061A48
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:02:50 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 10so7338633pfp.5
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vcV5fAWWMBHeyweXdcrSnAyduSHKw3FF3vonlmGtxeQ=;
        b=GkG5ugGo7afFvzcVWG0uVadPXARhWCh67dhbqbpTbmIVZKNqmVIpsFg7CVXFIV3NEo
         RDIzcxfDzAJhEDfgx3xDPKxYuSWL9OhYBLwUnaDCyhbY+QnQQXL0JpCvVCH1lfJ7ZQxA
         ONnJ8/wWPB5aDwAwuD+YcmurfSkwDg8rU9tonjCsdvycvK3/2fQg2DPyXUDNBqRZtr+o
         mhqvplLA7nGcNbAXzwUBDea9GI1QI1zWBEZ6fJ3Eh+RgeaxYcoJoM2IpIQ1hXvJZ1QAu
         5Q9lHOWpXdTaVRef5blqHgWKOa3QhJN8tR870SSqsW1b4xQwm4FqBrubV6xH13Pd9XRN
         CuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vcV5fAWWMBHeyweXdcrSnAyduSHKw3FF3vonlmGtxeQ=;
        b=KViUb1OJZTH3KHS32hZena4P+N0+U9GFhZMUTIMqj9mXySAfnJMeJ5n8g+rLidP8c8
         5YE9D3U5ltbrZ38GGyV8XbtBgxQkjlfqoleXWGre6t7H4u9q1LnbzZkdthN/w3aeUkHG
         ir7rVVTLX0hNhVLCF5oYTnjNoXrRgWuZdyXrRVuftPmqSZaz0TZuFabPUPPAAZhPvKXJ
         +wQX3+wfQB+E8bSRuJJL7FNzl85QPIETmPoJAOG2DR2imQXhU7ycC1uX0v7G42UKC/vZ
         A/snEarrBNCHUkj28qr3xMFq14uR/Ij2qlkBr8w5lqJifMaQp+UO+ALk3YOAg/Exa5eP
         SDjw==
X-Gm-Message-State: AOAM533U3tQ4U4eIillOOP30pQdMOp3cxihSRKhaOyaZc4pKg6zUGZEx
        dxlADpjjNcsKgQbo4ny0O3F9Fw==
X-Google-Smtp-Source: ABdhPJwjl1roJo8W6r9y3YrlPbLX28igbMI2+0vuCQlC05Klj/YC3PratEhWwTn260/jMo9Nr5AoZg==
X-Received: by 2002:a17:90a:6392:: with SMTP id f18mr2295613pjj.143.1605265370011;
        Fri, 13 Nov 2020 03:02:50 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.02.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:02:49 -0800 (PST)
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
Subject: [PATCH v4 10/21] mm/hugetlb: Defer freeing of hugetlb pages
Date:   Fri, 13 Nov 2020 18:59:41 +0800
Message-Id: <20201113105952.11638-11-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the subsequent patch, we will allocate the vmemmap pages when free
huge pages. But update_and_free_page() is be called from a non-task
context(and hold hugetlb_lock), we can defer the actual freeing in
a workqueue to prevent use GFP_ATOMIC to allocate the vmemmap pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c         | 98 +++++++++++++++++++++++++++++++++++++++++++++-------
 mm/hugetlb_vmemmap.c |  5 ---
 mm/hugetlb_vmemmap.h | 10 ++++++
 3 files changed, 96 insertions(+), 17 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a0ce6f33a717..4aabf12aca9b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1221,7 +1221,7 @@ static void destroy_compound_gigantic_page(struct page *page,
 	__ClearPageHead(page);
 }
 
-static void free_gigantic_page(struct page *page, unsigned int order)
+static void __free_gigantic_page(struct page *page, unsigned int order)
 {
 	/*
 	 * If the page isn't allocated using the cma allocator,
@@ -1288,20 +1288,100 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
 {
 	return NULL;
 }
-static inline void free_gigantic_page(struct page *page, unsigned int order) { }
+static inline void __free_gigantic_page(struct page *page,
+					unsigned int order) { }
 static inline void destroy_compound_gigantic_page(struct page *page,
 						unsigned int order) { }
 #endif
 
-static void update_and_free_page(struct hstate *h, struct page *page)
+static void __free_hugepage(struct hstate *h, struct page *page);
+
+/*
+ * As update_and_free_page() is be called from a non-task context(and hold
+ * hugetlb_lock), we can defer the actual freeing in a workqueue to prevent
+ * use GFP_ATOMIC to allocate a lot of vmemmap pages.
+ *
+ * update_hpage_vmemmap_workfn() locklessly retrieves the linked list of
+ * pages to be freed and frees them one-by-one. As the page->mapping pointer
+ * is going to be cleared in update_hpage_vmemmap_workfn() anyway, it is
+ * reused as the llist_node structure of a lockless linked list of huge
+ * pages to be freed.
+ */
+static LLIST_HEAD(hpage_update_freelist);
+
+static void update_hpage_vmemmap_workfn(struct work_struct *work)
 {
-	int i;
+	struct llist_node *node;
+	struct page *page;
+
+	node = llist_del_all(&hpage_update_freelist);
+
+	while (node) {
+		page = container_of((struct address_space **)node,
+				     struct page, mapping);
+		node = node->next;
+		page->mapping = NULL;
+		__free_hugepage(page_hstate(page), page);
 
+		cond_resched();
+	}
+}
+static DECLARE_WORK(hpage_update_work, update_hpage_vmemmap_workfn);
+
+static inline void __update_and_free_page(struct hstate *h, struct page *page)
+{
+	/* No need to allocate vmemmap pages */
+	if (!free_vmemmap_pages_per_hpage(h)) {
+		__free_hugepage(h, page);
+		return;
+	}
+
+	/*
+	 * Defer freeing to avoid using GFP_ATOMIC to allocate vmemmap
+	 * pages.
+	 *
+	 * Only call schedule_work() if hpage_update_freelist is previously
+	 * empty. Otherwise, schedule_work() had been called but the workfn
+	 * hasn't retrieved the list yet.
+	 */
+	if (llist_add((struct llist_node *)&page->mapping,
+		      &hpage_update_freelist))
+		schedule_work(&hpage_update_work);
+}
+
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+static inline void free_gigantic_page(struct hstate *h, struct page *page)
+{
+	__free_gigantic_page(page, huge_page_order(h));
+}
+#else
+static inline void free_gigantic_page(struct hstate *h, struct page *page)
+{
+	/*
+	 * Temporarily drop the hugetlb_lock, because
+	 * we might block in __free_gigantic_page().
+	 */
+	spin_unlock(&hugetlb_lock);
+	__free_gigantic_page(page, huge_page_order(h));
+	spin_lock(&hugetlb_lock);
+}
+#endif
+
+static void update_and_free_page(struct hstate *h, struct page *page)
+{
 	if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
 		return;
 
 	h->nr_huge_pages--;
 	h->nr_huge_pages_node[page_to_nid(page)]--;
+
+	__update_and_free_page(h, page);
+}
+
+static void __free_hugepage(struct hstate *h, struct page *page)
+{
+	int i;
+
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
 				1 << PG_referenced | 1 << PG_dirty |
@@ -1313,14 +1393,8 @@ static void update_and_free_page(struct hstate *h, struct page *page)
 	set_compound_page_dtor(page, NULL_COMPOUND_DTOR);
 	set_page_refcounted(page);
 	if (hstate_is_gigantic(h)) {
-		/*
-		 * Temporarily drop the hugetlb_lock, because
-		 * we might block in free_gigantic_page().
-		 */
-		spin_unlock(&hugetlb_lock);
 		destroy_compound_gigantic_page(page, huge_page_order(h));
-		free_gigantic_page(page, huge_page_order(h));
-		spin_lock(&hugetlb_lock);
+		free_gigantic_page(h, page);
 	} else {
 		__free_pages(page, huge_page_order(h));
 	}
@@ -1761,7 +1835,7 @@ static struct page *alloc_fresh_huge_page(struct hstate *h,
 
 	if (vmemmap_pgtable_prealloc(h, page)) {
 		if (hstate_is_gigantic(h))
-			free_gigantic_page(page, huge_page_order(h));
+			free_gigantic_page(h, page);
 		else
 			put_page(page);
 		return NULL;
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 937562a15f1e..e6fca02b57b2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -115,11 +115,6 @@ static inline bool vmemmap_pmd_huge(pmd_t *pmd)
 }
 #endif
 
-static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
-{
-	return h->nr_free_vmemmap_pages;
-}
-
 static inline unsigned int vmemmap_pages_per_hpage(struct hstate *h)
 {
 	return free_vmemmap_pages_per_hpage(h) + RESERVE_VMEMMAP_NR;
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index fb8b77659ed5..a23fb1375859 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -16,6 +16,11 @@ void __init hugetlb_vmemmap_init(struct hstate *h);
 int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page);
 void vmemmap_pgtable_free(struct page *page);
 void free_huge_page_vmemmap(struct hstate *h, struct page *head);
+
+static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return h->nr_free_vmemmap_pages;
+}
 #else
 static inline void hugetlb_vmemmap_init(struct hstate *h)
 {
@@ -33,5 +38,10 @@ static inline void vmemmap_pgtable_free(struct page *page)
 static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 }
+
+static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return 0;
+}
 #endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
 #endif /* _LINUX_HUGETLB_VMEMMAP_H */
-- 
2.11.0

