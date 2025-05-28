Return-Path: <linux-doc+bounces-47670-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9AAC65EE
	for <lists+linux-doc@lfdr.de>; Wed, 28 May 2025 11:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E141BC3C00
	for <lists+linux-doc@lfdr.de>; Wed, 28 May 2025 09:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638A12777E8;
	Wed, 28 May 2025 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNcbLzgU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD2227603D
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424395; cv=none; b=SPyrm3f0+bmLuxbCLdcNPvLKG07kTsbjwVJ0I7G28el2FHBQioXBkncNMUCwIag7roYhdZxt+j4F6DgPwoxpKG8P4pzWSFN/Rm0KxIgxhv5tiffoWHwWLM/o7c1oJgwciPicmoaJqdXiZlfr+iXOWot6J08voX6o3+V4TBOiz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424395; c=relaxed/simple;
	bh=vj1+j1lPmffXy+nhdyFU/7u5jP6qvFv0RIg0cfeRFbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPguuywN0lQSfDwMuN2XNgkQJKjpq+5rbiIX5fEq/l4p2gQBFV9S7H0+sJGrTd5FFYSbG3eHIa1r/N6v5pcVFodPi+QO/uu4JuGzuLZYDwEf9Ui6Dsrpd1gue6+iT5KhlOKY6W1eNqdL7RlGGoW2kQCU7naOYIz3t27fIgG3Tpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNcbLzgU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748424392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/IPo0SrIcdmv1Mt6IhlShcwG0axbL9uVKe88/cZWdGg=;
	b=DNcbLzgUC59EjwUvOZW+Ib7xflu6R6yqd/RLb5a6T68rPVnR9AqEnwanHQqhXcj1PTmmdN
	6u1fZITHybGj+sWSWx315HOHMJivi5sX/kbTlH5gEvHOkI/j8twh6cm9jyezssugNDti2b
	7MtVRpeUZ8vQ+rD9f79xmGbCKoxrTvM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-xFcD1eSONEmec6D95QyRhg-1; Wed, 28 May 2025 05:26:30 -0400
X-MC-Unique: xFcD1eSONEmec6D95QyRhg-1
X-Mimecast-MFC-AGG-ID: xFcD1eSONEmec6D95QyRhg_1748424389
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442f90418b0so22764495e9.2
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 02:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424389; x=1749029189;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/IPo0SrIcdmv1Mt6IhlShcwG0axbL9uVKe88/cZWdGg=;
        b=OKkTW5Iib+kEFYwphh32Guqg0VgFugQsi5W3MhJflbvwI5mRg0GGHwzBUnYS62LmcQ
         6ZZ7T/HT2dv4Mo7EDDpMD2lFEqU49q/irT9Fm6IWy79jw+VTwsarAedCgRlY9hhNGRwI
         MNrwlnOC6zXsZ2uoKpQuk3HQcpUD5H8SWzq/oMl01D1g+uinuqkbE0eYMy13fCsIbDo5
         iGf++UFzC6zMl1PcRcVLHBCUAiS9kUkskQ/6iyypJxKkZY7cAjTriCllGy23/Praci96
         RwjoWQZGdT3sC2gY+juThDcrX5ljLyI2J3OdpXPhgWalJOuPGKLATvA+Rti+gBhFxK8c
         9Rpw==
X-Forwarded-Encrypted: i=1; AJvYcCXfhAcorG/akRBE/1fSsDdGucy/gNQLIdizVyaj/5pT3UR3WMe0LU0CkaXXWE9OxObdHPyJwBC5qQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzHcMedjORe5k8eKcmt727R+mNYSNQxFsCjJzkbXFLKdPOENPw
	V7ptoY36t+bQ3uH9Fro2AVYTajDGZgtpWjobIdQVahNmcDIHqX2GJ5bGB4/MFEFgGdaKF/4QdBv
	gP4x9leGWzEGabVr7zOmkIyH9CPOZHAzFG//7/DGuVcEUXdLq4yyw+mf6M8h4wg==
X-Gm-Gg: ASbGncuCRCOZB6nerefPl3xfJ1XeO8g6u8snWIsyWT1B0c48Je1ChMDora4zH5FH0Y3
	6cIIw9KCCSKf5ph792ECMqzi5y6yDJxTtJKJMf+AlyPqIq554bLd0oeUoOAZu7qDo1D3BgxvtqX
	WwEDTn6OAeDNWWE1Omi8x+Jq2M3Ucw9D9lHfslCC1pRD+bRNoa2pdMPpGpGxS7doOSJ72CDw3WH
	TNub0RpyKgh4MA790XwDAJ+wQPOV8ONazHU6RfLnIJCXsa/F+rXVlxX0bR/O4y71zs9UVFbLhMH
	pP9ScgopZ+sj9T0265QBz+aRHMbMPLGQz53mQMctZ89lz9jOjNnmRswZS6YzXxxT+3kzoYMazcV
	qfDy7l74ZFHjWJO38HtZjApVkEagUCeC7ep0WvWk=
X-Received: by 2002:a05:600c:1d28:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-44c9141d817mr146189015e9.6.1748424389315;
        Wed, 28 May 2025 02:26:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGalrtI0HwZaMrepFXd4F1+zcxY5naKOu8XqoCC1vfYgf8Dk2wh+4oAhih6mGXHyBbyAf6+hQ==
