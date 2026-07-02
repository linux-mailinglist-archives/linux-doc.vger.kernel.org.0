Return-Path: <linux-doc+bounces-94709-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e/0aN+XtRmqNfgsAu9opvQ
	(envelope-from <linux-doc+bounces-94709-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 01:01:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B06FD538
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 01:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=URVLJy2Z;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94709-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94709-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01C543006968
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 23:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0309357CFA;
	Thu,  2 Jul 2026 23:01:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C428DB54;
	Thu,  2 Jul 2026 23:01:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783033314; cv=none; b=n/KjppHAScU9oA4264DySYnXA1ddTALGySmJSoleJtYKkgLaBHdE+L6qeohcD88aUvgzFbzA+ghmaukrJYIMaSPfl+NpXbDwPpBa0Jng8RSW9zT+XD71oKtwMFXJfmnQglKVtkW2NBM0WKOd9Rzz1jr9jOJPEtRSVmlt4rDcDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783033314; c=relaxed/simple;
	bh=vc7zLtHorRduHvMkQ0qDlCGVRUzu5bUilomtxkkGgf0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=N6X9sKWXpULn1wc2lkYAfaCSmFRWZyAwbgJcu2VyuG1XZIaqmsjBUlq+uZCCK9AzDxheDCSDDXW7/TW/a6cHFw7gO4LPkQhIrWXGvywz1yCb/A5vHhv2bRhsP6wGO53RY03zGZG8qyYtZcgocN01VYeogWLPnydA/RzLgSeT/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=URVLJy2Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAA91F000E9;
	Thu,  2 Jul 2026 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783033313;
	bh=ArRdQ3PAA6YKNFCjpWwE8Lbmu/1rYpWbZ9KDsz4OLK8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=URVLJy2ZI76hZRymwYnjed5vgOTYdtDdw4bVtHf3SVHJwsBApgw5BV85Q7vgWQoa5
	 X0WuUdXAPUOej3NLdRZS/E1VcSkJyltxgUZfQppgusd9FOL+Ckyip0fzdTt+jQ2upc
	 z37VCbjg8zICp22+xi0Uk2/kSfPsqJJdnIoVhFoQ=
Date: Thu, 2 Jul 2026 16:01:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 0/3 v3] delaytop: add delay max, timestamp and sorting
 for top latency analysis
Message-Id: <20260702160152.ab0a3dea97e06652cf4874ac@linux-foundation.org>
In-Reply-To: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
References: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94709-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:wang.yaxin@zte.com.cn,m:fan.yu9@zte.com.cn,m:yang.yang29@zte.com.cn,m:corbet@lwn.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:xu.xin16@zte.com.cn,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zte.com.cn:email,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-foundation.org:dkim,linux-foundation.org:mid,linux-foundation.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F7B06FD538

On Thu, 2 Jul 2026 20:57:04 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> Previously delaytop only showed average delays. This patch adds:
> 
> 1. delay_max fields to track the maximum delay value for each delay type
>    (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
>    per task.
> 
> 2. The -t/--type option displays only the specified delay type with avg/max
>    values side by side, allowing focused analysis:
>      delaytop -t cpu    # Show only CPU delay with avg/max
>      delaytop -t wpcopy # Show Copy-on-Write delay with avg/max
> 
> 3. Wall-clock timestamp when each maximum delay occurred, displayed in the
>    MAX_TIMESTAMP column when using -t/--type option. This enables:
>    - Identifying the time when a process experienced an abnormal delay max
>    - Correlating delay max across multiple processes at the same timestamp
>    - Cross-referencing with logs, traces, or other metrics at that time
> 
> 4. When using -t/--type option, tasks are sorted by maximum delay value in
>    descending order (largest delay first), enabling quick identification of
>    top N processes with highest delay spikes.

Seems useful, thanks - I'll queue this for testing.

AI review might have found a couple of things:

	https://sashiko.dev/#/patchset/20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn

