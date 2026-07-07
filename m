Return-Path: <linux-doc+bounces-95417-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BuKhH18sTWqPwAEAu9opvQ
	(envelope-from <linux-doc+bounces-95417-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:42:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D0C71DF41
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:42:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=jq7tOwAA;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95417-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95417-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E9EC3003485
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 16:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614D93EB10D;
	Tue,  7 Jul 2026 16:42:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D676D2C181;
	Tue,  7 Jul 2026 16:41:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442520; cv=none; b=tXzTd5P5kSvOV8QhJt2lz0AELzhRx8BHFA/cRYE9++D3tDEjY5zVQGz6n2gh2PcK4HnHHOp7RNiIUEm00nsO6dpnTi7eMUV0r48EcGxhm3VyjUCdx8aNQQDZP6ZLgGhE4WVqnZRBTsXevDvjEiFGWCyssYIIeUMVZ2vW5UlU5sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442520; c=relaxed/simple;
	bh=VH9ncc9EH80MwqoC5Ibol4VeY6FQ3Wo1jmxSIc8vOXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRibeCzk2sx/O3zOsO5vv0vhq5DSDmGO14UpDCl03i/dwLfGy/+kWSuz2UUBcb1rdzrBdrd9cZXGdx6Nf+Hpuc+R3PMw6OZ+IHH/Sg/rNwxQAYxmpDHj0OBkMubXqmX6JJdCFhjjTEGjFdjvuNFxZzT5lAnmGIy15fFQItHN0Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jq7tOwAA; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b1LiWmdn4ANwF7mre0n2c9WYvUSe5HG3n8mv4iyoQ40=; b=jq7tOwAATczN9vuWGa4uYNOle8
	PcqSZCkXc4xOdk/5BX18xB0iJkYSToB1XStWZcrwwPPFVffSKbe/AesF5XYJRx9LSkpWjLtg3vjp4
	d498m4DuNbYAQITcnKquW++TdLoTHOpCKkIBIQK8xlSnlIWzs2vhfQNUaAfMESx6PlUMbRqcKT8Wl
	ePznfcXoebFqOTTWE7aCcHIBkR0NDPkOyHKAQzt3d7fekqIH1/6neB1P0brRYJJXsMtPXVQy+QOug
	e8dl1660dt4RNjy8M95QSjB1zg3renXKiB3zk2wvQ8c0LfoVMWGSTRFxse8rOqxnBTIKe9TC/DgU5
	PhmAExwA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8rS-00000000klL-1ZZT;
	Tue, 07 Jul 2026 16:41:30 +0000
Date: Tue, 7 Jul 2026 17:41:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/3] mm/swap: colocate page-cluster sysctl with swap
 readahead
Message-ID: <ak0sOv4UN1ug9-cN@casper.infradead.org>
References: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com>
 <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-1-e816812698a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-1-e816812698a8@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95417-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:hannes@cmpxchg.org,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:baoquan.he@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,lge.com,linux.dev,google.com,cmpxchg.org,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,casper.infradead.org:mid,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71D0C71DF41

On Wed, Jul 08, 2026 at 12:11:27AM +0800, Jianyue Wu wrote:
> +++ b/mm/swap.h
> @@ -336,6 +334,7 @@ static inline unsigned int folio_swap_flags(struct folio *folio)
>  
>  #else /* CONFIG_SWAP */
>  struct swap_iocb;
> +
>  static inline struct swap_cluster_info *swap_cluster_lock(
>  	struct swap_info_struct *si, pgoff_t offset, bool irq)
>  {

This change is not related; please drop it.

> @@ -985,6 +990,38 @@ struct folio *swapin_readahead(swp_entry_t entry, gfp_t gfp_mask,
>  	return folio;
>  }
>  
> +static const struct ctl_table swap_readahead_sysctl_table[] = {
> +	{
> +		.procname	= "page-cluster",
> +		.data		= &page_cluster,
> +		.maxlen		= sizeof(int),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= (void *)&page_cluster_max,
> +	}
> +};
> +
> +/**
> + * swap_readahead_setup - defaults and sysctl for swap cache readahead clustering
> + */

This comment:
 - Does not need to be kernel-doc formatted as it is static
 - Only contains information that is obvious (at least to me).
I would drop it entirely.


