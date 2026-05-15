Return-Path: <linux-doc+bounces-87657-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKcaHTEoB2ppsQIAu9opvQ
	(envelope-from <linux-doc+bounces-87657-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:05:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64A550F9F
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E72B930DB273
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 13:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E616F481FBD;
	Fri, 15 May 2026 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IKQlV14T"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78458449EB6;
	Fri, 15 May 2026 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853307; cv=none; b=gWZNXgnZGbwxOy2WlMEXR01IOaV5DG9yF9Z1wOOPyH2e+oIA9xWVXIQwxGeNFiuzg6KARzs8pWpH2WDaCxIuORyf/Q12lO7KbQ+i6/GkPgEZaKVu9HYkdN9DU5Fq8VSruWBvj4dM7YqYRK+qu4n+QkGsIdrT1M8BNQmqddgQk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853307; c=relaxed/simple;
	bh=evXWKftjuLJQ4mRjWE5B2AiBxfbS1BL93pLn0xAnNR8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eqJGagVUs64aEjUrP/5QWn++guHlKWOegnqCU4aNA6zgWOwMM3/zkd95FqLsufb/ymMChY9XsMG5/PQXurrMJpkFjvdwnK+L0N1rF7fl5Di/h+ATEjmqv7HBny9Y+LzDXqxhGHZEtezwGuOl674f9po2h1CRWTzZCN3L608qoLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IKQlV14T; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CB76A410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778853305; bh=A9nDFv3vagy3+1F49CmVRh5+xa3gfle1V5vbvV6JaGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IKQlV14Tq6bBIDndNUTmOqE3N/cj8mjMEbhzn2t5RYhMoumSdoRAaOZQA5JvJV0lh
	 119XI4z++YKndyQvwrHv6UQscJZDn4qF3uGSnCT1il0subk3E01AL8xs+e7FxO5Ip1
	 viz9+8uamfr002g9f3m4Qx5W8asunN6proGzY05Lc/8mns3YzVfjGHSLpHYqKwEBrE
	 4RK4NdLoN1AnanOIKwzGQRsxHzAcHbxtmqCIooLiQyE6ge6fOJ5k7JbXmXdRhvhG9H
	 DklKp0Do/hUu27Ie4RBEDilSfvmF2hrbprnuh/7Mpchumrv7GFxd1n8onCUFwSqIVq
	 7SWMESMAQdc9A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CB76A410B5;
	Fri, 15 May 2026 13:55:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Linlin Zhang
 <linlin.zhang@oss.qualcomm.com>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev, Shuah
 Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] dm: fix dm-inlinecrypt docs warnings
In-Reply-To: <20260512180409.1193504-1-rdunlap@infradead.org>
References: <20260512180409.1193504-1-rdunlap@infradead.org>
Date: Fri, 15 May 2026 07:55:05 -0600
Message-ID: <878q9ksrpi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: EA64A550F9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87657-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linuxfoundation.org:email,infradead.org:email,linux.dev:email,trenco.lwn.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:email,lwn.net:dkim]
X-Rspamd-Action: no action

Randy Dunlap <rdunlap@infradead.org> writes:

> Add this file to the index and use a longer heading overline string
> to eliminate warnings:
>
> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst:1: WARNING: Title overline too short.
> ========
> dm-inlinecrypt
> ========
> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst: WARNING: document isn't included in any toctree [toc.not_included]
>
> Fixes: b4a0774bd7fd ("dm: add documentation for dm-inlinecrypt target")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Mike Snitzer <snitzer@kernel.org>
> Cc: Mikulas Patocka <mpatocka@redhat.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: dm-devel@lists.linux.dev
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst |    4 ++--
>  Documentation/admin-guide/device-mapper/index.rst          |    1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

This doesn't apply to docs-next, so I'm guessing it's intended for some
other tree?

Thanks,

jon

