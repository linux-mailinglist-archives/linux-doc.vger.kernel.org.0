Return-Path: <linux-doc+bounces-59410-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B455EB4A25E
	for <lists+linux-doc@lfdr.de>; Tue,  9 Sep 2025 08:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62B7A174C03
	for <lists+linux-doc@lfdr.de>; Tue,  9 Sep 2025 06:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1461E303A0F;
	Tue,  9 Sep 2025 06:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OLt/T5Ej"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB15303A03
	for <linux-doc@vger.kernel.org>; Tue,  9 Sep 2025 06:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757399846; cv=none; b=EcHiaJRx9kt4iCjox/onzuH9z7qvZFoh5pyM3LrN4N0YnhH+DHpmBefk4A/10Vb7Oc5rg+ZpbiCVk6uktcjGKDA0UVrXN83a3WkQnPlz1GojfJO87r03248q05hsdEWOjgX+xwLsgr7v8Vrk1Q++uebwr5cEU/j7+Sfgvl5ZyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757399846; c=relaxed/simple;
	bh=ypgFCow3WWV2YVE+kV44xMSXOTzB04r9qyWaIR95Ep0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AneHLZzIhzCL3sQ1CuPrVjq5AAWvqf5hUIjdUZPq4l3c1h3GCy09f95I2c/KJW70oKrdUN0h+eq7qGaMjj47XpbUMz2JYWGYBjLfpTK9+fTqbcY9VQ3aMv35U4vcNoL2jLdGSOInJ441e97lOgtJ5VAml/5AL+iKfiAjMYB7ZI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OLt/T5Ej; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757399843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqG3RTyS1kzfQKhWZN5qquD47StQlgHE41X7mr5xwLY=;
	b=OLt/T5EjYi5ib5s2I1V+FW9vql64CT1dehyTaa2wqW2JBaI6Wc8Nu17YysMzqFJmeuFYN4
	KkFKvgVy99MntWpK769kjaJG20RivxMj8NhA/YO1J02foSIFVBny2QPRhNUPPylybNQv6R
	Gsmd4zDIJHdRYjMm/lFkAIbZFbFxWV0=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-QtbJW6WTOlK-2eMF-O1ADQ-1; Tue, 09 Sep 2025 02:37:21 -0400
X-MC-Unique: QtbJW6WTOlK-2eMF-O1ADQ-1
X-Mimecast-MFC-AGG-ID: QtbJW6WTOlK-2eMF-O1ADQ_1757399841
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-60fb0c64421so2760286d50.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Sep 2025 23:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757399841; x=1758004641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqG3RTyS1kzfQKhWZN5qquD47StQlgHE41X7mr5xwLY=;
        b=VSMUzbQratqKxlWxJHDKAn125PsNBSIVh5dheUb4wXqwQ7QBfRldtHWvKrbuyaelbM
         ENYMKvhW6T42q3cW7/NybHOkvEdJlxcUnWZOi1/bKT0Y0fmMwh7Xta9wiAo7mzxiqoIR
         hHL3Kb0Ef6v3DKBciNuNiP1p83a2oxAOuwLJURfIU7wfwOqP02YtA+/NTm4vaR3OIaQC
         IxNoAO76hV5zGlfDJWJNxnVhhLsdw9N8DlbvW8/nte67oVo+21rnWwy4B8PjDzosOaU9
         eFVew0c7RsDVq9el4MBuJeiWLG3sB/FI2KfYMxDtPMxtYQ4w3CCi4aAZFv5tYuNL+yq/
         AfHg==
X-Forwarded-Encrypted: i=1; AJvYcCWSwxDcn4cVFkgdSHmSYZtWd8OT/9drjTSlqFw017Z+n6aUyvS1rBUdQv8Dfx5G1wrlaxjQth08lyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcvoJx7bDxGlicS27sthyH7R4PocurTTboEFZcKsEEhrxilOGx
	C+UGRn8+Lv5ZmvZUyJZX3dAymQtEs7uynt5R4PcCTgWxl3Z7kgKl+LmCAxThzS6GPrNG0ekRGh+
	wLhyHhaoBX4vGKjTPFySU9XedAEedoLbvaEQDVGulYpNhnY1l/teJo43tHtslmCsdC0gs7L2U8M
	SjBkUxeEYPcur3gRH5u02V5tgnd+EgJW9rBrMO
X-Gm-Gg: ASbGnctwUjUwYGMDHOwlQEZsz+tk3OchU2TAu5ZnCne61e9rnEZ1jmc0UlI2WzEcD7k
	f60tNP17WTuhIN/oWyPaFsdGUB1JSRs3265ZHnK6+LQhPOBI03dkE75Rq7y0i7rBCqW6mocDgQX
	lLR6iF11/4GIVg/QpGaJzEdMRAWDwwleiSriU=
X-Received: by 2002:a05:690e:144:b0:607:623b:bc86 with SMTP id 956f58d0204a3-61022a5b6afmr7711516d50.13.1757399841033;
        Mon, 08 Sep 2025 23:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3RLuHOOrVUGgUVWsftrAee1GOAvhURBR+lyrsCxnC5Yz6xvo+Y7AAS0EviAsb6AHXO4uFnhEL78gIvOjZTjM=
