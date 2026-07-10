Return-Path: <linux-doc+bounces-96330-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hN+TI4VMUWpfCAMAu9opvQ
	(envelope-from <linux-doc+bounces-96330-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:48:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C764C73DEEC
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:48:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=SC4E8LPZ;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96330-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96330-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1E78300BDB7
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8103438AC64;
	Fri, 10 Jul 2026 19:47:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448494499B3;
	Fri, 10 Jul 2026 19:47:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712856; cv=none; b=VGu3ieR8YWfaXbV6cJPTY0SBWzp0pybyAitQINSUvw8X2A9OBZCXxqYB+4E+TTBbw5ESmkcoP1WzmZ++752l94yvjI+qCWuTy0HIkoIFL/XfPAdjF2zDYYHx92J7moziFkZKP0ftuWwe3wA9XMMsXXj3jVT+qqayvaV86HsdSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712856; c=relaxed/simple;
	bh=0X/qCCKL9UANwFgR3pTc0oc/lfNkg0wO1r173BWHSAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k22enhowf50EaAWy7fAiRyRa5B5V/aOu0N+kDAxcQ8bPjMxhw3bkzscQCSO2uw8XNZR7hEBpFUTL1MYno0VjQpkN9gr60GsCpNmCONhL5HyinFcwtQkS7IobGdPXqDau2YGsHT8rzuSORlXQIGysP9SJqCR7C4wyWOHP7mRrITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SC4E8LPZ; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 580CE4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783712854; bh=00BSXGOOGWfgLcBkQzMzpCXADoTtnnnoI+P3mZOGIgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SC4E8LPZP+3WA8lqxo3Zstc5pzdctDg4CizYA3bTYuECYrknq6A86IfwoMcwhUu6m
	 7zKKt3VW/CDDYklI5uKxkKGhYd7O6MnoYCTfV5e81gDxv+Hv+jqGz585LQAU1S4Psn
	 wMFLvYabsXKtS8GvCsdtUTZ5N1q+ipgMxuQH4kIqGwsJe6t7zgQxnt4z8Ilnle4tM3
	 OTgIty/2sMulOb8iSJtZS+Ryxss4KAgi2fRKA0x0LusOSR5DZ9mTnfYL10WNuy8Smf
	 ceurop63088A05xBGooAmxTufmIJO7gRH4ZyGNwgoQxaMFKdmhj/fgNEI6oBKCIxB4
	 ctMVpUrLjEj0A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 580CE4108A;
	Fri, 10 Jul 2026 19:47:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Seongjun Hong <hsj0512@snu.ac.kr>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Seongjun Hong
 <hsj0512@snu.ac.kr>
Subject: Re: [PATCH] docs: ABI: README: fix grammatical error
In-Reply-To: <20260701125501.93170-1-hsj0512@snu.ac.kr>
References: <20260701125501.93170-1-hsj0512@snu.ac.kr>
Date: Fri, 10 Jul 2026 13:47:33 -0600
Message-ID: <87ik6mk4oa.fsf@trenco.lwn.net>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96330-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hsj0512@snu.ac.kr,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C764C73DEEC

Seongjun Hong <hsj0512@snu.ac.kr> writes:

> The Note describing how to write ABI documentation fields contained
> a typo. "The fields should be use a simple notation" should be
> "The fields should use a simple notation".
>
> Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
> ---
>  Documentation/ABI/README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
> index 315fffe1f831..27c962e6a872 100644
> --- a/Documentation/ABI/README
> +++ b/Documentation/ABI/README
> @@ -62,7 +62,7 @@ Users:		All users of this interface who wish to be notified when
>  
>  
>  Note:
> -   The fields should be use a simple notation, compatible with ReST markup.
> +   The fields should use a simple notation, compatible with ReST markup.
>     Also, the file **should not** have a top-level index, like::

Applied, thanks.

jon

