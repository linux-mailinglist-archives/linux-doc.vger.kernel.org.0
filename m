Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B222C1515DA
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2020 07:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgBDGXk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Feb 2020 01:23:40 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38350 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgBDGXk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Feb 2020 01:23:40 -0500
Received: by mail-pf1-f195.google.com with SMTP id x185so8914689pfc.5;
        Mon, 03 Feb 2020 22:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dQabRuh4MATl+1QDbxk7M0KRq1KLdG813aWlQ3UGSeo=;
        b=WS04L8AHUnGBb04N6QQOXjgrFtTwf4OdGF7CwL5o328SzX/hG0EG/WsBbDiCj/HMoD
         2nGFOjMQ1jCUZ5PbJIO/IAmZ512b+mnJqfEFxo5EjcwRYWdxAsmofuTkvhlh7WXq6o4q
         V8w479xVzz4OBaxUH56i4TV7ZQlJsxitAePbGX6+PKL5anXAwMRTQIRMAQeYmH1zpS+o
         eaZR80Db8WntQMKF/nwYwfG4bz9HYMUwCgQSW4eNSk44sfX3zTilkLe50U/oytIw4Iby
         reB2lHzJFl0sKteUzJV9hLVkXh1PZEng1YEF80HoBj0xhcL77NgMkvkO0rBtZietOr7M
         tnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dQabRuh4MATl+1QDbxk7M0KRq1KLdG813aWlQ3UGSeo=;
        b=s7pbNmjc4SXsub+M8FPRPc58mgXjPB9/d8U6m7YMA4IX1joCCsjuCguqEjch4NqKYe
         gaXAR38L+/Ja27JHTl3QS2YBj5U0/fCLi+sQZ+Ahi83yVaSUux8pcPhjJU18oB7tpfxF
         P4fjZ86Ooll6ncVvLsiSyV1iTS2GfQMQPoiQeWtJrQpV1QCit5r0ZS6OatfpeXWBGuEC
         279LfHhUuEzFMj1cAXtMORqe80IgYCv3DvI83fQCKyJb2jNn87cxc0hszn7z9luVbWeW
         +QA6I63zxyHP6Z+y+5gMbGEB+lOVbvHVabb7KdEwGF69NlLjT6WvblOi6hgkaXxJk+f9
         SLVA==
X-Gm-Message-State: APjAAAVMxjvHQexG4YAf6471/FF15JAW8D2H6YUd2YqO358jLGxirRdN
        N4QIKJTZs6kqWtXGejLzA1k=
X-Google-Smtp-Source: APXvYqyikHFuW5AEhScDkQeHdSC/ObvFGfseF/cUgmqY579cReG/kXwaXbnHKZbA2Z425qnHd+/Z9Q==
X-Received: by 2002:a63:8dc4:: with SMTP id z187mr13834678pgd.68.1580797419042;
        Mon, 03 Feb 2020 22:23:39 -0800 (PST)
Received: from localhost.localdomain ([106.254.212.20])
        by smtp.gmail.com with ESMTPSA id u26sm21880240pfn.46.2020.02.03.22.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 22:23:38 -0800 (PST)
From:   sj38.park@gmail.com
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        brendan.d.gregg@gmail.com, brendanhiggins@google.com, cai@lca.pw,
        colin.king@canonical.com, corbet@lwn.net, dwmw@amazon.com,
        jolsa@redhat.com, kirill@shutemov.name, mark.rutland@arm.com,
        mgorman@suse.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, rdunlap@infradead.org,
        rostedt@goodmis.org, sj38.park@gmail.com, vdavydov.dev@gmail.com,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/11] Introduce Data Access MONitor (DAMON)
Date:   Tue,  4 Feb 2020 06:23:02 +0000
Message-Id: <20200204062312.19913-2-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204062312.19913-1-sj38.park@gmail.com>
References: <20200204062312.19913-1-sj38.park@gmail.com>
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

Brief Introduction
==================

