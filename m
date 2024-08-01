Return-Path: <linux-doc+bounces-21879-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98201944457
	for <lists+linux-doc@lfdr.de>; Thu,  1 Aug 2024 08:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB39A1C20CF1
	for <lists+linux-doc@lfdr.de>; Thu,  1 Aug 2024 06:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5568D16E87D;
	Thu,  1 Aug 2024 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="r6eLdYUY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257B1411E0
	for <linux-doc@vger.kernel.org>; Thu,  1 Aug 2024 06:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722492962; cv=none; b=qC8qzvcG1AJF5A/i8o4jEf0+3yrHRjt7Vq3vOIw5mTJx8p436M5cQUy0P3qHMAKGlkmJTDrRS6W6nNrx8gavxtbPPc3XiJK0LdN8PgLMSQz88lZWVSXIwEa1+FqKa1EIy9CPthhSEeTx8PInZBAipAK9bWTZ5Y9cWcEDNOFv6GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722492962; c=relaxed/simple;
	bh=9Hit3GZVy03y5ECFUjmuxKBdJ1aMcQtSoZjSR/huxy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YO4jI7gkI/QDZFCha6YdrlsbVfKQMZWjnOKPp45EN84J+y5BxCBAR0YTpcgqWcgkc84OwTqlJFGLlg0YHFv162ts4GwJun9MlQBa1ZEcRT9pv5H8RzsoLmp8xjiccvj6MsCmZDgeu2M9e4yVj/OSwDEXupJzlnJga/qOilVrmT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=r6eLdYUY; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5b391c8abd7so5210100a12.2
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722492957; x=1723097757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7D5gKOznJOTNQHwMW9C42N1QaXKl3TkxQNfKNVo1FNs=;
        b=r6eLdYUYOUQf9J05rFlm3SC44y25YQYwGvwNCn9dwmndYoqCoIzIbGAUCnnklgTlSz
         b5PvMz5OsQ71H6jHBz89atDKi4AHALMAH0BmfirwVsmU61HGKzKey2/hT5og3ByMsTkl
         Kirc0L+rApjKhs3pf6vcD5m3q9UQGgJnqnxxVMwEPgNPrsk+8s5LyrCqob+kX81I4UNL
         ZwXiK4w7i5XpOUQmbt6gaJBP7V8LbSO/yMLvZMJsJUnqLO8LkO6X2Xhn70jsFJC4Fdoo
         3iE15jOf6RXxgUewqhMveZITLHoRRUw7XdFfDMqcnkUq9F14R2BZubWmvRLTz5PKGqOh
         6jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722492957; x=1723097757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7D5gKOznJOTNQHwMW9C42N1QaXKl3TkxQNfKNVo1FNs=;
        b=ScK/PDr+EpD22AP2izFUPzibwOXC9NN3qPlotdWTYVWZpO0SXs51iEITBht8OurTg1
         7k1G+YLoSyEthpXslFdZfcS3VJM7PmGUF2Ew+iIzqWhPFKESqjtj1DmVRXTIRS4puTrC
         S8C85L9XjAc/3R1AfSxGSStpbdxJBXp1RtnEvJThXxRStYu4ngVDEzbHiFEYZTn9aTbx
         nsTCXVSeDqquTUBzREE3tBUMduz6Cj0uQECRzS5xy+zVNbKOWzol4306fIQVSoiroYnH
         Cocxge/B1FmbbmeH9n/8kusphT6Q+d2+bQm+yXKV1drDi/Sb64CvjAxxs8cWLLXDQXeJ
         52NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMWHH8XrbYxHQDGJW2XWTO4cnHaHWwlCOd7rgAafBF+fArLD0a7DcQYdLio/WZTJmfkiLPUNeBLgwZiXZ+K44LKCq9A4a/DjFk
X-Gm-Message-State: AOJu0YwnCe2H6PeBc9lXWxyiCc6mMXfJvw4qN//ux2OyBgYVd3Eijhzd
	84hWXzyZJR0lbNhvvasaXsfoDpaeBycS0AHXG9YX5DLBHpecWxgSB0ArcW7Mi1xRogYtixXYBIq
	SvoS1nNhajuqsenyLSdFpBw9gThp5ahNpv7vVtg==
X-Google-Smtp-Source: AGHT+IHMADwJ7pbEhGFzZzwtTQCfgBbEZTipMi+5FXJWpSeItFe/XwnEeH5T8MqLnA39QCJBDQo2HHkwaR9ngmGWsJ0=
X-Received: by 2002:a17:907:da2:b0:a77:cca9:b21c with SMTP id
 a640c23a62f3a-a7daf57ed34mr96903466b.34.1722492956858; Wed, 31 Jul 2024
 23:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-7-alexghiti@rivosinc.com> <20240731-260cce60e1a6cd06670d1b24@orel>
