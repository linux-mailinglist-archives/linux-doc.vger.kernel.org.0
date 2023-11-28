Return-Path: <linux-doc+bounces-3420-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDFA7FC800
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 22:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7805C283593
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 21:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A65E44C82;
	Tue, 28 Nov 2023 21:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xMdoy6v8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386BDD63
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 13:34:36 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so821667866b.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 13:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701207274; x=1701812074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NXFzGfhAzOfJO06Gf5RsXFoYKrXmtsSvTLzk7MbcCk=;
        b=xMdoy6v8aONvzbxVZVbvsNHKhhEcVO5ng7K2kXcJRvCiRiwgTT+F/dPw1hDwAA6ZJD
         n4Wo+FXvn5yepI6+S3O8JR0X5quxazx074nCIA6eRtLJS9w4Od9Wyrq9uvdUwFtCB97X
         yD56oIcoZQ7UXlZfq6VfJcsTujL/PFoI/xfjXpoKz+7CI1bgMiKCj+KRFvUp9Ut6OFCI
         kBeE/mjpvW/hhnpm21zuGWcy5uG5Adq2eW2yFUV5qTPjMQbkW9xCYYL7J+laRBUbbFL/
         n+EbzsH7rpns82J1RJAJ0QS1mU/DOAeesKiZ114pRYCHXkI/dxIKuZdmp7Oob4X8oqhM
         Pz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207274; x=1701812074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NXFzGfhAzOfJO06Gf5RsXFoYKrXmtsSvTLzk7MbcCk=;
        b=AS/porc+7bNM1Oh1Z//PNfR9n4CQZt3nj1lF2Ypk6/1zrjobPXFSMEmXh1H8FMozdB
         KPQKZLVyPT/STmRXX89H7BkwOcPu9AXplVX67wQExvgq5ah6zS8gMD2NrYmDmmMaPClQ
         hiUbrh/4D0t1zcmbmEJ0VSiNiP9Mx3e7LBlT2t6DJQWHtmtBpEB3KsaIqvn48Ky9gu0p
         xNX1SiXgzZxpVU2vX1/SKJ0adzuwR58h8SjfOAUHu+VNXMmXD+bTCH6182RcbYsXP3Jx
         c+a/1ouGaOPCFUOW8ol/8IOyYSqi4pH+hDwHC61rqvJSqkgiWadUYSv3RmmOhKvLlntS
         i06Q==
X-Gm-Message-State: AOJu0Yyfq0OshBUg5TqSPUuUsCGZMhJsuq35206oeYYVxPWAMQsnnst8
	uC6z/A+1Uufs3OdJYMLFG0Wvebg0CMs0bJXO7zbKLg==
X-Google-Smtp-Source: AGHT+IFrrdaJl+8CDzGqIseL+lJ7M7KDt9GszVwJUOFBD/DHsSLfgFwP8+NKKfkfsTtyJyGUtnD8OJJylXlFpNkSb5g=
X-Received: by 2002:a17:906:b248:b0:a04:cc0e:ff3b with SMTP id
 ce8-20020a170906b24800b00a04cc0eff3bmr12465188ejb.27.1701207274446; Tue, 28
 Nov 2023 13:34:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
In-Reply-To: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 28 Nov 2023 13:33:55 -0800
Message-ID: <CAJD7tkb1FqTqwONrp2nphBDkEamQtPCOFm0208H3tp0Gq2OLMQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] IOMMU memory observability
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, virtualization@lists.linux.dev, 
	wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 12:49=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> From: Pasha Tatashin <tatashin@google.com>
>
> IOMMU subsystem may contain state that is in gigabytes. Majority of that
> state is iommu page tables. Yet, there is currently, no way to observe
> how much memory is actually used by the iommu subsystem.
>
> This patch series solves this problem by adding both observability to
> all pages that are allocated by IOMMU, and also accountability, so
> admins can limit the amount if via cgroups.
>
> The system-wide observability is using /proc/meminfo:
> SecPageTables:    438176 kB
>
> Contains IOMMU and KVM memory.
>
> Per-node observability:
> /sys/devices/system/node/nodeN/meminfo
> Node N SecPageTables:    422204 kB
>
> Contains IOMMU and KVM memory memory in the given NUMA node.
>
> Per-node IOMMU only observability:
> /sys/devices/system/node/nodeN/vmstat
> nr_iommu_pages 105555
>
> Contains number of pages IOMMU allocated in the given node.

