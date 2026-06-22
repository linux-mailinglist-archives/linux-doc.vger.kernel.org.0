Return-Path: <linux-doc+bounces-93122-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t6KcJTxtOWpVsgcAu9opvQ
	(envelope-from <linux-doc+bounces-93122-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 19:13:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 770906B167A
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 19:13:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=cB1cmzMz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93122-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93122-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D96B3008462
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 17:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9035F33F5BE;
	Mon, 22 Jun 2026 17:13:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC82E33F5A4;
	Mon, 22 Jun 2026 17:13:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148407; cv=none; b=rZ1PSSZkJESEPkFEgegdMiwjQQSS7uxym92JQKlIeZFRZohBxMcaOAgHgt/gHt7yK/fN1BEEOulBkRl6gJ6HbjodeRYAI2VMSnlEOMHJ9gACCl+agMLnXaKalEOKYlwhuW6ncQjRipse10Ivy7lCvdp88SijSNTFe7VKGzhMXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148407; c=relaxed/simple;
	bh=RnwiQypkRLn7P8qYZseBV6Ihj32aR3RId+p6z4H6xw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suiYgBa8P9PrmaJ+lYlCVZyIbakfcxI6vPe3ACJWWcHtG8sDgp3Eix9jk1Xf/bhCgIkUVOLGP9YsgHIIgFZMUcxBpTnNMSlazAZkYw7SauqZmpcGTmzlAyGXzhVNWKJYecyd4ajkJMmvDg10X2T0umBXOPrK4WlQFHi9DA9Cnis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cB1cmzMz; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0191A00;
	Mon, 22 Jun 2026 10:13:19 -0700 (PDT)
Received: from arm.com (RQ4T19M611-7.cambridge.arm.com [10.1.32.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EAF23F62B;
	Mon, 22 Jun 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782148403; bh=RnwiQypkRLn7P8qYZseBV6Ihj32aR3RId+p6z4H6xw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB1cmzMzT+YCCg7NorZIa+KSxvTRYpIbv/SMaoP0VaMTLqKhCnwscEnPUCC+jZb+/
	 gaRLYTCzh177urdLiaRvwUNvASV/HdLMAMWqfK5gWm4lR38lQmrPWtcwc4xEt/s8Y+
	 xzl5xklVxQ8HOQlcmaoggGEB00Xm26zmkx0NmFW4=
Date: Mon, 22 Jun 2026 18:13:17 +0100
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
Message-ID: <ajltLd6FQg1aMge_@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,linux-foundation.org,lwn.net,google.com,googlegroups.com,kvack.org,vger.kernel.org,linuxfoundation.org,lists.infradead.org,kernel.org];
	TAGGED_FROM(0.00)[bounces-93122-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,arm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 770906B167A

Hi Harry,

On Mon, Jun 22, 2026 at 09:42:10PM +0900, Harry Yoo wrote:
> On 6/19/26 10:19 PM, Catalin Marinas wrote:
> > On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
> >> On 6/12/26 1:44 PM, Dev Jain wrote:
> >>> Now, when a memory object will be freed, it will retain the random tag it
> >>> had at allocation time. This compromises on catching UAF bugs, till the
> >>> time the object is not reallocated, at which point it will have a new
> >>> random tag.
> >>>
> >>> Hence, not catching "use-after-free-before-reallocation" and not catching
> >>> "double-free" will be the compromise for reduced KASAN overhead.
> >>
> >> I doubt users who care about security enough to enable HW_TAGS KASAN
> >> are willing to compromise on security just to save a few instructions
> >> to store tags in the free path.
> >>
> >> To me, it looks like too much of a compromise on security for little
> >> performance gain.
> > 
> > I don't think there's much compromise on security for use-after-free.
> 
> I think it depends... OH, WAIT! I see what you mean.
> 
> You mean use-after-free before reallocation does not lead to much
> compromise on security because objects are initialized after allocation?
> 
> You're probably right.
> 
> Hmm, but stores to e.g.) free pointer, fields initialized by
> constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
> will be undiscovered if they happen before reallocation.

Even with SLAB_TYPESAFE_BY_RCU, the object isn't tagged on free either
(or realloc, only if the actual slab page ends up freed). But we don't
get type confusion for such slab.

However, without tagging on free, one could argue that it reduces
security for cases where the page is re-allocated as untagged - e.g. all
user pages mapped without PROT_MTE. Currently we have a deterministic
tag check fault if the page is coloured as KASAN_TAG_INVALID. I think
for this patch, it might be better to only do such skip on free in
kasan_poison_slab() rather than kasan_poison(). Freed pages would then
be tagged.

An alternative would be tagging on free only with a new tag and skipping
it on re-alloc. But we'd need to track when it's a completely new
allocation or a reused object (I haven't looked I'm pretty sure it's
doable).

-- 
Catalin

