Return-Path: <linux-doc+bounces-20920-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA547933F6A
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 17:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A431F24576
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 15:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3333D181BB3;
	Wed, 17 Jul 2024 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="G4gn17aG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDAF181BB1
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229538; cv=none; b=bmBYJOBpg9vtawfYSgTnY3Boc0rcW3ZavspJFH0H9BH7UC0hVvN7I75OXhm6DD9LdtzCQdwLJWgTiDwnxfDeFQG2DmSOUp1wgC7fMXYYcCNDlCBeRdEVj5rQEjXzpnWLHAMBpTf5gbux1aB2ij5UWOeWAY+IcKExsRa7UUtQpo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229538; c=relaxed/simple;
	bh=PPgdnn5xHtGqblze5LjQ42l1ctEsaCVw5KI8hOYvdYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5tu91QKUAT51mocfDINv+nbPPl++os1hKEL1TaCqNbUJDT1Frs/4FH7Iu+PTwJeK2am1286cwhq/G8Z9i3UPWYNsM40Z02wK+Uc/111nSx9RJKcpX3msVBJRiEz0grfKt3+EBikgLyVlqEWBMmrSMYSobgbLkkoUwyYR45anro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=G4gn17aG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a77c7d3e8bcso828858966b.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721229533; x=1721834333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQoHPp6GHIDenSh6kknACm/zhkel4QmQi9P3EM6iYJw=;
        b=G4gn17aG6+dE4OEm2qF+urIhuw4SNXzgwF64OJakQcmbu8BdsfyUfvNjT/Z2CF69Rf
         RCWOK1Z5kht1IJqjWkwA1WxRoQHBfQrJsxI5ZBEMCP/fu7gn1ZOR3tyGkwPJ/E01vptO
         EqK589LBTGVBKTioOLvLnCbhOBgW5nnU2bR4HVazazabZhwLEIoa6om8zcQ2Y7RZiUiK
         n6up5ZJwBOOBw+6uzSzW2083mp7NzBlNxJQY2W7RLnBGKimDMlxYBBBuKoQyWbJaOJWU
         DmZzu3+OjN6c3jKs6phy/kv6adtAd6htqKnr8BkJH6XGZjrbmtV2eJ2+mKyQ7BAmiEy2
         3WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721229533; x=1721834333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQoHPp6GHIDenSh6kknACm/zhkel4QmQi9P3EM6iYJw=;
        b=CHu6Wdkdg0oouMPdmBOQPzmpYzPmpCNZQpPtPcXVBsPdUZa3EmBAxjV8HfptTrDzl7
         qLzgqIpRWZWSsNy+/GlYwT6n+tH/3rQCus9c4Lkwuedomi/8I9aUlQuy0YypE598kznk
         z7sQZ5lXQoHNS/Z5eE6OA8UTJZ3fr1YC53UGmlOxUFX6bzupzfoG+P6wQFRQA1bLvSeB
         KhGMGspGY/oIZjwvlAzVCWlV9jl6is+a2UH28cXMFg+2ayVO9ITe8D2ndt80N2i4sMOK
         +6efGt0yscsh7bZwjwfRxLVwyZMtdodGIfq61l/DvDiI4Zxx9r4GytiOa5x2LqWH7Ep0
         E/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw2imD7uITHyV0t7eo0l1j9txiWUvHrKPVVX43Y0L6ZLnjp7IuyzSVxtbFcEUngCliwenYYu5TGKAgDSCsSuY2nk3+RS2KDEXr
X-Gm-Message-State: AOJu0YwAKiMI/xdz35ynxJJLg4WMxr9xHtOtxhy51dlrwoB8ruYbyoDo
	MDk0693yH/UbGKa3113kqCTcGR1xpt4uNrLyOi0fRdeRU/GPcj/NeRk2gVJ1KAnquIYS+lXc4Ah
	hCIyvuiwLHtefLgGGOlrMDoa9LX5jg5bVFV74QA==
X-Google-Smtp-Source: AGHT+IFpxt/bxmothzY1Q1/3pNyjO4PJwuX8JO+vYnvZil9omdtDmIJjp1pc+HQ2O+64kVyu2LYO+md9vHQjfZBojj0=
X-Received: by 2002:a17:906:cc89:b0:a77:d0a0:ea74 with SMTP id
 a640c23a62f3a-a7a01120ffbmr135377566b.3.1721229533041; Wed, 17 Jul 2024
 08:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-2-alexghiti@rivosinc.com> <20240717-8f0afff97de3095badf4fc4e@orel>
In-Reply-To: <20240717-8f0afff97de3095badf4fc4e@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 17 Jul 2024 17:18:42 +0200
Message-ID: <CAHVXubiKvL3pXwLU-PgdPqSsGHpqg5jL+hrksOyuL2DP25=+dA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] riscv: Implement cmpxchg32/64() using Zacas
To: Andrew Jones <ajones@ventanamicro.com>
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

Hi drew,

