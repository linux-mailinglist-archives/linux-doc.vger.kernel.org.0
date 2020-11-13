Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40272B22D7
	for <lists+linux-doc@lfdr.de>; Fri, 13 Nov 2020 18:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgKMRq1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Nov 2020 12:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgKMRqZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 12:46:25 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AABDC061A47
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 09:46:25 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id g15so9191363ilc.9
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 09:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pnjFwhD1ZUEdVs3t7oQ4JdNuzVoo2IlWZ/Yay6rugOk=;
        b=G0uBdFBmBSIt7Q4hkjnaB5+BhNoal5NLTqZCqurZ9nUNh43fMDSwVkUwS949aiiQBx
         irj7XETNdmeKGX/Pnw36yImo20VLd5WQhB4/YKuw9jx+w3AfTrX6j3wMDtONDFEfQuwT
         Wo5u3tepJwWenhlEYHAbFMwb4Y1Qfop2fEZBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pnjFwhD1ZUEdVs3t7oQ4JdNuzVoo2IlWZ/Yay6rugOk=;
        b=O3D8PTs25zOqscoXWXU4a2AKWqnA9wezPxBF54RBhct20HmcnjcCc/I7IApJL1MgXQ
         bk6gTgiH/IFBsTBYcyLn84D69F/4IiZnBM1ei89QEL7aYAdwaePpgspVHPS94rPkzFtH
         utQF5aFIFsmlcLpNeGGD3qbGPfBFkbWS3YTxwpmXjK90xaDq1VFwPk36EairHtWML1iU
         LTnu9DypEEv71Y/bjamiivrOROrm2cLdagbaRC8kY1Q1SwdmuhKezNny5fA4R2XwmRSJ
         0WMcESGV0ddFUtgQIwy5qjD/nVYGiM9XiyWRWAOcJik1Co37GX3i9YEXoYB98kaUaqTI
         X1SQ==
X-Gm-Message-State: AOAM5308mQRDWIfPc6qH1i0XlnRxW3Qa0Dot6NC417sVs8tPO474r0Qp
        0SjmatweSksdSf+Bw8ujvAvN3Q==
X-Google-Smtp-Source: ABdhPJwXN+y7zDnaYOAZj817JZViSxsmQ4O8ZeBbFxAQObysUqaoH2WK0736/UiVJk/6mf9ZN15YoQ==
X-Received: by 2002:a92:9f17:: with SMTP id u23mr700838ili.280.1605289582505;
        Fri, 13 Nov 2020 09:46:22 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y14sm4772585ilb.66.2020.11.13.09.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:46:22 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        peterz@infradead.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] seqnum_ops: Introduce Sequence Number Ops
Date:   Fri, 13 Nov 2020 10:46:03 -0700
Message-Id: <26cbcc431be5e3ab7d8e0e881d522605a27b1312.1605287778.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1605287778.git.skhan@linuxfoundation.org>
References: <cover.1605287778.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sequence Number api provides interfaces for unsigned atomic up counters
leveraging atomic_t and atomic64_t ops underneath.

There are a number of atomic_t usages in the kernel where atomic_t api
is used for counting sequence numbers and other statistical counters.
Several of these usages, convert atomic_read() and atomic_inc_return()
return values to unsigned. Introducing sequence number ops supports
these use-cases with a standard core-api.

The atomic_t api provides a wide range of atomic operations as a base
api to implement atomic counters, bitops, spinlock interfaces. The usages
also evolved into being used for resource lifetimes and state management.
The refcount_t api was introduced to address resource lifetime problems
related to atomic_t wrapping. There is a large overlap between the
atomic_t api used for resource lifetimes and just counters, stats, and
sequence numbers. It has become difficult to differentiate between the
atomic_t usages that should be converted to refcount_t and the ones that
can be left alone. Introducing seqnum_ops to wrap the usages that are
stats, counters, sequence numbers makes it easier for tools that scan
for underflow and overflow on atomic_t usages to detect overflow and
underflows to scan just the cases that are prone to errors.

In addition, to supporting sequence number use-cases, Sequence Number Ops
helps differentiate atomic_t counter usages from atomic_t usages that guard
object lifetimes, hence prone to overflow and underflow errors from up
counting use-cases.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/core-api/atomic_ops.rst |   4 +
 Documentation/core-api/index.rst      |   1 +
 Documentation/core-api/seqnum_ops.rst |  80 +++++++++++++++++
 MAINTAINERS                           |   7 ++
 include/linux/seqnum_ops.h            | 116 +++++++++++++++++++++++++
 lib/Kconfig                           |   9 ++
 lib/Makefile                          |   1 +
 lib/test_seqnum_ops.c                 | 119 ++++++++++++++++++++++++++
 8 files changed, 337 insertions(+)
 create mode 100644 Documentation/core-api/seqnum_ops.rst
 create mode 100644 include/linux/seqnum_ops.h
 create mode 100644 lib/test_seqnum_ops.c

