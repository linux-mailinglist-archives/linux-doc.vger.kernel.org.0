Return-Path: <linux-doc+bounces-78089-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLZfApb5qWncIwEAu9opvQ
	(envelope-from <linux-doc+bounces-78089-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 22:45:58 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72C218934
	for <lists+linux-doc@lfdr.de>; Thu, 05 Mar 2026 22:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B772303CE8B
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2026 21:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C213542F6;
	Thu,  5 Mar 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TcT32NJk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EeqHCikQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871733A031;
	Thu,  5 Mar 2026 21:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747120; cv=none; b=bdrE0R7fdxCBYyWXHsGPY5p4LD9Tpon7kABEUNgHmT9UQBj4ZAqU8ZomGQwRygjrNkyaX/0nYeb87UZqaWiT3jS4obDQ5YzfiuSOhTBKCcJvO59SpjkCmimq/SKgSDZrM3N2dPgQUt1k0J/dOlFcPvGS17w5CT+5bzWcc0Dw6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747120; c=relaxed/simple;
	bh=1Buo9vAlhqmAm+KzCR7loWt/SQaWaK3cl4Ka2WMq67M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfmrmMUcVUgRCkMOABZqR6SmhvrI2b1FBk7qnxDCYBNOaY4J2r24jBgTkixsNHu+Ubt4NrLgFzDf5ob0vzL2d+/4Jez1O4giPZ4iclwP0dP7Oa7Ouos3a/FGzOP8nFgJW3GCKxC2Qgk30O9lZiAvMpkm0ytcPxkwexN7wCE/4/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TcT32NJk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EeqHCikQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 5 Mar 2026 22:45:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772747117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6p/JX1Fj2JbUtkVANhZChBGnz22n6wW+j2nV07N3q+I=;
	b=TcT32NJk0CPsjQ+XaRMEfwMYtDbNDek9uYLSjG5ViGYjhKMFXY9NlXGYcz2KVqK1529lBZ
	mDsHj2vOhgPjikBHzvBH779M/XvEKfiePZxGMq5atFYGHcK8iOx3e72bOx2MC60lxG+2d/
	8o4cBnRdmpB6aQJ3VRb2GD4rn9VdArep448xGYL6FQhZOEC6CylM9DsthEhtqAlbpl8J/Q
	KK4TpnNYI/3fJo81TV28HFCfCVktMMbmrlwHR3L2kC6Nhl41c7ANN0E9xlcYxA/vWiOZVL
	6kmuS0ttNf1CZX0q9qc3pwwarGD0nP6WqGs8e+xrNn5iSgF7bB4Dg3jAqAY66A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772747117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6p/JX1Fj2JbUtkVANhZChBGnz22n6wW+j2nV07N3q+I=;
	b=EeqHCikQPBWlCQnKWHkAMooYIpcKJ4+R8bDCmfwMmzWSLHjJ7BzSgBHo28ipbpnk2yReMf
	X37RhuCtVh17nLBw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Derek Barbosa <debarbos@redhat.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Documentation: real-time: Add kernel
 configuration guide
Message-ID: <aan5a0QPKvwk7HF7@lx-t490>
References: <20260305205023.361530-1-darwi@linutronix.de>
 <20260305205023.361530-2-darwi@linutronix.de>
 <aanwC228bGTa38LK@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aanwC228bGTa38LK@casper.infradead.org>
X-Rspamd-Queue-Id: 5F72C218934
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78089-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[darwi@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:dkim]
X-Rspamd-Action: no action

Hi Matthew,

On Thu, 05 Mar 2026, Matthew Wilcox wrote:
>
> On Thu, Mar 05, 2026 at 09:50:12PM +0100, Ahmed S. Darwish wrote:
> > +==============================
> > +Real-Time Kernel configuration
> > +==============================
> > +
> > +.. Add a ToC so that all options can be seen in a glance
>
> Is this a useful comment?
>

I thought I'm the only one explicitly adding a ToC.  A quick grep shows
that to be false so I'll remove the comment.

> > +.. contents:: Table of Contents
> > +   :depth: 3
> > +   :local:
>
> [...]
>
> > +``CONFIG_CPU_FREQ``
> > +-------------------
> > +
> > +:Expectation: enabled
> > +:Severity: *high*
>
> Importance rather than Severity, perhaps?
>
> And high/medium/low rather than high/medium/info.
>

The info sections were meant to provide extra info on the kconfig options
w.r.t. PREEMPT_RT.  So, the CONFIG_DRM entry is not of low importance as
"Importance: low" would imply.  I'll think of something here.

> > +With that in mind, any false real-time kernel configuration could cause a
>
> incorrect rather than false, perhaps?
>

will do.

Thanks a lot,
Ahmed

