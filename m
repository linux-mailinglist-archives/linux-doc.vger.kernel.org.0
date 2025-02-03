Return-Path: <linux-doc+bounces-36690-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3ECA26297
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 19:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53EEC3A18A5
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 18:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CE418B46E;
	Mon,  3 Feb 2025 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C87miaOZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB8A770E2
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607755; cv=none; b=d2act/6hFzLqgVMrGi1xrlLBPyxj5RP227uGAQJgm35ERuKe502gon7YVtZXXc0B6rX3stExdAyMhCu4LgVMd9OAD87uc02HVGyXVONf+cf+Vs4kTjeMAHEZNacsM9WqQbc+PrTl1iRpHw7h16Qjp7qjBRx7oKqydcV2ioPt72s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607755; c=relaxed/simple;
	bh=Uech+UHhv4sOC9RgVhkZjRiQR8BJsrRsxWJSMFeN6tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8RHSd93xZWKbhSgfEQVCIW+3n+NN4UtDEv0thOcT8oAujEy8HSDv98IBvjO3NGGQ/kZxNOVi51LF3FJ2lfOaaTud5iDgmHOmFLYZnlyl+SQwmIbgWOCZe+hBpVTsoDVqO2Qq9RmLHRFtcMgd+V1sfWF+cB35j5yQ4oXZKjmOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C87miaOZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so884338666b.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 10:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738607752; x=1739212552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGol6r61VcuNuEZWmMU6xs7WZxyGZ/9jqTylnkkwSoE=;
        b=C87miaOZKmm/iBzB3T8W+BF/P9yJ4+9ToEO8V99dbrAx6R5VwyJfv5e/Chff03zowi
         VCPyVGmVqEx+NFS7BYoJhXHIQJ+2JT9YcDvJIzAWu20jTlaUT/Yk6EnFddve0v9CqLx4
         5UJqGgpuMUP98Qbic7PDHT3aIoq3iwNxAvMR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607752; x=1739212552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGol6r61VcuNuEZWmMU6xs7WZxyGZ/9jqTylnkkwSoE=;
        b=YpSH+jsFqdo5SEUEdDj+hu+y8h5Ch7AhOU+BBZbhlNVs2euhDU0rSwDLdrP34wFfAs
         NTaXJcnAJFYMOA3lYolmRpqEKDt2mNhTrW5RQF9ocwzpuonNTsQblWRM4CgQWsvbfccw
         UapSOJGkzMpAiQYpValVL0JucacUGrZo3+wP+KATx7/PdoBeSCnsiSTsqdY/j4mmYWEs
         QurDPD4RTPVIHYCiIWYNeCy2MGzXLNlQsH2rY1ZPsZthUOrIDuC0MOIfpdHX1susmR9Y
         ekDIX3app5/0yeU3zCBLn3jmBGgwg+TfmhePqPr5hOh/LyGe4YAoCm99zfr5AjF0cgtz
         0YEg==
X-Forwarded-Encrypted: i=1; AJvYcCUF3VRv1i/mlpEF00dqRGSLDgBxn7SUZl+WGC4wIsQIHzaVA4oKmPeHG4xuT1PG5Fru8/+1FfPXD+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHq72HLEUkgO5wVvXqLBNcNtuirf1pBiFXyvDb8vEn36GIjoEs
	VhwUBVixCK5XSilnQQBqn67LLArTIJkeLMY9t/vONDJjbqP2ta7M8j3jwZZe7M7okfDDOCo6cu8
	smUs8ZGYBO93KyEquX+6+Lkmu63e3PU3HVdlvhfScAaxEDvodDwI+oPrES43EQ/39+wEoo+wcz2
	PzQQaemFd5JI7IH4+bDN3H0w==
X-Gm-Gg: ASbGncuv4jzQ6y5AqyoNQdEWCn78ARMdxrqnHWrYPjvfXkxE9nTob0jaiSVuhKcpsOm
	xHQsveJS/oVmU33/IViUCAez9mpvu7NUZZv8OImWXdoby5nHlqq2mBmbhvMTtJRadLxXJPPEa
