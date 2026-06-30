Return-Path: <linux-doc+bounces-94094-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u2rvJtYKQ2rRNwoAu9opvQ
	(envelope-from <linux-doc+bounces-94094-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 02:16:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D56DF5A5
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 02:16:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ym0n7Pya;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94094-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94094-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98B9B30097C5
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 00:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0C51A6808;
	Tue, 30 Jun 2026 00:15:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C32BB1D;
	Tue, 30 Jun 2026 00:15:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782778559; cv=none; b=j7BzMAE+j0OEEIIII1ST+bTQHDi2gEwUz5LZE+tHGJGUFYuWTwRZIVJn1WrxxI60+KBOPGceaMaT5k+wx1GLtzvWtJmwRgjGMAjTe4KtAUuhiNbjEHs6ZF+4gvCSU8Pb7pv/Bri/ClDNugSelqfaQecch0qPdgmmIIv/1D7FA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782778559; c=relaxed/simple;
	bh=aC1Gw3HBm5hBKR997V+AKVus+Aga8xaLGAtv+il9vYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4qCs8444g9Ffi7LT2lmzXZRsiAKsdOJCBGPlM10a/6qtiH11qePF9eswhThnU5mZwOvIV5HJxk+6kuZdGaBI9t5h4SvpOO7susLVzixt1lRXriC+lZn/1IDB530uYLmTlxFMXzvU+geZf5Z7eMyxPEShqpvG5GbNzYYXzwjocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ym0n7Pya; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120C21F000E9;
	Tue, 30 Jun 2026 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782778557;
	bh=Nit+uzLYWcVxRwAjtLptONbY2sqNp7YD9OQCLbyeu3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ym0n7Pya/hmGoFn+s2yhXdiWd+CDg0SoF3vlWaxBZSZskDXBd4h90B+/e5hUuAhpA
	 4qBMRuFEC507FHg+64KRw5Sgar6T0BdO0SkQCFC0bm7k4V8y76jVdReXYRNLCiXG75
	 qk/i3I1rIgiyM+GvBfBp0ZyJ8MuN/iJ0hiuIbsAm3z4mApNY8byS7HfTbGYcd8nA2L
	 MzV0m8rl0Zq/R2JIZbPIkqYFjWk8gvBne/uPcrN31dJ7SZ1WxND0Ypc39YoG+lyRRx
	 2CWjSXP/XE3MhuPi8x5eCPU13OnYNxAszYPztscIDNYPK3i2zHGFlMOWTs+Ir81CeQ
	 0jAzW1Ae4rUpA==
Date: Tue, 30 Jun 2026 00:15:55 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
Message-ID: <akMJ8UfeZXrVe5LN@google.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629112032.20423-5-jiahao.kernel@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-94094-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: EC8D56DF5A5

On Mon, Jun 29, 2026 at 07:20:30PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> Zswap currently writes back pages to backing swap reactively, triggered
> either by the shrinker or when the pool reaches its size limit. There is
> no mechanism to control the amount of writeback for a specific memory
> cgroup. However, users may want to proactively write back zswap pages,
> e.g., to free up memory for other applications or to prepare for
> memory-intensive workloads.
> 
> Introduce a "source=" key to the memory.reclaim cgroup interface,
> currently accepting the single value "zswap". When set to "zswap", it
> bypasses standard memory reclaim and exclusively performs proactive
> zswap writeback up to the requested budget. If omitted, the default
> reclaim behavior remains unchanged.
> 
> Example usage:
>   # Write back 10MB of compressed data from zswap to the backing swap
>   echo "10M source=zswap" > memory.reclaim
> 
> Note that the actual amount of compressed data written back may be less
> than requested due to the zswap second-chance algorithm: referenced
> entries are rotated on the LRU on the first encounter and only written
> back on a second pass. If fewer bytes are written back than requested,
> -EAGAIN is returned, matching the existing memory.reclaim semantics.
> 
> Internally, extend user_proactive_reclaim() to parse the new "source="
> key and invoke the dedicated handler zswap_proactive_writeback() when it
> is set to "zswap". This handler walks the target memcg subtree in a
> round-robin fashion and drains each memcg's per-node zswap LRUs through
> shrink_memcg(), accumulating the compressed bytes written back until the
> requested budget is met.
> 
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---

Before going through more versions we need to figure out if this will
pivot to be a proactive demotion interfcae for swap tiering.

> @@ -7869,9 +7872,12 @@ int user_proactive_reclaim(char *buf,
>  	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
>  	unsigned long nr_to_reclaim, nr_reclaimed = 0;
>  	int swappiness = -1;
> +	bool zswap_writeback_only = false;
>  	char *old_buf, *start;
> +	char source[16];
>  	substring_t args[MAX_OPT_ARGS];
>  	gfp_t gfp_mask = GFP_KERNEL;
> +	u64 nr_bytes;
>  
>  	if (!buf || (!memcg && !pgdat) || (memcg && pgdat))
>  		return -EINVAL;
> @@ -7879,7 +7885,8 @@ int user_proactive_reclaim(char *buf,
>  	buf = strstrip(buf);
>  
>  	old_buf = buf;
> -	nr_to_reclaim = memparse(buf, &buf) / PAGE_SIZE;
> +	nr_bytes = memparse(buf, &buf);
> +	nr_to_reclaim = nr_bytes / PAGE_SIZE;

Nit: if we keep this as part of memory.reclaim, we probably want to
choose clearer names (e.g. pages_to_reclaim and bytes_to_reclaim).

>  	if (buf == old_buf)
>  		return -EINVAL;
>  
> @@ -7899,11 +7906,26 @@ int user_proactive_reclaim(char *buf,
>  		case MEMORY_RECLAIM_SWAPPINESS_MAX:
>  			swappiness = SWAPPINESS_ANON_ONLY;
>  			break;
> +		case MEMORY_RECLAIM_SOURCE:
> +			if (match_strlcpy(source, &args[0], sizeof(source)) >= sizeof(source))
> +				return -EINVAL;
> +			/* Only zswap is supported as a reclaim source for now. */
> +			if (strcmp(source, "zswap"))
> +				return -EINVAL;
> +			zswap_writeback_only = true;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
>  	}
>  
> +	if (zswap_writeback_only) {
> +		/* source=zswap and swappiness are mutually exclusive. */
> +		if (swappiness != -1)
> +			return -EINVAL;
> +		return zswap_proactive_writeback(memcg, nr_bytes);
> +	}
> +
>  	while (nr_reclaimed < nr_to_reclaim) {
>  		/* Will converge on zero, but reclaim enforces a minimum */
>  		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
> diff --git a/mm/zswap.c b/mm/zswap.c
> index ba01bf0e44e9..9cda96f05508 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1713,6 +1713,56 @@ int zswap_load(struct folio *folio)
>  	return 0;
>  }
>  
> +int zswap_proactive_writeback(struct mem_cgroup *memcg, u64 bytes_to_writeback)
> +{
> +	struct zswap_shrink_state s = {};
> +	struct mem_cgroup *iter = NULL;
> +	u64 bytes_written = 0;
> +	int ret = 0;
> +
> +	if (!memcg)
> +		return -EINVAL;

Can this ever happen? It would be a bug in the caller.

> +	if (!mem_cgroup_zswap_writeback_enabled(memcg))
> +		return -EINVAL;
> +	if (!bytes_to_writeback)
> +		return 0;

Do we need this? I think the loop will just never enter and
mem_cgroup_iter_break() will do nothing.

> +
> +	while (bytes_written < bytes_to_writeback) {
> +		long shrunk;
> +
> +		cond_resched();
> +
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			break;
> +		}
> +
> +		/*
> +		 * Use a local iterator to walk the memcg and its online descendants
> +		 * in a round-robin manner. Upon exiting the loop, mem_cgroup_iter_break()
> +		 * must be called to drop the iterator reference.
> +		 */
> +		do {
> +			iter = mem_cgroup_iter(memcg, iter, NULL);
> +		} while (iter && !mem_cgroup_tryget_online(iter));
> +
> +		shrunk = zswap_shrink_one_memcg(iter, &s);
> +		if (shrunk > 0)
> +			bytes_written += shrunk;
> +
> +		/* drop the extra reference taken by mem_cgroup_tryget_online() */
> +		mem_cgroup_put(iter);


Can we just use mem_cgroup_online() instead since mem_cgroup_iter()
already graps a ref?

> +
> +		if (shrunk == -EBUSY) {
> +			ret = -EAGAIN;
> +			break;
> +		}
> +	}
> +
> +	mem_cgroup_iter_break(memcg, iter);
> +	return ret;
> +}
> +
>  void zswap_invalidate(swp_entry_t swp)
>  {
>  	pgoff_t offset = swp_offset(swp);
> -- 
> 2.34.1
> 

