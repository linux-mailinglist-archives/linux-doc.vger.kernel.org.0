Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C39E2DAC7A
	for <lists+linux-doc@lfdr.de>; Tue, 15 Dec 2020 12:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgLOL6T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Dec 2020 06:58:19 -0500
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:1676 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbgLOL6K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 06:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1608033488; x=1639569488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=N/NhuWKknhjTq7U4VhihMJV62r2AG12h+d0PPbwSbbs=;
  b=Si71aLuke70gPh0T1WFcH007+u1Dw0Gug8nvH2S3PswUKpzupKJKyG2X
   U7W4GGNM7cqivzjtSX5X+PPV+qM3oDyug19IWGP0f4VBJ5PWISs25AKHZ
   AF0+SR93nupZlu9Rta1aX+TNUj6viMK1YUWLqLYcN0FybKlzMVJFz8rBy
   Q=;
X-IronPort-AV: E=Sophos;i="5.78,420,1599523200"; 
   d="scan'208";a="96129173"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 15 Dec 2020 11:57:18 +0000
Received: from EX13D31EUA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS id D5D20A1C35;
        Tue, 15 Dec 2020 11:57:05 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.252) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Dec 2020 11:56:48 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <elver@google.com>, <fan.du@intel.com>,
        <foersleo@amazon.de>, <gthelen@google.com>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v23 03/15] mm/damon: Adaptively adjust regions
Date:   Tue, 15 Dec 2020 12:54:36 +0100
Message-ID: <20201215115448.25633-4-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215115448.25633-1-sjpark@amazon.com>
References: <20201215115448.25633-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.252]
X-ClientProxiedBy: EX13D33UWC002.ant.amazon.com (10.43.162.11) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Even somehow the initial monitoring target regions are well constructed
to fulfill the assumption (pages in same region have similar access
frequencies), the data access pattern can be dynamically changed.  This
will result in low monitoring quality.  To keep the assumption as much
as possible, DAMON adaptively merges and splits each region based on
their access frequency.

For each ``aggregation interval``, it compares the access frequencies of
adjacent regions and merges those if the frequency difference is small.
Then, after it reports and clears the aggregated access frequency of
each region, it splits each region into two or three regions if the
total number of regions will not exceed the user-specified maximum
number of regions after the split.

In this way, DAMON provides its best-effort quality and minimal overhead
while keeping the upper-bound overhead that users set.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Leonard Foerster <foersleo@amazon.de>
---
 include/linux/damon.h |  41 +++++---
 mm/damon/core.c       | 220 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 240 insertions(+), 21 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 7d4685adc8a9..f446f8433599 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -12,6 +12,9 @@
 #include <linux/time64.h>
 #include <linux/types.h>
 
+/* Minimal region size.  Every damon_region is aligned by this. */
+#define DAMON_MIN_REGION	PAGE_SIZE
+
 /**
  * struct damon_addr_range - Represents an address region of [@start, @end).
  * @start:	Start address of the region (inclusive).
@@ -86,6 +89,8 @@ struct damon_ctx;
  * prepared for the next access check.
  * @check_accesses should check the accesses to each region that made after the
  * last preparation and update the number of observed accesses of each region.
+ * It should also return max number of observed accesses that made as a result
+ * of its update.
  * @reset_aggregated should reset the access monitoring results that aggregated
  * by @check_accesses.
  * @target_valid should check whether the target is still valid for the
@@ -98,7 +103,7 @@ struct damon_primitive {
 	void (*init_target_regions)(struct damon_ctx *context);
 	void (*update_target_regions)(struct damon_ctx *context);
 	void (*prepare_access_checks)(struct damon_ctx *context);
-	void (*check_accesses)(struct damon_ctx *context);
+	unsigned int (*check_accesses)(struct damon_ctx *context);
 	void (*reset_aggregated)(struct damon_ctx *context);
 	bool (*target_valid)(void *target);
 	void (*cleanup)(struct damon_ctx *context);
@@ -138,11 +143,11 @@ struct damon_callback {
 /**
  * enum damon_target_type - Represents the type of the monitoring target.
  *
- * @DAMON_REGION_SAMPLING_TARGET:	Region based sampling target.
- * @DAMON_ARBITRARY_TARGET:		User-defined arbitrary type target.
+ * @DAMON_ADAPTIVE_TARGET:	Adaptive regions adjustment applied target.
+ * @DAMON_ARBITRARY_TARGET:	User-defined arbitrary type target.
  */
 enum damon_target_type {
-	DAMON_REGION_SAMPLING_TARGET,
+	DAMON_ADAPTIVE_TARGET,
 	DAMON_ARBITRARY_TARGET,
 };
 
