Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA10429379F
	for <lists+linux-doc@lfdr.de>; Tue, 20 Oct 2020 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392448AbgJTJHl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Oct 2020 05:07:41 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:3225 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390692AbgJTJHk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Oct 2020 05:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1603184853; x=1634720853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=yoeZCKnjppLsFVM4x4X1pCwQMwJCyP19sjaiZgzKdyI=;
  b=PAoUl6A2AIj9KgqZavEh+OAZK+R3MXVZp4ShKz+khsaJnUVteULp8p26
   67PM6PuLsrwEr8RbtJ/Jd+MUh3ZxAfETV3k3uhOWHvvsi9dIvTkOn883+
   +loVaOaOmdja+GmJx32f8CGBMX+P6u94pebB1LxVg0p21QOwlA9TfwigZ
   4=;
X-IronPort-AV: E=Sophos;i="5.77,396,1596499200"; 
   d="scan'208";a="60708665"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 20 Oct 2020 09:07:33 +0000
Received: from EX13D31EUB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS id 6FE1EA1C0B;
        Tue, 20 Oct 2020 09:07:21 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.237) by
 EX13D31EUB001.ant.amazon.com (10.43.166.210) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 20 Oct 2020 09:07:02 +0000
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
Subject: [PATCH v22 16/18] mm/damon: Add kunit tests
Date:   Tue, 20 Oct 2020 10:59:38 +0200
Message-ID: <20201020085940.13875-17-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020085940.13875-1-sjpark@amazon.com>
References: <20201020085940.13875-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D41UWC001.ant.amazon.com (10.43.162.107) To
 EX13D31EUB001.ant.amazon.com (10.43.166.210)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit adds kunit based unit tests for DAMON.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
 mm/damon/Kconfig           |  36 ++++
 mm/damon/core-test.h       | 253 ++++++++++++++++++++++++++++
 mm/damon/core.c            |   6 +
 mm/damon/dbgfs-test.h      | 209 +++++++++++++++++++++++
 mm/damon/dbgfs.c           |   2 +
 mm/damon/primitives-test.h | 328 +++++++++++++++++++++++++++++++++++++
 mm/damon/primitives.c      |   6 +
 7 files changed, 840 insertions(+)
 create mode 100644 mm/damon/core-test.h
 create mode 100644 mm/damon/dbgfs-test.h
 create mode 100644 mm/damon/primitives-test.h

diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
index e38f95d28f74..9cabf3124c8a 100644
--- a/mm/damon/Kconfig
+++ b/mm/damon/Kconfig
@@ -12,6 +12,18 @@ config DAMON
 	  See https://damonitor.github.io/doc/html/latest-damon/index.html for
 	  more information.
 
+config DAMON_KUNIT_TEST
+	bool "Test for damon" if !KUNIT_ALL_TESTS
+	depends on DAMON && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the DAMON Kunit test suite.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation.
+
+	  If unsure, say N.
+
 config DAMON_PRIMITIVES
 	bool "Monitoring primitives for virtual address spaces monitoring"
 	depends on DAMON && MMU
@@ -22,6 +34,18 @@ config DAMON_PRIMITIVES
 	  The primitives support only virtual address spaces.  If this cannot
 	  cover your use case, you can implement and use your own primitives.
 
+config DAMON_PRIMITIVES_KUNIT_TEST
+	bool "Test for DAMON primitives" if !KUNIT_ALL_TESTS
+	depends on DAMON_PRIMITIVES && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the DAMON PRIMITIVES Kunit test suite.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation.
+
+	  If unsure, say N.
+
 config DAMON_DBGFS
 	bool "DAMON debugfs interface"
 	depends on DAMON_PRIMITIVES && DEBUG_FS
@@ -31,4 +55,16 @@ config DAMON_DBGFS
 
 	  If unsure, say N.
 
