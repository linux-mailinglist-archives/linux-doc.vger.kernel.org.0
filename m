Return-Path: <linux-doc+bounces-3598-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AB7FF069
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 14:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DE5D1C20AB6
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 13:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF4747A45;
	Thu, 30 Nov 2023 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26F8619F;
	Thu, 30 Nov 2023 05:42:46 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ABAE143D;
	Thu, 30 Nov 2023 05:43:32 -0800 (PST)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 608C93F5A1;
	Thu, 30 Nov 2023 05:42:43 -0800 (PST)
Message-ID: <b5d83fcd-09fb-4680-a594-d4848fddc50a@arm.com>
Date: Thu, 30 Nov 2023 14:42:43 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Simplify util_est
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
 vschneid@redhat.com, corbet@lwn.net, alexs@kernel.org,
 siyanteng@loongson.cn, qyousef@layalina.io, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: lukasz.luba@arm.com, hongyan.xia2@arm.com
References: <20231127143238.1216582-1-vincent.guittot@linaro.org>
 <20231127143238.1216582-3-vincent.guittot@linaro.org>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20231127143238.1216582-3-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 15:32, Vincent Guittot wrote:
> With UTIL_EST_FASTUP now being permanent, we can take advantage of the
> fact that the ewma jumps directly to a higher utilization at dequeue to
> simplify util_est and remove the enqueued field.
> 

Did some simple test with a ramp-up/ramp_down (10-80-10%) task affine to
a CPU.

https://nbviewer.org/github/deggeman/lisa/blob/ipynbs/ipynb/scratchpad/util_est_fastup.ipynb

LGTM.

[...]

> @@ -4879,27 +4865,22 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
>  	 * Skip update of task's estimated utilization when its members are
>  	 * already ~1% close to its last activation value.
>  	 */
> -	last_ewma_diff = ue.enqueued - ue.ewma;
> -	last_enqueued_diff -= ue.enqueued;
> -	if (within_margin(last_ewma_diff, UTIL_EST_MARGIN)) {
> -		if (!within_margin(last_enqueued_diff, UTIL_EST_MARGIN))
> -			goto done;
> -
> -		return;
> -	}
> +	last_ewma_diff = ewma - dequeued;
> +	if (last_ewma_diff < UTIL_EST_MARGIN)
> +		goto done;
>  
>  	/*
>  	 * To avoid overestimation of actual task utilization, skip updates if
>  	 * we cannot grant there is idle time in this CPU.
>  	 */
> -	if (task_util(p) > arch_scale_cpu_capacity(cpu_of(rq_of(cfs_rq))))
> +	if (dequeued > arch_scale_cpu_capacity(cpu_of(rq_of(cfs_rq))))
>  		return;

Not directly related to the changes: Should we not use `goto done` here
is well to rearm UTIL_AVG_UNCHANGED?

>  	/*
>  	 * To avoid underestimate of task utilization, skip updates of EWMA if
>  	 * we cannot grant that thread got all CPU time it wanted.
>  	 */
> -	if ((ue.enqueued + UTIL_EST_MARGIN) < task_runnable(p))
> +	if ((dequeued + UTIL_EST_MARGIN) < task_runnable(p))
>  		goto done;
>  
>  
> @@ -4914,18 +4895,18 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
>  	 *  ewma(t) = w *  task_util(p) + (1-w) * ewma(t-1)
>  	 *          = w *  task_util(p) +         ewma(t-1)  - w * ewma(t-1)
>  	 *          = w * (task_util(p) -         ewma(t-1)) +     ewma(t-1)
> -	 *          = w * (      last_ewma_diff            ) +     ewma(t-1)
> -	 *          = w * (last_ewma_diff  +  ewma(t-1) / w)
> +	 *          = w * (      -last_ewma_diff           ) +     ewma(t-1)
> +	 *          = w * (-last_ewma_diff +  ewma(t-1) / w)
>  	 *
>  	 * Where 'w' is the weight of new samples, which is configured to be
>  	 * 0.25, thus making w=1/4 ( >>= UTIL_EST_WEIGHT_SHIFT)
>  	 */

The text above still mentioned ue.enqueued and that we store the current
PELT value ... which isn't the case anymore.


> -	ue.ewma <<= UTIL_EST_WEIGHT_SHIFT;
> -	ue.ewma  += last_ewma_diff;
> -	ue.ewma >>= UTIL_EST_WEIGHT_SHIFT;
> +	ewma <<= UTIL_EST_WEIGHT_SHIFT;
> +	ewma  -= last_ewma_diff;
> +	ewma >>= UTIL_EST_WEIGHT_SHIFT;
>  done:
> -	ue.enqueued |= UTIL_AVG_UNCHANGED;
> -	WRITE_ONCE(p->se.avg.util_est, ue);
> +	ewma |= UTIL_AVG_UNCHANGED;
> +	WRITE_ONCE(p->se.avg.util_est, ewma);
>  
>  	trace_sched_util_est_se_tp(&p->se);
>  }

[...]

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

