Return-Path: <linux-doc+bounces-81787-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFU7EIitymkx/AUAu9opvQ
	(envelope-from <linux-doc+bounces-81787-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 19:06:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AAA35F2D7
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 19:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9D333050EE5
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 17:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC37377541;
	Mon, 30 Mar 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s7RgPMFz"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C82369985;
	Mon, 30 Mar 2026 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890188; cv=none; b=c2YrBOn1pybgt4PNsJ1NmUESqGxOj9DGEqI9h7jzY+3QJf41rJexaKM494GGLBnc4d2fv6qzTWgQHln0oErUssG1NNJ+eD2/ZPJBlxwm3DSmdM5A5g6ZXJtHx1vfrvCkrsmGyRS5l2nHi1YqNzPIjJyku7o9Jc6/YJ9InWyHDNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890188; c=relaxed/simple;
	bh=Q7xKbRz0+gaT57ra7L4y2lOaXhY8zaftbWtQ5kC93Hk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ksUMoNl8mSdyGmx7gxOJusNeHjthogJO+mhLb2l0/KMjs/i79gUQA6ZIktJ0sdK9vN3BiXGtxKwAvYDFBTQqoYFjP/xEFXSsgF/wnfoRgL64Yqzi4qRFsC30iv+D0B7lKLT6wV2DwiLBQRUfDXnqbhs1ArlsjMlKpkkcexKiV+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s7RgPMFz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FA56411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774890186; bh=LUDSAEbcy/Ks3bczFDg2JV+IiP4oX1z6FtakAazPjjE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s7RgPMFzsMteaUxvq2/tdctIIjHDoDXSvKIHlBlPcucfO9Z/AjtemnOgHQX93xe3E
	 ybkqYDdnSsPtroHXVAspux3aRPev39g6zfaRpZrl0tiXbTLOQVjfXitGNWQGBScSIU
	 dOObZJXEo8jePthjJI7nZYMjyDTwkugTMKq60n6yuTEZnAi5Ak8QN3zQfs9FHeEjM1
	 b0ZukJ849iiQE+dMPKxTgrR12Al2lDgmOu3PLw5mBu+ljyiPLvUmqju/z4qYdSDwsB
	 FevZRJTazVWvAsciXg5WW6+qbdybuFCiDgVK7w3qubbxEqZRFkKU1IMrhTjpPJ0IOR
	 QxP+8/SrW03+Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6FA56411C2;
	Mon, 30 Mar 2026 17:03:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: Re: [PATCH] docs: proc: remove description of prof_cpu_mask
In-Reply-To: <20260311070940.94838-1-zenghui.yu@linux.dev>
References: <20260311070940.94838-1-zenghui.yu@linux.dev>
Date: Mon, 30 Mar 2026 11:03:04 -0600
Message-ID: <87ikadmerb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81787-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:email,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: B5AAA35F2D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Zenghui Yu <zenghui.yu@linux.dev> writes:

> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
>
> Commit 2e5449f4f21a ("profiling: Remove create_prof_cpu_mask().") said that
> no one would create /proc/irq/prof_cpu_mask since commit 1f44a225777e
> ("s390: convert interrupt handling to use generic hardirq", 2013). Remove
> the outdated description.
>
> While at it, fix another minor typo (s/DMS/DMA/).
>
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---
>  Documentation/filesystems/proc.rst | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Applied, thanks.

jon

