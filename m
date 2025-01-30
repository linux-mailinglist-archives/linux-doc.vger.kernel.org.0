Return-Path: <linux-doc+bounces-36459-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A4A2311C
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 16:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8661D166F8E
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 15:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050A1E9B11;
	Thu, 30 Jan 2025 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a2BsdTY+"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D8E1E0B74
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738251796; cv=none; b=pjP6yYkdm9+Cnbk3TovCk+HmInt0xt7wlSSsk5sTthjVMJoDNB/gRgs89jAwAncT1laXfi9a4+dk78gyCd8VVYs9ODnMB44O98rCNRjJdXBVdSBbFuJo5e7U7NT7j+ob1Usm9uhc3ZUICUZVIKt9pHs0qjrDIgIfBOKrOtn/+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738251796; c=relaxed/simple;
	bh=22A1Y4gI6DxYYwteH4vtrnvqyKs64d/Rt5SgtQwCGf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JvRROMlSVjScyDcDRcXOJP0JCvIUwZgkVzcyDKuCQkmveWop9nmBXnTER4vTK7Hkm6f/Gp/CQjTOKVd4BSegXAVbM3CuTuKjY1zDGNrXqNlpLatpqm698nC3ndZ9ftKDVR6ZaKOGMuIBnuHnDynJkfbx+ftrDeVANaIKJbaocqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a2BsdTY+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738251794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E8VqjgOdCdCLYF29XdRz8twWYIg6gPk2sCF7nSD+9Lc=;
	b=a2BsdTY+ZkiDcMOZp1ggN46td388vt45YOHgEyGt39vEDdozjg2XyRkrdYEn3WbfVcLlhF
	JxwldoFiPOH20ndr6+p+8cb48828oc9XokV6+VKFv0dtfd11Gg4aP4lSaQe5Z6m3DrgbAH
	mQKn+rz2isulrmmUeK1VG4ZhKRW8UaU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-EAneQgQ5PKCUEBE5102ogg-1; Thu, 30 Jan 2025 10:43:12 -0500
X-MC-Unique: EAneQgQ5PKCUEBE5102ogg-1
X-Mimecast-MFC-AGG-ID: EAneQgQ5PKCUEBE5102ogg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38bf4913669so473182f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 07:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251791; x=1738856591;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8VqjgOdCdCLYF29XdRz8twWYIg6gPk2sCF7nSD+9Lc=;
        b=aRruS/6QNnL4x4kTRYteVHXmoNg80V0djyecGTWwVfTjeo8MPwCo/kV6I+o5KXSYjT
         dg6wmynVHiTggRoBEra1MvXo4HSOqt6H5LBcbLKSznN3a8Wpfasrif3UaD3ICPEqird0
         xzU2MiJkihHP+uRWmqRZOTJroqcaROniTHf0AARmBQYjuTtxZcRq/9QwWdsEjICHU7Xp
         z2P4TrYPOR8ZVfsS2CzUXXVihs9GaPqW74ssIM0FyQXBIBfqLN2mf829gUujeYaQJXg7
         tD2cGZVIN5JKmOt9T5xOaiGGc3B6tkFV+8JyzdYqtzi+BSY+6VTWC+4geIz2GQSqfSI8
         DruA==
X-Forwarded-Encrypted: i=1; AJvYcCXKM1gu9qej2kyaRtnOcU4IYmu7zaeAtKaF3zPG13PSfqqWumf9oua3/Lznc45w4Ld/nyKELInZsU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHH2kLABXc3S8XuSsvX7AVoEKz95AVwgr4Pp+jxbNNLVjvqse2
	MiTjiQsV9+KKfPwBUcjc7qCJNOeMS6P/lijD1ixhxR/MKkWEX6f8iun3WwYtNQRXy2uC5E4mAgJ
	BCzaKudbH8IPxIPF6nU2BtiD4qZPnP9xWR6mLONCGF8NdDkJyB9HX3EkR2Q==
X-Gm-Gg: ASbGncvsmoxa4yv1bpyX7FBKXxKzFQY41olqUEjIXKktCMq0EnQ/+0jCmobT9OKa5gz
	jJiSlcjgSORHtwnZQSVh0mzEQNLbqEDSlLB+UKiuIjIeE4I1j9carzuAE5cIzTZaU4LLbzZsbf2
	Xd8Ipi9urUt+e9TR/b2oTmRx1N8zbtihtA6JJ0tKVZGp5mF8dMuMgo96W/3Qupd6UatUjRsNKud
	HckDzG5TOix3FZUWRNd3qxaW1hKOcmCa3R+cnuNO67rj9obJnrKirOg6OLQBFOrxGQh6q7Oyqp8
	FeX/tFI6RzoePr676LqgLeQeJTgKdI6k8+jPbiNlyziZWGCKJI+JYVRKSREqq7g0x4cyMuHYH4l
	kZ4D4/0pp7LRrBLp6VtU+RVbLwMK1HFxO
