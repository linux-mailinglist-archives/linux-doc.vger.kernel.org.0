Return-Path: <linux-doc+bounces-21690-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69B9417C7
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 18:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57A821F2460F
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 16:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE801A4B2D;
	Tue, 30 Jul 2024 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zqdbl5iG"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD1189918
	for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355920; cv=none; b=WAdugTaZg1V+fIiQpfxkM6g9zcHpCYWfx5uaTBmTgheSsW7cDsqgXzTdcs17yvRgbPQfA7f3yKz7XvQ8MFg9DF2b/wRbfjP8GacdGlqJih/izOpJ+3/Ih0X8jQEbIeFH+87QOX7kd5X2WeqdRWttofj5WzC2jZziB3fyMZlX+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355920; c=relaxed/simple;
	bh=4Z0nvcv256IbjQwN9jt0t4mHp9YXmUtYAagQty3K7Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GU8CCAROJrniTHeeCtS1TwkOxgnOQsw8PUxUXtxty/NaqlE5UUtUzeUhz88oLoI2uVzzmke9Cl3wO3xxqLhqwtCzVAI0jg9110QNy0M3fjIXwml4M2+TPDZ/1e40exYnUXNWqNTofUK5XnwmIJUQi4W/+uBPTAKp6b77zbWlPR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zqdbl5iG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722355917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gAio87lWjjxGda6gk5uE/VQpZpu5lGDoiGP9556SqMI=;
	b=Zqdbl5iGtwlHpgKKpGAHaBvzdc5w5smmSYioRZZEdFPPRxkECQN/P238+0aHgARKxy4r9o
	6fAEUhLNF+Ne3ta//DKropRWC1HyFMtyEDMRZ7yjGidgm5BR1Z2jOmKRFGohxVOoUKeyCZ
	F3M3jjyMUUarXEl/Hkg4X2bMwQeNbxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-2Eza4cm3OkmxGoDDfkCT2A-1; Tue, 30 Jul 2024 12:11:53 -0400
X-MC-Unique: 2Eza4cm3OkmxGoDDfkCT2A-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4280cf2be19so27417485e9.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2024 09:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722355912; x=1722960712;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gAio87lWjjxGda6gk5uE/VQpZpu5lGDoiGP9556SqMI=;
        b=ZVtwmO4cvrB4Wdt2QsylUcLZX7QWoXzwBjz+MuhVKtgBjK30+7AeKXDWRBEkKEniu9
         0i4p3z5KBFkXxRyRoP+kumzRBD/WreTQuw/iKDJQ1W4OdOuN+UYns6uNWdsIM7g/NL51
         LkMn7M9PBdJA3dWt6pleMVoQGvSNhJzJP0dw68ol22MqLbO7iwpYa+AteK8xXqUToWrn
         Nz+MzcFYW21WMxd36FN7vrJlmc5pKL6mhg+vU0f57ALR0FxxbvNFgBK0gVj04Bf9cDPW
         q4c2gEWz3rptOThA2Nn+j4SAhZ4rOdBwQx7RX+niOX4aIp7ed5AADMloICpd7TeyNEg5
         Z79g==
X-Forwarded-Encrypted: i=1; AJvYcCU48+udZi+cyj4yATlaHIUPcC9AeRq7jZ13Q+De8j6c5IVaC851rzodwIYByZhyyCNZFflKroyqynJhIw1ftZL8ImYNUrROG3S4
X-Gm-Message-State: AOJu0Yxrgf/U1y3rBVHIzUv4wkSG9a5PE2T8zpQYNTTJV9QrzDH3eqDm
	mEo8hq/5Z7j/uf0r7FDDBRhi5XJxOgGl+KDNJNILTkd+coU2RbOP5gyUNxfEnp4Hgmeq5y3FbVP
	po1i64iJPuCawsbklt6QO7ZKoEu3qeg0dhXfSxHMVXVUeZ9UA7RFPggwCOw==
X-Received: by 2002:a5d:64e7:0:b0:36b:8f54:33ce with SMTP id ffacd0b85a97d-36b8f5434c4mr1859212f8f.33.1722355912495;
        Tue, 30 Jul 2024 09:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlBfJJSw9N3cw94uHfwVilwmDnjMq+2mEEn1D9ios39871j+LEpR7nk5wnVdPEQzEHZ4LVtg==
