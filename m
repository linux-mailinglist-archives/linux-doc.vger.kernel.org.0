Return-Path: <linux-doc+bounces-93825-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id orPwKJ36P2rCawkAu9opvQ
	(envelope-from <linux-doc+bounces-93825-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 18:30:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3556D246D
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 18:30:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=b++FewPX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93825-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93825-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C59DC30104A8
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 16:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B76315D5D;
	Sat, 27 Jun 2026 16:30:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBFD2F0661;
	Sat, 27 Jun 2026 16:30:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782577816; cv=none; b=e2xJMKzW8KY1OoAFTM8kmXEPfGWL7eiMV/kkhZULWRiJ8D0eA4ZO2uS9D/ou2aVEIv/AOGG1IQSDBkYJ2t6AAeYNYPJMUe1wpmto/+fryQuEB1KhODNKyuo+MDTvfuyKUxSdGF7ZbIcBjccXSKm5RDe4nPKmdGHyV9Sb5vUZe4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782577816; c=relaxed/simple;
	bh=T9Xh9+d6qi4HBB5tejaQShSI6NeXDd5Yqy8wC7NGHnQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WM1xCIegbE6ifsVPxzzUVR5CW14v9YjJ1zkLIpBu07QzUaCr1q0R+/htsuRxGNRqVoPQzoeIl7Sv+TuLAIygOz1FrFQhP4ASBcHjd06ULJs8U9cBrWQajCx1Sl0/rAkmW1sJm27OZwOeUpQmfyu4XDNGjVCf5Wf6jU2WQ4x6UWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=b++FewPX; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 03EF140E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782577485; bh=8UtNI14qUP/qApC73hXztpsStGcuLHgTk0AYTTh/tx4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b++FewPXQIhsJV90Djx9KlncZ8xI1edHIysIqAzSyW9XbbTi78I0SeScyMtERgQzC
	 0Hxsmy2e10cDREvhDWKjW04e+v6psqpwzASlKw6Y39hPbD7SVv1vN5WGCixaqVp2+V
	 Piwwa31zeLWDuVer8QWXcI0gJLHwfsWlNQYZhr9JdV+p5jUJHtsixmxjgIf/Tn2JnQ
	 aPTqHtt6FEUJXdkn8VDrA1Hdmietx48mu+hb44oUyUaVqNcnwLm6nG31UUtWqh8zOX
	 XIXRVBQEgBq5iADzEPIU1+8x03uKV47L8on2FXdbW5n46AA/0MXUHK5GKMC3X1wbNJ
	 2wRof3bjCWdgg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 03EF140E52;
	Sat, 27 Jun 2026 16:24:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Alasdair Kergon
 <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka
 <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "open
 list:DEVICE-MAPPER  (LVM)" <dm-devel@lists.linux.dev>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH] Documentation: device-mapper: adopt new coding style of
 type-aware kmalloc-family
In-Reply-To: <20260627091506.29534-2-manuelebner@mailbox.org>
References: <20260627091506.29534-2-manuelebner@mailbox.org>
Date: Sat, 27 Jun 2026 10:24:44 -0600
Message-ID: <877bnkymr7.fsf@trenco.lwn.net>
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
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93825-lists,linux-doc=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:bmarzins@redhat.com,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:dm-devel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF3556D246D

Manuel Ebner <manuelebner@mailbox.org> writes:

> Change the Documentation to reflect this commit 69050f8d6d07 ("treewide: Replace
> kmalloc with kmalloc_obj for non-scalar types")
> kmalloc -> kmalloc_objs
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/device-mapper/statistics.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/device-mapper/statistics.rst b/Documentation/admin-guide/device-mapper/statistics.rst
> index 41ded0bc5933..2190b90118f8 100644
> --- a/Documentation/admin-guide/device-mapper/statistics.rst
> +++ b/Documentation/admin-guide/device-mapper/statistics.rst
> @@ -30,7 +30,7 @@ region, etc.  Unique region_ids enable multiple userspace programs to
>  request and process statistics for the same DM device without stepping
>  on each other's data.
>  
> -The creation of DM statistics will allocate memory via kmalloc or
> +The creation of DM statistics will allocate memory via kmalloc_objs or

A nit, but if you're going to fix the function name, why not make it
kmalloc_objs() so that the automarkup code can do its magic?

Thanks,

jon

