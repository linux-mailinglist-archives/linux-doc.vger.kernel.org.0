Return-Path: <linux-doc+bounces-90538-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nQk8GIzwHmo7ZgAAu9opvQ
	(envelope-from <linux-doc+bounces-90538-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 17:02:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310362F8DF
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 17:02:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90538-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90538-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 171B630B3EF1
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 14:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94713630B3;
	Tue,  2 Jun 2026 14:46:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3C360EC4;
	Tue,  2 Jun 2026 14:46:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411598; cv=none; b=fGsgT+hx2CxNnWmeySTr4nO2ahdOBcR5kbFCEp23CIu9OuSjbLnTklGGRa6KKgHcYv7zltmyUkBNf8DzJkrtgAqP4vviRWUFvSghUE5HuVp2Yu8J97nT/pL+mDAkhQZyIauBPUno+t6V25XTh+8WPm/Y7ymDUQtzl4TLTB7uyJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411598; c=relaxed/simple;
	bh=NTuVaCjECHf4Ct9I+q3M9mk7iCttpPGrNcGnrd4xFvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNwRUrLeSVu1JnL+opRHyrOUf/6nUgWIOocvTt+i2U6SwrfNelgaUQNrM39ghqXYgjB9zLGzUmCaru3t96oEaDZeVlX48bDIRuqRRq5D2gu+g3SJBY0RRq9Pjp9kVu8qPBw85iTQ/lJm27pyPK0AJJRQhsgODkip2a22FapBZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1CB3468BFE; Tue,  2 Jun 2026 16:46:26 +0200 (CEST)
Date: Tue, 2 Jun 2026 16:46:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 8/9] block: add configurable error injection
Message-ID: <20260602144625.GA5333@lst.de>
References: <20260602054615.3788425-1-hch@lst.de> <20260602054615.3788425-9-hch@lst.de> <ah6li1JOGrpXor9W@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah6li1JOGrpXor9W@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[lst.de:query timed out];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90538-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lst.de:from_mime,lst.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0310362F8DF

On Tue, Jun 02, 2026 at 10:42:35AM +0100, Keith Busch wrote:
> When nr_sectors is 0, it is reset to U64_MAX so overflows if start > 1.

Yeah.

> I think you want to remove overriding nr_sectors to U64_MAX and do:
> 
> 	if (!nr_sectors)
> 		inj->end = U64_MAX;
> 	else if (U64_MAX - nr_sectors < start )
> 		return -EINVAL;
> 	else
> 		inj->end = start + nr_sectors - 1;

I ended up ordering a bit differently for better readability, but
yes.

> > +	mutex_lock(&disk->error_injection_lock);
> > +	if (!disk_live(disk)) {
> > +		mutex_unlock(&disk->error_injection_lock);
> > +		return -EINVAL;
> 
> I think we've leaked 'inj' in this error case.

Yes.

> 
> > +	}
> > +	list_add(&inj->entry, &disk->error_injection_list);
> 
> The __blk_error_inject interates this list with
> "list_for_each_entry_rcu", so shouldn't this be list_add_rcu to match?

Yes.

> > +static const match_table_t opt_tokens = {
> > +	{ Opt_add,			"add",			},
> > +	{ Opt_removeall,		"removeall",		},
> > +	{ Opt_op,			"op=%s",		},
> > +	{ Opt_start,			"start=%u"		},
> > +	{ Opt_nr_sectors,		"nr_sectors=%u"		},
> 
> Shouldn't start and nr_sectors use %llu?

lib/parser.c doesn't use those prefixes, it's a bit weird.

> > +	if (!options)
> > +		return -ENOMEM;
> > +
> 
> On failure, memdup_user_nul returns an ERR_PTR rather than NULL.
> 
> 	if (IS_ERR(options))
> 		return PTR_ERR(options);

Aarg, annoying.  Because memdup_user does return NULL :(

> 
> > +	case Removeall:
> > +		if (option_mask & ~Opt_removeall)
> > +			return -EINVAL;
> 
> Leaking "options"? Should this be:
> 
> 		if (option_mask & ~Opt_removeall) {
> 			ret = -EINVAL;
> 			goto out_free_options;
> 		}
> 
> ?

Yes.


