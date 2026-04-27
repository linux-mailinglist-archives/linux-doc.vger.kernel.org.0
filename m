Return-Path: <linux-doc+bounces-84710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AELFB/E372nV+QAAu9opvQ
	(envelope-from <linux-doc+bounces-84710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:18:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E7470CA3
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 352BB30427CE
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 10:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846AB3B47D6;
	Mon, 27 Apr 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QBlaAQvk"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461FC3B0AE7;
	Mon, 27 Apr 2026 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284593; cv=none; b=W9zUg1kvVAucgIijSNP0yNZtIVS2ieljMrMPRHMWx2GxTazERxrPrbIzmDa+BddIVt9VmFbdYrwqWk07+UBZ5c6deY9SP8/DaHlRi4PGA5AUrAGxVpx3weQJVwwKbF9ZRu0YmjM3u2TkZuRsxCRQEaltnA/7ejvX4mjGfX/iG18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284593; c=relaxed/simple;
	bh=YfCNDZ564Bhc3bSTnI02hxM0RszAMJ+Q5Cd+4uMkU4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eCRiU/bxizRClgSzknQ8ypZGEab/2w+goyXDwbzmn7CFpLtC2nxT8Bn3+AbgJGiuhGAuzl6hsTSuhCTru3iBORSJ5PJHMz9LWGluA2d9qH4WvkakQ0/1NP5aE0JMCwGvWXMvyKZ75zZSxuERmRx3ztNeU6LY+i8N9IEcD07oM8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QBlaAQvk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 151E641098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777284591; bh=zPIqFBHBwjthz0pfxMxsmPEqV2gOYW4ZlTT9PcIUWEI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QBlaAQvkODRXJhrS7V3sxPVSlSYkKAdU9aGGAuWVGjY695gUyZQKTIFc5o+XW59p8
	 ucW3ayUQv/m+5PltlQx2zTxRDqNOa9Vy4vo8aBrs9En+U3KGmOi5vXgZ6c4Sxz/yRs
	 HVLX3GFmOISfZtXuNRf9IFj2OADEigg1F94gX8zzPAuM2MxKTvpLEaCrB6wm4//sLp
	 nD2krjwc4oT4dz9Wtf3NzxvLBsRFL518vg1dWBpXvkQ2/HcRmH2ReIFH4Be+nJqc1X
	 QYorpTc8gVPsK6CGm3/NC+DS+Cgd5J72BIX+rfCMsB1ty2qvuX7L2G38pKw23OsH7q
	 Eb0ny3o806dCg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 151E641098;
	Mon, 27 Apr 2026 10:09:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriele Monaco <gmonaco@redhat.com>, rdunlap@infradead.org, Steven
 Rostedt <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: matteo.martelli@codethink.co.uk, skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/rv: Replace stale website link
In-Reply-To: <6d7e529c7cb0ad599669e3f33e5b6168e92a8861.camel@redhat.com>
References: <b845c448-1655-4860-9b6d-93d6f8426740@infradead.org>
 <20260427085526.111835-1-gmonaco@redhat.com>
 <875x5crb4g.fsf@trenco.lwn.net>
 <6d7e529c7cb0ad599669e3f33e5b6168e92a8861.camel@redhat.com>
Date: Mon, 27 Apr 2026 04:09:47 -0600
Message-ID: <87340gpvdg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 7D3E7470CA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84710-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]

Gabriele Monaco <gmonaco@redhat.com> writes:

> On Mon, 2026-04-27 at 03:44 -0600, Jonathan Corbet wrote:
>> Since, as you say, it can be found online, is there a reason not to
>> include a link here?
>
> Mmh, perhaps being overly cautious for the link not to break again?
>
> The paper is published so I assume it's always going to be available in
> some way. It is currently hosted by the university at [1], which may be
> unlikely to change, and can be found via DOI at [2], which should never
> change (at least that's what I believe a DOI is for) but brings to the
> publisher's website rather than the open-access PDF.
>
> I think the reference to the paper I included is robust yet easy to use
> with any scientific or even general purpose search engine. But if you
> believe using either of the two links is more appropriate, I can send a
> V2 with the change.

I will defer to others in the end, but to me it seems that we should
make life easier for our readers whenever we can.  Providing a link
seems better than requiring them to search for it themselves.

Thanks,

jon

