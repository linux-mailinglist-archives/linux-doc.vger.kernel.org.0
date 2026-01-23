Return-Path: <linux-doc+bounces-73820-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PZqF3iRc2ntxAAAu9opvQ
	(envelope-from <linux-doc+bounces-73820-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 16:19:20 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE477B2D
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 16:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D28E7302269D
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138E83090F5;
	Fri, 23 Jan 2026 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a/K4TfXn"
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B97314A70;
	Fri, 23 Jan 2026 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181553; cv=none; b=PBJv+Z60BmCdJMJbi/1DwJ91plLpN2VNqmHZTQ/CHblr/BO25Kh5IwQW/TkHZwBon86G3IUopAia//qavjOhlAS0wuNhEmiFowSvV8WxvRh0B21wHHd78UBFLV4eSAsXz7RnAw/YOKwd6ISCDV++S8L4fHmQaXGjxCxdbaeELH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181553; c=relaxed/simple;
	bh=+P3Rcia1pTCrHrxOYnPEPsvd3wtXXmCuRVCB1ZJyEl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3818+R53qLcufZLL3ecKZwiQZa2yo4o3HRhCK1fvqppTBxKn/em11txG334MfaoY9z7xrWTFU2J5ubTwCxxry0j1jqrWte26UDe4SiGWjoB08iGIZ5Cpm8wKM2jTTYOyLgHyupE1veT5e5zmaKFN+MtyA7iEIjmcUWe2XmBth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=a/K4TfXn; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H+9TPL40B/w5FpgJRoR6T3+roWhl2AbFETa1CY6UQmg=; b=a/K4TfXndM/M6BecTHG+2qsr11
	Zbvd+sTiXzab1tpVByVHypFspt3trfyuKgihGHM3Gr2dGyMBFWxaYDcPDcjik7cZoNhMW1SQeuV1q
	mG454wy4aTFwv5NWhnWJRRGbG+kDk7SAstjuk8NadmzwmkfEA1XAuqyw0zBzw8WYQU59tn8zccij5
	1X0H+tq+rzOiZJdBZj/zvb/3kI35vNzqxTk6OSOcEigsBE20eCNxkk8slmA3wBVNBMuFyhc0UCnGQ
	HmWNRJgsD3oCgUnhtJmxLWNkjd2YmofmIIlLfuimTn4IGM4dJ42SOB/zbQwhoN2HR+RwG6uYCwfKQ
	CkX6ogAA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjIw5-00000002bVu-2yth;
	Fri, 23 Jan 2026 15:18:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6FCCB302FA1; Fri, 23 Jan 2026 16:18:56 +0100 (CET)
Date: Fri, 23 Jan 2026 16:18:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Marco Elver <elver@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: [DOCS] build warning after merge of the tip tree
Message-ID: <20260123151856.GT166857@noisy.programming.kicks-ass.net>
References: <20260107161548.45530e1c@canb.auug.org.au>
 <20260107215409.GB694817@noisy.programming.kicks-ass.net>
 <803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
 <91c5386a-2c1b-476a-b189-86d80c0d9e96@infradead.org>
 <20260123081126.3f0f152c@foz.lan>
 <20260123112856.GS166857@noisy.programming.kicks-ass.net>
 <20260123132054.2d46fb97@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123132054.2d46fb97@foz.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73820-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,noisy.programming.kicks-ass.net:mid]
X-Rspamd-Queue-Id: B2FE477B2D
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 01:20:54PM +0100, Mauro Carvalho Chehab wrote:

> > I have of course no idea what so ever how any of this works, but it
> > occurs to me that __acquires() and __releases() are not in that same
> > list, what happens to them?
> 
> You mean in functions like those, for instance:
> 
> 	int device_links_read_lock(void) __acquires(&device_links_srcu)
> 	{
> 	        return srcu_read_lock(&device_links_srcu);
> 	}
> 
> 	void device_links_read_unlock(int idx) __releases(&device_links_srcu)
> 	{
> 	        srcu_read_unlock(&device_links_srcu, idx);
> 	}
> 
> Yeah, we need to add something for those as well.

Yes those. They are pre-existing sparse annotations that have been
co-opted and morphed into the clang thread-safety-analysis.

> > Also, there will 'soon' be an equivalent: __cond_releases():
> > 
> >   https://lkml.kernel.org/r/20260121111213.634625032@infradead.org
> 
> The table "function_xforms" is a set of regular expressions to replace 
> macros into something that will be a pure C function declaration.
> It should be able to handle most macros (*).
> 
> Each line in the table has two arguments:
> 
> 	- a regex
> 	- a replace expression
> 
> In this specific case, if we remove __cond_acquires(.*) from the
> function prototype, the remaining function will be a pure C 
> prototype.
> 
> So, I'd say we need to have all 4 macros there:
> 
> 	(KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),
> 	(KernRe(r"__cond_releases\s*\([^\)]*\)"), ""),
> 	(KernRe(r"__acquires\s*\([^\)]*\)"), ""),
> 	(KernRe(r"__releases\s*\([^\)]*\)"), ""),
> 
> to avoid any warnings related to such annotations.

There's also:

	__must_hold()
	__must_not_hold()
	__must_hold_shared()

	__acquires_shared()
	__cond_acquires_shared()
	__releases_shared()

	__no_context_analysis

On top of that, structure members can be annotated with:

	__guarded_by()
	__pt_guarded_by()


Thanks!

