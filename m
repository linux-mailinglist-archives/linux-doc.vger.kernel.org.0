Return-Path: <linux-doc+bounces-93079-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsDTHDUuOWoloAcAu9opvQ
	(envelope-from <linux-doc+bounces-93079-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 14:44:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D40DB6AF871
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 14:44:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KiUQC1bI;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93079-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93079-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BBEA3028F56
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 12:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8D93AC0F0;
	Mon, 22 Jun 2026 12:42:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72C3AC0FC;
	Mon, 22 Jun 2026 12:42:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132154; cv=none; b=aE8xiFNmt+4Lv/0lw59W1CahazL893Nf3F8M2fYjYr3ZYfWwP7avdMa1bfox92Bp30kXOt36W8qVScC5B99Xqc/D8mL07VxCiEt0nQc692ERkFePSAxoMl0ozIM+tuMzNBLDVHmnwWacO7PIPWxO4hEQsqFZDLAtt4952KVWpTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132154; c=relaxed/simple;
	bh=sBB9HIOJyh0+Q0tdVfj5BPTOtaz69ZBxp/hs1U8uyTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PuIQVd81QjSU96DbbCSz0k+LH5pubJi5w3MDnu4cG0NRMVI6hIH1/P4i9X17Y+0bnbGz5AwumXVK4H8qm0dCQ5s/kONuOD1Bx9+/qtWjGT8oUaJXRU85xfgJJQpQaDuQUZD7KI6DO16d30mHJIPSLhCee5ebH4cI33VLxHpoAYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiUQC1bI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA621F00A3A;
	Mon, 22 Jun 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782132153;
	bh=sBB9HIOJyh0+Q0tdVfj5BPTOtaz69ZBxp/hs1U8uyTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KiUQC1bI/NhfyctJLPMotIQzxW83XndStg/PtDhr/qg5jbTQLrqw2JqVnJBpjLAYh
	 Eela41QyhwlZebJRBHeTf1rc0/F76YSzr2jWcDtiK2vpuUZqJyOh9d1kh1cuN6xBR+
	 dc/6MlJL9RYmhezFY20KznZRo/RqADe2wR+wxCdoqA3w76THZZXJBlYHRBj5eNwEL8
	 rjyLcShGMbmu3AjyHYavIQA2rk7oFcwlbwrahiS6dDeSr5/eT2VqC4vrbcOqinm5FE
	 +Yu2Llh8Tm6gfVg/3xoRPl4lWkTKrzlUKYw3REicBtT/iT5QaiRNXHqePtqljF92q3
	 NsFFXorFVrqvw==
Message-ID: <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
Date: Mon, 22 Jun 2026 21:42:10 +0900
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
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org> <ajVByfkLbetzA8bB@arm.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <ajVByfkLbetzA8bB@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PC6AVe6DTCIpK9DJB7Cd0h9E"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93079-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D40DB6AF871

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PC6AVe6DTCIpK9DJB7Cd0h9E
Content-Type: multipart/mixed; boundary="------------DucNVyWowjWn2Qipbe0sleBO";
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
Message-ID: <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org> <ajVByfkLbetzA8bB@arm.com>
In-Reply-To: <ajVByfkLbetzA8bB@arm.com>

--------------DucNVyWowjWn2Qipbe0sleBO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On 6/19/26 10:19 PM, Catalin Marinas wrote:
> On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
>> On 6/12/26 1:44 PM, Dev Jain wrote:
>>> Introduce a boot option to tag only at allocation time of the objects=
=2E This
>>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>>> catching bugs.
>>
>> I think most of overhead when enabling MTE comes from loading and
>> validing tags for every memory access (either in SYNC or ASYNC mode),
>> rather than from storing tags.
>=20
> I guess it depends on the workload. Lots of allocations for short-lived=

> buffers (e.g. network traffic) may notice the additional tagging more
> than the actual tag checking.

Agreed. Likely depends on lifetime and size of objects.

> Of course, it would be nice to get some numbers from those who have
> access to MTE capable hardware.

Agreed! (I don't have one, unfortunately. It's pretty new hardware
feature)

>>> Now, when a memory object will be freed, it will retain the random ta=
g it
>>> had at allocation time. This compromises on catching UAF bugs, till t=
he
>>> time the object is not reallocated, at which point it will have a new=

>>> random tag.
>>>
>>> Hence, not catching "use-after-free-before-reallocation" and not catc=
hing
>>> "double-free" will be the compromise for reduced KASAN overhead.
>>
>> I doubt users who care about security enough to enable HW_TAGS KASAN
>> are willing to compromise on security just to save a few instructions
>> to store tags in the free path.
>>
>> To me, it looks like too much of a compromise on security for little
>> performance gain.
>=20
> I don't think there's much compromise on security for use-after-free.

I think it depends... OH, WAIT! I see what you mean.

You mean use-after-free before reallocation does not lead to much
compromise on security because objects are initialized after allocation?

You're probably right.

Hmm, but stores to e.g.) free pointer, fields initialized by
constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
will be undiscovered if they happen before reallocation.

Not sure what are security implications of that,
but sounds worth discussing.

> The buffer will be re-tagged later so use-after-realloc should be
> caught, especially if we ensure that a different tag will be used (I
> don't think Dev's patches do this).

Agreed that it'll be nice to ensure that.

--=20
Cheers,
Harry / Hyeonggon

--------------DucNVyWowjWn2Qipbe0sleBO--

--------------PC6AVe6DTCIpK9DJB7Cd0h9E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajktogAKCRCGXBN6rc5S
1mwdAQCV/v9TESQBXaNvWWnvoxqvNG1qbVtP+p+94ya719IJXQD/fT2zvm7NaU5r
ozgxj903g6vHgfHpqx9u07IM7QQCrwQ=
=GrWq
-----END PGP SIGNATURE-----

--------------PC6AVe6DTCIpK9DJB7Cd0h9E--

