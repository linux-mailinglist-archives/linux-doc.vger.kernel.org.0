Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A0069FADD
	for <lists+linux-doc@lfdr.de>; Wed, 22 Feb 2023 19:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjBVSO0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Feb 2023 13:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjBVSOZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 13:14:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E9228873
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677089617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XqqO0rUgMhwgJdjIVFra556HCvBTwneUbegddKxxOns=;
        b=NpihdwigM99hFqdYZc+mJBs4XgX2auZq2OSZlyCQ7hSaBuBOd58Q2i2t5sU0WVA39D75pV
        zRPopTCatGaZ+Ix/lbDM+6ZmuqhKad3smOpXWVC19+fwRbp65HD5rUSf+/mvBPDvfK2T/a
        3/5Fh71UB8BNARW9Fn8/XaELLwpiDBw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-7IHSEzcjNi-R1NRTA1ZQuw-1; Wed, 22 Feb 2023 13:13:36 -0500
X-MC-Unique: 7IHSEzcjNi-R1NRTA1ZQuw-1
Received: by mail-ed1-f71.google.com with SMTP id ck7-20020a0564021c0700b004a25d8d7593so11275683edb.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 10:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqqO0rUgMhwgJdjIVFra556HCvBTwneUbegddKxxOns=;
        b=46Wvq8SrXeX9x+st2r8tZnnBaH1A7S6NOHAC8rPSMyjbpXDrQc+IdAFf9OOlH7M2dn
         /m0jsXb/Rvwppra1xJlsAFS640/XWHw8O5cGv7UZkLbwqQE/2kEP/Vx4LMrE4aZZrsGQ
         m3YFPaXcvvKKGDwlBsfrH0vhl3NDnqd/SdKhzYSC7lN5eyAmvCxBjDGNPdorul5a6b4J
         UReQrzfWGBoBj9HBSFSP3LwSVFDK3mqGFNW4ZkM0sw8SuU+7Vo9ckP+CqMk1kFgIr0GP
         75hoi6aib0Pz9yN0qqN2GNaWdbjhZa1PwGYh8hdM0JvlnbgG5WdmyC3M98qHgcrttpjt
         rNwQ==
X-Gm-Message-State: AO0yUKXWSjlOEvKwBwDBmEFCfTlrGyimulyTvb4Bpu9l+YZ9Wb5Tr/SA
        u7oQii8r349qRwzYi/UCZPEwd0ptb5ZlMJ5d88J6kzBRl12rHaJ1IqU22C98WjJk6F+aelvwbwG
        l0Hi/pMbrowyUyWjXuUrj
X-Received: by 2002:a17:907:20e6:b0:878:52cd:9006 with SMTP id rh6-20020a17090720e600b0087852cd9006mr16955629ejb.69.1677089615508;
        Wed, 22 Feb 2023 10:13:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8pnNjNyrtcToicQSL2UtPBlMVzFFUJbFADJerh1tEpTGvMI8YH9Ox5TAtL2auS9R5gm90c3Q==
X-Received: by 2002:a17:907:20e6:b0:878:52cd:9006 with SMTP id rh6-20020a17090720e600b0087852cd9006mr16955602ejb.69.1677089615100;
        Wed, 22 Feb 2023 10:13:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id lf13-20020a170906ae4d00b008b12c318622sm8735972ejb.29.2023.02.22.10.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 10:13:34 -0800 (PST)
Message-ID: <ce3ee7f2-e8a3-80eb-9bca-cd465f7f332e@redhat.com>
Date:   Wed, 22 Feb 2023 19:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To:     "Liam R. Howlett" <Liam.Howlett@Oracle.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, matthew.brost@intel.com,
        boris.brezillon@collabora.com, alexdeucher@gmail.com,
        ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
        jason@jlekstrand.net, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Dave Airlie <airlied@redhat.com>
