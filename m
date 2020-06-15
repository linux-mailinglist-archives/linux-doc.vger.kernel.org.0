Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E61D1F9D15
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2020 18:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbgFOQUn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Jun 2020 12:20:43 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:56085 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbgFOQUm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jun 2020 12:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1592238041; x=1623774041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=z5o75IDbNf7Iu6TujBVKaea7ZgMi1CRye81jjhn96+8=;
  b=T5eBNfNsf/g0mKJxW6ilx44AKojzwO/cpWCvnktlgiDWsWw42hnMPCqq
   oGd/eb6kEpqgzCcQBa06t1rNwr1MdNBsktrirLCavQjUIH2lgJQOnXNfJ
   RHV4Skvp/JyPupmZLM5AMKXZYudavo8TuJWTyVfuA6t8zbz7ZbjjHsLF1
   w=;
IronPort-SDR: kViR7VGaFrHEJfCLA0Dd9Cws4yO1itw2j9YMRBtDIs4uSiWw6oihRz5/ORfWW3GRiCTPx6Y1Oc
 5GjKQBzRQD8w==
X-IronPort-AV: E=Sophos;i="5.73,515,1583193600"; 
   d="scan'208";a="44141495"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 15 Jun 2020 16:20:40 +0000
Received: from EX13MTAUEA002.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS id 4FAEDA23CD;
        Mon, 15 Jun 2020 16:20:38 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 15 Jun 2020 16:20:37 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.145) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 15 Jun 2020 16:20:20 +0000
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
Subject: [PATCH v16 02/14] mm: Introduce Data Access MONitor (DAMON)
Date:   Mon, 15 Jun 2020 18:19:15 +0200
Message-ID: <20200615161927.12637-3-sjpark@amazon.com>
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

This commit introduces a kernel module named DAMON.  Note that this
commit is implementing only the stub for the module load/unload, basic
data structures, and simple manipulation functions of the structures to
keep the size of commit small.  The core mechanisms of DAMON will be
implemented one by one by following commits.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Leonard Foerster <foersleo@amazon.de>
---
 include/linux/damon.h |  63 ++++++++++++++
 mm/Kconfig            |  12 +++
 mm/Makefile           |   1 +
 mm/damon.c            | 188 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 264 insertions(+)
 create mode 100644 include/linux/damon.h
 create mode 100644 mm/damon.c

diff --git a/include/linux/damon.h b/include/linux/damon.h
new file mode 100644
index 000000000000..c8f8c1c41a45
--- /dev/null
+++ b/include/linux/damon.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * DAMON api
+ *
+ * Copyright 2019-2020 Amazon.com, Inc. or its affiliates.
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#ifndef _DAMON_H_
+#define _DAMON_H_
+
+#include <linux/random.h>
+#include <linux/types.h>
+
+/**
+ * struct damon_addr_range - Represents an address region of [@start, @end).
+ * @start:	Start address of the region (inclusive).
+ * @end:	End address of the region (exclusive).
+ */
+struct damon_addr_range {
+	unsigned long start;
+	unsigned long end;
+};
+
+/**
+ * struct damon_region - Represents a monitoring target region.
+ * @ar:			The address range of the region.
+ * @sampling_addr:	Address of the sample for the next access check.
+ * @nr_accesses:	Access frequency of this region.
+ * @list:		List head for siblings.
+ */
+struct damon_region {
+	struct damon_addr_range ar;
+	unsigned long sampling_addr;
+	unsigned int nr_accesses;
+	struct list_head list;
+};
+
+/**
+ * struct damon_task - Represents a monitoring target task.
+ * @pid:		Process id of the task.
+ * @regions_list:	Head of the monitoring target regions of this task.
+ * @list:		List head for siblings.
+ *
+ * If the monitoring target address space is task independent (e.g., physical
+ * memory address space monitoring), @pid should be '-1'.
+ */
+struct damon_task {
+	int pid;
+	struct list_head regions_list;
+	struct list_head list;
+};
+
+/**
+ * struct damon_ctx - Represents a context for each monitoring.
+ * @tasks_list:		Head of monitoring target tasks (&damon_task) list.
+ */
+struct damon_ctx {
+	struct list_head tasks_list;	/* 'damon_task' objects */
+};
+
+#endif
diff --git a/mm/Kconfig b/mm/Kconfig
index c1acc34c1c35..ecea0889ea35 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -867,4 +867,16 @@ config ARCH_HAS_HUGEPD
 config MAPPING_DIRTY_HELPERS
         bool
 
+config DAMON
+	tristate "Data Access Monitor"
+	depends on MMU
+	help
+	  Provides data access monitoring.
+
+	  DAMON is a kernel module that allows users to monitor the actual
+	  memory access pattern of specific user-space processes.  It aims to
+	  be 1) accurate enough to be useful for performance-centric domains,
+	  and 2) sufficiently light-weight so that it can be applied online.
+	  If unsure, say N.
+
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index fccd3756b25f..230e545b6e07 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -112,3 +112,4 @@ obj-$(CONFIG_MEMFD_CREATE) += memfd.o
 obj-$(CONFIG_MAPPING_DIRTY_HELPERS) += mapping_dirty_helpers.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_PAGE_REPORTING) += page_reporting.o
