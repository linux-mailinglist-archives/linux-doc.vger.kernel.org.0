Return-Path: <linux-doc+bounces-93082-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PCLfMgwxOWrmoAcAu9opvQ
	(envelope-from <linux-doc+bounces-93082-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 14:56:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2536AF9A1
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 14:56:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dhTXUQv3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93082-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93082-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D42F83008C82
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 12:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C563AD535;
	Mon, 22 Jun 2026 12:56:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B53AD522;
	Mon, 22 Jun 2026 12:56:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132997; cv=none; b=WSuP01vCGnrojUiQ5RA2C6WhkkWVMRplRJnS/QQrsOKthl/l3twkVmlbu2KTuMJQE3lrZ1MmjfFm3KfwSpohZmfMhLcz7lh2i/rJrV31pmaXvDs1PvLskEGoTgGpN685tFp3+vP6pyTn0D3D4QuXZ2UmWhBc9T90PwUVNX24Yl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132997; c=relaxed/simple;
	bh=l2iDIuaF1VKCPijPKmXFMyUN8rIqLYAfStTAg8/YV8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHKrw3Nhn52bdfoNiJNHUDNMR7jbr5WQF6PpZihzob4vIQgiKjGUIvhes5zikUAt9rfAAtMBxu4TYMQBmd7XVMrRTagGXTaM/i4YDuWx7ltxGromykrC4LF8qdbAaHY3itDG9xt9g2h6RWqXRTJcpxXiDivLuXS5eNqtgyJGbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhTXUQv3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C321F000E9;
	Mon, 22 Jun 2026 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782132995;
	bh=l2iDIuaF1VKCPijPKmXFMyUN8rIqLYAfStTAg8/YV8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dhTXUQv3s+G3948VNEUzwG8LXH8B99YNS4TcI8bDdEjy3NoNMQW8qC1bUUBSBq0Gl
	 9CS1dv+dU1cEQKaafkSSnUFEbNMHMoE6bXWDLVN7hboEaUaa0dWkHmM3ceKJRehheI
	 62XYgsevyO2fp8MahzfXuYboKooKO40EB5EXQNxnRy3bIhPev9AIkS9Bp6dEnSFUlM
	 AjZ2wghBrD6limeBOmkB7AGjF4ZSY0kPfNw6svzcq0JIoX8gZWxztnmnWbaGHMOIDY
	 oHJqQ4QcmtGnNGHxzYYAGiy5TkFXhUSIZiiK6+1TAFqEmqIuNPWL3IkLCH3FgkliFd
	 sxlx9gq6SF69w==
Message-ID: <4ab3bf02-70b9-4748-a12e-2bd564fec53d@kernel.org>
Date: Mon, 22 Jun 2026 21:56:24 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org> <ajU-b32dmwS7XOg4@arm.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <ajU-b32dmwS7XOg4@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------upsrUBOQYnFEnSXIs0AYK6aO"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93082-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:dev.jain@arm.com,m:ryabinin.a.a@gmail.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:ryan.roberts@arm.com,m:anshuman.khandual@arm.com,m:kaleshsingh@google.com,m:21cnbao@gmail.com,m:david@kernel.org,m:will@kernel.org,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,linux-foundation.org,lwn.net,google.com,googlegroups.com,kvack.org,vger.kernel.org,linuxfoundation.org,lists.infradead.org,kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE2536AF9A1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------upsrUBOQYnFEnSXIs0AYK6aO
Content-Type: multipart/mixed; boundary="------------Ps3zmfE9YngvIs8RaS9wbP7c";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
Message-ID: <4ab3bf02-70b9-4748-a12e-2bd564fec53d@kernel.org>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org> <ajU-b32dmwS7XOg4@arm.com>
In-Reply-To: <ajU-b32dmwS7XOg4@arm.com>

--------------Ps3zmfE9YngvIs8RaS9wbP7c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/19/26 10:04 PM, Catalin Marinas wrote:
> On Thu, Jun 18, 2026 at 11:05:43PM +0900, Harry Yoo wrote:
>> On 6/18/26 10:35 PM, Harry Yoo wrote:
>>> On 6/12/26 1:44 PM, Dev Jain wrote:
>>>> Introduce a boot option to tag only at allocation time of the object=
s. This
>>>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>>>> catching bugs.
>>>
>>> I think most of overhead when enabling MTE comes from loading and
>>> validing tags for every memory access (either in SYNC or ASYNC mode),=

>>> rather than from storing tags.
>>
>> Is there any reason not to use STGM instead of STG + DC GVA when
>> setting/clearing tags for large sizes when we know they are properly
>> aligned?
>=20
> STGM is intended for copying tags when paired with LDGM. Have you seen
> hardware where STGM is faster than STG or DC GVA?

No, I haven't. It was a question I had after learning that there are
multiple ways to store tags ;)

> For properly aligned
> buffers, I'd expect DC GVA to behave at least on par with STGM.

Thanks for answering!

--=20
Cheers,
Harry / Hyeonggon

--------------Ps3zmfE9YngvIs8RaS9wbP7c--

--------------upsrUBOQYnFEnSXIs0AYK6aO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajkw+AAKCRCGXBN6rc5S
1qvyAPsF0DurImeEtMtFke9YXQWImsgXI+xfZ4SEz1mY+wbGswEA158qtw/Yf70R
7SKOnegedFGVqJzsq5p+vAkSpPMfJQw=
=RsAK
-----END PGP SIGNATURE-----

--------------upsrUBOQYnFEnSXIs0AYK6aO--

