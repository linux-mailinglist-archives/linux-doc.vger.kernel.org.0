Return-Path: <linux-doc+bounces-38143-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E76A35BA2
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2025 11:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 103803AC2EB
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2025 10:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC37824500D;
	Fri, 14 Feb 2025 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0LpXaAZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A420DD66
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739529472; cv=none; b=uVWSwDmNTSjDHsvEpmEMLOXZbDnMTKdP8OQUTB60PxPlGbJyIP8flrzRIyCFY2nzt2vUMS+hE13WAtQKWlN9lKru74QStCnaOKiyaDa4XilHV6qmBfHzElJh6eySGpt/bX7QygKayLmhPxJauCFFrUT3BynotoLYQwqWiEba8tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739529472; c=relaxed/simple;
	bh=ZsyjMzGdyJqkrDeCLAABwQTLH7CfEZ7/s8ypCPoBKuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip/zztnv3/KWSnMKpJA0OM4tmsuarN2rTKlH14d+p2y+SKIjjvZw7dBXRaFRkLKm3MKXC2C/GDuzfh227Y3IEdruXWlGmV3ifZziiQaXAIZdP3Tv0OxmajNkyYbI0LagbwclNoSptMfcqr5sEXVtrI/A+FnWajhz8r+9jhCdpyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0LpXaAZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739529469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v1ELqJmSBEXwSdcynoIWjIw5bhWZWQeX4Q07dCSIZyk=;
	b=M0LpXaAZuoSpRemWqexNxBbQkT1V7vxxUvCuigW7B3LUh2Lhb62vhZJjArZkkKtwHp9Co6
	mJUzsJbOsOjHXZhKpO7g0Pe+/XWbBOiC//ZMYbdDI3tfXJFTClc41lOZNTAbk3QCZvErfx
	dN48UoV+6lsKdBZC9cpFo6/+pxJ9mog=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-9uBS5ihgNfSwhz_WueC3aw-1; Fri, 14 Feb 2025 05:37:48 -0500
X-MC-Unique: 9uBS5ihgNfSwhz_WueC3aw-1
X-Mimecast-MFC-AGG-ID: 9uBS5ihgNfSwhz_WueC3aw_1739529467
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dbdc2926eso1999455f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 02:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739529467; x=1740134267;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v1ELqJmSBEXwSdcynoIWjIw5bhWZWQeX4Q07dCSIZyk=;
        b=vMBJTfnplj7TDCGSX6leqgGrduc+TLpUeislxpE1V1PhtPYXp3ekxtoUCy7VY6cfch
         UkhlugyAIIYlUQSTSqwiYvSjMpKi9cPekeeT3K5Fy4D5XHU7m20/nUMRGIQrdZjZ6sz6
         xFYKKh+DB0+EVSYrcw1siJHujf8L41KyUoJEBJDEzFCKEzPdK95iJlZbJR+k5fyb36dE
         IuA9ZtzLpRlaCwvVMWJJ8eTMtN4Of4iLBFZwPqZgHi58M1lQ5+Bi0xgZwLyjrutF8ciH
         AzUlDAY8txl1UXAMCWJtocg4NQDVUFlc34yPQWmz8wCYOAvfjvr/Bc/Lm7560VXReXCn
         oCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa7ozFPGyaGKYQqKte2N6fnWftBNJWtwsRqPmKK5P18lrLz88sbs3cmOV2RnsbocGptsmGNG0MdOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMlifTT1Hz5skp12kps0Ps5pR0yuyBYSek+vCnL+1MyyE+LBTk
	Ltc38KcigQEiA+gUCjudeJZ+d3VopWfn6XH0ILavGr+PRFUWQUOwZSDbLLmSZ1qUTbPADUE92cn
	SCoj7XuC1E3CQM+FthdqQirxGnuVbxikuSpSSHBeGQKPbUEV8J1vCCgL7Ng==
X-Gm-Gg: ASbGncvGAMh15ckLy+7bTctQFWAbtY3vWi/g36idijPgdEGN6UW9RyGSzUs5xVQaOug
	jI4kVBgujVABA7GjbPfOdsoqrrgMD0JcY5EBqQnvceexFeEkdQI2mYnimJRW6QZFryPm+hleUAq
	Fsit24VO9f+MUC7QwwnhT0vJxW8DZyckzRKLtB/mE3XtaPyfFSeThnVzU5IhengsE0pH1J832ls
	BR6kfOsJfYXkJVhkKJmx9J/ySarXBCaSk+8nAWcKDFyHDXaxD5+9gPXh/fPdm1yX9Wh4Yan/qdc
	iuopO9Sls9whzY9yfzkJGBplRuuZ2CY1ZXJCuYGkhsuPKZipDf5KMme2vdJuuRlCTcUbpxSIbq2
	9tLjgmdvpuGQWXLXWkRFU+b8CJBj71g==
