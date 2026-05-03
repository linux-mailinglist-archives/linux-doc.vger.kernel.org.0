Return-Path: <linux-doc+bounces-85553-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MJUKiZd92llggIAu9opvQ
	(envelope-from <linux-doc+bounces-85553-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 16:35:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D84FE4B616C
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 16:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10F15300915C
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 14:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40572242D7F;
	Sun,  3 May 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pa3xVno3"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE6199931;
	Sun,  3 May 2026 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777818915; cv=none; b=DfjDCy9P6RiFfTwLXjdu9bux/AFaJJ6iYKfkH27ANP8UW7QvZlUNr31uJvgoI1vpoim+z7o0xBm6NJqf4hrh9QEIsdddnlKKIWl7v7UBGeXsQyr7i2S2bkvlsgGCOfvOtjm6ZStsbAXVXq03air/UZ2/1NVBXtcY0cvE6TxlbyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777818915; c=relaxed/simple;
	bh=kkpinCA2TNcPQQGtKe0EgLxSQpBydr/JcqctiYNQY18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JPKklsDl6dfiGUP7Gd/hJ/MCyhWAuBzq5yKeTYUcVU7MMx9PewzzRmfabECkEJJOdFZ1yyMxwC54LyNOL+PEO5fr0fZIxmhYw29r7ZkJPGLSt+UOsjTF407CrL52E0pkV8FFpPywChh+TzIvh+4J6lQ2wiaGMslLG25YiCC9QrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pa3xVno3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7395D41084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777818906; bh=Pb7BFxNf3U63kKwixT5ywxm0H7aoGebyYiLAYZY0jCg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pa3xVno3bc5Q5Px7hhCtNSvpxBqEUWpjVRkCTJ2x08RP9nw+z7PqxpCH4Pk651fMF
	 5VMeezcMC4wPAFayX5BYm8qOjXxU6CC5Z/mg+16cy1gu/uw7d4MD8hVfbnMvbH8d0C
	 zabfl373u+H2CXu0xWc51ShHfr1hXSNJWQ9eGvyTOfZ0O8E0HSaoV8lhYaMi2riegL
	 6+6scuOs/R9jj3D/pgbmy4o6dr02V18cvjyTE5tIMyWs9onjtXiLs3vEcDcc4DxfRM
	 TTlgaYGxlejXsPP6uBBkjIfs6SIJp1YsfjXhQxWYYCQdkuR27WyM+kGjSoQ4iJcV7s
	 VtW5XmRQSHULQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7395D41084;
	Sun,  3 May 2026 14:35:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Wang Zihan <jiyu03@qq.com>, linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it, skhan@linuxfoundation.org,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com,
 linux-kernel@vger.kernel.org, Wang Zihan <jiyu03@qq.com>
Subject: Re: [PATCH] Documentation: translations: Fix "Linux Torvalds" ->
 "Linus Torvalds"
In-Reply-To: <tencent_B98271DD90AC356719E15C06ACE473BB820A@qq.com>
References: <tencent_B98271DD90AC356719E15C06ACE473BB820A@qq.com>
Date: Sun, 03 May 2026 08:35:03 -0600
Message-ID: <87ecjsef3c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: D84FE4B616C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85553-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[vaga.pv.it,linuxfoundation.org,kernel.org,amd.com,vger.kernel.org,qq.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]

Wang Zihan <jiyu03@qq.com> writes:

> Fix the misspelling of Linus Torvalds' first name in Italian
> and Spanish translations.
>
> Also fix "Linus Torvald" -> "Linus Torvalds" (missing 's') in
> Italian translations.
>
> Found by Christian Marillat.
>
> Signed-off-by: Wang Zihan <jiyu03@qq.com>

The fixes all seem good.  It should have a proper Reported-by line,
though, and it seems you didn't CC Christian on this email...?

Thanks,

jon

