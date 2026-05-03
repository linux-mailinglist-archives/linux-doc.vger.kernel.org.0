Return-Path: <linux-doc+bounces-85563-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJjDJ45l92n6gwIAu9opvQ
	(envelope-from <linux-doc+bounces-85563-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:11:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066B4B62E1
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43D16300915C
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 15:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B112BEFF6;
	Sun,  3 May 2026 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qcIa0opv"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D021F5821;
	Sun,  3 May 2026 15:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777821067; cv=none; b=FzZftXIrRDV9/+oyv7at70oQ6ouGmiLDMgBjyVfeN6UwyE46tDDqUk+3GHIcx+DSZsyP7e+Uz1Nvy8AqH1u8uthI/EmD/IIEklDC+N8g+zdj021wSBTHvH9HTmJeVb6RPpqvyDbYjlCSFUelK8/dO3DCglLhhFr1/uqREgVYUyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777821067; c=relaxed/simple;
	bh=VEN8p6cZXYdhRVXcT4lY8SFhKNEB/BT4+PFsX7BB/7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZmVxsyGosk1Qud1Jz3XXW3U+5tuhamTih1cfLPKFvNztkEudJK3fuSoZko6fgjAjdfU1/b8p39wz09gcW1WM8rkiK7MSkHlhfTptfySTQF2WgAaEIPD0CbQ+Rg+PQtYOcH8Z85Ps5+Tu+O+zkEol4lpM7CNY0SaOQ5oAjfvgy74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qcIa0opv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 15DD741084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777821065; bh=yhcZ62idcYRCfP53a11nbos/rNfuk1TTCaR3NGxdkK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qcIa0opvjdX/0WuN5p2C3lcMpSrOo4cJYssTOLWd9eCHKHo25RKtYQIwdeEtCsaA2
	 yShDwbbbBju4lEv3lM/16SEHDhcm6gYGpnjjf7WCkw0WRzbiLKgbKsUqZynC613rv2
	 dKxIMR95M50wO61dguow8IadjX+6ySWesKUwJpTgd9zSiMVzj2k9YVh/Lof6vyuvni
	 U0HSdr928SuyCnEMRBy0iicYTXmMrL8qwZXU2KZVqVe69Muqbls7vkP7ZnZKwzQDEm
	 o8RwG1hszPBNUNNh7aGwn1nyIfiNQeIvksntjH3Q6A8ydcM+Ei0JTzAiObgW44mSg6
	 gl54c2LaN9TQg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 15DD741084;
	Sun,  3 May 2026 15:11:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriele Monaco <gmonaco@redhat.com>, rdunlap@infradead.org, Steven
 Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: matteo.martelli@codethink.co.uk, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] Documentation/rv: Replace stale website link
In-Reply-To: <20260427131709.170505-2-gmonaco@redhat.com>
References: <20260427131709.170505-2-gmonaco@redhat.com>
Date: Sun, 03 May 2026 09:11:02 -0600
Message-ID: <877bpkcyux.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 0066B4B62E1
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
	TAGGED_FROM(0.00)[bounces-85563-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]

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
> Fixes: 03abeaa63c08 ("Documentation/rv: Add docs for the sched monitors")
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
> V2: Add link to the PDF and fixed RST references
>
>  Documentation/trace/rv/monitor_sched.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

jon

