Return-Path: <linux-doc+bounces-92775-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SStcByz3M2qTJwYAu9opvQ
	(envelope-from <linux-doc+bounces-92775-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 15:48:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A805B6A0B1F
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 15:48:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=hDBPkiAL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92775-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92775-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67614302593E
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 13:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBC03B27D7;
	Thu, 18 Jun 2026 13:48:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A4D28D8DA;
	Thu, 18 Jun 2026 13:48:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790491; cv=none; b=vAwkJMI4QHeoailPS14ypqMRryC4oSraAUZttyTLF4bkBsSxj2NXaRUtBmaT69VL4GXacTyEIxSxssQ0nRRujGu9IvMzN6WB0Bu0jUruptYuQft6vkljdUivuSI/26f2nKrhhDCtPHsSUGBnjZex58cwW9q5p2gUhQaDLkNQ0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790491; c=relaxed/simple;
	bh=4+3YH9+OATahnfK6V4DDGPracyWuXKqHO5B9kHTtB+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6Y3dMg2JuU/YGensM2uJ7cffs3ZuxXv99UJiz2mCBq9hb9PiJhhl+BdMP9ocn/4z92j3817fyNOHYJ7v6ElU3Qxf2nFLm8ae3491mCkS8sEssI3jETmVcJs5X/cHA50LrklwKbVQgm8PjcYlwFplniGmNBIBe8fjDtQpXz0t/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hDBPkiAL; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C3516F8;
	Thu, 18 Jun 2026 06:48:04 -0700 (PDT)
Received: from [10.1.25.219] (XHFQ2J9959-3.cambridge.arm.com [10.1.25.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96A63F915;
	Thu, 18 Jun 2026 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781790488; bh=4+3YH9+OATahnfK6V4DDGPracyWuXKqHO5B9kHTtB+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hDBPkiAL2u8VTbYCHCj8Av31c5gef+OAcJThQqRjNlf20cUZNt5BoVAu5U09JiYRP
	 q2TDscpDjuJODPCb0KxbMEttDvPKMyn5gHiQSi6xN+ZZlRcdvnm6Qr/yJJLwh+Uv6w
	 neXc2gCyt2w7AESd32PfSu+02EtHqxsUFsqDUaRI=
Message-ID: <dbc2800f-7880-486f-831c-ec9b6cedc005@arm.com>
Date: Thu, 18 Jun 2026 14:48:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, anshuman.khandual@arm.com,
 kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
 will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92775-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dev.jain@arm.com,m:ryabinin.a.a@gmail.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:anshuman.khandual@arm.com,m:kaleshsingh@google.com,m:21cnbao@gmail.com,m:david@kernel.org,m:will@kernel.org,m:catalin.marinas@arm.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,gmail.com,linux-foundation.org,lwn.net];
	FORGED_SENDER(0.00)[ryan.roberts@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[google.com,gmail.com,arm.com,googlegroups.com,kvack.org,vger.kernel.org,linuxfoundation.org,lists.infradead.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.roberts@arm.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A805B6A0B1F

On 12/06/2026 05:44, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.
> 
> Now, when a memory object will be freed, it will retain the random tag it
> had at allocation time. This compromises on catching UAF bugs, till the
> time the object is not reallocated, at which point it will have a new
> random tag.
> 
> Hence, not catching "use-after-free-before-reallocation" and not catching
> "double-free" will be the compromise for reduced KASAN overhead.

Does standard KASAN with HW_TAGS really detect double-free? How does it do that?
I could imagine it testing the tags of memory being freed to see if they are set
to the poison tag, but that would lead to false positives for the GFP_SKIP_KASAN
case, surely?

If I'm right, then the only downgrade this new mode causes is that if
freed-but-not-yet-reallocated memory is accessed via it's dangling pointer, then
that bad access is not detected. I think that would be benign in all the cases I
can think of, so while it would be a problem for a debugging use case, it would
unlikely be a problem for security enforcement?

Thanks,
Ryan


> 
> This is an RFC because we are not clear about the performance benefit.
> 
> Android folks, please help with testing!
> 
> ---
> Applies on Linus master (9716c086c8e8).
> 
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
> 
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
> 


