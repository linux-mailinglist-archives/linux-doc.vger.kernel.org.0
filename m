Return-Path: <linux-doc+bounces-92932-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7qExHXs+NWpTpwYAu9opvQ
	(envelope-from <linux-doc+bounces-92932-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 15:04:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EC6A5EDD
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 15:04:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=lQUOPpbA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92932-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92932-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79B50300DDFE
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 13:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B586138A726;
	Fri, 19 Jun 2026 13:04:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3371A3750CF;
	Fri, 19 Jun 2026 13:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874295; cv=none; b=EOzfKVenTwL7SDxRTN0Yll/h4D9Z0uIaa1gx65jxvsCuOPkTvsLhCbvatKwUZcHb0d4AxzcXNoGRom0y6aRByx9YW6po6PZKVH0yjAll97KyejXNK2KTnzNOND+KWqVe+rdfPZ4ZLhlrEYVQqJ6XRZAMmkQWlfQA6we2p3orv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874295; c=relaxed/simple;
	bh=e9pfEYbv59UVNvg5pd3j1Yh0i55qXWOlAw6aQXf2fiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYatG47jNTsPTcVTYsX36GGXGNaJZCbXk1HQWu8ZBJMJtTaUI/IW2nlFlIWwVn6r93LeKK0zCOYKUSF6YCi3nJxryMU8uZ5mShojJS1MTLoNO6oxh7S0Iq5VoaCV5hYnbdYZIgEEYQOtz7GjzYVEkY1Rgj/ZuRgMfEmGTYf2EyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lQUOPpbA; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E85D24A92;
	Fri, 19 Jun 2026 06:04:48 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E4AD3F763;
	Fri, 19 Jun 2026 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781874293; bh=e9pfEYbv59UVNvg5pd3j1Yh0i55qXWOlAw6aQXf2fiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQUOPpbAmN6Zr1EYJgextc9Lnki8Ehn68EA514fFROJG93hMv4r2Cfa/r8NEkWg3n
	 w7/Zq2/WnP0TUUTs/hsA6wrxV4sm6R2stNIFSF+9iXhA2oqOiIZLzOIr6XQovIdoEu
	 /E9iWQPaERn1E4Z9+FmbsevKh/DyS57CcpVOvJzY=
Date: Fri, 19 Jun 2026 14:04:47 +0100
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
Message-ID: <ajU-b32dmwS7XOg4@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-92932-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE9EC6A5EDD

On Thu, Jun 18, 2026 at 11:05:43PM +0900, Harry Yoo wrote:
> On 6/18/26 10:35 PM, Harry Yoo wrote:
> > On 6/12/26 1:44 PM, Dev Jain wrote:
> >> Introduce a boot option to tag only at allocation time of the objects. This
> >> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> >> catching bugs.
> > 
> > I think most of overhead when enabling MTE comes from loading and
> > validing tags for every memory access (either in SYNC or ASYNC mode),
> > rather than from storing tags.
> 
> Is there any reason not to use STGM instead of STG + DC GVA when
> setting/clearing tags for large sizes when we know they are properly
> aligned?

STGM is intended for copying tags when paired with LDGM. Have you seen
hardware where STGM is faster than STG or DC GVA? For properly aligned
buffers, I'd expect DC GVA to behave at least on par with STGM.

-- 
Catalin

