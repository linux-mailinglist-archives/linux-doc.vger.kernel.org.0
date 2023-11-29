Return-Path: <linux-doc+bounces-3545-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E577FE21C
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 22:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E73F028225C
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 21:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8341097A;
	Wed, 29 Nov 2023 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="OExQ1cLL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F7410C2
	for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 13:36:49 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4219f89ee21so1442661cf.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 13:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701293809; x=1701898609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKdw1vp5oLSx4gO3m1/rl4eR0j44oWuSmpeWEj8OyEg=;
        b=OExQ1cLLwtG7+490nris8noYiYxSqXI4ie1YhzAm/VeuczmafNkSzFv5qw9D0HcErf
         ffPPn9sEPfg40Js8rnPoqm6IcpzTOTgPB/jswA+tpg/pJ5KrztQfCo7fsvLJA1skHJ4T
         Yt8NEPNif1go0SwFQYpEqCyd0fEz7D6QZBqhq+gAHOnWwnB4owKJhGROi7yWrwSiBZGS
         j7TrWhwDpwdt3UTK+XtFGEJ5vM2sYeDU7Qz9OlwbkKdaZ28zC4A0R/JYxs5DgNxTa26i
         RemFAI0Y90he8C4fmshjw22bDbsjE+K5y8NllC55xEQhe2wyuDKLxWvJpO9FKnkikNo2
         5P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293809; x=1701898609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKdw1vp5oLSx4gO3m1/rl4eR0j44oWuSmpeWEj8OyEg=;
        b=fMio+vd2RLlnqAe982StUB5D25o+eN7XjmvwWZS30272z7ejvBzt9HE5DEqqBe6Nnw
         vDDZC8kogZCXgGYBtvvHe0U1YylA553+D2Zlr+tUXYiYZxiZDgHuv3PChd9wD6PTlUZw
         8dllDoTnoLtnYZvpzWjEVBiAHBIMunUnlyZp9lHp5ZOGXZMiTqjfUVcOJFmWwiF51nSd
         Si3BYsW2seJk4Mktd7MWgpgqkhPz1XopfFGpClprQgRxxBoVi4JmyaQs+iv6L0XgjSvB
         Ta/sG3Gt16wc1pFT7QhxV39+h5maII7yyxOtI2Qyhs+HO5gNTo2yphxAazO7qTDlkuMq
         Peug==
X-Gm-Message-State: AOJu0YwGWd9POxXRoW8soS3cIsFTCMrv7OQQTYsd5+LHy5tXon45HkfQ
	+4lgWkzQI+NQ+YkmhXNJp3wa9bED7B/sKUStX9CrKw==
X-Google-Smtp-Source: AGHT+IH1s42XbpuMqfnRK8jqZvUrCxoQ7Or7Gzckcwkn35i1gPeN3cfJsGoJeMBusJpvpuIBcFrnBzJ4nZCRPQFGmZI=
X-Received: by 2002:ac8:5c0e:0:b0:423:6e2a:1c36 with SMTP id
 i14-20020ac85c0e000000b004236e2a1c36mr29092766qti.35.1701293808838; Wed, 29
 Nov 2023 13:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-17-pasha.tatashin@soleen.com> <20231128235357.GF1312390@ziepe.ca>
In-Reply-To: <20231128235357.GF1312390@ziepe.ca>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 29 Nov 2023 16:36:12 -0500
Message-ID: <CA+CK2bBK=4qbHJG_6B=HSMOXe1vmg7D9TZmsJFhsqVmQau503g@mail.gmail.com>
Subject: Re: [PATCH 16/16] vfio: account iommu allocations
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com, 
	jernej.skrabec@gmail.com, jonathanh@nvidia.com, joro@8bytes.org, 
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, mst@redhat.com, m.szyprowski@samsung.com, 
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org, 
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, virtualization@lists.linux.dev, 
	wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 6:53=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Nov 28, 2023 at 08:49:38PM +0000, Pasha Tatashin wrote:
> > iommu allocations should be accounted in order to allow admins to
> > monitor and limit the amount of iommu memory.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
>
> You should send the seperately and directly to Alex.

Thanks, I will.

>
> Jason

