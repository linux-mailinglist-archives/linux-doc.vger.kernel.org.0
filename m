Return-Path: <linux-doc+bounces-95735-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id obkDL8JwTmonMwIAu9opvQ
	(envelope-from <linux-doc+bounces-95735-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 17:46:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B326972837E
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 17:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b="k9ZY/UxC";
	dkim=pass header.d=linutronix.de header.s=2020e header.b="ZoeU5/gX";
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95735-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95735-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0CB0312266B
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 15:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F4E3F12FF;
	Wed,  8 Jul 2026 15:24:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F453806BD;
	Wed,  8 Jul 2026 15:24:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524265; cv=none; b=iWDixOi1q95mlYjf9IDOM7xp57P01xxw944lhzUrpNVa+33MuEcY0k7C79oQasDLYPWSmQfLLOclPVhlRY977Kq8mJUy34ahXUoxyFTPM3W4JN6WnGea4FlLtOFR7xwwyPZSfXj9olK+JRhWgxfbOy3NLNFSyD4c1lNTflMSvdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524265; c=relaxed/simple;
	bh=jglJtMgeUyWa6n8zEnVsMKXnKVEICn3GMbuj/cxnkgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XiXmj2p6mD+mevZk96eZlDznpmjSqKU6CJVtwVEqVTRMfwaK2cv6wuraUUHeYJZqWqsE6macy4lnyF/2hbGGpiVLYa/Jmxh4669oUvxE7BhgVdPMnfFzyps4hENyf/WdWD87QoUM2UOEURITUdNyE8OTAN6/IVcnnvL9o0L64r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k9ZY/UxC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZoeU5/gX; arc=none smtp.client-ip=193.142.43.55
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783524261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jglJtMgeUyWa6n8zEnVsMKXnKVEICn3GMbuj/cxnkgk=;
	b=k9ZY/UxCZbSsH/rc098SAyI0bHPPVWzpzgVkApB/wzpkIFccGmCq0YuqclYloDvH2whtVC
	D6M8VQKt1J/GEhjkE6EU6pykSuTzEDJkT30cJmyOoq+VJnkxR/1gwpow2xbVo1gB5OYyfM
	RaYcJ8gf8UA+5LbL5eSEzjavxm2tQ3rIwkFzunJPiVpKsHjyeegej20TOmCwX1IaL42MuF
	kz7ORl1WHlQTc/2dcbDhcP3YWj27KZ0IXKpsoYCGb8fwlRr5HJ8QGa6+nRMGgVg1UXiYv1
	+Dol3Li2DRlD9zzI879vxtof5+fQy9S1t8XYz0IOfCFmmdo5wFFv+uTfzKBQ7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783524261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jglJtMgeUyWa6n8zEnVsMKXnKVEICn3GMbuj/cxnkgk=;
	b=ZoeU5/gXaDY/oKKzK/5TkBRN6U5CpSFPHCR1L5QTwxQPs68Awdxbr1e3D7rkoeiasUdje8
	NeyuTroDF3XyJvCA==
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
In-Reply-To: <ak5oFk3Snnt9Wr95@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de> <ak5eCp5qw9LYrnAH@pathway.suse.cz>
 <87zf01ttve.fsf@jogness.linutronix.de> <ak5oFk3Snnt9Wr95@pathway.suse.cz>
Date: Wed, 08 Jul 2026 17:30:20 +0206
Message-ID: <87wlv5tsgr.fsf@jogness.linutronix.de>
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
	TAGGED_FROM(0.00)[bounces-95735-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B326972837E

On 2026-07-08, Petr Mladek <pmladek@suse.com> wrote:
> Now, the question is how to move forward. It would be nice to
> have the sync mode available before we add this boot/printk_delay
> clean up.
>
> Would you have time to prepare and send a patch anytime soon, please?

I can work on this this week.

> Or I wonder whether Andrew Murray might try to create a patch
> based on your "SYNC IDEA".

I expect that the two series will not conflict. I am just adding another
atomic printing path, but the Andrew's delay is implemented deeper.

John

