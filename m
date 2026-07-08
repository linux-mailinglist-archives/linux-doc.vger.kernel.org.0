Return-Path: <linux-doc+bounces-95676-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EGz1OsMpTmpqEQIAu9opvQ
	(envelope-from <linux-doc+bounces-95676-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 12:43:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E1724711
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 12:43:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=Gb3HtCoK;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=fRArbuaP;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95676-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95676-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9BF43082614
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 10:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033603BD654;
	Wed,  8 Jul 2026 10:36:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D93B27CC;
	Wed,  8 Jul 2026 10:36:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506998; cv=none; b=BCu9T2SfHsmhTmO+3YSAGbpxdEqsV5LMLbaECq9XPEGGuCTRZT/9nvfj6wk+Pfl4Gp1CPcAPxyQRZV3ncQUAZFim6YghrFeVV2wS2L7XE9ymBjyG0itRr7psxFmvln0laN8imsNXgPRRVSCF9+Em/0nNHkQfXOeqIr1aRojZwj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506998; c=relaxed/simple;
	bh=CptA4H/0yTvtYAkCQi2Kx0njcJk4uT/iLYE9SPVIZgM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tCveNkeQZKNP0Kjr/aVVDi4v0B+otfmjlH6Pk5w9v6AQZncf1tsEDNrWdmM7wD93GXW6Z2/Rq4d0jJZAxCLvX0VwAK5l1MN1vS+yA40dT4VLJYKX4W6YGPaScQ8OAkNu6KE0RRXN+3PkievMHnu+8Gg0eyj2lYaCTFcXZ6BQZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gb3HtCoK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fRArbuaP; arc=none smtp.client-ip=193.142.43.55
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783506983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4oSZ0VvgFHGlDOd8o6hkiwFx03nfgdvtHM1XfLEEIwY=;
	b=Gb3HtCoKx6JK0GUWAyn+2ejS0xH2woEWxw3+K/nj2+wIJBR7fWvEPMFvFkyMvlwrSHvH3y
	eYqC9WH6f0zAbTbuXVSWvtLBe4ST35ka3Sx3qaoz/My1koLC2UrFc5rGvE+V0VwrOd6njF
	/6QPl/3E393XAhbRW6KoVsP/8FRAxYG9XY/ou3u5uSQQnxhnOp9j85d7VB+TGEBiacExE3
	xJRbPhjE0DAIxiNex0yDdcKTec11EZmdD/YpK0wBUMeLP0I3e2YCMqu/Pyf5yPUyWPHO70
	yB/zK+5LOoE4/L0SthgVe+xva8k3B7NyCM772BL/6skjkpHuTGfdHgW9SEka3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783506983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4oSZ0VvgFHGlDOd8o6hkiwFx03nfgdvtHM1XfLEEIwY=;
	b=fRArbuaPMd9AD20Wgcx6lGklXPR5RU5QhFZJ34To/S8oQ81VuWWkxh+y3qq05R2rkX18yj
	OVN5nvYiWZtrpKCA==
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
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
In-Reply-To: <ak0b2S9jjYy49a8V@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de> <ak0b2S9jjYy49a8V@pathway.suse.cz>
Date: Wed, 08 Jul 2026 12:42:22 +0206
Message-ID: <87echdvkd5.fsf@jogness.linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95676-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:amurray@thegoodpenguin.co.uk,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:rostedt@goodmis.org,m:senozhatsky@chromium.org,m:akpm@linux-foundation.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rdunlap@infradead.org,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,jogness.linutronix.de:mid,vger.kernel.org:from_smtp,linutronix.de:from_mime,linutronix.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 463E1724711

On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
>> This is too deep (also pointed out by Sashiko) because it multiplies the
>> delay times the number of consoles. For the legacy printing, it would be
>> more appropriate to put the delay inside console_flush_all() and
>> legacy_kthread_func().
>
> True. The question is if the proper solution is worth the complexity.
> We would need to pass the information down two level of the API.
> It would require adding a new (output) parameter to console_flush_one_record(),
> nbcon_legacy_emit_next_record(), and console_emit_next_record().
>
> It is not that complicated but these functions are already hairy
> enough so we should be careful.

Fair enough. But then it should be consistent and
console_emit_next_record() should perform the delay before allowing the
handover. Something like this:

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a..62fd6a5ebef66 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3161,6 +3161,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		 */
 
 		con->write(con, outbuf, pmsg.outbuf_len);
+		printk_delay(false);
+
 		con->seq = pmsg.seq + 1;
 	} else {
 		/*
@@ -3182,6 +3184,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
 		printk_legacy_allow_spinlock_enter();
 		con->write(con, outbuf, pmsg.outbuf_len);
 		printk_legacy_allow_spinlock_exit();
+		printk_delay(true);
 
 		start_critical_timings();
 

John