X-Received: by 2002:a05:690e:144:b0:607:623b:bc86 with SMTP id
 956f58d0204a3-61022a5b6afmr7711492d50.13.1757399840597; Mon, 08 Sep 2025
 23:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819134205.622806-1-npache@redhat.com> <20250819141610.626140-1-npache@redhat.com>
 <69e9c0e9-25bb-4ff6-8469-d9137a5e5a75@lucifer.local>
In-Reply-To: <69e9c0e9-25bb-4ff6-8469-d9137a5e5a75@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Tue, 9 Sep 2025 00:36:54 -0600
X-Gm-Features: Ac12FXxx2cxmv7nW-JKof664kgo6jd1Xxe4arL1d9RHPXxyd11yOp6quCb1KZ0I
Message-ID: <CAA1CXcD+E8kSA2P5JchayQb5wrwmUVPRCK+W-qiD=Xtz03ti+Q@mail.gmail.com>
Subject: Re: [PATCH v10 12/13] khugepaged: add per-order mTHP khugepaged stats
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
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

On Thu, Aug 21, 2025 at 8:49=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Aug 19, 2025 at 08:16:10AM -0600, Nico Pache wrote:
> > With mTHP support inplace, let add the per-order mTHP stats for
> > exceeding NONE, SWAP, and SHARED.
> >
>
> This is really not enough of a commit message. Exceeding what, where, why=
,
> how? What does 'exceeding' mean here, etc. etc. More words please :)
Ok I will add more in the next version
>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  Documentation/admin-guide/mm/transhuge.rst | 17 +++++++++++++++++
> >  include/linux/huge_mm.h                    |  3 +++
> >  mm/huge_memory.c                           |  7 +++++++
> >  mm/khugepaged.c                            | 16 +++++++++++++---
> >  4 files changed, 40 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation=
/admin-guide/mm/transhuge.rst
> > index 7ccb93e22852..b85547ac4fe9 100644
> > --- a/Documentation/admin-guide/mm/transhuge.rst
> > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > @@ -705,6 +705,23 @@ nr_anon_partially_mapped
> >         an anonymous THP as "partially mapped" and count it here, even =
though it
> >         is not actually partially mapped anymore.
> >
> > +collapse_exceed_swap_pte
> > +       The number of anonymous THP which contain at least one swap PTE=
.
>
> The number of anonymous THP what? Pages? Let's be specific.
ack
>
> > +       Currently khugepaged does not support collapsing mTHP regions t=
hat
> > +       contain a swap PTE.
>
> Wait what? So we have a counter for something that's unsupported? That
> seems not so useful?
The current implementation does not support swapped out or shared
pages. However these counters allow us to monitor when a mTHP collapse
fails due to exceeding the threshold (ie 0, hitting any swapped out or
shared page)
>
> > +
> > +collapse_exceed_none_pte
> > +       The number of anonymous THP which have exceeded the none PTE th=
reshold.
>
> THP pages. What's the 'none PTE threshold'? Do you mean
> /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none ?
ack, I will expand these descriptions
>
> Let's spell that out please, this is far too vague.
>
> > +       With mTHP collapse, a bitmap is used to gather the state of a P=
MD region
> > +       and is then recursively checked from largest to smallest order =
against
> > +       the scaled max_ptes_none count. This counter indicates that the=
 next
