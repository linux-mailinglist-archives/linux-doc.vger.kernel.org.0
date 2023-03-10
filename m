Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D385D6B4D8E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Mar 2023 17:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjCJQuo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Mar 2023 11:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjCJQuW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Mar 2023 11:50:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8490D574C6
        for <linux-doc@vger.kernel.org>; Fri, 10 Mar 2023 08:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678466764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U1nV2/qDntqDJZlPcxYfsT9dw0Ma0q80Z3zjf/0HtgY=;
        b=Cwj9W/dUrvsjMFIfDbaCDG7ukzGehFBlCkwH0Ej0cgpgZCfld3sYrTpy13mpXey5mAgeWa
        rZmVEH6mT4tIA9RAFzzcDfu1bbxu4CkYxqPeBH7CTyUWKa91Wvffe0jDNmSbl5qXJx7o62
        Bafx7mUqYFz3B6uCEQOoUDuRa+BOSok=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-vqL6IBVJOxW7s9KGS0guUA-1; Fri, 10 Mar 2023 11:46:02 -0500
X-MC-Unique: vqL6IBVJOxW7s9KGS0guUA-1
Received: by mail-ed1-f72.google.com with SMTP id w7-20020a056402268700b004bbcdf3751bso8468632edd.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Mar 2023 08:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678466761;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1nV2/qDntqDJZlPcxYfsT9dw0Ma0q80Z3zjf/0HtgY=;
        b=e+Ur/Ju5BHeMubtD6EP5igP8NWNC6o+nyZ8IerxGvga6uUEgNGNFPTSaJNUG2LK0W4
         MELE3jT0ZnjgTbAbD/l4rlXZ95M288U2H27IiubA/ALvzgdZH+5thZYlZo91tiuIgDhE
         0aXDsXVFiw0ke3WPeWsj2GH1N6easJdIYe+eywq+8cAnpiUsyl+LkGdQ5v034NXuP1KW
         sVVrgqawMoyKOjUlHcJlvMATL9s7r8OABUOiyy3scaRF7vXss4f5MdMF3pVxn7GvHu+h
         IPFqTvqDJfLJav/lRjWgealDQMyX4+t8lSMbNrYdzp3bwbK0LreLgWFVs8bTdiIPlRoY
         eddg==
X-Gm-Message-State: AO0yUKXwxD5vVrSTYCnvd1gxHtQOg3hf0fLCmiNGY4BigJOp4hOyXM+5
        GUfaaOoOVfIzWcAyjuYCZJLg7gXdxAex3nsIkaN00Dwmt2MhqDJJRjYS2Xf4A1bPSK5U9JQJZDN
        lryN/8iEWBQc0RN2GZ+Dm
X-Received: by 2002:aa7:c147:0:b0:4bd:e63c:d3be with SMTP id r7-20020aa7c147000000b004bde63cd3bemr24297873edp.20.1678466761652;
        Fri, 10 Mar 2023 08:46:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9dpP4chv/p3br8fwfdqT8BO6VAbkXs+gurJic+F3oSvI/bhsLhmsg9mPQUDdSjr+l64ivZqA==
X-Received: by 2002:aa7:c147:0:b0:4bd:e63c:d3be with SMTP id r7-20020aa7c147000000b004bde63cd3bemr24297854edp.20.1678466761360;
        Fri, 10 Mar 2023 08:46:01 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id t21-20020a50d715000000b004accf3a63cbsm217252edi.68.2023.03.10.08.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 08:46:00 -0800 (PST)
Message-ID: <d0e59837-703b-964a-877e-38c244f58a85@redhat.com>
Date:   Fri, 10 Mar 2023 17:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH drm-next v2 00/16] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Content-Language: en-US
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, alexdeucher@gmail.com, ogabbay@kernel.org,
        bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230309101243.1150506f@collabora.com>
 <20230309104841.7c03d5b4@collabora.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230309104841.7c03d5b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Boris,

