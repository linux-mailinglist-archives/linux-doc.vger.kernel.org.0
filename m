Return-Path: <linux-doc+bounces-94194-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j/y5McDoQ2q4lQoAu9opvQ
	(envelope-from <linux-doc+bounces-94194-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:03:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C026E63A3
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OhbEsiEe;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94194-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94194-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EB26304EF8D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8DD46AF1D;
	Tue, 30 Jun 2026 16:02:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B62F1FD0
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:02:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835376; cv=none; b=X3DrXcaFH6Nde3hguLMY7mkBVl9ChZ7UQww00/FGc9tyany7nnO2TUbcO/CkAcTt7jbkXDuSwf0y+dIQelo32ODCs2bKNvI/M0TfqrOXSFAPR0txUPGq3Y7FYNiY3xEMKaGyAf8gwORNpuaMd5TmCdTBf26c4dUD/2BYXm2ibks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835376; c=relaxed/simple;
	bh=rJypcviBg/vRv6ioQRUNiFCv1YHZxZVbYVHtKG9g1HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxdMlxipuys05abzf8WYri7OFLaZH5fTm4VGPQk+NpmU/MKxw6jQ/IE0Iy4AdRZsY5AJRdXwmvbkJ6I/llx3GQcYtL/AnTcqlY7xJvHaIpwOzcrbnIUE00eiB1wk3CemNnejRiBLtD89ukTZbAFxQdfpB1q1BSspRXZiD1WJ+Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhbEsiEe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6951F00AC4
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782835372;
	bh=umGH+O+Vn9L4EN4GsKIUG29QvvcbPRfahOmTYYjIzwc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OhbEsiEeN8zjEmTCpp2wr7xdM+J5lgwbrEncfmNgXxY1Je5TPXo53a1aFjLJJijej
	 Qrk/8zkwVvp82/tCG7kHBv/BWMxGM0xczm4csCBQ9j/wx5jMeUphjNbpkXh42vR4RR
	 Jx03jBDaeOPjhxZp8bzwoUFgmuYI8+Nq0rO7YBQh0CingbU/Mn/wwVAnaCif5yH/iC
	 DmqimBSR5dcE6rvKsQNcNF5oL4YmpRaaoZ7zDXLqZZ9jd4lXtQL633G3p0e6paFv+s
	 qtC5fwm8kFYzgprbRNgtBv47qZTSlcuCEAybwkNqeSYxCYSF4gqvbixs3LKc6t8+wr
	 lu94+tMdgl8TQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so6825822a12.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDzZhlv9uJYLZX6m4T+8L6cVyLq7zK/ACypROKYG5lb7xcZCYCBKRNai3E32RFbUKHg6Pih4hKfZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+1DLykBkTVfbjAQYZB4f5T+CXzCXNrtMAs++kW1oqATk9h9A
	5cMgKcIzFrLGVMym0lk2eRUb9nPOqeckSa2kOkAN8bgkK3b0Inpadu0fC52gkWYDJo+f+Y2iMuY
	i3aLzr/7YXoNyo2yRCEQiEFAylTqCekc=
X-Received: by 2002:a17:906:70c8:b0:c12:350b:7c6c with SMTP id
 a640c23a62f3a-c1297c30894mr52377366b.28.1782835370961; Tue, 30 Jun 2026
 09:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-2-jiahao.kernel@gmail.com> <CAKEwX=MniM-4-aV17aH3UiDd_Xd2RH743fFZaxEnYX9qvnokeA@mail.gmail.com>
 <fe15eb9f-0b6c-dcaa-d0a7-5f08c3f92bfb@gmail.com>
In-Reply-To: <fe15eb9f-0b6c-dcaa-d0a7-5f08c3f92bfb@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 30 Jun 2026 09:02:39 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPBe9BPwP8NXz7pdH7T+8HLNsRAckL2Vfcnz0c23TH=iw@mail.gmail.com>
X-Gm-Features: AVVi8CcCxY3djerzT5lNld_VLCKVnmzQBQkQgjO1_FN5S20hdx2Xm_guHNHu7_I
Message-ID: <CAO9r8zPBe9BPwP8NXz7pdH7T+8HLNsRAckL2Vfcnz0c23TH=iw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94194-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jiahao.kernel@gmail.com,m:nphamcs@gmail.com,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:stable@vger.kernel.org,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,kvack.org,vger.kernel.org,lixiang.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2C026E63A3

> How about something like this? If there are no objections, I'll fold
> this into the next version.
>
>      mm/zswap: Fix global shrinker when memory cgroup is disabled
>
>      When memory cgroup is disabled, mem_cgroup_iter() always returns NULL.
>      Therefore, the global shrinker shrink_worker() always takes the !memcg
>      branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply
> gives up,
>      so it fails to write back anything.
>
>      Therefore, when memory cgroup is disabled, fall through with the !memcg
>      branch and shrink the root memcg directly.
>
>      With memcg disabled, shrink_memcg() only returns -ENOENT when the root
>      LRU is empty, which means the total pages are already below thr.
> The loop
>      then safely bails out via the zswap_total_pages() <= thr check. For any
>      other return value from shrink_memcg(), the loop is guaranteed to
> terminate,
>      either after MAX_RECLAIM_RETRIES failures or once the threshold is met.
>
>      Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
>      Cc: stable@vger.kernel.org
>      Reported-by: Yosry Ahmed <yosry@kernel.org>
>      Closes:
> https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeLc=eyTPKPVQgX4g@mail.gmail.com
>      Signed-off-by: Hao Jia <jiahao1@lixiang.com>

Feel free to add:

Acked-by: Yosry Ahmed <yosry@kernel.org>

A small nit below.

>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 4b5149173b0e..9d4f19fc440e 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1361,11 +1361,12 @@ static void shrink_worker(struct work_struct *w)
>                  } while (memcg && !mem_cgroup_tryget_online(memcg));
>                  spin_unlock(&zswap_shrink_lock);
>
> -               if (!memcg) {
> -                       /*
> -                        * Continue shrinking without incrementing
> failures if
> -                        * we found candidate memcgs in the last tree walk.
> -                        */
> +               /*
> +                * A NULL memcg ends a full hierarchy pass (except when
> memcg is
> +                * disabled, where it is always NULL: fall through to
> the root LRU).
> +                * Count a failure only if the pass found no candidates.

I think "last pass" is clearer than just "pass" here?

> +                */
> +               if (!memcg && !mem_cgroup_disabled()) {
>                          if (!attempts && ++failures == MAX_RECLAIM_RETRIES)
>                                  break;
>
> Thanks,
> Hao

