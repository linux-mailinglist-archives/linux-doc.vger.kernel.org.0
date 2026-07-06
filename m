Return-Path: <linux-doc+bounces-95196-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lU8VHfziS2pmcAEAu9opvQ
	(envelope-from <linux-doc+bounces-95196-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 19:16:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8906713C11
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 19:16:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="YWhV4O5/";
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95196-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95196-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FD1B3089F51
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 17:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E361D2EFD9B;
	Mon,  6 Jul 2026 17:08:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF652F1FEA
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 17:08:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357701; cv=none; b=OR+ieIBu0nVYgWkbUPA7wcdODWSPhzxM/B50pFMuhL39I7SIUAZ32DydftW8Prwc6/EJCyU95PzNGpSEveOAZl2ZdHfuL/KwB3M2uTQtzPTVba6HcZx+YzITdd5NBllgQJn3A2b84rS1A3vMTx3DzsLOg7mH+m4ObE79kzLlwLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357701; c=relaxed/simple;
	bh=7Xv7aLJ+YNZ5iN1Oo+ob+wkqjUtpQJrWPpt8G3sgKZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wy5Gdxa7FlGVxU8YxM8wbkPFGBciEVmXqpnSKTlyBMb7rleiZA36aAs+QAyV7bAaz4icw8oWoZMn7Pc5E4G1vYxNa8wkc6mBCrG8m6qG9PtL7OWZOm8Wd0uX1qJf6FQBXaWKFzTrC+cMzINDmcVpJ4kRC0S7FSSk1LUHwDAWK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YWhV4O5/; arc=none smtp.client-ip=91.218.175.182
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783357687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjJeDZhpR70EaRE9MTzxl+iC6NvcG5zg6LLdCRsvLWI=;
	b=YWhV4O5/JSqoyxxc8P4VH9cUltAOYZa6czk/FoV7SIrN7O7giEOBrioKyDDyyv43d1WKW0
	xbMUY650Kh+kwmjGvvhfaN9HHZuN+Pci0jAgdxz9+gcnjnNDfYMN2dbdS4bgZrEfytUOEo
	fGsO8hsGH+anXKjoAnt2x3PAKOGf/1M=
From: Usama Arif <usama.arif@linux.dev>
To: Nico Pache <npache@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/8] mm/khugepaged: refactor per-scan state clearing into collapse_control_init_scan()
Date: Mon,  6 Jul 2026 10:07:52 -0700
Message-ID: <20260706170755.3387204-1-usama.arif@linux.dev>
In-Reply-To: <20260706154500.39178-2-npache@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95196-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:usama.arif@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:email,linux.dev:mid,linux.dev:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8906713C11

On Mon,  6 Jul 2026 09:44:48 -0600 Nico Pache <npache@redhat.com> wrote:

> Extract the repeated clearing of node_load, alloc_nmask, and
> mthp_present_ptes into a helper to reduce duplication in
> collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
> current use the bitmap, they will in the future, and clearing it now is
> harmless.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 617bca76db49..b3985b854e77 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -628,6 +628,17 @@ void __khugepaged_exit(struct mm_struct *mm)
>  	}
>  }
>  
> +/*
> + * collapse_control_init_scan() - initialize/reset collapse_control variables
> + * that require being cleared once per-scan.
> + */

Probably don't need the above comment, but apart from that

Acked-by: Usama Arif <usama.arif@linux.dev>

> +static void collapse_control_init_scan(struct collapse_control *cc)
> +{
> +	memset(cc->node_load, 0, sizeof(cc->node_load));
> +	nodes_clear(cc->alloc_nmask);
> +	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> +}
> +
>  static void release_pte_folio(struct folio *folio)
>  {
>  	node_stat_mod_folio(folio,
> @@ -1616,9 +1627,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  		goto out;
>  	}
>  
> -	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> -	memset(cc->node_load, 0, sizeof(cc->node_load));
> -	nodes_clear(cc->alloc_nmask);
> +	collapse_control_init_scan(cc);
>  
>  	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
>  
> @@ -2686,8 +2695,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
>  
>  	present = 0;
>  	swap = 0;
> -	memset(cc->node_load, 0, sizeof(cc->node_load));
> -	nodes_clear(cc->alloc_nmask);
> +	collapse_control_init_scan(cc);
>  	rcu_read_lock();
>  	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
>  		if (xas_retry(&xas, folio))
> -- 
> 2.54.0
> 
> 

