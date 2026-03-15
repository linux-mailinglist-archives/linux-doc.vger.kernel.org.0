Return-Path: <linux-doc+bounces-79425-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CM8KMUPt2mXMAEAu9opvQ
	(envelope-from <linux-doc+bounces-79425-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 21:00:05 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10872292486
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 21:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E591430143C8
	for <lists+linux-doc@lfdr.de>; Sun, 15 Mar 2026 20:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A972264A7;
	Sun, 15 Mar 2026 20:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtbiXdLB"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278FD2836F
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773604801; cv=none; b=L8yFlVyj/8s6hRxFG0oxFqTOZo95OkH62g/GjXgAokXFEvgq23WK9ceXNZ9kVAkf4Gi4PL7/KFpLZrTXtarwEt5do/aWAkgwOKpTjAOWK4KVWOzQ65WhTU7pWs+DFo/7gJQBFKrKq15bF1TsvNjWh+CzmPsik1jh7Hx4arOG0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773604801; c=relaxed/simple;
	bh=Lexcg6in9cL69Um5lcDqZOQOEWOAZje/HOO6t2WUtxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1cShP1V8bGd4gAWVdgBbk+NFPRBgeWk4xxp1IYwv2bNcr06XB5hYDObV7K8V8mUR2sDAk2Bh2Gvx0xMZLA4SiU3qJzc6mvMMCDDvYQLcZjbp0qr6wsjAAvnTtHL/A0FJdirtQUHy3eqLXOQuC8G4jGd499bO4F8z9ALhN5R4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtbiXdLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4FDC4CEF7;
	Sun, 15 Mar 2026 19:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773604800;
	bh=Lexcg6in9cL69Um5lcDqZOQOEWOAZje/HOO6t2WUtxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtbiXdLBft0fHSp+v9cU4W79wZryD1X4oWd9cNE7ywjnFTUV2reSvAk2A/IFmC6lq
	 Kik8SaPvxx1yMNEc+UhfeRMqHsRoStzk1SjU+CZRJlVA3BVkw3OcJLJlrmT3Ehxuvh
	 nxbZp+lCa0+ZnPo/eWENxmIva/buR8zQyULtSWjkQUivYDeBYDDxXyrAzNqMz0c96S
	 0FEG0VnhD1Q+j7XIStDST58545vdZi11zpY/QVoh4G5qN7UbEre0y2ejjWNcHu8q8y
	 atf4K3zRjXog0QoVLsC1rHMF8yQ5AvSAtSjozN6CUC7E7K+4qZEtTammLVBiOoK+44
	 lj8+v9i9QbsoA==
Date: Sun, 15 Mar 2026 21:59:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kit Dallege <xaum.io@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
Message-ID: <abcPusHClDoCeE4Y@kernel.org>
References: <20260314152538.100593-1-xaum.io@gmail.com>
 <87ms0ajtvy.fsf@trenco.lwn.net>
 <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
 <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
 <09920346-0caf-466f-9c12-5f086d99411b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09920346-0caf-466f-9c12-5f086d99411b@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,lwn.net,kvack.org,vger.kernel.org,techsingularity.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-79425-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 10872292486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 08:50:04PM +0100, David Hildenbrand (arm) wrote:
> On 3/14/26 19:17, Andrew Morton wrote:
> > On Sat, 14 Mar 2026 17:02:47 +0100 Kit Dallege <xaum.io@gmail.com> wrote:
> > 
> > > Hi Jon,
> > > 
> > > The material was written with AI assistance (Claude) and then verified
> > > against the source code in mm/shmem.c. I read through the implementation,
> > > the existing comments, and Mel Gorman's book outline to identify what
> > > should be covered, then used AI to help draft the prose, which I reviewed
> > > and edited.
> > 
> > OK, so you're saying that you created the content and used an LLM to
> > assist in finishing it off?
> > 
> > > I'm happy to rework anything that's inaccurate or doesn't meet the bar.
> > > Should I add an Assisted-by tag to the commit?
> > 
> > Yes, Assisted-by: is appropriate and useful here.
> > 
> >  From a quick scan, this material appears to be helpful and I think it
> > would be good for us to get this into the tree in some fashion.  Which
> > will involve asking the relevant MM developers to review each change.
> 
> So, someone with an LLM but no proven experience with the code produced some
> doc, and maintainers/developers should dedicate their precious time to do
> the hard work of checking everything?
> 
> I'm all for documenting stuff, especially if newcomers start exploring that
> space by contributing small, carefully crafted documentation updates.
> 
> It's then a good learning experience for someone that wants to work on the
> code to really have to understand the code in detail, and what is actually
> worth documenting (and what's an implementation detail).
> 
> I see 7 doc updates for 7 different MM subsystems in my inbox, including

Heh, it's wider:
https://lore.kernel.org/all/?q=Kit+Dallege

> So naturally, I get skeptical when it comes to "I read through the
> implementation, the existing comments".

I skimmed through bootmem doc, it's, well, inaccurate. And with tens of
documentation patches at the same day, I really doubt there was enough
effort to understand the code. 
 
> -- 
> Cheers,
> David

-- 
Sincerely yours,
Mike.

