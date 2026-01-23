Return-Path: <linux-doc+bounces-73848-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDppKUrCc2nnyQAAu9opvQ
	(envelope-from <linux-doc+bounces-73848-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 19:47:38 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1780B79C03
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 19:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE87301CC67
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 18:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672583EBF2E;
	Fri, 23 Jan 2026 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TUdPg1RI"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAF53EBF15;
	Fri, 23 Jan 2026 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194053; cv=none; b=Oj6sOo1vL1BJT0tCgzhJzJhJFO/byyxO9eHA5YZqY/SHLUvCptMogiR6lPvcZaP2IOCEX2hdzsI9M/FZTgMEfLF1ciryIB0QwgGIvpOVxmY50N0ZPYezCEeYKlhZpBhACsE3OHusVEizEyVRxnp3Pul1tOFlJGRjLqgmIVuyvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194053; c=relaxed/simple;
	bh=5XlxCK7v7t7y2+nls7JjzZXQkN4HtV/fKRpisMQaQpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NiR2ZBk6+HtGthVDG4bAQrnC76yfPHigIk8rG6Tmhq5U+J/USZ2YaCmg5WX5p6SQX9ZeP8KYhbZllAZfQd3/ijV1w9zJMZdNh8mdyVs4ZRYnNvazjz1ILlnRhb5o/5HBhfBnCFXsRKymLu0DiIvurVXEwvNyWu5tsJS9pR3q53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TUdPg1RI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47A1040C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769194051; bh=uA+czInQjZldQ+N00GGaAUYb4RKV2NCrKXez7HCjJsE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TUdPg1RIRCGzG5Bd9PmY+bYqthMnUwBPXhZELc8ltIc7DUlS+hVbnaUUKps0p8ad9
	 w2V6HcBbTAZdxI79E07KFUS0M1KvB9JNzb5lMVTYZsD24cZZugfgK63R762R+X1soc
	 cdaZSoLFcv3fRB4OpADxAYbg7lH78lI/hw1GwyyM9nlTUSSZcEG78kiun03rfIcIX9
	 8rlWgavqxF4csfhQPcU9yWBk13EIUjIP0i9jb1XDIHMN1H9C5Lu+/Hz/Wks5zGQBrG
	 zCmUXPZpTV1IBSuHZwQrMoq/Zhm5YICO7ZWuIeG07VOLCpQ0XQhRGboEKjD3BhFLDl
	 Xvw7ke3YN/lww==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47A1040C3E;
	Fri, 23 Jan 2026 18:47:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?N?=
 =?utf-8?Q?=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Petr Vorel <pvorel@suse.cz>, Randy
 Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/25] Add tools/lib/python modules to Documentation/tools
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Date: Fri, 23 Jan 2026 11:47:30 -0700
Message-ID: <87h5sc17zx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73848-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: 1780B79C03
X-Rspamd-Action: no action

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This is an extended version of:
>     https://lore.kernel.org/linux-doc/cover.1768488832.git.mchehab+huawei@kernel.org/
>
> It basically adds everything we currently have inside libs/tool/python
> to "tools" book inside documentation.

OK, I have applied the set, thanks.

jon

