Return-Path: <linux-doc+bounces-5891-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D181DCAE
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 22:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7A5F1F215D4
	for <lists+linux-doc@lfdr.de>; Sun, 24 Dec 2023 21:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D45FBF1;
	Sun, 24 Dec 2023 21:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nQeM2AY6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D04FC01
	for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-357d0d15b29so370345ab.1
        for <linux-doc@vger.kernel.org>; Sun, 24 Dec 2023 13:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703453995; x=1704058795; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9Q+OMVGug+ylz+2uzJShCURagJfqE6miFHjz/+Dgvg=;
        b=nQeM2AY6cp/niLsBzgFiWuH2doedWEVHCah9TYHwAGD5bj3DcpFc+lt1C1oTlajYY6
         Yi1LdGlQi4MTt7b6gUxlqI2SZTjDbnp1CmJDdSUgJtom4uSXeG+6T/nv2j8WO9pk+L+e
         TFXBYKhElRLA6jx5IZAxvRwOIDib9uycesjwuT8Kji8utE8mZbyVXqNYgkwEn9VUQ/St
         RWCPBr2vKzHHvc/3trKPuqERBb+Tbz1IcmKG7lU6D8ju3PkdvNVBRUCETtm82LwmcGKC
         EZRYYycvNkHI+80et2GCRwewRXcyOrLUG75IBaJZGVXIJ3+UsyVEvoYA44MnQHHdvxI9
         TRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703453995; x=1704058795;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9Q+OMVGug+ylz+2uzJShCURagJfqE6miFHjz/+Dgvg=;
        b=u+ykvN3HivpjZVRUKmKk8RXCzxX+zEP7CcOmCpiCenYudiYtwuaQoeKUSfCN0GSsPc
         2CeNphKBfRwCsNUlVLB6sKCwBizflyezDsaSNujE+PSo0hEg7LEJbyabQkAq52QIiWT+
         F9qUw4qGm/kKFOkiJeYZshWlETnsSIivJp7z79p1vZJfMoPWvVgwjfclYbvfs68lTZZm
         a+NR0GjPm0N6jnkx5D9+BdQE7WfVHakXJPFuUEgqN+NjO4aBbEW6rWmD26kDltGsf1yq
         pidgN8uaumGzJe5gO/ukGKeoTSGuo4+r18xwIPyt2tsA7KV7JRwOvwxIewjtgTaJGa4y
         mLFA==
X-Gm-Message-State: AOJu0YxNym5FJvLE9iacLx0bdOAa3uBMjYRMTalJYPHzxSsH5SOWj6fl
	Z3WMxzr43Q/LNHbcJ8bVAZASjLM9bsk7
X-Google-Smtp-Source: AGHT+IFJfsP5JhgYByhZLf3HirHsXDvYjSFYqzQ3snkAvp0nJS5eXaEyeAz3IXcv8WBPowwQKkdAPg==
X-Received: by 2002:a92:cb09:0:b0:35f:b09b:ccd2 with SMTP id s9-20020a92cb09000000b0035fb09bccd2mr397952ilo.7.1703453995330;
        Sun, 24 Dec 2023 13:39:55 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001ca86a9caccsm6947051pls.228.2023.12.24.13.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:39:54 -0800 (PST)
Date: Sun, 24 Dec 2023 13:39:53 -0800 (PST)
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
Subject: Re: [PATCH v2 07/10] iommu/sun50i: use page allocation function
 provided by iommu-pages.h
In-Reply-To: <20231130201504.2322355-8-pasha.tatashin@soleen.com>
Message-ID: <2a474224-80fa-3b71-c498-09cf22e5d130@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-8-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/sun50i-iommu.c to use the new page allocation functions
> provided in iommu-pages.h.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>