On Wed, Jul 17, 2024 at 5:08=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Wed, Jul 17, 2024 at 08:19:47AM GMT, Alexandre Ghiti wrote:
> > This adds runtime support for Zacas in cmpxchg operations.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig               | 17 +++++++++++++++++
> >  arch/riscv/Makefile              |  3 +++
> >  arch/riscv/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
> >  3 files changed, 43 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 05ccba8ca33a..1caaedec88c7 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
> >         preemption. Enabling this config will result in higher memory
> >         consumption due to the allocation of per-task's kernel Vector c=
ontext.
> >
> > +config TOOLCHAIN_HAS_ZACAS
> > +     bool
> > +     default y
> > +     depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_za=
cas)
> > +     depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_z=
acas)
> > +     depends on AS_HAS_OPTION_ARCH
> > +
> > +config RISCV_ISA_ZACAS
> > +     bool "Zacas extension support for atomic CAS"
> > +     depends on TOOLCHAIN_HAS_ZACAS
> > +     default y
> > +     help
> > +       Enable the use of the Zacas ISA-extension to implement kernel a=
tomic
> > +       cmpxchg operations when it is detected at boot.
> > +
> > +       If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZBB
> >       bool
> >       default y
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 06de9d365088..9fd13d7a9cc6 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -85,6 +85,9 @@ endif
> >  # Check if the toolchain supports Zihintpause extension
> >  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-y)_=
zihintpause
> >
> > +# Check if the toolchain supports Zacas
> > +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) :=3D $(riscv-march-y)_zacas
> > +
> >  # Remove F,D,V from isa string for all. Keep extensions between "fd" a=
nd "v" by
> >  # matching non-v and non-multi-letter extensions out with the filter (=
[^v_]*)
> >  KBUILD_CFLAGS +=3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/=
(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/=
cmpxchg.h
> > index 808b4c78462e..5d38153e2f13 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/bug.h>
> >
> >  #include <asm/fence.h>
> > +#include <asm/alternative.h>
> >
> >  #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)         \
> >  ({                                                                   \
> > @@ -134,21 +135,40 @@
> >       r =3D (__typeof__(*(p)))((__retx & __mask) >> __s);              =
 \
> >  })
> >
> > -#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n=
)      \
> > +#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, =
o, n)  \
>
> I'd either not bother renaming sc_sfx or also rename it in _arch_cmpxchg.

I'll rename both then.

>
> >  ({                                                                   \
> > +     __label__ no_zacas, end;                                        \
> >       register unsigned int __rc;                                     \
> >                                                                       \
> > +     if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {                       \
> > +             asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,         \
> > +                                  RISCV_ISA_EXT_ZACAS, 1)            \
> > +                      : : : : no_zacas);                             \
> > +                                                                     \
> > +             __asm__ __volatile__ (                                  \
> > +                     prepend                                         \
> > +                     "       amocas" sc_cas_sfx " %0, %z2, %1\n"     \
> > +                     append                                          \
> > +                     : "+&r" (r), "+A" (*(p))                        \
> > +                     : "rJ" (n)                                      \
> > +                     : "memory");                                    \
> > +             goto end;                                               \
> > +     }                                                               \
> > +                                                                     \
> > +no_zacas:                                                            \
> >       __asm__ __volatile__ (                                          \
> >               prepend                                                 \
> >               "0:     lr" lr_sfx " %0, %2\n"                          \
> >               "       bne  %0, %z3, 1f\n"                             \
> > -             "       sc" sc_sfx " %1, %z4, %2\n"                     \
> > +             "       sc" sc_cas_sfx " %1, %z4, %2\n"                 \
> >               "       bnez %1, 0b\n"                                  \
> >               append                                                  \
> >               "1:\n"                                                  \
> >               : "=3D&r" (r), "=3D&r" (__rc), "+A" (*(p))               =
   \
> >               : "rJ" (co o), "rJ" (n)                                 \
> >               : "memory");                                            \
> > +                                                                     \
> > +end:;                                                                 =
       \
> >  })
> >
> >  #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)         =
       \
> > @@ -156,7 +176,7 @@
> >       __typeof__(ptr) __ptr =3D (ptr);                                 =
 \
> >       __typeof__(*(__ptr)) __old =3D (old);                            =
 \
> >       __typeof__(*(__ptr)) __new =3D (new);                            =
 \
> > -     __typeof__(*(__ptr)) __ret;                                     \
> > +     __typeof__(*(__ptr)) __ret =3D (old);                            =
 \
>
> Is this just to silence some compiler warnings? Can we point out
> whatever the reason is in the commit message?

CAS expects to find the old value in rd (__ret) to check against the
current value in memory before actually swapping with the new value.

But both you and Andrea were confused by this, I'll make it more explicit.

>
> >                                                                       \
> >       switch (sizeof(*__ptr)) {                                       \
> >       case 1:                                                         \
> > --
> > 2.39.2
> >
>
> Thanks,
> drew

Thanks,

Alex

