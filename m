Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0D1284BC9
	for <lists+linux-doc@lfdr.de>; Tue,  6 Oct 2020 14:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgJFMlW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Oct 2020 08:41:22 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:14164 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgJFMlW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Oct 2020 08:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1601988079; x=1633524079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=HVZqt8yk4JhMKSbQ6GNwP4IcSAY3YUptuDygxyxjPMA=;
  b=cCIyqPtze1uJQcgCu/9LSlLd4u34zg4O5MupDIk7j8icPMzoia/yy4f8
   pz+EkrVLCwShhCViPQwWbXDJ68RsTAE2zkRNHMri35epue5RhAohQo1LG
   qzj+0RGMmYhl8s0vRSojvoZCrbfQGaxlGzfawTavp+8MDlUt1Wyjd3Phu
   g=;
X-IronPort-AV: E=Sophos;i="5.77,343,1596499200"; 
   d="scan'208";a="81962852"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 06 Oct 2020 12:41:10 +0000
Received: from EX13D31EUA004.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS id 31243A03A7;
        Tue,  6 Oct 2020 12:41:09 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.237) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 6 Oct 2020 12:40:51 +0000
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
Subject: [RFC v15 2/8] mm/damon/core: Implement DAMON-based Operation Schemes (DAMOS)
Date:   Tue, 6 Oct 2020 14:39:25 +0200
Message-ID: <20201006123931.5847-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006123931.5847-1-sjpark@amazon.com>
References: <20201006123931.5847-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D18UWA002.ant.amazon.com (10.43.160.199) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

In many cases, users might use DAMON for simple data access aware
memory management optimizations such as applying an operation scheme to
a memory region of a specific size having a specific access frequency
for a specific time.  For example, "page out a memory region larger than
100 MiB but having a low access frequency more than 10 minutes", or "Use
THP for a memory region larger than 2 MiB having a high access frequency
for more than 2 seconds".

Most simple form of the solution would be doing offline data access
pattern profiling using DAMON and modifying the application source code
or system configuration based on the profiling results.  Or, developing
a daemon constructed with two modules (one for access monitoring and the
other for applying memory management actions via mlock(), madvise(),
sysctl, etc) is imaginable.

To avoid users spending their time for implementation of such simple
data access monitoring-based operation schemes, this commit makes DAMON
to handle such schemes directly.  With this commit, users can simply
specify their desired schemes to DAMON.  Then, DAMON will automatically
apply the schemes to the the user-specified target processes.

Each of the schemes is composed with conditions for filtering of the
target memory regions and desired memory management action for the
target.  Specifically, the format is::

    <min/max size> <min/max access frequency> <min/max age> <action>

The filtering conditions are size of memory region, number of accesses
to the region monitored by DAMON, and the age of the region.  The age of
region is incremented periodically but reset when its addresses or
access frequency has significantly changed or the action of a scheme was
applied.  For the action, current implementation supports a few of
madvise()-like hints, ``WILLNEED``, ``COLD``, ``PAGEOUT``, ``HUGEPAGE``,
and ``NOHUGEPAGE``.

Because DAMON supports various address spaces and application of the
actions to a monitoring target region is dependent to the type of the
target address space, the application code should be implemented by each
primitives and registered to the framework.  Note that this commit only
implements the framework part.  Following commit will implement the
action applications for virtual address spaces primitives.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h |  70 +++++++++++++++++++++++++--
 mm/damon/core.c       | 109 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 175 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 696f25e25d95..92944a336286 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -64,6 +64,48 @@ struct damon_target {
 	struct list_head list;
 };
 
