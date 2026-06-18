Return-Path: <linux-doc+bounces-92776-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zaO4M1/7M2p9KAYAu9opvQ
	(envelope-from <linux-doc+bounces-92776-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 16:06:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EC6A0CC7
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 16:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=guRgYMnh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92776-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92776-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 088163011075
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309923ECBDA;
	Thu, 18 Jun 2026 14:05:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCF2D7DC8;
	Thu, 18 Jun 2026 14:05:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791551; cv=none; b=eJyKYqKlGC4sLTFTpgLeBIogCAIfHDKG1ml5rhOpea7YDDaANEbw3ueyljXIofnYAKsq23tx/4+tStD/SL3XoZfgHA9Ty+TqTf3JYSXxfDw6kby3MyI1G2jiiwEPGQBklJObd0UdlYo0GzMUcZ5U9f5CfkYdCRdyCY9u59Z971c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791551; c=relaxed/simple;
	bh=+BS0ptWQEY7JbtdX32/OaKorHSJgwOkHWZa59ChPrUU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QHFQncQsSD1YI9fVTB6/8VxXzxMHSxknEkGnpTzqXxh9qzSQpHVFE3h/PLxRpH3CR/M8Di6vQEPVsPxWobkE0A2NbS+YdZ0haOOTyBtAK/cIH2o5/ljsKgEiORVNmTSLW9cLM10A/oYIU1uZ+71WabaB4MnX27JzEN5Fb3LAitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guRgYMnh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2409E1F000E9;
	Thu, 18 Jun 2026 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781791549;
	bh=tVAxdJW7jC5jS/EGdsY03Ok8EVfqupezCmX7jIRIDTo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=guRgYMnh8lVzlhkg5QOvp9HmCWhWuAtur1nhXuuAxmi6OyIatGXW/4AAMLdpMjQZ1
	 BuGWAcPIdh4D25J9fv4Shd3xBjt3f8rffxUrUvc9J/ZnbB2f7lgqId/h2fm1RM/uL0
	 g8VGGkSgiqmlL1jFWg468nX031Kwq6ZlSCQ5LfUfSZ8/stVkSvSFM4Tqe1gYl5N6Mp
	 dg/VYKXQiT3K05iCarleYoF4Pmr61oApqv8o7lJKdF7Ryl6YiVZ6HerRjgVQgjfpQS
	 SypMSRxtr5kFuPKLlZgazCm+kz//yoP5XVt+o4fkAcCQgpWwLZCY6wsKabtoZnhzIQ
	 rasK12Ot6W1Bw==
Message-ID: <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
Date: Thu, 18 Jun 2026 23:05:43 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
From: Harry Yoo <harry@kernel.org>
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Content-Language: en-US
In-Reply-To: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev.jain@arm.com,m:ryabinin.a.a@gmail.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:ryan.roberts@arm.com,m:anshuman.khandual@arm.com,m:kaleshsingh@google.com,m:21cnbao@gmail.com,m:david@kernel.org,m:will@kernel.org,m:catalin.marinas@arm.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[arm.com,gmail.com,linux-foundation.org,lwn.net];
	TAGGED_FROM(0.00)[bounces-92776-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,gmail.com,arm.com,googlegroups.com,kvack.org,vger.kernel.org,linuxfoundation.org,lists.infradead.org,kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C88EC6A0CC7



On 6/18/26 10:35 PM, Harry Yoo wrote:
>=20
> Hi Dev,
>=20
> On 6/12/26 1:44 PM, Dev Jain wrote:
>> Introduce a boot option to tag only at allocation time of the objects.=
 This
>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>> catching bugs.
>=20
> I think most of overhead when enabling MTE comes from loading and
> validing tags for every memory access (either in SYNC or ASYNC mode),
> rather than from storing tags.

Is there any reason not to use STGM instead of STG + DC GVA when
setting/clearing tags for large sizes when we know they are properly
aligned?

>> Now, when a memory object will be freed, it will retain the random tag=
 it
>> had at allocation time. This compromises on catching UAF bugs, till th=
e
>> time the object is not reallocated, at which point it will have a new
>> random tag.
>>
>> Hence, not catching "use-after-free-before-reallocation" and not catch=
ing
>> "double-free" will be the compromise for reduced KASAN overhead.
>=20
> I doubt users who care about security enough to enable HW_TAGS KASAN
> are willing to compromise on security just to save a few instructions
> to store tags in the free path.
>=20
> To me, it looks like too much of a compromise on security for little
> performance gain.
>=20
>> This is an RFC because we are not clear about the performance benefit.=

>>
>> Android folks, please help with testing!
>>
>> ---
>> Applies on Linus master (9716c086c8e8).
>>
>> Dev Jain (2):
>>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>>   kasan: hw_tags: Add boot option to elide free time poisoning
>>
>>  Documentation/dev-tools/kasan.rst |  4 +++
>>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++-=
-
>>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>>  3 files changed, 69 insertions(+), 3 deletions(-)
>>
>=20

--=20
Cheers,
Harry / Hyeonggon


