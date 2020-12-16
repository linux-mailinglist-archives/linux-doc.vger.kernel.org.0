Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1F42DBDF7
	for <lists+linux-doc@lfdr.de>; Wed, 16 Dec 2020 10:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgLPJsx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Dec 2020 04:48:53 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:2567 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgLPJsx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Dec 2020 04:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1608112133; x=1639648133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LG3J7fvqAIYDCK52FqgXfz7XsABi7oMW6Ndy9IE+r0A=;
  b=aMYh2sjT5zr2Y881uon5Jg6TPV0Y4OzwhnQt7jw8YtJvhZlgEM5t9ld0
   +QYCaR2TmWW01WOJ53H3nBFVje/641QOf0s76Uw8k+atUvvLtLn0ET/Sl
   qM3OKTkmfzyezw8VEjEpADVFq87j9toWfDsmVaUQSsW+UTeuGD3iPtv7V
   U=;
X-IronPort-AV: E=Sophos;i="5.78,424,1599523200"; 
   d="scan'208";a="73004863"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 16 Dec 2020 09:48:02 +0000
Received: from EX13D31EUA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS id 3797AA1CD2;
        Wed, 16 Dec 2020 09:47:59 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.31) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 16 Dec 2020 09:47:41 +0000
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
Subject: [RFC v10 13/13] mm/damon: Implement primitives for page granularity idleness monitoring
Date:   Wed, 16 Dec 2020 10:42:21 +0100
Message-ID: <20201216094221.11898-14-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216094221.11898-1-sjpark@amazon.com>
References: <20201216094221.11898-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.31]
X-ClientProxiedBy: EX13D16UWB001.ant.amazon.com (10.43.161.17) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

The lightweight and upper-bound limited monitoring overhead of DAMON is
available due to its core mechanisms, namely region-based sampling and
adaptive regions adjustment.  However, there could be some use cases
that don't need such fancy mechanisms.  The page-granularity idleness
monitoring is a good example.  Because the metadata for DAMON's overhead
control mechanism only wastes memory in such cases, DAMON allows users
to eliminate such overhead using arbitrary type monitoring targets.

This commit implements a monitoring primitive supporting the
page-granularity idleness monitoring using the arbitrary type target
feature.  It's almost same to Idle Page Tracking, but incur much less
kernel - user context changes compared to it.

Nevertheless, this patch provides only kernel space API.  This feature
will be exported to the user space via the debugfs interface in near
future.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 include/linux/damon.h        | 27 ++++++++++++++
 include/trace/events/damon.h | 19 ++++++++++
 mm/damon/Kconfig             |  9 +++++
 mm/damon/Makefile            |  1 +
 mm/damon/paddr.c             |  2 --
 mm/damon/pgidle.c            | 69 ++++++++++++++++++++++++++++++++++++
 6 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 mm/damon/pgidle.c

diff --git a/include/linux/damon.h b/include/linux/damon.h
index ea2fd054b2ef..220e59299f19 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -386,4 +386,31 @@ void damon_pa_set_primitives(struct damon_ctx *ctx);
 
 #endif	/* CONFIG_DAMON_PADDR */
 
+#ifdef CONFIG_DAMON_PGIDLE
+
+/*
+ * struct damon_pfns_range - Represents a pfn range of [@start, @end).
+ * @start:	Start pfn of the range (inclusive).
+ * @end:	End pfn of the range (exclusive).
+ *
+ * In case of the page granularity idleness monitoring, an instance of this
+ * struct is pointed by &damon_ctx.arbitrary_target.
+ */
+struct damon_pfns_range {
+	unsigned long start;
+	unsigned long end;
+};
+
+bool damon_pgi_is_idle(unsigned long pfn, unsigned long *pg_size);
+
+/* Monitoring primitives for page granularity idleness monitoring */
+
+void damon_pgi_prepare_access_checks(struct damon_ctx *ctx);
+unsigned int damon_pgi_check_accesses(struct damon_ctx *ctx);
+bool damon_pgi_target_valid(void *t);
+void damon_pgi_set_primitives(struct damon_ctx *ctx);
+
+#endif	/* CONFIG_DAMON_PGIDLE */
+
+
 #endif	/* _DAMON_H */
diff --git a/include/trace/events/damon.h b/include/trace/events/damon.h
index 2f422f4f1fb9..f0c9f1d801cf 100644
--- a/include/trace/events/damon.h
+++ b/include/trace/events/damon.h
@@ -37,6 +37,25 @@ TRACE_EVENT(damon_aggregated,
 			__entry->start, __entry->end, __entry->nr_accesses)
 );
 
