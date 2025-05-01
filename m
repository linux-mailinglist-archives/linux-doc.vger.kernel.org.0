Return-Path: <linux-doc+bounces-45012-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ED2AA65C0
	for <lists+linux-doc@lfdr.de>; Thu,  1 May 2025 23:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE1FA16F56A
	for <lists+linux-doc@lfdr.de>; Thu,  1 May 2025 21:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D7A21019C;
	Thu,  1 May 2025 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SGdzWzKI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458AA1DD0EF
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135920; cv=none; b=qA5/VabSLPwLjqKJQsoI9/xqMMe3fUbxxyxdsEBvTJqECX/oDUequUr4mx1UN/pDFv9e1Z+6sdCoOiOP8YfYiWCt0ZcsK/A04Ek+N0UvpKKU2sYAdalU5gXvb8mSXd06Sdyqh+ZPIQJb0u6PgWKyUb74qe3BOCIio01wMoFL8u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135920; c=relaxed/simple;
	bh=1ET9KP8RClNAfd6IrcF68azgez6qvv9QSbmxMQKduHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPb6hVMPDFyWqFj2kgGm6zRAPVtnMlAcWe2EPgTFgoQxymYGY8wADNPy7J90f5ShhfI+oqN8Rs4TMbDwSJDLckrLm0d4Vo3wf2fQdYjL+WTv2ony2ozFmEgEX6k4VyiEDlaQJbsrwYk/CWLgt4wMFy5sKYNUv53S636WD3WiM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SGdzWzKI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2264c9d0295so59725ad.0
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746135917; x=1746740717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDl1IZro28hdfrXTqI+ublfVfpbjZSHTo0z7wnsFXgQ=;
        b=SGdzWzKIBG7U4E/uq6apsXkEdNeUSLUV4bYodU0PpCqfhhpREUJsKBA3x4dXV787ld
         WJXxmQxvirMgDLf9j5Ewypl7WsZYJFv/YdwIN5koXj7oIc4tRb/u9Usvv1QFUCG73sxi
         H0nmLXGqpp2FLAgrJDwW4s1G1cgrz4cjjfmhTxNLRsk2YJ3qPUoqY02YUgvw8eZW3HSS
         goItuyOPC+NTLY4XH3wYE4MPEUcKIWA4dXrRKqIQYCbYloR8+AtMVUkZtKp6u8UMnfHZ
         JzgEVfNnwhIe9jeG9jwOF3NgBSa0uXaGPYi9+07epYWtjV0E39sJEeWVUN8hlTP6rjFK
         lWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135917; x=1746740717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDl1IZro28hdfrXTqI+ublfVfpbjZSHTo0z7wnsFXgQ=;
        b=ChY3fUYR42T8GDJtHHJxoCyytH1IS59jm31AjuNTc7mpz87Ur1OWX90rYqO7/cwNfH
         LC0c1+ARIqj+OdIvtQ+yYvJtk9iZrqLARfXSK9XcRimAMG+eguVOzCHc5uEYT+XtEZ7D
         5j7wpLQB/oPQQehdQ/XP5aTFtkpkfX72KcY7PxyuQg62ej73MDJHTmKyvEGuxIALiM3U
         ip+3EuEgKsWTC5VSwROeLPVimv1maK4yPIYCGnJMjYZFLPpBPf4O8seNm5ouGG7UKpA+
         tyH0i9xJd4i8qfBga0WUvxtd36QvKzQguwXh/9OOnxXLzMGEJwx+PL9ZnHZ/H1Xp55FV
         NKxw==
X-Forwarded-Encrypted: i=1; AJvYcCW1SjtNVZ53Fhrq4LuE0FUG8M8gr+7jerl1jYGnOBjfmavjnf/2k411E2NRM/D2L700LDdd1PFLuH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+cJ5SLirO3EwaEQrpi0vjCdZuta0ynjdJj8HLT2KhCOICtgc
	mcD8mLv82JPVRSpqujkqgNOBQ3fSRtKfKDhR9ntwV/HZutVwT7Z/Hepboa/dNg==
