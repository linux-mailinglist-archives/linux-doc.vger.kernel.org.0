Return-Path: <linux-doc+bounces-53495-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0BB0AB3B
	for <lists+linux-doc@lfdr.de>; Fri, 18 Jul 2025 23:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57D387ADFE5
	for <lists+linux-doc@lfdr.de>; Fri, 18 Jul 2025 20:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2183D21CA1C;
	Fri, 18 Jul 2025 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TFtgiq+Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E3820C00C
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 21:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752872459; cv=none; b=crjO4n1g9czJT6osle2w6bcQF1CPRb9N0ZAUQ5wPJeQDIf61RzmgBmdnugErEkcKPrxEM/dyI1IXrpMnQ0C8mD0U6wwizNy/ZtkbmLnKcKQx619ZQLTf6kVxeiEFr1eqM+ofS9YcxLBBo967HslaYukNofRRBh2Q6MISA4saCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752872459; c=relaxed/simple;
	bh=ItX9nLm0rKHfLSwYPt3aRk0stdgRo5qgnqLw2DNuo5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQpe1KFE0PZvnej1C21sI4NUUWfZ+FyTyUb47motFdIl/1bZOzp3opwqsGVQURjpyt4mI8W5LiRNUhSbLVZ6HN4emLYhCx1aMgOB9W+grTEEm8CDDXYlYbQaB6I3gmBah+gpiOTaY6WVT08U+tIdPz1XIkOKbagcrlF97uKi4l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TFtgiq+Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752872456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XswQuaaE2754OlYhBT3pS/FTBtUgeNS0s3HKHNzAPSU=;
	b=TFtgiq+YL6mW/eydQpVoTwcU81rJpy/vqTKGzboSV1EDWVgzoMhlalaeh448dbhHv6Kod4
	eLX50gK5+XhB7usHUGhDs2uWPBQVaEMAjR4SVzQwgIIH1eZMzJMUx3nUc8bRHaX7FBMZSA
	0REm+u3/PtidRzhHeUmSanPRhFW4bMw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-ZjrX5XDHNn-6L372EkMyBg-1; Fri, 18 Jul 2025 17:00:54 -0400
X-MC-Unique: ZjrX5XDHNn-6L372EkMyBg-1
X-Mimecast-MFC-AGG-ID: ZjrX5XDHNn-6L372EkMyBg_1752872452
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e86a2a1b8so37530117b3.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 14:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752872452; x=1753477252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XswQuaaE2754OlYhBT3pS/FTBtUgeNS0s3HKHNzAPSU=;
        b=JN0dfcKFZC+Sur3U6FgyJU0yg0g3Ge+TG1s9z7plrxmzRDSN46fe8nAXvP/gnqUEYa
         xItLDkoG5oJn4WKVfbrVj7EcoUU0jenSxKtsl/YT9gNqYqTu+7ABBPL3+2SEMetyLo03
         X77nQfZictfikU0tF6b6786yhrKBMqmRDBqJVkfEelcasgA2JvChzrmyfxDLv6RMwK2Q
         mywqMduvifJNxq+HSdXZqvRE66SkuH8sc+fq1y5T9G+cQKZnOo7hLy6xboqCfLHMlRzz
         +GhNhrQ+O1hp5spvFSCgGBe3LPp31SDnnhnXswgQleRRM14nnprPKY3ChoB6otsX3W+h
         MzIA==
X-Forwarded-Encrypted: i=1; AJvYcCVbecGNq+wq1v6/iDcd/C3Ek5ce44z8mYJjaavQbIowBnb3mos1u9jgc2RTnVjjHfxgPUdF71iUh0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX3dJ5pNwi5LjgjiEjyYRc5ayK98uXVx2GYpxzVjxOTV9QxAs9
	n9bLHaFZUTIpCn5GJKrmlkZgkrrNxm4RSyFSid2GjtT9gd+MBb323/L06jNzVlKMTXkkiM/sO1l
	RnFxAHasG2nf0DKL9Kw4GrobIG3b44LHTGxltADLNkz5ZoTfLtc9qq98HDOLtYFD5KTbhawWwTC
	H0WGHptG1AS9i16+mnk8XYojyRcriE6jVJI+C1
