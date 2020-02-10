Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 748CF157DBD
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2020 15:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgBJOtL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Feb 2020 09:49:11 -0500
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:30921 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbgBJOtK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Feb 2020 09:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1581346150; x=1612882150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=iBehoqBaW3Trk6LovhbJjHco03eIPkKsJwOdN6A/ZZA=;
  b=Wgcfydv069CAA1uJhiBH+0Ffrl9m6NaUZTHAyFBuOpP/edjE6rJ1fqhX
   vmNCZnBzw44G4MH12uC1/iHKhW5Vu1AJDP64PP/8UAs+ZnASDJ5h+WFjV
   PD2dI6p/KJlFtvwCX2IjOeVAuptSoq+DyivSz3Q9D/z1F19N+8fK8wCny
   0=;
IronPort-SDR: ZLpeIO95w2aZk/v8R7wfoOPB2xphpg98TuBZF7svDB6p9qlOC3sR90hck7lVeLnUOWQnd3+ulf
 AmbYRJBKRTOg==
X-IronPort-AV: E=Sophos;i="5.70,425,1574121600"; 
   d="scan'208";a="16392303"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 10 Feb 2020 14:49:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS id 63C6CA07A5;
        Mon, 10 Feb 2020 14:49:02 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 10 Feb 2020 14:49:01 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.203) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 10 Feb 2020 14:48:50 +0000
From:   <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <brendan.d.gregg@gmail.com>, <brendanhiggins@google.com>,
        <cai@lca.pw>, <colin.king@canonical.com>, <corbet@lwn.net>,
        <dwmw@amazon.com>, <jolsa@redhat.com>, <kirill@shutemov.name>,
        <mark.rutland@arm.com>, <mgorman@suse.de>, <minchan@kernel.org>,
        <mingo@redhat.com>, <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <rostedt@goodmis.org>,
        <sj38.park@gmail.com>, <vdavydov.dev@gmail.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 02/11] mm/damon: Implement region based sampling
Date:   Mon, 10 Feb 2020 15:48:03 +0100
Message-ID: <20200210144812.26845-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210144812.26845-1-sjpark@amazon.com>
References: <20200210144812.26845-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.203]
X-ClientProxiedBy: EX13D35UWC004.ant.amazon.com (10.43.162.180) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit implements DAMON's basic access check and region based
sampling mechanisms.  This change would seems make no sense, mainly
because it is only a part of the DAMON's logics.  Following two commits
will make more sense.

Basic Access Check
------------------

DAMON basically reports what pages are how frequently accessed.  Note
that the frequency is not an absolute number of accesses, but a relative
frequency among the pages of the target workloads.

Users can control the resolution of the reports by setting two time
intervals, ``sampling interval`` and ``aggregation interval``.  In
detail, DAMON checks access to each page per ``sampling interval``,
aggregates the results (counts the number of the accesses to each page),
and reports the aggregated results per ``aggregation interval``.  For
the access check of each page, DAMON uses the Accessed bits of PTEs.

This is thus similar to common periodic access checks based access
tracking mechanisms, which overhead is increasing as the size of the
target process grows.

Region Based Sampling
---------------------

To avoid the unbounded increase of the overhead, DAMON groups a number
of adjacent pages that assumed to have same access frequencies into a
region.  As long as the assumption (pages in a region have same access
frequencies) is kept, only one page in the region is required to be
checked.  Thus, for each ``sampling interval``, DAMON randomly picks one
page in each region and clears its Accessed bit.  After one more
``sampling interval``, DAMON reads the Accessed bit of the page and
increases the access frequency of the region if the bit has set
meanwhile.  Therefore, the monitoring overhead is controllable by
setting the number of regions.

Nonetheless, this scheme cannot preserve the quality of the output if
the assumption is not kept.  Following commit will introduce how we can
make the guarantee with best effort.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon.c | 642 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 642 insertions(+)

diff --git a/mm/damon.c b/mm/damon.c
index 0687d2b83bb6..03fd9b1b931b 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -9,9 +9,14 @@
 
 #define pr_fmt(fmt) "damon: " fmt
 
