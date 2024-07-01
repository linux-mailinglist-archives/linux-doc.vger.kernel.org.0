Return-Path: <linux-doc+bounces-19833-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D1091E622
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 19:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3F691F22B5A
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 17:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6353F16CD21;
	Mon,  1 Jul 2024 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="CKSLXSep"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D314AD25
	for <linux-doc@vger.kernel.org>; Mon,  1 Jul 2024 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853308; cv=none; b=gm3yPk7LmciHTHy83Kibyyp3p9ivVehQxvohZPAJl/IQ2g4iG1YdSL2UZ1wQ5iTnVQt2MroUAKhJqVwReCtc7IYR4fB3dU+XzOrae7w36o8vEncHP7ZysgnnzhGywokHeMKbr33AG7ZXcOEzjHUI9FxJ5ejcXTCWXFxQiTwgOOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853308; c=relaxed/simple;
	bh=qExW45/1/1Ch3sloxtbNfC3Wx4G1Hba3Q8lHze7Nqnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjIEHntIsI0LuFPtrYb+3Vig3CiEfxWMRu1Kgk2oeJDhMD6U5w33s6JQvzO7e6EBRyDcOoOv7vmQV8lZ9X+OGUe7YEFenmSVlmaeWJn8w+ck7DEtiuw2LkPmxxCgXTp4J0shlVUUkWvm/M85Hm99waLQrlQw6mdHmm31WyLer08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=CKSLXSep; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-424aa70fbc4so22625265e9.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1719853304; x=1720458104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEtwSsT8f1rhSc1gX7Ak6nA4NzVFoZT/y5iSR3NaswA=;
        b=CKSLXSepUla3PvckK7RIQt5HbvVjXDY06TSFAsE3BdCszpyvVn23woZDeDKETihxBW
         xskyYjYtx2K6bFiDIlWIJlOXGTUvFyh3NolMB2DOhpwq1tK2T0FUFpb3gVkmTIBCPCZ2
         BXOUoPh9b8F+vAKecTOoyWZvBsSs3rWp4Uvym2uITAFyBI9fBR7s7VZm1SoYVYTCNv2v
         V4BspYsqjx4ulTW5bt3cXI4FM1/6abUzLjlczAsbqMGf34hdTnRYplyNlkrAIO/GsXkj
         xpr22W+9M1yVZU8csPqhFD17mO4O/ir0PSvbShxPjxMT1tbiKti7Km3lvRlbWxM0dtpb
         gAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719853304; x=1720458104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEtwSsT8f1rhSc1gX7Ak6nA4NzVFoZT/y5iSR3NaswA=;
        b=DV0S+mndT5wPw973gTNaP/85qHuhUSsDNwd+82b8F3W2cAYcrLiGFyg/RdC5eOGjTt
         fMqQtvJUgYeRq3N+aKF/P0DCQOYYgxUAaG9mf3EmT3adf1AxZLrmlslWOGJn9sbBNVzF
         oRtD7OnheW7un8HyCTyUZgktnZu6iuLLLO1Dz63e/eeV1RhwgsaTVPtJ9Tf7rPtwmA+B
         EABB/t6d7xo3gzR5oHQDdYgDGCndZE5dV/5xm9qQwIFy9CMeQ14O/p/DVyPQ3Glw7Y3V
         cYnsCcr2FxyouPzcMPw0N1Vljt+iXEDJueOomf4ddlmGLjI7iXPx91/eGzfQlnN1wmI9
         QrXg==
X-Forwarded-Encrypted: i=1; AJvYcCW9l48QWm9aa0cKkoNh8GcAE2OM4XFOKkXQhdUxxQHASRoSwd/SBu7KrJvCzcUmRXABPgbPzx+ChUaOTsVYbrsDHNcskc0V0k4I
X-Gm-Message-State: AOJu0YxRVE5w6Ob3Wak/NTytSukYkQQqO8yv3MCYwHT7moIgcZh6tj91
	P9y3na0oRCTtVEM27sGFqMLlrquMbMRXo9SiLQoDWPIL0jKem93MbvNGDkSIn4s=
X-Google-Smtp-Source: AGHT+IEtDUSKzwuUgMWWp1N5EFZlk9+N4r+/RVGPSTepN8CyOc19OztAsCLL+3zjdsmhEvxdjtswqw==
X-Received: by 2002:a05:600c:3b24:b0:422:615f:649e with SMTP id 5b1f17b1804b1-4257a06dcf9mr47932555e9.27.1719853303452;
        Mon, 01 Jul 2024 10:01:43 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09a073sm160827635e9.32.2024.07.01.10.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 10:01:42 -0700 (PDT)
Message-ID: <40ef0eed-c514-4ec1-9486-2967f23824be@ursulin.net>
Date: Mon, 1 Jul 2024 18:01:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] drm/cgroup: Add memory accounting DRM cgroup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
 <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
 <20240627-paper-vicugna-of-fantasy-c549ed@houat>
 <6cb7c074-55cb-4825-9f80-5cf07bbd6745@linux.intel.com>
 <20240628-romantic-emerald-snake-7b26ca@houat>
 <70289c58-7947-4347-8600-658821a730b0@linux.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <70289c58-7947-4347-8600-658821a730b0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/07/2024 10:25, Maarten Lankhorst wrote:
> Den 2024-06-28 kl. 16:04, skrev Maxime Ripard:
>> Hi,
>>
>> On Thu, Jun 27, 2024 at 09:22:56PM GMT, Maarten Lankhorst wrote:
>>> Den 2024-06-27 kl. 19:16, skrev Maxime Ripard:
>>>> Hi,
>>>>
>>>> Thanks for working on this!
>>>>
>>>> On Thu, Jun 27, 2024 at 05:47:21PM GMT, Maarten Lankhorst wrote:
>>>>> The initial version was based roughly on the rdma and misc cgroup
>>>>> controllers, with a lot of the accounting code borrowed from rdma.
>>>>>
>>>>> The current version is a complete rewrite with page counter; it uses
>>>>> the same min/low/max semantics as the memory cgroup as a result.
>>>>>
>>>>> There's a small mismatch as TTM uses u64, and page_counter long pages.
>>>>> In practice it's not a problem. 32-bits systems don't really come with
>>>>>> =4GB cards and as long as we're consistently wrong with units, it's
>>>>> fine. The device page size may not be in the same units as kernel page
>>>>> size, and each region might also have a different page size (VRAM vs GART
>>>>> for example).
>>>>>
>>>>> The interface is simple:
>>>>> - populate drmcgroup_device->regions[..] name and size for each active
>>>>>     region, set num_regions accordingly.
>>>>> - Call drm(m)cg_register_device()
>>>>> - Use drmcg_try_charge to check if you can allocate a chunk of memory,
>>>>>     use drmcg_uncharge when freeing it. This may return an error code,
>>>>>     or -EAGAIN when the cgroup limit is reached. In that case a reference
>>>>>     to the limiting pool is returned.
>>>>> - The limiting cs can be used as compare function for
>>>>>     drmcs_evict_valuable.
>>>>> - After having evicted enough, drop reference to limiting cs with
>>>>>     drmcs_pool_put.
>>>>>
>>>>> This API allows you to limit device resources with cgroups.
>>>>> You can see the supported cards in /sys/fs/cgroup/drm.capacity
>>>>> You need to echo +drm to cgroup.subtree_control, and then you can
>>>>> partition memory.
>>>>>
>>>>> Signed-off-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
>>>>> Co-developed-by: Friedrich Vock<friedrich.vock@gmx.de>
>>>> I'm sorry, I should have wrote minutes on the discussion we had with TJ
>>>> and Tvrtko the other day.
>>>>
>>>> We're all very interested in making this happen, but doing a "DRM"
>>>> cgroup doesn't look like the right path to us.
>>>>
>>>> Indeed, we have a significant number of drivers that won't have a
>>>> dedicated memory but will depend on DMA allocations one way or the
>>>> other, and those pools are shared between multiple frameworks (DRM,
>>>> V4L2, DMA-Buf Heaps, at least).
>>>>
>>>> This was also pointed out by Sima some time ago here:
>>>> https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/
>>>>
>>>> So we'll want that cgroup subsystem to be cross-framework. We settled on
>>>> a "device" cgroup during the discussion, but I'm sure we'll have plenty
>>>> of bikeshedding.
>>>>
>>>> The other thing we agreed on, based on the feedback TJ got on the last
>>>> iterations of his series was to go for memcg for drivers not using DMA
>>>> allocations.
>>>>
>>>> It's the part where I expect some discussion there too :)
>>>>
>>>> So we went back to a previous version of TJ's work, and I've started to
>>>> work on:
>>>>
>>>>     - Integration of the cgroup in the GEM DMA and GEM VRAM helpers (this
>>>>       works on tidss right now)
>>>>
>>>>     - Integration of all heaps into that cgroup but the system one
>>>>       (working on this at the moment)
>>>
>>> Should be similar to what I have then. I think you could use my work to
>>> continue it.
>>>
>>> I made nothing DRM specific except the name, if you renamed it the device
>>> resource management cgroup and changed the init function signature to take a
>>> name instead of a drm pointer, nothing would change. This is exactly what
>>> I'm hoping to accomplish, including reserving memory.
>>
>> I've started to work on rebasing my current work onto your series today,
>> and I'm not entirely sure how what I described would best fit. Let's
>> assume we have two KMS device, one using shmem, one using DMA
>> allocations, two heaps, one using the page allocator, the other using
>> CMA, and one v4l2 device using dma allocations.
>>
>> So we would have one KMS device and one heap using the page allocator,
>> and one KMS device, one heap, and one v4l2 driver using the DMA
>> allocator.
>>
>> Would these make different cgroup devices, or different cgroup regions?
> 
> Each driver would register a device, whatever feels most logical for that device I suppose.
> 
> My guess is that a prefix would also be nice here, so register a device with name of drm/$name or v4l2/$name, heap/$name. I didn't give it much thought and we're still experimenting, so just try something. :)
> 
> There's no limit to amount of devices, I only fixed amount of pools to match TTM, but even that could be increased arbitrarily. I just don't think there is a point in doing so.

Do we need a plan for top level controls which do not include region 
names? If the latter will be driver specific then I am thinking of ease 
of configuring it all from the outside. Especially considering that one 
cgroup can have multiple devices in it.

Second question is about double accounting for shmem backed objects. I 
think they will be seen, for drivers which allocate backing store at 
buffer objects creation time, under the cgroup of process doing the 
creation, in the existing memory controller. Right?

Is there a chance to exclude those from there and only have them in this 
new controller? Or would the opposite be a better choice? That is, not 
see those in the device memory controller but only in the existing one.

Regards,

Tvrtko

>>> The nice thing is that it should be similar to the memory cgroup controller
>>> in semantics, so you would have the same memory behavior whether you use the
>>> device cgroup or memory cgroup.
>>>
>>> I'm sad I missed the discussion, but hopefully we can coordinate more now
>>> that we know we're both working on it. :)
>>
>> Yeah, definitely :)
>>
>> Maxime
> Cheers,
> ~Maarten

