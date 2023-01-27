Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A97467DB3D
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jan 2023 02:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjA0B1T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Jan 2023 20:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjA0B1S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 20:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D08E721FB
        for <linux-doc@vger.kernel.org>; Thu, 26 Jan 2023 17:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674782791;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hbvey5wHHvjs/oXB5rGmtyX2nEk7d2EsdqbZiV/BBWQ=;
        b=BKXTLytUhlRwxG7l79TY9DFxEO8JCdfuCdMAsdcZlHOQMGL3JjmMgStQnlq4lAQnlaF0Jq
        14EelEsSCOqWM46mJDOiyZSRMEhPdm0WJxkFqCa1KVc1wNO+aYabiUsB6Cy2/JjFVqTRhU
        DpEbBA/aYLGG2lqG/NKsXqpWnVTNuaY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-pDWKffKENz6lXs8mTKqvIQ-1; Thu, 26 Jan 2023 20:26:28 -0500
X-MC-Unique: pDWKffKENz6lXs8mTKqvIQ-1
Received: by mail-ej1-f69.google.com with SMTP id jg2-20020a170907970200b0086ee94381fbso2319684ejc.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Jan 2023 17:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbvey5wHHvjs/oXB5rGmtyX2nEk7d2EsdqbZiV/BBWQ=;
        b=Ji+HuzoBDid3Xl0aVTMC+/LGzTfJcN3j3lTArXwXourOBX70Yrr5gT1DxLWAmE3JcT
         NpeWDZcdlP/rZU8E1hzTzEcxlHK3I5xzNlvTzYHw46dfoQNVH2jN+umtGZhUkJ33jjhD
         YitlZNEpK1nlva72ypohI1qT9sz/PR6dmCi2zkMjMwvPbanuoevwVRlN+R7D2oGLm9fI
         1M9HSPSdzzQoIx6h0w+NXxQKDpL6GxCQqPApl6hvJqS5xe4e1F98CCDYRqzHYohFPcLS
         ydlXRNbzN7aaQuP/uBwpyW4tB4eS4hvccIENk2rLiil+5gGVtXHHdozlmtd7JZsLpOeP
         uzKA==
X-Gm-Message-State: AFqh2krwbuOY9Sq4lmcHeDqiYHNts774nqIDrDQ93ReSR+IlMPHWmoxK
        UtP8eaKXF5cYQIcTyIAgsUDRuZcyUVrJA+AsJ8wfFnm0UzNQiOdUodCmJi7bh0scsLqEd+PlX7R
        8+4MFgiXZ/DW/kDiybbeG
X-Received: by 2002:aa7:c845:0:b0:497:b6bc:b811 with SMTP id g5-20020aa7c845000000b00497b6bcb811mr37913425edt.33.1674782787022;
        Thu, 26 Jan 2023 17:26:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu6lha1mIb8CVkXNvveMAnSWzbNPvcCRf2xMZqXV2fpjBOJrCyBsekrS27Y2oQ8i/77wGdXrA==
X-Received: by 2002:aa7:c845:0:b0:497:b6bc:b811 with SMTP id g5-20020aa7c845000000b00497b6bcb811mr37913404edt.33.1674782786693;
        Thu, 26 Jan 2023 17:26:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7c0d7000000b0046892e493dcsm1530377edp.26.2023.01.26.17.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 17:26:26 -0800 (PST)
Message-ID: <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
Date:   Fri, 27 Jan 2023 02:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
Content-Language: en-US
To:     Matthew Brost <matthew.brost@intel.com>
Cc:     daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
        bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/27/23 02:05, Matthew Brost wrote:
> On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
>> This commit provides the interfaces for the new UAPI motivated by the
>> Vulkan API. It allows user mode drivers (UMDs) to:
>>
>> 1) Initialize a GPU virtual address (VA) space via the new
>>     DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
>>     VA area.
>>
>> 2) Bind and unbind GPU VA space mappings via the new
>>     DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>>
>> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
>>
>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
>> asynchronous processing with DRM syncobjs as synchronization mechanism.
>>
>> The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
>> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
>>
>> Co-authored-by: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   Documentation/gpu/driver-uapi.rst |   8 ++
>>   include/uapi/drm/nouveau_drm.h    | 216 ++++++++++++++++++++++++++++++
>>   2 files changed, 224 insertions(+)
>>
>> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
>> index 4411e6919a3d..9c7ca6e33a68 100644
>> --- a/Documentation/gpu/driver-uapi.rst
>> +++ b/Documentation/gpu/driver-uapi.rst
>> @@ -6,3 +6,11 @@ drm/i915 uAPI
>>   =============
>>   
>>   .. kernel-doc:: include/uapi/drm/i915_drm.h
>> +
>> +drm/nouveau uAPI
>> +================
>> +
>> +VM_BIND / EXEC uAPI
>> +-------------------
>> +
>> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
>> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
>> index 853a327433d3..f6e7d40201d4 100644
>> --- a/include/uapi/drm/nouveau_drm.h
>> +++ b/include/uapi/drm/nouveau_drm.h
>> @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
>>   	__u32 handle;
>>   };
>>   
>> +/**
>> + * struct drm_nouveau_sync - sync object
>> + *
>> + * This structure serves as synchronization mechanism for (potentially)
>> + * asynchronous operations such as EXEC or VM_BIND.
>> + */
>> +struct drm_nouveau_sync {
>> +	/**
>> +	 * @flags: the flags for a sync object
>> +	 *
>> +	 * The first 8 bits are used to determine the type of the sync object.
>> +	 */
>> +	__u32 flags;
>> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
>> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
>> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
>> +	/**
>> +	 * @handle: the handle of the sync object
>> +	 */
>> +	__u32 handle;
>> +	/**
>> +	 * @timeline_value:
>> +	 *
>> +	 * The timeline point of the sync object in case the syncobj is of
>> +	 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
>> +	 */
>> +	__u64 timeline_value;
>> +};
>> +
>> +/**
>> + * struct drm_nouveau_vm_init - GPU VA space init structure
>> + *
>> + * Used to initialize the GPU's VA space for a user client, telling the kernel
>> + * which portion of the VA space is managed by the UMD and kernel respectively.
>> + */
>> +struct drm_nouveau_vm_init {
>> +	/**
>> +	 * @unmanaged_addr: start address of the kernel managed VA space region
>> +	 */
>> +	__u64 unmanaged_addr;
>> +	/**
>> +	 * @unmanaged_size: size of the kernel managed VA space region in bytes
>> +	 */
>> +	__u64 unmanaged_size;
>> +};
>> +
>> +/**
>> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
>> + *
>> + * This structure represents a single VM_BIND operation. UMDs should pass
>> + * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr field.
>> + */
>> +struct drm_nouveau_vm_bind_op {
>> +	/**
>> +	 * @op: the operation type
>> +	 */
>> +	__u32 op;
>> +/**
>> + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
>> + *
>> + * The alloc operation is used to reserve a VA space region within the GPU's VA
>> + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to
>> + * instruct the kernel to create sparse mappings for the given region.
>> + */
>> +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
> 
> Do you really need this operation? We have no concept of this in Xe,
> e.g. we can create a VM and the entire address space is managed exactly
> the same.

The idea for alloc/free is to let UMDs allocate a portion of the VA 
space (which I call a region), basically the same thing Vulkan 
represents with a VKBuffer.

It serves two purposes:

1. It gives the kernel (in particular the GPUVA manager) the bounds in 
which it is allowed to merge mappings. E.g. when a user request asks for 
a new mapping and we detect we could merge this mapping with an existing 
one (used in another VKBuffer than the mapping request came for) the 
driver is not allowed to change the page table for the existing mapping 
we want to merge with (assuming that some drivers would need to do this 
in order to merge), because the existing mapping could already be in use 
and by re-mapping it we'd potentially cause a fault on the GPU.

2. It is used for sparse residency in a way that such an allocated VA 
space region can be flagged as sparse, such that the kernel always keeps 
sparse mappings around for the parts of the region that do not contain 
actual memory backed mappings.

If for your driver merging is always OK, creating a single huge region 
would do the trick I guess. Otherwise, we could also add an option to 
the GPUVA manager (or a specific region, which could also be a single 
huge one) within which it never merges.

> 
> If this can be removed then the entire concept of regions in the GPUVA
> can be removed too (drop struct drm_gpuva_region). I say this because
> in Xe as I'm porting over to GPUVA the first thing I'm doing after
> drm_gpuva_manager_init is calling drm_gpuva_region_insert on the entire
> address space. To me this seems kinda useless but maybe I'm missing why
> you need this for Nouveau.
> 
> Matt
> 
>> +/**
>> + * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
>> + */
>> +#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
>> +/**
>> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
>> + *
>> + * Map a GEM object to the GPU's VA space. The mapping must be fully enclosed by
>> + * a previously allocated VA space region. If the region is sparse, existing
>> + * sparse mappings are overwritten.
>> + */
>> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
>> +/**
>> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>> + *
>> + * Unmap an existing mapping in the GPU's VA space. If the region the mapping
>> + * is located in is a sparse region, new sparse mappings are created where the
>> + * unmapped (memory backed) mapping was mapped previously.
>> + */
>> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
>> +	/**
>> +	 * @flags: the flags for a &drm_nouveau_vm_bind_op
>> +	 */
>> +	__u32 flags;
>> +/**
>> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
>> + *
>> + * Indicates that an allocated VA space region should be sparse.
>> + */
>> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>> +	/**
>> +	 * @handle: the handle of the DRM GEM object to map
>> +	 */
>> +	__u32 handle;
>> +	/**
>> +	 * @addr:
>> +	 *
>> +	 * the address the VA space region or (memory backed) mapping should be mapped to
>> +	 */
>> +	__u64 addr;
>> +	/**
>> +	 * @bo_offset: the offset within the BO backing the mapping
>> +	 */
>> +	__u64 bo_offset;
>> +	/**
>> +	 * @range: the size of the requested mapping in bytes
>> +	 */
>> +	__u64 range;
>> +};
>> +
>> +/**
>> + * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
>> + */
>> +struct drm_nouveau_vm_bind {
>> +	/**
>> +	 * @op_count: the number of &drm_nouveau_vm_bind_op
>> +	 */
>> +	__u32 op_count;
>> +	/**
>> +	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>> +	 */
>> +	__u32 flags;
>> +/**
>> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>> + *
>> + * Indicates that the given VM_BIND operation should be executed asynchronously
>> + * by the kernel.
>> + *
>> + * If this flag is not supplied the kernel executes the associated operations
>> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
>> + */
>> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>> +	/**
>> +	 * @wait_count: the number of wait &drm_nouveau_syncs
>> +	 */
>> +	__u32 wait_count;
>> +	/**
>> +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
>> +	 */
>> +	__u32 sig_count;
>> +	/**
>> +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>> +	 */
>> +	__u64 wait_ptr;
>> +	/**
>> +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>> +	 */
>> +	__u64 sig_ptr;
>> +	/**
>> +	 * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
>> +	 */
>> +	__u64 op_ptr;
>> +};
>> +
>> +/**
>> + * struct drm_nouveau_exec_push - EXEC push operation
>> + *
>> + * This structure represents a single EXEC push operation. UMDs should pass an
>> + * array of this structure via struct drm_nouveau_exec's &push_ptr field.
>> + */
>> +struct drm_nouveau_exec_push {
>> +	/**
>> +	 * @va: the virtual address of the push buffer mapping
>> +	 */
>> +	__u64 va;
>> +	/**
>> +	 * @va_len: the length of the push buffer mapping
>> +	 */
>> +	__u64 va_len;
>> +};
>> +
>> +/**
>> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
>> + */
>> +struct drm_nouveau_exec {
>> +	/**
>> +	 * @channel: the channel to execute the push buffer in
>> +	 */
>> +	__u32 channel;
>> +	/**
>> +	 * @push_count: the number of &drm_nouveau_exec_push ops
>> +	 */
>> +	__u32 push_count;
>> +	/**
>> +	 * @wait_count: the number of wait &drm_nouveau_syncs
>> +	 */
>> +	__u32 wait_count;
>> +	/**
>> +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
>> +	 */
>> +	__u32 sig_count;
>> +	/**
>> +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
>> +	 */
>> +	__u64 wait_ptr;
>> +	/**
>> +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
>> +	 */
>> +	__u64 sig_ptr;
>> +	/**
>> +	 * @push_ptr: pointer to &drm_nouveau_exec_push ops
>> +	 */
>> +	__u64 push_ptr;
>> +};
>> +
>>   #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>>   #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>>   #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
>> @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
>>   #define DRM_NOUVEAU_NVIF               0x07
>>   #define DRM_NOUVEAU_SVM_INIT           0x08
>>   #define DRM_NOUVEAU_SVM_BIND           0x09
>> +#define DRM_NOUVEAU_VM_INIT            0x10
>> +#define DRM_NOUVEAU_VM_BIND            0x11
>> +#define DRM_NOUVEAU_EXEC               0x12
>>   #define DRM_NOUVEAU_GEM_NEW            0x40
>>   #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>>   #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
>> @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
>>   #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>>   #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>>   
>> +#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
>> +#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
>> +#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> -- 
>> 2.39.0
>>
> 

