Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1BD3B5EFB
	for <lists+linux-doc@lfdr.de>; Mon, 28 Jun 2021 15:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhF1Ngo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Jun 2021 09:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbhF1Ngn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jun 2021 09:36:43 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688EBC061574;
        Mon, 28 Jun 2021 06:34:17 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id y29so25820105qky.12;
        Mon, 28 Jun 2021 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zJXtV+tvQRDv0DaqHp2wNo1t8ea2g98+ofghJ5sRc2I=;
        b=SktLcoyzMCtA7yFHFn7fGAb9A4udWmK1WYjPVQepEyhsg2wvQ2Z8srbtUj1jowHxOR
         //UmjNCP20WTlZDgUHaxcDR0OkvWnxoptVH9Kb4LcUd0V3XB+qHcndu+7CIRlZIJMNr+
         kgOla5WED0lNTK9AjllAbsUqBiNc965Ve5p0EmXITvi6OfjL8oU8GB3ohdOY8iu7MAlM
         nr52ygK/MQydTo2Qe65jONfbLAE1xnRziuSSuyMgBofjw5V1HkF0MLNZ70NEqJkcKX/D
         mM8wF4LDas5P5P0FpxNKu1KPWA++Mf1Qkh5iQgB7spcPvex68ylMSdq0yv0ejKHow3fH
         Y6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zJXtV+tvQRDv0DaqHp2wNo1t8ea2g98+ofghJ5sRc2I=;
        b=V5+b2QP3xRqCWVK/rhtBf8ewTWitV2bINhaBp+lbbsGijaDXYsic/mEauk40+bZUBl
         id6ZyK9uGVUeVbm8/Dn6xyb4BrH1dWRTJDSPhnZWqgwSJKaavcNcXcbaKmxCpT0PUbzw
         9wBRnMe/XRaZTiBUcyhbnEtVG13l8wr6wbsj04cduOSNGtekju08/r9T1bRv4EBUebRw
         oyy0rzxauW0sx5ffwyLRP7ifiQzjn375F5yGVzM4i75f8cT5BQvLuxe0TM/GC8ZiCfzW
         fnvOAqKIeu5KU2r4Gz7ITIQB+QX6D4GbblHDRhcgJ9n2wmiYUNqw0t3HC10aySTBxbdX
         NmvQ==
X-Gm-Message-State: AOAM532jTLu7OAS/MP4mvtytPisvJjJsnlZY6C50PJEt+Ifxu4ap8PUU
        Gfi/p6oep0hUG2YwdImnGgw=
X-Google-Smtp-Source: ABdhPJxUM99Y5aA3x4PIfMFdCqAf2Z6qZGjFUfxLXfmu5nAcmhfKKnI3pgkQ1XJo7aXnY228difg1w==
X-Received: by 2002:a05:620a:e02:: with SMTP id y2mr25364861qkm.54.1624887256467;
        Mon, 28 Jun 2021 06:34:16 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h1sm2276030qkm.50.2021.06.28.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 06:34:15 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        sj38.park@gmail.com, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v32 05/13] mm/damon: Implement primitives for the virtual memory address spaces
Date:   Mon, 28 Jun 2021 13:33:47 +0000
Message-Id: <20210628133355.18576-6-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210628133355.18576-1-sj38.park@gmail.com>
References: <20210628133355.18576-1-sj38.park@gmail.com>
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

The reference implementation for the virtual address space does the
works as below.

PTE Accessed-bit Based Access Check
-----------------------------------

The implementation uses PTE Accessed-bit for basic access checks.  That
is, it clears the bit for the next sampling target page and checks
whether it is set again after one sampling period.  This could disturb
the reclaim logic.  DAMON uses ``PG_idle`` and ``PG_young`` page flags
to solve the conflict, as Idle page tracking does.

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
usual address spaces, excluding these will be sufficient to make a
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
Reviewed-by: Fernand Sieber <sieberf@amazon.com>
---
 include/linux/damon.h |  13 +
 mm/damon/Kconfig      |   9 +
 mm/damon/Makefile     |   1 +
 mm/damon/vaddr.c      | 606 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 629 insertions(+)
 create mode 100644 mm/damon/vaddr.c

diff --git a/include/linux/damon.h b/include/linux/damon.h
index ce2a84b26cd7..edb350e52b93 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -249,4 +249,17 @@ int damon_stop(struct damon_ctx **ctxs, int nr_ctxs);
 
 #endif	/* CONFIG_DAMON */
 
