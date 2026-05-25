Return-Path: <linux-doc+bounces-89396-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLJIH0+uFGqWPQcAu9opvQ
	(envelope-from <linux-doc+bounces-89396-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:17:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02C5CE3F6
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9F15300406F
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 20:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B6930C145;
	Mon, 25 May 2026 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="la/zpYo2"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C452032D;
	Mon, 25 May 2026 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740234; cv=none; b=aYKtpYE4K9u+uY1NZHXVmyd4jtKpZKEjeO0RHV9lKvwQ4IpH93dtBMad5ecfU6f7y3ZdZB+tjRyPUEWUV26MBCS+ortlsQ0Ra1ht0yAPTupa5bmeaNgXCZr02jo0Hphr4dLybllFWRHppGyadrTj4qPMGfZWKGF4qTcDg3Rs9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740234; c=relaxed/simple;
	bh=9St+23T4ZWbodsJnE1Sb0jbfKhmYm43xFCeYRF6vMhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IHcY++eDro4CKTSnu+Mq7XWrwDE9QgNT6AIdCuKIRLOikNBd7ZukLZqINGOrM8Ux+bcuNtyoDQAWStzam+JSddgBAFstldiFWipZ3a8WU/lF8G/ePVrzp25HtEJuxkERse1YlLZh7fEi/deliykDB3oLTd3TRR+UkIKY2VkAzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=la/zpYo2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4D5A440B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740232; bh=evOSW8le8jGYEdnDauDxm34GWwO19llaOmsSDeb8Xqo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=la/zpYo2pW/COzPVR5YxsgaMTJoWXXc/rg4+LerU1i5ahN3IaJzZsyY6X/ZMAJQwY
	 9vtUaV1gYiLTYwN5XCDBhLTJ2VNedzxDCJIw3kXqyOQhu1PDjwwd1Rl7UAj7Y/qdmC
	 0KuDHGfZRRuS2BF7QfbJ24mUbPiTCZ9BVTNu8N3PZN8RcDWoWZ/9gCBRNLjVj4KAHy
	 5gIQxSdnWu2+NGcc3uOOuexR1Gk4wsGgUw8j3VdSFOP8O2H/cfoCoua7iiMwRqSCZ2
	 XiL8Qc5kSqnLtgymbINWQmKm48PvD+uquSlM1kyKxBUjQJ3LeoW0iLlFB0Zg/F1+X3
	 eYmdG/8RSp5Sg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4D5A440B0C;
	Mon, 25 May 2026 20:17:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: MigMarGil <miguel.martin.gil.uni@gmail.com>, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, MigMarGil
 <miguel.martin.gil.uni@gmail.com>
Subject: Re: [PATCH] docs: md: fix grammar in speed_limit description
In-Reply-To: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
References: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
Date: Mon, 25 May 2026 14:17:11 -0600
Message-ID: <87cxyj1by0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-89396-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.883];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Queue-Id: 7B02C5CE3F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MigMarGil <miguel.martin.gil.uni@gmail.com> writes:

> Replace 'This are' with 'These are' in the md sysfs speed limit
> section to correct grammar and improve readability.
>
> Signed-off-by: MigMarGil <miguel.martin.gil.uni@gmail.com>
> ---
>  Documentation/admin-guide/md.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This patch looks fine, but we need a proper name in the signoff, please.

Thanks,

jon

