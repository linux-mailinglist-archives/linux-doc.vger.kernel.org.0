Return-Path: <linux-doc+bounces-39281-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6ECA42F8E
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 22:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07D873B0ECE
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 21:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7781E7C0A;
	Mon, 24 Feb 2025 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQPrFYK5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1B1DE3D9
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740434051; cv=none; b=rUxBRDEuuvfNBCKDr3xWlhPLOjh6fN4upiTP2a0sB3whA9pn7o/dULAb4sCMXLFDjs6ELwyG31Z+NZ2CVNNx3d8ou93Ybnx3Cl1aA2j0kxaGdbraEtxTGKN6EyE6k2Xf5h+gR7ncQKmac/0P8/6n5RemxRJRW4j0hQobipNQbAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740434051; c=relaxed/simple;
	bh=lOfd6dlmeiqEPHy61wcCsI34PRZuT2J/fiEGMBXUCZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGGl+Px9atKYYpdAHQK+k+iGPemj902bvbhYCSjJEHI3qI4vaRWQyKJB7//p7ki94+8mfllYTii860QJK5jBjPCtg+5aIBkQ1TJbnuHSxGESY1NfkYPTGi7Hxcnb3MjyV7sjOE9bS1C60xNGAIUH2tzL8drriUhH0F97EWHIBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQPrFYK5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-221ac1f849fso14205ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 13:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740434049; x=1741038849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcg5x+HnDt6i287wHJ6fnl/QzabNNejalgvIUO3dans=;
        b=bQPrFYK5Cp1y/z40G36LCWEfA1uE+FYfM+adT2pnTLlyvscp/6Fik10O/fKw7MxiFj
         1ScLRE0S+x7WrQNskifkmgGFMuHcW8wBe4Ja6oFIxUSi8Sw9pDLGcwGimkx+rm+Ws0rW
         CeLF7KxH7Y3EKittxRVAsUQ5pD+Bssh57iRIc963cLOBUokIySsaA05e07UvVBcczjqr
         O9/UlpcfIT4y8hgl7S4WxjF7f89Fn9CFwE67kcJGYYxYc/N2j+8b2CkcC+boMEus64e8
         OqPUJyiHleppuf/Lu6c/4Fkwv1bxt1iQRLZsd1YiQHDEo2AEAjviXAgfBMCCZpFRcmBw
         D6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740434049; x=1741038849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcg5x+HnDt6i287wHJ6fnl/QzabNNejalgvIUO3dans=;
        b=bHlEP3xMgs61i7wqVxjtm+Z0WPQ3xauu6trBF9elnIp2roDJI6j0mctlDvsG0X476S
         125YYUj5zfsGmYivGosPkbRaQddIfjmrkCXPZu1tJvash9S4x+3DXVJeoR8bgJYlVChQ
         folFedQ6g+4atOkiMgk1g7i6jJsWiO9vQfYJ/HhuhkEypNMR+g2bpeRgiGnNNHUqKlpN
         OydR1/76Nj6J/GfIIqYvq+kC7PC5UgK0mlbuQvsPw4Y9hQjJOwm+g6RXAncWHwaegqsL
         Eugd5fMySRF9ZaG8SDduFivt7e9hjdr1yFO9TbnhAtT9J5MyT0j2vslxmLxVJp/9NGRp
         0NzA==
X-Forwarded-Encrypted: i=1; AJvYcCXrl9bQch4lvK4TpVGqjsZ8viJeFv8xxotqDETcXsVpRB47plChnLqhSKZivLJ9uMwn+IDdb5gEx+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5OX79z9cuv9LtmRZ2tLpqTpEwYhEtdIhSf2hUEHYiet2yNrB
	/UzO6SMJ7SEzIvjIr9Kf8mUAhuUSaRdfP/KYOOVP5pZ/7cI7dr4lKNE3yoFftQ==
X-Gm-Gg: ASbGncvzob5lOcNVDV+WfnwKtarHhmIZgEvAJiYaNw114XcRRVbIijcWGj3eckDlTF0
	pvPl/8aY/P/UsUFVNmklIc7Nxr4V52cdVCCwdNeEF+4eLoS22Eh5xQv2gY7mllI7sx0ygZ4xv2f
	ajra0HeudEZ52i1xvvt68XX+FuasveFbDz3KNmgQSr1yX0kXYnN6x6NuwCvr12U9mbTee5ZaAOj
	23SJvNF7WboZC/gyY38A8IAramfuZLgevNxJTYSOhmdUHyljhf2qApD6G6DIgwRipY+Ez7Dlhm+
	upk0x3Q0dX2MfZa7ij5Sbzu7jOVhi5lo4DcOdgMXygsVyLAe1mIqGOKmKC6y8dM=
