Return-Path: <linux-doc+bounces-33033-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D59F5049
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 17:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BA077A74A7
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 16:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339141F76A9;
	Tue, 17 Dec 2024 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wy1RNdCn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF61F76A4
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450695; cv=none; b=QJgmMiAY+cHOpo+1jDxM954XAZScrdOO6vYc6ow7N3CoRGr0EITZL7+VGqMiNNnuqBDHcdWUpTme2OFqnXfPbsapYABcQ/bbs1zgIdkLDxqNAzbcQNsOcq/BNQjHarMRypmTfYpX8cPKFUizHCFALMh/q1lEkr0PLEM+7kmluys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450695; c=relaxed/simple;
	bh=p18NSc8YiMWYziVkB5WL9lsfjAR5wMS8as5GOWQxRbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lat0VF2oQeuVBwVNE0L4uaZpgfmZVQgoCY8ai/qDLNi4mGEDWgcAuWNif6BXX2nfwPgrA6DhXuuzZ+3ZGi2aO8qFnsGdtRuWz01JgzCRHh43wUjfPUi/grGzbmx/+W3JtTtuKSxyz8jYjWbL4C1EJ4roQpAL1GhtJNqHtZqiqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wy1RNdCn; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679b5c66d0so239481cf.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 07:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734450692; x=1735055492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwo8OHNODHGIPbbawFUW6IeO7l6xrNKTiC2R4EB9I2w=;
        b=wy1RNdCne6imOP//PFOYuK/HQ3s4/j8/avgEFQjkkeTiU7lhQy56Dn8uAkqIIxYrQM
         l2kpCcPBlg4LqcOFVhFVtcyklHao1Be34wGKBEsn7IwmqgunCwnRNyVSJWBlPSKVJb8l
         7jcw7ktUaImDyYTmo/QEXIce9xDWzUAfdhAAQz+2nR7k+PEDZYQmFw5+N43mpHs/I90e
         crG44qIPfNBJCu9o2kRbU4eCeJjNvX3uDrhofmJtzimSUPnkV7KtMGuELSFCmNSnxtBR
         B+H+Qj74wsfhSH7RY3dayk7FDVaY/8nfauNeIq0uql7UCKXroIsQtUJmTTeXBAkAj0xX
         aAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734450692; x=1735055492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwo8OHNODHGIPbbawFUW6IeO7l6xrNKTiC2R4EB9I2w=;
        b=DgVECiRbSgLVOrdPgZnWsgL3BW5Zzv9JrpVUByCEwI0os1z3DDQGid7NVR2q3oWuFE
         1+gIi3lHWQfG2KpT8NOkkxycRNGzA+54kqA/ceUP7hMi60QKmRauguOBtKiyUTV6sjQ0
         Y/40FiExBOxrvoHwbyHAqyxv6DpJoWNnkZWZ0PoiMoO7Ti5nK77PFLjowrto1YscnW8d
         gicWDRp7nhuP/tJhu3q7DegqLT8JAv1Nf/aIMP6mjJEEsqfOR75G5BavVSvIEkDvqoQ0
         H0E0e6/eirCt638eNkz5xl55TuCZcFY1N0B1fxFrOCc93UcwM52Lt/YKvw8F5U+/0Zjm
         wxFA==
X-Forwarded-Encrypted: i=1; AJvYcCWedg7UGhm+5kSwkoDP3sVsSU0JEelBhue3VgYWKSpAef3zomUhEhHSZ87XjTXmgeP/ncvUwx5oMuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQr5FaWNw57wlOFRpa+Q9eVnW2Zgnj0qp0zm6h16m704CSrloI
	/HaT0KZ6cY+XzIiB68FUuIiHy47JTwdySGcC4ia7O+vJt8qZWOAiu8mqIkZwF/kJGFEh8oo1fZA
	W3VGE0TtxEqrnUXUKSyLguhWssqnQCrk31Slx
X-Gm-Gg: ASbGncsJ4057skVSf6vHAKj0P2mh8RVlLJfcMMDDPZSzKgYCGJPCGotZS4V+s/WG6zf
	vD4WMONiEcAL0lfU7VS8+QT4G+0/z582JyxpOWRYs04kqVAoFvQoQNGJbGf0vgkSJATzP