X-Received: by 2002:a05:600c:1d28:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-44c9141d817mr146188475e9.6.1748424388770;
        Wed, 28 May 2025 02:26:28 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f30:ec00:8f7e:58a4:ebf0:6a36? (p200300d82f30ec008f7e58a4ebf06a36.dip0.t-ipconnect.de. [2003:d8:2f30:ec00:8f7e:58a4:ebf0:6a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064a1ba1sm15277355e9.16.2025.05.28.02.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 02:26:28 -0700 (PDT)
Message-ID: <cf33ff99-ac97-4a33-9df0-01a59d5b8424@redhat.com>
Date: Wed, 28 May 2025 11:26:25 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, David Rientjes <rientjes@google.com>,
 zokeefe@google.com
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org,
 peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
 sunnanyong@huawei.com, vishal.moola@gmail.com,
 thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
 kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com,
 anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
 will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, hannes@cmpxchg.org, mhocko@suse.com,
 rdunlap@infradead.org
References: <20250515032226.128900-1-npache@redhat.com>
 <20250515032226.128900-7-npache@redhat.com>
 <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com>
 <CAA1CXcC9MB2Nw4MmGajESfH8DhAsh4QvTj4ABG3+Rg2iPi087w@mail.gmail.com>
 <ed1d1281-ece3-4d2c-8e58-aaeb436d3927@linux.alibaba.com>
 <CAA1CXcAWcahkxzsvK_bcWei6or_gKBjt+97dqhuSem8N7cBAQw@mail.gmail.com>
 <1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.05.25 11:39, Baolin Wang wrote:
> 
> 
> On 2025/5/21 18:23, Nico Pache wrote:
>> On Tue, May 20, 2025 at 4:09 AM Baolin Wang
>> <baolin.wang@linux.alibaba.com> wrote:
>>>
>>> Sorry for late reply.
>>>
>>> On 2025/5/17 14:47, Nico Pache wrote:
>>>> On Thu, May 15, 2025 at 9:20 PM Baolin Wang
>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2025/5/15 11:22, Nico Pache wrote:
>>>>>> khugepaged scans anons PMD ranges for potential collapse to a hugepage.
>>>>>> To add mTHP support we use this scan to instead record chunks of utilized
>>>>>> sections of the PMD.
>>>>>>
>>>>>> khugepaged_scan_bitmap uses a stack struct to recursively scan a bitmap
>>>>>> that represents chunks of utilized regions. We can then determine what
>>>>>> mTHP size fits best and in the following patch, we set this bitmap while
>>>>>> scanning the anon PMD. A minimum collapse order of 2 is used as this is
>>>>>> the lowest order supported by anon memory.
>>>>>>
>>>>>> max_ptes_none is used as a scale to determine how "full" an order must
>>>>>> be before being considered for collapse.
>>>>>>
>>>>>> When attempting to collapse an order that has its order set to "always"
>>>>>> lets always collapse to that order in a greedy manner without
>>>>>> considering the number of bits set.
>>>>>>
>>>>>> Signed-off-by: Nico Pache <npache@redhat.com>
>>>>>
>>>>> Sigh. You still haven't addressed or explained the issues I previously
>>>>> raised [1], so I don't know how to review this patch again...
>>>> Can you still reproduce this issue?
>>>
>>> Yes, I can still reproduce this issue with today's (5/20) mm-new branch.
>>>
>>> I've disabled PMD-sized THP in my system:
>>> [root]# cat /sys/kernel/mm/transparent_hugepage/enabled
>>> always madvise [never]
>>> [root]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
>>> always inherit madvise [never]
>>>
>>> And I tried calling madvise() with MADV_COLLAPSE for anonymous memory,
>>> and I can still see it collapsing to a PMD-sized THP.
>> Hi Baolin ! Thank you for your reply and willingness to test again :)
>>
>> I didn't realize we were talking about madvise collapse-- this makes
>> sense now. I also figured out why I could "reproduce" it before. My
>> script was always enabling the THP settings in two places, and I only
>> commented out one to test this. But this time I was doing more manual
>> testing.
>>
>> The original design of madvise_collapse ignores the sysfs and
>> collapses even if you have an order disabled. I believe this behavior
>> is wrong, but by design. I spent some time playing around with madvise
>> collapses with and w/o my changes. This is not a new thing, I
>> reproduced the issue in 6.11 (Fedora 41), and I think its been
>> possible since the inception of madvise collapse 3 years ago. I
>> noticed a similar behavior on one of my RFC since it was "breaking"
>> selftests, and the fix was to reincorporate this broken sysfs
>> behavior.
> 
> OK. Thanks for the explanation.
> 
>> 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")
>> "This call is independent of the system-wide THP sysfs settings, but
>> will fail for memory marked VM_NOHUGEPAGE."
>>
>> The second condition holds true (and fails for VM_NOHUGEPAGE), but I
>> dont know if we actually want madvise_collapse to be independent of
>> the system-wide.
> 
> This design principle surprised me a bit, and I failed to find the
> reason in the commit log. I agree that "never should mean never," and we
> should respect the THP/mTHP sysfs setting. Additionally, for the
> 'shmem_enabled' sysfs interface controlled for shmem/tmpfs, THP collapse
> can still be prohibited through the 'deny' configuration. The rules here
> are somewhat confusing.

I recall that we decided to overwrite "VM_NOHUGEPAGE", because the 
assumption is that the same app that triggered MADV_NOHUGEPAGE triggers 
the collapse. So the app decides on its own behavior.

Similarly, allowing for collapsing in a VM without VM_HUGEPAGE in the 
"madvise" mode would be fine.

But in the "never" case, we should just "never" collapse.

-- 
Cheers,

David / dhildenb


