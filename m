Return-Path: <linux-doc+bounces-94210-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BgvdL1v5Q2rxmQoAu9opvQ
	(envelope-from <linux-doc+bounces-94210-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:14:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829E6E6CCD
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:14:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.microsoft.com header.s=default header.b=lqMj+EEx;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94210-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94210-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.microsoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F2223068F84
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 17:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A703DB315;
	Tue, 30 Jun 2026 17:09:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0FA3DB310;
	Tue, 30 Jun 2026 17:09:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839375; cv=none; b=GR0+/B4+4oOWwunxxwgodFJZkHRW7HNBIZ8WOi6xvJDXiquJENZ4kAbwgqVuuCEvlwfyBq1dLdRoZygZGGdT/G5RkJpM1a4tO1UPJ2UCOXeXw2jDi9kToyuEWWDIAyzhBTns7xoMFQtgHzoVQyhUhF0y0EdOdK7Qnh8mkatMeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839375; c=relaxed/simple;
	bh=UPfdjhv5JhSpLqdo/TvXn4cTimKDSRJixzUikyIumC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+CInud7q1Dp33h1S/h2tNIxeiV+FhFWq/RehFs1g7vc5SIaW2hwWR13r/cP27lM/d6dsLF04B3xz6Rc0JqpYuy+0lzrg2sL/TmebEirtsRWPUg/zlihGp8p9L6X9ze/wpby0QFQtFsS25T72kSjl7q4OrRfv4F5M8ygp/gqkcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=lqMj+EEx; arc=none smtp.client-ip=13.77.154.182
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id 606FD20B716C;
	Tue, 30 Jun 2026 10:09:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 606FD20B716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782839372;
	bh=B5CJTk2TlD92UoezyHqsHilXeiTs4Pq4ZgYFgjk1fNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqMj+EEx6yimT5SdLBxPpYjQVeixzMgWJxE3inL7BSg7A8SIwXJw9/SY3hMdm+e2F
	 B4YadK9ITH+eLe9c7LsalSb5FNRP8fJJGvoWAnL+APrr3XphmWzeBv2nRpYtGgU0/5
	 H4Po029v5P7HCLxZZkL5nAHTbp9PT+RnE384lSTY=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: shyamsaini@linux.microsoft.com,
	ardb@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	will@kernel.org
Cc: akpm@linux-foundation.org,
	bboscaccy@linux.microsoft.com,
	bp@alien8.de,
	dapeng1.mi@linux.intel.com,
	ebiggers@kernel.org,
	elver@google.com,
	enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com,
	gpiccoli@igalia.com,
	kees@kernel.org,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lirongqing@baidu.com,
	peterz@infradead.org,
	rdunlap@infradead.org,
	rppt@kernel.org,
	tgopinath@linux.microsoft.com,
	tony.luck@intel.com
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Date: Tue, 30 Jun 2026 10:09:11 -0700
Message-ID: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aj6SqipC/dIN01iN@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <aj6SqipC/dIN01iN@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[microsoft.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94210-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,linux.microsoft.com,alien8.de,linux.intel.com,kernel.org,google.com,gmail.com,linux.alibaba.com,igalia.com,vger.kernel.org,kvack.org,baidu.com,infradead.org,intel.com];
	FORGED_RECIPIENTS(0.00)[m:shyamsaini@linux.microsoft.com,m:ardb@kernel.org,m:catalin.marinas@arm.com,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:will@kernel.org,m:akpm@linux-foundation.org,m:bboscaccy@linux.microsoft.com,m:bp@alien8.de,m:dapeng1.mi@linux.intel.com,m:ebiggers@kernel.org,m:elver@google.com,m:enelsonmoore@gmail.com,m:feng.tang@linux.alibaba.com,m:gpiccoli@igalia.com,m:kees@kernel.org,m:kuba@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lirongqing@baidu.com,m:peterz@infradead.org,m:rdunlap@infradead.org,m:rppt@kernel.org,m:tgopinath@linux.microsoft.com,m:tony.luck@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[shyamsaini@linux.microsoft.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsaini@linux.microsoft.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.microsoft.com:dkim,linux.microsoft.com:mid,linux.microsoft.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3829E6E6CCD

Hi Everyone,

> On 25 Jun 2026 11:37, Mike Rapoport wrote:
> > Hi Shyam,
> > 
> > On Wed, Jun 24, 2026 at 06:22:33PM -0700, Shyam Saini wrote:
> > > On 21 Jun 2026 13:36, Mike Rapoport wrote:
> > > > On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> > > > > reserve_mem relies on dynamic memory allocation, this limits the
> > > > > usecase where memory is required to be preserved across the boots.
> > > > > Eg: ramoops memory reservation on ACPI platforms
> > > > >
> > > > > So add support to pass a pre-determined static address and reserve
> > > > > memory at a specified location. This enables use case like ramoops
> > > > > on ACPI platforms to reliably access ramoops region with previous
> > > > > boot logs.
> > > > > 
> > > > > Also skip the parsing of <align> when static address is passed.
> > > > > 
> > > > > Example syntax for static address
> > > > >  reserve_mem=4M@0x1E0000000:oops
> > > > 
> > > > reserve_mem is best effort by design because such hacks as well as memmap=
> > > > cannot guarantee this memory is actually free.
> > > > 
> > > > If you want to preserve ramoops reliably, use KHO with reserve_mem.
> > > > The first kernel will allocate memory, this memory will be preserved by KHO
> > > > and could be picked up by the second kernel.
> > > 
> > > ok, On ARM64 DTS systems, we can reserve ramoops memory in the device tree during
> > > the warm reboot.
> > 
> > The cc list actually implied x86 ;-)
> > Added arm64 folks now.
> 
> Thanks for adding ARM folks, I had just included whatever get_maintainer script
> suggested, sorry. 
> > > For an equivalent ARM64 ACPI platform, what is the recommended way to reserve
> > > and preserve that memory across the boots? 
> > 
> > I don't think it exists, but a command line option (be it memmap= or
> > reserve_mem=) does not seem the right way to me.
> > 
> > Most of the arguments that were made against adding memmap= to arm64 [1]
> > apply here.
> > 
> > If kexec is an option, KHO provides a reliable way to preserve memory
> > across boots.
> > 
> > If kexec is not an option, we should look for a generic way to specify
> > something like DT's reserved_mem for ACPI/EFI systems.
> > 
> > [1] https://lkml.kernel.org/lkml/20201118063314.22940-1-song.bao.hua@hisilicon.com/T/
> > 
> Well, kexec is one of the option for my use case, it also requires
> memory reservation during warm reboot, I think memory can be reserved in
> the firmware but this will create a dependency on firmware for Linux
> reservation.
> 
> It would be great to have a in kernel memory reservation mechanism for
> ARM64 ACPI platforms. I believe some other use cases like PMEM
> reservation would also benefit from this.
>

Following up on this, As Mike pointed that reserve_mem is best effort
reservation mechanism, so what is the recommended reliable Linux
mechanism, if any, to reserve a predetermined memory range during
early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
one option, but I'm specifically looking for a solution that preserves
the region across warm reboots.

Please let me know.

Thanks,
Shyam

