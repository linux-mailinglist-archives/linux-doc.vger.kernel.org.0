Return-Path: <linux-doc+bounces-45115-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605EAA75FE
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 17:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5249E1AD3
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 15:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E952571D8;
	Fri,  2 May 2025 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f4P6mFxV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3C17A2ED
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199621; cv=none; b=R6yVzp543fkSDaAD/z/SHAv2vBn3O418nfIweBF6U1lixTEbjSQhxo977+FuBOdOadZ7BvdO7epbf4z9jx5DvFFU3AjbUwFY7JB8HLtllJZyxBj4koAL3CyorUlkKn9Gz0F2w0SCt0XfZOSQrZCWRbmjLCkoKSxCoZifRD86kRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199621; c=relaxed/simple;
	bh=hLW15ayYi6SnXVYov9TgVyvpQxM/q5FOvyu0WDhrQvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z48Fd+UMNOQEYqJ86TV/jv3/AhlyKUu7lYhsiF3Vi6DOsDpMLkmnsrEoo1ej4NlF0K3HwgEa27Khja+TNdvza9pzthu1UGPTFZCWZgiSIS+zLmIOpyfIBTW0TX+w6W1BrpDtSrBM9Z0/nG1BehFqLd+uEEZHbnsGAADOg2weFWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f4P6mFxV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so11315a12.0
        for <linux-doc@vger.kernel.org>; Fri, 02 May 2025 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746199616; x=1746804416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHb0ZzxGlBB6NHKFNbHGJJeCMu/az8eLbQ7nlZew+9Q=;
        b=f4P6mFxVUCALGSynr+aNUPbDuMhkmccdcmoX0DeaDsvxzPMZ50u2Kxw06RCJwvxQRi
         5PtMUsQr1rc9wxtxCZzem27Wk7jodhAqIXv96kgom4t8dTFKzf7knl2XHJoo/rIiqGju
         gjzeSyEmmdAe6Dx00TMW8vt9X+gzENg8Wggi/StrHKobLeRZW+yoG9VTf9YkrPTMwMRw
         oVd2FUlfI+qTv+IpiCMny2j2iPKDjsRltS8jLFeVBmr9dFO39m3Hmqppt1sjFqXeRXWb
         x/I7ZT6aJMwbzc+pw8PcWy+5A/sGRW5yjmBbatSwqP/MZmSuG0PZbhzMeRIw9aiSmbjZ
         ODmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199616; x=1746804416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHb0ZzxGlBB6NHKFNbHGJJeCMu/az8eLbQ7nlZew+9Q=;
        b=eShaMzyCNqTNrcTBKWpS58569g6mrqBKOyscluFJJH5MN0xC6AKa5NiTgZQnxNAXuz
         okijXYCXPSqMSpS7gWwjpLWPVDeDsQq12C7cWbW/rZw9xMX67Ss7VsI/KbJG3Siy6U/q
         /tR2kT1wlSBpaaI2dDdZL5IftLSULBqOeDeQrAm3ouPvIqhd1dEvqM7aXG5WBWRt9biq
         udadQ6SfldJzeLzDPFA8gpTCSH4IeHAoq2ElGZvQAl/ASbGI3oqtu1U3XsRtm+a2OuF5
         A1ihguUXfcqoy8mTn3ciRYBYemq5vILk0CeUBVqnRTFl+Fpvdauhu+ylnMobiAUZQBX3
         WXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7dOX6cUjqbq7GxWy0ippjr6CFMcNVNSAcKNC2elIhJ+VOX9+fVEQDYCGprhYLC2RjtBsTNZ+T6Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwmsMlxShXFCoAc7f3b/x+h+/gYHDxQunhaCLFpRR+wzbYi40f
	cr5qJG6ATDGKzlPiaUyfL+boWfLh85ZoNNsgpDX80vOQlumYlHOqpQCzqEejBv7byEIxoQdufWa
	+bgoGpIKjHK2diYX48Gmn+R4QmaSsjtwFu/aQ
X-Gm-Gg: ASbGncv3Yjj8kXPr3cITEUHjJZ7DHvpNuFWsTPO2fveRsoFqsFM2r6RitZAHe6lF5x0
	Zw3Exv1bOvbc8T8hzVUXw3BVGWFYKG5yk3IRFkExaEv/PiKfjzKmESy1Zm6JIRHSQoUtqRQYiFj
	6UgujAE6iN4oIeymPz4w0pymG2qap9zfh8Amm34oEnF8yc6OqOuQ==
X-Google-Smtp-Source: AGHT+IE/jsfd3H3yBbKiN8dMrqyRJlNNmsTZdJpQFgt4OoMxHc8Yf7S8yh/e6oWWssFQ84fXTZBdZr1AlAKZB/MOXHQ=
X-Received: by 2002:a50:8719:0:b0:5e5:b44c:ec8f with SMTP id
 4fb4d7f45d1cf-5f918c0853dmr175309a12.3.1746199616297; Fri, 02 May 2025
 08:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428181218.85925-1-npache@redhat.com> <20250428181218.85925-8-npache@redhat.com>
 <CAG48ez2oge4xs1pSz_T9L46g=wQnFyC63kQKsXwbHGRWAxQ+aw@mail.gmail.com>
 <CAA1CXcBHJbs7_DGVR929NOD5G4nkJ3LguDrL9itV8-QS+BNUpg@mail.gmail.com>
 <b6093db0-9b18-4b70-81bd-6c02e80ac9fa@redhat.com> <CAG48ez0oe6oZ0QTDWr1rtUJFFTLO69sVpdoCmo+CxZUb6L1seg@mail.gmail.com>
 <b91af3df-643e-4131-96e7-2680f322194d@redhat.com>
