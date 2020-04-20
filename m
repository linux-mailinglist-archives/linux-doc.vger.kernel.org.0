Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C8D1B046A
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2020 10:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgDTI34 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Apr 2020 04:29:56 -0400
Received: from foss.arm.com ([217.140.110.172]:45042 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgDTI34 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Apr 2020 04:29:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C7030E;
        Mon, 20 Apr 2020 01:29:55 -0700 (PDT)
Received: from [192.168.0.7] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BA1A3F6CF;
        Mon, 20 Apr 2020 01:29:48 -0700 (PDT)
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH 1/2] sched/uclamp: Add a new sysctl to control RT default
 boost value
To:     Qais Yousef <qais.yousef@arm.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Quentin Perret <qperret@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Patrick Bellasi <patrick.bellasi@matbug.net>,
        Pavan Kondeti <pkondeti@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
References: <20200403123020.13897-1-qais.yousef@arm.com>
Message-ID: <292dbd54-e590-dc4f-41e6-5f86e478c0ee@arm.com>
Date:   Mon, 20 Apr 2020 10:29:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200403123020.13897-1-qais.yousef@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03.04.20 14:30, Qais Yousef wrote:

[...]

> @@ -924,6 +945,14 @@ uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
>  	return uc_req;
>  }
>  
> +static void uclamp_rt_sync_default_util_min(struct task_struct *p)
> +{
> +	struct uclamp_se *uc_se = &p->uclamp_req[UCLAMP_MIN];
> +
> +	if (!uc_se->user_defined)
> +		uclamp_se_set(uc_se, sysctl_sched_rt_default_uclamp_util_min, false);
> +}
> +
>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>  {
>  	struct uclamp_se uc_eff;
> @@ -1030,6 +1059,12 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
>  	if (unlikely(!p->sched_class->uclamp_enabled))
>  		return;
>  
> +	/*
> +	 * When sysctl_sched_rt_default_uclamp_util_min value is changed by the
> +	 * user, we apply any new value on the next wakeup, which is here.
> +	 */
> +	uclamp_rt_sync_default_util_min(p);
> +

Does this have to be an extra function? Can we not reuse
uclamp_tg_restrict() by slightly rename it to uclamp_restrict()?

This function will then deal with enforcing restrictions, whether system
and taskgroup hierarchy related or default value (latter only for rt-min
right now since the others are fixed) related.

uclamp_eff_get() -> uclamp_restrict() is called from:

  'enqueue_task(), uclamp_update_active() -> uclamp_rq_inc() -> uclamp_rq_inc_id()' and

  'task_fits_capacity() -> clamp_task_util(), rt_task_fits_capacity() -> uclamp_eff_value()' and

  'schedutil_cpu_util(), find_energy_efficient_cpu() -> uclamp_rq_util_with() -> uclamp_eff_value()'

so there would be more check-points than the one in 'enqueue_task() -> uclamp_rq_inc()' now.

Only lightly tested:

---8<---

From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Date: Sun, 19 Apr 2020 01:20:17 +0200
Subject: [PATCH] sched/core: uclamp: Move uclamp_rt_sync_default_util_min()
 into uclamp_tg_restrict()

Signed-off-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 kernel/sched/core.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 8f4e0d5c7daf..6802113d6d4b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -899,12 +899,22 @@ unsigned int uclamp_rq_max_value(struct rq *rq, enum uclamp_id clamp_id,
 }
 
 static inline struct uclamp_se
-uclamp_tg_restrict(struct task_struct *p, enum uclamp_id clamp_id)
+uclamp_restrict(struct task_struct *p, enum uclamp_id clamp_id)
 {
-	struct uclamp_se uc_req = p->uclamp_req[clamp_id];
-#ifdef CONFIG_UCLAMP_TASK_GROUP
-	struct uclamp_se uc_max;
+	struct uclamp_se uc_req, __maybe_unused uc_max;
+
+	if (unlikely(rt_task(p)) && clamp_id == UCLAMP_MIN &&
+	    !uc_req.user_defined) {
+		struct uclamp_se *uc_se = &p->uclamp_req[UCLAMP_MIN];
+		int rt_min = sysctl_sched_rt_default_uclamp_util_min;
+
+		if (uc_se->value != rt_min)
+			uclamp_se_set(uc_se, rt_min, false);
+	}
 
+	uc_req = p->uclamp_req[clamp_id];
+
+#ifdef CONFIG_UCLAMP_TASK_GROUP
 	/*
 	 * Tasks in autogroups or root task group will be
 	 * restricted by system defaults.
@@ -933,7 +943,7 @@ uclamp_tg_restrict(struct task_struct *p, enum uclamp_id clamp_id)
 static inline struct uclamp_se
 uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
 {
-	struct uclamp_se uc_req = uclamp_tg_restrict(p, clamp_id);
+	struct uclamp_se uc_req = uclamp_restrict(p, clamp_id);
 	struct uclamp_se uc_max = uclamp_default[clamp_id];
 
 	/* System default restrictions always apply */
@@ -943,14 +953,6 @@ uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
 	return uc_req;
 }
 
-static void uclamp_rt_sync_default_util_min(struct task_struct *p)
-{
-	struct uclamp_se *uc_se = &p->uclamp_req[UCLAMP_MIN];
-
-	if (!uc_se->user_defined)
-		uclamp_se_set(uc_se, sysctl_sched_rt_default_uclamp_util_min, false);
-}
-
 unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
 {
 	struct uclamp_se uc_eff;
@@ -1057,12 +1059,6 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p)
 	if (unlikely(!p->sched_class->uclamp_enabled))
 		return;
 
-	/*
-	 * When sysctl_sched_rt_default_uclamp_util_min value is changed by the
-	 * user, we apply any new value on the next wakeup, which is here.
-	 */
-	uclamp_rt_sync_default_util_min(p);
-
 	for_each_clamp_id(clamp_id)
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
-- 
2.17.1
