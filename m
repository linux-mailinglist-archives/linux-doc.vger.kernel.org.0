Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010D042F86B
	for <lists+linux-doc@lfdr.de>; Fri, 15 Oct 2021 18:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241381AbhJOQmD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Oct 2021 12:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22865 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235894AbhJOQmB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Oct 2021 12:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634315994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E4LKFDRNGrYewkIQEu16Zm63HJjl+j0dZzAICvUOLVM=;
        b=CBjO6tr8fYwuZhZFO0HMUscuN+Os6YFooRl+XbVGo1YwhMnqK4qyd/tBdoBeT5Vz/liFGw
        3UCz8CnXIKKK4000l1v0BtZkJ47ClqUk8RHlRFpMXGbIjH+C/BuEsFhHKSDRGiCfZxv5P4
        D9sQ6E8QbDiU1PvFVi2gFIrsJL7wl7U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-OEazci6aOtCL9OnF2u_hxA-1; Fri, 15 Oct 2021 12:39:53 -0400
X-MC-Unique: OEazci6aOtCL9OnF2u_hxA-1
Received: by mail-wr1-f71.google.com with SMTP id j19-20020adfb313000000b00160a9de13b3so6160451wrd.8
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 09:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=E4LKFDRNGrYewkIQEu16Zm63HJjl+j0dZzAICvUOLVM=;
        b=jB4tQL6iCeEVcETbSqoN01VVO9OAA95Amzuu0T8XQfhP/s+F0s3PP/CIfWSjj60yJL
         IeOlSe9dJ8xRzqbuWCOM2BG0AIP5KGBe/LtZ84rcsAx9XP+rPMWCu72NYqEiAzaepCXm
         REeYHZM6i3mOGhu7TfS8Nkf1P/Iiy9Ym+Bv+j++jJeovgzHkYIkjQhu18yU3gOUgaA1U
         0Y8A11qGdsVVLiuHMxri6LQ+lrvoVtcYl9tUAzwGUnsFUT9Kjuzh2Do/QAE734odOvj5
         yIlyhtxr8297Q6hWFtp86xJdJH388nKTnZNO7BJeQBHWsRxDFvKCHyQoPOrW8/MbdCNO
         nDJw==
X-Gm-Message-State: AOAM531EObyni/r5wrtOX7z8OXbxDfRuAGEL6Ci0FwqDFiEW6gqwwgBp
        r253SgFNGyiP+Bchu2hBZmwVbAasdsmiWM54x8aSBJ23aMGmqLoeEz/dLjyjfDBQ+NP3KkPpjq1
        5I655LSCKE8tflYpOBrTs
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr27224261wmr.134.1634315992103;
        Fri, 15 Oct 2021 09:39:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu+oFauM+GGmdwcOZ7EltiO+NPKXOxlX3q1W1CdIvB6o2LNj90pM8GL+iApDfNPPofqFTTsA==
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr27224197wmr.134.1634315991799;
        Fri, 15 Oct 2021 09:39:51 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6a01.dip0.t-ipconnect.de. [91.12.106.1])
        by smtp.gmail.com with ESMTPSA id y8sm4956776wmi.43.2021.10.15.09.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 09:39:51 -0700 (PDT)
Message-ID: <3563a3e8-b971-b604-7388-766ecfce4634@redhat.com>
Date:   Fri, 15 Oct 2021 18:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v10 3/3] mm: add anonymous vma name refcounting
Content-Language: en-US
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Michal Hocko <mhocko@suse.com>, Kees Cook <keescook@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Peter Xu <peterx@redhat.com>, rppt@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vincenzo.frascino@arm.com,
        =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        Chris Hyser <chris.hyser@oracle.com>,
        Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
