Return-Path: <linux-doc+bounces-93152-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tE1SIRLIOWqWxQcAu9opvQ
	(envelope-from <linux-doc+bounces-93152-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:41:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C432B6B2D7A
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="KeExKt/s";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93152-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93152-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 762C83017034
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 23:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C76135E93B;
	Mon, 22 Jun 2026 23:40:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67B61C5F13;
	Mon, 22 Jun 2026 23:40:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171646; cv=none; b=Eqa48krBBx2kTRF39EzD8T5NSgEjs5VyfN4eRc0fQmxgjh4VZim+5/y43kP2J4puOsZXxuGurMunDdUMY4KaiA57ZoY5WDQo8s8arEqCvIprb6WYRFSFfL9NAizwkfhJfLNjK3lqDsmOoev3m/KjHcRO0On4sdsH7CAMc3jTELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171646; c=relaxed/simple;
	bh=DmIcqzSeAFPx51Nzc/ehEsIsMqFH3uiV1HNgmE/+ERU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/vY/fZcT3lT+/R4of6Mg8bVuZ6kFp0u6ub2MhmTaSY6EieTXWLYWNxpK4xIGc/jUkIYk2Be94+y7o7uNsAonLdHvn9ctH1Zy7kP1jICwhcJICjgeYc2Oe4m0ZVoEklG9kVq241oDO/OzheflMFuxQBvKTt0qHx0js5nYy9Bjfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeExKt/s; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39A41F000E9;
	Mon, 22 Jun 2026 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782171644;
	bh=sv9Tq2vRtt61KjPpmgHARNzg92y5Jh8UgXbipP6SZQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KeExKt/s0Md5O/braMSh2VUEZbCyQzb4H2AwXtoJsnepuNmEFxtyWflyUv5xSsLz/
	 JE/X20Z/0mruDLtWOVClcLNKytskY4fb7tY2dwipXhLObh4/6ng/+cuCo6NeXBaLFC
	 yCefmD64EHEEtZUK6frDS29L/EH8hlbTVmlJ3zG/R4xEVH0jzhjeXUDdCMRJ3ZFo/A
	 z08YizsJCBNQ/K85yU6+retrB+l/RIBgr/VrbyOBH9EF/+oVElfz8ntrc6oFGgwj/L
	 mU8fMtyGz9+UDMqro5W4wP0/cDb8H0HEaJ8ZqLUYTkrceG4HfZRsk9iFjsPOWoXeCo
	 3w3ZIfchpunzA==
Date: Mon, 22 Jun 2026 23:40:42 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v4 3/5] mm/zswap: Implement proactive writeback
Message-ID: <ajnHJhvWxeR1DbaP@google.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-4-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618044857.69439-4-jiahao.kernel@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jiahao.kernel@gmail.com,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:nphamcs@gmail.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93152-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C432B6B2D7A

On Thu, Jun 18, 2026 at 12:48:55PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> Zswap currently writes back pages to backing swap reactively, triggered
> either by the shrinker or when the pool reaches its size limit. There is
> no mechanism to control the amount of writeback for a specific memory
> cgroup. However, users may want to proactively write back zswap pages,
> e.g., to free up memory for other applications or to prepare for
> memory-intensive workloads.
> 
> Introduce a "zswap_writeback_only" key to the memory.reclaim cgroup
> interface. When specified, this key bypasses standard memory reclaim
> and exclusively performs proactive zswap writeback up to the requested
> budget. If omitted, the default reclaim behavior remains unchanged.
> 
> Example usage:
>   # Write back 10MB of compressed data from zswap to the backing swap
>   echo "10M zswap_writeback_only" > memory.reclaim
> 
> Note that the actual amount of compressed data written back may be less
> than requested due to the zswap second-chance algorithm: referenced
> entries are rotated on the LRU on the first encounter and only written
> back on a second pass. If fewer bytes are written back than requested,
> -EAGAIN is returned, matching the existing memory.reclaim semantics.
> 
> Internally, extend user_proactive_reclaim() to parse the new
> "zswap_writeback_only" token and invoke the dedicated handler
> zswap_proactive_writeback(). This handler reuses
> zswap_try_to_writeback() to walk the target memcg subtree, draining
> per-node zswap LRUs through list_lru_walk_one() with the
> shrink_memcg_cb() callback.

I won't comment on the memcg interface as this is more-or-less a
placeholder until an interface is finalized.

