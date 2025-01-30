Return-Path: <linux-doc+bounces-36413-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD98A22A68
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 10:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CDCA164FBC
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 09:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E631A7046;
	Thu, 30 Jan 2025 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bg7NcNTG"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D06119DFAB
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229835; cv=none; b=rwHefPG0/W39lG5HN2kKkyJZWL9p7pnMJTLx0JucnYkxs1E3TTDRDKMbGf3FVm/IVZtAMpdK5aLNS5TgNOY9yLmea1pElFBWZoS5WzcDQXdh+fpwNptCI5Of/ePYTY8jgE2WGd1lkPZa8VmH/CbT478aub7q/R2yynfLZkJ2aMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229835; c=relaxed/simple;
	bh=hqwUUAKD/2X+f3M7KGlEHqtIr1PtTeNni8FnMEfLJDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhbU1wIyWlCAjH8BLnGY/f3HTfV/25SWqg7PKdvkbrkpgYVV01jjYPc8j349FZNBqfF1+HqxeNr+0UQbZFTsMxm7JMixf0/iL6AubwdBeX/irgBEGNU32BpYAWbVOOsqdV1RQxoPn7SGUGy5tDcWq3kQIhiBU73TpJrE5XpF8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bg7NcNTG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738229832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3kdU/L5xd79PteTNjpUCBI4Yw4DItXoQloKWRI6FyAk=;
	b=Bg7NcNTGH+g5JuyWYEd2SmWFzddJXu6y7NdW4ScmwseZnQpZq2xN8VZFP76LSO1hO4y6xr
	Mnaqc/pxfY5OJ0JeJpJvwibiqiZtTPh/g7ET1rhRfRyZWN17XpXroZRNKGFBPLX/24zid2
	cCniLAyV1BzFtng0RNGL3HWqEXvHtQw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-5n0oap70Nuu9gpS9-8cWKQ-1; Thu, 30 Jan 2025 04:37:11 -0500
X-MC-Unique: 5n0oap70Nuu9gpS9-8cWKQ-1
X-Mimecast-MFC-AGG-ID: 5n0oap70Nuu9gpS9-8cWKQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385e49efd59so217512f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 01:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229829; x=1738834629;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3kdU/L5xd79PteTNjpUCBI4Yw4DItXoQloKWRI6FyAk=;
        b=Xl/fqrAEzR1kHKlEcVmB5XOG4UP+rG+4cQyymdUBN8vqgH+QpX0rbCApwYBhTVFPO2
         4C6aZe3aDArGP+Rpfn7sA/MWVV8phPu9D6j9FQqkc2Jg7nobPsaAfArqP+AqT0xBIm5F
         hega8uaJ37w81Bx0EBr1nZL341tkfAZBwxIGqvtgjx/DY+Qp7djohitXbj6bUc9bzGFc
         /OYCa2UTpj5CDRYz346E4QfW7p3Na9pPuqgBhEB6Q3Hktq38IyyoZVhHgXsffUWqc9+G
         BpXmkn7s7YZIExXMHoTc1nbCgnk7Xcv3ndVBL2RbprR2viJYF4XOvG54cglISRJbacTK
         9UpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv0y3R8FU3ONcHkmmnRY3vsA4KciObx6Jt7Lf/nXGOIPEsRsBc0kgUOfLAESmkE8G3oRyi2IWsmRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8du/t6fHZ/FlOYThmHiThaQb3P+80W9guo5g+t647gEpghCu1
	wo3P/XGSvOybfC5sfDCBSkrd2Vg9/HUMTNhf34ue9XzQf0VROyUA/F8WQzYhSN5ggWxS88tCtcT
	EAXl0ggkhvQbBrSR/D+dlm2z5JyjwQ4c/7k5495Luda7rffifLBdPaXdY3g==
