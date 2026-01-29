Return-Path: <linux-doc+bounces-74370-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMN8Hs6semmv9AEAu9opvQ
	(envelope-from <linux-doc+bounces-74370-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 01:41:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7719AA4EE
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 01:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EC793023352
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 00:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B972424729A;
	Thu, 29 Jan 2026 00:41:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193E7223339;
	Thu, 29 Jan 2026 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647260; cv=none; b=UHsHbv9tUp0bCps3xAwMknICNwkEyoMf2XZvQR20+r70lnGthssflkQKLu44ZO1oz8ELc/dzt7RMvHxuyYCdsZQ+pmHrS5R4sncPlqG5g7R5r+Z1DCS2v5qY25B8RXMdbKMvJpoCVJtPaV/SlZ+sAozs7H1TgZrTkzqUIy9Lg8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647260; c=relaxed/simple;
	bh=3rmMdu/KL4FWCpGsuku9mWgwpv92dXcCAGYUU5AQhag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Icr0YAORgid2qb43mpWuO/QomGQt4EQRKaK4cmWThgNPxp06plg1djPr6OMlgNT34blBLF4VHeBdDkxptDvfF8K+c22uSBcO0VGSTdRb37LDnkHxEr8KxGqAbsFv9kT07ZsXO87+riKVrk8/s/be9yRffVE79J9wrTB5ao3+xl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 4CD5813B5F5;
	Thu, 29 Jan 2026 00:40:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 0D6A920024;
	Thu, 29 Jan 2026 00:40:54 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:41:04 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yaxiong Tian <tianyaxiong@kylinos.cn>, axboe@kernel.dk
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-trace-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 5/5] blktrace: Make init_blk_tracer() asynchronous
 when trace_async_init set
Message-ID: <20260128194104.30051be1@gandalf.local.home>
In-Reply-To: <20260128125554.1717261-1-tianyaxiong@kylinos.cn>
References: <20260128125117.1704853-1-tianyaxiong@kylinos.cn>
	<20260128125554.1717261-1-tianyaxiong@kylinos.cn>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: beqh17izdaycrar7xb7bm8th3g6gxb4o
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX191utgOXByJ08pMzV/bP1/D7KV+QdkEBP4=
X-HE-Tag: 1769647254-38167
X-HE-Meta: U2FsdGVkX1/AzcRMiLttA/OItKDcWNp8wTRrk5URzaqA94mBMgrhcmEReYqWj2ITdZIy5F3nDgNIL0G54tzvFTyX9zk1EUwUiZL5X7tFWdXv0LBERIdar+EVekzbW2/22SAjA/Xt22M0Ha08ci54JpwIfriN1Qx/2jh8oAYV+Iv7WSpDmfCzj7bpOaJk885sO9K3lWJH91hVzPKnBE6o2ez2guloMyyjnDP6q3zsR3BweXEkn1GfzmuSyvFLuJVFENBBa4jBogkkksrxPc/FjEujPzsJMFz9/O8GXkNBWsVCYteThDEuq/6fZbLY5fPA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-74370-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email,gandalf.local.home:mid]
X-Rspamd-Queue-Id: D7719AA4EE
X-Rspamd-Action: no action


Jens,

Can you give me an acked-by on this patch and I can take the series through
my tree.

Or perhaps this doesn't even need to test the trace_async_init flag and can
always do the work queue? Does blk_trace ever do tracing at boot up? That
is, before user space starts?

Thanks,

-- Steve


On Wed, 28 Jan 2026 20:55:54 +0800
Yaxiong Tian <tianyaxiong@kylinos.cn> wrote:

> The init_blk_tracer() function causes significant boot delay as it
> waits for the trace_event_sem lock held by trace_event_update_all().
> Specifically, its child function register_trace_event() requires
> this lock, which is occupied for an extended period during boot.
> 
> To resolve this, when the trace_async_init parameter is enabled, the
> execution of primary init_blk_tracer() is moved to the trace_init_wq
> workqueue, allowing it to run asynchronously. and prevent blocking
> the main boot thread.
> 
> Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
> ---
>  kernel/trace/blktrace.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
> index d031c8d80be4..56c7270ec447 100644
> --- a/kernel/trace/blktrace.c
> +++ b/kernel/trace/blktrace.c
> @@ -1832,7 +1832,9 @@ static struct trace_event trace_blk_event = {
>  	.funcs		= &trace_blk_event_funcs,
>  };
>  
> -static int __init init_blk_tracer(void)
> +static struct work_struct blktrace_works __initdata;
> +
> +static int __init __init_blk_tracer(void)
>  {
>  	if (!register_trace_event(&trace_blk_event)) {
>  		pr_warn("Warning: could not register block events\n");
> @@ -1852,6 +1854,25 @@ static int __init init_blk_tracer(void)
>  	return 0;
>  }
>  
> +static void __init blktrace_works_func(struct work_struct *work)
> +{
> +	__init_blk_tracer();
> +}
> +
> +static int __init init_blk_tracer(void)
> +{
> +	int ret = 0;
> +
> +	if (trace_init_wq && trace_async_init) {
> +		INIT_WORK(&blktrace_works, blktrace_works_func);
> +		queue_work(trace_init_wq, &blktrace_works);
> +	} else {
> +		ret = __init_blk_tracer();
> +	}
> +
> +	return ret;
> +}
> +
>  device_initcall(init_blk_tracer);
>  
>  static int blk_trace_remove_queue(struct request_queue *q)


