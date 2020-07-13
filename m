Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823A421D213
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2020 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgGMIol (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jul 2020 04:44:41 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:43416 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbgGMIol (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jul 2020 04:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1594629878; x=1626165878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=rU3CvFfPBMuvX9oSZ1BXnvzu2fA07tQL0o32BoFqMk0=;
  b=Di4kU1s9gydjjHuKMInfgN+jaa14v4xOr/o8gK8FgWdd8B2Uqw31HQEF
   6AMx11xqTAjSYTffEiYxYGa/w1RkgdkyyixPJWNENaP4tDVGnp/VaTcWO
   8L0UPjdn1+Soh3BX39gvzqorcNXI5TmgPwguXi4TR25uuBVqBc54a34L/
   g=;
IronPort-SDR: rvDQ34zhopTN5GmEwcmUp2qqUwVpxcoj1kvLRO4xH3p6L+/I8DFAzLyl0GWSbjReotr+/1q/4k
 6AqnFeRc7unQ==
X-IronPort-AV: E=Sophos;i="5.75,346,1589241600"; 
   d="scan'208";a="41429766"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 13 Jul 2020 08:44:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS id 35EDDA1FAB;
        Mon, 13 Jul 2020 08:44:28 +0000 (UTC)
Received: from EX13D31EUA004.ant.amazon.com (10.43.165.161) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 13 Jul 2020 08:44:27 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.146) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 13 Jul 2020 08:44:11 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <foersleo@amazon.de>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v18 06/14] mm/damon: Implement callbacks for the virtual memory address spaces
Date:   Mon, 13 Jul 2020 10:41:36 +0200
Message-ID: <20200713084144.4430-7-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713084144.4430-1-sjpark@amazon.com>
References: <20200713084144.4430-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.146]
X-ClientProxiedBy: EX13P01UWA002.ant.amazon.com (10.43.160.46) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit introduces a reference implementation of the address space
specific low level primitives for the virtual address space, so that
users of DAMON can easily monitor the data accesses on virtual address
spaces of specific processes by simply configuring the implementation to
be used by DAMON.

The low level primitives for the fundamental access monitoring are
defined in two parts:
1. Identification of the monitoring target address range for the address
space.
2. Access check of specific address range in the target space.

The reference implementation for the virtual address space provided by
this commit is designed as below.

PTE Accessed-bit Based Access Check
-----------------------------------

The implementation uses PTE Accessed-bit for basic access checks.  That
is, it clears the bit for next sampling target page and checks whether
it set again after one sampling period.  To avoid disturbing other
Accessed bit users such as the reclamation logic, the implementation
adjusts the ``PG_Idle`` and ``PG_Young`` appropriately, as same to the
'Idle Page Tracking'.

VMA-based Target Address Range Construction
-------------------------------------------

Only small parts in the super-huge virtual address space of the
processes are mapped to physical memory and accessed.  Thus, tracking
the unmapped address regions is just wasteful.  However, because DAMON
can deal with some level of noise using the adaptive regions adjustment
mechanism, tracking every mapping is not strictly required but could
even incur a high overhead in some cases.  That said, too huge unmapped
areas inside the monitoring target should be removed to not take the
time for the adaptive mechanism.

For the reason, this implementation converts the complex mappings to
three distinct regions that cover every mapped area of the address
space.  Also, the two gaps between the three regions are the two biggest
unmapped areas in the given address space.  The two biggest unmapped
areas would be the gap between the heap and the uppermost mmap()-ed
region, and the gap between the lowermost mmap()-ed region and the stack
in most of the cases.  Because these gaps are exceptionally huge in
usual address spacees, excluding these will be sufficient to make a
reasonable trade-off.  Below shows this in detail::

    <heap>
    <BIG UNMAPPED REGION 1>
    <uppermost mmap()-ed region>
    (small mmap()-ed regions and munmap()-ed regions)
    <lowermost mmap()-ed region>
    <BIG UNMAPPED REGION 2>
    <stack>

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Leonard Foerster <foersleo@amazon.de>
---
 include/linux/damon.h |   6 +
 mm/damon.c            | 474 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 480 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 3c0b92a679e8..310d36d123b3 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -144,6 +144,12 @@ struct damon_ctx {
 	void (*aggregate_cb)(struct damon_ctx *context);
 };
 
