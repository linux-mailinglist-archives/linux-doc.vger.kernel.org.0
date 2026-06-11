Return-Path: <linux-doc+bounces-92032-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WFWgMvQOK2ry1wMAu9opvQ
	(envelope-from <linux-doc+bounces-92032-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 21:39:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E4674CA8
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 21:39:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b="n3/FtI6B";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92032-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92032-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AAF631A1002
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 19:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C191F099C;
	Thu, 11 Jun 2026 19:38:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D46344D90;
	Thu, 11 Jun 2026 19:38:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206684; cv=none; b=CIhomU1Vzlh1YP2aZWpOLxmVZR5piam3Cb1pkaabGovBSBgWCrEGRAoPNsYINCwz0WW8102wRGEbKPgxScMzRPs5NZUIOUZnBETGk8DtOSyx8Y0DtcYoLfyqsKHljlFhL83eTYaqjFvtvR30QT/chiGsY0FniLC2rj9xEuq17JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206684; c=relaxed/simple;
	bh=uTxLumDCgqwiG5I92XZtt6Vfe/JMtn/AWHCioDi1IGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOCZHewdqKPqyD0HiQTTnjDeOr5InnI5nWDnantl0nnbT8L/k1M7Bb/Oo4dn2/Gh6JRz7X8VBwS5MHR3f0NW0fWztd7xKl1xsCSI1UMiGAF/c0X2tvs0KWzF0FX6qAUQS3vyJ1lyQbFgyqFFvR6iF7OHNQepOwnygdHrm+TM6i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=n3/FtI6B; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NJitvU5xfaKwDhhPD4oSV3hFuyqY6F2GIa31aftsKS4=; b=n3/FtI6B9mXYdppI5R3zmw5ap7
	jvLiYCJtM9oYjMUjAOdi7kp3HOeb/++TZtR0i8Wr0Mh5j85EHp4M0GkEWsDRnK8dRrrgLAeSnV5HX
	wV7fCdImAG5OE9VLs4UAK+HLDTmuKlYCuiNR3RqDfOVu9udnajiEsvSQFZjEIESq84v39tDS07N1+
	44FzneOz80kU6DpmKtpkf06ZU5CjmhEWqHWkl7bZx2wLILo4og/M8rypZ7w1FCFCkx9o1oSR6C5A0
	i3+GprQBMByaBZxC3hOn3ap7haf9umae+iwti97Og9isscyfIilViOxiVXvEjXwoFfuZnaSXtFFpb
	di1bWy5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlDn-00000002TdH-3YiK;
	Thu, 11 Jun 2026 19:37:48 +0000
Date: Thu, 11 Jun 2026 20:37:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC V2 0/3] lib/vsprintf: Add support for pgtable entries
Message-ID: <aisOi1B0o5KYyaQo@casper.infradead.org>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
 <aisJbeVVxxNuYxQ6@casper.infradead.org>
 <aisNjxHW369cbKiq@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aisNjxHW369cbKiq@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:anshuman.khandual@arm.com,m:linux-mm@kvack.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:david@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-92032-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim,infradead.org:from_mime,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 207E4674CA8

On Thu, Jun 11, 2026 at 10:33:35PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 11, 2026 at 08:15:57PM +0100, Matthew Wilcox wrote:
> > On Wed, Jun 10, 2026 at 05:35:42AM +0100, Anshuman Khandual wrote:
> > > Printing page table entries has been a common requirement both in generic
> > > and platform memory management for various purposes. Hence let's create a
> > > dedicated printk format for such entries which will also help standardize
> > > pgtable printing across different platforms.
> > 
> > You didn't address my objection here:
> > 
> > https://lore.kernel.org/linux-mm/aFQP8LzVMctf6XH5@casper.infradead.org/
> > 
> > ie there is now no typechecking possible.  So you've made it more
> > dangerous.  I reiterate my NACK to the concept, not to the implementation.
> 
> But this is more of a global question, how do we check the validity of
> the parameters of pointer extensions in the kernel? Does anybody go to
> commit into GCC plugin or so for this job?

I agree that it's a global question that it would be great for somebody
to answer.  But it's specifically a problem for this patchset because:

 - It's really easy to get confused about which page table level you're
   working on.  And hugetlbfs deliberately increases that confusion.
 - Different levels of the page tables actually do have different sizes
   on some architectures, so if you think you're looking at a pointer to a
   64-bit quantity when it's really a pointer to a 32-bit quantity, things
   Will Go Wrong (or vice-versa.  And some architctures are big-endian)
 - But on x86-64, Everything Is Fine because all levels of the page table
   are basically identical, so you'll never notice there's a problem.