+#include <linux/delay.h>
+#include <linux/kthread.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/page_idle.h>
 #include <linux/random.h>
+#include <linux/sched/mm.h>
+#include <linux/sched/task.h>
 #include <linux/slab.h>
 
 #define damon_get_task_struct(t) \
@@ -51,7 +56,30 @@ struct damon_task {
 	struct list_head list;
 };
 
+/*
+ * For each 'sample_interval', DAMON checks whether each region is accessed or
+ * not.  It aggregates and keeps the access information (number of accesses to
+ * each region) for 'aggr_interval' and then flushes it to the result buffer if
+ * an 'aggr_interval' surpassed.
+ *
+ * All time intervals are in micro-seconds.
+ */
 struct damon_ctx {
+	unsigned long sample_interval;
+	unsigned long aggr_interval;
+	unsigned long min_nr_regions;
+
+	struct timespec64 last_aggregation;
+
+	unsigned char *rbuf;
+	unsigned int rbuf_len;
+	unsigned int rbuf_offset;
+	char *rfile_path;
+
+	struct task_struct *kdamond;
+	bool kdamond_stop;
+	spinlock_t kdamond_lock;
+
 	struct rnd_state rndseed;
 
 	struct list_head tasks_list;	/* 'damon_task' objects */
@@ -206,6 +234,620 @@ static unsigned int nr_damon_regions(struct damon_task *t)
 	return ret;
 }
 
