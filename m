Return-Path: <linux-doc+bounces-31451-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE919D6388
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2024 18:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF215160F98
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2024 17:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F921DE3C9;
	Fri, 22 Nov 2024 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Koztfj+9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0041531DC
	for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732297664; cv=none; b=Tyux2r5J3cu7qKwgQg5hfww44QQ6gWPZjqX1xz4qYsxnT0cSGAdOtpYXtj1X+bXvR1zm0GDN1vq7HGvix5cE/YsCHJnQh0n5sy0SQUwCJiRMt8AcA47z5sTaonSSPfr/VzSM0527MD76qmgwYxT31YFUbw12uXVVBxX1F+mNWcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732297664; c=relaxed/simple;
	bh=48zIBxXc3flL9qIYqplgEZfbGli+Ia3OqfxWxf6ncLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOjm1KcEzjk4CgD8Xho6MXkdXgtIZALRGWDDlrVSdk7eWuzSXUpZ9njdtJI0EXt5T0m4MSXHV0ec68jrUnWpOCbXkAnHMY2lbH/aaG6wOUx8iuFbli1ERbP2VRuWYNjdXQzNyDkCNnnK4BtWkIduugD8QunJ7vmfusrR/XSTlF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Koztfj+9; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4635b03a3cdso211cf.1
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732297660; x=1732902460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXu6AT/ibx2XVcD9pO1ZbpAdsb4GGiSqwFIjR6ukUCw=;
        b=Koztfj+9j+kQdPPkEA6MkyiKPe6EyxQLSfPbRfI4BXxLMzRBaMHbujaQH318Dqo1V3
         fSiyxeISmto2R5JbA7lEm3KiiPJK9b/hfDdmdym+gV0ND8SumjhsNIJ/wGgDt+9ab5Rk
         o1fBayYmlgmxEL/r7BibIQwbawJ//ZF3HvnEF3r6gPcTO7E7qV/Trjr1WfJyo2xN6w3m
         ZScyGL7B8dZbxHITY8t0Y3dWoSdCQB37Mplm+Tyl67alce3h3eyt3GMp8mvPaN3YJlBD
         O5jOKTBUBgK4Ld3f4Rch+CVhH1f7rlMhx3iZ0s9z+V6Kc8J7F2UJ7ilW95V2t9KxI4Ue
         5DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732297660; x=1732902460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXu6AT/ibx2XVcD9pO1ZbpAdsb4GGiSqwFIjR6ukUCw=;
        b=JbRVGjyIGKSKDPxbNzNGS+myGpRI3dhlSHDTNyY7SbfFVxOThkEbxlUlfvpE/7W4uA
         YXyrsG4OSj0Y43biY7IqOwNFVtDWvh2ZU40CoGvGGbK/wtbbzFDZoL0zzY6dqF8GjgeB
         +/kvQQ4w8DWegvpPaGHmdUlvDyLd+tG/js1y1TUMFLmobQHmNl5RQZvOpFdf1naFKpEi
         PMWU3G2Vu7Uxv7ozBBd9fpjOeAdb/CLgKFj79EkR/rDPIV42RjOuD+8JcrzV54ugqslu
         X+1bxnfmwLQkYcKLcMieUPZKq7NDa+LzHBxzC3PL8Q8cRXBKXiUMe8D7ojZro2YSPFJQ
         YJSg==
X-Forwarded-Encrypted: i=1; AJvYcCUkDNv3yr+zoMzN2xpgSUwqF7Hmr2c2K6SHX0YePQEwFWXPanp0pSP8bx91LlotDDoVWeUqR+2IJcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpPFC71PUgICDQX0EkYe2G3VLFAN9OpbPDNaHj48HeP+9yZEOO
	g2+s6HQKMy0VxG+Kd1RxYQdjfHs8Uh+RqEtW829vo6wGXXzTLE3h/g4vCP5j1uyQQ7cU1+mrZZD
	6bOm8RWd/xvvkTjAhMXEiHA+69zS7ikjQRuLZ
X-Gm-Gg: ASbGncstAH5KXT0Uf1eexc01Lx15lqMoMPupINw8fjYN5mYNmm+5tNjnpoOpKH6AkRe
	Bj1FmwFN17oCadDiZIBf1T6XRk1yk8aZz2ZEyIU8HVWOECOsO6AfMGXhuviNYhg==
X-Google-Smtp-Source: AGHT+IFmgMkmysbndCTt9BLdV9WRe4B095x+9C/l5f22Xm7RKNPX/qreBplcxtPmMN6ho4wucxBBIS3mf6jg7JZqSiI=
X-Received: by 2002:a05:622a:206:b0:460:463d:78dd with SMTP id
 d75a77b69052e-4653d472de8mr4011941cf.4.1732297659816; Fri, 22 Nov 2024
 09:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com> <20241120000826.335387-4-surenb@google.com>
 <6460975a-46b2-481a-9073-55a5f2ac2f46@lucifer.local>
