Return-Path: <linux-doc+bounces-92933-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hjv4H9dBNWpNqQYAu9opvQ
	(envelope-from <linux-doc+bounces-92933-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 15:19:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B06A60AE
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 15:19:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=HNSAIoqR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92933-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92933-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2B3F30125D1
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 13:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0D238E8D1;
	Fri, 19 Jun 2026 13:19:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019A2381AF4;
	Fri, 19 Jun 2026 13:19:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781875154; cv=none; b=iSBGSBWeEvecquImrUXxFF3t9LxtH5l7f4GkDMPyr+ne6Xt03/ES8u6JUuA0vwxhQwn6tYR3oiCOJ1D/RpyroBTXUNADnPLa9IMQlmhyY8ytngtd67O/32YoKCSU1RxnijZlmoxj1wHdbuyJdVAbKULhmHRSgmU65WBCqhXnTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781875154; c=relaxed/simple;
	bh=IXPRMUIPVIuAYINomf/QT3LL4Z4pishbHkKoEcIwfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNdoCj6qKRIiOidN9ft13MVLvFl/g+clNJFiiwsqX/XpPuAR0s6buFzxDHP904I9Cp6KXfLqAamhGEgoLgBmyqujuy3Xf9CPd9bzaxKDzRhnnJHK4zA16pZqkYxG6zgJ83VINvgqLocu37T59kR6mLA1ps/N3rSaXvFy5nj7cmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HNSAIoqR; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5382A2972;
	Fri, 19 Jun 2026 06:19:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D522D3F763;
	Fri, 19 Jun 2026 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781875151; bh=IXPRMUIPVIuAYINomf/QT3LL4Z4pishbHkKoEcIwfTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNSAIoqRQuhLmKaaQOBEoRus9h3+8kB2v4jzvU25WorCkv6IPC04GdKMbynmzdPmX
	 DzfveUneQIpjba7UBaNnGBlL/gXeyBGteVAH8BUgPzcfSv6gfkCHHXbtnopRfJIed3
	 Ug4A/BUWCKr8G1v5YI4VM633WANr8cElnPDPi2O0=
Date: Fri, 19 Jun 2026 14:19:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Harry Yoo <harry@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajVByfkLbetzA8bB@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,linux-foundation.org,lwn.net,google.com,googlegroups.com,kvack.org,vger.kernel.org,linuxfoundation.org,lists.infradead.org,kernel.org];
	TAGGED_FROM(0.00)[bounces-92933-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry@kernel.org,m:dev.jain@arm.com,m:ryabinin.a.a@gmail.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:ryan.roberts@arm.com,m:anshuman.khandual@arm.com,m:kaleshsingh@google.com,m:21cnbao@gmail.com,m:david@kernel.org,m:will@kernel.org,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF3B06A60AE

On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
> On 6/12/26 1:44 PM, Dev Jain wrote:
> > Introduce a boot option to tag only at allocation time of the objects. This
> > reduces KASAN MTE overhead, the tradeoff being reduced ability of
> > catching bugs.
> 
> I think most of overhead when enabling MTE comes from loading and
> validing tags for every memory access (either in SYNC or ASYNC mode),
> rather than from storing tags.

I guess it depends on the workload. Lots of allocations for short-lived
buffers (e.g. network traffic) may notice the additional tagging more
than the actual tag checking.

Of course, it would be nice to get some numbers from those who have
access to MTE capable hardware.

> > Now, when a memory object will be freed, it will retain the random tag it
> > had at allocation time. This compromises on catching UAF bugs, till the
> > time the object is not reallocated, at which point it will have a new
> > random tag.
> > 
> > Hence, not catching "use-after-free-before-reallocation" and not catching
> > "double-free" will be the compromise for reduced KASAN overhead.
> 
> I doubt users who care about security enough to enable HW_TAGS KASAN
> are willing to compromise on security just to save a few instructions
> to store tags in the free path.
> 
> To me, it looks like too much of a compromise on security for little
> performance gain.

I don't think there's much compromise on security for use-after-free.
The buffer will be re-tagged later so use-after-realloc should be
caught, especially if we ensure that a different tag will be used (I
don't think Dev's patches do this).

Of course, if you want MTE as a debug/bug-finding feature, tagging on
both allocation and freeing is highly recommended. This patchset is
aimed for those wanting to run MTE in production and squeeze a bit more
performance out of it (with the compromise of not detecting
use-after-free, only prevent access after re-allocation).

-- 
Catalin

