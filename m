Return-Path: <linux-doc+bounces-16940-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05B8CEA90
	for <lists+linux-doc@lfdr.de>; Fri, 24 May 2024 22:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E571C20EC3
	for <lists+linux-doc@lfdr.de>; Fri, 24 May 2024 20:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961C242ABE;
	Fri, 24 May 2024 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="luY7Yz16"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4739ADB
	for <linux-doc@vger.kernel.org>; Fri, 24 May 2024 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716580812; cv=none; b=uPkkcnuc3sznpVC9+fUd3hNmh4z369iCYJ0QGZDn/MzluX3Ll39LKCF84aI+ViMCwsXIjA4JXyB1mgEsO5P+J4ntfVGRQ/GQbw0jsQCwIAmSpKWbvBu4bX1Ztw6L83DfM3sTWDzaUE1rudFZoSqY2cgO8FP1pgq2HaffNRyyODk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716580812; c=relaxed/simple;
	bh=Gv43iCvXawnlGLRmctGhbdkb5WAxXv1tZ9waG3dYXuw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WDJ1tOVfrS9qGXxLt3IpJ8lrQ81tsDtFi6XaYKMIBYyy410rBIKBC0M4CxgOtcslU8UxwNugj0DbYs8vHELEGBsibv0SvWcU0bPo0B/XFYW8Ku4REvuMMPgBRcv/vxBDZ/Ji7pvK2BIA0RsmIaOEzY4l2NZEGOHNgl1lAJugCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=luY7Yz16; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f337d0e382so33225ad.0
        for <linux-doc@vger.kernel.org>; Fri, 24 May 2024 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716580810; x=1717185610; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J03u/azUiuyJ/7gPFey8suUIJZ5rc1p0eW52hXcyf1w=;
        b=luY7Yz16J6LPMLhLqtyuR+ZV1IxJQv9r1b0wa+/3z1fQhLwtAOmyP8UGuyOQ5DNYcL
         mX+KwRFwb0ojhQCxG7rZwyIXcBDc6sX2F815JmFgNbiNARUW2DgMCwyPpy15/mE2Ip65
         ErBN2ch8jOg0QdzNQrNacUhZZ9IEwdrfHHks5icZPgtkyDzhPPXDkLlCyXjEkXvuAXrX
         9kz1V8zR/66zL/w+W99dTrb/ynvjBpzfduy3+x0OV4jZeYud5LE4sIc1uvGPtnJlWWeM
         tGEvla9idzN3dK4Ylaeu+D5b0ko1nTiJh7aRbxxb5tfCnGSlKYtHkv29nRNGy00o/Uv8
         WboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716580810; x=1717185610;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J03u/azUiuyJ/7gPFey8suUIJZ5rc1p0eW52hXcyf1w=;
        b=ojkUDUz8dd+KDjE7z5QHOEDth1rOUpqG4M5Jn8SY6DNKDK+VmbBcNrHXtr3p1yNSGT
         2JVvEEOaR4pBlEVGlTiYQrkMdrdoQE5Y5jv1Yv5qUxK/scoOwE9VjrTgQB/5aTzu8YBP
         tlrNOG9TIGRF9HmQ9FJnF2NGsRaCKiSlP0jDe8qTjPJ8zR+Et/QgKepN6ac6ZeS3lDPY
         j3fp/lVz5yTYifH8AKzVr4WCHESqiSiOVPP6/jHzd1sITQUD3joCCXOQT5zdAooHYkJt
         P2eaMWMiHWARhWMwxU3ZQKGsXvbGb7rq4rJhpSGEm/+4/baj8D4Q4mVWnWZOIaZ1t3Ky
         92jg==
X-Forwarded-Encrypted: i=1; AJvYcCX1T2r6VUomee6P9UIZ/SI6oGBEA4cd01Gi8kln5KQzxJjgMOn3WK3LidFIOObcDFIqEiwKC61pRbtsRFtjJaOOneCFGQvY9Aka
X-Gm-Message-State: AOJu0YwoHRZ9DaJwN3k9F9mA4JAmiumQTh8hnWQm7L85FAThpdzNbo79
	jhFG/KuD3LMUOPl99xE2HsWS18rRZxWk3AW4rYb8SKOODg4mo/PAq9oWzoDECQ==
