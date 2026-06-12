Return-Path: <linux-doc+bounces-92155-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id icYfMvQ7LGp8OAQAu9opvQ
	(envelope-from <linux-doc+bounces-92155-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:03:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6967B2EC
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:03:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=itH55TE3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92155-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92155-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3CEB300185A
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 17:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F070A403139;
	Fri, 12 Jun 2026 17:03:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6B65C613;
	Fri, 12 Jun 2026 17:03:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283822; cv=none; b=tRfTVc3Y3JHA/g8UNotq2XENK5cU9rDdxGGaAyAxguhk/TbBqHd8GTkD1SXlTWn2ARB2tWQQN3XGBXzJ5VuVoWPE2Qw5a+WoPz9vUdCDWqLwEkPD+KeV7xpOMv5GUm1OM8qbjkn2BDC14Ag93X0BE8XnhvLFRK6HVOy4B95v2/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283822; c=relaxed/simple;
	bh=ocg+rYhU9qZGv1rkfibdEQveWLBUUpVYmeREplBrKMU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gl/Mdhz5tLDIoDh3ckVz2Dk/2/g3B/RtVAGibgJWzEoZS/IkY8vWBMT7/7hZcDPzZLNlyYavx96EaBfbfAZ0ZLlZSroyvbRNripRCxVktzCuu6WfTvn3Fo6vskDSGM25FgANdf0CcEoZnyZGNY+19hBqbB8TSnfYSVBnKHWzUDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=itH55TE3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C16D1F000E9;
	Fri, 12 Jun 2026 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1781283821;
	bh=cwPb00goa9neMhnO3uK2pLz1hA0oe5oy8FoictjDQao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=itH55TE31Vw9PM1BjU2oosGYS40FegVM1Q8hy1iOodrFz0/baAP75jQaixwzd49Mn
	 9Q6twOCs9iJePz4HwIOqKdefPFGIX4RbG1gV7hna9jCbfMoh88KnIbgwEtiNJ1qbkf
	 b0nZlLaXtQaLjoaCi6q9VqEcSgYJhO8sOFO+fAl4=
Date: Fri, 12 Jun 2026 10:03:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shardul Deshpande <iamsharduld@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/mm/damon/design: fix a typo in the Address Unit
 section
Message-Id: <20260612100340.1243b191c643f288e1ce211c@linux-foundation.org>
In-Reply-To: <20260612154054.720363-1-iamsharduld@gmail.com>
References: <20260612154054.720363-1-iamsharduld@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:iamsharduld@gmail.com,m:sj@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92155-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0A6967B2EC

On Fri, 12 Jun 2026 21:10:54 +0530 Shardul Deshpande <iamsharduld@gmail.com> wrote:

> The "Address Unit" section misspelled the C type that the DAMON core
> layer uses for monitoring target address ranges.  Correct it to read
> "unsigned long".
> 
> ...
>
> --- a/Documentation/mm/damon/design.rst
> +++ b/Documentation/mm/damon/design.rst
> @@ -140,7 +140,7 @@ as Idle page tracking does.
>  Address Unit
>  ------------
>  
> -DAMON core layer uses ``unsinged long`` type for monitoring target address
> +DAMON core layer uses ``unsigned long`` type for monitoring target address
>  ranges.  In some cases, the address space for a given operations set could be
>  too large to be handled with the type.  ARM (32-bit) with large physical
>  address extension is an example.  For such cases, a per-operations set

Well we don't want our longs to be singed.

`grep -ri singed .' shows quite a few typos.  "assinged" is popular. 
Perhaps you could prepare a patch which fixes them all and adds
"assinged" to scripts/spelling.txt?