X-Gm-Gg: ASbGncu86MbmEPK5mAyBFsZIJW5BCCOpiUr5rWs9PXGdsuU71cb9eld2cZ/vLZyksjx
	ueqO8rk2hZm7rA320RSo+kZdmucJe7f943sSvHRl7eiZGJIm9oAgfs03bdzO5iu4iMS4CP4OCpt
	kKC8Z62jIGYcvqlwwq17NtXkokuZayxwwxKE/0UilawP4DHEZLS827IApCYhvA/6haascPoKWBg
	Jor7KP2aDUqRqM+B5kPfck+1gglHhnqDoneJSUCtYmQz+SmcjBvxT16odzFfB8fooADYZethcxG
	Ifj6fSBojW50zwny/BOYxqUFBD4Ho6dODfA3kGAsW2HI
X-Received: by 2002:a5d:5f56:0:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38c520a3440mr5985883f8f.40.1738229828907;
        Thu, 30 Jan 2025 01:37:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmAd454SvhnDSPUC2cvJylI8DQVDwOTDDF/Jmld01WGs8833hpVqeeOcnbrG6JwbX27Vu7ug==
X-Received: by 2002:a5d:5f56:0:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38c520a3440mr5985852f8f.40.1738229828554;
        Thu, 30 Jan 2025 01:37:08 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41? ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c121951sm1419530f8f.45.2025.01.30.01.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:37:08 -0800 (PST)
Message-ID: <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
Date: Thu, 30 Jan 2025 10:37:06 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
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
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 01:27, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
>> Let's document how this function is to be used, and why the requirement
>> for the folio lock might maybe be dropped in the future.
> 
> Sorry, only just catching up on your other thread. The folio lock was to ensure
> the GPU got a chance to make forward progress by mapping the page. Without it
> the CPU could immediately invalidate the entry before the GPU had a chance to
> retry the fault.
 > > Obviously performance wise having such thrashing is terrible, so should
> really be avoided by userspace, but the lock at least allowed such programs
> to complete.

Thanks for the clarification. So it's relevant that the MMU notifier in 
remove_device_exclusive_entry() is sent after taking the folio lock.

However, as soon as we drop the folio lock, 
remove_device_exclusive_entry() will become active, lock the folio and 
trigger the MMU notifier.

So the time it is actually mapped into the device is rather

> 
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/memory.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 46956994aaff..caaae8df11a9 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
>>   }
>>   #endif
>>   
>> +/**
>> + * restore_exclusive_pte - Restore a device-exclusive entry
>> + * @vma: VMA covering @address
>> + * @folio: the mapped folio
>> + * @page: the mapped folio page
>> + * @address: the virtual address
>> + * @ptep: PTE pointer into the locked page table mapping the folio page
>> + * @orig_pte: PTE value at @ptep
>> + *
>> + * Restore a device-exclusive non-swap entry to an ordinary present PTE.
>> + *
>> + * The folio and the page table must be locked, and MMU notifiers must have
>> + * been called to invalidate any (exclusive) device mappings. In case of
>> + * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
>> + * fault MMU_NOTIFY_EXCLUSIVE is triggered.
>> + *
>> + * Locking the folio makes sure that anybody who just converted the PTE to
>> + * a device-private entry can map it into the device, before unlocking it; so
>> + * the folio lock prevents concurrent conversion to device-exclusive.
> 
> I don't quite follow this - a concurrent conversion would already fail
> because the GUP in make_device_exclusive_range() would most likely cause
> an unexpected reference during the migration. And if a migration entry
> has already been installed for the device private PTE conversion then
> make_device_exclusive_range() will skip it as a non-present entry anyway.

Sorry, I meant "device-exclusive", so migration is not a concern.

> 
> However s/device-private/device-exclusive/ makes sense - the intent was to allow
> the device to map it before a call to restore_exclusive_pte() (ie. a CPU fault)
> could convert it back to a normal PTE.
> 
>> + * TODO: the folio lock does not protect against all cases of concurrent
>> + * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
>> + * must already use MMU notifiers to sync against any concurrent changes
> 
> Right. It's expected drivers are using MMU notifiers to keep page tables in
> sync, same as for hmm_range_fault().

Let me try to rephrase it given that the folio lock is purely to 
guarantee forward-progress, not for correctness; that's what MMU 
notifiers must be used for.

-- 
Cheers,

David / dhildenb


