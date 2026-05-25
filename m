Return-Path: <linux-doc+bounces-89407-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGNkDq21FGpbPgcAu9opvQ
	(envelope-from <linux-doc+bounces-89407-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:48:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 466CF5CEC01
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC8E530583DE
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 20:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D047F388395;
	Mon, 25 May 2026 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WRKf8Pvl"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0335BDC7;
	Mon, 25 May 2026 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741715; cv=none; b=LgTEf9Wi7B+n+x+eDyUgLc4lpy6eC8YQkSUl7YiZFmr4qGrtyvRI7YGKaCHqnqOQQ8zgdRnkHo5uqYerxARkDYXSqQrgUQ8c4dInuZoNG5MyKUxUosd/bPJxfQ9Cb7Ac6vFS1PLAAjvgp4UIV+evjQrouWffOxTKNt9YXaBqBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741715; c=relaxed/simple;
	bh=yruNZXYG3jgtTfIKpCYMrySxmiMPOp3YYPn6NKhEwxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H4IYa+HTbg+AvXF6HeIr2jkyY4P4i5Qk7cMG/RdEoQIrU5Xh6oLxIFapyESpuvk6x/R49MYOLW3jVHeRQZMeQaLqCrSEDDkXvsa59mC4/SHVeGu5mIOFaKOrasQorK7HGaoDZW4Z6G6Fturxpi8pUSjwfvDrccWsTUFztDWEubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WRKf8Pvl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18D4140E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779741714; bh=yruNZXYG3jgtTfIKpCYMrySxmiMPOp3YYPn6NKhEwxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WRKf8PvlATgOE1GfsP0fhlvsoYYYHJPDAMfLMcU/NMhO8KntGF9bGw8Nn1jRi0NPL
	 /mI37sAZ+YZAukK2FrQ9pgg4XapGLmORBxSpkUdhXlW+el4VWzKiz6NZiWDek3Do9n
	 yG0VPpLvWuUkw4539U3msI0NiRd0jVPZP9v8QEIkeZJJ/u7pHIuZCtJJgNxVIKKQ0c
	 lCNQbW6NMgQoSZvoSvu+ZPUcLElrG6n1+wj8vZXb+tX/OagmPiXZ2LwbbaP6AShjAX
	 RZjqasnlVBDuCMKBjM9m/+da774Y3x3A8Q/YjoRwpocRaYnvowAvAuEzG0iGRiZuOj
	 uPRllw9ffdKfw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 18D4140E29;
	Mon, 25 May 2026 20:41:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Miguel =?utf-8?Q?Mart=C3=ADn?= Gil <miguel.martin.gil.uni@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: md: fix grammar in speed_limit description
In-Reply-To: <CAJjvy-ZKGhQEZkuy0nD6PMZBXF75m25iGOJHHvBsUfaiLHXFgQ@mail.gmail.com>
References: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
 <87cxyj1by0.fsf@trenco.lwn.net>
 <CAJjvy-ZKGhQEZkuy0nD6PMZBXF75m25iGOJHHvBsUfaiLHXFgQ@mail.gmail.com>
Date: Mon, 25 May 2026 14:41:53 -0600
Message-ID: <875x4bz0fi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89407-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 466CF5CEC01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Miguel Mart=C3=ADn Gil <miguel.martin.gil.uni@gmail.com> writes:

> Hi Jon,
>
> =E2=80=8BThanks for the review. My apologies, I will use my full name.
>
> =E2=80=8BYou can change the signoff to:
> Signed-off-by: Miguel Mart=C3=ADn Gil miguel.martin.gil.uni@gmail.com

Please just send a new patch with the fixed signoff.

...and no HTML mail, please, that won't get through to the mailing
lists.

Thanks,

jon

