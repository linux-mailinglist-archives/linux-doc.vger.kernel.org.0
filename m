Return-Path: <linux-doc+bounces-60404-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109BB56441
	for <lists+linux-doc@lfdr.de>; Sun, 14 Sep 2025 04:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3EDA44E000F
	for <lists+linux-doc@lfdr.de>; Sun, 14 Sep 2025 02:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C117623BF96;
	Sun, 14 Sep 2025 02:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4H5ofkx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941A42A9D
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757816559; cv=none; b=qPp3w+geWSesGlwTBefLiZVe9XoNfn9WPgR0qy5XRylZ1uM2LLgZZIg28gGy25jLMnROEtl0ni+5r7Y2jDZGuFNSXW8tQvJnKjX44/7UBwSMSu8f5bmzm2lQk/SnAsTpjy5BRAvm++aXi474OShKo4oGNUy7WStez0he4yDJ2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757816559; c=relaxed/simple;
	bh=TPWomSQ+Xpf6/70/2UcLMfrGm8M1JEeOTYMGMKLfZuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXU4vLdtCFERjhiwTETeOg6Fdlbki8NJJxH5zV1qOQzF9neWzYnqs77hGevGuqOnwSSmFQ3KW9nbNYPm/mle+235BeW6yzmKcw757Q/qaC5aonRQ3MBG10ofCTmU1vcbhKN9tGSzI9w6u3Ul4WuV46pfveLm68zWzi9CY85/tdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4H5ofkx; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-7748879b06aso7707946d6.3
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 19:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757816557; x=1758421357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZSjIvJ+U0wDv91HR/wWMkH01+c2dAzW/GofNytLcEw=;
        b=M4H5ofkxkmH96L+ATa0OAZJfjaaOeg5IG0ATciMtTPKCohzE1Z8jI6WaHlKst+kcko
         3A1RWEVtI816eXavbpM53RSt6L6wjD1dp50ziR1MtZqFefGq5KRkf4aI/AwnjfU47Xzu
         VdnfKt751dmEmYQQpXomZDOcQH6qh1nK5wysjdvA7M/1pv0T2zaVQDjM07bxZydqWePp
         kV/U1exybs/Gz3x8xrFn2yYFTyo9oWSw0kOKNMjLo1YPZq35yBAXNmrWNUSJwC57XlEx
         2oMBRBp/EMotStPgXdcA6UdIYigP8iij8PDoIhzymbzZncCCNkDuvD+gJjDC4ikC36l9
         ibIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757816557; x=1758421357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZSjIvJ+U0wDv91HR/wWMkH01+c2dAzW/GofNytLcEw=;
        b=gCVR5O2cd4fqe4ZBbfTkhntV8ZyjTYdnWcO923TSZa8cQKKXDdQgCy7HQdWCTA1Fw5
         VQgfMOGFLVNAPHjTg6sdEQueLtIBGtnuUtDUWS+vCOKOds5GQRc/d47bd51N9Cx/HaCQ
         GAzBZGZngmSJt91KWE0xicWWsVEvJVZC+XWzEEs4uXIxOpY6zwt06z093oy9oY/7WMJh
         3eUlRJ8jDiDPioOSrl9wmqeB6qd7XLPPFTmas8DEC9cK9mZ4WkxkfZVrZQZ9HC39cMyN
         K52o93LItGBsB+qyFW1pgWXDMJ2EtM5HvHawJxzEbrOoXzvBetfwECQCD1lfBz8vpFi/
         gtkg==
X-Forwarded-Encrypted: i=1; AJvYcCVqUt1hmJy4QqYsvBsVKrt90mISZBMTSjfv88hUzB1b5Iyy+kp35PBw79tPOHuM5ekFmiM5nUDY3Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXwz3pr+GGbCc19U0KoetYRG7+Da83DvnUuvo1votvxiP7mdCj
	L4V012IbxmTvLSoZCn+EuRkr7b/J5WsBpx9wq+Z3nBRhvmz/J3+vhkDlnKVTbmiZooZzB24kft4
	O2+svD/N8JtlYF5q5ACQ5wdeYVk7l2Wg=
X-Gm-Gg: ASbGncuuCrpQHiVxrRFCoCZlMrwgeYWgN7+lbVgHmNuXMiXTuSgLl8Up/0QySmeGoUL
	cxiVeGv+205UJQasHnGNbfu+wldWWqIBIY680pufQkbujxXJJpjfxaDk9UG93eICMsZgFM4Q6h4
	pfR0FqNC+dp5AflzwYZ5XDBXwrMai9vUif3JCEmpLUcYnb4gEEu7OMVAi9pNxQPkt1Oel9bRCtm
	kEU94dWoezJrXdmO8asBjGMTNft95KrgIM4K841