In-Reply-To: <20230221182050.day6z5ge2e3dxerv@revolver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/21/23 19:20, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230217 08:45]:
>> Add infrastructure to keep track of GPU virtual address (VA) mappings
>> with a decicated VA space manager implementation.
>>
>> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
>> start implementing, allow userspace applications to request multiple and
>> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
>> intended to serve the following purposes in this context.
>>
>> 1) Provide infrastructure to track GPU VA allocations and mappings,
>>     making use of the maple_tree.
>>
>> 2) Generically connect GPU VA mappings to their backing buffers, in
>>     particular DRM GEM objects.
>>
>> 3) Provide a common implementation to perform more complex mapping
>>     operations on the GPU VA space. In particular splitting and merging
>>     of GPU VA mappings, e.g. for intersecting mapping requests or partial
>>     unmap requests.
>>
>> Suggested-by: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   Documentation/gpu/drm-mm.rst    |   31 +
>>   drivers/gpu/drm/Makefile        |    1 +
>>   drivers/gpu/drm/drm_gem.c       |    3 +
>>   drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
>>   include/drm/drm_drv.h           |    6 +
>>   include/drm/drm_gem.h           |   75 ++
>>   include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
>>   7 files changed, 2534 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>>   create mode 100644 include/drm/drm_gpuva_mgr.h
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index a52e6f4117d6..c9f120cfe730 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>      :export:
>>   
> ...
> 
>> +
>> +/**
>> + * drm_gpuva_remove_iter - removes the iterators current element
>> + * @it: the &drm_gpuva_iterator
>> + *
>> + * This removes the element the iterator currently points to.
>> + */
>> +void
>> +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
>> +{
>> +	mas_erase(&it->mas);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_iter_remove);
>> +
>> +/**
>> + * drm_gpuva_insert - insert a &drm_gpuva
>> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
>> + * @va: the &drm_gpuva to insert
>> + * @addr: the start address of the GPU VA
>> + * @range: the range of the GPU VA
>> + *
>> + * Insert a &drm_gpuva with a given address and range into a
>> + * &drm_gpuva_manager.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
>> + */
>> +int
>> +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
>> +		 struct drm_gpuva *va)
>> +{
>> +	u64 addr = va->va.addr;
>> +	u64 range = va->va.range;
>> +	MA_STATE(mas, &mgr->va_mt, addr, addr + range - 1);
>> +	struct drm_gpuva_region *reg = NULL;
>> +	int ret;
>> +
>> +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
>> +		return -EINVAL;
>> +
>> +	if (unlikely(drm_gpuva_in_kernel_region(mgr, addr, range)))
>> +		return -EINVAL;
>> +
>> +	if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS) {
>> +		reg = drm_gpuva_in_region(mgr, addr, range);
>> +		if (unlikely(!reg))
>> +			return -EINVAL;
>> +	}
>> +
> 
> -----
> 
>> +	if (unlikely(drm_gpuva_find_first(mgr, addr, range)))
>> +		return -EEXIST;
>> +
>> +	ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> 
> mas_walk() will set the internal maple state to the limits to what it
> finds.  So, instead of an iterator, you can use the walk function and
> ensure there is a large enough area in the existing NULL:
> 
> /*
>   * Nothing at addr, mas now points to the location where the store would
>   * happen
>   */
> if (mas_walk(&mas))
> 	return -EEXIST;
> 
> /* The NULL entry ends at mas.last, make sure there is room */
> if (mas.last < (addr + range - 1))
> 	return -EEXIST;
> 
> /* Limit the store size to the correct end address, and store */
>   mas.last = addr + range - 1;
>   ret = mas_store_gfp(&mas, va, GFP_KERNEL);
> 

Would this variant be significantly more efficient?

Also, would this also work while already walking the tree?

To remove an entry while walking the tree I have a separate function 
drm_gpuva_iter_remove(). Would I need something similar for inserting 
entries?

I already provided this example in a separate mail thread, but it may 
makes sense to move this to the mailing list:

In __drm_gpuva_sm_map() we're iterating a given range of the tree, where 
the given range is the size of the newly requested mapping. 
__drm_gpuva_sm_map() invokes a callback for each sub-operation that 
needs to be taken in order to fulfill this mapping request. In most 
cases such a callback just creates a drm_gpuva_op object and stores it 
in a list.

However, drivers can also implement the callback, such that they 
directly execute this operation within the callback.

Let's have a look at the following example:

      0     a     2
old: |-----------|       (bo_offset=n)

            1     b     3
req:       |-----------| (bo_offset=m)

      0  a' 1     b     3
new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)

This would result in the following operations.

__drm_gpuva_sm_map() finds entry "a" and calls back into the driver 
suggesting to re-map "a" with the new size. The driver removes entry "a" 
from the tree and adds "a'"

__drm_gpuva_sm_map(), ideally, continues the loop searching for nodes 
starting from the end of "a" (which is 2) till the end of the requested 
mapping "b" (which is 3). Since it doesn't find any other mapping within 
this range it calls back into the driver suggesting to finally map "b".

If there would have been another mapping between 2 and 3 it would have 
called back into the driver asking to unmap this mapping beforehand.