References: <92cbfe3b-f3d1-a8e1-7eb9-bab735e782f6@rasmusvillemoes.dk>
 <20211007101527.GA26288@duo.ucw.cz>
 <CAJuCfpGp0D9p3KhOWhcxMO1wEbo-J_b2Anc-oNwdycx4NTRqoA@mail.gmail.com>
 <YV8jB+kwU95hLqTq@dhcp22.suse.cz>
 <CAJuCfpG-Nza3YnpzvHaS_i1mHds3nJ+PV22xTAfgwvj+42WQNA@mail.gmail.com>
 <YV8u4B8Y9AP9xZIJ@dhcp22.suse.cz>
 <CAJuCfpHAG_C5vE-Xkkrm2kynTFF-Jd06tQoCWehHATL0W2mY_g@mail.gmail.com>
 <202110071111.DF87B4EE3@keescook> <YV/mhyWH1ZwWazdE@dhcp22.suse.cz>
 <202110081344.FE6A7A82@keescook> <YWP3c/bozz5npQ8O@dhcp22.suse.cz>
 <CAJuCfpHQVMM4+6Lm_EnFk06+KrOjSjGA19K2cv9GmP3k9LW5vg@mail.gmail.com>
 <26f9db1e-69e9-1a54-6d49-45c0c180067c@redhat.com>
 <CAJuCfpGTCM_Rf3GEyzpR5UOTfgGKTY0_rvAbGdtjbyabFhrRAw@mail.gmail.com>
 <CAJuCfpE2j91_AOwwRs_pYBs50wfLTwassRqgtqhXsh6fT+4MCg@mail.gmail.com>
 <b46d9bfe-17a9-0de9-271d-a3e6429e3f5f@redhat.com>
 <CAJuCfpG=fNMDuYUo8UwjB-kDzR2gxmRmTJCqgojfPe6RULwc4A@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAJuCfpG=fNMDuYUo8UwjB-kDzR2gxmRmTJCqgojfPe6RULwc4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


>>>
>>> 1. Forking a process with anonymous vmas named using memfd is 5-15%
>>> slower than with prctl (depends on the number of VMAs in the process
>>> being forked). Profiling shows that i_mmap_lock_write() dominates
>>> dup_mmap(). Exit path is also slower by roughly 9% with
>>> free_pgtables() and fput() dominating exit_mmap(). Fork performance is
>>> important for Android because almost all processes are forked from
>>> zygote, therefore this limitation already makes this approach
>>> prohibitive.
>>
>> Interesting, naturally I wonder if that can be optimized.
> 
> Maybe but it looks like we simply do additional things for file-backed
> memory, which seems natural. The call to i_mmap_lock_write() is from
> here: https://elixir.bootlin.com/linux/latest/source/kernel/fork.c#L565
> 
>>
>>>
>>> 2. mremap() usage to grow the mapping has an issue when used with memfds:
>>>
>>> fd = memfd_create(name, MFD_ALLOW_SEALING);
>>> ftruncate(fd, size_bytes);
>>> ptr = mmap(NULL, size_bytes, prot, MAP_PRIVATE, fd, 0);
>>> close(fd);
>>> ptr = mremap(ptr, size_bytes, size_bytes * 2, MREMAP_MAYMOVE);
>>> touch_mem(ptr, size_bytes * 2);
>>>
>>> This would generate a SIGBUS in touch_mem(). I believe it's because
>>> ftruncate() specified the size to be size_bytes and we are accessing
>>> more than that after remapping. prctl() does not have this limitation
>>> and we do have a usecase for growing a named VMA.
>>
>> Can't you simply size the memfd much larger? I mean, it doesn't really
>> cost much, does it?
> 
> If we know beforehand what the max size it can reach then that would
> be possible. I would really hate to miscalculate here and cause a
> simple memory access to generate signals. Tracking such corner cases
> in the field is not an easy task and I would rather avoid the
> possibility of it.

The question would be if you cannot simply add some extremely large
number, because the file size itself doesn't really matter for memfd IIRC.

Having that said, without trying it out, I wouldn't know from the top of
my head if memremap would work that way on an already closed fd that ahs
a sufficient size :/ If you have the example still somewhere, I would be
interested if that would work in general.

[...]

>>
>>>
>>> 4. There is a usecase in the Android userspace where vma naming
>>> happens after memory was allocated. Bionic linker does in-memory
>>> relocations and then names some relocated sections.
>>
>> Would renaming a memfd be an option or is that "too late" ?
> 
> My understanding is that linker allocates space to load and relocate
> the code, performs the relocations in that space and then names some
> of the regions after that. Whether it can be redesigned to allocate
> multiple named regions and perform the relocation between them I did
> not really try since it would be a project by itself.
> 
> TBH, at some point I just look at the amount of required changes (both
> kernel and userspace) and new limitations that userspace has to adhere
> to for fitting memfds to my usecase, and I feel that it's just not
> worth it. In the end we end up using the same refcounted strings with
> vma->vm_file->f_count as the refcount and name stored in
> vma->vm_file->f_path->dentry but with more overhead.

Yes, but it's glued to files which naturally have names :)

Again, I appreciate that you looked into alternatives! I can see the
late renaming could be the biggest blocker if user space cannot be
adjusted easily to be compatible with that using memfds.

-- 
Thanks,

David / dhildenb

