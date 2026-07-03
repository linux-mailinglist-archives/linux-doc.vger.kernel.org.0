Return-Path: <linux-doc+bounces-94827-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UE3EJVi1R2pidwAAu9opvQ
	(envelope-from <linux-doc+bounces-94827-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 15:12:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB0702B73
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 15:12:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=duZC2bL3;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94827-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94827-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A08A6301424A
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 13:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648813D566D;
	Fri,  3 Jul 2026 13:12:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B9832E729;
	Fri,  3 Jul 2026 13:12:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084374; cv=none; b=GVtJBNBRztmT1AlJIX4QsNCnrfx5tXIVPeFsD5UMREkgkt6uP+9DhleQmdkucx4QjmH3lhN6U87xCm+dMchIj8NMRVQlQD5SY/w9y+ZgpqfhMZCo4Z2+gNfQ61Q/+aLYxSo0jOYdoj5GQUqNLDTJtp68tsQIQzEq+e+WEFcIR2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084374; c=relaxed/simple;
	bh=1AJyYsh/c1jJdX+l1lh7yZDTMOmkUxIKHo/Rj9FGWM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uG2WCi/t0rF13NXzkE1WCZdV6xQDLFUUsqeIT7JmMipUg7wUYInBxqKSmJCJky6j+2wWHqu0rA7iJsDoONfcPQrnctEu2nNbGrGAg3h5tptCHlb7peZmhEHmR/BTDNfq27IsoOlcfsG0XSrpuiOksYMskhjDGu6ZdkOHXd5sZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duZC2bL3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC881F000E9;
	Fri,  3 Jul 2026 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084372;
	bh=1AJyYsh/c1jJdX+l1lh7yZDTMOmkUxIKHo/Rj9FGWM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=duZC2bL3NTYEhQEHILunhqPj5g8AJk37UXkw7Duo4nMoSz3JcKzzUXL6rK7fMfzDx
	 TbRe5MThH7ESYdH4189LpIUJLKoeoNzG9LfQCmrHgrmNm5E6LxgydSwsBgj3OMNWMo
	 06BcKUHzyOL497TgG+qqGh6uWXmftHl+LSI5qEJFwC66KGbSkAOOybVS/iuJfUD6n7
	 UNritGZzjEOXikbbrve4Ayc89bvlVgZQOgn/Nc76FuFp2+2WMkdwPEtcL17F/QmJdX
	 W2fRWXgv5MSeiaCZ+sybM8rwa38AnV1NmEGCl432Ubw89+hQpPdmSG4zi/Vg4wNPo2
	 E3c/AFCJFNUvQ==
Date: Fri, 3 Jul 2026 14:12:40 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Boris Burkov <boris@bur.io>, Jeff Layton <jlayton@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Jens Axboe <axboe@kernel.dk>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <akez23ZhLRSGMFQ1@lucifer>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
 <20260702161330.GH3534761@killaraus.ideasonboard.com>
 <2026070227-payroll-eradicate-8f66@gregkh>
 <16c507cea8f2873766e1de586d9a0d73234a3038.camel@kernel.org>
 <akaWnQ5Pkg_676B-@lucifer>
 <20260702211740.GA639365@zen.localdomain>
 <3f447113-4407-471f-878f-e6d6edafee71@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f447113-4407-471f-878f-e6d6edafee71@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:boris@bur.io,m:jlayton@kernel.org,m:gregkh@linuxfoundation.org,m:laurent.pinchart@ideasonboard.com,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94827-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bur.io,kernel.org,linuxfoundation.org,ideasonboard.com,linux-foundation.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DDB0702B73

On Fri, Jul 03, 2026 at 09:05:58AM +0200, David Hildenbrand (Arm) wrote:
> On 7/2/26 23:17, Boris Burkov wrote:
> > On Thu, Jul 02, 2026 at 05:50:15PM +0100, Lorenzo Stoakes wrote:
> >> On Thu, Jul 02, 2026 at 12:48:22PM -0400, Jeff Layton wrote:
> >>>
> >>> Do we need a tag for this though?
> >>>
> >>> This seems like the kind of information that we would always require in
> >>> the cover letter of a series (or the little place in an individual
> >>> patch for comments that don't get merged). That would also allow you to
> >>> convey a lot more nuance about how it was used.
> >>>
> >>> ISTM asking people to disclose LLM usage in a cover letter would give
> >>> everyone what they want: Information about whether and possibly how an
> >>> LLM was used, and it also wouldn't clutter up the changelogs with these
> >>> tags.
> >>
> >> It's much much clearer and easier to just have a standardised tag for that.
> >>
> >> You can see that (and grep for that) immediately, vague paragraphs not so much.
> >>
> >
> > At the risk of being pedantic on a point where I think the document is
> > kind of lacking:
> >
> > What level of assistance crosses the bar for an "Assisted-by: LLM" tag?
> >
> > Some sample levels of assistance to illustrate the point:
> >
> > 1. I used an llm to one-shot vibe-code a patch
> > 2. I used an llm to write a patch but carefully reviewed every line
> > 3. I used an llm to explore the design space for a patch but wrote it
> > manually
> > 4. I used an llm to debug or reproduce a kernel issue but then wrote the
> > fix manually after fully understanding the defect
> > 5. I used an llm to review a patch I wrote
> > 6. I used an llm to research some chunk of code while writing a patch
> > 7. I used Google while writing a patch and learned something valuable
> > from the AI overview at the top
> >
> > I personally would 100% use the tag for 1 or 2, and have already done
> > so. I have not been doing it for 3-5, as I think that will basically
> > make every patch llm-assisted to the point of the distinction being
> > meaningless. If we should be doing it for 3-5 (or some subset thereof)
> > then my mistake and I will certainly start doing so. I would hope most
> > people agree 6-7 and similar need no tag.

I personally think 1-2 are the only relevant cases.

> >
> > Similar questions abound if you use an llm to help with writing the
> > English text in the patch or emails.
> >
> > I have a feeling that this ambiguity is part of the reason we aren't all
> > agreeing on the value of the tag?
>
> Yes, I raised something similar as reply to Christian's RFC [1], where I said
> that for me the information *how* it was used is much more important:
>
> "
> Assisted-by: LLM # translate commit message
> Assisted-by: LLM # generate some test cases
> Assisted-by: LLM # cleanup logic
> Assisted-by: LLM # everything and I have no clue what any in here does
> "

Yup, and we don't need complicated rules for that just 'document what you used
it for and give a sense of how much'.

It's fuzzy but useful.

>
> That tag is it stands is pretty useless, really.

Not to go over it all again but I disagree, even as it stands, it allows us to
engage in conversation about the LLM usage if admitted, and to point those who
are misbehaving at the rules if not.

And it is a clear way to get the boolean 'is this person saying they used an
LLM'.

But I agree with you it'd be MUCH more useful if we did the above.

I wonder if we could get consensus on adding a section to the doc saying that
it'd be _useful_ to add a comment explaining _what_ you did, and explaining the
concept with some examples?

I can't imagine anybody would disagree with that, and that would get us positive
forward progress.

Then later we could debate the details further?

>
> I assume most people only really use it for something in-between 1 and 2, but
> *who knows*.
>
> [1] https://lore.kernel.org/r/5e7b9d23-4291-48fb-bdc6-47db82d33c80@kernel.org
>
> --
> Cheers,
>
> David

Thanks, Lorenzo

