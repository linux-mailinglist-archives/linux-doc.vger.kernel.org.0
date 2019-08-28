Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01E3EA0448
	for <lists+linux-doc@lfdr.de>; Wed, 28 Aug 2019 16:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfH1OKA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Aug 2019 10:10:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34502 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfH1OKA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Aug 2019 10:10:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id b24so1828509pfp.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Aug 2019 07:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZRhNAxweazD8NBV7eTpA6CYJ/gd+z7Ql9WdGyX+FwE=;
        b=GBbT5UQ7j3ObgzNNU7cgMooQCCCx3dRxBHnZqv1rFtHUA2POQnoDDQsvAbZyCl/cwf
         SJVF1fxU7Fh/6Jci262clcMHzRVM+GP2ao39pPIEJrIcw/mDLPyMyRd4+66KT2/3A9Sy
         PRos7CgZ5HzSpKREFBlGsJooDNCVvYNec7KlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZRhNAxweazD8NBV7eTpA6CYJ/gd+z7Ql9WdGyX+FwE=;
        b=S1Wg2pqdKMywoirqXtM3/MofAQuLtS/IQwaPJFQrUhXXeAPT9S1OM1Y9eyekNFWc5g
         JjRjAezHIClRUxM3z+0pAKtoDpXlhyjPUwfC7n4nNmnuoHXHb9rtYZUbKyOa00DxvE/g
         m5SaVLjtQfExa/hLO6LUmOd0DoVgzW4o4+k4MWy0369KtdE53a4JRq3hRkOwRMZhVgIp
         Yu0jMWwoKnOi1bFlMacbTSrB/3Qi4ghvf6m3M8NVQKOHMV87oPDN6g9glBwCZUemD+q9
         +IujLADXUCWfQK/VNqYOz0VcrWN1kHqmxxmO7Q2zhMZ0LIbN0NXUT9t1JpDKlInNG4C/
         zbXA==
X-Gm-Message-State: APjAAAUuduAbq/mSZHh0U2zuSLPyDGhwEpdOYcg0eRY748njpA9hvtiy
        XTeEkXtplmia47mSkdqzjNcY5g==
X-Google-Smtp-Source: APXvYqzvdFe17PVHbUCFnJwUB7HFOOAdpLphkVC6hDocrD+EALSi3m1Fl5NCIiZY36dfgBic1u3gug==
X-Received: by 2002:a17:90a:326e:: with SMTP id k101mr4660392pjb.15.1567001399024;
        Wed, 28 Aug 2019 07:09:59 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id w2sm4550209pjr.27.2019.08.28.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 07:09:58 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Paul E . McKenney" <paulmck@linux.ibm.com>,
        byungchul.park@lge.com, Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        kernel-team@android.com
Subject: [PATCH v2] rcu/tree: Add multiple in-flight batches of kfree_rcu work
Date:   Wed, 28 Aug 2019 10:09:52 -0400
Message-Id: <20190828140952.258739-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <5d657e35.1c69fb81.54250.01de@mx.google.com>
References: <5d657e35.1c69fb81.54250.01de@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

During testing, it was observed that amount of memory consumed due
kfree_rcu() batching is 300-400MB. Previously we had only a single
head_free pointer pointing to the list of rcu_head(s) that are to be
freed after a grace period. Until this list is drained, we cannot queue
any more objects on it since such objects may not be ready to be
reclaimed when the worker thread eventually gets to drainin g the
head_free list.

We can do better by maintaining multiple lists as done by this patch.
Testing shows that memory consumption came down by around 100-150MB with
just adding another list. Adding more than 1 additional list did not
show any improvement.

Suggested-by: Paul E. McKenney <paulmck@linux.ibm.com>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 kernel/rcu/tree.c | 61 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 4f7c3096d786..5bf8f7e793ea 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -2688,28 +2688,37 @@ EXPORT_SYMBOL_GPL(call_rcu);
 
 /* Maximum number of jiffies to wait before draining a batch. */
 #define KFREE_DRAIN_JIFFIES (HZ / 50)
