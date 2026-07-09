Return-Path: <linux-doc+bounces-96001-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8hWTHNrAT2p4nwIAu9opvQ
	(envelope-from <linux-doc+bounces-96001-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:40:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E6733076
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:40:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=yPxeCtv7;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=bvJKA43v;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96001-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96001-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD1A5302D4E6
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 15:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D24E364E92;
	Thu,  9 Jul 2026 15:21:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B236680C;
	Thu,  9 Jul 2026 15:21:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610476; cv=none; b=WyBZsIOqM40P3jhCF3S+7J+Tlpc2i7Nzl2wqw+nOVfcPHWuQwS4E5lIlcFV7iZc8FHhllC4VGpCrdKY3Zsfg8Hv4l96cFu0EWuozf/UStjyBn8SVjKtAz8WDbvAToeY9FbpQayoT7V5xK/fKmFz0gzJgEOQ0wUoyVkyVaeqHKZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610476; c=relaxed/simple;
	bh=9+/P+XHbUPLPWvGhwXv03lbgWUb5sN9SZqDazJvnm5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t8iyKW3KhwFci69Mw6fVPpxkkfKQCqhRPK02lX80OiC91TxKM9oGSo9Wf09FrlSTSj5oTnteKyl2Y1Y2OyMoF2iAslWLt6MflQZlaroJXgus/rWfzFSh1DASzijaWSi0EXdqb3rxBrTtaM4tLz0GybLm2PPKwmvGhZmOvqeOQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yPxeCtv7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bvJKA43v; arc=none smtp.client-ip=193.142.43.55
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783610472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCvSGqbhj9/NhLA9ZbyAvA3dzoWQlSiAOLf8QjRL6Pg=;
	b=yPxeCtv7/v66gXx/D1fcRyKL1cphG+7D0+7gfqZuKG5TY3Lov3QxQicfiad2nf95WZilHe
	utDBJu89JL2Yz1xzvn/CqzATfh6OfU3NW4XH6tUL20l0tUE6yLZmhCajmqCiAIoLuyidOu
	D8WEMvAyXq7HJgmxiCJGnfYrMBsKrUU4S4Q1dGOk3PQZXhKlYD6v/GtkW2umOKDT5gsa30
	bxorj8UIbFEVTJRuPqQUX4Jje9dRhNgU9ho6TNhTcp1wnYlbMV1vsk/amHvLmPc0SOkf2f
	HCCzJjeXFQkCmLlYzKz8xyqkS4oA8LMfUjMKTsFtMNcH92sx+hk/Yq8JPgCduQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783610472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCvSGqbhj9/NhLA9ZbyAvA3dzoWQlSiAOLf8QjRL6Pg=;
	b=bvJKA43vE00gb5w8aGww1E5ceOM62dgrQ8tJ096LJSDDO76decZm7uufcWpQd/8ogpAWkH
	+ZRzcy3uOwxnWTAg==
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Petr Mladek <pmladek@suse.com>, Benedikt Spranger
 <b.spranger@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
In-Reply-To: <CALqELGx+7RSKL0+kdOxu0TpXaOifYkzxmOTv+4gTSHqrbLEJ5Q@mail.gmail.com>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de>
 <CALqELGx+7RSKL0+kdOxu0TpXaOifYkzxmOTv+4gTSHqrbLEJ5Q@mail.gmail.com>
Date: Thu, 09 Jul 2026 17:27:11 +0206
Message-ID: <87jyr4jijc.fsf@jogness.linutronix.de>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96001-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:amurray@thegoodpenguin.co.uk,m:pmladek@suse.com,m:b.spranger@linutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:rostedt@goodmis.org,m:senozhatsky@chromium.org,m:akpm@linux-foundation.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rdunlap@infradead.org,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[john.ogness@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,thegoodpenguin.co.uk:email,linutronix.de:from_mime,linutronix.de:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 622E6733076

Hi Andrew,

On 2026-07-09, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
>> The synchronous mode would rely on the driver being nbcon. I envision
>> something like this:
>
> Is it possible to apply synchronous mode for both nbcon and legacy
> consoles?

For !RT, legacy consoles are already "somewhat best effort"
synchronous. I really do not want to try to somehow improve on that. Our
goal is not to improve legacy, but to get rid of it.

> For the debugging case Benedikt suggested (is this the main
> use case for this feature?), it would be helpful if a developer could
> indicate a preference for synchronous mode without first determining
> the console type.

The developer is free to add ",sync" regardless if it is an nbcon or
not. My sync series (which I am currently testing) will simply give a
boot message that the console does not support sync mode.

>> ---- BEGIN SYNC IDEA ----
>> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
>> index 2fe9a963c823a..beb5bb3c037b5 100644
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -2456,6 +2456,8 @@ asmlinkage int vprintk_emit(int facility, int level,
>>
>>         if (ft.nbcon_atomic)
>>                 nbcon_atomic_flush_pending();
>> +       else if (have_nbcon_console_sync)
>> +               nbcon_atomic_flush_sync_pending();
>>
>>         if (ft.nbcon_offload)
>>                 nbcon_kthreads_wake();
>
> My interest in misusing (not proposing that as a solution) the
> emergency mode, is that the flush mode is nicely abstracted by
> printk_get_console_flush_type. Depending on how you trigger the sync
> mode, could printk_get_console_flush_type be expanded to look at a
> flag and return ft.legacy_direct, ft.legacy_offload or
> ft.nbcon_atomic_sync ?

Yes, I could do this, although it would only be "usable" for the
vprintk_emit() case. For the other two call sites:

nbcon_kthread_should_wakeup()
nbcon_device_release()

it would still need to be a @flags check because it is about a
particular console.

Of course, we could make printk_get_console_flush_type() per-console,
but that would be a considerable semantic change that would require
quite a bit of refactoring.

We can continue this conversation once I have posted my sync series.

John

