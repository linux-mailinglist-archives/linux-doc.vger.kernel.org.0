Return-Path: <linux-doc+bounces-94710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6X99ONTuRmqufgsAu9opvQ
	(envelope-from <linux-doc+bounces-94710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 01:05:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ADA6FD565
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 01:05:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Y+ROQ5ff;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94710-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94710-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E078B3029AF2
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 23:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3EB3C1969;
	Thu,  2 Jul 2026 23:05:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0F27081A;
	Thu,  2 Jul 2026 23:05:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783033552; cv=none; b=qnEW+SgiXev40v349ndfjWFDkZDr+E1nh7bmGxUXzlUT+uCa+kUauWIw/ZsABK6kITnCD9RHbVvy1YZkP8JzlZidoycv3YcsZHe85bfEBwZIyVrt6JO+fClqUFH5sC3xsMcSmzCTLWo3N2HAaXBfFCifr3V4Y2iYwhYt5wWK+Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783033552; c=relaxed/simple;
	bh=z/PL7fFq4kLVO+b7hoZGEv+ChBPGUpOeKsZUiEv2w5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myvig1BV6PV9IGxMfKv2D151KMgIH0G9wHYt/ux09+ffSf8HLfcspjZKBzJhMLBIy3Ss+ybcp9ff7JSsyIxksnTRlBBGwauqHfmFFtkDftSiGDq8d+CxV5/kfxC8tokft9Hj5K6hTXFbSTRU4sHvTctx2EUjFd8BEDUEVX4DTKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+ROQ5ff; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6A91F000E9;
	Thu,  2 Jul 2026 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783033550;
	bh=ZBRHqb1NDOH8oHItOd3hyQ5MfmYi1tcrPJ9XDGwB6DA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y+ROQ5ff0I1CMQF7LqfbXbxZbxZo7E3AaR26HxXLZxvJwnTQUS4mcYloqdo9gf3sC
	 FzBL8mumI4haKcU7WfATnu/h17N8Xcn9XWtDAz0H9wJ6b34MTuwzqBljPVC1HcPoJC
	 EHWydJmluYpOk/atLpq6k8BaG1Vwujf3WfwFsEAKmxa1W0mqbbAI2P8cojJOQy1H0Z
	 Vs1O0SSgO4Nuf2eCzQ3FanFuq8wEaZd4nNsFnuSlwJiyyfRHVNfTh+mCmAhpr5yJG1
	 QpxoanZjLuyGPrQYM8f2j7pcnNlLXeaOO3rY40QoGBhUAESLyIi/P3IdVWlW7EuOQP
	 thIAHCykiQEnQ==
From: SJ Park <sj@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Date: Thu,  2 Jul 2026 16:05:40 -0700
Message-ID: <20260702230540.98160-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <akaWnQ5Pkg_676B-@lucifer>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94710-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:sj@kernel.org,m:jlayton@kernel.org,m:gregkh@linuxfoundation.org,m:laurent.pinchart@ideasonboard.com,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,ideasonboard.com,linux-foundation.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73ADA6FD565

On Thu, 2 Jul 2026 17:50:15 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:

> On Thu, Jul 02, 2026 at 12:48:22PM -0400, Jeff Layton wrote:
> > On Thu, 2026-07-02 at 18:19 +0200, Greg KH wrote:
> > > On Thu, Jul 02, 2026 at 07:13:30PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Jul 02, 2026 at 11:57:46AM -0400, Jeff Layton wrote:
> > > > > On Thu, 2026-07-02 at 17:07 +0200, Greg KH wrote:
> > > > > > On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
> > > > > > > We've had this requirement in place in the Documentation for several
> > > > > > > months, but it's becoming clear that the signal to noise ratio from this
> > > > > > > is quite low.
> > > > > > >
> > > > > > > 1/ It's not universally followed. While many people do try to attribute
> > > > > > > the LLMs in good faith, not everyone does for various reasons.
> > > > > >
> > > > > > Then let's move to get people to follow it.
> > > > > >
> > > > > > > 2/ It basically serves as free advertising for proprietary LLM companies.
> > > > > >
> > > > > > Who cares, make up a name, all I want is the "signal" that someone is
> > > > > > using a LLM so that I can review it as-such.  And if I think someone is
> > > > > > not reporting that, I can ask for them to properly attribute it and if
> > > > > > they lie, well, that's on them.
> > > > > >
> > > > > > > 3/ It's not clear why we want to collect this info in the first place.
> > > > > >
> > > > > > We want to know if a LLM is being used.
> > > > >
> > > > > But why? What do you intend to do with this information?
> > > > >
> > > > > Do you mean to use it as an indicator that the patch should receive
> > > > > "extra" review (or maybe that it should be ignored)? Do you mean to use
> > > > > it to generate some sort of statistics at a later time?
> > > >
> > > > I use the information to decide how to review the patch, and what level
> > > > of priority to give it. For that usage I don't need a tag, but I need
> > > > the information in some human-readable form at patch submission time.
> > >
> > > Same here.  I don't care about stats, I care about "how do I review this
> > > patch" and this gives me that signal that I need if faced with a
> > > llm-helped patch.
> > >
> > >
> >
> > Do we need a tag for this though?
> >
> > This seems like the kind of information that we would always require in
> > the cover letter of a series (or the little place in an individual
> > patch for comments that don't get merged). That would also allow you to
> > convey a lot more nuance about how it was used.
> >
> > ISTM asking people to disclose LLM usage in a cover letter would give
> > everyone what they want: Information about whether and possibly how an
> > LLM was used, and it also wouldn't clutter up the changelogs with these
> > tags.

I understand the concern is having the information in the git log.  I agree in
a level.  I wish cloning linux takes not too long time and huge traffic.  I
wish each commit message be lengthy only as much as needed.

> 
> It's much much clearer and easier to just have a standardised tag for that.
> 
> You can see that (and grep for that) immediately, vague paragraphs not so much.

I also agree having a formal tag can be convenient.  LWN's Assisted-by: tag
statistic was interesting enough to make me supporting this idea.

What about keep requesting this formal signature to the submitters, but also
formally allow (or, encourage) subsystem maintainers to remove the tags when
pull-request?  That's already allowed, to my understanding and some maintainers
are doing [1] today.   That can help preventing the git history of a subsystem
bloating or advertising priorietary companies, as much as the maintainer care.
Meanwhile, we can still get the information at review time, and also after
review from the mail archives.  It will still be handy as long as we use tools
like 'lei'.  As some maintainers are already removing the tags from the git
log, this may be anyway a better way.  Someone may interested in only their
subsystem history, but I find LLM users tend to contribute to multiple
subsystems, so this might actually matters.

It might be too clear to formally document this, though.

[1] https://lore.kernel.org/20260701115302.29c66401@kernel.org


Thanks,
SJ

[...]

