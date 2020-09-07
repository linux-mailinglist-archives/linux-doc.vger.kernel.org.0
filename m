Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F3F26024E
	for <lists+linux-doc@lfdr.de>; Mon,  7 Sep 2020 19:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730795AbgIGRWw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 13:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729657AbgIGNpP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 09:45:15 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 863D4C0617A9
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 06:41:35 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id y12so7584920qva.8
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=EfD2mukgtJ4aRPx51F673PTTAg9GhuXZLUcCkcKZuoE=;
        b=bm+f0jEcL/hScxeuVVNPM3Fo2CCQVangO/FYJi20WLENhtABBO6qNErG46VPsQu6NA
         hHseBSt1mVnxm5M8QRDlmfXYNI5CAm6ax8sn0/c/0z1RASgtqjawY5wXsWs7mRCjPtTx
         WDhwyn6rpYrc9pCR1sQgV71kK7zStWm2ibEjycR7jLQ4S+Ud7m5G9gUB64mC0YjoD+j5
         IJDpdRa+/oQEqiyo7z3nsKl7MWGYuY2nxIK/oM5lRHz+R5ZKdZvYAtaPnHD/F/ZuWGyW
         1lTLweuPbF0pY7qMMKyvc+pDKreqjOUCDGqz0DITElxUvU1Fd12U7GDedppQPr4w0s4a
         k/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EfD2mukgtJ4aRPx51F673PTTAg9GhuXZLUcCkcKZuoE=;
        b=smhuopTvuV7y/ZNyiLNL0KK3fRpXaSev1HA7vbD2AqACcEB8tUMbpS0hjh+uAg5KoH
         Dl7xvSuMpwbx6TTiRs/NBJ1xuNp4o40KKzBoJi1E9Dl7hkwTcJ+6YD3uKFvFK2FKQkDv
         mrvf9birus5j9Y+5mjH3h2gBrmNovGSwJ9GYTfnY76E07Ct3U4FkXmP6lwQdA2KfTJIZ
         Cc/vSj6xwS8vTn0aRQ4RPfwZUoMXDKdAaKajGtgHwLLqZymkXYn12NSi5HeHmip0FjIK
         i4ABWSuXIeA8BhWPFYggy/LJeTqQZ9013A7EMYrJkAiUGXdi9OFLhi/JyfFVon0bexYM
         88RA==
X-Gm-Message-State: AOAM530uq+CKweJmYqqdPitxlm1kygQ3jt7GylOxWZlpIl/g6edfNGdG
        pxUPFVr0y+s9XIAiOFNh/VeWG2xsEQ==
X-Google-Smtp-Source: ABdhPJyz5laC0lhwqnZWgaLfY7HtFDlpmtFXZ4ktyQaY+t6ZvkR9EwylFaMA0Bs4tJb6desv8TLPEcfCBA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a0c:b2d4:: with SMTP id d20mr18889583qvf.1.1599486094476;
 Mon, 07 Sep 2020 06:41:34 -0700 (PDT)
Date:   Mon,  7 Sep 2020 15:40:55 +0200
In-Reply-To: <20200907134055.2878499-1-elver@google.com>
Message-Id: <20200907134055.2878499-11-elver@google.com>
Mime-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH RFC 10/10] kfence: add test suite
From:   Marco Elver <elver@google.com>
To:     elver@google.com, glider@google.com, akpm@linux-foundation.org,
        catalin.marinas@arm.com, cl@linux.com, rientjes@google.com,
        iamjoonsoo.kim@lge.com, mark.rutland@arm.com, penberg@kernel.org
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, dvyukov@google.com,
        edumazet@google.com, gregkh@linuxfoundation.org, mingo@redhat.com,
        jannh@google.com, corbet@lwn.net, keescook@chromium.org,
        peterz@infradead.org, cai@lca.pw, tglx@linutronix.de,
        will@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add KFENCE test suite, testing various error detection scenarios. Makes
use of KUnit for test organization. Since KFENCE's interface to obtain
error reports is via the console, the test verifies that KFENCE outputs
expected reports to the console.

