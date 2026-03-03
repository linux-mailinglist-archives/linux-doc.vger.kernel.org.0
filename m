Return-Path: <linux-doc+bounces-77716-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGQuDMYTp2n9dQAAu9opvQ
	(envelope-from <linux-doc+bounces-77716-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:00:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8C1F4517
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF6C83014688
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 16:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958323E5574;
	Tue,  3 Mar 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nrqiwGYy"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD43A873D;
	Tue,  3 Mar 2026 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557187; cv=none; b=V1V8k4HSF8cVOyaNfQ+o6ZJeO8LAUjQt5WUwOYFBJV6wre1dzCByCfMajNIiM8fzVKmK4U4CzMX8/+Uot5r8qWayaIfXjeYcOvdxGDVwmFpRBUkgMXJSG6ZhuiogdqqfV0BRJ18OXps2eG5eCIF1gQpbH+CkOPdK0N5vRWGdaU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557187; c=relaxed/simple;
	bh=r5yjF1wj0UJruMFw3A533ayP1R0nFVwY4t546AsKSXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K7pPLmbZGPGnMO2PDlvAbfbKNhZvt6O8tD/++JQ2I2EujobRMwCWap+1Hj2rfb8WUgkBviq27Z4DcvY+Sb+mFuYWzw6q73tORPnkpDqNMCXPogtmVG9Rokr/11gM8oprD+E7FJ2COtCJaIHHyIiMhmhvjDVLoDupvhGzMpxPxwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nrqiwGYy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A615840429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772557185; bh=dQCtiGPQYWay7eTnHtUCzo46Pn9N+OuqJR6mT4rR3cM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nrqiwGYyX7QMjQYqLdOB+7Jx5llMeULn32jN3FKfcrf4E3G7q8WDiPmqDr06rWQkV
	 EzgnN1RIM+u5ao2Jhb4g5I1YezdT9aOcBhwfYWjWdlraIw8DSWkrCCT4x7vJ/npP62
	 /YmE4xaF7UUUs82qUge69Ynn+oyeodA+gXtXnq7OfgpkRUMg37K8rSAvbDBLyzLmr8
	 DD/1x42WGUtzrTj9hvrl4JtG+QfRi7gQGDT9NQHeLGigonykcz6zgdZHYhYu16VbDP
	 +5hZbVVPKZFxQ6bqflmcrg92k4/qYMBSYVHKH0zDY+DzeJR2iBpVoKqCxEGYCrnjxC
	 b6uvPfl+PoZoA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A615840429;
	Tue,  3 Mar 2026 16:59:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Blum <thorsten.blum@linux.dev>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/maintainer-tip: Fix grammar
In-Reply-To: <20260302135141.3213-2-thorsten.blum@linux.dev>
References: <20260302135141.3213-2-thorsten.blum@linux.dev>
Date: Tue, 03 Mar 2026 09:59:44 -0700
Message-ID: <87seagdf27.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: D9C8C1F4517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77716-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[linux.dev:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lwn.net:dkim,linux.dev:email]
X-Rspamd-Action: no action

Thorsten Blum <thorsten.blum@linux.dev> writes:

> s/a empty newline/an empty newline/
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  Documentation/process/maintainer-tip.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
> index 41d5855700cd..b2b14439be22 100644
> --- a/Documentation/process/maintainer-tip.rst
> +++ b/Documentation/process/maintainer-tip.rst
> @@ -352,7 +352,7 @@ following tag ordering scheme:
>       Changelog text starts here....
>  
>     so the authorship is preserved. The 'From:' line has to be followed
> -   by a empty newline. If that 'From:' line is missing, then the patch
> +   by an empty newline. If that 'From:' line is missing, then the patch
>     would be attributed to the person who sent (transported, handled) it.

Applied, thanks.

jon

