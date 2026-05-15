Return-Path: <linux-doc+bounces-87655-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM9uHGwnB2ppsQIAu9opvQ
	(envelope-from <linux-doc+bounces-87655-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:02:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C5550F05
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD683051282
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 13:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614B73E8C47;
	Fri, 15 May 2026 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o1UgBH3l"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362AC233134;
	Fri, 15 May 2026 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853173; cv=none; b=iXNI7CBWtnAK0+Bl9hFKmkRjbwPEr55jKf1fWvbRu+XR3XoYp0Asp54oOW3tbXngUkJhuzAaYvJQsuKe00J1Ul57kaom4vJWH3UInYJti2UMvCwH+MFi5Uqqx45wDGWeslipPr9YMECzPndase4oJv5Ewhx33sDhR1/QdOnTGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853173; c=relaxed/simple;
	bh=PvCcuupWZTAEVVfTjqkD7s6OLt3vYU/D8K0tV2C38oY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a9C1+cJR2dSPEACP5gPuGLBeg9puOUGZ/JPXbOmrphepiXNjACh12lW1mOhLzT6EMkyooVw3kh1dOAnWYmj1JCEGGRftSo1ktgVyUogsmj0xNTg9e1KV1o/b4pHT5DeFOhH0ARff/m/ezWOJpTSDZ4xzZqyir15zq+3VLfMSstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o1UgBH3l; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9AEC7410BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778853171; bh=pumQKjzuoXuJIVeU0dee4TPG7tOfwP42PYrT/VbYnjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o1UgBH3lUVAGQe25B0nZd62Kl8YgBleNBEgACDlpJzeBIqvQbd7tmlBG8bRWB2gLo
	 YKnx6buaugJdrCk+a8GXNy+Yho7PlpxHaeWpeI2jIFj2P52h2waxMVLW2PEKpd+aVX
	 MV4gHRJJ1qLc23NReeMjwZWEUBcN/qrMkzpxdh3+nBYlKSQXIo+8xI5mesUPtdU1Uw
	 UOykOeo25YayrbIvfYW1+9SAEmEyR4z2SFCZDLGiSAjSJmnUUZainqY2uYFodk48/J
	 EUfjSxAZ9BNUrI9NEZjjMdPSnNKmmYeLccGEQnpozyFHRWPlcJI7SJLePs7xaxWuCs
	 ejXf5dSkgdljA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9AEC7410BD;
	Fri, 15 May 2026 13:52:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Clinton Phillips <clintdotphillips@gmail.com>
Cc: Clinton Phillips <clintdotphillips@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx-static: fix typo "wich" -> "which"
In-Reply-To: <20260513195956.25307-1-clintdotphillips@gmail.com>
References: <20260513195956.25307-1-clintdotphillips@gmail.com>
Date: Fri, 15 May 2026 07:52:50 -0600
Message-ID: <87cxywsrt9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: B93C5550F05
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
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87655-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Clinton Phillips <clintdotphillips@gmail.com> writes:

> Trivial typo fix in a CSS comment for the documentation theme.
>
> Signed-off-by: Clinton Phillips <clintdotphillips@gmail.com>
> ---
>  Documentation/sphinx-static/custom.css | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index f91393426..5aa0a1ed9 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -30,7 +30,7 @@ img.logo {
>      margin-bottom: 20px;
>  }
>  
> -/* The default is to use -1em, wich makes it override text */
> +/* The default is to use -1em, which makes it override text */
>  li { text-indent: 0em; }

Applied, thanks.

jon

