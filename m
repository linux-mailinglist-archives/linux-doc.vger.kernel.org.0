Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587B11C540D
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2020 13:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgEELLx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 May 2020 07:11:53 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:14809 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728565AbgEELLx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 May 2020 07:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1588677113; x=1620213113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=AeotYL1r9WKHx+quJCy8j4SxAYyOTXVe356fdH8LqOQ=;
  b=Ag0RyX6QrDsAON51xiYUv6AGXJ9hOXz4gVelSREnKAO6AB7iLWawinrz
   VWtLa4EM6zAm07dgjVBYAeB+MaTvKpkbbIMXWWWbNPk/IwWQxasvcES3U
   9oiCETjgjXHHtRsZIa6ZQJTHEYojp/75KcBkKL5H/GesFg776b8xpaIt0
   w=;
IronPort-SDR: hKhYdEQcoMzgTSfJGR7EVLsYNNX8DkKmHRbFkJyZPfuzjCuW41RI+gl/lWn/qwFqEFyjYUVsVw
 aOK1AMXVJcGg==
X-IronPort-AV: E=Sophos;i="5.73,354,1583193600"; 
   d="scan'208";a="42753161"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 05 May 2020 11:11:52 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS id 7B1B0A074B;
        Tue,  5 May 2020 11:11:49 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 5 May 2020 11:11:49 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.92) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 5 May 2020 11:11:33 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <dwmw@amazon.com>,
        <irogers@google.com>, <jolsa@redhat.com>, <kirill@shutemov.name>,
        <mark.rutland@arm.com>, <mgorman@suse.de>, <minchan@kernel.org>,
        <mingo@redhat.com>, <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <sblbir@amazon.com>, <shakeelb@google.com>,
        <shuah@kernel.org>, <sj38.park@gmail.com>, <snu@amazon.de>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 07/16] mm/damon: Apply dynamic memory mapping changes
