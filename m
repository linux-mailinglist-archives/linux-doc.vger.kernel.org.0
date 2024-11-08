Return-Path: <linux-doc+bounces-30329-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E109C204D
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 16:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6880B1C229AC
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB98206E95;
	Fri,  8 Nov 2024 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bJY1kfzU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE84206E80
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079541; cv=none; b=Z5K+X45zT9HATezDE4Q7JIqUZ59cQO3bAWdHcZdoae1+/q3ZbtQ/w8lPGXm9ZPjFmPoXopAe6RPBUicXHyr/tZfp8Bjz/R4sE2wfDjSfowzDjBUxdkEXGYh8jc/QkJ72GguIU4aX4HQjWgs52Q2JCHtG65IHL336U4jqemElisU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079541; c=relaxed/simple;
	bh=2feMVd+moXqEWqG7qu0YrJc0Jboh9RPoNC48SzdPbeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAAXTnS73/fctH1a9sYVX1bOZskptu6qDlUsPbpHxj0+qO66Z22iBfb7BzWnDMmPGYAQIixAF4qQ0bwYqGAC/aao1Jd4RBbyl2HhOPLWxUJXIBhoWYuLOT6xgeYd7CQ631LMnU5xe3ewPXkNRRv9bEMcS0RvTgpOAlsC6sgC5qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bJY1kfzU; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b155cca097so189713885a.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1731079538; x=1731684338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nbYXv3yCM9yQzCKa6ScUYgOxj5i+yJ5Ve18Z6DNxO2Y=;
        b=bJY1kfzUcarj5CrCE4Tih3DZkR2MPvb0tUrbaV67brM/zWFSSH4XDEINs+3lIpIn9G
         XOUMKNr+TXsHV43VcaUCVNsg5hkY7HaAjzisjsOFkPzkqf2wjChDM10bgh71BOaOrrfv
         Wf6a323Mkj68kqXlq68GFa2rqc+uNuFUgjNtHz9TLtkg/mwEQunzUDbDYQ4Y0v4vyRfK
         eYeQFHi1h45hnN0WM3KDpaY3MeBuVFFiuikvP0SCR8XP2sOmgPpOSFobXNSzQZP+uGtV
         N+NEaqh2K3YlIz3AKWeGCR7MPSMrKQ7XBJrkprKqy/9YgJoMrfrlr2YcXspzBqjS4ET4
         QXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731079538; x=1731684338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbYXv3yCM9yQzCKa6ScUYgOxj5i+yJ5Ve18Z6DNxO2Y=;
        b=XouRxOdYE9P3qWnRBtNItSJjd6HJF026QY6al4MLrqUu0Rtdfr6PmWNDRXblWXft4D
         1/ejzOuA8tXEIOjr5Etm1LgJPMZ15MLYtcZEj48o2MBgpTYVlZ8bkqQiYDx3+GmIwLO2
         JfAWGmyk9c/M0bCOd0ta1Y6JJ/3F4DF0Q+VJAOyFJbSyid1ehmQpLbEtSvZrac+Qd1yQ
         qYlDtC/k1/+IIhPogF9vy8A7NVcOrD7z3mn92nRqQWs7C8FqiM8Hob/U9n6R739h33Db
         WjGPNihGvhFYToE4ty4eA9jdc7qFK8tJqPwbW6R+zv0bX4VU5VM2s6qStyM8gN5Vr96n
         MjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpEAsvmwDiT/RnIFp889Wk3JNf8QdikNJtkB5ioNEbeINV0bjdJMxAOzM54kRwJ9SNqCRShGtjKV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr6mENJ30BJJX0uG/cj+ACIrGtFtma0vFsMhvZpRt8UXsxvbVL
	XiC10TQi55FWBdxdXAbqfzNYNicL46CAns1ioRrb8OjG8AOkjSCov7ZsgLRXmL4=
X-Google-Smtp-Source: AGHT+IH4eRArrUDZm2rUOb5KR+8EAvAFtyYH0Fr2uIHFPXrPpQnSMiiNxtBbq8LowDrIix/biyMB3w==
X-Received: by 2002:a05:620a:4049:b0:7b1:4cc0:5e32 with SMTP id af79cd13be357-7b3328aeb7dmr490547585a.9.1731079538361;
        Fri, 08 Nov 2024 07:25:38 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac51659sm170158385a.42.2024.11.08.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 07:25:37 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1t9Qrh-00000002Zza-1RVx;
	Fri, 08 Nov 2024 11:25:37 -0400
Date: Fri, 8 Nov 2024 11:25:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>, Leon Romanovsky <leon@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-mm@kvack.org, matthew.brost@intel.com,
	Thomas.Hellstrom@linux.intel.com, brian.welty@intel.com,
	himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
	niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH v1 00/17] Provide a new two step DMA mapping API
Message-ID: <20241108152537.GN35848@ziepe.ca>
References: <cover.1730298502.git.leon@kernel.org>
 <3567312e-5942-4037-93dc-587f25f0778c@arm.com>
 <20241104095831.GA28751@lst.de>
 <20241105195357.GI35848@ziepe.ca>
 <20241107083256.GA9071@lst.de>
 <20241107132808.GK35848@ziepe.ca>
 <20241107135025.GA14996@lst.de>
 <20241108150226.GM35848@ziepe.ca>
 <20241108150500.GA10102@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108150500.GA10102@lst.de>

On Fri, Nov 08, 2024 at 04:05:00PM +0100, Christoph Hellwig wrote:
> On Fri, Nov 08, 2024 at 11:02:26AM -0400, Jason Gunthorpe wrote:
> > It is fully OK? Can't dma_map_page() trigger swiotlb? It must not do
> > that for P2P. How does it know the difference if it just gets a phys?
> 
> dma_direct_map_page checks for p2p pages in the swiotlb bounce
> path already in the current kernel, and dma_map_sg relies on exactly
> that check to prevent bouncing for p2p.

I'm asking how it will work if you change the struct page argument to
physical, because today dma_direct_map_page() has:

		if (is_pci_p2pdma_page(page))
			return DMA_MAPPING_ERROR;

Which is exactly the sorts of things I'm looking at when when I say to
get rid of struct page.

What I'm thinking about is replacing code like the above with something like:

		if (p2p_provider)
			return DMA_MAPPING_ERROR;

And the caller is the one that would have done is_pci_p2pdma_page()
and either passes p2p_provider=NULL or page->pgmap->p2p_provider.

Anyhow, I hope Leon will attempt this once this is settled and it will
make more sense in patches. I'm just brainstorming how I've been
thinking of it.

Another option would be some 'is_pci_p2pdma_page_phys(phys)', but I
think that is going to be worse performance than managing a
p2p_provider pointer in the mapping call chain explicitly.

Jason

