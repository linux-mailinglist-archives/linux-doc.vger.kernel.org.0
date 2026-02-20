Return-Path: <linux-doc+bounces-76443-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D49GE66mGktLgMAu9opvQ
	(envelope-from <linux-doc+bounces-76443-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 20:47:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B216A71A
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 20:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52F893009084
	for <lists+linux-doc@lfdr.de>; Fri, 20 Feb 2026 19:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03584283FE5;
	Fri, 20 Feb 2026 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QdpI8mdf"
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA529A9E9;
	Fri, 20 Feb 2026 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771616842; cv=none; b=HUIExEibtbzhTqv7ius2xqxa1mK5Qk/jU1BojWUhaKaifxtCIIC7quZncbQmz9y5dYHr6o8kr30rIgi22d75SNe/bU7iEXlfgEBX8+2Ode9xoWSB0YSfp1PcGaCCnChwDobYUHiOFYeuTfCqfGV0+ckoJ28orsZV7b0dGmqNj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771616842; c=relaxed/simple;
	bh=xznsLkUwqob3ofU6jicz6mX3+szH52mu6JsYaCeRo0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1STo8ITCrTDpVG4yA0f8kyKoGuXpicWuo0xYPkwVeQ78x7ebrixZp9BbCgxqR7qvHaS4FrmeVsU99SRB+fMoXRFL4OTIEQ4OjXElqcr0KHZGV0p9CN/mvowjwOBZ6z7gHsaX3R21F/J0VLidPN9gpSfBPr8NGWpkdtLpXRUrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QdpI8mdf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RFp+iA0Gi6Cw125cZ5KKv8hO4Zj8B2MbT1QnB0LwRVQ=; b=QdpI8mdfaDAsOmg3H9D9CGntfu
	WdSzTAvqqNcXqsBYOiuAiT5Jgj903PKIBLdnj5j63u5a2qPz3uoGuYKuOl8X2hjc2o7hWv0BKziyg
	shhB4oYL4qG5GXkksN/b+MpF8gQGA0rkaE5A07xDtrsokYKJZPok+4gXzadceDU87bFr4eSglq2ge
	o7UyILCEYKlEjTSiAmzDGZ2NMwLoQuctWnlCTn4beQmDykF/ZryPgkKIJWYVxCaxJXOndXry8hlXz
	xrVaDtJsKY6cAFikqImPrWJYlHlJztmaFzGcZPErg+3KpWseNhVk5+h80/0zes/FXBcajaUASz6hd
	YWJ9LXlA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWSy-00000002zzw-1PtH;
	Fri, 20 Feb 2026 19:47:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B0BC5300CDE; Fri, 20 Feb 2026 20:47:02 +0100 (CET)
Date: Fri, 20 Feb 2026 20:47:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Qais Yousef <qyousef@google.com>,
	Clark Williams <williams@redhat.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] sched/deadline: Implement reclaim/soft mode
 through SCHED_OTHER demotion
