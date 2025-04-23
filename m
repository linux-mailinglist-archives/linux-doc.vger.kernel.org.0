Return-Path: <linux-doc+bounces-43976-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4AA98247
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 10:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DB593A87B1
	for <lists+linux-doc@lfdr.de>; Wed, 23 Apr 2025 08:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422FF27978C;
	Wed, 23 Apr 2025 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPybJl3f"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E1427978B
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745395235; cv=none; b=tbU3ZkuI6vkI+vhNQORqvYb0SMAtdCFnEl0dUw+ZJHWvvRT+gg8Nvi20WMv0Qn/JYdfMw2ZFV84imz/3Iw1jT+MEDuX6kiH+hMUTm4IpuYE6cPz4nekGfxNOnbs+fG5jP/hZe6d6gQgyXcEwzwZg8zmjgvYoQOrKzcK51KVoH0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745395235; c=relaxed/simple;
	bh=CG9gdIK65YymTmQgFg6PHvGy4WTKKFxCr9FsnVLGWZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGOUnOaQ9fxZrkq0Bui7DMxcjidkwuEeZBvchneOXFURpMoypOJmBQhYhei3JZfzK26KvnjVerargq8yZ8Iyk7jYCFmfWX2MPZsQoasBnZb7Hsib3f8GpO0VT3bcW7vF6Biocwzh9S9fmo2cXgFyHmGwmQkD6+Eyx6yiO1eKWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPybJl3f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745395231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq6JJyE1lUcScUvzEi1AKzoi0Ad5IMEJ+LYrlFPu2HM=;
	b=UPybJl3fQgPtw5Yzxtw6ci06OoWOe+3fBnC1uVINQveItLM+D3XsJ4mnQJeCkFJ1JgqAGP
	qjKaUYRmjI7CfY2OXlcwJogqKOOdu7993PvU8PSwipLmGZe+pV83pGXgfZgCLnUybTmgLY
	4j6L/9SjcJB2Koq0JWNoFiqmdHk8J48=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-Vad0wcVVPzGCQHu527QDCg-1; Wed, 23 Apr 2025 04:00:30 -0400
X-MC-Unique: Vad0wcVVPzGCQHu527QDCg-1
X-Mimecast-MFC-AGG-ID: Vad0wcVVPzGCQHu527QDCg_1745395229
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e6dfe7fe81aso8410951276.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 01:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395229; x=1746000029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq6JJyE1lUcScUvzEi1AKzoi0Ad5IMEJ+LYrlFPu2HM=;
        b=YV+m771KY/mQ35gOM0P3/YB0XeTd2X/tQOmVhfZ7yTzTWfTvQ3u5vOt23c6uTpst96
         FjdShF75pJrZ64BP9weBPdm9FT9jSV9PGdcbdVAIsYvNW6Fhlgy0PPU2UbdcAR+FIVow
         oAqc5s6KM/de8V6g1NBA9xiGhoyuOfuk9yHFO8TZUroLjLqA5pEad7FtlRMeT9qm2a3V
         K+Aa7Bswch9p2+ceSIL59W8XoquGKGAw1dvw6YtVpTfu2/ZyMLL/pL4KQn47KzLGGBgp
         JEff4bbgVF0+7G9Qhz8aUkzdu5sethqTDOvQr2zwMgEJkHkHTaEtx58LRUqVWG4LjIgg
         UoWA==
X-Forwarded-Encrypted: i=1; AJvYcCWhAfntdOFa6kMR/6aBqZSTjdA4Y3mVHdq3PB0F/3GoZ4CuYQTySzHDxSURMnArm+irkAPBYJCxz5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuEeu2XfUc6Tsp214nDaHIRdTr8oBAteb5jQjaBxrc+pBmDo0m
	0eTja6SnYbCVAoXozTAP4h4+Z2Oi1HT5R333crKw6dWMYkvuRTIA7zjB90tlzCwsgXzluN+QrP9
	76ydHdJ+PggkdW5pgRz6JBHPFy3F2UJ6WbhPWqTPu412tQFtYmBSq0Z6UpNs1RP4RXgPHc13y3U
	QryIjKA0nxwsD/91Ze4y112yjHCQb/DnI3
