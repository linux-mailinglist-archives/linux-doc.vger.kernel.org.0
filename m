Return-Path: <linux-doc+bounces-95731-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YtqfObZrTmp+MQIAu9opvQ
	(envelope-from <linux-doc+bounces-95731-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 17:24:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E6727F62
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 17:24:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=WpLRTgKv;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=t9ji51pJ;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95731-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95731-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E807131E3E89
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 14:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE0247886E;
	Wed,  8 Jul 2026 14:54:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC1A47CC85;
	Wed,  8 Jul 2026 14:54:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522444; cv=none; b=Tm6+D46d2JCy4BrZ03+bjEjuMAm3rup+k7IGUQNHO2fqqLXHVLFk1yNb3tpEusiCwTqGOXEhnbevXkijScsa8oW+NGG1Z6yIE9PRiZGX1A3GlLwnQ2WyN6y+IYYiksFgOgH3hQYWq8W2zyy17Xh1G5g7dI2Q3FDQBSEzOPhIkzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522444; c=relaxed/simple;
	bh=ZR9JzMNshGYeFuHvZKFIl3qBflNkGq9LavCpGJg7rqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=baWDohUv4LoBXEguPOdMavzzdgNHDrHSRUEvaCPjh8kfJ8j3zne9CIDWf9MvIPy4T4la8xNBcELwCC7zmZNfVB8XVfnfpwBZMXu3PYa/1alr+uVlaYm2BZ8ofvA44NvMOTFULT781Pim+DgzY/Ez/dG7YfRT8xH6ALZw8U4oyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WpLRTgKv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t9ji51pJ; arc=none smtp.client-ip=193.142.43.55
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783522438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3VGnXCa8/+c+qXxxpDN0SzecjTWYnKYnTQWIaynhzc=;
	b=WpLRTgKvqxcp6FYh952df/n+IomBdU93YPgLSN0mmevxMFmXWgFd6nWPQeIA3zWNoP6kSQ
	neIkQIOanLS4Ekt9VH9fQ3iHSMv3O3Pm3mJnFQDYq1dhAnnnyJY0A/t+Mxs7rYQhMeqAZS
	EyWQ9u1VfKxeJKJCCtpn8Xy4TPtvbTg5IdKsUT4MiY4e4w5zUGLC/HGAABQMtkyYEpRZF2
	aK7IOmVyQwpAD9RutNxvz6NZ1jY2yitTw75cEQmd/84vJI2Y00+RszK5YoHyAc01DLWwxz
	vLlOruTCeeNYWHe22uiI9yc24cwBOV/ejJ8W2e4bA9BXu+cMRrlwlVb4hf8qIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783522438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3VGnXCa8/+c+qXxxpDN0SzecjTWYnKYnTQWIaynhzc=;
	b=t9ji51pJCgLujO8YuF77uRSc/fBfpumhfWE8RcPnNA3u0g700c6Qp+4PIL1DE10oy4ZDiT
	BfnkJjMTr5jmJlDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Benedikt Spranger <b.spranger@linutronix.de>, Andrew Murray
 <amurray@thegoodpenguin.co.uk>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Steven Rostedt
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
In-Reply-To: <ak5eCp5qw9LYrnAH@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de> <ak5eCp5qw9LYrnAH@pathway.suse.cz>
Date: Wed, 08 Jul 2026 16:59:57 +0206
Message-ID: <87zf01ttve.fsf@jogness.linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95731-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:b.spranger@linutronix.de,m:amurray@thegoodpenguin.co.uk,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:rostedt@goodmis.org,m:senozhatsky@chromium.org,m:akpm@linux-foundation.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rdunlap@infradead.org,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F0E6727F62

On 2026-07-08, Petr Mladek <pmladek@suse.com> wrote:
>> The synchronous mode would rely on the driver being nbcon. I envision
>> something like this:
>>
>> ---- BEGIN SYNC IDEA ----
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
>>  	cookie = console_srcu_read_lock();
>>  
>>  	flags = console_srcu_read_flags(con);
>> -	if (console_is_usable(con, flags, false)) {
>> +	if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
>
> The dependency on con->flags means that the sync mode can be entered
> only in task context where synchronize_srcu() can be called. It might
> be good enough. But I am afraid that people are creative and would
> like to have even atomic variant sooner or later.

You mean it can only be _modified_ in task context. Yes. I expect it is
either specified as a boot arg or modified via some sysfs interface.

> Also it will do the flush in NORMAL_PRIO which is good. But it might
> fail to get the context ownership when it is blocked, for example,
> by uart_port_lock() which might be even sleepable context in
> PREEMPT_RT kernel.

Indeed. This is the same limitation of the atomic printing in
general. But I do not think this can be worked around during normal
operation. Ignoring locks is not an option.

John

