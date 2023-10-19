Return-Path: <linux-doc+bounces-598-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6157CF1AC
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 09:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8892B20E85
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 07:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781BBDDD7;
	Thu, 19 Oct 2023 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTeP7MuM"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840BCDDBB
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 07:51:33 +0000 (UTC)
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E89109;
	Thu, 19 Oct 2023 00:51:31 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-4a18f724d47so2458523e0c.3;
        Thu, 19 Oct 2023 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697701891; x=1698306691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsOX/L/sb6A3fqcr0em26oFWSZmsQHoEXu6LXbRfSC8=;
        b=ZTeP7MuMNoqkM1m6aKXtpPbqlx0jHRvmdmEi83rvGMnvyInS5cmMfuSA1gdGbG0vMB
         2nCm9zwN+UeBF3hey/DQat1FNdc9OkLVjZHERbGSU+rvwwVmvjUnodBddGj6ZPSW33c8
         kPlzuu4vDUJ3511ZM+87wFdaEMtghLHYZXBqkqD/nLVeHOYVGLMmCRXBYGRYI757tYVw
         5iLVgNSU189IRDR2r6dhBJPsbAyZtJ/A+TIJd0vVNxXE+NHmSfZr9h0onj14Hap1663f
         2POPjUCfvCj8Nr40DWicnJUCeW6qAyxS9wiSchI++oYq4Pf1OSFgrNrRpCISIG0UulqW
         bzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701891; x=1698306691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsOX/L/sb6A3fqcr0em26oFWSZmsQHoEXu6LXbRfSC8=;
        b=NiD5yL4p/JahRNi916yvQqpJC/KYgmTyJRiAaZWa8Mx4W73w/Ac9i29bQM/zjR6Dr9
         W18zPSyF5sne9MXH9xtqbs3514rgYoIZleiSMo9dsFiwAy8O9qI0Gh35hqlQakAsIq7R
         Nirx8pon+3md+NoB94w9OOjyOmJNeHCgaUJSEpTB0xzsjAQ9lvt7vKKWUXnpmlzfxAd4
         +Tvv8TAPyZ+YFj7LiYmvecDIH5qKtM6oDgZ8tRJArLcU5SpukZYmaZGzmjraD5oFOtv+
         /ZFAAnzk9CJgk3r448VwKPGViqIX5YtcUkfzJtr+l3EfdQilJx4NVMklAX0naHZ+bH0w
         dXxg==
X-Gm-Message-State: AOJu0Yy7jJIJ+v1OKTkEdH1l5CXZM9iiPNsoyx1EJSnmwF2NKuHR2uxj
	T4G/m6ATAXK+8fBRuPlvb3d509l8x6tNHPuQfhA=
X-Google-Smtp-Source: AGHT+IHB4NyCllRmnnE0g8nDkzQDqJscngySlBPZfL3R5IyzuwPE3KSvUMmz59rOXaoueNP5HZI4gQyCy9+6kTrdxZo=
X-Received: by 2002:a1f:2982:0:b0:490:b58e:75a9 with SMTP id
 p124-20020a1f2982000000b00490b58e75a9mr1047152vkp.4.1697701890749; Thu, 19
 Oct 2023 00:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
 <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
 <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com> <CAMuHMdUG3SUVPJHSiNyQNzyqxiJpczUHhBxHN7YqEDcaWYwkFA@mail.gmail.com>
