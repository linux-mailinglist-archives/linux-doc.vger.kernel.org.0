Return-Path: <linux-doc+bounces-94406-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id suhfC5o7RWrt8woAu9opvQ
	(envelope-from <linux-doc+bounces-94406-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 18:08:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 153946EF852
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 18:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=R3unUPoW;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94406-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94406-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A08F304698B
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 16:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB17466B69;
	Wed,  1 Jul 2026 16:08:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94948BD3F;
	Wed,  1 Jul 2026 16:08:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922094; cv=none; b=M8f6gR8IAwgDBcTkDiDFJwXuKhlsWwl1DQ3NEbOFPD4iPh2eXfVJiNRo0VS+n69Cq8uKcHaSecC+EQ/wZavo+O6wqntrZAnn7g7WHEgkHgLbaKtIkv4UvUdYtMjfeZxQdQDvG4M0RLTwfO/Z+UQD4c6Ihv2Jez+6h78qk9ZDRIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922094; c=relaxed/simple;
	bh=xat0S/7hhqd/pGIHTCtDuUUbp6Tj4fuNwpwliP/9u8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qyWf7hs707p4oj03iUV3x/GTeUytOpN1kj7UOm3CswY8lvN6SovlQa058wzdF2COLM7DJhtsJ0eF0q/LIYPg83oo4ceOjAcm1aKdR383dYP3UT/z2WvUNnwbPzr9UxY4hwvqMzbpRZfM5qoRTcSXJLMJpvdvu6HhVPpohaXlnqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=R3unUPoW; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 695B841599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782922092; bh=32P2g6yBGgImUvn7wpL6P00mVW8ED72vfqoB2ujBsag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R3unUPoWerSGDmsBFQ8SLsl1L+fZ1NdJXYUbgzj+VM9Jnr/U/13Da3ySRDlf2JFhJ
	 l69LtblfKO8TKZ57Vz2al1CEwJ4vZhkztl4jFHAh+GjVsTqMjoIYYRNpJM8cVl6ava
	 Mos3h11NXCVF6tYscP/3HhApL8gjwu7q1ARlzYFNKqa4IFsE4URL22cdD/q1pzJlC7
	 V1SbNLwZl/EE6TJIKzlHN9I+iL5BwYF4dXKudFMLhMw1Dlk3D1PX0Wq0I2a9F95djM
	 BFoce6HldvfHIcuUvGm7349GzFimtsyR5ulTFkze988P+mt01ZxF99qkpsAV7sQkJ1
	 phoafNFU39WyQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 695B841599;
	Wed,  1 Jul 2026 16:08:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Christian Brauner <brauner@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, David Hildenbrand <david@kernel.org>, Jeff
 Layton <jlayton@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Christian
 Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
In-Reply-To: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
Date: Wed, 01 Jul 2026 10:08:11 -0600
Message-ID: <87jyreofpw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94406-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lwn.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 153946EF852

Christian Brauner <brauner@kernel.org> writes:

> I remain very confused by our coding assistant contribution guidelines.
> I'm going to be a bit polemic now but this seriously in good faith.
>
> Why precisely do we require all this detailed information about what
> specific coding assistant was used?

From my memory of the discussions:

- If a specific LLM turns out to be in a bad position with regard to
  some copyright ruling, we can identify the commits that might have
  been tainted by it.

- Similarly should an LLM prove to have an inclination toward specific
  types of security issues.

Whether either of these would ever actually prove useful is not
something I can hazard a guess for.

> I find it very irritating that our git history has effectively started
> to function a bit like a free advertising platform for a bunch of AI
> companies and their proprietary agents and models.
>
> And it reamins unclear to me what exactly we do get out of this detailed
> information: Do we want to run statistical analysis on what agent and
> model is used the most and publish that on LWN at some point?

...wasn't in my plans ...

> I acknowledge that my stance is even more radical: imho we would just
> stop it with any disclosure requirements completely. It's useless imho.
> We already see that other than core contributors most people don't care
> and will just not disclose their usage of AI.

The widespread ignoring of the disclosure rule is, IMO, something we
need to address somehow; were I still on the TAB, I'd be raising the
issue there.  Either we find a way to be serious about enforcing the
disclosure rule, or we should just drop it.  A rule that everybody
ignores is less than useful.

(That said, 706 commits in 7.2-rc1 include Assisted-by tags, so *some*
people are complying.  That's about 5% of the total.  What do we think
is the actual use of LLMs for the creation of kernel patches?)

jon

