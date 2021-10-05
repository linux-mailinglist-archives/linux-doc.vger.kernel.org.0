Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1B1422450
	for <lists+linux-doc@lfdr.de>; Tue,  5 Oct 2021 13:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbhJELCr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Oct 2021 07:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbhJELCT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 07:02:19 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CBDC0617A9
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 04:00:12 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id c19-20020ac81e93000000b002a71180fd3dso18104456qtm.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 04:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=qua6hkgX1DqgYC81lcf9MuNL3xFoQ65uNHSjN4wVu7E=;
        b=p1/pKdO+SM/iSx7K48QqvvkZX8FRzxvzYLgyl79HaAerm0m5U1Bp+IoclavLshBho3
         9v5r/FDpEkKHjM73/00RJzHlPnJYWGnBbgiPdsMTyqBVXLZlxU2uLtOwr24IAOBwdgIq
         720NGi4mOnutTp5+XTPjJbCKHbF/pTi0cGjx2S3ZuVxIApBJcDo0W5f46EUTC03hjuxR
         ldCPYX1y7fMSAA8nTXfIXJV74VGl/mBa9CIkNqVC3xF0G1TnEx6IWSv5Y4OmJr3crRuQ
         GoLKr0jisSBGsmq5thpuIc+3+6B5odAgmhDZKnxQoP8WOzjXERpMFOtl0K6B3PCvje/j
         938g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=qua6hkgX1DqgYC81lcf9MuNL3xFoQ65uNHSjN4wVu7E=;
        b=wh8N0eMTdyot22bZ7Ht+adWgnxI5gnmN4TArzU7IoLfLaWBXTmswY6JbZUhD5PCKEX
         v/N9IsWs2XVXIqZqGpW5Gmr5iC+GuZ2tatcCfACMAgvHCenRu/4EWorhN7HCAv56kjhx
         vTdrzhyQpYwWJ6GGIxHcjcawdPf7VgYPudV0yFvG1hpOwZBkCOazY3NexJKfs6GWoY/q
         jaBAaYQkQVc2JuBdeiGXMnRWvCHMLxJOXOIWAQ/X06zC/3QiU05872z6pAxlVZcYdj/K
         D4nnF3hE/U0WBhemAScBzMvOEf0qIS+lMwOP3yWfwzt+gaJrX8QtrxFHB4IfbGwk5Ea3
         Se3Q==
X-Gm-Message-State: AOAM5307qTr2oLvLLaRAEvH0TERwCPVCCZc7MJPKduh9pz1a2nRXGOds
        dXQIkZW9WAbIPFO1j+HdQZnWHN0D1A==
X-Google-Smtp-Source: ABdhPJxjHycsrzsJBhlbfWkRoL+tWY9Y18zzBZYEfmQkvpWJfrNPv+9OM/BxphLh6Kg/b61r/C2Vuw5AJg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a05:6214:1083:: with SMTP id
 o3mr436313qvr.57.1633431611175; Tue, 05 Oct 2021 04:00:11 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:58:54 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-13-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 12/23] kcsan: Ignore GCC 11+ warnings about TSan
 runtime support
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E . McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

GCC 11 has introduced a new warning option, -Wtsan [1], to warn about
unsupported operations in the TSan runtime. But KCSAN !=3D TSan runtime,
so none of the warnings apply.

[1] https://gcc.gnu.org/onlinedocs/gcc-11.1.0/gcc/Warning-Options.html

Ignore the warnings.

Currently the warning only fires in the test for __atomic_thread_fence():

kernel/kcsan/kcsan_test.c: In function =E2=80=98test_atomic_builtins=E2=80=
=99:
kernel/kcsan/kcsan_test.c:1234:17: warning: =E2=80=98atomic_thread_fence=E2=
=80=99 is not supported with =E2=80=98-fsanitize=3Dthread=E2=80=99 [-Wtsan]
 1234 |                 __atomic_thread_fence(__ATOMIC_SEQ_CST);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

which exists to ensure the KCSAN runtime keeps supporting the builtin
instrumentation.

Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/Makefile.kcsan | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
index 4c7f0d282e42..19f693b68a96 100644
--- a/scripts/Makefile.kcsan
+++ b/scripts/Makefile.kcsan
@@ -13,6 +13,12 @@ kcsan-cflags :=3D -fsanitize=3Dthread -fno-optimize-sibl=
ing-calls \
 	$(call cc-option,$(call cc-param,tsan-compound-read-before-write=3D1),$(c=
all cc-option,$(call cc-param,tsan-instrument-read-before-write=3D1))) \
 	$(call cc-param,tsan-distinguish-volatile=3D1)
=20
+ifdef CONFIG_CC_IS_GCC
+# GCC started warning about operations unsupported by the TSan runtime. Bu=
t
+# KCSAN !=3D TSan, so just ignore these warnings.
+kcsan-cflags +=3D -Wno-tsan
+endif
+
 ifndef CONFIG_KCSAN_WEAK_MEMORY
 kcsan-cflags +=3D $(call cc-option,$(call cc-param,tsan-instrument-func-en=
try-exit=3D0))
 endif
--=20
2.33.0.800.g4c38ced690-goog

