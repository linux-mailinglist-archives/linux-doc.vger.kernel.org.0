Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7C2463329
	for <lists+linux-doc@lfdr.de>; Tue, 30 Nov 2021 12:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhK3LuS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Nov 2021 06:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241193AbhK3Ltv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 06:49:51 -0500
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB04C0619D4
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 03:46:05 -0800 (PST)
Received: by mail-wm1-x349.google.com with SMTP id 145-20020a1c0197000000b0032efc3eb9bcso13628528wmb.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 03:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ykQMG7f7HitTY02bjgroWOqQwac8nTYOVAZLqTXm/og=;
        b=qfKYXOVzY2MTzD2zIwUpOpLCYIanN5AfAyzY4pD6y/00NCNsZhMgCXyQuHgqHRjMQP
         2Q4GpB2kKiA9NG+mxwbdwhx/T6uztpsr0cPDZKwOOV4NBkpo8wKmqUMwj6QIZ50+WTGC
         rj+XujQ6x15SViviNrLc8ryKZTpDmfQ59NmqPKusALt7vIXW09vUdxRhx/IHgX0O1Fi0
         peXM6+tWJqwR46RttMZspmzxuv6mgkZjTPQRNEx0+Evh/SfhzkOebPUPea948l/PAD60
         8d8gkegUNMa+NHH1FPVvEqF67z8VdDW4GAXutQLRg58SDKDe/Mh9BClDvEsEpsff6SiM
         sbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ykQMG7f7HitTY02bjgroWOqQwac8nTYOVAZLqTXm/og=;
        b=WokuDo9qsfrYFMYAfDOPr4y3sro2cC/IVB9I93cRhmRE9+xmirkJqxsl53PLieFx1I
         qFMgQFxR1eyCQZznDqcNgCptAumLJJRi2+nguV6yZqR5oJ5Id1hZQf8XHA5/B+YU9mJP
         VZ5MbSERNxfcVc6kTh02CnHOpygo2R9ZmtV2My0RXeHAjjbUpFDKBhc2R1L9fDE/RfR5
         0trP4PmJcYwodeqyBWSTkvqzZg1AUjgWDgmBp3KFgtkApnBlt2MT1qjQgBEqNK8nlIyn
         6mJh2eG/f9NuzMDOwgRuUVg3i4NqDElxW3+u6/4bwcmI1cOt91o35kBWnaYKltKGks8f
         2aiA==
X-Gm-Message-State: AOAM532iXrfLAtG8DMHQIOjr06Tp1rSrS+FNxhTnOn0NUFMr9qthAuqv
        incAfuM7djNVFHVzbvIHfWvr4eelLA==
X-Google-Smtp-Source: ABdhPJw6whH8Hls3EC+BgAy91BvIDfMtsebOG9cJCkHwE7EfRIVxArLwzYtCPhRhlBjkro/EFip+BpGtoQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4f0b:: with SMTP id
 l11mr626212wmq.0.1638272763966; Tue, 30 Nov 2021 03:46:03 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:33 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-26-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 25/25] kcsan: Support WEAK_MEMORY with Clang where no
 objtool support exists
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, llvm@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clang and GCC behave a little differently when it comes to the
__no_sanitize_thread attribute, which has valid reasons, and depending
on context either one could be right.

Traditionally, user space ThreadSanitizer [1] still expects instrumented
builtin atomics (to avoid false positives) and __tsan_func_{entry,exit}
(to generate meaningful stack traces), even if the function has the
attribute no_sanitize("thread").

[1] https://clang.llvm.org/docs/ThreadSanitizer.html#attribute-no-sanitize-thread

GCC doesn't follow the same policy (for better or worse), and removes
all kinds of instrumentation if no_sanitize is added. Arguably, since
this may be a problem for user space ThreadSanitizer, we expect this may
change in future.

Since KCSAN != ThreadSanitizer, the likelihood of false positives even
without barrier instrumentation everywhere, is much lower by design.

At least for Clang, however, to fully remove all sanitizer
instrumentation, we must add the disable_sanitizer_instrumentation
attribute, which is available since Clang 14.0.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* New patch.
---
 include/linux/compiler_types.h | 13 ++++++++++++-
 lib/Kconfig.kcsan              |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 1d32f4c03c9e..3c1795fdb568 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -198,9 +198,20 @@ struct ftrace_likely_data {
 # define __no_kasan_or_inline __always_inline
 #endif
 
-#define __no_kcsan __no_sanitize_thread
 #ifdef __SANITIZE_THREAD__
+/*
+ * Clang still emits instrumentation for __tsan_func_{entry,exit}() and builtin
+ * atomics even with __no_sanitize_thread (to avoid false positives in userspace
+ * ThreadSanitizer). The kernel's requirements are stricter and we really do not
+ * want any instrumentation with __no_kcsan.
+ *
+ * Therefore we add __disable_sanitizer_instrumentation where available to
+ * disable all instrumentation. See Kconfig.kcsan where this is mandatory.
+ */
+# define __no_kcsan __no_sanitize_thread __disable_sanitizer_instrumentation
 # define __no_sanitize_or_inline __no_kcsan notrace __maybe_unused
+#else
+# define __no_kcsan
 #endif
 
 #ifndef __no_sanitize_or_inline
diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index e4394ea8068b..63b70b8c5551 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -198,7 +198,7 @@ config KCSAN_WEAK_MEMORY
 	# We can either let objtool nop __tsan_func_{entry,exit}() and builtin
 	# atomics instrumentation in .noinstr.text, or use a compiler that can
 	# implement __no_kcsan to really remove all instrumentation.
-	depends on STACK_VALIDATION || CC_IS_GCC
+	depends on STACK_VALIDATION || CC_IS_GCC || CLANG_VERSION >= 140000
 	help
 	  Enable support for modeling a subset of weak memory, which allows
 	  detecting a subset of data races due to missing memory barriers.
-- 
2.34.0.rc2.393.gf8c9666880-goog

