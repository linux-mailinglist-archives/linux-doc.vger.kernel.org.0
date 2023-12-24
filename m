Return-Path: <linux-doc+bounces-5886-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1467281DC82
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 22:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A31C1F2154C
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 21:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1E1DF63;
	Sun, 24 Dec 2023 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZPGJXL0R"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0FEAFD
	for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d42ed4cdc7so135245ad.0
        for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 13:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703453645; x=1704058445; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=19k96QXnbMagvx60gm9Q3bYlRQY8OEapphIAobKuCbg=;
        b=ZPGJXL0R71PwVR3MCcIyXT04X3X4fpdBs57SiGJEEbP9avwknKt4TU6lcVI6V/1x4o
         d3ela5bGeMXPrH+jhCkNCw/BfXXx2PTBR6bywVFoFOmQUv3DRjyrHX53UBXVGlFM6LMn
         ul2QNkzO0VGXadfV4VrLpYab4+QqH8UEEBPZ/ljLdymjxTXV3mhAvhvkkAuq5HH8AKDS
         Td+qbfo7DAh9f2L7t5e+QCo4i6l+ClpLRNJT+0w1qFMMRogO8C07v3ZfYMXDMolRJyhr
         EyThTuvBBGo7inY1tTcHmRagHOaUeDNEOhzfwNjYrR9kodRNG9TrrSFNvT7oasCdPS16
         B3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703453645; x=1704058445;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19k96QXnbMagvx60gm9Q3bYlRQY8OEapphIAobKuCbg=;
        b=n9EVVtS7qQzEO+rmVVQKZEp0N9nga3nR4hrNV4SKvCUzT7aZYMEPieGJmEI2IKHGHX
         i01CcfHDCDIH87mTpskZMq7oReYA0DuWLFDmgNmbWMHdV26V2JpiEEF3+xNjLHCv+rxi
         Z5u7HLkX/2tiV3MzBgJr8TP5gsAtMxGPKrTkFbfUrQiVeIq93nOn8/JhfSqz7+ZcQx8i
         qY0B4y9b7mv2WoJgGkCsPvFxjZ05bOK1QumvxtWt4lD1ZhhIjYskq/nw/XF9ISpXQBaT
         udQrD+6lvWPU7o/TOmvwoicLJI3KcwAkAF4O6hPAz/PZBsF5eD7rnk4wECmvLc+JftLE
         KJUA==
X-Gm-Message-State: AOJu0YwnYhoWiU1boNCp8uCCB4e2R4mukNQivxmrdl/Y8tAC9805HeaR
	a0nL08/Hd9wmic2Whptz99Of0wjDcTnS
X-Google-Smtp-Source: AGHT+IGegIDK1SiERqRo6gqK2h3wZ3T0rNk/SXpnhPjqekqQBeNJ+EefZk9MMaDh4fgCcjIJBnmJeg==
X-Received: by 2002:a17:903:1248:b0:1d4:cae:9a03 with SMTP id u8-20020a170903124800b001d40cae9a03mr251305plh.23.1703453645061;
        Sun, 24 Dec 2023 13:34:05 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id n7-20020a056a000d4700b006d9bbc8d785sm400894pfv.141.2023.12.24.13.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:34:04 -0800 (PST)
Date: Sun, 24 Dec 2023 13:34:03 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
    asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
    cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
    dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH v2 02/10] iommu/amd: use page allocation function provided
 by iommu-pages.h
In-Reply-To: <20231130201504.2322355-3-pasha.tatashin@soleen.com>
Message-ID: <56409bdf-3f9d-e521-814f-3c8e854db3bf@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/amd/* files to use the new page allocation functions
> provided in iommu-pages.h.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>

Although any feedback from Suravee and Joerg would be very useful on the 
overall approach and whether this looks good to them.