Message-ID: <20260220194702.GO1282955@noisy.programming.kicks-ass.net>
References: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
 <20260219-upstream-deadline-demotion-v1-1-528b96e53d12@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219-upstream-deadline-demotion-v1-1-528b96e53d12@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76443-lists,linux-doc=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[noisy.programming.kicks-ass.net:server fail,infradead.org:server fail,sto.lore.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E31B216A71A
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 02:37:34PM +0100, Juri Lelli wrote:
> Add support for demoting deadline tasks to SCHED_OTHER when they exhaust
> their runtime. This prevents starvation of lower priority tasks while still
> allowing deadline tasks to utilize available CPU bandwidth.
> 
> This feature resurrects and refines the bandwidth reclaiming concept
> from the original SCHED_DEADLINE development (circa 2010), focusing on a
> single demotion mode: SCHED_OTHER.

Yeah, that's good enough for most I suppose. Demotion to FIFO/RR is
'weird' anyway.

> @@ -1419,6 +1444,84 @@ s64 dl_scaled_delta_exec(struct rq *rq, struct sched_dl_entity *dl_se, s64 delta
>  	return scaled_delta_exec;
>  }
>  
> +/*
> + * Check if a deadline task can be demoted when it exhausts its runtime.
> + * dl-servers and boosted tasks cannot be demoted.
> + *
> + * Returns true if demotion should happen, false otherwise.
> + */
> +static inline bool dl_task_can_demote(struct sched_dl_entity *dl_se)
> +{
> +	if (dl_server(dl_se))
> +		return false;
> +
> +	if (is_dl_boosted(dl_se))
> +		return false;
> +
> +	return !!(dl_se->flags & SCHED_FLAG_DL_DEMOTION);

It is already implicitly cast to bool by virtue of the return value, no
need for that explicit !!.

> +}
> +
> +/*
> + * Promote a demoted task back to SCHED_DEADLINE.
> + * The task's runtime will be replenished by the caller.
> + */
> +static void dl_task_promote(struct rq *rq, struct task_struct *p)
> +{
> +	struct sched_dl_entity *dl_se = &p->dl;
> +	int queue_flags = DEQUEUE_MOVE | DEQUEUE_NOCLOCK | DEQUEUE_CLASS;
> +
> +	lockdep_assert_rq_held(rq);
> +
> +	if (dl_se->dl_demotion_state != DL_DEMOTED)
> +		return;
> +
> +	dl_se->dl_demotion_state = DL_PROMOTING;
> +
> +	scoped_guard (sched_change, p, queue_flags) {
> +		p->policy = SCHED_DEADLINE;
> +		p->sched_class = &dl_sched_class;
> +		p->prio = MAX_DL_PRIO - 1;
> +		p->normal_prio = p->prio;
> +	}
> +
> +	dl_se->dl_demotion_state = DL_NOT_DEMOTED;
> +
> +	__balance_callbacks(rq, NULL);
> +}
> +
> +/*
> + * Demote a deadline task to SCHED_OTHER when it exhausts its runtime.
> + * The task will be promoted back to SCHED_DEADLINE at replenish.
> + */
> +static void dl_task_demote(struct rq *rq, struct task_struct *p)
> +{
> +	struct sched_dl_entity *dl_se = &p->dl;
> +	int queue_flags = DEQUEUE_MOVE | DEQUEUE_NOCLOCK | DEQUEUE_CLASS;
> +
> +	lockdep_assert_rq_held(rq);
> +
> +	if (dl_se->dl_demotion_state != DL_NOT_DEMOTED || !dl_task_can_demote(dl_se))
> +		return;
> +
> +	dl_se->dl_demotion_state = DL_DEMOTING;
> +
> +	scoped_guard (sched_change, p, queue_flags) {
> +		/*
> +		 * The task's static_prio is already set from the sched_nice
> +		 * value in sched_attr.
> +		 */
> +		p->policy = SCHED_NORMAL;
> +		p->sched_class = &fair_sched_class;
> +		p->prio = p->static_prio;
> +		p->normal_prio = p->static_prio;
> +	}
> +
> +	dl_se->dl_demotion_state = DL_DEMOTED;
> +
> +	__balance_callbacks(rq, NULL);
> +	resched_curr(rq);

Doesn't sched_change already force resched on class degradation?

Anyway, I love how simple this has become ;-)

> +}

> +static void switched_from_dl(struct rq *rq, struct task_struct *p)
> +{
> +	/*
> +	 * If demoting, skip all bandwidth accounting. The bandwidth
> +	 * reservation stays in place while the task executes as SCHED_NORMAL.
> +	 */
> +	if (p->dl.dl_demotion_state == DL_DEMOTING)
> +		return;
> +
> +	__dl_cleanup_bandwidth(p, rq);
>  
>  	/*
>  	 * Since this might be the only -deadline task on the rq,
> @@ -3322,6 +3471,16 @@ static void switched_from_dl(struct rq *rq, struct task_struct *p)
>   */
>  static void switched_to_dl(struct rq *rq, struct task_struct *p)
>  {
> +	/*
> +	 * If promoting from demotion, skip bandwidth/cpuset accounting.
> +	 */
> +	if (p->dl.dl_demotion_state == DL_PROMOTING) {
> +		if (!task_on_rq_queued(p))
> +			return;
> +
> +		goto check_preempt;
> +	}
> +
>  	cancel_inactive_timer(&p->dl);
>  
>  	/*

Ah, I wondered where you'd need those DEMOTING/PROMOTING states.


> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index c16b5fd71b2d5..59e5459a75492 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9415,6 +9415,14 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
>  	if (p->sched_task_hot)
>  		p->sched_task_hot = 0;
>  
> +	/*
> +	 * Demoted DEADLINE tasks cannot migrate. Their bandwidth reservation
> +	 * is tied to the demotion CPU and will be released when the task is
> +	 * promoted back to DEADLINE or explicitly switched to another policy.
> +	 */
> +	if (!dl_task_can_migrate(p))
> +		return 0;

I suppose this works, the alternative is doing migrate_disable() in
demote and migrate_enable() in promote. Not quite sure which is the
least horrible in this case :-)


