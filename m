Return-Path: <linux-doc+bounces-20227-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1092A6A6
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 18:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFF30289900
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 16:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A83714A4EA;
	Mon,  8 Jul 2024 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W+Xmd1K5"
X-Original-To: linux-doc@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E4214900C;
	Mon,  8 Jul 2024 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454416; cv=none; b=ECQsXOvGCo42xb8oUgYB2j0hZG84K0un5arglcj6UOmqcYhqLNj/tWWhD6I6sVwkZkFlZQdZOgu3gozn7Bqk6uaBHhVSMNrW25yuTQQp4fTyWM0iQooQcx+UKkNc5bBrpq3cgm9hdnmnwdbUtinBwP79O1ViJKwmzDEpfG965H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454416; c=relaxed/simple;
	bh=HNU3PmUfGcW7rrEa0g4bQiHo8Xh4NijRGkNUKrxeJ2A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmVsxoZ408qncxV5wnW7uCBD5I1UPDICqRlR6ZKzcs2UDm3ZnlqhC3IjsCFQaDqHDzTMEdAyS5OaAZMBhgA324UlsIRo0vShwl4QzvT3Ii7AHG5cnFjZE2C+0xKhUyfF/tfAr1qp4g2Q1oK0kHZIfBwg9Uc4tj3rpPDcdnjdvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=W+Xmd1K5; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468Fxoxb011475;
	Mon, 8 Jul 2024 10:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720454390;
	bh=9z6raoMi9TRcDZUquHwCTpL5S+K4XgWVmvrcH6YzVaQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=W+Xmd1K5vqQKuOjmr5gQlkos3Q2QglmuMVoVkyCKM2k6A8ge9NpBhmwCrN3je6F3F
	 298kq2no1IKXvpbWZ9IDIVMTeVG/GJMA4es1/PaKXo9tslADXpdG0DSIXijx5qkx7c
	 GBNzukSyOlFkRyZAv7HR9C7bqM6+JUNdUfCM8Fuc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468Fxot4040637
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 10:59:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 10:59:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 10:59:50 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468FxnXS033385;
	Mon, 8 Jul 2024 10:59:50 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <andriy.shevchenko@linux.intel.com>,
        <jani.nikula@intel.com>, <jirislaby@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH 4/6] lib: Add basic KUnit test for lib/math
Date: Mon, 8 Jul 2024 21:29:41 +0530
Message-ID: <20240708155943.2314427-5-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240708155943.2314427-1-devarsht@ti.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Daniel Latypov <dlatypov@google.com>

