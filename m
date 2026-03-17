Return-Path: <linux-doc+bounces-79764-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPY6EjVruWmvEQIAu9opvQ
	(envelope-from <linux-doc+bounces-79764-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:54:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64E2AC6E4
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B86BF3101B92
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 14:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D563E928A;
	Tue, 17 Mar 2026 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JtWtgB0E"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E93E867E;
	Tue, 17 Mar 2026 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758573; cv=none; b=Iyh17HArSZ3UDHpR7SvkUlfq0lCUKjAxeH2y/ECgRTCPyXfe85jTayARCul62kMBkjDJ709QtaFfHBGNKa17e/NVyYaRFWSd3abLQ/VRDz4WgHubtPV8MbSCRLtCvYcyZkTM4EPj1rxix0hEmteEeICwJhJ4ciLbKfycIfu5qbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758573; c=relaxed/simple;
	bh=Qf7IWL2/NIdGRPYBhO0j23ZEodEy0saiGYf0eif7kmU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W5V3dQu/Yg20+t4n35HKcs+vbA4m9/iO8JPabJ/BcFTMsTIiuqbwWvNBkPf1gm16OuXYPYl5P7ABTp35gBWIu3vYvUAXp9PCvvF9CH9dO5Vi0GjFT0HPO09ujLkJQp6jUCdniHs3Yv+skU0zVh3UY6kF0ghChQwrG3HR9pjtByQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JtWtgB0E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C4AC40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773758571; bh=xiACo0uXwWMytqqIn4eiGLQQoI8qzv7/g4ndl16IPjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JtWtgB0EPSbw5xODoO9MD4sYgG2iLFUNqG4PwHqte4NBJoDxFD4UBZ5vghVmgXWsJ
	 2uogIimpACu+8t24vZn0Zf2yUzK1POaxu+oQgSaZQVyvURP6PozTqxbkvgLg7P3YGm
	 JjBpY8JkLpkPmvoYJQRERJEqNRCKPerTeehzrGfdVzN9VUQjDQGCAJM4o0v7VR13SP
	 b6SZ+mEeiN5zYbF9FAlux7OPOdUbRAfIpeyXsJLmtR0Depk7lXKfEDjLIvoaGpL7VW
	 CG9FG4STWYJIGa5J/NU5EbnyUnNUxf6QhnvzOdEcbfUqC+DdopePTxVgvG/i8Xk4+S
	 HmuQKGm+yymrQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C4AC40C7C;
	Tue, 17 Mar 2026 14:42:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: pr4veensingh@proton.me, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: memory-hotplug: fix typo 'fo' -> 'for' in
 NODE_ADDED_FIRST_MEMORY description
In-Reply-To: <by7jSPCep0WcWKD6nntH0wGbcN59hRhsEOc2lHBps2QizxRtedH25CdW8DO33YiqJU3Y7kGWesJnBts-jvgMzNqDvLWH3cTDYpJPuNed9hU=@proton.me>
References: <by7jSPCep0WcWKD6nntH0wGbcN59hRhsEOc2lHBps2QizxRtedH25CdW8DO33YiqJU3Y7kGWesJnBts-jvgMzNqDvLWH3cTDYpJPuNed9hU=@proton.me>
Date: Tue, 17 Mar 2026 08:42:50 -0600
Message-ID: <875x6uecut.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79764-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid,proton.me:email]
X-Rspamd-Queue-Id: 7D64E2AC6E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

pr4veensingh@proton.me writes:

> From cf0fb033799f1766841d876728f52ee84c89c676 Mon Sep 17 00:00:00 2001
> From: Praveen Kumar Singh <pr4veensingh@proton.me>
> Date: Tue, 17 Mar 2026 11:10:32 +0530
> Subject: [PATCH] docs: memory-hotplug: fix typo 'fo' -> 'for' in
>  NODE_ADDED_FIRST_MEMORY description

Please do not include the above in the patch body; the maintainer just
has to strip it out.  I have done that this time.

> The description of NODE_ADDED_FIRST_MEMORY notification contains
> a missing 'r' in the word 'for'. Fix the typo.
>
> Signed-off-by: Praveen Kumar Singh <pr4veensingh@proton.me>
> ---
>  Documentation/core-api/memory-hotplug.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
> index 8fc97c237..46b0490f5 100644
> --- a/Documentation/core-api/memory-hotplug.rst
> +++ b/Documentation/core-api/memory-hotplug.rst
> @@ -96,7 +96,7 @@ NODE_CANCEL_ADDING_FIRST_MEMORY
>   Generated if NODE_ADDING_FIRST_MEMORY fails.
>
>  NODE_ADDED_FIRST_MEMORY
> - Generated when memory has become available fo this node for the first time.
> + Generated when memory has become available for this node for the first time.
>
Applied, thanks.

jon