+/**
+ * enum damos_action - Represents an action of a Data Access Monitoring-based
+ * Operation Scheme.
+ *
+ * @DAMOS_WILLNEED:	Call ``madvise()`` for the region with MADV_WILLNEED.
+ * @DAMOS_COLD:		Call ``madvise()`` for the region with MADV_COLD.
+ * @DAMOS_PAGEOUT:	Call ``madvise()`` for the region with MADV_PAGEOUT.
+ * @DAMOS_HUGEPAGE:	Call ``madvise()`` for the region with MADV_HUGEPAGE.
+ * @DAMOS_NOHUGEPAGE:	Call ``madvise()`` for the region with MADV_NOHUGEPAGE.
+ */
+enum damos_action {
+	DAMOS_WILLNEED,
+	DAMOS_COLD,
+	DAMOS_PAGEOUT,
+	DAMOS_HUGEPAGE,
+	DAMOS_NOHUGEPAGE,
+};
+
+/**
+ * struct damos - Represents a Data Access Monitoring-based Operation Scheme.
+ * @min_sz_region:	Minimum size of target regions.
+ * @max_sz_region:	Maximum size of target regions.
+ * @min_nr_accesses:	Minimum ``->nr_accesses`` of target regions.
+ * @max_nr_accesses:	Maximum ``->nr_accesses`` of target regions.
+ * @min_age_region:	Minimum age of target regions.
+ * @max_age_region:	Maximum age of target regions.
+ * @action:		&damo_action to be applied to the target regions.
+ * @list:		List head for siblings.
+ *
+ * Note that both the minimums and the maximums are inclusive.
+ */
+struct damos {
+	unsigned long min_sz_region;
+	unsigned long max_sz_region;
+	unsigned int min_nr_accesses;
+	unsigned int max_nr_accesses;
+	unsigned int min_age_region;
+	unsigned int max_age_region;
+	enum damos_action action;
+	struct list_head list;
+};
+
 struct damon_ctx;
 
 /**
@@ -73,6 +115,7 @@ struct damon_ctx;
  * @update_target_regions:	Updates monitoring target regions.
  * @prepare_access_checks:	Prepares next access check of target regions.
  * @check_accesses:		Checks the access of target regions.
+ * @apply_scheme:		Apply a DAMON-based operation scheme.
  * @target_valid:		Determine if the target is valid.
  * @cleanup:			Cleans up the context.
  *
@@ -83,19 +126,20 @@ struct damon_ctx;
  * @update_target_regions for each @regions_update_interval, and
  * @prepare_access_checks, @check_accesses, and @target_valid for each
  * @sample_interval.
-
  *
  * @init_target_regions should construct proper monitoring target regions and
  * link those to the DAMON context struct.
  * @update_target_regions should update the monitoring target regions for
  * current status.
-
  * @prepare_access_checks should manipulate the monitoring regions to be
  * prepare for the next access check.
  * @check_accesses should check the accesses to each region that made after the
  * last preparation and update the `->nr_accesses` of each region.  It should
  * also return max &damon_region.nr_accesses that made as a result of its
  * update.
+ * @apply_scheme is called from @kdamond when a region for user provided
+ * DAMON-based operation scheme is found.  It should apply the scheme's action
+ * to the region.
  * @target_valid should check whether the target is still valid for the
  * monitoring.
  * @cleanup is called from @kdamond just before its termination.  After this
@@ -106,6 +150,8 @@ struct damon_primitive {
 	void (*update_target_regions)(struct damon_ctx *context);
 	void (*prepare_access_checks)(struct damon_ctx *context);
 	unsigned int (*check_accesses)(struct damon_ctx *context);
+	int (*apply_scheme)(struct damon_ctx *context, struct damon_target *t,
+			struct damon_region *r, struct damos *scheme);
 	bool (*target_valid)(struct damon_target *target);
 	void (*cleanup)(struct damon_ctx *context);
 };
@@ -180,6 +226,7 @@ struct damon_callback {
  * @kdamond_lock.  Accesses to other fields must be protected by themselves.
  *
  * @targets_list:	Head of monitoring targets (&damon_target) list.
+ * @schemes_list:	Head of schemes (&damos) list.
  *
  * @primitive:	Set of monitoring primitives for given use cases.
  * @callback:	Set of callbacks for monitoring events notifications.
@@ -199,6 +246,7 @@ struct damon_ctx {
 	struct mutex kdamond_lock;
 
 	struct list_head targets_list;	/* 'damon_target' objects */
