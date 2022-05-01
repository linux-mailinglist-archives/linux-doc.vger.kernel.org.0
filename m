Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8548A516455
	for <lists+linux-doc@lfdr.de>; Sun,  1 May 2022 14:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346767AbiEAMWB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 1 May 2022 08:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbiEAMV7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 May 2022 08:21:59 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE094D27A;
        Sun,  1 May 2022 05:18:31 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id bc42so5581269vkb.12;
        Sun, 01 May 2022 05:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxfRAHyG3a8vFZUTzT5pPs3UmTYM3a+8RI93sS34luI=;
        b=dHLvVpXMKA6KYFjpBKhycmbtK8pTYLKYZeqfCGGOcVYN991Ch54lE26CJT3Fo9qcrn
         vFMCqak9Um5d2wbiTm4iqAsp8DhQARgJlf8rLIkWqwkriKP0HL04vrtvOhsrPWo7p0jh
         Ht9cN3OVfCIbwlWbwSVFT6Mdm2WA0gMCGmjG/TmORisHBBDWyrgyJE09M1HXCZ9DF+Mn
         aQUNLVSL+/R9lWSPxHVjidTEGaciskss0Nu+QEHGEaCA/EHBsCdpXPlTXpYvBKYF7Hrc
         DQPbDRn1jhYzHpf5BrwA/PJ+yG4hEUGhHU8eKPggwtBhB2pfrl4RU8WQvgzTonzC0Ix5
         Kzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxfRAHyG3a8vFZUTzT5pPs3UmTYM3a+8RI93sS34luI=;
        b=ELXy69/8LwSYIlJnjiluCfuGi4b/BKhQjl9Z64DmwpKaE7VoFNAA0wEw042CaOt9fU
         Ef3TG+NHpp12YDUjq/ixBU1axLvVh49o7v011u8xk9of2ZA+U4gwvmIJKGtb5koteigR
         KAfP8sx4b+FNeRj0yL+CFHeVSeTrQNalpYiyINzpefeIrwJ81Jk1vp7T68exjKtqnWwB
         slsEsIsL/lh8504XKAxWZ/BGdOeb/cDO43/t2bX1vZeIFhF9iXejYFOcCVsqvoKHrVS9
         CcT8HXwiJ1L6GaUb5Iux+y/I5QQkJZejFJpfr14UwMsg+dMiex579kx31qEUo4ARGvem
         lXDQ==
X-Gm-Message-State: AOAM531z9PNkYFDXNr/pgrHfwtqUL2ANJSrliewLnqrlffDrj/NKxjLL
        tEqLEh5mJ1oBbT4eXtznF3Db+8yoGn/EBMh+7sw=
X-Google-Smtp-Source: ABdhPJyzTZgn/ITPyxRCTE5L4g2FAZyDmR3oLxzPS9dlSbM6Q3YEBTmtAom9v/upPTfrD8rXE3qinhVP9ywXmDORXFU=
X-Received: by 2002:a05:6122:179d:b0:34e:a817:dcb7 with SMTP id
 o29-20020a056122179d00b0034ea817dcb7mr394395vkf.2.1651407509910; Sun, 01 May
 2022 05:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220430090518.3127980-1-chenhuacai@loongson.cn>
 <20220430090518.3127980-18-chenhuacai@loongson.cn> <CAJF2gTQ7D_3+V9U=BTPDE-gqxuP5+gLwM9C8_Rxna0GGJ1Yn9A@mail.gmail.com>
In-Reply-To: <CAJF2gTQ7D_3+V9U=BTPDE-gqxuP5+gLwM9C8_Rxna0GGJ1Yn9A@mail.gmail.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Sun, 1 May 2022 20:18:18 +0800
Message-ID: <CAAhV-H5MdrdGc+8fh2XFNyOASobr5LJ_yAXC+jEXvpYN7018gg@mail.gmail.com>
Subject: Re: [PATCH V9 17/24] LoongArch: Add some library functions
To:     Guo Ren <guoren@kernel.org>
Cc:     Huacai Chen <chenhuacai@loongson.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Ren,