Does it make sense to have a KVM-only entry there as well?

In that case, if SecPageTables in /proc/meminfo is found to be
suspiciously high, it should be easy to tell which component is
contributing most usage through vmstat. I understand that users can do
the subtraction, but we wouldn't want userspace depending on that, in
case a third class of "secondary" page tables emerges that we want to
add to SecPageTables. The in-kernel implementation can do the
subtraction for now if it makes sense though.

>
> Accountability: using sec_pagetables cgroup-v2 memory.stat entry.
>
> With the change, iova_stress[1] stops as limit is reached:
>
> # ./iova_stress
> iova space:     0T      free memory:   497G
> iova space:     1T      free memory:   495G
> iova space:     2T      free memory:   493G
> iova space:     3T      free memory:   491G
>
> stops as limit is reached.
>
> This series encorporates suggestions that came from the discussion
> at LPC [2].
>
> [1] https://github.com/soleen/iova_stress
> [2] https://lpc.events/event/17/contributions/1466
>
> Pasha Tatashin (16):
>   iommu/vt-d: add wrapper functions for page allocations
>   iommu/amd: use page allocation function provided by iommu-pages.h
>   iommu/io-pgtable-arm: use page allocation function provided by
>     iommu-pages.h
>   iommu/io-pgtable-dart: use page allocation function provided by
>     iommu-pages.h
>   iommu/io-pgtable-arm-v7s: use page allocation function provided by
>     iommu-pages.h
>   iommu/dma: use page allocation function provided by iommu-pages.h
>   iommu/exynos: use page allocation function provided by iommu-pages.h
>   iommu/fsl: use page allocation function provided by iommu-pages.h
>   iommu/iommufd: use page allocation function provided by iommu-pages.h
>   iommu/rockchip: use page allocation function provided by iommu-pages.h
>   iommu/sun50i: use page allocation function provided by iommu-pages.h
>   iommu/tegra-smmu: use page allocation function provided by
>     iommu-pages.h
>   iommu: observability of the IOMMU allocations
>   iommu: account IOMMU allocated memory
>   vhost-vdpa: account iommu allocations
>   vfio: account iommu allocations
>
>  Documentation/admin-guide/cgroup-v2.rst |   2 +-
>  Documentation/filesystems/proc.rst      |   4 +-
>  drivers/iommu/amd/amd_iommu.h           |   8 -
>  drivers/iommu/amd/init.c                |  91 +++++-----
>  drivers/iommu/amd/io_pgtable.c          |  13 +-
>  drivers/iommu/amd/io_pgtable_v2.c       |  20 +-
>  drivers/iommu/amd/iommu.c               |  13 +-
>  drivers/iommu/dma-iommu.c               |   8 +-
>  drivers/iommu/exynos-iommu.c            |  14 +-
>  drivers/iommu/fsl_pamu.c                |   5 +-
>  drivers/iommu/intel/dmar.c              |  10 +-
>  drivers/iommu/intel/iommu.c             |  47 ++---
>  drivers/iommu/intel/iommu.h             |   2 -
>  drivers/iommu/intel/irq_remapping.c     |  10 +-
>  drivers/iommu/intel/pasid.c             |  12 +-
>  drivers/iommu/intel/svm.c               |   7 +-
>  drivers/iommu/io-pgtable-arm-v7s.c      |   9 +-
>  drivers/iommu/io-pgtable-arm.c          |   7 +-
>  drivers/iommu/io-pgtable-dart.c         |  37 ++--
>  drivers/iommu/iommu-pages.h             | 231 ++++++++++++++++++++++++
>  drivers/iommu/iommufd/iova_bitmap.c     |   6 +-
>  drivers/iommu/rockchip-iommu.c          |  14 +-
>  drivers/iommu/sun50i-iommu.c            |   7 +-
>  drivers/iommu/tegra-smmu.c              |  18 +-
>  drivers/vfio/vfio_iommu_type1.c         |   8 +-
>  drivers/vhost/vdpa.c                    |   3 +-
>  include/linux/mmzone.h                  |   5 +-
>  mm/vmstat.c                             |   3 +
>  28 files changed, 415 insertions(+), 199 deletions(-)
>  create mode 100644 drivers/iommu/iommu-pages.h
>
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
>

