Return-Path: <linux-doc+bounces-44062-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E964CA995F0
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 19:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9635A5A2351
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 17:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DBE288C8D;
	Wed, 23 Apr 2025 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="UARDqsgx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5B22D4C0
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427624; cv=none; b=D2h7/Ja0JBZSPQDAah7Kp0iqbrAkg59sfJfY3xKVidUlTdFwdeJjAjlGo1logP3980++3EPDGJ9FYNmsz35PWFrOvo4z1U6jPUFkq5HXOaovrqB+bJkcPF1F8GhHm2CFgICFJA72aICI0ZzMs2u+5eoxebDdVJbQ1usylFL6SNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427624; c=relaxed/simple;
	bh=Oq+RUVKXoierg4o0zQGaueU+iLWLxzwb7ZA+t/XFi9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdDamWCZweHXydtbnwb6gv4yD37n9CiME2nHEziUuhYgFFp+69qz59d2e5sjCfK7Paud/kxXULrcBT4n0ObRigdreKNw7YP5YDlFV5ODOCjTiLHADeETYVMZXpefbyYD/ebOoADGNv1ADIUflbhKX3IhyLmQK0XR2IAxkpZJToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=UARDqsgx; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47664364628so1045851cf.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745427621; x=1746032421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wWxVg46eMCFdiWQ6X6K5wh7BwyllE/TFgcnWyILw7vo=;
        b=UARDqsgxOC+cJtWdyN+NC2FY/WCTVe7z3WFx7smCC0E32+wheWqdAVaqyZuMIN2aMg
         bYi30GQ5/MbJgUzSusKZHoKpetThYKOQb6prIavNr2Nm8nhyRI5OLVpd03M6nJutlPIQ
         8X8itz0LgQdwoScBesYqaixgUfPxwTIkwGLN1aIVBGVRnkq8PGzRrPN5ygxBtf6jtGJ5
         9oD9uONx64IyINlPGGwW6qOrIH8DeRKjy/bUyPoubWzTdYFhG1OSbmgg8Bgs/Rfee3Dt
         xUQTD9Igf9RC5VSQJ6fdAqzjen7lbn1D0IWGZSegnpLfXYufUFsFYPjfslA9NpLe2QAc
         jKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427621; x=1746032421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWxVg46eMCFdiWQ6X6K5wh7BwyllE/TFgcnWyILw7vo=;
        b=D92ELUh2a5YPfKcYWJKWCwrbl2bwDDTWbFv/PoSODbbZJFlVtv8rBOiQWS2K4Pgbt/
         WePSlxIuo7I05yiNG88OZqMkXFvLw6Ws9NnclNBpA6KannSz0i+xkVQaxn/63VyGyFTW
         ToS+fhftBBooU0Of/I7CoDzrJrmeg6CROofdh+oYgWYJpar8TsUDH6lADwGn1caZJlsP
         X8PX9TOJ//jGrd1vx7gipMOAjJixI7nE5tmfAprtR49jPGbF4ROmihBjmhoRrw4KSECt
         7qIqddGEmuOvpOp5li7ej2R3OXmRtc4qQmTUjb3tyBkhczXYB0AVpH2iF2e0iUsW5zCw
         03mw==
X-Forwarded-Encrypted: i=1; AJvYcCVVXzv8teIdePoqvfRxqVpwn8inzTTsJkc1rmR/WedKnFLfL35cAE7v/qYF4CzKrbZ6pVilBqoUvhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmQq+aV6JEkHqA7583fLlh7lqSRLYOJthOFxuSP/I5fmgL87kY
	YVlug0uHSqJ1J77/hzvt6odIRohZ/rwb+5bhOemfStWh4SwSYi8aadCwRTKI5gU=
X-Gm-Gg: ASbGncvVXWhc0G+uH8LbOge9H4Pi1krDcYCp8rCBpqzXubPhq2Em1tfF3k2uLbfBd46
	wnbYkEv4yhgDCA/fzyBsbhx/+LBKORMwudnjIeA6j7ZkjLtJFSE0GMcpD8zpWzFzhqYACoSx7Ts
	ZyCNTZUm1x8ilQmv7dnEsosU1Blu9SNb8kgyzZqsHqoB/ylp4e8yZKHetTG3IRFGzddE3khDtBI
	jLvIB73FHgbgLBzb5esRNPoNYV8idP87ps56TOkOwJXRwOd4PE8M8hFPaqfT9Cz4Mo4bpWk4Lp3
	So9HjgwU3Mlv6h1X9fTIg6EGem16hT9ARDEIQHvKZ+agyJriO9erlAvcVM8iJr9wai0gNCiRxWM
	qQEFCUTx4pLt3sZlxpPi1454HDhyJww==
X-Google-Smtp-Source: AGHT+IHksHmB8zXVAbJv0K8R7XmlcjQan86yStXGt3YpvcZVpCrvagDTNNdOsaaJ2R0ZGC6sR1O+4g==
X-Received: by 2002:a05:622a:118f:b0:47e:641:9665 with SMTP id d75a77b69052e-47e0641979dmr20773641cf.5.1745427621264;
        Wed, 23 Apr 2025 10:00:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcfd0sm72347416d6.82.2025.04.23.10.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:00:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7dSO-00000007LHo-0vIz;
	Wed, 23 Apr 2025 14:00:20 -0300
Date: Wed, 23 Apr 2025 14:00:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Leon Romanovsky <leon@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>, Jake Edge <jake@lwn.net>,
	Jonathan Corbet <corbet@lwn.net>, Zhu Yanjun <zyjzyj2000@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Nitesh Shetty <nj.shetty@samsung.com>
Subject: Re: [PATCH v9 23/24] nvme-pci: convert to blk_rq_dma_map
Message-ID: <20250423170020.GI1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <7c5c5267cba2c03f6650444d4879ba0d13004584.1745394536.git.leon@kernel.org>
 <20250423092437.GA1895@lst.de>
 <20250423100314.GH48485@unreal>
 <20250423154712.GA32009@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423154712.GA32009@lst.de>

On Wed, Apr 23, 2025 at 05:47:12PM +0200, Christoph Hellwig wrote:
> On Wed, Apr 23, 2025 at 01:03:14PM +0300, Leon Romanovsky wrote:
> > On Wed, Apr 23, 2025 at 11:24:37AM +0200, Christoph Hellwig wrote:
> > > I don't think the meta SGL handling is quite right yet, and the
> > > single segment data handling also regressed.  Totally untested
> > > patch below, I'll try to allocate some testing time later today.
> > 
> > Christoph,
> > 
> > Can we please progress with the DMA patches and leave NVMe for later?
> > NVMe is one the users for new DMA API, let's merge API first.
> 
> We'll need to merge the block/nvme patches through the block tree
> anyway to avoid merges from hell, so yes.

RDMA has been having conflicts on the ODP patches too, so yeah we need
a shared branch and this thing into each trees. I'd rely on Marek to
make the shared branch and I'll take the RDMA parts on top.

Thanks,
Jason

