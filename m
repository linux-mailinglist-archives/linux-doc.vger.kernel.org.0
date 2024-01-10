Return-Path: <linux-doc+bounces-6200-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5D824635
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jan 2024 17:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F28281785
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jan 2024 16:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F29C24B4F;
	Thu,  4 Jan 2024 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="fdn/14QO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C4525562
	for <linux-doc@vger.kernel.org>; Thu,  4 Jan 2024 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-427f21ced6aso3410551cf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jan 2024 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1704385819; x=1704990619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aj4IIq0tzuh1/OdFywt45Ed5fBVp3SK/t71RwP6JXSw=;
        b=fdn/14QOew7x0hZlqE8RvMbT+eay+t99WzcP3kxGSeb8OS5ACFhxqkeI7iB+nyafr0
         rOuV6rmqZYe/l+tOjY/F68nb75dV/6faHMawGvHRB8Ise/ZVn0TUmrjcNnDvPpYSKK2u
         +QXD6hqZOg+6u0V1BppZ1Urc5RWCALe2KqPFw8J3VQOjtx6mSqe/+OUnn1A9CxqXE2Rh
         3JFRqVxezB+DuRVhlYCK/igl86QKpIhEethObsm3dCBF1m3uN1ceVfoGd3oqdi0XHpq+
         P1ABcTzfX+8k++zN/yVvUWt5pjTlmOe+9OyrAy5cz7M2zWHcj6kYn7fmGKwoBPTTXQfY
         VfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704385819; x=1704990619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj4IIq0tzuh1/OdFywt45Ed5fBVp3SK/t71RwP6JXSw=;
        b=DPBskfeTWP2FiOJBurcglkgCinGIL4w3EsIU+5se/HhX4+r0bfkeVVKGoluL35FmvE
         HJYyhrqm5/FgBy5WqldZQrP9ngDeTtV2GsAELHdzBoXT5X+yyNmmgxnbFrkhfqzec2ta
         JJYW+TScPgh8Ssjx2n5QFSqjHCuNbmI9U9REL/1Wm/6xK6QzvTzVwyW6TUDvGMCcaMmL
         SuRA6o0C5DZzI8DI1lewZMr1dz1wvOcOTRufTkK9swyd6fVjS7pfXmQSldBLw0fipm19
         +KfFVpvgpD8SuaukA+CAHF95BIAwsSGGqB+cufT0OcAWpafDQmRbX/inld/KdTlJKdEx
         xYrw==
X-Gm-Message-State: AOJu0YzO2a0fqx2DCnbtRzbsshLmpImV7tx+gLbwW5Fi7DJFISCLyAdb
	ZzOtStP/cxIw0gm2xbDrS8CTiiLuzSwXzlUqX0X2K1+kwghbtw==
X-Google-Smtp-Source: AGHT+IHbmPwv6z7KPbpI44YRa4bYQfIXyvmSunk5ru1UyVqC5KptkTXxtDOkWoeYljsAtoXlTJC88ShSxszX3+BvyHo=
X-Received: by 2002:ac8:5cce:0:b0:428:3602:4ad8 with SMTP id
 s14-20020ac85cce000000b0042836024ad8mr839527qta.60.1704385819426; Thu, 04 Jan
 2024 08:30:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231226200205.562565-1-pasha.tatashin@soleen.com> <eqkpplwwyeqqd356ka3g6isaoboe62zrii77krsb7zwzmvdusr@5i3lzfhpt2xe>
In-Reply-To: <eqkpplwwyeqqd356ka3g6isaoboe62zrii77krsb7zwzmvdusr@5i3lzfhpt2xe>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 4 Jan 2024 11:29:43 -0500
Message-ID: <CA+CK2bBE1bQuqZy3cbWiv8V3vJ8YNJZRayp6Wv-j2_9i37XT4g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] IOMMU memory observability
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
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
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 10:31=E2=80=AFAM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> Hello.
>
> On Tue, Dec 26, 2023 at 08:01:55PM +0000, Pasha Tatashin <pasha.tatashin@=
soleen.com> wrote:
> > This patch series solves this problem by adding both observability to
> > all pages that are allocated by IOMMU, and also accountability, so
> > admins can limit the amount if via cgroups.
>
> Maybe this is a mismatch in vocabulary what you mean by the verb
> "limit". But I don't see in the patchset that the offending pages would
> be allocated with GFP_ACCOUNT. So the result is that the pages are
> accounted (you can view the amount in memory.stat) but they are not
> subject to memcg limits.
>
> Is that what you intend?

Hi Michal,

Thank you for taking a look at this. The two patches [1] [2] which add
GFP_KERNEL_ACCOUNT were sent separate from this series at request of
reviewers:

Pasha

[1] https://lore.kernel.org/linux-mm/20231226182827.294158-1-pasha.tatashin=
@soleen.com
[2] https://lore.kernel.org/linux-mm/20231130200900.2320829-1-pasha.tatashi=
n@soleen.com

>
>
> Regards,
> Michal

