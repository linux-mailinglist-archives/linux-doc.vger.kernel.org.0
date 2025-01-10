Return-Path: <linux-doc+bounces-34843-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15747A09C77
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 21:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A543AB19D
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 20:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D095717F4F2;
	Fri, 10 Jan 2025 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xBntnvaK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E57215160
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736541296; cv=none; b=ApWsxup+VGEVH60GrD/oWaAh86fj1IPNl7RKMCdExwTpCUYmCtIeG2UwvCGRgHrsssqcgH1AoZpo0uXxAkTlscDUrCb+tFngUkJx7ONYIv23/MtMDcg0hB51U/iD5PqFrLBrW67GKlRwfvghZhXfRu4LUtEHrzUaLLvn1WZQstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736541296; c=relaxed/simple;
	bh=d/M0jVZm0a+Zt167UaRLTLhdjrHsnmC1kZi/w9hlvqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=smxt5dEaCFitjppFZTE2UNFkrZGe85AC5Grc7au0okpSYvtgW0KPxAQvY71vgSWk1hxP/vwR+T3gW6YeXQiXlPiCcm+KX5RkakgKzCRy8R8k2W71E+KvpM2RhI1Zer39CKhQKiBfvdUgxb746TXsI6dSCO3jN+QFN/mMi/nxdok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xBntnvaK; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467896541e1so46951cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 12:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736541293; x=1737146093; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfc2COOnyMnzAA//UDIcuA90pEQo1Gwzn9YqKTubUlo=;
        b=xBntnvaKjv5NhcOR9IH/MW6QJKbazYqERsFGxE6q7YYbt5rt11ZD4OVgMfAHc3eRXg
         hsKJI6ov8eIxZVawJnUKpkaTZDUkFUxg92A5ztd7uProi0+qybeAS34Xq67GafpPVT3k
         J1WF9U9H5D0uLHhh1egac5CZ8IEVOaI1QZMNPqc63SiyHFmzG1rzn8mDOtpcYgw+jufe
         afQq4kEkfVqtTUSBj63nXksqpTbynCEjgCv4Kir12i2vs6rWLgBWn6DXtLQTrX4NqMhf
         j/tv/N5VZK46/VfYzRQwUHohRhTtx+zZ/b++f2O00NjwUpp4AfmPO4CPWSAP24YwcRui
         3eLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736541293; x=1737146093;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfc2COOnyMnzAA//UDIcuA90pEQo1Gwzn9YqKTubUlo=;
        b=D6tc/WUwDF8SaQvaXR0vpqnGv5iTIbC38nExhNboHPSwXN9TgzH0CZ93S1udllRym+
         ruOuveBxOKN9ejzFlasajjri3iHXesSsumMQQoHPs5NZKb5GoUqT8avp9IJk8BAQGtAj
         rop8+Z1y2v7ax4GCO1aiLxIHv0N/CY2RrA4GlM3EI7b3kugHJxm3lxgIffbBlyauYnjf
         9pdUE/O0d/S6TKJ3d/J7J0jIdfta6yutuIEOr01+lt0SD8kaVMtIpvALO2aFFj/pKAkr
         ivNKtAuUY9fT4pNbGBqnh5ndflY42kKxQTAQLka6TxmrU7U+y/bMVNCaereoNYO8nccx
         rWcA==
X-Forwarded-Encrypted: i=1; AJvYcCVYRcTfw44WXZedb3Wgadl7qe99XC3SARHVGISKLQm57kCh7duKztBCaRNbSUwAskkkqXsQtr41nO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9s65RDM9ESrYBwyQCcWvJFia7zXTaNDboSzST9vaG+A5yqk6W
	TqAVNCZvKk+qnPcAm4+SFv+ECDSjZObc1EdhxzBhBPIXWvlqmtvZtoiYOpKuqOnYb7BSoo3JlU5
	9smSYjzP3+zIpib1HcnYvkWJMdPqQn5xT7r9s
X-Gm-Gg: ASbGncu84/LL3DLPLR0GO2RObyWMXg8j8wmF8lQGarxTx0z4fqgxDGxKgmrrbHs2/Rv
	61HgjCWfSqz5Z1TNOz4RcmTIsqN0MYRNPEXcnOA==
