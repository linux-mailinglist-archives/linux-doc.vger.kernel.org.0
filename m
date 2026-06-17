Return-Path: <linux-doc+bounces-92685-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nkv8GaT+MmqJ8QUAu9opvQ
	(envelope-from <linux-doc+bounces-92685-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 22:08:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF64169C4BF
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 22:08:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=FWZohVnf;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92685-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92685-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C6643014DB8
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 20:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4E039D6CC;
	Wed, 17 Jun 2026 20:07:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CE328B5E;
	Wed, 17 Jun 2026 20:07:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781726879; cv=none; b=fLUt3gV7oHqCIDiXUdUERKMog8WxmMAiRah6FKwxOM4vhsdYOdPs1gE/c7XZV2FVWOCE1W1zcaZOBa0UwYrpT6oClNjb1XqfupRbmLmVtyGDtXITwGrUuDsFMBQYCWF38aTuBUmk7Lkmf5v50YYLQ0Rv5TKPvPRSAWBTnNdaqMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781726879; c=relaxed/simple;
	bh=I0+mT4CPAoUbWeJX0dZDSIerItMoVelyxQMnvUz8FVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bihHCsnHpskHJIMFi2tX8oL1uWHko/oP/V1RJdEEsYfAQTvHV8K112WKJlwWSWlAX+d2tdRUlDGBcNAnJM/T0Tt/j9JkayGeSeEJYa0O+HI6UZwC6w+r98t0Gg5I15xkWrnBMcWUXDBjcQXJKk1oojH8rOUNsxBYMykUSlAVpOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FWZohVnf; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xkc/cwFVPTo6PfiKk5XSU4N+7uAosbnedDKdwgjJAs4=; b=FWZohVnfjGzWlfq0c6Jx8HhCkE
	uHSI+UsVJtrzf0zrp6i9dUqecmh8INz9icR8j1wxFgkF5Y/2z1rpGYcIWo2XI//nGKTuoWbZrzy8I
	pj5c+PE1kJtho72bNCBEASb3GO05NK1OT59UjkqgmeHPzHUzT5fcZ1zRDwKRoVP+GQ7VE0e+2+K/i
	ki7eZcQbRWaBpBDmCH4vXhtFyX1XADU8yfNmFGwVqTTNtxj8rtyKvzHbRA+nv5U/IAOGG+jTgDZRw
	WDk2Ye6HPjDzgc46m/BTkwX1LTOKK3L4RvUAYzUtPjHI9F0iPqntolPyYH2zHlsV7UJ26i9iXhUYd
	cKw5xM9w==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwY2-0000000DDQk-3y3d;
	Wed, 17 Jun 2026 20:07:43 +0000
Date: Wed, 17 Jun 2026 21:07:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, jack@suse.cz, viro@zeniv.linux.org.uk,
	brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de,
	david@kernel.org, hughd@google.com, baolin.wang@linux.alibaba.com,
	linmiaohe@huawei.com, nao.horiguchi@gmail.com, lorenzo@kernel.org,
	rppt@kernel.org, peterx@redhat.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 04/11] hugetlbfs,filemap: replace
 hugetlbfs_read_iter() with generic_file_read_iter()
Message-ID: <ajL-jsMdL0u1wGo2@casper.infradead.org>
References: <20260617172534.1740152-1-jane.chu@oracle.com>
 <20260617172534.1740152-5-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617172534.1740152-5-jane.chu@oracle.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92685-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jane.chu@oracle.com,m:akpm@linux-foundation.org,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:linmiaohe@huawei.com,m:nao.horiguchi@gmail.com,m:lorenzo@kernel.org,m:rppt@kernel.org,m:peterx@redhat.com,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,zeniv.linux.org.uk,kernel.org,linux.dev,suse.de,google.com,linux.alibaba.com,huawei.com,gmail.com,redhat.com,lwn.net,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,casper.infradead.org:mid,infradead.org:dkim,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF64169C4BF

On Wed, Jun 17, 2026 at 11:25:25AM -0600, Jane Chu wrote:
> +++ b/mm/filemap.c
> @@ -2672,20 +2672,30 @@ static int filemap_get_pages(struct kiocb *iocb, size_t count,
>  {
>  	struct file *filp = iocb->ki_filp;
>  	struct address_space *mapping = filp->f_mapping;
> +	bool is_hugetlbfs = is_file_hugepages(filp);
>  	pgoff_t index = iocb->ki_pos >> PAGE_SHIFT;
>  	pgoff_t last_index;
>  	struct folio *folio;
>  	unsigned int flags;
> +	size_t min_folio_bytes;
>  	int err = 0;
>  
>  	/* "last_index" is the index of the folio beyond the end of the read */
> -	last_index = round_up(iocb->ki_pos + count,
> -			mapping_min_folio_nrbytes(mapping)) >> PAGE_SHIFT;
> +	if (is_hugetlbfs)
> +		min_folio_bytes = huge_page_size(hstate_file(filp));
> +	else
> +		min_folio_bytes = mapping_min_folio_nrbytes(mapping);
> +	last_index = round_up(iocb->ki_pos + count, min_folio_bytes) >> PAGE_SHIFT;

I don't love this.  Is there a way we can get mapping_min_folio_nrbytes()
to give us the right number for hugetlbfs?  I don't see why it wouldn't
be possible ...

>  	filemap_get_read_batch(mapping, index, last_index - 1, fbatch);
> +
> +	if (is_hugetlbfs)
> +		goto done;

We don't actually need this, do we?  For hugetlbfs, I don't think we
can get 0 folios in the batch, and then we won't find a folio with
readahead set, and they're always uptodate ... so we're just skipping a
few tests with this?


