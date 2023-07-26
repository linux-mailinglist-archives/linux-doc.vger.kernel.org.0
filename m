Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9CF763843
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jul 2023 16:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbjGZOCs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jul 2023 10:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbjGZOCr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jul 2023 10:02:47 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29072271E
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 07:02:36 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8b4749013so52915105ad.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Jul 2023 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690380155; x=1690984955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i3qDaq0f1OxJhpdvpNf87CWRe2a484dJSynLBrocNRs=;
        b=v9O3J2EwmJ+bAwI34M0dzmx7i0AsS29WdmP/9LE1CdEVJ8m1qfm14OJX5SSBCeLnQQ
         dPk9Zubn6upXSBumweY4mVEtluOVWG9lRFgHRx12/ogmZJq+ZwKeyxPCQwlVudnF5Y3y
         2Dg/FqDNkBDq97zHSLMmeeC9u3NGuTbLshMKNapnWFb4mKNij6cqIZjBP7WzA2Fs51fk
         CkxmaErozUkm1H8CBAiVxfGprXEyoQINhvdbsGktKKP9h8Eid/rXZqiW/GHpJO7WA3s3
         +tIYtIszl6AXy2+DynKpo1+FbXpAuH3DeKluj2kNQzbwn9/Hvk2gjhVCsnrrrKoOdW4/
         GZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690380155; x=1690984955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3qDaq0f1OxJhpdvpNf87CWRe2a484dJSynLBrocNRs=;
        b=ifzmJ4V/eFHipf2qjw1ZpC3o5Pp3pXl81QgGkqnPjbpybuhlQEJnFzo0nz6SoewKbW
         7TVVToJoQIX4z0iiZOXZaeeKBettzUg7o7fsohriuqq25Ez258+Bj3TdplXVyUqq9oDu
         uOsK4+utYDqYb9TZbl/QHR/FeircV0Uh8Yq8xGOdwwAoiMaoGm4NjIfFiIHkCZM5aSr5
         2evvfURyJreHp0QMuLsHBgP+M9AmY5c0cGIKiXQtOpsv/E4EhmO1hQ3Lx05j8KKjfOHz
         OhNM5zNXR4Stdk5BGhWKB2Zt08fTcRv6JAuunxA4NdTnVclH79QFm9sCfe/L/nsYTz4x
         NP5A==
X-Gm-Message-State: ABy/qLa+WWGih5Wkgtho8dDAoTHdXcQapiUll7+tq+1Ud0u/5IgvvH9T
        +Y4sU24J3ZSh6dQaUWY5TfJvOg==
X-Google-Smtp-Source: APBJJlG7wpvZUVtencQnkDUvyX2MWDqoaSaKUNXQr4fuZuTOSlKZomZWUoQiFIu8sdXB60c9lDmo5Q==
X-Received: by 2002:a17:902:e885:b0:1b5:5052:5af7 with SMTP id w5-20020a170902e88500b001b550525af7mr2705823plg.8.1690380154815;
        Wed, 26 Jul 2023 07:02:34 -0700 (PDT)
Received: from ghost ([2601:c0:ca7f:e7c0:14ff:979a:dd27:29d7])
        by smtp.gmail.com with ESMTPSA id jw11-20020a170903278b00b001b89d9a58e9sm5832564plb.132.2023.07.26.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 07:02:34 -0700 (PDT)
Date:   Wed, 26 Jul 2023 10:02:30 -0400
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
        aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org
Subject: Re: [PATCH v6 1/4] RISC-V: mm: Restrict address space for
 sv39,sv48,sv57
Message-ID: <ZMEndrCQPOID/HHp@ghost>
References: <20230714165508.94561-1-charlie@rivosinc.com>
 <20230714165508.94561-2-charlie@rivosinc.com>
 <CAHVXubhpQGYvNdRnU8Obi-6h6okdXYUuo7WGeCU_LbscUbmgjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHVXubhpQGYvNdRnU8Obi-6h6okdXYUuo7WGeCU_LbscUbmgjg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 20, 2023 at 10:13:54AM +0200, Alexandre Ghiti wrote:
> On Fri, Jul 14, 2023 at 6:55 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > Make sv48 the default address space for mmap as some applications
> > currently depend on this assumption. A hint address passed to mmap will
> > cause the largest address space that fits entirely into the hint to be
> > used. If the hint is less than or equal to 1<<38, an sv39 address will
> > be used. An exception is that if the hint address is 0, then a sv48
> > address will be used. After an address space is completely full, the next
> > smallest address space will be used.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/elf.h       |  2 +-
> >  arch/riscv/include/asm/pgtable.h   | 12 +++++++-
> >  arch/riscv/include/asm/processor.h | 46 +++++++++++++++++++++++++-----
> >  3 files changed, 51 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> > index c24280774caf..5d3368d5585c 100644
> > --- a/arch/riscv/include/asm/elf.h
> > +++ b/arch/riscv/include/asm/elf.h
> > @@ -49,7 +49,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
> >   * the loader.  We need to make sure that it is out of the way of the program
> >   * that it will "exec", and that there is sufficient room for the brk.
> >   */
> > -#define ELF_ET_DYN_BASE                ((TASK_SIZE / 3) * 2)
> > +#define ELF_ET_DYN_BASE                ((DEFAULT_MAP_WINDOW / 3) * 2)
> >
> >  #ifdef CONFIG_64BIT
> >  #ifdef CONFIG_COMPAT
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 75970ee2bda2..e13f5872bfe9 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -63,12 +63,22 @@
> >   * position vmemmap directly below the VMALLOC region.
> >   */
> >  #ifdef CONFIG_64BIT
> > +#define VA_BITS_SV39 39
> > +#define VA_BITS_SV48 48
> > +#define VA_BITS_SV57 57
> > +
> > +#define VA_USER_SV39 (UL(1) << (VA_BITS_SV39 - 1))
> > +#define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
> > +#define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))
> > +
> >  #define VA_BITS                (pgtable_l5_enabled ? \
> > -                               57 : (pgtable_l4_enabled ? 48 : 39))
> > +                               VA_BITS_SV57 : (pgtable_l4_enabled ? VA_BITS_SV48 : VA_BITS_SV39))
> >  #else
> >  #define VA_BITS                32
> >  #endif
> >
> > +#define MMAP_VA_BITS ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
> > +
> >  #define VMEMMAP_SHIFT \
> >         (VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> >  #define VMEMMAP_SIZE   BIT(VMEMMAP_SHIFT)
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index c950a8d9edef..14a5396eed3d 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -13,20 +13,52 @@
> >
> >  #include <asm/ptrace.h>
> >
> > -/*
> > - * This decides where the kernel will search for a free chunk of vm
> > - * space during mmap's.
> > - */
> > -#define TASK_UNMAPPED_BASE     PAGE_ALIGN(TASK_SIZE / 3)
> > -
> > -#define STACK_TOP              TASK_SIZE
> >  #ifdef CONFIG_64BIT
> > +#define DEFAULT_MAP_WINDOW     (UL(1) << (MMAP_VA_BITS - 1))
> >  #define STACK_TOP_MAX          TASK_SIZE_64
> > +
> > +#define arch_get_mmap_end(addr, len, flags)    \
> > +({     \
> > +       unsigned long mmap_end; \
> > +       if ((addr) >= VA_USER_SV57)     \
> > +               mmap_end = STACK_TOP_MAX;       \
> > +       else if ((((addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48))       \
> > +               mmap_end = VA_USER_SV48;        \
> > +       else if ((addr) == 0)   \
> > +               mmap_end = DEFAULT_MAP_WINDOW;  \
> > +       else    \
> > +               mmap_end = VA_USER_SV39;        \
> > +       mmap_end;       \
> > +})
> 
> What about the following instead:
> 
> #define arch_get_mmap_end(addr, len, flags)    \
> ({     \
>        unsigned long mmap_end; \
>        if ((addr) >= VA_USER_SV57) \
>           mmap_end = STACK_TOP_MAX; \ // Maybe a comment here that
> says it returns the max user address of the current mode, not obvious
> at first sight.
>        else \
>           mmap_end = DEFAULT_MAP_WINDOW; \
>        mmap_end; \
> })
> 
> The only corner case is when sv57 is active, then only a hint greater
> than VA_USER_SV57 can return a sv57 user address. Otherwise, we just
> need to return the default mmap end right?
>
> > +
> > +#define arch_get_mmap_base(addr, base) \
> > +({     \
> > +       unsigned long mmap_base;        \
> > +       if (((addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57))      \
> > +               mmap_base = (base) + (VA_USER_SV57 - DEFAULT_MAP_WINDOW);       \
> > +       else if ((((addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48))       \
> > +               mmap_base = (base) + (VA_USER_SV48 - DEFAULT_MAP_WINDOW);       \
> > +       else if ((addr) == 0)   \
> > +               mmap_base = (base);     \
> > +       else    \
> > +               mmap_base = (base) + (VA_USER_SV39 - DEFAULT_MAP_WINDOW);       \
> > +       mmap_base;      \
> > +})
> > +
> 
> From arch_pick_mmap_layout()
> (https://elixir.bootlin.com/linux/latest/source/mm/util.c#L433), the
> "base" argument is:
> 
> - either STACK_TOP in top-down (more or less some random offset)
> - or TASK_UNMAPPED_BASE in bottom-up (more or less some random offset)
> 
> When bottom-up is the current mode, we should not change the base, so
> adding (VA_USER_SV57 - DEFAULT_MAP_WINDOW) in the first case is not
> right for me. When sv48 or sv57 are the active mode,
> DEFAULT_MAP_WINDOW is equal to VA_USER_SV48 right? So (VA_USER_SV48 -
> DEFAULT_MAP_WINDOW) is 0, so not useful. And for the last case, when
> the user asks for a sv39 address whereas the active mode is sv48 or
> sv57, then  (VA_USER_SV39 - DEFAULT_MAP_WINDOW) is negative and the
> base is smaller which is not correct.
> 
In the bottom-up case mm->mmap_base is directly used instead of
arch_get_mmap_base so base will not be modified in that case. The math
here is confusing so I can refactor it. I like your suggestion to
extract out the rnd value of base with (base) - DEFAULT_MAP_WINDOW since
base is defined as PAGE_ALIGN(STACK_TOP - gap - rnd) and STACK_TOP is
DEFAULT_MAP_WINDOW. This (-gap-rnd) value can then directly be used
instead of redoing the math in each if.
> In the bottom-up case, we should preserve the base and I think that
> again, only sv57 is the corner case to deal with.
> 
>
For both this comment and the one above, I think we should allow the
user to default back to sv38. I talked to Palmer and he would prefer
allowing selection of sv38. Since there is no overhead, there is no
need to prevent the user from doing so.
> >  #else
> > +#define DEFAULT_MAP_WINDOW     TASK_SIZE
> >  #define STACK_TOP_MAX          TASK_SIZE
> >  #endif
> >  #define STACK_ALIGN            16
> >
> > +#define STACK_TOP              DEFAULT_MAP_WINDOW
> > +
> > +/*
> > + * This decides where the kernel will search for a free chunk of vm
> > + * space during mmap's.
> > + */
> > +#define TASK_UNMAPPED_BASE     PAGE_ALIGN(DEFAULT_MAP_WINDOW / 3)
> > +
> >  #ifndef __ASSEMBLY__
> >
> >  struct task_struct;
> > --
> > 2.41.0
> >