X-Google-Smtp-Source: AGHT+IEH1diJZSoj3mI395z848+RHFqez3XxYAiGbf4Wp1Ry15eBzXvXYVZHA21MpEZ+9mdCsAnJwAUQqGiTPmRJ6wc=
X-Received: by 2002:a17:906:4789:b0:ab6:eeca:f548 with SMTP id
 a640c23a62f3a-ab6eecaf915mr1797979866b.50.1738607751915; Mon, 03 Feb 2025
 10:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADH9ctD1uf_yBA3NXNQu7TJa_TPhLRN=0YZ3j2gGhgmaFRdCFg@mail.gmail.com>
 <c3026876-8061-4ab2-9321-97cc05bad510@redhat.com> <CADH9ctBivnvP1tNcatLKzd8EDz8Oo6X65660j8ccxYzk3aFzCA@mail.gmail.com>
 <CABgObfZEyCQMiq6CKBOE7pAVzUDkWjqT2cgfbwjW-RseH8VkLw@mail.gmail.com>
 <CADH9ctA_C1dAOus1K+wOH_SOKTb=-X1sVawt5R=dkH1iGt8QUg@mail.gmail.com>
 <CABgObfZrTyft-3vqMz5w0ZiAhp-v6c32brgftynZGJO8OafrdA@mail.gmail.com>
 <CADH9ctBYp-LMbW4hm3+QwNoXvAc5ryVeB0L1jLY0uDWSe3vbag@mail.gmail.com>
 <b1ddb439-9e28-4a58-ba86-0395bfc081e0@redhat.com> <CADH9ctCFYtNfhn3SSp2jp0fzxu6s_X1A+wBNnzvHZVb8qXPk=g@mail.gmail.com>
 <CADH9ctB0YSYqC_Vj2nP20vMO_gN--KsqOBOu8sfHDrkZJV6pmw@mail.gmail.com>
 <Z2IXvsM0olS5GvbR@google.com> <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
 <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com> <CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com>
In-Reply-To: <CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com>
From: Doug Covelli <doug.covelli@broadcom.com>
Date: Mon, 3 Feb 2025 13:35:21 -0500
X-Gm-Features: AWEUYZlFtTN_u4MfQfTduijgXMnD-wyLVW9fBA2KFoXRMHjBmKRmtYPFwX9qdrM
Message-ID: <CADH9ctAzffvDByS1s2PJoD63On-b+pCnCmER4Nf4Zc=62vkbMA@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific hypercalls
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	kvm <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:22=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> On Mon, Feb 3, 2025 at 5:35=E2=80=AFPM Doug Covelli <doug.covelli@broadco=
m.com> wrote:
> > OK.  It seems like fully embracing the in-kernel APIC is the way to go
> > especially considering it really simplifies using KVM's support for nes=
ted
> > virtualization.  Speaking of nested virtualization we have been working=
 on
> > adding support for that and would like to propose a couple of changes:
> >
> > - Add an option for L0 to handle backdoor accesses from CPL3 code runni=
ng in L2.
> > On a #GP nested_vmx_l0_wants_exit can check if this option is enabled a=
nd KVM
> > can handle the #GP like it would if it had been from L1 (exit to userle=
vel iff
> > it is a backdoor access otherwwise deliver the fault to L2).  When comb=
ined with
> > enable_vmware_backdoor this will allow L0 to optionally handle backdoor=
 accesses
> > from CPL3 code running in L2.  This is needed for cases such as running=
 VMware
> > tools in a Windows VM with VBS enabled.  For other cases such as runnin=
g tools
> > in a Windows VM in an ESX VM we still want L1 to handle the backdoor ac=
cesses
> > from L2.
>
> I think this makes sense and could be an argument to KVM_ENABLE_CAP.
>
> > - Extend KVM_EXIT_MEMORY_FAULT for permission faults (e.g the guest att=
empting
> > to write to a page that has been protected by userlevel calling mprotec=
t).  This
> > is useful for cases where we want synchronous detection of guest writes=
 such as
> > lazy snapshots (dirty page tracking is no good for this case).  Current=
ly
> > permission faults result in KVM_RUN returning EFAULT which we handle by
> > interpreting the instruction as we do not know the guest physical addre=
ss
> > associated with the fault.
>
> Yes, this makes sense too, though you might want to look into
> userfaultfd as well.
>
> We had something planned using attributes, but I don't see any issue
> extending it to EFAULT. Maybe it would have to be yet another
> KVM_ENABLE_CAP; considering that it would break your existing code,
> there might be someone else in the wild doing it.

It looks like KVM_EXIT_MEMORY_FAULT was implemented in such a way that it
won't break existing code:

Note! KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in
that it accompanies a return code of =E2=80=98-1=E2=80=99, not =E2=80=980=
=E2=80=99! errno will always
be set to EFAULT or EHWPOISON when KVM exits with
KVM_EXIT_MEMORY_FAULT, userspace should assume kvm_run.exit_reason is
stale/undefined for all other error numbers.

That being said we could certainly make this opt-in if that is preferable.

Doug

> Paolo
>

--=20
This electronic communication and the information and any files transmitted=
=20
with it, or attached to it, are confidential and are intended solely for=20
the use of the individual or entity to whom it is addressed and may contain=
=20
information that is confidential, legally privileged, protected by privacy=
=20
laws, or otherwise restricted from disclosure to anyone else. If you are=20
not the intended recipient or the person responsible for delivering the=20
e-mail to the intended recipient, you are hereby notified that any use,=20
copying, distributing, dissemination, forwarding, printing, or copying of=
=20
this e-mail is strictly prohibited. If you received this e-mail in error,=
=20
please return the e-mail to the sender, delete it from your computer, and=
=20
destroy any printed copy of it.