@@ -187,13 +192,15 @@ enum damon_target_type {
  *
  * @target_type:	Type of the monitoring target.
  *
- * @region_targets:	Head of monitoring targets (&damon_target) list.
+ * @min_nr_regions:	The minimum number of adaptive monitoring regions.
+ * @max_nr_regions:	The maximum number of adaptive monitoring regions.
+ * @adaptive_targets:	Head of monitoring targets (&damon_target) list.
  *
  * @arbitrary_target:	Pointer to arbitrary type target.
  *
- * @region_targets are valid only if @target_type is
- * DAMON_REGION_SAMPLING_TARGET.  @arbitrary_target is valid only if
- * @target_type is DAMON_ARBITRARY_TARGET.
+ * @min_nr_regions, @max_nr_regions and @adaptive_targets are valid only if
+ * @target_type is &DAMON_ADAPTIVE_TARGET.  @arbitrary_target is valid only if
+ * @target_type is &DAMON_ARBITRARY_TARGET.
  */
 struct damon_ctx {
 	unsigned long sample_interval;
@@ -214,11 +221,13 @@ struct damon_ctx {
 
 	enum damon_target_type target_type;
 	union {
-		/* DAMON_REGION_SAMPLING_TARGET */
-		struct list_head region_targets;
+		struct {		/* DAMON_ADAPTIVE_TARGET */
+			unsigned long min_nr_regions;
+			unsigned long max_nr_regions;
+			struct list_head adaptive_targets;
+		};
 
-		/* DAMON_ARBITRARY_TARGET */
-		void *arbitrary_target;
+		void *arbitrary_target;	/* DAMON_ARBITRARY_TARGET */
 	};
 };
 
@@ -235,10 +244,10 @@ struct damon_ctx {
 	list_for_each_entry_safe(r, next, &t->regions_list, list)
 
 #define damon_for_each_target(t, ctx) \
-	list_for_each_entry(t, &(ctx)->region_targets, list)
+	list_for_each_entry(t, &(ctx)->adaptive_targets, list)
 
 #define damon_for_each_target_safe(t, next, ctx)	\
-	list_for_each_entry_safe(t, next, &(ctx)->region_targets, list)
+	list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
 
 #ifdef CONFIG_DAMON
 
@@ -252,11 +261,13 @@ struct damon_target *damon_new_target(unsigned long id);
 void damon_add_target(struct damon_ctx *ctx, struct damon_target *t);
 void damon_free_target(struct damon_target *t);
 void damon_destroy_target(struct damon_target *t);
+unsigned int damon_nr_regions(struct damon_target *t);
 
 struct damon_ctx *damon_new_ctx(enum damon_target_type type);
 void damon_destroy_ctx(struct damon_ctx *ctx);
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
-		unsigned long aggr_int, unsigned long regions_update_int);
+		unsigned long aggr_int, unsigned long regions_update_int,
+		unsigned long min_nr_reg, unsigned long max_nr_reg);
 
 int damon_start(struct damon_ctx **ctxs, int nr_ctxs);
 int damon_stop(struct damon_ctx **ctxs, int nr_ctxs);
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 167487e75737..0f9beb60d9dd 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -10,8 +10,12 @@
 #include <linux/damon.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
+#include <linux/random.h>
 #include <linux/slab.h>
 
+/* Get a random number in [l, r) */
+#define damon_rand(l, r) (l + prandom_u32_max(r - l))
+
 static DEFINE_MUTEX(damon_lock);
 static int nr_running_ctxs;
 
@@ -87,7 +91,7 @@ struct damon_target *damon_new_target(unsigned long id)
 
 void damon_add_target(struct damon_ctx *ctx, struct damon_target *t)
 {
-	list_add_tail(&t->list, &ctx->region_targets);
+	list_add_tail(&t->list, &ctx->adaptive_targets);
 }
 
 static void damon_del_target(struct damon_target *t)
@@ -110,6 +114,17 @@ void damon_destroy_target(struct damon_target *t)
 	damon_free_target(t);
 }
 
