Return-Path: <linux-doc+bounces-90389-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKjoFXzZHWpsfQkAu9opvQ
	(envelope-from <linux-doc+bounces-90389-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:11:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA4624784
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81EB3050477
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 19:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B193360EE1;
	Mon,  1 Jun 2026 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RPJMzkoS"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA12236E0;
	Mon,  1 Jun 2026 19:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340800; cv=none; b=WYu7UrrJm1pV8Gxn7v7umIXAL+0bQjJo9QNWKS+7w72TKKnBj+fSNx2V0li4Gx0z9m6nQBsJELS/CiEJI7+Cl+uIy//DjoX4vhuoDM/qq0tsoyfZKWLijD9b0N9cS1FQflEW3lMQq76V/Xk7DKnUeNbhuU2uVcD0ksAl6V9HigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340800; c=relaxed/simple;
	bh=cmISLBoZ7V5IprSnEE+/iaGmBvKLkaLwGK2iu7OH72U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D9Ke4WroN5ULCox42Dnq8K4sIRS1PfbgeROuUo4V/Yp14E4nQiL9hCanjxkZ19D78oungdcq7pXCDW5EtCEIR6Rs/3rk2udOjQIR0yXjkVoE4EaBy89LlfyMep63fpko0ozqjO/o9ZlqmcX4pCD5YMM1EF4Z0KtVV5ysl/Fk/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RPJMzkoS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A403440E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780340797; bh=jIbui+TOzTTl1Z1CmdVldqCeJocnq3WNhislILHtezM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RPJMzkoSfziGCB1WIN3zgAkxObRcYUa0+gT52YtzPiay5NrCIljsqdfDgFW8cRbF9
	 ckArS/kHfbwlrpAwEvsy91rAEmxsqXhQRxk84b9ewHgpfb2Nu0dayjJyO/jz2uxI+0
	 ZDkN7z110xowdsJXEp3mm7dEp708txLEUsUaMhdbsN2m9KD7rkh8ldstUX8184DY2h
	 HrNFjhqjfEeA+sK5fOBzwtGmXNdqAhsISBxxwsOSZ2UFip9vuns3GOdsM/Fts0EXC/
	 lrYRFI8bTzzOQw+8r7CJVFSDxv8CqHkLJOz67I8rA+tSp0VJhk+5jQYPpC7rarvA5f
	 gDH03uiihpgtQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A403440E50;
	Mon,  1 Jun 2026 19:06:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-rt-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: real-time: Fix duplicated sched(7) text
In-Reply-To: <20260531141823.4118954-1-costa.shul@redhat.com>
References: <20260531141823.4118954-1-costa.shul@redhat.com>
Date: Mon, 01 Jun 2026 13:06:36 -0600
Message-ID: <87ldcy84hv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90389-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,man7.org:url,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: AABA4624784
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Costa Shulyupin <costa.shul@redhat.com> writes:

> The man page reference appeared twice - once as plain text and
> once as a hyperlink. Remove the plain text duplicate.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/core-api/real-time/theory.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/real-time/theory.rst b/Documentation/core-api/real-time/theory.rst
> index 43d0120737f8..92de5654163d 100644
> --- a/Documentation/core-api/real-time/theory.rst
> +++ b/Documentation/core-api/real-time/theory.rst
> @@ -25,7 +25,7 @@ Scheduling
>  ==========
>  
>  The core principles of Linux scheduling and the associated user-space API are
> -documented in the man page sched(7)
> +documented in the man page
>  `sched(7) <https://man7.org/linux/man-pages/man7/sched.7.html>`_.

Applied, thanks.

jon