X-Google-Smtp-Source: AGHT+IGCIXQDdrO6BGUEBPI0rbMRLEFS1n4FDhL/LvduVdqztKRsVCv6w1yspdPe5J3ICBr0hoDTAg==
X-Received: by 2002:a17:902:d902:b0:1f4:50b4:a50b with SMTP id d9443c01a7336-1f466ce2270mr381615ad.18.1716580808226;
        Fri, 24 May 2024 13:00:08 -0700 (PDT)
Received: from [2620:0:1008:15:c92f:57d0:1ea4:5439] ([2620:0:1008:15:c92f:57d0:1ea4:5439])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc05e08bsm1456208b3a.52.2024.05.24.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 13:00:07 -0700 (PDT)
Date: Fri, 24 May 2024 13:00:06 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Sourav Panda <souravpanda@google.com>
cc: corbet@lwn.net, gregkh@linuxfoundation.org, rafael@kernel.org, 
    Andrew Morton <akpm@linux-foundation.org>, mike.kravetz@oracle.com, 
    muchun.song@linux.dev, rppt@kernel.org, david@redhat.com, 
    rdunlap@infradead.org, chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, 
    tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
    pasha.tatashin@soleen.com, yosryahmed@google.com, hannes@cmpxchg.org, 
    shakeelb@google.com, kirill.shutemov@linux.intel.com, 
    wangkefeng.wang@huawei.com, adobriyan@gmail.com, 
    Vlastimil Babka <vbabka@suse.cz>, 
    "Liam R. Howlett" <Liam.Howlett@oracle.com>, surenb@google.com, 
    linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-mm@kvack.org, 
    Matthew Wilcox <willy@infradead.org>, weixugc@google.com
Subject: Re: [PATCH v12] mm: report per-page metadata information
In-Reply-To: <45fb4c94-dd77-94c3-f08f-81bf31e6d6d2@google.com>
Message-ID: <1e1b89af-3b7a-7400-cfd7-d22a101955de@google.com>
References: <20240512010611.290464-1-souravpanda@google.com> <45fb4c94-dd77-94c3-f08f-81bf31e6d6d2@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 18 May 2024, David Rientjes wrote:

> On Sun, 12 May 2024, Sourav Panda wrote:
> 
> > Today, we do not have any observability of per-page metadata
> > and how much it takes away from the machine capacity. Thus,
> > we want to describe the amount of memory that is going towards
> > per-page metadata, which can vary depending on build
> > configuration, machine architecture, and system use.
> > 
> > This patch adds 2 fields to /proc/vmstat that can used as shown
> > below:
> > 
> > Accounting per-page metadata allocated by boot-allocator:
> > 	/proc/vmstat:nr_memmap_boot * PAGE_SIZE
> > 
> > Accounting per-page metadata allocated by buddy-allocator:
> > 	/proc/vmstat:nr_memmap * PAGE_SIZE
> > 
> > Accounting total Perpage metadata allocated on the machine:
> > 	(/proc/vmstat:nr_memmap_boot +
> > 	 /proc/vmstat:nr_memmap) * PAGE_SIZE
> > 
> > Utility for userspace:
> > 
> > Observability: Describe the amount of memory overhead that is
> > going to per-page metadata on the system at any given time since
> > this overhead is not currently observable.
> > 
> > Debugging: Tracking the changes or absolute value in struct pages
> > can help detect anomalies as they can be correlated with other
> > metrics in the machine (e.g., memtotal, number of huge pages,
> > etc).
> > 
> > page_ext overheads: Some kernel features such as page_owner
> > page_table_check that use page_ext can be optionally enabled via
> > kernel parameters. Having the total per-page metadata information
> > helps users precisely measure impact. Furthermore, page-metadata
> > metrics will reflect the amount of struct pages reliquished
> > (or overhead reduced) when hugetlbfs pages are reserved which
> > will vary depending on whether hugetlb vmemmap optimization is
> > enabled or not.
> > 
> > For background and results see:
> > lore.kernel.org/all/20240220214558.3377482-1-souravpanda@google.com
> > 
> > Signed-off-by: Sourav Panda <souravpanda@google.com>
> > Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> 
> Acked-by: David Rientjes <rientjes@google.com>
> 

This would be a very useful extension to be able to provide observability 
of per-page metadata overhead and the impact of things like HVO on the 
overall footprint.  Today, we don't have observability for this memory 
overhead.

Andrew, anything else that can be addressed before this is eligible for 
staging in MM unstable?

