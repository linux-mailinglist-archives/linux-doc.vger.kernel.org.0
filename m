Return-Path: <linux-doc+bounces-51471-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3ADAF0510
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 22:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DF8483C73
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jul 2025 20:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CAA2FEE3D;
	Tue,  1 Jul 2025 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tDpRt3cO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296582ECD07
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751402621; cv=none; b=YtOZYFRghMODCVAqcmEw2tt7EC+V1wPlwdb2NTpCngIYSLFvvhh74PzqUi6OMIOuTZzR14yjMhKmDBZmNyB14jYo41p2nv9so9KvoCFQwFivkqZsj80uSjjP0Z8SYZTy9weWban9SzsmAR1Cv0tXJ/M8CAKr36n7B+0QpNg1aU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751402621; c=relaxed/simple;
	bh=t6w6HZ3d39NHLiwdzdaqKTFFJH+mBfnQBGoBzloEzXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9x9TGNEKh0P9PujAUIIjIcX0M7aEGZ4zMC8GWSnoqh7UAW+cDn4GmKmPMcW06hbcrNQC3UT/OfNWL7QGEAGt4qFi2yWSB+Y8KHYBgXMKF6riP0yQfjJamutt1IKagS9kDofhAG2e/iYklNF0tq1zWJ0w31gjqKvEENDBYj8zJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tDpRt3cO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235e389599fso325905ad.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751402619; x=1752007419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gp4ARI8yx8eK5+ZYKJ4V0qAwq8T5VmfMZEWG24JsVtU=;
        b=tDpRt3cOlJV+0eYx3cpvFlgyFkuAy70sDvbRT8UUSM/hdogqjjLUMhCc4DGgn8F/ly
         g4XyQLBApGchqcqnUuyzf4YCQlXhYFIiM1zatFRfpc3rPYOVU1xoPEZcfilf/bvhUCYH
         uTGT+CbAnxpwSRZvfUGXbb5TUFtu3+Vz7e1zhFf9jCE7cZVQte/+iI5czrdcS1mRrjQE
         8JAM5RTOZDtWCzwYl6smx0oPKN48GhcM/jIcj0aq0MOH8/+QeWw7VL2j1uP9TSY6O03D
         eiIrlm5hUd2mqDeRDrfsu1q9EMftSDckGVd5n1RPbXi3lGUAY1wY15z+mT1GeUuy+xos
         MBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751402619; x=1752007419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp4ARI8yx8eK5+ZYKJ4V0qAwq8T5VmfMZEWG24JsVtU=;
        b=pOj1t0nkFAQK/2Wtqa0+e4Xe7WIC657TuNVTcyrP8vVYb723ZVKsN7nOWzMQugjT7s
         QWZmRU7UqDQpSEY404VLo9ZoRHeNegM0iJUJ0Po/2N8IZAIkJcs9EnD4A83IFlZMM6AT
         hVs0Qq14a141oeHdO10WnArceHWdxl2gDm5tr5yYHU01hlJy410guEBgFdN2VW2Ns8YK
         64zEV0E7dkrH2QbbiIIxh6Mrg4ICgKgpQbiPvirzf2uJaWBDxCKZzs8hs9OBKA4dAbC0
         B/qaaYAe6lB5LBPxw0VBzQoZ6ZnXdsAbLiRtcwdKMUcUAhyToJbcGUs22hMhe4uapeS1
         1tyw==
X-Forwarded-Encrypted: i=1; AJvYcCUybrwp2jAZIUjaD2Kuuj6367fQMCF3hqQg4r0wcin9O99QUhTygxqXDrqqsf5wp5qsp94/UkaPCN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIqV4PwAXrYQ8y/BKD5acGxYD/TPw6xyGiRpG4QZM472McpCHD
	8vvMTqZpuA1PIfZkJOP0lbXE4xB6raeDkhdF6l7UOG64B/wSSoyRqaewm8TWm2nv1g==
X-Gm-Gg: ASbGnctJFgYdd8+u/+ySEED5ctDYh6L/UgZDyF9sUjZSr/x82b5XtM1yKK5WKWoJQme
	VP1qbBq2C/mfsvDaiMPC8lRNVvW/leAV4RZiTzXXzBTFsIMQJ7kN7CfSji8Dxc3j0Hlv052ipti
	qMpVclD5OqHVYcDwtimuVI5rHiPsevUSdBlCfhCQAWky7rrm5XXS9+tnxG/23rllLe//bQRX6s0
	iyj5xmd+7+SizFmEqzZdAM8QE5IYz1Dl/xuUGR3H1+3BMYoGhRnw9HlYwHeqfvnemyf2XBQ7B9/
	b2VYPeVh5ZWydaUnCLxc6U5sohBvXs8ftgu+sXfsHDC+F+Jx2FISWeSnGEUuGTfR1+T0wMvWk3o
	mcmsey+3U1xlxliX+rpiY
