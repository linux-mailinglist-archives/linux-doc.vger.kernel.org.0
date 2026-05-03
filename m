Return-Path: <linux-doc+bounces-85558-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NX1fBA5h92k2gwIAu9opvQ
	(envelope-from <linux-doc+bounces-85558-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 16:51:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1914B6205
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 16:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59BDD300914B
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 14:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C6C23D7E6;
	Sun,  3 May 2026 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fYi/YQB1"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1C40DFA7;
	Sun,  3 May 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777819913; cv=none; b=Xlt6IqosjcNzXeNWETAR/NSuOLBAQhqtp9C5+GxIQcqVllsHqR/Px1mU7Nzpo3K2fFKe4SGscQtQR3UFmfKy5FdDewC6cmJzPPQQD8HUtE9PGHmie0k0/JPwlCRQvDhOQs+UnjqZwEpyowlpWhqXo7oSmF8g8FQY2DqLCzj7FLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777819913; c=relaxed/simple;
	bh=zkswm0PdYii2JiYclJtqGUBQOu1wxQlGGckorjWeq3o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eEPd9/OVbGLOjbWCQBu/1OqWf68P0Mb/sg44iLf6D9XqGIVoEiu8KALVZvUT/lenYz/3yjNDal38I8a6YBH4TU+u/21Tro6bHdnyAaEMpUFOOLfgQWMiQsir8DgS+W0MY1mzApPNqHEH4k8H9KMwgoqiR5kBLrReWwc4CFF4Lw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fYi/YQB1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 563F441084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777819911; bh=hYBlaAyU/KdRRt1THXwdY9HnHSro3+v0d0/m04pe7hA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fYi/YQB1viEOhETgxB6dKzOzT1zFxJgnFfanq/32/VL/TWlOmHzU0tbCS+5KrFdUt
	 0nEspqnUzWedFvszPXqhXAgYRunSkAuQ8DgRbPBDkIMbA1O8MJAIrwCV3PDGZxMn+9
	 o0NlVlnCJKoFBr+Uj3JZoUnIs7d6JCDCV/+Jbme4R5VEYoaur5tre13jsuPW+xGfr8
	 jO8OR8E48tMKjhUrVojzE8xicq8hHAXyczKMTzuykHwIPMrehX6a+X21yDTjFqAkA9
	 O3prGnbfMtwj9Ky61sEPTvNu9o809tMXr2du4gQ2bggpVP3Fpicy7tl2Ye1QcbPo3L
	 +NvJQXxW4IWMA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 563F441084;
	Sun,  3 May 2026 14:51:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Miles Krause <mileskrause5200@gmail.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miles Krause <mileskrause5200@gmail.com>
Subject: Re: [PATCH] Documentation/scheduler: Fix duplicated word in
 sched-deadline
In-Reply-To: <20260429222435.2041-1-mileskrause5200@gmail.com>
References: <20260429222435.2041-1-mileskrause5200@gmail.com>
Date: Sun, 03 May 2026 08:51:48 -0600
Message-ID: <87se88czqz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 5D1914B6205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-85558-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]

Miles Krause <mileskrause5200@gmail.com> writes:

> The SCHED_DEADLINE documentation has a duplicated the in the CPU 
> affinity section.
>
> Remove the extra word.
>
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
> ---
>  Documentation/scheduler/sched-deadline.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
> index 3ad93cd7b59a..9019b66f6a5b 100644
> --- a/Documentation/scheduler/sched-deadline.rst
> +++ b/Documentation/scheduler/sched-deadline.rst
> @@ -685,7 +685,7 @@ Deadline Task Scheduling
>  
>   Deadline tasks cannot have a cpu affinity mask smaller than the root domain they
>   are created on. So, using ``sched_setaffinity(2)`` won't work. Instead, the
> - the deadline task should be created in a restricted root domain. This can be
> + deadline task should be created in a restricted root domain. This can be
>   done using the cpuset controller of either cgroup v1 (deprecated) or cgroup v2.

Applied, thanks,

jon

