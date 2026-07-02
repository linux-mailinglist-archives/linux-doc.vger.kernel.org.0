Return-Path: <linux-doc+bounces-94585-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1byMLAFcRmqNRgsAu9opvQ
	(envelope-from <linux-doc+bounces-94585-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 14:39:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4206F7BA1
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 14:39:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=P4q9b30B;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94585-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94585-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7E51302DF4D
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 12:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CD647CC69;
	Thu,  2 Jul 2026 12:18:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E482E8DEA;
	Thu,  2 Jul 2026 12:18:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994698; cv=none; b=osBwU+EAXheVfpC9aC142Wi/DofjKdgmrkba8i27O58r3sILwREuOoGGUBbn75NLLcCznh1Z7HYPAXQ0Hxb9Crz26zNKeuJYLAeXSbdsaDZz8QwcnQ+O5kykOiO0Dg44hTcd+hthsfgLKAUlz6Iezt6FEQi9jEDNeZP3YBljtTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994698; c=relaxed/simple;
	bh=srX5VlSeRKseI3gF1QCQsGPTMGH2T7YpwxUkbIXvjFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1M/GrdAlWBOSoVPD240RIFQYCiTu+bdoH42dyvwYaJnN41gFZl5mgtEnaun/IOf5/BazjGb3+5I4Lmz0OhRUHeDNEqwuMlP1scRPnP2qFh6ej7IBW89JP6OI4jv7IojOi8XAViYIQuMTJX3k47m+wkBgMKl+bi/9vzrddOjLNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4q9b30B; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7DF1F000E9;
	Thu,  2 Jul 2026 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782994696;
	bh=srX5VlSeRKseI3gF1QCQsGPTMGH2T7YpwxUkbIXvjFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P4q9b30BnbSPh3XR1Fz5zxwlgsdOdLIPkmuPMaYbR6jiziriNWGOhqZ0Rtz5zVGJQ
	 5RWt77ZSj1BXYY1F+JSjt+rFDi75oTN4doGjseidzVfSs43Oik98K7uzxvD0qt7B7i
	 dRYwxT6K9EtfQY1q3T0gLTQe6qHn2p2DbEUyEkCq6U+VFFnidb119jCRNgAJ2IWkTj
	 zivhnV/bOySiWub2nJtlGpEMVPoKjWFlzY84StyjMT6iuZBTJl4GP3tjDcrlbTMFjC
	 +dHM5Us0qbZcufxr8pLWvm7BJ8Ooe9HG335VDww0hYcypGJ7k3PLyRrkFA5L08kACc
	 Kf6r8M+PW8ZnA==
Date: Thu, 2 Jul 2026 13:18:06 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Brian Foster <bfoster@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <akZW1RPqTc-4_7jW@lucifer>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <akYasD1ckWcH1C0g@lt-jori.localdomain>
 <a17b9a17-0ca7-4912-836d-4637cd0110f7@kernel.org>
 <20260702093844.GA3491311@killaraus.ideasonboard.com>
 <akYx9blvVhIXB5A-@lucifer>
 <akZSOa4awK5l9x_w@bfoster>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZSOa4awK5l9x_w@bfoster>
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
	TAGGED_FROM(0.00)[bounces-94585-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bfoster@redhat.com,m:laurent.pinchart@ideasonboard.com,m:vbabka@kernel.org,m:jkoolstra@xs4all.nl,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,xs4all.nl,linux-foundation.org,lwn.net,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A4206F7BA1

On Thu, Jul 02, 2026 at 07:57:45AM -0400, Brian Foster wrote:
> On Thu, Jul 02, 2026 at 10:44:09AM +0100, Lorenzo Stoakes wrote:
> > On Thu, Jul 02, 2026 at 12:38:44PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 02, 2026 at 10:44:34AM +0200, Vlastimil Babka (SUSE) wrote:
> > > > On 7/2/26 10:12, Jori Koolstra wrote:
> > > > > Ah, I still reigniting this discussion again :)
> > > > >
> > > > > What about a combination of what David and Jeff say? The whole point
> > > > > seems to me that the salient information is not that an LLM was used (or
> > > > > are we going to tag Sashiko as well or any other LLM-based code review
> > > > > tool?), but what is was used to do. This information may be relevant for
> > > > > how the review is approached. The latter should perhaps only be in the
> > > > > cover letter and then we can drop the assisted-by tags altogether.
> > > > >
> > > > > The question about enforcement remains.
> > > >
> > > > It's not possible to enforce it. People can deny it if the tag is missing
> > > > and you confront them and even though the submission has many signs of being
> > > > obviously LLM, there is no definite proof. We've seen (likely, as there's no
> > > > proof!) that happen in mm.
> > > >
> > > > Such situation then penalizes those who disclose so obviously they won't.
> > >
> > > I think there's also a penality for those who don't disclose when
> > > they're told they should: it will lower trust. Kernel development is
> > > largely based on a trust model. If a contributor decides to adopt a
> > > deceiptful behaviour, they can expect maintainers to raise the bar for
> > > accepting patches, when not rejecting them outright.
> >
> > Yes, I explicitly said this in response to somebody for whom there was
> > overwhelming evidence they were submitting AI slop, and that they'd need to
> > build it back up again.
> >
> > It's precisely the issue as I see it.
> >
> > But others within the community disagreed with me, so it turned into a very
> > long and draining discussion that I don't particularly wish to repeat.
> >
> > So we really need clarity on it being OK to do this (I remember saying this
> > last year when I made an ultimately unsuccessful submission to the
> > maintainer's summit about all this :)
> >
> > What matters overall is being able to _quickly_ dismiss AI slop so that
> > asymmetry between LLM generation + maintainer time isn't exploited.
> >
> > And ultimately I think the trust model will end up being 'newcomes have 0,
> > now build it up'.
> >
> > Which sucks but this issue is simply existential for open source.
> >
>
> Has anybody tried throwing any of the obvious LLM slop submissions we
> have seen into one of these LLM detector things? To be clear, I've never
> tried those so I'm certainly no authority on if they even work reliably,
> but if so I wonder if something like that is a potential solution for
> elminating the worst cases..
>
> I.e., suppose we had some Sashiko type LLM/bot whose job was mainly to
> detect purely LLM generated content based on some minimum level of
> confidence and reply with a loud and clear message to the thread. Maybe
> that would be a clear enough signal to maintainers and reviewers that
> something is not worth prioritizing for review.. Maybe also some "slop
> detected" feedback would help disincentivize flinging slop onto the
> lists. At the very least that could be something that is more easily
> configured/enabled per-subsystem without having to use per-subsystem
> commit tags.

Yup I thought of this, have done this on series and they do detect it
reliably.

But then it becomes an arms race. People will get AI to try to defeat AI
detection. So I'm not sure it's a safe road to go down.

>
> Brian
>

Thanks, Lorenzo

