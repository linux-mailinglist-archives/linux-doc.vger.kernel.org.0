Return-Path: <linux-doc+bounces-90960-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BdfKH8OeIWpxKAEAu9opvQ
	(envelope-from <linux-doc+bounces-90960-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 17:50:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C799F641942
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 17:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=FOLi5fU3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90960-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90960-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EB7630B8FEE
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 15:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9F42C11FA;
	Thu,  4 Jun 2026 15:37:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC0349CF0
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 15:37:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780587448; cv=none; b=HmUPiOlA/Qbc2XwgYW8AaA0pugj1cx6zMM4DuxRhyZarAEn70hDn2Yc7B87AVEdzOy4de1l9PDYDXar/hbvgrVYOI4d94vA2N7fp5kwVNHGEEEpDw9eGxCfrz6kuIDlWj+jL2ioMO/iiz/pKtw0ZgqLf+2NNVOZxUbYXc3Py1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780587448; c=relaxed/simple;
	bh=wxGh5PEkfcZqXPRqz5y0thgmlbePCBL7/nAKSKQ78mI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RlVrruT2nicuWADIH3LbmHmwrPH9A1aeP8YoG3QNwO62KGqmVbqg5bE1+ypZL2sxrXDw8Ut+jvU5cMk+38WYbrwQMzuUzoQ99zq0bG7ZSuNPRFAFZG3O6wNBF/kwHM8jEZe3qDAvNvX2LIYyJB0+ubtrzaVGGo/KcBvVVy9rKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FOLi5fU3; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5C20340E4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780587441; bh=4OikeQaqhQU8KGqdoGdlozVAkLjx5eliFXI8Yhe0+r0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FOLi5fU3g/Nt1l4E/FrAQWqrAzhYKsa9F24yRxMzc3LMeCVZ+9qleVX/kcPrm5rKz
	 /akIJRzelsev2WDDHFRHRSs6swG5D2yjT+iTLv1kAagOkO99jiHdKU6ZnO/IXSTSV4
	 JNZdL+QcLXmGw+LHO3YfTbRSBWQ44cRQDibPkwROcjbkDx5V2p19d6lKW5UlcEFK/y
	 81t1YgcUMXFSrncWIddp5NNG832h2po687uxOOWkh+kqCooO3LnMOFXiAcsPIsMvIA
	 UvyVpGrrNsno0J2I/stcNAnrqcAvnZbEr49jhZIJts95IKy9o+mCT+NN40rh6Oczqy
	 FGH1IcILbOZaQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5C20340E4C;
	Thu,  4 Jun 2026 15:37:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, Daniel
 Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: update "Purpose of Defconfigs" section
 in maintainer-soc.rst
In-Reply-To: <20260604031840.17236-1-amandacorreasilvax@gmail.com>
References: <20260604031840.17236-1-amandacorreasilvax@gmail.com>
Date: Thu, 04 Jun 2026 09:37:20 -0600
Message-ID: <87v7byz58v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90960-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:amandacorreasilvax@gmail.com,m:danielmaraboo@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C799F641942

Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com> writes:

> This update includes the "Purpose of Defconfigs" section translated
> to Brazilian Portuguese.
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
> v2:
>  - Adjust translation of section title to "Prop=C3=B3sito dos Defconfigs"
>    for better clarity in Portuguese.
> v3:
>
>  - Fix plural agreement in section title
>  - Clarify that the referenced device must be supported by upstream
>
>
>  .../translations/pt_BR/process/maintainer-soc.rst    | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Some requests:

- Use scripts/get_maintainer.pl to create the CC list for your patches.
  If you don't include the maintainer, your work may fall through the
  cracks.

- Three versions of a patch in three hours is far too fast; wait for
  review comments to come in before reposting, please.

Thanks,

jon

