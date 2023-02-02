Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE53688707
	for <lists+linux-doc@lfdr.de>; Thu,  2 Feb 2023 19:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbjBBSsK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Feb 2023 13:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbjBBSrr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 13:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54417E68C
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 10:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675363574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lsY8l7ll/bIfCJYKOZuorr0TYX+3DuYEPXKKiy4ugFg=;
        b=F09pT9Vz53MRH7jjFQPHx/xEjtxrZLOPyGA73p5wn2aRLUZIFluVlYhVz1bsWUhc/Jyrt/
        InQi6vUvhq85l79uoq83QHJtCQtSRPdSxUlz5bIZMlCsvU2wXqAP3+9W7s3B5AkjZ/Nh6F
        wg6Ro3iiCxT58PUfHy9o7xLE065+zvg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-B-wWVoojNoujlozlCVPE3w-1; Thu, 02 Feb 2023 13:31:57 -0500
X-MC-Unique: B-wWVoojNoujlozlCVPE3w-1
Received: by mail-ej1-f71.google.com with SMTP id ud13-20020a170907c60d00b0088d773d11d6so2077176ejc.17
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 10:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsY8l7ll/bIfCJYKOZuorr0TYX+3DuYEPXKKiy4ugFg=;
        b=QCGheW0ZGiYq9j1mk27efzRAB06y5dj6Qu0zTjvYycLZvQr28KyTZ5z6afu2nh8dT2
         9QY3vFOoK7guGL5EFTPkUZwG2xpePh43udNdXI0i7GAuN5JjuIqSpqPs/vUxnqnG4xqt
         8wfqHkMyg4U3ZUJuzyCEdx1J9TB0UTRruMgUTRRZY2PFsu6vJVjJVcFtt2B5yYyWwlyd
         WGHs+Ona3r8VJYpkojVA3RWurUFlQyMnUbqnIxlnyRLcjWX7Mx3hg0HCRTP78Dk5oDy+
         VgIEfKj5OJIsNlEGO4YE3OcR9pho64cJ3zRRfETURu6lVA7I8BK2ULfC/mUOqbXOU+AD
         +DCw==
X-Gm-Message-State: AO0yUKUsnwelQ30NdxOUfOJSEmnH0oqzfqeEhhb5f9ULf/rcrfldVEz0
        O2vDWxxBqeSnp7mNZe9D6fy9c3JfuYY/iQDsy49p9kraJc0IKRBG9SJalSEUPuTeRfiSxunJBtB
        JEDjFIzmTM4ePdFoWcUSh
X-Received: by 2002:a05:6402:3902:b0:4a0:e323:d59c with SMTP id fe2-20020a056402390200b004a0e323d59cmr7691114edb.20.1675362716432;
        Thu, 02 Feb 2023 10:31:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/ikiRtpvvkQ3oOLV95V31V4h0SdItsqYCO9YPufT5ZDb2Ulk5JLRhjW2bAa2foPyYu6EX1Uw==
X-Received: by 2002:a05:6402:3902:b0:4a0:e323:d59c with SMTP id fe2-20020a056402390200b004a0e323d59cmr7691097edb.20.1675362716228;
        Thu, 02 Feb 2023 10:31:56 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id f7-20020a056402354700b0045b4b67156fsm52740edd.45.2023.02.02.10.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 10:31:55 -0800 (PST)
Message-ID: <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
Date:   Thu, 2 Feb 2023 19:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@gmail.com>
Cc:     Matthew Brost <matthew.brost@intel.com>, daniel@ffwll.ch,
        corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mripard@kernel.org, bskeggs@redhat.com, jason@jlekstrand.net,
        nouveau@lists.freedesktop.org, airlied@redhat.com
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
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

