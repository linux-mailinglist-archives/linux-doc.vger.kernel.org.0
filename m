Return-Path: <linux-doc+bounces-80544-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCqvIm4TwGnMDQQAu9opvQ
	(envelope-from <linux-doc+bounces-80544-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 17:06:06 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F12E9E67
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 17:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866D93021B2E
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 16:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3620364E9E;
	Sun, 22 Mar 2026 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jmqNVt3a"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC862874F5;
	Sun, 22 Mar 2026 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195321; cv=none; b=ZgoKjbJnfwohjd5pOh931gbaMF98KmH2F9WZjFePjnAZwaH9dzrxc/cczTuvdbwZcR+kZbxVT7ZHQYoRsjQ/7OlpZC/zqwbFf4LhG385902a2aWl6IEGNS29PNfmayLHg/XOeTfYYLf8G0SMH6plMGGxbdAM2NYB8q3WGrN0/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195321; c=relaxed/simple;
	bh=I3Pdyo9vwt7trgpHYyA+oHUegojVnDOxU9SRP75eD2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WdISgUAUHGIl3/tZ7XVmDoPZ3GHuO3iXA/5HokBj6I50yzfvUP5vDegrHQ9niZ1w6U4OFgMJzED9tLgOVHBsnjSgsDCUpLIycqUo75ZZ0uCqoaRYRyK0plnfCatIfIshtMLlZ2oVcKD4Hply2XQBOruR5+PIhHjMNT3BLXUE18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jmqNVt3a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F228440C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774195313; bh=xALCEN1w1nvvGBHe4qkH9v/E9nRlb+vh55lSN37NRv0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jmqNVt3aBY5RB613c2o/CjyZVWlYjkAq9OztknReD8xNfE2WEktVgn2cVCLgqNey3
	 BUewmmUKsUB+G2gkt/Vly6Q5kWK3AiWfd/pD9qRKZPaAcDEwIAZGbsoYBzd72i7Ysd
	 8qvxvimYbkBWdhrp5GvZ+/1YjdBVQpXaf7/gHH/AfEm4TQPdL7Qi7B6GU1z0cNa13r
	 T16HZH2l4tIJfbLX7t0dltk4ekTSt7kYSduK3JyXBhvaSamW2h3X4g+4HJ2jZ4JSsv
	 vyDJ3Zq8yl7TWmF6VLWZGI667QGQtC78iMQyBe7ns7GE0M2SDPrXiVXTUR2jrzl7y+
	 xPBWP3rvfeobA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F228440C79;
	Sun, 22 Mar 2026 16:01:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
In-Reply-To: <20260321181511.11706-1-rito@ritovision.com>
References: <20260321181511.11706-1-rito@ritovision.com>
Date: Sun, 22 Mar 2026 10:01:52 -0600
Message-ID: <87cy0vetu7.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80544-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D9F12E9E67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rito Rhymes <rito@ritovision.com> writes:

> Replace the stock Sphinx search page with one that reuses the
> existing searchindex.js while adding structured result grouping,
> filtering, and exact identifier matching.
>
> Results are grouped into Symbols, Sections, Index entries, and
> Pages, each in a collapsible section with a count. An Advanced
> panel exposes filters for documentation area, object type, result
> kind, and exact match mode. All state is URL-encoded so searches
> remain shareable.
>
> Page summary snippets are lazy-loaded via IntersectionObserver to
> avoid fetching every matching page up front.
>
> The sidebar keeps the existing quick-search box and adds an
> "Advanced search" link below it.
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
>  Documentation/sphinx-static/custom.css        | 163 ++++
>  Documentation/sphinx-static/kernel-search.js  | 746 ++++++++++++++++++
>  Documentation/sphinx/templates/search.html    | 106 +++
>  Documentation/sphinx/templates/searchbox.html |  18 +
>  4 files changed, 1033 insertions(+)
>  create mode 100644 Documentation/sphinx-static/kernel-search.js
>  create mode 100644 Documentation/sphinx/templates/search.html
>  create mode 100644 Documentation/sphinx/templates/searchbox.html

Without looking into detail at the work (yet), can you tell me something
about how this work was created?  We do have guidance for the disclosure
of the use of coding tools in
Documentation/process/coding-assistants.rst ...

I'm curious about where you are going with this in general.  A look at
ritovision.com does not suggest "kernel developer" to me.

Thanks,

jon

