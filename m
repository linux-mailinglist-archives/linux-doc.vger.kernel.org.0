Return-Path: <linux-doc+bounces-41196-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C080A6781D
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 16:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1821E1883AB7
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E45720F085;
	Tue, 18 Mar 2025 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HdcAXKFd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFE728FD
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312449; cv=none; b=oGaQtzhEEojyNYYbh2oXdKrsqf+uxOkmyXJSV5fasmKV6siB1vUXHWNmSgt7SNDWyJo561pQgmaHQaem55Jixd1cskqeNh+wDfZnCDr+rJILUJrwqzujQOjwxsuu0ppJygIXctoBnB/WErfjs8+RNpyvOZ4Gbao+Z4TaxRsDzlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312449; c=relaxed/simple;
	bh=xa+qJ/9ZyP5rfXFPpXaGdRYIkA5ylRWzIz8uGo6O7/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDLEvlAy967Qv4+k0W0JzIuNEXgannd4NQQSDX6tYsS7E75JEjBTnfot1fNH1U9UK7DBAVb+f2pOVii6vjtXmqjUeqnP0/VjrK4t8CuS4DPzb5oaBAGvfJqPVC4WbJdd+1h/TN9NrznLui3FYKL/MnIbKEjLJdgLLoMs2IyxiXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HdcAXKFd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543d8badc30so6694341e87.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742312440; x=1742917240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec/Vh8pL/HNiQkxBv8WVG1zrQMVZ4ljPoA8bccIz1tg=;
        b=HdcAXKFd+R170qx8Si7YFZ4jVTYZzssj0HWjm51AnRjq2j9w7/GS6ROCaF15HdF75s
         6COkV1nBKZLlckvDTA/eku5aDDHdB7mfNujpneSM0wQto7wsJ8uxvUeeoATIzFfdyxMx
         Z84nyS/Ts/XGAhyacQchpiu4xGvVo+Wa8OA5vgQQRwrDhZCTBGHGCqFHe0C+AmVo46QN
         t69vX7HxAYVNz4amSV8xsL+PQtpRIZ0bm7bQNV//r3IutmOzouc07D8eVT3wqeA+sLBO
         /R6T7cTikBBWwJ2MqAdCLRGhTNirxH1o4aPruewJyLzmvhg+c66vcldRxa81bzM3wo+m
         dbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312440; x=1742917240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec/Vh8pL/HNiQkxBv8WVG1zrQMVZ4ljPoA8bccIz1tg=;
        b=luWnF+b9Z0bF6RYR3g+zbnTeaHh/wViedsFpmUZ8vT9d7Z6+50yC4Jb+TJilon6fJ4
         Di7Y4KBKSrHsRfmi0Kh7uC5xaAYx5+c//BLnRFsqbajRE7eztvFVhvpAKzbonILR1ghJ
         L3XBjIywu3vMK1kuc7K8teN2nkeuRw5tXOosK9phIIs8U4cJ1wgBsuNsZZwKotlabF59
         XOqJpeWO5jJOs5cPr6jY3MUFwmSYnBHiVtK/VNstnWyiCOL7sFen3Crn24VWe4QssonD
         S//MPEIYMEvsVr+HpOVVKr0kVC6JO7+N1ngvy26yKZuj0G6PQjYXWFj+K4QmzAJgndbq
         tmww==
X-Forwarded-Encrypted: i=1; AJvYcCUuaTRcvLkWn+R8NstT6ilYYwfmpFuW/84oZnIeIhjpzehc+V/a/DDCeKyi50AdNDv+y5Xffk9Y0ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVvZ6OpcaYucXa5Sues8Hmhn0ONyw1WWSWpaVPj9Pau+u3cG9I
	nJVh30Jb6J1K78B2c9ubwLdnq3HY7rDwii/AHBFV2FYuoDv5DnsFxvMBhoCG4A/szLkqgcQ2yoO
	zHPvCfkQl1RvoqDmDBf8bfeKjfMmgv1L5HXKE1LfB8y7fY7Co
X-Gm-Gg: ASbGnctyafXUwj8RQd3y2hDfndn+loWDCRNXdrGzUy7TWYHITcsBPko8k3HYEvU7Y1x
	8K51P9GupM8ZZZxuJOn/SPwtfljuqgo5UknD5wE0do3oKlBPZOKfeUk9jz3ZqmRfj5YshOSlq+f
	mAsCbP91hh1xZ6p4rEZBtjGTWirbY=