X-Gm-Gg: ASbGncu1LJ+EIeeBrXewlrUVjf3hoYJ6fR5CEGFUSZBIVXd7uczmi2qgERa315DkqHX
	CS/Zdr5x7/J4FqCANy8/uAWHDJ7rB7HsMKG5zXdHgkb5PSiBIeNmuchkuBMHdJSqPOn4HYZctsT
	FBgKFNb0e5eFSDKG0surPPjNxYemper1sfj6IfDxXqp0sry1qBLRDOmIVJ9OeHbDzaLe6ZCe69L
	L4PW9TM7EPVvmwGeX9UE9kBSHwCD5lvP2ibSp34kVWGSeL8Py5OAi29YIXmsPj+trykTjVWY6Tv
	/XPxa3GTYGojrAvvBTrOL6cd7wBHgz30ZODDmZCTTj58IMOANO196Y9qibitkuevRe98/9oe
X-Google-Smtp-Source: AGHT+IFDO4aRxK7rdDiW3OLELFztZLzjuq4Em6bvp1QVNrSWDT0ZuSyTrNqpv/ttZNis0GC3pYd4Tg==
X-Received: by 2002:a17:902:dac7:b0:216:5e53:d055 with SMTP id d9443c01a7336-22e0798903bmr3390015ad.9.1746135917077;
        Thu, 01 May 2025 14:45:17 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa85e4ab2sm133113a12.55.2025.05.01.14.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:45:16 -0700 (PDT)
Date: Thu, 1 May 2025 21:45:05 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 21/22] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aBPrYXixWhFRkM7q@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <b81b2332f793a9ffccc528d821f2ed3ac051f9e0.1745646960.git.nicolinc@nvidia.com>
 <aBKdMaFLPFJYegIS@google.com>
 <aBKmk6PNFreeyfLh@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBKmk6PNFreeyfLh@Asurada-Nvidia>

On Wed, Apr 30, 2025 at 03:39:15PM -0700, Nicolin Chen wrote:
> On Wed, Apr 30, 2025 at 09:59:13PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:58:16PM -0700, Nicolin Chen wrote:
> > > The CMDQV HW supports a user-space use for virtualization cases. It allows
> > > the VM to issue guest-level TLBI or ATC_INV commands directly to the queue
> > > and executes them without a VMEXIT, as HW will replace the VMID field in a
> > > TLBI command and the SID field in an ATC_INV command with the preset VMID
> > > and SID.
> > > 
> > > This is built upon the vIOMMU infrastructure by allowing VMM to allocate a
> > > VINTF (as a vIOMMU object) and assign VCMDQs (vCMDQ objects) to the VINTF.
> > > 
> > > So firstly, replace the standard vSMMU model with the VINTF implementation
> > > but reuse the standard cache_invalidate op (for unsupported commands) and
> > > the standard alloc_domain_nested op (for standard nested STE).
> > > 
> > > Each VINTF has two 64KB MMIO pages (128B per logical vCMDQ):
> > >  - Page0 (directly accessed by guest) has all the control and status bits.
> > >  - Page1 (trapped by VMM) has guest-owned queue memory location/size info.
> > > 
> > > VMM should trap the emulated VINTF0's page1 of the guest VM for the guest-
> > > level VCMDQ location/size info and forward that to the kernel to translate
> > > to a physical memory location to program the VCMDQ HW during an allocation
> > > call. Then, it should mmap the assigned VINTF's page0 to the VINTF0 page0
> > > of the guest VM. This allows the guest OS to read and write the guest-own
> > > VINTF's page0 for direct control of the VCMDQ HW.
> > > 
> > > For ATC invalidation commands that hold an SID, it requires all devices to
> > > register their virtual SIDs to the SID_MATCH registers and their physical
> > > SIDs to the pairing SID_REPLACE registers, so that HW can use those as a
> > > lookup table to replace those virtual SIDs with the correct physical SIDs.
> > > Thus, implement the driver-allocated vDEVICE op with a tegra241_vintf_sid
> > > structure to allocate SID_REPLACE and to program the SIDs accordingly.
> > > 
> > > This enables the HW accelerated feature for NVIDIA Grace CPU. Compared to
> > > the standard SMMUv3 operating in the nested translation mode trapping CMDQ
> > > for TLBI and ATC_INV commands, this gives a huge performance improvement:
> > > 70% to 90% reductions of invalidation time were measured by various DMA
> > > unmap tests running in a guest OS.
> > > 
> > 
> > The write-up is super helpful to understand how the HW works from a high
> > level. Thanks for explaining this well! :) 
> > 
> > I'm curious to know the DMA unmap tests that were run for perf?
> 
> tools/testing/selftests/dma/dma_map_benchmark.c
> 

