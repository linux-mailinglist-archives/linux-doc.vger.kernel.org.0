Return-Path: <linux-doc+bounces-44087-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E160A99767
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 20:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959894686D7
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 18:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E0D28DEEF;
	Wed, 23 Apr 2025 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oME2bGbG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A6427A12D
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 18:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431344; cv=none; b=BztUsU2+8f4HHNAubNXqbXM81lrAN02NohUOXVxWaKtEhPJLf6Rhen0zzjHwVmf1kwbZrg5XlDCFZ37nJH1HE2YFonC/rcBrZnI0a1VBlQmCwdOLM7Y18D8sxnKKW9AV4PTT1qDzc4FrM0mEsL0wYptVCXxKKynao98M0QkNy3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431344; c=relaxed/simple;
	bh=jMGBnlKKS3wriE0M2t3GS1b7w0yLhTPXvhMeTWbbHrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZt/TCVVTFzB5qjQux1MHwpvKFgiBKJ7f4LddmoE5mX2FjZtIdeU0t6Oo2S6VQ3Wf01EyVzVcuuM2qLCapBW1uPYrsssJcurSGqoeSp2raEIFV5qEn33gGRWH7SzglXhqlFIe5HTc8tAH9BBhYO//81hLvw6mU+HaTw+qhMCXYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oME2bGbG; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so1998276d6.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 11:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745431340; x=1746036140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v/H5CAwHQKAGhhgyjSbvaHcVayhHkcFdusJoJuYFxH8=;
        b=oME2bGbGIz+n8qPmjxlLjGtl64CvjZEPLK7vic6PtKju9KvsD8hbQoAkwLgEIUXBXg
         iqMA9uiI8nIhmBox8Z7ZtsEVF9rde1sOPnx8+Ic/YkmuJ9mTOLkrk722E5IWEIRNAYGR
         CVnGLdLxvEKtC2PTbivi1fVVAU/xnbJH1e3h1aYaD6xXqyyQUWxXFa7Xe/FlDmqtEMBh
         M2vt6LSy6VXOVecd3pdAWZPlsCrclj/UmngB8o9ubhNBU5XVxQpZ9ogcCm6n3z5DL56T
         4rghcIF1xc2841w2V+rvve+AZ1efnzAOOk4mZhF4CMwBHIR6quQkjZVOdYpgnKUYZnoy
         QpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431340; x=1746036140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/H5CAwHQKAGhhgyjSbvaHcVayhHkcFdusJoJuYFxH8=;
        b=Hv1DkZZV2trE7aZReMngtCIM8WU4o9cS19cuHb2P6D0aB2fiqOQrZbx2WQ1vrtkE4G
         etj9GkIn1qLfJcJcukQrNcTDFAHLlMklnpeGeINsmwUBqvw7misw7QvkAcmjaq4bI7Hb
         LNlgkcYNuHqX2Q7DOtsYbKhSIjGUWhy/RA9oktR7MrnVKKcHD/vYEVcyNma5qKL17JoQ
         JFMPGMTX8o0f2NbQfbNanytw8qmCd7TJFupTV7sRAoNhA/qGQqx+Z4gAm71OaFOR1KNe
         7NyR4ZQZ43sEd5+Os/UwtSpqnP3PV5PwPNn16bQ3ebKt/HIdjdxFozMAGvYBk/ZW9jCq
         smhg==
X-Forwarded-Encrypted: i=1; AJvYcCUlIIWPjVnXKQ8BoWttOkd9n4u7WTmoeNME157iQkrpfImOgSmHm7ycSLkirJIN84I1p+h2AZswgms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0o4AQl8Y01wKrwIdrwsE249HjnHnQvjnxrGPMD2iPUKVyrro
	AsRjU8bnv3KN1F903HCLody5udofT1Fvv469pOGWHNycZWiJd5GuRM2gCiF5LWM=
X-Gm-Gg: ASbGncuycpx7LUjRvLEGIXWtYPhx9jK12W7drsONNS4CgzQoP1I4EllGkLAqu5WDMAZ
	NMNg9tZH+nIEysXjH/kcwCSgvl0LBrgqat+isRiD+Id3UQDNjnRNYAPtQ5URFOxNONo8j7sRaHx
	e++g2dDDJ9oty33ePdGgcL2M3XNLrOqXDfLTewTzJMzrxCjyYWVsXJ13attVo2sdrD5wUR8lG36
	T573N9kePEkqGPRlonJ/NpfaSyCJGlK31GreuUYgjjRG3xPG/X4WrfefBx/fuYug7rKlknnzh+s
	qsFnNh9odiSZfB6jBQtDNlzbpulOVsxaefavYs3feslVcX8hByDI3MbBel4sljruyJktqEAPAcT
	8dbr6tBdKSABJSykqN7k=
X-Google-Smtp-Source: AGHT+IHxXzsMEe6MN5UQygppndiI4ddaFnTKWUy8FtozhFzNSVoZsB8f3DMDl3MfRyMHEIrbMun+Mw==
X-Received: by 2002:a05:6214:19c8:b0:6ee:ba58:e099 with SMTP id 6a1803df08f44-6f2c454e522mr330593466d6.15.1745431340219;
        Wed, 23 Apr 2025 11:02:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c3ba3fsm73300796d6.125.2025.04.23.11.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:02:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7eQN-00000007LrM-0sGN;
	Wed, 23 Apr 2025 15:02:19 -0300
Date: Wed, 23 Apr 2025 15:02:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, Jake Edge <jake@lwn.net>,
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
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v9 16/24] vfio/mlx5: Rewrite create mkey flow to allow
 better code reuse
Message-ID: <20250423180219.GR1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <eefe5ad450fd434dff981963ec3c61df7b3734e1.1745394536.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eefe5ad450fd434dff981963ec3c61df7b3734e1.1745394536.git.leon@kernel.org>

On Wed, Apr 23, 2025 at 11:13:07AM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Change the creation of mkey to be performed in multiple steps:
> data allocation, DMA setup and actual call to HW to create that mkey.
> 
> In this new flow, the whole input to MKEY command is saved to eliminate
> the need to keep array of pointers for DMA addresses for receive list
> and in the future patches for send list too.
> 
> In addition to memory size reduce and elimination of unnecessary data
> movements to set MKEY input, the code is prepared for future reuse.
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/mlx5/cmd.c | 157 ++++++++++++++++++++----------------
>  drivers/vfio/pci/mlx5/cmd.h |   4 +-
>  2 files changed, 91 insertions(+), 70 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

