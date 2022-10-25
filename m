Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E5F60C4DC
	for <lists+linux-doc@lfdr.de>; Tue, 25 Oct 2022 09:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiJYHTW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Oct 2022 03:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiJYHTV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 03:19:21 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17CC14D1F3
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 00:19:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id y65-20020a25c844000000b006bb773548d5so11171199ybf.5
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tg+2eIYV8Ht6XVdDxVGWgiFGyJrz8FeDTVg6oxA83to=;
        b=N20hIBljO9B2x5fTp2LgIWIJ6EaOGsk8PztwvAmRhr/ICL8s2SDtYc8Xej+kchGmum
         RO8n9j1w+WKDCz7oFgqPc2IdvBYxzjByNjkm4hxwVX+FcssRWGWyfKDGaBXlpNHd/ESd
         w53SmUZL8Apz9MpYSTDJwmcgtyACqeyETGmVKhgDL1+oWIiKfB8MKRr+LXaBk3NwQMSq
         S59QO27GUgYRSNVlxuBn8eg+5y6oeZVK8xiN8MecuKy51E1BGP8PDElLUtQgOdAZ3oz6
         M198xDTBoLYhZB6crv2JTgJMdFBDEkWmU+VOD3su3teMa0VAyK1zEM0iSqeyadiML47h
         /9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tg+2eIYV8Ht6XVdDxVGWgiFGyJrz8FeDTVg6oxA83to=;
        b=yq2NhKcGMUxEW3kYg8R56KnRMXXN/zZhTgv17LFYxKyjXY7ZUNlfr2SexY//V1osMp
         RUFYFpHzKQRwDmLSc0nScQ8TCiNw5m29ZNbh2sAnbVWdMStNFuY1XbglbrYbFNq53ekU
         5nYAeNnc22jLnzZNGEzD88YmcdwA6UFBWeVCXae/5Bptg5uzo/5BUy8zcAs9Iezbcslk
         eKVcLMRJfLHYsJCrnuSrCSs3fVurBn+oLEkLgchCb5geHmHo3HKNaWB85DYvTZjtM1uX
         eHS7pt9I/OaeLruwNPBbSJPg35eQGIZgRjA6xb+v7wA2mur+VoO/ShJSs8+DmDN15Gz+
         cFOA==
X-Gm-Message-State: ACrzQf0w0S8XC+NaQ1CE84pl4EMkDbfZJsCDnVEI5cKxTgRLsvvyZtWb
        OPI+iE9Wkt8Fl60b5lMiAJqY1Y9Fv/lbaA==
X-Google-Smtp-Source: AMsMyM4EBhOMZUTQa08gGVH5ZMe4v1UYMJ1yyiUBna1Fp9X+01+i+YQcjjUKRz2D67kIhfv/nu3VhoLywHoY0A==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:b749:0:b0:68f:171f:96bd with SMTP id
 e9-20020a25b749000000b0068f171f96bdmr34115629ybm.137.1666682360070; Tue, 25
 Oct 2022 00:19:20 -0700 (PDT)
Date:   Tue, 25 Oct 2022 15:19:05 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221025071907.1251820-1-davidgow@google.com>
Subject: [PATCH v2 1/3] kunit: Provide a static key to check if KUnit is
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
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

Changes since v1:
https://lore.kernel.org/linux-kselftest/20221021072854.333010-1-davidgow@google.com/
- No changes in this patch.
- Patch 2/3 is reworked, patch 3/3 is new.

---
 include/kunit/test.h | 4 ++++
 lib/kunit/test.c     | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index b1ab6b32216d..450a778a039e 100644
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
2.38.0.135.g90850a2211-goog

