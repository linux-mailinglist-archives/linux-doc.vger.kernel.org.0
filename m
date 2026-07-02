Return-Path: <linux-doc+bounces-94512-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L/CSDsv0RWpmHAsAu9opvQ
	(envelope-from <linux-doc+bounces-94512-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 07:19:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3805B6F38D2
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 07:19:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kfbBAfT4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94512-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94512-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 226223015D4D
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 05:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B463403F9;
	Thu,  2 Jul 2026 05:18:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA62CA45;
	Thu,  2 Jul 2026 05:18:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782969538; cv=none; b=UcwaPmQOK3wG+M4GvnjTMcj/63ExLmal3Lq7dlMVjpXv6AQLl48jrHQPWzKteSBCgXtyBg19EQF1uZomscC9JAHi4ipwMQfYjK5K2AuPCetCbHwA5mkgef7hF38mhCCoMnqX5C83zDv9qtt+/FU49/VXMgxCf+fLQEjVbBucSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782969538; c=relaxed/simple;
	bh=LCHTDayaQctKQwTOSOo5JZcJHZlsDTMGv5r7C5TpZfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQmdTSBPPhazufTzGC6fvi1k1KBIHIvHICbb2Ju40jFdVsAzxtUWdUAPwn221JCIopbdlZgjjsSmrwkYrrYWzfCRPX3fEPucd/+J1krNu2LuAGXJLz2DuPYIt3Hwp3D78gpr3QdNJjImo4VWEl9YxW/F7JNpzWln00vNqfhqbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfbBAfT4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FA11F000E9;
	Thu,  2 Jul 2026 05:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782969536;
	bh=LCHTDayaQctKQwTOSOo5JZcJHZlsDTMGv5r7C5TpZfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kfbBAfT4LLf0vvbkJ1cyslvqGFRWwWR6CF/TkGJKFEkhfl/6q3Yq38owC7DMpKXYe
	 p6thjWJDSxGGaOXpUXM5ZO/0Gk42v7ZzEB/bdy7gFYwP3EaPA8VoXYVqNxxvp/sk5h
	 DjCEL4dx0p8SZbY/mvhZ2olcgqwwuRgx6JXJv09yKkrXTos8c4CNjOkGlxll1JuRsT
	 qXL7yTUfhlidQMmSbNG/vLIwgEOocgXrl7gwQyYFENquEh5OvO9GuR/yMSq1YQBaw3
	 MO8cQwCBLK5GZxFughII57OZK3VKLKbXJOzMBUOcQI32BHFfySbgJP2W6FJfg7qfzq
	 rlkDr2v95wfJg==
Message-ID: <54e75619-3dbc-448c-81fa-122edcdad1f0@kernel.org>
Date: Thu, 2 Jul 2026 14:18:49 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: sysfs-kernel-slab: mark cpu_partial attributes
 deprecated
To: Seongjun Hong <hsj0512@snu.ac.kr>, Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260701141755.85119-1-hsj0512@snu.ac.kr>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260701141755.85119-1-hsj0512@snu.ac.kr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O80EsP6ScXCYvlwhmQW6hWQX"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hsj0512@snu.ac.kr,m:vbabka@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94512-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3805B6F38D2

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------O80EsP6ScXCYvlwhmQW6hWQX
Content-Type: multipart/mixed; boundary="------------Fbv8pm31SwkONlud2RpeVStF";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Seongjun Hong <hsj0512@snu.ac.kr>, Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <54e75619-3dbc-448c-81fa-122edcdad1f0@kernel.org>
Subject: Re: [PATCH] docs: ABI: sysfs-kernel-slab: mark cpu_partial attributes
 deprecated
References: <20260701141755.85119-1-hsj0512@snu.ac.kr>
In-Reply-To: <20260701141755.85119-1-hsj0512@snu.ac.kr>

--------------Fbv8pm31SwkONlud2RpeVStF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 7/1/26 11:17 PM, Seongjun Hong wrote:
> The per-cpu slab and per-cpu partial slab mechanisms were removed when
> SLUB was converted to per-cpu sheaves in Linux 7.0. The cpu_slabs,

small nit: sheaves were introduced in v6.18,
but the cpu (partial) slabs layer were removed later in v7.0.

> slabs_cpu_partial and cpu_partial sysfs attributes were kept as stubs
> that always return 0 for backwards compatibility, but their
> documentation still described them as if they were functional.

Right, for backward compatibility, because, unlike files that
might not exist w/o SLUB_STATS, userspace tools might assume that
they always exist.

> Update the three descriptions to state that the attributes are
> deprecated and always read 0, and note that they are retained only for
> compatibility. While here, fix a "partialli" typo in the
> slabs_cpu_partial description.
>=20
> Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
> ---

Overall looks good to me, so:
Acked-by: Harry Yoo (Oracle) <harry@kernel.org>

By the way.

There's still some gap between the documentation
and the implementation :)

We've dropped a bunch of files that exist only on
SLUB_STATS and new files introduced with by
sheaves were not documented.

Also, tools/mm/slabinfo.c needs some attention as
it hasn't been updated for a while.

Thanks.

--=20
Cheers,
Harry / Hyeonggon

--------------Fbv8pm31SwkONlud2RpeVStF--

--------------O80EsP6ScXCYvlwhmQW6hWQX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCakX0uwAKCRCGXBN6rc5S
1gbkAP9QAKNNWBCEWbfsjY3L/SMOIedhdGbXoUMbLTAYMD5oRwEAqzX5qtFNmUlH
RxsRIORKmGzfNGZSE2K5ljitJ9mX3wo=
=ehts
-----END PGP SIGNATURE-----

--------------O80EsP6ScXCYvlwhmQW6hWQX--