+	struct list_head schemes_list;	/* 'damos' objects */
 
 	struct damon_primitive primitive;
 	struct damon_callback callback;
@@ -222,6 +270,12 @@ struct damon_ctx {
 #define damon_for_each_target_safe(t, next, ctx) \
 	list_for_each_entry_safe(t, next, &(ctx)->targets_list, list)
 
+#define damon_for_each_scheme(s, ctx) \
+	list_for_each_entry(s, &(ctx)->schemes_list, list)
+
+#define damon_for_each_scheme_safe(s, next, ctx) \
+	list_for_each_entry_safe(s, next, &(ctx)->schemes_list, list)
+
 #ifdef CONFIG_DAMON
 
 struct damon_region *damon_new_region(unsigned long start, unsigned long end);
@@ -230,6 +284,14 @@ inline void damon_insert_region(struct damon_region *r,
 void damon_add_region(struct damon_region *r, struct damon_target *t);
 void damon_destroy_region(struct damon_region *r);
 
+struct damos *damon_new_scheme(
+		unsigned long min_sz_region, unsigned long max_sz_region,
+		unsigned int min_nr_accesses, unsigned int max_nr_accesses,
+		unsigned int min_age_region, unsigned int max_age_region,
+		enum damos_action action);
+void damon_add_scheme(struct damon_ctx *ctx, struct damos *s);
+void damon_destroy_scheme(struct damos *s);
+
 struct damon_target *damon_new_target(unsigned long id);
 void damon_add_target(struct damon_ctx *ctx, struct damon_target *t);
 void damon_free_target(struct damon_target *t);
@@ -243,8 +305,10 @@ int damon_set_targets(struct damon_ctx *ctx,
 int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
 		unsigned long aggr_int, unsigned long regions_update_int,
 		unsigned long min_nr_reg, unsigned long max_nr_reg);
-
+int damon_set_schemes(struct damon_ctx *ctx,
+			struct damos **schemes, ssize_t nr_schemes);
 int damon_nr_running_ctxs(void);
+
 int damon_start(struct damon_ctx **ctxs, int nr_ctxs);
 int damon_stop(struct damon_ctx **ctxs, int nr_ctxs);
 
diff --git a/mm/damon/core.c b/mm/damon/core.c
index cf3a83509bfc..7a2aeba3d18d 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -87,6 +87,50 @@ void damon_destroy_region(struct damon_region *r)
 	damon_free_region(r);
 }
 
+struct damos *damon_new_scheme(
+		unsigned long min_sz_region, unsigned long max_sz_region,
+		unsigned int min_nr_accesses, unsigned int max_nr_accesses,
+		unsigned int min_age_region, unsigned int max_age_region,
+		enum damos_action action)
+{
+	struct damos *scheme;
+
+	scheme = kmalloc(sizeof(*scheme), GFP_KERNEL);
+	if (!scheme)
+		return NULL;
+	scheme->min_sz_region = min_sz_region;
+	scheme->max_sz_region = max_sz_region;
+	scheme->min_nr_accesses = min_nr_accesses;
+	scheme->max_nr_accesses = max_nr_accesses;
+	scheme->min_age_region = min_age_region;
+	scheme->max_age_region = max_age_region;
+	scheme->action = action;
+	INIT_LIST_HEAD(&scheme->list);
+
+	return scheme;
+}
+
+void damon_add_scheme(struct damon_ctx *ctx, struct damos *s)
+{
+	list_add_tail(&s->list, &ctx->schemes_list);
+}
+
+static void damon_del_scheme(struct damos *s)
+{
+	list_del(&s->list);
+}
+
+static void damon_free_scheme(struct damos *s)
+{
+	kfree(s);
+}
+
+void damon_destroy_scheme(struct damos *s)
+{
+	damon_del_scheme(s);
+	damon_free_scheme(s);
+}
+
 /*
  * Construct a damon_target struct
  *
@@ -162,6 +206,7 @@ struct damon_ctx *damon_new_ctx(void)
 	mutex_init(&ctx->kdamond_lock);
 
 	INIT_LIST_HEAD(&ctx->targets_list);
+	INIT_LIST_HEAD(&ctx->schemes_list);
 
 	return ctx;
 }
@@ -169,10 +214,14 @@ struct damon_ctx *damon_new_ctx(void)
 void damon_destroy_ctx(struct damon_ctx *ctx)
 {
 	struct damon_target *t, *next_t;
+	struct damos *s, *next_s;
 
 	damon_for_each_target_safe(t, next_t, ctx)
 		damon_destroy_target(t);
 
+	damon_for_each_scheme_safe(s, next_s, ctx)
+		damon_destroy_scheme(s);
+
 	kfree(ctx);
 }
 
@@ -245,6 +294,30 @@ int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
 	return 0;
 }
 
+/**
+ * damon_set_schemes() - Set data access monitoring based operation schemes.
+ * @ctx:	monitoring context
+ * @schemes:	array of the schemes
+ * @nr_schemes:	number of entries in @schemes
+ *
+ * This function should not be called while the kdamond of the context is
+ * running.
+ *
+ * Return: 0 if success, or negative error code otherwise.
+ */
+int damon_set_schemes(struct damon_ctx *ctx, struct damos **schemes,
+			ssize_t nr_schemes)
+{
+	struct damos *s, *next;
+	ssize_t i;
+
+	damon_for_each_scheme_safe(s, next, ctx)
+		damon_destroy_scheme(s);
+	for (i = 0; i < nr_schemes; i++)
+		damon_add_scheme(ctx, schemes[i]);
+	return 0;
+}
+
 /**
  * damon_nr_running_ctxs() - Return number of currently running contexts.
  */
@@ -452,6 +525,39 @@ static void kdamond_reset_aggregated(struct damon_ctx *c)
 	}
 }
 
