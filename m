Return-Path: <linux-doc+bounces-74135-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mICDBDT3eGnYuAEAu9opvQ
	(envelope-from <linux-doc+bounces-74135-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 18:34:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E080987F3
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 18:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27150300119B
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 17:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC8030B535;
	Tue, 27 Jan 2026 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JODI+b58"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79268298CB7;
	Tue, 27 Jan 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535277; cv=none; b=h1KbCW9Hqx/Bt949Wy4USbh2ApjroEjJB89g8RDuIXhp3UIJ96iRaUGu75yoNRLJwQtNlNhjcAyJM9JHP9tfPJR42ATvP+6k2JI2gRNQPV46o3LjUSKo7+3kesNC4u2q2eohw2uXNasO7JKsWAT8qBWm7ZEqX/bzYi/IsPwLP1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535277; c=relaxed/simple;
	bh=MQPv8mRDarbFVrfScLyJ9gJx+3srgzjmsJZyQYZZFZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pj2LQDSBNuYN4Nv7xF7WK2Qs2qel7GtmjyUNb0IxzlijJNarrMIL6kz3gK9jqDApIwqlFhmVeOJDo8dWDldxmZweRs40dOXySxduUq8H+edYtioxnefhhHK1z4NUVEj/ywIYDMLlttTdHwpGYKIst3WP/mN4QjoQF10MHz6zFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JODI+b58; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3C0F740423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769535269; bh=I9tbAzh9+2so6qDG2ZSkdL8M4KlDJ3COlQw/r2mGVYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JODI+b58ClMA+wvwrXQEi1a6j8LHZ9RQMo/vVyjAb/anFlQvrPPc6i1Hwu5282jM5
	 YLHEp/RGy1cY+zDA3Ro4sEWh8lldBcyJQvfYa3woqF6Z/sTWYkJzipT46R74zh2LAR
	 3q6FMaUrwHBeEI4LnpLUF/lqk/s1GPQ39OAPuJtSLkEp4O4lPCL0oQqhj8T4aIHE3t
	 fPP5pJvUc2waXEo73rSnQLxD+1d58ihIiNA24QThy8CUpa8RCKnRB0p21wFYmJOOBk
	 CsgNW47D63mlWWBeIdgq4WrTZHAXAunBVWsBIbJ7FrtgRqb94HFvsXnHUF/xEMMB8P
	 8+ko0hdh/6AMQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3C0F740423;
	Tue, 27 Jan 2026 17:34:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/3] Some kernel-doc fixes
In-Reply-To: <cover.1769500383.git.mchehab+huawei@kernel.org>
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
Date: Tue, 27 Jan 2026 10:34:28 -0700
Message-ID: <87h5s79cyj.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74135-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E080987F3
X-Rspamd-Action: no action

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This small series contain 3 patches:
> - patch 1 fixes PDF docs build, as reported by Akira;
>   (I'm resending this one as-is from its v2)
> - patch 2 addresses a complain from Jani about not being able
>   of disabling "-q" flag when building docs with V=0;
> - patch 3 addresses an issue indirectly reported by Jani that
>   it the env vars that affects the wrapper aren't documented.
>
> With regards to patch 2, docs build honours V=0 by adding a
> "-q" flag.
>
> When V=1 is set, there are two effects in place:
>
> 1. sphix-build will be called without "-q";
> 2. Sphinx extensions will increase their verbosity levels.
>
> Sometimes, it is desired to just remove "-q" without increasing
> extensions verbosity. That's what patch 2 does.
>
> IMO, at least patch 1 should be merged during Kernel v6.21
> development cycle.

6.21?  I'm kind of assuming you mean the *next* cycle, which will be
7.0?

Thanks,

jon

