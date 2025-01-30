Return-Path: <linux-doc+bounces-36410-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1DAA22A14
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 10:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44C83A5FFD
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 09:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C61B4143;
	Thu, 30 Jan 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpzVNkSQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E181AF0D8
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738228352; cv=none; b=CuPQ7ELRJgq3KHIRLq40A/F3KBy9M5g2eZd4osif7edd/u8YpwF/ZTGnGerrHxO1fbXNm5L2O030JmFZ2ZLg80E1nPvTYabKkkeQGCCtk8iDKjn55v4LZ6oUXGb1eNliRGeYiVadXI74L8vEwHwIbTRSUVzNochdyXmiHwo4POU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738228352; c=relaxed/simple;
	bh=6+qVg/uSfTC7RUA8H+VMWag8AD1OOAPGLxWVLf0V8yc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=erJ+TTq0B+GwqRLlm6WovtxAejHLAPfvKD1KAbwiaUuwegB4Be4TD3cMOtKlnUvuvXLbZHnSzwbMcG80dIhpROMc/g27iB66q9q5q57t1BlK06eRmY0kXPPuz7NVfvGZcq9xCRpiWjTW3W4Yq0IYaxeFSHmaVc6kJIdDiFxdH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpzVNkSQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738228350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rLOz0obAD+oiqNRoo0TPuKVd7dXq0sfd2ABPZioYnD4=;
	b=FpzVNkSQAcOMEU2StUIEIaQMEReN2PJhBzXEmub5AiHXUpkdbwoa9woMlKcP+oQfkfQYSI
	7+JAgpFg1jCt6Dl2QBmrSAP/QiWkOcS35OpdS3tlmJcpKXlIVG47XzZg0BZ1PXvxRcohuN
	S7QVH4KfpFhnHKUJBFc6AHYkR3on5Lg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553--wncqbj2PYSv831HvNHGUA-1; Thu, 30 Jan 2025 04:12:28 -0500
X-MC-Unique: -wncqbj2PYSv831HvNHGUA-1
X-Mimecast-MFC-AGG-ID: -wncqbj2PYSv831HvNHGUA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso2429965e9.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 01:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738228347; x=1738833147;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rLOz0obAD+oiqNRoo0TPuKVd7dXq0sfd2ABPZioYnD4=;
        b=hnUa4hKcwOZ2nwEb6DOPYeh/AkQR6Mx2latX6eg0aTyjtyk3sBNbIYLEl9V2ZnTqYF
         0vaRNcXSlbZG+9QmfA5AaxV/NxiByv3kf/hjCBNm1+ZloDFLz8dh+wjyMiSA0xpaEX3z
         03AWjFS+XYlpS7fPaC0OUPo0Ujk/Eb2jMCd43LaC2LeGwjwl7+G8wh78aM/5U+LFkbyc
         f6sGZ+KgWmo3IYUyJ3ClfwwSkfNx5e2isXeFeOB7w6b3nsF43M2Hk/mtzrmiYEP2U7Hi
         yQDwGVP7cnx02NdcLs0J9s5UJbmWbjxD1cGjq4a5MzKDqK60AQyKQWhIE0Ofofy4Elu1
         HZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5xJ6LcYXfP236M2ZVPsPylQgK/H2qRIg0mHw/95yfeUQzAvYC0yKjeiRwSHRbV8oD1dri6Co4k6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGhCn5sO+BLNY13EZAC8WaCfpC5jU/hY+txQaPjPLp22Kqqw9
	ut1n0p/9ujLHjB1T2rK+R3QJ8fBHbTZaHplIDq2LFqVv0ThmHQ6tWsDVfpIgYBqfmK27/xxQ/x9
	hv+nBPdzcsucK9oypknggNY0GGoCyywTK0dJIeIAYJhpfmW137rTD+rqIBg==
X-Gm-Gg: ASbGncuw4B5BSdvKfCXuafWGFA7ZSR/0+RxFxV5XOP5GP/SuHrPubJeooPkfsyXwkmt
	9odWvuaEriIItYmchE9imOr/ALdg6xYdHZIY5JKVmuHqWaJklf5gDdvygdO156oaJSVKAOWberb
	yyhMWS7buTixVTccGeb6YMA+ISF9yrJ2FRSAy5Lssc3G+BhbgqXpSwd+JSTVbhYwiNa89HIxL7D
	iPJA/CsZ5QmqXsC1lRlvvClWqoo/EEmdvGoAnhXRA5qGCrgIWvGSEedJf5FCF/i8xUVOW2Af8BD
	Jzof/+eOxJ7lET1/fIBxkbyu7D2lobm9C+GQh9Bb0BEk
