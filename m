Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20683E1B84
	for <lists+linux-doc@lfdr.de>; Thu,  5 Aug 2021 20:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241374AbhHESkn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Aug 2021 14:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhHESkn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 14:40:43 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87F0C0613D5
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 11:40:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c16so12997806lfc.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PIMmN8s4yzOklVrFNPAhUIzghEwqDAddYwZBgHlhoQY=;
        b=Jk7ddJUfGVWAW2ritnMlzyPA56WazGgdT9bYKCAeF8cea10/iq+6gu5FhADG0nfih3
         uweNh2YYjGYUKbEFzyrkb6j+Xh2YzwgQ3+I4Xx4DMLeoAweSMgkjqi7L1PxYh76UDNAW
         ExElvdu6nX016+ipoQ3CaGLSvqE+cWzD9SYQAfgRJKCN1LE4TgT4YtrVOyKwRgf3cNwG
         GRTlr0UMYxHWHudYO0vYXiTGwUMRM8rjcbWOyTAmMDpiSJgV6qcwhwT1JifdPRIaFdFM
         1tYmnkT0+O6gC2408aDLeHYLF/0eN5kQbgv4DF+h8b8QJ0aS0n5HDTF63mO3w32Na8+n
         N8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PIMmN8s4yzOklVrFNPAhUIzghEwqDAddYwZBgHlhoQY=;
        b=iTdLzBZv0a4vRgzxDnPhvOfEBngPkn9cV9vdT635qWI0lILBj8pUY8Sf48yDzxmBT6
         kzW1nConiHoxkXdtHhUiuEhpyM7Ym+8zMryaKfd+vwTLOXyLHzaPzJmZgb6HaFeGtDwS
         EBb3Hr1ZnDgO+nY5u8sLOW1YrIvgnlawkZpD+GPLwPMeT2wQ3MOBbqF+khS+nsjI34Mt
         kLqyZq5bHLuVDTQhlLLvPrXbEE+ImA5nG62kxC3VGeqQ8FxUnSGpJzbBg1aa0w0durLQ
         5jm45zflQgm33gAxPRHjRvU7hzTAoOJNaxPui9bMKRo7ElifxPAMWGV1v2DHpi6p7Dgx
         5Yeg==
X-Gm-Message-State: AOAM533mqFfphKjmRsb9oaFWlOPFsf2y0eYGvLZJbruqENPMIXklFEZs
        WP/pXJpkSPyHT9hU807hN1eJ+0hx9x+8je3MhsgvNg==
X-Google-Smtp-Source: ABdhPJwKZ0bGNLeTtSOs0C2EEHN8+kzI+49yaZkYoccxWYUpb641owH5DpLRRXUpUFAvyXvR4ehtxAApRyk4oi8LQKI=
X-Received: by 2002:a05:6512:71:: with SMTP id i17mr4612395lfo.368.1628188825887;
 Thu, 05 Aug 2021 11:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com> <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
In-Reply-To: <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 5 Aug 2021 11:40:15 -0700
Message-ID: <CAKwvOdkVuzD68bQuAWS7fS0tat_wdR0bxb=Eh=Te84RtoRgZ8g@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Khem Raj <raj.khem@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 5, 2021 at 8:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Aug 3, 2021 at 8:43 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > diff --git a/Makefile b/Makefile
> > index 444558e62cbc..b24b48c9ebb7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -845,7 +845,7 @@ else
> >  DEBUG_CFLAGS   += -g
> >  endif
> >
> > -ifneq ($(LLVM_IAS),1)
> > +ifeq ($(LLVM_IAS),0)
> >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> >  endif
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index bc74afdbf31e..807f7c94bc6f 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -41,7 +41,7 @@ endif
> >  ifeq ($(CONFIG_LD_IS_LLD),y)
> >         KBUILD_CFLAGS += -mno-relax
> >         KBUILD_AFLAGS += -mno-relax
> > -ifneq ($(LLVM_IAS),1)
> > +ifeq ($(LLVM_IAS),0)
> >         KBUILD_CFLAGS += -Wa,-mno-relax
> >         KBUILD_AFLAGS += -Wa,-mno-relax
> >  endif
>
>
>
> Please drop these two hunks.
>
> I will apply my patch instead.
> https://lore.kernel.org/patchwork/patch/1472580/

Sure.  Will send a v2 with Matthew's suggestion as well.

> When we negate a flag that is enabled by default,
> which is a common way?
>  - set it to '0'
>  - set is to empty
>
>
> So, I was wondering if we should support
> not only LLVM_IAS=0 but also LLVM_IAS=.
>
> What do you think?

LLVM_IAS= looks weird (so I agree with Khem's response), but if it's
common/expected then maybe if there's a way to write a concise check
for either =<blank> or =0?  I don't feel strongly about how it's
specified to disable the integrated assembler, but let's sort that out
_before_ I send a v2.

How can you tell the difference between `make CC=clang` and `make
CC=clang LLVM_IAS=`? (maybe that doesn't matter here, as either imply
"don't use clang as the assembler when compiling with clang")
-- 
Thanks,
~Nick Desaulniers
