Return-Path: <linux-doc+bounces-91049-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UB3ZM/+DImpVZgEAu9opvQ
	(envelope-from <linux-doc+bounces-91049-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 10:08:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E8646453
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 10:08:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=lzgDhOin;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91049-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91049-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA7B4307D494
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 08:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5228148B37E;
	Fri,  5 Jun 2026 08:01:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C3A466B4A;
	Fri,  5 Jun 2026 08:01:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646513; cv=none; b=V+KzO1OaYoUKlaxAWLGMJdNdhMJeq2JgHqf2J8voSDktWR9UCajp2ImcLnZLEvMdgtv7VqR3re67mKpVCJLqRXl+apUE4avjaa4lPO3Y8FIgjmcZA42+DtIOjwXPJupD5xPH2Nv06eEIRN/niztkicprkdCCMzFt8owonEzo8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646513; c=relaxed/simple;
	bh=oyb17qXE+TQpLj7wOHLjyKVAHpw+8+/MU0DmqRxGlcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ey/oQHYBcf79FYJT3X91Vdht44wd+aTWZTv+kpx9W6WY29WhJyGnbSBuhijTghDY9OoDj7qHjUhH14/fR60ACT5oA4B8Yu9lRHl6bwuhQl7fBrjFUlaEA8w7WX1Hdxn3I585hEtZDylMjGl7XEEhYguwVi0W1ZZ3RziQa07KlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lzgDhOin; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A6E4B15;
	Fri,  5 Jun 2026 01:01:44 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94ACD3F86F;
	Fri,  5 Jun 2026 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780646509; bh=oyb17qXE+TQpLj7wOHLjyKVAHpw+8+/MU0DmqRxGlcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzgDhOinZ5YAdBgNiW8SG1uXrCo8ne5sUg4ZBrzj8gIuJ+ljtlcGK595RIS1Oe348
	 8RXbsrZDk51FMtuIdmhvvMCSmulseXMPkxz/gNlZR7Q6YZN204mQs60cwP3MLTcsEy
	 +MIQ8b4Vvh56oSMAnI+N1/ZgiZYW//Qih9CHMvgs=
Date: Fri, 5 Jun 2026 09:01:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <aiKCaRvofEFaSVkO@arm.com>
References: <20260604231254.1904988-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604231254.1904988-1-sdonthineni@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_FROM(0.00)[bounces-91049-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sdonthineni@nvidia.com,m:will@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mark.rutland@arm.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:vsethi@nvidia.com,m:jsequeira@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F4E8646453

On Thu, Jun 04, 2026 at 06:12:54PM -0500, Shanker Donthineni wrote:
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
>   - Specific micro-architectural and timing conditions occur.
> 
> Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
> orders loads) between the store and the load, or make the store a
> store-release. A load-acquire on the load side would not help, because
> acquire semantics do not prevent a load from being observed ahead of an
> older store; only the store side (release or a barrier) closes the
> window.

Ignoring Device-nGnR*, a store-release followed by a load (not
load-acquire) would not guarantee any ordering. I assume the
store-release behaviour is specific to this erratum - part of the
preconditions.

The patch looks fine to me.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

