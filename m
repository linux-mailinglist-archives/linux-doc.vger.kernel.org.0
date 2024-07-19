Return-Path: <linux-doc+bounces-21043-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C83937753
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 13:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EE911C20C5C
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 11:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4E0127B62;
	Fri, 19 Jul 2024 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eAmn1VEP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189A8286A
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721390029; cv=none; b=LUsagKlJxeruWjOqQ79U8flabOSHssnirnUjZd//2uM6z2MfXwvYIU7D+Y/kOg4DwPz0qmMY+y0uMS2zeqTTsmY68LHzzQ0Qp54hwLEK2rDwnB1tLQsNuUe2H5U3MlBAZNvw03DWlVZW8qydwdZqOx/CgzAUWlus7asaEeo1DpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721390029; c=relaxed/simple;
	bh=dV6hPGqCTplkmjMjTl/xHBuQA6O9MX8PRHWQrzyLooI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xs+y2pfxrONZy7Ql3yzBIHER6JsEE9QMyn9aW9LXaQuGmHpCS3EdX5FBBTe6fvH+ZXQhkY2gfdc8kXTCOTepxReNE2kKS5AqoTEAhhKfr7Vcc1R1wj2XxN8gnHBoVRe8z86ZpGK9dakboyRJth6KrtXc6BwMV/agHeU7l7gF824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eAmn1VEP; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea79e689eso2443100e87.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 04:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721390026; x=1721994826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mIiUr3p2/BCwaGTV2nolMgj2ODsZ5EfHyXypE/fPLs=;
        b=eAmn1VEPWwA/nIwO2h/cJEs8dCUIEclqnPEDmTDZAgPcZJAX3FeAZQdWhkv2E8rbXf
         lcBv/jXxSYT3aqjcQT24CLehVVBmNi883C4DICmY/zmil5/TBVnP9iUUH6C7fHiQ2rtc
         H7GqCyVHlqLxYuc8DzSBMTlcD7Chl8Upi/mBGMtDp00SDjwjx6HgzkyrorgYw87xZdhx
         i+tU2O3cKYyRavtc1MG+r2avkxEhR+8m5+RaqqIQJr1+M3lvRTlwE8bW+lmGIdf+9VU0
         I3uT4Py+bo9vBVCY04QtYPwx/T8fQ/5prRiGz81gWJIb9F6DNgOvcWziba9qRKEB/y7M
         Crdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721390026; x=1721994826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mIiUr3p2/BCwaGTV2nolMgj2ODsZ5EfHyXypE/fPLs=;
        b=nF2Ufm9M++KuP83KCHeb2klsFh8+FaW2dbtmr6IdByHGRrh2JclfAJQmhENICyPuoZ
         5/aRwAJk+nHMzVR4gB0XKZ6VsY/dl7tRZLGSpzvy1Qt/z0WjkKVMKXmXALDZkSvKo1p8
         alOxuffI9HPXT7k/1zMDwoAteWEf6IxgXxjgkLJGjEp1GPvBDS4AKzVo6y9mzCGq5tPV
         OR8fEdniYbmp+PHkpSTmjs2v9KASF63iCZToyGjogZ5lLkK4RQr+t9mgk3ZES2oGp0D2
         bnjYItJmLKi8to4ShoiMj4oPIh9fjvkhNumrnhuVjl9SzwUY1Kr+zlu2+tzFqueLhQPm
         g4ew==
X-Forwarded-Encrypted: i=1; AJvYcCUdL5sn093B6kMc7asqAuBHmeA50Z4YkyniOrXDNg2D2e7d5+QybIUf4CoY3Vj51mVe3A8lGL58viKpMhk/D6Xs/eR3L/jmPyFD
X-Gm-Message-State: AOJu0Yzjp1+G6fmCGWkS6moMz18edgPuA+Pbew8ciVJcNrh8WyY7BO+H
	O1ATeoWHtzUFkYfgukVdnOJnw1ioV1kYqQA9jNMZokkTAAiP0c1Tu/W5JUlRBQxGsbBa/VY/v03
	KxGaCc6XtLf4oYNld486g4PDpC8ifAfTMyp6HTQ==
X-Google-Smtp-Source: AGHT+IFlcdJmTsMY0cKUKH2ToMUnql08a8Q064+0Lm1AKnjhcTS7jcjWo61JnZj+DmiIghnAlI2BYVA7p5rpDzNh/zk=
X-Received: by 2002:a05:6512:b9e:b0:52c:df55:e110 with SMTP id
 2adb3069b0e04-52ee53a7675mr7380350e87.12.1721390025579; Fri, 19 Jul 2024
 04:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-2-alexghiti@rivosinc.com> <8de44944-62b4-44df-88e1-bcf7417fea6e@sifive.com>
 <CAHVXubgU-g+yqn0GS-9SyehsN4m5bHVYvJjCwFQxi3HV2505bQ@mail.gmail.com>
In-Reply-To: <CAHVXubgU-g+yqn0GS-9SyehsN4m5bHVYvJjCwFQxi3HV2505bQ@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 19 Jul 2024 13:53:34 +0200
Message-ID: <CAHVXubimBAwvQ9Mg3o_BkqQmvmTZOHDV4q=ekJjQie71yhFWUg@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] riscv: Implement cmpxchg32/64() using Zacas
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 1:48=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> On Fri, Jul 19, 2024 at 2:45=E2=80=AFAM Samuel Holland
> <samuel.holland@sifive.com> wrote:
> >
> > Hi Alex,
> >
> > On 2024-07-17 1:19 AM, Alexandre Ghiti wrote:
> > > This adds runtime support for Zacas in cmpxchg operations.
> > >
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  arch/riscv/Kconfig               | 17 +++++++++++++++++
> > >  arch/riscv/Makefile              |  3 +++
> > >  arch/riscv/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
> > >  3 files changed, 43 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 05ccba8ca33a..1caaedec88c7 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
> > >         preemption. Enabling this config will result in higher memory
> > >         consumption due to the allocation of per-task's kernel Vector=
 context.
> > >
> > > +config TOOLCHAIN_HAS_ZACAS
> > > +     bool
> > > +     default y
> > > +     depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_=
zacas)
> > > +     depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima=
_zacas)
> > > +     depends on AS_HAS_OPTION_ARCH
> > > +
> > > +config RISCV_ISA_ZACAS
> > > +     bool "Zacas extension support for atomic CAS"
> > > +     depends on TOOLCHAIN_HAS_ZACAS
> > > +     default y
> > > +     help
> > > +       Enable the use of the Zacas ISA-extension to implement kernel=
 atomic
> > > +       cmpxchg operations when it is detected at boot.
> > > +
> > > +       If you don't know what to do here, say Y.
> > > +
> > >  config TOOLCHAIN_HAS_ZBB
> > >       bool
> > >       default y
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 06de9d365088..9fd13d7a9cc6 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -85,6 +85,9 @@ endif
> > >  # Check if the toolchain supports Zihintpause extension
> > >  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y=
)_zihintpause
> > >
> > > +# Check if the toolchain supports Zacas
> > > +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) :=3D $(riscv-march-y)_zaca=
s
> > > +
> > >  # Remove F,D,V from isa string for all. Keep extensions between "fd"=
 and "v" by
> > >  # matching non-v and non-multi-letter extensions out with the filter=
 ([^v_]*)
> > >  KBUILD_CFLAGS +=3D -march=3D$(shell echo $(riscv-march-y) | sed -E '=
s/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> > > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/as=
m/cmpxchg.h
> > > index 808b4c78462e..5d38153e2f13 100644
> > > --- a/arch/riscv/include/asm/cmpxchg.h
> > > +++ b/arch/riscv/include/asm/cmpxchg.h
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/bug.h>
> > >
> > >  #include <asm/fence.h>
> > > +#include <asm/alternative.h>
> > >
> > >  #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)        =
 \
> > >  ({                                                                  =
 \
> > > @@ -134,21 +135,40 @@
> > >       r =3D (__typeof__(*(p)))((__retx & __mask) >> __s);            =
   \
> > >  })
> > >
> > > -#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o,=
 n)      \