+unsigned int damon_nr_regions(struct damon_target *t)
+{
+	struct damon_region *r;
+	unsigned int nr_regions = 0;
+
+	damon_for_each_region(r, t)
+		nr_regions++;
+
+	return nr_regions;
+}
+
 struct damon_ctx *damon_new_ctx(enum damon_target_type type)
 {
 	struct damon_ctx *ctx;
@@ -128,8 +143,12 @@ struct damon_ctx *damon_new_ctx(enum damon_target_type type)
 	mutex_init(&ctx->kdamond_lock);
 
 	ctx->target_type = type;
-	if (type != DAMON_ARBITRARY_TARGET)
-		INIT_LIST_HEAD(&ctx->region_targets);
+	if (type != DAMON_ARBITRARY_TARGET) {
+		ctx->min_nr_regions = 10;
+		ctx->max_nr_regions = 1000;
+
+		INIT_LIST_HEAD(&ctx->adaptive_targets);
+	}
 
 	return ctx;
 }
@@ -150,6 +169,8 @@ void damon_destroy_ctx(struct damon_ctx *ctx)
  * @sample_int:		time interval between samplings
  * @aggr_int:		time interval between aggregations
  * @regions_update_int:	time interval between target regions update
+ * @min_nr_reg:		minimal number of regions
+ * @max_nr_reg:		maximum number of regions
  *
  * This function should not be called while the kdamond is running.
  * Every time interval is in micro-seconds.
@@ -157,15 +178,51 @@ void damon_destroy_ctx(struct damon_ctx *ctx)
  * Return: 0 on success, negative error code otherwise.
  */
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
-		    unsigned long aggr_int, unsigned long regions_update_int)
+		    unsigned long aggr_int, unsigned long regions_update_int,
+		    unsigned long min_nr_reg, unsigned long max_nr_reg)
 {
+	if (min_nr_reg < 3) {
+		pr_err("min_nr_regions (%lu) must be at least 3\n",
+				min_nr_reg);
+		return -EINVAL;
+	}
+	if (min_nr_reg > max_nr_reg) {
+		pr_err("invalid nr_regions.  min (%lu) > max (%lu)\n",
+				min_nr_reg, max_nr_reg);
+		return -EINVAL;
+	}
+
 	ctx->sample_interval = sample_int;
 	ctx->aggr_interval = aggr_int;
 	ctx->regions_update_interval = regions_update_int;
+	if (ctx->target_type != DAMON_ARBITRARY_TARGET) {
+		ctx->min_nr_regions = min_nr_reg;
+		ctx->max_nr_regions = max_nr_reg;
+	}
 
 	return 0;
 }
 
