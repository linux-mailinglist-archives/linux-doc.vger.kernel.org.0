Return-Path: <linux-doc+bounces-95236-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2PJUO9cMTGq2fQEAu9opvQ
	(envelope-from <linux-doc+bounces-95236-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 22:15:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6B71558C
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 22:15:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=IZEhSE9H;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95236-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95236-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E02A932F2B29
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 19:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F8A3264E0;
	Mon,  6 Jul 2026 19:34:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5514314A95
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:34:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366481; cv=none; b=qmIUv+Sog0Xxl4dwjEAKfqY97Ul/wXYwdcCbcG7/bNp2S681ZsETqUhfZTUQkJcRCX+0BgYK6Myzdqmb2jRucGMFM34NnxKFRkuZzfhed2+qI/ZMuk+71kTqrCpLtUXjkmhPz+QgT9CHzuqmEfqPByTORc/l34WSLlRF31RR1Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366481; c=relaxed/simple;
	bh=zECZUzJTihm1y3OLJIHj0g1xUG8afSL6jFhiWq171DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaoU5wBrrxMj5R0HTL/zYfIISqyLRBMdYwcSFX8DpVSd+B92igN6zsm4xPIcTdWuuCPBTwZ+sM7iGN3SU99HbStOk11i34hwquWk36bjjbhM3aZdfGPirC2RFMGWgLr96zYwTGLW7rnqwzj98r5hW8odOci5+J1hgFzoa8W2OIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IZEhSE9H; arc=none smtp.client-ip=95.215.58.183
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783366465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FIHHLRwVR4NtU0/LL0GRJyj4HVJuRDsfXvwLZzguVw=;
	b=IZEhSE9Hn+GAtySFANf8zpZy70wX6zakvqMszh5suNaxs2g92mI7HXIFOX3/tWNbIX/g6g
	HCrJ7FoS8rGGkXvqTUWDdbpCKNlSnIIH8FyGQ+xZwDBDSycvLiijeo5LJnMO7kTMbu5b7l
	ZfA89c/n1BImcgpi83k/4cTN/4yc6XM=
From: Usama Arif <usama.arif@linux.dev>
To: Nico Pache <npache@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Subject: Re: [PATCH 6/8] mm/khugepaged: unmap pte before releasing vma write lock
Date: Mon,  6 Jul 2026 12:34:06 -0700
Message-ID: <20260706193407.825323-1-usama.arif@linux.dev>
In-Reply-To: <20260706154500.39178-7-npache@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95236-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:usama.arif@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33C6B71558C

On Mon,  6 Jul 2026 09:44:53 -0600 Nico Pache <npache@redhat.com> wrote:

> We are currently dropping the anon_vma write lock before unmapping the
> PTE. Although this is safe, due to us still holding the mmap_write_lock,
> its safer and less confusing to switch the order of these two operations.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Would it not be better to add a comment here why its safe to do so, instead
of extending lock hold period?

I think its more confusing to hold a lock for longer than we should.

> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index c4ea2dc1591b..3c6f1254deca 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1548,10 +1548,10 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
>  
>  	result = SCAN_SUCCEED;
>  out_up_write:
> -	if (anon_vma_locked)
> -		anon_vma_unlock_write(vma->anon_vma);
>  	if (pte)
>  		pte_unmap(pte);
> +	if (anon_vma_locked)
> +		anon_vma_unlock_write(vma->anon_vma);
>  	mmap_write_unlock(mm);
>  out_nolock:
>  	if (folio)
> -- 
> 2.54.0
> 
> 

