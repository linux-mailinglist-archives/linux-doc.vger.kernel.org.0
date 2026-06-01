Return-Path: <linux-doc+bounces-90383-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BKiOe/WHWpsfQkAu9opvQ
	(envelope-from <linux-doc+bounces-90383-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:01:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A31206245FB
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D6443033519
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 18:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62AD357CF9;
	Mon,  1 Jun 2026 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kJ3IVLJq"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA38235201A;
	Mon,  1 Jun 2026 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339910; cv=none; b=ROFADHSwWzou2yWHMLyi3BxZ72L2+Yhke7hqb5wco+hgYd1NAEfCtER3YoAc+rA/XRw7jUlQZ7AOeJ8C9xuZ62LuESD2DZeLszxBUybLeoy5KOyLnSiNl4I4GGEnIL2alv2gFq55GLSvtjefYeHgiUMSle4zFpwTxQ9Ntik0Rok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339910; c=relaxed/simple;
	bh=vkHLKPBsX+C2pPOiiN/hbpDpMYo9RxifUc4NX3ab7uY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=REhfNskf6jUSF88QCN4ljbMmg/IZVS6RBjmzR+4ufAPO5wvFMlxK3SyLZ3tSzdLegzvxD8u8PclFnJnVUReW69qd8+/ppjIksAScNMZqbEO3VA3hMSWNCcrW+9o8hTGnEW9v8YmkfSsdrlyAP1n/w0IpGN9htlwtV9Ore9sXBbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kJ3IVLJq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C6C6B40E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780339909; bh=W5bxStgBGpKLPIfc1Ue8/FAuuh9Wy/75zVHd1fN0jCs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kJ3IVLJqmy7MCWGt/Qqz9jiMOO2RpAxOaw8AxBg99ZGvXkiEF4VIClkcZuddMLQsY
	 Qf7fEVMxNhUrOj90ZvtTmGWU9X4Qg+RQCiNs0zymc1VLBQQjdP7uhtjamxSkCHdmGt
	 fxPSqTbSCA3lp7tDgerjBx0ClmHQ4HXUSbu1bfQIfejJOWfaGmkjCzM5wDunjpU7y8
	 K3K6xHS7nqePsZfw4rgUMBSORF3ggr6ohVQhoK71cFl6OjHwzkZIf6OFF8jMMBxy0E
	 AAg6Rn/uuSPVOESV4/VR5eRvSy7bcRCvppKIagXfsqTHQX4Mw2B+ehsiJ68PYyvki2
	 WiQBvNm9VSmqQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C6C6B40E49;
	Mon,  1 Jun 2026 18:51:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Miguel =?utf-8?Q?Mart=C3=ADn?= Gil <miguel.martin.gil.uni@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miguel =?utf-8?Q?Mart=C3=ADn?= Gil
 <miguel.martin.gil.uni@gmail.com>
Subject: Re: [PATCH v2] docs: md: fix grammar in speed_limit description
In-Reply-To: <20260525214554.2196-1-miguel.martin.gil.uni@gmail.com>
References: <20260525214554.2196-1-miguel.martin.gil.uni@gmail.com>
Date: Mon, 01 Jun 2026 12:51:47 -0600
Message-ID: <877boi9jr0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90383-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A31206245FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Miguel Mart=C3=ADn Gil <miguel.martin.gil.uni@gmail.com> writes:

> Replace 'This are' with 'These are' in the md sysfs speed limit
> section to correct grammar and improve readability.
>
> Signed-off-by: Miguel Mart=C3=ADn Gil <miguel.martin.gil.uni@gmail.com>
> ---
>  Documentation/admin-guide/md.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/md.rst b/Documentation/admin-guide=
/md.rst
> index dc7eab191..003fd34f7 100644
> --- a/Documentation/admin-guide/md.rst
> +++ b/Documentation/admin-guide/md.rst
> @@ -734,7 +734,7 @@ also have
>        They should be scaled by the bitmap_chunksize.
>=20=20
>     sync_speed_min, sync_speed_max
> -     This are similar to ``/proc/sys/dev/raid/speed_limit_{min,max}``
> +     These are similar to ``/proc/sys/dev/raid/speed_limit_{min,max}``
>       however they only apply to the particular array.

Applied, thanks.

jon