diff --git a/Documentation/core-api/atomic_ops.rst b/Documentation/core-api/atomic_ops.rst
index 724583453e1f..762cbc0947e7 100644
--- a/Documentation/core-api/atomic_ops.rst
+++ b/Documentation/core-api/atomic_ops.rst
@@ -1,3 +1,7 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _atomic_ops:
+
 =======================================================
 Semantics and Behavior of Atomic and Bitmask Operations
 =======================================================
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 69171b1799f2..be958afe757c 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -55,6 +55,7 @@ How Linux keeps everything from happening at the same time.  See
 
    atomic_ops
    refcount-vs-atomic
+   seqnum_ops
    irq/index
    local_ops
    padata
diff --git a/Documentation/core-api/seqnum_ops.rst b/Documentation/core-api/seqnum_ops.rst
new file mode 100644
index 000000000000..10b775a9ac05
--- /dev/null
+++ b/Documentation/core-api/seqnum_ops.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+.. _seqnum_ops:
+
+==========================
+Sequence Number Operations
+==========================
+
+:Author: Shuah Khan
+:Copyright: |copy| 2020, The Linux Foundation
+:Copyright: |copy| 2020, Shuah Khan <skhan@linuxfoundation.org>
+
+Sequence Number api provides interfaces for unsigned up counters
+leveraging atomic_t and atomic64_t ops underneath.
+
+There are a number of atomic_t usages in the kernel where atomic_t api
+is used for counting sequence numbers and other statistical counters.
+Several of these usages, convert atomic_read() and atomic_inc_return()
+return values to unsigned. Introducing sequence number ops supports
+these use-cases with a standard core-api.
+
+The atomic_t api provides a wide range of atomic operations as a base
+api to implement atomic counters, bitops, spinlock interfaces. The usages
+also evolved into being used for resource lifetimes and state management.
+The refcount_t api was introduced to address resource lifetime problems
+related to atomic_t wrapping. There is a large overlap between the
+atomic_t api used for resource lifetimes and just counters, stats, and
+sequence numbers. It has become difficult to differentiate between the
+atomic_t usages that should be converted to refcount_t and the ones that
+can be left alone. Introducing seqnum_ops to wrap the usages that are
+stats, counters, sequence numbers makes it easier for tools that scan
+for underflow and overflow on atomic_t usages to detect overflow and
+underflows to scan just the cases that are prone to errors.
+
+In addition, to supporting sequence number use-cases, Sequence Number Ops
+helps differentiate atomic_t counter usages from atomic_t usages that guard
+object lifetimes, hence prone to overflow and underflow errors from up
+counting use-cases.
+
+Sequence Number Ops
+===================
+
+seqnum32 and seqnum64 types use atomic_t and atomic64_t underneath to
+leverage atomic_t api, to provide increment by 1 and return new value
+and fetch current value interfaces necessary to support unsigned up
+counters. ::
+
+        struct seqnum32 { atomic_t seqnum; };
+        struct seqnum64 { atomic64_t seqnum; };
+
+Please see :ref:`Documentation/core-api/atomic_ops.rst <atomic_ops>` for
+information on the Semantics and Behavior of Atomic operations.
+
+Initializers
+------------
+
+Interfaces for initializing sequence numbers are write operations which
+in turn invoke their ``ATOMIC_INIT() and atomic_set()`` counterparts ::
+
+        #define SEQNUM_INIT(i)    { .seqnum = ATOMIC_INIT(i) }
+        seqnum32_init() --> atomic_set() to 0
+        seqnum64_init() --> atomic64_set() to 0
+
+Increment interface
+-------------------
+
+Increments sequence number and returns the new value. ::
+
+        seqnum32_inc_return() --> (u32) atomic_inc_return(seqnum)
+        seqnum64_inc_return() --> (u64) atomic64_inc_return(seqnum)
+
+Fetch interface
+---------------
+
+Fetched and returns current sequence number value. ::
+
+        seqnum32_fetch() --> (u32) atomic_add_return(0, seqnum)
+        seqnum64_fetch() --> (u64) atomic64_add_return(0, seqnum)
diff --git a/MAINTAINERS b/MAINTAINERS
index b516bb34a8d5..c83a6f05610b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15977,6 +15977,13 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SEQNUM OPS
+M:	Shuah Khan <skhan@linuxfoundation.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	include/linux/seqnum_ops.h
+F:	lib/test_seqnum_ops.c
+
 SIMPLE FIRMWARE INTERFACE (SFI)
 S:	Obsolete
 W:	http://simplefirmware.org/
