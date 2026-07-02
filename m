Return-Path: <linux-doc+bounces-94628-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9uVHMTKERmrMXgsAu9opvQ
	(envelope-from <linux-doc+bounces-94628-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:30:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B26F96E1
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:30:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bFvZv1JG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94628-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94628-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEB4530055D6
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 15:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A24E37A827;
	Thu,  2 Jul 2026 15:21:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0930D412;
	Thu,  2 Jul 2026 15:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005664; cv=none; b=s3xu5umQUwRj5UQhRZnQePRz8FxWCKn6wuIOB1/omiMLniqmuBIMM7iMcojCq4w6+bW2fd3UZU6nTa9fynxsXWApkMdpDcNNuiR/VjES+/UMcywt17OgZMDISsGdkL/RH6cwPlMHGrLch8phEjUA9km7klTxz5Yizxm1B6b0eK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005664; c=relaxed/simple;
	bh=Kz5o8QJa9jCxOSgCBQvgpSigN0xge/+Plz3MRN7FduE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCX2SJLJOFUJa0q3aXcYLLogMh0Z5R0J6SXL4HxMS39+yHLkeMnAtQf/uidWFMgVP6dPWt/xkUKd/z4YKURX6+9EPs9v/fXIGfAUMg9b+vuvnjkhdaFy2GqTzs3/hCKN9arPqbrxAWjcqVrV40AnmbXZlXiTXIrD+W19BiGfZxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFvZv1JG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF291F000E9;
	Thu,  2 Jul 2026 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005663;
	bh=l77JKH1NL88mDH7eB/BSPrbbZcvcz3qbT1vKBW6LY4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bFvZv1JG15f+XAaC5QEVXnhWT02ocMA4d6Kfk+b6xXeGzz8O5a7n3vpeCPoBO5QrP
	 5YMigiDSTXqLsBNa0zgRNF/zBlgVNsL4qmER4EpU4yHWzGJsHNbHFjYTFtQ6lSgxqT
	 re3ATYjGmVraSfNIhdKCGHc7CajKw2EMy9zgHfjjbfegnjaTD8aXDoJeZ153QSyDF7
	 LiOBdDT6CVVBQKIMf2TOCSJ6KMMfF+UbQTY8B86SlfCn8OY2mb0CnG4h8lMYIC5qoa
	 XONQmrr5nBdnZrr/33W0SXk8Q7+zQpQPJ1K9w6zYhpXthKNV2a3F2Jcaz64GrBxFCD
	 FeLs+riDjE13Q==
Date: Thu, 2 Jul 2026 16:20:51 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jeff Layton <jlayton@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Justin Stitt <justinstitt@google.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Jens Axboe <axboe@kernel.dk>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)" <brauner@kernel.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <akaBMfxROmnmp1Ba@lucifer>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <87cxx5l900.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cxx5l900.fsf@trenco.lwn.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94628-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux-foundation.org,google.com,ideasonboard.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,linuxfoundation.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB6B26F96E1

On Thu, Jul 02, 2026 at 09:13:51AM -0600, Jonathan Corbet wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
>
> > On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> >> We've had this requirement in place in the Documentation for several
> >> months, but it's becoming clear that the signal to noise ratio from this
> >> is quite low.
> >>
> >> 1/ It's not universally followed. While many people do try to attribute
> >> the LLMs in good faith, not everyone does for various reasons.
> >
> > Then let's move to get people to follow it.
>
> FWIW, in my experience, simple ignorance of the rules is one of the
> biggest reasons why so many people fail to follow them.  When I've asked
> docs contributors about the source of their work, they tend to come
> clean, apologize, and add the tags going forward.

I also feel that repeatedly establishing boundaries like this (in as civil
and reasonable way as possible) can help establish the 'done thing'.

We will probably still experience a great deal of unattributed patches, and
I think over time we'll have to figure out a way to deal with that, but
there's certainly a cohort who can be reached, and it's beneficial to do
so.

It also makes it easier to enforce with those who don't play nice - 'here
are the rules, look over here, and look at these patches' etc.

With no rules at all it becomes far harder to enforce anything.

>
> jon

Thanks, Lorenzo