Add basic test coverage for files that don't require any config options:
* part of math.h (what seem to be the most commonly used macros)
* gcd.c
* lcm.c
* int_sqrt.c
* reciprocal_div.c
(Ignored int_pow.c since it's a simple textbook algorithm.)

These tests aren't particularly interesting, but they
* provide short and simple examples of parameterized tests
* provide a place to add tests for any new files in this dir
* are written so adding new test cases to cover edge cases should be
  easy
  * looking at code coverage, we hit all the branches in the .c files

Signed-off-by: Daniel Latypov <dlatypov@google.com>
Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
[devarsht: Rebase to 6.9, remove kernel.h, update Kconfig and change license to GPL]
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 lib/math/Kconfig      |  14 ++
 lib/math/Makefile     |   1 +
 lib/math/math_kunit.c | 294 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 lib/math/math_kunit.c

diff --git a/lib/math/Kconfig b/lib/math/Kconfig
index 0634b428d0cb..f738d8a433ea 100644
--- a/lib/math/Kconfig
+++ b/lib/math/Kconfig
@@ -15,3 +15,17 @@ config PRIME_NUMBERS
 
 config RATIONAL
 	tristate
+
+config MATH_KUNIT_TEST
+	tristate "KUnit test for math helper functions"
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+
+	help
+	  This builds unit test for math helper functions as defined in lib/math
+	  and math.h.
+
+	  For more information on KUNIT and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 91fcdb0c9efe..dcf65d10dab2 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_RATIONAL)		+= rational.o
 
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
+obj-$(CONFIG_MATH_KUNIT_TEST) += math_kunit.o
diff --git a/lib/math/math_kunit.c b/lib/math/math_kunit.c
new file mode 100644
index 000000000000..be27f2afb8e4
--- /dev/null
+++ b/lib/math/math_kunit.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple KUnit suite for math helper funcs that are always enabled.
+ *
+ * Copyright (C) 2020, Google LLC.
+ * Author: Daniel Latypov <dlatypov@google.com>
+ */
+
+#include <kunit/test.h>
+#include <linux/gcd.h>
+#include <linux/lcm.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/reciprocal_div.h>
+#include <linux/types.h>
+
+static void abs_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, abs((char)0), (char)0);
+	KUNIT_EXPECT_EQ(test, abs((char)42), (char)42);
+	KUNIT_EXPECT_EQ(test, abs((char)-42), (char)42);
+
+	/* The expression in the macro is actually promoted to an int. */
+	KUNIT_EXPECT_EQ(test, abs((short)0),  0);
+	KUNIT_EXPECT_EQ(test, abs((short)42),  42);
+	KUNIT_EXPECT_EQ(test, abs((short)-42),  42);
+
+	KUNIT_EXPECT_EQ(test, abs(0),  0);
+	KUNIT_EXPECT_EQ(test, abs(42),  42);
+	KUNIT_EXPECT_EQ(test, abs(-42),  42);
+
+	KUNIT_EXPECT_EQ(test, abs(0L), 0L);
+	KUNIT_EXPECT_EQ(test, abs(42L), 42L);
+	KUNIT_EXPECT_EQ(test, abs(-42L), 42L);
+
+	KUNIT_EXPECT_EQ(test, abs(0LL), 0LL);
+	KUNIT_EXPECT_EQ(test, abs(42LL), 42LL);
+	KUNIT_EXPECT_EQ(test, abs(-42LL), 42LL);
+
+	/* Unsigned types get casted to signed. */
+	KUNIT_EXPECT_EQ(test, abs(0ULL), 0LL);
+	KUNIT_EXPECT_EQ(test, abs(42ULL), 42LL);
+}
+
+static void int_sqrt_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, int_sqrt(0UL), 0UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(1UL), 1UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(4UL), 2UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(5UL), 2UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(8UL), 2UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(1UL << 30), 1UL << 15);
+}
+
+static void round_up_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_up(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, round_up(1, 2), 2);
+	KUNIT_EXPECT_EQ(test, round_up(3, 2), 4);
+	KUNIT_EXPECT_EQ(test, round_up((1 << 30) - 1, 2), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_up((1 << 30) - 1, 1 << 29), 1 << 30);
+}
+
+static void round_down_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_down(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, round_down(1, 2), 0);
+	KUNIT_EXPECT_EQ(test, round_down(3, 2), 2);
+	KUNIT_EXPECT_EQ(test, round_down((1 << 30) - 1, 2), (1 << 30) - 2);
+	KUNIT_EXPECT_EQ(test, round_down((1 << 30) - 1, 1 << 29), 1 << 29);
+}
+
+/* These versions can round to numbers that aren't a power of two */
+static void roundup_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, roundup(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, roundup(1, 2), 2);
+	KUNIT_EXPECT_EQ(test, roundup(3, 2), 4);
+	KUNIT_EXPECT_EQ(test, roundup((1 << 30) - 1, 2), 1 << 30);
+	KUNIT_EXPECT_EQ(test, roundup((1 << 30) - 1, 1 << 29), 1 << 30);
+
+	KUNIT_EXPECT_EQ(test, roundup(3, 2), 4);
+	KUNIT_EXPECT_EQ(test, roundup(4, 3), 6);
+}
+
+static void rounddown_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, rounddown(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, rounddown(1, 2), 0);
+	KUNIT_EXPECT_EQ(test, rounddown(3, 2), 2);
+	KUNIT_EXPECT_EQ(test, rounddown((1 << 30) - 1, 2), (1 << 30) - 2);
+	KUNIT_EXPECT_EQ(test, rounddown((1 << 30) - 1, 1 << 29), 1 << 29);
+
+	KUNIT_EXPECT_EQ(test, rounddown(3, 2), 2);
+	KUNIT_EXPECT_EQ(test, rounddown(4, 3), 3);
+}
+
+static void div_round_up_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(20, 10), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(21, 10), 3);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(21, 20), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(21, 99), 1);
+}
+
+static void div_round_closest_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(20, 10), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(21, 10), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(25, 10), 3);
+}
+
+/* Generic test case for unsigned long inputs. */
+struct test_case {
+	unsigned long a, b;
+	unsigned long result;
+};
+
+static struct test_case gcd_cases[] = {
+	{
+		.a = 0, .b = 0,
+		.result = 0,
+	},
+	{
+		.a = 0, .b = 1,
+		.result = 1,
+	},
+	{
+		.a = 2, .b = 2,
+		.result = 2,
+	},
+	{
+		.a = 2, .b = 4,
+		.result = 2,
+	},
+	{
+		.a = 3, .b = 5,
+		.result = 1,
+	},
+	{
+		.a = 3 * 9, .b = 3 * 5,
+		.result = 3,
+	},
+	{
+		.a = 3 * 5 * 7, .b = 3 * 5 * 11,
+		.result = 15,
+	},
+	{
+		.a = 1 << 21,
+		.b = (1 << 21) - 1,
+		.result = 1,
+	},
+};
+
+KUNIT_ARRAY_PARAM(gcd, gcd_cases, NULL);
+
+static void gcd_test(struct kunit *test)
+{
+	const char *message_fmt = "gcd(%lu, %lu)";
+	const struct test_case *test_param = test->param_value;
+
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    gcd(test_param->a, test_param->b),
+			    message_fmt, test_param->a,
+			    test_param->b);
+
+	if (test_param->a == test_param->b)
+		return;
+
+	/* gcd(a,b) == gcd(b,a) */
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    gcd(test_param->b, test_param->a),
+			    message_fmt, test_param->b,
+			    test_param->a);
+}
+
+static struct test_case lcm_cases[] = {
+	{
+		.a = 0, .b = 0,
+		.result = 0,
+	},
+	{
+		.a = 0, .b = 1,
+		.result = 0,
+	},
+	{
+		.a = 1, .b = 2,
+		.result = 2,
+	},
+	{
+		.a = 2, .b = 2,
+		.result = 2,
+	},
+	{
+		.a = 3 * 5, .b = 3 * 7,
+		.result = 3 * 5 * 7,
+	},
+};
+
+KUNIT_ARRAY_PARAM(lcm, lcm_cases, NULL);
+
+static void lcm_test(struct kunit *test)
+{
+	const char *message_fmt = "lcm(%lu, %lu)";
+	const struct test_case *test_param = test->param_value;
+
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    lcm(test_param->a, test_param->b),
+			    message_fmt, test_param->a,
+			    test_param->b);
+
+	if (test_param->a == test_param->b)
+		return;
+
+	/* lcm(a,b) == lcm(b,a) */
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    lcm(test_param->b, test_param->a),
+			    message_fmt, test_param->b,
+			    test_param->a);
+}
+
+struct u32_test_case {
+	u32 a, b;
+	u32 result;
+};
+
+static struct u32_test_case reciprocal_div_cases[] = {
+	{
+		.a = 0, .b = 1,
+		.result = 0,
+	},
+	{
+		.a = 42, .b = 20,
+		.result = 2,
+	},
+	{
+		.a = 42, .b = 9999,
+		.result = 0,
+	},
+	{
+		.a = (1 << 16), .b = (1 << 14),
+		.result = 1 << 2,
+	},
+};
+
+KUNIT_ARRAY_PARAM(reciprocal_div, reciprocal_div_cases, NULL);
+
+static void reciprocal_div_test(struct kunit *test)
+{
+	const struct u32_test_case *test_param = test->param_value;
+	struct reciprocal_value rv = reciprocal_value(test_param->b);
+
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    reciprocal_divide(test_param->a, rv),
+			    "reciprocal_divide(%u, %u)",
+			    test_param->a, test_param->b);
+}
+
+static void reciprocal_scale_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(0u, 100), 0u);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(1u, 100), 0u);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(1u << 4, 1 << 28), 1u);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(1u << 16, 1 << 28), 1u << 12);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(~0u, 1 << 28), (1u << 28) - 1);
+}
+
+static struct kunit_case math_test_cases[] = {
+	KUNIT_CASE(abs_test),
+	KUNIT_CASE(int_sqrt_test),
+	KUNIT_CASE(round_up_test),
+	KUNIT_CASE(round_down_test),
+	KUNIT_CASE(roundup_test),
+	KUNIT_CASE(rounddown_test),
+	KUNIT_CASE(div_round_up_test),
+	KUNIT_CASE(div_round_closest_test),
+	KUNIT_CASE_PARAM(gcd_test, gcd_gen_params),
+	KUNIT_CASE_PARAM(lcm_test, lcm_gen_params),
+	KUNIT_CASE_PARAM(reciprocal_div_test, reciprocal_div_gen_params),
+	KUNIT_CASE(reciprocal_scale_test),
+	{}
+};
+
+static struct kunit_suite math_test_suite = {
+	.name = "lib-math",
+	.test_cases = math_test_cases,
+};
+
+kunit_test_suites(&math_test_suite);
+
+MODULE_DESCRIPTION("Math helper functions kunit test");
+MODULE_LICENSE("GPL");
-- 
2.39.1


