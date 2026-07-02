Return-Path: <linux-doc+bounces-94521-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f1DqLO0SRmoHJQsAu9opvQ
	(envelope-from <linux-doc+bounces-94521-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:27:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B376F428C
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:27:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=YDH7qtKI;
	dkim=pass header.d=linutronix.de header.s=2020e header.b="nXozbYa/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94521-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94521-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AC433019BA3
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 07:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B650338D412;
	Thu,  2 Jul 2026 07:25:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F591384CD1;
	Thu,  2 Jul 2026 07:25:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977115; cv=none; b=qWzY9HIRefB1kc6W0ypukP6sVXCoCATAWD/NnYeSO84vLIm6cxWUOv8MWP4nID6YvPVGSR/c0YIbZ4RK1/Gw0E8ZytraigxBHSDbfEAMg6Saf0tDfTzd7GeSEuwmc9wepxQXkA8BPQJH1KPh2BOtZBgaJTuNgP7rlyGsOLenfkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977115; c=relaxed/simple;
	bh=n5z5qTTSNqAD50MPpfCiszBt8jZfAmtR/DrzWObXh3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BiFI4/F7dHka+o5fOAriOYAQ5o+OOSijQY4QKPGOVamndHhgTJxaG3y2cK4AWcpSfR409gbLmYhuDi9Ydp6wazW5TdsHx3c7GyFmLEXSuN7o7ejrVus+uCPBgs4PkBQwOs0XqVHgNMauoYLIjuyDdclz4JBELr5dViLb9gCp9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YDH7qtKI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nXozbYa/; arc=none smtp.client-ip=193.142.43.55
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782977112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aEfPBz8t091mK8M23TmUS5ueXhjrCz5llTnQK6R0sfQ=;
	b=YDH7qtKI8zSAy+ZaxsMjxQaDi+56XZKBzp5q22tDg/9ixi5f/r4vFvIGJ5DFf6Yx38JXsk
	uuK48YPGajxY0nly5PF2pi672tYck4ftjwWHhURXAPIOxo8InlNPe88fd76h0PC1gALrHu
	gebsiL/iCgewJW1cLrnc403G0Uyw+QFB8JhnWTlA/LnWXnX9d0rxiAREwxNbc/7NrJcg/Y
	Dn157DyFw9kAsunHruBdRMtlkafTYxewlLPMhSyf35ch4GjwEf3pV6lSAQoJUN3yfrfc6L
	V5shrqy1fZxoFeOoETTDxpVr5CVonpHyqtoVXp6ZNKgarJ8250BHDkKMoAf/9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782977112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aEfPBz8t091mK8M23TmUS5ueXhjrCz5llTnQK6R0sfQ=;
	b=nXozbYa/awkVyg7K3/Ip0TKZExLgqXmxbWF4Il6PZjBAXd8k9tzkZRnmyZvM3YfPbV+NU4
	mtUqGGFS9mKZJzAA==
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] rv/rtapp: Add wakeup monitor
In-Reply-To: <b33e175467a8cb8011ded2195353bc6743b4cd46.camel@redhat.com>
References: <cover.1781852967.git.namcao@linutronix.de>
 <ba5658fa13e49ada466b84a2c211f233037180b5.1781852967.git.namcao@linutronix.de>
 <b33e175467a8cb8011ded2195353bc6743b4cd46.camel@redhat.com>
Date: Thu, 02 Jul 2026 09:25:11 +0200
Message-ID: <87ldbtvoo8.fsf@yellow.woof>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gmonaco@redhat.com,m:rostedt@goodmis.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-94521-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[namcao@linutronix.de,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcao@linutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:dkim,linutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03B376F428C

Gabriele Monaco <gmonaco@redhat.com> writes:
> This looks good, but if I understand it correctly, the same violation should be
> spotted by both monitors from two different perspectives, but sleep catches more
> things (e.g. tasks using wrong sleeping ways despite their wakeup):
>
>   # perf stat -a -e rv:error_sleep -e rv:error_wakeup -- stress-ng --cpu 5 --cpu-load 90 --sched rr -t 5
>
>    Performance counter stats for 'system wide':
>
>                285      rv:error_sleep                                         
>                 20      rv:error_wakeup                                        
>
> Provided I don't really know what's happening down there (I just let the
> stressor run free), this discrepancy is expected, right?

Thanks for testing it.

Beside monitoring low-prio task waking high-prio task, the rtapp/sleep
monitor also checks that user uses the correct APIs for sleeping. So
yes, this discrepancy is expected.

Nam