X-Received: by 2002:a05:6000:18a8:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-38f24132bb7mr9218048f8f.47.1739529466900;
        Fri, 14 Feb 2025 02:37:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4ObsXSu+uaHBcCGCpcGtfSdrcoS3HhFa3rCOolNFcAYKhUug8deHKDOqr2tqK+ZhCEHYNXw==
X-Received: by 2002:a05:6000:18a8:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-38f24132bb7mr9218011f8f.47.1739529466461;
        Fri, 14 Feb 2025 02:37:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:a00:7d7d:3665:5fe4:7127? (p200300cbc7090a007d7d36655fe47127.dip0.t-ipconnect.de. [2003:cb:c709:a00:7d7d:3665:5fe4:7127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961e07252sm39337615e9.14.2025.02.14.02.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:37:45 -0800 (PST)
Message-ID: <1404d6a3-c27d-4d51-8e3a-e10dc040dc6e@redhat.com>
Date: Fri, 14 Feb 2025 11:37:42 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/17] mm: fixes for device-exclusive entries (hmm)
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, damon@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Masami Hiramatsu <mhiramat@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 SeongJae Park <sj@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250210193801.781278-1-david@redhat.com>
 <6sejv2hauce3il5lq6sw53xmjjjglxkhz5copm62oryga6jioi@u66wl2nc3hoy>
 <039b2e48-1d7c-48dc-b832-24db12af216a@redhat.com>
 <pqxzfmb2ydjgplkiswb5oxtbvpxyzmfroh2fbeqeuywklmrw6i@jbj73xssektr>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <pqxzfmb2ydjgplkiswb5oxtbvpxyzmfroh2fbeqeuywklmrw6i@jbj73xssektr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.02.25 02:25, Alistair Popple wrote:
> On Thu, Feb 13, 2025 at 12:15:58PM +0100, David Hildenbrand wrote:
>> On 13.02.25 12:03, Alistair Popple wrote:
>>> On Mon, Feb 10, 2025 at 08:37:42PM +0100, David Hildenbrand wrote:
>>>> Against mm-hotfixes-stable for now.
>>>>
>>>> Discussing the PageTail() call in make_device_exclusive_range() with
>>>> Willy, I recently discovered [1] that device-exclusive handling does
>>>> not properly work with THP, making the hmm-tests selftests fail if THPs
>>>> are enabled on the system.
>>>>
>>>> Looking into more details, I found that hugetlb is not properly fenced,
>>>> and I realized that something that was bugging me for longer -- how
>>>> device-exclusive entries interact with mapcounts -- completely breaks
>>>> migration/swapout/split/hwpoison handling of these folios while they have
>>>> device-exclusive PTEs.
>>>>
>>>> The program below can be used to allocate 1 GiB worth of pages and
>>>> making them device-exclusive on a kernel with CONFIG_TEST_HMM.
>>>>
>>>> Once they are device-exclusive, these folios cannot get swapped out
>>>> (proc$pid/smaps_rollup will always indicate 1 GiB RSS no matter how
>>>> much one forces memory reclaim), and when having a memory block onlined
>>>> to ZONE_MOVABLE, trying to offline it will loop forever and complain about
>>>> failed migration of a page that should be movable.
>>>>
>>>> # echo offline > /sys/devices/system/memory/memory136/state
>>>> # echo online_movable > /sys/devices/system/memory/memory136/state
>>>> # ./hmm-swap &
>>>> ... wait until everything is device-exclusive
>>>> # echo offline > /sys/devices/system/memory/memory136/state
>>>> [  285.193431][T14882] page: refcount:2 mapcount:0 mapping:0000000000000000
>>>>     index:0x7f20671f7 pfn:0x442b6a
>>>> [  285.196618][T14882] memcg:ffff888179298000
>>>> [  285.198085][T14882] anon flags: 0x5fff0000002091c(referenced|uptodate|
>>>>     dirty|active|owner_2|swapbacked|node=1|zone=3|lastcpupid=0x7ff)
>>>> [  285.201734][T14882] raw: ...
>>>> [  285.204464][T14882] raw: ...
>>>> [  285.207196][T14882] page dumped because: migration failure
>>>> [  285.209072][T14882] page_owner tracks the page as allocated
>>>> [  285.210915][T14882] page last allocated via order 0, migratetype
>>>>     Movable, gfp_mask 0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO),
>>>>     id 14926, tgid 14926 (hmm-swap), ts 254506295376, free_ts 227402023774
>>>> [  285.216765][T14882]  post_alloc_hook+0x197/0x1b0
>>>> [  285.218874][T14882]  get_page_from_freelist+0x76e/0x3280
>>>> [  285.220864][T14882]  __alloc_frozen_pages_noprof+0x38e/0x2740
>>>> [  285.223302][T14882]  alloc_pages_mpol+0x1fc/0x540
>>>> [  285.225130][T14882]  folio_alloc_mpol_noprof+0x36/0x340
>>>> [  285.227222][T14882]  vma_alloc_folio_noprof+0xee/0x1a0
>>>> [  285.229074][T14882]  __handle_mm_fault+0x2b38/0x56a0
>>>> [  285.230822][T14882]  handle_mm_fault+0x368/0x9f0
>>>> ...
>>>>
>>>> This series fixes all issues I found so far. There is no easy way to fix
>>>> without a bigger rework/cleanup. I have a bunch of cleanups on top (some
>>>> previous sent, some the result of the discussion in v1) that I will send
>>>> out separately once this landed and I get to it.
>>>> I wish we could just use some special present PROT_NONE PTEs instead of
> 
> Yeah, that was my initial instinct when I first investigated this. As you point
> out a lack of spare PTE bits made it hard/impossible. Of course I'm about to
> give you all one back, maybe I should keep it :) I'm only kidding though - I'm
> sure there's more interesting things to spend it on.

