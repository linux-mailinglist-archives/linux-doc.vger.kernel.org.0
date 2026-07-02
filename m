Return-Path: <linux-doc+bounces-94644-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cUixADqSRmoPYwsAu9opvQ
	(envelope-from <linux-doc+bounces-94644-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 18:30:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8B6FA323
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 18:30:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=zApc09pG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94644-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94644-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 622B631A1635
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 16:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3643385A1;
	Thu,  2 Jul 2026 16:22:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4C83382DA;
	Thu,  2 Jul 2026 16:22:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009322; cv=none; b=MgezYMAxLDVsJ0aj5jkdM2Bn61qgHd2fdMutGZvG2t+AJE5KsNg+bnBigOWsg4x4J6IxyJmiT7LAdN3fDBX4p5pz1rXNEiQdCUUoPUQleBwIB3XQGLVOJHteVwtIAUMI44HwCI6sIwuUB44NHG0GOl5LHVPvJewdT/P0WYAjz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009322; c=relaxed/simple;
	bh=OsSDOQIrgtchdtrVgSK3nnizozNNXFaJwSyg5VreD7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFc9K2BUtAhp/r1dSSwlXxJKdHX1HbOYEskJpdloX1GrKLZxamrleDpsZ6zANPdfIN/qkxcsSOCII1wGDt7oNfwVPFu6A0yfhG2iD5OetQrrmQtlE8saxv0VGpyiEnHrH6B9JvAxrU+7Y0auh6GBy8HX+5+t237SulYn61/jrIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zApc09pG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3631F000E9;
	Thu,  2 Jul 2026 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783009321;
	bh=kK4vBztoIykW9+OGgKvTHApPTBMrfjJGiJlwKiL6kOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zApc09pGa6ijstV9hQYvpSJDrSI7IbslYravwN/5RkJD9XwRhzlLk6ASUxpxWJiVk
	 LopIiO17izoTFkYfkjliqyajJ+myI0ZHqR+smtB9wWBXxKHw2x7gPN6wezCbqw71n6
	 Mzds3mfibgDnSK86ov2VKFNRcytYY4IKSAGtLJns=
Date: Thu, 2 Jul 2026 18:19:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Carlos Maiolino <cem@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <2026070227-payroll-eradicate-8f66@gregkh>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
 <20260702161330.GH3534761@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702161330.GH3534761@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94644-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:ljs@kernel.org,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gregkh:mid,linuxfoundation.org:dkim,linuxfoundation.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64B8B6FA323

On Thu, Jul 02, 2026 at 07:13:30PM +0300, Laurent Pinchart wrote:
> On Thu, Jul 02, 2026 at 11:57:46AM -0400, Jeff Layton wrote:
> > On Thu, 2026-07-02 at 17:07 +0200, Greg KH wrote:
> > > On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> > > > We've had this requirement in place in the Documentation for several
> > > > months, but it's becoming clear that the signal to noise ratio from this
> > > > is quite low.
> > > > 
> > > > 1/ It's not universally followed. While many people do try to attribute
> > > > the LLMs in good faith, not everyone does for various reasons.
> > > 
> > > Then let's move to get people to follow it.
> > > 
> > > > 2/ It basically serves as free advertising for proprietary LLM companies.
> > > 
> > > Who cares, make up a name, all I want is the "signal" that someone is
> > > using a LLM so that I can review it as-such.  And if I think someone is
> > > not reporting that, I can ask for them to properly attribute it and if
> > > they lie, well, that's on them.
> > > 
> > > > 3/ It's not clear why we want to collect this info in the first place.
> > > 
> > > We want to know if a LLM is being used.
> > 
> > But why? What do you intend to do with this information?
> > 
> > Do you mean to use it as an indicator that the patch should receive
> > "extra" review (or maybe that it should be ignored)? Do you mean to use
> > it to generate some sort of statistics at a later time? 
> 
> I use the information to decide how to review the patch, and what level
> of priority to give it. For that usage I don't need a tag, but I need
> the information in some human-readable form at patch submission time.

Same here.  I don't care about stats, I care about "how do I review this
patch" and this gives me that signal that I need if faced with a
llm-helped patch.

So it needs to stay please.

thanks,

greg k-h

