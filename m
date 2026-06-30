Return-Path: <linux-doc+bounces-94178-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YekxJiXSQ2rNjQoAu9opvQ
	(envelope-from <linux-doc+bounces-94178-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:26:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F386E56B0
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:26:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VEafmnya;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94178-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94178-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFDAE30533A9
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 14:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA3B42848C;
	Tue, 30 Jun 2026 14:21:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA14279F8;
	Tue, 30 Jun 2026 14:21:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829303; cv=none; b=Hi1OeqP8hsd29PrSUYCDRi/9G3kBYdK7B+VhK3r1YRKSOkn7hpOMN3eRe5zDocdHxruBzC9N0ZqGtk21rxG6Uk9N7R+DgURBM0rQvvKRritt9qHe+qcJJQhk8RivzvxGE9nBtO6layC3lZzdPBrbc3zXTHhcxufooNQw1PFavMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829303; c=relaxed/simple;
	bh=bd1/0TdjL11u0DTphGjE55A2Nnaw1C6h18bwK1xcKo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiWHIdzNFbHfzNYUI9g6ilEpDY/dfa606Dn5E2/kkjuB9TOGXksDkVCxxjtGPcQojcCZ3IAebc4YrYG0+p+ZXB19tRtFQsLctZmvUxiJXB5Ib2wwTJ6yv+mSRzwRJrkxSo89z6Z+LSBrh9xlBFF608LyMtydUc8JTmh/Ni3pQjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEafmnya; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5C91F00A3D;
	Tue, 30 Jun 2026 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829301;
	bh=BsBU320Hc5ufAPLrytCYeiRiiWiPejNIHIOiOIU1tRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEafmnya0emV59ZXlYQ85WdhCP1GHh6+WtrnnMLIqUC0AAuMSrJ+6QlCNRQJx4voz
	 PEP8bw2e/LNBYP56c50maL0qzY+YiwCzsF1t3LE7aSzx9HeWpL9tf92Dia8jq1lEqP
	 XKnQWU6pp+FVjXqeYBmhsjxlmLIDtvN31yG0y1+siEsjjfURunI+dHJeyekGVXkcdK
	 Vt74TfXgFSgPH80BMG2dGtam5XLTZGbIts9fiiab0UoaebguZtDRTwKjpx3g/Z5P9E
	 UqVETkJ5cVPusKTru3En4RzcTp64gLQGQudGO8RpLM5CPTZ19gfS3tKWehKT/lNJut
	 9xgYDk7CAe3mw==
Date: Tue, 30 Jun 2026 15:21:36 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 1/2] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering
Message-ID: <akPQ8F3OgER621UP@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-2-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625182425.3194066-2-sdonthineni@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sdonthineni@nvidia.com,m:catalin.marinas@arm.com,m:vladimir.murzin@arm.com,m:jgg@nvidia.com,m:linux-arm-kernel@lists.infradead.org,m:mark.rutland@arm.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:vsethi@nvidia.com,m:jsequeira@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94178-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[willie-the-truck:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56F386E56B0

On Thu, Jun 25, 2026 at 01:24:24PM -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state, as a load is observed before an
> earlier store takes effect.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB, and no DMB that orders loads, between the store and
>     the load.

Does that mean that a DMB LD between the store and the load would
solve the problem?

It would be interesting to see how your benchmarks motivating patch 2
look if you leave __raw_writeX as-is and instead add a barrier in
__raw_readX before the load instruction.

Will

