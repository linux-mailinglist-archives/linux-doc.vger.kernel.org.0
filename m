Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DEC23C0F0
	for <lists+linux-doc@lfdr.de>; Tue,  4 Aug 2020 22:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgHDUsB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Aug 2020 16:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbgHDUr7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Aug 2020 16:47:59 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB375C061756
        for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2020 13:47:58 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id h10so30233585qtc.4
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2020 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=y+u4fKeYaqBEutQX9Z0HQ6z4AVHLFsJy68c6azG+EzI=;
        b=mmVoL/AM2WzN83wudXZcQBbAARV3/CCAsweI2kvE34swVGEjEGDTyGhs8TzIqLB2Jy
         J9ABiX5LWXRTIPPouIHnVNKoYjuyneQCYAgTO8KCID1l2KHt6VpCwyEzaiH8GMYHHSAP
         pAKKxa6sHVCqjWlYiJDPfltmJlj9UARbuMIfuynhlkZCTu3T2byGo6yjWRh7wYptj6+F
         mxLVmMmQ1JcXWjY9BlBuvIqBQTAQ5Qns34/Ua/GQqqfrrwC70rdtH+cE2oUv5YMBChi8
         q0GDV3HsB+RnB1CaxSgFWDfYEZTZRgyIfKv99NnIUyGt7dQ+fLYy0HlBAl7VvqYdxVrd
         X3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=y+u4fKeYaqBEutQX9Z0HQ6z4AVHLFsJy68c6azG+EzI=;
        b=bo3L1Dw1nuI69HXiDzd2iOjDKMz5yuRLHy8ZM9oZdnFCnO7eGVCeF4VV0mmGwudT3h
         moR3aXOKZjc9z8MrhcethQVYvy200PkuQoYmfNvjXN5vws66xfWulNcBFTtdXKV1YWbq
         sV+bIW4HBZ7iarzwon16C4KmlBYgdZjGzhX+NUjD4rxCyJdoWw+6pIy65JdBnpc1My2u
         VdoiLbE+C9FJtruAKtm4ZFlyL4l7CLmwyJYACekvJW6ZBJh13tzMPYO8AAj4100PNe9F
         5igZIekeJKQhN5XlKyA6Y+SlBXDs+4nAPqbEb7n3GwHQc3z1osUdq8Pavaiw+HOmle0T
         tLng==
X-Gm-Message-State: AOAM533f2eFYamyxn62Jw+sGsv4dOItXpvKXSil0cIeyk6b1tWOPsn/V
        gMukyu3uUp/v0WE/z3q00yai2/QPdwZLACdQtXLGXQ==
X-Google-Smtp-Source: ABdhPJxyDKJxFIl1my851ZIf2fCKwWG52mp7Blh2CoLZwkoZ/cs5K9FEc2P1jO16v9PTh/QU/Kvpjz4/2OkY4LqBZmlnmQ==
X-Received: by 2002:a0c:806b:: with SMTP id 98mr238468qva.38.1596574077956;
 Tue, 04 Aug 2020 13:47:57 -0700 (PDT)
Date:   Tue,  4 Aug 2020 13:47:43 -0700
In-Reply-To: <20200804204745.987648-1-brendanhiggins@google.com>
Message-Id: <20200804204745.987648-4-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200804204745.987648-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH v6 3/5] init: main: add KUnit to kernel init
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Although we have not seen any actual examples where KUnit doesn't work
because it runs in the late init phase of the kernel, it has been a
concern for some time that this could potentially be an issue in the
future. So, remove KUnit from init calls entirely, instead call directly
from kernel_init() so that KUnit runs after late init.

Co-developed-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
---
 include/kunit/test.h | 9 +++++++++
 init/main.c          | 4 ++++
 lib/kunit/executor.c | 4 +---
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index f3e86c3953a2b..795039d9f1917 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -228,6 +228,15 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites);
 
 void __kunit_test_suites_exit(struct kunit_suite **suites);
 
+#if IS_BUILTIN(CONFIG_KUNIT)
+int kunit_run_all_tests(void);
+#else
+static inline int kunit_run_all_tests(void)
+{
+	return 0;
+}
+#endif /* IS_BUILTIN(CONFIG_KUNIT) */
+
 /**
  * kunit_test_suites() - used to register one or more &struct kunit_suite
  *			 with KUnit.
diff --git a/init/main.c b/init/main.c
index 0ead83e86b5aa..d3101d8874dea 100644
--- a/init/main.c
+++ b/init/main.c
@@ -106,6 +106,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/initcall.h>
 
+#include <kunit/test.h>
+
 static int kernel_init(void *);
 
 extern void init_IRQ(void);
@@ -1504,6 +1506,8 @@ static noinline void __init kernel_init_freeable(void)
 
 	do_basic_setup();
 
+	kunit_run_all_tests();
+
 	console_on_rootfs();
 
 	/*
diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 7015e7328dce7..4aab7f70a88c3 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -11,7 +11,7 @@ extern struct kunit_suite * const * const __kunit_suites_end[];
 
 #if IS_BUILTIN(CONFIG_KUNIT)
 
-static int kunit_run_all_tests(void)
+int kunit_run_all_tests(void)
 {
 	struct kunit_suite * const * const *suites;
 
@@ -23,6 +23,4 @@ static int kunit_run_all_tests(void)
 	return 0;
 }
 
-late_initcall(kunit_run_all_tests);
-
 #endif /* IS_BUILTIN(CONFIG_KUNIT) */
-- 
2.28.0.163.g6104cc2f0b6-goog

