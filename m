Return-Path: <linux-doc+bounces-94525-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2k9CBJIWRmpxJgsAu9opvQ
	(envelope-from <linux-doc+bounces-94525-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:43:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE846F44DB
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:43:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GIiZmgcr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94525-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94525-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D489315B0C5
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 07:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4023914E9;
	Thu,  2 Jul 2026 07:29:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C2D3914E5;
	Thu,  2 Jul 2026 07:29:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977357; cv=none; b=st9aULorckx6uz8LycteWX98rmWtSz+RgyBQhcuwq0zYmFwfIBMYxNJdvBhZjRXMhQSokF99abeVIGyp8yC0gcvYRP8qzC/tOMDxYFomldJq/m1hU8MVqHv598pxU+hCVDMnYsM1HmDBoTGeUTGAV2nQh+Agn0xXRVT+EtmOKQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977357; c=relaxed/simple;
	bh=Lawg9YFySEGOgubbh1cOdatE9TtSMuRVqTofSHmUhUI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=JShs0i4TmpjoQ5yb/7+BoB8GaKx5kwF+s1CmLwE7KMQcalYUYue+Pff/rvV/EHjQ30XVpOudGEmcHEok24kaEcdRFuW9pW0QQPUvlY/MgjJnywoGp4WdrC199caOH6He5SfTqh0NB5KQ2QVkR3nTroqDhcdtcGwDPG+0TtGHQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIiZmgcr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8128C1F000E9;
	Thu,  2 Jul 2026 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977356;
	bh=RW6SqLELVkDjLMxPpQI8Ty2YK2jLiDbzTAVsATnYajs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GIiZmgcrgeHAeLML2XeNiJwOH+L3j/64WDzDO35aq8yZT/jHxV7m9wHy7ut5AA1et
	 cCwYx3pYwcCNZxgDW3mLKJNly/CD81grA5V3ddM6AFBtbBqqq+8tehx1+L+Ap0csRz
	 +ISDUXz71y5a9zU/BVa/UQw5DyYEJ+vzd+2aiCNFMTAVpQuBL84HV73tcJ0S5P8jOx
	 Y6GHbgw8/EhR+1qtYHWgT2zZEiNhYaSk4S43Ehmxjfr9kM+Z5qGZ0KzhYCh9rgTMN2
	 tYkoavqiVF2bFWFx5IBA15E0Qz4dwzNopzw6XpsGBX03bRSMAAuttwKg3zWlxRHR44
	 HmW+F24oNMflQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
From: Christian Brauner <brauner@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
 David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
In-Reply-To: <20260701115302.29c66401@kernel.org>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <bffcce9436c47e8762e6f4fa4cae9f7ddd183b8f.camel@kernel.org>
 <20260701115302.29c66401@kernel.org>
Date: Thu, 02 Jul 2026 09:29:11 +0200
Message-Id: <20260702-sucht-bauabschnitt-rausspringen-577b7b7be2c7@brauner>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=brauner@kernel.org;
 h=from:subject:message-id; bh=Lawg9YFySEGOgubbh1cOdatE9TtSMuRVqTofSHmUhUI=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS5CXv2c35Y2mapEp9sFbBZldcizv0N2+nSrAJ3cUez2
 cGCt951lLIwiHExyIopsji0m4TLLeep2GyUqQEzh5UJZAgDF6cATCTHhZHhhtJF/VtHXetO7btg
 2X2hOmDzoZAjk1ylu4q3J7x2UG8+yPDPvuvuVyuPzOLC2cI9PZ3/1OITwueWpIXvfen8KonvLRM
 jAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:jlayton@kernel.org,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94525-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,brauner:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DE846F44DB

On 2026-07-01 11:53 -0700, Jakub Kicinski wrote:
> On Wed, 01 Jul 2026 14:35:08 -0400 Jeff Layton wrote:
> > On Wed, 2026-07-01 at 17:54 +0200, Christian Brauner wrote:
> > > I remain very confused by our coding assistant contribution guidelines.
> > > I'm going to be a bit polemic now but this seriously in good faith.
> > > 
> > > Why precisely do we require all this detailed information about what
> > > specific coding assistant was used?
> > > 
> > > I find it very irritating that our git history has effectively started
> > > to function a bit like a free advertising platform for a bunch of AI
> > > companies and their proprietary agents and models.
> 
> FWIW, this is exactly how I feel. I added a regex to strip these in
> my git hooks. So at least the net/ history should be ads-free 🤷️

Ah, that's good to know. I've been rewriting them to "LLM" but I might
just start doing what netdev is.

> > In general, collecting data for nebulous purposes usually turns out to
> > be a bad idea. If we're not 100% clear on why we want this data, then
> > we're probably better off not collecting it at all.
> > 
> > With that in mind: if we're going to water down the tag, then I say
> > just remove the requirement altogether. If we later decide that we want
> > to start collecting more detailed info for some (clear) purpose then we
> > can revisit the idea.
> 
> +1
> 
> Honestly even tool attribution feels increasingly moot.
> People vibe code tools and AI-in-the-loop pipelines which they never
> publish. Open source tools are (hopefully?) used in pre-commit
> pipelines, so they have the "kbuild bot problem" of problems getting
> fixed before the code is merged. And we have the same free advertising
> problem for the rest.

Agreed.