On Sun, May 1, 2022 at 6:56 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Sat, Apr 30, 2022 at 5:23 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
> >
> > This patch adds some library functions for LoongArch, including: delay,
> > memset, memcpy, memmove, copy_user, strncpy_user, strnlen_user and tlb
> > dump functions.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/include/asm/delay.h  |  26 +++++++
> >  arch/loongarch/include/asm/string.h |  17 +++++
> >  arch/loongarch/lib/clear_user.S     |  43 +++++++++++
> >  arch/loongarch/lib/copy_user.S      |  47 ++++++++++++
> >  arch/loongarch/lib/delay.c          |  43 +++++++++++
> >  arch/loongarch/lib/dump_tlb.c       | 111 ++++++++++++++++++++++++++++
> >  arch/loongarch/lib/memcpy.S         |  32 ++++++++
> >  arch/loongarch/lib/memmove.S        |  45 +++++++++++
> >  arch/loongarch/lib/memset.S         |  30 ++++++++
> >  9 files changed, 394 insertions(+)
> >  create mode 100644 arch/loongarch/include/asm/delay.h
> >  create mode 100644 arch/loongarch/include/asm/string.h
> >  create mode 100644 arch/loongarch/lib/clear_user.S
> >  create mode 100644 arch/loongarch/lib/copy_user.S
> >  create mode 100644 arch/loongarch/lib/delay.c
> >  create mode 100644 arch/loongarch/lib/dump_tlb.c
> >  create mode 100644 arch/loongarch/lib/memcpy.S
> >  create mode 100644 arch/loongarch/lib/memmove.S
> >  create mode 100644 arch/loongarch/lib/memset.S
> >
> > diff --git a/arch/loongarch/include/asm/delay.h b/arch/loongarch/include/asm/delay.h
> > new file mode 100644
> > index 000000000000..016b3aca65cb
> > --- /dev/null
> > +++ b/arch/loongarch/include/asm/delay.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +#ifndef _ASM_DELAY_H
> > +#define _ASM_DELAY_H
> > +
> > +#include <linux/param.h>
> > +
> > +extern void __delay(unsigned long loops);
> > +extern void __ndelay(unsigned long ns);
> > +extern void __udelay(unsigned long us);
> > +
> > +#define ndelay(ns) __ndelay(ns)
> > +#define udelay(us) __udelay(us)
> > +
> > +/* make sure "usecs *= ..." in udelay do not overflow. */
> > +#if HZ >= 1000
> > +#define MAX_UDELAY_MS  1
> > +#elif HZ <= 200
> > +#define MAX_UDELAY_MS  5
> > +#else
> > +#define MAX_UDELAY_MS  (1000 / HZ)
> > +#endif
> > +
> > +#endif /* _ASM_DELAY_H */
> > diff --git a/arch/loongarch/include/asm/string.h b/arch/loongarch/include/asm/string.h
> > new file mode 100644
> > index 000000000000..7b29cc9c70aa
> > --- /dev/null
> > +++ b/arch/loongarch/include/asm/string.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +#ifndef _ASM_STRING_H
> > +#define _ASM_STRING_H
> > +
> > +#define __HAVE_ARCH_MEMSET
> > +extern void *memset(void *__s, int __c, size_t __count);
> > +
> > +#define __HAVE_ARCH_MEMCPY
> > +extern void *memcpy(void *__to, __const__ void *__from, size_t __n);
> > +
> > +#define __HAVE_ARCH_MEMMOVE
> > +extern void *memmove(void *__dest, __const__ void *__src, size_t __n);
> > +
> > +#endif /* _ASM_STRING_H */
> > diff --git a/arch/loongarch/lib/clear_user.S b/arch/loongarch/lib/clear_user.S
> > new file mode 100644
> > index 000000000000..b8168d22ac80
> > --- /dev/null
> > +++ b/arch/loongarch/lib/clear_user.S
> > @@ -0,0 +1,43 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +
> > +#include <asm/asm.h>
> > +#include <asm/asmmacro.h>
> > +#include <asm/export.h>
> > +#include <asm/regdef.h>
> > +
> > +.macro fixup_ex from, to, offset, fix
> > +.if \fix
> > +       .section .fixup, "ax"
> > +\to:   addi.d  v0, a1, \offset
> > +       jr      ra
> > +       .previous
> > +.endif
> > +       .section __ex_table, "a"
> > +       PTR     \from\()b, \to\()b
> > +       .previous
> > +.endm
> > +
> > +/*
> > + * unsigned long __clear_user(void *addr, size_t size)
> > + *
> > + * a0: addr
> > + * a1: size
> > + */
> > +SYM_FUNC_START(__clear_user)
> > +       beqz    a1, 2f
> > +
> > +1:     st.b    zero, a0, 0
> > +       addi.d  a0, a0, 1
> > +       addi.d  a1, a1, -1
> > +       bgt     a1, zero, 1b
> > +
> > +2:     move    v0, a1
> > +       jr      ra
> > +
> > +       fixup_ex 1, 3, 0, 1
> > +SYM_FUNC_END(__clear_user)
> > +
> > +EXPORT_SYMBOL(__clear_user)
> > diff --git a/arch/loongarch/lib/copy_user.S b/arch/loongarch/lib/copy_user.S
> > new file mode 100644
> > index 000000000000..43ed26304954
> > --- /dev/null
> > +++ b/arch/loongarch/lib/copy_user.S
> > @@ -0,0 +1,47 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +
> > +#include <asm/asm.h>
> > +#include <asm/asmmacro.h>
> > +#include <asm/export.h>
> > +#include <asm/regdef.h>
> > +
> > +.macro fixup_ex from, to, offset, fix
> > +.if \fix
> > +       .section .fixup, "ax"
> > +\to:   addi.d  v0, a2, \offset
> > +       jr      ra
> > +       .previous
> > +.endif
> > +       .section __ex_table, "a"
> > +       PTR     \from\()b, \to\()b
> > +       .previous
> > +.endm
> > +
> > +/*
> > + * unsigned long __copy_user(void *to, const void *from, size_t n)
> > + *
> > + * a0: to
> > + * a1: from
> > + * a2: n
> > + */
> > +SYM_FUNC_START(__copy_user)
> > +       beqz    a2, 3f
> > +
> > +1:     ld.b    t0, a1, 0
> > +2:     st.b    t0, a0, 0
> > +       addi.d  a0, a0, 1
> > +       addi.d  a1, a1, 1
> > +       addi.d  a2, a2, -1
> > +       bgt     a2, zero, 1b
> > +
> > +3:     move    v0, a2
> > +       jr      ra
> > +
> > +       fixup_ex 1, 4, 0, 1
> > +       fixup_ex 2, 4, 0, 0
> > +SYM_FUNC_END(__copy_user)
> > +
> > +EXPORT_SYMBOL(__copy_user)
> > diff --git a/arch/loongarch/lib/delay.c b/arch/loongarch/lib/delay.c
> > new file mode 100644
> > index 000000000000..5d856694fcfe
> > --- /dev/null
> > +++ b/arch/loongarch/lib/delay.c
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +#include <linux/delay.h>
> > +#include <linux/export.h>
> > +#include <linux/smp.h>
> > +#include <linux/timex.h>
> > +
> > +#include <asm/compiler.h>
> > +#include <asm/processor.h>
> > +
> > +void __delay(unsigned long cycles)
> > +{
> > +       u64 t0 = get_cycles();
> > +
> > +       while ((unsigned long)(get_cycles() - t0) < cycles)
> > +               cpu_relax();
> > +}
> > +EXPORT_SYMBOL(__delay);
> > +
> > +/*
> > + * Division by multiplication: you don't have to worry about
> > + * loss of precision.
> > + *
> > + * Use only for very small delays ( < 1 msec). Should probably use a
> > + * lookup table, really, as the multiplications take much too long with
> > + * short delays.  This is a "reasonable" implementation, though (and the
> > + * first constant multiplications gets optimized away if the delay is
> > + * a constant)
> > + */
> > +
> > +void __udelay(unsigned long us)
> > +{
> > +       __delay((us * 0x000010c7ull * HZ * lpj_fine) >> 32);
> > +}
> > +EXPORT_SYMBOL(__udelay);
> > +
> > +void __ndelay(unsigned long ns)
> > +{
> > +       __delay((ns * 0x00000005ull * HZ * lpj_fine) >> 32);
> > +}
> > +EXPORT_SYMBOL(__ndelay);
> > diff --git a/arch/loongarch/lib/dump_tlb.c b/arch/loongarch/lib/dump_tlb.c
> > new file mode 100644
> > index 000000000000..cda2c6bc7f09
> > --- /dev/null
> > +++ b/arch/loongarch/lib/dump_tlb.c
> > @@ -0,0 +1,111 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + *
> > + * Derived from MIPS:
> > + * Copyright (C) 1994, 1995 by Waldorf Electronics, written by Ralf Baechle.
> > + * Copyright (C) 1999 by Silicon Graphics, Inc.
> > + */
> > +#include <linux/kernel.h>
> > +#include <linux/mm.h>
> > +
> > +#include <asm/loongarch.h>
> > +#include <asm/page.h>
> > +#include <asm/pgtable.h>
> > +#include <asm/tlb.h>
> > +
> > +void dump_tlb_regs(void)
> > +{
> > +       const int field = 2 * sizeof(unsigned long);
> > +
> > +       pr_info("Index    : %0x\n", read_csr_tlbidx());
> > +       pr_info("PageSize : %0x\n", read_csr_pagesize());
> > +       pr_info("EntryHi  : %0*llx\n", field, read_csr_entryhi());
> > +       pr_info("EntryLo0 : %0*llx\n", field, read_csr_entrylo0());
> > +       pr_info("EntryLo1 : %0*llx\n", field, read_csr_entrylo1());
> > +}
> > +
> > +static void dump_tlb(int first, int last)
> > +{
> > +       unsigned long s_entryhi, entryhi, asid;
> > +       unsigned long long entrylo0, entrylo1, pa;
> > +       unsigned int index;
> > +       unsigned int s_index, s_asid;
> > +       unsigned int pagesize, c0, c1, i;
> > +       unsigned long asidmask = cpu_asid_mask(&current_cpu_data);
> > +       int pwidth = 11;
> > +       int vwidth = 11;
> > +       int asidwidth = DIV_ROUND_UP(ilog2(asidmask) + 1, 4);
> > +
> > +       s_entryhi = read_csr_entryhi();
> > +       s_index = read_csr_tlbidx();
> > +       s_asid = read_csr_asid();
> > +
> > +       for (i = first; i <= last; i++) {
> > +               write_csr_index(i);
> > +               tlb_read();
> > +               pagesize = read_csr_pagesize();
> > +               entryhi  = read_csr_entryhi();
> > +               entrylo0 = read_csr_entrylo0();
> > +               entrylo1 = read_csr_entrylo1();
> > +               index = read_csr_tlbidx();
> > +               asid = read_csr_asid();
> > +
> > +               /* EHINV bit marks entire entry as invalid */
> > +               if (index & CSR_TLBIDX_EHINV)
> > +                       continue;
> > +               /*
> > +                * ASID takes effect in absence of G (global) bit.
> > +                */
> > +               if (!((entrylo0 | entrylo1) & ENTRYLO_G) &&
> > +                   asid != s_asid)
> > +                       continue;
> > +
> > +               /*
> > +                * Only print entries in use
> > +                */
> > +               pr_info("Index: %2d pgsize=%x ", i, (1 << pagesize));
> > +
> > +               c0 = (entrylo0 & ENTRYLO_C) >> ENTRYLO_C_SHIFT;
> > +               c1 = (entrylo1 & ENTRYLO_C) >> ENTRYLO_C_SHIFT;
> > +
> > +               pr_cont("va=%0*lx asid=%0*lx",
> > +                       vwidth, (entryhi & ~0x1fffUL), asidwidth, asid & asidmask);
> > +
> > +               /* NR/NX are in awkward places, so mask them off separately */
> > +               pa = entrylo0 & ~(ENTRYLO_NR | ENTRYLO_NX);
> > +               pa = pa & PAGE_MASK;
> > +               pr_cont("\n\t[");
> > +               pr_cont("ri=%d xi=%d ",
> > +                       (entrylo0 & ENTRYLO_NR) ? 1 : 0,
> > +                       (entrylo0 & ENTRYLO_NX) ? 1 : 0);
> > +               pr_cont("pa=%0*llx c=%d d=%d v=%d g=%d plv=%lld] [",
> > +                       pwidth, pa, c0,
> > +                       (entrylo0 & ENTRYLO_D) ? 1 : 0,
> > +                       (entrylo0 & ENTRYLO_V) ? 1 : 0,
> > +                       (entrylo0 & ENTRYLO_G) ? 1 : 0,
> > +                       (entrylo0 & ENTRYLO_PLV) >> ENTRYLO_PLV_SHIFT);
> > +               /* NR/NX are in awkward places, so mask them off separately */
> > +               pa = entrylo1 & ~(ENTRYLO_NR | ENTRYLO_NX);
> > +               pa = pa & PAGE_MASK;
> > +               pr_cont("ri=%d xi=%d ",
> > +                       (entrylo1 & ENTRYLO_NR) ? 1 : 0,
> > +                       (entrylo1 & ENTRYLO_NX) ? 1 : 0);
> > +               pr_cont("pa=%0*llx c=%d d=%d v=%d g=%d plv=%lld]\n",
> > +                       pwidth, pa, c1,
> > +                       (entrylo1 & ENTRYLO_D) ? 1 : 0,
> > +                       (entrylo1 & ENTRYLO_V) ? 1 : 0,
> > +                       (entrylo1 & ENTRYLO_G) ? 1 : 0,
> > +                       (entrylo1 & ENTRYLO_PLV) >> ENTRYLO_PLV_SHIFT);
> > +       }
> > +       pr_info("\n");
> > +
> > +       write_csr_entryhi(s_entryhi);
> > +       write_csr_tlbidx(s_index);
> > +       write_csr_asid(s_asid);
> > +}
> > +
> > +void dump_tlb_all(void)
> > +{
> > +       dump_tlb(0, current_cpu_data.tlbsize - 1);
> > +}
> > diff --git a/arch/loongarch/lib/memcpy.S b/arch/loongarch/lib/memcpy.S
> > new file mode 100644
> > index 000000000000..d53f1148d26b
> > --- /dev/null
> > +++ b/arch/loongarch/lib/memcpy.S
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +
> > +#include <asm/asmmacro.h>
> > +#include <asm/export.h>
> > +#include <asm/regdef.h>
> > +
> > +/*
> > + * void *memcpy(void *dst, const void *src, size_t n)
> > + *
> > + * a0: dst
> > + * a1: src
> > + * a2: n
> > + */
> > +SYM_FUNC_START(memcpy)
> > +       move    a3, a0
> > +       beqz    a2, 2f
> > +
> > +1:     ld.b    t0, a1, 0
> > +       st.b    t0, a0, 0
> > +       addi.d  a0, a0, 1
> > +       addi.d  a1, a1, 1
> > +       addi.d  a2, a2, -1
> > +       bgt     a2, zero, 1b
> > +
> > +2:     move    v0, a3
> > +       jr      ra
> > +SYM_FUNC_END(memcpy)
> > +
> > +EXPORT_SYMBOL(memcpy)
> > diff --git a/arch/loongarch/lib/memmove.S b/arch/loongarch/lib/memmove.S
> > new file mode 100644
> > index 000000000000..18907d83a83b
> > --- /dev/null
> > +++ b/arch/loongarch/lib/memmove.S
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +
> > +#include <asm/asmmacro.h>
> > +#include <asm/export.h>
> > +#include <asm/regdef.h>
> > +
> > +/*
> > + * void *rmemcpy(void *dst, const void *src, size_t n)
> > + *
> > + * a0: dst
> > + * a1: src
> > + * a2: n
> > + */
> > +SYM_FUNC_START(rmemcpy)
> > +       move    a3, a0
> > +       beqz    a2, 2f
> > +
> > +       add.d   a0, a0, a2
> > +       add.d   a1, a1, a2
> > +
> > +1:     ld.b    t0, a1, -1
> > +       st.b    t0, a0, -1
> > +       addi.d  a0, a0, -1
> > +       addi.d  a1, a1, -1
> > +       addi.d  a2, a2, -1
> > +       bgt     a2, zero, 1b
> > +
> > +2:     move    v0, a3
> > +       jr      ra
> > +SYM_FUNC_END(rmemcpy)
> Why not directly use:
I want to use "alternative" to provide multi-versions, but now I can
use the generic implemation.

