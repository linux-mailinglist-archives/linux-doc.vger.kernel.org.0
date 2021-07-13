Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92353C705A
	for <lists+linux-doc@lfdr.de>; Tue, 13 Jul 2021 14:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbhGMMhH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Jul 2021 08:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236252AbhGMMhG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jul 2021 08:37:06 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0425EC0613DD;
        Tue, 13 Jul 2021 05:34:17 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id p10so3502203qvk.7;
        Tue, 13 Jul 2021 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DQEjq1I/eUhfrKuKSuJPzFUGz3FMxdH2vwGhP30DhIM=;
        b=Pe5zlh7PChBiThUEb1slkvU2z0nx/VSzhshw8F3hYczMqnucLFvRdbFrjr6SQ+kSUD
         o/8pvsyhq6jQ1A+lJ6hLFMq7JENEpPA5ebqqZfmqvWmp0Hxv97makve2FEeqS7loXzho
         6xL/NOS8E+S4xVJFFuxYsoNURS0cMmYrCtn91ItXU9t4qkTZSoBH2AKmDqIUHoPDmI8a
         /vGtUo7lzKrqKKyAc86xMoHnK372EyaSuJipyF4mHhrIDzt/Dgo2+yjZ2A3+ApUrmwlA
         BvBD3fAY5wY7/FpgEtlLzYcPQ0VsLpQihDOCVJS6ZtOplJVWr0DWgDEmGe5pUHVgo/6u
         rZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DQEjq1I/eUhfrKuKSuJPzFUGz3FMxdH2vwGhP30DhIM=;
        b=abmvzRUvROXHjQJyQcvoQvNFmL+ZUH6mWxC1dX8vTwD1G+PQ3YrpjpWiaeTjhSZwVo
         pbLAyWmAkSgbdFCYmw+H7Bl114ZtX/9DCCm6IOoO8UFgzbt2+wO3YdlEHMI6I2r748Ls
         fitPCueNqs0dLyFiezEDgy8oivvKznF5fWJ78GABgUN6g5HaKWzL1EGo7PN5SpUCo1iZ
         3dVRMp4u/evbFdxHAjBGBP5mS2t3IsHJGrsr/Ru958/CVCk2IoM4aLlCGPxKNJbMmZ3t
         2wMfzm3Blv+rDF8QQuXo4DHQIQVlxuAs7T0MwQKOtWRpBIuBYERyJ9uS+jF9O8QNzDo9
         0eVw==
X-Gm-Message-State: AOAM530YeX4+Mdb/6oJtpLwZiUdOxoOu5hMPaDycIN41j/yOPXM9C0uV
        a6rdOSQhdBpqfz86rhh7ZcqqA3NBkeF2kKNl
