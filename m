Return-Path: <linux-doc+bounces-12173-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCC87D635
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 22:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94C6A1C221E0
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 21:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F7854BEC;
	Fri, 15 Mar 2024 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dey5/bRV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE845490F
	for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538437; cv=none; b=N7zBU+g0J9a7NS9ylwTZN+P3zzQwFaq2sXlXAl7ne1H74f48tyL91ZTGLvbyHrOvMrvRgVuYHyVurRQkGaFFc/vDdaC4drGEgWpauXC012z4WAh9mK8/0qchBDGKL3944MqA3DgpuRg3fw5VTwzQEkyYMPEPZGgIf6u1O97OIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538437; c=relaxed/simple;
	bh=0F2XERw7B5j+mPxmlsSoCMnEowgGmNL23b1OGvmX7Uo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QrPaamPnNipQcjv5Kxp64NOPNbsZ3Lmfu2RObxP0I4DGZPgkY6Vb36jL9zCBCxMVM0/y3NHqmBAU5ytDC+UP7HvAU6g78CZUqERW2Vod1gdDN/DKoiQryCQH8lclKZlaCB/OvNSM3tlKORH361rwm6A9LFawAMPD7klD514Atdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dey5/bRV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dee917abd5so18985ad.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710538435; x=1711143235; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H0fR8S5zvFKWxYVHlf5dgazwtBnwp1HgnsQ4yUvybtw=;
        b=Dey5/bRV4Gt9RFOuXhLoHy0gqSqEKPQyewEx4Dn/W+kUVC4N7FAylOoiLziWkfBOgX
         kYMfocs2gCn70PeNsLH4nYPVCQh8uDpQKn9kqAWeonNAqUg8UhGrOCNA1afMERqyOj/w
         oBou0YmgtKXMcRRGSUhNoCCtGiDUKidqERxPrU6VwxM4jRFoz3vIijT0eRW9WrYlltB1
         OMHEpLUuTg/NmbCIi9UeaK2+QEhBJbWna9c9GOAJ7lTZfQClNCEqkotbJ9hHIl029c9V
         /3Z5i7mW84IiOssiVxstsqNfH77Z3HsA27NiOIHfGIHQpCanuXxeNMxmfRVJwTFca935
         XQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538435; x=1711143235;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0fR8S5zvFKWxYVHlf5dgazwtBnwp1HgnsQ4yUvybtw=;
        b=KOHThdDJTD3Q6wQJTkYZcc9a/u9jgoCtwj/z+Xa733CS0CUuXCRF2hR/K2m73MpLo4
         T4ihDiGqVamhWIUWtLgjWxPIpa+mDT7Crx+O9EzaitMMdsboREHO0SSobMpkSueLbmAs
         pX1Eru0qB/B9V+dEN0tgfkwHM0MD2o9wEmluB0909l2fGovWAOiOjxhupDstxPSJTziq
         8JEwEhYG8MsIusWBrcC9Mtjupq4epwZ2fR84bet9Wsm3Jo6+HPrYJHwYARpS5FDPhkvo
         kqBAD/eWhuz1d2jAoXB1M7PFxidiWyYZzlZ/8oaDiOn8nSMwmVELD7SVLVTgXI/DPhPU
         ERew==
X-Forwarded-Encrypted: i=1; AJvYcCXtgUpKzLG+UIl6+3yApbwPLuY3jKnuwC9XrLVsKK61NVWFyYVPpT8rcV0iSt2Vi2D090DPYOhViC65EYTsr+gBsqFR1KieB1wZ
X-Gm-Message-State: AOJu0Yxijcxd/xL1+92L0cP62SsReLJg3zSBxUkKVjiur1mIoqswhtex
	fuTW4dOHdyJZmhcxz22ZZ0uhDX28ObBSD8kK2y88k3aMEhazyZdvBIPFmcyIWA==
X-Google-Smtp-Source: AGHT+IGXgrCyapbX6lCjIYimjaGV/xGhnyUP0IGlJg+FRlRNpmX3AgagAydyQ+EpK396sF48foPkSw==
X-Received: by 2002:a17:902:cec9:b0:1dd:e26f:1363 with SMTP id d9-20020a170902cec900b001dde26f1363mr534470plg.15.1710538434920;
        Fri, 15 Mar 2024 14:33:54 -0700 (PDT)
