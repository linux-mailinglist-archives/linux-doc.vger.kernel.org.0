Return-Path: <linux-doc+bounces-12172-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438087D61D
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 22:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 447602827C9
	for <lists+linux-doc@lfdr.de>; Fri, 15 Mar 2024 21:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68EB54911;
	Fri, 15 Mar 2024 21:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pRd1ydMx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D97254902
	for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 21:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538088; cv=none; b=ElAtZCJrCcAf9YxOedLOfX2RUcRQVC9Cn2RJ4VOY74NUVtlQcdKhqVkqcBpHT5/AbQ053zzc6fIf7+VAmJOKPz75BoTCbToSDeb8gY0BfvaTiCvGc/+2SmjpAWGtWs69eiE3sW3JXOQjXjgURYzJR0mZP+k/uKeLgX2yOwpjg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538088; c=relaxed/simple;
	bh=Q+XOPMRCM5h9lRk7auaVgXY8II5pi0ZuPsC/JllFwmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l+ytvuiPZvIh7vY8kv39Mvo/yv8Zhr1M9RE1y3xq6rZO8Czgsm4HyKZ8KfrkmibtgbNyzUh+h26sJKI0VVZBIrd7IF4jTWny3zhcZFAat5yKpRVj4Z0INZxseos5GjRGfcHXD+Dt9GhekQXswBYEqXKICYsdD0BJP8huHLxqVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pRd1ydMx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dddd7d64cdso13895ad.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Mar 2024 14:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710538085; x=1711142885; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f8xWPRJ3tZZgN10pKFEIYzu9dCAJ11FurTmpvR2gSvg=;
        b=pRd1ydMxgsuj+Hrr8NQoK6QopU7eMl3NTwg8DwMiJyev3uGRHZ20MRFilGiloEhYNy
         BZurOMG+VRtsZDm8HLAth2Cbo3aNMGyzu3RO0Qm8XaB2gDv98gFyIOQn6dFLMovlXllF
         dO8RwntiOeEZ8o8HdXNpDYpMrk/6rfaNSdlvTF25ZulGTUsl0lgZUF17Z3biCTOY7tKx
         p/CVtX96eFOQfP8yTcI0sMHN5RTfleb2a5arLivrU9eiNclfX1uumLXqOHxpBmW3O/Ey
         SJ//MC3ToLsP/CZgzPDNImwJXVqm3z9+Qge+CzsdtE0C4w/A3HARJwH8hg8Ovf8QjVA9
         83Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538085; x=1711142885;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8xWPRJ3tZZgN10pKFEIYzu9dCAJ11FurTmpvR2gSvg=;
        b=OD1SIMaHUSiSHSItHIE9b0OkK1998eS+9aaOk0UcNSIS49CNOohtTyKI2iazDyGs/H
         hUoLlhdi40FHGFO8TXnvbk6+p12TzA6NRQsSJzWLGkPD3h+gDCthrqdrGvVtHNw+qnPv
         EdYl+RTcIX29n1xrFO+nN2OltnTY2mQVcQKGzSegdIbrS1GDSLh/PMMXYWgOOFTC8tH+
         TDBl2sK0FFvo2LK/jAj6MkAYOmQgXnDGbjsSZ8SDPFH4JbwXzszvJ8SxSAQariQXYvBq
         s+cxzX0+cByxz8lfl+cfljl34vc5CPbKGWpGmrKQrS+uqWPsm13i0jh9UzCs6dzCYBsg
         hqxw==
X-Forwarded-Encrypted: i=1; AJvYcCXO8G5mhyQczqDzhZkNDr674VkU8oPljEkYDQM8zQNXmEEM3AD8NZTcD0RG4++zHjtw4Dfz+Osxz2Yf7kDDJ7CxFNY8v00XzpsM
X-Gm-Message-State: AOJu0YyrYKaU1GZa0kD9BPEWQfdbRVwkhdpHonoJYd/YZvSui/p5Wp49
	l7gqVzTJgVp6LKVqYOc6tzI0pMjKZ8ZR2JIeh+I7jzcMRenOhVtUD4Vy6Ic/uA==
X-Google-Smtp-Source: AGHT+IFx0V9evEEHTCAL0rngEMSTSxrVQJwAPcZMZ/kTvEYdGlomkmF5ttVwWUPGQnGpzwrxLolHsQ==
X-Received: by 2002:a17:902:ea0b:b0:1dd:96e5:feae with SMTP id s11-20020a170902ea0b00b001dd96e5feaemr291145plg.16.1710538084580;
        Fri, 15 Mar 2024 14:28:04 -0700 (PDT)
Received: from [2620:0:1008:15:59e5:b9a4:a826:c419] ([2620:0:1008:15:59e5:b9a4:a826:c419])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001dddb6c0971sm4396163ple.17.2024.03.15.14.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:28:03 -0700 (PDT)
Date: Fri, 15 Mar 2024 14:28:02 -0700 (PDT)
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
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com, 
    bagasdotme@gmail.com, mkoutny@suse.com
Subject: Re: [PATCH v5 02/11] iommu/dma: use iommu_put_pages_list() to releae
 freelist
In-Reply-To: <20240222173942.1481394-3-pasha.tatashin@soleen.com>
Message-ID: <34b593bb-796b-7657-8971-17d24dea4e99@google.com>
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com> <20240222173942.1481394-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Feb 2024, Pasha Tatashin wrote:

> Free the IOMMU page tables via iommu_put_pages_list(). The page tables
> were allocated via iommu_alloc_* functions in architecture specific
> places, but are released in dma-iommu if the freelist is gathered during
> map/unmap operations into iommu_iotlb_gather data structure.
> 
> Currently, only iommu/intel that does that.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>

