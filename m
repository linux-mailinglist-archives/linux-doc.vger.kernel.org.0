Return-Path: <linux-doc+bounces-96313-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ggrhJ1FDUWoEBgMAu9opvQ
	(envelope-from <linux-doc+bounces-96313-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:09:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85673D973
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:09:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=Yu+Xa2O8;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96313-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96313-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64ED5301D30E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1C737DE84;
	Fri, 10 Jul 2026 19:07:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F82A34BA42;
	Fri, 10 Jul 2026 19:07:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710458; cv=none; b=Ko5EiWP8LB3WxPBE3UMOUu0NYIke2swwysQYXP90QT1vWTO71ZU8LQea2Gw8FUH8jo6LU8Yq7YxHCj/Br+DpU12hrUsMWPDZpCmQL9jpkdFFfIDsjQofKwpQaQogCgQsZuIPL1d2igrEP7oewqeOROcYkWnZsKdF2qBMbWLhSYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710458; c=relaxed/simple;
	bh=eVzl3ZKzOmwMgYUy4vaRUwOPxQoy1+4R3QbEUI1c+mw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jOgI21RsIQpJHialDryGo8qZnQ/GUzwIkhgEPWPD4HaRz9mOrH9x7sqs/IwrEWecLgZh/q4sFhcfWAqLVKFDheh31XsO2R/Rcz4OwXaf/FdKYPnJAhEq+elVSaGuEKu8GFbtu8nwimqvRl2HCzrXchoKXAVu/1RHITfodlfi4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Yu+Xa2O8; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6E2154108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783710456; bh=DKAYXLbvcdS/nh/N0UtEn9RkpPQVxQ83fkRjJXpZedU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yu+Xa2O8GVdCgtW7Ra41DnenwKG/fQ22Q7cqt3mzOV43auwNS4BsJi1jhS1BQPmZh
	 QZicCcIxq0vFEgl8ARCbB6pDf4RnRsfa39SEd3+DaZpRp3irmxZS90UddJDpHUHtZH
	 CWdur9P429Mn1d3Fhuh7+KDN2eurGCVikQlXEuw/9mXqdBr0ZHTSR0bFq+1g1qUaWn
	 EGIlxW4P9EpGR9Z+u6vAL8qsdtPnv4wS1lUjOkR1wlE9lVoxeT/G7M1iwMByQamAHn
	 OOv7ExJ/CQlb3RQODR3mmXf0OFVArHkm0uKiWlJSdR2l7cXYhbrkOYA9/6bNEJg1BO
	 ia4LLJJB+HbqQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6E2154108A;
	Fri, 10 Jul 2026 19:07:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dma-api: remove needless bracket
In-Reply-To: <20260708194821.357548-2-manuelebner@mailbox.org>
References: <20260708194821.357548-2-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:07:35 -0600
Message-ID: <87pl0ull3c.fsf@trenco.lwn.net>
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
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96313-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lwn.net:from_mime,lwn.net:dkim,mailbox.org:email,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC85673D973

Manuel Ebner <manuelebner@mailbox.org> writes:

> Remove single ')'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/core-api/dma-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index ca75b3541679..ba23a472f794 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -508,7 +508,7 @@ call to dma_iova_try_alloc.  This can be useful in the unmap path.
>  
>  Is used to link ranges to the IOVA previously allocated.  The start of all
>  but the first call to dma_iova_link for a given state must be aligned
> -to the DMA merge boundary returned by ``dma_get_merge_boundary())``, and
> +to the DMA merge boundary returned by ``dma_get_merge_boundary()``, and
>  the size of all but the last range must be aligned to the DMA merge boundary

Applied, thanks.

jon

