Return-Path: <linux-doc+bounces-94411-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eLb3Lvw9RWri9AoAu9opvQ
	(envelope-from <linux-doc+bounces-94411-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 18:19:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5755F6EFAF1
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 18:19:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hr2Nt68O;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94411-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94411-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5C663045920
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 16:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA571367283;
	Wed,  1 Jul 2026 16:19:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFC572621
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 16:19:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922745; cv=none; b=CM6uobN8OvlpTlMkGd46zVmfnqC1fcDJmxpymZMWSG06iV6q/ATJqKytUUq7f64PHnhEfnIXvOEMQh2VDFygJuO3nAZJ8HUqQJ9mzJ5Jgr4iqP4Hrl2qCxMS+zVGjPLflMrPqAVAjd6GrpUtCldLdPUwXSdwUx7W+SiM4OVhCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922745; c=relaxed/simple;
	bh=s9CItByL9S0BwCJBoOO3+Gg9V4kcOApKWwOsaQBXYcs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nod+6fGchPHv8Z4z1OWqDAm0GzciTkCXBoVRp58riJYNlDHWI3515PSW7EvKv/De0s9SYRWV5Iv+mrZ35ktF9LhL57gw5Jc/gWGvqxqOAEUJYaKyY/PQ3987M6/tgVoPKfk+oCevOraJj5gZxcQaZuZNsmq9gUTN5ZRAZQojW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hr2Nt68O; arc=none smtp.client-ip=209.85.128.176
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-804e46366d7so11646777b3.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922743; x=1783527543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCR0Z6DF0TguTtzknpzJfMKWAgHMYofRZ71/M3eD3Lo=;
        b=hr2Nt68Orh0ccO3/ceJyCfibfZ/qLwuSQrpjjkN95HXHyjy/DLylWeipnoxTR6CbSg
         FutjSxxnup8J/f186HfbBfj6DaUJJXkYoxIkbLlRhagiU5HRAK9MGvXq/nUsur8SjJ6R
         AE/81xfu3DIM6CKHAQxzvXEq501J9F0oCmU9h8Bf1uCPIutJXdf43+1n+ROoLyv2mso0
         LqldtmhWJRsQty2ga1tKoOo75QtM1RlMsnXask8piPhd0ZgUka2b0qjqnD2Rs6f9/r50
         GGTvl28xep9RfGYJ7cvuxOBYwhXOOBJ2PCKa8zgjbvpeaHXY+FrnHZlCPxkZy99D1UD/
         FXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922743; x=1783527543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCR0Z6DF0TguTtzknpzJfMKWAgHMYofRZ71/M3eD3Lo=;
        b=QlabGYAU2/T2gzqwGMsXjX0hFDkmkEZ/ArrcmNF2xn8TdW+6qTwN/QBnQCm2MySqa3
         yK2ZuFRWHnY0xT2JYA1EsocVgZbReFIdln5tLLB5LXrP1Xk/QwlLpdGg+Euny4tTmjUr
         tsx+17lXkC1sKPSC+HiSZr/eBSomJWLOQ8Azynk7mu11itzNbkS45oz4/Xi2w+81Gwtu
         AanFcEz4s8NCE1acn3ppjhM4ZYwx+06muNZz24hs8vvGRRqOucgxYCYJlMnMui4xNVcy
         S3V4eL7fz4QLjjs1MG0TbpyZBCgqfKh6PaCSitkdgnT5P/NAMScjgx78pobci4+CE1HT
         3raQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTDB7IkJr5GSYIOh/U2JzhNL0o00b+4RmIC2vDxGA8PYxhiEIHN4ig/DfA72MzftCFIhZQudLNlVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwViDd7bkArabp8yVmzup7KK6aHz7SnLtR069o7pHLgMDmhX5p1
	ep6rTAoklVMtcxkxmzB9Pc18+dqrQJ2c++3X2yrzWtZPllZGsS7VMw+/
X-Gm-Gg: AfdE7cl6BgYHdVRlxpO0YyqA9aXHPENG9oYfnFN5rcxRrqtWT6uOc7kYAMk9JEbvkwT
	sT3y8javDB0EWzmBhxBQQAk29Vi9TGXjEH3qOFg1zx6n3Wm9D+JtI+eqd9Q+UAmu+ZD327DDKPA
	/suSTBOek+BUeQPSiVr2hzsRFZbL6QCJIrT1jOoFfbbgggVXrGMoCewREvd/5UH2T80EdxOfMfG
	68+CVJ0zDuh42WKPH6c4fwaUAmhK7ekRx1vXT50mhkVvoN1S1NZqx5pWy+zldX9Kj8/R2qzsbXK
	+OTycnotDreiI5gCOuncVBUcbQ0Hdz7nWdrkQIWz1iffPsfJ4K9pAZIjkUuqQWeMnj7PQBW7lcz
	0hLgGaz6T4iDYYD/mcCG7f6tKdaTrbOMyI7RGzgbwfnxewF881oo0n1mZIGC2MTZYdnVZoi+wBT
	98IyGl0iU=
X-Received: by 2002:a05:690c:6a07:b0:7bd:73f3:7a67 with SMTP id 00721157ae682-812e98d483emr23756567b3.28.1782922742794;
        Wed, 01 Jul 2026 09:19:02 -0700 (PDT)
Received: from localhost ([107.87.138.219])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af52bc0sm2077617b3.26.2026.07.01.09.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:19:02 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Wed, 1 Jul 2026 12:19:01 -0400
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 06/23] sched/fair: Load balance only among preferred
 CPUs