Huacai
>
> lib/string.c:
> #ifndef __HAVE_ARCH_MEMCPY
> /**
>  * memcpy - Copy one area of memory to another
>  * @dest: Where to copy to
>  * @src: Where to copy from
>  * @count: The size of the area.
>  *
>  * You should not use this function to access IO space, use memcpy_toio()
>  * or memcpy_fromio() instead.
>  */
> void *memcpy(void *dest, const void *src, size_t count)
> {
>         char *tmp = dest;
>         const char *s = src;
>
>         while (count--)
>                 *tmp++ = *s++;
>         return dest;
> }
> EXPORT_SYMBOL(memcpy);
> #endif
>
> Do you want to try a C's string implementation?
> https://lore.kernel.org/linux-csky/202204051450.UN2k1raL-lkp@intel.com/T/#Z2e.:..:20220404142354.2792428-1-guoren::40kernel.org:1arch:csky:lib:string.c
>
> > +
> > +SYM_FUNC_START(memmove)
> > +       blt     a0, a1, 1f      /* dst < src, memcpy */
> > +       blt     a1, a0, 2f      /* src < dst, rmemcpy */
> > +       jr      ra              /* dst == src, return */
> > +
> > +1:     b       memcpy
> > +
> > +2:     b       rmemcpy
> > +SYM_FUNC_END(memmove)
> > +
> > +EXPORT_SYMBOL(memmove)
> > diff --git a/arch/loongarch/lib/memset.S b/arch/loongarch/lib/memset.S
> > new file mode 100644
> > index 000000000000..3fc3e7da5263
> > --- /dev/null
> > +++ b/arch/loongarch/lib/memset.S
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> > + */
> > +
> > +#include <asm/asmmacro.h>
> > +#include <asm/export.h>
> > +#include <asm/regdef.h>
> > +
> > +/*
> > + * void *memset(void *s, int c, size_t n)
> > + *
> > + * a0: s
> > + * a1: c
> > + * a2: n
> > + */
> > +SYM_FUNC_START(memset)
> > +       move    a3, a0
> > +       beqz    a2, 2f
> > +
> > +1:     st.b    a1, a0, 0
> > +       addi.d  a0, a0, 1
> > +       addi.d  a2, a2, -1
> > +       bgt     a2, zero, 1b
> > +
> > +2:     move    v0, a3
> > +       jr      ra
> > +SYM_FUNC_END(memset)
> > +
> > +EXPORT_SYMBOL(memset)
> > --
> > 2.27.0
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
