Return-Path: <linux-doc+bounces-14773-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF18AD150
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 17:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 601681F221CE
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 15:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E586E153567;
	Mon, 22 Apr 2024 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MAyHFqjR"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8F153513
	for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713801301; cv=none; b=KFwO7A2DFv9ZKE37DhLw3pomU4eaSYvNZJJi9GZ2JELhfzMFHliRpNsgFADlKXg8KbC3CpHdOgDkP8oprQRqtu7NGqLvl1R12xnRntndcIh2w4Xq+Z/A4GHZH3tGGdqjLo1YZhpv12StUEkDmFdga52OaVXPsnfCaybjgTkzgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713801301; c=relaxed/simple;
	bh=S24f1FSrq1sF+m6JW8GkCEgWL3cQbwVEjd5KUt/45t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+x1xJLfalxW7vMge87XmzYpWkyOPykjYo7U0Uc0FtV6UsDpbOJE4waxEscWj8CjUPt4DU/Qzv+x4NqQ3fKstJzximmlKvHQHpC79smEv+QPL2WQddIBu7A6nElc96+1dg+k3QzSD1GqVRVgYkdwiYsM6D1Qlqv2jKanr+TI9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MAyHFqjR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713801299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vrXScvRqVTWx0cmSFbg2HprZNqV52P7w+MYqkVyqleM=;
	b=MAyHFqjRT3btFGyAKdg5aXwm1dWDe7vvo3A115VjWSMB6kfBJVbzqNBg85a9PTNMrS6LjH
	v6Eqh353oyU99f6J/HL574K+y07Mg4aSzQBUPy2NWq1+Z/lql4Du8hvRspQeKRlBDcbNh/
	eS+/tuPAdhEYiUsLK7daHMzisJ83k9U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-B5845KLgOz6wqcFtApYIdA-1; Mon, 22 Apr 2024 11:54:57 -0400
X-MC-Unique: B5845KLgOz6wqcFtApYIdA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4183d08093bso27286995e9.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 08:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713801296; x=1714406096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrXScvRqVTWx0cmSFbg2HprZNqV52P7w+MYqkVyqleM=;
        b=KAzMmJXuKBiIRvjfnQfAUhFuli4sBX7vufiZxyTA4zBq27BAfXHjZ8hfclOEFdJGG5
         C9J8EG37RiI5Jio/NvELWypKiNXRszhaCRkQhHWUGbLI/tebRaXhQegCNLHJw5/k2rM4
         87uxw65G23bw3uqYwc6FQw2KfoJox9UAiiOwLt9Bt1YisByRKA340vPCqfeITzaZesjM
         OglmNHNAGTjFGC3Cmy3kdUuIrajAoJhGexfXEMvit7d20rX2Kb5MFdD6q2eySsASuqhb
         gSqZ3sa3aa99eRKnwcHn6ot/41pMPlCZlMlDOKAOealSkDjW/BX6rSCJYq/MXmpqYSqn
         yT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIQOIawtceXi6TGjdUd4uhTK6ZteF5I72umwO7jYECjXYHYWsXaQfHt6BGUPJCNLTT6mwLiYCIueOHvBJ2KYh75pmy4KDkWidg
X-Gm-Message-State: AOJu0YwI9cIwbq0P8Bj8WnWNBMIABQj+UJHk9/ClLJPzlwbIGKudjAhO
	7HwxWUc6ONw1DrVxRWXEMuYKAfkaBIhmCilzXQkRAwGAcLV8SqGKom19ienvdfQHa/VUO3AVs4f
	ld5u1D2ekv1QtRE3BvL6HQSSCV2e+KnfWH3venk37Fsy+AEBwa9qoUwzz1yCGI0TGtxnZfOwrsf
	6oot7cV366bIfAWJsYXpgtk8pTXxfoVlQN
X-Received: by 2002:a05:600c:4e0d:b0:41a:8b39:803b with SMTP id b13-20020a05600c4e0d00b0041a8b39803bmr1369176wmq.1.1713801296721;
        Mon, 22 Apr 2024 08:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkTcPyCSPPQtSYlQR7uDVxnB1gDryj1kgIix0MnGUIXw/SBKRVw/tNcQ3IV5cqzNp+/Ot6ubPK0sZ96Qu3ayI=
