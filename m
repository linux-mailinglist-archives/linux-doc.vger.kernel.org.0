Return-Path: <linux-doc+bounces-92178-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JcNSKaNcLGqZPwQAu9opvQ
	(envelope-from <linux-doc+bounces-92178-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:23:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213A67BF6D
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:23:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=iYjyMCjC;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92178-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92178-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F09E3008086
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8AC38B7B1;
	Fri, 12 Jun 2026 19:23:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B7E3793A9;
	Fri, 12 Jun 2026 19:23:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292188; cv=none; b=c5TKj87x3jHY/gPo9W/10R2++//2pUoW+AhSWjF3OuY2lhWqqQsOaX/MnXEMxfhCimrymum9jX/sR5upgmqne37GqggpjECFMd5iSn38kTKwg0o1ZjAouRIYx72hV8nrPg+JxqfTy1636xyKqhF+4Qe1X0VTGPAFkXsaUEBgSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292188; c=relaxed/simple;
	bh=52UPQnVMpNlNFu4WAW2OkVwd2IKumYJCbA3UYhKYCco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WDCq9+Ec6iyklo+Hi7UaFd2ih2xf0929TVLMV/kiUZcOdL0QNRY5FbqYwmX0AIjyDxPPbESJ+MJBcfm0Pe9CuVESKRttPXVrrQf20E4PFg6smKSbHSq0pBf19ioie74DJG0d3+YUlgJ/+PDYtQWmKiT9snIrFgh6D95wr8mhozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iYjyMCjC; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 348EC40E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292187; bh=NbffFQIhIxCqMdIvQ5ur1CIIRP+bZGP9Cq3HmRKJd1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iYjyMCjCflYxctQ6jKq1iqUMALrunl/Q3MYtqWpguhsqXl18K39Us/F/Y2ffhPlki
	 z8oUQWaaRWXXBxWNAWfT6mEdiPqvuqiKevTAW7qCclFRy8fF//4Bv0lj7OKy+/HBQg
	 6u7ADRXE/R1TdVz/tDcgmc3ZhrmeN9mCNYMjeMLfNeyvbDBtZLe7Fdwa3BVWtS0T3F
	 CZ1uNoAMLOj5V0VZF4uhY51z7SnPrAblMUupXT9rzGJz1ZFzEdP5DpjlZkVgdE+PTR
	 ZMAwazSLdhMQNx9QsI+ne56pTFSVCrMTZ4jEIY1f7wyA43zHz4AYaF3g2Ri2iRmJ0t
	 2ODScTXprYS7A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 348EC40E4D;
	Fri, 12 Jun 2026 19:23:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Brigham Campbell <me@brighamcampbell.com>, Thorsten Leemhuis
 <linux@leemhuis.info>, Shuah Khan <skhan@linuxfoundation.org>, "open
 list:DOCUMENTATION REPORTING ISSUES" <linux-doc@vger.kernel.org>, open
 list <linux-kernel@vger.kernel.org>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: Re: [PATCH v2] docs: Fix minor grammatical error
In-Reply-To: <20260609070618.12566-1-me@brighamcampbell.com>
References: <20260609070618.12566-1-me@brighamcampbell.com>
Date: Fri, 12 Jun 2026 13:23:06 -0600
Message-ID: <87a4sz7ecl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92178-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:me@brighamcampbell.com,m:linux@leemhuis.info,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime,trenco.lwn.net:mid,brighamcampbell.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8213A67BF6D

Brigham Campbell <me@brighamcampbell.com> writes:

> Fix minor grammatical error in the administration guide.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> Since v1:
> * Drop pedantic line re-wrapping.
>
> In hindsight, I should have guessed that reflowing the paragraph was
> overzealous. Thanks for the guidance, Randy, Thorsten. I'll remember it
> if I make minor doc fixes in the future.
>
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index cb178e0a6208..3432dc8e1a85 100644
> --- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> @@ -217,7 +217,7 @@ again.
>  
>     There is a catch: 'localmodconfig' is likely to disable kernel features you
>     did not use since you booted your Linux -- like drivers for currently
> -   disconnected peripherals or a virtualization software not haven't used yet.
> +   disconnected peripherals or virtualization software not currently in use.
>     You can reduce or nearly eliminate that risk with tricks the reference

Applied, thanks.

jon

