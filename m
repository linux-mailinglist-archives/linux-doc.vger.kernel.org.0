Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EA239F5AE
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 13:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbhFHLzh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 07:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbhFHLzg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 07:55:36 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD7CC061787;
        Tue,  8 Jun 2021 04:53:40 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id s12so15010637qta.3;
        Tue, 08 Jun 2021 04:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=398gdr4VtCF+1sg053gsMKOByn0sHBy2oJE8x1WnkHQ=;
        b=sWzl+HSYm14Y2JCiHQTZIiBbRP/Go6POhwFNbxLUEizq6jwCNtb3N+7j74uqiMxyCR
         9wBui64Z84R94tMoBjjqvV0rwB1pDZhj3A6HOFxWDMVhI5T+If0RBrnusBBACRzm524G
         acNK8saWVwcWDf4Iw6QN79fEP91pD3TGxje2LFBOPwgMJyemMXw/vICB+RjDfxPvAtAF
         LvUq9N18SLNc6Ud65gxoa72XWUDFI7rNeiaG1gtRPrUMB3x8kfqKh23bL88q9bWGc19I
         n96XgsBDlYi4mV7JmcXY69o3ikfsYermw+85KUvrN1ydOdsrNLcd9yjP7dkOkLh8fOGE
         0e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=398gdr4VtCF+1sg053gsMKOByn0sHBy2oJE8x1WnkHQ=;
        b=dlvc4al0Cvx9gaAR/ecYRwgipUOQ00n0ALqlVgUQUBvvwQf6NAcTuG2dHczlMRm2w2
         cp/JzLH/vHpjrycdWT/IVpgGbIWCaKkZwOZyfTJYzLcRB/7UePoXiJ7IPuvtgNESu4J8
         ySnzh1LBgZvqO78o2rZawOs6iKkgu3vVNK/bxhocKruMS6QIyuJoOCGvyiBAy5nAy5UM
         3kT8GKVbvWBxEnvsOx/JqnYBQzuDHnWGIZgA1oWSRKAGEhyJuHW6LqtjpmoUKvsce2jd
         SCRB3j9NKg2S2+fyjJY8TV/Q8YcZf1Yim8Q5zCj/BqBtKiCnyRg1Y2C99oL3s6zlT6Zm
         LfKg==
X-Gm-Message-State: AOAM533k3x8s4YObfsPL7wIDjVUH1RHO/c7E0eEoLSdndsutnx4tmgoA
        d+KewfPRdD8VnV/Ju3H3y5g=
X-Google-Smtp-Source: ABdhPJwsJCFqvJJM0lNHOCetRYsho5O5kU6oYNdvKczSP2b0mSKdI9FoPUyKUc0qEPMIrtJzgzcffg==
X-Received: by 2002:ac8:59c9:: with SMTP id f9mr20842952qtf.228.1623153219936;
        Tue, 08 Jun 2021 04:53:39 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h4sm2133927qth.66.2021.06.08.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:53:39 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, mgorman@suse.de,
        minchan@kernel.org, mingo@redhat.com, namhyung@kernel.org,
        peterz@infradead.org, riel@surriel.com, rientjes@google.com,
        rostedt@goodmis.org, rppt@kernel.org, shakeelb@google.com,
        shuah@kernel.org, sj38.park@gmail.com, snu@zelle79.org,
        vbabka@suse.cz, vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC v2 13/14] mm/damon: Introduce DAMON-based reclamation
Date:   Tue,  8 Jun 2021 11:52:53 +0000
Message-Id: <20210608115254.11930-14-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608115254.11930-1-sj38.park@gmail.com>
References: <20210608115254.11930-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit implements a new kernel subsystem that finds cold memory
regions using DAMON and reclaims those immediately.  It is intended to
be used as proactive lightweigh reclamation logic for light memory
pressure.  For heavy memory pressure, it could be inactivated and fall
back to the traditional page-scanning based reclamation.

It's implemented on top of DAMON framework to use the DAMON-based
Operation Schemes (DAMOS) feature.  It utilizes all the DAMOS features
including speed limit, prioritization, and watermarks.

It could be enabled and tuned in build time via the kernel
configuration, in boot time via the kernel boot parameter, and in run
time via its module parameter ('/sys/module/damon_reclaim/parameters/')
interface.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon/Kconfig   |  12 ++
 mm/damon/Makefile  |   1 +
 mm/damon/reclaim.c | 330 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 343 insertions(+)
 create mode 100644 mm/damon/reclaim.c

diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
index eeefb5b633b6..d9cd88810279 100644
--- a/mm/damon/Kconfig
+++ b/mm/damon/Kconfig
@@ -84,4 +84,16 @@ config DAMON_DBGFS_KUNIT_TEST
 
 	  If unsure, say N.
 
+config DAMON_RECLAIM
+	bool "Build DAMON-based reclaim (DAMON_RECLAIM)"
+	depends on DAMON_PADDR
+	help
+	  This builds the DAMON-based reclamation subsystem.  It finds pages
+	  that not accessed for a long time (cold) using DAMON and reclaim
+	  those if enabled.
+
+	  This is suggested to be used as a proactive and lightweight
+	  reclamation under light memory pressure, while the traditional page
+	  scanning-based reclamation is used for heavy pressure.
+
 endmenu
diff --git a/mm/damon/Makefile b/mm/damon/Makefile
index 017799e5670a..39433e7d570c 100644
--- a/mm/damon/Makefile
+++ b/mm/damon/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_DAMON_VADDR)	+= prmtv-common.o vaddr.o
 obj-$(CONFIG_DAMON_PADDR)	+= prmtv-common.o paddr.o
 obj-$(CONFIG_DAMON_PGIDLE)	+= prmtv-common.o pgidle.o
 obj-$(CONFIG_DAMON_DBGFS)	+= dbgfs.o