X-Received: by 2002:a05:600c:4e0d:b0:41a:8b39:803b with SMTP id
 b13-20020a05600c4e0d00b0041a8b39803bmr1369141wmq.1.1713801296335; Mon, 22 Apr
 2024 08:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418193528.41780-1-dwmw2@infradead.org> <20240418193528.41780-3-dwmw2@infradead.org>
 <CABgObfa0j34iEh81hhd7-t7ZM1GKAsvJb5xP6EoD2-c-8TnPqQ@mail.gmail.com> <a35e69e07b9cd297dac9993c886667add144e833.camel@infradead.org>
In-Reply-To: <a35e69e07b9cd297dac9993c886667add144e833.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 22 Apr 2024 17:54:44 +0200
Message-ID: <CABgObfbK0aqqmAz7Z2efX4hNf7WRBYpoJ1a07oKMZdFXS2r0+g@mail.gmail.com>
Subject: Re: [PATCH 02/10] KVM: x86: Improve accuracy of KVM clock when TSC
 scaling is in force
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Durrant <paul@xen.org>, Shuah Khan <shuah@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Marcelo Tosatti <mtosatti@redhat.com>, jalliste@amazon.co.uk, sveith@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 5:39=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:

> > ... especially considering that you did use a 64-bit integer here
> > (though---please use u64 not uint64_t; and BTW if you want to add a
> > patch to change kvm_get_time_scale() to u64, please do.
>
> Meh, I'm used to programming in C. Yes, I *am* old enough to have been
> doing this since the last decade of the 1900s, but it *has* been a long
> time since 1999, and my fingers have learned :)

Oh, I am on the same page (working on both QEMU and Linux, adapting my
muscle memory to the context sucks) but u64/s64 is the preferred
spelling and I have been asked to use them before.

> Heh, looks like it was you who made it uint64_t, in 2016. In a commit
> (3ae13faac) which said "Prepare for improving the precision in the next
> patch"... which never came, AFAICT?

Yes, it was posted as
https://lore.kernel.org/lkml/1454944711-33022-5-git-send-email-pbonzini@red=
hat.com/
but not committed.

As an aside, we discovered later that the patch you list as "Fixes"
fixed another tricky bug: before, kvmclock could jump if the TSC is
set within the 250 ppm tolerance that does not activate TSC scaling.
This is possible after a first live migration, and then the second
live migration used the guest TSC frequency *that userspace desired*
instead of the *actual* TSC frequency.

Before:

        this_tsc_khz =3D __this_cpu_read(cpu_tsc_khz);
        if (unlikely(vcpu->hw_tsc_khz !=3D this_tsc_khz)) {
                tgt_tsc_khz =3D vcpu->virtual_tsc_khz;
                kvm_get_time_scale(NSEC_PER_SEC / 1000, tgt_tsc_khz,
                        &vcpu->hv_clock.tsc_shift,
                        &vcpu->hv_clock.tsc_to_system_mul);
                vcpu->hw_tsc_khz =3D this_tsc_khz;

After:

        tgt_tsc_khz =3D __this_cpu_read(cpu_tsc_khz);

        // tgt_tsc_khz unchanged because TSC scaling was not enabled
        tgt_tsc_khz =3D kvm_scale_tsc(v, tgt_tsc_khz);

        if (unlikely(vcpu->hw_tsc_khz !=3D tgt_tsc_khz)) {
                kvm_get_time_scale(NSEC_PER_SEC / 1000, tgt_tsc_khz,
                        &vcpu->hv_clock.tsc_shift,
                        &vcpu->hv_clock.tsc_to_system_mul);
                vcpu->hw_tsc_khz =3D tgt_tsc_khz;

So in the first case kvm_get_time_scale uses vcpu->virtual_tsc_khz, in
the second case it uses __this_cpu_read(cpu_tsc_khz).

This then caused a mismatch between the actual guest frequency and
what is used by kvm_guest_time_update, which only becomes visible when
migration resets the clock with KVM_GET/SET_CLOCK. KVM_GET_CLOCK
returns what _should have been_ the same value read by the guest, but
it's wrong.

Paolo


