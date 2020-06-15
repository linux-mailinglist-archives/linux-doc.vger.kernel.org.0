Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012B51F9D23
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2020 18:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730557AbgFOQVn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Jun 2020 12:21:43 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:50354 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730476AbgFOQVm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jun 2020 12:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1592238101; x=1623774101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=4r5hU/OjiOgfN9yyLSRNo4FMrTTlc/nf8dBTtqw+4/s=;
  b=LX3FdGQSrz4FZGeAAN4Y/3lg+l5mg/P4gRV5snWOLchKUMC2J9L13mpU
   ODwDfK3/bGszx653Pj3aRCX+0nwoqQnLx0U57GLf4oi/nG2NhEmhKdiW7
   I+Nf1+jAOpWLYC0HoWpEtBx7ib4hKaDBlu0wywwmMiZOkpzKxGPFZ28xH
   Y=;
IronPort-SDR: C6qtz/Nctr4MxU8hoYP6EOuLm8oQd/FagZTA8ORDzNP/xU33wXsTUM5KrYi6ZQzSECgg1YCtjz
 Z8K0Be2/ud0A==
X-IronPort-AV: E=Sophos;i="5.73,515,1583193600"; 
   d="scan'208";a="52392901"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 15 Jun 2020 16:21:34 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS id D8C3CA252E;
        Mon, 15 Jun 2020 16:21:31 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 15 Jun 2020 16:21:31 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.145) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 15 Jun 2020 16:21:14 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <dwmw@amazon.com>,
        <foersleo@amazon.de>, <irogers@google.com>, <jolsa@redhat.com>,
        <kirill@shutemov.name>, <mark.rutland@arm.com>, <mgorman@suse.de>,
        <minchan@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
        <peterz@infradead.org>, <rdunlap@infradead.org>,
        <riel@surriel.com>, <rientjes@google.com>, <rostedt@goodmis.org>,
        <sblbir@amazon.com>, <shakeelb@google.com>, <shuah@kernel.org>,
        <sj38.park@gmail.com>, <snu@amazon.de>, <vbabka@suse.cz>,
        <vdavydov.dev@gmail.com>, <yang.shi@linux.alibaba.com>,
        <ying.huang@intel.com>, <david@redhat.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v16 05/14] mm/damon: Allow dynamic monitoring target regions update
Date:   Mon, 15 Jun 2020 18:19:18 +0200
Message-ID: <20200615161927.12637-6-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615161927.12637-1-sjpark@amazon.com>
References: <20200615161927.12637-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.145]
X-ClientProxiedBy: EX13D23UWA004.ant.amazon.com (10.43.160.72) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

The monitoring target regions can be dynamically changed.  For example,
virtual memory mapping could be dynamically updated and physical memory
could be hot-plugged.

To handle such cases, this commit adds a monitoring attribute, ``regions
update interval`` and a callback ``init_target_regions`` in the
monitoring context.  If the two fields are properly set, DAMON will call
the ``init_target_regions()`` callback for every ``regions update
interval``.  In the callback, users can check current memory mapping or
hotplugged physical memory sections and appropriately update the
monitoring target regions of the context.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h | 20 +++++++++++++++-----
 mm/damon.c            | 23 +++++++++++++++++++++--
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 9588bc162c3a..aa14d4e910e5 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -64,13 +64,16 @@ struct damon_task {
  *
  * @sample_interval:		The time between access samplings.
  * @aggr_interval:		The time between monitor results aggregations.
+ * @regions_update_interval:	The time between monitor regions updates.
  * @min_nr_regions:		The number of initial monitoring regions.
  * @max_nr_regions:		The maximum number of monitoring regions.
  *
  * For each @sample_interval, DAMON checks whether each region is accessed or
  * not.  It aggregates and keeps the access information (number of accesses to
- * each region) for @aggr_interval time.  All time intervals are in
- * micro-seconds.
+ * each region) for @aggr_interval time.  DAMON also checks whether the target
+ * memory regions need update (e.g., by ``mmap()`` calls from the application,
+ * in case of virtual memory monitoring) and applies the changes for each
+ * @regions_update_interval.  All time intervals are in micro-seconds.
  *
  * @kdamond:		Kernel thread who does the monitoring.
  * @kdamond_stop:	Notifies whether kdamond should stop.
