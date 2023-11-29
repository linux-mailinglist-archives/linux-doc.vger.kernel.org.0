Return-Path: <linux-doc+bounces-3543-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C097FE14C
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 21:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2DE282448
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 20:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BFE60EE1;
	Wed, 29 Nov 2023 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FdbZffxY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBA910C0
	for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 12:45:02 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bba815f30so336460e87.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701290700; x=1701895500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlZYiStM5KCC7J/v+177rjHqt9KWJCfJWFMkelab9t4=;
        b=FdbZffxY5wQE+/0cxXCbRI/zPDDidiVXjjUtYaRCjcBeQNV8h6tZEhOFNmoiYL7FiG
         h1K6pRO8QjrrRpKLtVPO4KusIRh7cFjdTbXZrtnRwsrN9zOW761HtsD0DnDQGZcBO4B4
         zZlRZaXN56UCW9RjgD3piveQC/RlmHoA707iaWD4ZKMsSGCKKX0wS590lk9hL1bOd4IZ
         7f3rTyKVruPGPNdmdliTvnn9TTnMX3gBAn3rgBg3AHi7tU6xptVxJXv22YHnauF+xp/J
         vi7OWlea2BYfXpETx4UFSoOwGVhEA35lLfaJJPqVDZIFT4A3eDZKoi2IYAMKrMsVwmSJ
         8bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701290700; x=1701895500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlZYiStM5KCC7J/v+177rjHqt9KWJCfJWFMkelab9t4=;
        b=XUGFObgBTAUbw09/PIpgqSlA+82siy5aMTHUitfhBb8MdPCQ6AzNBpd87cA+hl6jZj
         ar0973SMeUOtQwc/Ywdkd4p0oXiZa8d5SZ109D7Kqiz8HMfKstvGLAMCNoBjga5ql1GR
         hyWoO099W1GZXdtz+HzQAL/Q5DFgY7TGDWAOJWc60qw6ncPS74GMe9yubu93xUKDLfQQ
         5SPNck8TbjR3NVzhx1YCtRTNoi4bqk9hnmK2JuoNY0orj/PWFFQEcUWTEW0JEiJHPRfC
         hYw1fkdwP6OLqNlxdh6oB959drN29ceGZkpIgWGW77kvrLNiAvQqmcV46gOn+8OD9Sk6
         C4Zg==
X-Gm-Message-State: AOJu0YzlohhrLF/cbTgv8CcmX2oxzT5cPlgJNVbcUFLmACIvjz3b4Jej
	DysbaEEoeC1V3pi8cZHL++PlofuDE68QbqYIOQsfiQ==
X-Google-Smtp-Source: AGHT+IGMB2fUN71OTthlqnqBV10GCXDIRhuYgMFmlKYXWcCU4XgzYTup+BcRc5IJEjmMB4Fgw8Ibq0j5FX6Di+vVaiM=
X-Received: by 2002:ac2:4a6f:0:b0:50b:cb50:401 with SMTP id
 q15-20020ac24a6f000000b0050bcb500401mr153882lfp.34.1701290700342; Wed, 29 Nov
 2023 12:45:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-9-pasha.tatashin@soleen.com> <1c6156de-c6c7-43a7-8c34-8239abee3978@arm.com>
 <CA+CK2bCOtwZxTUS60PHOQ3szXdCzau7OpopgFEbbC6a9Frxafg@mail.gmail.com>
 <20231128235037.GC1312390@ziepe.ca> <52de3aca-41b1-471e-8f87-1a77de547510@arm.com>
 <CA+CK2bCcfS1Fo8RvTeGXj_ejPRX9--sh5Jz8nzhkZnut4juDmg@mail.gmail.com> <20231129200305.GI1312390@ziepe.ca>
In-Reply-To: <20231129200305.GI1312390@ziepe.ca>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 29 Nov 2023 15:44:21 -0500
Message-ID: <CA+CK2bA05Bh+H4qsP7ZM6ZcnBXu64frEfpCDYZuLOQ4UxJC4EA@mail.gmail.com>
Subject: Re: [PATCH 08/16] iommu/fsl: use page allocation function provided by iommu-pages.h
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, akpm@linux-foundation.org, 
	alex.williamson@redhat.com, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jasowang@redhat.com, jernej.skrabec@gmail.com, 
	jonathanh@nvidia.com, joro@8bytes.org, kevin.tian@intel.com, 
	krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, mst@redhat.com, m.szyprowski@samsung.com, 
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org, 
	samuel@sholland.org, suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:03=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Wed, Nov 29, 2023 at 02:45:03PM -0500, Pasha Tatashin wrote:
>
> > > same kind of big systems where IOMMU pagetables would be of any conce=
rn.
> > > I believe some of the some of the "serious" NICs can easily run up
> > > hundreds of megabytes if not gigabytes worth of queues, SKB pools, et=
c.
> > > - would you propose accounting those too?
> >
> > Yes. Any kind of kernel memory that is proportional to the workload
> > should be accountable. Someone is using those resources compared to
> > the idling system, and that someone should be charged.
>
> There is a difference between charged and accounted
>
> You should be running around adding GFP_KERNEL_ACCOUNT, yes. I already
> did a bunch of that work. Split that out from this series and send it
> to the right maintainers.

I will do that.

>
> Adding a counter for allocations and showing in procfs is a very
> different question. IMHO that should not be done in micro, the
> threshold to add a new counter should be high.

I agree, /proc/meminfo, should not include everything, however overall
network consumption that includes memory allocated by network driver
would be useful to have, may be it should be exported by device
drivers and added to the protocol memory. We already have network
protocol memory consumption in procfs:

# awk '{printf "%-10s %s\n", $1, $4}' /proc/net/protocols | grep  -v '\-1'
protocol   memory
UDPv6      22673
TCPv6      16961

> There is definately room for a generic debugging feature to break down
> GFP_KERNEL_ACCOUNT by owernship somehow. Maybe it can already be done
> with BPF. IDK

