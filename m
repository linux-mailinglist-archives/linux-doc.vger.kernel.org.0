Return-Path: <linux-doc+bounces-12323-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6B587FF90
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 15:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FC35B22829
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 14:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660DC81AC6;
	Tue, 19 Mar 2024 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ZsdNFS5C"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46781AAF
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710858370; cv=none; b=rf5VfzWFQ8rQ9deKROnoilFxfxV+uUdmrIYVOj/GT78V7fN6Q93/cNBZoAxnVbVhpUDzvYryXFHFAZr3b0kaN86dFfzENCQGjP0JYTwJizmH+mbGQa0OgpShAAPq2Pu+XrXDyKkQpDh3QcapPW7oDLJ/x68xdAz0wSAzv9quHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710858370; c=relaxed/simple;
	bh=/ai7rsRCGQJwbmMN9+0MqsXjffyEnlQWeJfS3vA+etg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByJRSQ2tnxFHy0vw7rhNLOL304KXnsU20PmL+fFR5Qs1mWZ1pgRMENFdACK6n4h3WuWoNQ/NU8GTZPFMWjJph1iKd5KCSx06E51uXe+5ESleSmYnDgUlM91zXM2To5yA6t9h9+CA8SQpm3zox3MKmsj5S31MdxAHMrzIecktEoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ZsdNFS5C; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-430b7b22b17so25246981cf.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1710858367; x=1711463167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ai7rsRCGQJwbmMN9+0MqsXjffyEnlQWeJfS3vA+etg=;
        b=ZsdNFS5CLyanYiKD/6naRKyWF4Gbq8HpwvdVEw9eYRwZda4V7tEQGBWn/s/rEhB/D2
         aEQOUclwi9HR0MWvHnH8A/qVKgak0BidZvvaHTm1tSnBi+6RWQX9HuMZ9pHaVfgNXY29
         /NKJrUKNWPMdE5ii1+3913bG1SNGZ51Ezo1j0d71fmxhEMLo0YUMn6ogQM7QGe5UAzJy
         qWrj9V8UapEswmU28CIJNmWdY8eModaKriQIx9MB6EEXgOGpbhp9bgtr77DQWa/xPhmU
         mwcOYKvdlXZ8eMa0U6nRdvln4jaDxsaVwEyMcuuZk0LlLIkRsvukTMiS/gPrVUO1ewcE
         Znfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710858367; x=1711463167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ai7rsRCGQJwbmMN9+0MqsXjffyEnlQWeJfS3vA+etg=;
        b=Hgw2/keL/6nO/J4jkzCUhnq62IP2s6zFWaCndulLd1ODJd7D8xfrIUUJHSZ2GiPuDW
         GoXpyfL7PUb/IMH8xukgazW9Z00gGOi+G34EJMe0x0pO80/UDkXw5z0Fov8R4+QaW4H4
         VRj1hf0fWWP3xUgh/J0o7YCaOQtCkILj1LHmc+g5ElHRHb9BiALyOdeqvJaa1Bvs8wOi
         qiOmtiXaU2kMJeDo2vKsjcCKiDNawGo4a7P9Yl48Qr8SjVDRXMP4GW+9LhpfmBBowqdp
         AS7QJ3SNLUE8XR3ZR2b7tqaZOZ7FTmf51eRM9b+PurnphBYRCMS9VnVZ8dPoo82Dveo7
         eqzw==
X-Forwarded-Encrypted: i=1; AJvYcCVq2Jwmiv5mzM0XX2upXVybFHkq6v56HGIOeLJIe3eQyWnxRLnGxfiCVLDs31mHFkk83B3FUbgZrMRybcpvL4asd8zn2R546WDr
X-Gm-Message-State: AOJu0YxqJY+xhH7h0mSRl0i+E6AQNe1G6jnLFAH5Q115xomPvPSASGU4
	xrjO/qhHA1WH3Yy4eh5bh08pY6SI66ppFw5Ynxx9r/5pPG1nlMBQF6TfnnwqjGMCkm4y36Cb7uS
	cMTaTGyKYS1ILOWQ91FGPw8+z+6gW8tiHqKKFsg==
