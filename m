Return-Path: <linux-doc+bounces-36675-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC9A2603D
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 17:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 032AE162418
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 16:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327B720B1ED;
	Mon,  3 Feb 2025 16:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LGxe8Ig8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833F20AF8E
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600541; cv=none; b=OA1loVJ8jaiDejv3JUOVhk+rrZ7aNdNdi5/UJsKqR+duVmbWBP1O7+5EokmuSFh3x/06r0P26NHNcTb7Hm9ScgaMzTMKItl1SroQ94fUznAh7hGjMFNYNeAPmoXOUP0yAPegxeUTqOm2Re5yGfcRqK0QoTwZvXDfgP16RDWVHfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600541; c=relaxed/simple;
	bh=pRYUk0ZKvQj1gkwIksxjnfyIXLml63X97KJ99riBYZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNfa4BvSxNocmvCngFKN05JTyr1889ur+H1om/Do2STOqQ5NIjLukc+ygufZibBFZSXX9jq9j7PjFZ/QbXy1Qa3CgKyYM94AkPwnRbWPCo4k9stGJ2t0LlLte0S6uCuwYTl/OJ8+5uVY/Whc01G7PgHMYIGx5t16LgYnKf5bMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LGxe8Ig8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab70043cd05so681510966b.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738600537; x=1739205337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHIxoUzv1NfTLg3IcP41+9dhk+jT2PV2wOpPLYrhtVc=;
        b=LGxe8Ig8WM3lFHkKoTJBzOsrJ0FbvRknDy+A8X0d7NVk2mOQQmqhn6jUuwT0qXGT4O
         piTKcXYiVu2AXg3Ot76bg+PU8xef2Gbc7lQAyuEDyejvcVm9l4eB9Pcahx5g0xo7d0L0
         Hgs8a5ykcMdUuyaM3kn+s0TBihZ6+b9IMuhFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600537; x=1739205337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHIxoUzv1NfTLg3IcP41+9dhk+jT2PV2wOpPLYrhtVc=;
        b=fwolG5iGmNJ1cA86kjDn90pP9WcmnuIMLwaPxHIXxtxkmGLQFzwBp4B2rIIZlA3UD6
         Fe4DjNExRlIgGqTC9f8JqUjf2MWeWnu6qlQF6ctn2f6NB3YxtcTNbIxQT4mKPGLtVRLb
         T5kFqjJIRWz0f5xRl1fDnEz1JUCkhD7E06sGsEUdic3kchgXyeIbVj8RI1+wHYMxN9Iu
         fycJRVsZyhR3WA7kQHcMdbtlKlFXhSyWnlVF/dzBKpt2NMp5EfUXaKHmXLfnKuoQFM4b
         HIgGdydkXbkiVdES8ggMtx1loaNX+WWHkv1fMhrlk+pZbGu9Z2IqQV4930uWeLkTENlz
         c0DA==
X-Forwarded-Encrypted: i=1; AJvYcCXZcuSXzv4QZbJwL8o73nx99z2Q66GxcOcCDFNi+iLJWtdu4bQgyNcAaE7TtK5Ui1UERKQplawIsS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFoDfgUhUclYDhpWi/h9AfdYsnlH5aET/o9FbtdolhLRbRybV
	NPLdhE7MP+2tmC/cvZbmTGZOvZ4S8Ae+DaCck/xNDqX64L+yrFwM/p1DkTzkFYPwtPVMKYNjBnA
	JY04X4WZKMiG3xgY77QGcYRPQt/i9r8zpuGuq/YBLY7lFaOFfVdtu9u3HOBz5No+LbKgr9RD/4O
	M7m9um16u9gcI5GUC61MEbSf9zJ4V3W3NzEik=
X-Gm-Gg: ASbGncvqngU9TMaixsZBd6KFPgme2pMKa+k2UXLzxRQKPVl1nNcqMY6p2I+s50IWhPl
	cvA+DrEBPfYaNfL88Ph/GOshbS9NvekjX4EvgjyQWavHrLfvJvWNpZj/tMJxhj9pphdzPPPHq
