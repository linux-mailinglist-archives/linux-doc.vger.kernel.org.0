Return-Path: <linux-doc+bounces-60119-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A7FB54566
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 10:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99571B61AAD
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 08:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4BD2D6E7E;
	Fri, 12 Sep 2025 08:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzpdKdUj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A62D6E58
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665766; cv=none; b=KfBEbH/wZdIGL7a6B1QClBfzfAxkL9jak7/hapH0jlhw7Xq2vwfwP4OgIPJWBevtmkSiUFMiDcy4uCm9PcpVt7/RObYtJi83D4fwoyPx2D0mjxZoe4dzh0NLrN0qcYA4EIR18gCslOwKTOX9XHoflVJnJce9ChuUj1TS249QtS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665766; c=relaxed/simple;
	bh=cSvCveeG5tyLzTPtbHcS98FPLNxeKaOaBYSReQ7ftNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLt8C3Z0+sD6AEbuePkr/ZHZEIkDfE4EotBHKAslZFbCszqF9wyyF12L+qT06gQmeuy83Lx2Lqp/80tbSySik1IC6haaPJ4DH33cIR2DtcRrP54TnXyNoDNuTRrBndP0T5L9+BqEeZZEaFFPRqMg41AEAO2AJNXYWSJUSO2lZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzpdKdUj; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7639af4c4acso16672986d6.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757665762; x=1758270562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT4GkfQH7Q77VhObaVtW4zsoo1QdteuiKUxVY5qAxx4=;
        b=CzpdKdUjRq1slL7NGmtL5ifnK1vXkZA00I0ORYEBCNAZeOroGd0CVXvC6yrjaethYz
         4JdEl8ug0LClddkRaXURob6tiIx1soxTgj2fBgFI0UeeTt7zZdZog8TLop1kFpaLgfLw
         B2bYt56h64w7ZhlSiRxV8qjlLIoXsAS+Cl6du2fpM68EuqwnJHTNEYMWe/LYoZH9o59c
         LEI7HZETPd8kOGeHTtLW5jkH41Q4JvSstlo6fyYKh5CFL5f/MDUmRxtYvizcZ21XdUYu
         idCr2HJ1JUCWPSGbRUg7QkG1ts2JgFngoxk23cgE0T9kQUcSNhEs77sFPI5fKSkvDxck
         bILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665762; x=1758270562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UT4GkfQH7Q77VhObaVtW4zsoo1QdteuiKUxVY5qAxx4=;
        b=OZs/ABE+CgzrAtUiqF3pqG3mx1CxfiE8tVuxmd0JzzCbr3fZU7thQJZLy4AH0M1Pry
         EHoTOvw3WvYfSO7mMwadbpVljNyyu55PgVSqrPV9kiSo4/zYVEmJ7lvU7q4f7cC9T4l+
         HsYRKHLhwKfu61ZlFg0+o+RgWvs+UKzVbVSlabhdWMQPrj3e5x8CxoGrf1hWYrasXqD/
         4LBerpF9wACm0v4aQMfeIS81YMLe9QbzCDc/KDS+MSbaVu1ZFciD6d3XeIqfZzDydl3m
         02e47cLEK0eQlf8KZhLi8//Qske3K9FhlQ2DUf5rg9qcas0/khR3csoVCHi6jvTZWkDX
         DkAA==
X-Forwarded-Encrypted: i=1; AJvYcCVOLV5HLgRS34bPviltq1OzDUjmL0XQdbXTmnmYTih4eUEyHyecVjl+JmwYB9Bki+xcMI70vLEdMvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HKeOpMVfTLWDE5837uRQH9jmhqVGMGhccOEMWdTP4vzMd856
	Q8psTRakyOH8TI0QNkZEQpQBOoJOai9TU0OaNMn9I+JHJRiosWeNjD1fFqA4VmlLPqY4cK2iJNK
	tjfN43tqZtevdUVORx2vpwnXNNUba6cM=
