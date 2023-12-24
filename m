Return-Path: <linux-doc+bounces-5893-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476381DCC2
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 22:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6676281C6C
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 21:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5300107A8;
	Sun, 24 Dec 2023 21:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHuZuNob"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C510785
	for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36000a26f8aso26485ab.0
        for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 13:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703454245; x=1704059045; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WCfzVP8j8LySAgZKEW6wfy9xuAGJ9Ouy6ckQlduRZH0=;
        b=WHuZuNob7aWwqf3aayRyqDEiE/Lj8gLDg0E/WOnUXmxVsUjclcT5tySdliEIQGjZc8
         p74KJAk81HTURg9idZbxBGpBX+yHgql40Z8dTldC+5ynIqnpuRTvd593OKZxXiosjR67
         MZI9WpWuAqSqtmsM1NaOXOLK3XuTT0TDAkbYI7bNiUOUtMl3NRN/3ByQ0zS9BLMbMLfu
         Kj6gMnyJywCO2NE0DM6YCOCq27cIVPYivDZjz+Uq5liVxuiqpOVcgF62Fo4jS3gYEtYO
         RKY7VtkObB1D026YpzA82H2Ak0gZCWfCCzr8yJxlQC9ql6/dF8FP4AKqfWYwwsMia6F8
         qt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703454245; x=1704059045;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCfzVP8j8LySAgZKEW6wfy9xuAGJ9Ouy6ckQlduRZH0=;
        b=B+YV7suJaQX5uzetSF7AEbLAIJLmLiHTUTprtPOby4DuE45OjPK7OzXYXTz0UFRqnt
         qtj7HwCJ9LrfhQHQ9W7vrQ9+t9OKm6pGALF7gSeqYWqb3N3owuPe/mzsM9NWnvMNlBWO
         ipvyx8Tp6oUNpEEoOU9GYZ78XNB3Re57Gb37FQDqNw8diczKz8b46dEQbod8mbZT+t/a
         qfcAsvZtJ5hSfLc+RMOWpTxsOfH5dcMCGA44JyrLs/5DxZaNyNdVnubCXb3mYGktAsg+
         WokTsVTqVEHQyql/K21WmqPWEswyS/5NLjhG4AGpU27enHJCuVd8FUC7ZU0ESWbA35h7
         v6Gg==
X-Gm-Message-State: AOJu0YwifgsISXsuEsp9GlESbeeMsuHExvHGtCsSQjgj/ijOhvt5AR4l
	fp4Pe8A1PdLUgC+nSv4R5jlpLmKAZHAJ
X-Google-Smtp-Source: AGHT+IHfKZUme1UezcYWHyTRRlZSLSoThXV3/HhZuf4mQ55yUvSKSE3jgK8NmLNN9oMH6ocZqVCboQ==
X-Received: by 2002:a05:6e02:1786:b0:35f:e24a:36f7 with SMTP id y6-20020a056e02178600b0035fe24a36f7mr373370ilu.3.1703454245075;
        Sun, 24 Dec 2023 13:44:05 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id n9-20020a056a000d4900b006d9a0c6ce2csm2974325pfv.54.2023.12.24.13.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:44:04 -0800 (PST)
Date: Sun, 24 Dec 2023 13:44:03 -0800 (PST)
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
Subject: Re: [PATCH v2 10/10] iommu: account IOMMU allocated memory
In-Reply-To: <CA+CK2bD0Wz8mzB_BGKEYKCHRJKKVwr0CPK7OOC0tD_Sxi5Rp5g@mail.gmail.com>
Message-ID: <b5b98667-06aa-8330-10f7-8dba3ac0566a@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-11-pasha.tatashin@soleen.com> <c0d23d3e-39e6-57af-fd38-eb1b885d7da4@google.com> <CA+CK2bD0Wz8mzB_BGKEYKCHRJKKVwr0CPK7OOC0tD_Sxi5Rp5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Dec 2023, Pasha Tatashin wrote:

> > > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> > > index 3f85254f3cef..e004e05a7cde 100644
> > > --- a/Documentation/admin-guide/cgroup-v2.rst
> > > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > > @@ -1418,7 +1418,7 @@ PAGE_SIZE multiple when read back.
> > >         sec_pagetables
> > >               Amount of memory allocated for secondary page tables,
> > >               this currently includes KVM mmu allocations on x86
> > > -             and arm64.
> > > +             and arm64 and IOMMU page tables.
> >
> > Hmm, if existing users are parsing this field and alerting when it exceeds
> > an expected value (a cloud provider, let's say), is it safe to add in a
> > whole new set of page tables?
> >
> > I understand the documentation allows for it, but I think potential impact
> > on userspace would be more interesting.
> 
> Hi David,
> 
> This is something that was discussed at LPC'23. I also was proposing a
> separate counter for iommu page tables, but it was noted that we
> specifically have sec_pagetables called this way to include all non
> regular CPU page tables, and we should therefore account for them
> together.
> 
> Please also see this discussion from the previous version of this patch series:
> https://lore.kernel.org/all/CAJD7tkb1FqTqwONrp2nphBDkEamQtPCOFm0208H3tp0Gq2OLMQ@mail.gmail.com/
> 

Gotcha, I think that makes sense.  When sec_pagetables was introduced, I 
can understand the need to account for non-primary pagetables separately 
because of the long-standing behavior.  In that sense, sec_pagetables 
becomes a dumping ground for "all other page tables" which IOMMU would 
naturally include.

So this looks good to me.

Acked-by: David Rientjes <rientjes@google.com>

