Return-Path: <linux-doc+bounces-23859-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7F95FB75
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 23:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335011C21660
	for <lists+linux-doc@lfdr.de>; Mon, 26 Aug 2024 21:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C6A19AD85;
	Mon, 26 Aug 2024 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQeKdZBU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588AA194A6C
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706917; cv=none; b=UDQyYIwxtlqRmrRWNsP+FymS0ErzBV9HC+OQ+9MQWiWNev3LRY3m8ToMCebkcGEhOxL6uOWEbPDUefVvKLVDE1c9WL47LgCW3fY+Mq37bxSsltz3t5C0cR6W8lzfoGP1gTp7dCYXOA7XCfZH718L8RuZ+T3BBKdlMrqhQosbCaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706917; c=relaxed/simple;
	bh=G2DWerxqQY+pkST0IhkkTBUP4cA5H6iQ8aUXi7c7qbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBBqwdxybZciSNKFKqQL2kMxh3cXCAvmpnXvQi6m8apatAH8z/aqLCJ0jMD+S40MwoPeDHieUQBRYM9k/LMg5adkJ2HIelCzXz+AR4CEc0Cs9u1Fs8mmYqXl07z1izF7todtg+qg9Y+RTnLsIt13iAC7FA34iPPv4NWFzJTaDsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQeKdZBU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724706914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gh0W/fulJHGj4KK/LjKqNVYI9cFOfRRPIWbKHgEaxSg=;
	b=bQeKdZBUrSw/mGOvlo9Y9tREzajbbYBj0e6BYZ69s8DIu56n4aZN9y+eykSyss/SgwXt9X
	6CWCQ9pVhmNmMGY0ZBXr7UxcTJYN+vg67oy+G76lvZ0njwY3EDcAZIbpJQiFyxReH4YaUq
	6r9iarHh0s0UgLVdCMBdQbBBBn+8fpY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-ssFkZEcSPAanYONj9LC9PA-1; Mon, 26 Aug 2024 17:15:13 -0400
X-MC-Unique: ssFkZEcSPAanYONj9LC9PA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6b4eda2f2f5so70566507b3.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 14:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724706912; x=1725311712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gh0W/fulJHGj4KK/LjKqNVYI9cFOfRRPIWbKHgEaxSg=;
        b=WSeN5YfCvZSd+v6EnatBz77e+TygeseH5lnLHw/XZPXzg8Rk6mHQMe59RQUiN2E+Z+
         9h+RdjW56vXL0T+Z0eFRMSMvZHR+vvx7qJqhPJ5S+2fU+WMepLgG6YSNcUXh09HG28mk
         ZqqjfkuesPEiI3J1zLtlEvSpE+r0xMKB9urxuGaijsQ5TZQpfORAXHL+BuY3mo84YWT9
         GA8ayQPaTbdK60boWGZsMQBaMCP9rU7Rq0+LQoWPckbtsby9UNltzWEGHEhDIu0XYc7L
         qMc2giXUVa1ei3BTLizFfhkSWil2JK7Mq1Lhut5920dEM1H3FYFstUd0HRDtUX/Psboe
         T3qw==
X-Forwarded-Encrypted: i=1; AJvYcCWfJa2LUbP4vPF2GjXjmn4+ub3cgcTsvW4/8fPAG4V3VIUTaKY/fai36aVjENOtuZymMqoyF9ZSUgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyntsGs9xxeXUxd+mtVzinm5rWZ7GXkBoFPKLi1cdH1wj3OXBap
	ReouujHvkicIIuZaZVIs8Ku9NxZAeADYZD/qRy3T8Lopx/+WVc55PeyzpFKE6aehrZCeXqUvJFk
	SnNM+PiCEHRXbISVTa8yBrjUduuokRt3DmKHwLp2P8LMfo1u0zehUKFNFN1XqTTHRYQh/VEFBde
	tFSRURr1DKRQj+D+e2BOSSlIu6u5nzW+ND
X-Received: by 2002:a05:690c:887:b0:652:e90f:cd15 with SMTP id 00721157ae682-6c62601404amr135744417b3.25.1724706912496;
        Mon, 26 Aug 2024 14:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwBCs/xcFyfWF97Z8582PdK7S8ShVR13Xm/8AZgEpqX0nNWojwky95uAt1ZgQI3aS64E/GqiH+D9Zh3UjI4hI=
X-Received: by 2002:a05:690c:887:b0:652:e90f:cd15 with SMTP id
 00721157ae682-6c62601404amr135744227b3.25.1724706912103; Mon, 26 Aug 2024
 14:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729222727.64319-1-npache@redhat.com> <72320F9D-9B6A-4ABA-9B18-E59B8382A262@nvidia.com>
 <CAA1CXcCD798gkLoZuz3Cd5-Wf2MRfnAG_EB0U3nbScZeFv09dw@mail.gmail.com>
 <CAA1CXcCCOS8-aqcm+w8Aoqe2P5q005wMrgmtx=xjzJgjKFb7mg@mail.gmail.com> <61411216-d196-42de-aa64-12bd28aef44f@gmail.com>