diff --git a/include/linux/seqnum_ops.h b/include/linux/seqnum_ops.h
new file mode 100644
index 000000000000..17d327b78050
--- /dev/null
+++ b/include/linux/seqnum_ops.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * seqnum_ops.h - Interfaces for sequential and statistical counters.
+ *
+ * Copyright (c) 2020 Shuah Khan <skhan@linuxfoundation.org>
+ * Copyright (c) 2020 The Linux Foundation
+ *
+ * Sequence Number functions provide support for unsgined atomic up
+ * counters.
+ *
+ * The interface provides:
+ * seqnumu32 & seqnumu64 functions:
+ *	initialization
+ *	increment and return
+ *	fetch and return
+ *
+ * seqnumu32 and seqnumu64 functions leverage/use atomic*_t ops to
+ * implement support for unsigned atomic up counters.
+ *
+ * Reference and API guide:
+ *	Documentation/core-api/seqnum_ops.rst for more information.
+ */
+
+#ifndef __LINUX_SEQNUM_OPS_H
+#define __LINUX_SEQNUM_OPS_H
+
+#include <linux/atomic.h>
+
+/**
+ * struct seqnum32 - Sequential/Statistical atomic counter
+ * @seqnum: atomic_t
+ *
+ **/
+struct seqnum32 {
+	atomic_t seqnum;
+};
+
+#define SEQNUM_INIT(i)		{ .seqnum = ATOMIC_INIT(i) }
+
+/*
+ * seqnum32_init() - initialize seqnum value
+ * @seq: struct seqnum32 pointer
+ *
+ */
+static inline void seqnum32_init(struct seqnum32 *seq)
+{
+	atomic_set(&seq->seqnum, 0);
+}
+
+/*
+ * seqnum32_inc_return() - increment seqnum value and return the new value
+ * @seq: struct seqnum32 pointer
+ *
+ * Return u32
+ */
+static inline u32 seqnum32_inc_return(struct seqnum32 *seq)
+{
+	return (u32) atomic_inc_return(&seq->seqnum);
+}
+
+/*
+ * seqnum32_fetch() - return the current value
+ * @seq: struct seqnum32 pointer
+ *
+ * Return u32
+ */
+static inline u32 seqnum32_fetch(struct seqnum32 *seq)
+{
+	return (u32) atomic_add_return(0, &seq->seqnum);
+}
+
+#ifdef CONFIG_64BIT
+/* atomic64_t is defined in CONFIG_64BIT in include/linux/types.h */
+/*
+ * struct seqnum64 - Sequential/Statistical atomic counter
+ * @seq: atomic64_t
+ *
+ */
+struct seqnum64 {
+	atomic64_t seqnum;
+};
+
+/*
+ * seqnum64_init() - initialize seqnum value
+ * @seq: struct seqnum64 pointer
+ *
+ */
+static inline void seqnum64_init(struct seqnum64 *seq)
+{
+	atomic64_set(&seq->seqnum, 0);
+}
+
+/*
+ * seqnum64_inc() - increment seqnum value and return the new value
+ * @seq: struct seqnum64 pointer
+ *
+ * Return u64
+ */
+static inline u64 seqnum64_inc_return(struct seqnum64 *seq)
+{
+	return (u64) atomic64_inc_return(&seq->seqnum);
+}
+
+/*
+ * seqnum64_fetch() - return the current value
+ * @seq: struct seqnum64 pointer
+ *
+ * Return u64
+ */
+static inline u64 seqnum64_fetch(struct seqnum64 *seq)
+{
+	return (u64) atomic64_add_return(0, &seq->seqnum);
+}
+#endif /* CONFIG_64BIT */
+
+#endif /* __LINUX_SEQNUM_OPS_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index b46a9fd122c8..c362c2713e11 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -663,6 +663,15 @@ config OBJAGG
 config STRING_SELFTEST
 	tristate "Test string functions"
 
+config TEST_SEQNUM_OPS
+	tristate "Test Sequence Number Ops API"
+	help
+	   A test module for Sequence Number Ops API. A corresponding
+	   selftest can be used to test the Seqnum Ops API. Select this
+	   for testing Sequence Number Ops API.
+
+	   See Documentation/core-api/seqnum_ops.rst
+
 endmenu
 
 config GENERIC_IOREMAP
diff --git a/lib/Makefile b/lib/Makefile
index ce45af50983a..7d17c25e4d73 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
 obj-$(CONFIG_TEST_LOCKUP) += test_lockup.o
 obj-$(CONFIG_TEST_HMM) += test_hmm.o
 obj-$(CONFIG_TEST_FREE_PAGES) += test_free_pages.o