In-Reply-To: <CAMuHMdUG3SUVPJHSiNyQNzyqxiJpczUHhBxHN7YqEDcaWYwkFA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Oct 2023 08:51:04 +0100
Message-ID: <CA+V-a8v2h7+mNjx=7W4_K2Afr5VY1-C5pqQiNMX2bFZE_gT47A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	Jonathan Corbet <corbet@lwn.net>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Oct 19, 2023 at 7:40=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabahkar,
>
> On Thu, Sep 14, 2023 at 9:32=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, Sep 13, 2023 at 7:46=E2=80=AFPM Evan Green <evan@rivosinc.com> =
wrote:
> > > On Wed, Sep 13, 2023 at 5:36=E2=80=AFAM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Fri, Aug 18, 2023 at 9:44=E2=80=AFPM Evan Green <evan@rivosinc.c=
om> wrote:
> > > > > Rather than deferring unaligned access speed determinations to a =
vendor
> > > > > function, let's probe them and find out how fast they are. If we
> > > > > determine that an unaligned word access is faster than N byte acc=
esses,
> > > > > mark the hardware's unaligned access as "fast". Otherwise, we mar=
k
> > > > > accesses as slow.
> > > > >
> > > > > The algorithm itself runs for a fixed amount of jiffies. Within e=
ach
> > > > > iteration it attempts to time a single loop, and then keeps only =
the best
> > > > > (fastest) loop it saw. This algorithm was found to have lower var=
iance from
> > > > > run to run than my first attempt, which counted the total number =
of
> > > > > iterations that could be done in that fixed amount of jiffies. By=
 taking
> > > > > only the best iteration in the loop, assuming at least one loop w=
asn't
> > > > > perturbed by an interrupt, we eliminate the effects of interrupts=
 and
> > > > > other "warm up" factors like branch prediction. The only downside=
 is it
> > > > > depends on having an rdtime granular and accurate enough to measu=
re a
> > > > > single copy. If we ever manage to complete a loop in 0 rdtime tic=
ks, we
> > > > > leave the unaligned setting at UNKNOWN.
> > > > >
> > > > > There is a slight change in user-visible behavior here. Previousl=
y, all
> > > > > boards except the THead C906 reported misaligned access speed of
> > > > > UNKNOWN. C906 reported FAST. With this change, since we're now me=
asuring
> > > > > misaligned access speed on each hart, all RISC-V systems will hav=
e this
> > > > > key set as either FAST or SLOW.
> > > > >
> > > > > Currently, we don't have a way to confidently measure the differe=
nce between
> > > > > SLOW and EMULATED, so we label anything not fast as SLOW. This wi=
ll
> > > > > mislabel some systems that are actually EMULATED as SLOW. When we=
 get
> > > > > support for delegating misaligned access traps to the kernel (as =
opposed
> > > > > to the firmware quietly handling it), we can explicitly test in L=
inux to
> > > > > see if unaligned accesses trap. Those systems will start to repor=
t
> > > > > EMULATED, though older (today's) systems without that new SBI mec=
hanism
> > > > > will continue to report SLOW.
> > > > >
> > > > > I've updated the documentation for those hwprobe values to reflec=
t
> > > > > this, specifically: SLOW may or may not be emulated by software, =
and FAST
> > > > > represents means being faster than equivalent byte accesses. The =
change
> > > > > in documentation is accurate with respect to both the former and =
current
> > > > > behavior.
> > > > >
> > > > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > Thanks for your patch, which is now commit 584ea6564bcaead2 ("RISC-=
V:
> > > > Probe for unaligned access speed") in v6.6-rc1.
> > > >
> > > > On the boards I have, I get:
> > > >
> > > >     rzfive:
> > > >         cpu0: Ratio of byte access time to unaligned word access is
> > > > 1.05, unaligned accesses are fast
> > >
> > > Hrm, I'm a little surprised to be seeing this number come out so clos=
e
> > > to 1. If you reboot a few times, what kind of variance do you get on
> > > this?
> >
> > Rock-solid at 1.05 (even with increased resolution: 1.05853 on 3 tries)
>
> After upgrading the firmware from [1] to [2], this changed to
> "0.00, unaligned accesses are slow".
>
> [1] RZ-Five-ETH
>     U-Boot 2020.10-g611c657e43 (Aug 26 2022 - 11:29:06 +0100)
>
> [2] OpenSBI v1.3-75-g3cf0ea4
>     U-Boot 2023.01-00209-g1804c8ab17 (Oct 04 2023 - 13:18:01 +0100)
>
Thanks, let me go through the changes.

Cheers,
Prabhakar

