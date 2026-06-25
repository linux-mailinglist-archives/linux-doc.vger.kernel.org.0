Return-Path: <linux-doc+bounces-93471-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SfBmEkyIPGqXpAgAu9opvQ
	(envelope-from <linux-doc+bounces-93471-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 03:45:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02A6C2370
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 03:45:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.microsoft.com header.s=default header.b=RsI3p3W9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93471-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93471-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.microsoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79152303C3D3
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 01:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83390374745;
	Thu, 25 Jun 2026 01:42:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EB6373BF2;
	Thu, 25 Jun 2026 01:42:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782351735; cv=none; b=He+96zwZEVh4uUYZORls1syOLVSDKDeo1R2Prc5XDVzqkB1AvvGmRe7tBkh6wzwwzts7SgpjKZ6AYJMRiWTNosDqm43Jel/7ouYI8wY0WMItA9HHs9UHQYrfA4P8MXX8Vl6utysa5B9N2ghT8lSQNxADHIz3CSX++YdtOkVokdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782351735; c=relaxed/simple;
	bh=SlWHb3UNdORbxtbhcNIGOJhWqtMTK9yv6DbzVvyy8K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOZ0hFPsL3LFXUcYm1YxpA1dnMf+lN4vqA1KRj8bib5fNifKQKiQx680uIIASx5TeH0O5P8Ut6AOVyzQnNMT73ErkC8JEZaiNC1ZLKRqNqcgrmcNrkHBQRNFGVa0OIZmrRbEet2ienKYK3MTmHtkvtj1paW8BjRr9HKc4INF0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=RsI3p3W9; arc=none smtp.client-ip=13.77.154.182
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 94BBD20B7166; Wed, 24 Jun 2026 18:42:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 94BBD20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782351729;
	bh=R9YZdvvngxcUtp6hqFhBEeGgAlTFhxNj0jj5VAyk9NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsI3p3W9mw9+E4CmCmsQxQXq2R4z9L0WJxqdFRti7Hs+ajZex5t6lCfkSE/OIEVAI
	 1OIVFnLVrMUKurbFgAdWtLYMmuGsrmJYjWnJBdAskBjJEJE/wQtr15fw8k3wUtVgRW
	 3OpFhz4evVHJYTCo84xP6P/B7yj6UwQCnNSFVYZg=
Date: Wed, 24 Jun 2026 18:42:09 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, kees@kernel.org, tony.luck@intel.com,
	gpiccoli@igalia.com, bp@alien8.de, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, elver@google.com,
	enelsonmoore@gmail.com, kuba@kernel.org, lirongqing@baidu.com,
	ebiggers@kernel.org
Subject: Re: [RFC PATCH] reserve_mem: add support for static memory
Message-ID: <ajyHcT2CnKkADfWP@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260618224018.117978-1-shyamsaini@linux.microsoft.com>
 <2vxzpl1hmmgn.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzpl1hmmgn.fsf@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[microsoft.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pratyush@kernel.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rppt@kernel.org,m:akpm@linux-foundation.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[shyamsaini@linux.microsoft.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93471-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsaini@linux.microsoft.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,kernel.org,linux-foundation.org,intel.com,igalia.com,alien8.de,infradead.org,linux.alibaba.com,linux.intel.com,google.com,gmail.com,baidu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.microsoft.com:dkim,linux.microsoft.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B02A6C2370

Hi,

On 23 Jun 2026 15:10, Pratyush Yadav wrote:
> On Thu, Jun 18 2026, Shyam Saini wrote:
> 
> > reserve_mem relies on dynamic memory allocation, this limits the
> > usecase where memory and its address is required to be preserved
> > across the boots. Eg: ramoops memory reservation on ACPI platforms
> >
> > So add support to pass a pre-determined static address and reserve
> > memory at this specified address. This enables use case like ramoops
> > on ACPI platforms to reliably access ramoops region across the boots.
> 
> Doesn't memmap= do exactly this? How is this different?

yes, but memmap is not available for ARM platforms
There was an unsuccessful [1]attempt to add memmap support for ARM

> I always thought the point of reserve_mem was that you _don't_ have to
> provide an explicit address, one is chosen for your machine
> automatically.

ok, but I am not sure if that was the only intent. 
> >
> > Also skip parsing of "align" parameter when static address is passed.
> >
> > Example syntax for static address
> >  reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops
> >
> > Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

By the way, RFC v2 for this change is already posted [2] here

Thanks,
Shyam


[1] https://lkml.kernel.org/lkml/20201118063314.22940-1-song.bao.hua@hisilicon.com/T/ 
[2] https://lore.kernel.org/lkml/20260619062331.348789-1-shyamsaini@linux.microsoft.com/

