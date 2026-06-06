Return-Path: <linux-doc+bounces-91180-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id loNBEhFmI2rCsgEAu9opvQ
	(envelope-from <linux-doc+bounces-91180-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 02:13:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACF664BF84
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 02:13:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=nGjqCgVT;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91180-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91180-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01D443019810
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 00:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D2214F70;
	Sat,  6 Jun 2026 00:09:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0463B1C2AA;
	Sat,  6 Jun 2026 00:08:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780704541; cv=none; b=BdWt7vudIEczD/3AOL/s97uv+oORHNn2Jaty7c1SxB1jjqGV99JV0mKvq0xT5RuXxNWgFkhJdStDvTO02uqHZ1k0/54UJgiThOmlhb0OjWURg5YHEa1vdnKnN8q2m7eI/ZRmcjiFxN4o4btNcYjCB7KtrOYzrvMDIXDJyHqQm0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780704541; c=relaxed/simple;
	bh=OPNlsEPMcpto3MG3bGJQ961Knee8M4Xs+CZrgTZqhYI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rSMItSz9r+eR/BoNI7m2EEUT7RijY+wWgjJXjSHoenpelA+zwW+bql71e8pMV/TzWc6JA8gFMoGEqTZlhkTt3OKVUWD8ne3MoqRcs0O3QiWmq4g9qWPBZEHbb0PBrAf7gFAPoRR7EiBPyeSRoTzUnpr4w8XfRJJWedMFEyrcOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nGjqCgVT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690511F00893;
	Sat,  6 Jun 2026 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780704539;
	bh=+NniFBlcUfvN7QPaMYV7ZZNeczE8DDn65tLfNJE+7Q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nGjqCgVTlJ1icg189+oXTqVABzd7Gze0yQ9M0Lrb0cGWI/zTEeoLhRPI0UWOdmVOU
	 WTS9j6UAEq/Kn9brHFQYghKu4cOxtBPovmtQzFOfgaory/ZwmEZEShAaiMYo4IfBkk
	 A/XYFkZ49BdMucFP0wSNAlVSEi16msChMHIUrgHU=
Date: Fri, 5 Jun 2026 17:08:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>, Shuah Khan
 <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Subject: Re: [PATCH v3 0/6] alloc_tag: introduce IOCTL-based filtering for
 MAP
Message-Id: <20260605170858.9ee9ca2181a041bb9a4c3098@linux-foundation.org>
In-Reply-To: <cover.1780701922.git.abhishekbapat@google.com>
References: <cover.1780701922.git.abhishekbapat@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abhishekbapat@google.com,m:surenb@google.com,m:kent.overstreet@linux.dev,m:hao.ge@linux.dev,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:souravpanda@google.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91180-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-foundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:mid,linux-foundation.org:from_mime,linux-foundation.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8ACF664BF84

On Fri,  5 Jun 2026 23:36:45 +0000 Abhishek Bapat <abhishekbapat@google.com> wrote:

> Currently, memory allocation profiling data is primarily exposed through
> /proc/allocinfo. While useful for manual inspection, this text-based
> interface poses challenges for production monitoring and large-scale
> analysis:
> 
> 1. Userspace must parse large amounts of text to extract specific
> fields.
> 2. To find specific tags, userspace must read the entire dataset,
> requiring many context switches and high data copying.
> 3. The kernel currently aggregates per-CPU counters for every allocation
> size, even those the user intends to filter out immediately.
> 
> This series introduces a new IOCTL-based binary interface for allocinfo
> that supports kernel-side filtering. By allowing the user to specify a
> filter mask, we significantly reduce the work performed in-kernel and
> the amount of data transferred to userspace.

Thanks.  AI review found several things - you'll want to address at
least the first few.

	https://sashiko.dev/#/patchset/cover.1780701922.git.abhishekbapat@google.com

