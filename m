Return-Path: <linux-doc+bounces-79427-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0zaGAoIQt2m/MAEAu9opvQ
	(envelope-from <linux-doc+bounces-79427-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 21:03:14 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEAB2924A2
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 21:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63EFB3014521
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 20:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3C821CA03;
	Sun, 15 Mar 2026 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxYeWLLQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840A15530C
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773604989; cv=none; b=T7iTAgqfjsOH8qWnwn8xJO9Hw/DMB8c0JaxzndapV/X12wmwD8boUQR2oBH2KAa7z1F1nFYp5YIJC+T1q3CqF+UY/soAUjIfVLHwBgte4dZ3it6dZ5o1cKTBJaiKPhyDWeP4+Sg9mSGYBjZ57oj7p6nPmSMPzWzEJHmZDwEW2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773604989; c=relaxed/simple;
	bh=5EoTqlA1WXTqcUjjWB3Eb61kCIejimTFL0AFLyVl9d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFBvyccxA54gFO1BOP7X62WZIMddKsbhbrXfUnpV7et70JCrEtdJ97PnrzJTf+wLCyK9YH8ciMxwx0JXnuYGwtKUmoerrZEcQ1tyx0j8GBU+rjM5D8fx2IptRv9stfvMIQUqkuwEMBEkFI/FhRrH6N1yUSYrs9a/uWPmq94mBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxYeWLLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CE1C4CEF7;
	Sun, 15 Mar 2026 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773604989;
	bh=5EoTqlA1WXTqcUjjWB3Eb61kCIejimTFL0AFLyVl9d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxYeWLLQl0LUpjvS1/O749K4IZdEisHErvtF7b4urHF+jMe1Esbsmc1nInxY/rrKj
	 7gyAnpCTONSsufuBgRY/jNjvSK4nJwtwnd6l7V6fnUcmMCePOazh7FHe8nHfECBDc3
	 990cyBMepSTDZT95/MPV77xeFsCe5WZtxLc2jEN8JNGdLauWb4YwQHqt6FUhDkK9zp
	 Qsha7FeTxwwwzdQjtSKnoUtNDZZNRT+bRNBZDzOuTKZt7WKKTRrETfIBGKpEJyKeFC
	 HyDCLqw4Gqi75OwpIRrICIMbYwhAz1lugRwB3BAITacoeOFmbilAWh8mLqAugsoFdv
	 7g2Q4MrBWHGyA==
Date: Sun, 15 Mar 2026 22:03:02 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kit Dallege <xaum.io@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
Message-ID: <abcQdr4UD4znorRN@kernel.org>
References: <20260314152538.100593-1-xaum.io@gmail.com>
 <87ms0ajtvy.fsf@trenco.lwn.net>
 <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
 <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
 <09920346-0caf-466f-9c12-5f086d99411b@kernel.org>
 <abcPusHClDoCeE4Y@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abcPusHClDoCeE4Y@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,lwn.net,kvack.org,vger.kernel.org,techsingularity.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-79427-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6CEAB2924A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 10:00:00PM +0200, Mike Rapoport wrote:
> On Sun, Mar 15, 2026 at 08:50:04PM +0100, David Hildenbrand (arm) wrote:
> > On 3/14/26 19:17, Andrew Morton wrote:
> > > On Sat, 14 Mar 2026 17:02:47 +0100 Kit Dallege <xaum.io@gmail.com> wrote:
> > > 
> > > > Hi Jon,
> > > > 
> > > > The material was written with AI assistance (Claude) and then verified
> > > > against the source code in mm/shmem.c. I read through the implementation,
> > > > the existing comments, and Mel Gorman's book outline to identify what
> > > > should be covered, then used AI to help draft the prose, which I reviewed
> > > > and edited.
> > > 
> > > OK, so you're saying that you created the content and used an LLM to
> > > assist in finishing it off?
> > > 
> > > > I'm happy to rework anything that's inaccurate or doesn't meet the bar.
> > > > Should I add an Assisted-by tag to the commit?
> > > 
> > > Yes, Assisted-by: is appropriate and useful here.
> > > 
> > >  From a quick scan, this material appears to be helpful and I think it
> > > would be good for us to get this into the tree in some fashion.  Which
> > > will involve asking the relevant MM developers to review each change.
> > 
> > So, someone with an LLM but no proven experience with the code produced some
> > doc, and maintainers/developers should dedicate their precious time to do
> > the hard work of checking everything?
> 
> > I'm all for documenting stuff, especially if newcomers start exploring that
> > space by contributing small, carefully crafted documentation updates.
> > 
> > It's then a good learning experience for someone that wants to work on the
> > code to really have to understand the code in detail, and what is actually
> > worth documenting (and what's an implementation detail).
> > 
> > I see 7 doc updates for 7 different MM subsystems in my inbox, including
> 
> Heh, it's wider:
> https://lore.kernel.org/all/?q=Kit+Dallege
> 
> > So naturally, I get skeptical when it comes to "I read through the
> > implementation, the existing comments".

And another LLM says there are mistakes:
https://sashiko.dev/#/patchset/20260314152538.100593-1-xaum.io%40gmail.com

-- 
Sincerely yours,
Mike.