X-Google-Smtp-Source: ABdhPJzvKwHGT513rSI3MvdZqMZo3f/wsNBBD4m+6IOgfxCBH0WXCSb+CWfc/kTUr1tyCXGFxCvPKw==
X-Received: by 2002:a05:6214:ccd:: with SMTP id 13mr4595370qvx.31.1626179656074;
        Tue, 13 Jul 2021 05:34:16 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id k14sm6849327qtm.18.2021.07.13.05.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 05:34:15 -0700 (PDT)
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
Subject: [PATCH v33 03/13] mm/damon: Adaptively adjust regions
Date:   Tue, 13 Jul 2021 12:33:46 +0000
Message-Id: <20210713123356.6924-4-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713123356.6924-1-sj38.park@gmail.com>
References: <20210713123356.6924-1-sj38.park@gmail.com>
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
Reviewed-by: Fernand Sieber <sieberf@amazon.com>
Acked-by: Shakeel Butt <shakeelb@google.com>
---
 include/linux/damon.h |  30 ++++--
 mm/damon/core.c       | 224 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 237 insertions(+), 17 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 67db309ad61b..ce2a84b26cd7 100644
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
@@ -39,6 +42,7 @@ struct damon_region {
 /**
  * struct damon_target - Represents a monitoring target.
  * @id:			Unique identifier for this target.
+ * @nr_regions:		Number of monitoring target regions of this target.
  * @regions_list:	Head of the monitoring target regions of this target.
  * @list:		List head for siblings.
  *
@@ -50,6 +54,7 @@ struct damon_region {
  */
 struct damon_target {
 	unsigned long id;
+	unsigned int nr_regions;
 	struct list_head regions_list;
 	struct list_head list;
 };
@@ -85,6 +90,8 @@ struct damon_ctx;
  * prepared for the next access check.
  * @check_accesses should check the accesses to each region that made after the
  * last preparation and update the number of observed accesses of each region.
+ * It should also return max number of observed accesses that made as a result
+ * of its update.  The value will be used for regions adjustment threshold.
  * @reset_aggregated should reset the access monitoring results that aggregated
  * by @check_accesses.
  * @target_valid should check whether the target is still valid for the
@@ -95,7 +102,7 @@ struct damon_primitive {
 	void (*init)(struct damon_ctx *context);
 	void (*update)(struct damon_ctx *context);
 	void (*prepare_access_checks)(struct damon_ctx *context);
-	void (*check_accesses)(struct damon_ctx *context);
+	unsigned int (*check_accesses)(struct damon_ctx *context);
 	void (*reset_aggregated)(struct damon_ctx *context);
 	bool (*target_valid)(void *target);
 	void (*cleanup)(struct damon_ctx *context);
@@ -172,7 +179,9 @@ struct damon_callback {
  * @primitive:	Set of monitoring primitives for given use cases.
  * @callback:	Set of callbacks for monitoring events notifications.
  *
- * @region_targets:	Head of monitoring targets (&damon_target) list.
+ * @min_nr_regions:	The minimum number of adaptive monitoring regions.
+ * @max_nr_regions:	The maximum number of adaptive monitoring regions.
+ * @adaptive_targets:	Head of monitoring targets (&damon_target) list.
  */
 struct damon_ctx {
 	unsigned long sample_interval;
@@ -191,7 +200,9 @@ struct damon_ctx {
 	struct damon_primitive primitive;
 	struct damon_callback callback;
 
-	struct list_head region_targets;
+	unsigned long min_nr_regions;
+	unsigned long max_nr_regions;
+	struct list_head adaptive_targets;
 };
 
 #define damon_next_region(r) \
@@ -207,28 +218,31 @@ struct damon_ctx {
 	list_for_each_entry_safe(r, next, &t->regions_list, list)
 
 #define damon_for_each_target(t, ctx) \
-	list_for_each_entry(t, &(ctx)->region_targets, list)
+	list_for_each_entry(t, &(ctx)->adaptive_targets, list)
 
 #define damon_for_each_target_safe(t, next, ctx)	\
-	list_for_each_entry_safe(t, next, &(ctx)->region_targets, list)
+	list_for_each_entry_safe(t, next, &(ctx)->adaptive_targets, list)
 
 #ifdef CONFIG_DAMON
 
 struct damon_region *damon_new_region(unsigned long start, unsigned long end);
 inline void damon_insert_region(struct damon_region *r,
-		struct damon_region *prev, struct damon_region *next);
+		struct damon_region *prev, struct damon_region *next,
+		struct damon_target *t);
 void damon_add_region(struct damon_region *r, struct damon_target *t);
-void damon_destroy_region(struct damon_region *r);
+void damon_destroy_region(struct damon_region *r, struct damon_target *t);
 
 struct damon_target *damon_new_target(unsigned long id);
 void damon_add_target(struct damon_ctx *ctx, struct damon_target *t);
 void damon_free_target(struct damon_target *t);
 void damon_destroy_target(struct damon_target *t);
+unsigned int damon_nr_regions(struct damon_target *t);
 
 struct damon_ctx *damon_new_ctx(void);
 void damon_destroy_ctx(struct damon_ctx *ctx);
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
-		unsigned long aggr_int, unsigned long primitive_upd_int);
+		unsigned long aggr_int, unsigned long primitive_upd_int,
+		unsigned long min_nr_reg, unsigned long max_nr_reg);
 
 int damon_start(struct damon_ctx **ctxs, int nr_ctxs);
 int damon_stop(struct damon_ctx **ctxs, int nr_ctxs);
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 947486a150ce..28a2c78914fa 100644
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
 
@@ -40,19 +44,23 @@ struct damon_region *damon_new_region(unsigned long start, unsigned long end)
  * Add a region between two other regions
  */
 inline void damon_insert_region(struct damon_region *r,
-		struct damon_region *prev, struct damon_region *next)
+		struct damon_region *prev, struct damon_region *next,
+		struct damon_target *t)
 {
 	__list_add(&r->list, &prev->list, &next->list);
+	t->nr_regions++;
 }
 
 void damon_add_region(struct damon_region *r, struct damon_target *t)
 {
 	list_add_tail(&r->list, &t->regions_list);
+	t->nr_regions++;
 }
 
-static void damon_del_region(struct damon_region *r)
+static void damon_del_region(struct damon_region *r, struct damon_target *t)
 {
 	list_del(&r->list);
+	t->nr_regions--;
 }
 
 static void damon_free_region(struct damon_region *r)
@@ -60,9 +68,9 @@ static void damon_free_region(struct damon_region *r)
 	kfree(r);
 }
 
