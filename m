Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E205A16F0
	for <lists+linux-doc@lfdr.de>; Thu, 25 Aug 2022 18:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243293AbiHYQo1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Aug 2022 12:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243069AbiHYQnq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 12:43:46 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC72BA9F4
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:42:56 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id o4so920807pjp.4
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=T5Xd8mmYM32aYWsV+JS4zJF3yib8jGf3ov52iW7dkys=;
        b=a247I2rc5JAOD5ORKb3punvZ2pFvBSqM3A39uthrzLajeyXc85gOrdcNy3BgNnqo8B
         nUbn0XfHwV6+uojKSFxqqzA5v8Mj4NtnMzq//ATHO0+HsXT8XuREqfHrEeJaFvVAuRXI
         SABXuO68ZnK0GrKNBamHmmW/ybwjCsXas/hkcvr+sOts7EtnEuJSucGoxilYjU28MitS
         cHtoAX7xT5ZaltNlcjhiWBgM3fp0ShLjMTvh6695T22SaarIZaqTq9s9kSM5IdCcQqtO
         eTtx+b2QxFmXP8+m/6F+KizCCfjy/eGiZeJHzGtiBokhXtpmqJdxzwHGH8OcAf06lwzR
         eRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=T5Xd8mmYM32aYWsV+JS4zJF3yib8jGf3ov52iW7dkys=;
        b=dZ6Tg8UersD5OQgSljGfXsJ6lChV0+7jrx+vUqXIVovA30h7qKDDu6a7sx3WtjeVsH
         Bwpnzdeayl4/n98D6BXaKDJzQEy3OirbtRCOX09+dw0DoVOjY87OvBZQMyjXiGKEAnBF
         UX4cvC1YEtZwm71YPwcV5rIRs+mVYlpj0pbIKRR46SegRnbOABKeVJuMdKDWhy+/6YCp
         Tyax8QIR8yXDRJm9VvCuTk9swK6XFkRPb76/SGCPRHv0I4TRCEcpWqxJ15PliwxsjKId
         p8wSJ8UbXH9sgzVyMDUWslx8MGoZmVPv+h1R0W5nQmbEMdIuQGxUJ0iZUZ1JaN+ZKWy9
         ztCg==
X-Gm-Message-State: ACgBeo2oIVcx3ke5cuWTbpfRA2eUBXBv802iAF2Zs1uJXn25Xuvb/BYo
        L6Sihd0hwsUvZu5waoq4WW4wewWyaR1jeg==
X-Google-Smtp-Source: AA6agR6PtZRPH8DOa+cYNqYMkQRMGalD5fCgQzcKEGsbin0/QYLIG4ZScAZFg7GTIkLOKuSSHA5UFQ==
X-Received: by 2002:a17:903:234f:b0:16f:18a6:451a with SMTP id c15-20020a170903234f00b0016f18a6451amr4528142plh.82.1661445776366;
        Thu, 25 Aug 2022 09:42:56 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id b18-20020a62a112000000b005362314bf80sm12779408pff.67.2022.08.25.09.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:42:55 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com,
        surenb@google.com
Cc:     mingo@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v4 04/10] sched/psi: move private helpers to sched/stats.h
Date:   Fri, 26 Aug 2022 00:41:05 +0800
Message-Id: <20220825164111.29534-5-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825164111.29534-1-zhouchengming@bytedance.com>
References: <20220825164111.29534-1-zhouchengming@bytedance.com>
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