> > +       enabled order will be checked.
>
> I think you really need to expand upon this as this is confusing and vagu=
e.
>
> I also don't think saying 'recursive' here really benefits anything, Just
> saying that we try to collapse the largest mTHP size we can in each
> instance, and then give a more 'words-y' explanation as to how
> max_ptes_none is (in effect) converted to a ratio of a PMD, and then that
> ratio is applied to the mTHP sizes.
>
> You can then go on to say that this counter measures the number of
> occasions in which this occurred.
ack I will clean it up
>
> > +
> > +collapse_exceed_shared_pte
> > +       The number of anonymous THP which contain at least one shared P=
TE.
>
> anonymous THP pages right? :)
regions?
>
> > +       Currently khugepaged does not support collapsing mTHP regions t=
hat
> > +       contain a shared PTE.
>
> Again I don't really understand the purpose of creating a counter for
> something we don't support.
see above
>
> Let's add it when we support it.
>
> I also in this case and the exceed swap case don't understand what you me=
an
> by exceed here, you need to spell this out clearly.
>
> Perhaps the context missing here is that you _also_ count THP events in
> these counters.
>
> But again, given we have THP_... counters for the stats mTHP doesn't do
> yet, I'd say adding these is pointless.
>
> > +
> >  As the system ages, allocating huge pages may be expensive as the
> >  system uses memory compaction to copy data around memory to free a
> >  huge page for use. There are some counters in ``/proc/vmstat`` to help
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 4ada5d1f7297..6f1593d0b4b5 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -144,6 +144,9 @@ enum mthp_stat_item {
> >       MTHP_STAT_SPLIT_DEFERRED,
> >       MTHP_STAT_NR_ANON,
> >       MTHP_STAT_NR_ANON_PARTIALLY_MAPPED,
> > +     MTHP_STAT_COLLAPSE_EXCEED_SWAP,
> > +     MTHP_STAT_COLLAPSE_EXCEED_NONE,
> > +     MTHP_STAT_COLLAPSE_EXCEED_SHARED,
>
> Wh do we put 'collapse' here but not in the THP equivalents?
to indicate they come from the collapse functionality. I can shorten
it by removing COLLAPSE if youd like
>
> >       __MTHP_STAT_COUNT
> >  };
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 20d005c2c61f..9f0470c3e983 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -639,6 +639,10 @@ DEFINE_MTHP_STAT_ATTR(split_failed, MTHP_STAT_SPLI=
T_FAILED);
> >  DEFINE_MTHP_STAT_ATTR(split_deferred, MTHP_STAT_SPLIT_DEFERRED);
> >  DEFINE_MTHP_STAT_ATTR(nr_anon, MTHP_STAT_NR_ANON);
> >  DEFINE_MTHP_STAT_ATTR(nr_anon_partially_mapped, MTHP_STAT_NR_ANON_PART=
IALLY_MAPPED);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_swap_pte, MTHP_STAT_COLLAPSE_EXC=
EED_SWAP);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_none_pte, MTHP_STAT_COLLAPSE_EXC=
EED_NONE);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_shared_pte, MTHP_STAT_COLLAPSE_E=
XCEED_SHARED);
> > +
> >
> >  static struct attribute *anon_stats_attrs[] =3D {
> >       &anon_fault_alloc_attr.attr,
> > @@ -655,6 +659,9 @@ static struct attribute *anon_stats_attrs[] =3D {
> >       &split_deferred_attr.attr,
> >       &nr_anon_attr.attr,
> >       &nr_anon_partially_mapped_attr.attr,
> > +     &collapse_exceed_swap_pte_attr.attr,
> > +     &collapse_exceed_none_pte_attr.attr,
> > +     &collapse_exceed_shared_pte_attr.attr,
> >       NULL,
> >  };
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index c13bc583a368..5a3386043f39 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -594,7 +594,9 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
> >                               continue;
> >                       } else {
> >                               result =3D SCAN_EXCEED_NONE_PTE;
> > -                             count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>
> Hm so wait you were miscounting statistics in patch 10/13 when you turned
> all this one? That's not good.
>
> This should be in place _first_ before enabling the feature.
Ok I can move them around.
>
> > +                             if (order =3D=3D HPAGE_PMD_ORDER)
> > +                                     count_vm_event(THP_SCAN_EXCEED_NO=
NE_PTE);
> > +                             count_mthp_stat(order, MTHP_STAT_COLLAPSE=
_EXCEED_NONE);
> >                               goto out;
> >                       }
> >               }
> > @@ -633,10 +635,17 @@ static int __collapse_huge_page_isolate(struct vm=
_area_struct *vma,
> >                        * shared may cause a future higher order collaps=
e on a
> >                        * rescan of the same range.
> >                        */
> > -                     if (order !=3D HPAGE_PMD_ORDER || (cc->is_khugepa=
ged &&
> > -                         shared > khugepaged_max_ptes_shared)) {
> > +                     if (order !=3D HPAGE_PMD_ORDER) {
>
> Hm wait what? I dont understand what's going on here? You're no longer
> actually doing any check except order !=3D HPAGE_PMD_ORDER?... am I missn=
ig
> something?
>
> Again why we are bothering to maintain a counter that doesn't mean anythi=
ng
> I don't know? I may be misinterpreting somehow however.
>
> > +                             result =3D SCAN_EXCEED_SHARED_PTE;
> > +                             count_mthp_stat(order, MTHP_STAT_COLLAPSE=
_EXCEED_SHARED);
> > +                             goto out;
> > +                     }
> > +
> > +                     if (cc->is_khugepaged &&
> > +                         shared > khugepaged_max_ptes_shared) {
> >                               result =3D SCAN_EXCEED_SHARED_PTE;
> >                               count_vm_event(THP_SCAN_EXCEED_SHARED_PTE=
);
> > +                             count_mthp_stat(order, MTHP_STAT_COLLAPSE=
_EXCEED_SHARED);
> >                               goto out;
> >                       }
> >               }
> > @@ -1084,6 +1093,7 @@ static int __collapse_huge_page_swapin(struct mm_=
struct *mm,
> >                * range.
> >                */
> >               if (order !=3D HPAGE_PMD_ORDER) {
> > +                     count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_=
SWAP);
>
> This again seems surely to not be testing for what it claims to be
> tracking? I may again be missing context here.
We are bailing out of the mTHP collapse due to it having a SWAP page.
In turn exceeding our threshold of 0.

Cheers,
-- Nico
>
> >                       pte_unmap(pte);
> >                       mmap_read_unlock(mm);
> >                       result =3D SCAN_EXCEED_SWAP_PTE;
> > --
> > 2.50.1
> >
>