X-Google-Smtp-Source: AGHT+IEpKhaMyBCkt6aQomwMTBim64fWChp3DGISBq2p87Hyiqlav2xt82oY5FJwGrR4tW3dc9pk3Q==
X-Received: by 2002:a17:903:22ce:b0:216:21cb:2e14 with SMTP id d9443c01a7336-22307a989ecmr1049425ad.21.1740434049047;
        Mon, 24 Feb 2025 13:54:09 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6fa230sm131119b3a.70.2025.02.24.13.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:54:08 -0800 (PST)
Date: Mon, 24 Feb 2025 21:53:58 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z7zqdrQn7Q8yXfcn@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
 <Z7zYLBLZGKim-5UL@google.com>
 <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7zlH74/orq9HF7Q@Asurada-Nvidia>

On Mon, Feb 24, 2025 at 01:31:11PM -0800, Nicolin Chen wrote:
> On Mon, Feb 24, 2025 at 08:35:56PM +0000, Pranjal Shrivastava wrote:
> > oN sAt, Feb 22, 2025 at 07:54:09AM -0800, Nicolin Chen wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > index 5aa2e7af58b4..364d8469a480 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> > > @@ -85,6 +85,59 @@ static void arm_smmu_make_nested_domain_ste(
> > >  	}
> > >  }
> > >  
> > > +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > > +				    struct iommu_domain *domain)
> > > +{
> > > +	struct arm_smmu_nested_domain *nested_domain;
> > > +	struct arm_smmu_vmaster *vmaster;
> > > +	unsigned long vsid;
> > > +	int ret;
> > > +
> > > +	iommu_group_mutex_assert(state->master->dev);
> > > +
> > > +	if (domain->type != IOMMU_DOMAIN_NESTED)
> > > +		return 0;
> > > +	nested_domain = to_smmu_nested_domain(domain);
> > > +
> > > +	/* Skip invalid vSTE */
> > > +	if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> > > +		return 0;
> > > +
> > > +	ret = iommufd_viommu_get_vdev_id(&nested_domain->vsmmu->core,
> > > +					 state->master->dev, &vsid);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	vmaster = kzalloc(sizeof(*vmaster), GFP_KERNEL);
> > > +	if (!vmaster)
> > > +		return -ENOMEM;
> > > +	vmaster->vsmmu = nested_domain->vsmmu;
> > > +	vmaster->vsid = vsid;
> > > +	state->vmaster = vmaster;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
> > > +{
> > > +	struct arm_smmu_master *master = state->master;
> > > +
> > > +	mutex_lock(&master->smmu->streams_mutex);
> > > +	if (state->vmaster != master->vmaster) {
> > > +		kfree(master->vmaster);
> > > +		master->vmaster = state->vmaster;
> > > +	}
> > 
> > Does this condition suggest that we might end up calling
> > `arm_smmu_attach_prepare_vmaster()` multiple times before __actually__
> > commiting to a vmaster?
> 
> No. prepare() and commit() are 1:1. How is it interpreted to have
> "multiple times"?

Ohh alright. I was just confused about why do we need to check:
`if (state->vmaster != master->vmaster)` ?

> 
> > > +	mutex_unlock(&master->smmu->streams_mutex);
> > > +}
> > > +
> > > +void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
> > > +{
> > > +	mutex_lock(&master->smmu->streams_mutex);
> > > +	kfree(master->vmaster);
> > > +	master->vmaster = NULL;
> > > +	mutex_unlock(&master->smmu->streams_mutex);
> > > +}
> > > +
> > >  static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
> > >  				      struct device *dev)
> > >  {
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > index 358072b4e293..9e50bcee69d1 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > @@ -2803,6 +2803,7 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
> > >  	struct arm_smmu_domain *smmu_domain =
> > >  		to_smmu_domain_devices(new_domain);
> > >  	unsigned long flags;
> > > +	int ret;
> > >  
> > >  	/*
> > >  	 * arm_smmu_share_asid() must not see two domains pointing to the same
> > > @@ -2832,9 +2833,15 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
> > >  	}
> > >  
> > >  	if (smmu_domain) {
> > > +		ret = arm_smmu_attach_prepare_vmaster(state, new_domain);
> > 
> > IMO, this adds a little confusion for folks not using iommufd.
> > 
> > I guess it'd be cleaner if we invoke this below within the:
> > `if (new_domain->type == IOMMU_DOMAIN_NESTED)` condition instead of
> > simply returning from the function if the new_domain->type isn't NESTED.
> 
> But the arm_smmu_attach_commit_vmaster() still has to be
> unconditional as !NESTED domain should clean the vamster away..
> 

Ack. Right.

Thanks,
Praan