X-Gm-Gg: ASbGncvbBb1vnO0ahxg+MiTFA+/OEDW9ZKV1c8W4rS2uIn7v8htNqrjxyrvWV9rUSQn
	jJ01piOLJ4pBM32z59f787l4PC33O4St6IWitn7t7Hs0e82k2Vyc6yC9O5WhR6tIhMWfrnQN2Bf
	FhrivqAeLHMZZ0iMdCiXVspzCJYaUORv9l0RTi9gOakzOTpX03mqkNnl7X1sbSvawR03NZIxsma
	GBtFvL3AsuXa3JuEE296II/h6fRAZKbzWAepcmF
X-Google-Smtp-Source: AGHT+IGRwmWY+murcATxsNS4exA4efHW8zui4X5QcN02iFAqtK5Ux8a/+EDSfSqT3Gx34ln92svFIO256LMLgslaL4I=
X-Received: by 2002:a05:6214:5299:b0:72c:5bd6:69ad with SMTP id
 6a1803df08f44-767c78b3792mr24115766d6.58.1757665762135; Fri, 12 Sep 2025
 01:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-3-laoar.shao@gmail.com>
 <4d676324-adc6-4c4c-9d2b-a5e9725bcd6c@lucifer.local>
In-Reply-To: <4d676324-adc6-4c4c-9d2b-a5e9725bcd6c@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 12 Sep 2025 16:28:46 +0800
X-Gm-Features: AS18NWCZIBNJ5kR6bmNor3-BlvQkjf-BV0EXfoE9syj-39GzEW5YzJqyLvnz89w
Message-ID: <CALOAHbB_jrsgEMH=HNozW+rASRLwiy9+QtspmSgM7jtZJMthXg@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 02/10] mm: thp: add support for BPF based THP
 order selection
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	willy@infradead.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	ameryhung@gmail.com, rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 10:34=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Sep 10, 2025 at 10:44:39AM +0800, Yafang Shao wrote:
> > This patch introduces a new BPF struct_ops called bpf_thp_ops for dynam=
ic
> > THP tuning. It includes a hook bpf_hook_thp_get_order(), allowing BPF
> > programs to influence THP order selection based on factors such as:
> > - Workload identity
> >   For example, workloads running in specific containers or cgroups.
> > - Allocation context
> >   Whether the allocation occurs during a page fault, khugepaged, swap o=
r
> >   other paths.
> > - VMA's memory advice settings
> >   MADV_HUGEPAGE or MADV_NOHUGEPAGE
> > - Memory pressure
> >   PSI system data or associated cgroup PSI metrics
> >
> > The kernel API of this new BPF hook is as follows,
> >
> > /**
> >  * @thp_order_fn_t: Get the suggested THP orders from a BPF program for=
 allocation
> >  * @vma: vm_area_struct associated with the THP allocation
> >  * @vma_type: The VMA type, such as BPF_THP_VM_HUGEPAGE if VM_HUGEPAGE =
is set
> >  *            BPF_THP_VM_NOHUGEPAGE if VM_NOHUGEPAGE is set, or BPF_THP=
_VM_NONE if
> >  *            neither is set.
> >  * @tva_type: TVA type for current @vma
> >  * @orders: Bitmask of requested THP orders for this allocation
> >  *          - PMD-mapped allocation if PMD_ORDER is set
> >  *          - mTHP allocation otherwise
> >  *
> >  * Return: The suggested THP order from the BPF program for allocation.=
 It will
> >  *         not exceed the highest requested order in @orders. Return -1=
 to
> >  *         indicate that the original requested @orders should remain u=
nchanged.
> >  */
> > typedef int thp_order_fn_t(struct vm_area_struct *vma,
> >                          enum bpf_thp_vma_type vma_type,
> >                          enum tva_type tva_type,
> >                          unsigned long orders);
> >
> > Only a single BPF program can be attached at any given time, though it =
can
> > be dynamically updated to adjust the policy. The implementation support=
s
> > anonymous THP, shmem THP, and mTHP, with future extensions planned for
> > file-backed THP.
> >
> > This functionality is only active when system-wide THP is configured to
> > madvise or always mode. It remains disabled in never mode. Additionally=
,
> > if THP is explicitly disabled for a specific task via prctl(), this BPF
> > functionality will also be unavailable for that task.
> >
> > This feature requires CONFIG_BPF_GET_THP_ORDER (marked EXPERIMENTAL) to=
 be
> > enabled. Note that this capability is currently unstable and may underg=
o
> > significant changes=E2=80=94including potential removal=E2=80=94in futu=
re kernel versions.
>
> Thanks for highlighting.
>
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > ---
> >  MAINTAINERS             |   1 +
> >  include/linux/huge_mm.h |  26 ++++-
> >  mm/Kconfig              |  12 ++
> >  mm/Makefile             |   1 +
> >  mm/huge_memory_bpf.c    | 243 ++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 280 insertions(+), 3 deletions(-)
> >  create mode 100644 mm/huge_memory_bpf.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8fef05bc2224..d055a3c95300 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16252,6 +16252,7 @@ F:    include/linux/huge_mm.h
> >  F:   include/linux/khugepaged.h
> >  F:   include/trace/events/huge_memory.h
> >  F:   mm/huge_memory.c
> > +F:   mm/huge_memory_bpf.c
>
> THanks!
>
> >  F:   mm/khugepaged.c
> >  F:   mm/mm_slot.h
> >  F:   tools/testing/selftests/mm/khugepaged.c
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 23f124493c47..f72a5fd04e4f 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -56,6 +56,7 @@ enum transparent_hugepage_flag {
> >       TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG,
> >       TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG,
> >       TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG,
> > +     TRANSPARENT_HUGEPAGE_BPF_ATTACHED,      /* BPF prog is attached *=
/
> >  };
> >
> >  struct kobject;
> > @@ -270,6 +271,19 @@ unsigned long __thp_vma_allowable_orders(struct vm=
_area_struct *vma,
> >                                        enum tva_type type,
> >                                        unsigned long orders);
> >
> > +#ifdef CONFIG_BPF_GET_THP_ORDER
> > +unsigned long
> > +bpf_hook_thp_get_orders(struct vm_area_struct *vma, vm_flags_t vma_fla=
gs,
> > +                     enum tva_type type, unsigned long orders);
>
> Thanks for renaming!
>
> > +#else
> > +static inline unsigned long
> > +bpf_hook_thp_get_orders(struct vm_area_struct *vma, vm_flags_t vma_fla=
gs,
> > +                     enum tva_type tva_flags, unsigned long orders)
> > +{
> > +     return orders;
> > +}
> > +#endif
> > +
> >  /**
> >   * thp_vma_allowable_orders - determine hugepage orders that are allow=
ed for vma
> >   * @vma:  the vm area to check
> > @@ -291,6 +305,12 @@ unsigned long thp_vma_allowable_orders(struct vm_a=
rea_struct *vma,
> >                                      enum tva_type type,
> >                                      unsigned long orders)
> >  {
> > +     unsigned long bpf_orders;
> > +
> > +     bpf_orders =3D bpf_hook_thp_get_orders(vma, vm_flags, type, order=
s);
> > +     if (!bpf_orders)
> > +             return 0;
>
> I think it'd be easier to just do:
>
>         /* The BPF-specified order overrides which order is selected. */
>         orders &=3D bpf_hook_thp_get_orders(vma, vm_flags, type, orders);
>         if (!orders)
>                 return 0;

good suggestion!

>
> > +
> >       /*
> >        * Optimization to check if required orders are enabled early. On=
ly
> >        * forced collapse ignores sysfs configs.
> > @@ -304,12 +324,12 @@ unsigned long thp_vma_allowable_orders(struct vm_=
area_struct *vma,
> >                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled(=
)))
> >                       mask |=3D READ_ONCE(huge_anon_orders_inherit);
> >
> > -             orders &=3D mask;
> > -             if (!orders)
> > +             bpf_orders &=3D mask;
> > +             if (!bpf_orders)
> >                       return 0
>
> With my suggeted change this would remain the same.
>
> >       }
> >
> > -     return __thp_vma_allowable_orders(vma, vm_flags, type, orders);
> > +     return __thp_vma_allowable_orders(vma, vm_flags, type, bpf_orders=
);
>
> With my suggeted change this would remain the same.
>
> >  }
> >
> >  struct thpsize {
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index d1ed839ca710..4d89d2158f10 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -896,6 +896,18 @@ config NO_PAGE_MAPCOUNT
> >
> >         EXPERIMENTAL because the impact of some changes is still unclea=
r.
> >
> > +config BPF_GET_THP_ORDER
>
> Yeah, I think we maybe need to sledgehammer this as already Lance was con=
fused
> as to the permenancy of this, and I feel that users might be too, even wi=
th the
> '(EXPERIMENTAL)' bit.
>
> So maybe
>
> config BPF_GET_THP_ORDER_EXPERIMENTAL
>
> Just to hammer it home?

ack

>
> > +     bool "BPF-based THP order selection (EXPERIMENTAL)"
> > +     depends on TRANSPARENT_HUGEPAGE && BPF_SYSCALL
> > +
> > +     help
> > +       Enable dynamic THP order selection using BPF programs. This
> > +       experimental feature allows custom BPF logic to determine optim=
al
> > +       transparent hugepage allocation sizes at runtime.
> > +
> > +       WARNING: This feature is unstable and may change in future kern=
el
> > +       versions.
> > +
> >  endif # TRANSPARENT_HUGEPAGE
> >
> >  # simple helper to make the code a bit easier to read
> > diff --git a/mm/Makefile b/mm/Makefile
> > index 21abb3353550..f180332f2ad0 100644
> > --- a/mm/Makefile
> > +++ b/mm/Makefile
> > @@ -99,6 +99,7 @@ obj-$(CONFIG_MIGRATION) +=3D migrate.o
> >  obj-$(CONFIG_NUMA) +=3D memory-tiers.o
> >  obj-$(CONFIG_DEVICE_MIGRATION) +=3D migrate_device.o
> >  obj-$(CONFIG_TRANSPARENT_HUGEPAGE) +=3D huge_memory.o khugepaged.o
> > +obj-$(CONFIG_BPF_GET_THP_ORDER) +=3D huge_memory_bpf.o
> >  obj-$(CONFIG_PAGE_COUNTER) +=3D page_counter.o
> >  obj-$(CONFIG_MEMCG_V1) +=3D memcontrol-v1.o
> >  obj-$(CONFIG_MEMCG) +=3D memcontrol.o vmpressure.o
> > diff --git a/mm/huge_memory_bpf.c b/mm/huge_memory_bpf.c
> > new file mode 100644
> > index 000000000000..525ee22ab598
> > --- /dev/null
> > +++ b/mm/huge_memory_bpf.c
> > @@ -0,0 +1,243 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * BPF-based THP policy management
> > + *
> > + * Author: Yafang Shao <laoar.shao@gmail.com>
> > + */
> > +
> > +#include <linux/bpf.h>
> > +#include <linux/btf.h>
> > +#include <linux/huge_mm.h>
> > +#include <linux/khugepaged.h>
> > +
> > +enum bpf_thp_vma_type {
> > +     BPF_THP_VM_NONE =3D 0,
> > +     BPF_THP_VM_HUGEPAGE,    /* VM_HUGEPAGE */
> > +     BPF_THP_VM_NOHUGEPAGE,  /* VM_NOHUGEPAGE */
> > +};
>
> I'm really not so sure how useful this is - can't a user just ascertain t=
his
> from the VMA flags themselves?

I assume you are referring to checking flags from vma->vm_flags.
There is an exception where we cannot use vma->vm_flags: in
hugepage_madvise(), which calls khugepaged_enter_vma(vma, *vm_flags).

At this point, the VM_HUGEPAGE flag has not been set in vma->vm_flags
yet. Therefore, we must pass the separate *vm_flags variable.
Perhaps we can simplify the logic with the following change?

diff --git a/mm/madvise.c b/mm/madvise.c
index 35ed4ab0d7c5..5755de80a4d7 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1425,6 +1425,8 @@ static int madvise_vma_behavior(struct
madvise_behavior *madv_behavior)
        VM_WARN_ON_ONCE(madv_behavior->lock_mode !=3D MADVISE_MMAP_WRITE_LO=
CK);

        error =3D madvise_update_vma(new_flags, madv_behavior);
+       if (new_flags & VM_HUGEPAGE)
+               khugepaged_enter_vma(vma);
 out:
        /*
         * madvise() returns EAGAIN if kernel resources, such as

>
> Let's keep the interface as minimal as possible.
>
> > +
> > +/**
> > + * @thp_order_fn_t: Get the suggested THP orders from a BPF program fo=
r allocation
>
> orders -> order?

ack

>
> > + * @vma: vm_area_struct associated with the THP allocation
> > + * @vma_type: The VMA type, such as BPF_THP_VM_HUGEPAGE if VM_HUGEPAGE=
 is set
> > + *            BPF_THP_VM_NOHUGEPAGE if VM_NOHUGEPAGE is set, or BPF_TH=
P_VM_NONE if
> > + *            neither is set.
>
> Obv as above let's drop this probably :)
>
> > + * @tva_type: TVA type for current @vma
> > + * @orders: Bitmask of requested THP orders for this allocation
>
> Shouldn't requested =3D available?

ack

>
> > + *          - PMD-mapped allocation if PMD_ORDER is set
> > + *          - mTHP allocation otherwise
>
> Not sure these 2 points are super useful.

will remove it.

>
> > + *
> > + * Return: The suggested THP order from the BPF program for allocation=
. It will
> > + *         not exceed the highest requested order in @orders. Return -=
1 to
> > + *         indicate that the original requested @orders should remain =
unchanged.
> > + */
> > +typedef int thp_order_fn_t(struct vm_area_struct *vma,
> > +                        enum bpf_thp_vma_type vma_type,
> > +                        enum tva_type tva_type,
> > +                        unsigned long orders);
> > +
> > +struct bpf_thp_ops {
> > +     thp_order_fn_t __rcu *thp_get_order;
> > +};
> > +
> > +static struct bpf_thp_ops bpf_thp;
> > +static DEFINE_SPINLOCK(thp_ops_lock);
> > +
> > +/*
> > + * Returns the original @orders if no BPF program is attached or if th=
e
> > + * suggested order is invalid.
> > + */
> > +unsigned long bpf_hook_thp_get_orders(struct vm_area_struct *vma,
> > +                                   vm_flags_t vma_flags,
> > +                                   enum tva_type tva_type,
> > +                                   unsigned long orders)
> > +{
> > +     thp_order_fn_t *bpf_hook_thp_get_order;
> > +     unsigned long thp_orders =3D orders;
> > +     enum bpf_thp_vma_type vma_type;
> > +     int thp_order;
> > +
> > +     /* No BPF program is attached */
> > +     if (!test_bit(TRANSPARENT_HUGEPAGE_BPF_ATTACHED,
> > +                   &transparent_hugepage_flags))
> > +             return orders;
> > +
> > +     if (vma_flags & VM_HUGEPAGE)
> > +             vma_type =3D BPF_THP_VM_HUGEPAGE;
> > +     else if (vma_flags & VM_NOHUGEPAGE)
> > +             vma_type =3D BPF_THP_VM_NOHUGEPAGE;
> > +     else
> > +             vma_type =3D BPF_THP_VM_NONE;
>
> As per above, not sure this is all that useful.
>
> > +
> > +     rcu_read_lock();
> > +     bpf_hook_thp_get_order =3D rcu_dereference(bpf_thp.thp_get_order)=
;
> > +     if (!bpf_hook_thp_get_order)
> > +             goto out;
> > +
> > +     thp_order =3D bpf_hook_thp_get_order(vma, vma_type, tva_type, ord=
ers);
> > +     if (thp_order < 0)
> > +             goto out;
> > +     /*
> > +      * The maximum requested order is determined by the callsite. E.g=
.:
> > +      * - PMD-mapped THP uses PMD_ORDER
> > +      * - mTHP uses (PMD_ORDER - 1)
>
> I don't think this is quite right, highest_order() figures out the highes=
t set
> bit, so mTHP can be PMD_ORDER - 1 or less (in theory ofc).
>
> I think we can just replace this with something simpler like - 'depending=
 on
> where the BPF hook is invoked, we check for either PMD order or mTHP orde=
rs
> (less than PMD order)' or something.

ack

>
> > +      *
> > +      * We must respect this upper bound to avoid undefined behavior. =
So the
> > +      * highest suggested order can't exceed the highest requested ord=
er.
> > +      */
>
> I think this sentence is also unnecessary.

will remove it.

--=20
Regards
Yafang