X-Gm-Gg: ASbGncsNcwhuk3G+NL0oX6rwohS/ToN/zcfekkO/Xxs5zWLub/hepwJjofGK6sWodtV
	/ZGCU5t3T4giahojC3lhLHqCemz9QePcxpHQe3QJVMbkMZtbZhcCQm7TeQJ8kINNB4l7etYSqLh
	iprcMnSgsHE0OWt0kGonEbQvM=
X-Received: by 2002:a05:690c:3703:b0:70c:a854:8384 with SMTP id 00721157ae682-719521a381cmr41623607b3.11.1752872452185;
        Fri, 18 Jul 2025 14:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbt85bf5Kp+dxoJKo0BjW8mtOr2VJ49x22KnfNGF3rtqH8j5TzQacIXdf97YAgrjTlUoNcqs6kDMtwdOrWCrU=
X-Received: by 2002:a05:690c:3703:b0:70c:a854:8384 with SMTP id
 00721157ae682-719521a381cmr41623077b3.11.1752872451784; Fri, 18 Jul 2025
 14:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714003207.113275-1-npache@redhat.com> <20250714003207.113275-14-npache@redhat.com>
 <94c8899a-f116-4b6a-94d3-f8295ee3f535@linux.alibaba.com>
In-Reply-To: <94c8899a-f116-4b6a-94d3-f8295ee3f535@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 18 Jul 2025 15:00:25 -0600
X-Gm-Features: Ac12FXyZkvpO72Y8KuApMa6zkujq0hEtG4p8bsgfkYpSM3DyaV_34-FVHPb5UAY
Message-ID: <CAA1CXcDQeiMjVhxVjnCvBuTQLSBQh0ea7FJXg52ebNFDHfXm1g@mail.gmail.com>
Subject: Re: [PATCH v9 13/14] khugepaged: add per-order mTHP khugepaged stats
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 11:05=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/7/14 08:32, Nico Pache wrote:
> > With mTHP support inplace, let add the per-order mTHP stats for
> > exceeding NONE, SWAP, and SHARED.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   Documentation/admin-guide/mm/transhuge.rst | 17 +++++++++++++++++
> >   include/linux/huge_mm.h                    |  3 +++
> >   mm/huge_memory.c                           |  7 +++++++
> >   mm/khugepaged.c                            | 15 ++++++++++++---
> >   4 files changed, 39 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation=
/admin-guide/mm/transhuge.rst
> > index 2c523dce6bc7..28c8af61efba 100644
> > --- a/Documentation/admin-guide/mm/transhuge.rst
> > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > @@ -658,6 +658,23 @@ nr_anon_partially_mapped
> >          an anonymous THP as "partially mapped" and count it here, even=
 though it
> >          is not actually partially mapped anymore.
> >
> > +collapse_exceed_swap_pte
> > +       The number of anonymous THP which contain at least one swap PTE=
.
> > +       Currently khugepaged does not support collapsing mTHP regions t=
hat
> > +       contain a swap PTE.
> > +
> > +collapse_exceed_none_pte
> > +       The number of anonymous THP which have exceeded the none PTE th=
reshold.
> > +       With mTHP collapse, a bitmap is used to gather the state of a P=
MD region
> > +       and is then recursively checked from largest to smallest order =
against
> > +       the scaled max_ptes_none count. This counter indicates that the=
 next
