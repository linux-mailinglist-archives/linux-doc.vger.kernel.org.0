Return-Path: <linux-doc+bounces-94172-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ts0DCJ7LQ2oViQoAu9opvQ
	(envelope-from <linux-doc+bounces-94172-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 15:58:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 930056E523A
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 15:58:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OB3f2+qO;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94172-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94172-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 642933130630
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375B12FD68B;
	Tue, 30 Jun 2026 13:53:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2572E7404E;
	Tue, 30 Jun 2026 13:53:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827618; cv=none; b=PdpATNWP6ntKGYBPFCkyQfsbdR90ENydj0Yf/JrWp6cplvvB4LG/VgfzdbqCgckqidDJTfAJ64qVss8kmcpmTTlYssjAn/hxC0KwHdEQxwd4fvtz2fX4HgFqLsDKQhhi5pRiVrUW/H3qGsKTTZVkuVNqUE2tdTG8FynTl11jzf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827618; c=relaxed/simple;
	bh=2Iha2aPRzf/edKvSXYfibJG6j0QD17DVopPfoz2YfRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuUt/AiTtGcZy2nYJMnAQATQZr/BXYt7g274g1+pe1jkjrmIhFkftfkzRPcYCl3lFmAXLdk0y1UAWcFqmPe/QTMQhy3sdowXn4h+A4l24B7OnxGw5sJY9GFi1Pkf/fxSFMfh7I+E4HAp1LypAnzHcmrqAw/Yg0/nFLYcDJEvsXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB3f2+qO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12051F000E9;
	Tue, 30 Jun 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827616;
	bh=L8auU58LgAXdY4hWCl6wHaE8gXHNNTt7g9BcuB3xl/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OB3f2+qOmRlqlAGoNAuNbUTF/wGc94sX4j0dhQaK0hp4KClwPMcoDtyij1m4QI+uw
	 7UIMIErKIwNYqmN/5ZFXwBHFquX/hrqbfTO0wriPqz0XN3WMC9syVtKDWc5PD93URW
	 hON1xtFS5ALZ8eo0xAUfiEDad5rGxYTsiHIqfykre4fvR4ZN8N4m4u3hYvyAG1x/S2
	 ttGmquaYzMsPbQr5aIP7Xr/ab3feOSwb6L0EF9HWA+JpTQeMy3qjy4zFwuWG5Y4+yT
	 dt07mdNe0B/F8Ec6PqL/wvDdCLLqe+balCtUx+FBmjNUn4AAc6hH1Xdeqnv4YMyMC7
	 Uwlc2bAjlkqzg==
Date: Tue, 30 Jun 2026 14:53:31 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 0/2] arm64: errata: NVIDIA Olympus device store/load
 ordering
Message-ID: <akPKWxYxDvLGVfQx@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <381fb71c-0a2c-4dec-98a3-56ad88e190c6@arm.com>
 <ba15e106-9066-4e55-be2f-6767a32e123d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba15e106-9066-4e55-be2f-6767a32e123d@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sdonthineni@nvidia.com,m:vladimir.murzin@arm.com,m:catalin.marinas@arm.com,m:jgg@nvidia.com,m:linux-arm-kernel@lists.infradead.org,m:mark.rutland@arm.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:vsethi@nvidia.com,m:jsequeira@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94172-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 930056E523A

On Mon, Jun 29, 2026 at 06:08:37PM -0500, Shanker Donthineni wrote:
> On 6/29/2026 5:45 AM, Vladimir Murzin wrote:
> > That's interesting. With the way the patch set is structured, it
> > now looks like:
> > 
> > 1. Fix the erratum, but cause a performance regression.
> > 2. Restore the performance regression and (re)apply the erratum
> >     workaround.
> > 
> > Would it make sense to avoid introducing the performance
> > regression in the first place by structuring the patch set
> > slightly differently?
> > 
> > 1. (Re)introduce arm64 memset_io()/memcpy_toio().
> > 2. Fix the erratum once for all
> > 
> > What do you reckon?
> 
> Yes, that ordering makes sense.
> 
> I can restructure v5 so that patch 1 introduces the arm64 memset_{to}io()
> implementations while preserving the existing behavior. Patch 2 will
> then add the complete erratum workaround, including the conditional
> trailing DMB for those block-write helpers. This avoids introducing
> the intermediate performance regression and keeps each commit
> independently usable.
> 
> Will and Catalin, could you please share your thoughts on this approach?

tbh, I think I'm ok with the current ordering. The second patch is purely
a performance thing for affected CPUs, so doesn't strictly need to be
applied or backported for functional correctness afaict.

Will