> > > +#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co=
, o, n)  \
> > >  ({                                                                  =
 \
> > > +     __label__ no_zacas, end;                                       =
 \
> > >       register unsigned int __rc;                                    =
 \
> > >                                                                      =
 \
> > > +     if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {                      =
 \
> > > +             asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,        =
 \
> > > +                                  RISCV_ISA_EXT_ZACAS, 1)           =
 \
> > > +                      : : : : no_zacas);                            =
 \
> > > +                                                                    =
 \
> > > +             __asm__ __volatile__ (                                 =
 \
> > > +                     prepend                                        =
 \
> > > +                     "       amocas" sc_cas_sfx " %0, %z2, %1\n"    =
 \
> > > +                     append                                         =
 \
> > > +                     : "+&r" (r), "+A" (*(p))                       =
 \
> > > +                     : "rJ" (n)                                     =
 \
> > > +                     : "memory");                                   =
 \
> > > +             goto end;                                              =
 \
> > > +     }                                                              =
 \
> > > +                                                                    =
 \
> > > +no_zacas:                                                           =
 \
> > >       __asm__ __volatile__ (                                         =
 \
> > >               prepend                                                =
 \
> > >               "0:     lr" lr_sfx " %0, %2\n"                         =
 \
> > >               "       bne  %0, %z3, 1f\n"                            =
 \
> > > -             "       sc" sc_sfx " %1, %z4, %2\n"                    =
 \
> > > +             "       sc" sc_cas_sfx " %1, %z4, %2\n"                =
 \
> > >               "       bnez %1, 0b\n"                                 =
 \
> > >               append                                                 =
 \
> >
> > This would probably be a good place to use inline ALTERNATIVE instead o=
f an asm
> > goto. It saves overall code size, and a jump in the non-Zacas case, at =
the cost
> > of 3 nops in the Zacas case. (And all the nops can go after the amocas,=
 where
> > they will likely be hidden by the amocas latency.)
>
> That's what Conor proposed indeed.
>
> I have just given it a try, but it does not work. The number of
> instructions in the zacas asm inline is different in the case of the
> fully-ordered version so I cannot set a unique number of nops. I could
> pass this information from arch_cmpxchg() down to __arch_cmpxchg() but
> those macros are already complex enough so I'd rather not add another
> parameter.
>
> This suggestion unfortunately cannot be applied to
> __arch_cmpxchg_masked(), nor __arch_xchg_masked().
>
> So unless you and Conor really insist, I'll drop the idea!

Or I can pass a nop when the full barrier is not needed, and it works!
I'll probably keep this version then since it avoids the introduction
of new macros or the use of a static branch to circumvent the llvm
bug.

>
> Thanks,
>
> Alex
>
>
> >
> > Regards,
> > Samuel
> >
> > >               "1:\n"                                                 =
 \
> > >               : "=3D&r" (r), "=3D&r" (__rc), "+A" (*(p))             =
     \
> > >               : "rJ" (co o), "rJ" (n)                                =
 \
> > >               : "memory");                                           =
 \
> > > +                                                                    =
 \
> > > +end:;                                                               =
         \
> > >  })
> > >
> > >  #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)       =
         \
> > > @@ -156,7 +176,7 @@
> > >       __typeof__(ptr) __ptr =3D (ptr);                               =
   \
> > >       __typeof__(*(__ptr)) __old =3D (old);                          =
   \
> > >       __typeof__(*(__ptr)) __new =3D (new);                          =
   \
> > > -     __typeof__(*(__ptr)) __ret;                                    =
 \
> > > +     __typeof__(*(__ptr)) __ret =3D (old);                          =
   \
> > >                                                                      =
 \
> > >       switch (sizeof(*__ptr)) {                                      =
 \
> > >       case 1:                                                        =
 \
> >

