Return-Path: <linux-doc+bounces-44564-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6FA9F4E2
	for <lists+linux-doc@lfdr.de>; Mon, 28 Apr 2025 17:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63823BF0A8
	for <lists+linux-doc@lfdr.de>; Mon, 28 Apr 2025 15:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF42279911;
	Mon, 28 Apr 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="egn/Ijrn"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D203145FE0
	for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855148; cv=none; b=Xw75xcWtrW7lCgWZ5JcZKk+kl7qHwbV1Xkq7P8s78zz5D+gBMXi9Dj/8sfkvqIthYscIZhISFl4j+Zkwg3rdpApGgH/NCmZVTcQkvV7RcBJPOyFQpb6g+qFI3yRuTQiUrgynQb8JAxSY21NiBrfW9NoD9d0DSWet26HHSxTHAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855148; c=relaxed/simple;
	bh=UOhzb10991S9XN+3taEGso7/UZgUlO2UjrD9ZO6lDo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJYBIAc4cRUyz3I9dhTN/NaubrsTJzTRi1WfiryfdI5kaLbqQwkCsGnOUmvQAVcpcizMayyOw+6gbnFTAS9AGX88/vUeQKD7I6sfMfBF8pPnSmCcT+mvZhdgv9GOUew9lLsYNOzXSUxsZNndlP3QWWzD2ToBFw+CrDvNIDVXmkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=egn/Ijrn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745855145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYC5lCzUJr828076fhqqA1lyRrr2Ujsiu+eNA9UjptU=;
	b=egn/IjrnAeRCVstVWK5mtLCFQadoxilFa9KqsmVjrL88upbohuLfsY8eomtrI1hsvRA1xh
	D4Qvqzc1eD1o+Rs09/GMR22DLPomc6Dn7zh9u1Pri7D/PaIpOi+wRsfNo3+e5obVP5+Bfu
	WUbm+F8BWzdrpnLJESaE6h9ENf2GL+s=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-Th6VKXVBP8-YnXHxfpcuGw-1; Mon, 28 Apr 2025 11:45:43 -0400
X-MC-Unique: Th6VKXVBP8-YnXHxfpcuGw-1
X-Mimecast-MFC-AGG-ID: Th6VKXVBP8-YnXHxfpcuGw_1745855142
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7071dd5dbc1so63771237b3.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 08:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855142; x=1746459942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYC5lCzUJr828076fhqqA1lyRrr2Ujsiu+eNA9UjptU=;
        b=cI3KQdm8s0Cs3fACzraz8gJYfTV9nsbbu7Bl8pCgJBx72LgGbh7cELgv/nDIQhFBdf
         Xn9auGBQ5QX3KBuCaRCeTidjnV+KoGJ+zvqDCCUQw48ExV4wT1BYbkzofoSCo0CqVssm
         +2c7QkSv8+fqOmK7y3XrUmd9OAUXxPHM9MFYcEu7h2YeYbbHLkmokGZRd3GAAPzi4pGK
         D9FcQsjYiUfwsm4tJKQ7KirevcQwQ7OrlHlwp9DCRhOr0JHj8MyRtaleqBt2touLskJY
         BfqO5k88IzSd+F7viNMdYw9lNMM7IIuhsFGGrHRs7YVb29A3mYCYkva7KG0ddL54lf+C
         EhQA==
X-Forwarded-Encrypted: i=1; AJvYcCUcYWJl3yuyqA7h08I+7gfKn2il3g+bJM6bjK3QTIBdVA5gr8J20PJ3THUwEtJle3yuBhtZMktz4qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCAV3/5ODp6xSBNuUO8zEvGSm8Lr6ecTcOGcc9M7VxcmvWcPv
	23uvRVSeG9XoebBleUF3cEDcIN40lT4yGSp/vfktrkmLRXkb9AP38YdQafQpUcem9IZ5m2Slk66
	SzDCBxBI50ZK9NXsoz5qwUU0TSzZfj1xOs6zefAmH9VlKh1UgUmhPs3ZgJfpXrv/jXh+n65hjL9
	4eu6jGUVOePndsWK9DHotx7YLEXNwNAfoY
