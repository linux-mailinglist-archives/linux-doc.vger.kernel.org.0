Return-Path: <linux-doc+bounces-89399-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFmLH3evFGqWPQcAu9opvQ
	(envelope-from <linux-doc+bounces-89399-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:22:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1665CE444
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F7C83016C81
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 20:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B3B35F176;
	Mon, 25 May 2026 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fyoEU8ZC"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21C29D29F;
	Mon, 25 May 2026 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740532; cv=none; b=Upl7KmodEBj8HXCh8SfNY1lANwP9sTqIHYu5/BcN+eKHfLQ/TGPRTjNGO+uF2LbfIZUlhlrAhkM3Ou6kceGIQ0BWBquMYPb66eZGGA3ESlq6fgUpgewmhLjHbCer7B0+rHdLoGSL7yTy1Q2Jl6rC79hyauWcwRfqjIkOAgPR5DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740532; c=relaxed/simple;
	bh=IodBNjASylY6YOFuqoCqPYJgyrvior+rJJSdcGAap14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S2M6z9golzQvvMsZgPXpxZEaWSWzBmTF7BEZkSAhuaB+BbvhISX2k3cng1H9B218nI0UtvRA1WIkhOwHBRxpWstJ6KqrJAR/WoyLAqLb9c7Vq+ZuqejYsiqaziq6ra6F7bGS9avLc21JbXdcWsa1eskyIgTGoYdv6E83/VHVRbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fyoEU8ZC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3127140B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740531; bh=RWviewJkQIKaj9NQsEOpwuAmrm/WAC4wnc2Ra638X+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fyoEU8ZCSZD8iBOyUL4U5EUWdU2Zo3O6D99ARk9s7eBIHlGWCryHHcaC9jJzuoOhG
	 C5veZbHKbreeYkE53Tg+MSOnJ9ZJONoMV00p+favsVv5yOWn4xhjdSwMad/X/fHhl1
	 WMQfRyQU71wmjBMZTDjIuZVbJWE7VAvE2F1aw6lzqaz4pL/pjfxLEoltKJ6YZtvXFM
	 OTPGBI4vuV1HnUM1w7mVvistuyN/XGby4MyLKbNZVC49d+LidEeIrV38h0tqJyd0FK
	 pN2EvhU/smfYfcouGTwf4hltBWqR9GSF3yj1mvXmK4pqzD0pFw1dF3h0w66vaYEDJ5
	 EhUxO0DdHlY0w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3127140B0C;
	Mon, 25 May 2026 20:22:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sakurai Shun <ssh1326@icloud.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typo in list.rst
In-Reply-To: <20260517040714.8024-1-ssh1326@icloud.com>
References: <20260517040714.8024-1-ssh1326@icloud.com>
Date: Mon, 25 May 2026 14:22:10 -0600
Message-ID: <87zf1nz1cd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-89399-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[icloud.com,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,icloud.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DD1665CE444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sakurai Shun <ssh1326@icloud.com> writes:

> Replace "reinitalizes" with "reinitializes"
>
> Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
> ---
>  Documentation/core-api/list.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
> index 241464ca0..4819343a2 100644
> --- a/Documentation/core-api/list.rst
> +++ b/Documentation/core-api/list.rst
> @@ -752,7 +752,7 @@ This is because list_splice() did not reinitialize the list_head it took
>  entries from, leaving its pointer pointing into what is now a different list.
>  
>  If we want to avoid this situation, list_splice_init() can be used. It does the
> -same thing as list_splice(), except reinitalizes the donor list_head after the
> +same thing as list_splice(), except reinitializes the donor list_head after the
>  transplant.

This one was fixed a month ago; please work against docs-next (or
linux-next) when generating patches.

Thanks,

jon