+/* Reference callback implementations for virtual memory */
+void kdamond_init_vm_regions(struct damon_ctx *ctx);
+void kdamond_update_vm_regions(struct damon_ctx *ctx);
+void kdamond_prepare_vm_access_checks(struct damon_ctx *ctx);
+unsigned int kdamond_check_vm_accesses(struct damon_ctx *ctx);
+
 int damon_set_pids(struct damon_ctx *ctx, int *pids, ssize_t nr_pids);
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
 		unsigned long aggr_int, unsigned long regions_update_int,
diff --git a/mm/damon.c b/mm/damon.c
index b844924b9fdb..386780739007 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -9,6 +9,9 @@
  * This file is constructed in below parts.
  *
  * - Functions and macros for DAMON data structures
+ * - Functions for the initial monitoring target regions construction
+ * - Functions for the dynamic monitoring target regions update
+ * - Functions for the access checking of the regions
  * - Functions for DAMON core logics and features
  * - Functions for the DAMON programming interface
  * - Functions for the module loading/unloading
@@ -196,6 +199,477 @@ static unsigned long damon_region_sz_limit(struct damon_ctx *ctx)
 	return sz;
 }
 
+/*
+ * Get the mm_struct of the given task
+ *
+ * Caller _must_ put the mm_struct after use, unless it is NULL.
+ *
+ * Returns the mm_struct of the task on success, NULL on failure
+ */
+static struct mm_struct *damon_get_mm(struct damon_task *t)
+{
+	struct task_struct *task;
+	struct mm_struct *mm;
+
+	task = damon_get_task_struct(t);
+	if (!task)
+		return NULL;
+
+	mm = get_task_mm(task);
+	put_task_struct(task);
+	return mm;
+}
+
+/*
+ * Functions for the initial monitoring target regions construction
+ */
+
+/*
+ * Size-evenly split a region into 'nr_pieces' small regions
+ *
+ * Returns 0 on success, or negative error code otherwise.
+ */
+static int damon_split_region_evenly(struct damon_ctx *ctx,
+		struct damon_region *r, unsigned int nr_pieces)
+{
+	unsigned long sz_orig, sz_piece, orig_end;
+	struct damon_region *n = NULL, *next;
+	unsigned long start;
+
+	if (!r || !nr_pieces)
+		return -EINVAL;
+
+	orig_end = r->ar.end;
+	sz_orig = r->ar.end - r->ar.start;
+	sz_piece = ALIGN_DOWN(sz_orig / nr_pieces, MIN_REGION);
+
+	if (!sz_piece)
+		return -EINVAL;
+
+	r->ar.end = r->ar.start + sz_piece;
+	next = damon_next_region(r);
+	for (start = r->ar.end; start + sz_piece <= orig_end;
+			start += sz_piece) {
+		n = damon_new_region(start, start + sz_piece);
+		if (!n)
+			return -ENOMEM;
+		damon_insert_region(n, r, next);
+		r = n;
+	}
+	/* complement last region for possible rounding error */
+	if (n)
+		n->ar.end = orig_end;
+
+	return 0;
+}
+
+static unsigned long sz_range(struct damon_addr_range *r)
+{
+	return r->end - r->start;
+}
+
+static void swap_ranges(struct damon_addr_range *r1,
+			struct damon_addr_range *r2)
+{
+	struct damon_addr_range tmp;
+
+	tmp = *r1;
+	*r1 = *r2;
+	*r2 = tmp;
+}
+
+/*
+ * Find three regions separated by two biggest unmapped regions
+ *
+ * vma		the head vma of the target address space
+ * regions	an array of three address ranges that results will be saved
+ *
+ * This function receives an address space and finds three regions in it which
+ * separated by the two biggest unmapped regions in the space.  Please refer to
+ * below comments of 'damon_init_vm_regions_of()' function to know why this is
+ * necessary.
+ *
+ * Returns 0 if success, or negative error code otherwise.
+ */
+static int damon_three_regions_in_vmas(struct vm_area_struct *vma,
+				       struct damon_addr_range regions[3])
+{
+	struct damon_addr_range gap = {0}, first_gap = {0}, second_gap = {0};
+	struct vm_area_struct *last_vma = NULL;
+	unsigned long start = 0;
+	struct rb_root rbroot;
+
+	/* Find two biggest gaps so that first_gap > second_gap > others */
+	for (; vma; vma = vma->vm_next) {
+		if (!last_vma) {
+			start = vma->vm_start;
+			goto next;
+		}
+
+		if (vma->rb_subtree_gap <= sz_range(&second_gap)) {
+			rbroot.rb_node = &vma->vm_rb;
+			vma = rb_entry(rb_last(&rbroot),
+					struct vm_area_struct, vm_rb);
+			goto next;
+		}
+
+		gap.start = last_vma->vm_end;
+		gap.end = vma->vm_start;
+		if (sz_range(&gap) > sz_range(&second_gap)) {
+			swap_ranges(&gap, &second_gap);
+			if (sz_range(&second_gap) > sz_range(&first_gap))
+				swap_ranges(&second_gap, &first_gap);
+		}
+next:
+		last_vma = vma;
+	}
+
+	if (!sz_range(&second_gap) || !sz_range(&first_gap))
+		return -EINVAL;
+
+	/* Sort the two biggest gaps by address */
+	if (first_gap.start > second_gap.start)
+		swap_ranges(&first_gap, &second_gap);
+
+	/* Store the result */
+	regions[0].start = ALIGN(start, MIN_REGION);
+	regions[0].end = ALIGN(first_gap.start, MIN_REGION);
+	regions[1].start = ALIGN(first_gap.end, MIN_REGION);
+	regions[1].end = ALIGN(second_gap.start, MIN_REGION);
+	regions[2].start = ALIGN(second_gap.end, MIN_REGION);
+	regions[2].end = ALIGN(last_vma->vm_end, MIN_REGION);
+
+	return 0;
+}
+
+/*
+ * Get the three regions in the given task
+ *
+ * Returns 0 on success, negative error code otherwise.
+ */
+static int damon_three_regions_of(struct damon_task *t,
+				struct damon_addr_range regions[3])
+{
+	struct mm_struct *mm;
+	int rc;
+
+	mm = damon_get_mm(t);
+	if (!mm)
+		return -EINVAL;
+
+	down_read(&mm->mmap_sem);
+	rc = damon_three_regions_in_vmas(mm->mmap, regions);
+	up_read(&mm->mmap_sem);
+
+	mmput(mm);
+	return rc;
+}
+
+/*
+ * Initialize the monitoring target regions for the given task
+ *
+ * t	the given target task
+ *
+ * Because only a number of small portions of the entire address space
+ * is actually mapped to the memory and accessed, monitoring the unmapped
+ * regions is wasteful.  That said, because we can deal with small noises,
+ * tracking every mapping is not strictly required but could even incur a high
+ * overhead if the mapping frequently changes or the number of mappings is
+ * high.  The adaptive regions adjustment mechanism will further help to deal
+ * with the noise by simply identifying the unmapped areas as a region that
+ * has no access.  Moreover, applying the real mappings that would have many
+ * unmapped areas inside will make the adaptive mechanism quite complex.  That
+ * said, too huge unmapped areas inside the monitoring target should be removed
+ * to not take the time for the adaptive mechanism.
+ *
+ * For the reason, we convert the complex mappings to three distinct regions
+ * that cover every mapped area of the address space.  Also the two gaps
+ * between the three regions are the two biggest unmapped areas in the given
+ * address space.  In detail, this function first identifies the start and the
+ * end of the mappings and the two biggest unmapped areas of the address space.
+ * Then, it constructs the three regions as below:
+ *
+ *     [mappings[0]->start, big_two_unmapped_areas[0]->start)
+ *     [big_two_unmapped_areas[0]->end, big_two_unmapped_areas[1]->start)
+ *     [big_two_unmapped_areas[1]->end, mappings[nr_mappings - 1]->end)
+ *
+ * As usual memory map of processes is as below, the gap between the heap and
+ * the uppermost mmap()-ed region, and the gap between the lowermost mmap()-ed
+ * region and the stack will be two biggest unmapped regions.  Because these
+ * gaps are exceptionally huge areas in usual address space, excluding these
+ * two biggest unmapped regions will be sufficient to make a trade-off.
+ *
+ *   <heap>
+ *   <BIG UNMAPPED REGION 1>
+ *   <uppermost mmap()-ed region>
+ *   (other mmap()-ed regions and small unmapped regions)
+ *   <lowermost mmap()-ed region>
+ *   <BIG UNMAPPED REGION 2>
+ *   <stack>
+ */
+static void damon_init_vm_regions_of(struct damon_ctx *c, struct damon_task *t)
+{
+	struct damon_region *r;
+	struct damon_addr_range regions[3];
+	unsigned long sz = 0, nr_pieces;
+	int i;
+
+	if (damon_three_regions_of(t, regions)) {
+		pr_err("Failed to get three regions of task %d\n", t->pid);
+		return;
+	}
+
+	for (i = 0; i < 3; i++)
+		sz += regions[i].end - regions[i].start;
+	if (c->min_nr_regions)
+		sz /= c->min_nr_regions;
+	if (sz < MIN_REGION)
+		sz = MIN_REGION;
+
+	/* Set the initial three regions of the task */
+	for (i = 0; i < 3; i++) {
+		r = damon_new_region(regions[i].start, regions[i].end);
+		if (!r) {
+			pr_err("%d'th init region creation failed\n", i);
+			return;
+		}
+		damon_add_region(r, t);
+
+		nr_pieces = (regions[i].end - regions[i].start) / sz;
+		damon_split_region_evenly(c, r, nr_pieces);
+	}
+}
+
+/* Initialize '->regions_list' of every task */
+void kdamond_init_vm_regions(struct damon_ctx *ctx)
+{
+	struct damon_task *t;
+
+	damon_for_each_task(t, ctx) {
+		/* the user may set the target regions as they want */
+		if (!nr_damon_regions(t))
+			damon_init_vm_regions_of(ctx, t);
+	}
+}
+
+/*
+ * Functions for the dynamic monitoring target regions update
+ */
+
+/*
+ * Check whether a region is intersecting an address range
+ *
+ * Returns true if it is.
+ */
+static bool damon_intersect(struct damon_region *r, struct damon_addr_range *re)
+{
+	return !(r->ar.end <= re->start || re->end <= r->ar.start);
+}
+
+/*
+ * Update damon regions for the three big regions of the given task
+ *
+ * t		the given task
+ * bregions	the three big regions of the task
+ */
+static void damon_apply_three_regions(struct damon_ctx *ctx,
+		struct damon_task *t, struct damon_addr_range bregions[3])
+{
+	struct damon_region *r, *next;
+	unsigned int i = 0;
+
+	/* Remove regions which are not in the three big regions now */
+	damon_for_each_region_safe(r, next, t) {
+		for (i = 0; i < 3; i++) {
+			if (damon_intersect(r, &bregions[i]))
+				break;
+		}
+		if (i == 3)
+			damon_destroy_region(r);
+	}
+
+	/* Adjust intersecting regions to fit with the three big regions */
+	for (i = 0; i < 3; i++) {
+		struct damon_region *first = NULL, *last;
+		struct damon_region *newr;
+		struct damon_addr_range *br;
+
+		br = &bregions[i];
+		/* Get the first and last regions which intersects with br */
+		damon_for_each_region(r, t) {
+			if (damon_intersect(r, br)) {
+				if (!first)
+					first = r;
+				last = r;
+			}
+			if (r->ar.start >= br->end)
+				break;
+		}
+		if (!first) {
+			/* no damon_region intersects with this big region */
+			newr = damon_new_region(
+					ALIGN_DOWN(br->start, MIN_REGION),
+					ALIGN(br->end, MIN_REGION));
+			if (!newr)
+				continue;
+			damon_insert_region(newr, damon_prev_region(r), r);
+		} else {
+			first->ar.start = ALIGN_DOWN(br->start, MIN_REGION);
+			last->ar.end = ALIGN(br->end, MIN_REGION);
+		}
+	}
+}
+
+/*
+ * Update regions for current memory mappings
+ */
+void kdamond_update_vm_regions(struct damon_ctx *ctx)
+{
+	struct damon_addr_range three_regions[3];
+	struct damon_task *t;
+
+	damon_for_each_task(t, ctx) {
+		if (damon_three_regions_of(t, three_regions))
+			continue;
+		damon_apply_three_regions(ctx, t, three_regions);
+	}
+}
+
+/*
+ * Functions for the access checking of the regions
+ */
+
+static void damon_mkold(struct mm_struct *mm, unsigned long addr)
+{
+	pte_t *pte = NULL;
+	pmd_t *pmd = NULL;
+	spinlock_t *ptl;
+
+	if (follow_pte_pmd(mm, addr, NULL, &pte, &pmd, &ptl))
+		return;
+
+	if (pte) {
+		if (pte_young(*pte)) {
+			clear_page_idle(pte_page(*pte));
+			set_page_young(pte_page(*pte));
+		}
+		*pte = pte_mkold(*pte);
+		pte_unmap_unlock(pte, ptl);
+		return;
+	}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if (pmd_young(*pmd)) {
+		clear_page_idle(pmd_page(*pmd));
+		set_page_young(pmd_page(*pmd));
+	}
+	*pmd = pmd_mkold(*pmd);
+	spin_unlock(ptl);
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+}
+
+static void damon_prepare_vm_access_check(struct damon_ctx *ctx,
+			struct mm_struct *mm, struct damon_region *r)
+{
+	r->sampling_addr = damon_rand(r->ar.start, r->ar.end);
+
+	damon_mkold(mm, r->sampling_addr);
+}
+
+void kdamond_prepare_vm_access_checks(struct damon_ctx *ctx)
+{
+	struct damon_task *t;
+	struct mm_struct *mm;
+	struct damon_region *r;
+
+	damon_for_each_task(t, ctx) {
+		mm = damon_get_mm(t);
+		if (!mm)
+			continue;
+		damon_for_each_region(r, t)
+			damon_prepare_vm_access_check(ctx, mm, r);
+		mmput(mm);
+	}
+}
+
+static bool damon_young(struct mm_struct *mm, unsigned long addr,
+			unsigned long *page_sz)
+{
+	pte_t *pte = NULL;
+	pmd_t *pmd = NULL;
+	spinlock_t *ptl;
+	bool young = false;
+
+	if (follow_pte_pmd(mm, addr, NULL, &pte, &pmd, &ptl))
+		return false;
+
+	*page_sz = PAGE_SIZE;
+	if (pte) {
+		young = pte_young(*pte);
+		pte_unmap_unlock(pte, ptl);
+		return young;
+	}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	young = pmd_young(*pmd);
+	spin_unlock(ptl);
+	*page_sz = ((1UL) << HPAGE_PMD_SHIFT);
+#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
+
+	return young;
+}
+
+/*
+ * Check whether the region was accessed after the last preparation
+ *
+ * mm	'mm_struct' for the given virtual address space
+ * r	the region to be checked
+ */
+static void damon_check_vm_access(struct damon_ctx *ctx,
+			       struct mm_struct *mm, struct damon_region *r)
+{
+	static struct mm_struct *last_mm;
+	static unsigned long last_addr;
+	static unsigned long last_page_sz = PAGE_SIZE;
+	static bool last_accessed;
+
+	/* If the region is in the last checked page, reuse the result */
+	if (mm == last_mm && (ALIGN_DOWN(last_addr, last_page_sz) ==
+				ALIGN_DOWN(r->sampling_addr, last_page_sz))) {
+		if (last_accessed)
+			r->nr_accesses++;
+		return;
+	}
+
+	last_accessed = damon_young(mm, r->sampling_addr, &last_page_sz);
+	if (last_accessed)
+		r->nr_accesses++;
+
+	last_mm = mm;
+	last_addr = r->sampling_addr;
+}
+
+unsigned int kdamond_check_vm_accesses(struct damon_ctx *ctx)
+{
+	struct damon_task *t;
+	struct mm_struct *mm;
+	struct damon_region *r;
+	unsigned int max_nr_accesses = 0;
+
+	damon_for_each_task(t, ctx) {
+		mm = damon_get_mm(t);
+		if (!mm)
+			continue;
+		damon_for_each_region(r, t) {
+			damon_check_vm_access(ctx, mm, r);
+			max_nr_accesses = max(r->nr_accesses, max_nr_accesses);
+		}
+		mmput(mm);
+	}
+
+	return max_nr_accesses;
+}
+
 /*
  * Functions for DAMON core logics and features
  */
-- 
2.17.1