X-Received: by 2002:a5d:64e4:0:b0:38a:8d4c:aad3 with SMTP id ffacd0b85a97d-38c5194b957mr6843488f8f.18.1738251791453;
        Thu, 30 Jan 2025 07:43:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLO59HpypkIWrcJ/WRB/dj0EyzKgw1ZdKghuaXSMYdKrXN8wI/cUA3y+0uHXVGa3XTW9zA9g==
X-Received: by 2002:a5d:64e4:0:b0:38a:8d4c:aad3 with SMTP id ffacd0b85a97d-38c5194b957mr6843463f8f.18.1738251790992;
        Thu, 30 Jan 2025 07:43:10 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf560sm2281427f8f.89.2025.01.30.07.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 07:43:10 -0800 (PST)
Message-ID: <d70db67d-8989-4ce4-bc21-52a89449db4b@redhat.com>
Date: Thu, 30 Jan 2025 16:43:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
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
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-13-david@redhat.com>
 <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
 <887df26d-b8bb-48df-af2f-21b220ef22e6@redhat.com>
 <Z5t8dkujVv7xZiuV@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5t8dkujVv7xZiuV@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Assume you have a THP (or any mTHP today). You can easily trigger the
>> scenario that folio_mapcount() != 0 with active device-exclusive entries,
>> and you start doing rmap walks and stumble over these device-exclusive
>> entries and *not* handle them properly. Note that more and more systems are
>> configured to just give you THP unless you explicitly opted-out using
>> MADV_NOHUGEPAGE early.
>>
>> Note that b756a3b5e7ea added that hunk that still walks these
>> device-exclusive entries in rmap code, but didn't actually update the rmap
>> walkers:
>>
>> @@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>>
>>                  /* Handle un-addressable ZONE_DEVICE memory */
>>                  entry = pte_to_swp_entry(*pvmw->pte);
>> -               if (!is_device_private_entry(entry))
>> +               if (!is_device_private_entry(entry) &&
>> +                   !is_device_exclusive_entry(entry))
>>                          return false;
>>
>>                  pfn = swp_offset(entry);
>>
>> That was the right thing to do, because they resemble PROT_NONE entries and
>> not migration entries or anything else that doesn't hold a folio reference).
> 
> Yeah I got that part. What I meant is that doubling down on this needs a
> full audit and cannot rely on "we already have device private entries
> going through these paths for much longer", which was the impression I
> got. I guess it worked, thanks for doing that below :-)

I know I know, I shouldn't have touched it ... :)

So yeah, I'll spend some extra work on sorting out the other cases.

> 
> And at least from my very rough understanding of mm, at least around all
> this gpu stuff, tracking device exclusive mappings like real cpu mappings
> makes sense, they do indeed act like PROT_NONE with some magic to restore
> access on fault.
> 
> I do wonder a bit though what else is all not properly tracked because
> they should be like prot_none except arent. I guess we'll find those as we
> hit them :-/

Likely a lot of stuff. But more in a "entry gets ignored -- 
functionality not implemented, move along" way, because all page table 
walkers have to care about !pte_present() already; it's just RMAP code 
that so far never required it.

[...]

> 
>> If thp constantly reassembles a pmd entry because hey all the
>>> memory is contig and userspace allocated a chunk of memory to place
>>> atomics that alternate between cpu and gpu nicely separated by 4k pages,
>>> then we'll thrash around invalidating ptes to no end. So might be more
>>> fallout here.
>>
>> khugepaged will back off once it sees an exclusive entry, so collapsing
>> could only happen once everything is non-exclusive. See
>> __collapse_huge_page_isolate() as an example.
> 
> Ah ok. I think might be good to add that to the commit message, so that
> people who don't understand mm deeply (like me) aren't worried when they
> stumble over this change in the future again when digging around.

Will do, thanks for raising that concern!

> 
>> It's really only page_vma_mapped_walk() callers that are affected by this
>> change, not any other page table walkers.
> 
> I guess my mm understanding is just not up to that, but I couldn't figure
> out why just looking at page_vma_mapped_walk() only is good enough?

See above: these never had to handle !page_present() before -- in 
contrast to the other page table walkers.

So nothing bad happens when these page table walkers traverse these 
PTEs, it's just that the functionality will usually be implemented.

Take MADV_PAGEOUT as an example: madvise_cold_or_pageout_pte_range() 
will simply skip "!pte_present()", because it wouldn't know what to do 
in that case.

Of course, there could be page table walkers that check all cases and 
bail out if they find something unexpected: do_swap_page() cannot make 
forward progress and will inject a VM_FAULT_SIGBUS if it doesn't 
recognize the entry. But these are rather rare.

We could enlighten selected page table walkers to handle 
device-exclusive where it really makes sense later.

-- 
Cheers,

David / dhildenb


