Return-Path: <linux-doc+bounces-83247-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDf7OTPh3GmKXwkAu9opvQ
	(envelope-from <linux-doc+bounces-83247-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 14:27:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5DF3EBF74
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 14:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE49C302A532
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 12:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96CF3C3BF6;
	Mon, 13 Apr 2026 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G7BUvZUl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8bmKg/nQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1E3C3BF3;
	Mon, 13 Apr 2026 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082778; cv=none; b=auiTU7LgsYJlkc+JgDixX4xOAEe/Ivo98PiHvh766vG74FnN9PAPFkw0H0nW4MVlRbPum/umisKyawuiZ2bOfY/4Dm1Y8jVHRDl1qXJfF2zP1VwmJi7m8E2nrG18IQumzgeEeNUcyCwdW7p2QcFtroV6aESiOpwpzmdtvTd8MCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082778; c=relaxed/simple;
	bh=RjnzTKbG7xEh8absMbCL/hUpeammtXJxN8xPNWchKTw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y4yzwEzx3H0w6LduwsZHsMhaMus0mdgmRplzTpKx1zJYE8eL3tZ3AA+tSjEJQvywjnqFNLbYzTyq5mfsV3sP2DYiLSROHwJlwu6UCs9xbFOIoLG5OwvK8LR/H/4EyK8Ba7R5GJmnZsNElN/l0K5BickZfuZ//wq7g5kJx5Y84TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G7BUvZUl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8bmKg/nQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776082775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vO4mSf8Hw10ucaiICOgRh2JzFJ2ibaVfHTYyMlOdyQo=;
	b=G7BUvZUlNmU1Xs/h+7mgdGe8bcREY29GxzPQWn4y3+uRMVSzrRmocMBmYbCb6ogIytXyRF
	lGCoabI1UhQu7aVs9C9rD7F1ezJWTkdP3BlZLkEEgsfUK5AD+QqP2LRdQlZSnNwMia608Y
	dFtu72g/H+dgmoTeU0c14ZITfyops37dayf2y/TZxyNO2uU+RJRDiNa0K/H+RSsf06c9f2
	ahHnWEllg5LXYW79I4gmgjG27jUiszf6E9dW9G1L34X/MhlaP00kJ6KT2pZOP5kqieN11p
	PoFM5KDg/l2HUvIVZNmNIKwOOFRBaQHjqwEEzTX3vavtweZChPmXDpcaZu6URQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776082775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vO4mSf8Hw10ucaiICOgRh2JzFJ2ibaVfHTYyMlOdyQo=;
	b=8bmKg/nQOm+/7a7BbXsa1SRg1eQntC9nXljzz7FlO7QB+JbrOSYLokz5BfMTtARh6Po6lt
	BAQgljvmvVthPEAQ==
To: Valentin Schneider <vschneid@redhat.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
 Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>,
 Jonathan Corbet <corbet@lwn.net>, Ming Lei <ming.lei@redhat.com>, Thomas
 Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
In-Reply-To: <xhsmhlderi1f6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <xhsmhlderi1f6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Date: Mon, 13 Apr 2026 14:25:34 +0206
Message-ID: <87zf37f3xl.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83247-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jogness.linutronix.de:mid]
X-Rspamd-Queue-Id: 8E5DF3EBF74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-13, Valentin Schneider <vschneid@redhat.com> wrote:
> On 01/04/26 13:02, Sebastian Andrzej Siewior wrote:
>> One more point: Given that isolcpus= is marked deprecated as of commit
>>    b0d40d2b22fe4 ("sched/isolation: Document isolcpus= boot parameter flags, mark it deprecated")
>>
>> and the 'managed_irq' is evaluated at device's probe time it would
>> require additional callbacks to re-evaluate the situation. Probably for
>> 'io_queue', too. Does is make sense or should we simply drop the
>> "deprecation" notice and allowing using it long term?
>
> AIUI the deprecation notice is more for isolcpus=domain, i.e. the scheduler
> part, but it's still relevant for e.g. managed_irq.

If that is the case, then the deprecation notice should explicitly
target the "domain" flag. Also note that "domain" is the default if no
flag is specified, so it is a bit messy. It is odd to deprecate a
(default) component of a feature and not have a plan how that component
will ever be removed.

The documentation of "domain" already strongly advises to use cpusets
instead. Is that not enough? If so, the deprecation should be dropped.

If there is a strong wish to remove the "domain" boot functionality,
then there should be a new boot arg that can be used for "managed_irq"
and "nohz" features, i.e. get users off the deprecated isolcpus so that
isolcpus can log deprecation notices and be removed someday.

John Ogness

