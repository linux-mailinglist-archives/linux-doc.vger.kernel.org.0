Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098A323F1B1
	for <lists+linux-doc@lfdr.de>; Fri,  7 Aug 2020 19:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHGRIP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Aug 2020 13:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbgHGRHu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 13:07:50 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631C7C061D73
        for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2020 10:07:34 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id x12so1807832qtp.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2020 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r/kgVzAykl5yGnJA2GIl6acqSPrU9q7mp174snysesk=;
        b=wXfzHbu+Q0Ah3V/z4NLs6+FKnKMptcw04eJgCWIYFED1/z/Ph9Ow8uHQ4P0cBdv47P
         ZcU0rMPMlQkFOleTqPHawzaA1I7aH7QVeEs020BX+4THmB2Ehfg++kaXysKXhC/m1m+a
         +ags24NlB5PWImrQVaJpjxSpxujkCoOslN7aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r/kgVzAykl5yGnJA2GIl6acqSPrU9q7mp174snysesk=;
        b=K1ZAY+qbPYjfuqLRRXMk0CPcPV3/Yn4uCGWS29zcjWJEcqpTBFD0FbaSRwMdQIsGsT
         AlJVs09CDirAArz2rNdFv8/iQ5TVRZwKYkNzyRoO+2laDNHKbS6HzEHQZefEob8suMKZ
         it5oBQkh9odSPM1dmLUFobG3d+64gvozXNHbUnVNTXurU4ixlz9U+KDqVhGbGvNDRJki
         xtnTsdkAQzJzCvqTYGg4kd40h8CJ2n0R2T5/brZjfNCYbOlhRrEKCmNCRDFuzQNJK+VS
         Wv6F5sGx1WaHDEjVULz7PyojDiKJKzr8aDS1u+9cCMQnLHxW6k7/jc17XfMEMavv95qf
         FHwQ==
X-Gm-Message-State: AOAM531JCx7/FSjF1pzv5isGBxA2jv6fJbWFM3ZmiI5YTiVlCs97DcyI
        e2TaeptyNUm4BLCH/nDsr2NFKA==
X-Google-Smtp-Source: ABdhPJyzKNEU/rzdXH8SQ/psjR5f8EygH9d2SBiUtl9q75xiwk3I/MC3+YKzg9vILQLmLP7VtGU2TQ==
X-Received: by 2002:ac8:4719:: with SMTP id f25mr15357892qtp.291.1596820053592;
        Fri, 07 Aug 2020 10:07:33 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:cad3:ffff:feb3:bd59])
        by smtp.gmail.com with ESMTPSA id w18sm8559905qtk.1.2020.08.07.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 10:07:33 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        neeraju@codeaurora.org, "Paul E. McKenney" <paulmck@kernel.org>,
        peterz@infradead.org, Randy Dunlap <rdunlap@infradead.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        tglx@linutronix.de, vineethrp@gmail.com
Subject: [PATCH v4 5/5] docs: Update RCU's hotplug requirements with a bit about design
Date:   Fri,  7 Aug 2020 13:07:22 -0400
Message-Id: <20200807170722.2897328-6-joel@joelfernandes.org>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
In-Reply-To: <20200807170722.2897328-1-joel@joelfernandes.org>
References: <20200807170722.2897328-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RCU's hotplug design will help understand the requirements an RCU
implementation needs to fullfill, such as dead-lock avoidance.

The rcu_barrier() section of the "Hotplug CPU" section already talks
about deadlocks, however the description of what else can deadlock other
than rcu_barrier is rather incomplete.

This commit therefore continues the section by describing how RCU's
design handles CPU hotplug in a deadlock-free way.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../RCU/Design/Requirements/Requirements.rst  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 16c64a2eff93..0a4148b9f743 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1940,6 +1940,28 @@ deadlock. Furthermore, ``rcu_barrier()`` blocks CPU-hotplug operations
 during its execution, which results in another type of deadlock when
 invoked from a CPU-hotplug notifier.
 
+Also, RCU's implementation avoids serious deadlocks which could occur due to
+interaction between hotplug, timers and grace period processing. It does so by
+maintaining its own bookkeeping of every CPU's hotplug state, independent of
+the various CPU masks and by reporting quiescent states at explicit points.  It
+may come across as a surprise, but the force quiescent state loop (FQS) does
+not report quiescent states for offline CPUs and is not required to.
+
+For an offline CPU, the quiescent state will be reported in either of:
+1. During CPU offlining, using RCU's hotplug notifier (``rcu_report_dead()``).
+2. During grace period initialization (``rcu_gp_init``) if it detected a race
+   with CPU offlining, or a race with a task unblocking on a node which
+   previously had all of its CPUs offlined.
+
+The CPU onlining path (``rcu_cpu_starting``) does not need to a report
+quiescent state for an offline CPU in fact it would trigger a warning if a
+quiescent state was not already reported for that CPU.
+
+During the checking/modification of RCU's hotplug bookkeeping, the
+corresponding CPU's leaf node lock is held. This avoids race conditions between
+RCU's hotplug notifier hooks, grace period initialization code and the FQS loop
+which can concurrently refer to or modify the bookkeeping.
+
 Scheduler and RCU
 ~~~~~~~~~~~~~~~~~
 
-- 
2.28.0.236.gb10cc79966-goog

