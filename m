Return-Path: <linux-doc+bounces-95657-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n6b7GR0ITmrgBwIAu9opvQ
	(envelope-from <linux-doc+bounces-95657-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 10:19:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297D723148
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 10:19:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=wJBs5RQX;
	dkim=pass header.d=linutronix.de header.s=2020e header.b="owmvoh/a";
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95657-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95657-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 988A13016B69
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 08:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BD3401A01;
	Wed,  8 Jul 2026 08:19:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAAA3FFFAD;
	Wed,  8 Jul 2026 08:19:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498762; cv=none; b=heiz7LR+K/YWvN3Ou/I2spQAB+FE4RaFrBWiweNkRe3HtSoMeer64RGFiE4ASV0G/ul2Pa+mScy06AuX9K3QeboU/48xUoFz4rdBRcoSSv8nC35hMI6n05bnceHi4B73gIAB7qmCz6DyJOavjL7HYPoc60vMU5OUwwf2N8FHd90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498762; c=relaxed/simple;
	bh=gZ6EGVdglCOnyc/AOvxTG7LM7fKUZ+QO35hojCNmdkw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OhuJ/kzziZpdRP+fo7WG9RcrRN0FosjQcZMJrYXuOVlHf/c4MAkPOgIrHV36JMKVfFJVX8ON6LIC4SYHBO1AR3s4G+yWyKVp9JANavjE13YkncQqBhvOiioOl5grz+X9bxlKNNt2mQA2N13waA+cEc3pG0YUQa/aiOMcCYmJMy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wJBs5RQX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=owmvoh/a; arc=none smtp.client-ip=193.142.43.55
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783498758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QolbbD7v24l2Rpfdio7tLgTKClqjgFar5mCZ10xege0=;
	b=wJBs5RQXT93Rj0WQ3W2UjXnibxsqiLbIDJ2EExwrm6HAo2pk85TctpHJuBEmV3aPxRE9/+
	19IRZLp6+KLkGFv2vkCAdxikItD94lX8SW0t9VBsENgq/RFDWiL/1mTGYkXdsnO8uNoGcb
	jkv91w7AT5oFaWCs74R4FpDddKUEoKjxzz0r5/KqtkOuhc3PfY5r9pAnBJwLgU25a1T4Om
	7vQc756+Oohnbzd99zjRZwS66PsQ4PhS+Nnp+PlTyKJ11UZGzMMGc/RbPU3jrCdc322tXl
	960SCdCYyRppgg5LYoxF+P8+vI/vMmSWTh7R4nkvO2zFL4Mj4nQXr1P46bg0/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783498758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QolbbD7v24l2Rpfdio7tLgTKClqjgFar5mCZ10xege0=;
	b=owmvoh/axlZIXsleVK++YNkeWnMsI1p5SL4D8lv15ClKwUy3AitASqBmYXqrSfVTEJkmSI
	Du20Yva8X9oSBkBg==
To: Petr Mladek <pmladek@suse.com>, Benedikt Spranger
 <b.spranger@linutronix.de>
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
In-Reply-To: <ak0VguIf-PxmbUOS@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
Date: Wed, 08 Jul 2026 10:25:17 +0206
Message-ID: <87qzldvqpm.fsf@jogness.linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95657-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,suse.com:email,linutronix.de:from_mime,linutronix.de:dkim,jogness.linutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0297D723148

On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> To summarize this discussion:
>
>   + Benedikt would prefer to add the synchronous mode before
>     moving the delay from the printk() caller to the console emit
>     code path.
>
>   + The delay in the printk() caller code path did not guarantee
>     the output but it increased the chance to see it.
>
>   + The synchronous mode will be even more reliable than the delay
>     in printk() caller path.
>
> Please, let me know if I did not get it right,
>
> John, did you have any plan how to add the synchronous mode, please?
> Does it look complicated?
>
> I guess that we would somehow need to "mis-use" the emergency
> priority and force it everywhere by some global system setting.

The synchronous mode would rely on the driver being nbcon. I envision
something like this:

---- BEGIN SYNC IDEA ----
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2fe9a963c823a..beb5bb3c037b5 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2456,6 +2456,8 @@ asmlinkage int vprintk_emit(int facility, int level,
 
 	if (ft.nbcon_atomic)
 		nbcon_atomic_flush_pending();
+	else if (have_nbcon_console_sync)
+		nbcon_atomic_flush_sync_pending();
 
 	if (ft.nbcon_offload)
 		nbcon_kthreads_wake();
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 4b03b019cd5ee..8f8f29f757614 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 	cookie = console_srcu_read_lock();
 
 	flags = console_srcu_read_flags(con);
-	if (console_is_usable(con, flags, false)) {
+	if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
 		/* Bring the sequence in @ctxt up to date */
 		ctxt->seq = nbcon_seq_read(con);
 
@@ -1654,7 +1654,7 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
  *					write_atomic() callback
  * @stop_seq:			Flush up until this record
  */
-static void __nbcon_atomic_flush_pending(u64 stop_seq)
+static void __nbcon_atomic_flush_pending(u64 stop_seq, bool sync_only)
 {
 	struct console *con;
 	int cookie;
@@ -1666,6 +1666,9 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 		if (!(flags & CON_NBCON))
 			continue;
 
+		if (sync_only && !(flags & CON_SYNC))
+			continue;
+
 		if (!console_is_usable(con, flags, true))
 			continue;
 
@@ -1688,7 +1691,12 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
  */
 void nbcon_atomic_flush_pending(void)
 {
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
+}
+
+void nbcon_atomic_flush_sync_pending(void)
+{
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
 }
 
 /**
@@ -1701,7 +1709,7 @@ void nbcon_atomic_flush_pending(void)
 void nbcon_atomic_flush_unsafe(void)
 {
 	panic_nbcon_allow_unsafe_takeover = true;
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
 	panic_nbcon_allow_unsafe_takeover = false;
 }
 
---- END SYNC IDEA ----

BTW: The sync mode is the final piece so that PeterZ can start using
mainline code for debugging by serial instead of his own workaround [0].

John

[0] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=debug/experimental

