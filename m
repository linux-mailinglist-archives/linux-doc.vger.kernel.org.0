Return-Path: <linux-doc+bounces-81259-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Na8DxJcxGl0ygQAu9opvQ
	(envelope-from <linux-doc+bounces-81259-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 23:05:06 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5432CC3A
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 23:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CD48301D32C
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 22:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6A6347508;
	Wed, 25 Mar 2026 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AvmN5H3L"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB7D27FD6D;
	Wed, 25 Mar 2026 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774476301; cv=none; b=nCXScVHfG76aG562r05+NRaRo4kwISSh4N3/z2cSvUsKJMaJCaS9cV/Uo8T3IUgL+q5VUexcA6LU/U3zshvW64fqpnrZthwuCSj1Pw4EuTqZx1/IFoZOLSUNZND0+IfyZbxLs06H7uWmwtT7cgqFGTqcAQEbq8Nw/IYhPhpUxKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774476301; c=relaxed/simple;
	bh=jTVUqHh3KKc1vXinDNI7xJYGSVfTZrKNAr5bpTm0p6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mZy2joboBh7XT6+MZh7nGZqCFxZxXuiEW/rrhQIwsAP7pJ6jq5MZh39BnHnAVrJ+92vMI+VFieVnuvcdK+7eBMCVA+fXRMN5JofPoL7luaHmIZicC7dk6mqzLuZ4YQ0fbLU/qvw63PeQCln7Wbv1u1OyVa+28R0PQBikIJB1YHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AvmN5H3L; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 387CB411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774476299; bh=jTVUqHh3KKc1vXinDNI7xJYGSVfTZrKNAr5bpTm0p6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AvmN5H3LC3JtiTCOjdBZ99ig4i2j8J8xZlGu7i1UCKtKmS6meheZLxEEnQs8c4PQ+
	 j6u1quiO5b+OwYz1sdILaT4/KC1y8bONxdbgz/S66Hxz6IaHSDpgKRQH5/YXuMMldQ
	 eMU4NuTT6fCpC7ybDjjQzcYmtebNLnF5GVAQ5EPnn7l90l+A5NbctECD0h7eQyXZ9h
	 PVr/J0/35rIBWXCHhI3YP65Jb2dKC9FacqSJJCuUycMY89jMCBcGVQJRd1PgWIEVzq
	 WDAEdJZ4lEIxTj0Gk38P7FuMFYxnCq2gnGWqe6viXbQaYnB+vWuA/kZIlNUlokeOSP
	 K44Pi/GL9x1gA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 387CB411D3;
	Wed, 25 Mar 2026 22:04:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
Subject: Re: [PATCH v3] docs: allow long unbroken headings to wrap and
 prevent overflow
In-Reply-To: <DHC6NJM3JZJC.3EIT3YD7O8CDW@ritovision.com>
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260323153024.32317-1-rito@ritovision.com>
 <87h5q3g288.fsf@trenco.lwn.net>
 <DHC6NJM3JZJC.3EIT3YD7O8CDW@ritovision.com>
Date: Wed, 25 Mar 2026 16:04:58 -0600
Message-ID: <87fr5nefat.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81259-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ritovision.com:email,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 52C5432CC3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Rito Rhymes" <rito@ritovision.com> writes:

> One possibility is that the issue may not reproduce if the test is
> being done by narrowing the full desktop browser window (rather than
> the page's viewport with DevTools opened).
>
> On desktop, the browser's outer window often cannot get as narrow as
> many actual mobile screen widths (often bottoming out somewhere around
> 500-600px), so it may be too wide to expose the problem.
>
> If you check it with DevTools opened and reduce the page's viewport to
> a more realistic mobile range, around 380-500px, the issue should be
> easier to reproduce in both browsers.
>
> For highest fidelity, I find it most reliable to verify on an actual
> mobile device and test the fix by binding the local server on all
> interfaces then loading the page directly from the phone.

I tried on both desktop and mobile screens, both browsers, same results.

jon