On 2/2/23 12:53, Christian König wrote:
> Am 01.02.23 um 09:10 schrieb Dave Airlie:
>> [SNIP]
>>>> For drivers that don't intend to merge at all and (somehow) are
>>>> capable of dealing with sparse regions without knowing the sparse
>>>> region's boundaries, it'd be easy to make those gpuva_regions optional.
>>> Yeah, but this then defeats the approach of having the same hw
>>> independent interface/implementation for all drivers.
>> I think you are running a few steps ahead here. The plan isn't to have
>> an independent interface, it's to provide a set of routines and
>> tracking that will be consistent across drivers, so that all drivers
>> once using them will operate in mostly the same fashion with respect
>> to GPU VA tracking and VA/BO lifetimes. Already in the tree we have
>> amdgpu and freedreno which I think end up operating slightly different
>> around lifetimes. I'd like to save future driver writers the effort of
>> dealing with those decisions and this should drive their user api
>> design so to enable vulkan sparse bindings.
> 
> Ok in this case I'm pretty sure this is *NOT* a good idea.
> 
> See this means that we define the UAPI implicitly by saying to drivers 
> to use a common framework for their VM implementation which then results 
> in behavior A,B,C,D....
> 
> If a driver strides away from this common framework because it has 
> different requirements based on how his hw work you certainly get 
> different behavior again (and you have tons of hw specific requirements 
> in here).
> 
> What we should do instead if we want to have some common handling among 
> drivers (which I totally agree on makes sense) then we should define the 
> UAPI explicitly.

By asking that I don't want to say I'm against this idea, I'm just 
wondering how it becomes easier to deal with "tons of hw specific 
requirements" by generalizing things even more?

What makes us think that we do a better job in considering all hw 
specific requirements with a unified UAPI than with a more lightweight 
generic component for tracking VA mappings?

Also, wouldn't we need something like the GPUVA manager as part of a 
unified UAPI?

> 
> For example we could have a DRM_IOCTL_GPU_VM which takes both driver 
> independent as well as driver dependent information and then has the 
> documented behavior:
> a) VAs do (or don't) vanish automatically when the GEM handle is closed.
> b) GEM BOs do (or don't) get an additional reference for each VM they 
> are used in.
> c) Can handle some common use cases driver independent (BO mappings, 
> readonly, writeonly, sparse etc...).
> d) Has a well defined behavior when the operation is executed async. 
> E.g. in/out fences.
> e) Can still handle hw specific stuff like (for example) trap on access 
> etc....
> ...
> 
> Especially d is what Bas and I have pretty much already created a 
> prototype for the amdgpu specific IOCTL for, but essentially this is 
> completely driver independent and actually the more complex stuff. 
> Compared to that common lifetime of BOs is just nice to have.
> 
> I strongly think we should concentrate on getting this right as well.
> 
>> Now if merging is a feature that makes sense to one driver maybe it
>> makes sense to all, however there may be reasons amdgpu gets away
>> without merging that other drivers might not benefit from, there might
>> also be a benefit to amdgpu from merging that you haven't looked at
>> yet, so I think we could leave merging as an optional extra driver
>> knob here. The userspace API should operate the same, it would just be
>> the gpu pagetables that would end up different sizes.
> 
> Yeah, agree completely. The point is that we should not have complexity 
> inside the kernel which is not necessarily needed in the kernel.
> 
> So merging or not is something we have gone back and forth for amdgpu, 
> one the one hand it reduces the memory footprint of the housekeeping 
> overhead on the other hand it makes the handling more complex, error 
> prone and use a few more CPU cycles.
> 
> For amdgpu merging is mostly beneficial when you can get rid of a whole 
> page tables layer in the hierarchy, but for this you need to merge at 
> least 2MiB or 1GiB together. And since that case doesn't happen that 
> often we stopped doing it.
> 
> But for my understanding why you need the ranges for the merging? Isn't 
> it sufficient to check that the mappings have the same type, flags, BO, 
> whatever backing them?

Not entirely. Let's assume userspace creates two virtually contiguous 
buffers (VKBuffer) A and B. Userspace could bind a BO with BO offset 0 
to A (binding 1) and afterwards bind the same BO with BO offset 
length(A) to B (binding 2), maybe unlikely but AFAIK not illegal.

If we don't know about the bounds of A and B in the kernel, we detect 
that both bindings are virtually and physically contiguous and we merge 
them.

In the best case this was simply useless, because we'll need to split 
them anyway later on when A or B is destroyed, but in the worst case we 
could fault the GPU, e.g. if merging leads to a change of the page 
tables that are backing binding 1, but buffer A is already in use by 
userspace.

In Nouveau, I think we could also get rid of regions and do something 
driver specific for the handling of the dual page tables, which I want 
to use for sparse regions *and* just don't merge (at least for now). But 
exactly for the sake of not limiting drivers in their HW specifics I 
thought it'd be great if merging is supported in case it makes sense for 
a specific HW, especially given the fact that memory sizes are increasing.

> 
> Regards,
> Christian.
> 
> 
>>
>> Dave.
> 

