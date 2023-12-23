Return-Path: <linux-doc+bounces-5845-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A7F81D0B0
	for <lists+linux-doc@lfdr.de>; Sat, 23 Dec 2023 00:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2781C22A0B
	for <lists+linux-doc@lfdr.de>; Fri, 22 Dec 2023 23:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2204D591;
	Fri, 22 Dec 2023 23:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OYoimchm"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD184D589;
	Fri, 22 Dec 2023 23:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CE2084E5;
	Fri, 22 Dec 2023 23:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CE2084E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1703289255; bh=XlB1wd1VCQLHKocsK4YSd66HRtHyBkBGlNplbd+BhZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OYoimchm8ttgASBklYCZCEHNL52ctVdF8aQUfUUQgSsj8lTO+jUbJ1i5Fv3EA9Cqn
	 jEY2JoDgjU3QqmaxS9bsm6ojUW28lF0ks/PPJRilawgzl/Jv4kVK8C9IxzjSVk8Pjf
	 k+POtI1yAamEbjIA3VRKZPnQhzsE99QOgBM6qWTm8dfJaA4PqFo3IdXf+izTCqocb4
	 1uE3jC7RjfaV+uMyz3b7sOpCXfL81v01XBkdTFlT6yTDbMPhyUUFNi1swysn4cD646
	 27lvQsRF+a78f8BXkSBe5eFlBy4Hs8IZjitr1AIZgAyDOGcfom72g1D95PbMcUPBhN
	 f4gIB8bZGbeaQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] scripts/kernel-doc: restore warning for Excess
 struct/union
In-Reply-To: <b9165c65-0cbe-43f0-8634-361308a01972@infradead.org>
References: <20231214070200.24405-1-rdunlap@infradead.org>
 <875y0zqvjr.fsf@meer.lwn.net>
 <93e1b9fa-c447-4f7d-9dc7-825ebe9e1cde@oracle.com>
 <877cl7a8gh.fsf@meer.lwn.net>
 <b9165c65-0cbe-43f0-8634-361308a01972@infradead.org>
Date: Fri, 22 Dec 2023 16:54:13 -0700
Message-ID: <87wmt56bfe.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> On 12/21/23 07:20, Jonathan Corbet wrote:
>> Vegard Nossum <vegard.nossum@oracle.com> writes:
>> 
>>> On 15/12/2023 17:28, Jonathan Corbet wrote:
>>>> *sigh*
>>>>
>>>> This adds nearly 600 new warnings.  Anybody gonna help fix them?
>>>
>>> I think in the vast majority of the cases the fix will be to just remove
>>> the offending line from the kerneldoc, so it's not particularly
>>> difficult, mostly just overhead from the patch preparation/submission
>>> process.
>>>
>>> I'd be happy to take a stab at it -- I think we could even script most
>>> of it. Respond here, I guess, if anybody else wants to do some so we can
>>> split it up.
>> 
>> It's mostly done; I've gotten it down to under 200 and sent patches to
>> make the changes.  Randy is working on it too, I know.  It's not always
>> just deletion, but the fixes are usually pretty straightforward.
>> 
>
> I'm still seeing lots of Excess warnings from
>   include/crypto/hash.h
>   include/crypto/skcipher.h
>   drivers/gpu/drm/*  (several files there have warnings)
>
> I would be happy to see Vegard's help on this - unless Jon has already
> addressed those warnings.

Nope, I've not gone there and won't manage it before sometime next week
at best.  I'd be delighted if somebody waded into those warnings.

Thanks,

jon