+obj-$(CONFIG_DAMON) += damon.o
diff --git a/mm/damon.c b/mm/damon.c
new file mode 100644
index 000000000000..2bf35bdc0470
--- /dev/null
+++ b/mm/damon.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Data Access Monitor
+ *
+ * Copyright 2019-2020 Amazon.com, Inc. or its affiliates.
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ *
+ * This file is constructed in below parts.
+ *
+ * - Functions and macros for DAMON data structures
+ * - Functions for the module loading/unloading
+ *
+ * The core parts are not implemented yet.
+ */
+
+#define pr_fmt(fmt) "damon: " fmt
+
+#include <linux/damon.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+/*
+ * Functions and macros for DAMON data structures
+ */
+
+#define damon_get_task_struct(t) \
+	(get_pid_task(find_vpid(t->pid), PIDTYPE_PID))
+
+#define damon_next_region(r) \
+	(container_of(r->list.next, struct damon_region, list))
+
+#define damon_prev_region(r) \
+	(container_of(r->list.prev, struct damon_region, list))
+
+#define damon_for_each_region(r, t) \
+	list_for_each_entry(r, &t->regions_list, list)
+
+#define damon_for_each_region_safe(r, next, t) \
+	list_for_each_entry_safe(r, next, &t->regions_list, list)
+
+#define damon_for_each_task(t, ctx) \
+	list_for_each_entry(t, &(ctx)->tasks_list, list)
+
+#define damon_for_each_task_safe(t, next, ctx) \
+	list_for_each_entry_safe(t, next, &(ctx)->tasks_list, list)
+
+/* Get a random number in [l, r) */
+#define damon_rand(l, r) (l + prandom_u32() % (r - l))
+
+/*
+ * Construct a damon_region struct
+ *
+ * Returns the pointer to the new struct if success, or NULL otherwise
+ */
+static struct damon_region *damon_new_region(struct damon_ctx *ctx,
+				unsigned long start, unsigned long end)
+{
+	struct damon_region *region;
+
+	region = kmalloc(sizeof(*region), GFP_KERNEL);
+	if (!region)
+		return NULL;
+
+	region->ar.start = start;
+	region->ar.end = end;
+	region->nr_accesses = 0;
+	INIT_LIST_HEAD(&region->list);
+
+	return region;
+}
+
+/*
+ * Add a region between two other regions
+ */
+static inline void damon_insert_region(struct damon_region *r,
+		struct damon_region *prev, struct damon_region *next)
+{
+	__list_add(&r->list, &prev->list, &next->list);
+}
+
+static void damon_add_region(struct damon_region *r, struct damon_task *t)
+{
+	list_add_tail(&r->list, &t->regions_list);
+}
+
+static void damon_del_region(struct damon_region *r)
+{
+	list_del(&r->list);
+}
+
+static void damon_free_region(struct damon_region *r)
+{
+	kfree(r);
+}
+
+static void damon_destroy_region(struct damon_region *r)
+{
+	damon_del_region(r);
+	damon_free_region(r);
+}
+
+/*
+ * Construct a damon_task struct
+ *
+ * Returns the pointer to the new struct if success, or NULL otherwise
+ */
+static struct damon_task *damon_new_task(int pid)
+{
+	struct damon_task *t;
+
+	t = kmalloc(sizeof(*t), GFP_KERNEL);
+	if (!t)
+		return NULL;
+
+	t->pid = pid;
+	INIT_LIST_HEAD(&t->regions_list);
+
+	return t;
+}
+
+static void damon_add_task(struct damon_ctx *ctx, struct damon_task *t)
+{
+	list_add_tail(&t->list, &ctx->tasks_list);
+}
+
+static void damon_del_task(struct damon_task *t)
+{
+	list_del(&t->list);
+}
+
+static void damon_free_task(struct damon_task *t)
+{
+	struct damon_region *r, *next;
+
+	damon_for_each_region_safe(r, next, t)
+		damon_free_region(r);
+	kfree(t);
+}
+
+static void damon_destroy_task(struct damon_task *t)
+{
+	damon_del_task(t);
+	damon_free_task(t);
+}
+
+static unsigned int nr_damon_tasks(struct damon_ctx *ctx)
+{
+	struct damon_task *t;
+	unsigned int nr_tasks = 0;
+
+	damon_for_each_task(t, ctx)
+		nr_tasks++;
+
+	return nr_tasks;
+}
+
+static unsigned int nr_damon_regions(struct damon_task *t)
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
+/*
+ * Functions for the module loading/unloading
+ */
+
+static int __init damon_init(void)
+{
+	return 0;
+}
+
+static void __exit damon_exit(void)
+{
+}
+
+module_init(damon_init);
+module_exit(damon_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("SeongJae Park <sjpark@amazon.de>");
+MODULE_DESCRIPTION("DAMON: Data Access MONitor");
-- 
2.17.1

