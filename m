Return-Path: <linux-doc+bounces-93151-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id crKJMRzHOWphxQcAu9opvQ
	(envelope-from <linux-doc+bounces-93151-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:37:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C06B2D69
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:37:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oT+WFVOm;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93151-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93151-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46353303927F
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 23:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E3335E93B;
	Mon, 22 Jun 2026 23:36:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7115B2D63F8;
	Mon, 22 Jun 2026 23:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171418; cv=none; b=AujSF25aCtQlpa5nKGt2hWBRSoVf3qsYbPgRnDbgfupF04BVIxOPUnWF08RUguNvvYHKoDy3zMAVhOmOaxrIa7CkqvGrwV0ykP0KqWafYs8WKuEucFevld6LWhYo+fmOk3e3tKN1oGLMTFqcoWIa13YdH7on4S7MEZG0T95QdQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171418; c=relaxed/simple;
	bh=/kM6qKww2c6bqkEEP1CcBdiUsBlKhqZZSEgpWi1UagI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N852IFHs65brm8LjKTx7cU5SeUwAJau5rE08JNwiKkn4ad6egmuLdpZWlc0/AhqmBxh566uGO6dqnxlinZsvPezX7GNonogfZxnANmqNxmWOso1DOnHxrtpTxt/IkmmbE1nJMJubagMtvhicePWpMewlv/qTYas6QER6++Tj50E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oT+WFVOm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895731F000E9;
	Mon, 22 Jun 2026 23:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782171417;
	bh=XI1hxdezynCpB8B16MUEAQeC3TVNk9JYHRaQPktGvjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oT+WFVOmZhzP60d/nrMwBnaFfl3RcgBckMmT5NKwkN0CM05cz9S4xqNOPM9ZDwRJo
	 Yi7ftQepiOsHhVNrEg7p4XOz6irQiRY+PD4RwAsjQAMaFMbqXGF2imGawaE0BibjKo
	 oyRMxyXx8i1c/XWY8UB6PmpMdBnoQXbXrIKNqxa4TdnlqiT1pbWitx2IwyN/X00SZs
	 D0mUX8uD8adtnERyCFDi3CbVCDC+WGvHB3dgVxRHQ84Z7F3qYggG+b05PTIAQqWE/4
	 zI2/+K9t1R5UjaAnYwnuB+JUgyDCiLR3rUa3L2fbdOGsw14UnD+BxwcH/D3j+OKp6h
	 fH9emVrTQrWLw==
Date: Mon, 22 Jun 2026 23:36:55 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v4 2/5] mm/zswap: Factor writeback loop out of
 shrink_worker()
Message-ID: <ajnGTt8tkbAWX8Oc@google.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-3-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618044857.69439-3-jiahao.kernel@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jiahao.kernel@gmail.com,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:nphamcs@gmail.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93151-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,gmail.com,kvack.org,vger.kernel.org,lixiang.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 458C06B2D69

> +/*
> + * Walk the memcg tree and write back zswap pages until the
> + * (lower_pages, upper_pages) window closes, or abort encounter
> + * MAX_RECLAIM_RETRIES times of the following conditions:
> + * - No writeback-candidate memcgs found in a memcg tree walk.
> + * - Shrinking a writeback-candidate memcg failed.
> + *
> + * For shrink_worker(), it passes lower=thr and upper=zswap_total_pages().
> + * The @upper limit is refreshed in each iteration by re-evaluating
> + * zswap_total_pages(), and the window closes once the total falls
> + * below the threshold.

This is the wrong abstraction level, and it's obvious by the fact that
the function calls zswap_total_pages() again to recalcualte
'upper_pages'. It gets much worse in the next patch as well.

The lower_pages and upper_pages thing is also unnecessarily hard to
follow.

The core of the reuse here is the retry logic. So maybe keep the memcg
iteration in the callers, and define a function that takes in one memcg
and reclaims one batch from it? failures and attempts can be passed into
the function to maintain the state across scans of different memcgs,
like zswap_shrink_walk_arg?

WDYT?

> + */
> +static void zswap_try_to_writeback(unsigned long lower_pages,
> +				   unsigned long upper_pages)
> +{
> +	int failures = 0, attempts = 0;
> +	struct mem_cgroup *iter_memcg;
> +
> +	while (lower_pages < upper_pages) {
> +		unsigned long batch_size;
> +		long shrunk;
>  
> -		if (!memcg) {
> +		cond_resched();
> +
> +		iter_memcg = zswap_iter_global();
> +		if (!iter_memcg) {
>  			/*
>  			 * Continue shrinking without incrementing failures if
>  			 * we found candidate memcgs in the last tree walk.
> @@ -1443,12 +1457,16 @@ static void shrink_worker(struct work_struct *w)
>  				break;
>  
>  			attempts = 0;
> -			goto resched;
> +			continue;
>  		}
>  
> -		ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> +		batch_size = min(upper_pages - lower_pages, NR_ZSWAP_WB_BATCH);
> +		shrunk = shrink_memcg(iter_memcg, batch_size);
>  		/* drop the extra reference */
> -		mem_cgroup_put(memcg);
> +		mem_cgroup_put(iter_memcg);
> +
> +		/* zswap total pages might have changed, refresh it. */
> +		upper_pages = zswap_total_pages();
>  
>  		/*
>  		 * There are no writeback-candidate pages in the memcg.
> @@ -1456,15 +1474,23 @@ static void shrink_worker(struct work_struct *w)
>  		 * with pages in zswap. Skip this without incrementing attempts
>  		 * and failures.
>  		 */
> -		if (ret == -ENOENT)
> +		if (shrunk == -ENOENT)
>  			continue;
>  		++attempts;
>  
> -		if (ret <= 0 && ++failures == MAX_RECLAIM_RETRIES)
> +		if (shrunk <= 0 && ++failures == MAX_RECLAIM_RETRIES)
>  			break;
> -resched:
> -		cond_resched();
> -	} while (zswap_total_pages() > thr);
> +	}
> +}
> +
> +static void shrink_worker(struct work_struct *w)
> +{
> +	unsigned long thr;
> +
> +	/* Reclaim down to the accept threshold */
> +	thr = zswap_accept_thr_pages();
> +
> +	zswap_try_to_writeback(thr, zswap_total_pages());
>  }
>  
>  /*********************************
> -- 
> 2.34.1
> 

