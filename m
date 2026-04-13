Return-Path: <linux-doc+bounces-83266-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA9oMO4r3WmVaQkAu9opvQ
	(envelope-from <linux-doc+bounces-83266-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 19:46:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B79943F1A59
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 19:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1376D3007A64
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 17:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34B536F40D;
	Mon, 13 Apr 2026 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cKwV1QYz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rQe3Mkfb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cKwV1QYz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rQe3Mkfb"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62A2C21E8
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102233; cv=none; b=cY0Lrmw9r4SkUr8buUNrHySVUOsVnTtvzPQAud00nb81jtHaj/O3iq8hA2yhyvcqpJjQrD7AN9XuKM3tJa+xy+I6/0DMHtknnTTPTa/sUzobY4fsIhddJTEVhjLzMtIhvK30/rWuJJfYd7pELHVgN1lr+4BTvuuTcIL71jn5snE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102233; c=relaxed/simple;
	bh=OWh6Iy4XfNTies9wq3TbzgRs8JIbiD8NP3kbexXVSI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUo8OOD3O8GcngYRFkas3zb8DOHriz+d+Rf5Ou7v/LYWbGeKRd6SohdHGLZsshVzPeEMmb5WLG3iCH8P6SRD+8dN2CchNFUmTui4Bwp+RWncA6mDFXjHRXfTcHam8yBMAbQ3aB2lrSBItf9rqt4rV/JgMiCuM30auGDYpYRH42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cKwV1QYz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rQe3Mkfb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cKwV1QYz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rQe3Mkfb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B60BD5BD3E;
	Mon, 13 Apr 2026 17:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776102230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=cKwV1QYz1GSOpXcoJnqcN01IEtlRs793+honbozuKFEC8VyeP3SkJtPP6t/oQgHWclBGM0
	FUCX939RJ7zw0DgJeXe+G+xkHhqvaWcJ7pEWBC3PYuOGlO7XKwHIyofmhEImtDJUEcALkL
	Sad0YRziyKt2CAt8eSsneiA9W1NChSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776102230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=rQe3Mkfb+UKAwYCDfjjuovY8Tr3CSJ19JO19jRWk3nIYkSYZoNgvHRHHWscAB3C3xgCGxG
	aedN/zUVhwMAMDBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776102230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=cKwV1QYz1GSOpXcoJnqcN01IEtlRs793+honbozuKFEC8VyeP3SkJtPP6t/oQgHWclBGM0
	FUCX939RJ7zw0DgJeXe+G+xkHhqvaWcJ7pEWBC3PYuOGlO7XKwHIyofmhEImtDJUEcALkL
	Sad0YRziyKt2CAt8eSsneiA9W1NChSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776102230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6FuKmcXLR07Fw6pjG6z+dAgssBozguHf37YZWpjsEQ=;
	b=rQe3Mkfb+UKAwYCDfjjuovY8Tr3CSJ19JO19jRWk3nIYkSYZoNgvHRHHWscAB3C3xgCGxG
	aedN/zUVhwMAMDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEFE14AFE5;
	Mon, 13 Apr 2026 17:43:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DCwUOFUr3Wm0QAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 13 Apr 2026 17:43:49 +0000
Date: Mon, 13 Apr 2026 19:43:44 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	hughd@google.com, baolin.wang@linux.alibaba.com, peterx@redhat.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] hugetlb: make hugetlb_fault_mutex_hash() take
 PAGE_SIZE index
Message-ID: <ad0rUB4FuNUOJ1pN@localhost.localdomain>
References: <20260409234158.837786-1-jane.chu@oracle.com>
 <20260409234158.837786-4-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409234158.837786-4-jane.chu@oracle.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83266-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[osalvador@suse.de,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,localhost.localdomain:mid,suse.de:dkim]
X-Rspamd-Queue-Id: B79943F1A59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 05:41:54PM -0600, Jane Chu wrote:
> hugetlb_fault_mutex_hash() is used to serialize faults and page cache
> operations on the same hugetlb file offset. The helper currently expects
> its index argument in hugetlb page granularity, so callers have to
> open-code conversions from the PAGE_SIZE-based indices commonly used
> in the rest of MM helpers.
> 
> Change hugetlb_fault_mutex_hash() to take a PAGE_SIZE-based index
> instead, and perform the hugetlb-granularity conversion inside the helper.
> Update all callers accordingly.
> 
> This makes the helper interface consistent with filemap_get_folio(),
> and linear_page_index(), while preserving the same lock selection for
> a given hugetlb file offset.
> 
> Signed-off-by: Jane Chu <jane.chu@oracle.com>
> ---
>  fs/hugetlbfs/inode.c | 19 ++++++++++---------
>  mm/hugetlb.c         | 28 +++++++++++++++++++---------
>  mm/memfd.c           | 11 ++++++-----
>  mm/userfaultfd.c     |  7 +++----
>  4 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index cf79fb830377..e24e9bf54e14 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -575,7 +575,7 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
>  	struct address_space *mapping = &inode->i_data;
>  	const pgoff_t end = lend >> PAGE_SHIFT;
>  	struct folio_batch fbatch;
> -	pgoff_t next, index;
> +	pgoff_t next, idx;
>  	int i, freed = 0;
>  	bool truncate_op = (lend == LLONG_MAX);
>  
> @@ -586,15 +586,15 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
>  			struct folio *folio = fbatch.folios[i];
>  			u32 hash = 0;
>  
> -			index = folio->index >> huge_page_order(h);
> -			hash = hugetlb_fault_mutex_hash(mapping, index);
> +			hash = hugetlb_fault_mutex_hash(mapping, folio->index);
>  			mutex_lock(&hugetlb_fault_mutex_table[hash]);
>  
>  			/*
>  			 * Remove folio that was part of folio_batch.
>  			 */
> +			idx = folio->index >> huge_page_order(h);
>  			remove_inode_single_folio(h, inode, mapping, folio,
> -						  index, truncate_op);
> +						  idx, truncate_op);

Since this is the only place we call remove_inode_single_folio(), and that we do not
the index (at least index >> huge_page_order()) directly in this function, would it not be
better to make remove_inode_single_folio do the conversion itself? 

Also, I am thinking out loud here but we do have a few places where we
go: idx = index >> huge_page_order() to convert it into hugepage units, but the casual
reader might be a bit puzzled about that.
So, would it be worth to have implement an inline helper with an accurate name
to do that? It might help whoever reads that?


-- 
Oscar Salvador
SUSE Labs

