Return-Path: <linux-doc+bounces-48477-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2FAD2A43
	for <lists+linux-doc@lfdr.de>; Tue, 10 Jun 2025 01:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C3FA170E97
	for <lists+linux-doc@lfdr.de>; Mon,  9 Jun 2025 23:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AB4227E82;
	Mon,  9 Jun 2025 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DvQ3VvWy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF77226545
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 23:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749510304; cv=none; b=MdMwSt0wc9l4YDLts5p+pyAE1IFAPCwq75/AQ8kwsOOKFv/08Y3sGzLCsw/MS+5Ggfa5tZz/V5xq0qRwrkNLlqgXlPWkUs6O3qpMQ12H9lNqQ8RVPJtecnMpKTf2fEhwkLnx8hbV+jGUNWHXHQDTxr417wDgFJmNqo/nBpsnGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749510304; c=relaxed/simple;
	bh=8JQVGbTAqQUabzFe20anuyHGA4gpZl+ONkN6GLx8ymI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBp01lThwDvfPzvKIYu8ffJ1qYXTJ3DCLwg90qKUOxD/Bs4zLWMAoFNL5K1Vyr17i2OOiKPabrgyUkg2ZS3flnFUVA8Uq6f5shO+R3Bh9wXh+r+vOUk2gh2b5v+/MOVeA0KEeBaClvU0yHa0iAHnQOwnz1bjsjNufFm49L/lwOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DvQ3VvWy; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e75668006b9so4625827276.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Jun 2025 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749510301; x=1750115101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7+cVr8dsExjTk3ijrllXSzAu8Gblm5oL77kdyoH2ZE=;
        b=DvQ3VvWyq3FvzVm8BNKbZvXYbIOhxV8vmBzMEqQ9oKXdIKRumc0brDSk/kf+NRmTC+
         2Ix0nE+oI2oCeQfSsZrBCTrnQVTj/UyRNhGLkkw22bh6mxO3LPLYg+lBWwnWOBr26rze
         h00OuudIbD300dhvJpSQorDzKDm2Ebo5s3DeUSsU8H/knMwurQw53gOqc4LqbF84mL5H
         G0iwBD6kEJ3mNnlw8MCO0QJJH/5BX78cCAZN9QDs6sRq7EEGCjewotddFFzgL2qNPBsl
         NPU4j8bCBsjUhjFuSXCTwMk/QC1ZcYWwjXIpWqc2HScukEtzqpvywj9Dp+vvJO+cPlUj
         lCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510301; x=1750115101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7+cVr8dsExjTk3ijrllXSzAu8Gblm5oL77kdyoH2ZE=;
        b=XajqgJvHDJ8HDZXkxqxvoFjNcVwvJ6lt/sHBYwAE3akacBZ3qdktS/Df51u0bZCUfX
         lNpcDYbf37LfMi4fO6PCxIcnJVXg5J9bvaPH+Idv7llNOC7L8I2ZLiIyF1/Lq66PSgIr
         +OcTzqWzzpLhiSbbK0n8ZALJm+4dcd3zQ0A61tobTPfYqRhxZphGwfwlbEIwYcZrc0ac
         NNMtLN4um87xGj1sTwdAxeKW/W1tZCaT5tCI1JIl8Q81gNMUeWrZ6XHIdAweakNBAn5d
         4O2AGELSvbwnIUG7XBgGuNd2lvmYE0DAh5INQwkKhslv/vTj9d2UEua8TCIcB13XtjCP
         SPNA==
X-Forwarded-Encrypted: i=1; AJvYcCWdrh5ARiFUT07iKpVkJBw81JeIVF6yMIb6f3N1V33sJOlR7rDvObHblM3DaTdfIp/w/QpzXt5HInE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNiwKPhXq+7sPzUwQwu+xEbwoBJ4rJxKqT3Qq9bR5iHzN0Aswh
	SKSOU6h0mjAP92HBIV3l6evX4shtAr1UYaAkfvWveeWfwVFzwX9TdzOsldSmHOjlycKjt8cX9Rx
	w/8gjQkgxdUAadGUwRG/v4zvqjQ93amnQiB6mmbA0
X-Gm-Gg: ASbGncuxBigrh3Wj/o73U5U9b0KCRMM6FXE7JT+bcgmE7UoVgpBMVdwT1SXO47szl8i
	iU+w4W9hoaN2W+DnatowUaaIPN9+qcErpEN1TcbaTRnzfh0+p3cNINQcMvlV//o5g4PpJEcpjwt
	XxGTtuds+CTWc3SrxqMxmwTjIzn2y3kbv5ntqCihBPcfAGhbHP+ZXz4eNbVCT3rScHBwoNmksIu
	A==