So, it boils down to re-mapping as described at the beginning (and 
analogously at the end) of a new mapping range and removing of entries 
that are enclosed by the new mapping range.

>> +	if (unlikely(ret))
>> +		return ret;
>> +
>> +	va->mgr = mgr;
>> +	va->region = reg;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_insert);
>> +
>> +/**
>> + * drm_gpuva_remove - remove a &drm_gpuva
>> + * @va: the &drm_gpuva to remove
>> + *
>> + * This removes the given &va from the underlaying tree.
>> + */
>> +void
>> +drm_gpuva_remove(struct drm_gpuva *va)
>> +{
>> +	MA_STATE(mas, &va->mgr->va_mt, va->va.addr, 0);
>> +
>> +	mas_erase(&mas);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_remove);
>> +
> ...
> 
>> +/**
>> + * drm_gpuva_find_first - find the first &drm_gpuva in the given range
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @addr: the &drm_gpuvas address
>> + * @range: the &drm_gpuvas range
>> + *
>> + * Returns: the first &drm_gpuva within the given range
>> + */
>> +struct drm_gpuva *
>> +drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
>> +		     u64 addr, u64 range)
>> +{
>> +	MA_STATE(mas, &mgr->va_mt, addr, 0);
>> +
>> +	return mas_find(&mas, addr + range - 1);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_find_first);
>> +
>> +/**
>> + * drm_gpuva_find - find a &drm_gpuva
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @addr: the &drm_gpuvas address
>> + * @range: the &drm_gpuvas range
>> + *
>> + * Returns: the &drm_gpuva at a given &addr and with a given &range
> 
> Note that mas_find() will continue upwards in the address space if there
> isn't anything at @addr.  This means that &drm_gpuva may not be at
> &addr.  If you want to check just at &addr, use mas_walk().

Good catch. drm_gpuva_find() should then either also check for 
'va->va.addr == addr' as well or, alternatively, use mas_walk(). As 
above, any reason to prefer mas_walk()?

> 
>> + */
>> +struct drm_gpuva *
>> +drm_gpuva_find(struct drm_gpuva_manager *mgr,
>> +	       u64 addr, u64 range)
>> +{
>> +	struct drm_gpuva *va;
>> +
>> +	va = drm_gpuva_find_first(mgr, addr, range);
>> +	if (!va)
>> +		goto out;
>> +
>> +	if (va->va.range != range)
>> +		goto out;
>> +
>> +	return va;
>> +
>> +out:
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_find);
>> +
>> +/**
>> + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @start: the given GPU VA's start address
>> + *
>> + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
>> + *
>> + * Note that if there is any free space between the GPU VA mappings no mapping
>> + * is returned.
>> + *
>> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
>> + */
>> +struct drm_gpuva *
>> +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> 
> find_prev() usually continues beyond 1 less than the address. I found
> this name confusing. 

Don't really get that, mind explaining?

> You may as well use mas_walk(), it would be faster.

How would I use mas_walk() for that? If I understand it correctly, 
mas_walk() requires me to know that start address, which I don't know 
for the previous entry.

However, mas_walk() seems to be a good alternative to use for 
drm_gpuva_find_next().