> > +       enabled order will be checked.
> > +
> > +collapse_exceed_shared_pte
> > +       The number of anonymous THP which contain at least one shared P=
TE.
> > +       Currently khugepaged does not support collapsing mTHP regions t=
hat
> > +       contain a shared PTE.
> > +
> >   As the system ages, allocating huge pages may be expensive as the
> >   system uses memory compaction to copy data around memory to free a
> >   huge page for use. There are some counters in ``/proc/vmstat`` to hel=
p
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 4042078e8cc9..e0a27f80f390 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -141,6 +141,9 @@ enum mthp_stat_item {
> >       MTHP_STAT_SPLIT_DEFERRED,
> >       MTHP_STAT_NR_ANON,
> >       MTHP_STAT_NR_ANON_PARTIALLY_MAPPED,
> > +     MTHP_STAT_COLLAPSE_EXCEED_SWAP,
> > +     MTHP_STAT_COLLAPSE_EXCEED_NONE,
> > +     MTHP_STAT_COLLAPSE_EXCEED_SHARED,
> >       __MTHP_STAT_COUNT
> >   };
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index e2ed9493df77..57e5699cf638 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -632,6 +632,10 @@ DEFINE_MTHP_STAT_ATTR(split_failed, MTHP_STAT_SPLI=
T_FAILED);
> >   DEFINE_MTHP_STAT_ATTR(split_deferred, MTHP_STAT_SPLIT_DEFERRED);
> >   DEFINE_MTHP_STAT_ATTR(nr_anon, MTHP_STAT_NR_ANON);
> >   DEFINE_MTHP_STAT_ATTR(nr_anon_partially_mapped, MTHP_STAT_NR_ANON_PAR=
TIALLY_MAPPED);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_swap_pte, MTHP_STAT_COLLAPSE_EXC=
EED_SWAP);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_none_pte, MTHP_STAT_COLLAPSE_EXC=
EED_NONE);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_shared_pte, MTHP_STAT_COLLAPSE_E=
XCEED_SHARED);
> > +
> >
> >   static struct attribute *anon_stats_attrs[] =3D {
> >       &anon_fault_alloc_attr.attr,
> > @@ -648,6 +652,9 @@ static struct attribute *anon_stats_attrs[] =3D {
> >       &split_deferred_attr.attr,
> >       &nr_anon_attr.attr,
> >       &nr_anon_partially_mapped_attr.attr,
> > +     &collapse_exceed_swap_pte_attr.attr,
> > +     &collapse_exceed_none_pte_attr.attr,
> > +     &collapse_exceed_shared_pte_attr.attr,
> >       NULL,
> >   };
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index d0c99b86b304..8a5873d0a23a 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -594,7 +594,10 @@ static int __collapse_huge_page_isolate(struct vm_=
area_struct *vma,
> >                               continue;
> >                       } else {
> >                               result =3D SCAN_EXCEED_NONE_PTE;
> > -                             count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
> > +                             if (order =3D=3D HPAGE_PMD_ORDER)
> > +                                     count_vm_event(THP_SCAN_EXCEED_NO=
NE_PTE);
> > +                             else
> > +                                     count_mthp_stat(order, MTHP_STAT_=
COLLAPSE_EXCEED_NONE);
>
> Please follow the same logic as other mTHP statistics, meaning there is
> no need to filter out PMD-sized orders, because mTHP also supports
> PMD-sized orders. So logic should be:
>
> if (order =3D=3D HPAGE_PMD_ORDER)
>         count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>
> count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_NONE);
Good point-- I will fix that!
>
> >                               goto out;
> >                       }
> >               }
> > @@ -623,8 +626,14 @@ static int __collapse_huge_page_isolate(struct vm_=
area_struct *vma,
> >               /* See khugepaged_scan_pmd(). */
> >               if (folio_maybe_mapped_shared(folio)) {
> >                       ++shared;
> > -                     if (order !=3D HPAGE_PMD_ORDER || (cc->is_khugepa=
ged &&
> > -                         shared > khugepaged_max_ptes_shared)) {
> > +                     if (order !=3D HPAGE_PMD_ORDER) {
> > +                             result =3D SCAN_EXCEED_SHARED_PTE;
> > +                             count_mthp_stat(order, MTHP_STAT_COLLAPSE=
_EXCEED_SHARED);
> > +                             goto out;
> > +                     }
>
> Ditto.
Thanks!

There is also the SWAP one, which is slightly different as it is
calculated during the scan phase, and in the mTHP case in the swapin
faulting code. Not sure if during the scan phase we should also
increment the counter for the PMD order... or just leave it as a
general vm_event counter since it's not attributed to an order during
scan. I believe the latter is the correct approach and only attribute
an order to it in the __collapse_huge_page_swapin function if its mTHP
collapses.
>
> > +
> > +                     if (cc->is_khugepaged &&
> > +                             shared > khugepaged_max_ptes_shared) {
> >                               result =3D SCAN_EXCEED_SHARED_PTE;
> >                               count_vm_event(THP_SCAN_EXCEED_SHARED_PTE=
);
> >                               goto out;
>