X-Google-Smtp-Source: AGHT+IGtqqI3TXLMiG6opM5UmlrveNYcio+i6/z1dMyGaR37LhhpmrVEQZYom8LRjv5qs0CrHbDG/AFw9H1xrHbBadc=
X-Received: by 2002:a05:622a:1b91:b0:466:8c7c:3663 with SMTP id
 d75a77b69052e-46c89d3bcafmr4959821cf.5.1736541293295; Fri, 10 Jan 2025
 12:34:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-16-surenb@google.com>
 <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
 <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com> <ckqzumj4an54dgnrnyzkhzgvfcr35gmcq7ykfdcvudrd7dd753@cjaowcc6vz6n>
In-Reply-To: <ckqzumj4an54dgnrnyzkhzgvfcr35gmcq7ykfdcvudrd7dd753@cjaowcc6vz6n>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 12:34:42 -0800
X-Gm-Features: AbW1kvZCoB1h2hewskYj_-I0KU7cVd1ouvesflJPVIWesqxOa3OfLpcDrKUzo0A
Message-ID: <CAJuCfpFcn2s_gr21neLgLU990rOVMEZCADRAsXf3xUJPD0BbZQ@mail.gmail.com>
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 11:46=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [250110 14:08]:
> > On Fri, Jan 10, 2025 at 9:48=E2=80=AFAM Liam R. Howlett <Liam.Howlett@o=
racle.com> wrote:
> > >
> > > * Suren Baghdasaryan <surenb@google.com> [250108 21:31]:
> > > > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > > > object reuse before RCU grace period is over will be detected by
> > > > lock_vma_under_rcu().
> > > > Current checks are sufficient as long as vma is detached before it =
is
> > > > freed. The only place this is not currently happening is in exit_mm=
ap().
> > > > Add the missing vma_mark_detached() in exit_mmap().
> > > > Another issue which might trick lock_vma_under_rcu() during vma reu=
se
> > > > is vm_area_dup(), which copies the entire content of the vma into a=
 new
> > > > one, overriding new vma's vm_refcnt and temporarily making it appea=
r as
> > > > attached. This might trick a racing lock_vma_under_rcu() to operate=
 on
