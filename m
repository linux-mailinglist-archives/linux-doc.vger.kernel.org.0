Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B4659F4F4
	for <lists+linux-doc@lfdr.de>; Wed, 24 Aug 2022 10:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbiHXIUK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Aug 2022 04:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbiHXIUE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 04:20:04 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AC185AB8
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 01:20:03 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p13so3661821pld.6
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=T5Xd8mmYM32aYWsV+JS4zJF3yib8jGf3ov52iW7dkys=;
        b=2hbOVKhOIJMdq+ESAqgtn9qO5FOZb7JuoMEFLh7q/VunkkOu9QAT5ULHRWLNGQHUmN
         f+BAdie4GiPCPkFWX4K1h+kjjefd+BKv3QZwl+MX/Wi+1tUdoLPaG1DFS88O0FQD8OIe
         MuLXlFlHpQY7LCq6GjLVtMo1aGQRwAoCaEiL9D1wC1vXIIQ6YXzfgWEfJeBvS+brm3jC
         o4YhJAJGyZ5PspBdTHCfEKsF2rRbqlBg6h4ajiQztHfDToeo84tMAeHwNtV8roDKp62a
         RDIJ5oLfbDn9L+m38KS0qIw2WwsB5HKK2qwtDhQAPv3bCGmDIJym1uNeXaJYeGGm1F/9
         J9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=T5Xd8mmYM32aYWsV+JS4zJF3yib8jGf3ov52iW7dkys=;
        b=2iVRwHrYTWhNpUUOGawipPg+qN6ACOvuQwEDP0+rO+sk3w57fkDVoeUSkM5tG33lTN
         jalwSdbCpguJdivS1ImYg/Tj7Ko6y6foL083cBr/v5Uz/Yq2AV38/hhq0NgmBMl0Okr3
         D5+Kld+svwWshqYZlK0jABJW3zl39uvF/qsmuBI+kAQRCBnR9X5GSQ9fMoOZjFt4o18E
         aJnrx4uUDM6hSlOEN4zElc3iwvXLuk4wDjDh0rNsD2PRzKoXt2DcMUe3xn/cb08vuA5L
         4+Fsb4h1+R0ajPXS2kBwYP5fQ6gD/lhUVAuUEGPzKtZ1Zx5ohju4UYbOm1rY0wjAXzlI
         D/9g==
X-Gm-Message-State: ACgBeo2dhhZINv3zqQBFaSh0s2t7R54GfO5CbcinukdPt2hFeMzsKDC2
        eyx9+FG9UMp0HGDYDeEF28t05g==
X-Google-Smtp-Source: AA6agR6mL/3prlPOQPzpJzCgrVHKgCOeio2wkX6dkk2PYa+ddmaiTrx7bTioyVdKpdoD66cL7Zx35Q==
X-Received: by 2002:a17:90a:c78f:b0:1fa:e505:18e6 with SMTP id gn15-20020a17090ac78f00b001fae50518e6mr7359010pjb.23.1661329203483;
        Wed, 24 Aug 2022 01:20:03 -0700 (PDT)
Received: from C02CV1DAMD6P.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id q31-20020a635c1f000000b00421841943dfsm10486587pgb.12.2022.08.24.01.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 01:20:03 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
        surenb@google.com
Cc:     gregkh@linuxfoundation.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v3 04/10] sched/psi: move private helpers to sched/stats.h
Date:   Wed, 24 Aug 2022 16:18:23 +0800
Message-Id: <20220824081829.33748-5-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220824081829.33748-1-zhouchengming@bytedance.com>
References: <20220824081829.33748-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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
index dd74411ac21d..fffd229fbf19 100644
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
2.37.2

