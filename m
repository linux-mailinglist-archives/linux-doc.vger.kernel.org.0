Return-Path: <linux-doc+bounces-92205-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +SmUKF5gLGqMQAQAu9opvQ
	(envelope-from <linux-doc+bounces-92205-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:39:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752367C186
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:39:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b="V228jfR/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92205-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92205-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5754311F89C
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500DD359A6D;
	Fri, 12 Jun 2026 19:34:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A72C032E
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:34:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292860; cv=none; b=LCleJpIuZSpS8lUjaNAOFhn5spoMU5NKLd7ZTrxDHkLo1+3eAZbB5orjVA2BuaVtf5Nn4JBbSwP7DUxNohwQQSzo55vbNVKjGnW35Dlc6HjScpsE91bv3WN1Fn9F1L7rWyRqLE5RRaaCCzIxOhwmRJ2t6olnrNoOWRQmSysFaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292860; c=relaxed/simple;
	bh=GHwWXb66w9j9VHS79WBsu2PC0wvKhAf+OQwXA00oUsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DyEbdBTNSKmJikbDy9lmmD1X8a8GZFRLrHdWVl085m4e/c0goQTvuDOKHUPHe9JeFc0qzeZjkm8P7vaMJ9S0NEnZAnpIDvOMaN9P5L+HhOkXOX5p0DhA/CyjVS+HZoLdR6U3uSsoG2Zib7SYpB/FkR75mrXCJpsKtyyhD5XDVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=V228jfR/; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7499040430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292858; bh=+jrRHXPPn/G5yx22VWfBGHFMZGcTrU0+4kulvsrKkJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V228jfR/s1z9KSaw8MSvkcG2egSYhBI5B4POYvEQu0EoQyQmSeLKMI8/12Oyxxrom
	 tcG59WHIn43JIF7rn7L9oFZ7TjpWOZ3ZloS8Jzlk3VjGA2d3fzjr8x5Vot74PLffDP
	 QOY71Nn9n2IJImx/iepU7choXUnadCq2fN6QVdjzW6SPyXLu8uDn6yBD2OxMzByOFB
	 Vp74hymfAh+nL38NWxg4mnXAqfGrC3mb+YmRkBUirFBr4JQ5vmX8KfADjEuEL6sekJ
	 9Uli+MZCEQ6RL2JH3qssrYMyu/q+wRMcNENz48pmZLnXotDeEANgXtWlatI1KBhz3r
	 0sdoS1v0dRgIA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7499040430;
	Fri, 12 Jun 2026 19:34:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] kdoc: xforms: ignore special static/inline macros
In-Reply-To: <20260602031214.2817411-1-rdunlap@infradead.org>
References: <20260602031214.2817411-1-rdunlap@infradead.org>
Date: Fri, 12 Jun 2026 13:34:17 -0600
Message-ID: <87ldcj5z9i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:skhan@linuxfoundation.org,m:mchehab@kernel.org,m:harry.wentland@amd.com,m:alex.hung@amd.com,m:ivan.lipski@amd.com,m:daniel.wheeler@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92205-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,trenco.lwn.net:mid,vger.kernel.org:from_smtp,lwn.net:dkim,lwn.net:email,lwn.net:from_mime,infradead.org:email,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1752367C186

Randy Dunlap <rdunlap@infradead.org> writes:

> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c contains 7 (for
> now) functions that use STATIC_IFN_KUNIT or INLINE_IFN_KUNIT macros for
> function qualifiers (static or not, inline or not).
>
> These cause parse warnings from kernel-doc:
> Invalid C declaration: Expected identifier in nested name, got keyword:
>   struct [error at 29]
> STATIC_IFN_KUNIT const struct drm_color_lut * __extract_blob_lut (const
>   struct drm_property_blob *blob, uint32_t *size)
>
> Handle these in kernel-doc to prevent multiple warnings.
>
> Fixes: 647d1fd04652 ("drm/amd/display: Add KUnit test for color helpers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Ivan Lipski <ivan.lipski@amd.com>
> Cc: Dan Wheeler <daniel.wheeler@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
>
>  tools/lib/python/kdoc/xforms_lists.py |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- linux-next-20260601.orig/tools/lib/python/kdoc/xforms_lists.py
> +++ linux-next-20260601/tools/lib/python/kdoc/xforms_lists.py
> @@ -104,6 +104,8 @@ class CTransforms:
>          (CMatch("__context_unsafe"), ""),
>          (CMatch("__attribute_const__"), ""),
>          (CMatch("__attribute__"), ""),
> +        (CMatch("STATIC_IFN_KUNIT"), ""),
> +        (CMatch("INLINE_IFN_KUNIT"), ""),

So I can't get this one to apply; which tree did you patch here?

Thanks,

jon

