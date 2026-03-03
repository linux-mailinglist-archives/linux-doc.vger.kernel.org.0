Return-Path: <linux-doc+bounces-77734-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI4gC8Qgp2mYeQAAu9opvQ
	(envelope-from <linux-doc+bounces-77734-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:56:20 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9565A1F4D8E
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C234301A7CA
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5A04DB561;
	Tue,  3 Mar 2026 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ECcOlPtO"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C703EDABA;
	Tue,  3 Mar 2026 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772560576; cv=none; b=mxI/JHHoKWaHpGgN6Mjzls3Ulp/7lpUX/FLxxvYzSTo/DyiL7Rhd9D9d1mihuyY9twUEnjJkysTvHNzsXsRZr/LmG4/Zww+WVwNTZR+uWVx/oZGZJogQdUgW4ICVVDTT0Rg4zgIEg1J2uTZU/odIQ6WyAG9rjinwOVsDB1sdtto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772560576; c=relaxed/simple;
	bh=tB7Qhf51t7COgx6AMwEAKQA7Sfjn1Zl7lq7S+y5Xq5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SESjgCmRSVA5FYHhowEu6wD/y9+PSjufsl1Gi02V8dUlD3jrDH7icloXoQrmcODT8IOKbxPiA2a+JVJwQvB2E7x6KnoyUI/9eQyx+al1mhi5oC7IctFMfVw29ZCE4B5kOdLCEch7JZhIVvzQT54cczusFWepvB7Jy6ksGHjYagw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ECcOlPtO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 94D5F40429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772560573; bh=Ob/61kfjwkWKR8Gl5mNIk6TMub+KtclDWQimZackFME=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ECcOlPtOmP1m2c6qpzyRlEc5KAxrOjxF2Xhmr/bTT/lt/nCQ4ZS7jlbOZnn5oZlN1
	 j3r6Jt6sZEJuKuazx/woFmFwYh7y7hBLLJZ1cbStpSsE6DyOudYmel/mBYUS7WSusP
	 KDd1S3+QYiLvAAeRrJq6N2CbMUD9OdJDmGhmAvnc/gesHwWpguTO2eLszxZyPOLvhL
	 KdS/Ki3vyX0CMP1aOG5nWOQmPWQxbwvI7JFfkcnlZh/LNNnH7neB2Uu1OXvk2hhJ5o
	 DP37OvPr0ka6vBlb9WcRgkZLh9xWFx2DYA6oY59K7Y76qge+daKhsLpPsdeMZ0ckbP
	 Tmy7I4NQgeN4A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 94D5F40429;
	Tue,  3 Mar 2026 17:56:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kees Cook
 <kees@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Aleksandr Loktionov
 <aleksandr.loktionov@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/18] Several kdoc fixes
In-Reply-To: <cover.1772469446.git.mchehab+huawei@kernel.org>
References: <cover.1772469446.git.mchehab+huawei@kernel.org>
Date: Tue, 03 Mar 2026 10:56:12 -0700
Message-ID: <87fr6gbxvn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 9565A1F4D8E
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
	TAGGED_FROM(0.00)[bounces-77734-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series contains patches from:
> 	https://lore.kernel.org/linux-doc/87sear2kbm.fsf@trenco.lwn.net/T/#t
>
> I rebased them to make the changes cleaner, fixing mostly on fixes.
>
> I dropped stuff related to NestedMatch arguments parsing.
> I'll be sending you on a new patch series, likely tomorrow.
>
> The changes here basically addresses several issues discoverd by
> Randy and by me and makes NestedMatch more similar to KernRe.
>
> It also moves the transforms ruleset to a separate file, to make
> easier to maintain kernel-doc code.

OK, I have applied this set - it all seems to work as advertised as far
as I can tell.

Thanks,

jon