-void damon_destroy_region(struct damon_region *r)
+void damon_destroy_region(struct damon_region *r, struct damon_target *t)
 {
-	damon_del_region(r);
+	damon_del_region(r, t);
 	damon_free_region(r);
 }
 
@@ -80,6 +88,7 @@ struct damon_target *damon_new_target(unsigned long id)
 		return NULL;
 
 	t->id = id;
+	t->nr_regions = 0;
 	INIT_LIST_HEAD(&t->regions_list);
 
 	return t;
@@ -87,7 +96,7 @@ struct damon_target *damon_new_target(unsigned long id)
 
 void damon_add_target(struct damon_ctx *ctx, struct damon_target *t)
 {
-	list_add_tail(&t->list, &ctx->region_targets);
+	list_add_tail(&t->list, &ctx->adaptive_targets);
 }
 
 static void damon_del_target(struct damon_target *t)
@@ -110,6 +119,11 @@ void damon_destroy_target(struct damon_target *t)
 	damon_free_target(t);
 }
 
+unsigned int damon_nr_regions(struct damon_target *t)
+{
+	return t->nr_regions;
+}
+
 struct damon_ctx *damon_new_ctx(void)
 {
 	struct damon_ctx *ctx;
@@ -127,7 +141,10 @@ struct damon_ctx *damon_new_ctx(void)
 
 	mutex_init(&ctx->kdamond_lock);
 
-	INIT_LIST_HEAD(&ctx->region_targets);
+	ctx->min_nr_regions = 10;
+	ctx->max_nr_regions = 1000;
+
+	INIT_LIST_HEAD(&ctx->adaptive_targets);
 
 	return ctx;
 }
@@ -157,6 +174,8 @@ void damon_destroy_ctx(struct damon_ctx *ctx)
  * @sample_int:		time interval between samplings
  * @aggr_int:		time interval between aggregations
  * @primitive_upd_int:	time interval between monitoring primitive updates
+ * @min_nr_reg:		minimal number of regions
+ * @max_nr_reg:		maximum number of regions
  *
  * This function should not be called while the kdamond is running.
  * Every time interval is in micro-seconds.
