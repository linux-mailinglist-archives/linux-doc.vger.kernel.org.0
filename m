Return-Path: <linux-doc+bounces-46832-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA20ABD2D1
	for <lists+linux-doc@lfdr.de>; Tue, 20 May 2025 11:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D278A54B2
	for <lists+linux-doc@lfdr.de>; Tue, 20 May 2025 09:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B5B263898;
	Tue, 20 May 2025 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W/Azni7m"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE625742A
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732153; cv=none; b=sBWBMdElRJXRACvERyYJBy3ruDrA2P4yRBeA1Jj+NptWXiDEO75HxjDZYBK6DpJJk0jewcWNqXmiYoipUJ6XaaXNGyUIp/vHr8vod05n6EtMb1cWce0Y7ZY1EKEMhpnsKmbglHOkDCGvwCBjtnBTf5cX2dWdCbt3Wmd0D3opfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732153; c=relaxed/simple;
	bh=i189y3JicnOaB/mVZ8D5BCO5Hqn0YOHD+KDV+ksF/Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7OTukEFnHb2+DsY9XkqTKJ/ws7wseF7zaRcGD9W8WE1fXwkzTcmIFJrdLwCtgrQyo75DbVmLf3m06NwEf16slmn05pUB6qx6whsglnvLC4rppKztFP91fkOFv9M4cdbugZqi/xncSyPq4ui9WjtdxoFCAqS1yUkz8oTN6NB9sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W/Azni7m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747732150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fy68e5jAh3724JC4rcZ3X5I4NSu8tckhblr3+hmPAsA=;
	b=W/Azni7mm1PMs+cm03fP0tgyNyT4fasqKPchcCnWYRcTKBTTcCSMn6d03gqhj2ol3CIorv
	nqHvW/Uh6o3zhAa/W/Vo9imrTtIsrcGP72mC/1cFhjvjvtJ/A6cVvXXKo7YHfxkQfy2Dyl
	4uHIlaz6eKqGkMOm/QmzAonLd9YTbMU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-Zv6H6FjCNw2CBWJnriKN6A-1; Tue, 20 May 2025 05:09:08 -0400
X-MC-Unique: Zv6H6FjCNw2CBWJnriKN6A-1
X-Mimecast-MFC-AGG-ID: Zv6H6FjCNw2CBWJnriKN6A_1747732147
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eed325461so30963535e9.3
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 02:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732147; x=1748336947;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fy68e5jAh3724JC4rcZ3X5I4NSu8tckhblr3+hmPAsA=;
        b=g6eGyxB5dG65XgPs/74J5f7/vaBogPQ3JKqYHKp1mJS+yRjolM4cgZNGEwqOL+KUCb
         hz69c7uvHCXQC520dsk7V0UJZTJU25KD0dRFc+8C4sYJz2lmILT71cyXh7m5qultzBQ6
         wEoFMx3g9ZTKIe/aqm6ieHBRwU3ViUcr0ieSF8x0iBAjzmHPtuVvxJtHYmGkHhJgkMot
         saPp+hvQjSY6mz6onBYh4zE/01zuJywM4Gc/1l2eRQWsJj2W27nrO9u+al5046V4NzQZ
         1Yb2vD3e1QWCG5NtdzckzNBQnCySh5pKnI7BmVBFYSiJfZZjRDXx31bAl0S1LslHcCHs
         ihsg==
X-Forwarded-Encrypted: i=1; AJvYcCXIFiiOmEcdAfuNg7c4QnDMCf6g/2BQ6geQbesH6pp3FEszr+6p+K5JfIFACuEsorSakXRz5JClFBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQytxHM1Ia9cfd0qa223Tdnu1ZleXqyWZxs/INT6HS+xrptzmY
	+vbeWEQ2tXBd433G6ApasiY7Gc3TsgYYPQotEnGwInUrGbfpaE+ZDOhxg+rh1Qt2WOjF6YfMohb
	Ff9xGdr7trDzcrblmLolSElBEpzdLKuZNp2Zqu2o4GZ4jZER/OkogSKSbuGg3rQ==
