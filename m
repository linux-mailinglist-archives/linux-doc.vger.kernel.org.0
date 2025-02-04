Return-Path: <linux-doc+bounces-36742-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F50A26FA2
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 11:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA1C93A5D37
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 10:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113C320AF9A;
	Tue,  4 Feb 2025 10:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X6SzkhM0"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED8D20AF96
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666577; cv=none; b=iVzLQ2krdJdxQpWUUQ2ttmTFuGWF1tiQ/QXm7dZNoRijzmYOaC7+DTT3cTXZlZBe9QMho3kUtl+Gxs0JnaEPTI+7sDZOFrQ/lRvyNya/U/ezePu+gFarc1xIEtzUCndk33JJJL8UjY+cIBSG5zearMg5mcV7MWpW21MYFIdAVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666577; c=relaxed/simple;
	bh=d4wNJylMo9N8f2ILnf1m0W4Q9OBzaYDjyY1ZbBuslnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJvbkuDNlMQlT5GRdZCiW4qoLMkH14bjrP7jUG7zeEgFwZbfq9VePp1Yr+nj9IDGILZU2kAlvG4gyPr2QyjSkZLrZxghTPa3UK5moFpDLRcHfRjptHJhqLiOdAqGVyNdm0U3k/vFg6tV4+/2PpvAMH9bPUhJeJubS8EyqlbAYK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X6SzkhM0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738666575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ENPdj8vS//32EG5fwlsbuS9PmiW4rTWenuQKfCHE7XE=;
	b=X6SzkhM0ZEOeoVrW2I9AucgeD5lP7X3vPXTnHAOd7oB1ectwXAP0DhTGehU8ZtCg7x59ZD
	1moUBSb3WahCj9+/Ti22yJodxNjDPOb5yBmDX+duc3APjjCVzuq7Nv4GUK1lTzMFyahQN8
	wbiBCcqM4rVPjxoSJX0vJGZ/wF7fuoE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-YtyYyvkRP3a46q5Rn2Qiug-1; Tue, 04 Feb 2025 05:56:12 -0500
X-MC-Unique: YtyYyvkRP3a46q5Rn2Qiug-1
X-Mimecast-MFC-AGG-ID: YtyYyvkRP3a46q5Rn2Qiug
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38db0144bafso93323f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 02:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666571; x=1739271371;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ENPdj8vS//32EG5fwlsbuS9PmiW4rTWenuQKfCHE7XE=;
        b=ol2hLlqPUtidNSxxzQwI82x6wzqrJFf6QEsZpXI7txTuRjW6u3c1UKpLuqMfFUCiSF
         7oKe3NlQrCrdxkub9cT5lPZD4sCCw9g3as4Ahaui24U9lb/mfeDxqDma6bi0nVX4nn5x
         cfxvkYt+2CPYDRoW4WXfpmySxQIgyO6lV2jL828RK09QU4v07unQFNFEFjE8WK/poOk6
         VCcGJ7gYvWUwJM0iz+KbE8teQdjyFk9Z2A58NbA/NrIOKOMJgS/Fw+1MesqXLuQt6OrR
         vt658/bjdzSiUmZdwbEiuA/3H33ii9Bh2NKiDuAzKv6+jBueir9BucVVBWA5aMCAY4Bs
         UMGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZa3d2jQ9b//0frtNIdgrZjX1DVMWrmdT2OzQiWlTN7h6FpeSGgzDBpfNEVFvoazhAKNdQQeKifHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC/uXqZs7Mpqhbhm1ZKdW+e7/5A86cOjW+6m3azOM9GaI38Sp8
	3x7z+NYmJ+LWJQWnXiCqih4ASggcvDQOrUk7Wif700J02abpwutbFQt51/LZCvIFP8C+MzEn3rb
	YD+lWrrkwtE9sswAUgGgdpW7IDJYgUv2VCUpQVR/lqitFEqOPdc8yUs2tuA==
X-Gm-Gg: ASbGncsVZ9zgy3cRHXF7P2MJqGUTBnHTUUK2BW/1XD1BaH6+4GrkFebMgIY/d2J4MC6
	Jjm1z+lmqQ1CgUkHk3O3TPDCzNZJRIgup/JmQEWOX0rIxCPiXygrlkS9lhgTbcPsvYbDJGE/UQD
	wO7+hedUJDsozrU2FHO3TJkPQnsgFTYepBTdyPIzl3zFnTKcMib7nanWohjncBwMZf6CX+icuAy
	IjIW1g+aL4yKnLJdF0WGSTY10v89niNti15yOR32LmMLh6g/nQIy7HuCEpWbSgR2gvrxXXVG51C
	D+PzqeqQbdU7775TrnEkM9kUpx5vorl2ESVKSTEECGo5Is+nrDhfMEdb1/spnxL5WExAryZmAWH
	5t+QXaaf+5xAjhOF5bEG24kthkbk=
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38c5194a53dmr21633862f8f.14.1738666571294;
        Tue, 04 Feb 2025 02:56:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3rySAUqWFDjklN/nsVzTv51QU8ZGlK2qwHlBAwJac139RiPUXayk27Sc1Xngxx91aPNI8fw==