>> +{
>> +	MA_STATE(mas, &mgr->va_mt, start, 0);
>> +
>> +	if (start <= mgr->mm_start ||
>> +	    start > (mgr->mm_start + mgr->mm_range))
>> +		return NULL;
>> +
>> +	return mas_prev(&mas, start - 1);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_find_prev);
>> +
>> +/**
>> + * drm_gpuva_find_next - find the &drm_gpuva after the given address
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @end: the given GPU VA's end address
>> + *
>> + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
>> + *
>> + * Note that if there is any free space between the GPU VA mappings no mapping
>> + * is returned.
>> + *
>> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
>> + */
>> +struct drm_gpuva *
>> +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
> 
> This name is also a bit confusing for the same reason.  Again, it seems
> worth just walking to end here.
> 
>> +{
>> +	MA_STATE(mas, &mgr->va_mt, end - 1, 0);
>> +
>> +	if (end < mgr->mm_start ||
>> +	    end >= (mgr->mm_start + mgr->mm_range))
>> +		return NULL;
>> +
>> +	return mas_next(&mas, end);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_find_next);
>> +
>> +static int
>> +__drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
>> +			  struct drm_gpuva_region *reg)
>> +{
>> +	u64 addr = reg->va.addr;
>> +	u64 range = reg->va.range;
>> +	MA_STATE(mas, &mgr->region_mt, addr, addr + range - 1);
>> +	int ret;
>> +
>> +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
>> +		return -EINVAL;
>> +
>> +	ret = mas_store_gfp(&mas, reg, GFP_KERNEL);
>> +	if (unlikely(ret))
>> +		return ret;
>> +
>> +	reg->mgr = mgr;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * drm_gpuva_region_insert - insert a &drm_gpuva_region
>> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
>> + * @reg: the &drm_gpuva_region to insert
>> + * @addr: the start address of the GPU VA
>> + * @range: the range of the GPU VA
>> + *
>> + * Insert a &drm_gpuva_region with a given address and range into a
>> + * &drm_gpuva_manager.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
>> + */
>> +int
>> +drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
>> +			struct drm_gpuva_region *reg)
>> +{
>> +	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
>> +		return -EINVAL;
>> +
>> +	return __drm_gpuva_region_insert(mgr, reg);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_insert);
>> +
>> +static void
>> +__drm_gpuva_region_remove(struct drm_gpuva_region *reg)
>> +{
>> +	struct drm_gpuva_manager *mgr = reg->mgr;
>> +	MA_STATE(mas, &mgr->region_mt, reg->va.addr, 0);
>> +
>> +	mas_erase(&mas);
>> +}
>> +
>> +/**
>> + * drm_gpuva_region_remove - remove a &drm_gpuva_region
>> + * @reg: the &drm_gpuva to remove
>> + *
>> + * This removes the given &reg from the underlaying tree.
>> + */
>> +void
>> +drm_gpuva_region_remove(struct drm_gpuva_region *reg)
>> +{
>> +	struct drm_gpuva_manager *mgr = reg->mgr;
>> +
>> +	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
>> +		return;
>> +
>> +	if (unlikely(reg == &mgr->kernel_alloc_region)) {
>> +		WARN(1, "Can't destroy kernel reserved region.\n");
>> +		return;
>> +	}
>> +
>> +	if (unlikely(!drm_gpuva_region_empty(reg)))
>> +		WARN(1, "GPU VA region should be empty on destroy.\n");
>> +
>> +	__drm_gpuva_region_remove(reg);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_remove);
>> +
>> +/**
>> + * drm_gpuva_region_empty - indicate whether a &drm_gpuva_region is empty
>> + * @reg: the &drm_gpuva to destroy
>> + *
>> + * Returns: true if the &drm_gpuva_region is empty, false otherwise
>> + */
>> +bool
>> +drm_gpuva_region_empty(struct drm_gpuva_region *reg)
>> +{
>> +	DRM_GPUVA_ITER(it, reg->mgr);
>> +
>> +	drm_gpuva_iter_for_each_range(it, reg->va.addr,
>> +				      reg->va.addr +
>> +				      reg->va.range)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_empty);
>> +
>> +/**
>> + * drm_gpuva_region_find_first - find the first &drm_gpuva_region in the given
>> + * range
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @addr: the &drm_gpuva_regions address
>> + * @range: the &drm_gpuva_regions range
>> + *
>> + * Returns: the first &drm_gpuva_region within the given range
>> + */
>> +struct drm_gpuva_region *
>> +drm_gpuva_region_find_first(struct drm_gpuva_manager *mgr,
>> +			    u64 addr, u64 range)
>> +{
>> +	MA_STATE(mas, &mgr->region_mt, addr, 0);
>> +
>> +	return mas_find(&mas, addr + range - 1);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_find_first);
>> +
>> +/**
>> + * drm_gpuva_region_find - find a &drm_gpuva_region
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @addr: the &drm_gpuva_regions address
>> + * @range: the &drm_gpuva_regions range
>> + *
>> + * Returns: the &drm_gpuva_region at a given &addr and with a given &range
> 
> again, I'm not sure you want to find first or walk here.. It sounds like
> you want exactly addr to addr + range VMA?

Exactly, same as above.

> 
>> + */
>> +struct drm_gpuva_region *
>> +drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
>> +		      u64 addr, u64 range)
>> +{
>> +	struct drm_gpuva_region *reg;
>> +
>> +	reg = drm_gpuva_region_find_first(mgr, addr, range);
>> +	if (!reg)
>> +		goto out;
>> +
>> +	if (reg->va.range != range)
>> +		goto out;
>> +
>> +	return reg;
>> +
>> +out:
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_find);
>> +
> 
> ...
> 