Memory management decisions can normally be more efficient if finer data
access information is available.  However, because finer information
usually comes with higher overhead, most systems including Linux made a
tradeoff: Forgive some wise decisions and use coarse information and/or
light-weight heuristics.

A number of experimental data access pattern awared memory management
optimizations say the sacrifices are huge.  However, none of those has
successfully adopted to Linux kernel mainly due to the absence of a
scalable and efficient data access monitoring mechanism.

DAMON is a data access monitoring solution for the problem.  It is 1)
accurate enough for the DRAM level memory management, 2) light-weight
enough to be applied online, and 3) keeps predefined upper-bound
overhead regardless of the size of target workloads (thus scalable).

DAMON is implemented as a standalone kernel module and provides several
simple interfaces.  Owing to that, though it has mainly designed for the
kernel's memory management mechanisms, it can be also used for a wide
range of user space programs and people.

Frequently Asked Questions
==========================

Q: Why not integrated with perf?
A: From the perspective of perf like profilers, DAMON can be thought of
as a data source in kernel, like tracepoints, pressure stall information
(psi), or idle page tracking.  Thus, it can be easily integrated with
those.  However, this patchset doesn't provide a fancy perf integration
because current step of DAMON development is focused on its core logic
only.  That said, DAMON already provides two interfaces for user space
programs, which based on debugfs and tracepoint, respectively.  Using
the tracepoint interface, you can use DAMON with perf.  This patchset
also provides the debugfs interface based user space tool for DAMON.  It
can be used to record, visualize, and analyze data access pattern of
target processes in a convenient way.

Q: Why a new module, instead of extending perf or other tools?
A: First, DAMON aims to be used by other programs including the kernel.
Therefore, having dependency to specific tools like perf is not
desirable.  Second, because it need to be lightweight as much as
possible so that it can be used online, any unnecessary overhead such as
kernel - user space context switching cost should be avoided.  These are
the two most biggest reasons why DAMON is implemented in the kernel
space.  The idle page tracking subsystem would be the kernel module that
most seems similar to DAMON.  However, it's own interface is not
compatible with DAMON.  Also, the internal implementation of it has no
common part to be reused by DAMON.

Q: Can 'perf mem' provide the data required for DAMON?
A: On the systems supporting 'perf mem', yes.  DAMON is using the PTE
Accessed bits in low level.  Other H/W or S/W features that can be used
for the purpose could be used.  However, as explained with above
question, DAMON need to be implemented in the kernel space.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/Kconfig  |  12 +++
 mm/Makefile |   1 +
 mm/damon.c  | 226 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 mm/damon.c

diff --git a/mm/Kconfig b/mm/Kconfig
index ab80933be65f..387d469f40ec 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -739,4 +739,16 @@ config ARCH_HAS_HUGEPD
 config MAPPING_DIRTY_HELPERS
         bool
 
+config DAMON
+	tristate "Data Access Monitor"
+	depends on MMU
+	default n
+	help
+	  Provides data access monitoring.
+
+	  DAMON is a kernel module that allows users to monitor the actual
+	  memory access pattern of specific user-space processes.  It aims to
+	  be 1) accurate enough to be useful for performance-centric domains,
+	  and 2) sufficiently light-weight so that it can be applied online.
+
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 1937cc251883..2911b3832c90 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -108,3 +108,4 @@ obj-$(CONFIG_ZONE_DEVICE) += memremap.o
 obj-$(CONFIG_HMM_MIRROR) += hmm.o
 obj-$(CONFIG_MEMFD_CREATE) += memfd.o
 obj-$(CONFIG_MAPPING_DIRTY_HELPERS) += mapping_dirty_helpers.o