X-Google-Smtp-Source: AGHT+IHDN7yYiqZfvU9YYp0Xn0iNVyQLG2U2NkvCT1T2HFwTM8W1uiwWGtxc6CrVQKMfQxc4kQw9Dq00AIFK5/ldCts=
X-Received: by 2002:a05:690c:360e:b0:70d:f3bb:a731 with SMTP id
 00721157ae682-710f76949a7mr201808267b3.9.1749510300215; Mon, 09 Jun 2025
 16:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDdILHOu9g-m5hSm@google.com> <20250528201756.36271-1-jthoughton@google.com>
 <aDebZD1Kmmg15zs7@google.com>
In-Reply-To: <aDebZD1Kmmg15zs7@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 9 Jun 2025 16:04:24 -0700
X-Gm-Features: AX0GCFsscOLeJsC5afeLhStDd6O3F0bHoTP2OBA-juWmkL4Q85V0QPpPjCgJ_5E
Message-ID: <CADrL8HWwWN6tgV5ws8HMmeONmmhx_xS5ZSHgV7E6Cg=NDrqCTQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
To: Sean Christopherson <seanjc@google.com>
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	kalyazin@amazon.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	pbonzini@redhat.com, peterx@redhat.com, pgonda@google.com, 
	wei.w.wang@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 4:25=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, May 28, 2025, James Houghton wrote:
> > On Wed, May 28, 2025 at 1:30=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index c5d21bcfa3ed4..f1db3f7742b28 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -2127,15 +2131,23 @@ void kvm_arch_commit_memory_region(struct kvm *=
kvm,
> >                                  const struct kvm_memory_slot *new,
> >                                  enum kvm_mr_change change)
> >  {
> > -     bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> > +     u32 old_flags =3D old ? old->flags : 0;
> > +     u32 new_flags =3D new ? new->flags : 0;
> > +
> > +     /*
> > +      * If only changing flags, nothing to do if not toggling
> > +      * dirty logging.
> > +      */
> > +     if (change =3D=3D KVM_MR_FLAGS_ONLY &&
> > +         !((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> > +             return;
> >
> >       /*
> >        * At this point memslot has been committed and there is an
> >        * allocated dirty_bitmap[], dirty pages will be tracked while th=
e
> >        * memory slot is write protected.
> >        */
> > -     if (log_dirty_pages) {
> > -
> > +     if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
> >               if (change =3D=3D KVM_MR_DELETE)
> >                       return;
> >
> >
> > So we need to bail out early if we are enabling KVM_MEM_USERFAULT but
> > KVM_MEM_LOG_DIRTY_PAGES is already enabled, otherwise we'll be
> > write-protecting a bunch of PTEs that we don't need or want to WP.
> >
> > When *disabling* KVM_MEM_USERFAULT, we definitely don't want to WP
> > things, as we aren't going to get the unmap afterwards anyway.
> >
> > So the check we started with handles this:
> > > > > > +       u32 old_flags =3D old ? old->flags : 0;
> > > > > > +       u32 new_flags =3D new ? new->flags : 0;
> > > > > > +
> > > > > > +       /* Nothing to do if not toggling dirty logging. */
> > > > > > +       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES=
))
> > > > > > +               return;
> >
> > So why also check for `change =3D=3D KVM_MR_FLAGS_ONLY` as well? Everyt=
hing I just
> > said doesn't really apply when the memslot is being created, moved, or
> > destroyed. Otherwise, consider the case where we never enable dirty log=
ging:
> >
> >  - Memslot deletion would be totally broken; we'll see that
> >    KVM_MEM_LOG_DIRTY_PAGES is not getting toggled and then bail out, sk=
ipping
> >    some freeing.
>
> No, because @new and thus new_flags will be 0.  If dirty logging wasn't e=
nabled,
> then there's nothing to be done.
>
> >  - Memslot creation would be broken in a similar way; we'll skip a bunc=
h of
> >    setup work.
>
> No, because @old and thus old_flags will be 0.  If dirty logging isn't be=
ing
> enabled, then there's nothing to be done.
>
> >  - For memslot moving, the only case that we could possibly be leaving
> >    KVM_MEM_LOG_DIRTY_PAGES set without the change being KVM_MR_FLAGS_ON=
LY,
> >    I think we still need to do the split and WP stuff.
>
> No, because KVM invokes kvm_arch_flush_shadow_memslot() on the memslot an=
d marks
> it invalid prior to installing the new, moved memslot.  See kvm_invalidat=
e_memslot().
>
> So I'm still not seeing what's buggy.

Sorry, I didn't see your reply, Sean. :(

You're right, I was confusing the KVM_MEM_USERFAULT and
KVM_MEM_LOG_DIRTY_PAGES. I'll undo the little change I said I was
going to make.

Thank you!