Ahh okay.. I thought it was something else. I guess it's worth posting
some comparitive results in the cover letter if you prefer.

> > >  /**
> > >   * struct iommu_hw_info_arm_smmuv3 - ARM SMMUv3 hardware information
> > >   *                                   (IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
> > >   *
> > > - * @flags: Must be set to 0
> > > - * @impl: Must be 0
> > > + * @flags: Combination of enum iommu_hw_info_arm_smmuv3_flags
> > > + * @impl: Implementation-defined bits when the following flags are set:
> > > + *        - IOMMU_HW_INFO_ARM_SMMUV3_HAS_TEGRA241_CMDQV
> > > + *          Bits[15:12] - Log2 of the total number of SID replacements
> > > + *          Bits[07:04] - Log2 of the total number of vCMDQs per vIOMMU
> > > + *          Bits[03:00] - Version number for the CMDQ-V HW
> > 
> > Nit: It seems that we deliberately chose not to reveal `NUM_VINTF_LOG2`
> > to the user-space. If so, maybe we shall mark those bitfields as unused
> > or reserved for clarity? Bits[11:08] - Reserved / Unused (even 31:16).
> 
> I think it should have been there, but kernel should just report 0.
>                  Bits[11:08] - Log2 of the total number of virtual interface
> 

Ack.

> > >   * @idr: Implemented features for ARM SMMU Non-secure programming interface
> > >   * @iidr: Information about the implementation and implementer of ARM SMMU,
> > >   *        and architecture version supported
> > > @@ -952,10 +965,28 @@ struct iommu_fault_alloc {
> > >   * enum iommu_viommu_type - Virtual IOMMU Type
> > >   * @IOMMU_VIOMMU_TYPE_DEFAULT: Reserved for future use
> > >   * @IOMMU_VIOMMU_TYPE_ARM_SMMUV3: ARM SMMUv3 driver specific type
> > > + * @IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV: NVIDIA Tegra241 CMDQV Extension for SMMUv3
> > >   */
> > >  enum iommu_viommu_type {
> > >  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
> > >  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
> > > +	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
> > > +};
> > 
> > This is a little confusing.. I understand that we need a new viommu type
> > to copy the new struct iommu_viommu_tegra241_cmdqv b/w the user & kernel
> > 
> > But, in a previous patch (Add vsmmu_alloc impl op), we add a check to
> > fallback to the standard type SMMUv3, if the impl_ops->vsmmu_alloc 
> > returns -EOPNOTSUPP:
> > 
> > 	if (master->smmu->impl_ops && master->smmu->impl_ops->vsmmu_alloc)
> > 		vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> > 			master->smmu, s2_parent, ictx, viommu_type, user_data);
> > 	if (PTR_ERR(vsmmu) == -EOPNOTSUPP) {
> > 		if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
> > 			return ERR_PTR(-EOPNOTSUPP);
> > 		/* Fallback to standard SMMUv3 type if viommu_type matches */
> > 		vsmmu = iommufd_viommu_alloc(ictx, struct arm_vsmmu, core,
> > 					     &arm_vsmmu_ops);
> > 
> > Now, if we'll ALWAYS try to allocate an impl-specified vsmmu first, even
> > when the viommu_type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3, we are anyways
> > going to return back from the impl_ops->vsmmu_alloc with -EOPNOTSUPP.
> 
> That's not necessarily true. An impl_ops->vsmmu_alloc can support
> IOMMU_VIOMMU_TYPE_ARM_SMMUV3 potentially, e.g. an impl could just
> toggle a few special bits in a register and return a valid vsmmu
> pointer.
> 
> It doesn't work like this with VCMDQ as it supports its own type,
> but for the long run I think we should pass in the standard type
> to impl_ops->vsmmu_alloc too.
> 

That makes sense. I only considered CMDQV. Thanks for the clarification!

> > Then we'll again check if the retval was -EOPNOTSUPP and re-check the
> > viommu_type requested.. which seems a little counter intuitive.
> 
> It's just prioritizing the impl_ops->vsmmu_alloc. Similar to the
> probe, if VCMDQ is missing or encountering some initialization
> problem, give it a chance to fallback to the standard SMMU.
> 

Ack.

> > > +	/*
> > > +	 * @length must be a power of 2, in range of
> > > +	 *   [ 32, 1 ^ (idr[1].CMDQS + CMDQ_ENT_SZ_SHIFT) ]
> > > +	 */
> > 
> > Nit: 2 ^ (idr[1].CMDQS + CMDQ_ENT_SZ_SHIFT) to match the comment in uapi
> 
> Alok pointed it out too. Fixed.
> 

Thanks! I had only skimmed through Alok's comments and felt he only
pointed it out in the uapi and not here. Sorry for overlooking that :)

> > > +	vcmdq = iommufd_vcmdq_alloc(viommu, struct tegra241_vcmdq, core);
> > > +	if (!vcmdq)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	/*
> > > +	 * HW requires to unmap LVCMDQs in descending order, so destroy() must
> > > +	 * follow this rule. Set a dependency on its previous LVCMDQ so iommufd
> > > +	 * core will help enforce it.
> > > +	 */
> > > +	if (prev) {
> > > +		ret = iommufd_vcmdq_depend(vcmdq, prev, core);
> > > +		if (ret)
> > > +			goto free_vcmdq;
> > > +	}
> > > +	vcmdq->prev = prev;
> > > +
> > > +	ret = tegra241_vintf_init_lvcmdq(vintf, index, vcmdq);
> > > +	if (ret)
> > > +		goto free_vcmdq;
> > > +
> > > +	dev_dbg(cmdqv->dev, "%sallocated\n",
> > > +		lvcmdq_error_header(vcmdq, header, 64));
> > > +
> > > +	tegra241_vcmdq_map_lvcmdq(vcmdq);
> > > +
> > > +	vcmdq->cmdq.q.q_base = q_base & VCMDQ_ADDR;
> > > +	vcmdq->cmdq.q.q_base |= log2size;
> > > +
> > > +	ret = tegra241_vcmdq_hw_init_user(vcmdq);
> > > +	if (ret)
> > > +		goto free_vcmdq;
> > > +	vintf->lvcmdqs[index] = vcmdq;
> > > +
> > > +	return &vcmdq->core;
> > > +free_vcmdq:
> > > +	iommufd_struct_destroy(viommu->ictx, vcmdq, core);
> > > +	return ERR_PTR(ret);
> > 
> > Are we missing an undepend here?
> 
> Right. The iommufd_struct_destroy doesn't invoke obj->ops.abort().
> 
> The whole revert flow is wonky, missing all the unmap/deinit steps.
> 

Right.

> > > +static void tegra241_vintf_destroy_vdevice(struct iommufd_vdevice *vdev)
> > > +{
> > > +	struct tegra241_vintf_sid *vsid =
> > > +		container_of(vdev, struct tegra241_vintf_sid, core);
> > > +	struct tegra241_vintf *vintf = vsid->vintf;
> > > +
> > > +	writel_relaxed(0, REG_VINTF(vintf, SID_REPLACE(vsid->idx)));
> > > +	writel_relaxed(0, REG_VINTF(vintf, SID_MATCH(vsid->idx)));
> > 
> > Just a thought: Should these be writel to avoid races?
> > Although I believe all user-queues would be free-d by this point?
> 
> Yea. They should be. I will change them.
> 

Ack.

> Thanks
> Nicolin

Thanks
Praan