Co-developed-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
 lib/Kconfig.kfence      |  12 +
 mm/kfence/Makefile      |   3 +
 mm/kfence/kfence-test.c | 777 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 792 insertions(+)
 create mode 100644 mm/kfence/kfence-test.c

diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
index b080e49e15d4..c5e3ef87aa67 100644
--- a/lib/Kconfig.kfence
+++ b/lib/Kconfig.kfence
@@ -55,4 +55,16 @@ config KFENCE_FAULT_INJECTION
 	  this option is to stress-test KFENCE with concurrent error reports
 	  and allocations/frees. A value of 0 disables fault injection.
 
+config KFENCE_TEST
+	tristate "KFENCE test suite"
+	depends on TRACEPOINTS && KUNIT
+	help
+	  Test suite for KFENCE, testing various error detection scenarios with
+	  various allocation types, and checking that reports are correctly
+	  output to console.
+
+	  Say Y here if you want the test to be built into the kernel and run
+	  during boot; say M if you want the test to build as a module; say N
+	  if you are unsure.
+
 endif # KFENCE
diff --git a/mm/kfence/Makefile b/mm/kfence/Makefile
index d991e9a349f0..0ce5f772f9b3 100644
--- a/mm/kfence/Makefile
+++ b/mm/kfence/Makefile
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_KFENCE) := core.o report.o
+
+CFLAGS_kfence-test.o := -g -fno-omit-frame-pointer -fno-optimize-sibling-calls
+obj-$(CONFIG_KFENCE_TEST) += kfence-test.o
diff --git a/mm/kfence/kfence-test.c b/mm/kfence/kfence-test.c
new file mode 100644
index 000000000000..6c6b713638de
--- /dev/null
+++ b/mm/kfence/kfence-test.c
@@ -0,0 +1,777 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test cases for KFENCE memory safety error detector. Since the interface with
+ * which KFENCE's reports are obtained is via the console, this is the output we
+ * should verify. For each test case checks the presence (or absence) of
+ * generated reports. Relies on 'console' tracepoint to capture reports as they
+ * appear in the kernel log.
+ *
+ * Copyright (C) 2020, Google LLC.
+ * Author: Alexander Potapenko <glider@google.com>
+ *         Marco Elver <elver@google.com>
+ */
+
+#include <kunit/test.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/kfence.h>
+#include <linux/mm.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/tracepoint.h>
+#include <trace/events/printk.h>
+
+#include "kfence.h"
+
+/* Report as observed from console. */
+static struct {
+	spinlock_t lock;
+	int nlines;
+	char lines[2][512];
+} observed = {
+	.lock = __SPIN_LOCK_UNLOCKED(observed.lock),
+};
+
+/* Probe for console output: obtains observed lines of interest. */
+static void probe_console(void *ignore, const char *buf, size_t len)
+{
+	unsigned long flags;
+	int nlines;
+
+	spin_lock_irqsave(&observed.lock, flags);
+	nlines = observed.nlines;
+
+	if (strnstr(buf, "BUG: KFENCE: ", len) && strnstr(buf, "test_", len)) {
+		/*
+		 * KFENCE report and related to the test.
+		 *
+		 * The provided @buf is not NUL-terminated; copy no more than
+		 * @len bytes and let strscpy() add the missing NUL-terminator.
+		 */
+		strscpy(observed.lines[0], buf, min(len + 1, sizeof(observed.lines[0])));
+		nlines = 1;
+	} else if (nlines == 1 && (strnstr(buf, "at 0x", len) || strnstr(buf, "of 0x", len))) {
+		strscpy(observed.lines[nlines++], buf, min(len + 1, sizeof(observed.lines[0])));
+	}
+
+	WRITE_ONCE(observed.nlines, nlines); /* Publish new nlines. */
+	spin_unlock_irqrestore(&observed.lock, flags);
+}
+
+/* Check if a report related to the test exists. */
+static bool report_available(void)
+{
+	return READ_ONCE(observed.nlines) == ARRAY_SIZE(observed.lines);
+}
+
+/* Information we expect in a report. */
+struct expect_report {
+	enum kfence_error_type type; /* The type or error. */
+	void *fn; /* Function pointer to expected function where access occurred. */
+	char *addr; /* Address at which the bad access occurred. */
+};
+
+/* Check observed report matches information in @r. */
+static bool report_matches(const struct expect_report *r)
+{
+	bool ret = false;
+	unsigned long flags;
+	typeof(observed.lines) expect;
+	const char *end;
+	char *cur;
+
+	/* Doubled-checked locking. */
+	if (!report_available())
+		return false;
+
+	/* Generate expected report contents. */
+
+	/* Title */
+	cur = expect[0];
+	end = &expect[0][sizeof(expect[0]) - 1];
+	switch (r->type) {
+	case KFENCE_ERROR_OOB:
+		cur += scnprintf(cur, end - cur, "BUG: KFENCE: out-of-bounds");
+		break;
+	case KFENCE_ERROR_UAF:
+		cur += scnprintf(cur, end - cur, "BUG: KFENCE: use-after-free");
+		break;
+	case KFENCE_ERROR_CORRUPTION:
+		cur += scnprintf(cur, end - cur, "BUG: KFENCE: memory corruption");
+		break;
+	case KFENCE_ERROR_INVALID:
+		cur += scnprintf(cur, end - cur, "BUG: KFENCE: invalid access");
+		break;
+	case KFENCE_ERROR_INVALID_FREE:
+		cur += scnprintf(cur, end - cur, "BUG: KFENCE: invalid free");
+		break;
+	}
+
+	scnprintf(cur, end - cur, " in %pS", r->fn);
+	/* The exact offset won't match, remove it; also strip module name. */
+	cur = strchr(expect[0], '+');
+	if (cur)
+		*cur = '\0';
+
+	/* Access information */
+	cur = expect[1];
+	end = &expect[1][sizeof(expect[1]) - 1];
+
+	switch (r->type) {
+	case KFENCE_ERROR_OOB:
+		cur += scnprintf(cur, end - cur, "Out-of-bounds access at");
+		break;
+	case KFENCE_ERROR_UAF:
+		cur += scnprintf(cur, end - cur, "Use-after-free access at");
+		break;
+	case KFENCE_ERROR_CORRUPTION:
+		cur += scnprintf(cur, end - cur, "Detected corrupted memory at");
+		break;
+	case KFENCE_ERROR_INVALID:
+		cur += scnprintf(cur, end - cur, "Invalid access at");
+		break;
+	case KFENCE_ERROR_INVALID_FREE:
+		cur += scnprintf(cur, end - cur, "Invalid free of");
+		break;
+	}
+
+	cur += scnprintf(cur, end - cur, " 0x" PTR_FMT, (void *)r->addr);
+
+	spin_lock_irqsave(&observed.lock, flags);
+	if (!report_available())
+		goto out; /* A new report is being captured. */
+
+	/* Finally match expected output to what we actually observed. */
+	ret = strstr(observed.lines[0], expect[0]) && strstr(observed.lines[1], expect[1]);
+out:
+	spin_unlock_irqrestore(&observed.lock, flags);
+	return ret;
+}
+
+/* ===== Test cases ===== */
+
+#define TEST_PRIV_WANT_MEMCACHE ((void *)1)
+
+/* Cache used by tests; if NULL, allocate from kmalloc instead. */
+static struct kmem_cache *test_cache;
+
+static size_t setup_test_cache(struct kunit *test, size_t size, slab_flags_t flags,
+			       void (*ctor)(void *))
+{
+	if (test->priv != TEST_PRIV_WANT_MEMCACHE)
+		return size;
+
+	kunit_info(test, "%s: size=%zu, ctor=%ps\n", __func__, size, ctor);
+
+	/*
+	 * Use SLAB_NOLEAKTRACE to prevent merging with existing caches. Any
+	 * other flag in SLAB_NEVER_MERGE also works. Use SLAB_ACCOUNT to
+	 * allocate via memcg, if enabled.
+	 */
+	flags |= SLAB_NOLEAKTRACE | SLAB_ACCOUNT;
+	test_cache = kmem_cache_create("test", size, 1, flags, ctor);
+	KUNIT_ASSERT_TRUE_MSG(test, test_cache, "could not create cache");
+
+	return size;
+}
+
+static void test_cache_destroy(void)
+{
+	if (!test_cache)
+		return;
+
+	kmem_cache_destroy(test_cache);
+	test_cache = NULL;
+}
+
+static inline size_t kmalloc_cache_alignment(size_t size)
+{
+	return kmalloc_caches[kmalloc_type(GFP_KERNEL)][kmalloc_index(size)]->align;
+}
+
+/* Must always inline to match stack trace against caller. */
+static __always_inline void test_free(void *ptr)
+{
+	if (test_cache)
+		kmem_cache_free(test_cache, ptr);
+	else
+		kfree(ptr);
+}
+
+/*
+ * If this should be a KFENCE allocation, and on which side the allocation and
+ * the closest guard page should be.
+ */
+enum allocation_policy {
+	ALLOCATE_ANY, /* KFENCE, any side. */
+	ALLOCATE_LEFT, /* KFENCE, left side of page. */
+	ALLOCATE_RIGHT, /* KFENCE, right side of page. */
+	ALLOCATE_NONE, /* No KFENCE allocation. */
+};
+
+/*
+ * Try to get a guarded allocation from KFENCE. Uses either kmalloc() or the
+ * current test_cache if set up.
+ */
+static void *test_alloc(struct kunit *test, size_t size, gfp_t gfp, enum allocation_policy policy)
+{
+	void *alloc;
+	unsigned long timeout, resched_after;
+	const char *policy_name;
+
+	switch (policy) {
+	case ALLOCATE_ANY:
+		policy_name = "any";
+		break;
+	case ALLOCATE_LEFT:
+		policy_name = "left";
+		break;
+	case ALLOCATE_RIGHT:
+		policy_name = "right";
+		break;
+	case ALLOCATE_NONE:
+		policy_name = "none";
+		break;
+	}
+
+	kunit_info(test, "%s: size=%zu, gfp=%x, policy=%s, cache=%i\n", __func__, size, gfp,
+		   policy_name, !!test_cache);
+
+	/*
+	 * 100x the sample interval should be more than enough to ensure we get
+	 * a KFENCE allocation eventually.
+	 */
+	timeout = jiffies + msecs_to_jiffies(100 * CONFIG_KFENCE_SAMPLE_INTERVAL);
+	/*
+	 * Especially for non-preemption kernels, ensure the allocation-gate
+	 * timer has time to catch up.
+	 */
+	resched_after = jiffies + msecs_to_jiffies(CONFIG_KFENCE_SAMPLE_INTERVAL);
+	do {
+		if (test_cache)
+			alloc = kmem_cache_alloc(test_cache, gfp);
+		else
+			alloc = kmalloc(size, gfp);
+
+		if (is_kfence_address(alloc)) {
+			if (policy == ALLOCATE_ANY)
+				return alloc;
+			if (policy == ALLOCATE_LEFT && IS_ALIGNED((unsigned long)alloc, PAGE_SIZE))
+				return alloc;
+			if (policy == ALLOCATE_RIGHT &&
+			    !IS_ALIGNED((unsigned long)alloc, PAGE_SIZE))
+				return alloc;
+		} else if (policy == ALLOCATE_NONE)
+			return alloc;
+
+		test_free(alloc);
+
+		if (time_after(jiffies, resched_after))
+			cond_resched();
+	} while (time_before(jiffies, timeout));
+
+	KUNIT_ASSERT_TRUE_MSG(test, false, "failed to allocate from KFENCE");
+	return NULL; /* Unreachable. */
+}
+
+static void test_out_of_bounds_read(struct kunit *test)
+{
+	size_t size = 32;
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_OOB,
+		.fn = test_out_of_bounds_read,
+	};
+	char *buf;
+
+	setup_test_cache(test, size, 0, NULL);
+
+	/*
+	 * If we don't have our own cache, adjust based on alignment, so that we
+	 * actually access guard pages on either side.
+	 */
+	if (!test_cache)
+		size = kmalloc_cache_alignment(size);
+
+	/* Test both sides. */
+
+	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_LEFT);
+	expect.addr = buf - 1;
+	READ_ONCE(*expect.addr);
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+	test_free(buf);
+
+	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_RIGHT);
+	expect.addr = buf + size;
+	READ_ONCE(*expect.addr);
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+	test_free(buf);
+}
+
+static void test_use_after_free_read(struct kunit *test)
+{
+	const size_t size = 32;
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_UAF,
+		.fn = test_use_after_free_read,
+	};
+
+	setup_test_cache(test, size, 0, NULL);
+	expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	test_free(expect.addr);
+	READ_ONCE(*expect.addr);
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+}
+
+static void test_double_free(struct kunit *test)
+{
+	const size_t size = 32;
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_INVALID_FREE,
+		.fn = test_double_free,
+	};
+
+	setup_test_cache(test, size, 0, NULL);
+	expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	test_free(expect.addr);
+	test_free(expect.addr); /* Double-free. */
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+}
+
+static void test_invalid_addr_free(struct kunit *test)
+{
+	const size_t size = 32;
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_INVALID_FREE,
+		.fn = test_invalid_addr_free,
+	};
+	char *buf;
+
+	setup_test_cache(test, size, 0, NULL);
+	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	expect.addr = buf + 1; /* Free on invalid address. */
+	test_free(expect.addr); /* Invalid address free. */
+	test_free(buf); /* No error. */
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+}
+
+/*
+ * KFENCE is unable to detect an OOB if the allocation's alignment requirements
+ * leave a gap between the object and the guard page. Specifically, an
+ * allocation of e.g. 73 bytes is aligned on 8 and 128 bytes for SLUB or SLAB
+ * respectively. Therefore it is impossible for the allocated object to adhere
+ * to either of the page boundaries.
+ *
+ * However, we test that an access to memory beyond the gap result in KFENCE
+ * detecting an OOB access.
+ */
+static void test_kmalloc_aligned_oob_read(struct kunit *test)
+{
+	const size_t size = 73;
+	const size_t align = kmalloc_cache_alignment(size);
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_OOB,
+		.fn = test_kmalloc_aligned_oob_read,
+	};
+	char *buf;
+
+	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_RIGHT);
+
+	/*
+	 * The object is offset to the right, so there won't be an OOB to the
+	 * left of it.
+	 */
+	READ_ONCE(*(buf - 1));
+	KUNIT_EXPECT_FALSE(test, report_available());
+
+	/*
+	 * @buf must be aligned on @align, therefore buf + size belongs to the
+	 * same page -> no OOB.
+	 */
+	READ_ONCE(*(buf + size));
+	KUNIT_EXPECT_FALSE(test, report_available());
+
+	/* Overflowing by @align bytes will result in an OOB. */
+	expect.addr = buf + size + align;
+	READ_ONCE(*expect.addr);
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+
+	test_free(buf);
+}
+
+static void test_kmalloc_aligned_oob_write(struct kunit *test)
+{
+	const size_t size = 73;
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_CORRUPTION,
+		.fn = test_kmalloc_aligned_oob_write,
+	};
+	char *buf;
+
+	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_RIGHT);
+	/*
+	 * The object is offset to the right, so we won't get a page
+	 * fault immediately after it.
+	 */
+	expect.addr = buf + size;
+	WRITE_ONCE(*expect.addr, READ_ONCE(*expect.addr) + 1);
+	KUNIT_EXPECT_FALSE(test, report_available());
+	test_free(buf);
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+}
+
+/* Test cache shrinking and destroying with KFENCE. */
+static void test_shrink_memcache(struct kunit *test)
+{
+	const size_t size = 32;
+	void *buf;
+
+	setup_test_cache(test, size, 0, NULL);
+	KUNIT_EXPECT_TRUE(test, test_cache);
+	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	kmem_cache_shrink(test_cache);
+	test_free(buf);
+
+	KUNIT_EXPECT_FALSE(test, report_available());
+}
+
+static void ctor_set_x(void *obj)
+{
+	/* Every object has at least 8 bytes. */
+	memset(obj, 'x', 8);
+}
+
+/* Ensure that SL*B does not modify KFENCE objects on bulk free. */
+static void test_free_bulk(struct kunit *test)
+{
+	int iter;
+
+	for (iter = 0; iter < 5; iter++) {
+		const size_t size = setup_test_cache(test, 8 + prandom_u32_max(300), 0,
+						     (iter & 1) ? ctor_set_x : NULL);
+		void *objects[] = {
+			test_alloc(test, size, GFP_KERNEL, ALLOCATE_RIGHT),
+			test_alloc(test, size, GFP_KERNEL, ALLOCATE_NONE),
+			test_alloc(test, size, GFP_KERNEL, ALLOCATE_LEFT),
+			test_alloc(test, size, GFP_KERNEL, ALLOCATE_NONE),
+			test_alloc(test, size, GFP_KERNEL, ALLOCATE_NONE),
+		};
+
+		kmem_cache_free_bulk(test_cache, ARRAY_SIZE(objects), objects);
+		KUNIT_ASSERT_FALSE(test, report_available());
+		test_cache_destroy();
+	}
+}
+
+/* Test init-on-free works. */
+static void test_init_on_free(struct kunit *test)
+{
+	const size_t size = 32;
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_UAF,
+		.fn = test_init_on_free,
+	};
+	int i;
+
+	if (!IS_ENABLED(CONFIG_INIT_ON_FREE_DEFAULT_ON))
+		return;
+	/* Assume it hasn't been disabled on command line. */
+
+	setup_test_cache(test, size, 0, NULL);
+	expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	for (i = 0; i < size; i++)
+		expect.addr[i] = i + 1;
+	test_free(expect.addr);
+
+	for (i = 0; i < size; i++) {
+		/*
+		 * This may fail if the page was recycled by KFENCE and then
+		 * written to again -- this however, is near impossible with a
+		 * default config.
+		 */
+		KUNIT_EXPECT_EQ(test, expect.addr[i], (char)0);
+
+		if (!i) /* Only check first access to not fail test if page is ever re-protected. */
+			KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+	}
+}
+
+/* Ensure that constructors work properly. */
+static void test_memcache_ctor(struct kunit *test)
+{
+	const size_t size = 32;
+	char *buf;
+	int i;
+
+	setup_test_cache(test, size, 0, ctor_set_x);
+	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+
+	for (i = 0; i < 8; i++)
+		KUNIT_EXPECT_EQ(test, buf[i], (char)'x');
+
+	test_free(buf);
+
+	KUNIT_EXPECT_FALSE(test, report_available());
+}
+
+/* Test that memory is zeroed if requested. */
+static void test_gfpzero(struct kunit *test)
+{
+	const size_t size = PAGE_SIZE; /* PAGE_SIZE so we can use ALLOCATE_ANY. */
+	char *buf1, *buf2;
+	int i;
+
+	if (CONFIG_KFENCE_SAMPLE_INTERVAL > 100) {
+		kunit_warn(test, "skipping ... would take too long\n");
+		return;
+	}
+
+	setup_test_cache(test, size, 0, NULL);
+	buf1 = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	for (i = 0; i < size; i++)
+		buf1[i] = i + 1;
+	test_free(buf1);
+
+	/* Try to get same address again -- this can take a while. */
+	for (i = 0;; i++) {
+		buf2 = test_alloc(test, size, GFP_KERNEL | __GFP_ZERO, ALLOCATE_ANY);
+		if (buf1 == buf2)
+			break;
+		test_free(buf2);
+
+		if (i == CONFIG_KFENCE_NUM_OBJECTS) {
+			kunit_warn(test, "giving up ... cannot get same object back\n");
+			return;
+		}
+	}
+
+	for (i = 0; i < size; i++)
+		KUNIT_EXPECT_EQ(test, buf2[i], (char)0);
+
+	test_free(buf2);
+
+	KUNIT_EXPECT_FALSE(test, report_available());
+}
+
+static void test_invalid_access(struct kunit *test)
+{
+	const struct expect_report expect = {
+		.type = KFENCE_ERROR_INVALID,
+		.fn = test_invalid_access,
+		.addr = &__kfence_pool[10],
+	};
+
+	READ_ONCE(__kfence_pool[10]);
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+}
+
+/* Test SLAB_TYPESAFE_BY_RCU works. */
+static void test_memcache_typesafe_by_rcu(struct kunit *test)
+{
+	const size_t size = 32;
+	struct expect_report expect = {
+		.type = KFENCE_ERROR_UAF,
+		.fn = test_memcache_typesafe_by_rcu,
+	};
+
+	setup_test_cache(test, size, SLAB_TYPESAFE_BY_RCU, NULL);
+	KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
+
+	expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
+	*expect.addr = 42;
+
+	rcu_read_lock();
+	test_free(expect.addr);
+	KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
+	rcu_read_unlock();
+
+	/* No reports yet, memory should not have been freed on access. */
+	KUNIT_EXPECT_FALSE(test, report_available());
+	rcu_barrier(); /* Wait for free to happen. */
+
+	/* Expect use-after-free. */
+	KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
+	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
+}
+
+/* Test krealloc(). */
+static void test_krealloc(struct kunit *test)
+{
+	const size_t size = 32;
+	const struct expect_report expect = {
+		.type = KFENCE_ERROR_UAF,
+		.fn = test_krealloc,
+		.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY),
+	};
+	char *buf = expect.addr;
+	int i;
+
+	KUNIT_EXPECT_FALSE(test, test_cache);
+	KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match after KFENCE alloc. */
+	for (i = 0; i < size; i++)
+		buf[i] = i + 1;
+
+	/* Check that we successfully change the size. */
+	buf = krealloc(buf, size * 3, GFP_KERNEL); /* Grow. */
+	/* Note: Might no longer be a KFENCE alloc. */
+	KUNIT_EXPECT_GE(test, ksize(buf), size * 3);
+	for (i = 0; i < size; i++)
+		KUNIT_EXPECT_EQ(test, buf[i], (char)(i + 1));
+	for (; i < size * 3; i++) /* Fill to extra bytes. */
+		buf[i] = i + 1;
+
+	buf = krealloc(buf, size * 2, GFP_KERNEL * 2); /* Shrink. */
+	KUNIT_EXPECT_GE(test, ksize(buf), size * 2);
+	for (i = 0; i < size * 2; i++)
+		KUNIT_EXPECT_EQ(test, buf[i], (char)(i + 1));
+
+	buf = krealloc(buf, 0, GFP_KERNEL); /* Free. */
+	KUNIT_EXPECT_EQ(test, (unsigned long)buf, (unsigned long)ZERO_SIZE_PTR);
+	KUNIT_ASSERT_FALSE(test, report_available()); /* No reports yet! */
+
+	READ_ONCE(*expect.addr); /* Ensure krealloc() actually freed earlier KFENCE object. */
+	KUNIT_ASSERT_TRUE(test, report_matches(&expect));
+}
+
+/* Test that some objects from a bulk allocation belong to KFENCE pool. */
+static void test_memcache_alloc_bulk(struct kunit *test)
+{
+	const size_t size = 32;
+	bool pass = false;
+	unsigned long timeout;
+
+	setup_test_cache(test, size, 0, NULL);
+	KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
+	/*
+	 * 100x the sample interval should be more than enough to ensure we get
+	 * a KFENCE allocation eventually.
+	 */
+	timeout = jiffies + msecs_to_jiffies(100 * CONFIG_KFENCE_SAMPLE_INTERVAL);
+	do {
+		void *objects[100];
+		int i, num = kmem_cache_alloc_bulk(test_cache, GFP_ATOMIC, ARRAY_SIZE(objects),
+						   objects);
+		if (!num)
+			continue;
+		for (i = 0; i < ARRAY_SIZE(objects); i++) {
+			if (is_kfence_address(objects[i])) {
+				pass = true;
+				break;
+			}
+		}
+		kmem_cache_free_bulk(test_cache, num, objects);
+		/*
+		 * kmem_cache_alloc_bulk() disables interrupts, and calling it
+		 * in a tight loop may not give KFENCE a chance to switch the
+		 * static branch. Call cond_resched() to let KFENCE chime in.
+		 */
+		cond_resched();
+	} while (!pass && time_before(jiffies, timeout));
+
+	KUNIT_EXPECT_TRUE(test, pass);
+	KUNIT_EXPECT_FALSE(test, report_available());
+}
+
+/*
+ * KUnit does not provide a way to provide arguments to tests, and we encode
+ * additional info in the name. Set up 2 tests per test case, one using the
+ * default allocator, and another using a custom memcache (suffix '-memcache').
+ */
+#define KFENCE_KUNIT_CASE(test_name)						\
+	{ .run_case = test_name, .name = #test_name },				\
+	{ .run_case = test_name, .name = #test_name "-memcache" }
+
+static struct kunit_case kfence_test_cases[] = {
+	KFENCE_KUNIT_CASE(test_out_of_bounds_read),
+	KFENCE_KUNIT_CASE(test_use_after_free_read),
+	KFENCE_KUNIT_CASE(test_double_free),
+	KFENCE_KUNIT_CASE(test_invalid_addr_free),
+	KFENCE_KUNIT_CASE(test_free_bulk),
+	KFENCE_KUNIT_CASE(test_init_on_free),
+	KUNIT_CASE(test_kmalloc_aligned_oob_read),
+	KUNIT_CASE(test_kmalloc_aligned_oob_write),
+	KUNIT_CASE(test_shrink_memcache),
+	KUNIT_CASE(test_memcache_ctor),
+	KUNIT_CASE(test_invalid_access),
+	KUNIT_CASE(test_gfpzero),
+	KUNIT_CASE(test_memcache_typesafe_by_rcu),
+	KUNIT_CASE(test_krealloc),
+	KUNIT_CASE(test_memcache_alloc_bulk),
+	{},
+};
+
+/* ===== End test cases ===== */
+
+static int test_init(struct kunit *test)
+{
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&observed.lock, flags);
+	for (i = 0; i < ARRAY_SIZE(observed.lines); i++)
+		observed.lines[i][0] = '\0';
+	observed.nlines = 0;
+	spin_unlock_irqrestore(&observed.lock, flags);
+
+	/* Any test with 'memcache' in its name will want a memcache. */
+	if (strstr(test->name, "memcache"))
+		test->priv = TEST_PRIV_WANT_MEMCACHE;
+	else
+		test->priv = NULL;
+
+	return 0;
+}
+
+static void test_exit(struct kunit *test)
+{
+	test_cache_destroy();
+}
+
+static struct kunit_suite kfence_test_suite = {
+	.name = "kfence-test",
+	.test_cases = kfence_test_cases,
+	.init = test_init,
+	.exit = test_exit,
+};
+static struct kunit_suite *kfence_test_suites[] = { &kfence_test_suite, NULL };
+
+static void register_tracepoints(struct tracepoint *tp, void *ignore)
+{
+	check_trace_callback_type_console(probe_console);
+	if (!strcmp(tp->name, "console"))
+		WARN_ON(tracepoint_probe_register(tp, probe_console, NULL));
+}
+
+static void unregister_tracepoints(struct tracepoint *tp, void *ignore)
+{
+	if (!strcmp(tp->name, "console"))
+		tracepoint_probe_unregister(tp, probe_console, NULL);
+}
+
+/*
+ * We only want to do tracepoints setup and teardown once, therefore we have to
+ * customize the init and exit functions and cannot rely on kunit_test_suite().
+ */
+static int __init kfence_test_init(void)
+{
+	/*
+	 * Because we want to be able to build the test as a module, we need to
+	 * iterate through all known tracepoints, since the static registration
+	 * won't work here.
+	 */
+	for_each_kernel_tracepoint(register_tracepoints, NULL);
+	return __kunit_test_suites_init(kfence_test_suites);
+}
+
+static void kfence_test_exit(void)
+{
+	__kunit_test_suites_exit(kfence_test_suites);
+	for_each_kernel_tracepoint(unregister_tracepoints, NULL);
+	tracepoint_synchronize_unregister();
+}
+
+late_initcall(kfence_test_init);
+module_exit(kfence_test_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>");
-- 
2.28.0.526.ge36021eeef-goog

