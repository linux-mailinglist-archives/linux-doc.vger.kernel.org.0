Return-Path: <linux-doc+bounces-7855-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE7842A7D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 18:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C442869E3
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 17:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BE01292DB;
	Tue, 30 Jan 2024 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wKkhS5YE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2211292C3
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706634589; cv=none; b=qSNO72Qe1MAxVc6yQq4dPOwsjLQvIy0PML9gPFApSpJMf85VQ5iRC21s9uNBP/0nsNHK7VLKrh3WQ2XcyeVt+JUstYyFNWf0/SpOLW553grLWKJYenlwcM7JJuxMGIDbYuutZgP4gZoeHkP+oZYo/1ZQBbJmgtXnIVmc7UMB/hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706634589; c=relaxed/simple;
	bh=ozTRL504Xs+y38dN7hpmz9/MkdUYy3m28oZBq7+GDso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P0mcfvhqn3ZH8xnl2P2PTHWd8B5emDF274GSqPpPX8jzRcqPOeKcm6ZpJ3DDAPLqxu38vmcOuTBhuZymlRQBKNCp+C6AZ9SCUbLfD6C2vfCLbD5I+p+uTys1ylFg1Wva7k74uwOc+17StQASK9I5NJd0OHi1BUUWUQcS17UO+HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wKkhS5YE; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6477d2cbcso5385212276.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706634586; x=1707239386; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3gUAiVWxsdrX9MXtJSqjLmwRv/f/RgRmiC76ruk/jsk=;
        b=wKkhS5YEBpDt2vlodWszox39LdIEj/oQawgXls48TNYPNr2H3xLWYxya9j9/nuabio
         DlCnL00V2utLyUp0KD7KBriB2PIauPUTMJD1zIC2B1hHHlCwWoYUnuAruGudf77YNdJp
         FFXBZ0zwIhIQY51K/8d1GrHwRaG9PIipGkMCV46ZjJfICXxJwgTPTH/wyFAYHEqlhttu
         FuGm7sc4MkxLhj/fUDAFAPbwQMLfEEnZDRofI/PC+jCfCsO62vIMCQi4fKnGofN4c1Vw
         0VE5CjEc6/h8BJI82bIrunv8c0JCyCZNB72XqjjVI/hzpOLma3a+94OCROr92xed2qOM
         pjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706634586; x=1707239386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3gUAiVWxsdrX9MXtJSqjLmwRv/f/RgRmiC76ruk/jsk=;
        b=oT+j4HG841TOgxWLWSxRp7K/4mmy0aJ24kif1giV1gwdj8O45EWpzsxyEeWYyiZBsq
         7ZfkFae/KIPdDA+WR4+b89WHGmEKsCu+K9+cKlmSnDyXRenxn4t675KqefMkQgSwctbX
         3iROeGjE7RYYWWIublihy2Ti1zF6Rcsa5EnbbrlgUwVAyYj43WP6CDwz7kuRDBfzrQI8
         XeSJM/gpfh0pfNY/DYwiEe6iIefK/asSPSgRBDmoZLRzIFo4DONnhIzmeyM/N/yNWno9
         b+/qJ+beYWOfdzYO0TOGwrNLruvZxxTloTKPPYm1nDj+LKTLyHEZ//njtR/Uw/mhIm3W
         cqkg==
X-Gm-Message-State: AOJu0Yw/b/KTxYICVnOTtfnCluprdhc6oNAHRO7m3ozIopa/l8Or8RTg
	NNOr1kVnCIgXxwqcOzvamhvOil/Jbw145f7ckMPaprcSbrI9EDJ5IDv8Mtk8teSKSELaeVocb6E
	nBSYO3UK9NzpZZdkR9Q==
X-Google-Smtp-Source: AGHT+IGSAt/cicvuYR+6VzSMEHyc1YMNmMpNIIn+3acHabrN/cjKOm187soaitREtOeSDbJEryRDFwsxRAXg741d
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a05:6902:e05:b0:dc6:207d:7797 with SMTP
 id df5-20020a0569020e0500b00dc6207d7797mr458648ybb.3.1706634586391; Tue, 30
 Jan 2024 09:09:46 -0800 (PST)
Date: Tue, 30 Jan 2024 17:09:44 +0000
In-Reply-To: <2024012948-hungry-tibia-5345@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240129224204.1812062-1-souravpanda@google.com>
 <20240129224204.1812062-2-souravpanda@google.com> <2024012948-hungry-tibia-5345@gregkh>
