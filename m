Return-Path: <linux-doc+bounces-17563-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1958FA6AA
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2024 01:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F4141C22243
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jun 2024 23:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B4413CF96;
	Mon,  3 Jun 2024 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P7A4gCMe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EFE137C48
	for <linux-doc@vger.kernel.org>; Mon,  3 Jun 2024 23:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717458941; cv=none; b=OiCxaGtKwninXFhNgVNkNemU/UyKGG71Td6nwRp1LwlItBNUhyi+mGHh5p5QqwHenmExebNygqJv323DJO2x5LB/nKst7K/Db9bgT/NWYBYOYM2TVEngoYm8hDeELtSloCEGFG3pAK5Kr1fkhMtTPmu0Zui5EVnrEfizG0Gi27M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717458941; c=relaxed/simple;
	bh=FtElGgpsSSae4yBq/bi6DGunDESHxh82nwAJEBZ9Jnw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F759tdJeeRU6Xg5OmImo9Zs7aV/HI0uS3tfcxO5//jfscBe6rW9EBTcpAslJygOwBCD7isj6+gB1VDODhRVch0lbO7Mrn0qFsyJ/7OBTEFTwcVzkiDXsinjRIrBPDTBDclXTAIGo6rXxBupL+l10MPPyxQt8LrT703CoSByFUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P7A4gCMe; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6ca1d5c4153so2128054a12.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Jun 2024 16:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717458939; x=1718063739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyc3iUgsnRj2ylOv5YkMm98nGXjn6+X+INgnV8xLY/I=;
        b=P7A4gCMeTbiGSmwRjOOKCx6Uc7PaIGkwgzHSkyabB9m88gom/t7jFlBzQ5cXjlTpr1
         sZCRXXP/5iHnq3PeGqbH8gh9Sb8MFadqsAcnmBHoOLMFpc77EL1L3ZSmxiKBTpTWqqZ3
         81103mg6bdWV/dSXDhww8o7szGSQuGdSY3HXI4ASUkSLj4jcz+C9wdfFz3qhhB3LNGhz
         ubLt+LveEQbBAgvjnfDgv5BiF/CeDvNKJaJNQO+4468XONVO2eSDYP4JDlkYn8UWfMDe
         V/RlPUwl+ViSWcIPVraIKCIXE93tvKz65cK3Xp2c33Kuq7WbZ8o88iK4WeMB6xvFfnkp
         H6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717458939; x=1718063739;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eyc3iUgsnRj2ylOv5YkMm98nGXjn6+X+INgnV8xLY/I=;
        b=g4rUMzDi5GPx4mpaa3Y1Eg/g8dTnUA6JP8fSbM/0PCjoxCcEI2C4x4jWWQjTwmfagR
         7pxwg3aHXr0g1Y0uyrRHVEk0ndJI5YH5CkYtFuHe1IpoArvv96GCrbFo4di2/mT76DNC
         NhQLnhE5iYpJxKyScsRWZdiLHISDU34LyNdkrx1BcB3Ay2r+R2hAeMB2q87SPsx/R/yA
         O28t0hT51jvVHQ0Dco1hX8L5+mH6otAkU/kTOEzNgX1KyRZCI1ikICG28GrR0wK5DdC6
         dghtC4pdtWi1xkdjFLp8sJboy8Thb4K/kXOIhLjlcnrnFtXHuLXyOmf8MfQxtmRliUok
         1XEA==
X-Forwarded-Encrypted: i=1; AJvYcCXDklVVwJlxok1ansJXDafKXyWY9pec4J0D/zZ6QdWjmvu1SLIjWhjrais0bvhdH73Thdh3qfmJ/8CT561wou9BTHjjT1QI0Ww3
X-Gm-Message-State: AOJu0Ywd3Mo4tsNbjyQJLtjvrn+7w5JwaNcn7HK8yi+yGbXYStSubIEV
	ey2tLG9jnQTR7qGh8rjvLrL5Ch2U1PHa6Dky//99vQL605qK+Qx/cts/sq1SUkml6suhwHrK1wY
	a4A==
X-Google-Smtp-Source: AGHT+IHvGku2IN33k/AODaXK54zHq/P8X6Cha2dno1rLoXXrfnJJHDtnIbcRuwwzpgSt5TkILSo1ZXTh8Yo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3752:0:b0:6bf:6fc7:53c5 with SMTP id
 41be03b00d2f7-6c411b757afmr27306a12.6.1717458939174; Mon, 03 Jun 2024
 16:55:39 -0700 (PDT)
Date: Mon, 3 Jun 2024 16:55:37 -0700
In-Reply-To: <ZhkKb+lgPDNRsYXa@chao-email>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240410143446.797262-1-chao.gao@intel.com> <20240410143446.797262-2-chao.gao@intel.com>
 <CALMp9eR294v_2-yXagKR8HM_WbqihJ5JcRwD1NTGvJxsOFsnyw@mail.gmail.com> <ZhkKb+lgPDNRsYXa@chao-email>
