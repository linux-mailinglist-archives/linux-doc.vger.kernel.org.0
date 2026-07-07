Return-Path: <linux-doc+bounces-95317-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tRkOFwywTGqdoAEAu9opvQ
	(envelope-from <linux-doc+bounces-95317-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 09:51:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA81718AF7
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 09:51:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=U9cHDJFc;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=Jfyuvjvx;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95317-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95317-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDD4730D4645
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 07:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6237B3E44F6;
	Tue,  7 Jul 2026 07:34:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65F3E1CF8;
	Tue,  7 Jul 2026 07:34:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409687; cv=none; b=Z4k3Ewp7cfEq2bFkuadubsCfoz5Qu4oM3ug8La4BeW+o55PcQGa/NbKCmq8idHMyk7/FCLNJQs9Lmk6SADvj2vT8A9Wh83iQX+j+NLaNo5OdTdF5XxA0Z7OLBBKyd6DRHG/xOQl/i0K34AKMpcApqSuxMxbmn9hWv54G3WdQV4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409687; c=relaxed/simple;
	bh=eVBUvk2HeOdPMHJi8L6s75rK4fBnEyioWJyfx3jmr2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KIqqnngBgCsdcV7KO+HMl6ymaa5qtcN+cizs96i0y9MySBowQl+7I/Cuo04MC1fTNdAZxKMOm0f7RuJqBrnKZqqaf0F9MP03zJn6VSrOD2NoE1dxQB9UVfSK/QYcJsjajFbhjPZhh0mbYGhdvu7YuSNXlzXTE7sXnpGD/KMfM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U9cHDJFc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Jfyuvjvx; arc=none smtp.client-ip=193.142.43.55
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783409683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVBUvk2HeOdPMHJi8L6s75rK4fBnEyioWJyfx3jmr2c=;
	b=U9cHDJFcF1QpvYrDFUD6MqCUvemr+Vje2i+DqqGv8xd1Ki00vd+KACHvdJonZln3Y49Pz3
	N7hRQaLAhFMw7x1Kn7M1bn/dtJg0ZqWS69im5CzdzGj2ZbbVul1g/nYdsHxNH37+WYYyX/
	X+XPudfWgBgb50E5wXdHcDJa4sCxj2WDUMozF95EjzdniSlxWJuELbZIKdD0lNoCNMa8hS
	I5u0jVESiyqMdSVp0f1Qi9Q3PyJ5ahWkyEWUCUCwMI4ATJXKLPXTuF+YqGGLc4AnQP0jI9
	sdRpMRRXiIYWJTAALV9I1srv6/Rof1vkytGh8cQPpcSAI07EPis7hEEEiMW5rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783409683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVBUvk2HeOdPMHJi8L6s75rK4fBnEyioWJyfx3jmr2c=;
	b=JfyuvjvxrT3XGYd9kFjwL0uQCJrx4fD2DoLY893ymiqgCImR5kcUVOWwHct8QND/ZJ697g
	bHGL2lka2Vdmb2Dg==
To: Andrew Murray <amurray@thegoodpenguin.co.uk>, Benedikt Spranger
 <b.spranger@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
In-Reply-To: <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
Date: Tue, 07 Jul 2026 09:40:42 +0206
Message-ID: <87v7aruub1.fsf@jogness.linutronix.de>
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
	TAGGED_FROM(0.00)[bounces-95317-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:amurray@thegoodpenguin.co.uk,m:b.spranger@linutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:pmladek@suse.com,m:rostedt@goodmis.org,m:senozhatsky@chromium.org,m:akpm@linux-foundation.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rdunlap@infradead.org,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:from_mime,linutronix.de:dkim,vger.kernel.org:from_smtp,jogness.linutronix.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,thegoodpenguin.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEA81718AF7

On 2026-07-06, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> If you want to ensure printk is synchronous, perhaps you could call
> nbcon_cpu_emergency_enter() prior to your printk, or perhaps there are
> already printk wrappers that do somthing similar whilst debugging?
> Would that provide a more reliable way to guarantee output?

Note that it is planned (at least on my TODO list) to introduce a "sync"
option for consoles for exactly this purpose. I talked about it here
[0].

John

[0] https://lore.kernel.org/lkml/87a6wez9s4.fsf@jogness.linutronix.de

