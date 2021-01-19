Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4312FAFAF
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jan 2021 05:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732723AbhASEpR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jan 2021 23:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732826AbhASEmJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 23:42:09 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5EAC0617A1
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:34 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id b64so20773299qkc.12
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S+psy/00zjLWDIb5U7YgLiWenUPpUcZ+bM3vhn2UprU=;
        b=M1QZYVQgqtnxXgltqqs882L29z4fi/bMposSJPxyv0vqG3l7pNCF3ekcfGI1e5PBWT
         s87qFEaN5IUGnHT3VzbtMhjbUyvXF8G8tV82Y1FFNEgZ2PWhtKjaOMXhP8ttr9gsfs07
         AUWcAV9vYtVqNLsFzDMWj/IvHuKYIM18PXQOfzoqwdAkKARp1/X7qSd7sgn3dlXk03bF
         h0PiOsCscTbaNzEAFWzD1bNsdDdrqSf/BiPZXVJsDNGZn85HVgp5cEENn7bhLVYj9cSz
         swnM9wttfrpz41qvq1MHbwxEXHmieYmq8ycijf8YnkRn/V/6/E7ofCNNMmvHgPDPrJqf
         jSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S+psy/00zjLWDIb5U7YgLiWenUPpUcZ+bM3vhn2UprU=;
        b=N4uSXdgR40dgtPw5HcG6v+8tck6dbxjIPnfWd3pcZC+Bg+IArHb0s17yGXmzoVftdj
         5ym0TgWfijmUvB57OaPjgRJcY+Ej9+9wgyP2deU3HfKys3CPTZOluD9sVb0UiqAA2m73
         J7n7AjQLw/NG1X1p+46Xzks2fdXNT3CRNKSpLhoXUIf4J8hTEnMMiNGTJirQZH1AZifT
         qv1Xu/BRAjOQrMn6CAE0Oh4nW8nRdZgpbLtLPpbHwqjbEtn1HBbjUtA1NOY9FjhwQkqu
         XzMQoag3VQGGgOlgfMtcR7Bkz53IFiRzCvYpnv8IMOJeORK/UfKdfDDvQ3RaXIOAQJ5q
         Ydhg==
X-Gm-Message-State: AOAM532q0yy6ZFa5pYQuDz7VtMzcdZKgdfB5lm5Hzz6e2+W0Y/k9QIF2
        B9Sv/LaIeidDEF9GKI5QJLSsmg==
X-Google-Smtp-Source: ABdhPJwbKzZS+7I/6QHJfBcV/hNmqEy11J19NGIIZb6mqucsDunK+wE5pHk0KsChvx5roiZhIuiAMQ==
X-Received: by 2002:a05:620a:2199:: with SMTP id g25mr2744637qka.333.1611031173780;
        Mon, 18 Jan 2021 20:39:33 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id z20sm11934536qkz.37.2021.01.18.20.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 20:39:33 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v5 07/14] mm: honor PF_MEMALLOC_PIN for all movable pages
Date:   Mon, 18 Jan 2021 23:39:13 -0500
Message-Id: <20210119043920.155044-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119043920.155044-1-pasha.tatashin@soleen.com>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PF_MEMALLOC_PIN is only honored for CMA pages, extend
this flag to work for any allocations from ZONE_MOVABLE by removing
__GFP_MOVABLE from gfp_mask when this flag is passed in the current
context.

Add is_pinnable_page() to return true if page is in a pinnable page.
A pinnable page is not in ZONE_MOVABLE and not of MIGRATE_CMA type.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 include/linux/mm.h       | 11 +++++++++++
 include/linux/sched/mm.h |  6 +++++-
 mm/hugetlb.c             |  2 +-
 mm/page_alloc.c          | 20 +++++++++-----------
 4 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a5d618d08506..0990a76d5e6f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1117,6 +1117,17 @@ static inline bool is_zone_device_page(const struct page *page)
 }
 #endif
 
+static inline bool is_zone_movable_page(const struct page *page)
+{
+	return page_zonenum(page) == ZONE_MOVABLE;
+}
+
+/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
+static inline bool is_pinnable_page(struct page *page)
+{
+	return !is_zone_movable_page(page) && !is_migrate_cma_page(page);
+}
+
 #ifdef CONFIG_DEV_PAGEMAP_OPS
 void free_devmap_managed_page(struct page *page);
 DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 5f4dd3274734..a55277b0d475 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -150,12 +150,13 @@ static inline bool in_vfork(struct task_struct *tsk)
  * Applies per-task gfp context to the given allocation flags.
  * PF_MEMALLOC_NOIO implies GFP_NOIO
  * PF_MEMALLOC_NOFS implies GFP_NOFS