@@ -88,6 +91,7 @@ struct damon_task {
  * @tasks_list:		Head of monitoring target tasks (&damon_task) list.
  *
  * @init_target_regions:	Constructs initial monitoring target regions.
+ * @update_target_regions:	Updates monitoring target regions.
  * @prepare_access_checks:	Prepares next access check of target regions.
  * @check_accesses:		Checks the access of target regions.
  * @sample_cb:			Called for each sampling interval.
@@ -96,11 +100,14 @@ struct damon_task {
  * DAMON can be extended for various address spaces by users.  For this, users
  * can register the target address space dependent low level functions for
  * their usecases via the callback pointers of the context.  The monitoring
- * thread calls @init_target_regions before starting the monitoring, and
+ * thread calls @init_target_regions before starting the monitoring,
+ * @update_target_regions for each @regions_update_interval, and
  * @prepare_access_checks and @check_accesses for each @sample_interval.
  *
  * @init_target_regions should construct proper monitoring target regions and
  * link those to the DAMON context struct.
+ * @update_target_regions should update the monitoring target regions for
+ * current status.
  * @prepare_access_checks should manipulate the monitoring regions to be
  * prepare for the next access check.
  * @check_accesses should check the accesses to each region that made after the
@@ -115,10 +122,12 @@ struct damon_task {
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
@@ -128,6 +137,7 @@ struct damon_ctx {
 
 	/* callbacks */
 	void (*init_target_regions)(struct damon_ctx *context);
+	void (*update_target_regions)(struct damon_ctx *context);
 	void (*prepare_access_checks)(struct damon_ctx *context);
 	unsigned int (*check_accesses)(struct damon_ctx *context);
 	void (*sample_cb)(struct damon_ctx *context);
@@ -135,8 +145,8 @@ struct damon_ctx {
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
index 5cf39b3ad222..a19ec17a35cb 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -385,6 +385,17 @@ static void kdamond_split_regions(struct damon_ctx *ctx)
 	last_nr_regions = nr_regions;
 }
 
+/*
+ * Check whether it is time to check and apply the target monitoring regions
+ *
+ * Returns true if it is.
+ */
+static bool kdamond_need_update_regions(struct damon_ctx *ctx)
+{
+	return damon_check_reset_time_interval(&ctx->last_regions_update,
+			ctx->regions_update_interval);
+}
+
 /*
  * Check whether current monitoring should be stopped
  *
@@ -455,6 +466,12 @@ static int kdamond_fn(void *data)
 			kdamond_reset_aggregated(ctx);
 			kdamond_split_regions(ctx);
 		}
+
+		if (kdamond_need_update_regions(ctx)) {
+			if (ctx->update_target_regions)
+				ctx->update_target_regions(ctx);
+			sz_limit = damon_region_sz_limit(ctx);
+		}
 	}
 	damon_for_each_task(t, ctx) {
 		damon_for_each_region_safe(r, next, t)
@@ -562,6 +579,7 @@ int damon_set_pids(struct damon_ctx *ctx, int *pids, ssize_t nr_pids)
  * damon_set_attrs() - Set attributes for the monitoring.
  * @ctx:		monitoring context
  * @sample_int:		time interval between samplings
+ * @regions_update_int:	time interval between target regions update
  * @aggr_int:		time interval between aggregations
  * @min_nr_reg:		minimal number of regions
  * @max_nr_reg:		maximum number of regions
@@ -571,8 +589,8 @@ int damon_set_pids(struct damon_ctx *ctx, int *pids, ssize_t nr_pids)
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
@@ -588,6 +606,7 @@ int damon_set_attrs(struct damon_ctx *ctx,
 
 	ctx->sample_interval = sample_int;
 	ctx->aggr_interval = aggr_int;
+	ctx->regions_update_interval = regions_update_int;
 	ctx->min_nr_regions = min_nr_reg;
 	ctx->max_nr_regions = max_nr_reg;
 
-- 
2.17.1

