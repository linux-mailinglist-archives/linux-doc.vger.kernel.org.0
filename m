Return-Path: <linux-doc+bounces-29974-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890C9BD567
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 19:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D186282F1C
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 18:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551BE1F5823;
	Tue,  5 Nov 2024 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MwMI3f1F"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E781EBFF3
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832668; cv=none; b=f+tz/etY6vjMYE4bUUKPVhycJnIx7moJxprAX3HtypAzEXaF7lUsDaCfhZDbzyytw1z3ukabWaAKq/BUg03KkS4OMz1AXQ2WXsLMCv8IxksTtBZNIFu/MV/i3LA7E6LufaOEKNsTIJbLZdfrJHGw2+zIT4vJVwdqf/s5A00c3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832668; c=relaxed/simple;
	bh=nJnTbD5cGZ0OfD00jTtdrajsLazl3DFTJAxArG9Ps+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6t1l5ijlKjtc6vcb4ycg5sAwTNsf+JAbI2nk626x6RUfcTTiAOdPmLyWjYIJKoVJSvVAj5/OdIc8o5JntMEZPYt4IKuaBYULgjkwVrr4bbmWemPIc65ObPDrRo2+4ltwyx+6leW8E2Ninnipwemn9y1A872eUwRZm5PgyDd5ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MwMI3f1F; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b15d7b7a32so459377285a.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 10:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1730832663; x=1731437463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C194RVyLAfjN0SwVJhWOGUoO0421PCIPswUt8quSHT8=;
        b=MwMI3f1FiJtKbSb+104JZqGid1wfIf3uJt8Wjuw4Mn8iu/DsebWaYWZdRPs8idwCnR
         G+I7AF7bhCUUSUBNQw+QPCmepNj+NeS+8V7uRjlg5iaVIA9CPV//gHtzykp6RFpWjSB3
         bEjGvNxbf2LnXaftz75p065/1sD/GAPsEOMMNpMZ5UjmD4y8a40GfLBTM1Qq2oU8QdZ3
         J8GIR4YQWuWl6Dtsf0Dy0aRq1Eila20Aj2m0v4hcEgmRZY3sAHdnp8RqfyrRoDjZYtzT
         ObzFuPZUFv04pc7JsyasDhZ57mi4ATensZ+Vjda89fVA64rlDYTQ6JD+3xUJlCux182V
         pzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832663; x=1731437463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C194RVyLAfjN0SwVJhWOGUoO0421PCIPswUt8quSHT8=;
        b=osuLWgTRhvmtmtYAjz8Zh2cyVuqnRvUDwvarBCnpNOY4gfEnSudbaMhdwART9XCxzy
         JJbXpGgGxPRJsc/JCt2j1ma8uaY7hEG4U7TFD5NZHVa8KtsjRI0ThdqaOl9fiMpaeB7I
         ehcpbv1AWO2z3zsUNWkplbauRZ95ExifrN/0lOtrUF5XfBCqBfmyEX3LASt/LWE8gptk
         yEFUD/ppx5OIRV3oG6oEnWyxbzRwXFhCdQXmmlY47naafQO4wfU+Qv1a6viwhcOW6B90
         fZRHHMncqQ3fGJrAKojes+J8KRFwqQ9tI8O9F3VUy4+UihwAUfXUqum+K2k5NjZuIkfg
         kNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvrpJEpXvHwH8oVo7+2TG88vY0530pHUER02P27UxQBjS8H4hRdQ0QJCi31UPqw+b5/4m3bRchmFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0qsI3zuWt7VAF4gUrthGg8xPXPEYGVQauixUxPKPKP2av+/Pc
	n44dzlgzDsivHVQEHhKsUjcw8aML/AhaE2Ze+d6K4japK8cMgAxY3w3kGTC/9zM=
X-Google-Smtp-Source: AGHT+IGWpBzbxGzBgv9Gx5tLlQAZYsSh7jgfOX8tW5mq4qsvhcUPgq93VZEIR90XeqIlAFYpEQmgSA==
X-Received: by 2002:a05:620a:1908:b0:7b1:481f:b89c with SMTP id af79cd13be357-7b193f0a206mr4853751585a.35.1730832662826;
        Tue, 05 Nov 2024 10:51:02 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a70971sm549852785a.77.2024.11.05.10.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:51:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1t8Odp-000000023WW-0CZJ;
	Tue, 05 Nov 2024 14:51:01 -0400
Date: Tue, 5 Nov 2024 14:51:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>,
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
	kvm@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 00/17] Provide a new two step DMA mapping API
Message-ID: <20241105185101.GH35848@ziepe.ca>
References: <cover.1730298502.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730298502.git.leon@kernel.org>

On Wed, Oct 30, 2024 at 05:12:46PM +0200, Leon Romanovsky wrote:

>  Documentation/core-api/dma-api.rst   |  70 ++++
>  drivers/infiniband/core/umem_odp.c   | 250 +++++----------
>  drivers/infiniband/hw/mlx5/mlx5_ib.h |  12 +-
>  drivers/infiniband/hw/mlx5/odp.c     |  65 ++--
>  drivers/infiniband/hw/mlx5/umr.c     |  12 +-
>  drivers/iommu/dma-iommu.c            | 459 +++++++++++++++++++++++----
>  drivers/iommu/iommu.c                |  65 ++--
>  drivers/pci/p2pdma.c                 |  38 +--
>  drivers/vfio/pci/mlx5/cmd.c          | 373 +++++++++++-----------
>  drivers/vfio/pci/mlx5/cmd.h          |  35 +-
>  drivers/vfio/pci/mlx5/main.c         |  87 +++--
>  include/linux/dma-map-ops.h          |  54 ----
>  include/linux/dma-mapping.h          |  85 +++++
>  include/linux/hmm-dma.h              |  32 ++
>  include/linux/hmm.h                  |  16 +
>  include/linux/iommu.h                |   4 +
>  include/linux/pci-p2pdma.h           |  84 +++++
>  include/rdma/ib_umem_odp.h           |  25 +-
>  kernel/dma/direct.c                  |  44 +--
>  kernel/dma/mapping.c                 |  20 ++
>  mm/hmm.c                             | 231 +++++++++++++-

This is touching alot of subsystems, at least two are mine :)

Who is in the hot seat to merge this? Are we expecting it this merge
window?

I've read through past versions and am happy with the general
concept. Would like to read it again in details.

Thanks,
Jason