X-Gm-Gg: ASbGncvilUzSZoYInTCUXyP0lLzDrw3C2N2wCS8k0BlODYN7ijLPlF3jTq4M7run6zF
	T6QiWKPDihtetPzncF9VcCb4Jqz/ldSgrcDYIWlHv/OmLuryeA+zviv8uw8UTiD2Mw+YUyP719Q
	edI0ehA68=
X-Received: by 2002:a05:6902:2306:b0:e63:eea5:814e with SMTP id 3f1490d57ef6-e7297f18e96mr24243743276.49.1745395229321;
        Wed, 23 Apr 2025 01:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcCTPjpedjmo/EmBXv6tqxaN45OKrfhHIsGnEdaHOpFxJwDplUSiSoY/A69k8zpRkhmzh2clsKJrIlRgmJNzc=
X-Received: by 2002:a05:6902:2306:b0:e63:eea5:814e with SMTP id
 3f1490d57ef6-e7297f18e96mr24243654276.49.1745395228492; Wed, 23 Apr 2025
 01:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417000238.74567-1-npache@redhat.com> <20250417000238.74567-6-npache@redhat.com>
 <e4e4aaae-92be-4cd2-9435-dccad99961bf@linux.alibaba.com>
In-Reply-To: <e4e4aaae-92be-4cd2-9435-dccad99961bf@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 23 Apr 2025 02:00:02 -0600
X-Gm-Features: ATxdqUGNjJmmO8jrL1BN9O1IFvnBok1I_See3e65e9BAIwYYolf-6xO9jl5pg2k
Message-ID: <CAA1CXcBsjAVdu4RWAYJC82Wm3o=OY_Z6iyEu0YNuiC5grG_z-Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] khugepaged: generalize __collapse_huge_page_*
 for mTHP support
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