X-Google-Smtp-Source: AGHT+IEYYI+WVDOgTkdZqyIgQrd+MbF6i5eCTFLllBwis6eAgYhXVpj3HLVdgfiBc7hLCuPBK2IZh8GparcPVeH/kqA=
X-Received: by 2002:a05:622a:386:b0:466:91fd:74c0 with SMTP id
 d75a77b69052e-468f95b1a20mr4693301cf.0.1734450692037; Tue, 17 Dec 2024
 07:51:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-7-surenb@google.com>
 <CA+EESO5BiPvHSxLtsc-3k4Sv2B09J1MsWzGvCwG-eBh-7rdCyw@mail.gmail.com>
In-Reply-To: <CA+EESO5BiPvHSxLtsc-3k4Sv2B09J1MsWzGvCwG-eBh-7rdCyw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Dec 2024 07:51:21 -0800
Message-ID: <CAJuCfpF5xnx5357OwzLg3Vgpqqs+-bMOaRuX20u6ezH2T9W30w@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] mm: allow vma_start_read_locked/vma_start_read_locked_nested
 to fail
To: Lokesh Gidra <lokeshgidra@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 3:31=E2=80=AFAM Lokesh Gidra <lokeshgidra@google.co=
m> wrote:
>
> On Mon, Dec 16, 2024 at 11:24=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >
> > With upcoming replacement of vm_lock with vm_refcnt, we need to handle =
a
> > possibility of vma_start_read_locked/vma_start_read_locked_nested faili=
ng
> > due to refcount overflow. Prepare for such possibility by changing thes=
e
> > APIs and adjusting their users.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > ---
> >  include/linux/mm.h |  6 ++++--
> >  mm/userfaultfd.c   | 17 ++++++++++++-----
> >  2 files changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 689f5a1e2181..0ecd321c50b7 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -747,10 +747,11 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >   * not be used in such cases because it might fail due to mm_lock_seq =
overflow.
> >   * This functionality is used to obtain vma read lock and drop the mma=
p read lock.
> >   */
> > -static inline void vma_start_read_locked_nested(struct vm_area_struct =
*vma, int subclass)
> > +static inline bool vma_start_read_locked_nested(struct vm_area_struct =
*vma, int subclass)
> >  {
> >         mmap_assert_locked(vma->vm_mm);
> >         down_read_nested(&vma->vm_lock.lock, subclass);
> > +       return true;
> >  }
> >
> >  /*
> > @@ -759,10 +760,11 @@ static inline void vma_start_read_locked_nested(s=
truct vm_area_struct *vma, int
> >   * not be used in such cases because it might fail due to mm_lock_seq =
overflow.
> >   * This functionality is used to obtain vma read lock and drop the mma=
p read lock.
> >   */
> > -static inline void vma_start_read_locked(struct vm_area_struct *vma)
> > +static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> >  {
> >         mmap_assert_locked(vma->vm_mm);
> >         down_read(&vma->vm_lock.lock);
> > +       return true;
> >  }
> >
> >  static inline void vma_end_read(struct vm_area_struct *vma)
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index bc9a66ec6a6e..79e8ae676f75 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -85,7 +85,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm=
_struct *mm,
> >         mmap_read_lock(mm);
> >         vma =3D find_vma_and_prepare_anon(mm, address);
> >         if (!IS_ERR(vma))
> > -               vma_start_read_locked(vma);
> > +               if (!vma_start_read_locked(vma))
> > +                       vma =3D ERR_PTR(-EAGAIN);
> >
> >         mmap_read_unlock(mm);
> >         return vma;
> > @@ -1483,10 +1484,16 @@ static int uffd_move_lock(struct mm_struct *mm,
> >         mmap_read_lock(mm);
> >         err =3D find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap,=
 src_vmap);
> >         if (!err) {
> > -               vma_start_read_locked(*dst_vmap);
> > -               if (*dst_vmap !=3D *src_vmap)
> > -                       vma_start_read_locked_nested(*src_vmap,
> > -                                               SINGLE_DEPTH_NESTING);
> > +               if (!vma_start_read_locked(*dst_vmap)) {
>
> I think you mistakenly reversed the condition. This block should be
> executed if we manage to lock dst_vma successfully.

Oops. Sorry, you are right. That above condition should have been
reversed. I'll fix it in the next revision.
Thanks!

> > +                       if (*dst_vmap !=3D *src_vmap) {
> > +                               if (!vma_start_read_locked_nested(*src_=
vmap,
> > +                                                       SINGLE_DEPTH_NE=
STING)) {
> > +                                       vma_end_read(*dst_vmap);
> > +                                       err =3D -EAGAIN;
> > +                               }
> > +                       }
> > +               } else
> > +                       err =3D -EAGAIN;
> >         }
> >         mmap_read_unlock(mm);
> >         return err;
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >

