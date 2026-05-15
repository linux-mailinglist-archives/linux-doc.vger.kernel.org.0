Return-Path: <linux-doc+bounces-87663-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBrRHZgqB2r1sQIAu9opvQ
	(envelope-from <linux-doc+bounces-87663-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:15:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F025512D6
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEF45300B107
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 14:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B8C480967;
	Fri, 15 May 2026 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="spZqlwJX"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686621771B;
	Fri, 15 May 2026 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854082; cv=none; b=l4EPchQuyoPrUPrJbDwjv0BDDwd55FMLj0t3DNYMMFXgmurOYfF8ql5nXs/d46uXM/n5YYGYZ9JLmNMi2seD8fqctSAAMjdd96XonM0f45H1n3t0+Hj8D0XxDZFX1/azqqRkSpEX5NcUhgflFKRyzzwnnl/0gYNjkH/bbVEb04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854082; c=relaxed/simple;
	bh=5Je9qJDQHUmKksf6M7wkN/UCibG/n4JN6VJ9BQsIkKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XcgTnajz1okQ92rnYyXJmSe7B4AjAZ99qWcPCalNOSZSTuXFlY/td+45pU0yYJamw7vGAAnTKLJDJcqW790ptp0kaDVQ/ezBdV32gbih7xUe9hp8HSHmdAjgy1avHOKj+VxZh4zYuMRWUiAgHzYoV7hmCoc3/u25G2L6IcHslXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=spZqlwJX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40BA4410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778854080; bh=7mj6lsxeuqRuDfxWMifzwdMgNMY3D4qHHh8yjBVSBxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=spZqlwJXWPMSr4J60NkzpjhiOqJNHRzU0PZ6jejUicA1JjA3bYlRp7XkNStvtc//+
	 YLJHfOwCqBoOXP2511iSUbJt2SlnoyXTUrGqOLKZ6mtg1bHyXo49waArXP8ZpLH6ZZ
	 s7pid7P+N8h9Q5y+pqpsejbo1dfeXVWM7TxfCYRfLPZyQeYUcFIEOmkY8k17GrtsoO
	 AaRJgZWYa4+YbXjyzJ+GdbJrjnQYtmpjFlvfDa2WLlm+DsCWn07Tcv1oX5bsyM23c5
	 zhasPnr2se5PXJTtNlSzDkaSXGB6UksfnOwF669OO8r5WU4b/1DN2CLGq5fi7yEgcW
	 0YyZPSJ3WknqA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40BA4410B5;
	Fri, 15 May 2026 14:08:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo
 <gary@garyguo.net>, Joe Perches <joe@perches.com>, Matteo Croce
 <technoboy85@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Trevor
 Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 00/13] Improve process/maintainers output
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Date: Fri, 15 May 2026 08:07:59 -0600
Message-ID: <87zf20rcjk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: F0F025512D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87663-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,protonmail.com,google.com,linux-foundation.org,garyguo.net,perches.com,gmail.com,linuxfoundation.org,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Action: no action

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series improve the output at process/maintainers: instead of a
> pure enriched text, the maintainer's file content is now converted
> to a table, and has gained a javascript to allow filtering entries.

OK, I've applied it.  I've wondered about including the MAINTAINERS
stuff, but I must admit that the search box is kind of cool...

jon

