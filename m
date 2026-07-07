Return-Path: <linux-doc+bounces-95364-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sh1ZBh73TGrJsgEAu9opvQ
	(envelope-from <linux-doc+bounces-95364-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:54:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9171B914
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:54:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=2Eu4Dk0v;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=WJ1gCCbN;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95364-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95364-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80A14301AED5
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 12:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2410B40D59B;
	Tue,  7 Jul 2026 12:54:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0340D560;
	Tue,  7 Jul 2026 12:54:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428856; cv=none; b=XwfILrU5KeoYXJsIrw5/KMFcABPuFmFqm5gZwRa1Kh6k+nAefgvjB+lB4lhdUM38KyP3x2oEdiTV/HNdHivvq4PJeJ4k72fVhJyEnWoz/RBzxeX/5M1te8FgcN4YIBRVaiNwBTRTaPuaABXAoIN+BhThY4PpDpHgnYOfumMv6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428856; c=relaxed/simple;
	bh=coCOB5qqJ+X+DFURbG7Ogj2VXwfQ4/UW9Uydsi8FxI8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+Iv85R1LUMtN+41YUqQFrwfxRNByMZo/XvzfkqstCqWLhCW/hahmTUSmmCx6EoNU9/xqT4NPI4Rg7QtrHJOpa+EACmn758cvLZ7RwzzYXp3mGiVDqWwpotbKdwnrC9LPpCTN0WKRFoIxHXZDEHjLm/crZ2+zH3lfhc14YBeAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Eu4Dk0v; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WJ1gCCbN; arc=none smtp.client-ip=193.142.43.55
Date: Tue, 7 Jul 2026 14:54:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783428852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/hv61aOydzHugwomfJNYebuZeFTkwhx/1G/+dLQAjA=;
	b=2Eu4Dk0v06ysm21QQr1mFBLNtn+bSKuW3OhImOytu9etUEFCC+cCkkaYxOXV39YPcf3o1t
	Gx83fOV9JLHklzA3T3vX5Tzgqv6wI/f7kjK+NgPh2lzm2Xcv29gzFnB3OlfBmdIJGtB8od
	DWxsVRx8gZbt5WCgqEfXzavgjgK+uqLLQ47Vhx63LmpTo5Zi6LxbJwtc1mh85+jo9yM3Zv
	DjKWNn9OJf1y63RBb72Weuq2QGPIlTnQX9iiq6/NeTixmwvilbd1XrmcrQ2TYq2wLzX38J
	LFJjbdtK0/h7qYyjmCbdlRdAI5ooVRt8bBs7XpzczHhrArizbVa5RG0cXrI1Sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783428852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/hv61aOydzHugwomfJNYebuZeFTkwhx/1G/+dLQAjA=;
	b=WJ1gCCbNJ5O2SpMhyTBakk9vxkDQ3zD9r/Y9ROb779GAJXOW3JWWh29CrUsxt35SkmFFzU
	AsI6rUH/kDVI7kAw==
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
Message-ID: <20260707145411.53a10893@mitra>
In-Reply-To: <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
	<20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
	<20260703165654.71be8707@mitra>
	<CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-95364-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,thegoodpenguin.co.uk:email,mitra:mid,linutronix.de:from_mime,linutronix.de:email,linutronix.de:dkim,i.mx:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FF9171B914

On Mon, 6 Jul 2026 18:05:06 +0100
Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:

Hi Andrew,

> On Fri, 3 Jul 2026 at 15:56, Benedikt Spranger
> <b.spranger@linutronix.de> wrote:
> > On Tue, 30 Jun 2026 17:35:59 +0100
> > Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> > > The printk_delay and boot_delay features are helpful for debugging
> > > as kernel output can be slowed down during boot allowing messages
> > > to be seen before scrolling off the screen, or to correlate timing
> > > between some physical event and console output.
> > By now, it slows down the boot process, which is the handy part of
> > that feature.
> >
> > > However, since the introduction of nbcon and the legacy printer
> > > thread for PREEMPT_RT kernels, printk records are now emited to
> > > the console asynchronously to the caller of printk. Thus, any
> > > printk delay added by boot_delay/printk_delay continues to slow
> > > down the calling process but may not have any impact to the rate
> > > in which records are emited to the console.
> > Using this feature to slow down the boot/suspend/resume process and
> > implicit make printk() happen, is the usefull part of that feature.
> > Imagine this sequence (which hit me on suspend/resume on i.MX after
> > shutting down all secondary CPUs)
> >
> >   printk("A");
> >   (do some stuff)
> >   printk("B");
> >   read from peripheral --> system got stuck here since peripheral
> > was not clocked or powered or both any more.
> >
> > The delay (and later on a ugly patch to make printk() synchrounous)
> > helped to locate where the failed access happend. JTAG did not help,
> > since the CPU got stuck --> no JTAG communication to that CPU.
> 
> I understand the use-case, you sprinkle printk's so you can find the
> point where a read to a register causes the CPU to stop. This requires
> that the printk happens before the read, and the output from the
> printk is printed before the read.
Enabling existing debug features in the kernel was a good start.

> > With your purposed change you *may* see "A", but never "B".
> > Quite challenging... 
> At present you may see 'A' and you may see 'B'.
That's correct. 

> Prior to the changes in this patchset, and assuming an nbcon console
iMX swtched over to nbcon, so your assumption is correct.

> (which may not be your usecase, but is perhaps representative of
> future use-cases), then the printk delay will always happen within the
> call to printk (and always before emitting).
Which is quite good, but can be better. (See the missing sync feature
mentioned in Johns reply)

> However, depending on the context, that printk call may return (and
> proceed to your CPU halting register read), before the message is
> actually emitted to the console. I.e. it's a race.
I am aware of that.

> This series moves the delay to the emit side, as well as moving the
> delay after the emit. Thus the calling code may make progress more
> quickly, but depending on the context, it may also flush/emit before
> returning from printk.
Unfortunately it makes things worse.

> In my view, with or without this series, there are no guarantees that
> you will see 'A' and 'B'. And in any case, achieving the functionality
> for debugging required you to modify the printk anyway.
The "sync" feature is on the TODO list as John mentioned. 

> > So please leave the delay on the calling side - it is helpfull
> > there.
> 
> If you want to ensure printk is synchronous, perhaps you could call
> nbcon_cpu_emergency_enter() prior to your printk, or perhaps there are
> already printk wrappers that do somthing similar whilst debugging?
As said I did an ugly hack and forced printk() to be synchronous.

> Would that provide a more reliable way to guarantee output?
It does.

Regards
    Benedikt Spranger