+#ifdef CONFIG_DAMON_VADDR
+
+/* Monitoring primitives for virtual memory address spaces */
+void damon_va_init(struct damon_ctx *ctx);
+void damon_va_update(struct damon_ctx *ctx);
+void damon_va_prepare_access_checks(struct damon_ctx *ctx);
+unsigned int damon_va_check_accesses(struct damon_ctx *ctx);
+bool damon_va_target_valid(void *t);
+void damon_va_cleanup(struct damon_ctx *ctx);
+void damon_va_set_primitives(struct damon_ctx *ctx);
+
+#endif	/* CONFIG_DAMON_VADDR */
+
 #endif	/* _DAMON_H */
diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
index d00e99ac1a15..8ae080c52950 100644
--- a/mm/damon/Kconfig
+++ b/mm/damon/Kconfig
@@ -12,4 +12,13 @@ config DAMON
 	  See https://damonitor.github.io/doc/html/latest-damon/index.html for
 	  more information.
 
+config DAMON_VADDR
+	bool "Data access monitoring primitives for virtual address spaces"
+	depends on DAMON && MMU
+	select PAGE_EXTENSION if !64BIT
+	select PAGE_IDLE_FLAG
+	help
+	  This builds the default data access monitoring primitives for DAMON
+	  that works for virtual address spaces.
+
 endmenu