On 3/9/23 10:48, Boris Brezillon wrote:
> On Thu, 9 Mar 2023 10:12:43 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> Hi Danilo,
>>
>> On Fri, 17 Feb 2023 14:44:06 +0100
>> Danilo Krummrich <dakr@redhat.com> wrote:
>>
>>> Changes in V2:
>>> ==============
>>>    Nouveau:
>>>      - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in fence
>>>        signalling critical sections. Updates to the VA space are split up in three
>>>        separate stages, where only the 2. stage executes in a fence signalling
>>>        critical section:
>>>
>>>          1. update the VA space, allocate new structures and page tables
>>
>> Sorry for the silly question, but I didn't find where the page tables
>> pre-allocation happens. Mind pointing it to me? It's also unclear when
>> this step happens. Is this at bind-job submission time, when the job is
>> not necessarily ready to run, potentially waiting for other deps to be
>> signaled. Or is it done when all deps are met, as an extra step before
>> jumping to step 2. If that's the former, then I don't see how the VA
>> space update can happen, since the bind-job might depend on other
>> bind-jobs modifying the same portion of the VA space (unbind ops might
>> lead to intermediate page table levels disappearing while we were
>> waiting for deps). If it's the latter, I wonder why this is not
>> considered as an allocation in the fence signaling path (for the
>> bind-job out-fence to be signaled, you need these allocations to
>> succeed, unless failing to allocate page-tables is considered like a HW
>> misbehavior and the fence is signaled with an error in that case).
> 
> Ok, so I just noticed you only have one bind queue per drm_file
> (cli->sched_entity), and jobs are executed in-order on a given queue,
> so I guess that allows you to modify the VA space at submit time
> without risking any modifications to the VA space coming from other
> bind-queues targeting the same VM. And, if I'm correct, synchronous
> bind/unbind ops take the same path, so no risk for those to modify the
> VA space either (just wonder if it's a good thing to have to sync
> bind/unbind operations waiting on async ones, but that's a different
> topic).

Yes, that's all correct.

The page table allocation happens through nouveau_uvmm_vmm_get() which 
either allocates the corresponding page tables or increases the 
reference count, in case they already exist, accordingly.
The call goes all the way through nvif into the nvkm layer (not the 
easiest to follow the call chain) and ends up in nvkm_vmm_ptes_get().

There are multiple reasons for updating the VA space at submit time in 
Nouveau.

1) Subsequent EXEC ioctl() calls would need to wait for the bind jobs 
they depend on within the ioctl() rather than in the scheduler queue, 
because at the point of time where the ioctl() happens the VA space 
wouldn't be up-to-date.

2) Let's assume a new mapping is requested and within it's range other 
mappings already exist. Let's also assume that those existing mappings 
aren't contiguous, such that there are gaps between them. In such a case 
I need to allocate page tables only for the gaps between the existing 
mappings, or alternatively, allocate them for the whole range of the new 
mapping, but free / decrease the reference count of the page tables for 
the ranges of the previously existing mappings afterwards.
In the first case I need to know the gaps to allocate page tables for 
when submitting the job, which means the VA space must be up-to-date. In 
the latter one I must save the ranges of the previously existing 
mappings somewhere in order to clean them up, hence I need to allocate 
memory to store this information. Since I can't allocate this memory in 
the jobs run() callback (fence signalling critical section) I need to do 
it when submitting the job already and hence the VA space must be 
up-to-date again.
However, this is due to how page table management currently works in 
Nouveau and we might change that in the future.

Synchronous binds/unbinds taking the same path through the scheduler is 
a downside of this approach.

- Danilo

> 
>>
>> Note that I'm not familiar at all with Nouveau or TTM, and it might
>> be something that's solved by another component, or I'm just
>> misunderstanding how the whole thing is supposed to work. This being
>> said, I'd really like to implement a VM_BIND-like uAPI in pancsf using
>> the gpuva_manager infra you're proposing here, so please bare with me
>> :-).
>>
>>>          2. (un-)map the requested memory bindings
>>>          3. free structures and page tables
>>>
>>>      - Separated generic job scheduler code from specific job implementations.
>>>      - Separated the EXEC and VM_BIND implementation of the UAPI.
>>>      - Reworked the locking parts of the nvkm/vmm RAW interface, such that
>>>        (un-)map operations can be executed in fence signalling critical sections.
>>>    
>>
>> Regards,
>>
>> Boris
>>
> 

