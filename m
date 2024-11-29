Return-Path: <linux-doc+bounces-30953-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8749D01F1
	for <lists+linux-doc@lfdr.de>; Sun, 17 Nov 2024 04:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B626C1F23690
	for <lists+linux-doc@lfdr.de>; Sun, 17 Nov 2024 03:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A022DF49;
	Sun, 17 Nov 2024 03:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QhlGPQMb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675828EB
	for <linux-doc@vger.kernel.org>; Sun, 17 Nov 2024 03:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731814448; cv=none; b=FI37MQpjS6t5OIxst9ZV1x6m6/vgEeUH8fdvpi/gocI8Dy3GAqFT5aiwYN5Jqw5hc72h+eMnFvEhNs8+wsovIDGIE56y+yrsPKyJgJ3abczRc9IuANIJXohZ0n3zHOxUliLtlZ8XN3+2POQYc6x1GP7dMrxKkuxUyO8717+p6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731814448; c=relaxed/simple;
	bh=00gvliQUwWimef4ct/EIE/b0rvbUFcdW8YQEp7o6rus=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pckZhGptYcKOGVTthYO3qISbUV51Jn6ETLwIywZvqkmltO2Xuyas9Iv30Uajzi2ZLcBwXDqA3KrQ7nlVioifkXzd6JDijLiEulij40ZcSEO8nz2vMrJr4H0klg6WwuyO9J6CBR5ipt8iYpKnWlcPqcWOif5Tgc0rstTEz0cuqj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QhlGPQMb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-211f1b2bf2bso90025ad.1
        for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2024 19:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731814446; x=1732419246; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOX3KyXD/eJJAjnkxJqzzYE8mS/sgEW7Z5FSy4P93gk=;
        b=QhlGPQMbKRvBYzmloIxsv/d988bLuPTHfjMtPB1DEt29MV+96wbMwrYb2x4H59axn3
         AE5SRrNAJqHrgNIamdFh7Jq97Jt80bGGwu9dAQKcWLOCfgEbid6JTWx3Jt++KWLxrIDk
         ZZa4entqWTDN5sot8bSi0GMqPDrDz5C+83Q9gLtW5v4JFGjcNZJCy8kktWDUUaCYd5Ls
         ZpoESqyVP7c7nf+r6dFVWWcsZBnfvwK8y5v/5OjPEkOAydgESAlSWqYr+5GG4sUMp/6h
         FEsktXQeGjhGJo1+DooFjg4NgpUQPIr4GmLTUR+qpmlHdVxVjO5oT1kC7Osm8TyWbmXD
         XYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731814446; x=1732419246;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOX3KyXD/eJJAjnkxJqzzYE8mS/sgEW7Z5FSy4P93gk=;
        b=gG6Db/ZO1l0cfC9P97qEMcn3vkjB+4aMnf2VhkxLEfwHuOSuYgn9zaBn3nJq9TrXBZ
         3ceIDvG4HrYpnAmhhIXm6QtFJIf5RVmO6/ySTty4+EBRQMvFtIIEz5KdN62HYPBX8HDb
         WLCblzdXL4iq9ZN86iBi7JVSa9scS0GAiLhtlutjBg4VJSKNPBO4Y/XOV2vE1lzpUTOv
         l6fsC9FAfTkW6wetzOy6pSUVx1HTj2E7FFda77IIIA2GGq+3u6xgQxSd62jILnn07m/W
         rWyhi3tKn6Ni3AQR+fZLmk7jTvDlIL2H0T2AbWMa2Fn8Yflc/jizY1IIhudrhTgy+c5a
         qu7g==
X-Forwarded-Encrypted: i=1; AJvYcCU12Zv4/HJExXjSBhEHXNJ6bJ1upsNUFFNBBb0Bt4tVsy2jfiWPuCEbT5AkpQIpH96a4r8kECtjy7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhaiHa6nNFBBERsUxpwdMbdydanwBqCG/0It7HTd0E5H2nn3ae
	IIxfjFX5EKEqXx3gtQJDmiKO9bE91fFgandBlWvYW3IWxf/Z8arpxYcz+NSuBA==
X-Gm-Gg: ASbGnctdTYNCTPlmqphY9CSWhXjosNVHE5v6QFysO2PVkykiLa/HPOeHDyhVAWk8HbQ
	S4trQqTyovw9jhZA/H9hNbWODoPSPtArKzJX8ycXMVdOmE9UiLeF5JrNG00bXPm9HKM90zhJR2q
	vkKhpac2O+qViMJ7JSax+D+XTlRgD3Y1CaJ3YwBAsEL4aXyURwPPIOZT7MmSQ86TjTi+U4XE1fq
	f1xKLemVB3D20pt2Ugg0djkJlsAxuZVsnkYkcNbTH01FhMAkIHg/YucyzWwLxYnv8QQefMZ8Gbs
	2g==