+config DAMON_DBGFS_KUNIT_TEST
+	bool "Test for damon debugfs interface" if !KUNIT_ALL_TESTS
+	depends on DAMON_DBGFS && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the DAMON debugfs interface Kunit test suite.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/mm/damon/core-test.h b/mm/damon/core-test.h
new file mode 100644
index 000000000000..b815dfbfb5fd
--- /dev/null
+++ b/mm/damon/core-test.h
@@ -0,0 +1,253 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Data Access Monitor Unit Tests
+ *
+ * Copyright 2019 Amazon.com, Inc. or its affiliates.  All rights reserved.
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#ifdef CONFIG_DAMON_KUNIT_TEST
+
+#ifndef _DAMON_CORE_TEST_H
+#define _DAMON_CORE_TEST_H
+
+#include <kunit/test.h>
+
+static void damon_test_regions(struct kunit *test)
+{
+	struct damon_region *r;
+	struct damon_target *t;
+
+	r = damon_new_region(1, 2);
+	KUNIT_EXPECT_EQ(test, 1ul, r->ar.start);
+	KUNIT_EXPECT_EQ(test, 2ul, r->ar.end);
+	KUNIT_EXPECT_EQ(test, 0u, r->nr_accesses);
+
+	t = damon_new_target(42);
+	KUNIT_EXPECT_EQ(test, 0u, damon_nr_regions(t));
+
+	damon_add_region(r, t);
+	KUNIT_EXPECT_EQ(test, 1u, damon_nr_regions(t));
+
+	damon_del_region(r);
+	KUNIT_EXPECT_EQ(test, 0u, damon_nr_regions(t));
+
+	damon_free_target(t);
+}
+
+static unsigned int nr_damon_targets(struct damon_ctx *ctx)
+{
+	struct damon_target *t;
+	unsigned int nr_targets = 0;
+
+	damon_for_each_target(t, ctx)
+		nr_targets++;
+
+	return nr_targets;
+}
+
+static void damon_test_target(struct kunit *test)
+{
+	struct damon_ctx *c = damon_new_ctx();
+	struct damon_target *t;
+
+	t = damon_new_target(42);
+	KUNIT_EXPECT_EQ(test, 42ul, t->id);
+	KUNIT_EXPECT_EQ(test, 0u, nr_damon_targets(c));
+
+	damon_add_target(c, t);
+	KUNIT_EXPECT_EQ(test, 1u, nr_damon_targets(c));
+
+	damon_destroy_target(t);
+	KUNIT_EXPECT_EQ(test, 0u, nr_damon_targets(c));
+
+	damon_destroy_ctx(c);
+}
+
+/*
+ * Test kdamond_reset_aggregated()
+ *
+ * DAMON checks access to each region and aggregates this information as the
+ * access frequency of each region.  In detail, it increases '->nr_accesses' of
+ * regions that an access has confirmed.  'kdamond_reset_aggregated()' flushes
+ * the aggregated information ('->nr_accesses' of each regions) to the result
+ * buffer.  As a result of the flushing, the '->nr_accesses' of regions are
+ * initialized to zero.
+ */
+static void damon_test_aggregate(struct kunit *test)
+{
+	struct damon_ctx *ctx = damon_new_ctx();
+	unsigned long target_ids[] = {1, 2, 3};
+	unsigned long saddr[][3] = {{10, 20, 30}, {5, 42, 49}, {13, 33, 55} };
+	unsigned long eaddr[][3] = {{15, 27, 40}, {31, 45, 55}, {23, 44, 66} };
+	unsigned long accesses[][3] = {{42, 95, 84}, {10, 20, 30}, {0, 1, 2} };
+	struct damon_target *t;
+	struct damon_region *r;
+	int it, ir;
+
+	damon_set_targets(ctx, target_ids, 3);
+
+	it = 0;
+	damon_for_each_target(t, ctx) {
+		for (ir = 0; ir < 3; ir++) {
+			r = damon_new_region(saddr[it][ir], eaddr[it][ir]);
+			r->nr_accesses = accesses[it][ir];
+			damon_add_region(r, t);
+		}
+		it++;
+	}
+	kdamond_reset_aggregated(ctx);
+	it = 0;
+	damon_for_each_target(t, ctx) {
+		ir = 0;
+		/* '->nr_accesses' should be zeroed */
+		damon_for_each_region(r, t) {
+			KUNIT_EXPECT_EQ(test, 0u, r->nr_accesses);
+			ir++;
+		}
+		/* regions should be preserved */
+		KUNIT_EXPECT_EQ(test, 3, ir);
+		it++;
+	}
+	/* targets also should be preserved */
+	KUNIT_EXPECT_EQ(test, 3, it);
+
+	damon_destroy_ctx(ctx);
+}
+
+static void damon_test_split_at(struct kunit *test)
+{
+	struct damon_ctx *c = damon_new_ctx();
+	struct damon_target *t;
+	struct damon_region *r;
+
+	t = damon_new_target(42);
+	r = damon_new_region(0, 100);
+	damon_add_region(r, t);
+	damon_split_region_at(c, r, 25);
+	KUNIT_EXPECT_EQ(test, r->ar.start, 0ul);
+	KUNIT_EXPECT_EQ(test, r->ar.end, 25ul);
+
+	r = damon_next_region(r);
+	KUNIT_EXPECT_EQ(test, r->ar.start, 25ul);
+	KUNIT_EXPECT_EQ(test, r->ar.end, 100ul);
+
+	damon_free_target(t);
+	damon_destroy_ctx(c);
+}
+
+static void damon_test_merge_two(struct kunit *test)
+{
+	struct damon_target *t;
+	struct damon_region *r, *r2, *r3;
+	int i;
+
+	t = damon_new_target(42);
+	r = damon_new_region(0, 100);
+	r->nr_accesses = 10;
+	damon_add_region(r, t);
+	r2 = damon_new_region(100, 300);
+	r2->nr_accesses = 20;
+	damon_add_region(r2, t);
+
+	damon_merge_two_regions(r, r2);
+	KUNIT_EXPECT_EQ(test, r->ar.start, 0ul);
+	KUNIT_EXPECT_EQ(test, r->ar.end, 300ul);
+	KUNIT_EXPECT_EQ(test, r->nr_accesses, 16u);
+
+	i = 0;
+	damon_for_each_region(r3, t) {
+		KUNIT_EXPECT_PTR_EQ(test, r, r3);
+		i++;
+	}
+	KUNIT_EXPECT_EQ(test, i, 1);
+
+	damon_free_target(t);
+}
+
+static struct damon_region *__nth_region_of(struct damon_target *t, int idx)
+{
+	struct damon_region *r;
+	unsigned int i = 0;
+
+	damon_for_each_region(r, t) {
+		if (i++ == idx)
+			return r;
+	}
+
+	return NULL;
+}
+
+static void damon_test_merge_regions_of(struct kunit *test)
+{
+	struct damon_target *t;
+	struct damon_region *r;
+	unsigned long sa[] = {0, 100, 114, 122, 130, 156, 170, 184};
+	unsigned long ea[] = {100, 112, 122, 130, 156, 170, 184, 230};
+	unsigned int nrs[] = {0, 0, 10, 10, 20, 30, 1, 2};
+
+	unsigned long saddrs[] = {0, 114, 130, 156, 170};
+	unsigned long eaddrs[] = {112, 130, 156, 170, 230};
+	int i;
+
+	t = damon_new_target(42);
+	for (i = 0; i < ARRAY_SIZE(sa); i++) {
+		r = damon_new_region(sa[i], ea[i]);
+		r->nr_accesses = nrs[i];
+		damon_add_region(r, t);
+	}
+
+	damon_merge_regions_of(t, 9, 9999);
+	/* 0-112, 114-130, 130-156, 156-170 */
+	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 5u);
+	for (i = 0; i < 5; i++) {
+		r = __nth_region_of(t, i);
+		KUNIT_EXPECT_EQ(test, r->ar.start, saddrs[i]);
+		KUNIT_EXPECT_EQ(test, r->ar.end, eaddrs[i]);
+	}
+	damon_free_target(t);
+}
+
+static void damon_test_split_regions_of(struct kunit *test)
+{
+	struct damon_ctx *c = damon_new_ctx();
+	struct damon_target *t;
+	struct damon_region *r;
+
+	t = damon_new_target(42);
+	r = damon_new_region(0, 22);
+	damon_add_region(r, t);
+	damon_split_regions_of(c, t, 2);
+	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 2u);
+	damon_free_target(t);
+
+	t = damon_new_target(42);
+	r = damon_new_region(0, 220);
+	damon_add_region(r, t);
+	damon_split_regions_of(c, t, 4);
+	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 4u);
+	damon_free_target(t);
+	damon_destroy_ctx(c);
+}
+
+static struct kunit_case damon_test_cases[] = {
+	KUNIT_CASE(damon_test_target),
+	KUNIT_CASE(damon_test_regions),
+	KUNIT_CASE(damon_test_aggregate),
+	KUNIT_CASE(damon_test_split_at),
+	KUNIT_CASE(damon_test_merge_two),
+	KUNIT_CASE(damon_test_merge_regions_of),
+	KUNIT_CASE(damon_test_split_regions_of),
+	{},
+};
+
+static struct kunit_suite damon_test_suite = {
+	.name = "damon",
+	.test_cases = damon_test_cases,
+};
+kunit_test_suite(damon_test_suite);
+
+#endif /* _DAMON_CORE_TEST_H */
+
+#endif	/* CONFIG_DAMON_KUNIT_TEST */
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 47baf859d7d9..7c547e1022af 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -17,7 +17,11 @@
 #include <trace/events/damon.h>
 
 /* Minimal region size.  Every damon_region is aligned by this. */