> 
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
[..]
> diff --git a/mm/zswap.c b/mm/zswap.c
> index e29f8a61412d..28200552dde3 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1423,6 +1423,27 @@ static struct mem_cgroup *zswap_iter_global(void)
>  	return memcg;
>  }
>  
> +/*
> + * Local iteration uses a local cursor to select from online memcgs
> + * under @root in a round-robin fashion.
> + *
> + * Pass the previous return value as @prev to advance the round-robin
> + * iteration, or pass NULL to start a new walk. If exiting early before
> + * the iteration completes, the caller must call mem_cgroup_iter_break()
> + * to release the cursor reference.
> + */
> +static struct mem_cgroup *zswap_iter_local(struct mem_cgroup *root,
> +					   struct mem_cgroup *prev)
> +{
> +	struct mem_cgroup *memcg;
> +
> +	do {
> +		memcg = mem_cgroup_iter(root, prev, NULL);
> +		prev = memcg;
> +	} while (memcg && !mem_cgroup_tryget_online(memcg));
> +	return memcg;
> +}
> +
>  /*
>   * Walk the memcg tree and write back zswap pages until the
>   * (lower_pages, upper_pages) window closes, or abort encounter
> @@ -1430,16 +1451,23 @@ static struct mem_cgroup *zswap_iter_global(void)
>   * - No writeback-candidate memcgs found in a memcg tree walk.
>   * - Shrinking a writeback-candidate memcg failed.
>   *
> - * For shrink_worker(), it passes lower=thr and upper=zswap_total_pages().
> - * The @upper limit is refreshed in each iteration by re-evaluating
> - * zswap_total_pages(), and the window closes once the total falls
> - * below the threshold.
> + * For shrink_worker() (proactive=false), it passes lower=thr and
> + * upper=zswap_total_pages(). The @upper limit is refreshed in each
> + * iteration by re-evaluating zswap_total_pages(), and the window
> + * closes once the total falls below the threshold.
> + *
> + * For zswap_proactive_writeback() (proactive=true), it passes lower=0
> + * and upper=nr_to_writeback. The @lower limit is advanced by the
> + * compressed bytes written back via shrink_memcg(). The window closes
> + * once @nr_to_writeback pages of compressed data have been written back.
>   */
> -static void zswap_try_to_writeback(unsigned long lower_pages,
> -				   unsigned long upper_pages)
> +static int zswap_try_to_writeback(struct mem_cgroup *memcg,
> +				  unsigned long lower_pages,
> +				  unsigned long upper_pages, bool proactive)

As I mentiond in the previous patch, this is the wrong abstraction. The
function is extremely tighyl-coupled to the callers, and needing to
pass in things like proactive makes it even worse.

It should be limited to reclaiming one batch of pages from a memcg, and
the retry logic. Everything else (memcg iteration logic, scan goal
checks) should be in the caller.

[..]  
>  static void shrink_worker(struct work_struct *w)
> @@ -1490,7 +1536,7 @@ static void shrink_worker(struct work_struct *w)
>  	/* Reclaim down to the accept threshold */
>  	thr = zswap_accept_thr_pages();
>  
> -	zswap_try_to_writeback(thr, zswap_total_pages());
> +	zswap_try_to_writeback(NULL, thr, zswap_total_pages(), false);
>  }
>  
>  /*********************************
> @@ -1736,6 +1782,19 @@ int zswap_load(struct folio *folio)
>  	return 0;
>  }
>  
> +int zswap_proactive_writeback(struct mem_cgroup *memcg,
> +			      unsigned long nr_to_writeback)
> +{
> +	if (!memcg)
> +		return -EINVAL;
> +	if (!mem_cgroup_zswap_writeback_enabled(memcg))
> +		return -EINVAL;
> +	if (!nr_to_writeback)
> +		return 0;
> +
> +	return zswap_try_to_writeback(memcg, 0, nr_to_writeback, true);

The memcg loop should be here, together with a check on the written
bytes to check if the reclaim goal was achieved. I think nr_to_writeback
is also very confusing, it's really the reclaim target in bytes divided
by PAGE_SIZE. I think you need to pass in the number of bytes to
reclaim/writeback directly.

> +}
> +
>  void zswap_invalidate(swp_entry_t swp)
>  {
>  	pgoff_t offset = swp_offset(swp);
> -- 
> 2.34.1
> 

