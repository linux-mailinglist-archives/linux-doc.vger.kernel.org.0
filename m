Return-Path: <linux-doc+bounces-76652-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM7kIOzLnGlHKQQAu9opvQ
	(envelope-from <linux-doc+bounces-76652-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:51:40 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 252B217DC30
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8703730219EB
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 21:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A976C3793C3;
	Mon, 23 Feb 2026 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="auIQeZxR"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2E03793D5;
	Mon, 23 Feb 2026 21:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883497; cv=none; b=T/3O639MUu6h8Eb9hrY8pPFt43E7I5U7lK0gtjyoCfOg6YtaCx2tHdjoI7dQGreWGXGQXSnsOPiElP/vp09N9fav+qf9nda2lXiWeDjkM+GmRBizBrqzAdcm7O5bf7z2RoYT8wBpXI+CouTmE5gOwXkG5cOA+38IbnBoxB3zLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883497; c=relaxed/simple;
	bh=56Jk3qRdxe1f/6E8L2Im01BU1SjexXYQUa/Keqby/Ms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gdbjjTNnSRmEZES+jSWoU+cVoD8VhmzpLqSlkmzgyWCJHemlJKhlw/CD+9TwefZjPdR3XeTM4bsuhR4hTxuZpAzb6v7zKp55+B1K4IZhrfKhS3kuRRDxjnTWiisOfKsWF4vsjnSOvB4vbOhBhcyTXI8ewVrmIxCDtXs0A3TP7NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=auIQeZxR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6B5ED40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771883495; bh=Yz1ThGQpskZWBsKU98vi4yKvMNhTuyz7mj/itculuYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=auIQeZxRJkx8XA7cyzmGoEF1ET7fHP6Mg973oCOPWLv07osjD6lsE6edqlW5IRTgb
	 pTiukn2ZGbUs+A62P6rm4f/HP9o52gh5odAxG6CfC0ckBE1B2RCOtfbDKiGJRW7SbO
	 DQPDcy04XkooPxtNoWmiE3Q+XOhge5t8/2S3kyTuSzd6xH+zQx3N49fCdEFte+OqF3
	 efiJk0j3Zf3ELg+KnO71cy3vKKgTvbksOzAFxv7cAbJvX9pB1tFnbHnDFGtZvUc5i8
	 KV/u4LH/ZtUsla1NfvyGz0rWlrKWRPMp67ZzknlSTUomwDFtlyLJU8iAIwB6qG9juz
	 EUJBkPNZR2FrA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6B5ED40423;
	Mon, 23 Feb 2026 21:51:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haowen Hu <srcres258@furdevs.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Haowen Hu
 <srcres258@furdevs.cn>
Subject: Re: [PATCH 1/2] docs/zh_TW: update personal information
In-Reply-To: <20260220160201.41149-1-srcres258@furdevs.cn>
References: <20260220160201.41149-1-srcres258@furdevs.cn>
Date: Mon, 23 Feb 2026 14:51:34 -0700
Message-ID: <87a4wz3z89.fsf@trenco.lwn.net>
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
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76652-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,furdevs.cn:email,tyut.edu.cn:email]
X-Rspamd-Queue-Id: 252B217DC30
X-Rspamd-Action: no action

Haowen Hu <srcres258@furdevs.cn> writes:

> Get my personal information updated in the Linux kernel Documentation.
> Mainly on:
>
>   * The legacy e-mail (2023002089@link.tyut.edu.cn) had some issue and
>     is not accessible now. Replace it with my current e-mail
>     (srcres258@furdevs.cn).

So ...

> diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
> index 8115a7618307..9b27b1f19355 100644
> --- a/Documentation/translations/zh_TW/IRQ.txt
> +++ b/Documentation/translations/zh_TW/IRQ.txt
> @@ -7,7 +7,7 @@ help.  Contact the Chinese maintainer if this translation is outdated
>  or if there is a problem with the translation.
>
>  Maintainer: Eric W. Biederman <ebiederman@xmission.com>
> -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
> +Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>

Despite this claim, you have not touched this translation since 2023.
And two of the handful of changes you made that year were ... changing
your email address in all of those files.

I don't think that all this churn this is reasonable, especially for a
translation that appears to have been abandoned.  So I don't really want
to apply this.  I would suggest you send me an alternative *removing*
that information from those files, optionally leaving a credit for past
work done in Documentation/translations/zh_TW/index.rst.  The question
of when this translation becomes too old and should just be removed can
be left for another day.

Thanks,

jon

