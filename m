Return-Path: <linux-doc+bounces-58276-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A17B3EC98
	for <lists+linux-doc@lfdr.de>; Mon,  1 Sep 2025 18:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449ED188A172
	for <lists+linux-doc@lfdr.de>; Mon,  1 Sep 2025 16:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5D92DF13C;
	Mon,  1 Sep 2025 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAWY9GD5"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E21E2853
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745217; cv=none; b=dWMo9csHdLtuczRZfaCRi9GYtrahcOuDFYnm065HQ/JLZbgOxE1X5zgkFRacUBDvA5+iwB9j05bmrPK069/X+ZDSAxyR22qlhJE2iVIUlYD1iqPTwcGrlVmSlD8rolZBOE7QFfGEyVZlQ8lAVhT7L1/Hm942EZMW6Qp2k9klGfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745217; c=relaxed/simple;
	bh=X0oKnYbiVEjCHGsIrUvYtt0g2xuxFs5OUKmp5O1iF9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTrqO+MPdlfI6wRkZ67zZgduF/fqVYNwpojXESc1voOKmyg2pOVupyZiK/WJ99bCwciLvKskyDeI/q4WpoQ4XAqRBWR/dW/xZRX5SKLKPbge6Hyho7VWthUk9xI1Gd+2kPdDhF8/ShZYA8g4ZpR6HmXMEBmk4lE+uquIEu+Gr4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAWY9GD5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756745215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zvn18oPnLd+zvAZSKNse2+rKolpo9zqjbywvQFctj6g=;
	b=RAWY9GD5lCaK24KKlAYA9mz3sW8RDEXOzJmV9O/fAJ+0tN2ZWH01EoZyvfV5CDposGZfUI
	0uO7NTm5xoFaQri9O/uGk//BNvrd71/Uc1vITIyJBxphYjLb2yWXT5yOvq5A7SNbNS9jUP
	Jp3sUsxG2bw6zuiGeST39/6INW6vhrY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-qNM4Jl6zPoKA2NhLcsqOyg-1; Mon, 01 Sep 2025 12:46:54 -0400
X-MC-Unique: qNM4Jl6zPoKA2NhLcsqOyg-1
X-Mimecast-MFC-AGG-ID: qNM4Jl6zPoKA2NhLcsqOyg_1756745213
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b8af0b8deso8014985e9.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 09:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756745213; x=1757350013;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvn18oPnLd+zvAZSKNse2+rKolpo9zqjbywvQFctj6g=;
        b=Nc61m75dDLJVdV6WnZB7lJwxQYmzHraXnWFquQuBCtDyj4fJvb1OwuGDnqAy+DQ7Ah
         Rt1fJchR66m4535KHXKWBdSc4LBKBLMe78BTFDCTNNhtNmWBpTTgeRPcmIlOHyNZRdzm
         xttgLB/rdRuUe0BhyHtiDvIVKB9nf38d6u/qD17ovOxnMKnj06gV/TIVMvqOiQyHgoB4
         LtgPtRpSkvdCDLbydrBChbIFWLXGoxdJxYXnd1WEdzB1A3VDVTQjFFRIyXJU7C7z6wC6
         40nZsIot4fsnTjvuHSqrA61oEtOKatBQf+lcKB0CJe8EtJHHTY/4ecQEiKEu9OPuVEI2
         o7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCU0/XROsTZZjXCVYGB1siYRgmRv6FDohPDpP1ul2AP/FJQpIlieJbolD+uUkOA5qEufxAJejVS9wa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4PMsjvANov/JnfSWEfBEj9l4YofRDrs3XOsWoUZPGYoQ5Y1i
	40kHn5qLHOF3qeeHe55h7z5Px4QguUQZF5wMxstqiU5K+MdlCxQNHAZa1hKVmHJdCRZYnBxHYw6
	0XoOjIrGwkl1t+eIjkl/Mllg79NP8O+W+HpFFXod/InI9+0t/fY34eNmlOT78bw==
X-Gm-Gg: ASbGnctKQpPmxsg3E/XWZIWZJvoFY1kALXIPeCCFu9oGEhCalNczKM+pc+eEhSmysVE
	rcqOQcAnyC3ZkOLQPxaWo5eMrH/vHnuTAd2p3I34o//bPxGu4oKuQv4KV27h61rWVcI56plvbF2
	CQjaQTo4XfE48AG1VM5iKPmu6h7xrFjIJ9RAeTV6aoD8Uvx1xIHOUJoubUe4yfZd8aKy1Drwh3C
	+V/mvTPV6hiaIeI7V+6OE/fsR039KKOlyTH0I5B36NVCvCBHwUQYgL8TuL/+nUzsWlpMiHmMn7W
	D0DrDnBHAsmNWQMY2c/hGh4Jfh4LCXxNLTG8xFHNIcDlIuEyB0fV4DTZGZ777mEIPYEUP858aY4
	VeIhkEv/JQUCd6Dq7ptu1Fqhfxu8+56V4nEHfjik57hKVJ+kazClR4yniFuoydhIRZjQ=
