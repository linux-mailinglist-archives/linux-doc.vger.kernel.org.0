Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F16422471
	for <lists+linux-doc@lfdr.de>; Tue,  5 Oct 2021 13:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234704AbhJELDn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Oct 2021 07:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbhJELDR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 07:03:17 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B194EC0613B3
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 04:00:30 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id hf12-20020a0562140e8c00b00382cdfe644eso7404143qvb.23
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GLbylOcVG6Z3Pa9zRtQvvZApReh1K+etnDrS06Ovq3M=;
        b=FUiAxTnfrZLKUIMUnc8u8Uz1MPlAowbzXsoiyB0j1/uFmemd8bA57CbOJSvAnN0uer
         mWV43BDY51SWbpoWRR+8FYTzxCYDzgf2kQUkjcDeaLxzs60zcolLONh3I5/xSIM2Ln9a
         pDdOV/AOyMJZ3CEpBJr6cgi6t+sMmiweK3lQVUBfjP8KqZcObQKaWzLkMsOBi4PKrRwo
         pkWV19EvmTjKbCycM8POFEy7LjGI3rebQ+fKCwy2o+uP6loTZ5R2j48UcupzxzV7hZxz
         MydcwcR0hWw/EcEm6/tZbkG8TeBm5t0dYPdwTG1XyUWWYW6bL/e9ZkuFA9GL2O+TB21f
         /7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GLbylOcVG6Z3Pa9zRtQvvZApReh1K+etnDrS06Ovq3M=;
        b=fwEnGcsOBquSGxmHKIodO5gKWMnGdm7rHgX38FMmqHw49+G20nMQ21CRY0bF6xN679
         qSBkpaNE5x5Ol7N+JnIsWwc780Pc8x5sV/vQzZEbZMN9eA+KVuazoKTwdhcPJ1yMBUIP
         ZnCo+HiHAqeFenjTV8v6FdwLke2XrKcX+aj49/9+YHXHB2ly54P36Xn37lBaj35ozSq+
         UQipTMX5oYgKXJ1m0Pnv/o5Arei17YJlTf9mxxlwtqdCdIW8aBgQMzT4AqDn6Oo2PPPG
         cUKOq8L+Rba3Bw3NjrLJKef37AZPfSzqwTiq5ja4wODjbIZ0xQTd2DvphWfgoXyfX4BK
         3Nkg==
X-Gm-Message-State: AOAM533xKIjRK8nKlwHaucUAUVnyRXl5FW9+irgprTiHdwc1Eud674nN
        UK5IqvJ5rja/YxbchhK8fIKVwrzotw==
X-Google-Smtp-Source: ABdhPJyjNJ7xQvPokpErt/T0wlpwPwNSdSeEenve8kThGp3G7hepSph1caWrRWcNousw/8R5qeK+ovlydQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a0c:c1c9:: with SMTP id v9mr26722583qvh.31.1633431629848;
 Tue, 05 Oct 2021 04:00:29 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:59:02 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-21-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 20/23] mm, kcsan: Enable barrier instrumentation
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
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some memory management calls imply memory barriers that are required to
avoid false positives. For example, without the correct instrumentation,
we could observe data races of the following variant:

                   T0           |           T1
        ------------------------+------------------------
                                |
         *a = 42;    ---+       |
         kfree(a);      |       |
                        |       | b = kmalloc(..); // b == a
          <reordered> <-+       | *b = 42;         // not a data race!
                                |

Therefore, instrument memory barriers in all allocator code currently
not being instrumented in a default build.

Signed-off-by: Marco Elver <elver@google.com>
---
 mm/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/Makefile b/mm/Makefile
index fc60a40ce954..11e9fcd410be 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -15,6 +15,8 @@ KCSAN_SANITIZE_slab_common.o := n
 KCSAN_SANITIZE_slab.o := n
 KCSAN_SANITIZE_slub.o := n
 KCSAN_SANITIZE_page_alloc.o := n
+# But enable explicit instrumentation for memory barriers.
+KCSAN_INSTRUMENT_BARRIERS := y
 
 # These files are disabled because they produce non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. E.g. slab is out of
-- 
2.33.0.800.g4c38ced690-goog

