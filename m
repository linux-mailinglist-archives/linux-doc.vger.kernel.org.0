Return-Path: <linux-doc+bounces-87414-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEZOJhDWBGovPwIAu9opvQ
	(envelope-from <linux-doc+bounces-87414-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 21:50:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F116E53A2FE
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 21:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50060304997C
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 19:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10213AFB19;
	Wed, 13 May 2026 19:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DW5y82hA"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4322423909C;
	Wed, 13 May 2026 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701421; cv=none; b=HjLqzusxJLYAvrHW2wlp4Z/wn7zKMh/z7UCp5Bm/uIBb4o/vNgZTQj4fPV1VpYldzt8sa4Gqd1OxnaGqZrJHj0ROrrs77KepUuAQzOwmhkpAuaexCyC1qX5aIK9csyKgqFYwx8wm1xpQYcz7Q6Bdo6XIQr7DQHGsZOQUoHeOwt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701421; c=relaxed/simple;
	bh=NmcmlAz9U99SmeJGek26lRzqtG/8MaZ8Qixq914OrI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nRxlDduccqZLH7lCz9nLeDNyg2TRzkhJXCXYWetioFQse34713eGqiX3jLG0SNxD/lJmhAHob5T5MOpqdvb3eWNefFdfFherOrlzODJOO1KJz7lqiPtxyQTBiZHyobxugN1CSxPUnksyDk2X43jfS/XC3YCfPi9DLvvjyz6PG+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DW5y82hA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FD34410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778701419; bh=gEfUr97x/O1UEkZyQ6LIL2eickoPNyB2l54Fbizh9uo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DW5y82hACNaDKsYL9js07prApG2+w5TKcZVmBodgFH8chjBZUMvo9rWFD8TNPvsVT
	 Ow1sYTFPB5NoibSNv/Ku/LhxANe3nNXAeI94hLeDFhrM/+YxNEg4GDaE1TEq69cM3R
	 05ePKZ0AtSd6SG6WwuqEFK43AwK77Wz8TTPSPrgoA1KO3HZkwJrRlZEikgb0sEhU3d
	 +2sEkOBW1bmG+TxVwhBYVeEyOwvuyfhndvf2uXY5k2KaTyt49VHLgsdZMmNPe8TM1f
	 Q8E2xEubWZC8ONqC1x0OpXCeSupdj5hEj2y0AmzkxJtEwVQybIXQKc8ug8ilj+qCgq
	 3p/AwQFypeIBg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6FD34410B5;
	Wed, 13 May 2026 19:43:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>, linux@leemhuis.info
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chen-Shi-Hong <eric039eric@gmail.com>
Subject: Re: [PATCH v3] docs: reporting-issues: replace "these advices" with
 "all of this advice"
In-Reply-To: <20260513174009.1260-1-eric039eric@gmail.com>
References: <20260512150431.894-1-eric039eric@gmail.com>
 <20260513174009.1260-1-eric039eric@gmail.com>
Date: Wed, 13 May 2026 13:43:38 -0600
Message-ID: <874ikbksd1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: F116E53A2FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-87414-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,leemhuis.info];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Action: no action

Chen-Shi-Hong <eric039eric@gmail.com> writes:

You are getting closer, a couple of other details...

> "Advice" is an uncountable noun, so "these advices" is grammatically
> incorrect.
>
> Replace it with "all of this advice" instead, which keeps the sentence
> grammatical while also making it clear that it refers to the full set of
> recommendations in the paragraph.
>
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
>
> v3:
> - resend against the original base as requested
> - replace "these advices" directly with "all of this advice"
>
> v2:
> - use "all of this advice" based on review feedback

It is good to include the changes with each version, but it should go
below the "---" line so that the maintainer doesn't have to edit it out
at apply time.

> ---
>  Documentation/admin-guide/reporting-issues.rst | 4 ++--
>
>  1 file changed, 2 insertions(+), 2 deletions(-)

Also, please send new versions as a separate thread rather than as a
response to a previous posting.

Thanks,

jon