+obj-$(CONFIG_DAMON_RECLAIM)	+= reclaim.o
diff --git a/mm/damon/reclaim.c b/mm/damon/reclaim.c
new file mode 100644
index 000000000000..a43cb61f18ff
--- /dev/null
+++ b/mm/damon/reclaim.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DAMON-based page reclamation
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#define pr_fmt(fmt) "damon-reclaim: " fmt
+
+#include <linux/damon.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/workqueue.h>
+
+#ifdef MODULE_PARAM_PREFIX
+#undef MODULE_PARAM_PREFIX
+#endif
+#define MODULE_PARAM_PREFIX "damon_reclaim."
+
+/*
+ * Enable or disable DAMON_RECLAIM.
+ *
+ * You can enable DAMON_RCLAIM by setting the value of this parameter as ``Y``.
+ * Setting it as ``N`` disables DAMON_RECLAIM.  Note that DAMON_RECLAIM could
+ * do no real monitoring and reclamation due to the watermarks-based activation
+ * condition.  Refer to below descriptions for the watermarks parameter for
+ * this.
+ */
+static bool enabled __read_mostly;
+module_param(enabled, bool, 0600);
+
+/*
+ * Time threshold for cold memory regions identification in microseconds.
+ *
+ * If a memory region is not accessed for this or longer time, DAMON_RECLAIM
+ * identifies the region as cold, and reclaims.  5 seconds by default.
+ */
+static unsigned long min_age __read_mostly = 5000000;
+module_param(min_age, ulong, 0600);
+
+/*
+ * Maximum bytes of memory that can be reclaimed in a charging window.
+ *
+ * DAMON_RECLAIM charges amount of memory which has reclaimed within each
+ * charging time window and makes no more than this limit is charged.  This
+ * could be useful for limiting CPU consumption of DAMON_RECLAIM.  1 GiB by
+ * default.
+ */
+static unsigned long limit_sz __read_mostly = 1024 * 1024 * 1024;
+module_param(limit_sz, ulong, 0600);
+
+/*
+ * The amount of reclaimed memory charging window in milliseconds.
+ *
+ * The charging time window for limit_sz.  1 second by default.
+ */
+static unsigned long limit_ms __read_mostly = 1000;
+module_param(limit_ms, ulong, 0600);
+
+/*
+ * The watermarks check time interval in microseconds.
+ *
+ * Minimal time to wait before checking the watermarks, when DAMON_RECLAIM is
+ * enabled but inactive due to its watermarks rule.  5 seconds by default.
+ */
+static unsigned long wmarks_interval __read_mostly = 5000000;
+module_param(wmarks_interval, ulong, 0600);
+
+/*
+ * Free memory rate (per thousand) for the high watermark.
+ *
+ * If free memory of the system in bytes per thousand bytes is higher than
+ * this, DAMON_RECLAIM becomes inactive, so it does nothing but periodically
+ * checks the watermarks.  500 (50%) by default.
+ */
+static unsigned long wmarks_high __read_mostly = 500;
+module_param(wmarks_high, ulong, 0600);
+
+/*
+ * Free memory rate (per thousand) for the middle watermark.
+ *
+ * If free memory of the system in bytes per thousand bytes is between this and
+ * the low watermark, DAMON_RECLAIM becomes active, so starts the monitoring
+ * and the reclaiming.  400 (40%) by default.
+ */
+static unsigned long wmarks_mid __read_mostly = 400;
+module_param(wmarks_mid, ulong, 0600);
+
+/*
+ * Free memory rate (per thousand) for the low watermark.
+ *
+ * If free memory of the system in bytes per thousand bytes is lower than this,
+ * DAMON_RECLAIM becomes inactive, so it does nothing but periodically checks
+ * the watermarks.  In the case, the system falls back to the LRU-based page
+ * granularity reclamation logic.  200 (20%) by default.
+ */
+static unsigned long wmarks_low __read_mostly = 200;
+module_param(wmarks_low, ulong, 0600);
+
+/*
+ * Sampling interval for the monitoring in microseconds.
+ *
+ * The sampling interval of DAMON for the cold memory monitoring.  Please refer
+ * to the DAMON documentation for more detail.  5 ms by default.
+ */
+static unsigned long sample_interval __read_mostly = 5000;
+module_param(sample_interval, ulong, 0600);
+
+/*
+ * Aggregation interval for the monitoring in microseconds.
+ *
+ * The aggregation interval of DAMON for the cold memory monitoring.  Please
+ * refer to the DAMON documentation for more detail.  100 ms by default.
+ */
+static unsigned long aggr_interval __read_mostly = 100000;
+module_param(aggr_interval, ulong, 0600);
+
+/*
+ * Minimum number of monitoring regions.
+ *
+ * The minimal number of monitoring regions of DAMON for the cold memory
+ * monitoring.  This can be used to set lower-bound of the monitoring quality.
+ * But, setting this too high could result in increased monitoring overhead.
+ * Please refer to the DAMON documentation for more detail.  10 by default.
+ */
+static unsigned long min_nr_regions __read_mostly = 10;
+module_param(min_nr_regions, ulong, 0600);
+
+/*
+ * Maximum number of monitoring regions.
+ *
+ * The maximum number of monitoring regions of DAMON for the cold memory
+ * monitoring.  This can be used to set upper-bound of the monitoring overhead.
+ * However, setting this too low could result in bad monitoring quality.
+ * Please refer to the DAMON documentation for more detail.  1000 by default.
+ */
+static unsigned long max_nr_regions __read_mostly = 1000;
+module_param(max_nr_regions, ulong, 0600);
+
+/*
+ * Start of the target memory region in physical address.
+ *
+ * The start physical address of memory region that DAMON_RECLAIM will do work
+ * against.  By default, biggest System RAM is used as the region.
+ */
+static unsigned long monitor_region_start __read_mostly;
+module_param(monitor_region_start, ulong, 0600);
+
+/*
+ * End of the target memory region in physical address.
+ *
+ * The end physical address of memory region that DAMON_RECLAIM will do work
+ * against.  By default, biggest System RAM is used as the region.
+ */
+static unsigned long monitor_region_end __read_mostly;
+module_param(monitor_region_end, ulong, 0600);
+
+/*
+ * PID of the DAMON thread
+ *
+ * If DAMON_RECLAIM is enabled, this becomes the PID of the worker thread.
+ * Else, -1.
+ */
+static int kdamond_pid __read_mostly = -1;
+module_param(kdamond_pid, int, 0400);
+
+static struct damon_ctx *ctx;
+static struct damon_target *target;
+
+struct damon_reclaim_ram_walk_arg {
+	unsigned long start;
+	unsigned long end;
+};
+
+static int walk_system_ram(struct resource *res, void *arg)
+{
+	struct damon_reclaim_ram_walk_arg *a = arg;
+
+	if (a->end - a->start < res->end - res->start) {
+		a->start = res->start;
+		a->end = res->end;
+	}
+	return 0;
+}
+
+/*
+ * Find biggest 'System RAM' resource and store its start and end address in
+ * @start and @end, respectively.  If no System RAM is found, returns false.
+ */
+static bool get_monitoring_region(unsigned long *start, unsigned long *end)
+{
+	struct damon_reclaim_ram_walk_arg arg = {};
+
+	walk_system_ram_res(0, ULONG_MAX, &arg, walk_system_ram);
+	if (arg.end <= arg.start)
+		return false;
+
+	*start = arg.start;
+	*end = arg.end;
+	return true;
+}
+
+static struct damos *damon_reclaim_new_scheme(void)
+{
+	struct damos_watermarks wmarks = {
+		.metric = DAMOS_WMARK_FREE_MEM_RATE,
+		.interval = wmarks_interval,
+		.high = wmarks_high,
+		.mid = wmarks_mid,
+		.low = wmarks_low,
+	};
+	struct damos_speed_limit limit = {
+		/* Do not page out more than limit_sz bytes within limit_ms */
+		.sz = limit_sz,
+		.ms = limit_ms,
+		/* Within the limit, page out older regions first. */
+		.weight_sz = 0,
+		.weight_nr_accesses = 0,
+		.weight_age = 1
+	};
+	struct damos *scheme = damon_new_scheme(
+			/* Find regions having PAGE_SIZE or larger size */
+			PAGE_SIZE, ULONG_MAX,
+			/* and not accessed at all */
+			0, 0,
+			/* for min_age or more micro-seconds, and */
+			min_age / aggr_interval, UINT_MAX,
+			/* page out those, as soon as found */
+			DAMOS_PAGEOUT,
+			/* under the speed limit. */
+			&limit,
+			/* (De)activate this according to the watermarks. */
+			&wmarks);
+
+	return scheme;
+}
+
+static int damon_reclaim_turn(bool on)
+{
+	struct damon_region *region;
+	struct damos *scheme;
+	int err;
+
+	if (!on) {
+		err = damon_stop(&ctx, 1);
+		if (!err)
+			kdamond_pid = -1;
+		return err;
+	}
+
+	err = damon_set_attrs(ctx, sample_interval, aggr_interval, 0,
+			min_nr_regions, max_nr_regions);
+	if (err)
+		return err;
+
+	if (monitor_region_start > monitor_region_end)
+		return -EINVAL;
+	if (!monitor_region_start && !monitor_region_end &&
+			!get_monitoring_region(&monitor_region_start,
+				&monitor_region_end))
+		return -EINVAL;
+	/* DAMON will free this on its own when finish monitoring */
+	region = damon_new_region(monitor_region_start, monitor_region_end);
+	if (!region)
+		return -ENOMEM;
+	damon_add_region(region, target);
+
+	/* Will be freed by 'damon_set_schemes()' below */
+	scheme = damon_reclaim_new_scheme();
+	if (!scheme)
+		goto free_region_out;
+	err = damon_set_schemes(ctx, &scheme, 1);
+	if (err)
+		goto free_scheme_out;
+
+	err = damon_start(&ctx, 1);
+	if (!err) {
+		kdamond_pid = ctx->kdamond->pid;
+		return 0;
+	}
+
+free_scheme_out:
+	damon_destroy_scheme(scheme);
+free_region_out:
+	damon_destroy_region(region);
+	return err;
+}
+
+#define ENABLE_CHECK_INTERVAL_MS	1000
+static struct delayed_work damon_reclaim_timer;
+static void damon_reclaim_timer_fn(struct work_struct *work)
+{
+	static bool last_enabled;
+	bool now_enabled;
+
+	now_enabled = enabled;
+	if (last_enabled != now_enabled) {
+		if (!damon_reclaim_turn(now_enabled))
+			last_enabled = now_enabled;
+		else
+			enabled = last_enabled;
+	}
+
+	schedule_delayed_work(&damon_reclaim_timer,
+			msecs_to_jiffies(ENABLE_CHECK_INTERVAL_MS));
+}
+static DECLARE_DELAYED_WORK(damon_reclaim_timer, damon_reclaim_timer_fn);
+
+static int __init damon_reclaim_init(void)
+{
+	ctx = damon_new_ctx(DAMON_ADAPTIVE_TARGET);
+	if (!ctx)
+		return -ENOMEM;
+
+	damon_pa_set_primitives(ctx);
+
+	/* 4242 means nothing but fun */
+	target = damon_new_target(4242);
+	if (!target) {
+		damon_destroy_ctx(ctx);
+		return -ENOMEM;
+	}
+	damon_add_target(ctx, target);
+
+	schedule_delayed_work(&damon_reclaim_timer, 0);
+	return 0;
+}
+
+module_init(damon_reclaim_init);
-- 
2.17.1

