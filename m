Return-Path: <linux-doc+bounces-75091-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNhzEj8ugmlFQAMAu9opvQ
	(envelope-from <linux-doc+bounces-75091-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 18:19:59 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C349CDCAFA
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 18:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA13D303C50D
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 17:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84087283FEE;
	Tue,  3 Feb 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rwLu7Cm+"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EA1286A7
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139168; cv=none; b=pp77D9tws0Yfz1jMq2NWq2mE1B9Skd2OoRnOBDzVpT/uAB98SbUkUg2zU+XM8V/b3ELZX9cPpJN6BlH/mxMBzmu2OS6ym9Ryb6t6VngMRXGFNMFdFFdtKVt7F8T8ufTfeakQcuxB1s0lJ/Gr+w8njCLU8xsdJf1JMrwtB6vagmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139168; c=relaxed/simple;
	bh=SsVmg5LkENDMk6ykQHfrh9e020XmHmq/lMFBWRHIRt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cbk6qrJATFWWp71Uq0DA/e6mkTeNBi2aCM7iI6bIhTE0Htk7UFnH+d0kqoCVE0YOzRlZGEZOPFlMql3hxb6uKYd5vaL9X3q+YYOY4RS+spKqbaquzsnAFZiGy7HDAdb3AMKyJbiakpEQXHcnmgXcKI4ss7BwbgcmFm5xa1wCJ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rwLu7Cm+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0A1A40C89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770139160; bh=75JgHLGTTe80ZCfYWgW2VfWUFD6yBjQSWlWyP4OXGP4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rwLu7Cm+bGfTrt1pTMJdj7T6gV7lCHLvemhGCta763yCuubNBPeIbmkJkqE4Yp1CC
	 NmxpimvIvsv5A7QuWHzBGThtJvv8eCpv07dzzwTdNBvfCeC/QSMFil0+XVhiVl8Emd
	 kEtViybUNiKkv6ID515bsT0NGE+MYHD//VYPjkS2TmYMiUSVdhiSCXV8o7XTxchtfr
	 bV5oO7LTGEnqRmwPZ2xVecquRlFkHUTPpJU/3RoLOE3DXcaM+hxd0m4ytL6nNk1X+G
	 iHdQcRpJGG9jTNwOa+ezoIGvGnD5k6WjCdRi2QhUe0R7TCxHoxQsFeU/5oylG2ts6V
	 CvnqeOuNq3Jfw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F0A1A40C89;
	Tue,  3 Feb 2026 17:19:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: pt_BR: add initial Portuguese translation
In-Reply-To: <CAMAsx6f0VC+BxWWuezRK18=2+X6dNwLDccr_vf8-ONOpBQ1WAQ@mail.gmail.com>
References: <20260203120859.65735-1-danielmaraboo@gmail.com>
 <87h5rxrhk2.fsf@trenco.lwn.net>
 <CAMAsx6f0VC+BxWWuezRK18=2+X6dNwLDccr_vf8-ONOpBQ1WAQ@mail.gmail.com>
Date: Tue, 03 Feb 2026 10:19:19 -0700
Message-ID: <87qzr1pwx4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75091-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C349CDCAFA
X-Rspamd-Action: no action

One other point of order: never remove the list CCs.  We do our
development in the open.

Daniel Pereira <danielmaraboo@gmail.com> writes:

> I have addressed all the technical points you raised. Additionally,
> I discovered that pt_BR was missing in Documentation/translations.py
> and I have now added it to ensure full build support.
>
> Regarding the role of a maintainer for a new language: is there a specific
> vetting process or "test" one must undergo to assume this responsibility?

Not really.  The main responsibility at this point will be to review
translation patches; I will generally hold off on applying translations
until I see a review from somebody who can understand them properly.

> I am a Systems Engineer at a data center in Brazil (HostDime) and a
> Linux instructor at events such as DevOps Days and Debian Day. My goal
> is to coordinate a larger translation effort with my students and the
> local community to provide high-quality documentation in Portuguese
> across the entire country.

This is find.  What I would recommend is to go through a review process
internally with your students, then have them post the patches publicly
once they appear to be in good shape.

Thanks,

jon

