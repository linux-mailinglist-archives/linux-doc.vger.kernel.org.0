Return-Path: <linux-doc+bounces-81052-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCYsDIrIwmmIlgQAu9opvQ
	(envelope-from <linux-doc+bounces-81052-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 18:23:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A388319F0D
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 18:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 041CA3075978
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 17:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9895C3EF66E;
	Tue, 24 Mar 2026 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RUY9QL7p"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA63D75DE;
	Tue, 24 Mar 2026 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372208; cv=none; b=Qqow+mcDcasDiGbmIU+/HhP39yvkjgAa6kK9trSXeiTd/1eynw8sT4bRdmIcYgVB15xRy5ppkYzCNPUt9iiIefqhG8jlRtR+1RXGIMJks0NM9dedlO6cTvx8ciZkxHw6chl10UgPVRKuREu9IXZ5vx7lvJjOP5BIiCiq2qm0P2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372208; c=relaxed/simple;
	bh=a3KtJ0D/0gEIavpbdjApd9/TksfIm6E+jevZbppbKPA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=usyNN4ZUTb2q9cgKmrUe7ZTHH8+iwN+e0+BK2BJX8Cp+fkDNB1LahI4S0K0xPVU5+bLz0mblFFPohhHNhhBRy6gtUYhQ/4zi4TrwcuK1LZLI+aBhRbPSP6KaS0nB/DCEj6kt7fSMC7d1r7vCX9wiQ3wL67kGK9wT52whCnfZedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RUY9QL7p; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6E3EC411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774372206; bh=dB/htb9Upg/hQepZ9/7FKDPBN6cyr4DCCk8BTbHiAtU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RUY9QL7piNTRt665J8doLxXxL43KW9joCD+L9DdQ5Q2mj2YjVjM+es+RHuY1pbsjL
	 jaEWNg24QZEIoruRnuJFwR1WrDQsusHhjIhdhjt7nwZhS046cuu23xvMtVBlfJhOn+
	 tVM2EUK82YzbBVP7ay7qXtoXtOFvLBaDHKoVMXWudfpC1sailR4LrgFDUNGg7YF769
	 0BAaRX+B+OuXu+1D8jzVUZzlhwbf3TKqoUHQQrcSoHPJ74ExGT3jUpgrHYPfOMAnec
	 6oVo42Uf46KeXf/bSoezR1Lky5gQkJjyFzSvDxv1SpLxw0NyI0I+xB0imqR+gveF3W
	 x6gt/Js4D4SIQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6E3EC411C2;
	Tue, 24 Mar 2026 17:10:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Josh Law <objecting@objecting.org>, =?utf-8?Q?Tom=C3=A1s?= Pando
 <tovictakamine@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: driver-api: fix 6 spelling typos in
 Documentation/driver-api
In-Reply-To: <2F84DD09-2880-45E0-AA98-204F10848F85@objecting.org>
References: <20260324163604.5710-1-tovictakamine@gmail.com>
 <2F84DD09-2880-45E0-AA98-204F10848F85@objecting.org>
Date: Tue, 24 Mar 2026 11:10:05 -0600
Message-ID: <87a4vxtaqa.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81052-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[objecting.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,trenco.lwn.net:mid,objecting.org:email]
X-Rspamd-Queue-Id: 4A388319F0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Josh Law <objecting@objecting.org> writes:

> Acked-By: Josh Law <objecting@objecting.org>
>
> Patches like these are good clarification 
>
> Keep it up!

I'm all for encouraging contributors, but an Acked-by from a random
contributor to a typo-fix patch, without having even bothered to trim
100 lines of stuff, is not particularly helpful for maintainers.  What
is your purpose here?

Thanks,

jon