+/* Returns the size upper limit for each monitoring region */
+static unsigned long damon_region_sz_limit(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	struct damon_region *r;
+	unsigned long sz = 0;
+
+	damon_for_each_target(t, ctx) {
+		damon_for_each_region(r, t)
+			sz += r->ar.end - r->ar.start;
+	}
+
+	if (ctx->min_nr_regions)
+		sz /= ctx->min_nr_regions;
+	if (sz < DAMON_MIN_REGION)
+		sz = DAMON_MIN_REGION;
+
+	return sz;
+}
+
 static bool damon_kdamond_running(struct damon_ctx *ctx)
 {
 	bool running;
@@ -332,6 +389,146 @@ static void kdamond_reset_aggregated(struct damon_ctx *c)
 	}
 }
 
+#define sz_damon_region(r) (r->ar.end - r->ar.start)
+
+/*
+ * Merge two adjacent regions into one region
+ */
+static void damon_merge_two_regions(struct damon_region *l,
+				struct damon_region *r)
+{
+	unsigned long sz_l = sz_damon_region(l), sz_r = sz_damon_region(r);
+
+	l->nr_accesses = (l->nr_accesses * sz_l + r->nr_accesses * sz_r) /
+			(sz_l + sz_r);
+	l->ar.end = r->ar.end;
+	damon_destroy_region(r);
+}
+
+#define diff_of(a, b) (a > b ? a - b : b - a)
+
+/*
+ * Merge adjacent regions having similar access frequencies
+ *
+ * t		target affected by this merge operation
+ * thres	'->nr_accesses' diff threshold for the merge
+ * sz_limit	size upper limit of each region
+ */
+static void damon_merge_regions_of(struct damon_target *t, unsigned int thres,
+				   unsigned long sz_limit)
+{
+	struct damon_region *r, *prev = NULL, *next;
+
+	damon_for_each_region_safe(r, next, t) {
+		if (prev && prev->ar.end == r->ar.start &&
+		    diff_of(prev->nr_accesses, r->nr_accesses) <= thres &&
+		    sz_damon_region(prev) + sz_damon_region(r) <= sz_limit)
+			damon_merge_two_regions(prev, r);
+		else
+			prev = r;
+	}
+}
+
+/*
+ * Merge adjacent regions having similar access frequencies
+ *
+ * threshold	'->nr_accesses' diff threshold for the merge
+ * sz_limit	size upper limit of each region
+ *
+ * This function merges monitoring target regions which are adjacent and their
+ * access frequencies are similar.  This is for minimizing the monitoring
+ * overhead under the dynamically changeable access pattern.  If a merge was
+ * unnecessarily made, later 'kdamond_split_regions()' will revert it.
+ */
+static void kdamond_merge_regions(struct damon_ctx *c, unsigned int threshold,
+				  unsigned long sz_limit)
+{
+	struct damon_target *t;
+
+	damon_for_each_target(t, c)
+		damon_merge_regions_of(t, threshold, sz_limit);
+}
+
+/*
+ * Split a region in two
+ *
+ * r		the region to be split
+ * sz_r		size of the first sub-region that will be made
+ */
+static void damon_split_region_at(struct damon_ctx *ctx,
+				  struct damon_region *r, unsigned long sz_r)
+{
+	struct damon_region *new;
+
+	new = damon_new_region(r->ar.start + sz_r, r->ar.end);
+	r->ar.end = new->ar.start;
+
+	damon_insert_region(new, r, damon_next_region(r));
+}
+
+/* Split every region in the given target into 'nr_subs' regions */
+static void damon_split_regions_of(struct damon_ctx *ctx,
+				     struct damon_target *t, int nr_subs)
+{
+	struct damon_region *r, *next;
+	unsigned long sz_region, sz_sub = 0;
+	int i;
+
+	damon_for_each_region_safe(r, next, t) {
+		sz_region = r->ar.end - r->ar.start;
+
+		for (i = 0; i < nr_subs - 1 &&
+				sz_region > 2 * DAMON_MIN_REGION; i++) {
+			/*
+			 * Randomly select size of left sub-region to be at
+			 * least 10 percent and at most 90% of original region
+			 */
+			sz_sub = ALIGN_DOWN(damon_rand(1, 10) *
+					sz_region / 10, DAMON_MIN_REGION);
+			/* Do not allow blank region */
+			if (sz_sub == 0 || sz_sub >= sz_region)
+				continue;
+
+			damon_split_region_at(ctx, r, sz_sub);
+			sz_region = sz_sub;
+		}
+	}
+}
+
+/*
+ * Split every target region into randomly-sized small regions
+ *
+ * This function splits every target region into random-sized small regions if
+ * current total number of the regions is equal or smaller than half of the
+ * user-specified maximum number of regions.  This is for maximizing the
+ * monitoring accuracy under the dynamically changeable access patterns.  If a
+ * split was unnecessarily made, later 'kdamond_merge_regions()' will revert
+ * it.
+ */
+static void kdamond_split_regions(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	unsigned int nr_regions = 0;
+	static unsigned int last_nr_regions;
+	int nr_subregions = 2;
+
+	damon_for_each_target(t, ctx)
+		nr_regions += damon_nr_regions(t);
+
+	if (nr_regions > ctx->max_nr_regions / 2)
+		return;
+
+	/* Maybe the middle of the region has different access frequency */
+	if (last_nr_regions == nr_regions &&
+			nr_regions < ctx->max_nr_regions / 3)
+		nr_subregions = 3;
+
+	damon_for_each_target(t, ctx)
+		damon_split_regions_of(ctx, t, nr_subregions);
+
+	last_nr_regions = nr_regions;
+}
+
 /*
  * Check whether it is time to check and apply the target monitoring regions
  *
@@ -391,6 +588,8 @@ static int kdamond_fn(void *data)
 	struct damon_ctx *ctx = (struct damon_ctx *)data;
 	struct damon_target *t;
 	struct damon_region *r, *next;
+	unsigned int max_nr_accesses = 0;
+	unsigned long sz_limit = 0;
 
 	pr_info("kdamond (%d) starts\n", ctx->kdamond->pid);
 
@@ -399,6 +598,8 @@ static int kdamond_fn(void *data)
 	if (ctx->callback.before_start && ctx->callback.before_start(ctx))
 		set_kdamond_stop(ctx);
 
+	sz_limit = damon_region_sz_limit(ctx);
+
 	while (!kdamond_need_stop(ctx)) {
 		if (ctx->primitive.prepare_access_checks)
 			ctx->primitive.prepare_access_checks(ctx);
@@ -409,14 +610,20 @@ static int kdamond_fn(void *data)
 		usleep_range(ctx->sample_interval, ctx->sample_interval + 1);
 
 		if (ctx->primitive.check_accesses)
-			ctx->primitive.check_accesses(ctx);
+			max_nr_accesses = ctx->primitive.check_accesses(ctx);
 
 		if (kdamond_aggregate_interval_passed(ctx)) {
+			if (ctx->target_type != DAMON_ARBITRARY_TARGET)
+				kdamond_merge_regions(ctx,
+						max_nr_accesses / 10,
+						sz_limit);
 			if (ctx->callback.after_aggregation &&
 					ctx->callback.after_aggregation(ctx))
 				set_kdamond_stop(ctx);
-			if (ctx->target_type != DAMON_ARBITRARY_TARGET)
+			if (ctx->target_type != DAMON_ARBITRARY_TARGET) {
 				kdamond_reset_aggregated(ctx);
+				kdamond_split_regions(ctx);
+			}
 			if (ctx->primitive.reset_aggregated)
 				ctx->primitive.reset_aggregated(ctx);
 		}
@@ -424,6 +631,7 @@ static int kdamond_fn(void *data)
 		if (kdamond_need_update_regions(ctx)) {
 			if (ctx->primitive.update_target_regions)
 				ctx->primitive.update_target_regions(ctx);
+			sz_limit = damon_region_sz_limit(ctx);
 		}
 	}
 	if (ctx->target_type != DAMON_ARBITRARY_TARGET) {
-- 
2.17.1

