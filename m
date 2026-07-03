Return-Path: <linux-doc+bounces-94855-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kIM3FgTPR2pvfgAAu9opvQ
	(envelope-from <linux-doc+bounces-94855-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:02:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B902A703AE9
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:02:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=N8pSrHEf;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=n1QKGeso;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94855-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94855-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC7EC3012EAA
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 14:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BCF3DD852;
	Fri,  3 Jul 2026 14:56:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EE2346FB5;
	Fri,  3 Jul 2026 14:56:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090619; cv=none; b=KPGtFN0uhTw5bbCjbtsVEMuZAcxVmq/N9f/6iQYH/XzuNPYblvnZlDrO5IJ0xk3bqnEn8nqKwvM17s/+MtOI60YOMBBtMNRXVrpu8e2OCMEde38wyGRlVoJXJ+wkPUVwetG/lCCFpNm8CVhEEzxLQOYJt4ZK8cUckvgg5H5bnGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090619; c=relaxed/simple;
	bh=M1GUwna4gUioTCqZ3drFdqpZNEmjfWoGLhtUB9HEaF0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1LhMb6kc4rhlkKcHwNJtiMZTgg6sh6O6rVMilQgl2qI9CZxu0aQ3cD2cvw93U5Lf4Zqpi+oPeCz1qgMF8Kg+Ngdx0PR2e7PN7daRQERSjwJyHz+8gvJn+t1vJDruREZMw/kwq7L64aP0CGOBz5l04MRIykaGaiaXJgxgP2Bl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N8pSrHEf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n1QKGeso; arc=none smtp.client-ip=193.142.43.55
Date: Fri, 3 Jul 2026 16:56:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783090616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhzwfdKhTuMTAOcT4iD8RFsrIkmNOcMgyrA0M5/090s=;
	b=N8pSrHEfmQ0nIHyuLnBq7B9PeE26JJ6i6JuUNkB6AErxg1ZsJZrYjXpUiRBwV6WTy/kArw
	gLrBYbX5ujE+pMhJ+nz/vQIuptan7+PiNQr91clPODzPGyuOKXMAT4jBJmCAZTBgW6rwO0
	WTnkL3W5JRHjS4kJxy6nSRgDh8vcgGISPieH12Rmd8dhkxiwSh2m6R0k8h3P1g6LLWMZ9q
	qU10psMDI6xYcKMsz/PDAcWF5XlwCFt1O1jVVeWkpED0utDp/dJU6w4P90MreD/L6Ir5Cw
	/pp4RYdshAADZuypWEakuuPcxoIxO8Ezm927mKygUFM+/DTcGDll/4WpQO+QHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783090616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhzwfdKhTuMTAOcT4iD8RFsrIkmNOcMgyrA0M5/090s=;
	b=n1QKGesoiWFZPHP7w3oYq8LG0f80nKkIcc2D5Au3fKdGTMx5zz0lcAroYrnAoT2K0UOqdd
	F2VnPZHabXxb0PAw==
From: Benedikt Spranger <b.spranger@linutronix.de>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <20260703165654.71be8707@mitra>
In-Reply-To: <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
	<20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
Organization: Linutronix GmbH
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:amurray@thegoodpenguin.co.uk,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:pmladek@suse.com,m:rostedt@goodmis.org,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:akpm@linux-foundation.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rdunlap@infradead.org,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[b.spranger@linutronix.de,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94855-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b.spranger@linutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thegoodpenguin.co.uk:email,linutronix.de:from_mime,linutronix.de:dkim,i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B902A703AE9

On Tue, 30 Jun 2026 17:35:59 +0100
Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:

> The printk_delay and boot_delay features are helpful for debugging
> as kernel output can be slowed down during boot allowing messages to
> be seen before scrolling off the screen, or to correlate timing
> between some physical event and console output.
By now, it slows down the boot process, which is the handy part of that
feature.

> However, since the introduction of nbcon and the legacy printer thread
> for PREEMPT_RT kernels, printk records are now emited to the console
> asynchronously to the caller of printk. Thus, any printk delay added
> by boot_delay/printk_delay continues to slow down the calling process
> but may not have any impact to the rate in which records are emited
> to the console.
Using this feature to slow down the boot/suspend/resume process and
implicit make printk() happen, is the usefull part of that feature.
Imagine this sequence (which hit me on suspend/resume on i.MX after
shutting down all secondary CPUs)

  printk("A");
  (do some stuff)
  printk("B");
  read from peripheral --> system got stuck here since peripheral was
  not clocked or powered or both any more.

The delay (and later on a ugly patch to make printk() synchrounous)
helped to locate where the failed access happend. JTAG did not help,
since the CPU got stuck --> no JTAG communication to that CPU.

With your purposed change you *may* see "A", but never "B".
Quite challenging...

So please leave the delay on the calling side - it is helpfull there.

Regards
    Bene Spranger

