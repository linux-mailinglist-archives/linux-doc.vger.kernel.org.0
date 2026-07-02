Return-Path: <linux-doc+bounces-94669-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6rRCJA+lRmqYawsAu9opvQ
	(envelope-from <linux-doc+bounces-94669-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 19:51:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E06FBABD
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 19:51:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Pj+S+1n+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94669-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94669-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76946329A12D
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 16:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758F0347536;
	Thu,  2 Jul 2026 16:50:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CEA349CF2;
	Thu,  2 Jul 2026 16:50:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011028; cv=none; b=XD/KvlQg2/nrW/xPu3dh0YOI48U9ynyVPtnZaoAcDh8GKld1acwZfXbETBa5LzfHUQgjb/2/HteaonV+ZA427zD62gqCrTgjdD/il5sblTtP3nWvPA3swyl6tneoYoKtkzxAv1w/tUcGC9p1nOWwwkggJG+UmzIia9pyzkbnKuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011028; c=relaxed/simple;
	bh=h4chzH7MM2I+Nv1bVeEEsP5ZVrAG/C782EzN9I6JUxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSGF7wgm9a/BAKrwAStE8/ERgik4RBpkd9wgFnpcixa3BeWTRH0fD20y27tmpo8mBYu3SUGe8VbvYhKF7rtNEBx8trNImmGHX2aAEVSEkucGQoqVklB6PI49CBKpRCf4WB9nq6zjTq/e1TQzdB2dgTZZlPZqytOI0p5aVjGI05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pj+S+1n+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672F81F000E9;
	Thu,  2 Jul 2026 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783011027;
	bh=VxwP5sbJnHA5aX0cWSiGCuHUNdENo3EBGO3dln8kb20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pj+S+1n+cHOxdLDHnr/zFJ11PPk5uiN9qE6D6DEJsmOuRRZ0Ucv2vdt46rWtzd4/S
	 5eSlxBHqzXguL3/MIE4TpCNzEAXaWv2cNmXIzmS5ZyHzKCzTAvX+TDD4hPrVdfwDBm
	 epj6IKDP7iANNPhNg9Vcy50nuzo2MwqkwqYwflq688M6c1kinTB8HZ8GT+zCrJYEtu
	 o1vsun5lCe50FNf2Z9oRQ5bDVHY/LjBchQgfYWKVsPwgnyY3P0QVz5Ge42tCY2qpc2
	 iMBcbTReE2KgvOJs9t05kiwc/6dAIitF+MEvlau4g1i3SUlEEOdM5RVV17F/ELoDVi
	 b0OCOcAljsj5Q==
Date: Thu, 2 Jul 2026 17:50:15 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <akaWnQ5Pkg_676B-@lucifer>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
 <20260702161330.GH3534761@killaraus.ideasonboard.com>
 <2026070227-payroll-eradicate-8f66@gregkh>
 <16c507cea8f2873766e1de586d9a0d73234a3038.camel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16c507cea8f2873766e1de586d9a0d73234a3038.camel@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94669-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:gregkh@linuxfoundation.org,m:laurent.pinchart@ideasonboard.com,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,ideasonboard.com,linux-foundation.org,lwn.net,google.com,kernel.org,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A0E06FBABD

On Thu, Jul 02, 2026 at 12:48:22PM -0400, Jeff Layton wrote:
> On Thu, 2026-07-02 at 18:19 +0200, Greg KH wrote:
> > On Thu, Jul 02, 2026 at 07:13:30PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jul 02, 2026 at 11:57:46AM -0400, Jeff Layton wrote:
> > > > On Thu, 2026-07-02 at 17:07 +0200, Greg KH wrote:
> > > > > On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> > > > > > We've had this requirement in place in the Documentation for several
> > > > > > months, but it's becoming clear that the signal to noise ratio from this
> > > > > > is quite low.
> > > > > >
> > > > > > 1/ It's not universally followed. While many people do try to attribute
> > > > > > the LLMs in good faith, not everyone does for various reasons.
> > > > >
> > > > > Then let's move to get people to follow it.
> > > > >
> > > > > > 2/ It basically serves as free advertising for proprietary LLM companies.
> > > > >
> > > > > Who cares, make up a name, all I want is the "signal" that someone is
> > > > > using a LLM so that I can review it as-such.  And if I think someone is
> > > > > not reporting that, I can ask for them to properly attribute it and if
> > > > > they lie, well, that's on them.
> > > > >
> > > > > > 3/ It's not clear why we want to collect this info in the first place.
> > > > >
> > > > > We want to know if a LLM is being used.
> > > >
> > > > But why? What do you intend to do with this information?
> > > >
> > > > Do you mean to use it as an indicator that the patch should receive
> > > > "extra" review (or maybe that it should be ignored)? Do you mean to use
> > > > it to generate some sort of statistics at a later time?
> > >
> > > I use the information to decide how to review the patch, and what level
> > > of priority to give it. For that usage I don't need a tag, but I need
> > > the information in some human-readable form at patch submission time.
> >
> > Same here.  I don't care about stats, I care about "how do I review this
> > patch" and this gives me that signal that I need if faced with a
> > llm-helped patch.
> >
> >
>
> Do we need a tag for this though?
>
> This seems like the kind of information that we would always require in
> the cover letter of a series (or the little place in an individual
> patch for comments that don't get merged). That would also allow you to
> convey a lot more nuance about how it was used.
>
> ISTM asking people to disclose LLM usage in a cover letter would give
> everyone what they want: Information about whether and possibly how an
> LLM was used, and it also wouldn't clutter up the changelogs with these
> tags.

It's much much clearer and easier to just have a standardised tag for that.

You can see that (and grep for that) immediately, vague paragraphs not so much.

> --
> Jeff Layton <jlayton@kernel.org>

Thanks, Lroenzo