Message-ID: <akU99bo6zRsyWmqY@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-7-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-7-sshegde@linux.ibm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94411-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yurynorov@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:mingo@kernel.org,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:yury.norov@gmail.com,m:kprateek.nayak@amd.com,m:iii@linux.ibm.com,m:corbet@lwn.net,m:tglx@kernel.org,m:gregkh@linuxfoundation.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:vschneid@redhat.com,m:huschle@linux.ibm.com,m:rostedt@goodmis.org,m:dietmar.eggemann@arm.com,m:maddy@linux.ibm.com,m:srikar@linux.ibm.com,m:hdanton@sina.com,m:chleroy@kernel.org,m:vineeth@bitbyteword.org,m:frederic@kernel.org,m:arighi@nvidia.com,m:pauld@redhat.com,m:christian.loehle@arm.com,m:tj@kernel.org,m:tommaso.cucinotta@gmail.com,m:maz@kernel.org,m:rafael@kernel.org,m:rdunlap@infradead.org,m:kernellwp@gmail.com,m:linux-doc@vger.kernel.org,m:yurynorov@gmail.com,m:tommasocucinotta@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yurynorov@gmail.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,infradead.org,redhat.com,linaro.org,gmail.com,amd.com,linux.ibm.com,lwn.net,linuxfoundation.org,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yury:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5755F6EFAF1

On Wed, Jul 01, 2026 at 07:46:37PM +0530, Shrikanth Hegde wrote:
> Consider only preferred CPUs for load balance.
> 
> With this, load balance will end up choosing a preferred CPUs for pull.
> This makes it not fight against the push task mechanism which happens
> at tick. Also, this stops active balance to happen on non-preferred CPU
> pulling the load.
> 
> This means there is no load balancing if the task is pinned only to
> non-preferred CPUs. They will continue to run where they were previously
> running before the CPUs was marked as non-preferred.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  kernel/sched/fair.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ce05acf52d35..9b2931b559d6 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13391,7 +13391,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>  	};
>  	bool need_unlock = false;
>  
> -	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
> +	/* Spread load among preferred CPUs */

We don't have a "Spread load among active CPUs" comment. Don't think
it's more difficult to understand what happens if you replace one mask
with another.

> +	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
>  
>  	schedstat_inc(sd->lb_count[idle]);
>  
> -- 
> 2.47.3