In-Reply-To: <b91af3df-643e-4131-96e7-2680f322194d@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 May 2025 17:26:20 +0200
X-Gm-Features: ATxdqUEpkMTf_H-rMFPW7kzp3FCFlwgrzXrEa9BFkSIOp67pix4PyNJ7gFGimKI
Message-ID: <CAG48ez25Wo7BSt4dn3v+xO0mojvjtBpd02kaAu7kn_+AfgSrNQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] khugepaged: add mTHP support
To: David Hildenbrand <david@redhat.com>
Cc: Nico Pache <npache@redhat.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, willy@infradead.org, 
	peterx@redhat.com, ziy@nvidia.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 5:19=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 02.05.25 14:50, Jann Horn wrote:
> > On Fri, May 2, 2025 at 8:29=E2=80=AFAM David Hildenbrand <david@redhat.=
com> wrote:
> >> On 02.05.25 00:29, Nico Pache wrote:
> >>> On Wed, Apr 30, 2025 at 2:53=E2=80=AFPM Jann Horn <jannh@google.com> =
wrote:
> >>>>
> >>>> On Mon, Apr 28, 2025 at 8:12=E2=80=AFPM Nico Pache <npache@redhat.co=
m> wrote:
> >>>>> Introduce the ability for khugepaged to collapse to different mTHP =
sizes.
> >>>>> While scanning PMD ranges for potential collapse candidates, keep t=
rack
> >>>>> of pages in KHUGEPAGED_MIN_MTHP_ORDER chunks via a bitmap. Each bit
> >>>>> represents a utilized region of order KHUGEPAGED_MIN_MTHP_ORDER pte=
s. If
> >>>>> mTHPs are enabled we remove the restriction of max_ptes_none during=
 the
> >>>>> scan phase so we dont bailout early and miss potential mTHP candida=
tes.
> >>>>>
> >>>>> After the scan is complete we will perform binary recursion on the
> >>>>> bitmap to determine which mTHP size would be most efficient to coll=
apse
> >>>>> to. max_ptes_none will be scaled by the attempted collapse order to
> >>>>> determine how full a THP must be to be eligible.
> >>>>>
> >>>>> If a mTHP collapse is attempted, but contains swapped out, or share=
d
> >>>>> pages, we dont perform the collapse.
> >>>> [...]
> >>>>> @@ -1208,11 +1211,12 @@ static int collapse_huge_page(struct mm_str=
uct *mm, unsigned long address,
> >>>>>           vma_start_write(vma);
> >>>>>           anon_vma_lock_write(vma->anon_vma);
> >>>>>
> >>>>> -       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, ad=
dress,
> >>>>> -                               address + HPAGE_PMD_SIZE);
> >>>>> +       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, _a=
ddress,
> >>>>> +                               _address + (PAGE_SIZE << order));
> >>>>>           mmu_notifier_invalidate_range_start(&range);
> >>>>>
> >>>>>           pmd_ptl =3D pmd_lock(mm, pmd); /* probably unnecessary */
> >>>>> +
> >>>>>           /*
> >>>>>            * This removes any huge TLB entry from the CPU so we won=
't allow
> >>>>>            * huge and small TLB entries for the same virtual addres=
s to
> >>>>
> >>>> It's not visible in this diff, but we're about to do a
> >>>> pmdp_collapse_flush() here. pmdp_collapse_flush() tears down the
> >>>> entire page table, meaning it tears down 2MiB of address space; and =
it
> >>>> assumes that the entire page table exclusively corresponds to the
> >>>> current VMA.
> >>>>
> >>>> I think you'll need to ensure that the pmdp_collapse_flush() only
> >>>> happens for full-size THP, and that mTHP only tears down individual
> >>>> PTEs in the relevant range. (That code might get a bit messy, since
> >>>> the existing THP code tears down PTEs in a detached page table, whil=
e
> >>>> mTHP would have to do it in a still-attached page table.)
> >>> Hi Jann!
> >>>
> >>> I was under the impression that this is needed to prevent GUP-fast
> >>> races (and potentially others).
> >
> > Why would you need to touch the PMD entry to prevent GUP-fast races for=
 mTHP?
> >
> >>> As you state here, conceptually the PMD case is, detach the PMD, do
> >>> the collapse, then reinstall the PMD (similarly to how the system
> >>> recovers from a failed PMD collapse). I tried to keep the current
> >>> locking behavior as it seemed the easiest way to get it right (and no=
t
> >>> break anything). So I keep the PMD detaching and reinstalling for the
> >>> mTHP case too. As Hugh points out I am releasing the anon lock too
> >>> early. I will comment further on his response.
> >
> > As I see it, you're not "keeping" the current locking behavior; you're
> > making a big implicit locking change by reusing a codepath designed
> > for PMD THP for mTHP, where the page table may not be exclusively
> > owned by one VMA.
>
> That is not the intention. The intention in this series (at least as we
> discussed) was to not do it across VMAs; that is considered the next
> logical step (which will be especially relevant on arm64 IMHO).

Ah, so for now this is supposed to only work for PTEs which are in a
PMD which is fully covered by the VMA? So if I make a 16KiB VMA and
then try to collapse its contents to an order-2 mTHP page, that should
just not work?