+#define KFREE_N_BATCHES 2
+
+struct kfree_rcu_work {
+	/* The rcu_work node for queuing work with queue_rcu_work(). The work
+	 * is done after a grace period.
+	 */
+	struct rcu_work rcu_work;
+
+	/* The list of objects that have now left ->head and are queued for
+	 * freeing after a grace period.
+	 */
+	struct rcu_head *head_free;
+
+	struct kfree_rcu_cpu *krcp;
+};
 
 /*
  * Maximum number of kfree(s) to batch, if this limit is hit then the batch of
  * kfree(s) is queued for freeing after a grace period, right away.
  */
 struct kfree_rcu_cpu {
-	/* The rcu_work node for queuing work with queue_rcu_work(). The work
-	 * is done after a grace period.
-	 */
-	struct rcu_work rcu_work;
 
 	/* The list of objects being queued in a batch but are not yet
 	 * scheduled to be freed.
 	 */
 	struct rcu_head *head;
 
-	/* The list of objects that have now left ->head and are queued for
-	 * freeing after a grace period.
-	 */
-	struct rcu_head *head_free;
+	/* Pointer to the per-cpu array of kfree_rcu_work structures */
+	struct kfree_rcu_work krw_arr[KFREE_N_BATCHES];
 
-	/* Protect concurrent access to this structure. */
+	/* Protect concurrent access to this structure and kfree_rcu_work. */
 	spinlock_t lock;
 
 	/* The delayed work that flushes ->head to ->head_free incase ->head
@@ -2730,12 +2739,14 @@ static void kfree_rcu_work(struct work_struct *work)
 {
 	unsigned long flags;
 	struct rcu_head *head, *next;
-	struct kfree_rcu_cpu *krcp = container_of(to_rcu_work(work),
-					struct kfree_rcu_cpu, rcu_work);
+	struct kfree_rcu_work *krwp = container_of(to_rcu_work(work),
+					struct kfree_rcu_work, rcu_work);
+	struct kfree_rcu_cpu *krcp;
+
+	krcp = krwp->krcp;
 
 	spin_lock_irqsave(&krcp->lock, flags);
-	head = krcp->head_free;
-	krcp->head_free = NULL;
+	head = xchg(&krwp->head_free, NULL);
 	spin_unlock_irqrestore(&krcp->lock, flags);
 
 	/*
@@ -2758,19 +2769,28 @@ static void kfree_rcu_work(struct work_struct *work)
  */
 static inline bool queue_kfree_rcu_work(struct kfree_rcu_cpu *krcp)
 {
+	int i = 0;
+	struct kfree_rcu_work *krwp = NULL;
+
 	lockdep_assert_held(&krcp->lock);
+	while (i < KFREE_N_BATCHES) {
+		if (!krcp->krw_arr[i].head_free) {
+			krwp = &(krcp->krw_arr[i]);
+			break;
+		}
+		i++;
+	}
 
-	/* If a previous RCU batch work is already in progress, we cannot queue
+	/* If both RCU batches are already in progress, we cannot queue
 	 * another one, just refuse the optimization and it will be retried
 	 * again in KFREE_DRAIN_JIFFIES time.
 	 */
-	if (krcp->head_free)
+	if (!krwp)
 		return false;
 
-	krcp->head_free = krcp->head;
-	krcp->head = NULL;
-	INIT_RCU_WORK(&krcp->rcu_work, kfree_rcu_work);
-	queue_rcu_work(system_wq, &krcp->rcu_work);
+	krwp->head_free = xchg(&krcp->head, NULL);
+	INIT_RCU_WORK(&krwp->rcu_work, kfree_rcu_work);
+	queue_rcu_work(system_wq, &krwp->rcu_work);
 
 	return true;
 }
@@ -3736,8 +3756,11 @@ static void __init kfree_rcu_batch_init(void)
 
 	for_each_possible_cpu(cpu) {
 		struct kfree_rcu_cpu *krcp = per_cpu_ptr(&krc, cpu);
+		int i = KFREE_N_BATCHES;
 
 		spin_lock_init(&krcp->lock);
+		while (i--)
+			krcp->krw_arr[i].krcp = krcp;
 		INIT_DELAYED_WORK(&krcp->monitor_work, kfree_rcu_monitor);
 	}
 }
-- 
2.23.0.187.g17f5b7556c-goog

