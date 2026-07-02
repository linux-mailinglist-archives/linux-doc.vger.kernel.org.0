Return-Path: <linux-doc+bounces-94563-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wwGkAh8/RmriMgsAu9opvQ
	(envelope-from <linux-doc+bounces-94563-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:36:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA456F5FF9
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:36:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KvrmsTRZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94563-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94563-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5686130E927D
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 09:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A450481FB9;
	Thu,  2 Jul 2026 09:44:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C13859FC;
	Thu,  2 Jul 2026 09:44:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985460; cv=none; b=BD1WnGh8WP/Fs6neIGXMypHlW6YP58tvhNJu9keC78CHvVIxIit4N1y5jJNSWkJPOOvY6Fh0/qz3iTTCea7LcuLu8KGNoN4KgyMzBcLdEfmw+KkGHwGowRIIfJgjwx5fVO9116T2au+T80mz+TK0Z/l45ec+JROz1EG7k+Teyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985460; c=relaxed/simple;
	bh=6OKVbkbqcH6Fn6AMPx7ZC9iOfkmYA0nPzMprU6lSMmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFNZNqgLfAgEJG2JSLYOzlzGMSKcLbR4a6sKHl4k+0LTdkuiidk65Ve6Q3+mKZdBnY0EN3fAF7u+KKbQgRLnfQownGpAdWmzPQTNhn5V3+MYyEz3abx+nmuJ/dSme8fSWQcoKffl/zQgeM8TBbkkSTEda+YhM8HmPuD5s8CZT2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvrmsTRZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0351F000E9;
	Thu,  2 Jul 2026 09:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985459;
	bh=6OKVbkbqcH6Fn6AMPx7ZC9iOfkmYA0nPzMprU6lSMmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KvrmsTRZp0bhiZure/2sCA1cLY3F0cPcgXL6Rih01X+q1+eXgHaR6ldSd8JKQE6RH
	 y30XASYWpRprT08c8w5U3TdFHD5WJSK0fv2PA3vONIbFoonUe4WZI5/MVg+h6nu9ZT
	 t56BqyO06qhgJtt2NJQ/oEqAocPqk19VMON4lpJgsM+MfalXJa2F2FsHSTUicOp50p
	 D6k3DVo+hRcpLfeR0oVgF2xK33angsI+Otle0Z7U4jYiLkbRzDEVPwXG0rjIiwSYe9
	 Sh2G7r3TOHDjfCOzFPQpWVEwvSRdj+VCKiNdGckbdM7l5vtOjvhzHb9BnvM8ZHih3p
	 qXT6Go1XT+mQg==
Date: Thu, 2 Jul 2026 10:44:09 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Christian Brauner <brauner@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <akYx9blvVhIXB5A-@lucifer>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <akYasD1ckWcH1C0g@lt-jori.localdomain>
 <a17b9a17-0ca7-4912-836d-4637cd0110f7@kernel.org>
 <20260702093844.GA3491311@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702093844.GA3491311@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:vbabka@kernel.org,m:jkoolstra@xs4all.nl,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94563-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,linux-foundation.org,lwn.net,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BA456F5FF9

On Thu, Jul 02, 2026 at 12:38:44PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 02, 2026 at 10:44:34AM +0200, Vlastimil Babka (SUSE) wrote:
> > On 7/2/26 10:12, Jori Koolstra wrote:
> > > Ah, I still reigniting this discussion again :)
> > >
> > > What about a combination of what David and Jeff say? The whole point
> > > seems to me that the salient information is not that an LLM was used (or
> > > are we going to tag Sashiko as well or any other LLM-based code review
> > > tool?), but what is was used to do. This information may be relevant for
> > > how the review is approached. The latter should perhaps only be in the
> > > cover letter and then we can drop the assisted-by tags altogether.
> > >
> > > The question about enforcement remains.
> >
> > It's not possible to enforce it. People can deny it if the tag is missing
> > and you confront them and even though the submission has many signs of being
> > obviously LLM, there is no definite proof. We've seen (likely, as there's no
> > proof!) that happen in mm.
> >
> > Such situation then penalizes those who disclose so obviously they won't.
>
> I think there's also a penality for those who don't disclose when
> they're told they should: it will lower trust. Kernel development is
> largely based on a trust model. If a contributor decides to adopt a
> deceiptful behaviour, they can expect maintainers to raise the bar for
> accepting patches, when not rejecting them outright.

Yes, I explicitly said this in response to somebody for whom there was
overwhelming evidence they were submitting AI slop, and that they'd need to
build it back up again.

It's precisely the issue as I see it.

But others within the community disagreed with me, so it turned into a very
long and draining discussion that I don't particularly wish to repeat.

So we really need clarity on it being OK to do this (I remember saying this
last year when I made an ultimately unsuccessful submission to the
maintainer's summit about all this :)

What matters overall is being able to _quickly_ dismiss AI slop so that
asymmetry between LLM generation + maintainer time isn't exploited.

And ultimately I think the trust model will end up being 'newcomes have 0,
now build it up'.

Which sucks but this issue is simply existential for open source.

>
> I can't quantifying which of the penalities will be higher, but I hope
> (call me naive if you wish) that the vast majority of contributurs who
> *know* we require disclosure to abide by that rule, even if it incurs a
> penalty. After all, proponents for LLM usage claim such performance
> improvements that a small penalty during review can't be that bad, right
> ? :-)
>
> > We
> > should drop the tag and instead think how we can empower maintainers to be
> > able to use their own judgment and deprioritize dealing with what they
> > perceive as LLM slop, without fearing consequences of not being properly
> > responsible etc, and not rely on any non-enforceable tags for that.
>
> --
> Regards,
>
> Laurent Pinchart

Thanks, Lorenzo

