Return-Path: <linux-doc+bounces-91158-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UnRYDg0cI2qOigEAu9opvQ
	(envelope-from <linux-doc+bounces-91158-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 20:57:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C064AC75
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 20:57:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I10tYfVd;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91158-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91158-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 551DC301F9E0
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 18:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A2B3C5523;
	Fri,  5 Jun 2026 18:40:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA7E33F59A;
	Fri,  5 Jun 2026 18:40:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684806; cv=none; b=e4KhDhL8m2MefnYrveHlxiGgZZZY9miTQozalVMaqpLxs+CL6yImP5LoweZgcRh0KELtYE41sZdu7CJu1rxKooRK3BgmMc19EOZb8J8EHX7EjFfauWC6hhzn48JBjC9o781QmKmerd5qJO5ukDN6yla4QiKPcbUqLJ8RYoiqOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684806; c=relaxed/simple;
	bh=3NeQJ/6huPTik8Yef6xe4+FcW9uZSAc/bOVHCRIAnVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2zAb7MRgvZUoFRvMhazXO7U5gQ4B/TKv/nrcDDYgjHXmsjOdj+sY5uourwjM83YHGnhksbf/FGBrkCQ/nB8c4fpzrnVZy0kz5y3lS+Zsu/6H9pC6d2ftVufDA5ISrAk9itWpgNgzmitNPvAxorpdqOUdTm0KUAMP+Be4jd5Abg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I10tYfVd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276061F00893;
	Fri,  5 Jun 2026 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780684805;
	bh=jTyJbpnjz0kWvq3rixWsFNs2cgyukhDKAnb80ImkEk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I10tYfVdKGGqSv/Q2EFZd58lQ1NVLROgG98kfjLYCeSLNbr0Z+YZ8eea48dvlaqy+
	 Qa457EFC2SY8r95cit4+OarwxX5irG2eXykkU6m5cHXKSQiOtOyoL7kjoR8SIulO1l
	 xwh/ScwA5P75F9KgnYp26rFR2Hd73t/bvTzRwWgZeRvQaNbU9WAZYpwqqDAYdSrpbM
	 teCvM9V2O/6MHPZuZIbgZyMNhAQuDJmuF6E08pXq1nvmHV5wUEW03KQiusiQyJpNLW
	 H8nSIqodzTx9MZCmaGSTZncnnfOdidaWz6DhMJpWxe6eAbG0IN6wXfG/ZLQMgDVnj0
	 gYeAhzXIDB1MQ==
Date: Fri, 5 Jun 2026 19:39:50 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Nico Pache <npache@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	aarcange@redhat.com, akpm@linux-foundation.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, 
	hughd@google.com, jack@suse.cz, jackmanb@google.com, jannh@google.com, 
	jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, mathieu.desnoyers@efficios.com, matthew.brost@intel.com, 
	mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, 
	rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org, 
	richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, surenb@google.com, 
	thomas.hellstrom@linux.intel.com, tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, 
	vishal.moola@gmail.com, wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com
Subject: Re: [PATCH mm-unstable v19 00/14] khugepaged: add mTHP collapse
 support
Message-ID: <aiMXqZkOJ2dZgyDU@lucifer>
References: <20260605161422.213817-1-npache@redhat.com>
 <177704e1-03b3-4791-9a69-9b83b72d61d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177704e1-03b3-4791-9a69-9b83b72d61d5@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91158-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:npache@redhat.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:lance.yang@linux.dev,m:liam@infradead.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan.roberts@arm.com,
 m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:joshuahahnjy@gmail.com,m:richardweiyang@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,kvack.org,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,linux.dev,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A84C064AC75

On Fri, Jun 05, 2026 at 08:07:02PM +0200, David Hildenbrand (Arm) wrote:
> On 6/5/26 18:14, Nico Pache wrote:
> > The following series provides khugepaged with the capability to collapse
> > anonymous memory regions to mTHPs.
> >
> > To achieve this we generalize the khugepaged functions to no longer depend
> > on PMD_ORDER. Then during the PMD scan, we use a bitmap to track individual
> > pages that are occupied (!none/zero). After the PMD scan is done, we use
> > the bitmap to find the optimal mTHP sizes for the PMD range. The
> > restriction on max_ptes_none is removed during the scan, to make sure we
> > account for the whole PMD range in the bitmap. When no mTHP size is
> > enabled, the legacy behavior of khugepaged is maintained.
> >
> > We currently only support max_ptes_none values of 0 or HPAGE_PMD_NR - 1
> > (ie 511). If any other value is specified, the kernel will emit a warning
> > and mTHP collapse will default to max_ptes_none=0. If a mTHP collapse is
> > attempted, but contains swapped out, or shared pages, we don't perform
> > the collapse.
> > It is now also possible to collapse to mTHPs without requiring the PMD THP
> > size to be enabled. These limitations are to prevent collapse "creep"
> > behavior. This prevents constantly promoting mTHPs to the next available
> > size, which would occur because a collapse introduces more non-zero pages
> > that would satisfy the promotion condition on subsequent scans.
> >
> > Patch 1-2:   Generalize hugepage_vma_revalidate and alloc_charge_folio
> >              for arbitrary orders.
> > Patch 3:     Rework max_ptes_* handling into helper functions
> > Patch 4:     Generalize __collapse_huge_page_* for mTHP support
> > Patch 5:     Require collapse_huge_page to enter/exit with the lock dropped
> > Patch 6:     Generalize collapse_huge_page for mTHP collapse
> > Patch 7:     Skip collapsing mTHP to smaller orders
> > Patch 8-9:   Add per-order mTHP statistics and tracepoints
> > Patch 10:    Introduce collapse_possible_orders helper functions
> > Patch 11-13: Introduce bitmap and mTHP collapse support, fully enabled
> > Patch 14:    Documentation
> >
>
> Went through it and didn't find any blockers. Let's wait for Lorenzo's assessment.
>
> If he also doesn't find anything major, I think we can move forward with merging
> it and handle smaller things as follow-ups.

All LGTM :)

Unless sashiko tells us about something utterly broken (trivial things meh,
existing things meh), or we see some massive breakage in testing, I
think... *drum roll*

We're good to take this this cycle :)

Thanks Nico for your patience during this process and obviously David and Lance
and all the other reviews for taking part.

We got there in the end :)

>
> --
> Cheers,
>
> David

Cheers, Lorenzo

