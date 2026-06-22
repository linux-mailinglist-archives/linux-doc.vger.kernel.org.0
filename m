Return-Path: <linux-doc+bounces-93153-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3SBtEF/IOWqmxQcAu9opvQ
	(envelope-from <linux-doc+bounces-93153-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:42:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14C6B2D85
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:42:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l2n4DGO2;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93153-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93153-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF918303AB5C
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 23:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F4436A377;
	Mon, 22 Jun 2026 23:42:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C39E36403B;
	Mon, 22 Jun 2026 23:42:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171728; cv=none; b=LoCxvRHiQ1CmuR01Fhy3lFMFYUrBUY6gX5W8A+/LtnTCdRqInzk8z7mR7pPRTJ8XP+0f+/9PwEo3D+58gWdJMUIEN1/xCaDRF11/O5eHv3nIx+ecJMZToObp8jyKZ5IpxExw1852dQSZeVLi57jc0jaBkQfacQJZdlo4KFCwgdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171728; c=relaxed/simple;
	bh=qA6/cdY//6MmO6GWz01XO0QbpttUxHWdB1zeOoxnBNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFU36Z1jtLkMchUmvgxHOnVh9fpNvXonUQRfxjKF378xql+efVB5Hk7J+lCrWo3Vr5jJHXLiiGfdR9W6gaP0zrKGVDSbcEylsbRQmVFpoIACkeNvE/d3b4p2GCOA6t2XM4GJqWJ+wI8nmH5ru58Htj+cMtyV+wnXCt5Zpwqrwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2n4DGO2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8281F000E9;
	Mon, 22 Jun 2026 23:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782171727;
	bh=zYgQzRWkWxLUnGWAoYxurtQBuGAOfxttp+K+/45YvTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l2n4DGO2w+knegYqXIXC3R4qWmsAIF47NbNgAmYwSeSwSk1Z/Pa0FYBuKsqUYcxRV
	 fsLjEOQ+i8YLPSuntJem/r5qr3w8aMXczCY6HhxfMGBI3bSinU6lEOMUcH0+T1gnxM
	 Vz+ctxaPh0+6Jkx3YrLmTRRp/hN7oKjjdpSiwldr75WoSNFFmmw8AKmhhXHYeDljzQ
	 xggeN3xL+LpikVft5upWTiHd1KBfaqTgsQixPyBZQhCd2s2mgO0QxEZrwaWnx8UARr
	 izbR+mbPdRU3V+XaF93ByPUtrqjbo03sZx2DRy1l9fNYhiM9yexlhk7RGv1M4OoOag
	 83B0bg8Rx6ACQ==
Date: Mon, 22 Jun 2026 23:42:05 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v4 4/5] mm/zswap: Add per-memcg stat for proactive
 writeback
Message-ID: <ajnIC0My51MW4sc_@google.com>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-5-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618044857.69439-5-jiahao.kernel@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-93153-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A14C6B2D85

[..]
>  static int zswap_writeback_entry(struct zswap_entry *entry,
> -				 swp_entry_t swpentry)
> +				 swp_entry_t swpentry,
> +				 bool proactive)

IIUC, if we refactor the code as I suggested in previous changes, we
don't really need to add an argument here..

>  {
>  	struct xarray *tree;
>  	pgoff_t offset = swp_offset(swpentry);
> @@ -1045,6 +1047,15 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
>  	if (entry->objcg)
>  		count_objcg_events(entry->objcg, ZSWPWB, 1);
>  
> +	if (proactive && entry->objcg) {
> +		struct mem_cgroup *memcg;
> +
> +		rcu_read_lock();
> +		memcg = obj_cgroup_memcg(entry->objcg);
> +		mod_memcg_state(memcg, MEMCG_ZSWPWB_PROACTIVE_B, entry->length);
> +		rcu_read_unlock();
> +	}

..and this chunk of code would end up in zswap_proactive_writeback().

