Return-Path: <linux-doc+bounces-87670-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAA0DsotB2oLsgIAu9opvQ
	(envelope-from <linux-doc+bounces-87670-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:29:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6AC551723
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62ABB3041F01
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 14:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FE32B9A4;
	Fri, 15 May 2026 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qgX0yWdt"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD536EA86
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855042; cv=none; b=X/iBhWNp6ptwxWcVTo1ubCJEgsppelwOVfZ8z/L1wr7Kg07Q9B7F1whNJy5FfCPlkcMNSPtZCmjDB+DgpmGTxjhE89akD7VoA23yjVwZ1ujTNvJH1Is+Il1iMicIBrBhFR5+cdbW1Cp98t2yjY8RG+0x+dN1tlqpBX1L7Mx+AG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855042; c=relaxed/simple;
	bh=Vm/osYbTBgn0GbjA6RbPms4tZyz9GrfcKhbGzdialG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=feC3YbdmQEoImsBM4/inO733lJVNxfsb95MSZNse39VC9uxzbItLuQ9ZZ8BKza0cShgSn80rx5WVff6zGrrTJSEw7Ng0SzVC75OEM4AIC4A8wtkVxmHHDJfTa4AdGQULn338B9Ozbc/7GYovqbytKXGCdb/uHJ1AGKTACqXWpeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qgX0yWdt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 31EB2410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778855041; bh=vJkYCmocxCht2qwBk/F+G/Nz3u5Ni0ovYkMD1ukfxQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qgX0yWdtlilQAj2cepD5ei/VvkYo3r/6MoijKPMyJFM3oj1M76x1YZdN/qRU34Ym2
	 MSFjJqqb4G8Dv9ktaARAu2VILpXapJ1HqGpsNDIUbCfM3P+2sv4oaNps6gnwsLvD1l
	 a9qRp3Nm3bAcYPW36eJC+VWjpHYJ+egKBV7vkNMKyhOuof+2ClmnyWj9CyL0RtNXZY
	 0yMFcBGJYgXdjEjCKzYbViCwbgzoVStkcXAxQIxEbH71NqFtEbHYVV4BccW4U54xfB
	 dbEadiNmgQ7pLaINpJes+P6X2Q5MvkS3K95QYT6w7zkuclJ499NOI7ya5hfA1q+1/x
	 WkUrmjSdmk6nw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 31EB2410B5;
	Fri, 15 May 2026 14:24:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate process/license-rules.rst
In-Reply-To: <20260503160352.160135-1-danielmaraboo@gmail.com>
References: <20260503160352.160135-1-danielmaraboo@gmail.com>
Date: Fri, 15 May 2026 08:24:00 -0600
Message-ID: <87ecjcrbsv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: CE6AC551723
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87670-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the license-rules.rst document into Brazilian Portuguese.
> This document provides guidelines on how licenses should be identified
> and handled within the kernel source code.
>
> Additionally, update the pt_BR/process/index.rst to include the new
> translation in the documentation tree.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
>
> ---
> v2:
>   - Fixed docutils warning: "Line block ends without a blank line" on line 72.
>   - Removed stray '|' character from the translation file to fix the build.
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/license-rules.rst           | 483 ++++++++++++++++++
>  2 files changed, 484 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/license-rules.rst

Applied, thanks.

jon