diff --git a/mm/damon/Makefile b/mm/damon/Makefile
index 4fd2edb4becf..6ebbd08aed67 100644
--- a/mm/damon/Makefile
+++ b/mm/damon/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_DAMON)		:= core.o
+obj-$(CONFIG_DAMON_VADDR)	+= vaddr.o
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
new file mode 100644
index 000000000000..91d4a95cedf7
--- /dev/null
+++ b/mm/damon/vaddr.c
@@ -0,0 +1,606 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DAMON Primitives for Virtual Address Spaces
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#define pr_fmt(fmt) "damon-va: " fmt
+
+#include <linux/damon.h>
+#include <linux/mm.h>
+#include <linux/mmu_notifier.h>
+#include <linux/page_idle.h>
+#include <linux/random.h>
+#include <linux/sched/mm.h>
+#include <linux/slab.h>
+
+/* Get a random number in [l, r) */
+#define damon_rand(l, r) (l + prandom_u32_max(r - l))
+
+/*
+ * 't->id' should be the pointer to the relevant 'struct pid' having reference
+ * count.  Caller must put the returned task, unless it is NULL.
+ */
+#define damon_get_task_struct(t) \
+	(get_pid_task((struct pid *)t->id, PIDTYPE_PID))
+
+/*
+ * Get the mm_struct of the given target
+ *
+ * Caller _must_ put the mm_struct after use, unless it is NULL.
+ *
+ * Returns the mm_struct of the target on success, NULL on failure
+ */
+static struct mm_struct *damon_get_mm(struct damon_target *t)
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
+static int damon_va_evenly_split_region(struct damon_target *t,
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
+	sz_piece = ALIGN_DOWN(sz_orig / nr_pieces, DAMON_MIN_REGION);
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
+		damon_insert_region(n, r, next, t);
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
+ * below comments of '__damon_va_init_regions()' function to know why this is
+ * necessary.
+ *
+ * Returns 0 if success, or negative error code otherwise.
+ */
+static int __damon_va_three_regions(struct vm_area_struct *vma,
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
+	regions[0].start = ALIGN(start, DAMON_MIN_REGION);
+	regions[0].end = ALIGN(first_gap.start, DAMON_MIN_REGION);
+	regions[1].start = ALIGN(first_gap.end, DAMON_MIN_REGION);
+	regions[1].end = ALIGN(second_gap.start, DAMON_MIN_REGION);
+	regions[2].start = ALIGN(second_gap.end, DAMON_MIN_REGION);
+	regions[2].end = ALIGN(last_vma->vm_end, DAMON_MIN_REGION);
+
+	return 0;
+}
+
+/*
+ * Get the three regions in the given target (task)
+ *
+ * Returns 0 on success, negative error code otherwise.
+ */
+static int damon_va_three_regions(struct damon_target *t,
+				struct damon_addr_range regions[3])
+{
+	struct mm_struct *mm;
+	int rc;
+
+	mm = damon_get_mm(t);
+	if (!mm)
+		return -EINVAL;
+
+	mmap_read_lock(mm);
+	rc = __damon_va_three_regions(mm->mmap, regions);
+	mmap_read_unlock(mm);
+
+	mmput(mm);
+	return rc;
+}
+
+/*
+ * Initialize the monitoring target regions for the given target (task)
+ *
+ * t	the given target
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
+static void __damon_va_init_regions(struct damon_ctx *ctx,
+				     struct damon_target *t)
+{
+	struct damon_region *r;
+	struct damon_addr_range regions[3];
+	unsigned long sz = 0, nr_pieces;
+	int i;
+
+	if (damon_va_three_regions(t, regions)) {
+		pr_err("Failed to get three regions of target %lu\n", t->id);
+		return;
+	}
+
+	for (i = 0; i < 3; i++)
+		sz += regions[i].end - regions[i].start;
+	if (ctx->min_nr_regions)
+		sz /= ctx->min_nr_regions;
+	if (sz < DAMON_MIN_REGION)
+		sz = DAMON_MIN_REGION;
+
+	/* Set the initial three regions of the target */
+	for (i = 0; i < 3; i++) {
+		r = damon_new_region(regions[i].start, regions[i].end);
+		if (!r) {
+			pr_err("%d'th init region creation failed\n", i);
+			return;
+		}
+		damon_add_region(r, t);
+
+		nr_pieces = (regions[i].end - regions[i].start) / sz;
+		damon_va_evenly_split_region(t, r, nr_pieces);
+	}
+}
+
+/* Initialize '->regions_list' of every target (task) */
+void damon_va_init(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+
+	damon_for_each_target(t, ctx) {
+		/* the user may set the target regions as they want */
+		if (!damon_nr_regions(t))
+			__damon_va_init_regions(ctx, t);
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
+ * Update damon regions for the three big regions of the given target
+ *
+ * t		the given target
+ * bregions	the three big regions of the target
+ */
+static void damon_va_apply_three_regions(struct damon_target *t,
+		struct damon_addr_range bregions[3])
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
+			damon_destroy_region(r, t);
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
+					ALIGN_DOWN(br->start,
+						DAMON_MIN_REGION),
+					ALIGN(br->end, DAMON_MIN_REGION));
+			if (!newr)
+				continue;
+			damon_insert_region(newr, damon_prev_region(r), r, t);
+		} else {
+			first->ar.start = ALIGN_DOWN(br->start,
+					DAMON_MIN_REGION);
+			last->ar.end = ALIGN(br->end, DAMON_MIN_REGION);
+		}
+	}
+}
+
+/*
+ * Update regions for current memory mappings
+ */
+void damon_va_update(struct damon_ctx *ctx)
+{
+	struct damon_addr_range three_regions[3];
+	struct damon_target *t;
+
+	damon_for_each_target(t, ctx) {
+		if (damon_va_three_regions(t, three_regions))
+			continue;
+		damon_va_apply_three_regions(t, three_regions);
+	}
+}
+
+/*
+ * Get an online page for a pfn if it's in the LRU list.  Otherwise, returns
+ * NULL.
+ *
+ * The body of this function is stolen from the 'page_idle_get_page()'.  We
+ * steal rather than reuse it because the code is quite simple.
+ */
+static struct page *damon_get_page(unsigned long pfn)
+{
+	struct page *page = pfn_to_online_page(pfn);
+
+	if (!page || !PageLRU(page) || !get_page_unless_zero(page))
+		return NULL;
+
+	if (unlikely(!PageLRU(page))) {
+		put_page(page);
+		page = NULL;
+	}
+	return page;
+}
+
+static void damon_ptep_mkold(pte_t *pte, struct mm_struct *mm,
+			     unsigned long addr)
+{
+	bool referenced = false;
+	struct page *page = damon_get_page(pte_pfn(*pte));
+
+	if (!page)
+		return;
+
+	if (pte_young(*pte)) {
+		referenced = true;
+		*pte = pte_mkold(*pte);
+	}
+
+#ifdef CONFIG_MMU_NOTIFIER
+	if (mmu_notifier_clear_young(mm, addr, addr + PAGE_SIZE))
+		referenced = true;
+#endif /* CONFIG_MMU_NOTIFIER */
+
+	if (referenced)
+		set_page_young(page);
+
+	set_page_idle(page);
+	put_page(page);
+}
+
+static void damon_pmdp_mkold(pmd_t *pmd, struct mm_struct *mm,
+			     unsigned long addr)
+{
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	bool referenced = false;
+	struct page *page = damon_get_page(pmd_pfn(*pmd));
+
+	if (!page)
+		return;
+
+	if (pmd_young(*pmd)) {
+		referenced = true;
+		*pmd = pmd_mkold(*pmd);
+	}
+
+#ifdef CONFIG_MMU_NOTIFIER
+	if (mmu_notifier_clear_young(mm, addr,
+				addr + ((1UL) << HPAGE_PMD_SHIFT)))
+		referenced = true;
+#endif /* CONFIG_MMU_NOTIFIER */
+
+	if (referenced)
+		set_page_young(page);
+
+	set_page_idle(page);
+	put_page(page);
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+}
+
+static void damon_va_mkold(struct mm_struct *mm, unsigned long addr)
+{
+	pte_t *pte = NULL;
+	pmd_t *pmd = NULL;
+	spinlock_t *ptl;
+
+	if (follow_invalidate_pte(mm, addr, NULL, &pte, &pmd, &ptl))
+		return;
+
+	if (pte) {
+		damon_ptep_mkold(pte, mm, addr);
+		pte_unmap_unlock(pte, ptl);
+	} else {
+		damon_pmdp_mkold(pmd, mm, addr);
+		spin_unlock(ptl);
+	}
+}
+
+/*
+ * Functions for the access checking of the regions
+ */
+
+static void damon_va_prepare_access_check(struct damon_ctx *ctx,
+			struct mm_struct *mm, struct damon_region *r)
+{
+	r->sampling_addr = damon_rand(r->ar.start, r->ar.end);
+
+	damon_va_mkold(mm, r->sampling_addr);
+}
+
+void damon_va_prepare_access_checks(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	struct mm_struct *mm;
+	struct damon_region *r;
+
+	damon_for_each_target(t, ctx) {
+		mm = damon_get_mm(t);
+		if (!mm)
+			continue;
+		damon_for_each_region(r, t)
+			damon_va_prepare_access_check(ctx, mm, r);
+		mmput(mm);
+	}
+}
+
+static bool damon_va_young(struct mm_struct *mm, unsigned long addr,
+			unsigned long *page_sz)
+{
+	pte_t *pte = NULL;
+	pmd_t *pmd = NULL;
+	spinlock_t *ptl;
+	struct page *page;
+	bool young = false;
+
+	if (follow_invalidate_pte(mm, addr, NULL, &pte, &pmd, &ptl))
+		return false;
+
+	*page_sz = PAGE_SIZE;
+	if (pte) {
+		page = damon_get_page(pte_pfn(*pte));
+		if (page && (pte_young(*pte) || !page_is_idle(page) ||
+					mmu_notifier_test_young(mm, addr)))
+			young = true;
+		if (page)
+			put_page(page);
+		pte_unmap_unlock(pte, ptl);
+		return young;
+	}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	page = damon_get_page(pmd_pfn(*pmd));
+	if (page && (pmd_young(*pmd) || !page_is_idle(page) ||
+			mmu_notifier_test_young(mm, addr)))
+		young = true;
+	if (page)
+		put_page(page);
+
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
+static void damon_va_check_access(struct damon_ctx *ctx,
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
+	last_accessed = damon_va_young(mm, r->sampling_addr, &last_page_sz);
+	if (last_accessed)
+		r->nr_accesses++;
+
+	last_mm = mm;
+	last_addr = r->sampling_addr;
+}
+
+unsigned int damon_va_check_accesses(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	struct mm_struct *mm;
+	struct damon_region *r;
+	unsigned int max_nr_accesses = 0;
+
+	damon_for_each_target(t, ctx) {
+		mm = damon_get_mm(t);
+		if (!mm)
+			continue;
+		damon_for_each_region(r, t) {
+			damon_va_check_access(ctx, mm, r);
+			max_nr_accesses = max(r->nr_accesses, max_nr_accesses);
+		}
+		mmput(mm);
+	}
+
+	return max_nr_accesses;
+}
+
+/*
+ * Functions for the target validity check and cleanup
+ */
+
+bool damon_va_target_valid(void *target)
+{
+	struct damon_target *t = target;
+	struct task_struct *task;
+
+	task = damon_get_task_struct(t);
+	if (task) {
+		put_task_struct(task);
+		return true;
+	}
+
+	return false;
+}
+
+void damon_va_set_primitives(struct damon_ctx *ctx)
+{
+	ctx->primitive.init = damon_va_init;
+	ctx->primitive.update = damon_va_update;
+	ctx->primitive.prepare_access_checks = damon_va_prepare_access_checks;
+	ctx->primitive.check_accesses = damon_va_check_accesses;
+	ctx->primitive.reset_aggregated = NULL;
+	ctx->primitive.target_valid = damon_va_target_valid;
+	ctx->primitive.cleanup = NULL;
+}
-- 
2.17.1

