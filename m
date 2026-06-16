Return-Path: <linux-doc+bounces-92459-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H6ldBufNMGoLXgUAu9opvQ
	(envelope-from <linux-doc+bounces-92459-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 06:15:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037D68BD04
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 06:15:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aIwhwBAH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92459-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92459-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 788493019FE6
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 04:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FDE26158C;
	Tue, 16 Jun 2026 04:15:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B771512E1DC;
	Tue, 16 Jun 2026 04:15:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583332; cv=none; b=DX8zCvYhzRuRCou7NCQ55bLzSouvzIxLQXamS46ncK5iX+sBXmzcZODI1B9BKJZUjb29YWHCabXO+atLSHvF26aJ9mJzgPRxcKrLNr11Orpi4m0SeJDcppF/kIT0245n69iV8iK1aXHMBt6HMqNlF1zkOuxcTFmJW62CG3THlkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583332; c=relaxed/simple;
	bh=9V50T2TGForvKAGA9bkgMEBL/WX0swsTGfhoJK781M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DP+lQYdw0zsJfNmP/+dVBEbgtix9eTvbx+adV6mtNjtSoo/alT2YiJ9zYqFRP5TKz0pbYjB/WSj9qXIyoArZVHElww5Emx6IcTQR/aQvIo+P5fIOl3sky08Y5CMXkbP5Z5iqxn4Wg1OnYMlPl1dPcVHJZVRn4z7ZBoLy3o1xWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIwhwBAH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CCB1F000E9;
	Tue, 16 Jun 2026 04:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781583331;
	bh=9V50T2TGForvKAGA9bkgMEBL/WX0swsTGfhoJK781M8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aIwhwBAHPg3M703IIHHnlJiKWziml6P54SieHjlDAaUaYCWOHuA08vSGeOSsG5TG/
	 8EbmwnFRHrYKUSf5fpnWutO6D+26FqtT0LNhFMGQHXKcBqEQ28Z7YItySS9Ffwm7TX
	 JPDcYGfG2fzOjOPqLrh8h+WoXzxVzYOl4YPbqFXfeb0TlIr6315dFC0GD6QlNlFpxO
	 eR8yFBEg1f1fuY7zi1NswXugZFGzw3LwSj6WVVNgpIHzZ1ujUlddo6d6s9n2CHg28r
	 S45VGlcjNxhKXyJpEQnXRh/Qs0R9YxOXnvk2ZIgqiVNxbq2JWolSjIv14hhEQwYZ9Z
	 j/aFoyeTuwlJw==
Message-ID: <94eaac52-30a9-4607-a9e9-b2401fe7224f@kernel.org>
Date: Tue, 16 Jun 2026 13:15:21 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
 <55b1b674-6487-4585-8a0d-919373e66d3a@kernel.org>
 <763e61e9-9270-4057-938f-daf9184a41ae@kernel.org>
 <20260615061202.23715-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260615061202.23715-1-pengpeng@iscas.ac.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rQympXZWzOdztZ7GV117DY9T"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92459-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:vbabka@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7037D68BD04

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rQympXZWzOdztZ7GV117DY9T
Content-Type: multipart/mixed; boundary="------------G4FEeR7cIx4Wz0fKMeFqRpi0";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <94eaac52-30a9-4607-a9e9-b2401fe7224f@kernel.org>
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
 <55b1b674-6487-4585-8a0d-919373e66d3a@kernel.org>
 <763e61e9-9270-4057-938f-daf9184a41ae@kernel.org>
 <20260615061202.23715-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260615061202.23715-1-pengpeng@iscas.ac.cn>

--------------G4FEeR7cIx4Wz0fKMeFqRpi0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/15/26 3:12 PM, Pengpeng Hou wrote:
> Hi Vlastimil, Harry,
>=20
> Thanks for the feedback.
>=20
> I agree that the terminology in the RFC cover letter was not precise
> enough. The case I was trying to describe is a duplicate/stale free by =
a
> previous owner after the object has already been freed and then reused =
by
> another user. In that case, the current SLAB_STORE_USER records can sho=
w
> the current allocation and the later bad free/check, but the previous
> completed alloc/free lifetime that explains where the stale pointer cam=
e
> from has already been overwritten.

I was confused, but I see now, thanks for clarifying :)

> This is not intended to compete with KASAN or infer semantic ownership.=

> KASAN is better when it can be used, but the motivation here is the low=
er
> barrier of enabling slub_debug for a specific cache on an existing kern=
el,
> especially in field debugging environments.

Makes sense.

> Based on your comments, I will rework the non-RFC version to fold this
> into the existing U tracking instead of adding a separate H option, unl=
ess
> there is a preference for keeping the extra history behind an explicit
> flag.

Ack.

> I will keep the scope to one previous completed lifetime and avoid a
> larger history table/ring for now.

Ack.

> I will also add a small reproducer or KUnit coverage showing the lost
> previous-lifetime case,

Ack.

> plus object-size/order comparison data for a few
> representative caches.

I think we don't care much about the size on debug caches.

Looking forward to seeing the next version, Pengpeng.

Thanks!

--=20
Cheers,
Harry / Hyeonggon

--------------G4FEeR7cIx4Wz0fKMeFqRpi0--

--------------rQympXZWzOdztZ7GV117DY9T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajDN2QAKCRCGXBN6rc5S
1jU9AQDY8LKVc8r2fE8Zd9WTZ2qOoM4VI5oB5t/0l+40EvXamAEAgdzv/BQewUjP
PvkfhEyPtnGcfrwoSH+ssHc3E6NUvgM=
=nV87
-----END PGP SIGNATURE-----

--------------rQympXZWzOdztZ7GV117DY9T--