X-Received: by 2002:a05:600c:3111:b0:45b:8c5e:5f8 with SMTP id 5b1f17b1804b1-45b8f43c876mr21537295e9.28.1756745212728;
        Mon, 01 Sep 2025 09:46:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+tnHEYgHg2xJrHLCrJvwVRM4CI/+qfgYSG+gAdqo4scSeNuoqAVtK5k8iywZ6wC6u9AF1Ug==
X-Received: by 2002:a05:600c:3111:b0:45b:8c5e:5f8 with SMTP id 5b1f17b1804b1-45b8f43c876mr21536995e9.28.1756745212302;
        Mon, 01 Sep 2025 09:46:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8f6cd502sm15397475e9.1.2025.09.01.09.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 09:46:51 -0700 (PDT)
Message-ID: <f34b5fcb-6a97-4d97-86a8-906083b53be6@redhat.com>
Date: Mon, 1 Sep 2025 18:46:44 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/13] khugepaged: mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Nico Pache <npache@redhat.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, ziy@nvidia.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, corbet@lwn.net, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250819134205.622806-1-npache@redhat.com>
 <e971c7e0-70f0-4ce0-b288-4b581e8c15d3@lucifer.local>
 <38b37195-28c8-4471-bd06-951083118efd@arm.com>
 <0d9c6088-536b-4d7a-8f75-9be5f0faa86f@lucifer.local>
 <CAA1CXcCqhFoGBvFK-ox2sJw7QHaFt+-Lw09BDYsAGKg4qc8nSw@mail.gmail.com>
 <CAA1CXcAXTL811VJxqyL18CUw8FNek6ibPr6pKJ_7rfGn-ZU-1A@mail.gmail.com>
 <5bea5efa-2efc-4c01-8aa1-a8711482153c@lucifer.local>
 <CAA1CXcBDq9PucQdfQRh1iqJLPB6Jn6mNy28v_AuHWb9kz1gpqQ@mail.gmail.com>
 <d110a84a-a827-48b4-91c5-67cec3e92874@lucifer.local>
 <95012dfc-d82d-4ae2-b4cd-1e8dcf15e44b@redhat.com>
 <bdbb5168-7657-4f11-a42d-b75cce7e0bca@lucifer.local>
 <e34e1ffe-c377-4c9a-b28b-ca873f3620ac@redhat.com>
 <db2320ee-6bd4-49c1-8fce-0468f48e1842@linux.alibaba.com>
 <c8c5e818-536a-4d72-b8dc-36aeb1b61800@arm.com>
 <2a141eef-46e2-46e1-9b0f-066ec537600d@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <2a141eef-46e2-46e1-9b0f-066ec537600d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.08.25 03:55, Baolin Wang wrote:
> 
> 
> On 2025/8/28 18:48, Dev Jain wrote:
>>
>> On 28/08/25 3:16 pm, Baolin Wang wrote:
>>> (Sorry for chiming in late)
>>>
>>> On 2025/8/22 22:10, David Hildenbrand wrote:
>>>>>> Once could also easily support the value 255 (HPAGE_PMD_NR / 2- 1),
>>>>>> but not sure
>>>>>> if we have to add that for now.
>>>>>
>>>>> Yeah not so sure about this, this is a 'just have to know' too, and
>>>>> yes you
>>>>> might add it to the docs, but people are going to be mightily
>>>>> confused, esp if
>>>>> it's a calculated value.
>>>>>
>>>>> I don't see any other way around having a separate tunable if we
>>>>> don't just have
>>>>> something VERY simple like on/off.
>>>>
>>>> Yeah, not advocating that we add support for other values than 0/511,
>>>> really.
>>>>
>>>>>
>>>>> Also the mentioned issue sounds like something that needs to be
>>>>> fixed elsewhere
>>>>> honestly in the algorithm used to figure out mTHP ranges (I may be
>>>>> wrong - and
>>>>> happy to stand corrected if this is somehow inherent, but reallly
>>>>> feels that
>>>>> way).
>>>>
>>>> I think the creep is unavoidable for certain values.
>>>>
>>>> If you have the first two pages of a PMD area populated, and you
>>>> allow for at least half of the #PTEs to be non/zero, you'd collapse
>>>> first a
>>>> order-2 folio, then and order-3 ... until you reached PMD order.
>>>>
>>>> So for now we really should just support 0 / 511 to say "don't
>>>> collapse if there are holes" vs. "always collapse if there is at
>>>> least one pte used".
>>>
>>> If we only allow setting 0 or 511, as Nico mentioned before, "At 511,
>>> no mTHP collapses would ever occur anyway, unless you have 2MB
>>> disabled and other mTHP sizes enabled. Technically, at 511, only the
>>> highest enabled order would ever be collapsed."
>> I didn't understand this statement. At 511, mTHP collapses will occur if
>> khugepaged cannot get a PMD folio. Our goal is to collapse to the
>> highest order folio.
> 
> Yes, I’m not saying that it’s incorrect behavior when set to 511. What I
> mean is, as in the example I gave below, users may only want to allow a
> large order collapse when the number of present PTEs reaches half of the
> large folio, in order to avoid RSS bloat.

How do these users control allocation at fault time where this parameter 
is completely ignored?

-- 
Cheers

David / dhildenb