+obj-$(CONFIG_DAMON) += damon.o
diff --git a/mm/damon.c b/mm/damon.c
new file mode 100644
index 000000000000..0687d2b83bb6
--- /dev/null
+++ b/mm/damon.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Data Access Monitor
+ *
+ * Copyright 2019 Amazon.com, Inc. or its affiliates.  All rights reserved.
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#define pr_fmt(fmt) "damon: " fmt
+
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/random.h>
+#include <linux/slab.h>
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
+#define damon_for_each_task(ctx, t) \
+	list_for_each_entry(t, &(ctx)->tasks_list, list)
+
+#define damon_for_each_task_safe(ctx, t, next) \
+	list_for_each_entry_safe(t, next, &(ctx)->tasks_list, list)
+
+/* Represents a monitoring target region on the virtual address space */
+struct damon_region {
+	unsigned long vm_start;
+	unsigned long vm_end;
+	unsigned long sampling_addr;
+	unsigned int nr_accesses;
+	struct list_head list;
+};
+
+/* Represents a monitoring target task */
+struct damon_task {
+	unsigned long pid;
+	struct list_head regions_list;
+	struct list_head list;
+};
+
+struct damon_ctx {
+	struct rnd_state rndseed;
+
+	struct list_head tasks_list;	/* 'damon_task' objects */
+};
+
+#define LEN_RES_FILE_PATH	256
+
+/* Get a random number in [l, r) */
+#define damon_rand(ctx, l, r) (l + prandom_u32_state(&ctx->rndseed) % (r - l))
+
+/*
+ * Construct a damon_region struct
+ *
+ * Returns the pointer to the new struct if success, or NULL otherwise
+ */
+static struct damon_region *damon_new_region(struct damon_ctx *ctx,
+				unsigned long vm_start, unsigned long vm_end)
+{
+	struct damon_region *ret;
+
+	ret = kmalloc(sizeof(struct damon_region), GFP_KERNEL);
+	if (!ret)
+		return NULL;
+	ret->vm_start = vm_start;
+	ret->vm_end = vm_end;
+	ret->nr_accesses = 0;
+	ret->sampling_addr = damon_rand(ctx, vm_start, vm_end);
+	INIT_LIST_HEAD(&ret->list);
+
+	return ret;
+}
+
+/*
+ * Add a region between two other regions
+ */
+static inline void damon_add_region(struct damon_region *r,
+		struct damon_region *prev, struct damon_region *next)
+{
+	__list_add(&r->list, &prev->list, &next->list);
+}
+
+/*
+ * Append a region to a task's list of regions
+ */
+static void damon_add_region_tail(struct damon_region *r, struct damon_task *t)
+{
+	list_add_tail(&r->list, &t->regions_list);
+}
+
+/*
+ * Delete a region from its list
+ */
+static void damon_del_region(struct damon_region *r)
+{
+	list_del(&r->list);
+}
+
+/*
+ * De-allocate a region
+ */
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
+static struct damon_task *damon_new_task(unsigned long pid)
+{
+	struct damon_task *t;
+
+	t = kmalloc(sizeof(struct damon_task), GFP_KERNEL);
+	if (!t)
+		return NULL;
+	t->pid = pid;
+	INIT_LIST_HEAD(&t->regions_list);
+
+	return t;
+}
+
+/* Returns n-th damon_region of the given task */
+struct damon_region *damon_nth_region_of(struct damon_task *t, unsigned int n)
+{
+	struct damon_region *r;
+	unsigned int i;
+
+	i = 0;
+	damon_for_each_region(r, t) {
+		if (i++ == n)
+			return r;
+	}
+	return NULL;
+}
+
+static void damon_add_task_tail(struct damon_ctx *ctx, struct damon_task *t)
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
+/*
+ * Returns number of monitoring target tasks
+ */
+static unsigned int nr_damon_tasks(struct damon_ctx *ctx)
+{
+	struct damon_task *t;
+	unsigned int ret = 0;
+
+	damon_for_each_task(ctx, t)
+		ret++;
+	return ret;
+}
+
+/*
+ * Returns the number of target regions for a given target task
+ */
+static unsigned int nr_damon_regions(struct damon_task *t)
+{
+	struct damon_region *r;
+	unsigned int ret = 0;
+
+	damon_for_each_region(r, t)
+		ret++;
+	return ret;
+}
+
+static int __init damon_init(void)
+{
+	pr_info("init\n");
+
+	return 0;
+}
+
+static void __exit damon_exit(void)
+{
+	pr_info("exit\n");
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

