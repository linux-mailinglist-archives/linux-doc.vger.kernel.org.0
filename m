Return-Path: <linux-doc+bounces-90395-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMLxL0LoHWp0fwkAu9opvQ
	(envelope-from <linux-doc+bounces-90395-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 22:14:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A22624F53
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 22:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A483025904
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 20:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8F3366DB4;
	Mon,  1 Jun 2026 20:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzK5aDWk"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F82594B9;
	Mon,  1 Jun 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344486; cv=none; b=j9pT0DT2GfaI6HhuBEPXEbckJWDPFVCtraYB4RFHtMhzHl5NPkiBYAOHqZoj+rSctuR1YwDBtrV0hFpW9s0wD5xrw0K04JzZiUrkWhcsU7IuypP8vaKW0A7M+KY8bbJYl3nQXQkQj76gTgwTdzB29vAKzxReBQRjGE5obZaTnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344486; c=relaxed/simple;
	bh=jTcUFusjcMhFQPGvCvKw0eseElH9ueCs3ERk5tdR3kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf1eZ8GtXP8cFGMJbwguqdP48IUyVz3liKjn9keI7/O9MXnHxMTFSsfepamRgCAmx9AAUl5pQvfXdt9H7Xln44ouoHdRhDW+iMksI6iAxTEcip9aekHpZBQexBfQuwfX5oA/xtuKUMeoXvp4/W3DOUS5p0w1LEMv29crGp7Dh10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzK5aDWk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E580B1F00893;
	Mon,  1 Jun 2026 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344484;
	bh=agfeoVKywtwIFMpKuMk6gDQGcUu0P3E6Kv9h3i8akvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gzK5aDWkiuPHYu+96iYiNgbglIpA27VFrRVb1++MuKk7ORLbjTwaguxPNfT4b78f/
	 MNJUEBRdAGrth92QFTB1JWAuTi3liQ6EVB2zyEZyDa7l6LbhcodVxCvjJf5iwY3c1X
	 QTPpnvnXk/47XGtRRaNj88MZs1JxRl6bMmBsL0jjBxGgtQqu2LrSdMFaycM4W4OMpW
	 P3mxzvM+Cex2tmMdCn2mIyNHzqE5PJ2b/6kJWg+xhtdPUxJjzydiqkg1T4odIeLFve
	 pwXIuag64/SZeJRuxwEp7ixMn5vtFyc77zaj6YUVgdcLK3ckIF3xdrm/GXkWqBHKBy
	 liFWLDGFWdDIw==
Date: Mon, 1 Jun 2026 13:08:04 -0700
From: Kees Cook <kees@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Manuel Ebner <manuelebner@mailbox.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	SeongJae Park <sj@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix syntax of kmalloc_objs example in
 coding style doc
Message-ID: <202606011307.531C9CF878@keescook>
References: <20260529081006.2019687-2-ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529081006.2019687-2-ukleinek@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90395-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 57A22624F53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 10:10:05AM +0200, Uwe Kleine-König wrote:
> The first parameter should match the variable that the allocated memory
> is assigned to. Fix the example accordingly, the one for kmalloc_obj got
> it right already.
> 
> Fixes: 7c6d969d5349 ("Documentation: adopt new coding style of type-aware kmalloc-family")
> Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>

oops, thank you!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