X-Google-Smtp-Source: AGHT+IGPoixMjPOc/jgNWCvbrikf5QKqxsGFrmaEsXlgsR6JtxYUwWpc2eNtXOXeVrmypR6sxs71JQ==
X-Received: by 2002:a17:902:c94b:b0:20b:bf5a:c8 with SMTP id d9443c01a7336-211ecf6145cmr1959885ad.10.1731814446065;
        Sat, 16 Nov 2024 19:34:06 -0800 (PST)
Received: from [2620:0:1008:15:c1e1:2e4:c82d:76a6] ([2620:0:1008:15:c1e1:2e4:c82d:76a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2120dfab3c5sm3500375ad.22.2024.11.16.19.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 19:34:05 -0800 (PST)
Date: Sat, 16 Nov 2024 19:34:04 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>
cc: Joshua Hahn <joshua.hahnjy@gmail.com>, akpm@linux-foundation.org, 
    nphamcs@gmail.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev, 
    muchun.song@linux.dev, chris@chrisdown.name, tj@kernel.org, 
    lizefan.x@bytedance.com, mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com, 
    cgroups@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 1/1] memcg/hugetlb: Add hugeTLB counters to memcg
In-Reply-To: <20241114052624.GD1564047@cmpxchg.org>
Message-ID: <f179500f-5c58-d559-ff88-0d7bb8f9fa2c@google.com>
References: <20241101204402.1885383-1-joshua.hahnjy@gmail.com> <72688d81-24db-70ba-e260-bd5c74066d27@google.com> <CAN+CAwPSCiAuyO2o7z20NmVUeAUHsNQacV1JvdoLeyNB4LADsw@mail.gmail.com> <eb4aada0-f519-02b5-c3c2-e6c26d468d7d@google.com>
 <c41adcce-473d-c1a7-57a1-0c44ea572679@google.com> <20241114052624.GD1564047@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Nov 2024, Johannes Weiner wrote:

> > > > The reason that I opted not to include a breakdown of each hugetlb
> > > > size in memory.stat is only because I wanted to keep the addition that
> > > > this patch makes as minimal as possible, while still addressing
> > > > the goal of bridging the gap between memory.stat and memory.current.
> > > > Users who are curious about this breakdown can see how much memory
> > > > is used by each hugetlb size by enabling the hugetlb controller as well.
> > > > 
> > > 
> > > While the patch may be minimal, this is solidifying a kernel API that 
> > > users will start to count on.  Users who may be interested in their 
> > > hugetlb usage may not have control over the configuration of their kernel?
> > > 
> > > Does it make sense to provide a breakdown in memory.stat so that users can 
> > > differentiate between mapping one 1GB hugetlb page and 512 2MB hugetlb 
> > > pages, which are different global resources?
> > > 
> > > > It's true that this is the case as well for total hugeltb usage, but
> > > > I felt that not including hugetlb memory usage in memory.stat when it
> > > > is accounted by memory.current would cause confusion for the users
> > > > not being able to see that memory.current = sum of memory.stat. On the
> > > > other hand, seeing the breakdown of how much each hugetlb size felt more
> > > > like an optimization, and not a solution that bridges a confusion.
> > > > 
> > > 
> > > If broken down into hugetlb_2048kB and hugetlb_1048576kB on x86, for 
> > > example, users could still do sum of memory.stat, no?>
> > > 
> > 
> > Friendly ping on this, would there be any objections to splitting the 
> > memory.stat metrics out to be per hugepage size?
> 
> I don't think it has to be either/or. We can add the total here, and a
> per-size breakdown in a separate patch (with its own changelog)?
> 
> That said, a per-size breakdown might make more sense in the hugetlb
> cgroup controller. You're mentioning separate global resources, which
> suggests this is about more explicitly controlled hugetlb use.
> 
> From a memcg POV, all hugetlb is the same. It's just (non-swappable)
> memory consumed by the cgroup.
> 

Ok, that's fair.  We have a local patch that tracks hugetlb usage, 
admittedly for all hugetlb sizes, in struct mem_cgroup_per_node so that we 
can provide a breakdown in memory.numa_stat because we can't get the 
per-node breakdown from hugetlb_cgroup.  If there is interest in that 
breakdown, we could easily propose the patch.

