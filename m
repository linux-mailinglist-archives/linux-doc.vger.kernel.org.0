Return-Path: <linux-doc+bounces-6388-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08DB8283B8
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 11:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E25B91C238D3
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78ED2364A3;
	Tue,  9 Jan 2024 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieR/QY3n"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CA3364A2
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704795020; x=1736331020;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ldm5WxS6kpLPSDpnf1qqA4H1af3L/INN+aDvbII5ms0=;
  b=ieR/QY3n+YQZVvtfeCTpX/nHpUi1YmKbSFaRHxY1xicmLsPIw87upwm6
   pKdL7HW4+QeADcQVe6hmu4yuLWzAOyqWTPW+rT6ouf44Be0dXLqFwUaMt
   VNI7wkFP2hSzQCRwk+pgq2OcCnXSFzFKYwmKCJTbVcu7eYV5aP5l71OP7
   oVTDZa8rAzmcaa2BLMMxvObdnxw/zksHabXniuqeJRhdT0l2I5H3vEd9A
   aBms0G4fLDxEkx6pl3tvDLFdTy54ZftnryNkDq4a8h4XWNA67XI6iSRf4
   q4vG3mdHod6PATMac4uwIAmwzNtTVHMPB/VWYLe5TDZTBImRtH/VPVnP5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464549256"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="464549256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 02:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954963988"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="954963988"
Received: from aakinrin-mobl2.amr.corp.intel.com (HELO localhost) ([10.252.36.188])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 02:10:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Jonathan
 Corbet <corbet@lwn.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau: uapi: fix kerneldoc warnings
In-Reply-To: <724fdfaf-0e38-408b-a2d6-e3f39f28743d@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231225065145.3060754-1-vegard.nossum@oracle.com>
 <724fdfaf-0e38-408b-a2d6-e3f39f28743d@redhat.com>
Date: Tue, 09 Jan 2024 12:10:13 +0200
Message-ID: <87r0iqx1fe.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 08 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
> On 12/25/23 07:51, Vegard Nossum wrote:
>> As of commit b77fdd6a48e6 ("scripts/kernel-doc: restore warning for
>> Excess struct/union"), we see the following warnings when running 'make
>> htmldocs':
>> 
>>    ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_MAP' description in 'drm_nouveau_vm_bind_op'
>>    ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_UNMAP' description in 'drm_nouveau_vm_bind_op'
>>    ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_SPARSE' description in 'drm_nouveau_vm_bind_op'
>>    ./include/uapi/drm/nouveau_drm.h:336: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_RUN_ASYNC' description in 'drm_nouveau_vm_bind'
>> 
>> The problem is that these values are #define constants, but had kerneldoc
>> comments attached to them as if they were actual struct members.
>> 
>> There are a number of ways we could fix this, but I chose to draw
>> inspiration from include/uapi/drm/i915_drm.h, which pulls them into the
>> corresponding kerneldoc comment for the struct member that they are
>> intended to be used with.
>> 
>> To keep the diff readable, there are a number of things I _didn't_ do in
>> this patch, but which we should also consider:
>> 
>> - This is pretty good documentation, but it ends up in gpu/driver-uapi,
>>    which is part of subsystem-apis/ when it really ought to display under
>>    userspace-api/ (the "Linux kernel user-space API guide" book of the
>>    documentation).
>
> I agree, it indeed looks like this would make sense, same goes for
> gpu/drm-uapi.rst.
>
> @Jani, Sima: Was this intentional? Or can we change it?

I have no recollection of this, but overall I'd say do what makes sense,
and where things are easiest to find.

BR,
Jani.


>
>> 
>> - More generally, we might want a warning if include/uapi/ files are
>>    kerneldoc'd outside userspace-api/.
>> 
>> - I'd consider it cleaner if the #defines appeared between the kerneldoc
>>    for the member and the member itself (which is something other DRM-
>>    related UAPI docs do).
>> 
>> - The %IDENTIFIER kerneldoc syntax is intended for "constants", and is
>>    more appropriate in this context than ``IDENTIFIER`` or &IDENTIFIER.
>>    The DRM docs aren't very consistent on this.
>> 
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
>
> Applied to drm-misc-next, thanks!
>
>> ---
>>   include/uapi/drm/nouveau_drm.h | 56 ++++++++++++++++------------------
>>   1 file changed, 27 insertions(+), 29 deletions(-)
>> 
>> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
>> index 0bade1592f34..c95ef8a4d94a 100644
>> --- a/include/uapi/drm/nouveau_drm.h
>> +++ b/include/uapi/drm/nouveau_drm.h
>> @@ -238,34 +238,32 @@ struct drm_nouveau_vm_init {
>>   struct drm_nouveau_vm_bind_op {
>>   	/**
>>   	 * @op: the operation type
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * %DRM_NOUVEAU_VM_BIND_OP_MAP - Map a GEM object to the GPU's VA
>> +	 * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be
>> +	 * passed to instruct the kernel to create sparse mappings for the
>> +	 * given range.
>> +	 *
>> +	 * %DRM_NOUVEAU_VM_BIND_OP_UNMAP - Unmap an existing mapping in the
>> +	 * GPU's VA space. If the region the mapping is located in is a
>> +	 * sparse region, new sparse mappings are created where the unmapped
>> +	 * (memory backed) mapping was mapped previously. To remove a sparse
>> +	 * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
>>   	 */
>>   	__u32 op;
>> -/**
>> - * @DRM_NOUVEAU_VM_BIND_OP_MAP:
>> - *
>> - * Map a GEM object to the GPU's VA space. Optionally, the
>> - * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel to
>> - * create sparse mappings for the given range.
>> - */
>>   #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
>> -/**
>> - * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
>> - *
>> - * Unmap an existing mapping in the GPU's VA space. If the region the mapping
>> - * is located in is a sparse region, new sparse mappings are created where the
>> - * unmapped (memory backed) mapping was mapped previously. To remove a sparse
>> - * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
>> - */
>>   #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
>>   	/**
>>   	 * @flags: the flags for a &drm_nouveau_vm_bind_op
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * %DRM_NOUVEAU_VM_BIND_SPARSE - Indicates that an allocated VA
>> +	 * space region should be sparse.
>>   	 */
>>   	__u32 flags;
>> -/**
>> - * @DRM_NOUVEAU_VM_BIND_SPARSE:
>> - *
>> - * Indicates that an allocated VA space region should be sparse.
>> - */
>>   #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>>   	/**
>>   	 * @handle: the handle of the DRM GEM object to map
>> @@ -301,17 +299,17 @@ struct drm_nouveau_vm_bind {
>>   	__u32 op_count;
>>   	/**
>>   	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * %DRM_NOUVEAU_VM_BIND_RUN_ASYNC - Indicates that the given VM_BIND
>> +	 * operation should be executed asynchronously by the kernel.
>> +	 *
>> +	 * If this flag is not supplied the kernel executes the associated
>> +	 * operations synchronously and doesn't accept any &drm_nouveau_sync
>> +	 * objects.
>>   	 */
>>   	__u32 flags;
>> -/**
>> - * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
>> - *
>> - * Indicates that the given VM_BIND operation should be executed asynchronously
>> - * by the kernel.
>> - *
>> - * If this flag is not supplied the kernel executes the associated operations
>> - * synchronously and doesn't accept any &drm_nouveau_sync objects.
>> - */
>>   #define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>>   	/**
>>   	 * @wait_count: the number of wait &drm_nouveau_syncs
>

-- 
Jani Nikula, Intel