X-Google-Smtp-Source: AGHT+IFo9PiCBqdDBB0vvJuRxgnxergt1C9KVhjkk/hjChR3zfOYA2+Oj1/6ln63mQWAtnarjsG0RvDWTC/dvSg3Wa4=
X-Received: by 2002:a05:622a:1991:b0:430:ef64:8637 with SMTP id
 u17-20020a05622a199100b00430ef648637mr1164760qtc.15.1710858367665; Tue, 19
 Mar 2024 07:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220214558.3377482-1-souravpanda@google.com>
 <20240220214558.3377482-2-souravpanda@google.com> <CA+CK2bAM4Xe7BT3TFZT-+3qQTFGgkYBiYY=oVkdqMN8gyJg_0g@mail.gmail.com>
In-Reply-To: <CA+CK2bAM4Xe7BT3TFZT-+3qQTFGgkYBiYY=oVkdqMN8gyJg_0g@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 19 Mar 2024 10:25:30 -0400
Message-ID: <CA+CK2bCwi0yU_jX8qKCBMUnTeqoDYc65z7GKd5uEKcpkPAn4MA@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] mm: report per-page metadata information
To: akpm@linux-foundation.org
Cc: Sourav Panda <souravpanda@google.com>, corbet@lwn.net, gregkh@linuxfoundation.org, 
	rafael@kernel.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, tomas.mudrunka@gmail.com, 
	bhelgaas@google.com, ivan@cloudflare.com, yosryahmed@google.com, 
	hannes@cmpxchg.org, shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 6:40=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Tue, Feb 20, 2024 at 4:46=E2=80=AFPM Sourav Panda <souravpanda@google.=
com> wrote:
> >
> > Adds two new per-node fields, namely nr_memmap and nr_memmap_boot,
> > to /sys/devices/system/node/nodeN/vmstat and a global Memmap field
> > to /proc/meminfo. This information can be used by users to see how
> > much memory is being used by per-page metadata, which can vary
> > depending on build configuration, machine architecture, and system
> > use.
> >
> > Per-page metadata is the amount of memory that Linux needs in order to
> > manage memory at the page granularity. The majority of such memory is
> > used by "struct page" and "page_ext" data structures. In contrast to
> > most other memory consumption statistics, per-page metadata might not
> > be included in MemTotal. For example, MemTotal does not include membloc=
k
> > allocations but includes buddy allocations. In this patch, exported
> > field nr_memmap in /sys/devices/system/node/nodeN/vmstat would
> > exclusively track buddy allocations while nr_memmap_boot would
> > exclusively track memblock allocations. Furthermore, Memmap in
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
> > Utility for userspace:
> >
> > Application Optimization: Depending on the kernel version and command
> > line options, the kernel would relinquish a different number of pages
> > (that contain struct pages) when a hugetlb page is reserved (e.g., 0, 6
> > or 7 for a 2MB hugepage). The userspace application would want to know
> > the exact savings achieved through page metadata deallocation without
> > dealing with the intricacies of the kernel.
> >
> > Observability: Struct page overhead can only be calculated on-paper at
> > boot time (e.g., 1.5% machine capacity). Beyond boot once hugepages are
> > reserved or memory is hotplugged, the computation becomes complex.
> > Per-page metrics will help explain part of the system memory overhead,
> > which shall help guide memory optimizations and memory cgroup sizing.
> >
> > Debugging: Tracking the changes or absolute value in struct pages can
> > help detect anomalies as they can be correlated with other metrics in
> > the machine (e.g., memtotal, number of huge pages, etc).
> >
> > page_ext overheads: Some kernel features such as page_owner
> > page_table_check that use page_ext can be optionally enabled via kernel
> > parameters. Having the total per-page metadata information helps users
> > precisely measure impact.

Hi Andrew,

Can you please give this patch another look, does it require more
reviews before you can take it in?

Thank you,
Pasha

