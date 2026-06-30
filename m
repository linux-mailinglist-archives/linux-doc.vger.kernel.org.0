Return-Path: <linux-doc+bounces-94175-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oys0IyfRQ2oBjQoAu9opvQ
	(envelope-from <linux-doc+bounces-94175-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:22:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9726E5603
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:22:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=clWEcGmN;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94175-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94175-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CB42317A05F
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 14:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B780533ADA7;
	Tue, 30 Jun 2026 14:17:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF2C346E4E;
	Tue, 30 Jun 2026 14:17:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829041; cv=none; b=MyDbJBdi1fcSnxhCqrqnSt49JO+FYvx0wFcdS+Dk2r+2ihArzXyMotauzm5gbP/3E3jhFLM6SE4iLNa+fBmKih4h6NZwpH5jf+gBSW72fto6+/EiOoi75lLNEtKiOHPq0ePsQAudRtsOFlLjEE+MyQ5qyphvjLK7iLw6IiaIhk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829041; c=relaxed/simple;
	bh=ppUvSfipw7c6xcLfal4fQeQOLzjCHT19gdfd4FLcNE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlJPf2tslBgHKy2NWlSdHwHzNXhPbzosq5nPT44WmEFGlIrQcQaymexLOKIXhS/lGnkGp9jqBGYaC4w5bIZ8G0rgEtmULt/c+NvtW15NFWSUkrIqwgQjq5p8e6QHOjezdlTs9vSx8ylD4LgHhGruw8lHBcazT19Cjw7C8yWXYjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clWEcGmN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749B61F00A3A;
	Tue, 30 Jun 2026 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782829040;
	bh=OpK4VCXxOfi2NsgnoYaHvYKbtIJiOdgK8j0XiL9E3ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=clWEcGmNF63o9sOxWnH5qazA03avsmWr+SnkHLK13JF6pV0jeRIdWPjNFAIUp5QeJ
	 nugKWFJbl0XPR4FwsMi6UTmo91gYvstXD7sQMr6LhHE7x8D/NSmyaC41eOT+28mItS
	 FRCHdNz79S+ZPu+9SeBVZ0w8N5B9Bklvr7Vjo97JRg3zKoxCUvzzaE0Silomr7b1gb
	 UPUP4YVuFx38GGlwmfssibjcxJmhnlSATSwVlKRlB84tRJuKFSaHDMcGIKiLcHdQ1t
	 sU2UiJ9XptJ/6cu1UEI+WkLvkLzbdcmJBewYtFibfUtE6t1XaSsI793SwhuW03vDh3
	 q+6aGRIwNPm2Q==
Date: Tue, 30 Jun 2026 15:17:15 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 2/2] arm64: io: apply the device store-release
 workaround once per block write
Message-ID: <akPP62P_mKN21GTv@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <20260625182425.3194066-3-sdonthineni@nvidia.com>
 <97b62a6f-a514-46bb-9ee8-81f563220f6a@arm.com>
 <d75592c9-5292-4704-b024-6450ea0e8278@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d75592c9-5292-4704-b024-6450ea0e8278@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sdonthineni@nvidia.com,m:vladimir.murzin@arm.com,m:catalin.marinas@arm.com,m:jgg@nvidia.com,m:linux-arm-kernel@lists.infradead.org,m:mark.rutland@arm.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:vsethi@nvidia.com,m:jsequeira@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	TAGGED_FROM(0.00)[bounces-94175-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.103.45.18:received,100.90.174.1:received];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB9726E5603

On Mon, Jun 29, 2026 at 06:09:11PM -0500, Shanker Donthineni wrote:
> On 6/29/2026 5:48 AM, Vladimir Murzin wrote:
> > > +                          : "memory");
> > > +             src += sizeof(u64);
> > > +             dst += sizeof(u64);
> > > +             count -= sizeof(u64);
> > > +     }
> > > +     while (count) {
> > > +             asm volatile("strb %w0, [%1]"
> > > +                          : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
> > > +             src++;
> > > +             dst++;
> > > +             count--;
> > > +     }
> > > +
> > > +     iomem_block_store_barrier();
> > It is perhaps a matter of taste, but having the inline assembly
> > here (and in memset_io()) might make the code clearer. To a
> > casual reader, it would be obvious that the barrier is not
> > guaranteed and is only applicable to ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
> > without having to jump back and forth through the code.
> > 
> > Obliviously maintainers might have different preference ;)

Oblivious maintainer here :)

> Regarding the barrier, iomem_block_store_barrier() is declared
> static __always_inline, so it does not add a function call. The nop/dmb
> osh alternative is emitted directly in each caller. I used the helper to
> avoid duplicating the alternative sequence.
> 
> I understand that placing the assembly directly in both functions could
> make its conditional nature more obvious. I do not have a strong preference
> and am happy to follow Will’s and Catalin’s preference here.

I agree with Vladimir that it would be clearer to inline the conditional
barrier.

It would be even better if we could avoid having to duplicate this code
to start with, but I can't immediately think of a better alternative.

Will