+#ifndef CONFIG_DAMON_KUNIT_TEST
 #define MIN_REGION PAGE_SIZE
+#else
+#define MIN_REGION 1
+#endif
 
 /*
  * Functions and macros for DAMON data structures
@@ -703,3 +707,5 @@ static int kdamond_fn(void *data)
 
 	do_exit(0);
 }
+
+#include "core-test.h"
diff --git a/mm/damon/dbgfs-test.h b/mm/damon/dbgfs-test.h
new file mode 100644
index 000000000000..ce9c6784ad47
--- /dev/null
+++ b/mm/damon/dbgfs-test.h
@@ -0,0 +1,209 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * DAMON Debugfs Interface Unit Tests
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#ifdef CONFIG_DAMON_DBGFS_KUNIT_TEST
+
+#ifndef _DAMON_DBGFS_TEST_H
+#define _DAMON_DBGFS_TEST_H
+
+#include <kunit/test.h>
+
+static void damon_dbgfs_test_str_to_target_ids(struct kunit *test)
+{
+	char *question;
+	unsigned long *answers;
+	unsigned long expected[] = {12, 35, 46};
+	ssize_t nr_integers = 0, i;
+
+	question = "123";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)1, nr_integers);
+	KUNIT_EXPECT_EQ(test, 123ul, answers[0]);
+	kfree(answers);
+
+	question = "123abc";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)1, nr_integers);
+	KUNIT_EXPECT_EQ(test, 123ul, answers[0]);
+	kfree(answers);
+
+	question = "a123";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)0, nr_integers);
+	kfree(answers);
+
+	question = "12 35";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)2, nr_integers);
+	for (i = 0; i < nr_integers; i++)
+		KUNIT_EXPECT_EQ(test, expected[i], answers[i]);
+	kfree(answers);
+
+	question = "12 35 46";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)3, nr_integers);
+	for (i = 0; i < nr_integers; i++)
+		KUNIT_EXPECT_EQ(test, expected[i], answers[i]);
+	kfree(answers);
+
+	question = "12 35 abc 46";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)2, nr_integers);
+	for (i = 0; i < 2; i++)
+		KUNIT_EXPECT_EQ(test, expected[i], answers[i]);
+	kfree(answers);
+
+	question = "";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)0, nr_integers);
+	kfree(answers);
+
+	question = "\n";
+	answers = str_to_target_ids(question, strnlen(question, 128),
+			&nr_integers);
+	KUNIT_EXPECT_EQ(test, (ssize_t)0, nr_integers);
+	kfree(answers);
+}
+
+static void damon_dbgfs_test_set_targets(struct kunit *test)
+{
+	struct damon_ctx *ctx = dbgfs_new_ctx();
+	unsigned long ids[] = {1, 2, 3};
+	char buf[64];
+
+	/* Make DAMON consider target id as plain number */
+	ctx->primitive.target_valid = NULL;
+
+	damon_set_targets(ctx, ids, 3);
+	sprint_target_ids(ctx, buf, 64);
+	KUNIT_EXPECT_STREQ(test, (char *)buf, "1 2 3\n");
+
+	damon_set_targets(ctx, NULL, 0);
+	sprint_target_ids(ctx, buf, 64);
+	KUNIT_EXPECT_STREQ(test, (char *)buf, "\n");
+
+	damon_set_targets(ctx, (unsigned long []){1, 2}, 2);
+	sprint_target_ids(ctx, buf, 64);
+	KUNIT_EXPECT_STREQ(test, (char *)buf, "1 2\n");
+
+	damon_set_targets(ctx, (unsigned long []){2}, 1);
+	sprint_target_ids(ctx, buf, 64);
+	KUNIT_EXPECT_STREQ(test, (char *)buf, "2\n");
+
+	damon_set_targets(ctx, NULL, 0);
+	sprint_target_ids(ctx, buf, 64);
+	KUNIT_EXPECT_STREQ(test, (char *)buf, "\n");
+
+	dbgfs_destroy_ctx(ctx);
+}
+
+static void damon_dbgfs_test_set_recording(struct kunit *test)
+{
+	struct damon_ctx *ctx = dbgfs_new_ctx();
+	struct dbgfs_recorder *rec = ctx->callback.private;
+	int err;
+
+	err = dbgfs_set_recording(ctx, 42, "foo");
+	KUNIT_EXPECT_EQ(test, err, -EINVAL);
+	dbgfs_set_recording(ctx, 4242, "foo.bar");
+	KUNIT_EXPECT_EQ(test, rec->rbuf_len, 4242u);
+	KUNIT_EXPECT_STREQ(test, rec->rfile_path, "foo.bar");
+	dbgfs_set_recording(ctx, 424242, "foo");
+	KUNIT_EXPECT_EQ(test, rec->rbuf_len, 424242u);
+	KUNIT_EXPECT_STREQ(test, rec->rfile_path, "foo");
+
+	dbgfs_destroy_ctx(ctx);
+}
+
+static void damon_dbgfs_test_write_rbuf(struct kunit *test)
+{
+	struct damon_ctx *ctx = dbgfs_new_ctx();
+	struct dbgfs_recorder *rec = ctx->callback.private;
+	char *data;
+
+	dbgfs_set_recording(ctx, 4242, "damon.data");
+
+	data = "hello";
+	dbgfs_write_rbuf(ctx, data, strnlen(data, 256));
+	KUNIT_EXPECT_EQ(test, rec->rbuf_offset, 5u);
+
+	dbgfs_write_rbuf(ctx, data, 0);
+	KUNIT_EXPECT_EQ(test, rec->rbuf_offset, 5u);
+
+	KUNIT_EXPECT_STREQ(test, (char *)rec->rbuf, data);
+
+	dbgfs_destroy_ctx(ctx);
+}
+
+/*
+ * Test dbgfs_after_aggregation()
+ *
+ * dbgfs sets dbgfs_after_aggregation() as aggregate callback.  It stores the
+ * aggregated monitoring information ('->nr_accesses' of each regions) to the
+ * result buffer.
+ */
+static void damon_dbgfs_test_aggregate(struct kunit *test)
+{
+	struct damon_ctx *ctx = dbgfs_new_ctx();
+	struct dbgfs_recorder *rec = ctx->callback.private;
+	unsigned long target_ids[] = {1, 2, 3};
+	unsigned long saddr[][3] = {{10, 20, 30}, {5, 42, 49}, {13, 33, 55} };
+	unsigned long eaddr[][3] = {{15, 27, 40}, {31, 45, 55}, {23, 44, 66} };
+	unsigned long accesses[][3] = {{42, 95, 84}, {10, 20, 30}, {0, 1, 2} };
+	struct damon_target *t;
+	struct damon_region *r;
+	int it, ir;
+	ssize_t sz, sr, sp;
+
+	dbgfs_set_recording(ctx, 4242, "damon.data");
+	damon_set_targets(ctx, target_ids, 3);
+
+	it = 0;
+	damon_for_each_target(t, ctx) {
+		for (ir = 0; ir < 3; ir++) {
+			r = damon_new_region(saddr[it][ir], eaddr[it][ir]);
+			r->nr_accesses = accesses[it][ir];
+			damon_add_region(r, t);
+		}
+		it++;
+	}
+	dbgfs_after_aggregation(ctx);
+
+	/* The aggregated information should be written in the buffer */
+	sr = sizeof(r->ar.start) + sizeof(r->ar.end) + sizeof(r->nr_accesses);
+	sp = sizeof(t->id) + sizeof(unsigned int) + 3 * sr;
+	sz = sizeof(struct timespec64) + sizeof(unsigned int) + 3 * sp;
+	KUNIT_EXPECT_EQ(test, (unsigned int)sz, rec->rbuf_offset);
+
+	damon_destroy_ctx(ctx);
+}
+
+static struct kunit_case damon_test_cases[] = {
+	KUNIT_CASE(damon_dbgfs_test_str_to_target_ids),
+	KUNIT_CASE(damon_dbgfs_test_set_targets),
+	KUNIT_CASE(damon_dbgfs_test_set_recording),
+	KUNIT_CASE(damon_dbgfs_test_write_rbuf),
+	KUNIT_CASE(damon_dbgfs_test_aggregate),
+	{},
+};
+
+static struct kunit_suite damon_test_suite = {
+	.name = "damon-dbgfs",
+	.test_cases = damon_test_cases,
+};
+kunit_test_suite(damon_test_suite);
+
+#endif /* _DAMON_TEST_H */
+
+#endif	/* CONFIG_DAMON_KUNIT_TEST */
diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index 2c9e9e05adca..ab803e91d03d 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -918,3 +918,5 @@ static int __init damon_dbgfs_init(void)
 }
 
 module_init(damon_dbgfs_init);
