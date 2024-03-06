Return-Path: <linux-doc+bounces-11563-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0437873A1F
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 16:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6949287EE3
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 15:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF58134CEF;
	Wed,  6 Mar 2024 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="obAC/gG0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFA134724
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709737523; cv=none; b=nL9IykvTddxJcim63ebVmiUKjgu/eBhysfHDd0si50HWDG3uotj8peHzZri/gJnPU3B42T2NxyThFIeX4KMffkugNLWXaLkLe6FPrYmEJFWD3RbKfe7F3EG3iVqP+uNz520wS81odcHM1t4y8XoTIrtZ+XJAkI6NCRN6kvOB7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709737523; c=relaxed/simple;
	bh=FAE7tKzetJC0DRifXVvbyePo3HyTO0kdYHz5YfVi9U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoCw6FPKeYhkGlqJ+WipHx2L6v70zHEMlA5ukdt0+PKkoqnevLY6OXlRUe+9ziK/VhX3RvuUdEQvHAm2iTdU1bWb7PtgciIlKX9Zy2z2yxLA1JVDWdp1d43a6l5QSubmgIVBUNrDr0bVjdpJ2OOarzpQADWNxTtI986Q5aMiVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=obAC/gG0; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42f13eebabbso2019191cf.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Mar 2024 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1709737521; x=1710342321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3q6XaWzdNlm5rZVTCa+MalaN5VSyURFchooXo3LCyRw=;
        b=obAC/gG0vpO9hZAA/ZlPaT6q/O+SveoM5lvKr5eUJnO/2Kk+cACVDiNLrhy6GsrVL6
         CbsuQfWDk0qw89/m83TPnEqiyuYGrAdXXk2aAIA4T+HfNonzyqD2/e3sWv5KHZEionZ/
         kWcWW/BfCS++nlDBaIJZC/8ZYA6Jd5fgtPe8E6zW71FTEwoeBl0kNtGDFhr0jQTKhLRs
         wiKx6rMrkXMIaf74ws6hR3WOqjkb+lpbOAK15DVCmI+Q9qiFOxOTRVKifCAjuxt8ubtr
         85VzH9/VkRkMMJJkJqcwxa2DzMw/rjhXxgLHyBi1/OaDk8nYgj3UjdyOhxK/nBRpNWcx
         qRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709737521; x=1710342321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3q6XaWzdNlm5rZVTCa+MalaN5VSyURFchooXo3LCyRw=;
        b=IBXLgriXjVzq14slMYdAmyCypE9JhlK6PnZG7wJvtHH5MLaFbgTKU+4SUwn5agnj2E
         dMRSuRyEQkIzbw2Z24gKWB9rFB+E4E3gkwYUNlSeE470i6rLbrG+rak/rCxbg8PgggMl
         VKgKgVECsFBu+szt5/nWmhVoDAm7Cq3owf7u2uBFwhW5vSwShGSpzVLBkNYSinBhCvSm
         JXCFvb5OOh7pw1ad37WEe0ueSVJzVVa4FKQkfFPCQX8fDVidP/u+L6Lt5fmAf3kfGVyQ
         958HrP/+9ImKprAE7x5JwXxc6RghjyFCTVcL7pY9uxuKfvEMMRsE9MOLnwsbkDflDv7g
         bbMg==
X-Forwarded-Encrypted: i=1; AJvYcCVyEcc6Fc1L1tsvuxkjf1RoutrnoCU6/vylPTJpB+5pkppMNidAQ05ta3QD7OHM8eWNynfGz6VHEkgabtj3ZLyZCa0cOETz7amM
X-Gm-Message-State: AOJu0Yxw6qBX0XQVfPPR43OUmnGrQXr/lLeZ425QtMSjrr+I0kDVatML
	F7zTarKkwxH1aboJgRoyZFulllf7h9yDfsR1oOIKGg3v9bpUbk2KspU0mBAXVgI=
X-Google-Smtp-Source: AGHT+IF3DD5YVqRayIYcxbWGOreOFw/mqikGG0c1CCT98Poz3twNOMiPHe1g+1Vg/YON1gYeWp1F9Q==
X-Received: by 2002:a05:622a:1743:b0:42e:bcc4:2959 with SMTP id l3-20020a05622a174300b0042ebcc42959mr5571780qtk.4.1709737520530;
        Wed, 06 Mar 2024 07:05:20 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id f5-20020a05622a1a0500b0042f01390d5csm1686793qtb.30.2024.03.06.07.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:05:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rhspa-001WNB-Tx;
	Wed, 06 Mar 2024 11:05:18 -0400
Date: Wed, 6 Mar 2024 11:05:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, Yishai Hadas <yishaih@nvidia.com>,
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
	"jack@suse.com" <jack@suse.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Zhu Yanjun <zyjzyj2000@gmail.com>
Subject: Re: [RFC RESEND 16/16] nvme-pci: use blk_rq_dma_map() for NVMe SGL
Message-ID: <20240306150518.GL9225@ziepe.ca>
References: <cover.1709635535.git.leon@kernel.org>
 <016fc02cbfa9be3c156a6f74df38def1e09c08f1.1709635535.git.leon@kernel.org>
 <Zec_nAQn1Ft_ZTHH@kbusch-mbp.dhcp.thefacebook.com>
 <20240306143321.GA19711@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306143321.GA19711@lst.de>

On Wed, Mar 06, 2024 at 03:33:21PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 05, 2024 at 08:51:56AM -0700, Keith Busch wrote:
> > On Tue, Mar 05, 2024 at 01:18:47PM +0200, Leon Romanovsky wrote:
> > > @@ -236,7 +236,9 @@ struct nvme_iod {
> > >  	unsigned int dma_len;	/* length of single DMA segment mapping */
> > >  	dma_addr_t first_dma;
> > >  	dma_addr_t meta_dma;
> > > -	struct sg_table sgt;
> > > +	struct dma_iova_attrs iova;
> > > +	dma_addr_t dma_link_address[128];
> > > +	u16 nr_dma_link_address;
> > >  	union nvme_descriptor list[NVME_MAX_NR_ALLOCATIONS];
> > >  };
> > 
> > That's quite a lot of space to add to the iod. We preallocate one for
> > every request, and there could be millions of them. 
> 
> Yes.  And this whole proposal also seems clearly confused (not just
> because of the gazillion reposts) but because it mixes up the case
> where we can coalesce CPU regions into a single dma_addr_t range
> (iommu and maybe in the future swiotlb) and one where we need a

I had the broad expectation that the DMA API user would already be
providing a place to store the dma_addr_t as it has to feed that into
the HW. That memory should simply last up until we do dma unmap and
the cases that need dma_addr_t during unmap can go get it from there.

If that is how things are organized, is there another reason to lean
further into single-range case optimization?

We can't do much on the map side as single range doesn't imply
contiguous range, P2P and alignment create discontinuities in the
dma_addr_t that still have to be delt with.

Jason