In-Reply-To: <61411216-d196-42de-aa64-12bd28aef44f@gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 26 Aug 2024 15:14:46 -0600
Message-ID: <CAA1CXcCe8QDir2KiWg=GmN4BErfXSDs_9kmnYfyK=X8H8U8QwA@mail.gmail.com>
Subject: Re: [RFC 0/2] mm: introduce THP deferred setting
To: Usama Arif <usamaarif642@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Barry Song <baohua@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Lance Yang <ioworker0@gmail.com>, Peter Xu <peterx@redhat.com>, 
	Rafael Aquini <aquini@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
	Zi Yan <ziy@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 10:47=E2=80=AFAM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>
>
> On 26/08/2024 11:40, Nico Pache wrote:
> > On Tue, Jul 30, 2024 at 4:37=E2=80=AFPM Nico Pache <npache@redhat.com> =
wrote:
> >>
> >> Hi Zi Yan,
> >> On Mon, Jul 29, 2024 at 7:26=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> >>>
> >>> +Kirill
> >>>
> >>> On 29 Jul 2024, at 18:27, Nico Pache wrote:
> >>>
> >>>> We've seen cases were customers switching from RHEL7 to RHEL8 see a
> >>>> significant increase in the memory footprint for the same workloads.
> >>>>
> >>>> Through our investigations we found that a large contributing factor=
 to
> >>>> the increase in RSS was an increase in THP usage.
> >>>
> >>> Any knob is changed from RHEL7 to RHEL8 to cause more THP usage?
> >> IIRC, most of the systems tuning is the same. We attributed the
> >> increase in THP usage to a combination of improvements in the kernel,
> >> and improvements in the libraries (better alignments). That allowed
> >> THP allocations to succeed at a higher rate. I can go back and confirm
> >> this tomorrow though.
> >>>
> >>>>
> >>>> For workloads like MySQL, or when using allocators like jemalloc, it=
 is
> >>>> often recommended to set /transparent_hugepages/enabled=3Dnever. Thi=
s is
> >>>> in part due to performance degradations and increased memory waste.
> >>>>
> >>>> This series introduces enabled=3Ddefer, this setting acts as a middl=
e
> >>>> ground between always and madvise. If the mapping is MADV_HUGEPAGE, =
the
> >>>> page fault handler will act normally, making a hugepage if possible.=
 If
> >>>> the allocation is not MADV_HUGEPAGE, then the page fault handler wil=
l
> >>>> default to the base size allocation. The caveat is that khugepaged c=
an
> >>>> still operate on pages thats not MADV_HUGEPAGE.
> >>>
> >>> Why? If user does not explicitly want huge page, why bother providing=
 huge
