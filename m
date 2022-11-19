Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECFE1630D25
	for <lists+linux-doc@lfdr.de>; Sat, 19 Nov 2022 09:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiKSINE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 19 Nov 2022 03:13:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiKSIND (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Nov 2022 03:13:03 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AAD7DEE8
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:13:00 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-393fc59d09fso47883947b3.18
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mxlxAlM6/dget+xcMGAu2YOt8fNlUAK4C29Oqcd00C8=;
        b=IcwXafexRAl664jaBoJyAa5mMQYLIYMkPXwqAvZb6o4ue+mpDnBlE0xs0UzTUu6YrL
         J/64TUXc9QJcwIpZb9Yj/DCH6Dwppd6ZMkmAPNMO9NLSQpa+UGz749sgxZn2x0YkNUIf
         LXPeai2EGngQkB7CfGiliNP7pMyGOorEuwIKH7/iimSqlhTNe9/StKThGkjm1J478yQT
         FjE1xZ26fMXjtNwEj/vs994FgwWwhpqoI2BaovX8NQreDY9YAYWcG+493mAuAS7O7+Dr
         a5zzfXgoWCsjb0963b6N3+kOMQOwst8wLhiAngZj5t5raxaGfEX5swv2inf1I1yUiP9c
         uOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxlxAlM6/dget+xcMGAu2YOt8fNlUAK4C29Oqcd00C8=;
        b=v2BQTVVaYVXQY2hFfDo7D47AbYKS1wCzgNskWFN3LmdUvZbTZCKtmgoD4d43WRY/wS
         ULp9n3LprTDkFeXTlijWYeJBN85G2G/asNWuyz6Wksr6OWwYUWlx3Eqs0r+4CMHRhtVc
         loimOc9mf6thjcbZCkoPcUjPeXJv4enKAbkMnst3F6aJVetKPIkEm5fTOEAGpzU3qc3N
         u/9lduEGAp36Be2Aq5Qk5HzUfmP0Z4alrOTBdqGg/1nZG1oR/+gG2NDPqu8ZVpz/r3yK
         mKbsYeLqaYNvWJaOxn6yCD7Ol7FZGHzCFE1NPPmpTZFWOeEa1v/Zakko7JIvyJxL2MHP
         L5hA==
X-Gm-Message-State: ANoB5pnZ6GSf2v9CuhApTqVZQRFzJLcKGPilcVcKKyQo7pHDiovAJiJr
        2BQJa4UtFVNl3k+eG9WYOLpxYEePgyFawg==
X-Google-Smtp-Source: AA0mqf67B7vUfx2Z0il/dhl9vKO2jAAok4f+bf6diQKTxBlXzTpb7pEn7mFBK76m9TQGjgkDGqNWmpmh5ibXWQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:e807:0:b0:6ca:21b3:42ec with SMTP id
 k7-20020a25e807000000b006ca21b342ecmr9916189ybd.398.1668845579853; Sat, 19
 Nov 2022 00:12:59 -0800 (PST)
Date:   Sat, 19 Nov 2022 16:12:50 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221119081252.3864249-1-davidgow@google.com>
Subject: [PATCH v3 1/3] kunit: Provide a static key to check if KUnit is
 actively running tests
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendan.higgins@linux.dev>,
        Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KUnit does a few expensive things when enabled. This hasn't been a
problem because KUnit was only enabled on test kernels, but with a few
people enabling (but not _using_) KUnit on production systems, we need a
runtime way of handling this.

Provide a 'kunit_running' static key (defaulting to false), which allows
us to hide any KUnit code behind a static branch. This should reduce the
performance impact (on other code) of having KUnit enabled to a single
NOP when no tests are running.

Note that, while it looks unintuitive, tests always run entirely within
__kunit_test_suites_init(), so it's safe to decrement the static key at
the end of this function, rather than in __kunit_test_suites_exit(),
which is only there to clean up results in debugfs.

Signed-off-by: David Gow <davidgow@google.com>
---

This should be a no-op (other than a possible performance improvement)
functionality-wise, and lays the groundwork for a more optimised static
stub implementation.

The remaining patches in the series add a kunit_get_current_test()
function which is a more friendly and performant wrapper around
current->kunit_test, and use this in the slub test. They also improve
the documentation a bit.

If there are no objections, we'll take the whole series via the KUnit
tree.

No changes since v2:
https://lore.kernel.org/all/20221025071907.1251820-1-davidgow@google.com/

Changes since v1:
https://lore.kernel.org/linux-kselftest/20221021072854.333010-1-davidgow@google.com/
- No changes in this patch.
- Patch 2/3 is reworked, patch 3/3 is new.

---
 include/kunit/test.h | 4 ++++
 lib/kunit/test.c     | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index d7f60e8aab30..b948c32a7b6b 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -16,6 +16,7 @@
 #include <linux/container_of.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/jump_label.h>
 #include <linux/kconfig.h>
 #include <linux/kref.h>
 #include <linux/list.h>
@@ -27,6 +28,9 @@
 
 #include <asm/rwonce.h>
 
+/* Static key: true if any KUnit tests are currently running */
+extern struct static_key_false kunit_running;
+
 struct kunit;
 
 /* Size of log associated with test. */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 90640a43cf62..314717b63080 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -20,6 +20,8 @@
 #include "string-stream.h"
 #include "try-catch-impl.h"
 
+DEFINE_STATIC_KEY_FALSE(kunit_running);
+
 #if IS_BUILTIN(CONFIG_KUNIT)
 /*
  * Fail the current test and print an error message to the log.
@@ -612,10 +614,14 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
 		return 0;
 	}
 
+	static_branch_inc(&kunit_running);
+
 	for (i = 0; i < num_suites; i++) {
 		kunit_init_suite(suites[i]);
 		kunit_run_tests(suites[i]);
 	}
+
+	static_branch_dec(&kunit_running);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__kunit_test_suites_init);
-- 
2.38.1.584.g0f3c55d4c2-goog