+/*
+ * Get the mm_struct of the given task
+ *
+ * Callser should put the mm_struct after use, unless it is NULL.
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
+ * Size-evenly split a region into 'nr_pieces' small regions
+ *
+ * Returns 0 on success, or negative error code otherwise.
+ */
+static int damon_split_region_evenly(struct damon_ctx *ctx,
+		struct damon_region *r, unsigned int nr_pieces)
+{
+	unsigned long sz_orig, sz_piece, orig_end;
+	struct damon_region *piece = NULL, *next;
+	unsigned long start;
+
+	if (!r || !nr_pieces)
+		return -EINVAL;
+
+	orig_end = r->vm_end;
+	sz_orig = r->vm_end - r->vm_start;
+	sz_piece = sz_orig / nr_pieces;
+
+	if (!sz_piece)
+		return -EINVAL;
+
+	r->vm_end = r->vm_start + sz_piece;
+	next = damon_next_region(r);
+	for (start = r->vm_end; start + sz_piece <= orig_end;
+			start += sz_piece) {
+		piece = damon_new_region(ctx, start, start + sz_piece);
+		damon_add_region(piece, r, next);
+		r = piece;
+	}
+	if (piece)
+		piece->vm_end = orig_end;
+	return 0;
+}
+
+struct region {
+	unsigned long start;
+	unsigned long end;
+};
+
+static unsigned long sz_region(struct region *r)
+{
+	return r->end - r->start;
+}
+
+static void swap_regions(struct region *r1, struct region *r2)
+{
+	struct region tmp;
+
+	tmp = *r1;
+	*r1 = *r2;
+	*r2 = tmp;
+}
+
+/*
+ * Find the three regions in an address space
+ *
+ * vma		the head vma of the target address space
+ * regions	an array of three 'struct region's that results will be saved
+ *
+ * This function receives an address space and finds three regions in it which
+ * separated by the two biggest unmapped regions in the space.  Please refer to
+ * below comments of 'damon_init_regions_of()' function to know why this is
+ * necessary.
+ *
+ * Returns 0 if success, or negative error code otherwise.
+ */
+static int damon_three_regions_in_vmas(struct vm_area_struct *vma,
+		struct region regions[3])
+{
+	struct region gap = {0,}, first_gap = {0,}, second_gap = {0,};
+	struct vm_area_struct *last_vma = NULL;
+	unsigned long start = 0;
+
+	/* Find two biggest gaps so that first_gap > second_gap > others */
+	for (; vma; vma = vma->vm_next) {
+		if (!last_vma) {
+			start = vma->vm_start;
+			last_vma = vma;
+			continue;
+		}
+		gap.start = last_vma->vm_end;
+		gap.end = vma->vm_start;
+		if (sz_region(&gap) > sz_region(&second_gap)) {
+			swap_regions(&gap, &second_gap);
+			if (sz_region(&second_gap) > sz_region(&first_gap))
+				swap_regions(&second_gap, &first_gap);
+		}
+		last_vma = vma;
+	}
+
+	if (!sz_region(&second_gap) || !sz_region(&first_gap))
+		return -EINVAL;
+
+	/* Sort the two biggest gaps by address */
+	if (first_gap.start > second_gap.start)
+		swap_regions(&first_gap, &second_gap);
+
+	/* Store the result */
+	regions[0].start = start;
+	regions[0].end = first_gap.start;
+	regions[1].start = first_gap.end;
+	regions[1].end = second_gap.start;
+	regions[2].start = second_gap.end;
+	regions[2].end = last_vma->vm_end;
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
+				struct region regions[3])
+{
+	struct mm_struct *mm;
+	int ret;
+
+	mm = damon_get_mm(t);
+	if (!mm)
+		return -EINVAL;
+
+	down_read(&mm->mmap_sem);
+	ret = damon_three_regions_in_vmas(mm->mmap, regions);
+	up_read(&mm->mmap_sem);
+
+	mmput(mm);
+	return ret;
+}
+
+/*
+ * Initialize the monitoring target regions for the given task
+ *
+ * t	the given target task
+ *
+ * Because only a number of small portions of the entire address space
+ * is acutally mapped to the memory and accessed, monitoring the unmapped
+ * regions is wasteful.  That said, because we can deal with small noises,
+ * tracking every mapping is not strictly required but could even incur a high
+ * overhead if the mapping frequently changes or the number of mappings is
+ * high.  Nonetheless, this may seems very weird.  DAMON's dynamic regions
+ * adjustment mechanism, which will be implemented with following commit will
+ * make this more sense.
+ *
+ * For the reason, we convert the complex mappings to three distinct regions
+ * that cover every mapped areas of the address space.  Also the two gaps
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
+static void damon_init_regions_of(struct damon_ctx *c, struct damon_task *t)
+{
+	struct damon_region *r;
+	struct region regions[3];
+	int i;
+
+	if (damon_three_regions_of(t, regions)) {
+		pr_err("Failed to get three regions of task %lu\n", t->pid);
+		return;
+	}
+
+	/* Set the initial three regions of the task */
+	for (i = 0; i < 3; i++) {
+		r = damon_new_region(c, regions[i].start, regions[i].end);
+		damon_add_region_tail(r, t);
+	}
+
+	/* Split the middle region into 'min_nr_regions - 2' regions */
+	r = damon_nth_region_of(t, 1);
+	if (damon_split_region_evenly(c, r, c->min_nr_regions - 2))
+		pr_warn("Init middle region failed to be split\n");
+}
+
+/* Initialize '->regions_list' of every task */
+static void kdamond_init_regions(struct damon_ctx *ctx)
+{
+	struct damon_task *t;
+
+	damon_for_each_task(ctx, t)
+		damon_init_regions_of(ctx, t);
+}
+
+/*
+ * Check whether the given region has accessed since the last check
+ *
+ * mm	'mm_struct' for the given virtual address space
+ * r	the region to be checked
+ */
+static void kdamond_check_access(struct damon_ctx *ctx,
+			struct mm_struct *mm, struct damon_region *r)
+{
+	pte_t *pte = NULL;
+	pmd_t *pmd = NULL;
+	spinlock_t *ptl;
+
+	if (follow_pte_pmd(mm, r->sampling_addr, NULL, &pte, &pmd, &ptl))
+		goto mkold;
+
+	/* Read the page table access bit of the page */
+	if (pte && pte_young(*pte))
+		r->nr_accesses++;
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	else if (pmd && pmd_young(*pmd))
+		r->nr_accesses++;
+#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
+
+	spin_unlock(ptl);
+
+mkold:
+	/* mkold next target */
+	r->sampling_addr = damon_rand(ctx, r->vm_start, r->vm_end);
+
+	if (follow_pte_pmd(mm, r->sampling_addr, NULL, &pte, &pmd, &ptl))
+		return;
+
+	if (pte) {
+		if (pte_young(*pte)) {
+			clear_page_idle(pte_page(*pte));
+			set_page_young(pte_page(*pte));
+		}
+		*pte = pte_mkold(*pte);
+	}
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	else if (pmd) {
+		if (pmd_young(*pmd)) {
+			clear_page_idle(pmd_page(*pmd));
+			set_page_young(pte_page(*pte));
+		}
+		*pmd = pmd_mkold(*pmd);
+	}
+#endif
+
+	spin_unlock(ptl);
+}
+
+/*
+ * Check whether a time interval is elapsed
+ *
+ * baseline	the time to check whether the interval has elapsed since
+ * interval	the time interval (microseconds)
+ *
+ * See whether the given time interval has passed since the given baseline
+ * time.  If so, it also updates the baseline to current time for next check.
+ *
+ * Returns true if the time interval has passed, or false otherwise.
+ */
+static bool damon_check_reset_time_interval(struct timespec64 *baseline,
+		unsigned long interval)
+{
+	struct timespec64 now;
+
+	ktime_get_coarse_ts64(&now);
+	if ((timespec64_to_ns(&now) - timespec64_to_ns(baseline)) <
+			interval * 1000)
+		return false;
+	*baseline = now;
+	return true;
+}
+
+/*
+ * Check whether it is time to flush the aggregated information
+ */
+static bool kdamond_aggregate_interval_passed(struct damon_ctx *ctx)
+{
+	return damon_check_reset_time_interval(&ctx->last_aggregation,
+			ctx->aggr_interval);
+}
+
+/*
+ * Flush the content in the result buffer to the result file
+ */
+static void damon_flush_rbuffer(struct damon_ctx *ctx)
+{
+	ssize_t sz;
+	loff_t pos;
+	struct file *rfile;
+
+	while (ctx->rbuf_offset) {
+		pos = 0;
+		rfile = filp_open(ctx->rfile_path, O_CREAT | O_RDWR | O_APPEND,
+				0644);
+		if (IS_ERR(rfile)) {
+			pr_err("Cannot open the result file %s\n",
+					ctx->rfile_path);
+			return;
+		}
+
+		sz = kernel_write(rfile, ctx->rbuf, ctx->rbuf_offset, &pos);
+		filp_close(rfile, NULL);
+
+		ctx->rbuf_offset -= sz;
+	}
+}
+
+/*
+ * Write a data into the result buffer
+ */
+static void damon_write_rbuf(struct damon_ctx *ctx, void *data, ssize_t size)
+{
+	if (!ctx->rbuf_len || !ctx->rbuf)
+		return;
+	if (ctx->rbuf_offset + size > ctx->rbuf_len)
+		damon_flush_rbuffer(ctx);
+
+	memcpy(&ctx->rbuf[ctx->rbuf_offset], data, size);
+	ctx->rbuf_offset += size;
+}
+
+/*
+ * Flush the aggregated monitoring results to the result buffer
+ *
+ * Stores current tracking results to the result buffer and reset 'nr_accesses'
+ * of each regions.  The format for the result buffer is as below:
+ *
+ *   <time> <number of tasks> <array of task infos>
+ *
+ *   task info: <pid> <number of regions> <array of region infos>
+ *   region info: <start address> <end address> <nr_accesses>
+ */
+static void kdamond_flush_aggregated(struct damon_ctx *c)
+{
+	struct damon_task *t;
+	struct timespec64 now;
+	unsigned int nr;
+
+	ktime_get_coarse_ts64(&now);
+
+	damon_write_rbuf(c, &now, sizeof(struct timespec64));
+	nr = nr_damon_tasks(c);
+	damon_write_rbuf(c, &nr, sizeof(nr));
+
+	damon_for_each_task(c, t) {
+		struct damon_region *r;
+
+		damon_write_rbuf(c, &t->pid, sizeof(t->pid));
+		nr = nr_damon_regions(t);
+		damon_write_rbuf(c, &nr, sizeof(nr));
+		damon_for_each_region(r, t) {
+			damon_write_rbuf(c, &r->vm_start, sizeof(r->vm_start));
+			damon_write_rbuf(c, &r->vm_end, sizeof(r->vm_end));
+			damon_write_rbuf(c, &r->nr_accesses,
+					sizeof(r->nr_accesses));
+			r->nr_accesses = 0;
+		}
+	}
+}
+
+/*
+ * Check whether current monitoring should be stopped
+ *
+ * If users asked to stop, need stop.  Even though no user has asked to stop,
+ * need stop if every target task has dead.
+ *
+ * Returns true if need to stop current monitoring.
+ */
+static bool kdamond_need_stop(struct damon_ctx *ctx)
+{
+	struct damon_task *t;
+	struct task_struct *task;
+	bool stop;
+
+	spin_lock(&ctx->kdamond_lock);
+	stop = ctx->kdamond_stop;
+	spin_unlock(&ctx->kdamond_lock);
+	if (stop)
+		return true;
+
+	damon_for_each_task(ctx, t) {
+		task = damon_get_task_struct(t);
+		if (task) {
+			put_task_struct(task);
+			return false;
+		}
+	}
+
+	return true;
+}
+
+/*
+ * The monitoring daemon that runs as a kernel thread
+ */
+static int kdamond_fn(void *data)
+{
+	struct damon_ctx *ctx = (struct damon_ctx *)data;
+	struct damon_task *t;
+	struct damon_region *r, *next;
+	struct mm_struct *mm;
+
+	pr_info("kdamond (%d) starts\n", ctx->kdamond->pid);
+	kdamond_init_regions(ctx);
+	while (!kdamond_need_stop(ctx)) {
+		damon_for_each_task(ctx, t) {
+			mm = damon_get_mm(t);
+			if (!mm)
+				continue;
+			damon_for_each_region(r, t)
+				kdamond_check_access(ctx, mm, r);
+			mmput(mm);
+		}
+
+		if (kdamond_aggregate_interval_passed(ctx))
+			kdamond_flush_aggregated(ctx);
+
+		usleep_range(ctx->sample_interval, ctx->sample_interval + 1);
+	}
+	damon_flush_rbuffer(ctx);
+	damon_for_each_task(ctx, t) {
+		damon_for_each_region_safe(r, next, t)
+			damon_destroy_region(r);
+	}
+	pr_info("kdamond (%d) finishes\n", ctx->kdamond->pid);
+	spin_lock(&ctx->kdamond_lock);
+	ctx->kdamond = NULL;
+	spin_unlock(&ctx->kdamond_lock);
+	return 0;
+}
+
+/*
+ * Controller functions
+ */
+
+/*
+ * Start or stop the kdamond
+ *
+ * Returns 0 if success, negative error code otherwise.
+ */
+static int damon_turn_kdamond(struct damon_ctx *ctx, bool on)
+{
+	spin_lock(&ctx->kdamond_lock);
+	ctx->kdamond_stop = !on;
+	if (!ctx->kdamond && on) {
+		ctx->kdamond = kthread_run(kdamond_fn, ctx, "kdamond");
+		if (!ctx->kdamond)
+			goto fail;
+		goto success;
+	}
+	if (ctx->kdamond && !on) {
+		spin_unlock(&ctx->kdamond_lock);
+		while (true) {
+			spin_lock(&ctx->kdamond_lock);
+			if (!ctx->kdamond)
+				goto success;
+			spin_unlock(&ctx->kdamond_lock);
+
+			usleep_range(ctx->sample_interval,
+					ctx->sample_interval * 2);
+		}
+	}
+
+	/* tried to turn on while turned on, or turn off while turned off */
+
+fail:
+	spin_unlock(&ctx->kdamond_lock);
+	return -EINVAL;
+
+success:
+	spin_unlock(&ctx->kdamond_lock);
+	return 0;
+}
+
+static inline bool damon_is_target_pid(struct damon_ctx *c, unsigned long pid)
+{
+	struct damon_task *t;
+
+	damon_for_each_task(c, t) {
+		if (t->pid == pid)
+			return true;
+	}
+	return false;
+}
+
+/*
+ * This function should not be called while the kdamond is running.
+ */
+static int damon_set_pids(struct damon_ctx *ctx,
+			unsigned long *pids, ssize_t nr_pids)
+{
+	ssize_t i;
+	struct damon_task *t, *next;
+
+	/* Remove unselected tasks */
+	damon_for_each_task_safe(ctx, t, next) {
+		for (i = 0; i < nr_pids; i++) {
+			if (pids[i] == t->pid)
+				break;
+		}
+		if (i != nr_pids)
+			continue;
+		damon_destroy_task(t);
+	}
+
+	/* Add new tasks */
+	for (i = 0; i < nr_pids; i++) {
+		if (damon_is_target_pid(ctx, pids[i]))
+			continue;
+		t = damon_new_task(pids[i]);
+		if (!t) {
+			pr_err("Failed to alloc damon_task\n");
+			return -ENOMEM;
+		}
+		damon_add_task_tail(ctx, t);
+	}
+
+	return 0;
+}
+
+/*
+ * Set attributes for the recording
+ *
+ * path_to_rfile	path to the monitor result files
+ * This function should not be called while the kdamond is running.
+ * Every time interval is in micro-seconds.
+ *
+ * Returns 0 on success, negative error code otherwise.
+ */
+static int damon_set_recording(struct damon_ctx *ctx,
+				unsigned int rbuf_len, char *path_to_rfile)
+{
+	size_t rfile_path_len;
+
+	if (rbuf_len > 4 * 1024 * 1024) {
+		pr_err("too long (>%d) result buffer length\n",
+				4 * 1024 * 1024);
+		return -EINVAL;
+	}
+	rfile_path_len = strnlen(path_to_rfile, LEN_RES_FILE_PATH);
+	if (rfile_path_len >= LEN_RES_FILE_PATH) {
+		pr_err("too long (>%d) result file path %s\n",
+				LEN_RES_FILE_PATH, path_to_rfile);
+		return -EINVAL;
+	}
+	ctx->rbuf_len = rbuf_len;
+	kfree(ctx->rbuf);
+	if (rbuf_len) {
+		ctx->rbuf = kvmalloc(rbuf_len, GFP_KERNEL);
+		if (!ctx->rbuf)
+			return -ENOMEM;
+	}
+	ctx->rfile_path = kmalloc(rfile_path_len + 1, GFP_KERNEL);
+	if (!ctx->rfile_path)
+		return -ENOMEM;
+	strncpy(ctx->rfile_path, path_to_rfile, rfile_path_len);
+	return 0;
+}
+
+/*
+ * Set attributes for the monitoring
+ *
+ * sample_int		time interval between samplings
+ * aggr_int		time interval between aggregations
+ * min_nr_reg		minimal number of regions
+ *
+ * This function should not be called while the kdamond is running.
+ * Every time interval is in micro-seconds.
+ *
+ * Returns 0 on success, negative error code otherwise.
+ */
+static int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
+		unsigned long aggr_int, unsigned long min_nr_reg)
+{
+	if (min_nr_reg < 3) {
+		pr_err("min_nr_regions (%lu) should be bigger than 2\n",
+				min_nr_reg);
+		return -EINVAL;
+	}
+
+	ctx->sample_interval = sample_int;
+	ctx->aggr_interval = aggr_int;
+	ctx->min_nr_regions = min_nr_reg;
+	return 0;
+}
+
 static int __init damon_init(void)
 {
 	pr_info("init\n");
-- 
2.17.1

