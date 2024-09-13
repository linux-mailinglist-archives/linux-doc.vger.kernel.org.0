Return-Path: <linux-doc+bounces-25208-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E0E978858
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2024 21:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D53C61F28498
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2024 19:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C2313D51B;
	Fri, 13 Sep 2024 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eIDoxL9z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E0012D758
	for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726254080; cv=none; b=Qx6lgAUHVYtSO0MfLjV8Qutx8kz7zfmSajiMO5fl42Rc9IdFpPHGwA23Olo70vhpjEdeF5Y5yHJvOGvoiKKY0cKw6P3roFaKv1/ZFlsq9+PtpdX0XvF9XBsT/g0Zcay+PGSEnpoQq0p3yC9ke0hV4nLypFseE69Ev5HXGXywlHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726254080; c=relaxed/simple;
	bh=E1eRAu8n5ez/oUS4tq7qANEINJSQOuFuP0bxVY+xPPA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z9UHK5vqhfEasWfELrchFXAymdzAWtZ5hltoHdIvbWbEv3a4hNiIgRQLR4izYKXbhUAfR8uPTfVB/9zCPArHmO9eqlhvWzmJo1aQtI6CvBZRiB8oPgfJCISENgnzt+Q2+NgYlT7nj6wc9qetHoX1mf6voiUGatUAl80LvcVTIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eIDoxL9z; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e1ce98dcafaso2001090276.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726254078; x=1726858878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd5FUrdjat42hoHRpGz2FP5m+uOzjPunqQr7W48J0MY=;
        b=eIDoxL9zHnUz69jyVE52OewjTZUPlpOGlEbXO/XHDr3vzI8y8nkAHmhNACy6uvIsGI
         1/267aTw5lDVYLSC4DA+OgwNZQh1itBZHgk7jLo9mOqxn/UYhw5vZQIyJj2qLk1hBQcS
         vL5NHYJgv9561PSgD8X9d3N66MPmn++APD2clecdcfdYXlags0bZ07pp83hUPVdv2I4E
         n3leFiZOg9qKZBzJ3Sw/PXeXvb8Fc7DQArXpJbgjIXKgVZ3ITn5zNpt/uhrAtPO2O1r3
         gSe+Uep030wlQYm/fq8D8sCfAOiyhYPLACyY5qAZETII4+aWbS3+oMr9UA8LTSTR9oAT
         2t9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726254078; x=1726858878;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cd5FUrdjat42hoHRpGz2FP5m+uOzjPunqQr7W48J0MY=;
        b=bvPJ6Zm/p9fAE8OfrzU04N5p3CohC3H1eMGXPyp1mtJ4z2EluYoMZ1rkMkYkzfdlAq
         y6FyE7MHSybcQ/XppCfDhmKDDTOKIFxaLAku5T2fmwUWs4uISXMsXyG7vT+u0yCAnIo8
         vQLDz3Z31HtZbLFuxs/ZrdFk9Cn/JUUCxNl2am1a7CJT29xPUJ8DQ/vKiiP08tmshHqq
         vsDAIvp39fQn9DiKhmegiJc58r+YT8A8ZLG+be7S1+g5rSiu9fS6G2e+cFgjR19pYr4n
         wVDAoXz4wg4qVUGdxVSSku6ADw/wyiHnUZQQkZMn7ph4SAB3TBx7UsDYiNW+3rqv/mFN
         HCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkXVliLmAPoPw+lQpiFmvVN9MIiGcXIfbjRogF5b1jILndj0cIFvcjLJSHb2JK+tS6h10/6rN+SAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWK253ki94oTYgqne/jnkuPNGc5tfwyVT2EiUd06cUxDVE6d6a
	No8tQvsRWLcgF7ZtU/IpYOITNvBfGz9hxgPlx+55XbQUfQXPwdET+C0pHSXbRLcGcs1toIYPh8j
	7qQ==
X-Google-Smtp-Source: AGHT+IEDv8fggeewTOqZNOqNHA4N99QDZMuot5y4ilmd4s6i5ZFifjrvMHV2hbXtsE3V6EXZKIaTHsh+QCM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:74cb:0:b0:e1d:20cf:aec5 with SMTP id
 3f1490d57ef6-e1db010002emr7547276.9.1726254077940; Fri, 13 Sep 2024 12:01:17
 -0700 (PDT)
Date: Fri, 13 Sep 2024 12:01:16 -0700
In-Reply-To: <20240609154945.55332-6-nsaenz@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240609154945.55332-1-nsaenz@amazon.com> <20240609154945.55332-6-nsaenz@amazon.com>
Message-ID: <ZuSL_FCfvVywCPxm@google.com>
Subject: Re: [PATCH 05/18] KVM: x86: hyper-v: Introduce MP_STATE_HV_INACTIVE_VTL
From: Sean Christopherson <seanjc@google.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	graf@amazon.de, dwmw2@infradead.org, paul@amazon.com, mlevitsk@redhat.com, 
	jgowans@amazon.com, corbet@lwn.net, decui@microsoft.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	amoorthy@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 09, 2024, Nicolas Saenz Julienne wrote:
