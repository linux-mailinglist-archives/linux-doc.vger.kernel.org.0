Return-Path: <linux-doc+bounces-94798-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Psw3HgSkR2oMcwAAu9opvQ
	(envelope-from <linux-doc+bounces-94798-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:59:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF41A7021B5
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:58:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=jMbIFB5e;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94798-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94798-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFEF8300B990
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 11:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22153CB8FF;
	Fri,  3 Jul 2026 11:58:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8D43C3458;
	Fri,  3 Jul 2026 11:58:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079937; cv=none; b=HernH699KkAnP4gMxTZWulclY2RLjJ6p+aOmlvO7JdEZMgkcmjL31f7c1337neNQ+dpabVgnAHHt81urwb74Gtzau6qxFPT8lq0ZsWYTE/cTnREvEOB2HmwjBsF8a0kGGLF74V0ehyRaiHhQEBs0054xcjdikGz9YiaZGap5HSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079937; c=relaxed/simple;
	bh=9RkqNxccYBDEv45d8DCin2QlOks8W9i+BqfQdAypggA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHPklHYW5kJU9XnRYEYlKxPED+bMotD+8SRi/o5Jn/LPkMjC0IwDcQn7SBqcXgVr6uWdzDGlKYg69l/xlVD/YxxuzHS7Rs3NRyr0i17nqhemqkRto63mF/5mwH0qYTjY6SScOcXBJ0qcm7CmBQCB8OIcOe83U4cAdtY4v7MjvWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jMbIFB5e; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72007DF3;
	Fri,  3 Jul 2026 13:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783079888;
	bh=9RkqNxccYBDEv45d8DCin2QlOks8W9i+BqfQdAypggA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMbIFB5ey+7gjZZYQ/z8CrT7gJhPjlRtqGNABHNB2rlXYjJ5jt7tnY/SmfHA5A0pV
	 8WHJHXoPULdNEeqwQ8GY54A6R6amUWuvdjynVgYeLUvOE/7Aqbo4OzLGw0FgaCDFzN
	 qPp/rlyuwWVCp7fmgjR0wZvLzJjOF38Y9wIkEfGs=
Date: Fri, 3 Jul 2026 14:58:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ellie <el@horse64.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <20260703115852.GC3659451@killaraus.ideasonboard.com>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <53942438-a44d-4578-b1c6-d45c2af1767d@horse64.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53942438-a44d-4578-b1c6-d45c2af1767d@horse64.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-94798-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:el@horse64.org,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF41A7021B5

On Fri, Jul 03, 2026 at 11:21:28AM +0200, Ellie wrote:
> On 7/1/26 5:54 PM, Christian Brauner wrote:
> > I remain very confused by our coding assistant contribution guidelines.
> > I'm going to be a bit polemic now but this seriously in good faith.
> > 
> > Why precisely do we require all this detailed information about what
> > specific coding assistant was used?
> > 
> > I find it very irritating that our git history has effectively started
> > to function a bit like a free advertising platform for a bunch of AI
> > companies and their proprietary agents and models.
> > 
> > And it reamins unclear to me what exactly we do get out of this detailed
> > information: Do we want to run statistical analysis on what agent and
> > model is used the most and publish that on LWN at some point?
> > 
> > I acknowledge that my stance is even more radical: imho we would just
> > stop it with any disclosure requirements completely.
> 
> Sorry to drop in as a relatively uninformed person, but it seems like 
> the following mails would be relevant for that discussion:
> 
> https://lore.kernel.org/lkml/e12330b9-c29e-45ca-9375-9e3d13426d85@horse64.org/T/

Your messages got completely ignored for a month and a half. Most
developers (including myself) don't read LKML due to the high traffic,
but I'm still surprised by the complete lack of reply. Maybe CC'ing the
workflows@vger.kernel.org mailing list would have helped ?

> If LLM code were no longer committed to the kernel, which wouldn't 
> exclude using an LLM to pinpoint problem spots and security bugs as long 
> as it's not used to produce the fix itself, then the commits also would 
> no longer need an attribution.

That's absolutely right, and I would welcome that outcome. At this point
I don't think I'm talking for the majority though :-)

-- 
Regards,

Laurent Pinchart