X-Google-Smtp-Source: AGHT+IFownSXahs2jU3Fhv6xlJtv+dV3RFD4l4BlSWmWuCiK8xkgeM+rBAp7r2Gnpwc0nOdGD3wz3hM88iW7z5A/gEU=
X-Received: by 2002:a05:6512:3ba9:b0:549:8675:c388 with SMTP id
 2adb3069b0e04-549c39aec29mr11184977e87.52.1742312440420; Tue, 18 Mar 2025
 08:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com> <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel> <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
 <20250318-18b96818299ef211ef8ca620@orel> <d7a04d06-766b-4b43-8c42-2b681629c35d@ghiti.fr>
 <20250318-ec2a990d55378039a863b94b@orel> <44304bca-b30a-4c0b-b242-3a54ac021e40@ghiti.fr>
 <20250318-bf7e13879b2073c610d32bae@orel>
In-Reply-To: <20250318-bf7e13879b2073c610d32bae@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Mar 2025 21:10:28 +0530
X-Gm-Features: AQ5f1JoNHUoLLE2QGM2JiUjTTCdjkgRq0lwbnaWl4k7I7aqW8UKJanl2napoBdk
Message-ID: <CAK9=C2WMyZqe3ZZU_pCtb88e4QmFwW_63s5bBTT9F6VTt3fYoA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, 
	cleger@rivosinc.com, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 8:39=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Tue, Mar 18, 2025 at 03:09:18PM +0100, Alexandre Ghiti wrote:
> > On 18/03/2025 14:04, Andrew Jones wrote:
> > > On Tue, Mar 18, 2025 at 01:58:10PM +0100, Alexandre Ghiti wrote:
> > > > On 18/03/2025 13:45, Andrew Jones wrote:
> > > > > On Tue, Mar 18, 2025 at 01:13:18PM +0100, Alexandre Ghiti wrote:
> > > > > > On 18/03/2025 09:48, Andrew Jones wrote:
> > > > > > > On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wro=
te:
> > > > > > > > Hi Drew,
> > > > > > > >
> > > > > > > > On 04/03/2025 13:00, Andrew Jones wrote:
> > > > > > > > > Allow skipping scalar and vector unaligned access speed t=
ests. This
> > > > > > > > > is useful for testing alternative code paths and to skip =
the tests in
> > > > > > > > > environments where they run too slowly. All CPUs must hav=
e the same
> > > > > > > > > unaligned access speed.
> > > > > > > > I'm not a big fan of the command line parameter, this is no=
t where we should
> > > > > > > > push uarch decisions because there could be many other in t=
he future, the
> > > > > > > > best solution to me should be in DT/ACPI and since the DT f=
olks, according
> > > > > > > > to Palmer, shut down this solution, it remains using an ext=
ension.
> > > > > > > >
> > > > > > > > I have been reading a bit about unaligned accesses. Zicclsm=
 was described as
> > > > > > > > "Even though mandated, misaligned loads and stores might ex=
ecute extremely
> > > > > > > > slowly. Standard software distributions should assume their=
 existence only
> > > > > > > > for correctness, not for performance." in rva20/22 but *not=
* in rva23. So
> > > > > > > > what about using this "hole" and consider that a platform t=
hat *advertises*
> > > > > > > > Zicclsm means its unaligned accesses are fast? After intern=
al discussion, It
> > > > > > > > actually does not make sense to advertise Zicclsm if the pl=
atform accesses
> > > > > > > > are slow right?
> > > > > > > This topic pops up every so often, including in yesterday's s=
erver
> > > > > > > platform TG call. In that call, and, afaict, every other time=
 it has
> > > > > > > popped up, the result is to reiterate that ISA extensions nev=
er say
> > > > > > > anything about performance. So, Zicclsm will never mean fast =
and we
> > > > > > > won't likely be able to add any extension that does.
> > > > > > Ok, I should not say "fast". Usually, when an extension is adve=
rtised by a
> > > > > > platform, we don't question its speed (zicboz, zicbom...etc), w=
e simply use
> > > > > > it and it's up to the vendor to benchmark its implementation an=
d act
> > > > > > accordingly (i.e. do not set it in the isa string).
> > > > > >
> > > > > >
> > > > > > > > arm64 for example considers that armv8 has fast unaligned a=
ccesses and can
> > > > > > > > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, ev=
en though some
> > > > > > > > uarchs are slow. Distros will very likely use rva23 as base=
line so they will
> > > > > > > > enable Zicclsm which would allow us to take advantage of th=
is too, without
> > > > > > > > this, we lose a lot of perf improvement in the kernel, see
> > > > > > > > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@=
kernel.org/.
> > > > > > > >
> > > > > > > > Or we could have a new named feature for this, even though =
it's weird to
> > > > > > > > have a named feature which would basically  mean "Zicclsm i=
s fast". We don't
> > > > > > > > have, for example, a named feature to say "Zicboz is fast" =
but given the
> > > > > > > > vague wording in the profile spec, maybe we can ask for one=
 in that case?
