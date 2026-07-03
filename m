Return-Path: <linux-doc+bounces-94726-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SE0kEV8lR2rTTgAAu9opvQ
	(envelope-from <linux-doc+bounces-94726-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:58:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D476FE07F
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:58:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=mit.edu (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94726-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94726-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53476301347F
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 02:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDD2262FD0;
	Fri,  3 Jul 2026 02:58:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F30123C8AE
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 02:58:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047515; cv=none; b=sMl2RIxjij/123nTi2bTiErbj4aTvFDfDowPwmlER0AuOgTpUGxfBnshkFZqU7WBBXg8kJumhp2Gkd4hWwyFJlbTFHbXVwxnpjwKR1T507li4dZe9a+s+mHzLybVRzUbFFNMJK7vn5Vy8uuooxHcBulpRzyannVH9dLuPRTlJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047515; c=relaxed/simple;
	bh=NeqCj5wMW66AGlGCvKSpFk6GVc1xgE71/ar2/fdtHN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csEk6PLfUhO7p0iBXVD/NFc3NunhV22Lgg9IGmuNhENSQc5ABCA4jt8fEh5NVp5hsQCuRBdAuS11H/EeqIo72J5oftNcI52oyrdHrhFP20rNgrqSdKj+GlUr5CnjCc92bOaEI3KaJEGghDnRlNrUg3Jyf153I3ahqRbDW1xkov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Received: from macsyma.thunk.org (syn-072-043-125-131.biz.spectrum.com [72.43.125.131])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6632vgIH012892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jul 2026 22:57:43 -0400
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 6412189308C; Thu,  2 Jul 2026 22:57:42 -0400 (EDT)
Date: Thu, 2 Jul 2026 22:57:42 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Andreas Dilger <adilger@dilger.ca>
Cc: Jonathan Corbet <corbet@lwn.net>, Greg KH <gregkh@linuxfoundation.org>,
        Jeff Layton <jlayton@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Justin Stitt <justinstitt@google.com>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
Message-ID: <akcji3OuxXz3FqSD@mit.edu>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh>
 <87cxx5l900.fsf@trenco.lwn.net>
 <7C39A5C8-EA03-4C8D-9BE5-5097101B71D6@dilger.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7C39A5C8-EA03-4C8D-9BE5-5097101B71D6@dilger.ca>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94726-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adilger@dilger.ca,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:jlayton@kernel.org,m:torvalds@linux-foundation.org,m:justinstitt@google.com,m:ljs@kernel.org,m:laurent.pinchart@ideasonboard.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,linux-foundation.org,google.com,ideasonboard.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2D476FE07F

On Thu, Jul 02, 2026 at 12:46:19PM -0500, Andreas Dilger wrote:
> It would make sense IMHO to address the ignorance in the most expedient manner,
> namely by telling the *LLM itself* to add this tag when it generates the commit
> message and/or reviews the code.
> 
> This could be achieved by adding a statement in "AGENTS.md" in the root of the
> source tree to this effect, or telling the agent to reference and follow rules
> in Documentation/process/coding-assistants.rst regarding the Assisted-by: tag.

This presupposes a particular workflow where the developer allows the
LLM to generate git commits.  I don't do that.  I'll ask the LLM to
modify the code, but then I'll generally fix it up --- very often by
hand because I can edit the sources than entering a prompt and waiting
for the LLM to figure out how to make the change.  I'll often run the
test cases myself, since if it takes 24 hours of VM time, and 2 hours
of wall clock time, I'm going to kick off the regression tests myself,
and verify the test results.

And I almost always write the commit description myself.  So when I
say, "Assisted-by" it literally is "Assisted by".  It is not "vibe
coded where the LLM generates thousands of lines of code that the
human being doesn't understand before sending ta pull request."  And
that's probably why you'll see people asserting that LLM generated
code can't possibly be accepted due to copyright reasons.  There's a
big difference between asking an LLM to modify already existing code
to add a feature, or to fix a bug, and to vibe code a new OS from
scratch.  One is far less likely to be a copyright violation than the
other.

						- Ted