In-Reply-To: <20240731-260cce60e1a6cd06670d1b24@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 1 Aug 2024 08:15:45 +0200
Message-ID: <CAHVXubgtuiH4sTCv23xwSh-=rsr-V=Hyt6TMts4RrM6x8Kupig@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] riscv: Improve zacas fully-ordered cmpxchg()
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, Andrea Parri <andrea@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Wed, Jul 31, 2024 at 11:59=E2=80=AFAM Andrew Jones <ajones@ventanamicro.=
com> wrote:
>
> On Wed, Jul 31, 2024 at 09:23:58AM GMT, Alexandre Ghiti wrote:
> > The current fully-ordered cmpxchgXX() implementation results in:
> >
> >   amocas.X.rl     a5,a4,(s1)
> >   fence           rw,rw
> >
> > This provides enough sync but we can actually use the following better
> > mapping instead:
> >
> >   amocas.X.aqrl   a5,a4,(s1)
>
> We won't get release semantics if the exchange fails. Does that matter?
>
> >
> > Suggested-by: Andrea Parri <andrea@rivosinc.com>
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cmpxchg.h | 72 +++++++++++++++++++-------------
> >  1 file changed, 44 insertions(+), 28 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/=
cmpxchg.h
> > index ebcd4a30ae60..391730367213 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -107,8 +107,10 @@
> >   * store NEW in MEM.  Return the initial value in MEM.  Success is
> >   * indicated by comparing RETURN with OLD.
> >   */
> > -
> > -#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, =
o, n)  \
> > +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,                        =
               \
> > +                           sc_prepend, sc_append,                     =
       \
> > +                           cas_prepend, cas_append,                   =
       \
> > +                           r, p, o, n)                                =
       \
> >  ({                                                                    =
       \
> >       if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&                        =
       \
> >           IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&                        =
       \
> > @@ -117,9 +119,9 @@
> >               r =3D o;                                                 =
         \
> >                                                                        =
       \
> >               __asm__ __volatile__ (                                   =
       \
> > -                     prepend                                          =
       \
> > +                     cas_prepend                                      =
               \
> >                       "       amocas" cas_sfx " %0, %z2, %1\n"         =
       \
> > -                     append                                           =
       \
> > +                     cas_append                                       =
               \
> >                       : "+&r" (r), "+A" (*(p))                         =
       \
> >                       : "rJ" (n)                                       =
       \
> >                       : "memory");                                     =
       \
> > @@ -134,7 +136,7 @@
> >               ulong __rc;                                              =
       \
> >                                                                        =
       \
> >               __asm__ __volatile__ (                                   =
       \
> > -                     prepend                                          =
       \
> > +                     sc_prepend                                       =
               \
> >                       "0:     lr.w %0, %2\n"                           =
       \
> >                       "       and  %1, %0, %z5\n"                      =
       \
> >                       "       bne  %1, %z3, 1f\n"                      =
       \
> > @@ -142,7 +144,7 @@
> >                       "       or   %1, %1, %z4\n"                      =
       \
> >                       "       sc.w" sc_sfx " %1, %1, %2\n"             =
       \
> >                       "       bnez %1, 0b\n"                           =
       \
> > -                     append                                           =
       \
> > +                     sc_append                                        =
               \
> >                       "1:\n"                                           =
       \
> >                       : "=3D&r" (__retx), "=3D&r" (__rc), "+A" (*(__ptr=
32b))      \
> >                       : "rJ" ((long)__oldx), "rJ" (__newx),            =
       \
> > @@ -153,16 +155,19 @@
> >       }                                                                =
       \
> >  })
> >
> > -#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, =
o, n)  \
> > +#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,                       =
       \
