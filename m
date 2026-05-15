Return-Path: <linux-doc+bounces-87671-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC4WOcwsB2oLsgIAu9opvQ
	(envelope-from <linux-doc+bounces-87671-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:25:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D37551583
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0B033002E44
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 14:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B392A3B19D4;
	Fri, 15 May 2026 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bJbAwpj0"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3E3644C6;
	Fri, 15 May 2026 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855083; cv=none; b=jGJzc/HRfq16PrD2+2cXd8PRJlaWsNN2nhq7C3ZvmYVKiiQzZ125xYQjKWJBrHD5N6b+U3LQSxsyvoGBMS56Fa5njk/fcCjbVVAlkciZ979heLG8zlHl3TL+qNj9TcfopK76xxl25lGbBlNvXveKftc1utrK8psR9/S6X4Uox7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855083; c=relaxed/simple;
	bh=3DiJgyfPq3xnTtCKRtiC8wm23wJPX8GfQvZtRbZcz3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i2Th3JAWfkG9Ofn84iFZ+DAiy46lwfRE0G7THNoJ2KZ6RVSeok3NLiv0YUCa3u4IvKbES/4vvVfOq94sUplpGCzCvgKZyV6zOMySVm1RHwZwUP5AUvXAA4T7RvLeyt5tQtAehqaF0id4qh8nNx8ftltGtrVLPZ5T1lv9zVpO+YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bJbAwpj0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4A83D410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778855075; bh=ohNchLk5gAAU6hAND7s6bUUwHtS10xJjW5wCO8yXh0Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bJbAwpj0ZYDzZ6JvkHJobOVegOR8y+qm5UhbcAjc71P6KtqspF3o3iI3TsipuGwPU
	 jhqmjbr1oJgaIBkttPXP01sjz/SvMPAOOcvpi7G+35iX3pNRN/fyt95F+CLgRmH1+F
	 3vnvcB16pBbUabzp4MGoSAjqh6NJPIl6H/xyQGp1I2q1jffZOyRQ1NF/TmY+eC+SCA
	 Vqow3sy+wj6jZQxxCboIq7uSf7MAWJvOoNgxemzL143IhUGT4ePXQIrUS45vnJisuv
	 YYxI0/x8OmtshLAoZrScFow/p/fhl99AUbcZ0Hz+08P5agF5BlU4/jMLDfJhx6c7w/
	 HHH+rK/Ggjc+A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4A83D410B5;
	Fri, 15 May 2026 14:24:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: locking: Fix stale dquot.c path
In-Reply-To: <20260503160221.1594319-2-costa.shul@redhat.com>
References: <20260503160221.1594319-2-costa.shul@redhat.com>
Date: Fri, 15 May 2026 08:24:34 -0600
Message-ID: <87a4u0rbrx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 66D37551583
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87671-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Action: no action

Costa Shulyupin <costa.shul@redhat.com> writes:

> The quota code was moved from fs/dquot.c to fs/quota/dquot.c
> in commit 884d179dff3a ("quota: Move quota files into separate
> directory"). Update the reference.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/filesystems/locking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index 8421ea21bd35..277e49314d32 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -584,7 +584,7 @@ write_info:	yes		dqonoff_sem
>  FS recursion means calling ->quota_read() and ->quota_write() from superblock
>  operations.
>  
> -More details about quota locking can be found in fs/dquot.c.
> +More details about quota locking can be found in fs/quota/dquot.c.
>  
Applied, thanks.

jon

