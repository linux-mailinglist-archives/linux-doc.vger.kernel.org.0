Return-Path: <linux-doc+bounces-44784-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D14DAA1AFB
	for <lists+linux-doc@lfdr.de>; Tue, 29 Apr 2025 20:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32C4F9A4AFB
	for <lists+linux-doc@lfdr.de>; Tue, 29 Apr 2025 18:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571B1253334;
	Tue, 29 Apr 2025 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="op5DRgX/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0172472AA
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953064; cv=none; b=PY17zu4SB1tzwxQpUSiai24zqFQMW1EEvZl+fal3TPPqGTRwVoFuAaX1B4mb4kDYQcrCvN+Vlg2fED8q/R8pG6AVgYB5EXizvynaGrNx2G0U210gwjjlQYvdtJJpSHRah4jZrRYTz5LdKw3dE7tQzW243rHsfGOAqpbzJSmokGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953064; c=relaxed/simple;
	bh=neW8JICaEEWUIk+9rBwbn5iIXjtiSl0sUhd8RTSSX8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEnG5OTA3XjZQyPYxKD0A9xR44bTdNlZxFaVc0Nd9v9xaFmFiRVEqOp/lh/0mjUPhfgfT7H/1OsktcZXUa4hGLgyq580cVAeJweBfNrCb0S8OI2Cx2h21xjT8LiNq/caWE+HogV6n2c2iyQlBhNgs4fWPkPJm/Vlh5kDI5KUxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=op5DRgX/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2242ac37caeso53745ad.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953062; x=1746557862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdXV/8C/yQUJ8I+wtd2Z/G5iaXapJqIY6nj11Km1s7M=;
        b=op5DRgX/KaTY0NxUnn1fFffmY3C5vo109AmUOlkmp/aWk0wZX6s7lJqDiczqtZL/bx
         7d39aHojvWbM0l5hLfjDnSxqbnfnBkL2usFyFye0UyGQ8UsP0Yuz0H6eMk81criVqZsm
         5l0QxzQ7+oxC3H/8d/IcT7N/fO5CGtl15LV3q0wypcVUD9HRhfyJEtSW0U2AkSRBSNsD
         yseE9LRvUA8H9McpFjWOlUkNCX/93FsFSHd3oPUlkLyaFpHH2HEVrnCWQkw3/rPaZxJg
         HtRETnh/oOboFCUhSrxzcWGh+IIB7lbuag/LlUf9kYGroHzOpRrhUUraqvTcZrfYs71a
         ueTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953062; x=1746557862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdXV/8C/yQUJ8I+wtd2Z/G5iaXapJqIY6nj11Km1s7M=;
        b=mffD9guevTSo2YgkYjnwqgp+XaPAXtdT20KfYdw0vpz44H01E4Bz0bD7SNbX3WjZfh
         saA8KIRM2js/3xVbxo+xOEQM7qzXTw5p7EicV4tCQvk4aFfu1rPYFEqAz3zDqJ1T/6fJ
         ipLaU3/bhzZ0fmfFgCs0rBGeN5vfZKrwTGLpRKUkAtilB4qUivwfU6muU/5fgvggDZdp
         whwnmG7VEePXLcAumHECy3l9Y4myBu8YLE/4eaN0pocUW951nSvomqrVsQWwh+PY4P27
         nuFCazSLFtx20zsH1h+dnv7oQW+HLfTx/CrzCejuPjR1fXMNZi7gd3b7R/VkSCa3xSHV
         pt3w==
X-Forwarded-Encrypted: i=1; AJvYcCWd8wWozJ/Ew9zxxeKlgVqWR+Z3Fu8bhit2G9+FF4P5cOnNr5yw7s8P9dGWiMt9OeG28+6P5kRYET0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNtuWhiLxLPh0tyYR9T1bGuIz3FiWOSvmSX+Lp7L0WpWFGaL2A
	sOW2+tJLJVuL6TLsMjj6aj7AaC+kTw5v5FnRsJVilmmNxtGYiSVWDkOChjibsQ==
X-Gm-Gg: ASbGnctkoKrm96ax/5FaJOxFRlNsz/0K6YAIdjtEac7aHBxf+LrZkBRiQrAS0D9tu8U
	qpZFV6ozpnuEt+LZmc2ROdjEGfX47FgWOax+06JHGLPL0sPFAif9MVQ6orqh878MfMpaCdD3P0+
	pqcDjbbgdtroheN/9QToN8fg1wdvTbtd9Li/v3COyB57POknmZkPFSovqryP+VoPAsZ8w3CItBD
	LjZILGZz6RuzJVUz0s5lNUy0JMQUivDH5I62Z3aIizEwiz4l2KvebZ/m0NYjjNWnUoUhWCc4ov5
	HKFXbBeHSANDXvzfsh9eqToRYi3SgkQ/PHAreODvJxqG/BNkoFw+LOrToadcKf67UAhk6sZG
X-Google-Smtp-Source: AGHT+IGgXGpqrHCfuif7QcKDzCUp9vTefuXFD3aLx4LdLjCaDTVmYgt+1uOwojrpCvF02XNkiYlVaw==
X-Received: by 2002:a17:903:248:b0:215:7ced:9d66 with SMTP id d9443c01a7336-22df3f77b8cmr333515ad.10.1745953061819;
        Tue, 29 Apr 2025 11:57:41 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef097e0csm11594174a91.25.2025.04.29.11.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:57:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:57:30 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBEhGmoh0E865PxF@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
 <aBCNkcLp6XZpjYYT@google.com>
 <aBEWFw2wq40SHjTn@google.com>
 <aBEXJFnLalIh788i@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBEXJFnLalIh788i@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 11:15:00AM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 06:10:31PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 08:28:01AM +0000, Pranjal Shrivastava wrote:
> > > On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> > > > On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > > > > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> > > [...] 
> > > > > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > > > > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > > > > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> > > > 
> > > > VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> > > > LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> > > > other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> > > > for each VTINF/vSMMU.
> > > > 
> > > 
> > > Ack. I'm just wondering why would a single VM want more than one vCMDQ
> > > per vSMMU?
> > > [...]
> > 
> > I guess the only thing on this patch from me was to understand why
> > would a single VM want more than one vCMDQ per vSMMU? (Just curious to
> > know :) )
> 
> It gives some perf gain since it has two portals to fill commands.

Ohh! I'm imagining concurrent invalidations / commands! Interesting!

> 
> Nicolin

Thanks!
Praan