On Wed, Apr 23, 2025 at 1:30=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/17 08:02, Nico Pache wrote:
> > generalize the order of the __collapse_huge_page_* functions
> > to support future mTHP collapse.
> >
> > mTHP collapse can suffer from incosistant behavior, and memory waste
> > "creep". disable swapin and shared support for mTHP collapse.
> >
> > No functional changes in this patch.
> >
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 46 ++++++++++++++++++++++++++++------------------
> >   1 file changed, 28 insertions(+), 18 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 883e9a46359f..5e9272ab82da 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -565,15 +565,17 @@ static int __collapse_huge_page_isolate(struct vm=
_area_struct *vma,
> >                                       unsigned long address,
> >                                       pte_t *pte,
> >                                       struct collapse_control *cc,
> > -                                     struct list_head *compound_pageli=
st)
> > +                                     struct list_head *compound_pageli=
st,
> > +                                     u8 order)
> >   {
> >       struct page *page =3D NULL;
> >       struct folio *folio =3D NULL;
> >       pte_t *_pte;
> >       int none_or_zero =3D 0, shared =3D 0, result =3D SCAN_FAIL, refer=
enced =3D 0;
> >       bool writable =3D false;
> > +     int scaled_none =3D khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER =
- order);
> >
> > -     for (_pte =3D pte; _pte < pte + HPAGE_PMD_NR;
> > +     for (_pte =3D pte; _pte < pte + (1 << order);
> >            _pte++, address +=3D PAGE_SIZE) {
> >               pte_t pteval =3D ptep_get(_pte);
> >               if (pte_none(pteval) || (pte_present(pteval) &&
> > @@ -581,7 +583,7 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
> >                       ++none_or_zero;
> >                       if (!userfaultfd_armed(vma) &&
> >                           (!cc->is_khugepaged ||
> > -                          none_or_zero <=3D khugepaged_max_ptes_none))=
 {
> > +                          none_or_zero <=3D scaled_none)) {
> >                               continue;
> >                       } else {
> >                               result =3D SCAN_EXCEED_NONE_PTE;
> > @@ -609,8 +611,8 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
> >               /* See hpage_collapse_scan_pmd(). */
> >               if (folio_maybe_mapped_shared(folio)) {
> >                       ++shared;
> > -                     if (cc->is_khugepaged &&
> > -                         shared > khugepaged_max_ptes_shared) {
> > +                     if (order !=3D HPAGE_PMD_ORDER || (cc->is_khugepa=
ged &&
> > +                         shared > khugepaged_max_ptes_shared)) {
> >                               result =3D SCAN_EXCEED_SHARED_PTE;
> >                               count_vm_event(THP_SCAN_EXCEED_SHARED_PTE=
);
> >                               goto out;
> > @@ -711,13 +713,14 @@ static void __collapse_huge_page_copy_succeeded(p=
te_t *pte,
> >                                               struct vm_area_struct *vm=
a,
> >                                               unsigned long address,
> >                                               spinlock_t *ptl,
> > -                                             struct list_head *compoun=
d_pagelist)
> > +                                             struct list_head *compoun=
d_pagelist,
> > +                                             u8 order)
> >   {
> >       struct folio *src, *tmp;
> >       pte_t *_pte;
> >       pte_t pteval;
> >
> > -     for (_pte =3D pte; _pte < pte + HPAGE_PMD_NR;
> > +     for (_pte =3D pte; _pte < pte + (1 << order);
> >            _pte++, address +=3D PAGE_SIZE) {
> >               pteval =3D ptep_get(_pte);
> >               if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
> > @@ -764,7 +767,8 @@ static void __collapse_huge_page_copy_failed(pte_t =
*pte,
> >                                            pmd_t *pmd,
> >                                            pmd_t orig_pmd,
> >                                            struct vm_area_struct *vma,
> > -                                          struct list_head *compound_p=
agelist)
> > +                                          struct list_head *compound_p=
agelist,
> > +                                          u8 order)
> >   {
> >       spinlock_t *pmd_ptl;
> >
> > @@ -781,7 +785,7 @@ static void __collapse_huge_page_copy_failed(pte_t =
*pte,
> >        * Release both raw and compound pages isolated
> >        * in __collapse_huge_page_isolate.
> >        */
> > -     release_pte_pages(pte, pte + HPAGE_PMD_NR, compound_pagelist);
> > +     release_pte_pages(pte, pte + (1 << order), compound_pagelist);
> >   }
> >
> >   /*
> > @@ -802,7 +806,7 @@ static void __collapse_huge_page_copy_failed(pte_t =
*pte,
> >   static int __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
> >               pmd_t *pmd, pmd_t orig_pmd, struct vm_area_struct *vma,
> >               unsigned long address, spinlock_t *ptl,
> > -             struct list_head *compound_pagelist)
> > +             struct list_head *compound_pagelist, u8 order)
> >   {
> >       unsigned int i;
> >       int result =3D SCAN_SUCCEED;
> > @@ -810,7 +814,7 @@ static int __collapse_huge_page_copy(pte_t *pte, st=
ruct folio *folio,
> >       /*
> >        * Copying pages' contents is subject to memory poison at any ite=
ration.
> >        */
> > -     for (i =3D 0; i < HPAGE_PMD_NR; i++) {
> > +     for (i =3D 0; i < (1 << order); i++) {
> >               pte_t pteval =3D ptep_get(pte + i);
> >               struct page *page =3D folio_page(folio, i);
> >               unsigned long src_addr =3D address + i * PAGE_SIZE;
> > @@ -829,10 +833,10 @@ static int __collapse_huge_page_copy(pte_t *pte, =
struct folio *folio,
> >
> >       if (likely(result =3D=3D SCAN_SUCCEED))
> >               __collapse_huge_page_copy_succeeded(pte, vma, address, pt=
l,
> > -                                                 compound_pagelist);
> > +                                                 compound_pagelist, or=
der);
> >       else
> >               __collapse_huge_page_copy_failed(pte, pmd, orig_pmd, vma,
> > -                                              compound_pagelist);
> > +                                              compound_pagelist, order=
);
> >
> >       return result;
> >   }
> > @@ -1000,11 +1004,11 @@ static int check_pmd_still_valid(struct mm_stru=
ct *mm,
> >   static int __collapse_huge_page_swapin(struct mm_struct *mm,
> >                                      struct vm_area_struct *vma,
> >                                      unsigned long haddr, pmd_t *pmd,
> > -                                    int referenced)
> > +                                    int referenced, u8 order)
> >   {
> >       int swapped_in =3D 0;
> >       vm_fault_t ret =3D 0;
> > -     unsigned long address, end =3D haddr + (HPAGE_PMD_NR * PAGE_SIZE)=
;
> > +     unsigned long address, end =3D haddr + (PAGE_SIZE << order);
> >       int result;
> >       pte_t *pte =3D NULL;
> >       spinlock_t *ptl;
> > @@ -1035,6 +1039,12 @@ static int __collapse_huge_page_swapin(struct mm=
_struct *mm,
> >               if (!is_swap_pte(vmf.orig_pte))
> >                       continue;
> >
> > +             /* Dont swapin for mTHP collapse */
> > +             if (order !=3D HPAGE_PMD_ORDER) {
> > +                     result =3D SCAN_EXCEED_SWAP_PTE;
> > +                     goto out;
> > +             }
>
> IMO, this check should move into hpage_collapse_scan_pmd(), that means
> if we scan the swap ptes for mTHP collapse, then we can return
> 'SCAN_EXCEED_SWAP_PTE' to abort the collapse earlier.
I dont think this is correct. We currently abort if the global
max_swap_ptes or max_shared_ptes is exceeded during the PMD scan.
However if those pass (and we dont collapse at the PMD level), we will
continue to mTHP collapses. Then during the isolate function we check
for shared ptes in this specific mTHP range and abort if there's a
shared ptes. For swap we only know that some pages in the PMD are
unmapped, but we arent sure which, so we have to try and fault the
PTEs, and if it's a swap pte, and we are on mTHP collapse, we abort
the collapse attempt. So having swap/shared PTEs in the PMD scan, does
not indicate that ALL mTHP collapses will fail, but some will.

This may make more sense as you continue to review the series!

>
> The logic is the same as how you handle the shared ptes for mTHP.>
> >               vmf.pte =3D pte;
> >               vmf.ptl =3D ptl;
> >               ret =3D do_swap_page(&vmf);
> > @@ -1154,7 +1164,7 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
> >                * that case.  Continuing to collapse causes inconsistenc=
y.
> >                */
> >               result =3D __collapse_huge_page_swapin(mm, vma, address, =
pmd,
> > -                                                  referenced);
> > +                             referenced, HPAGE_PMD_ORDER);
> >               if (result !=3D SCAN_SUCCEED)
> >                       goto out_nolock;
> >       }
> > @@ -1201,7 +1211,7 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
> >       pte =3D pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
> >       if (pte) {
> >               result =3D __collapse_huge_page_isolate(vma, address, pte=
, cc,
> > -                                                   &compound_pagelist)=
;
> > +                                     &compound_pagelist, HPAGE_PMD_ORD=
ER);
> >               spin_unlock(pte_ptl);
> >       } else {
> >               result =3D SCAN_PMD_NULL;
> > @@ -1231,7 +1241,7 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
> >
> >       result =3D __collapse_huge_page_copy(pte, folio, pmd, _pmd,
> >                                          vma, address, pte_ptl,
> > -                                        &compound_pagelist);
> > +                                        &compound_pagelist, HPAGE_PMD_=
ORDER);
> >       pte_unmap(pte);
> >       if (unlikely(result !=3D SCAN_SUCCEED))
> >               goto out_up_write;
>