X-Received: by 2002:a05:600c:3585:b0:435:192:63ca with SMTP id 5b1f17b1804b1-438dc3fc57cmr47679845e9.21.1738228347399;
        Thu, 30 Jan 2025 01:12:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwVJCk7i8Wi+y4cB3+BrJijTjRz9/U6vW5B3DRIl8pEv+r5QnVS78KcctKOfglkPsCjp7UdA==
X-Received: by 2002:a05:600c:3585:b0:435:192:63ca with SMTP id 5b1f17b1804b1-438dc3fc57cmr47679455e9.21.1738228346964;
        Thu, 30 Jan 2025 01:12:26 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41? ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec35asm1397002f8f.15.2025.01.30.01.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:12:26 -0800 (PST)
Message-ID: <547f6335-ceb4-4160-ba72-5214bf5c82f3@redhat.com>
Date: Thu, 30 Jan 2025 10:12:24 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
From: David Hildenbrand <david@redhat.com>
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
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <180e9c2f-51fe-44ba-ac68-5aa7b7918ab0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 10:01, David Hildenbrand wrote:
> On 30.01.25 07:11, Alistair Popple wrote:
>> On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
>>> We require a writable PTE and only support anonymous folio: we can only
>>> have exactly one PTE pointing at that page, which we can just lookup
>>> using a folio walk, avoiding the rmap walk and the anon VMA lock.
>>>
>>> So let's stop doing an rmap walk and perform a folio walk instead, so we
>>> can easily just modify a single PTE and avoid relying on rmap/mapcounts.
>>>
>>> We now effectively work on a single PTE instead of multiple PTEs of
>>> a large folio, allowing for conversion of individual PTEs from
>>> non-exclusive to device-exclusive -- note that the other way always
>>> worked on single PTEs.
>>>
>>> We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
>>> that is not required: GUP will already take care of the
>>> MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
>>> entry) when not finding a present PTE and having to trigger a fault and
>>> ending up in remove_device_exclusive_entry().
>>
>> I will have to look at this a bit more closely tomorrow but this doesn't seem
>> right to me. We may be transitioning from a present PTE (ie. a writable
>> anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
>> therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
>> update their copies of the PTE. So I think the notifier call is needed.
> 
> Then it is all very confusing:
> 
> "MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
> longer have exclusive access to the page."
> 
> That's simply not true in the scenario you describe, because nobody had
> exclusive access.
> 
> But what you are saying is, that we need to inform others (e.g., KVM)
> that we are converting it to a device-exclusive entry, such that they
> stop accessing it.
> 
> That makes sense to me (and the cleanup patch in the cleanup series
> would have to go as well to prevent the livelock).
> 
> So we would have to update the documentation of MMU_NOTIFY_EXCLUSIVE
> that it is also trigger on conversion from non-exclusive to exclusive.
> 
> Does that make sense?

Something like that on top:

diff --git a/mm/rmap.c b/mm/rmap.c
index 49ffac6d27f8..fd6dfe67ce7b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2405,6 +2405,7 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
  struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
                 void *owner, struct folio **foliop)
  {
+       struct mmu_notifier_range range;
         struct folio *folio, *fw_folio;
         struct vm_area_struct *vma;
         struct folio_walk fw;
@@ -2413,6 +2414,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
         pte_t swp_pte;
  
         mmap_assert_locked(mm);
+       addr = PAGE_ALIGN_DOWN(addr);
  
         /*
          * Fault in the page writable and try to lock it; note that if the
@@ -2440,6 +2442,14 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
                 return ERR_PTR(-EBUSY);
         }
  
+       /*
+        * Inform secondary MMUs that we are going to convert this PTE to
+        * device-exclusive, such that they unmap it now.
+        */
+       mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0,
+                                     mm, addr, addr + PAGE_SIZE, owner);
+       mmu_notifier_invalidate_range_start(&range);
+
         /*
          * Let's do a second walk and make sure we still find the same page
          * mapped writable. If we don't find what we expect, we will trigger
@@ -2452,6 +2462,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
             fw.level != FW_LEVEL_PTE || !pte_write(fw.pte)) {
                 if (fw_folio)
                         folio_walk_end(&fw, vma);
+               mmu_notifier_invalidate_range_end(&range);
                 folio_unlock(folio);
                 folio_put(folio);
                 return ERR_PTR(-EBUSY);
@@ -2485,6 +2496,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
         folio_remove_rmap_pte(folio, page, vma);
  
         folio_walk_end(&fw, vma);
+       mmu_notifier_invalidate_range_end(&range);
         *foliop = folio;
         return page;
  }


-- 
Cheers,

David / dhildenb