> >>> pages? Wouldn't it increase memory footprint?
> >>
> >> So we have "always", which will always try to allocate a THP when it
> >> can. This setting gives good performance in a lot of conditions, but
> >> tends to waste memory. Additionally applications DON'T need to be
> >> modified to take advantage of THPs.
> >>
> >> We have "madvise" which will only satisfy allocations that are
> >> MADV_HUGEPAGE, this gives you granular control, and a lot of times
> >> these madvises come from libraries. Unlike "always" you DO need to
> >> modify your application if you want to use THPs.
> >>
> >> Then we have "never", which of course, never allocates THPs.
> >>
> >> Ok. back to your question, like "madvise", "defer" gives you the
> >> benefits of THPs when you specifically know you want them
> >> (madv_hugepage), but also benefits applications that dont specifically
> >> ask for them (or cant be modified to ask for them), like "always"
> >> does. The applications that dont ask for THPs must wait for khugepaged
> >> to get them (avoid insertions at PF time)-- this curbs a lot of memory
> >> waste, and gives an increased tunability over "always". Another added
> >> benefit is that khugepaged will most likely not operate on short lived
> >> allocations, meaning that only longstanding memory will be collapsed
> >> to THPs.
> >>
> >> The memory waste can be tuned with max_ptes_none... lets say you want
> >> ~90% of your PMD to be full before collapsing into a huge page. simply
> >> set max_ptes_none=3D64. or no waste, set max_ptes_none=3D0, requiring =
the
> >> 512 pages to be present before being collapsed.
> >>
> >>>
> >>>>
> >>>> This allows for two things... one, applications specifically designe=
d to
> >>>> use hugepages will get them, and two, applications that don't use
> >>>> hugepages can still benefit from them without aggressively inserting
> >>>> THPs at every possible chance. This curbs the memory waste, and defe=
rs
> >>>> the use of hugepages to khugepaged. Khugepaged can then scan the mem=
ory
> >>>> for eligible collapsing.
> >>>
> >>> khugepaged would replace application memory with huge pages without s=
pecific
> >>> goal. Why not use a user space agent with process_madvise() to collap=
se
> >>> huge pages? Admin might have more knobs to tweak than khugepaged.
> >>
> >> The benefits of "always" are that no userspace agent is needed, and
> >> applications dont have to be modified to use madvise(MADV_HUGEPAGE) to
> >> benefit from THPs. This setting hopes to gain some of the same
> >> benefits without the significant waste of memory and an increased
> >> tunability.
> >>
> >> future changes I have in the works are to make khugepaged more
> >> "smart". Moving it away from the round robin fashion it currently
> >> operates in, to instead make smart and informed decisions of what
> >> memory to collapse (and potentially split).
> >>
> >> Hopefully that helped explain the motivation for this new setting!
> >
> > Any last comments before I resend this?
> >
> > Ive been made aware of
> > https://lore.kernel.org/all/20240730125346.1580150-1-usamaarif642@gmail=
.com/T/#u
> > which introduces THP splitting. These are both trying to achieve the
> > same thing through different means. Our approach leverages khugepaged
> > to promote pages, while Usama's uses the reclaim path to demote
> > hugepages and shrink the underlying memory.
> >
> > I will leave it up to reviewers to determine which is better; However,
> > we can't have both, as we'd be introducing trashing conditions.
> >
>
> Hi,
>
> Just inserting this here from my cover letter:
>
> Waiting for khugepaged to scan memory and
> collapse pages into THP can be slow and unpredictable in terms of perform=
ance
Obviously not part of my patchset here, but I have been testing some
changes to khugepaged to make it more aware of what processes are hot.
Ideally then it can make better choices of what to operate on.
> (i.e. you dont know when the collapse will happen), while production
> environments require predictable performance. If there is enough memory
> available, its better for both performance and predictability to have
> a THP from fault time, i.e. THP=3Dalways rather than wait for khugepaged
> to collapse it, and deal with sparsely populated THPs when the system is
> running out of memory.
>
> I just went through your patches, and am not sure why we can't have both?
Fair point, we can. I've been playing around with splitting hugepages
and via khugepaged and was thinking of the trashing conditions there--
but your implementation takes a different approach.
I've been working on performance testing my "defer" changes, once I
find the appropriate workloads I'll try adding your changes to the
mix. I have a feeling my approach is better for latency sensitive
workloads, while yours is better for throughput, but let me find a way
to confirm that.





> Both use max_ptes_none as the tunable. If the number of zero-filled pages
> is above max_ptes_none, the shrinker will split them, and khugepaged will=
 not collapse
> them (SCAN_EXCEED_NONE_PTE), so I don't see how it causes trashing?
>
>
> > Cheers,
> > -- Nico
> >
> >
> >
> >
> >
> >>
> >> Cheer!
> >> -- Nico
> >>>
> >>>>
> >>>> Admins may want to lower max_ptes_none, if not, khugepaged may
> >>>> aggressively collapse single allocations into hugepages.
> >>>>
> >>>> RFC note
> >>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> Im not sure if im missing anything related to the mTHP
> >>>> changes. I think now that we have hugepage_pmd_enabled in
> >>>> commit 00f58104202c ("mm: fix khugepaged activation policy") everyth=
ing
> >>>> should work as expected.
> >>>>
> >>>> Nico Pache (2):
> >>>>   mm: defer THP insertion to khugepaged
> >>>>   mm: document transparent_hugepage=3Ddefer usage
> >>>>
> >>>>  Documentation/admin-guide/mm/transhuge.rst | 18 ++++++++++---
> >>>>  include/linux/huge_mm.h                    | 15 +++++++++--
> >>>>  mm/huge_memory.c                           | 31 +++++++++++++++++++=
---
> >>>>  3 files changed, 55 insertions(+), 9 deletions(-)
> >>>>
> >>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>>> Cc: David Hildenbrand <david@redhat.com>
> >>>> Cc: Matthew Wilcox <willy@infradead.org>
> >>>> Cc: Barry Song <baohua@kernel.org>
> >>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>> Cc: Lance Yang <ioworker0@gmail.com>
> >>>> Cc: Peter Xu <peterx@redhat.com>
> >>>> Cc: Zi Yan <ziy@nvidia.com>
> >>>> Cc: Rafael Aquini <aquini@redhat.com>
> >>>> Cc: Andrea Arcangeli <aarcange@redhat.com>
> >>>> Cc: Jonathan Corbet <corbet@lwn.net>
> >>>> --
> >>>> 2.45.2
> >>>
> >>> --
> >>> Best Regards,
> >>> Yan, Zi
> >
>