+TRACE_EVENT(damon_pgi,
+
+	TP_PROTO(unsigned long pfn, bool accessed),
+
+	TP_ARGS(pfn, accessed),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, pfn)
+		__field(bool, accessed)
+	),
+
+	TP_fast_assign(
+		__entry->pfn = pfn;
+		__entry->accessed = accessed;
+	),
+
+	TP_printk("pfn=%lu accessed=%u", __entry->pfn, __entry->accessed)
+);
+
 #endif /* _TRACE_DAMON_H */
 
 /* This part must be outside protection */
diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
index 38f4cfce72dd..eeefb5b633b6 100644
--- a/mm/damon/Kconfig
+++ b/mm/damon/Kconfig
@@ -42,6 +42,15 @@ config DAMON_PADDR
 	  This builds the default data access monitoring primitives for DAMON
 	  that works for physical address spaces.
 
+config DAMON_PGIDLE
+	bool "Data access monitoring primitives for page granularity idleness"
+	depends on DAMON && MMU
+	select PAGE_EXTENSION if !64BIT
+	select PAGE_IDLE_FLAG
+	help
+	  This builds the default data access monitoring primitives for DAMON
+	  that works for page granularity idleness monitoring.
+
 config DAMON_VADDR_KUNIT_TEST
 	bool "Test for DAMON primitives" if !KUNIT_ALL_TESTS
 	depends on DAMON_VADDR && KUNIT=y
diff --git a/mm/damon/Makefile b/mm/damon/Makefile
index 8d9b0df79702..017799e5670a 100644
--- a/mm/damon/Makefile
+++ b/mm/damon/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_DAMON)		:= core.o
 obj-$(CONFIG_DAMON_VADDR)	+= prmtv-common.o vaddr.o
 obj-$(CONFIG_DAMON_PADDR)	+= prmtv-common.o paddr.o
+obj-$(CONFIG_DAMON_PGIDLE)	+= prmtv-common.o pgidle.o
 obj-$(CONFIG_DAMON_DBGFS)	+= dbgfs.o
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 143ddc0e5917..95d7f3b745a9 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -7,8 +7,6 @@
 
 #define pr_fmt(fmt) "damon-pa: " fmt
 
-#include <linux/rmap.h>
-
 #include "prmtv-common.h"
 
 /*
diff --git a/mm/damon/pgidle.c b/mm/damon/pgidle.c
new file mode 100644
index 000000000000..dd8297371eaf
--- /dev/null
+++ b/mm/damon/pgidle.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DAMON Primitives for Page Granularity Idleness Monitoring
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#define pr_fmt(fmt) "damon-pgi: " fmt
+
+#include <linux/rmap.h>
+
+#include "prmtv-common.h"
+
+#include <trace/events/damon.h>
+
+bool damon_pgi_is_idle(unsigned long pfn, unsigned long *pg_size)
+{
+	return damon_pa_young(PFN_PHYS(pfn), pg_size);
+}
+
+/*
+ * This has no implementations for 'init_target_regions()' and
+ * 'update_target_regions()'.  Users should set the initial regions and update
+ * regions by themselves in the 'before_start' and 'after_aggregation'
+ * callbacks, respectively.  Or, they can implement and use their own version
+ * of the primitives.
+ */
+
+void damon_pgi_prepare_access_checks(struct damon_ctx *ctx)
+{
+	struct damon_pfns_range *target = ctx->arbitrary_target;
+	unsigned long pfn;
+
+	for (pfn = target->start; pfn < target->end; pfn++)
+		damon_pa_mkold(PFN_PHYS(pfn));
+}
+
+unsigned int damon_pgi_check_accesses(struct damon_ctx *ctx)
+{
+	struct damon_pfns_range *target = ctx->arbitrary_target;
+	unsigned long pfn;
+	unsigned long pg_size = 0;
+
+	for (pfn = target->start; pfn < target->end; pfn++) {
+		pg_size = 0;
+		trace_damon_pgi(pfn, damon_pa_young(PFN_PHYS(pfn), &pg_size));
+		if (pg_size > PAGE_SIZE)
+			pfn += pg_size / PAGE_SIZE - 1;
+	}
+
+	return 0;
+}
+
+bool damon_pgi_target_valid(void *target)
+{
+	return true;
+}
+
+void damon_pgi_set_primitives(struct damon_ctx *ctx)
+{
+	ctx->primitive.init_target_regions = NULL;
+	ctx->primitive.update_target_regions = NULL;
+	ctx->primitive.prepare_access_checks = damon_pgi_prepare_access_checks;
+	ctx->primitive.check_accesses = damon_pgi_check_accesses;
+	ctx->primitive.reset_aggregated = NULL;
+	ctx->primitive.target_valid = damon_pgi_target_valid;
+	ctx->primitive.cleanup = NULL;
+	ctx->primitive.apply_scheme = NULL;
+}
-- 
2.17.1