> > > > > > > >
> > > > > > > > Sorry for the late review and for triggering this debate...
> > > > > > > No problem, let's try to pick the best option. I'll try listi=
ng all the
> > > > > > > options and there pros/cons.
> > > > > > >
> > > > > > > 1. Leave as is, which is to always probe
> > > > > > >       pro: Nothing to do
> > > > > > >       con: Not ideal in all environments
> > > > > > >
> > > > > > > 2. New DT/ACPI description
> > > > > > >       pro: Describing whether or not misaligned accesses are =
implemented in
> > > > > > >            HW (which presumably means fast) is something that=
 should be done
> > > > > > >     in HW descriptions
> > > > > > >       con: We'll need to live with probing until we can get t=
he descriptions
> > > > > > >            defined, which may be never if there's too much op=
position
> > > > > > >
> > > > > > > 3. Command line
> > > > > > >       pro: Easy and serves its purpose, which is to skip prob=
ing in the
> > > > > > >            environments where probing is not desired
> > > > > > >       con: Yet another command line option (which we may want=
 to deprecate
> > > > > > >            someday)
> > > > > > >
> > > > > > > 4. New ISA extension
> > > > > > >       pro: Easy to add to HW descriptions
> > > > > > >       con: Not likely to get it through ratification
> > > > > > >
> > > > > > > 5. New SBI FWFT feature
> > > > > > >       pro: Probably easier to get through ratification than a=
n ISA extension
> > > > > > >       con: Instead of probing, kernel would have to ask SBI -=
- would that
> > > > > > >            even be faster? Will all the environments that wan=
t to skip
> > > > > > >     probing even have a complete SBI?
> > > > > > >
> > > > > > > 6. ??
> > > > > > So what about:
> > > > > >
> > > > > > 7. New enum value describing the performance as "FORCED" or "HW=
" (or
> > > > > > anything better)
> > > > > >       pro: We only use the existing Zicclsm
> > > > > >       con: It's not clear that the accesses are fast but it bas=
ically says to
> > > > > > SW "don't think too much, I'm telling you that you can use it",=
 up to us to
> > > > > > describe this correctly for users to understand.
> > > > > But Zicclsm doesn't mean misaligned accesses are in HW, it just m=
eans
> > > > > they're not going to explode.
> > > >
> > > > They never explode since if they are not supported by the HW, we re=
ly on
> > > > S-mode emulation already.
> > > Exactly. Zicclsm is just a new name for that behavior. Profiles try t=
o
> > > name every behavior, even the ones we take for granted. Unfortunately=
,
> > > like in the case of Zicclsm, we don't necessarily gain anything from
> > > the new name. In this case, we don't gain a way to avoid probing.
> >
> >
> > I understand your point but given the misaligned traps exist, I can't f=
ind
> > another meaning to Zicclsm than "I'm telling you to use it". Zicclsm ca=
n't
> > be used to describe an OS behaviour (ie the emulation of misaligned
> > accesses).
> >
> > I'm also insisting because we need a compile-time hint which allows us =
to
> > enable HAVE_EFFICIENT_UNALIGNED_ACCESS in the kernel and Zicclsm is gre=
at
> > since it is required in RVA23. if that's not Zicclsm, that must be anot=
her
> > named feature/extension.
> >
> > What do you suggest to make progress here?
> >
>
> I guess you mean besides listing five options and posting patches for two
> of them :-)  We can't force semantics onto Zicclsm and I doubt we'll get
> agreement to make another extension with the semantics we want. So (4)
> is out. I agree with Clement that (5) isn't good. That leaves (2). I
> guess we should start by trying to understand what issues there were/are
> with it.
>

Please note that if we define a DT parameter then we have to define
ACPI RHCT node as well.

Regards,
Anup

