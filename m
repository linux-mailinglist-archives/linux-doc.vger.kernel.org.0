Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2635B23F1B6
	for <lists+linux-doc@lfdr.de>; Fri,  7 Aug 2020 19:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgHGRI1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Aug 2020 13:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgHGRHb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 13:07:31 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ABDC061A2A
        for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2020 10:07:31 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id b25so1802301qto.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2020 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DWbloqsrP0AQsrj6SmmxzbX/ZWsrIvuOIBVWCascTtc=;
        b=Q/KGFW4zhhUvta6vR2CwSlNmcirLLQgN1UHKs1PAFMVRyM5AmvjqxtwQuc7zhSovGO
         ly9olFSHeHS0YAa+ZOraTOjnV5sE16p3X03nyz5uOiIugMnTcjuCsf9fkLhGjwlnByxU
         WJ4Zmlf/GRbSE4zEj22vV00mE/cMixdWHS0Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DWbloqsrP0AQsrj6SmmxzbX/ZWsrIvuOIBVWCascTtc=;
        b=JbVlD0Z9UzPqCyDmEoltoyH1Wjlay5z8JaQpq9mw7OeFM3VRGqUaETZ1o/fj+V4Cma
         0w85gpeVDsh0n2gyDTpSoNB0ktH24GkRrc6x1cG30Enkm9bN8sSxJwyR9h5SNFrIlCgP
         rNUhPgaWa+XVRlzSvW23xoT6Z/F9lAMjOLE7jSpNNyCdbo9K3ZF+Xbme431lpKR5CEqY
         /F3T5bEuSRpBf8tmgHKTyK8WrcZcojmLCkemX2Zu0NB7LNjaIGf7E6v7Uei7Q9F//MRF
         pqtsjomtYWSegc27rLWbVfiqCSzKfKX9001ZG+sL7FB1cLlGRNwdbqpkH5zZRae76SqR
         ga9g==
X-Gm-Message-State: AOAM530JtXy1NRxJff7vffQUsRVT9k2pD9uU1vozuRLnrLuVD0fJCirj
        pN9jKDr6uISWBJL9KDexoNb9Nw==
X-Google-Smtp-Source: ABdhPJx3f6sCntEP3jmyqzNa+3yifVW0H++FgQSlZMWDjMxxvQUVR4wb+sfKmy+A4/cj+TLqN0mOkQ==
X-Received: by 2002:ac8:45c3:: with SMTP id e3mr5903192qto.149.1596820050230;
        Fri, 07 Aug 2020 10:07:30 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:cad3:ffff:feb3:bd59])
        by smtp.gmail.com with ESMTPSA id w18sm8559905qtk.1.2020.08.07.10.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 10:07:29 -0700 (PDT)
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
Subject: [PATCH v4 2/5] rcu/tree: Clarify comments about FQS loop reporting quiescent states
Date:   Fri,  7 Aug 2020 13:07:19 -0400
Message-Id: <20200807170722.2897328-3-joel@joelfernandes.org>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
In-Reply-To: <20200807170722.2897328-1-joel@joelfernandes.org>
References: <20200807170722.2897328-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

At least since v4.19, the FQS loop no longer reports quiescent states
for offline CPUs unless it is an emergency.

This commit therefore fixes the comment in rcu_gp_init() to match the
current code.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 kernel/rcu/tree.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index a49fa3b60faa..2fb66cdbfa25 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -1701,9 +1701,11 @@ static bool rcu_gp_init(void)
 
 	/*
 	 * Apply per-leaf buffered online and offline operations to the
-	 * rcu_node tree.  Note that this new grace period need not wait
-	 * for subsequent online CPUs, and that quiescent-state forcing
-	 * will handle subsequent offline CPUs.
+	 * rcu_node tree. Note that this new grace period need not wait for
+	 * subsequent online CPUs, and that RCU hooks in the CPU offlining
+	 * path, when combined with checks in this function, will handle CPUs
+	 * that are currently going offline or that go offline later. Refer to
+	 * RCU's Requirements documentation about hotplug requirements as well.
 	 */
 	rcu_state.gp_state = RCU_GP_ONOFF;
 	rcu_for_each_leaf_node(rnp) {
-- 
2.28.0.236.gb10cc79966-goog