X-Gm-Gg: ASbGnctZU3/4XbYuVXSQeKtmcGJEvE2D+hvAb57WUVNnaguw+6FI7iy3UJNN8I+aCfh
	kEp4Q7Lh3DA5ah9dMg1/eMarwwiM5SXJDLvSUDK55Io9/6rU8eyzPmsRCjSbDPtRzPKnPLPCefu
	lXNjHWEH318ncHkFaqxzhijIbKCgw20BdcG/U8w7/3LVt5/vxYZB+J+ei8jPa4LHe1ReXwXSR/X
	6faC+ihJXa4EbQMJJpbpp7ZQoIxQlYbs1Uw1UD2m17Wl2W5edizyqkkuQghcaozvKvATxwVwIRu
	ulkr+yp1I1zMRDGVRqmMuLYYkKgSG9eQFQYNUy54K5XcBm/d8QrZrhsnn4LcKqzmEJ0+EZCNkPD
	skKQsK9SuZsV50V0YAl+dMQ+BP1RN0uiCDaT1mws=
X-Received: by 2002:a05:6000:401f:b0:391:4ca:490 with SMTP id ffacd0b85a97d-3a35fe951d1mr14213990f8f.29.1747732147332;
        Tue, 20 May 2025 02:09:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4UwqKv/S4hpb4W/UurGSAAjxCwB6mQ/y5lcCLudd2V8P5i6xAWnw8jxB/XZ53zEoEBGBjZQ==
X-Received: by 2002:a05:6000:401f:b0:391:4ca:490 with SMTP id ffacd0b85a97d-3a35fe951d1mr14213961f8f.29.1747732146964;
        Tue, 20 May 2025 02:09:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f16:e400:525a:df91:1f90:a6a8? (p200300d82f16e400525adf911f90a6a8.dip0.t-ipconnect.de. [2003:d8:2f16:e400:525a:df91:1f90:a6a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62204sm15406514f8f.42.2025.05.20.02.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:09:06 -0700 (PDT)
Message-ID: <6e27e97c-db1a-437e-93ac-f7c1329b0e00@redhat.com>
Date: Tue, 20 May 2025 11:09:05 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 vbabka@suse.cz, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <20250519223307.3601786-3-usamaarif642@gmail.com>
 <CAG48ez2y_PP7Uba8uq_Y+auKRUHPcJ19Nnn15GAaVS=M4DC73g@mail.gmail.com>
 <13d618ed-2cdb-4a5b-9dd4-189f65244a60@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <13d618ed-2cdb-4a5b-9dd4-189f65244a60@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20.05.25 07:23, Lorenzo Stoakes wrote:
> On Tue, May 20, 2025 at 01:01:38AM +0200, Jann Horn wrote:
>> On Tue, May 20, 2025 at 12:33 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>> This is set via the new PR_SET_THP_POLICY prctl. It has 2 affects:
>>> - It sets VM_HUGEPAGE and clears VM_NOHUGEPAGE on the default VMA flags
>>>    (def_flags). This means that every new VMA will be considered for
>>>    hugepage.
>>> - Iterate through every VMA in the process and call hugepage_madvise
>>>    on it, with MADV_HUGEPAGE policy.
>>> The policy is inherited during fork+exec.
>>
>> As I replied to Lorenzo's series
>> (https://lore.kernel.org/all/CAG48ez3-7EnBVEjpdoW7z5K0hX41nLQN5Wb65Vg-1p8DdXRnjg@mail.gmail.com/),
>> it would be nice if you could avoid introducing new flags that have
>> the combination of all the following properties:
>>
>> 1. persists across exec
>> 2. not cleared on secureexec execution
>> 3. settable without ns_capable(CAP_SYS_ADMIN)
>> 4. settable without NO_NEW_PRIVS
>>
>> Flags that have all of these properties need to be reviewed extra
>> carefully to see if there is any way they could impact the security of
>> setuid binaries, for example by changing mmap() behavior in a way that
>> makes addresses significantly more predictable.
> 
> Indeed, this series was meant to be as RFC as mine while we still figured this
> out :) grr. Well, with the NACK it is - in effect - now an RFC.
> 
> Yes having something persistent like this is not great, the idea of
> introducing this in my series was to provide an alternative generic version
> of this approach that can be better controlled and isn't just a 'tacked on'
> change specific to one company's needs but rather a more general idea of
> 'madvise() by default'.
> 
> I do wonder in this case, whether we need be so cautious however given the
> _relatively_ safe nature of these flags?

Yes. Changing VM_HUGEPAGE / VM_NOHUGEPAGE defaults should have little 
impact, but we better be careful.

setuid execution is certainly an interesting point. Maybe the general 
rule should be, that it is not inherited over secureexec unless 
CAP_SYS_ADMIN?

-- 
Cheers,

David / dhildenb