X-Google-Smtp-Source: AGHT+IEq1YvG6zbL6Ygo8UozQLCnIYEHff8lBMP5IeSQyHEJHGe/PDTCbiqIOBQGWJ+udPp+lSW5A67VTVSgMp5OR/E=
X-Received: by 2002:a05:6214:6108:b0:769:11cc:6506 with SMTP id
 6a1803df08f44-76911cc66camr81227676d6.15.1757816556561; Sat, 13 Sep 2025
 19:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-3-laoar.shao@gmail.com>
 <4d676324-adc6-4c4c-9d2b-a5e9725bcd6c@lucifer.local> <CALOAHbB_jrsgEMH=HNozW+rASRLwiy9+QtspmSgM7jtZJMthXg@mail.gmail.com>
 <59432a1d-9b70-4257-aafe-0adb68db4c9f@lucifer.local>
In-Reply-To: <59432a1d-9b70-4257-aafe-0adb68db4c9f@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 14 Sep 2025 10:22:00 +0800
X-Gm-Features: AS18NWAAP_Q4ZYAPxNiOveX2Fqvb-mAGv7veWF4qhs1GCX2qEv_7YQSXYufBWUY
Message-ID: <CALOAHbB2Z08AZ+QFXiZB_DX2Qm2xBDf=k_pLmdxuyQqpW_6a_A@mail.gmail.com>
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

On Fri, Sep 12, 2025 at 7:53=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Sep 12, 2025 at 04:28:46PM +0800, Yafang Shao wrote:
> > On Thu, Sep 11, 2025 at 10:34=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Wed, Sep 10, 2025 at 10:44:39AM +0800, Yafang Shao wrote:
> > > > This patch introduces a new BPF struct_ops called bpf_thp_ops for d=
ynamic
> > > > THP tuning. It includes a hook bpf_hook_thp_get_order(), allowing B=
PF
> > > > programs to influence THP order selection based on factors such as:
> > > > - Workload identity
> > > >   For example, workloads running in specific containers or cgroups.
> > > > - Allocation context
> > > >   Whether the allocation occurs during a page fault, khugepaged, sw=
ap or
> > > >   other paths.
> > > > - VMA's memory advice settings
> > > >   MADV_HUGEPAGE or MADV_NOHUGEPAGE
> > > > - Memory pressure
> > > >   PSI system data or associated cgroup PSI metrics
> > > >
> > > > The kernel API of this new BPF hook is as follows,
> > > >
> > > > /**
> > > >  * @thp_order_fn_t: Get the suggested THP orders from a BPF program=
 for allocation
> > > >  * @vma: vm_area_struct associated with the THP allocation
> > > >  * @vma_type: The VMA type, such as BPF_THP_VM_HUGEPAGE if VM_HUGEP=
AGE is set
> > > >  *            BPF_THP_VM_NOHUGEPAGE if VM_NOHUGEPAGE is set, or BPF=
_THP_VM_NONE if
> > > >  *            neither is set.
> > > >  * @tva_type: TVA type for current @vma
> > > >  * @orders: Bitmask of requested THP orders for this allocation
> > > >  *          - PMD-mapped allocation if PMD_ORDER is set
> > > >  *          - mTHP allocation otherwise
> > > >  *
> > > >  * Return: The suggested THP order from the BPF program for allocat=
ion. It will
> > > >  *         not exceed the highest requested order in @orders. Retur=
n -1 to
> > > >  *         indicate that the original requested @orders should rema=
in unchanged.
> > > >  */
> > > > typedef int thp_order_fn_t(struct vm_area_struct *vma,
> > > >                          enum bpf_thp_vma_type vma_type,
> > > >                          enum tva_type tva_type,
> > > >                          unsigned long orders);
> > > >
> > > > Only a single BPF program can be attached at any given time, though=
 it can
> > > > be dynamically updated to adjust the policy. The implementation sup=
ports
> > > > anonymous THP, shmem THP, and mTHP, with future extensions planned =
for
> > > > file-backed THP.
> > > >
> > > > This functionality is only active when system-wide THP is configure=
d to
> > > > madvise or always mode. It remains disabled in never mode. Addition=
ally,
> > > > if THP is explicitly disabled for a specific task via prctl(), this=
 BPF
