Return-Path: <linux-doc+bounces-3431-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D67FCA7E
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 00:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31E24B2156E
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 23:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F4D37D32;
	Tue, 28 Nov 2023 23:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CaqKA3Po"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02EF19A4
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 15:07:11 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-77dccb3e4baso1957585a.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 15:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701212831; x=1701817631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKGceIQmjzcsQC3Q07PKAqpPD6bs9odge0wDr5u7PKU=;
        b=CaqKA3PoGGnmvX5xVfYre9aCmnshD3tGmVgam2E9dghmSfuPp1SVHKmQMBNqTQC2OT
         UdR46T34ZF1NVVZcnot7ZTkR9YLlfsOclcH24Glj+MFqDyKjeBK1Ts+rFI3D72/srQth
         XUwZ/qTSrX8+v/CsslG/JxeAla8T5sIuGF18FSFmWsGsv0Ybkt561jwCZESesCCtWKPR
         W7wervRHTBY/d3XLyYGAwHlv1M6jciDFhSOC7osTihEqu9fy6uv98EqkgCvOoElfVPZl
         MUOl4BEV4gCbaJ8gBr7he7HcgwarNA/B8yx+X8fobvnA3J5ZpQGgVIbwM7C0hbFqeEeb
         od7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701212831; x=1701817631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKGceIQmjzcsQC3Q07PKAqpPD6bs9odge0wDr5u7PKU=;
        b=AtuZ1HXuoQMVMrMyGtkNg7+aycAO9hZ8W/Ofov6jYzFU/JsZz2d6j9gHeXKqfXsKru
         Q7sCZrw2htlq2bIZaL2l3h+eCDM2DvgJZPNkj87DbHpshoKn8BSfS+XqVBEKfiom8S08
         xUQFOxK81BsXQbwJ4aLHQRBUlm53HEIZd4aQrZTrcAPsKbCOqteb9ctfbXgO6iwkdwG0
         LOZOpZ+ZIUfjP+080Ebo/YK6O9MNKdWmb7ibS9W4fX672eoZGnLHoiYz+4+mA9JOBN4F
         EH7bXRj8a31m6E6XPZ1QejCKwjvDU3dtWWBw9Dw85XQ2l6nNdoTMyqTVmjoH4x8bnmsn
         S/kg==
X-Gm-Message-State: AOJu0YwZ/DxaB0Cl0cAC9FOBPkFTrCp1QRBmlXONylIVH6UY8NB+nzsv
	GdfQXwT15uaizJ1Vs1WcqL48Ah6A35Jp02R248znvg==
X-Google-Smtp-Source: AGHT+IHAHLSOITMZygZZbwHqs8Pcv2cxmXIEpgUbJ5bxgMm59HnXI3xdTgQIpiDfVoUOALVinCHvTAH42dtkODtq5L8=
X-Received: by 2002:a05:622a:241:b0:423:8287:dc68 with SMTP id
 c1-20020a05622a024100b004238287dc68mr17998278qtx.52.1701212830897; Tue, 28
 Nov 2023 15:07:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-7-pasha.tatashin@soleen.com> <d99e0d4a-94a9-482b-b5b5-833cba518b86@arm.com>
 <CA+CK2bDswtrqiOMt3+0LBb0+7nJY9aBpzZdsmrWRzy9WxBqKEg@mail.gmail.com> <79c397ee-b71b-470e-9184-401b4b96a0d2@arm.com>
In-Reply-To: <79c397ee-b71b-470e-9184-401b4b96a0d2@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 28 Nov 2023 18:06:34 -0500
Message-ID: <CA+CK2bDyKP6RT1ZWLKXBcRrfSuONo9LPicskc9+ek=FX_KhwYg@mail.gmail.com>
Subject: Re: [PATCH 06/16] iommu/dma: use page allocation function provided by iommu-pages.h
To: Robin Murphy <robin.murphy@arm.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com, 
	jernej.skrabec@gmail.com, jgg@ziepe.ca, jonathanh@nvidia.com, joro@8bytes.org, 
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
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

On Tue, Nov 28, 2023 at 5:59=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2023-11-28 10:50 pm, Pasha Tatashin wrote:
> > On Tue, Nov 28, 2023 at 5:34=E2=80=AFPM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>
> >> On 2023-11-28 8:49 pm, Pasha Tatashin wrote:
> >>> Convert iommu/dma-iommu.c to use the new page allocation functions
> >>> provided in iommu-pages.h.
> >>
> >> These have nothing to do with IOMMU pagetables, they are DMA buffers a=
nd
> >> they belong to whoever called the corresponding dma_alloc_* function.
> >
> > Hi Robin,
> >
> > This is true, however, we want to account and observe the pages
> > allocated by IOMMU subsystem for DMA buffers, as they are essentially
> > unmovable locked pages. Should we separate IOMMU memory from KVM
> > memory all together and add another field to /proc/meminfo, something
> > like "iommu -> iommu pagetable and dma memory", or do we want to
> > export DMA memory separately from IOMMU page tables?
>
> These are not allocated by "the IOMMU subsystem", they are allocated by
> the DMA API. Even if you want to claim that a driver pinning memory via
> iommu_dma_ops is somehow different from the same driver pinning the same
> amount of memory via dma-direct when iommu.passthrough=3D1, it's still
> nonsense because you're failing to account the pages which iommu_dma_ops
> gets from CMA, dma_common_alloc_pages(), dynamic SWIOTLB, the various
> pools, and so on.
>
> Thanks,
> Robin.
>
> > Since, I included DMA memory, I specifically removed mentioning of
> > IOMMU page tables in the most of places, and only report it as IOMMU
> > memory. However, since it is still bundled together with SecPageTables
> > it can be confusing.
> >
> > Pasha