Received: from [2620:0:1008:15:59e5:b9a4:a826:c419] ([2620:0:1008:15:59e5:b9a4:a826:c419])
        by smtp.gmail.com with ESMTPSA id hq16-20020a056a00681000b006e6c8ed17bdsm3829728pfb.100.2024.03.15.14.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:33:54 -0700 (PDT)
Date: Fri, 15 Mar 2024 14:33:53 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, joro@8bytes.org
cc: Andrew Morton <akpm@linux-foundation.org>, alim.akhtar@samsung.com, 
    alyssa@rosenzweig.io, asahi@lists.linux.dev, baolu.lu@linux.intel.com, 
    bhelgaas@google.com, cgroups@vger.kernel.org, corbet@lwn.net, 
    david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com, 
    bagasdotme@gmail.com, mkoutny@suse.com
Subject: Re: [PATCH v5 00/11] IOMMU memory observability
In-Reply-To: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
Message-ID: <00555af4-8786-b772-7897-aef1e912b368@google.com>
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Feb 2024, Pasha Tatashin wrote:

> Pasha Tatashin (11):
>   iommu/vt-d: add wrapper functions for page allocations
>   iommu/dma: use iommu_put_pages_list() to releae freelist
>   iommu/amd: use page allocation function provided by iommu-pages.h
>   iommu/io-pgtable-arm: use page allocation function provided by
>     iommu-pages.h
>   iommu/io-pgtable-dart: use page allocation function provided by
>     iommu-pages.h
>   iommu/exynos: use page allocation function provided by iommu-pages.h
>   iommu/rockchip: use page allocation function provided by iommu-pages.h
>   iommu/sun50i: use page allocation function provided by iommu-pages.h
>   iommu/tegra-smmu: use page allocation function provided by
>     iommu-pages.h
>   iommu: observability of the IOMMU allocations
>   iommu: account IOMMU allocated memory
> 
>  Documentation/admin-guide/cgroup-v2.rst |   2 +-
>  Documentation/filesystems/proc.rst      |   4 +-
>  drivers/iommu/amd/amd_iommu.h           |   8 -
>  drivers/iommu/amd/init.c                |  91 ++++++------
>  drivers/iommu/amd/io_pgtable.c          |  13 +-
>  drivers/iommu/amd/io_pgtable_v2.c       |  20 +--
>  drivers/iommu/amd/iommu.c               |  13 +-
>  drivers/iommu/dma-iommu.c               |   7 +-
>  drivers/iommu/exynos-iommu.c            |  14 +-
>  drivers/iommu/intel/dmar.c              |  16 +-
>  drivers/iommu/intel/iommu.c             |  47 ++----
>  drivers/iommu/intel/iommu.h             |   2 -
>  drivers/iommu/intel/irq_remapping.c     |  16 +-
>  drivers/iommu/intel/pasid.c             |  18 +--
>  drivers/iommu/intel/svm.c               |  11 +-
>  drivers/iommu/io-pgtable-arm.c          |  15 +-
>  drivers/iommu/io-pgtable-dart.c         |  37 ++---
>  drivers/iommu/iommu-pages.h             | 186 ++++++++++++++++++++++++
>  drivers/iommu/rockchip-iommu.c          |  14 +-
>  drivers/iommu/sun50i-iommu.c            |   7 +-
>  drivers/iommu/tegra-smmu.c              |  18 ++-
>  include/linux/mmzone.h                  |   5 +-
>  mm/vmstat.c                             |   3 +
>  23 files changed, 361 insertions(+), 206 deletions(-)
>  create mode 100644 drivers/iommu/iommu-pages.h
> 

Joerg, is this series anticipated to be queued up in the core branch of 
git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git so it gets into 
linux-next?

This observability seems particularly useful so that we can monitor and 
alert on any unexpected increases (unbounded memory growth from this 
subsystem has in the past caused us issues before the memory is otherwise 
not observable by host software).

Or are we still waiting on code reviews from some folks that we should 
ping?

Thanks!

