Return-Path: <linux-doc+bounces-87497-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJWFC32+BWpLawIAu9opvQ
	(envelope-from <linux-doc+bounces-87497-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 14:22:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34470541897
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 14:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4F8230125A4
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 12:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32D53D967D;
	Thu, 14 May 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eIL+huTD"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F43F3AFAE7;
	Thu, 14 May 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761335; cv=none; b=kG0WAYiXyjmHU3oy7oie2Zbvi/Fr1lhQWmAwhMyrdo3iyvU6LCSkw/GFtub1NZjDA4O9VeC8aLZePoJAc4pNPARtUTwz8rHB4QhImnOuCca9jcraBGopwzHBgw4abc/sBCDa4xdBWCHFHXlqzLuIM+Vu/W0r/L0QaOc4OCUj1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761335; c=relaxed/simple;
	bh=u9b4TrEtyf0bBABP+TvIW5QlccJBlkbQCO3Zk3EbfU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ENaHNZw/KCEEtABaCFwc0EHtHfiBsJHXbIAXtsoEZ7ZTcvvHSPwru4l3UetRFYcI9Aysaz6zKctt8T1uvs9skyDNtlKWOyjbKFdVKKxYjVvuSOne8Nthjbq2dXYf4XcqTqwLncIC3jDgD1KrD5AFxwalfFLn2dbVTONV5Z4qkGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eIL+huTD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 57B83410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778761333; bh=u9b4TrEtyf0bBABP+TvIW5QlccJBlkbQCO3Zk3EbfU8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eIL+huTDbCuY5c8276HBWk/26UAx5YxWil51TmBg7+DpdOoaYhA9kxP8UpZoShX/f
	 63gXVBmKrznklxPTjJreyK06deu57Kf0GcxFEBgWP9fRWCRZN7umFAfcQvKanp7p2O
	 GEIR255K+8cp8WRbkpcSzM3iwB/Zwr7X8txwkugfMG5b5Wod2WcU3ViA5hC06JSQbB
	 lRUX67N3HLMW7Rc5reLLXk0noIgDHo0HuFZTiktg/xIzYD6arTeT5k79DQcX74xri0
	 0hZszAspcHXkSzuZbEHvTJ+z7BZ4gvvP6yIsXMY5G4s0QOfEAnDJEJE6R5Fsd9dTMH
	 Uvzeoar8xza7g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 57B83410B5;
	Thu, 14 May 2026 12:22:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
 skhan@linuxfoundation.org, security@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
In-Reply-To: <agVQWKR63Nqs8rp-@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu> <87wlx8o87g.fsf@trenco.lwn.net>
 <2026051333-puzzle-smokiness-8096@gregkh> <agRfFoMC2Gcu0Esz@1wt.eu>
 <87ecjfmpzj.fsf@trenco.lwn.net> <agR1-2Sj1KO9oM2k@1wt.eu>
 <87fr3v6my2.fsf@trenco.lwn.net> <agVQWKR63Nqs8rp-@1wt.eu>
Date: Thu, 14 May 2026 06:22:12 -0600
Message-ID: <87wlx6uqob.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 34470541897
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87497-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1wt.eu:email,lwn.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Willy Tarreau <w@1wt.eu> writes:

>> (While I was there, I noticed that threat-model.rst has no SPDX line;
>> what's your preference there?)
>
> I didn't notice any was needed, I tried to get inspiration from other
> files for the format (I'm still not familiar with the rst format
> though this time I could successfully install the tools).

In theory every file in the kernel tree is supposed to have one; many
documentation files lag a bit behind on that front, but we try...

> Same for
> the label at the top BTW, I just did what I found somewhere else,
> probably security-bugs.rst which is similar (no SPDX line and has a
> label). So regarding SPDX, I do not have any preference. If one is
> needed, let's pick what's used by default, I do not care, as long
> as it allows the doc to be published.

The top-of-file label got started somewhere and has been cargo-culted
extensively since then; it has proved hard to eradicate.

As for SPDX, the most common is the basic:

.. SPDX-License-Identifier: GPL-2.0

Thanks,

jon

