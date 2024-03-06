Return-Path: <linux-doc+bounces-11574-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E74E873DA8
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 18:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F24E2804DD
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 17:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91FE13BAE9;
	Wed,  6 Mar 2024 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MzdXd8Lc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F613A89D
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747100; cv=none; b=KHwayHlSOxQZy6T2q255Num54yvenPFOkfFQArcsf86G9XPRHXEm0JODi+IJJeLKWNxnbsXeiX53c/bE2Q6qRqZ2Q3OWjcoKcjkD9Bhvod91QT8F2j9YAIQVZn1ykvdmUQ3FpFx6TgJKFUMS4wohM2zOTbrKZod0OznJwbj3m9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747100; c=relaxed/simple;
	bh=KgEC8zWw55+Acg7UImx7iG13lc0bEoNvPiGpELvl9iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbKTi7H4MjniBsT8srEb5AyJhCClfGX8v2wE5VeGo7MzBhgm1yscjF4lOnnJ24CTTAFhazuck/nLK9n+Tp0lPzsC01gYU7KYUSm8z5KpZkoosiu4m+V1xEtdmQuWpw/SyP9hGKM2n4sW0Bn7dBt3E2q9OCR9OKPVusL5Zl+H7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MzdXd8Lc; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-68f51c5f9baso39905506d6.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2024 09:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1709747098; x=1710351898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FpyRbZ0RdQZQRjC0Rn2UI7ybSBSrjRoc3WCER4LofKQ=;
        b=MzdXd8LcU01zr9pHMG00oFxvyTq5As1ywDlryOvXF5Skub+P2KTULXRPxMWl2G9ttK
         Amy8Ix4bPZpZKYozlIIU0pyBS65CgCMN2La54O1Balib3RVF+HMBWdz5Ss6L1QEGw93J
         Zef5kI9faBP5Lo53x38XQBXB/oV41Cbgq0l/JqoL1095Y+CnLzGPSvtSKAYsmDbDPpWR
         KNNxkzTfb4Rfic5BNNI8R8PQ06+v0dDNx/lSdIr0pEkz8dYF/8eA+ixANT3aJEAW5V0F
         RSsvriiGzNJIkKyxyyw76H3NxHYV6Xoe2gVaAUbvlGjro5t9NqURsx6RqRNbF5MAm+Mc
         nkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709747098; x=1710351898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpyRbZ0RdQZQRjC0Rn2UI7ybSBSrjRoc3WCER4LofKQ=;
        b=wydFertd2c62WBv/Pr8Mt0JbxdkLA/lJo7F4qlyvl1Os8SoNvi3BVHNP6ojXVqJbo6
         XIZH+8IpuonDxc1+Mue0tWg7wh4n48aqtRBoZG0ZkPHZ2XDCgpZJM5fvKOrn5uLNggP4
         0ROekFLNiLBvw+09pe/mmQLReTfT1oy1zkvoaUs7IH1aiBR0oEXw7cMGopmycZmavwSR
         +hD5F3pu4DoOQCvsP12MC/6Gf3M1giX50FLQXbVn6Ql5InvRZvnKYAFntWAclA/s0Gl/
         5XqfzUF0AVCCl3r852YV3CMo5XvNOSE0WP7s+f3C+Oy9sG+IFfnk9abWCwL+Mr3AbeDQ
         Lntw==
X-Forwarded-Encrypted: i=1; AJvYcCU1710lsqNvOSBtODqZwUJFcnQBaxYraRUtTEDXzfuOOuS3n0VqNQPRplOqiXF77s78h9dVCJW8cBXfkj/qtokzYaLBBVNx40ia
X-Gm-Message-State: AOJu0Yz1FzTYrdjKntQiuRj1ffEa3L1xZC8noivc9ekPZ1v/gnkOcXx9
	nsd+PlcHhGKeJhq3eC/w5AUyzeKSjdbkcSRPq0kZyBuoFrqdvU9m2qD+DQB/Q28=