X-Received: by 2002:a05:6000:1a86:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38c5194a53dmr21633827f8f.14.1738666570873;
        Tue, 04 Feb 2025 02:56:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b57b6sm15474346f8f.72.2025.02.04.02.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:56:09 -0800 (PST)
Message-ID: <99f215f2-1e7f-4ff6-adec-e838916f6f4e@redhat.com>
Date: Tue, 4 Feb 2025 11:56:07 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <180e9c2f-51fe-44ba-ac68-5aa7b7918ab0@redhat.com>
 <c5befaa4-bd00-4784-ae66-ddbf16dfe1d9@redhat.com>
 <fp54u2cgvyyp73lpp7bbc5zn7fmyoc7pjn3sokqmlvpq5y7toq@mj6dshe3hg7o>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fp54u2cgvyyp73lpp7bbc5zn7fmyoc7pjn3sokqmlvpq5y7toq@mj6dshe3hg7o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 23:31, Alistair Popple wrote:
> On Thu, Jan 30, 2025 at 10:24:37AM +0100, David Hildenbrand wrote:
>> On 30.01.25 10:01, David Hildenbrand wrote:
>>> On 30.01.25 07:11, Alistair Popple wrote:
>>>> On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
>>>>> We require a writable PTE and only support anonymous folio: we can only
>>>>> have exactly one PTE pointing at that page, which we can just lookup
>>>>> using a folio walk, avoiding the rmap walk and the anon VMA lock.
>>>>>
>>>>> So let's stop doing an rmap walk and perform a folio walk instead, so we
>>>>> can easily just modify a single PTE and avoid relying on rmap/mapcounts.
>>>>>
>>>>> We now effectively work on a single PTE instead of multiple PTEs of
>>>>> a large folio, allowing for conversion of individual PTEs from
>>>>> non-exclusive to device-exclusive -- note that the other way always
>>>>> worked on single PTEs.
>>>>>
>>>>> We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
>>>>> that is not required: GUP will already take care of the
>>>>> MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
>>>>> entry) when not finding a present PTE and having to trigger a fault and
>>>>> ending up in remove_device_exclusive_entry().
>>>>
>>>> I will have to look at this a bit more closely tomorrow but this doesn't seem
>>>> right to me. We may be transitioning from a present PTE (ie. a writable
>>>> anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
>>>> therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
>>>> update their copies of the PTE. So I think the notifier call is needed.
>>>
>>> Then it is all very confusing:
> 
> Can't argue with that in hindsight :-)
> 
>>> "MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
>>> longer have exclusive access to the page."
>>
>> So the second sentence actually describes the other condition. Likely we
>> should make that clearer:
>>
>> --- a/include/linux/mmu_notifier.h
>> +++ b/include/linux/mmu_notifier.h
>> @@ -43,10 +43,11 @@ struct mmu_interval_notifier;
>>    * a device driver to possibly ignore the invalidation if the
>>    * owner field matches the driver's device private pgmap owner.
>>    *
>> - * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
>> - * longer have exclusive access to the page. When sent during creation of an
>> - * exclusive range the owner will be initialised to the value provided by the
>> - * caller of make_device_exclusive(), otherwise the owner will be NULL.
>> + * @MMU_NOTIFY_EXCLUSIVE: (1) to signal a device driver that the device will no
>> + * longer have exclusive access to the page; and (2) to signal that a page will
>> + * be made exclusive to a device. During (1), the owner will be NULL, during
>> + * (2), the owner will be initialised to the value provided by the caller of
>> + * make_device_exclusive().
> 
> Yes, I think that makes things clearer. Logically these are really two different
> events though - I guess I didn't want to add another one at the time but I
> wonder if we should just make them separate events rather than overloading them?

I had the same thought and then I wondered: can't we simply use 
MMU_NOTIFY_CLEAR for the exclusive->ordinary path?

I mean, it's essentially a zap+flush followed by a re-insertion of the 
PFN swap entry. Similar to page migration ...

-- 
Cheers,

David / dhildenb


