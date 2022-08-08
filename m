Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DAC58C721
	for <lists+linux-doc@lfdr.de>; Mon,  8 Aug 2022 13:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242657AbiHHLEx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Aug 2022 07:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242670AbiHHLEp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 07:04:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B2E140F1
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 04:04:44 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id f192so7768587pfa.9
        for <linux-doc@vger.kernel.org>; Mon, 08 Aug 2022 04:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MhJX1xAuM+Dg2Au0JlwK8MVyZU4paj2H+YmQz1widm8=;
        b=ro7oTcXZNHFFdtiUu9akcDqIYcDZ2EV9Uc3qPLMtS5Nl3RGs9c/V+BXWCTw5CB33NH
         p8t5GdSJp+fWDaviDxFY1DCL23G1RudgkuGLQ9R8ib5w0nGwEVV3GtmqLlU6sCPtpXLD
         CWp/kZSPIXAA1zSVquXQAk9Ffs6pBsUXl5xlaRjfGXPyTgF/0i1fB4/TdwsnAdug2d9H
         H2iAB3R435PO5U8v7vj7FBU2C5HMp/HjttoeT+EnfkpwVTD2sF+4y2pcqjXi+MId6YjK
         gJDxMbw+Tz69NYobCSvgE+kxSVvJG/pLk6HmoX19v7yq18h4rKwXA87JUA9X1QNlPeqf
         jcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MhJX1xAuM+Dg2Au0JlwK8MVyZU4paj2H+YmQz1widm8=;
        b=mpqHQFhnNe7f8Dh4XpPu3ANAtwSMTb83iSA8Jg1YNxqCbTxKjtqQtgxhMuHKwF1Hk9
         5EuJWvKaWdrwxx26jIE8Mt/y3uNKCOumnulQOIX45TF6zElgru4DUwVWV0aiwoB0QXAX
         tmaoem/MjQsH7wDBlpDsN6jz8Z0MhRJR74NxXEGPuZTNbsyMCiT4u4lVy6HzCAUVHP/j
         JsRIPPQkEiddG+ZulM8LbWmGhhBCXakTa1SunMaVIFi8ZwjBqMhSmlYgu2maBRrgrvWl
         9y2O0EMtJNkh7V39ZSmmtjwgv3k5Pz6O6h6mbjEsq4d5YTd7iB2YdKJxEZJk45cyWdMf
         M38g==
X-Gm-Message-State: ACgBeo0OCSq/eyXA1m0ZRS7y1K/6UKvRsyjp7amrCqX1+iRbEqvBeyfO
        PPgoiqK1AYkW/nvPzp8yD0Pbig==
X-Google-Smtp-Source: AA6agR6zOoa6zw+DxLk4NcZHGKOcPeCvD1IUEebpqeEKHDlFsobWhZCcZq3C/2tRNmbBV67Pgx5ZOQ==
X-Received: by 2002:a65:6556:0:b0:41c:9c36:98fa with SMTP id a22-20020a656556000000b0041c9c3698famr15358773pgw.491.1659956683658;
        Mon, 08 Aug 2022 04:04:43 -0700 (PDT)
Received: from C02CV1DAMD6P.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id o12-20020aa7978c000000b0052dbad1ea2esm8393180pfp.6.2022.08.08.04.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 04:04:43 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, tj@kernel.org, corbet@lwn.net,
        surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com
Cc:     cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v2 03/10] sched/psi: move private helpers to sched/stats.h
Date:   Mon,  8 Aug 2022 19:03:34 +0800
Message-Id: <20220808110341.15799-4-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220808110341.15799-1-zhouchengming@bytedance.com>
References: <20220808110341.15799-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch move psi_task_change/psi_task_switch declarations out of
PSI public header, since they are only needed for implementing the
PSI stats tracking in sched/stats.h

psi_task_switch is obvious, psi_task_change can't be public helper
since it doesn't check psi_disabled static key. And there is no
any user now, so put it in sched/stats.h too.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 include/linux/psi.h  | 4 ----
 kernel/sched/stats.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/psi.h b/include/linux/psi.h
index 89784763d19e..aa168a038242 100644
--- a/include/linux/psi.h
+++ b/include/linux/psi.h
@@ -18,10 +18,6 @@ extern struct psi_group psi_system;
 
 void psi_init(void);
 
-void psi_task_change(struct task_struct *task, int clear, int set);
-void psi_task_switch(struct task_struct *prev, struct task_struct *next,
-		     bool sleep);
-
 void psi_memstall_enter(unsigned long *flags);
 void psi_memstall_leave(unsigned long *flags);
 
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index baa839c1ba96..c39b467ece43 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -107,6 +107,10 @@ __schedstats_from_se(struct sched_entity *se)
 }
 
 #ifdef CONFIG_PSI
+void psi_task_change(struct task_struct *task, int clear, int set);
+void psi_task_switch(struct task_struct *prev, struct task_struct *next,
+		     bool sleep);
+
 /*
  * PSI tracks state that persists across sleeps, such as iowaits and
  * memory stalls. As a result, it has to distinguish between sleeps,
-- 
2.36.1