+ * PF_MEMALLOC_PIN  implies !GFP_MOVABLE
  */
 static inline gfp_t current_gfp_context(gfp_t flags)
 {
 	unsigned int pflags = READ_ONCE(current->flags);
 
-	if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS))) {
+	if (unlikely(pflags & (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_PIN))) {
 		/*
 		 * NOIO implies both NOIO and NOFS and it is a weaker context
 		 * so always make sure it makes precedence
@@ -164,6 +165,9 @@ static inline gfp_t current_gfp_context(gfp_t flags)
 			flags &= ~(__GFP_IO | __GFP_FS);
 		else if (pflags & PF_MEMALLOC_NOFS)
 			flags &= ~__GFP_FS;
+
+		if (pflags & PF_MEMALLOC_PIN)
+			flags &= ~__GFP_MOVABLE;
 	}
 	return flags;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 006eccfa23d7..7613c4718d24 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1052,7 +1052,7 @@ static struct page *dequeue_huge_page_node_exact(struct hstate *h, int nid)
 	bool pin = !!(current->flags & PF_MEMALLOC_PIN);
 
 	list_for_each_entry(page, &h->hugepage_freelists[nid], lru) {
-		if (pin && is_migrate_cma_page(page))
+		if (pin && !is_pinnable_page(page))
 			continue;
 
 		if (PageHWPoison(page))
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index de9bcd08d002..4dcee3bfd2fe 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3805,16 +3805,13 @@ alloc_flags_nofragment(struct zone *zone, gfp_t gfp_mask)
 	return alloc_flags;
 }
 
-static inline unsigned int current_alloc_flags(gfp_t gfp_mask,
-					unsigned int alloc_flags)
+/* Must be called after current_gfp_context() which can change gfp_mask */
+static inline unsigned int gpf_to_alloc_flags(gfp_t gfp_mask,
+					      unsigned int alloc_flags)
 {
 #ifdef CONFIG_CMA
-	unsigned int pflags = current->flags;
-
-	if (!(pflags & PF_MEMALLOC_PIN) &&
-	    gfp_migratetype(gfp_mask) == MIGRATE_MOVABLE)
+	if (gfp_migratetype(gfp_mask) == MIGRATE_MOVABLE)
 		alloc_flags |= ALLOC_CMA;
-
 #endif
 	return alloc_flags;
 }
@@ -4470,7 +4467,7 @@ gfp_to_alloc_flags(gfp_t gfp_mask)
 	} else if (unlikely(rt_task(current)) && !in_interrupt())
 		alloc_flags |= ALLOC_HARDER;
 
-	alloc_flags = current_alloc_flags(gfp_mask, alloc_flags);
+	alloc_flags = gpf_to_alloc_flags(gfp_mask, alloc_flags);
 
 	return alloc_flags;
 }
@@ -4772,7 +4769,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 
 	reserve_flags = __gfp_pfmemalloc_flags(gfp_mask);
 	if (reserve_flags)
-		alloc_flags = current_alloc_flags(gfp_mask, reserve_flags);
+		alloc_flags = gpf_to_alloc_flags(gfp_mask, reserve_flags);
 
 	/*
 	 * Reset the nodemask and zonelist iterators if memory policies can be
@@ -4941,7 +4938,7 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
 	if (should_fail_alloc_page(gfp_mask, order))
 		return false;
 
-	*alloc_flags = current_alloc_flags(gfp_mask, *alloc_flags);
+	*alloc_flags = gpf_to_alloc_flags(gfp_mask, *alloc_flags);
 
 	/* Dirty zone balancing only done in the fast path */
 	ac->spread_dirty_pages = (gfp_mask & __GFP_WRITE);
@@ -4983,7 +4980,8 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
 	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
 	 * resp. GFP_NOIO which has to be inherited for all allocation requests
 	 * from a particular context which has been marked by
-	 * memalloc_no{fs,io}_{save,restore}.
+	 * memalloc_no{fs,io}_{save,restore}. And PF_MEMALLOC_PIN which ensures
+	 * movable zones are not used during allocation.
 	 */
 	gfp_mask = current_gfp_context(gfp_mask);
 	alloc_mask = gfp_mask;
-- 
2.25.1