+obj-$(CONFIG_TEST_SEQNUM_OPS) += test_seqnum_ops.o
 
 #
 # CFLAGS for compiling floating point code inside the kernel. x86/Makefile turns
diff --git a/lib/test_seqnum_ops.c b/lib/test_seqnum_ops.c
new file mode 100644
index 000000000000..6e58b6a0a2be
--- /dev/null
+++ b/lib/test_seqnum_ops.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * test_seqnum_ops.c - Kernel module for testing Seqnum API
+ *
+ * Copyright (c) 2020 Shuah Khan <skhan@linuxfoundation.org>
+ * Copyright (c) 2020 The Linux Foundation
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/seqnum_ops.h>
+
+static inline void
+test_seqnum32_result(char *msg, u32 start, u32 end, u32 expected)
+{
+	pr_info("%s: %u to %u - %s\n",
+		msg, start, end,
+		((expected == end) ? "PASS" : "FAIL"));
+}
+
+
+static void test_seqnum32(void)
+{
+	static struct seqnum32 seq = SEQNUM_INIT(0);
+	u32 start_val = seqnum32_fetch(&seq);
+	u32 end_val;
+
+	end_val = seqnum32_inc_return(&seq);
+	test_seqnum32_result("Test fetch and increment",
+			     start_val, end_val, start_val+1);
+
+	start_val = seqnum32_fetch(&seq);
+	seqnum32_init(&seq);
+	end_val = seqnum32_fetch(&seq);
+	test_seqnum32_result("Test init", start_val, end_val, 0);
+
+}
+
+static void test_seqnum32_overflow(void)
+{
+	static struct seqnum32 seq = SEQNUM_INIT(UINT_MAX-1);
+	u32 start_val = seqnum32_fetch(&seq);
+	u32 end_val = seqnum32_inc_return(&seq);
+
+	test_seqnum32_result("Test UINT_MAX limit compare with (val+1)",
+			     start_val, end_val, start_val+1);
+
+	test_seqnum32_result("Test UINT_MAX limit compare with (UINT_MAX)",
+			     start_val, end_val, UINT_MAX);
+}
+
+#ifdef CONFIG_64BIT
+static inline void
+test_seqnum64_result(char *msg, u64 start, u64 end, u64 expected)
+{
+	pr_info("%s: %llu to %llu - %s\n",
+		msg, start, end,
+		((expected == end) ? "PASS" : "FAIL"));
+}
+
+static void test_seqnum64(void)
+{
+	static struct seqnum64 seq = SEQNUM_INIT(0);
+	u64 start_val = seqnum64_fetch(&seq);
+	u64 end_val;
+
+	end_val = seqnum64_inc_return(&seq);
+	test_seqnum64_result("Test fetch and increment",
+			     start_val, end_val, start_val+1);
+
+	start_val = seqnum64_fetch(&seq);
+	seqnum64_init(&seq);
+	end_val = seqnum64_fetch(&seq);
+	test_seqnum64_result("Test init", start_val, end_val, 0);
+}
+
+static void test_seqnum64_overflow(void)
+{
+	static struct seqnum64 seq = SEQNUM_INIT(UINT_MAX-1);
+	u64 start_val = seqnum64_fetch(&seq);
+	u64 end_val = seqnum64_inc_return(&seq);
+
+	test_seqnum64_result("Test UINT_MAX limit compare with (val+1)",
+			     start_val, end_val, start_val+1);
+	test_seqnum64_result("Test UINT_MAX limit compare with (UINT_MAX)",
+			     start_val, end_val, UINT_MAX);
+}
+#endif /* CONFIG_64BIT */
+
+static int __init test_seqnum_ops_init(void)
+{
+	pr_info("Start seqnum32_*() interfaces test\n");
+	test_seqnum32();
+	test_seqnum32_overflow();
+	pr_info("End seqnum32_*() interfaces test\n\n");
+
+#ifdef CONFIG_64BIT
+	pr_info("Start seqnum64_*() interfaces test\n");
+	test_seqnum64();
+	test_seqnum64_overflow();
+	pr_info("End seqnum64_*() interfaces test\n\n");
+#endif /* CONFIG_64BIT */
+
+	return 0;
+}
+
+module_init(test_seqnum_ops_init);
+
+static void __exit test_seqnum_ops_exit(void)
+{
+	pr_info("exiting.\n");
+}
+
+module_exit(test_seqnum_ops_exit);
+
+MODULE_AUTHOR("Shuah Khan <skhan@linuxfoundation.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