X-Google-Smtp-Source: AGHT+IEgQNF03gTMPFMuZ5i4oqeFgT9l/mftJxCXd5iV8tzIDEl3pR9lFMVTJeBzdy2r/6gfVZ+O7w==
X-Received: by 2002:a17:902:e54e:b0:231:d0ef:e8ff with SMTP id d9443c01a7336-23c5ff29f9dmr4133295ad.8.1751402619181;
        Tue, 01 Jul 2025 13:43:39 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bdeasm12778586b3a.53.2025.07.01.13.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 13:43:38 -0700 (PDT)
Date: Tue, 1 Jul 2025 20:43:30 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGRIctg4T6cQECx4@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGRDtYRXFLoT+PrI@Asurada-Nvidia>

On Tue, Jul 01, 2025 at 01:23:17PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 08:03:35PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 12:42:32PM -0700, Nicolin Chen wrote:
> > > On Tue, Jul 01, 2025 at 04:02:35PM +0000, Pranjal Shrivastava wrote:
> > > > On Thu, Jun 26, 2025 at 12:34:58PM -0700, Nicolin Chen wrote:
> > > > > +/**
> > > > > + * struct tegra241_vintf_sid - Virtual Interface Stream ID Replacement
> > > > > + * @core: Embedded iommufd_vdevice structure, holding virtual Stream ID
> > > > > + * @vintf: Parent VINTF pointer
> > > > > + * @sid: Physical Stream ID
> > > > > + * @idx: Replacement index in the VINTF
> > > > > + */
> > > > > +struct tegra241_vintf_sid {
> > > > > +	struct iommufd_vdevice core;
> > > > > +	struct tegra241_vintf *vintf;
> > > > > +	u32 sid;
> > > > > +	u8 idx;
> > > > >  };
> > > > 
> > > > AFAIU, This seems to be a handle for sid -> vintf mapping.. it yes, then
> > > > I'm not sure if "Virtual Interface Stream ID Replacement" clarifies that?
> > > 
> > > No. It's for vSID to pSID mappings. I had it explained in commit log:
> > > 
> > 
> > I get that, it's for vSID -> pSID mapping which also "happens to" point
> > to the vintf.. all I wanted to say was that the description is unclear..
> > We could've described it as "Vintf SID map" or something, but I guess
> > it's fine the way it is too.. your call.
> 
> The "replace" word is borrowed from the "SID_REPLACE" HW register.
> 
> But I think it's okay to call it just "mapping", if that makes it
> clearer.
> 

Anything works. Maybe let it be as is.

> > > > > +static struct iommufd_viommu_ops tegra241_cmdqv_viommu_ops = {
> > > > > +	.destroy = tegra241_cmdqv_destroy_vintf_user,
> > > > > +	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
> > > > > +	.cache_invalidate = arm_vsmmu_cache_invalidate,
> > > > 
> > > > I see that we currently use the main cmdq to issue these cache
> > > > invalidations (there's a FIXME in arm_vsmmu_cache_invalidate). I was
> > > > hoping for this series to change that but I'm assuming there's another
> > > > series coming for that?
> > > > 
> > > > Meanwhile, I guess it'd be good to call that out for folks who have
> > > > Grace and start trying out this feature.. I'm assuming they won't see
> > > > as much perf improvement with this series alone since we're still using
> > > > the main CMDQ in the upstream code?
> > > 
> > > VCMDQ only accelerates invalidation commands.
> > > 
> > 
> > I get that.. but I see we're using `arm_vsmmu_cache_invalidate` here
> > from arm-smmu-v3-iommufd.c which seems to issue all commands to
> > smmu->cmdq as of now (the code has a FIXME as well), per the code:
> > 
> > 	/* FIXME always uses the main cmdq rather than trying to group by type */
> >         ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, last->cmd,
> > 					  cur - last, true);
> > 
> > I was hoping this FIXME to be addressed in this series..
> 
> Oh, that's not related.
> 
> The main goal of this series is to route all invalidation commands
> to the VCMDQ HW. And this is where Grace users can see perf gains
> mentioned in the cover letter or commit log, from eliminating the
> VM Exits at those most frequently used commands.
> 
> Any non-invalidation commands will just reuse what we have with the
> standard SMMU nesting. And even if we did something to that FIXME,
> there is no significant perf gain as it's going down the trapping
> pathway, i.e. the VM Exits are always there.
> 
> > > That is for non-invalidation commands that VCMDQ doesn't support,
> > > so they still have to go in the standard nesting pathway.
> > > 
> > > Let's add a line:
> > > 	/* for non-invalidation commands use */
> > 
> > Umm.. I was talking about the cache_invalidate op? I think there's some
> > misunderstanding here? What am I missing?
> 
> That line is exactly for cache_invalidate. All the non-invalidation
> commands will be sent to he arm_vsmmu_cache_invalidate() by VMM, as
> it means.
> 
> Or perhaps calling them "non-accelerated commands" would be nicer.

Uhh okay, so there'll be a separate driver in the VM issuing invalidation
commands directly to the CMDQV thus we don't see any of it's part here?

AND for non-invalidation commands, we trap out and the VMM ends up
calling the `cache_invalidate` op of the viommu?

Is that understanding correct?

> 
> Thanks
> Nicolin

Thanks
Praan