+
+#include "dbgfs-test.h"
diff --git a/mm/damon/primitives-test.h b/mm/damon/primitives-test.h
new file mode 100644
index 000000000000..8df2fc46e5f9
--- /dev/null
+++ b/mm/damon/primitives-test.h
@@ -0,0 +1,328 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Data Access Monitor Unit Tests
+ *
+ * Copyright 2019 Amazon.com, Inc. or its affiliates.  All rights reserved.
+ *
+ * Author: SeongJae Park <sjpark@amazon.de>
+ */
+
+#ifdef CONFIG_DAMON_PRIMITIVES_KUNIT_TEST
+
+#ifndef _DAMON_PRIMITIVES_TEST_H
+#define _DAMON_PRIMITIVES_TEST_H
+
+#include <kunit/test.h>
+
+static void __link_vmas(struct vm_area_struct *vmas, ssize_t nr_vmas)
+{
+	int i, j;
+	unsigned long largest_gap, gap;
+
+	if (!nr_vmas)
+		return;
+
+	for (i = 0; i < nr_vmas - 1; i++) {
+		vmas[i].vm_next = &vmas[i + 1];
+
+		vmas[i].vm_rb.rb_left = NULL;
+		vmas[i].vm_rb.rb_right = &vmas[i + 1].vm_rb;
+
+		largest_gap = 0;
+		for (j = i; j < nr_vmas; j++) {
+			if (j == 0)
+				continue;
+			gap = vmas[j].vm_start - vmas[j - 1].vm_end;
+			if (gap > largest_gap)
+				largest_gap = gap;
+		}
+		vmas[i].rb_subtree_gap = largest_gap;
+	}
+	vmas[i].vm_next = NULL;
+	vmas[i].vm_rb.rb_right = NULL;
+	vmas[i].rb_subtree_gap = 0;
+}
+
+/*
+ * Test __damon_va_three_regions() function
+ *
+ * In case of virtual memory address spaces monitoring, DAMON converts the
+ * complex and dynamic memory mappings of each target task to three
+ * discontiguous regions which cover every mapped areas.  However, the three
+ * regions should not include the two biggest unmapped areas in the original
+ * mapping, because the two biggest areas are normally the areas between 1)
+ * heap and the mmap()-ed regions, and 2) the mmap()-ed regions and stack.
+ * Because these two unmapped areas are very huge but obviously never accessed,
+ * covering the region is just a waste.
+ *
+ * '__damon_va_three_regions() receives an address space of a process.  It
+ * first identifies the start of mappings, end of mappings, and the two biggest
+ * unmapped areas.  After that, based on the information, it constructs the
+ * three regions and returns.  For more detail, refer to the comment of
+ * 'damon_init_regions_of()' function definition in 'mm/damon.c' file.
+ *
+ * For example, suppose virtual address ranges of 10-20, 20-25, 200-210,
+ * 210-220, 300-305, and 307-330 (Other comments represent this mappings in
+ * more short form: 10-20-25, 200-210-220, 300-305, 307-330) of a process are
+ * mapped.  To cover every mappings, the three regions should start with 10,
+ * and end with 305.  The process also has three unmapped areas, 25-200,
+ * 220-300, and 305-307.  Among those, 25-200 and 220-300 are the biggest two
+ * unmapped areas, and thus it should be converted to three regions of 10-25,
+ * 200-220, and 300-330.
+ */
+static void damon_test_three_regions_in_vmas(struct kunit *test)
+{
+	struct damon_addr_range regions[3] = {0,};
+	/* 10-20-25, 200-210-220, 300-305, 307-330 */
+	struct vm_area_struct vmas[] = {
+		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
+		(struct vm_area_struct) {.vm_start = 20, .vm_end = 25},
+		(struct vm_area_struct) {.vm_start = 200, .vm_end = 210},
+		(struct vm_area_struct) {.vm_start = 210, .vm_end = 220},
+		(struct vm_area_struct) {.vm_start = 300, .vm_end = 305},
+		(struct vm_area_struct) {.vm_start = 307, .vm_end = 330},
+	};
+
+	__link_vmas(vmas, 6);
+
+	__damon_va_three_regions(&vmas[0], regions);
+
+	KUNIT_EXPECT_EQ(test, 10ul, regions[0].start);
+	KUNIT_EXPECT_EQ(test, 25ul, regions[0].end);
+	KUNIT_EXPECT_EQ(test, 200ul, regions[1].start);
+	KUNIT_EXPECT_EQ(test, 220ul, regions[1].end);
+	KUNIT_EXPECT_EQ(test, 300ul, regions[2].start);
+	KUNIT_EXPECT_EQ(test, 330ul, regions[2].end);
+}
+
+static struct damon_region *__nth_region_of(struct damon_target *t, int idx)
+{
+	struct damon_region *r;
+	unsigned int i = 0;
+
+	damon_for_each_region(r, t) {
+		if (i++ == idx)
+			return r;
+	}
+
+	return NULL;
+}
+
+/*
+ * Test 'damon_va_apply_three_regions()'
+ *
+ * test			kunit object
+ * regions		an array containing start/end addresses of current
+ *			monitoring target regions
+ * nr_regions		the number of the addresses in 'regions'
+ * three_regions	The three regions that need to be applied now
+ * expected		start/end addresses of monitoring target regions that
+ *			'three_regions' are applied
+ * nr_expected		the number of addresses in 'expected'
+ *
+ * The memory mapping of the target processes changes dynamically.  To follow
+ * the change, DAMON periodically reads the mappings, simplifies it to the
+ * three regions, and updates the monitoring target regions to fit in the three
+ * regions.  The update of current target regions is the role of
+ * 'damon_va_apply_three_regions()'.
+ *
+ * This test passes the given target regions and the new three regions that
+ * need to be applied to the function and check whether it updates the regions
+ * as expected.
+ */
+static void damon_do_test_apply_three_regions(struct kunit *test,
+				unsigned long *regions, int nr_regions,
+				struct damon_addr_range *three_regions,
+				unsigned long *expected, int nr_expected)
+{
+	struct damon_ctx *ctx = damon_new_ctx();
+	struct damon_target *t;
+	struct damon_region *r;
+	int i;
+
+	t = damon_new_target(42);
+	for (i = 0; i < nr_regions / 2; i++) {
+		r = damon_new_region(regions[i * 2], regions[i * 2 + 1]);
+		damon_add_region(r, t);
+	}
+	damon_add_target(ctx, t);
+
+	damon_va_apply_three_regions(ctx, t, three_regions);
+
+	for (i = 0; i < nr_expected / 2; i++) {
+		r = __nth_region_of(t, i);
+		KUNIT_EXPECT_EQ(test, r->ar.start, expected[i * 2]);
+		KUNIT_EXPECT_EQ(test, r->ar.end, expected[i * 2 + 1]);
+	}
+
+	damon_destroy_ctx(ctx);
+}
+
+/*
+ * This function test most common case where the three big regions are only
+ * slightly changed.  Target regions should adjust their boundary (10-20-30,
+ * 50-55, 70-80, 90-100) to fit with the new big regions or remove target
+ * regions (57-79) that now out of the three regions.
+ */
+static void damon_test_apply_three_regions1(struct kunit *test)
+{
+	/* 10-20-30, 50-55-57-59, 70-80-90-100 */
+	unsigned long regions[] = {10, 20, 20, 30, 50, 55, 55, 57, 57, 59,
+				70, 80, 80, 90, 90, 100};
+	/* 5-27, 45-55, 73-104 */
+	struct damon_addr_range new_three_regions[3] = {
+		(struct damon_addr_range){.start = 5, .end = 27},
+		(struct damon_addr_range){.start = 45, .end = 55},
+		(struct damon_addr_range){.start = 73, .end = 104} };
+	/* 5-20-27, 45-55, 73-80-90-104 */
+	unsigned long expected[] = {5, 20, 20, 27, 45, 55,
+				73, 80, 80, 90, 90, 104};
+
+	damon_do_test_apply_three_regions(test, regions, ARRAY_SIZE(regions),
+			new_three_regions, expected, ARRAY_SIZE(expected));
+}
+
+/*
+ * Test slightly bigger change.  Similar to above, but the second big region
+ * now require two target regions (50-55, 57-59) to be removed.
+ */
+static void damon_test_apply_three_regions2(struct kunit *test)
+{
+	/* 10-20-30, 50-55-57-59, 70-80-90-100 */
+	unsigned long regions[] = {10, 20, 20, 30, 50, 55, 55, 57, 57, 59,
+				70, 80, 80, 90, 90, 100};
+	/* 5-27, 56-57, 65-104 */
+	struct damon_addr_range new_three_regions[3] = {
+		(struct damon_addr_range){.start = 5, .end = 27},
+		(struct damon_addr_range){.start = 56, .end = 57},
+		(struct damon_addr_range){.start = 65, .end = 104} };
+	/* 5-20-27, 56-57, 65-80-90-104 */
+	unsigned long expected[] = {5, 20, 20, 27, 56, 57,
+				65, 80, 80, 90, 90, 104};
+
+	damon_do_test_apply_three_regions(test, regions, ARRAY_SIZE(regions),
+			new_three_regions, expected, ARRAY_SIZE(expected));
+}
+
+/*
+ * Test a big change.  The second big region has totally freed and mapped to
+ * different area (50-59 -> 61-63).  The target regions which were in the old
+ * second big region (50-55-57-59) should be removed and new target region
+ * covering the second big region (61-63) should be created.
+ */
+static void damon_test_apply_three_regions3(struct kunit *test)
+{
+	/* 10-20-30, 50-55-57-59, 70-80-90-100 */
+	unsigned long regions[] = {10, 20, 20, 30, 50, 55, 55, 57, 57, 59,
+				70, 80, 80, 90, 90, 100};
+	/* 5-27, 61-63, 65-104 */
+	struct damon_addr_range new_three_regions[3] = {
+		(struct damon_addr_range){.start = 5, .end = 27},
+		(struct damon_addr_range){.start = 61, .end = 63},
+		(struct damon_addr_range){.start = 65, .end = 104} };
+	/* 5-20-27, 61-63, 65-80-90-104 */
+	unsigned long expected[] = {5, 20, 20, 27, 61, 63,
+				65, 80, 80, 90, 90, 104};
+
+	damon_do_test_apply_three_regions(test, regions, ARRAY_SIZE(regions),
+			new_three_regions, expected, ARRAY_SIZE(expected));
+}
+
+/*
+ * Test another big change.  Both of the second and third big regions (50-59
+ * and 70-100) has totally freed and mapped to different area (30-32 and
+ * 65-68).  The target regions which were in the old second and third big
+ * regions should now be removed and new target regions covering the new second
+ * and third big regions should be crated.
+ */
+static void damon_test_apply_three_regions4(struct kunit *test)
+{
+	/* 10-20-30, 50-55-57-59, 70-80-90-100 */
+	unsigned long regions[] = {10, 20, 20, 30, 50, 55, 55, 57, 57, 59,
+				70, 80, 80, 90, 90, 100};
+	/* 5-7, 30-32, 65-68 */
+	struct damon_addr_range new_three_regions[3] = {
+		(struct damon_addr_range){.start = 5, .end = 7},
+		(struct damon_addr_range){.start = 30, .end = 32},
+		(struct damon_addr_range){.start = 65, .end = 68} };
+	/* expect 5-7, 30-32, 65-68 */
+	unsigned long expected[] = {5, 7, 30, 32, 65, 68};
+
+	damon_do_test_apply_three_regions(test, regions, ARRAY_SIZE(regions),
+			new_three_regions, expected, ARRAY_SIZE(expected));
+}
+
+static void damon_test_split_evenly(struct kunit *test)
+{
+	struct damon_ctx *c = damon_new_ctx();
+	struct damon_target *t;
+	struct damon_region *r;
+	unsigned long i;
+
+	KUNIT_EXPECT_EQ(test, damon_va_evenly_split_region(c, NULL, 5), -EINVAL);
+
+	t = damon_new_target(42);
+	r = damon_new_region(0, 100);
+	KUNIT_EXPECT_EQ(test, damon_va_evenly_split_region(c, r, 0), -EINVAL);
+
+	damon_add_region(r, t);
+	KUNIT_EXPECT_EQ(test, damon_va_evenly_split_region(c, r, 10), 0);
+	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 10u);
+
+	i = 0;
+	damon_for_each_region(r, t) {
+		KUNIT_EXPECT_EQ(test, r->ar.start, i++ * 10);
+		KUNIT_EXPECT_EQ(test, r->ar.end, i * 10);
+	}
+	damon_free_target(t);
+
+	t = damon_new_target(42);
+	r = damon_new_region(5, 59);
+	damon_add_region(r, t);
+	KUNIT_EXPECT_EQ(test, damon_va_evenly_split_region(c, r, 5), 0);
+	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 5u);
+
+	i = 0;
+	damon_for_each_region(r, t) {
+		if (i == 4)
+			break;
+		KUNIT_EXPECT_EQ(test, r->ar.start, 5 + 10 * i++);
+		KUNIT_EXPECT_EQ(test, r->ar.end, 5 + 10 * i);
+	}
+	KUNIT_EXPECT_EQ(test, r->ar.start, 5 + 10 * i);
+	KUNIT_EXPECT_EQ(test, r->ar.end, 59ul);
+	damon_free_target(t);
+
+	t = damon_new_target(42);
+	r = damon_new_region(5, 6);
+	damon_add_region(r, t);
+	KUNIT_EXPECT_EQ(test, damon_va_evenly_split_region(c, r, 2), -EINVAL);
+	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 1u);
+
+	damon_for_each_region(r, t) {
+		KUNIT_EXPECT_EQ(test, r->ar.start, 5ul);
+		KUNIT_EXPECT_EQ(test, r->ar.end, 6ul);
+	}
+	damon_free_target(t);
+	damon_destroy_ctx(c);
+}
+
+static struct kunit_case damon_test_cases[] = {
+	KUNIT_CASE(damon_test_three_regions_in_vmas),
+	KUNIT_CASE(damon_test_apply_three_regions1),
+	KUNIT_CASE(damon_test_apply_three_regions2),
+	KUNIT_CASE(damon_test_apply_three_regions3),
+	KUNIT_CASE(damon_test_apply_three_regions4),
+	KUNIT_CASE(damon_test_split_evenly),
+	{},
+};
+
+static struct kunit_suite damon_test_suite = {
+	.name = "damon-primitives",
+	.test_cases = damon_test_cases,
+};
+kunit_test_suite(damon_test_suite);
+
+#endif /* _DAMON_PRIMITIVES_TEST_H */
+
+#endif	/* CONFIG_DAMON_PRIMITIVES_KUNIT_TEST */
diff --git a/mm/damon/primitives.c b/mm/damon/primitives.c
index 59f4de703413..9cbb20bdf2ae 100644
--- a/mm/damon/primitives.c
+++ b/mm/damon/primitives.c
@@ -20,7 +20,11 @@ DEFINE_MUTEX(page_idle_lock);
 #endif
 
 /* Minimal region size.  Every damon_region is aligned by this. */
+#ifndef CONFIG_DAMON_PRIMITIVES_KUNIT_TEST
 #define MIN_REGION PAGE_SIZE
+#else
+#define MIN_REGION 1
+#endif
 
 /* Get a random number in [l, r) */
 #define damon_rand(l, r) (l + prandom_u32_max(r - l))
@@ -587,3 +591,5 @@ void damon_va_set_primitives(struct damon_ctx *ctx)
 	ctx->primitive.target_valid = damon_va_target_valid;
 	ctx->primitive.cleanup = damon_va_cleanup;
 }
+
+#include "primitives-test.h"
-- 
2.17.1