X-Gm-Gg: ASbGncssbU/JXT+1Qu9dsW8hCniJK2ehzCGMwBvuI8JwDEmdr2HyP3jqAyrfP0Dxnml
	Ga/Hn029KXhqU09Rw0Z+XRCKQ4lvVbxQLL5wMxk3rXxyrRZvB8Zxtl9gExZKTyU2N1u55x5zR82
	tNLTCRLMo=
X-Received: by 2002:a05:690c:67c3:b0:700:a61d:a2f1 with SMTP id 00721157ae682-708540d9052mr161521837b3.7.1745855142288;
        Mon, 28 Apr 2025 08:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFGFih3ozZEKsj4xm/6JhtLUCRC/M6E+ETCg/hOWn66Licdp+qRA1ykpxrKLnhfUjlB4pAeRTiinQgQqPRcl0=
X-Received: by 2002:a05:690c:67c3:b0:700:a61d:a2f1 with SMTP id
 00721157ae682-708540d9052mr161521327b3.7.1745855141849; Mon, 28 Apr 2025
 08:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417000238.74567-1-npache@redhat.com> <20250417000238.74567-12-npache@redhat.com>
 <30180bde-d813-40dd-83f4-0cc04daf6df6@linux.alibaba.com>
In-Reply-To: <30180bde-d813-40dd-83f4-0cc04daf6df6@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 28 Apr 2025 09:45:14 -0600
X-Gm-Features: ATxdqUFKz94UIef8hpmrNssfBw-E2fCsLaNro0qnCT1DayYdhi5zln_WMT_m0JA
Message-ID: <CAA1CXcAJfMimBBa+2TrhvBoubsLiCsmZWRLjWt1KK69Tu1BLTw@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] khugepaged: add per-order mTHP khugepaged stats
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, ryan.roberts@arm.com, willy@infradead.org, 
	peterx@redhat.com, ziy@nvidia.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 1:58=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/17 08:02, Nico Pache wrote:
> > With mTHP support inplace, let add the per-order mTHP stats for
> > exceeding NONE, SWAP, and SHARED.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   include/linux/huge_mm.h |  3 +++
> >   mm/huge_memory.c        |  7 +++++++
> >   mm/khugepaged.c         | 16 +++++++++++++---
> >   3 files changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 55b242335420..782d3a7854b4 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -139,6 +139,9 @@ enum mthp_stat_item {
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
> > index 7798c9284533..de4704af0022 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -633,6 +633,10 @@ DEFINE_MTHP_STAT_ATTR(split_failed, MTHP_STAT_SPLI=
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
> > @@ -649,6 +653,9 @@ static struct attribute *anon_stats_attrs[] =3D {
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
> > index 67da0950b833..38643a681ba5 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -604,7 +604,10 @@ static int __collapse_huge_page_isolate(struct vm_=
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
> >                               goto out;
> >                       }
> >               }
> > @@ -633,8 +636,14 @@ static int __collapse_huge_page_isolate(struct vm_=
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
> > +
> > +                     if (cc->is_khugepaged &&
> > +                             shared > khugepaged_max_ptes_shared) {
> >                               result =3D SCAN_EXCEED_SHARED_PTE;
> >                               count_vm_event(THP_SCAN_EXCEED_SHARED_PTE=
);
> >                               goto out;
> > @@ -1060,6 +1069,7 @@ static int __collapse_huge_page_swapin(struct mm_=
struct *mm,
> >
> >               /* Dont swapin for mTHP collapse */
> >               if (order !=3D HPAGE_PMD_ORDER) {
> > +                     count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_=
SHARED);
>
> Should be MTHP_STAT_COLLAPSE_EXCEED_SWAP?
Yes! Thank you, I will fix this :)
>
> >                       result =3D SCAN_EXCEED_SWAP_PTE;
> >                       goto out;
> >               }
>


