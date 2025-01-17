Return-Path: <linux-doc+bounces-35526-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89189A146C4
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jan 2025 00:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF1721882634
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jan 2025 23:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D593132103;
	Thu, 16 Jan 2025 23:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="soYs/OPb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771125A636
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 23:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737071218; cv=none; b=sxJY4x3xa8cVi7SF8xf+lPLZ5JsPNIYUTepVah6xe8RXGNPW0fz461WmTEab1fHaUYZIY9UNXgWc7Atn/Vg4ih1XufnWx2jwHIccW8GyEB4m7bXXlhkXveI+tWTEzkt59CHqrP9Ri6fOCS36ZZcxTrGrGRW7EKN1l1elHpKvAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737071218; c=relaxed/simple;
	bh=3EwIz7mnMJW3m1YZtHus0i5SxyyBh7S8/iqg+UaggVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vFUnOG85/IKipsu69yLJcOz0O0W9pnfEngw+D/BlMmG2K6EvH+mOWL8fqDZzNh2WiJy7ZjyB66pSZuiNGv/2lrJz0JsA4y0vuhCyptSqtceqSGV2JRKHTtGdEa1+kGLF4NTh12XCDOb2Rd7vLUtnZJJ6GTI2TaeVkDgnnlafoTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=soYs/OPb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21681a2c0d5so28202225ad.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 15:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737071216; x=1737676016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+30IFm68jg6NDwHeVAkv6hKYafQ3ykW53j/B6i3wSI=;
        b=soYs/OPb1GMP4N4VminXwAHLP6eE8K9Nl/o7HMPuCsSsFqEVR5Dr3jwOZRxluNW/H2
         tDiSooS8PGErc8pLkpyb4oB74Np8DuNL1VrRRTMdK1YSlPkDSYCIMFyLn/Cuih3PJK0u
         WeTwcrZ0EfP6fOExabFbCOzErH6Xyv5fw3qztrHhfkojPHpO+yOPZkum7q+knufR9eJ0
         y+5xUx0NCiL8dc8F4/5/wX1wXoLaCGYNSht44J6tYdNn6q5+/XhV3fGxuJQg9glJowuA
         Znjm1cYgDCGYMc2kZcV+7teRuEjkzw+M4rimkOiC/8sF4qzIz/JKCNddA1RgNE5+V6ra
         H16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737071216; x=1737676016;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B+30IFm68jg6NDwHeVAkv6hKYafQ3ykW53j/B6i3wSI=;
        b=T5MegFHKO1NEn0Y1xY1hOs/xIwN0r9O6Ajd031fv4MBH/YfNtH7jndelEqwWLEnQ6T
         TSAt9CRV8dfUkTyjWY7MQ2aGPVw6+RtgHsJEiRnRGz79l4msciTPmlykzib7o4NNJBIZ
         nTgYRwgwTrzymJ4k/a8bW31x4rTpyBWuaLosN7ttn1r7dQfZm/veIVKvkGiEHL6zhf/M
         ZyreG4bg3F/5OXtFPQxyu5B06TKVr7BiuUHTaqj9JoVzQJGDVFbDt8dtLNHkE0lFxTgH
         75xAoAHabM03sulzuAhR7QCo9HcUe3MlDX1na1OPbfsH2TgBuUBeg+0XEQyxB3XjJW/D
         kS2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDufPln2mpEzquf/nKx37nHMktP6LYISlUik1j3zm49rbIiLo09nVCyaIiP1Vj+Cs9SmVNRQgyJuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXuijFdGXX/zcl6UMUfy8HlAo4io3v6xPXS1WkqeMBUeYopNVQ
	BhXh9RZ9NslnX+nF96qcK0RYkBM5t2pm9ohDoc7jixCw82ZVaKlNnm+bjcQ6eIzKVNW8doQN0Hx
	MMg==
