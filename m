Return-Path: <linux-doc+bounces-84708-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kE0mJMs272kw+AAAu9opvQ
	(envelope-from <linux-doc+bounces-84708-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:13:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B1470B26
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7B2F3011531
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043843B47F9;
	Mon, 27 Apr 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="p1dSDxgk"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC333B47D8
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284313; cv=none; b=gMGGCsga0l6CJD/e2iUvU64mbF5hdqMS5t0oqSRj+TskNB7x9VhsXwmoudOdVn9Nep1j5Jdet4uL6kQ1o7bMW87X5VksXafbaFFU7k4OA4gwCueJUU0vtz6fqGiLsioPWqAsbOrzn99WsAUyyrC7bfYB6I+WZekOiFjy2DT3xMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284313; c=relaxed/simple;
	bh=Q25Gfo07z80ys76ge17Zp0BGA9Rj8pKbaP31+rPRHHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cnpuJp7K/LXxLc1N8XDVc9KDD17xKvzKzvIqYaXhRc4ML393bv7b5LP8SBpbA0BzEa5Xub/lGwpzMQAoiC8V6O18WjBwEUKULLoRaqZNEGcAnLQ8lJ/HQC3aYJm8PNlVJNOZG6Ue/qCtiJVJ7yEvXC/GwEYU4ksQKgqhWB0Nyb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=p1dSDxgk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DFD6441098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777284312; bh=g/CktHUxtVkOWCoix776tJFsy6XD0cWxekB5npX/qIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p1dSDxgkvo64g5g+1EefXSYQFg82qZEk47z0ikfx/qSdXI2cs/9eMdC1oUqAJ8Bay
	 yWaUlsM1+Wp/kcmU0zrb2TUM6FeIAT5bwdbcdF2hXnVwE3TA0taAeyZqDoP/XM/hkM
	 g5t8Yi66xcuarYUcnQAaUhwu8wZqURn5IznkXrLj2rsj31oE4j+bzbGfnGDHoiTl1D
	 bBvKaayiVsZ64nPg49umbl+uIpFjmdgkPsfSTSTKnOZu/Oq7ApdTcennXg6Z6YTkyc
	 QXJsCoprt+k7wDctS0UpKztSMS+58EXwqegBpse0wCDNpySZa2NrMns1e5a8StT6Ah
	 Hx5mbwv++W1xQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DFD6441098;
	Mon, 27 Apr 2026 10:05:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: fru1tworld <fruitworld.planet@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, Hyeonjin Kim
 <fruitworld.planet@gmail.com>
Subject: Re: [PATCH v2] docs: fix typos in kernel documentation
In-Reply-To: <20260415001204.6428-1-fruitworld.planet@gmail.com>
References: <20260414084553.22762-1-fruitworld.planet@gmail.com>
 <20260415001204.6428-1-fruitworld.planet@gmail.com>
Date: Mon, 27 Apr 2026 04:05:08 -0600
Message-ID: <87bjf4pvl7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 954B1470B26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84708-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]

fru1tworld <fruitworld.planet@gmail.com> writes:

> From: Hyeonjin Kim <fruitworld.planet@gmail.com>
>
> reinitalizes => reinitializes
> unpriviledged => unprivileged
> sub-struture => sub-structure
>
> Signed-off-by: Hyeonjin Kim <fruitworld.planet@gmail.com>
> ---
>  Documentation/block/data-integrity.rst | 2 +-
>  Documentation/core-api/list.rst        | 2 +-
>  Documentation/gpu/drm-uapi.rst         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon

