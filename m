Return-Path: <linux-doc+bounces-84808-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOUsJGWV72ktDAEAu9opvQ
	(envelope-from <linux-doc+bounces-84808-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 18:57:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CBE476B56
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 18:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEEA13011761
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32B83D647B;
	Mon, 27 Apr 2026 16:54:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E293DA5B5;
	Mon, 27 Apr 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308894; cv=none; b=ruEEVG3J6slq0EmjGMyqjRFSMbLay9sJUehe1CbfAldIc9pvKqYTnQ4YjojgfWsYEt8OrGwCOjdTRe5LuJzwJwApK1wFJXLE7sRNDc60vH9GlJadTtkFBvY1vh1RQymzj4A6V87UZx77WrA2hw787vA0/52DfYFwhD+zlt+JHtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308894; c=relaxed/simple;
	bh=1TBRRPrFLk2bz0suI62lFmFUtQ4JnpN6ZZb7MUXCn3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UQIjx2biAwOhSbXGASFJAprrdgMc9vCa6cUXTEzYs4bUWaSNVp2FV2ca2q+eKeGVjjGSChFiuJ8VHKWqtQ9AvoT+pAEqPeSpkl/3jCzYEQ2/Qcs1IM2PKQF2Bfp0ISJThRqiKBx0slZYXZfCgYd2H/CCNK+smPrQX7/II3foj+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 6E4711A022D;
	Mon, 27 Apr 2026 16:45:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 51E122001C;
	Mon, 27 Apr 2026 16:45:18 +0000 (UTC)
Date: Mon, 27 Apr 2026 12:45:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rdunlap@infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, matteo.martelli@codethink.co.uk,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/rv: Replace stale website link
Message-ID: <20260427124530.69cbb711@gandalf.local.home>
In-Reply-To: <93666b516d93f880ed14c3b9309e203014a7deb0.camel@redhat.com>
References: <b845c448-1655-4860-9b6d-93d6f8426740@infradead.org>
	<20260427085526.111835-1-gmonaco@redhat.com>
	<875x5crb4g.fsf@trenco.lwn.net>
	<6d7e529c7cb0ad599669e3f33e5b6168e92a8861.camel@redhat.com>
	<87340gpvdg.fsf@trenco.lwn.net>
	<93666b516d93f880ed14c3b9309e203014a7deb0.camel@redhat.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: gy1bpu36qat3h9zdf97qwysazhsm1ngm
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/oe6Boibh4hGCiF8SyQDlU43dwDND20jo=
X-HE-Tag: 1777308318-462931
X-HE-Meta: U2FsdGVkX1+qukr/rxrsDPI+RgpiKfpE2+25PGYf6wG8ZYRYn0+snH0K1UfJ32QLFGOS5bLXE/uM0M4K5JSRECg+1gdScUubPlS30ql8b2pgxWZ7R2tP7XUgEXFcCOMetdMLX6lJLHv990MmfaMrBvdajkebOlSN+7lK82NGnYRPZYFBYkqQ3NlbQZ13lLTq6S4re+wmUTfGqdORJzDchCm+uguBtcZIhxPbV5r3yaenSIK0qe1E8dmjtm7BOl3b2e0Te/a5Ns+EnoCKqGQeTl36/VaLDcfnzBS1PHbaDQsYNYLLrhZBrZ/wlEu34i+o4SLAd0RraDily1Yq7XXEoD/xmLEg46U0cztrdeO269iG50q8gj2SAMDlRSP77W8rWLWN0e6OMQY5j+LviqxHAbaDSdkR91xJJneeBa1Spn47ev7TsAjJ7Q==
X-Rspamd-Queue-Id: D6CBE476B56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.983];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-84808-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gandalf.local.home:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sssup.it:url]

On Mon, 27 Apr 2026 14:56:46 +0200
Gabriele Monaco <gmonaco@redhat.com> wrote:

> >=20
> > I will defer to others in the end, but to me it seems that we should
> > make life easier for our readers whenever we can.=C2=A0 Providing a link
> > seems better than requiring them to search for it themselves. =20
>=20
> Alright, makes sense. I'm going to send a V2 with [1] (the open access
> PDF), in the remote case the link stops working, we can update it.

Can you add both?

[1] - Daniel Bristot de Oliveira et al.: A thread synchronization model for=
 the PREEMPT_RT Linux kernel, J. Syst. Archit., 2020.
      https://www.iris.sssup.it/bitstream/11382/533630/1/Elsevier-JSA-2020.=
pdf

 ?

-- Steve