> > > > functionality will also be unavailable for that task.
> > > >
> > > > This feature requires CONFIG_BPF_GET_THP_ORDER (marked EXPERIMENTAL=
) to be
> > > > enabled. Note that this capability is currently unstable and may un=
dergo
> > > > significant changes=E2=80=94including potential removal=E2=80=94in =
future kernel versions.
> > >
> > > Thanks for highlighting.
> > >
> > > >
> > > > Suggested-by: David Hildenbrand <david@redhat.com>
> > > > Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > ---
> > > >  MAINTAINERS             |   1 +
> > > >  include/linux/huge_mm.h |  26 ++++-
> > > >  mm/Kconfig              |  12 ++
> > > >  mm/Makefile             |   1 +
> > > >  mm/huge_memory_bpf.c    | 243 ++++++++++++++++++++++++++++++++++++=
++++
> > > >  5 files changed, 280 insertions(+), 3 deletions(-)
> > > >  create mode 100644 mm/huge_memory_bpf.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 8fef05bc2224..d055a3c95300 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -16252,6 +16252,7 @@ F:    include/linux/huge_mm.h
> > > >  F:   include/linux/khugepaged.h
> > > >  F:   include/trace/events/huge_memory.h
> > > >  F:   mm/huge_memory.c
> > > > +F:   mm/huge_memory_bpf.c
> > >
> > > THanks!
> > >
> > > >  F:   mm/khugepaged.c
> > > >  F:   mm/mm_slot.h
> > > >  F:   tools/testing/selftests/mm/khugepaged.c
> > > > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > > > index 23f124493c47..f72a5fd04e4f 100644
> > > > --- a/include/linux/huge_mm.h
> > > > +++ b/include/linux/huge_mm.h
> > > > @@ -56,6 +56,7 @@ enum transparent_hugepage_flag {
> > > >       TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG,
> > > >       TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG,
> > > >       TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG,
> > > > +     TRANSPARENT_HUGEPAGE_BPF_ATTACHED,      /* BPF prog is attach=
ed */
> > > >  };
> > > >
> > > >  struct kobject;
> > > > @@ -270,6 +271,19 @@ unsigned long __thp_vma_allowable_orders(struc=
t vm_area_struct *vma,
> > > >                                        enum tva_type type,
> > > >                                        unsigned long orders);
> > > >
> > > > +#ifdef CONFIG_BPF_GET_THP_ORDER
> > > > +unsigned long
> > > > +bpf_hook_thp_get_orders(struct vm_area_struct *vma, vm_flags_t vma=
_flags,
> > > > +                     enum tva_type type, unsigned long orders);
> > >
> > > Thanks for renaming!
> > >
> > > > +#else
> > > > +static inline unsigned long
> > > > +bpf_hook_thp_get_orders(struct vm_area_struct *vma, vm_flags_t vma=
_flags,
> > > > +                     enum tva_type tva_flags, unsigned long orders=
)
> > > > +{
> > > > +     return orders;
> > > > +}
> > > > +#endif
> > > > +
> > > >  /**
> > > >   * thp_vma_allowable_orders - determine hugepage orders that are a=
llowed for vma
> > > >   * @vma:  the vm area to check
> > > > @@ -291,6 +305,12 @@ unsigned long thp_vma_allowable_orders(struct =
vm_area_struct *vma,
> > > >                                      enum tva_type type,
> > > >                                      unsigned long orders)
> > > >  {
> > > > +     unsigned long bpf_orders;
> > > > +
> > > > +     bpf_orders =3D bpf_hook_thp_get_orders(vma, vm_flags, type, o=
rders);
> > > > +     if (!bpf_orders)
> > > > +             return 0;
> > >
> > > I think it'd be easier to just do:
> > >
> > >         /* The BPF-specified order overrides which order is selected.=
 */