Message-ID: <ZbktWLMYBqNVfFZc@google.com>
Subject: Re: [PATCH v7 1/1] mm: report per-page metadata information
From: Yosry Ahmed <yosryahmed@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sourav Panda <souravpanda@google.com>, corbet@lwn.net, rafael@kernel.org, 
	akpm@linux-foundation.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, tomas.mudrunka@gmail.com, 
	bhelgaas@google.com, ivan@cloudflare.com, pasha.tatashin@soleen.com, 
	hannes@cmpxchg.org, shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 29, 2024 at 02:52:23PM -0800, Greg KH wrote:
> On Mon, Jan 29, 2024 at 02:42:04PM -0800, Sourav Panda wrote:
> > Adds two new per-node fields, namely nr_page_metadata and
> > nr_page_metadata_boot, to /sys/devices/system/node/nodeN/vmstat
> > and a global PageMetadata field to /proc/meminfo. This information can
> > be used by users to see how much memory is being used by per-page
> > metadata, which can vary depending on build configuration, machine
> > architecture, and system use.
> > 
> > Per-page metadata is the amount of memory that Linux needs in order to
> > manage memory at the page granularity. The majority of such memory is
> > used by "struct page" and "page_ext" data structures. In contrast to
> > most other memory consumption statistics, per-page metadata might not
> > be included in MemTotal. For example, MemTotal does not include memblock
> > allocations but includes buddy allocations. In this patch, exported
> > field nr_page_metadata in /sys/devices/system/node/nodeN/vmstat would
> > exclusively track buddy allocations while nr_page_metadata_boot would
> > exclusively track memblock allocations. Furthermore, PageMetadata in
> > /proc/meminfo would exclusively track buddy allocations allowing it to
> > be compared against MemTotal.
> > 
> > This memory depends on build configurations, machine architectures, and
> > the way system is used:
> > 
> > Build configuration may include extra fields into "struct page",
> > and enable / disable "page_ext"
> > Machine architecture defines base page sizes. For example 4K x86,
> > 8K SPARC, 64K ARM64 (optionally), etc. The per-page metadata
> > overhead is smaller on machines with larger page sizes.
> > System use can change per-page overhead by using vmemmap
> > optimizations with hugetlb pages, and emulated pmem devdax pages.
> > Also, boot parameters can determine whether page_ext is needed
> > to be allocated. This memory can be part of MemTotal or be outside
> > MemTotal depending on whether the memory was hot-plugged, booted with,
> > or hugetlb memory was returned back to the system.
> > 
> > Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Signed-off-by: Sourav Panda <souravpanda@google.com>
> > ---
> >  Documentation/filesystems/proc.rst |  3 +++
> >  fs/proc/meminfo.c                  |  4 ++++
> >  include/linux/mmzone.h             |  4 ++++
> >  include/linux/vmstat.h             |  4 ++++
> >  mm/hugetlb_vmemmap.c               | 19 ++++++++++++++----
> >  mm/mm_init.c                       |  3 +++
> >  mm/page_alloc.c                    |  1 +
> >  mm/page_ext.c                      | 32 +++++++++++++++++++++---------
> >  mm/sparse-vmemmap.c                |  8 ++++++++
> >  mm/sparse.c                        |  7 ++++++-
> >  mm/vmstat.c                        | 26 +++++++++++++++++++++++-
> >  11 files changed, 96 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> > index 49ef12df631b..d5901d04e082 100644
> > --- a/Documentation/filesystems/proc.rst
> > +++ b/Documentation/filesystems/proc.rst
> > @@ -993,6 +993,7 @@ Example output. You may not have all of these fields.
> >      AnonPages:       4654780 kB
> >      Mapped:           266244 kB
> >      Shmem:              9976 kB
> > +    PageMetadata:     513419 kB
> >      KReclaimable:     517708 kB
> >      Slab:             660044 kB
> >      SReclaimable:     517708 kB
> 
> Why are you adding it to the middle of the file?  Are you sure the
> userspace tools that parse this file today can handle an unknown field
> here, and not just at the end of the file?

FWIW, looking at git blame for fs/proc/meminfo.c, it seems like people
have generally been adding items where it makes sense semantically, not
at the end of the file. So maybe that's okay for userspace tools.

