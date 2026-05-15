Return-Path: <linux-doc+bounces-87664-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yADMEDsrB2ppsQIAu9opvQ
	(envelope-from <linux-doc+bounces-87664-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:18:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45B5513BA
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00352303BB36
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 14:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AA648B384;
	Fri, 15 May 2026 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K4oHDP2G"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE93A1689;
	Fri, 15 May 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854257; cv=none; b=IpFAk4PrtPr63lRlt8P+VQxcyak5eCsXwevKKUUNzXfPXhtmRHNHFNweMSWjrgBWUdJeQj3c0pG6OMHhsmnB/WGyhyAQZ0x5L+rxO2A3BOPnhefwwC2NmcAVgEEXgwE1QjjzSc10gL50mMhi7MiNZ/rKmTGYeRqCDBWVLC7Jf7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854257; c=relaxed/simple;
	bh=EQLmR9lH/s6dARjpwZGuJLeUc9GM540ebrSZ+TD6hcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lIGzwnXLul+ri18opPrXaVNC25nHbt9VRSjgjCphSlatJpVfO4VV55cLEhtfAZjeX2NoklxPr+C1oL4Aa3WcZn/xgoIErxm1eelgulJju0eZMVVYY6KtA2G2U6uj1oQuDqLoXIhH52/SYnuUdOo4MtsGZoLVFLRmCJnBEZel1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K4oHDP2G; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 48917410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778854255; bh=bVqun54WR3LQmTHYOXAJ0pTNA8u/mahb9rRj+Rlq01I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K4oHDP2GkNYOve9VADr6tn/QlJ9CYkddH2YxDOhDpBbadOkR8KNWxjYU3k6s024JZ
	 0uDXbGyn/qihVQNslAw0R5oGQmYyR9BBNn/VoUX6qPlvaoJbyIax8cATQQBJN7/v8m
	 Vlfd8X/DI6M6kknKn4yCN9qJxTP/ttReGyo9Bgudz2jmKU6F7W4RIkE3N18oLKlv1k
	 rDFXHTSALctePschHXz01BTgr9ERIuTG1GsGz81VOeRMwT0EbOkDaxl4lI/3tYyer+
	 oz69/l+7r877RLbmEimgB6beBAMHd96jC/xrpRZc4u0E5yS+VV9rFY+vpttADSFdQF
	 aipQj0c/c2vbA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 48917410B5;
	Fri, 15 May 2026 14:10:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mayank Gite <drapl0n.kernel@gmail.com>, Paul Moore <paul@paul-moore.com>
Cc: Mayank Gite <drapl0n.kernel@gmail.com>, Serge Hallyn
 <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix typo and formattting in
 security/credentials.rst
In-Reply-To: <20260506225925.271163-1-drapl0n.kernel@gmail.com>
References: <20260506225925.271163-1-drapl0n.kernel@gmail.com>
Date: Fri, 15 May 2026 08:10:54 -0600
Message-ID: <87v7corcep.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 9A45B5513BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87664-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,paul-moore.com];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Mayank Gite <drapl0n.kernel@gmail.com> writes:

> - Fixes a typo in "Keys and keyrings" section. Replaces "keying" with
>   "keyring".
> - Updates formatting of keyring types.
>
> Signed-off-by: Mayank Gite <drapl0n.kernel@gmail.com>
> ---
>  Documentation/security/credentials.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
> index d0191c8b8060..4996838491b1 100644
> --- a/Documentation/security/credentials.rst
> +++ b/Documentation/security/credentials.rst
> @@ -189,9 +189,9 @@ The Linux kernel supports the following types of credentials:
>       be searched for the desired key.  Each process may subscribe to a number
>       of keyrings:
>  
> -	Per-thread keying
> -	Per-process keyring
> -	Per-session keyring
> +	- Per-thread keyring
> +	- Per-process keyring
> +	- Per-session keyring
>  
Applied, thanks.

jon

