Return-Path: <linux-doc+bounces-94633-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C/1kF+WGRmqTXwsAu9opvQ
	(envelope-from <linux-doc+bounces-94633-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:42:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7556F98FE
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:42:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Z6vHtArs;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94633-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94633-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FA0D30134BC
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 15:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ED137A85C;
	Thu,  2 Jul 2026 15:36:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4333AD8B;
	Thu,  2 Jul 2026 15:36:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006612; cv=none; b=LKA4nP86ajsUyxvzzbM6uBb4oIBLbcCfoW10RAVPQklhkjHodBH0EWGFzYME8F9QXX0Mfm2J8O3juVbo4zh64pEVCIXONmwdNg/WdHJDSYprL2TaiYzqGnFECx+7rGGQrtPteaJIK8OWHi9TLqgE/DefYN0wbcffwalDpWRbJgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006612; c=relaxed/simple;
	bh=3ZoGGrtDHrhFGSRS92ZY56Lbany7RokCQLjnUpbGhrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JulArMRZ8nQMAmWPmsiysO+jjqyDM3tE2lFyvtrfoSYPO5F1ZnBZF5pUfWZ7/bJPH3ZTHcz0m4rsQncrPiFd6gQu5ccq0jmHh8gDdZMmMvl5CdoIfoy6t8LuQLSLiB+LfreKVooICK5vH0cxzw5+76KUlskNXVGwtcsue5Q/1U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z6vHtArs; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CECC78FA;
	Thu,  2 Jul 2026 17:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783006563;
	bh=3ZoGGrtDHrhFGSRS92ZY56Lbany7RokCQLjnUpbGhrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6vHtArsZPJSZCWm340TpdxWGzqRuf+jWbbpEjnSZXpy7inaJmDPvhhmsGqRjLBs1
	 N3H4T8PV3L6/c6+JclEZZmzr3vlOrGsw6UHXK8nJLpsL0tVZkVRbmOa+ijlia9Ga8s
	 JclEGZ9AH7z54OphEaTJs0PgRgZLvkTSjaMYSG9Y=
Date: Thu, 2 Jul 2026 18:36:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <gregkh@linuxfoundation.org>
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
Message-ID: <20260702153647.GB3559965@killaraus.ideasonboard.com>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026070224-unholy-commode-cf45@gregkh>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94633-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:ljs@kernel.org,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA7556F98FE

On Thu, Jul 02, 2026 at 05:07:03PM +0200, Greg KH wrote:
> On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> > We've had this requirement in place in the Documentation for several
> > months, but it's becoming clear that the signal to noise ratio from this
> > is quite low.
> > 
> > 1/ It's not universally followed. While many people do try to attribute
> > the LLMs in good faith, not everyone does for various reasons.
> 
> Then let's move to get people to follow it.

Has there been any discussion regarding *how* to do so ? Jon mentioned
that in many cases the failure to disclose is simply due to ignorance.
That could be addressed by more advertising (not entirely sure where
though, documentation isn't always read), or restructuring of
coding-assistants.rst (as far as I understand, the file is supposed to
be consumed by agents, so it should be reasonable to expect the LLM
output to contain a tag).

There are also cases where submitters refuse to comply with the rules
(as in [1] apparently). For those cases, a clear message that
maintainers will be fully supported by the community when they push back
could help.

[1] https://lore.kernel.org/linux-mm/20260527110147.17815-1-tao.wangtao@honor.com/

> > 2/ It basically serves as free advertising for proprietary LLM companies.
> 
> Who cares, make up a name, all I want is the "signal" that someone is
> using a LLM so that I can review it as-such.  And if I think someone is
> not reporting that, I can ask for them to properly attribute it and if
> they lie, well, that's on them.
> 
> > 3/ It's not clear why we want to collect this info in the first place.
> 
> We want to know if a LLM is being used.
> 
> > Given that the data this provides is flawed at best and is being
> > collected for a purpose that isn't clear, let's just kill the
> > requirement for these tags from the kernel at large.
> 
> No, please do not do this.  It's useful already for many patches in my
> subsystems, and is only going to be used more in the future.
> 
> thanks,
> 
> greg k-h
> 

-- 
Regards,

Laurent Pinchart