Message-ID: <Zl5X-YHQL-tIUb4h@google.com>
Subject: Re: [RFC PATCH v3 01/10] KVM: VMX: Virtualize Intel IA32_SPEC_CTRL
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	daniel.sneddon@linux.intel.com, pawan.kumar.gupta@linux.intel.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024, Chao Gao wrote:
> On Thu, Apr 11, 2024 at 09:07:31PM -0700, Jim Mattson wrote:
> >On Wed, Apr 10, 2024 at 7:35=E2=80=AFAM Chao Gao <chao.gao@intel.com> wr=
ote:
> >>
> >> From: Daniel Sneddon <daniel.sneddon@linux.intel.com>
> >>
> >> Currently KVM disables interception of IA32_SPEC_CTRL after a non-0 is
> >> written to IA32_SPEC_CTRL by guest. The guest is allowed to write any
> >> value directly to hardware. There is a tertiary control for
> >> IA32_SPEC_CTRL. This control allows for bits in IA32_SPEC_CTRL to be
> >> masked to prevent guests from changing those bits.
> >>
> >> Add controls setting the mask for IA32_SPEC_CTRL and desired value for
> >> masked bits.
> >>
> >> These new controls are especially helpful for protecting guests that
> >> don't know about BHI_DIS_S and that are running on hardware that
> >> supports it. This allows the hypervisor to set BHI_DIS_S to fully
> >> protect the guest.
> >>
> >> Suggested-by: Sean Christopherson <seanjc@google.com>
> >> Signed-off-by: Daniel Sneddon <daniel.sneddon@linux.intel.com>
> >> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> >> [ add a new ioctl to report supported bits. Fix the inverted check ]
> >> Signed-off-by: Chao Gao <chao.gao@intel.com>
> >
> >This looks quite Intel-centric. Isn't this feature essentially the
> >same as AMD's V_SPEC_CTRL?

In spirit, yes.  In practice, not really.  The implementations required for=
 each
end up being quite different.  I think the only bit of code that could be r=
eused
by SVM, and isn't already, is the generation of supported_force_spec_ctrl.

+       kvm_caps.supported_force_spec_ctrl =3D 0;
+
+       if (cpu_has_spec_ctrl_shadow()) {
+               kvm_caps.supported_force_spec_ctrl |=3D SPEC_CTRL_IBRS;
+
+               if (boot_cpu_has(X86_FEATURE_STIBP))
+                       kvm_caps.supported_force_spec_ctrl |=3D SPEC_CTRL_S=
TIBP;
+
+               if (boot_cpu_has(X86_FEATURE_SSBD))
+                       kvm_caps.supported_force_spec_ctrl |=3D SPEC_CTRL_S=
SBD;
+
+               if (boot_cpu_has(X86_FEATURE_RRSBA_CTRL) &&
+                   (host_arch_capabilities & ARCH_CAP_RRSBA))
+                       kvm_caps.supported_force_spec_ctrl |=3D SPEC_CTRL_R=
RSBA_DIS_S;
+
+               if (boot_cpu_has(X86_FEATURE_BHI_CTRL))
+                       kvm_caps.supported_force_spec_ctrl |=3D SPEC_CTRL_B=
HI_DIS_S;
+       }

> Yes. they are almost the same. one small difference is intel's version ca=
n
> force some bits off though I don't see how forcing bits off can be useful=
.

Another not-so-small difference is that Intel's version can also force bits=
 *on*,
and force them on only for the guest with minimal overhead.

> >Can't we consolidate the code, rather than
> >having completely independent implementations for AMD and Intel?
>=20
> We surely can consolidate the code. I will do this.
>=20
> I have a question about V_SPEC_CTRL. w/ V_SPEC_CTRL, the SPEC_CTRL MSR re=
tains
> the host's value on VM-enter:
>=20
> .macro RESTORE_GUEST_SPEC_CTRL
>         /* No need to do anything if SPEC_CTRL is unset or V_SPEC_CTRL is=
 set */
>         ALTERNATIVE_2 "", \
>                 "jmp 800f", X86_FEATURE_MSR_SPEC_CTRL, \
>                 "", X86_FEATURE_V_SPEC_CTRL
>=20
> Does this mean all mitigations used by the host will be enabled for the g=
uest
> and guests cannot disable them?

Yes.

> Is this intentional? this looks suboptimal. Why not set SPEC_CTRL value t=
o 0 and
> let guest decide which features to enable? On the VMX side, we need host =
to
> apply certain hardware mitigations (i.e., BHI_DIS_S and RRSBA_DIS_S) for =
guest
> because BHI's software mitigation may be ineffective. I am not sure why S=
VM is
> enabling all mitigations used by the host for guests. Wouldn't it be bett=
er to
> enable them on an as-needed basis?

AMD's V_SPEC_CTRL doesn't provide a fast context switch of SPEC_CTRL, it pe=
rforms
a bitwise-OR of the host and guest values.  So to load a subset (or superse=
t) of
the host protections, KVM would need to do an extra WRMSR before VMRUN, and=
 again
after VMRUN.

That said, I have no idea whether or not avoiding WRMSR on AMD is optimal.

