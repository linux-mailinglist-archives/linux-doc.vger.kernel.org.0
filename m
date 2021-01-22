Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2D42FFB4E
	for <lists+linux-doc@lfdr.de>; Fri, 22 Jan 2021 04:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbhAVDmk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Jan 2021 22:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbhAVDj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 22:39:58 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAB0C0612F2
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:38:02 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id x81so1117612qkb.0
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LhppBrlO+4i70tHv2AjpL8r+Cfd3uOXgnDMjQBn3cUs=;
        b=SouYE8JGuiocsIcwewIe3r8iPD+hl2VQYwcMo9YyDRj/Fk2wLxuld6y7QZmbekTCy2
         yiISfoiwE4yNig4FISwon0mGmpUQwfVIfxV7E27RCeu75vfNIJ3+IUUFD1L1bKKFdP/p
         RpAQVHAGmEZJzjbZRrxrf5uWY4lAr6uAcu2xykZ725EC6rjwdCHUMd/WJ/QS/A+FjhVa
         fIjF52t3Y0HA3H3CsT5rRR7XiF+UtCDhFupRYgiG0NQI8lv8viLBYpdYU9Sw72/+uIxo
         N6J/TYJZKToHHb57rc43TDscJXLw9uuUiTv/U7lBnO3yJasQZfqT/5nPdqTqdHWjX1ex
         Y7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LhppBrlO+4i70tHv2AjpL8r+Cfd3uOXgnDMjQBn3cUs=;
        b=JVNgWTZMjbnHsh4PKLGRTgDs0pNhFEdx97b+7KEiLmGZnfnx9Geu7UPnWaTDq1vJ6X
         46dh3xd0DgfLGne7XtunI3dn+ssUeprqub4By/IArc/rwQk50snJU3s0m7h8tzErQ1jH
         9TUqS+eY2OLRF8IYQ47N3nn6cFfLShzjkmkiraMD6C50bM9rEo+s80Vyx4oN5DK9QqE/
         KdvCLi9HEtCKxuDt4ZPqUesyTN2FlIUom5CmEl3GZnhhQeHlgCY5nufbKAFDNFV/7RBl
         1OVrEdCYvJUhvQ3GDckcLDpEsfES4aLDBT8f/0tQuaPRL4XJeDL+2PD9lrbeT/Wx4Zp5
         pfvg==
X-Gm-Message-State: AOAM532R0COz+mMuvEJVVizAhSnTu/mSRqaoNU+fifny68xBEhswL6Gm
        IbmI/2EVCh+nvH/WL9KBVfZUkQ==
X-Google-Smtp-Source: ABdhPJz/WawwMeKZd375HvAQc6RmTgsr7kP/60Shm6Ta1AqYLYFdueS+cDAtRRk6d35P5yCzvcFmmg==
X-Received: by 2002:a37:aa42:: with SMTP id t63mr2990363qke.271.1611286682172;
        Thu, 21 Jan 2021 19:38:02 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id m85sm5426529qke.33.2021.01.21.19.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 19:38:01 -0800 (PST)
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
Subject: [PATCH v7 07/14] mm: honor PF_MEMALLOC_PIN for all movable pages
Date:   Thu, 21 Jan 2021 22:37:41 -0500
Message-Id: <20210122033748.924330-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122033748.924330-1-pasha.tatashin@soleen.com>
References: <20210122033748.924330-1-pasha.tatashin@soleen.com>
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
index 2d79e515a7a3..77098492a2fd 100644
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
index c93e801a45e9..3f17c73ad582 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3807,16 +3807,13 @@ alloc_flags_nofragment(struct zone *zone, gfp_t gfp_mask)
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
@@ -4472,7 +4469,7 @@ gfp_to_alloc_flags(gfp_t gfp_mask)
 	} else if (unlikely(rt_task(current)) && !in_interrupt())
 		alloc_flags |= ALLOC_HARDER;
 
-	alloc_flags = current_alloc_flags(gfp_mask, alloc_flags);
+	alloc_flags = gpf_to_alloc_flags(gfp_mask, alloc_flags);
 
 	return alloc_flags;
 }
@@ -4774,7 +4771,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 
 	reserve_flags = __gfp_pfmemalloc_flags(gfp_mask);
 	if (reserve_flags)
-		alloc_flags = current_alloc_flags(gfp_mask, reserve_flags);
+		alloc_flags = gpf_to_alloc_flags(gfp_mask, reserve_flags);
 
 	/*
 	 * Reset the nodemask and zonelist iterators if memory policies can be
@@ -4943,7 +4940,7 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
 	if (should_fail_alloc_page(gfp_mask, order))
 		return false;
 
-	*alloc_flags = current_alloc_flags(gfp_mask, *alloc_flags);
+	*alloc_flags = gpf_to_alloc_flags(gfp_mask, *alloc_flags);
 
 	/* Dirty zone balancing only done in the fast path */
 	ac->spread_dirty_pages = (gfp_mask & __GFP_WRITE);
@@ -4985,7 +4982,8 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
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

