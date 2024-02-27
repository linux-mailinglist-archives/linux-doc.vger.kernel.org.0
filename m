Return-Path: <linux-doc+bounces-10911-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4F86A0D0
	for <lists+linux-doc@lfdr.de>; Tue, 27 Feb 2024 21:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 737CB1F23261
	for <lists+linux-doc@lfdr.de>; Tue, 27 Feb 2024 20:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474CA14A4C9;
	Tue, 27 Feb 2024 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FBGdxf0/"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E37351004
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709065603; cv=none; b=e0ilalURaL9L9lmjTf+xkXWdXDEBmhe8ARe5mW5miGxSkZhfZGE5BbSIlrCr1xZw1X5v6sRFZqUalsnMdnE5MhnMQFEVxKaFPbloDkEDaduP9aqtUuLl0XTlwW5ExtghAVSecaBsvlJTgPQMoet7QLezjr97Rco805PBJ86t4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709065603; c=relaxed/simple;
	bh=3tRZuvPHHOhygSXJBJH+alzzC66qaSEYolDegpnsGqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVE7cLdk+sP5F+/aZAh2vlG23f2CVgHj+JHZECZU6T5+KIOhSAMiQFMzjiNOOMzQFMWnxiK99hzgahnifnWHWF2hk9UwiyhRzs6JzVsUwH6l2oc8R4RkNMhU4ae0P3FunGGvaqH1xylkZWXiCGTx8RJSJpYB9uL2JmQYq9ZtCnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FBGdxf0/; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 27 Feb 2024 20:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709065599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdw1puFlbNlHUYaiFr/sDKEHRN2itqNfYyV2O0hyzVM=;
	b=FBGdxf0/6LIvQI8sIuws8hVaxLlZ89fe7AjRV0bLbqh4BDmPKWkEW40uT/zR6fKP0dxqjT
	pZCAKxMtm1aWyird4Lz7+CBzrwDzNZaZmiObRDYx7OotZkfztZHZn+hIT+T/SwFwwHNnXA
	9hpHsOsind2LxoHj+BvaBh71kYR+gTQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, maz@kernel.org, will@kernel.org,
	suzuki.poulose@arm.com, james.morse@arm.com, corbet@lwn.net,
	boris.ostrovsky@oracle.com, darren@os.amperecomputing.com,
	d.scott.phillips@amperecomputing.com
Subject: Re: [PATCH] arm64: errata: Minimize tlb flush due to vttbr writes on
 AmpereOne
Message-ID: <Zd5FeS0Vlzp8MIwr@linux.dev>
References: <20240207090458.463021-1-gankulkarni@os.amperecomputing.com>
 <ZcNRV-lMiNgE0_jv@linux.dev>
 <Zd5B6huxqEcYIW6b@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zd5B6huxqEcYIW6b@arm.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Feb 27, 2024 at 08:11:22PM +0000, Catalin Marinas wrote:
> On Wed, Feb 07, 2024 at 09:45:59AM +0000, Oliver Upton wrote:

[...]

> > Think of the precedent this would establish. What would stop
> > implementers from, say, changing out our memcpy implementation into a
> > a hundred different uarch-specific routines. That isn't maintainable,
> > nor is it even testable as most folks don't have access to your
> > hardware.
> 
> I agree. FTR, I'm fine with uarch optimisations if (a) they don't
> run-time patch the kernel binary, (b) don't affect the existing hardware
> and (c) show significant gains on the targeted uarch in some meaningful
> benchmarks (definitely not microbenchmark hammering a certain kernel
> path).

and (d) they have a minimal, maintainable code footprint :)

> So, if one wants an optimisation, it better benefits the other
> implementations or at least it doesn't make them worse. Now, we do have
> hardware from mobiles to large enterprise systems, so at some point we
> may have to make a call on different kernel behaviours, possibly even at
> run-time. We already do this at build-time, e.g. CONFIG_NUMA where it
> doesn't make much sense in a mobile (yet). But they should not be seen
> as uarch specific tweaks, more like higher-level classes of
> optimisations.

Agreed. I think the way we handled this case is a great example of how
these sort of things should go -- a general improvement to how the stage-2
MMU gets loaded on VHE systems, which ought to benefit other
implementations too.

Only if we can't extract a generalization should we even think about
something implementation-specific, IMO.

-- 
Thanks,
Oliver