X-Received: by 2002:a5d:64e7:0:b0:36b:8f54:33ce with SMTP id ffacd0b85a97d-36b8f5434c4mr1859179f8f.33.1722355911861;
        Tue, 30 Jul 2024 09:11:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:4e00:31ad:5274:e21c:b59? (p200300cbc7064e0031ad5274e21c0b59.dip0.t-ipconnect.de. [2003:cb:c706:4e00:31ad:5274:e21c:b59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c01f6sm15094953f8f.23.2024.07.30.09.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 09:11:51 -0700 (PDT)
Message-ID: <95ed1631-ff62-4627-8dc6-332096e673b4@redhat.com>
Date: Tue, 30 Jul 2024 18:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] mm: split underutilized THPs
To: Usama Arif <usamaarif642@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 roman.gushchin@linux.dev, yuzhao@google.com, baohua@kernel.org,
 ryan.roberts@arm.com, rppt@kernel.org, willy@infradead.org,
 cerasuolodomenico@gmail.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20240730125346.1580150-1-usamaarif642@gmail.com>
 <dc00a32f-e4aa-4f48-b82a-176c9f615f3e@redhat.com>
 <3cd1b07d-7b02-4d37-918a-5759b23291fb@gmail.com>
 <73b97a03-3742-472f-9a36-26ba9009d715@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <73b97a03-3742-472f-9a36-26ba9009d715@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.07.24 17:19, Usama Arif wrote:
> 
> 
> On 30/07/2024 16:14, Usama Arif wrote:
>>
>>
>> On 30/07/2024 15:35, David Hildenbrand wrote:
>>> On 30.07.24 14:45, Usama Arif wrote:
>>>> The current upstream default policy for THP is always. However, Meta
>>>> uses madvise in production as the current THP=always policy vastly
>>>> overprovisions THPs in sparsely accessed memory areas, resulting in
>>>> excessive memory pressure and premature OOM killing.
>>>> Using madvise + relying on khugepaged has certain drawbacks over
>>>> THP=always. Using madvise hints mean THPs aren't "transparent" and
>>>> require userspace changes. Waiting for khugepaged to scan memory and
>>>> collapse pages into THP can be slow and unpredictable in terms of performance
>>>> (i.e. you dont know when the collapse will happen), while production
>>>> environments require predictable performance. If there is enough memory
>>>> available, its better for both performance and predictability to have
>>>> a THP from fault time, i.e. THP=always rather than wait for khugepaged
>>>> to collapse it, and deal with sparsely populated THPs when the system is
>>>> running out of memory.
>>>>
>>>> This patch-series is an attempt to mitigate the issue of running out of
>>>> memory when THP is always enabled. During runtime whenever a THP is being
>>>> faulted in or collapsed by khugepaged, the THP is added to a list.
>>>> Whenever memory reclaim happens, the kernel runs the deferred_split
>>>> shrinker which goes through the list and checks if the THP was underutilized,
>>>> i.e. how many of the base 4K pages of the entire THP were zero-filled.
>>>> If this number goes above a certain threshold, the shrinker will attempt
>>>> to split that THP. Then at remap time, the pages that were zero-filled are
>>>> not remapped, hence saving memory. This method avoids the downside of
>>>> wasting memory in areas where THP is sparsely filled when THP is always
>>>> enabled, while still providing the upside THPs like reduced TLB misses without
>>>> having to use madvise.
>>>>
>>>> Meta production workloads that were CPU bound (>99% CPU utilzation) were
>>>> tested with THP shrinker. The results after 2 hours are as follows:
>>>>
>>>>                               | THP=madvise |  THP=always   | THP=always
>>>>                               |             |               | + shrinker series
>>>>                               |             |               | + max_ptes_none=409
>>>> -----------------------------------------------------------------------------
>>>> Performance improvement     |      -      |    +1.8%      |     +1.7%
>>>> (over THP=madvise)          |             |               |
>>>> -----------------------------------------------------------------------------
>>>> Memory usage                |    54.6G    | 58.8G (+7.7%) |   55.9G (+2.4%)
>>>> -----------------------------------------------------------------------------
>>>> max_ptes_none=409 means that any THP that has more than 409 out of 512
>>>> (80%) zero filled filled pages will be split.
>>>>
>>>> To test out the patches, the below commands without the shrinker will
>>>> invoke OOM killer immediately and kill stress, but will not fail with
>>>> the shrinker:
>>>>
>>>> echo 450 > /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none
>>>> mkdir /sys/fs/cgroup/test
>>>> echo $$ > /sys/fs/cgroup/test/cgroup.procs
>>>> echo 20M > /sys/fs/cgroup/test/memory.max
>>>> echo 0 > /sys/fs/cgroup/test/memory.swap.max
>>>> # allocate twice memory.max for each stress worker and touch 40/512 of
>>>> # each THP, i.e. vm-stride 50K.
>>>> # With the shrinker, max_ptes_none of 470 and below won't invoke OOM
>>>> # killer.
>>>> # Without the shrinker, OOM killer is invoked immediately irrespective
>>>> # of max_ptes_none value and kill stress.
>>>> stress --vm 1 --vm-bytes 40M --vm-stride 50K
>>>>
>>>> Patches 1-2 add back helper functions that were previously removed
>>>> to operate on page lists (needed by patch 3).
>>>> Patch 3 is an optimization to free zapped tail pages rather than
>>>> waiting for page reclaim or migration.
>>>> Patch 4 is a prerequisite for THP shrinker to not remap zero-filled
>>>> subpages when splitting THP.
>>>> Patches 6 adds support for THP shrinker.
>>>>
>>>> (This patch-series restarts the work on having a THP shrinker in kernel
>>>> originally done in
>>>> https://lore.kernel.org/all/cover.1667454613.git.alexlzhu@fb.com/.
>>>> The THP shrinker in this series is significantly different than the
>>>> original one, hence its labelled v1 (although the prerequisite to not
>>>> remap clean subpages is the same).)
>>>
>>> As shared previously, there is one issue with uffd (even when currently not active for a VMA!), where we must not zap present page table entries.
>>>
>>> Something that is always possible (assuming no GUP pins of course, which) is replacing the zero-filled subpages by shared zeropages.
>>>
>>> Is that being done in this patch set already, or are we creating pte_none() entries?
>>>
>>
>> I think thats done in Patch 4/6. In function try_to_unmap_unused, we have below which I think does what you are suggesting? i.e. point to shared zeropage and not clear pte for uffd armed vma.
>>
>> 	if (userfaultfd_armed(pvmw->vma)) {
>> 		newpte = pte_mkspecial(pfn_pte(page_to_pfn(ZERO_PAGE(pvmw->address)),
>> 					       pvmw->vma->vm_page_prot));
>> 		ptep_clear_flush(pvmw->vma, pvmw->address, pvmw->pte);
>> 		set_pte_at(pvmw->vma->vm_mm, pvmw->address, pvmw->pte, newpte);
>> 	}
> 
> 
> Ah are you suggesting userfaultfd_armed(pvmw->vma) will evaluate to false even if its uffd? I think something like below would work in that case.

I remember one ugly case in QEMU with postcopy live-migration where we 
must not zap zero-filled pages. I am not 100% regarding THP (if it could 
be enabled at that point), but imagine the following

1) mmap(), enable THP
2) Migrate a bunch of pages from the source during precopy (writing to
    the memory). Might end up creating THPs (during fault/khugepaged)
3) Register UFFD on the VMA
4) Disable new THPs from forming via MADV_NOHUGEPAGE on the VMA
5) Discard any pages that have been re-dirtied or not migrated yet
6) Migrate-on-demand any holes using uffd


If we discard zero-filled pages between 2) and 3) we might get wrong 
uffd notifications in 6 for pages that have already been migrated).

I'll have to check if that actually happens in that sequence in QEMU: if 
QEMU would disable THP right before 2) we would be safe. But I recall 
that it is not the case :/


-- 
Cheers,

David / dhildenb