> > > > a reused vma if it found the vma before it got reused. To prevent t=
his
> > > > situation, we should ensure that vm_refcnt stays at detached state =
(0)
> > > > when it is copied and advances to attached state only after it is a=
dded
> > > > into the vma tree. Introduce vma_copy() which preserves new vma's
> > > > vm_refcnt and use it in vm_area_dup(). Since all vmas are in detach=
ed
> > > > state with no current readers when they are freed, lock_vma_under_r=
cu()
> > > > will not be able to take vm_refcnt after vma got detached even if v=
ma
> > > > is reused.
> > > > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facili=
tate
> > > > vm_area_struct reuse and will minimize the number of call_rcu() cal=
ls.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  include/linux/mm.h               |  2 -
> > > >  include/linux/mm_types.h         | 10 +++--
> > > >  include/linux/slab.h             |  6 ---
> > > >  kernel/fork.c                    | 72 ++++++++++++++++++++--------=
----
> > > >  mm/mmap.c                        |  3 +-
> > > >  mm/vma.c                         | 11 ++---
> > > >  mm/vma.h                         |  2 +-
> > > >  tools/testing/vma/vma_internal.h |  7 +---
> > > >  8 files changed, 59 insertions(+), 54 deletions(-)
> > > >
> > > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > > index 1d6b1563b956..a674558e4c05 100644
> > > > --- a/include/linux/mm.h
> > > > +++ b/include/linux/mm.h
> > > > @@ -258,8 +258,6 @@ void setup_initial_init_mm(void *start_code, vo=
id *end_code,
> > > >  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
> > > >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
> > > >  void vm_area_free(struct vm_area_struct *);
> > > > -/* Use only if VMA has no other users */
> > > > -void __vm_area_free(struct vm_area_struct *vma);
> > > >
> > > >  #ifndef CONFIG_MMU
> > > >  extern struct rb_root nommu_region_tree;
> > > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > > index 2d83d79d1899..93bfcd0c1fde 100644
> > > > --- a/include/linux/mm_types.h
> > > > +++ b/include/linux/mm_types.h
> > > > @@ -582,6 +582,12 @@ static inline void *folio_get_private(struct f=
olio *folio)
> > > >
> > > >  typedef unsigned long vm_flags_t;
> > > >
> > > > +/*
> > > > + * freeptr_t represents a SLUB freelist pointer, which might be en=
coded
> > > > + * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is ena=
bled.
> > > > + */
> > > > +typedef struct { unsigned long v; } freeptr_t;
> > > > +
> > > >  /*
> > > >   * A region containing a mapping of a non-memory backed file under=
 NOMMU
> > > >   * conditions.  These are held in a global tree and are pinned by =
the VMAs that
> > > > @@ -695,9 +701,7 @@ struct vm_area_struct {
> > > >                       unsigned long vm_start;
> > > >                       unsigned long vm_end;
> > > >               };
> > > > -#ifdef CONFIG_PER_VMA_LOCK
> > > > -             struct rcu_head vm_rcu; /* Used for deferred freeing.=
 */
> > > > -#endif
> > > > +             freeptr_t vm_freeptr; /* Pointer used by SLAB_TYPESAF=
E_BY_RCU */
> > > >       };
> > > >
> > > >       /*
> > > > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > > index 10a971c2bde3..681b685b6c4e 100644
> > > > --- a/include/linux/slab.h
> > > > +++ b/include/linux/slab.h
> > > > @@ -234,12 +234,6 @@ enum _slab_flag_bits {
> > > >  #define SLAB_NO_OBJ_EXT              __SLAB_FLAG_UNUSED
> > > >  #endif
> > > >
> > > > -/*
> > > > - * freeptr_t represents a SLUB freelist pointer, which might be en=
coded
> > > > - * and not dereferenceable if CONFIG_SLAB_FREELIST_HARDENED is ena=
bled.
> > > > - */
> > > > -typedef struct { unsigned long v; } freeptr_t;
> > > > -
> > > >  /*
> > > >   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> > > >   *
> > > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > > index 9d9275783cf8..770b973a099c 100644
> > > > --- a/kernel/fork.c
> > > > +++ b/kernel/fork.c
> > > > @@ -449,6 +449,41 @@ struct vm_area_struct *vm_area_alloc(struct mm=
_struct *mm)
> > > >       return vma;
> > > >  }
> > > >
> > >
> > > There exists a copy_vma() which copies the vma to a new area in the m=
m
> > > in rmap.  Naming this vma_copy() is confusing :)
> > >
> > > It might be better to just put this code in the vm_area_dup() or call=
 it
> > > __vm_area_dup(), or __vma_dup() ?
> >
> > Hmm. It's not really duplicating a vma but copying its content (no
> > allocation). How about __vm_area_copy() to indicate it is copying
> > vm_area_struct content?
> >
> > >
> > > > +static void vma_copy(const struct vm_area_struct *src, struct vm_a=
rea_struct *dest)
> > > > +{
> > > > +     dest->vm_mm =3D src->vm_mm;
> > > > +     dest->vm_ops =3D src->vm_ops;
> > > > +     dest->vm_start =3D src->vm_start;
> > > > +     dest->vm_end =3D src->vm_end;
> > > > +     dest->anon_vma =3D src->anon_vma;
> > > > +     dest->vm_pgoff =3D src->vm_pgoff;
> > > > +     dest->vm_file =3D src->vm_file;
> > > > +     dest->vm_private_data =3D src->vm_private_data;
> > > > +     vm_flags_init(dest, src->vm_flags);
> > > > +     memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > > > +            sizeof(dest->vm_page_prot));
> > > > +     /*
> > > > +      * src->shared.rb may be modified concurrently, but the clone
> > > > +      * will be reinitialized.
> > > > +      */
> > > > +     data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->sh=
ared)));
> > > > +     memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > > > +            sizeof(dest->vm_userfaultfd_ctx));
> > > > +#ifdef CONFIG_ANON_VMA_NAME
> > > > +     dest->anon_name =3D src->anon_name;
> > > > +#endif
> > > > +#ifdef CONFIG_SWAP
> > > > +     memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> > > > +            sizeof(dest->swap_readahead_info));
> > > > +#endif
> > > > +#ifndef CONFIG_MMU
> > > > +     dest->vm_region =3D src->vm_region;
> > > > +#endif
> > > > +#ifdef CONFIG_NUMA
> > > > +     dest->vm_policy =3D src->vm_policy;
> > > > +#endif
> > > > +}
> > > > +
> > > >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > > >  {
> > > >       struct vm_area_struct *new =3D kmem_cache_alloc(vm_area_cache=
p, GFP_KERNEL);
> > > > @@ -458,11 +493,7 @@ struct vm_area_struct *vm_area_dup(struct vm_a=
rea_struct *orig)
> > > >
> > > >       ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
> > > >       ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
> > > > -     /*
> > > > -      * orig->shared.rb may be modified concurrently, but the clon=
e
> > > > -      * will be reinitialized.
> > > > -      */
> > > > -     data_race(memcpy(new, orig, sizeof(*new)));
> > > > +     vma_copy(orig, new);
> > > >       vma_lock_init(new, true);
> > >
> > > I think this suffers from a race still?
> > >
> > > That is, we can still race between vm_lock_seq =3D=3D mm_lock_seq and=
 the
> > > lock acquire, where a free and reuse happens.  In the even that the
> > > reader is caught between the sequence and lock taking, the
> > > vma->vmlock_dep_map may not be replaced and it could see the old lock
> > > (or zero?) and things go bad:
> > >
> > > It could try to take vmlock_dep_map =3D=3D 0 in read mode.
> > >
> > > It can take the old lock, detect the refcnt is wrong and release the =
new
> > > lock.
> >
> > I don't think this race can happen. Notice a call to
> > vma_assert_detached() inside vm_area_free(), so before vma is freed
> > and possibly reused, it has to be detached. vma_mark_detached()
> > ensures that there are no current or future readers by executing the
> > __vma_enter_locked() + __vma_exit_locked() sequence if vm_refcnt is
> > not already at 0. Once __vma_exit_locked() is done, vm_refcnt is at 0
> > and any new reader will be rejected on
> > __refcount_inc_not_zero_limited(), before even checking vm_lock_seq =3D=
=3D
> > mm_lock_seq.
>
> Isn't the vm_lock_seq check before the ref count in vma_start_read()?
>
> From patch 11/16:
>
> @@ -720,13 +752,19 @@ static inline bool vma_start_read(struct vm_area_st=
ruct *vma)
>         if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->mm_l=
ock_seq.sequence))
>                 return false;
>
> -       if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
> +       /*
> +        * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() w=
ill fail
> +        * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> +        */
> +       if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &o=
ldcnt,
> +                                                     VMA_REF_LIMIT)))
>                 return false;
>
> +       rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
>
>
>
> >Even if a reader tries to sneak in between
> > __vma_enter_locked() and __vma_exit_locked() calls,
> > __refcount_inc_not_zero_limited() will reject it because
> > VMA_LOCK_OFFSET is set and VMA_REF_LIMIT will be violated.
> > IOW, when VMA is freed, it's guaranteed to be detached with no current
> > or future readers, therefore "race between vm_lock_seq =3D=3D mm_lock_s=
eq
> > and the lock acquire, where a free and reuse happens" should not be
> > possible.
> >
> > Did I understand your concern correctly and does my explanation make
> > sense to you?
>
> It is close to what Vlastimil said before.
>
> Here is the sequence for a NULL dereference, refcnt value is not needed:
>
> A:                      B:      C:
> lock_vma_under_rcu()
>   vma =3D mas_walk()
>   vma_start_read()
>     vm_lock_seq =3D=3D mm->mm_lock_seq.sequence
>
>                         vma_start_write
>                         vma detached and freed

