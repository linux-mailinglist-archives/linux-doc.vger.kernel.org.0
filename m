Return-Path: <linux-doc+bounces-94795-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DkQ0F9KhR2qCcgAAu9opvQ
	(envelope-from <linux-doc+bounces-94795-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:49:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6070205F
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:49:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=mit.edu (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94795-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94795-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3058F304C11C
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 11:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3995B3C819E;
	Fri,  3 Jul 2026 11:43:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800553B7759
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 11:43:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078991; cv=none; b=Gi4TLp7UW5/GtZBWciwowP5Y2Y4x4bGhhiuFXXQOIYNNK1FJNc5GaR5i/8hTAjEItCd54GWmYgQGbrhIadxjEtxfJbgTdBE/rVkQNMsEBZ0m+rF4auoHoHUD9s4A4wpE+eDKtjwif/L3Aa6RoGtQNcSCeFgqvSueWktmE/klvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078991; c=relaxed/simple;
	bh=MbTATmy8I9xcBWQF5hOY0p0TNMj7Drl4a0Js/q64axE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW94lCPUb6opIwy8h0Pum/9TGNtgJhNdURdE4ndFsEODPkYsxYduLE/FiMZldVczyrwGURl3mwRj5GAV+bT27cC1ykmOgfLuXMNfyQzDUiyPz9u4hhBv+vtUsCbGw9bsvNTL5Y7pm5f7TnpoOS1y7RXbzh7VGpRLJhY1BwyleMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Received: from macsyma.thunk.org (syn-072-043-125-131.biz.spectrum.com [72.43.125.131])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 663BgZYu001670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jul 2026 07:42:36 -0400
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 3437289CB1E; Fri,  3 Jul 2026 07:42:35 -0400 (EDT)
Date: Fri, 3 Jul 2026 07:42:35 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jeff Layton <jlayton@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Justin Stitt <justinstitt@google.com>,
        Lorenzo Stoakes <ljs@kernel.org>, Carlos Maiolino <cem@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Brian Foster <bfoster@redhat.com>,
        Christoph Hellwig <hch@infradead.org>,
        David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
        Vlastimil Babka <vbabka@kernel.org>,
        "Christian Brauner (Amutable)" <brauner@kernel.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
Message-ID: <akeaouJETPWpE838@mit.edu>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
 <20260702161330.GH3534761@killaraus.ideasonboard.com>
 <2026070227-payroll-eradicate-8f66@gregkh>
 <20260702163215.GC3559965@killaraus.ideasonboard.com>
 <2026070350-drown-untreated-5835@gregkh>
 <a095d9b4-f774-47d9-affd-d519d8acfb34@kernel.org>
 <2026070343-copied-quarters-1e2a@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026070343-copied-quarters-1e2a@gregkh>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94795-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:david@kernel.org,m:laurent.pinchart@ideasonboard.com,m:torvalds@linux-foundation.org,m:jlayton@kernel.org,m:corbet@lwn.net,m:justinstitt@google.com,m:ljs@kernel.org,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,linux-foundation.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5A6070205F

On Fri, Jul 03, 2026 at 09:30:28AM -0500, Greg KH wrote:
> > So clarifying there that a "Assisted-by: LLM" is also good enough would make
> > sense if we agree on that.
> 
> If we all agree on that, I'm saying that _I_ don't care, but others
> might.

I agree that requiring the model name is not a good idea, because some
developers might be using unreleased products where the name itself
might not be public.  So allowing the version number of the LLM to be
elided would be a good change.

I'll also note that it's starting to be the case where tool is
actually quite relevant.  So it's not just about the LLM Model, but
whether you're using Codex, Claude Code, OpenCode, or Shahiko.  You
can use the tool or the harness with different models.

So whether the tag is:

Assisted-By: OpenCode:Gemini 3.5 Pro
Assisted-By: Claude Code
Assisted-By: LLM

I'd be fine with reviewing patches with any of the above.  However, to
me that's actually not the most interesting part.  See below....

> For me, the info after "Assisted-by:" doesn't matter, it's the first
> part.

For me, what I care most about is *how* the LLM was used.  For
example, if someone just used the output of Sashiko to fix a problem
in their commit, that's one kind of "Assisted-by".  If Sahsiko
identifies a pre-existing bug, and the developer addes a patch to the
patch series, or creates a new patch series, that's a different kind
of "Assisted-by".  A third kind of "Assisted-by" might include asking
the LLM to create a Coccinelle semantic patches (because I'm not smart
enough to create semantic patches).

And of course, all of this is quite different from the stereotypical
"vibe coding" where the LLM generates thousands of lines of code which
the human doesn't understand before sending the pull request.  :-)

So for me, adding something after a #-sign comment explaning how the
LLM was used would be very useful.

> > My kids should clean up their room; doesn't work.
> 
> But, if you notice that your kids didn't clean up their room, and you
> had told them to, you can then talk to them about doing it properly
> based on what they are supposed to be doing.

Another metaphor might be that people shouldn't try to evade paying
their taxes; merely passing a law saying they have to file correct tax
returns doesn't guarantee this.  But it was specifically the law
against tax evasion is how US Law Enforcement arrested the Chicago mob
boss Al Capone.

Just because some people might lie doesn't mean that we shouldn't
bother to ask everyone to fill out tax returns.

Cheers,

						- Ted