X-Google-Smtp-Source: AGHT+IHZR21brkH4uVP110TgbprGaxMRRHTjbTHJnd3oJv8cZv6zsGMgvWQaUzQjRW3B/1TQyJ2Gb8Ip7wA=
X-Received: from pfbhx8.prod.google.com ([2002:a05:6a00:8988:b0:725:eccc:e998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2da5:b0:725:f1ca:fd8a
 with SMTP id d2e1a72fcca58-72dafb5580cmr1293395b3a.19.1737071216234; Thu, 16
 Jan 2025 15:46:56 -0800 (PST)
Date: Thu, 16 Jan 2025 15:46:54 -0800
In-Reply-To: <Z4mTdOc35hF26PeY@x1n>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n> <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n> <Z4lsxgFSdiqpNtdG@x1n> <Z4mFL8wfHjvz6F1Y@google.com>
 <CADrL8HW_hgKZBX98Z17eNqC3iJruwLJcFv=pswgT8hKayMYbzw@mail.gmail.com> <Z4mTdOc35hF26PeY@x1n>
Message-ID: <Z4mablD78z45k1u6@google.com>
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
From: Sean Christopherson <seanjc@google.com>
To: Peter Xu <peterx@redhat.com>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Yan Zhao <yan.y.zhao@intel.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, 
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025, Peter Xu wrote:
> On Thu, Jan 16, 2025 at 03:04:45PM -0800, James Houghton wrote:
> > On Thu, Jan 16, 2025 at 2:16=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Thu, Jan 16, 2025, Peter Xu wrote:
> > > > On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> > > > > > For the gmem case, userfaultfd cannot be used, so KVM Userfault=
 isn't
> > > > > > replacing it. And as of right now anyway, KVM Userfault *does* =
provide
> > > > > > a complete post-copy system for gmem.
> > > > > >
> > > > > > When gmem pages can be mapped into userspace, for post-copy to =
remain
> > > > > > functional, userspace-mapped gmem will need userfaultfd integra=
tion.
> > > > > > Keep in mind that even after this integration happens, userfaul=
tfd
> > > > > > alone will *not* be a complete post-copy solution, as vCPU faul=
ts
> > > > > > won't be resolved via the userspace page tables.
> > > > >
> > > > > Do you know in context of CoCo, whether a private page can be acc=
essed at
> > > > > all outside of KVM?
> > > > >
> > > > > I think I'm pretty sure now a private page can never be mapped to
> > > > > userspace.  However, can another module like vhost-kernel access =
it during
> > > > > postcopy?  My impression of that is still a yes, but then how abo=
ut
> > > > > vhost-user?
> > > > >
> > > > > Here, the "vhost-kernel" part represents a question on whether pr=
ivate
> > > > > pages can be accessed at all outside KVM.  While "vhost-user" par=
t
> > > > > represents a question on whether, if the previous vhost-kernel qu=
estion
> > > > > answers as "yes it can", such access attempt can happen in anothe=
r
> > > > > process/task (hence, not only does it lack KVM context, but also =
not
> > > > > sharing the same task context).
> > > >
> > > > Right after I sent it, I just recalled whenever a device needs to a=
ccess
> > > > the page, it needs to be converted to shared pages first..
> > >
> > > FWIW, once Trusted I/O comes along, "trusted" devices will be able to=
 access guest
> > > private memory.  The basic gist is that the IOMMU will enforce access=
 to private
> > > memory, e.g. on AMD the IOMMU will check the RMP[*], and I believe th=
e plan for
> > > TDX is to have the IOMMU share the Secure-EPT tables that are used by=
 the CPU.
> > >
> > > [*] https://www.amd.com/content/dam/amd/en/documents/developer/sev-ti=
o-whitepaper.pdf
>=20
> Thanks, Sean.  This is interesting to know..
>=20
> >=20
> > Hi Sean,
> >=20
> > Do you know what API the IOMMU driver would use to get the private
> > pages to map? Normally it'd use GUP, but GUP would/should fail for
> > guest-private pages, right?
>=20
> James,
>=20
> I'm still reading the link Sean shared, looks like there's answer in the
> white paper on this on assigned devices:
>=20
>         TDIs access memory via either guest virtual address (GVA) space o=
r
>         guest physical address (GPA) space.  The I/O Memory Management Un=
it
>         (IOMMU) in the host hardware is responsible for translating the
>         provided GVAs or GPAs into system physical addresses
>         (SPAs). Because SEV-SNP enforces access control at the time of
>         translation, the IOMMU performs RMP entry lookups on translation
>=20
> So I suppose after the device is attested and trusted, it can directly ma=
p
> everything if wanted, and DMA directly to the encrypted pages.

But as James called out, the kernel still needs to actually map guest_memfd
memory (all other memory is shared), and guest_memfd does not and will not =
ever
support GUP/mmap() of *private* memory.

There's an RFC that's under heavy discussion that I assume will handle some=
/all?
of this (I have largely ignored the thread).

https://lore.kernel.org/all/20250107142719.179636-1-yilun.xu@linux.intel.co=
m

> OTOH, for my specific question (on vhost-kernel, or vhost-user), I suppos=
e
> they cannot be attested but still be part of host software.. so I'm
> guessing they'll need to still stick with shared pages, and use a bounce
> buffer to do DMAs..

Yep.  There's no sane way to attest software that runs in "regular" mode on=
 the
CPU, and so things like device emulation and vhost will always be restricte=
d to
shared memory.

