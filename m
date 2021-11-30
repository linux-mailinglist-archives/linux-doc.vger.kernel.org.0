Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A4C46332D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Nov 2021 12:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237337AbhK3LuW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Nov 2021 06:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241265AbhK3Ltm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 06:49:42 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06186C06137C
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 03:46:03 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id ay34-20020a05600c1e2200b00337fd217772so12697385wmb.4
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 03:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hHpI+TkJP++fcdc46vUsOPoUrJOI1E0VxBDtAT4JUtM=;
        b=ZydYBw/EQptiAQjTJgW8VFb6M+tj/jnOJSKAzEOo9ttb4/prBXxenHyAcxKFnhYPtG
         yxkoZSjdkoQwGFG90n0H+8xMHAoecs8kp2mS+zTaZsYuo/VXrNHwT1dCCGqN+qd2xKqO
         A4acfRlS2z6HmsLoxx1UolNjWfJ2+Ztsu6wU/VCsHuubkWa6zG7vvPdxEtYFrhi/J/x1
         SgdPBckdgJ9qE7I2ZNNnAqkYt2+gpBZ+AartGApj/044P+zkOJcXZg2hjzRL7no/XtPz
         MihwHIfIAQnWjB96wkXuEnhFMgqyeDJ1+RyraL9HQrgcKqeYe6aB+N/OeDIQjy/DWPFQ
         OLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hHpI+TkJP++fcdc46vUsOPoUrJOI1E0VxBDtAT4JUtM=;
        b=raexuFP7XhSgJ4HiWRSlRK/eYWFkMH/lxqVP3m7my1CtUYY+pCG6699857HhxF8TWP
         l1norgwNi5pDaTazAY5H8hkBTL7ZcYANJMw7dlu2KgBngZmKj7ru0xPOAIF+CpnJm7gw
         RT2maST3BI1LMP1sHIPp0b7XvSNyL+1IdxtaZmi8460VTSxvb62v9V4BnF0FE9ezEC/j
         OHbSvFKmJ7KV+d5GqWiUaZUDNDaE7kBp1+HRNHD8wc9K3ANJIIz5Ja6ukLpFgToHu/nC
         frWoFKitz7irwRuiyVV1qsWxoHMFl6OxK6fQY5woYm/a/d1pYT7HFAjc5y1mJd1Mtj5I
         D+hA==
X-Gm-Message-State: AOAM532RVz4EMkFo0t1A1uODtm4m0oqFomQAdTOWM9n2atzxlZWQwTP/
        L2x9kKY/jjyVNLlwKfVcntlfWsua7w==
X-Google-Smtp-Source: ABdhPJxBEJ1Ij4N3anSHCQ6YBfqk8LJXNhrNf/MNCN7ZMLSlwxOUn6GdF8bZmMY3PAFHnunTgtGrJWD/kQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4e07:: with SMTP id
 b7mr4217301wmq.16.1638272761639; Tue, 30 Nov 2021 03:46:01 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:32 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-25-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 24/25] compiler_attributes.h: Add __disable_sanitizer_instrumentation
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

From: Alexander Potapenko <glider@google.com>

The new attribute maps to
__attribute__((disable_sanitizer_instrumentation)), which will be
supported by Clang >= 14.0. Future support in GCC is also possible.

This attribute disables compiler instrumentation for kernel sanitizer
tools, making it easier to implement noinstr. It is different from the
existing __no_sanitize* attributes, which may still allow certain types
of instrumentation to prevent false positives.

Signed-off-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* New patch.
---
 include/linux/compiler_attributes.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index b9121afd8733..37e260020221 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -308,6 +308,24 @@
 # define __compiletime_warning(msg)
 #endif
 
+/*
+ * Optional: only supported since clang >= 14.0
+ *
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#disable-sanitizer-instrumentation
+ *
+ * disable_sanitizer_instrumentation is not always similar to
+ * no_sanitize((<sanitizer-name>)): the latter may still let specific sanitizers
+ * insert code into functions to prevent false positives. Unlike that,
+ * disable_sanitizer_instrumentation prevents all kinds of instrumentation to
+ * functions with the attribute.
+ */
+#if __has_attribute(disable_sanitizer_instrumentation)
+# define __disable_sanitizer_instrumentation \
+	 __attribute__((disable_sanitizer_instrumentation))
+#else
+# define __disable_sanitizer_instrumentation
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-weak-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-weak-variable-attribute
-- 
2.34.0.rc2.393.gf8c9666880-goog