In-Reply-To: <6460975a-46b2-481a-9073-55a5f2ac2f46@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 22 Nov 2024 09:47:28 -0800
Message-ID: <CAJuCfpHCLiYENN7QrNCoZnYxXa9SELr47+YLiXSKA=K+UXxACg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] mm: mark vma as detached until it's added into vma tree
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 8:47=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Nov 19, 2024 at 04:08:24PM -0800, Suren Baghdasaryan wrote:
> > Current implementation does not set detached flag when a VMA is first
> > allocated. This does not represent the real state of the VMA, which is
> > detached until it is added into mm's VMA tree. Fix this by marking new
> > VMAs as detached and resetting detached flag only after VMA is added
> > into a tree.
> > Introduce vma_mark_attached() to make the API more readable and to
> > simplify possible future cleanup when vma->vm_mm might be used to
> > indicate detached vma and vma_mark_attached() will need an additional
> > mm parameter.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> I tested this (whole series) locally and on real hardware and did a kerne=
l
> compile on real hardware just to be sure :)) and all looks good.
>
> The code looks sensible, so:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks Lorenzo! I'll post a new version today, addressing Matthew's
and other's comments but overall functionality should stay the same.

>
> > ---
> >  include/linux/mm.h               | 27 ++++++++++++++++++++-------
> >  kernel/fork.c                    |  4 ++++
> >  mm/memory.c                      |  2 +-
> >  mm/vma.c                         |  6 +++---
> >  mm/vma.h                         |  2 ++
> >  tools/testing/vma/vma_internal.h | 17 ++++++++++++-----
> >  6 files changed, 42 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 737c003b0a1e..dd1b6190df28 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -808,12 +808,21 @@ static inline void vma_assert_locked(struct vm_ar=
ea_struct *vma)
> >               vma_assert_write_locked(vma);
> >  }
> >
> > -static inline void vma_mark_detached(struct vm_area_struct *vma, bool =
detached)
> > +static inline void vma_mark_attached(struct vm_area_struct *vma)
> > +{
> > +     vma->detached =3D false;
> > +}
> > +
> > +static inline void vma_mark_detached(struct vm_area_struct *vma)
> >  {
> >       /* When detaching vma should be write-locked */
> > -     if (detached)
> > -             vma_assert_write_locked(vma);
> > -     vma->detached =3D detached;
> > +     vma_assert_write_locked(vma);
> > +     vma->detached =3D true;
> > +}
> > +
> > +static inline bool is_vma_detached(struct vm_area_struct *vma)
> > +{
> > +     return vma->detached;
> >  }
> >
> >  static inline void release_fault_lock(struct vm_fault *vmf)
> > @@ -844,8 +853,8 @@ static inline void vma_end_read(struct vm_area_stru=
ct *vma) {}
> >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> >  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> >               { mmap_assert_write_locked(vma->vm_mm); }
> > -static inline void vma_mark_detached(struct vm_area_struct *vma,
> > -                                  bool detached) {}
> > +static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> > +static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> >
> >  static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_stru=
ct *mm,
> >               unsigned long address)
> > @@ -878,7 +887,10 @@ static inline void vma_init(struct vm_area_struct =
*vma, struct mm_struct *mm)
> >       vma->vm_mm =3D mm;
> >       vma->vm_ops =3D &vma_dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > -     vma_mark_detached(vma, false);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     /* vma is not locked, can't use vma_mark_detached() */
> > +     vma->detached =3D true;
> > +#endif
> >       vma_numab_state_init(vma);
> >       vma_lock_init(vma);
> >  }
> > @@ -1073,6 +1085,7 @@ static inline int vma_iter_bulk_store(struct vma_=
iterator *vmi,
> >       if (unlikely(mas_is_err(&vmi->mas)))
> >               return -ENOMEM;
> >
> > +     vma_mark_attached(vma);
> >       return 0;
> >  }
> >
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 7823797e31d2..f0cec673583c 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -465,6 +465,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_=
struct *orig)
> >       data_race(memcpy(new, orig, sizeof(*new)));
> >       vma_lock_init(new);
> >       INIT_LIST_HEAD(&new->anon_vma_chain);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     /* vma is not locked, can't use vma_mark_detached() */
> > +     new->detached =3D true;
> > +#endif
> >       vma_numab_state_init(new);
> >       dup_anon_vma_name(orig, new);
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 209885a4134f..d0197a0c0996 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -6279,7 +6279,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct =
mm_struct *mm,
> >               goto inval;
> >
> >       /* Check if the VMA got isolated after we found it */
> > -     if (vma->detached) {
> > +     if (is_vma_detached(vma)) {
> >               vma_end_read(vma);
> >               count_vm_vma_lock_event(VMA_LOCK_MISS);
> >               /* The area was replaced with another one */
> > diff --git a/mm/vma.c b/mm/vma.c
> > index 8a454a7bbc80..73104d434567 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -295,7 +295,7 @@ static void vma_complete(struct vma_prepare *vp, st=
ruct vma_iterator *vmi,
> >
> >       if (vp->remove) {
> >  again:
> > -             vma_mark_detached(vp->remove, true);
> > +             vma_mark_detached(vp->remove);
> >               if (vp->file) {
> >                       uprobe_munmap(vp->remove, vp->remove->vm_start,
> >                                     vp->remove->vm_end);
> > @@ -1220,7 +1220,7 @@ static void reattach_vmas(struct ma_state *mas_de=
tach)
> >
> >       mas_set(mas_detach, 0);
> >       mas_for_each(mas_detach, vma, ULONG_MAX)
> > -             vma_mark_detached(vma, false);
> > +             vma_mark_attached(vma);
> >
> >       __mt_destroy(mas_detach->tree);
> >  }
> > @@ -1295,7 +1295,7 @@ static int vms_gather_munmap_vmas(struct vma_munm=
ap_struct *vms,
> >               if (error)
> >                       goto munmap_gather_failed;
> >
> > -             vma_mark_detached(next, true);
> > +             vma_mark_detached(next);
> >               nrpages =3D vma_pages(next);
> >
> >               vms->nr_pages +=3D nrpages;
> > diff --git a/mm/vma.h b/mm/vma.h
> > index 388d34748674..2e680f357ace 100644
> > --- a/mm/vma.h
> > +++ b/mm/vma.h
> > @@ -162,6 +162,7 @@ static inline int vma_iter_store_gfp(struct vma_ite=
rator *vmi,
> >       if (unlikely(mas_is_err(&vmi->mas)))
> >               return -ENOMEM;
> >
> > +     vma_mark_attached(vma);
> >       return 0;
> >  }
> >
> > @@ -385,6 +386,7 @@ static inline void vma_iter_store(struct vma_iterat=
or *vmi,
> >
> >       __mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
> >       mas_store_prealloc(&vmi->mas, vma);
> > +     vma_mark_attached(vma);
> >  }
> >
> >  static inline unsigned long vma_iter_addr(struct vma_iterator *vmi)
> > diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_i=
nternal.h
> > index 11c2c38ca4e8..2fed366d20ef 100644
> > --- a/tools/testing/vma/vma_internal.h
> > +++ b/tools/testing/vma/vma_internal.h
> > @@ -414,13 +414,17 @@ static inline void vma_lock_init(struct vm_area_s=
truct *vma)
> >       vma->vm_lock_seq =3D UINT_MAX;
> >  }
> >
> > +static inline void vma_mark_attached(struct vm_area_struct *vma)
> > +{
> > +     vma->detached =3D false;
> > +}
>
> Yeah I think sensible to just accept that sometimes we are already attach=
ed
> when we mark attached.
>
> > +
> >  static inline void vma_assert_write_locked(struct vm_area_struct *);
> > -static inline void vma_mark_detached(struct vm_area_struct *vma, bool =
detached)
> > +static inline void vma_mark_detached(struct vm_area_struct *vma)
> >  {
> >       /* When detaching vma should be write-locked */
> > -     if (detached)
> > -             vma_assert_write_locked(vma);
> > -     vma->detached =3D detached;
> > +     vma_assert_write_locked(vma);
> > +     vma->detached =3D true;
> >  }
> >
> >  extern const struct vm_operations_struct vma_dummy_vm_ops;
> > @@ -431,7 +435,8 @@ static inline void vma_init(struct vm_area_struct *=
vma, struct mm_struct *mm)
> >       vma->vm_mm =3D mm;
> >       vma->vm_ops =3D &vma_dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > -     vma_mark_detached(vma, false);
> > +     /* vma is not locked, can't use vma_mark_detached() */
> > +     vma->detached =3D true;
> >       vma_lock_init(vma);
> >  }
> >
> > @@ -457,6 +462,8 @@ static inline struct vm_area_struct *vm_area_dup(st=
ruct vm_area_struct *orig)
> >       memcpy(new, orig, sizeof(*new));
> >       vma_lock_init(new);
> >       INIT_LIST_HEAD(&new->anon_vma_chain);
> > +     /* vma is not locked, can't use vma_mark_detached() */
> > +     new->detached =3D true;
> >
> >       return new;
> >  }
> > --
> > 2.47.0.338.g60cca15819-goog
> >

