Return-Path: <linux-doc+bounces-29352-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3BA9B7483
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 07:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD2B8B233E6
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 06:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02531448E6;
	Thu, 31 Oct 2024 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY6XB+a9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61A1448DC
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356108; cv=none; b=pVeFZGvjQKc4QAseMTuHxiHFa5WBVvYdBsWDUAUvCpx330jbFUBvsm99rJ+FZCqN5OG8w83ZcbYOaDPjZZA/O+DbC2ygxcPyC//AS1Elo6DglVuek4vZvOqINGD6T7c+k3A9N+8IscKCN0hs5lWLis223nsdDSJiRM3S6cow27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356108; c=relaxed/simple;
	bh=MKqc+jnQFmyBLCFxWGJ3NUD1kakYxp1Ft7jvVu1cUio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzK1lhouP5wZcI+ZiV4m9IZz3ptyH6VTJlqsm4HPTW5H/bsyO7pOzOoSSRn/YyHjlW5hKgGW2seQ/5fw9XSQ21vRwKcx4sRAWl7wCBb78o0BvA/JiFfnFYvgX4vsSLqLnIJ0OipwGZqkPg+StzyhUPxOX0M286i6oBvPPCWbJuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY6XB+a9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f53973fdso523855e87.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 23:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730356104; x=1730960904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0A+2k/ULHhbtDsFz6ukwr2SikYuSBp3Zz6My29BV53I=;
        b=fY6XB+a9GcvCY54J/6TCzSg+CFj7efwDBSnGFtOhF8l4VX7duOpc27ENEfN+QUTbs8
         qfo9uf7ksKv4G21sRhXh34ZrNekFpKwMxFeJWpDqPAuC8cD5OcRfZCysrEEV69n2Ekpn
         JWAxJNllYlXYUzbxvjz1H3WeD2rO1u++uDWk+UjtrJ3BFAykNy+zxTNabfu8sY0Q6J+Z
         df1m25hI34NoqQikQkmLMzG4ZqNcav3mLIJiVc3J2UB2Jnnss3stSS+EgoZ4zvhIbKnF
         J4/4JBQv9+1LfhwE3S8pUdBv6piptGORTZXSSw/SNO8EkaQy69zZrwYP5BMGBFhlulV1
         ZHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730356104; x=1730960904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0A+2k/ULHhbtDsFz6ukwr2SikYuSBp3Zz6My29BV53I=;
        b=dhgiv3QLdleR5VeoeNzWy85v90rHn92r8kEPLgnAc3q5IM+rpXvU8csJUTVFroEXo0
         JI4bTFNbH6UEZg7IErwshoBJdUz3q/mjTZqit8laZSdIjuVAWMfXmKaIhfTZXJ9+mouH
         ZqlzhQ7xzdz5tu7FDENlgCn11CUKwACJwnOoXRxGaLZohDBUgtU2j1EuHXnVOR0lFJqW
         raToqP1HDPyNTzcoEjH20g7PHMPhsicpsafQwbyvzJwFwg5IavDov9e+7v3DvVlRcC5L
         FLf43ohRQM1PoHPTtgR60pcIxLqbbWDkEvL+i3Sdllwd6V+ec2TG9tmbMVQmquatnpFB
         jKGw==
X-Forwarded-Encrypted: i=1; AJvYcCWzkw55P7n53iv0WKBW+X+BQc5sF6Q0iwLsQXJyQGsaEjCnCAHgQMLvAXst41p8n5pWsd1xb7IsCzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTAmSPjon0k7MnYEbcUp87nsNKuxLqs1dp7pF4GrhgTivU3UK3
	WLxo69h0cQYYWZKpWpwnCn4dVlYzouWFJ1soa+IAtp5w7X4bzcQZ9KzOEbv87ZlfFmP3V5W2fRX
	xND7C1IFG7gd0tjNoNMuhs/yvjTBLnkYsa2jxMA==
X-Google-Smtp-Source: AGHT+IFS7cpOzSPiFnYyQueXqV7l2SMv8NBdQwLcqFAZDqrWEol+iOoyDA3s2GJBPsOCBe+TjxRn94cV+pCmUA4hIqQ=
X-Received: by 2002:a05:6512:2243:b0:539:8ee8:749e with SMTP id
 2adb3069b0e04-53c7bbc136cmr376123e87.3.1730356103938; Wed, 30 Oct 2024
 23:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730313494.git.nicolinc@nvidia.com>
In-Reply-To: <cover.1730313494.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Thu, 31 Oct 2024 14:28:12 +0800
Message-ID: <CABQgh9GYOgBJwRhvsWpPwS4vgDzCvXCAUxc8DQy8ObHAOvpbRQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] iommufd: Add vIOMMU infrastructure (Part-2: vDEVICE)
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, joro@8bytes.org, 
	suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com, 
	dwmw2@infradead.org, shuah@kernel.org, iommu@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, baolu.lu@linux.intel.com, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	yi.l.liu@intel.com, aik@amd.com, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Oct 2024 at 05:36, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> Following the previous vIOMMU series, this adds another vDEVICE structure,
> representing the association from an iommufd_device to an iommufd_viommu.
> This gives the whole architecture a new "v" layer:
>   _______________________________________________________________________
>  |                      iommufd (with vIOMMU/vDEVICE)                    |
>  |                        _____________      _____________               |
>  |                       |             |    |             |              |
>  |      |----------------|    vIOMMU   |<---|   vDEVICE   |<------|      |
>  |      |                |             |    |_____________|       |      |
>  |      |     ______     |             |     _____________     ___|____  |
>  |      |    |      |    |             |    |             |   |        | |
>  |      |    | IOAS |<---|(HWPT_PAGING)|<---| HWPT_NESTED |<--| DEVICE | |
>  |      |    |______|    |_____________|    |_____________|   |________| |
>  |______|________|______________|__________________|_______________|_____|
>         |        |              |                  |               |
>   ______v_____   |        ______v_____       ______v_____       ___v__
>  |   struct   |  |  PFN  |  (paging)  |     |  (nested)  |     |struct|
>  |iommu_device|  |------>|iommu_domain|<----|iommu_domain|<----|device|
>  |____________|   storage|____________|     |____________|     |______|
>
> This vDEVICE object is used to collect and store all vIOMMU-related device
> information/attributes in a VM. As an initial series for vDEVICE, add only
> the virt_id to the vDEVICE, which is a vIOMMU specific device ID in a VM:
> e.g. vSID of ARM SMMUv3, vDeviceID of AMD IOMMU, and vRID of Intel VT-d to
> a Context Table. This virt_id helps IOMMU drivers to link the vID to a pID
> of the device against the physical IOMMU instance. This is essential for a
> vIOMMU-based invalidation, where the request contains a device's vID for a
> device cache flush, e.g. ATC invalidation.
>
> Therefore, with this vDEVICE object, support a vIOMMU-based invalidation,
> by reusing IOMMUFD_CMD_HWPT_INVALIDATE for a vIOMMU object to flush cache
> with a given driver data.
>
> As for the implementation of the series, add driver support in ARM SMMUv3
> for a real world use case.
>
> This series is on Github:
> https://github.com/nicolinc/iommufd/commits/iommufd_viommu_p2-v6
> (QEMU branch for testing will be provided in Jason's nesting series)

Thanks Nico

I tested on aarch64, functions are OK.

But with some hacks
https://github.com/Linaro/linux-kernel-uadk/commit/22f47d6f3a34a0867a187473bd5ba0e0ee3395d4

Thanks

