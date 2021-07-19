Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4723CD3E4
	for <lists+linux-doc@lfdr.de>; Mon, 19 Jul 2021 13:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbhGSKsF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Jul 2021 06:48:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35993 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236332AbhGSKsF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 06:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626694122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zdWfaYFJgwjqEmB5BWPh9A+L9EizM7zeJPklZSFE/NY=;
        b=ILVlE82RQEUzqwUcZSwZHDW/8FzpEcRqTlP22WGRT7ohdCR4hA2MrDGoDKMBqnEQiwH5C4
        bQa8Lr5eyUTR2jlwUgopw5VzvXekwTBY/HSpmp4IxowOYovFHT6/9E5Albe7JlO1RCpmCO
        KS1/QGLla179a7av355GIOpWdr4qKzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-_yK6nojqMCO_E5cmPLsnqw-1; Mon, 19 Jul 2021 07:28:41 -0400
X-MC-Unique: _yK6nojqMCO_E5cmPLsnqw-1
Received: by mail-wr1-f72.google.com with SMTP id d8-20020adf9c880000b0290141a87409b5so7838783wre.16
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 04:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zdWfaYFJgwjqEmB5BWPh9A+L9EizM7zeJPklZSFE/NY=;
        b=ZFoTucLT/wNere8DraVI/1+ogkfcub6yO0TZGEXDldVVzREZepRp03MLfrNHfCgNOz
         uYo/9dl4NWWtuyYJaIsqti74pJJpLwOsDCyd8FOh3QxMRym9QTJ+lok1KSqNfrItQ3Eg
         5tyHlbI5AevB9djrgXk1g9JTIxClTASsu8E/kFh77CYWBQ1hpJq8NBB/Iaje/A8c8B0m
         C5dVnIL6G2+2QuQraJsSw4M/SUMNiv6V6LAV7tYjlMupYd/lJqkbd0kh0qvCqJLGRFKo
         xJ8tqss0g/ArVYHywn3vfc7t/hVqKgCOesa4eN7tMA60Sz6R59frLAA9dppBzhR1QsdX
         L44w==
X-Gm-Message-State: AOAM531gOyk4ZCb2r6TW+oaqOnUKJjaaXK8T1182j0uUTuTxZJnMP5Lu
        EVznZetu+2JW+jU1dtYM0LEEBjaHcy4Anh14qztW61J0QezN/fh2rmejr28CZa/ZGt0N0il2xxQ
        JnrN8FYxpsoTD8gTAHZLo
X-Received: by 2002:adf:f949:: with SMTP id q9mr28148623wrr.178.1626694120215;
        Mon, 19 Jul 2021 04:28:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5eBko6UcDEM3HnRNlAFqNKgG1GX1Bx9LCzhwSh8WXYNCaTJRXTb3x82dnFDJMhHa/+16TYA==
X-Received: by 2002:adf:f949:: with SMTP id q9mr28148607wrr.178.1626694120033;
        Mon, 19 Jul 2021 04:28:40 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id b16sm20296101wrw.46.2021.07.19.04.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 04:28:39 -0700 (PDT)
From:   David Hildenbrand <david@redhat.com>
To:     Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
 <5ce5fb25-df1d-b807-8807-595b8a7bfc63@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 0/7] Free user PTE page table pages
Message-ID: <089e710c-fb06-e731-6d50-7858d6b9ecdf@redhat.com>
Date:   Mon, 19 Jul 2021 13:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5ce5fb25-df1d-b807-8807-595b8a7bfc63@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.07.21 09:34, David Hildenbrand wrote:
> On 18.07.21 06:30, Qi Zheng wrote:
>> Hi,
>>
>> This patch series aims to free user PTE page table pages when all PTE entries
>> are empty.
>>
>> The beginning of this story is that some malloc libraries(e.g. jemalloc or
>> tcmalloc) usually allocate the amount of VAs by mmap() and do not unmap those VAs.
>> They will use madvise(MADV_DONTNEED) to free physical memory if they want.
>> But the page tables do not be freed by madvise(), so it can produce many
>> page tables when the process touches an enormous virtual address space.
> 
> ... did you see that I am actually looking into this?
> 
> https://lkml.kernel.org/r/bae8b967-c206-819d-774c-f57b94c4b362@redhat.com
> 
> and have already spent a significant time on it as part of my research,
> which is *really* unfortunate and makes me quite frustrated at the
> beginning of the week alreadty ...
> 
> Ripping out page tables is quite difficult, as we have to stop all page
> table walkers from touching it, including the fast_gup, rmap and page
> faults. This usually involves taking the mmap lock in write. My approach
> does page table reclaim asynchronously from another thread and do not
> rely on reference counts.

FWIW, I had a quick peek and I like the simplistic approach using 
reference counting, although it seems to come with a price. By hooking 
using pte_alloc_get_map_lock() instead of pte_alloc_map_lock, we can 
handle quite some cases easily.

There are cases where we might immediately see a reuse after discarding 
memory (especially, with virtio-balloon free page reporting), in which 
case it's suboptimal to immediately discard instead of waiting a bit if 
there is a reuse. However, the performance impact seems to be 
comparatively small.

I do wonder if the 1% overhead you're seeing is actually because of 
allcoating/freeing or because of the reference count handling on some 
hot paths.

I'm primarily looking into asynchronous reclaim, because it somewhat 
makes sense to only reclaim (+ pay a cost) when there is really need to 
reclaim memory -- similar to our shrinker infrastructure.

-- 
Thanks,

David / dhildenb