X-Google-Smtp-Source: AGHT+IHhX+KtXIcqRMMHyB7BajSsI7eHa5uvkNSVbUMeWa6SIDte2e1vwyujrh9gykAk3x0eH5a3iTOwvnuD1twZJ/Y=
X-Received: by 2002:a17:907:7255:b0:ab7:e71:adb5 with SMTP id
 a640c23a62f3a-ab70e71b1bcmr1040194766b.35.1738600537450; Mon, 03 Feb 2025
 08:35:37 -0800 (PST)
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
In-Reply-To: <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
From: Doug Covelli <doug.covelli@broadcom.com>
Date: Mon, 3 Feb 2025 11:35:07 -0500
X-Gm-Features: AWEUYZmOY0gXuefMbV_TBx2UZa0_r8n8z510aZTLnGHyyjywNd7tyCqK6XVRNrA
Message-ID: <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com>
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

On Tue, Jan 7, 2025 at 12:10=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On Wed, Dec 18, 2024 at 4:44=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > > Changing our legacy BIOS is not an option so in order to support Wind=
ows VMs
> > > with the legacy BIOS with decent performance we would either need to =
add support
> > > for remote reads of the APIC ID register to KVM or support CR8 access=
es w/o
> > > exiting w/o the in-kernel APIC in order.  Do you have a preference?
> >
> > I didn't quite follow the CR8 access thing.  If the choice is between e=
mulating
> > Remote Read IPIs and using a userspace local APIC, then I vote with bot=
h hands
> > for emulating Remote Reads, especially if we can do a half-assed versio=
n that
> > provides only what your crazy BIOS needs :-)
>
> Absolutely.  Not quite userspace local APIC - VMware only needs
> userspace traps on CR8 access but yeah, it would not be great to have
> that. Remote read support is totally acceptable and hopefully win-win
> for VMware too.
>
> > The biggest wrinkle I can think of is that KVM uses the Remote Read IPI=
 encoding
> > for a paravirt vCPU kick feature, but I doubt that's used by Windows gu=
ests and
> > so can be sacrificed on the Altar of Ancient BIOS.
>
> That's easy, the existing code can be wrapped with
>
>                 if (guest_pv_has(vcpu, KVM_FEATURE_PV_UNHALT))
>
> The remote-read hack is not even supposed to be used by the guest
> (it's used internally by kvm_pv_kick_cpu_op).
>
> Paolo

OK.  It seems like fully embracing the in-kernel APIC is the way to go
especially considering it really simplifies using KVM's support for nested
virtualization.  Speaking of nested virtualization we have been working on
adding support for that and would like to propose a couple of changes:

- Add an option for L0 to handle backdoor accesses from CPL3 code running i=
n L2.
On a #GP nested_vmx_l0_wants_exit can check if this option is enabled and K=
VM
can handle the #GP like it would if it had been from L1 (exit to userlevel =
iff
it is a backdoor access otherwwise deliver the fault to L2).  When combined=
 with
enable_vmware_backdoor this will allow L0 to optionally handle backdoor acc=
esses
from CPL3 code running in L2.  This is needed for cases such as running VMw=
are
tools in a Windows VM with VBS enabled.  For other cases such as running to=
ols
in a Windows VM in an ESX VM we still want L1 to handle the backdoor access=
es
from L2.

- Extend KVM_EXIT_MEMORY_FAULT for permission faults (e.g the guest attempt=
ing
to write to a page that has been protected by userlevel calling mprotect). =
 This
is useful for cases where we want synchronous detection of guest writes suc=
h as
lazy snapshots (dirty page tracking is no good for this case).  Currently
permission faults result in KVM_RUN returning EFAULT which we handle by
interpreting the instruction as we do not know the guest physical address
associated with the fault.  This works fine for normal VMs but it would be =
good
to avoid it for the case where nested virtualization is enabled as emulatin=
g L2
instructions presents a number of challenges and it would be best to avoid =
this.
This is the only case I have found where our userlevel code has to interpre=
t
instructions from L2.

Any thoughts on these proposed changes?

Doug

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