@@ -164,15 +183,49 @@ void damon_destroy_ctx(struct damon_ctx *ctx)
  * Return: 0 on success, negative error code otherwise.
  */
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
-		    unsigned long aggr_int, unsigned long primitive_upd_int)
+		    unsigned long aggr_int, unsigned long primitive_upd_int,
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
 	ctx->primitive_update_interval = primitive_upd_int;
+	ctx->min_nr_regions = min_nr_reg;
+	ctx->max_nr_regions = max_nr_reg;
 
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
@@ -339,6 +392,150 @@ static void kdamond_reset_aggregated(struct damon_ctx *c)
 	}
 }
 
+#define sz_damon_region(r) (r->ar.end - r->ar.start)
+
+/*
+ * Merge two adjacent regions into one region
+ */
+static void damon_merge_two_regions(struct damon_target *t,
+		struct damon_region *l, struct damon_region *r)
+{
+	unsigned long sz_l = sz_damon_region(l), sz_r = sz_damon_region(r);
+
+	l->nr_accesses = (l->nr_accesses * sz_l + r->nr_accesses * sz_r) /
+			(sz_l + sz_r);
+	l->ar.end = r->ar.end;
+	damon_destroy_region(r, t);
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
+			damon_merge_two_regions(t, prev, r);
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
+		struct damon_target *t, struct damon_region *r,
+		unsigned long sz_r)
+{
+	struct damon_region *new;
+
+	new = damon_new_region(r->ar.start + sz_r, r->ar.end);
+	if (!new)
+		return;
+
+	r->ar.end = new->ar.start;
+
+	damon_insert_region(new, r, damon_next_region(r), t);
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
+			damon_split_region_at(ctx, t, r, sz_sub);
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
@@ -395,6 +592,8 @@ static int kdamond_fn(void *data)
 	struct damon_ctx *ctx = (struct damon_ctx *)data;
 	struct damon_target *t;
 	struct damon_region *r, *next;
+	unsigned int max_nr_accesses = 0;
+	unsigned long sz_limit = 0;
 
 	mutex_lock(&ctx->kdamond_lock);
 	pr_info("kdamond (%d) starts\n", ctx->kdamond->pid);
@@ -405,6 +604,8 @@ static int kdamond_fn(void *data)
 	if (ctx->callback.before_start && ctx->callback.before_start(ctx))
 		set_kdamond_stop(ctx);
 
+	sz_limit = damon_region_sz_limit(ctx);
+
 	while (!kdamond_need_stop(ctx)) {
 		if (ctx->primitive.prepare_access_checks)
 			ctx->primitive.prepare_access_checks(ctx);
@@ -415,13 +616,17 @@ static int kdamond_fn(void *data)
 		usleep_range(ctx->sample_interval, ctx->sample_interval + 1);
 
 		if (ctx->primitive.check_accesses)
-			ctx->primitive.check_accesses(ctx);
+			max_nr_accesses = ctx->primitive.check_accesses(ctx);
 
 		if (kdamond_aggregate_interval_passed(ctx)) {
+			kdamond_merge_regions(ctx,
+					max_nr_accesses / 10,
+					sz_limit);
 			if (ctx->callback.after_aggregation &&
 					ctx->callback.after_aggregation(ctx))
 				set_kdamond_stop(ctx);
 			kdamond_reset_aggregated(ctx);
+			kdamond_split_regions(ctx);
 			if (ctx->primitive.reset_aggregated)
 				ctx->primitive.reset_aggregated(ctx);
 		}
@@ -429,11 +634,12 @@ static int kdamond_fn(void *data)
 		if (kdamond_need_update_primitive(ctx)) {
 			if (ctx->primitive.update)
 				ctx->primitive.update(ctx);
+			sz_limit = damon_region_sz_limit(ctx);
 		}
 	}
 	damon_for_each_target(t, ctx) {
 		damon_for_each_region_safe(r, next, t)
-			damon_destroy_region(r);
+			damon_destroy_region(r, t);
 	}
 
 	if (ctx->callback.before_terminate &&
-- 
2.17.1