At this point B makes vm_refcnt=3D=3D0.

>
>
>                                 vm_area_dup()
>                                 - vma reallocated
>                                 - zero vma

vm_refcnt here is still 0.

>

Here before calling rwsem_acquire_read(), the reader has to
successfully do __refcount_inc_not_zero_limited() and that will fail
because vm_refcnt=3D=3D0. So rwsem_acquire_read(NULL) will not be called.
What am I missing?

>     rwsem_acquire_read(NULL)
>
>
> Here is a sequence for unlocking the new lock while locking the old one.
> The refcnt failure detects the detached state but does not protect
> against the wrong lock use:
> A:                      B:      C:
> lock_vma_under_rcu()
>   vma =3D mas_walk()
>   vma_start_read()
>     vm_lock_seq =3D=3D mm->mm_lock_seq.sequence
>
>                         vma_start_write
>                         vma detached and freed
>
>                                 vm_area_dup()
>                                 - vma reallocated

vm_refcnt is still 0 after reallocation.

>
>     rwsem_acquire_read(old lock)
>     __refcount_inc_not_zero_limited() fails

Are we looking at the same code
(https://lore.kernel.org/all/20250109023025.2242447-12-surenb@google.com/)?
The sequence should be reversed here like this:

     if (!__refcount_inc_not_zero_limited())
              return false;
     rwsem_acquire_read(old lock)

and because __refcount_inc_not_zero_limited() fails,
rwsem_acquire_read(old lock) should never be called.

>
>                                 vma_init_lock();
>
>     rwsem_release(new lock)

The reader will not call rwsem_release(new lock) because it failed to
acquire the lock.

>
> I don't think avoiding the copy of the ref count from the old vma is
> enough to stop these races?
>
> Thanks,
> Liam
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