+static void damon_do_apply_schemes(struct damon_ctx *c,
+				   struct damon_target *t,
+				   struct damon_region *r)
+{
+	struct damos *s;
+	unsigned long sz;
+
+	damon_for_each_scheme(s, c) {
+		sz = r->ar.end - r->ar.start;
+		if (sz < s->min_sz_region || s->max_sz_region < sz)
+			continue;
+		if (r->nr_accesses < s->min_nr_accesses ||
+				s->max_nr_accesses < r->nr_accesses)
+			continue;
+		if (r->age < s->min_age_region || s->max_age_region < r->age)
+			continue;
+		if (c->primitive.apply_scheme)
+			c->primitive.apply_scheme(c, t, r, s);
+		r->age = 0;
+	}
+}
+
+static void kdamond_apply_schemes(struct damon_ctx *c)
+{
+	struct damon_target *t;
+	struct damon_region *r;
+
+	damon_for_each_target(t, c) {
+		damon_for_each_region(r, t)
+			damon_do_apply_schemes(c, t, r);
+	}
+}
+
 #define sz_damon_region(r) (r->ar.end - r->ar.start)
 
 /*
@@ -519,7 +625,7 @@ static void kdamond_merge_regions(struct damon_ctx *c, unsigned int threshold,
 }
 
 /*
- * Split a region in two smaller regions
+ * Split a region in two
  *
  * r		the region to be split
  * sz_r		size of the first sub-region that will be made
@@ -692,6 +798,7 @@ static int kdamond_fn(void *data)
 			kdamond_merge_regions(ctx, max_nr_accesses / 10,
 					sz_limit);
 			kdamond_callback(ctx, after_aggregation);
+			kdamond_apply_schemes(ctx);
 			kdamond_reset_aggregated(ctx);
 			kdamond_split_regions(ctx);
 		}
-- 
2.17.1