Yes. And I think it could actually be valuable to have the option for 
more fake-prot-none things.

For example, right now we cannot really distinguish NUMA-hinting 
prot-none from ordinary prot-none without guessing based on some VMA flags.

One could implement NUMA-hinting using a PFN swap entry in an 
arch-independent way I guess.

So there are pros and cons to it. The biggest con is, that while RMAP 
can now handle it, other page table walkers mostly skip these entries.

> 
>>>
>>> First off David thanks for finding and fixing these issues. If you have further
>>> clean-ups in mind that you need help with please let me know as I'd be happy
>>> to help.
>>
>> Sure! I have some cleanups TBD as result of the previous discussion, but
>> nothing bigger so far.
>>
>> (removing the folio lock could be considered bigger, if we want to go down
>> that path)
>>
>>>
>>>> these (non-present, non-none) fake-swap entries; but that just results in
>>>> the same problem we keep having (lack of spare PTE bits), and staring at
>>>> other similar fake-swap entries, that ship has sailed.
>>>>
>>>> With this series, make_device_exclusive() doesn't actually belong into
>>>> mm/rmap.c anymore, but I'll leave moving that for another day.
>>>>
>>>> I only tested this series with the hmm-tests selftests due to lack of HW,
>>>> so I'd appreciate some testing, especially if the interaction between
>>>> two GPUs wanting a device-exclusive entry works as expected.
>>>
>>> I'm still reviewing the series but so far testing on my single GPU system
>>> appears to be working as expected. I will try and fire up a dual GPU system
>>> tomorrow and test it there as well.
>>
>> Great, thanks a bunch for testing!
>>
>> Out of interest: does the nvidia driver make use of this interface as well,
>> and are you testing with that or with the nouveau driver? I saw some reports
>> that nvidia at least checks for it [1] when building the module:
> 
> Both. I have tested Nouveau with the Mesa OpenCL stack and a simple stress test
> that just thrashes atomic accesses between CPU and GPU and a similar test for
> the nvidia driver.
> 
> In practice the nvidia driver probably doesn't use this that often as it
> more aggressively migrates data but it does use this as a fallback. Also it's
> possible for users to force residency on the CPU in which case this is used,
> which is what the test does.

Cool, thanks! (so even though nouveau is not enabled in RHEL, we'd 
effectively be using that functionality in RHEL kernels using the nvidia 
driver)

> 
> Anyway I have just finished testing on a multi-GPU setup so please feel free to
> add for the series:
> 
> Tested-by: Alistair Popple <apopple@nvidia.com>

Thanks a bunch!

-- 
Cheers,

David / dhildenb


