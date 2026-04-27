Return-Path: <linux-doc+bounces-84701-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CHcJ84y72mb8wAAu9opvQ
	(envelope-from <linux-doc+bounces-84701-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 11:56:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D4470311
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 11:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 821CA30038C4
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 09:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B3B3B3BF1;
	Mon, 27 Apr 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s4DiWQwl"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26C3B38BB;
	Mon, 27 Apr 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283630; cv=none; b=b25FHGn4WE/7eW4j/PaYyI15mbTFboeSJNqyll4mrBblHBLldDhmAsdbdgdV9r+rbJywUXovyeq/KfwrZStP562C0koapaSA1ppfktXnya7cPRSKwKZ0UgYZ056e75Ae0+a2ArlX/Kpf+2QRVSNqwXZS1KSQreTrrWEnzgLNtMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283630; c=relaxed/simple;
	bh=ea+Mvx5S01M4VKG0AyGoyugnnnZfJlNqJxhN+zmQIxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QxzU7l/NEyJnF94Z37XA/RUeNXZps1ZugyATTod2kH22gmmVHmUXK6X/hdzNGulln0wCU89ZAgPtJfk3dRgrPeSP1xLI7W763uAG6YBLFPuV7wuyEGaYxhLrlIgA+CROfdXKfwo0Bxaq771KqedeDccPWgiw6dPYixqzWC961PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s4DiWQwl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E37C41098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777283059; bh=O88PCqcFi/EeosDz7K3Y0PjI72DPvObH/v0jHWveF2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s4DiWQwlJqaXywKjxSGy/4tPBS4g6Ew8+6vww9MiJwv+2uYfDVsbnXnDlfn/2n64I
	 SV3+DZjxEQUzd1KY1y+KyhcF44cnLmtECKfoayawH1aSgYHVtBkS877RnZKgjL0sRx
	 TfZTaNDF/AjGHU1jQw8aACrjxXbcI1Y2GjfkldbbSXfKft80LBCkAWlZryvwMYCDWn
	 c6kTxCGdVv4E3OC3W7JoJuxOnjhSTT2gwA1TeTj5jnjfOxPehuTWf7X8txYu+kvOrl
	 KIrl5ktppGGQ6DI+I36JFQHtJUOAneGh65WPm0qe2cem3ngSROhtrBl32jjRaQVD9o
	 CFzbc9ZnGULAQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3E37C41098;
	Mon, 27 Apr 2026 09:44:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriele Monaco <gmonaco@redhat.com>, rdunlap@infradead.org, Steven
 Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: matteo.martelli@codethink.co.uk, skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/rv: Replace stale website link
In-Reply-To: <20260427085526.111835-1-gmonaco@redhat.com>
References: <b845c448-1655-4860-9b6d-93d6f8426740@infradead.org>
 <20260427085526.111835-1-gmonaco@redhat.com>
Date: Mon, 27 Apr 2026 03:44:15 -0600
Message-ID: <875x5crb4g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: DF0D4470311
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-84701-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]

Gabriele Monaco <gmonaco@redhat.com> writes:

> The sched monitor page was linking to Daniel's website which is now
> down. The main purpose of the link was to point to a source for the
> models from the original author and that can be found also in his
> published paper.
>
> Replace the link with a reference to Daniel's "A thread synchronization
> model for the PREEMPT_RT Linux kernel" which can be found online and
> includes the models definitions as well as the work behind them (not the
> original patches but since they're based on a 5.0 kernel and are mostly
> included upstream, there's little value in keeping them in the docs).
>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>  Documentation/trace/rv/monitor_sched.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/trace/rv/monitor_sched.rst b/Documentation/trace/rv/monitor_sched.rst
> index 0b96d6e147c6..661171bd7c5e 100644
> --- a/Documentation/trace/rv/monitor_sched.rst
> +++ b/Documentation/trace/rv/monitor_sched.rst
> @@ -365,4 +365,4 @@ constraints when processing the events::
>  References
>  ----------
>  
> -[1] - https://bristot.me/linux-task-model
> +[1] - Daniel Bristot de Oliveira et al.: A thread synchronization model for the PREEMPT_RT Linux kernel, J. Syst. Archit., 2020.

Since, as you say, it can be found online, is there a reason not to
include a link here?

jon

