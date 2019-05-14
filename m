Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF1D1E4FF
	for <lists+linux-doc@lfdr.de>; Wed, 15 May 2019 00:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbfENWUa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 May 2019 18:20:30 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:42747 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfENWTN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 18:19:13 -0400
Received: by mail-qk1-f202.google.com with SMTP id f82so649372qkb.9
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bLsKx2EZGy7Z5lmF6P8U1p14LxEyvmeV2AI/h0+08ao=;
        b=nXpFW2eCo8X3CQb6h8VPPaz/nmyRZIiaCq3jooONYXc01LAdzHCG40XWqjgKfCFObO
         OEGVaBDvDJABKQVffkfT2y7fMrQ2buUGVY+aInZrCiehyv21nC+k5Hcydi4gm8nqbYB8
         Nw2dP8K+uH9inmhXE0KTpVdjpxIcOri3fBqRN4lneUFaD+4Fo+s1UEAvh84rFwXVx+Rz
         anLK3Us/r4rV/nc3wZjSMrluqgZ4nw/g1EQhMXNcDgNrmg7yUitw6vUluK5k4eio3IFB
         5xRcwISWlDNshdQu7GX6Mk0GgSA8AhHvgE2sBTQYZsaPmjhsCZn1eEkb4eJlnaVjNvN0
         Xv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bLsKx2EZGy7Z5lmF6P8U1p14LxEyvmeV2AI/h0+08ao=;
        b=I6stUiorwd9/xFNfzcnkQovCeVxfLZbPq/lOKO1nqApDKzedS+rwnvhV7kUKaFmHPI
         IUj9uJFQZTIQTJkPx7eGH8E1j6td3Gtolt3cQ7JlBqHNBWRj7rI6s2waZR4Ajmd9u2xH
         B74UqAIQui8qNQZ8/of2WPKJNtvpKD/ucHx7UbFb4m2RGa7ExR7Uw+hfgi0xFQq4XCBx
         pxN163+Tu0r8yzdhzQ0gGlge2QAtQng98ZNJC+PQWZPAkuKxORXGoXosS3WWSzcjbJYT
         roWReCyKC4UTETKfkowjmUsiGRM+duxW5MeG9CVJQklJq4Q3zwLJc8qfngD6hilIxBQd
         /bJg==
X-Gm-Message-State: APjAAAVTqiDQRdsU2i1zBHyTsJXNudBhhoYhLKrYUG54KbUfMDQgWanq
        54yMDaykJf/B2B+mTsbX6M5Q/SFkR4I3xR/QXGJjRQ==
X-Google-Smtp-Source: APXvYqw5i7ul/qbANJEnu8BT5yk/gqP4FmbRW498CdHb1S+6C/x6IOCPPRVWvdxTyCj8c3NmN3Zy5As4kCI66JTESeV1kw==
X-Received: by 2002:a0c:fe65:: with SMTP id b5mr30921774qvv.106.1557872352515;
 Tue, 14 May 2019 15:19:12 -0700 (PDT)
Date:   Tue, 14 May 2019 15:17:03 -0700
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
Message-Id: <20190514221711.248228-11-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v4 10/18] kunit: test: add tests for kunit test abort
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add KUnit tests for the KUnit test abort mechanism (see preceding
commit). Add tests both for general try catch mechanism as well as
non-architecture specific mechanism.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 kunit/Makefile    |   3 +-
 kunit/test-test.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 kunit/test-test.c

diff --git a/kunit/Makefile b/kunit/Makefile
index 1f7680cfa11ad..533355867abd2 100644
--- a/kunit/Makefile
+++ b/kunit/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_KUNIT) +=			test.o \
 					kunit-stream.o \
 					try-catch.o
 
-obj-$(CONFIG_KUNIT_TEST) +=		string-stream-test.o
+obj-$(CONFIG_KUNIT_TEST) +=		test-test.o \
+					string-stream-test.o
 
 obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=	example-test.o
diff --git a/kunit/test-test.c b/kunit/test-test.c
new file mode 100644
index 0000000000000..577df5a8d309e
--- /dev/null
+++ b/kunit/test-test.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for core test infrastructure.
+ *
+ * Copyright (C) 2019, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins@google.com>
+ */
+#include <kunit/test.h>
+
+struct kunit_try_catch_test_context {
+	struct kunit_try_catch *try_catch;
+	bool function_called;
+};
+
+void kunit_test_successful_try(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+
+	ctx->function_called = true;
+}
+
+void kunit_test_no_catch(void *data)
+{
+	struct kunit *test = data;
+
+	KUNIT_FAIL(test, "Catch should not be called.\n");
+}
+
+static void kunit_test_try_catch_successful_try_no_catch(struct kunit *test)
+{
+	struct kunit_try_catch_test_context *ctx = test->priv;
+	struct kunit_try_catch *try_catch = ctx->try_catch;
+
+	kunit_try_catch_init(try_catch,
+			     test,
+			     kunit_test_successful_try,
+			     kunit_test_no_catch);
+	kunit_try_catch_run(try_catch, test);
+
+	KUNIT_EXPECT_TRUE(test, ctx->function_called);
+}
+
+void kunit_test_unsuccessful_try(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+	struct kunit_try_catch *try_catch = ctx->try_catch;
+
+	kunit_try_catch_throw(try_catch);
+	KUNIT_FAIL(test, "This line should never be reached.\n");
+}
+
+void kunit_test_catch(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+
+	ctx->function_called = true;
+}
+
+static void kunit_test_try_catch_unsuccessful_try_does_catch(struct kunit *test)
+{
+	struct kunit_try_catch_test_context *ctx = test->priv;
+	struct kunit_try_catch *try_catch = ctx->try_catch;
+
+	kunit_try_catch_init(try_catch,
+			     test,
+			     kunit_test_unsuccessful_try,
+			     kunit_test_catch);
+	kunit_try_catch_run(try_catch, test);
+
+	KUNIT_EXPECT_TRUE(test, ctx->function_called);
+}
+
+static int kunit_try_catch_test_init(struct kunit *test)
+{
+	struct kunit_try_catch_test_context *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	test->priv = ctx;
+
+	ctx->try_catch = kunit_kmalloc(test,
+				       sizeof(*ctx->try_catch),
+				       GFP_KERNEL);
+
+	return 0;
+}
+
+static struct kunit_case kunit_try_catch_test_cases[] = {
+	KUNIT_CASE(kunit_test_try_catch_successful_try_no_catch),
+	KUNIT_CASE(kunit_test_try_catch_unsuccessful_try_does_catch),
+	{},
+};
+
+static struct kunit_module kunit_try_catch_test_module = {
+	.name = "kunit-try-catch-test",
+	.init = kunit_try_catch_test_init,
+	.test_cases = kunit_try_catch_test_cases,
+};
+module_test(kunit_try_catch_test_module);
-- 
2.21.0.1020.gf2820cf01a-goog

