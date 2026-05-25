Return-Path: <linux-doc+bounces-89409-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCUtHTvAFGrMPwcAu9opvQ
	(envelope-from <linux-doc+bounces-89409-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 23:33:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F318C5CEE28
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 23:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98EAD3008D30
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 21:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D2331A570;
	Mon, 25 May 2026 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a6tOq4ZL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FCC26D4E5;
	Mon, 25 May 2026 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779744824; cv=none; b=AEl7uet2YcUcJR61Gr1LkkyUEplHjW4ULdcYXGV5NanwVnwTbNPBjhS6TvYbYFvngli18a6cuUoGBsJld83FrmkQBiLuwfWP0lsWaaqkJTqIJPe9IOVZgQB1J2R3LUmTY9Rf+HmTDjwVUj3tphgBRzn9nnYxSgeRJfFGKcftO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779744824; c=relaxed/simple;
	bh=GFAWOc6+genFcaTAEOgZs8M7SBpmyHPbj1UI7lVYRFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfhPazvde80J7XYVXh9NFobOCKJWpUQa0xqWMsskz8eBVoCtsGFahDRXmawO3GOegQNyrqT6bjmnF7hYomli3BCWF8oLc0aC3eNi5Ej8tc1YLFKaWck5BldUhilQANjo5ULRPMThFg3PG7+KpDBU1aAGCMXNW78OVrr6gcBw24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a6tOq4ZL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B8F1F000E9;
	Mon, 25 May 2026 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779744822;
	bh=KmypiuMMve/7zXa24R9evpWOyyvjtXxKo3KcAGiZbE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a6tOq4ZLJFCtzcD1/1qSfJVOGSS7QbjgJXffuDYl/4h6uOJSL4Xvf+s/lotj1qv06
	 NCol8Ug2iQ18NKSHPW+lgc2scSuK5bFCoZXZrWQQQBE4lKkTpYP9N1enTzgaXhvS0t
	 IqjXTdaAvFns4QdaDehVvUOC/uGGM7KkcRFI8X+4=
Date: Mon, 25 May 2026 17:33:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Willy Tarreau <w@1wt.eu>, Baruch Siach <baruch@tkos.co.il>, 
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: threat-model: add missing closing parenthesis
Message-ID: <20260525-blond-goat-of-intensity-149dfe@meerkat>
References: <da8ee1e8b4e99261ec11544c4e1a4f81316ae965.1779032501.git.baruch@tkos.co.il>
 <agnm9A9SFsmvIFZg@1wt.eu>
 <878q971but.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878q971but.fsf@trenco.lwn.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89409-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: F318C5CEE28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 02:19:06PM -0600, Jonathan Corbet wrote:
> Amusingly, b4 turned that line into:
> 
>   Obviously: Willy Tarreau <w@1wt.eu>
> 
> I was tempted to leave it that way, but decided to fix it up :)

Obviously, you should have left it as-is. ;)

-K

