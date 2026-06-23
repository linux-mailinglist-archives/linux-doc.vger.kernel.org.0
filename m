Return-Path: <linux-doc+bounces-93317-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gs0xNaHuOmrxLwgAu9opvQ
	(envelope-from <linux-doc+bounces-93317-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 22:37:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ADE6BA0EF
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 22:37:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b="cuiSzY/B";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93317-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93317-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 027203021E5A
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 20:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B5D3955EC;
	Tue, 23 Jun 2026 20:37:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F13A6B9C
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 20:37:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247021; cv=none; b=e72lXcaganxOEFRvQ2cz3f7juU5r0gwRsPdV1sE/stclJYOFlJmXwcSMPhBSa3clFiTiJG1oScy0RgfkBF3WASfC+CBqftrwbBb1lxCweDvyIFfQuOxibiTgBSnMMRfznedom7k/mJ+qkZumdIE03RZ8OvfQL1ApIEYIOdch7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247021; c=relaxed/simple;
	bh=4d7rbSUoknYWkqLQldukzHGAy7E7sYvSut49rhPhijs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E0QcZzA88HigRX2qhfMBCDUIChXMhG50BdNzCY84k4xOJH7+Y4tRW2Dq4KvoYb7mwBIF5t0q6W5VxoZlKn7GdbEYcXD0KyRtqKP8xmdQgN0e4aHhfMoFgYpRhdMrmvmZ2bK2wKDbQi4X1m7EbeEHAbcnufkjS7mz1rO2jAk6ECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cuiSzY/B; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A731141592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782247019; bh=tcGaOMIfoHNHvpsb5leLrOaPbNSZ4kNxIce0fkbKdOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cuiSzY/BUcGZc4U0TvXvAZw8Www83Jb8BL3N30GfhHFVbHHV0bAXjFyrQEMwVBPIJ
	 VQpRX4xXMfycCSioBxHXpnecCli752m1X0MFH2nX5clMgzWl3p//N+DniAyEljT9zr
	 Lo+L7/8eg/NxxXQuTepOcD8IgcLnIlsCyLbB8Lm58vs0rftM66h47Rid/hulDHQaov
	 BX4YpmVdccFhmKE6m8EbNutnBJ45IVazKzOQlxilmDgFGSFircuKPQIiuaTPruqYt7
	 YJuIDQbse8PaxTMu+GzJv1WE/H7I3eApekdpKjPWf+l8QcCR6n7/oaCZ9cpkqiidP+
	 OnMLcJzHGYH2w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A731141592;
	Tue, 23 Jun 2026 20:36:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Fix regex for kdoc
In-Reply-To: <20260615154057.2156589-1-willy@infradead.org>
References: <20260615154057.2156589-1-willy@infradead.org>
Date: Tue, 23 Jun 2026 14:36:58 -0600
Message-ID: <87a4slat91.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93317-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:mchehab+huawei@kernel.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,lwn.net:dkim,lwn.net:from_mime,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29ADE6BA0EF

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> The trailing '*' means "all files in this directory, but not
> subdirectories" which excluded tools/lib/python/kdoc/.  This is surely
> not intended.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d94420eae3d..999957a3e0ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7653,7 +7653,7 @@ S:	Maintained
>  P:	Documentation/doc-guide/maintainer-profile.rst
>  T:	git git://git.lwn.net/linux.git docs-next
>  F:	Documentation/
> -F:	tools/lib/python/*
> +F:	tools/lib/python/
>  F:	tools/docs/

Applied, thanks.

jon