> > >         orders &=3D bpf_hook_thp_get_orders(vma, vm_flags, type, orde=
rs);
> > >         if (!orders)
> > >                 return 0;
> >
> > good suggestion!
>
> Thanks, though this does come back to 'are we masking on orders' or not.
>
> Obviously this is predicated on that being the case.
>
> > > >  struct thpsize {
> > > > diff --git a/mm/Kconfig b/mm/Kconfig
> > > > index d1ed839ca710..4d89d2158f10 100644
> > > > --- a/mm/Kconfig
> > > > +++ b/mm/Kconfig
> > > > @@ -896,6 +896,18 @@ config NO_PAGE_MAPCOUNT
> > > >
> > > >         EXPERIMENTAL because the impact of some changes is still un=
clear.
> > > >
> > > > +config BPF_GET_THP_ORDER
> > >
> > > Yeah, I think we maybe need to sledgehammer this as already Lance was=
 confused
> > > as to the permenancy of this, and I feel that users might be too, eve=
n with the
> > > '(EXPERIMENTAL)' bit.
> > >
> > > So maybe
> > >
> > > config BPF_GET_THP_ORDER_EXPERIMENTAL
> > >
> > > Just to hammer it home?
> >
> > ack
>
> Thanks!
>
> >
> > >
> > > > +     bool "BPF-based THP order selection (EXPERIMENTAL)"
> > > > +     depends on TRANSPARENT_HUGEPAGE && BPF_SYSCALL
> > > > +
> > > > +     help
> > > > +       Enable dynamic THP order selection using BPF programs. This
> > > > +       experimental feature allows custom BPF logic to determine o=
ptimal
> > > > +       transparent hugepage allocation sizes at runtime.
> > > > +
> > > > +       WARNING: This feature is unstable and may change in future =
kernel
> > > > +       versions.
> > > > +
> > > >  endif # TRANSPARENT_HUGEPAGE
> > > >
> > > >  # simple helper to make the code a bit easier to read
> > > > diff --git a/mm/Makefile b/mm/Makefile
> > > > index 21abb3353550..f180332f2ad0 100644
> > > > --- a/mm/Makefile
> > > > +++ b/mm/Makefile
> > > > @@ -99,6 +99,7 @@ obj-$(CONFIG_MIGRATION) +=3D migrate.o
> > > >  obj-$(CONFIG_NUMA) +=3D memory-tiers.o
> > > >  obj-$(CONFIG_DEVICE_MIGRATION) +=3D migrate_device.o
> > > >  obj-$(CONFIG_TRANSPARENT_HUGEPAGE) +=3D huge_memory.o khugepaged.o
> > > > +obj-$(CONFIG_BPF_GET_THP_ORDER) +=3D huge_memory_bpf.o
> > > >  obj-$(CONFIG_PAGE_COUNTER) +=3D page_counter.o
> > > >  obj-$(CONFIG_MEMCG_V1) +=3D memcontrol-v1.o
> > > >  obj-$(CONFIG_MEMCG) +=3D memcontrol.o vmpressure.o
> > > > diff --git a/mm/huge_memory_bpf.c b/mm/huge_memory_bpf.c
> > > > new file mode 100644
> > > > index 000000000000..525ee22ab598
> > > > --- /dev/null
> > > > +++ b/mm/huge_memory_bpf.c
> > > > @@ -0,0 +1,243 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * BPF-based THP policy management
> > > > + *
> > > > + * Author: Yafang Shao <laoar.shao@gmail.com>
> > > > + */
> > > > +
> > > > +#include <linux/bpf.h>
> > > > +#include <linux/btf.h>
> > > > +#include <linux/huge_mm.h>
> > > > +#include <linux/khugepaged.h>
> > > > +
> > > > +enum bpf_thp_vma_type {
> > > > +     BPF_THP_VM_NONE =3D 0,
> > > > +     BPF_THP_VM_HUGEPAGE,    /* VM_HUGEPAGE */
> > > > +     BPF_THP_VM_NOHUGEPAGE,  /* VM_NOHUGEPAGE */
> > > > +};
> > >
> > > I'm really not so sure how useful this is - can't a user just ascerta=
in this
> > > from the VMA flags themselves?
> >
> > I assume you are referring to checking flags from vma->vm_flags.
> > There is an exception where we cannot use vma->vm_flags: in
> > hugepage_madvise(), which calls khugepaged_enter_vma(vma, *vm_flags).
> >
> > At this point, the VM_HUGEPAGE flag has not been set in vma->vm_flags
> > yet. Therefore, we must pass the separate *vm_flags variable.
> > Perhaps we can simplify the logic with the following change?
>
> Ugh god.
>
> I guess this is the workaround for the vm_flags thing right.
>
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 35ed4ab0d7c5..5755de80a4d7 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1425,6 +1425,8 @@ static int madvise_vma_behavior(struct
> > madvise_behavior *madv_behavior)
> >         VM_WARN_ON_ONCE(madv_behavior->lock_mode !=3D MADVISE_MMAP_WRIT=
E_LOCK);
> >
> >         error =3D madvise_update_vma(new_flags, madv_behavior);
> > +       if (new_flags & VM_HUGEPAGE)
> > +               khugepaged_enter_vma(vma);
>
> Hm ok, that's not such a bad idea, though ofc this should be something li=
ke:
>
>         if (!error && (new_flags & VM_HUGEPAGE))
>                 khugepaged_enter_vma(vma);

ack

>
> And obviously dropping this khugepaged_enter_vma() from hugepage_madvise(=
).

Thanks for the reminder.

--=20
Regards
Yafang

