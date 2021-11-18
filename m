Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF7F455661
	for <lists+linux-doc@lfdr.de>; Thu, 18 Nov 2021 09:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244279AbhKRIOJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Nov 2021 03:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244267AbhKRIOF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 03:14:05 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA595C0613B9
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:05 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id m18-20020a05600c3b1200b0033283ea5facso1986083wms.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cCyxJnES0DWyrpQ2J5vRoZu9DlHTb3+fL88VjiCWbjg=;
        b=U6MOwm5YMGFgIxfJyMcfK1fy2ZzEMSWUD5qAdZAzplNRNP7y1WSuqURPPJGKJuCfyA
         tLjBC4LWDhIOvpwVSIWlN/7hCC7oDRSAEe3N5O7HXF2+1cysu+v/p1swtiItkjHcY2wA
         SKAtC33LlUoMSl910Qd33i8hqhUurSDnGqhxDtBZW1tDDEjYPrEDzYFu9Q7x85JMzCoO
         C4GIrFGrw7ORbcAqnDgrzvS/VicOAMv5s3BFyWUfDJ5iXC7yoZ6fi2//vKWqmvJb/Rk9
         5nEe5UA0D42ee/7U1oYy4dTdtn5p8v8YxwHYhlqleHpsQAO2c7MYg8uQiOugGlxBUyBi
         uUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cCyxJnES0DWyrpQ2J5vRoZu9DlHTb3+fL88VjiCWbjg=;
        b=peLeKeeOfRHNbTHFHvXEj3M82OwW+E6h5ot0FIIIrJxELaHOKzxQRErE9Xkop2Q5Hq
         RmtuT5CNUi1cb6YEaIzKwFTTOGJr9YY5GvqANTt3srjZyiQ6sCnoNXy14rV4SNmqVbJg
         XAz85t41ec0Vmxhob+of8dtfBS3Kw2IaSz+b27m5y3ajQ7vheEHkYxrPt68pqqxwh9Ru
         W29AYikI8PxOYWMVuCElaUYco8Bc6jQmdE8Ko9jp1PyuTc9NBv8Gk79WA02gNP5VxAxw
         JClBTi02g3Wfo0UoHaTiRvejzNrMps18IqDPs8l0oSvquOm6Bwr+MKyz/l+VP/rJLk3u
         fxsw==
X-Gm-Message-State: AOAM530MBhFVDAAH+scL/pYOjLjRTTaVyjPBmAG66F9qKO7Wdk4DKKWR
        3ekhxmE4yVLO2pxd99qrLMIYLKAdgA==
X-Google-Smtp-Source: ABdhPJxkB593VfcNkLX9J9nVFwnAhaHJjUUwfmrh7gaZZX3OtssqlV/5En9lYvCkCZUZKU3Aqu91vbjvqg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a05:600c:3b20:: with SMTP id
 m32mr2109203wms.0.1637223063945; Thu, 18 Nov 2021 00:11:03 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:07 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-4-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 03/23] kcsan: Avoid checking scoped accesses from nested contexts
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
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

Avoid checking scoped accesses from nested contexts (such as nested
interrupts or in scheduler code) which share the same kcsan_ctx.

This is to avoid detecting false positive races of accesses in the same
thread with currently scoped accesses: consider setting up a watchpoint
for a non-scoped (normal) access that also "conflicts" with a current
scoped access. In a nested interrupt (or in the scheduler), which shares
the same kcsan_ctx, we cannot check scoped accesses set up in the parent
context -- simply ignore them in this case.

With the introduction of kcsan_ctx::disable_scoped, we can also clean up
kcsan_check_scoped_accesses()'s recursion guard, and do not need to
modify the list's prev pointer.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kcsan.h |  1 +
 kernel/kcsan/core.c   | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/linux/kcsan.h b/include/linux/kcsan.h
index fc266ecb2a4d..13cef3458fed 100644
--- a/include/linux/kcsan.h
+++ b/include/linux/kcsan.h
@@ -21,6 +21,7 @@
  */
 struct kcsan_ctx {
 	int disable_count; /* disable counter */
+	int disable_scoped; /* disable scoped access counter */
 	int atomic_next; /* number of following atomic ops */
 
 	/*
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index e34a1710b7bc..bd359f8ee63a 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -204,15 +204,17 @@ check_access(const volatile void *ptr, size_t size, int type, unsigned long ip);
 static noinline void kcsan_check_scoped_accesses(void)
 {
 	struct kcsan_ctx *ctx = get_ctx();
-	struct list_head *prev_save = ctx->scoped_accesses.prev;
 	struct kcsan_scoped_access *scoped_access;
 
-	ctx->scoped_accesses.prev = NULL;  /* Avoid recursion. */
+	if (ctx->disable_scoped)
+		return;
+
+	ctx->disable_scoped++;
 	list_for_each_entry(scoped_access, &ctx->scoped_accesses, list) {
 		check_access(scoped_access->ptr, scoped_access->size,
 			     scoped_access->type, scoped_access->ip);
 	}
-	ctx->scoped_accesses.prev = prev_save;
+	ctx->disable_scoped--;
 }
 
 /* Rules for generic atomic accesses. Called from fast-path. */
@@ -465,6 +467,15 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 		goto out;
 	}
 
+	/*
+	 * Avoid races of scoped accesses from nested interrupts (or scheduler).
+	 * Assume setting up a watchpoint for a non-scoped (normal) access that
+	 * also conflicts with a current scoped access. In a nested interrupt,
+	 * which shares the context, it would check a conflicting scoped access.
+	 * To avoid, disable scoped access checking.
+	 */
+	ctx->disable_scoped++;
+
 	/*
 	 * Save and restore the IRQ state trace touched by KCSAN, since KCSAN's
 	 * runtime is entered for every memory access, and potentially useful
@@ -578,6 +589,7 @@ kcsan_setup_watchpoint(const volatile void *ptr, size_t size, int type, unsigned
 	if (!kcsan_interrupt_watcher)
 		local_irq_restore(irq_flags);
 	kcsan_restore_irqtrace(current);
+	ctx->disable_scoped--;
 out:
 	user_access_restore(ua_flags);
 }
-- 
2.34.0.rc2.393.gf8c9666880-goog

