Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C14562611B
	for <lists+linux-doc@lfdr.de>; Fri, 11 Nov 2022 19:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbiKKS3h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Nov 2022 13:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234137AbiKKS30 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Nov 2022 13:29:26 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551375CD07
        for <linux-doc@vger.kernel.org>; Fri, 11 Nov 2022 10:29:25 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id a8-20020a621a08000000b0056e3c6c0746so3125904pfa.20
        for <linux-doc@vger.kernel.org>; Fri, 11 Nov 2022 10:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/XHe3/zCTpZWNceRA9RtU7Jdjy85jUuF1PtTziDeOJ4=;
        b=SHWYMQw6kstMFCPeHdhZKyPK3U1w2EOYu+EfQeWTuTi4NJieEMZil99CRywaRL3QXr
         M7ApzG4XLCYAg0PetxNjHSfwNLA3LxmKu8LWDFygNY1lctOOSshYpwuhWdWdEPG4cj6h
         QWqck+Cp18gxDExvnjGBgUh7CGuL123P/8Sic7xH/4xHFrfRq9PyO6QZDjJ4xQ81rw8G
         Mj7r+mHBVner9YkXBqCGbX7sD3i/SJKHNJEtf9od3zBTOZpkh1OElZCPLXu9Kh0yHr+g
         5EMsCruUmvhnGFsKUm63rt7fbbaTOV3YvxO7RSu0ufBKSPyJZYCW9ZnNfdCPxDuX08e5
         qhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XHe3/zCTpZWNceRA9RtU7Jdjy85jUuF1PtTziDeOJ4=;
        b=5vztWKpZ5RSMkjDZhpnHLp5PcPT132/lXBpvPUhYeX3NoEQlFDSJIWIhuwsJTaotm/
         yKksc8Z3YxYS7ir5pQImfKhx4+okhxaA9mt0i75avBRoih6TEQGsHEKKQrHVh+7DnAhh
         ZPK4czP+eV3mYUHqLK0J7wOuO9mQdqgsg1xwQbVQNIWCvju5VMalsRS4wOdrOkecNBCA
         AhV0BKL2vxsxHwGDN8ik8TZeqYfCWjP/XAlYsaQskLAx9bVqH43ALWp4IfLbZXFSlqv4
         es1lenoUiSd1JnsXQv/bB1K2duHTPdmAzPwyHWJtN83+npIYtPdin6eCWoaqhJSaQ8aT
         uQeg==
X-Gm-Message-State: ANoB5pm4ScbmL0tX+bGQi6Ix6X5bXNT+BQs5g1U7mFxeEaXPr3K1vVij
        +ybXVUI8zTtDV/gX1QNgwvlCoMbJ82MKyw==
X-Google-Smtp-Source: AA0mqf6oRQTd26j/7lMqh+0QrNTk7PgW/u/hbIVY7qUTrqiyiF7iitQQrLw0zJAXHQI4fYDQUXP1Ip5tvZZY/g==
X-Received: from dlatypov-spec.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3f35])
 (user=dlatypov job=sendgmr) by 2002:a17:90a:d01:b0:20a:fee1:8f69 with SMTP id
 t1-20020a17090a0d0100b0020afee18f69mr7707pja.0.1668191364606; Fri, 11 Nov
 2022 10:29:24 -0800 (PST)
Date:   Fri, 11 Nov 2022 10:29:04 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221111182906.1377191-1-dlatypov@google.com>
Subject: [PATCH v3 1/3] Documentation: KUnit: make usage.rst a superset of
 tips.rst, remove duplication
From:   Daniel Latypov <dlatypov@google.com>
To:     brendanhiggins@google.com, davidgow@google.com
Cc:     rmoar@google.com, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        Daniel Latypov <dlatypov@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

usage.rst had most of the content of the tips.rst page copied over.
But it's missing https://www.kernel.org/doc/html/v6.0/dev-tools/kunit/tips.html#customizing-error-messages
Copy it over so we can retire tips.rst w/o losing content.

And in that process, it also gained a duplicate section about how
KUNIT_ASSERT_*() exit the test case early. Remove that.

Signed-off-by: Daniel Latypov <dlatypov@google.com>
Reviewed-by: Sadiya Kazi <sadiyakazi@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 49 ++++++++++++++++---------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 2737863ef365..b0a6c3bc0eeb 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -118,6 +118,37 @@ expectation could crash the test case. `ASSERT_NOT_ERR_OR_NULL(...)` allows us
 to bail out of the test case if the appropriate conditions are not satisfied to
 complete the test.
 
+Customizing error messages
+--------------------------
+
+Each of the ``KUNIT_EXPECT`` and ``KUNIT_ASSERT`` macros have a ``_MSG``
+variant.  These take a format string and arguments to provide additional
+context to the automatically generated error messages.
+
+.. code-block:: c
+
+	char some_str[41];
+	generate_sha1_hex_string(some_str);
+
+	/* Before. Not easy to tell why the test failed. */
+	KUNIT_EXPECT_EQ(test, strlen(some_str), 40);
+
+	/* After. Now we see the offending string. */
+	KUNIT_EXPECT_EQ_MSG(test, strlen(some_str), 40, "some_str='%s'", some_str);
+
+Alternatively, one can take full control over the error message by using
+``KUNIT_FAIL()``, e.g.
+
+.. code-block:: c
+
+	/* Before */
+	KUNIT_EXPECT_EQ(test, some_setup_function(), 0);
+
+	/* After: full control over the failure message. */
+	if (some_setup_function())
+		KUNIT_FAIL(test, "Failed to setup thing for testing");
+
+
 Test Suites
 ~~~~~~~~~~~
 
@@ -546,24 +577,6 @@ By reusing the same ``cases`` array from above, we can write the test as a
 		{}
 	};
 
-Exiting Early on Failed Expectations
-------------------------------------
-
-We can use ``KUNIT_EXPECT_EQ`` to mark the test as failed and continue
-execution.  In some cases, it is unsafe to continue. We can use the
-``KUNIT_ASSERT`` variant to exit on failure.
-
-.. code-block:: c
-
-	void example_test_user_alloc_function(struct kunit *test)
-	{
-		void *object = alloc_some_object_for_me();
-
-		/* Make sure we got a valid pointer back. */
-		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, object);
-		do_something_with_object(object);
-	}
-
 Allocating Memory
 -----------------
 

base-commit: 870f63b7cd78d0055902d839a60408f7428b4e84
-- 
2.38.1.431.g37b22c650d-goog