> Model inactive VTL vCPUs' behaviour with a new MP state.
>=20
> Inactive VTLs are in an artificial halt state. They enter into this
> state in response to invoking HvCallVtlCall, HvCallVtlReturn.
> User-space, which is VTL aware, can processes the hypercall, and set the
> vCPU in MP_STATE_HV_INACTIVE_VTL. When a vCPU is run in this state it'll
> block until a wakeup event is received. The rules of what constitutes an
> event are analogous to halt's except that VTL's ignore RFLAGS.IF.
>
> When a wakeup event is registered, KVM will exit to user-space with a
> KVM_SYSTEM_EVENT exit, and KVM_SYSTEM_EVENT_WAKEUP event type.
> User-space is responsible of deciding whether the event has precedence
> over the active VTL and will switch the vCPU to KVM_MP_STATE_RUNNABLE
> before resuming execution on it.
>=20
> Running a KVM_MP_STATE_HV_INACTIVE_VTL vCPU with pending events will
> return immediately to user-space.
>=20
> Note that by re-using the readily available halt infrastructure in
> KVM_RUN, MP_STATE_HV_INACTIVE_VTL correctly handles (or disables)
> virtualisation features like the VMX preemption timer or APICv before
> blocking.

IIUC, this is a convoluted and roundabout way to let userspace check if a v=
CPU
has a wake event, correct?  Even by the end of the series, KVM never sets
MP_STATE_HV_INACTIVE_VTL, i.e. the only use for this is to combine it as:

  KVM_SET_MP_STATE =3D> KVM_RUN =3D> KVM_SET_MP_STATE =3D> KVM_RUN

The upside to this approach is that it requires minimal uAPI and very few K=
VM
changes, but that's about it AFAICT.  On the other hand, making this so pai=
nfully
specific feels like a missed opportunity, and unnecessarily bleeds VTL deta=
ils
into KVM.

Bringing halt-polling into the picture (by going down kvm_vcpu_halt()) is a=
lso
rather bizarre since quite a bit of time has already elapsed since the vCPU=
 first
did HvCallVtlCall/HvCallVtlReturn.  But that doesn't really have anything t=
o do
with MP_STATE_HV_INACTIVE_VTL, e.g. it'd be just as easy to go to kvm_vcpu_=
block().

Why not add an ioctl() to very explicitly block until a wake event is ready=
?
Or probably better, a generic "wait" ioctl() that takes the wait type as an
argument.

Kinda like your idea of supporting .poll() on the vCPU FD[*], except it's v=
ery
specifically restricted to a single caller (takes vcpu->mutex).  We could p=
robably
actually implement it via .poll(), but I suspect that would be more confusi=
ng than
helpful.

E.g. extract the guts of vcpu_block() to a separate helper, and then wire t=
hat
up to an ioctl().

As for the RFLAGS.IF quirk, maybe handle that via a kvm_run flag?  That way=
,
userspace doesn't need to do a round-trip just to set a single bit.  E.g. I=
 think
we should be able to squeeze it into "struct kvm_hyperv_exit".

Actually, speaking of kvm_hyperv_exit, is there a reason we can't simply wi=
re up
HVCALL_VTL_CALL and/or HVCALL_VTL_RETURN to a dedicated complete_userspace_=
io()
callback that blocks if some flag is set?  That would make it _much_ cleane=
r to
scope the RFLAGS.IF check to kvm_hyperv_exit, and would require little to n=
o new
uAPI.

> @@ -3797,6 +3798,10 @@ bool svm_interrupt_blocked(struct kvm_vcpu *vcpu)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!gif_set(svm))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;
>
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* The Hyper-V TLFS states that RFLAGS.IF is =
ignored when deciding
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* whether to block interrupts targeted at in=
active VTLs.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_guest_mode(vcpu)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* As long as int=
errupts are being delivered... =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((svm->nested.=
ctl.int_ctl & V_INTR_MASKING_MASK)
> @@ -3808,7 +3813,7 @@ bool svm_interrupt_blocked(struct kvm_vcpu *vcpu)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nested_exit_o=
n_intr(svm))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return false;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!svm_get_if_flag(v=
cpu))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!svm_get_if_flag(v=
cpu) && !kvm_hv_vcpu_is_idle_vtl(vcpu))

Speaking of RFLAGS.IF, I think it makes sense to add a common x86 helper to=
 handle
the RFLAGS.IF vs. idle VTL logic.  Naming will be annoying, but that's abou=
t it.

E.g. kvm_is_irq_blocked_by_rflags_if() or so.

[*] https://lore.kernel.org/lkml/20231001111313.77586-1-nsaenz@amazon.com