X-Google-Smtp-Source: AGHT+IFPBkf7L5QuuJTJ8Xv6bEQYd424i8376Z5+WOarEDc8ZpU3tKfW4UZ0uYoM0R8xl79r0aNmBg==
X-Received: by 2002:a05:6214:11b1:b0:690:64e6:33d5 with SMTP id u17-20020a05621411b100b0069064e633d5mr5599360qvv.54.1709747097870;
        Wed, 06 Mar 2024 09:44:57 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id ol17-20020a0562143d1100b006904e2c9e36sm7228573qvb.116.2024.03.06.09.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 09:44:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rhvK4-001uSz-88;
	Wed, 06 Mar 2024 13:44:56 -0400
Date: Wed, 6 Mar 2024 13:44:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Leon Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
	kvm@vger.kernel.org, linux-mm@kvack.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Amir Goldstein <amir73il@gmail.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	Dan Williams <dan.j.williams@intel.com>,
	"jack@suse.com" <jack@suse.com>, Zhu Yanjun <zyjzyj2000@gmail.com>
Subject: Re: [RFC RESEND 00/16] Split IOMMU DMA mapping operation to two steps
Message-ID: <20240306174456.GO9225@ziepe.ca>
References: <cover.1709635535.git.leon@kernel.org>
 <47afacda-3023-4eb7-b227-5f725c3187c2@arm.com>
 <20240305122935.GB36868@unreal>
 <20240306144416.GB19711@lst.de>
 <20240306154328.GM9225@ziepe.ca>
 <20240306162022.GB28427@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306162022.GB28427@lst.de>

On Wed, Mar 06, 2024 at 05:20:22PM +0100, Christoph Hellwig wrote:
> On Wed, Mar 06, 2024 at 11:43:28AM -0400, Jason Gunthorpe wrote:
> > I don't think they are so fundamentally different, at least in our
> > past conversations I never came out with the idea we should burden the
> > driver with two different flows based on what kind of alignment the
> > transfer happens to have.
> 
> Then we talked past each other..

Well, we never talked to such detail

> > > So if we want to efficiently be able to handle these cases we need
> > > two APIs in the driver and a good framework to switch between them.
> > 
> > But, what does the non-page-aligned version look like? Doesn't it
> > still look basically like this?
> 
> I'd just rather have the non-aligned case for those who really need
> it be the loop over map single region that is needed for the direct
> mapping anyway.

There is a list of interesting cases this has to cover:

 1. Direct map. No dma_addr_t at unmap, multiple HW SGLs
 2. IOMMU aligned map, no P2P. Only IOVA range at unmap, single HW SGLs
 3. IOMMU aligned map, P2P. Only IOVA range at unmap, multiple HW SGLs
 4. swiotlb single range. Only IOVA range at unmap, single HW SGL
 5. swiotlb multi-range. All dma_addr_t's at unmap, multiple HW SGLs.
 6. Unaligned IOMMU. Only IOVA range at unmap, multiple HW SGLs

I think we agree that 1 and 2 should be optimized highly as they are
the common case. That mainly means no dma_addr_t storage in either

5 is the slowest and has the most overhead.

4 is basically the same as 2 from the driver's viewpoint

3 is quite similar to 1, but it has the IOVA range at unmap.

6 doesn't have to be optimal, from the driver perspective it can be
like 5

That is three basic driver flows 1/3, 2/4 and 5/6

So are you thinking something more like a driver flow of:

  .. extent IO and get # aligned pages and know if there is P2P ..
  dma_init_io(state, num_pages, p2p_flag)
  if (dma_io_single_range(state)) {
       // #2, #4
       for each io()
	    dma_link_aligned_pages(state, io range)
       hw_sgl = (state->iova, state->len)
  } else {
       // #1, #3, #5, #6
       hw_sgls = alloc_hw_sgls(num_ios)
       if (dma_io_needs_dma_addr_unmap(state))
	   dma_addr_storage = alloc_num_ios(); // #5 only
       for each io()
	    hw_sgl[i] = dma_map_single(state, io range)
	    if (dma_addr_storage)
	       dma_addr_storage[i] = hw_sgl[i]; // #5 only
  }

?

This is not quite what you said, we split the driver flow based on
needing 1 HW SGL vs need many HW SGL.

> > So are they really so different to want different APIs? That strikes
> > me as a big driver cost.
> 
> To not have to store a dma_address range per CPU range that doesn't
> actually get used at all.

Right, that is a nice optimization we should reach for.

Jason

