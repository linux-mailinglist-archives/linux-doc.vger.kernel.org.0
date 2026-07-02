Return-Path: <linux-doc+bounces-94603-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XklOKpdqRmpETwsAu9opvQ
	(envelope-from <linux-doc+bounces-94603-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:41:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7300D6F871E
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:41:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nAOxgXJX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94603-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94603-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 609EA30285CC
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 13:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4621B48124B;
	Thu,  2 Jul 2026 13:40:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D6492181;
	Thu,  2 Jul 2026 13:40:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999626; cv=none; b=oS7pt+u6QGlWoHfiTuZE5j259sAeX1zdS3LjhQvmiNu2EuVO46e3k8x2fnV/ZmD9uRtU5I7Do6hFKlUeHhd3ZBSqsOy+WvKOjJzWToA833cYPQsw5EoNQiz07AZY1vcN1ZQ0RuLM4F4iXCQs3PPYh69UY4Fm86Sxzgc5bmc00lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999626; c=relaxed/simple;
	bh=dGz2MsweLprpbg2D7X5iWj/mrmi3aMUk7JcKLkR4aYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAUuoE5ID5kRoHGj/znXEoYVaUXsI+MNFap984rD3IlH+aPepsw1NA03ti/CoaDRYgpbgxfwgy5t+yoV9XH+//1UWqKphd1r1ONBGR0WqpedJagZvbs3rqASFhvx7/IPFfQTungWOxk31RAZpPeWfslwjL7XWvGZw/WHyV5Uuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAOxgXJX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642F31F000E9;
	Thu,  2 Jul 2026 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782999624;
	bh=KgR+mQ/0nm+ILnFswRdwzpz1XITRQV9SygDbJSTQ4+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nAOxgXJXyp4A998OxVFeuFBS13hAFS8s+85xkdR/Vx81COqgKKTHUMhHaIW4/uFyV
	 i5gBIS0bBtwt1gm14Yi0uplujcywfuXMbfiu/YFkl3SuBPlQ0/HWuSQ/6gkfmdeDG8
	 byIo47xMDtpRy32KEep1tUhwiy0NSAp3XvZhwr3OJpzp+3Ab1oPPoR9Ia6OwXHRYoL
	 rDkc46cITcpmh9Q+3YxQmmwffRPFWsW0TeYP+PLyVMUhYIZkjnN5rJOvI1pHiqhuVL
	 esJam4JmhMxCX2JYvDLHlnir9DZWW+CeJql9Q7GJGdXT5OB3MA3s4ngutFm5K7NH9t
	 koCEx5m62y+3g==
Date: Thu, 2 Jul 2026 15:40:19 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <akZoo9j8bvyK7prt@nidhogg.toxiclabs.cc>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <akZLO6KcGRW4BCW_@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZLO6KcGRW4BCW_@infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-94603-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[cem@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cem@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7300D6F871E

On Thu, Jul 02, 2026 at 04:27:55AM -0700, Christoph Hellwig wrote:
> On Wed, Jul 01, 2026 at 05:54:48PM +0200, Christian Brauner wrote:
> > Assisted-by: LLM
> > 
> > or
> > 
> > Assisted-by: Coding Assistant
> 
> I think what is more relevant is what assistance there was.  If the
> code was generated by an LLM we should plain out reject it out of
> copyright grounds.  If it was used for validation or ideas: who
> care?
> 
> I.e. do we need this at all except as a guard against vibe code junk
> that pull in other copyrighted material?  And do we really rely on
> a tag instead of detecting it by the usual signs?

I don't think this work at all as a guard for vibe code junk. My
experience recently is receiving broken patches clearly LLM generated
without no tag at all.
Some functional patches clearly generated by LLM without tags where I
need to go to the developer and tell to add the proper tags.
And yet some patches that seem functional but broken details buried in
200 line commit descriptions that we've all need to spend time reading.

I'd vote for dropping the tags too, they have been for me at least just
a burden trying to identify if whoever wrote a patch used a LLM to
generate it and didn't add the tag.

I think it was a nice try but didn't prove to be useful at the end (at
least not for me).

Cheers.