Date:   Tue, 5 May 2020 13:08:06 +0200
Message-ID: <20200505110815.10532-8-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505110815.10532-1-sjpark@amazon.com>
References: <20200505110815.10532-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.92]
X-ClientProxiedBy: EX13D35UWB004.ant.amazon.com (10.43.161.230) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Only a number of parts in the virtual address space of the processes is
mapped to physical memory and accessed.  Thus, tracking the unmapped
address regions is just wasteful.  However, tracking every memory
mapping change might incur an overhead.  For the reason, DAMON applies
the dynamic memory mapping changes to the tracking regions only for each
of a user-specified time interval (``regions update interval``).

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h |  10 +++--
 mm/damon.c            | 101 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 5 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index f1c3f491fc50..62b9f90ed87b 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -34,17 +34,21 @@ struct damon_task {
 /*
  * For each 'sample_interval', DAMON checks whether each region is accessed or
  * not.  It aggregates and keeps the access information (number of accesses to
- * each region) for each 'aggr_interval' time.
+ * each region) for 'aggr_interval' time.  DAMON also checks whether the memory
+ * mapping of the target tasks has changed (e.g., by mmap() calls from the
+ * application) and applies the changes for each 'regions_update_interval'.
  *
  * All time intervals are in micro-seconds.
  */
 struct damon_ctx {
 	unsigned long sample_interval;
 	unsigned long aggr_interval;
+	unsigned long regions_update_interval;
 	unsigned long min_nr_regions;
 	unsigned long max_nr_regions;
 
 	struct timespec64 last_aggregation;
+	struct timespec64 last_regions_update;
 
 	struct task_struct *kdamond;
 	bool kdamond_stop;
@@ -54,8 +58,8 @@ struct damon_ctx {
 };
 
 int damon_set_pids(struct damon_ctx *ctx, int *pids, ssize_t nr_pids);
-int damon_set_attrs(struct damon_ctx *ctx,
-		unsigned long sample_int, unsigned long aggr_int,
+int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
+		unsigned long aggr_int, unsigned long regions_update_int,
 		unsigned long min_nr_reg, unsigned long max_nr_reg);
 int damon_start(struct damon_ctx *ctx);
 int damon_stop(struct damon_ctx *ctx);
diff --git a/mm/damon.c b/mm/damon.c
index 342f905927a0..122a649c1321 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -707,6 +707,98 @@ static void kdamond_split_regions(struct damon_ctx *ctx)
 		damon_split_regions_of(ctx, t, nr_subregions);
 }
 
+/*
+ * Check whether it is time to check and apply the dynamic mmap changes
+ *
+ * Returns true if it is.
+ */
+static bool kdamond_need_update_regions(struct damon_ctx *ctx)
+{
+	return damon_check_reset_time_interval(&ctx->last_regions_update,
+			ctx->regions_update_interval);
+}
+
+/*
+ * Check whether regions are intersecting
+ *
+ * Note that this function checks 'struct damon_region' and 'struct region'.
+ *
+ * Returns true if it is.
+ */
+static bool damon_intersect(struct damon_region *r, struct region *re)
+{
+	return !(r->vm_end <= re->start || re->end <= r->vm_start);
+}
+
+/*
+ * Update damon regions for the three big regions of the given task
+ *
+ * t		the given task
+ * bregions	the three big regions of the task
+ */
+static void damon_apply_three_regions(struct damon_ctx *ctx,
+		struct damon_task *t, struct region bregions[3])
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
+		struct region *br;
+
+		br = &bregions[i];
+		/* Get the first and last regions which intersects with br */
+		damon_for_each_region(r, t) {
+			if (damon_intersect(r, br)) {
+				if (!first)
+					first = r;
+				last = r;
+			}
+			if (r->vm_start >= br->end)
+				break;
+		}
+		if (!first) {
+			/* no damon_region intersects with this big region */
+			newr = damon_new_region(ctx,
+					ALIGN_DOWN(br->start, MIN_REGION),
+					ALIGN(br->end, MIN_REGION));
+			if (!newr)
+				continue;
+			damon_insert_region(newr, damon_prev_region(r), r);
+		} else {
+			first->vm_start = ALIGN_DOWN(br->start, MIN_REGION);
+			last->vm_end = ALIGN(br->end, MIN_REGION);
+		}
+	}
+}
+
+/*
+ * Update regions for current memory mappings
+ */
+static void kdamond_update_regions(struct damon_ctx *ctx)
+{
+	struct region three_regions[3];
+	struct damon_task *t;
+
+	damon_for_each_task(ctx, t) {
+		if (damon_three_regions_of(t, three_regions))
+			continue;
+		damon_apply_three_regions(ctx, t, three_regions);
+	}
+}
+
 /*
  * Check whether current monitoring should be stopped
  *
@@ -762,6 +854,9 @@ static int kdamond_fn(void *data)
 			kdamond_reset_aggregated(ctx);
 			kdamond_split_regions(ctx);
 		}
+
+		if (kdamond_need_update_regions(ctx))
+			kdamond_update_regions(ctx);
 	}
 	damon_for_each_task(ctx, t) {
 		damon_for_each_region_safe(r, next, t)
@@ -869,6 +964,7 @@ int damon_set_pids(struct damon_ctx *ctx, int *pids, ssize_t nr_pids)
  * damon_set_attrs() - Set attributes for the monitoring.
  * @ctx:		monitoring context
  * @sample_int:		time interval between samplings
+ * @regions_update_int:	time interval between vma update checks
  * @aggr_int:		time interval between aggregations
  * @min_nr_reg:		minimal number of regions
  * @max_nr_reg:		maximum number of regions
@@ -878,8 +974,8 @@ int damon_set_pids(struct damon_ctx *ctx, int *pids, ssize_t nr_pids)
  *
  * Return: 0 on success, negative error code otherwise.
  */
-int damon_set_attrs(struct damon_ctx *ctx,
-		    unsigned long sample_int, unsigned long aggr_int,
+int damon_set_attrs(struct damon_ctx *ctx, unsigned long sample_int,
+		    unsigned long aggr_int, unsigned long regions_update_int,
 		    unsigned long min_nr_reg, unsigned long max_nr_reg)
 {
 	if (min_nr_reg < 3) {
@@ -895,6 +991,7 @@ int damon_set_attrs(struct damon_ctx *ctx,
 
 	ctx->sample_interval = sample_int;
 	ctx->aggr_interval = aggr_int;
+	ctx->regions_update_interval = regions_update_int;
 	ctx->min_nr_regions = min_nr_reg;
 	ctx->max_nr_regions = max_nr_reg;
 
-- 
2.17.1

