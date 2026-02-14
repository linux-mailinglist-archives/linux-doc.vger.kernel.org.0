Return-Path: <linux-doc+bounces-76023-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLtXOTKtkGmscAEAu9opvQ
	(envelope-from <linux-doc+bounces-76023-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 14 Feb 2026 18:13:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF4A13C92E
	for <lists+linux-doc@lfdr.de>; Sat, 14 Feb 2026 18:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 312F03003BF9
	for <lists+linux-doc@lfdr.de>; Sat, 14 Feb 2026 17:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2342D2C0270;
	Sat, 14 Feb 2026 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WRQO3e/a"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0597581724;
	Sat, 14 Feb 2026 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771089197; cv=none; b=QPe9qzU3c6vdvkW1Re+XVMjX18azQEEzB6grXRBigxspwnUUO7OXysJUMGJYV9WtK2UoEn2dkBvZX9+pjcMPmICbIbHypK4/5H4k4CtMZ4c68QOD+/CNIYh6s0OcXsa3Uvv22tULUeMvDqdA3s4KP+iQp4I46Xa8WEGtnUWXxYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771089197; c=relaxed/simple;
	bh=48i+HFt/c4UZCeQLTeSrlr5a4mR6u6OfuMPDPPl3OnU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ureZsuI0KHl0QrRPERNFjrGk16Su2s/8E2491ycpAbtfK2meVv/83/JZeYSrjSW6w3lXCfP6D8pzUspNyCrvQvEB+nM+ybS94kz6wUzogHzTj1NAgWrXcWwKQ7h0Bf39g8IGN9fU9uiV3eQaWKsW6iYv3Z0u1e+X2MnQWGwcdEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WRQO3e/a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47D20411EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771089195; bh=hZico+0X7dDimHx4WVJUWac7oNWgOwG2Gus+OJXlHwM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WRQO3e/aJQAedd50jGeKaJJqBdfRZQdiSoHk/Ls5xUPz/WjIHMIs7jK3EBoNjhqeV
	 +JuzvhfQr6qwEZ92WHFppXvufun/wSueLKqNRcXYhFVGweKjQDP+HgM2k9gb8JLG4I
	 +vkE3NoOVPsDF29eCJD1q9g/P8kA2c23ta8PA9kisj6FvLlYq4AQDY1OawVirEHOQJ
	 oXPjAd8WAlLqMFJnV73bWMy+f5HBy9s2/xbAuPHX+5+XwICyCDEm21fU9YfZJ2BvOn
	 6iXnGxUMXs94Ihm1YvYLeo1tr0HxWkjiZnb0TvpuH4DHz0U6E8b0r/KhS17zTstNdz
	 uxIAbBbDYTP8w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47D20411EC;
	Sat, 14 Feb 2026 17:13:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Min-Hsun Chang <chmh0624@gmail.com>, akpm@linux-foundation.org
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Min-Hsun Chang <chmh0624@gmail.com>
Subject: Re: [PATCH v2] Docs/mm: fix typos and grammar in page_tables.rst
In-Reply-To: <20260209145603.96664-1-chmh0624@gmail.com>
References: <20260209145603.96664-1-chmh0624@gmail.com>
Date: Sat, 14 Feb 2026 10:13:14 -0700
Message-ID: <87ecmnqmdx.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76023-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Queue-Id: EBF4A13C92E
X-Rspamd-Action: no action

Min-Hsun Chang <chmh0624@gmail.com> writes:

> Correct several spelling and grammatical errors in the page tables
> documentation. This includes:
> - Fixing "a address" to "an address"
> - Fixing "pfs" to "pfns"
> - Correcting the possessive "Torvald's" to "Torvalds's"
> - Fixing "instruction that want" to "instruction that wants"
> - Fixing "code path" to "code paths"
>
> Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
> ---
>  Documentation/mm/page_tables.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon

