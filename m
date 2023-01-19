Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7E067301B
	for <lists+linux-doc@lfdr.de>; Thu, 19 Jan 2023 05:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjASESs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Jan 2023 23:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjASEMv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 23:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF764DE02
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 20:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674101101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H7OPYm/CyGG7JZ3N2EKK6aABpcM+R88iLwPOmNK8ra0=;
        b=ILQCSIqc/l2PrwL9EtxmU0++QSnFH5w8UM4y21W7Cr+Q2k4KI1WW1fQMdxX8QBhhDGCq55
        SWpzfMBi4/J5bmBfZLZxjIZKbb1ebOsupXKrjoodpgFV8qjEbslDxD5tS74KClneLrGXqL
        nsyCzZHSMaokh/y/IVnnoDdlAz2VATU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-oFDbS_QoPjGDQqhEO99ExQ-1; Wed, 18 Jan 2023 23:04:43 -0500
X-MC-Unique: oFDbS_QoPjGDQqhEO99ExQ-1
Received: by mail-ej1-f71.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso645472ejb.14
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 20:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7OPYm/CyGG7JZ3N2EKK6aABpcM+R88iLwPOmNK8ra0=;
        b=MbX4atFyJ0pXc6h/PIL6goBPLSCb6+NJ1AgPbl69P+Hn1V1cvHym6o5fl67AEy3hyk
         SweN8npDUDKHco6M7p/T7Jp49ajNJn3UT2rVpj40uHA0khAyA0MmNIYywM18J6hH40Qq
         EQ5k2KhAC0NaJ1GTklLpZmsUny/cyt7KIB6x/NJSFg+iU8Clut1TgRd6xte0iA9KWDzA
         z5ZNxdCMF6UnBMxAcW5di9pq3nh6hMhDnp58bv6FsgvEDSN9GWpf0ulxnjhBFH+rBnHk
         f1TFGgJH9Hbd8nY4uKpv78rol0XuQkRKCs9u5sXfrVgPJ9fl4XfFros1fUSixiwANyxg
         KwkQ==
X-Gm-Message-State: AFqh2kqaF+SBqIU+nZ87yVmb61C5gGKQApPl2IrvnRVwHsKp32PavXcs
        SYm+7GckIg+igGhvG4uuTG0+fcSzc/EeUKwzvB6fkYTkwDvwVhEkYI36LjnRhUb9fHDkTjS0iOx
        dp502qMsYexedleN5URUM
X-Received: by 2002:a05:6402:524f:b0:49e:910:5706 with SMTP id t15-20020a056402524f00b0049e09105706mr13489755edd.2.1674101074377;
        Wed, 18 Jan 2023 20:04:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtsQ7JXA+AMUQUFgORRUO6Iabzzm99GnpRbsUa+PdAwtaX/BOrRFmUNvea0eeDfwBfpjgNzqA==
X-Received: by 2002:a05:6402:524f:b0:49e:910:5706 with SMTP id t15-20020a056402524f00b0049e09105706mr13489742edd.2.1674101074107;
        Wed, 18 Jan 2023 20:04:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id cf23-20020a170906b2d700b007aef930360asm11192409ejb.59.2023.01.18.20.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 20:04:33 -0800 (PST)
Message-ID: <6566870d-6256-8eef-5879-cb13711e4bed@redhat.com>
Date:   Thu, 19 Jan 2023 05:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@gmail.com>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     tzimmermann@suse.de, corbet@lwn.net, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bskeggs@redhat.com,
        jason@jlekstrand.net, airlied@redhat.com
References: <20230118061256.2689-1-dakr@redhat.com>
 <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
 <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
 <bcbef353-f579-4e90-1c77-be36bbe61c0f@redhat.com>
 <CADnq5_PGaXFW-z3gt+R+W+vBVdeuL4wMuMOQh4muxU13Bemy3A@mail.gmail.com>
 <0f2d6e1a-a3b5-f323-a29d-caade427292c@redhat.com>
 <CADnq5_Nh-1esiHzvTG+qFBCfMjy21efX-YN2jfGG=WC+-4LwLQ@mail.gmail.com>
 <CAPM=9txMZO1uYj+kVdTfmCwV2Fq8uu_b3i4eq4xhqPEPKBW8Eg@mail.gmail.com>
 <7839c47e-6692-b93b-69a8-9584193cb07d@amd.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <7839c47e-6692-b93b-69a8-9584193cb07d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/18/23 20:48, Christian König wrote:
> Am 18.01.23 um 20:17 schrieb Dave Airlie:
>> On Thu, 19 Jan 2023 at 02:54, Alex Deucher <alexdeucher@gmail.com> wrote:
>>> On Wed, Jan 18, 2023 at 11:50 AM Danilo Krummrich <dakr@redhat.com> 
>>> wrote:
>>>>
>>>>
>>>> On 1/18/23 17:30, Alex Deucher wrote:
>>>>> On Wed, Jan 18, 2023 at 11:19 AM Danilo Krummrich <dakr@redhat.com> 
>>>>> wrote:
>>>>>> On 1/18/23 16:37, Christian König wrote:
>>>>>>> Am 18.01.23 um 16:34 schrieb Danilo Krummrich:
>>>>>>>> Hi Christian,
>>>>>>>>
>>>>>>>> On 1/18/23 09:53, Christian König wrote:
>>>>>>>>> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
>>>>>>>>>> This patch series provides a new UAPI for the Nouveau driver in
>>>>>>>>>> order to
>>>>>>>>>> support Vulkan features, such as sparse bindings and sparse 
>>>>>>>>>> residency.
>>>>>>>>>>
>>>>>>>>>> Furthermore, with the DRM GPUVA manager it provides a new DRM 
>>>>>>>>>> core
>>>>>>>>>> feature to
>>>>>>>>>> keep track of GPU virtual address (VA) mappings in a more 
>>>>>>>>>> generic way.
>>>>>>>>>>
>>>>>>>>>> The DRM GPUVA manager is indented to help drivers implement
>>>>>>>>>> userspace-manageable
>>>>>>>>>> GPU VA spaces in reference to the Vulkan API. In order to achieve
>>>>>>>>>> this goal it
>>>>>>>>>> serves the following purposes in this context.
>>>>>>>>>>
>>>>>>>>>>        1) Provide a dedicated range allocator to track GPU VA
>>>>>>>>>> allocations and
>>>>>>>>>>           mappings, making use of the drm_mm range allocator.
>>>>>>>>> This means that the ranges are allocated by the kernel? If yes 
>>>>>>>>> that's
>>>>>>>>> a really really bad idea.
>>>>>>>> No, it's just for keeping track of the ranges userspace has 
>>>>>>>> allocated.
>>>>>>> Ok, that makes more sense.
>>>>>>>
>>>>>>> So basically you have an IOCTL which asks kernel for a free 
>>>>>>> range? Or
>>>>>>> what exactly is the drm_mm used for here?
>>>>>> Not even that, userspace provides both the base address and the 
>>>>>> range,
>>>>>> the kernel really just keeps track of things. Though, writing a 
>>>>>> UAPI on
>>>>>> top of the GPUVA manager asking for a free range instead would be
>>>>>> possible by just adding the corresponding wrapper functions to get a
>>>>>> free hole.
>>>>>>
>>>>>> Currently, and that's what I think I read out of your question, 
>>>>>> the main
>>>>>> benefit of using drm_mm over simply stuffing the entries into a 
>>>>>> list or
>>>>>> something boils down to easier collision detection and iterating
>>>>>> sub-ranges of the whole VA space.
>>>>> Why not just do this in userspace?  We have a range manager in
>>>>> libdrm_amdgpu that you could lift out into libdrm or some other
>>>>> helper.
>>>> The kernel still needs to keep track of the mappings within the various
>>>> VA spaces, e.g. it silently needs to unmap mappings that are backed by
>>>> BOs that get evicted and remap them once they're validated (or swapped
>>>> back in).
>>> Ok, you are just using this for maintaining the GPU VM space in the 
>>> kernel.
>>>
>> Yes the idea behind having common code wrapping drm_mm for this is to
>> allow us to make the rules consistent across drivers.
>>
>> Userspace (generally Vulkan, some compute) has interfaces that pretty
>> much dictate a lot of how VMA tracking works, esp around lifetimes,
>> sparse mappings and splitting/merging underlying page tables, I'd
>> really like this to be more consistent across drivers, because already
>> I think we've seen with freedreno some divergence from amdgpu and we
>> also have i915/xe to deal with. I'd like to at least have one place
>> that we can say this is how it should work, since this is something
>> that *should* be consistent across drivers mostly, as it is more about
>> how the uapi is exposed.
> 
> That's a really good idea, but the implementation with drm_mm won't work 
> like that.
> 
> We have Vulkan applications which use the sparse feature to create 
> literally millions of mappings. That's why I have fine tuned the mapping 
> structure in amdgpu down to ~80 bytes IIRC and save every CPU cycle 
> possible in the handling of that.

That's a valuable information. Can you recommend such an application for 
testing / benchmarking?

Your optimization effort sounds great. May it be worth thinking about 
generalizing your approach by itself and stacking the drm_gpuva_manager 
on top of it?

> 
> A drm_mm_node is more in the range of ~200 bytes and certainly not 
> suitable for this kind of job.
> 
> I strongly suggest to rather use a good bunch of the amdgpu VM code as 
> blueprint for the common infrastructure.

I will definitely have look.

> 
> Regards,
> Christian.
> 
>>
>> Dave.
> 

