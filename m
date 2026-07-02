Return-Path: <linux-doc+bounces-94641-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3GxJzGRRmrQYgsAu9opvQ
	(envelope-from <linux-doc+bounces-94641-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 18:26:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 108656FA279
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 18:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=NrRQLP12;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94641-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94641-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25A2A311EAB3
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 16:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B556F312815;
	Thu,  2 Jul 2026 16:13:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C0433E99;
	Thu,  2 Jul 2026 16:13:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008817; cv=none; b=exbt1KWzJ2jAUGllDRf35O7RqVo545aO9VN/806jYnjaLJWUB4L/+Eu57wd0v3Iu2K+dsRkwzc33K8rgVdWGT//e9Qe1aGpiq0sQlIMO02U/OQ8re4QRLimV83/tZj6zwfoeLRHl+6MlTT0ftO2tYSB2akr6wqwkyC7K55Bo7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008817; c=relaxed/simple;
	bh=nJma6FnpbB6k+J8WgqR/an6+GZA0c8hPme47QWSCWBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhAKaN8VprDEtEM3DaGOmJQ8/rcahPmVffWPiHDvduwMUF6UrnOnz2qw5QF1BCu/VDz/fTskG/9VtARy7MMhA6YIp52xssWWoh9XeH6SUkV6yztR1w75KOpHXLjJK0wzsAvzPLpGHbe7snY2rzqVaKcotAArOTzh6JP4Of/eVP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NrRQLP12; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2196D8CB;
	Thu,  2 Jul 2026 18:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783008766;
	bh=nJma6FnpbB6k+J8WgqR/an6+GZA0c8hPme47QWSCWBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrRQLP12hjdboxoVqUfv3fTZRYLQXZcD5xX/CLcr0WH5OGF+0j5aOcfXFELP9aHgr
	 9DUJMGzbjk1vDBbAxtwVkPJBSz7udQ37f554k7RzC249SyX+cZcOJcNKoZU+mdqHSy
	 3sjUzT5OHaQLajAMIzn4h4LfuJUWo25iVmuO3XxA=
Date: Thu, 2 Jul 2026 19:13:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
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
Message-ID: <20260702161330.GH3534761@killaraus.ideasonboard.com>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94641-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linux-foundation.org,lwn.net,google.com,kernel.org,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:jlayton@kernel.org,m:gregkh@linuxfoundation.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:ljs@kernel.org,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 108656FA279

On Thu, Jul 02, 2026 at 11:57:46AM -0400, Jeff Layton wrote:
> On Thu, 2026-07-02 at 17:07 +0200, Greg KH wrote:
> > On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> > > We've had this requirement in place in the Documentation for several
> > > months, but it's becoming clear that the signal to noise ratio from this
> > > is quite low.
> > > 
> > > 1/ It's not universally followed. While many people do try to attribute
> > > the LLMs in good faith, not everyone does for various reasons.
> > 
> > Then let's move to get people to follow it.
> > 
> > > 2/ It basically serves as free advertising for proprietary LLM companies.
> > 
> > Who cares, make up a name, all I want is the "signal" that someone is
> > using a LLM so that I can review it as-such.  And if I think someone is
> > not reporting that, I can ask for them to properly attribute it and if
> > they lie, well, that's on them.
> > 
> > > 3/ It's not clear why we want to collect this info in the first place.
> > 
> > We want to know if a LLM is being used.
> 
> But why? What do you intend to do with this information?
> 
> Do you mean to use it as an indicator that the patch should receive
> "extra" review (or maybe that it should be ignored)? Do you mean to use
> it to generate some sort of statistics at a later time? 

I use the information to decide how to review the patch, and what level
of priority to give it. For that usage I don't need a tag, but I need
the information in some human-readable form at patch submission time.

> If we want to collect some sort of structured data like this, it would
> be good to have some idea of how it will be used. That might inform the
> format and content of what we're collecting.
> 
> > > Given that the data this provides is flawed at best and is being
> > > collected for a purpose that isn't clear, let's just kill the
> > > requirement for these tags from the kernel at large.
> > 
> > No, please do not do this.  It's useful already for many patches in my
> > subsystems, and is only going to be used more in the future.
> 
> I should have sent this as an RFC patch, but hopefully everyone is
> treating that way anyway. To be clear, I don't have a strong preference
> on whether we keep Assisted-by: or not, but I'd like to better
> understand the intended uses of it if we do intend to keep it.

-- 
Regards,

Laurent Pinchart