> > +                    sc_prepend, sc_append,                           \
> > +                    cas_prepend, cas_append,                         \
> > +                    r, p, co, o, n)                                  \
> >  ({                                                                   \
> >       if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&                       \
> >           riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {        \
> >               r =3D o;                                                 =
 \
> >                                                                       \
> >               __asm__ __volatile__ (                                  \
> > -                     prepend                                         \
> > -                     "       amocas" sc_cas_sfx " %0, %z2, %1\n"     \
> > -                     append                                          \
> > +                     cas_prepend                                     \
> > +                     "       amocas" cas_sfx " %0, %z2, %1\n"        \
> > +                     cas_append                                      \
> >                       : "+&r" (r), "+A" (*(p))                        \
> >                       : "rJ" (n)                                      \
> >                       : "memory");                                    \
> > @@ -170,12 +175,12 @@
> >               register unsigned int __rc;                             \
> >                                                                       \
> >               __asm__ __volatile__ (                                  \
> > -                     prepend                                         \
> > +                     sc_prepend                                      \
> >                       "0:     lr" lr_sfx " %0, %2\n"                  \
> >                       "       bne  %0, %z3, 1f\n"                     \
> > -                     "       sc" sc_cas_sfx " %1, %z4, %2\n"         \
> > +                     "       sc" sc_sfx " %1, %z4, %2\n"             \
>
> nit: If patch3 hadn't renamed sc_sfx to sc_cas_sfx then we wouldn't
> need to rename it again now.

You're right, if you don't mind I'll leave it as is though as it makes
the previous patch more consistent.

>
> >                       "       bnez %1, 0b\n"                          \
> > -                     append                                          \
> > +                     sc_append                                       \
> >                       "1:\n"                                          \
> >                       : "=3D&r" (r), "=3D&r" (__rc), "+A" (*(p))       =
   \
> >                       : "rJ" (co o), "rJ" (n)                         \
> > @@ -183,7 +188,9 @@
> >       }                                                               \
> >  })
> >
> > -#define _arch_cmpxchg(ptr, old, new, sc_cas_sfx, prepend, append)    \
> > +#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,                 =
       \
> > +                   sc_prepend, sc_append,                            \
> > +                   cas_prepend, cas_append)                          \
> >  ({                                                                   \
> >       __typeof__(ptr) __ptr =3D (ptr);                                 =
 \
> >       __typeof__(*(__ptr)) __old =3D (old);                            =
 \
> > @@ -192,22 +199,28 @@
> >                                                                       \
> >       switch (sizeof(*__ptr)) {                                       \
> >       case 1:                                                         \
> > -             __arch_cmpxchg_masked(sc_cas_sfx, ".b" sc_cas_sfx,      \
> > -                                     prepend, append,                \
> > -                                     __ret, __ptr, __old, __new);    \
> > +             __arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,             \
> > +                                   sc_prepend, sc_append,            \
> > +                                   cas_prepend, cas_append,          \
> > +                                   __ret, __ptr, __old, __new);      \
> >               break;                                                  \
> >       case 2:                                                         \
> > -             __arch_cmpxchg_masked(sc_cas_sfx, ".h" sc_cas_sfx,      \
> > -                                     prepend, append,                \
> > -                                     __ret, __ptr, __old, __new);    \
> > +             __arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,             \
> > +                                   sc_prepend, sc_append,            \
> > +                                   cas_prepend, cas_append,          \
> > +                                   __ret, __ptr, __old, __new);      \
> >               break;                                                  \
> >       case 4:                                                         \
> > -             __arch_cmpxchg(".w", ".w" sc_cas_sfx, prepend, append,  \
> > -                             __ret, __ptr, (long), __old, __new);    \
> > +             __arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,         \
> > +                            sc_prepend, sc_append,                   \
> > +                            cas_prepend, cas_append,                 \
> > +                            __ret, __ptr, (long), __old, __new);     \
> >               break;                                                  \
> >       case 8:                                                         \
> > -             __arch_cmpxchg(".d", ".d" sc_cas_sfx, prepend, append,  \
> > -                             __ret, __ptr, /**/, __old, __new);      \
> > +             __arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,         \
> > +                            sc_prepend, sc_append,                   \
> > +                            cas_prepend, cas_append,                 \
> > +                            __ret, __ptr, /**/, __old, __new);       \
> >               break;                                                  \
> >       default:                                                        \
> >               BUILD_BUG();                                            \
> > @@ -216,16 +229,19 @@
> >  })
> >
> >  #define arch_cmpxchg_relaxed(ptr, o, n)                               =
       \
> > -     _arch_cmpxchg((ptr), (o), (n), "", "", "")
> > +     _arch_cmpxchg((ptr), (o), (n), "", "", "", "", "", "")
> >
> >  #define arch_cmpxchg_acquire(ptr, o, n)                               =
       \
> > -     _arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
> > +     _arch_cmpxchg((ptr), (o), (n), "", "",                          \
> > +                   "", RISCV_ACQUIRE_BARRIER, "", RISCV_ACQUIRE_BARRIE=
R)
> >
> >  #define arch_cmpxchg_release(ptr, o, n)                               =
       \
> > -     _arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
> > +     _arch_cmpxchg((ptr), (o), (n), "", "",                          \
> > +                   RISCV_RELEASE_BARRIER, "", RISCV_RELEASE_BARRIER, "=
")
> >
> >  #define arch_cmpxchg(ptr, o, n)                                       =
       \
> > -     _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
> > +     _arch_cmpxchg((ptr), (o), (n), ".rl", ".aqrl",                  \
> > +                   "", RISCV_FULL_BARRIER, "", "")
>
> These aren't the easiest things to read, but I can't think of a way to
> improve it other than maybe some macro annotations. E.g.
>
>  #define SC_SFX(x)      x
>  #define CAS_SFX(x)     x
>  #define SC_PREPEND(x)  x
>  #define SC_APPEND(x)   x
>  #define CAS_PREPEND(x) x
>  #define CAS_APPEND(x)  x
>
>  #define arch_cmpxchg(ptr, o, n)                        \
>      _arch_cmpxchg(ptr, o, n,                           \
>          SC_SFX(".rl"), CAS_SFX(".aqrl"),               \
>          SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER), \
>          CAS_PREPEND(""), CAS_APPEND(""))

That's a very good idea, it's been hard to review even for me :)

I could add comments too, but I like your solution, so unless I find
something better in the next 30min, I'll implement that.

Thanks,

Alex

>
> >
> >  #define arch_cmpxchg_local(ptr, o, n)                                 =
       \
> >       arch_cmpxchg_relaxed((ptr), (o), (n))
> > --
> > 2.39.2
> >
>
> Thanks,
> drew

