Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5474346332F
	for <lists+linux-doc@lfdr.de>; Tue, 30 Nov 2021 12:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241265AbhK3LuX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Nov 2021 06:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241130AbhK3Lte (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 06:49:34 -0500
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FFFC0613B3
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 03:45:51 -0800 (PST)
Received: by mail-wm1-x349.google.com with SMTP id j193-20020a1c23ca000000b003306ae8bfb7so10280551wmj.7
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 03:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=TQFyZU0v42DaaTkISoD0OFzde9Hlzhfr9CYPS/61CiQ=;
        b=UzkPOK44rKyoX0ydzg9d6O+jrGkdKn2U4Uh9I6GaB3gkQKhjEvJW6OswApZ/DpFhIs
         MjWkd+FkuLnMui5ECel20ebBFkuRLa1f1neQ6VVz1S7yCh0IvJGlwo8aeF9bhgAZqyug
         l2zCEvskzXpYTMvQpQGB0z4ARki5+15v+PWKTCRoN0cGTSZ65LPhGkDFa7K5dBSQtt1+
         LiZoJY4ePdc7NQgpEjukKVvNVBinKAvWLDa3Mfnn9KnFectfd/m0Z+qn/ceEmQlEYCrQ
         OGNEtLuGhqXgJgSt12TdFVVE+Mz8qn5rbzRLOK/zD3ItiiBRgqjdDcz7tWKq+w3BIhpz
         +2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TQFyZU0v42DaaTkISoD0OFzde9Hlzhfr9CYPS/61CiQ=;
        b=6Toud1NexasKTPXHjZ3HgFCIbsfOoOb0Cy7A9bvlLNVdUsccJUScSWjbKqZh+QRoAr
         Cebj9G1AqE4mgd9SFHMn45oIx705u62ozMT9BfJr4fI197jJw1NVCyaANAJRd5H7g7pn
         +nQknLIrr1RWTfCWVrVy7fUnY6Q13MTsjw3Lu9YOADKqINhSxuPcJdcxqzT6vLHEfYLR
         qekhO2ccPvayrchm5CM4/WOBWf2zcjSfIsisC0x1kukxE2xQQ9lqSnqcX3LIj5QisKZT
         I+614ZoWglUkBXhYcFm1S9sG6OVmC1jXvw2YTHLwc0kbh44KPxlK+0bU/dHFRZi+apmz
         5MkQ==
X-Gm-Message-State: AOAM5306uYC1JjfkVrtOGE2pmLffoSGbbuzBGEg3wbIUkGE7+5VJXFkb
        eEK1poEP3+te69RFzySbtOy7NUzApw==
X-Google-Smtp-Source: ABdhPJxb0DkHs7VvMvArdCvCQrK9MrDdf3hAA2QD7Q29GE02b72kjglRFvit2CdEhNhUNiK6zoXiTRV6/Q==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:19c8:: with SMTP id
 u8mr4203223wmq.155.1638272749477; Tue, 30 Nov 2021 03:45:49 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:27 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-20-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 19/25] x86/qspinlock, kcsan: Instrument barrier of pv_queued_spin_unlock()
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

If CONFIG_PARAVIRT_SPINLOCKS=y, queued_spin_unlock() is implemented
using pv_queued_spin_unlock() which is entirely inline asm based. As
such, we do not receive any KCSAN barrier instrumentation via regular
atomic operations.

Add the missing KCSAN barrier instrumentation for the
CONFIG_PARAVIRT_SPINLOCKS case.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/include/asm/qspinlock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/qspinlock.h b/arch/x86/include/asm/qspinlock.h
index d86ab942219c..d87451df480b 100644
--- a/arch/x86/include/asm/qspinlock.h
+++ b/arch/x86/include/asm/qspinlock.h
@@ -53,6 +53,7 @@ static inline void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 
 static inline void queued_spin_unlock(struct qspinlock *lock)
 {
+	kcsan_release();
 	pv_queued_spin_unlock(lock);
 }
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

