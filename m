Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2185145A3E1
	for <lists+linux-doc@lfdr.de>; Tue, 23 Nov 2021 14:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhKWNkj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Nov 2021 08:40:39 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33868
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233703AbhKWNkj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Nov 2021 08:40:39 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1EB183F1C0
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637674649;
        bh=+PeFXRB0R/nWhclwwy1RuDYyghwBGzax9gSm+vlQTMA=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Hk8+HJuzw9CEvN2Ra6P+iNdr0QxiZRmICsE0/hfMBMxKWQwJE9YYXftfk2bF3J0c0
         3Xb2BoDXwraobD+gN6Ol/VEz0CPdSylYIsncF8jajAGvVZJ5S+j+o+8aK64Gqx2D6b
         aCGQSSSZ/nQGh16Srm0FFMB3Z5IkzA38y+nyYM+0z+YzBA4PmLrHVUUXym/aRjT00u
         KTSfM4HkaXpHgAoeL00sYsZSEVM2pH7p3uw2rVy7CCTowOA/JQBJO9PbOJpT/70LUX
         X2A1qa6CofxY2pVRi5THgXonGxcOE0vLMzTmgIrXFWumZiqpDotwkWiHxymE341iaU
         HQ3bG347pbumg==
Received: by mail-ed1-f70.google.com with SMTP id i19-20020a05640242d300b003e7d13ebeedso17788211edc.7
        for <linux-doc@vger.kernel.org>; Tue, 23 Nov 2021 05:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+PeFXRB0R/nWhclwwy1RuDYyghwBGzax9gSm+vlQTMA=;
        b=7mnGFsTL4IvU3Ioi7XdtWMv7gaW835BsFIeLiYmPMtiXIpbZNSEBU+R9teErMGSbsQ
         MCBqDMraK0SY1PCMaYC0YmC50Pe+xYR3q0dKUuUJxFiaHGjHi+DhcU70+Y1t5dGMMheG
         A2R3HfVU2M4eqzS9TgP4/3xUYzYqCczK9qAwaK6AQdfwYS4sZInI+siyuhYt7ITVp8vD
         NK/iDuDShBnSNXsLZakikRmzKiCICygRjskK0T5uYHrgRxwUh00ziozt0DVZaUzpVoRi
         WzzPEBLZus4m4oij/t6ot0CzMbYXcKy70hVdpyAuNtSRMpqOjTWlmN6wku3rfrd+fvas
         W3RA==
X-Gm-Message-State: AOAM531Cm/GKGh/ZSPnTI+5B11XqhYBiqNXNQ2YqsVZZks4XxYR3XWdf
        yBSwQ27QAoVqyp1PjHtvokyR8VaH/Gy5P4lgFwKI3UYnwzbsEC5GkAQ/KautkPiAb940qwwTpUb
        cLM2WLZKpYKX70KsSGeOHfL7UzOeR89zgeeb/sY3u7OkjF0IS7F3mVQ==
X-Received: by 2002:aa7:c301:: with SMTP id l1mr9521289edq.20.1637674648234;
        Tue, 23 Nov 2021 05:37:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpGRt7Zgo/j++pCdA6KPc55wNBfsFYtshCw+zcZs3zdQmpjNTUNiu7Yrw+ah1lpgXUniKpurcu3OWBxYcPCZc=
X-Received: by 2002:aa7:c301:: with SMTP id l1mr9521236edq.20.1637674648031;
 Tue, 23 Nov 2021 05:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org> <20211123015717.542631-2-guoren@kernel.org>
 <CAAhSdy0LWyhgXetiXikCosSX4xasgROyua6XMd92dV8TiWp62w@mail.gmail.com>
In-Reply-To: <CAAhSdy0LWyhgXetiXikCosSX4xasgROyua6XMd92dV8TiWp62w@mail.gmail.com>
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date:   Tue, 23 Nov 2021 14:37:16 +0100
Message-ID: <CA+zEjCspyB49tMUkMCug+R=vhgA0NPOyo7B33rRECi6kj0txZA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] riscv: Remove 2MB offset in the mm layout
To:     Anup Patel <anup@brainfault.org>
Cc:     Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        atishp@rivosinc.com,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Anup Patel <anup.patel@wdc.com>,
        Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 23, 2021 at 4:56 AM Anup Patel <anup@brainfault.org> wrote:
>
> +Alex
>
> On Tue, Nov 23, 2021 at 7:27 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The current RISC-V's mm layout is based on a 2MB offset and wasting
> > memory. Remove 2MB offset and map PAGE_OFFSET at start_of_DRAM.
> > Then we could reduce the memory reserved for opensbi in the next
> > patch.
>
> The real problem is that the generic kernel marks memory before
> __pa(PAGE_OFFSET) as reserved which is evident from the boot
> print "OF: fdt: Ignoring memory range 0x80000000 - 0x80200000".

Agreed, memblock 'rejects' this region because MIN_MEMBLOCK_ADDR is
defined as __pa(PAGE_OFFSET) which points to 0x80200000. I have a
patch to enable the use of hugepages for the linear mapping [1] that
does just that, things are not that easy since then it breaks initrd
initialization which is an early caller of __va, I updated this
patchset a few months ago, I can push that soon @Guo Ren.

[1] https://lkml.org/lkml/2020/6/3/696



>
> One simple way to re-claim the first 2MB of memory is by:
> 1) Not placing OpenSBI firmware at start of RAM and rather
> place it towards end/middle or RAM away from kernel and initrd
> 2) Load kernel at start of the RAM
>
> The point#1 is already supported by OpenSBI firmwares using
> position independent compilation. In fact, U-Boot SPL does
> not load OpenSBI firmware at the start of RAM.
>
> I would suggest Allwinner D1 to follow U-Boot SPL and have
> the booting stage before OpenSBI to load OpenSBI firmware
> somewhere else.
>
> Regards,
> Anup
>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/page.h   |  8 ++++++++
> >  arch/riscv/kernel/head.S        | 10 +++-------
> >  arch/riscv/kernel/vmlinux.lds.S |  5 ++---
> >  arch/riscv/mm/init.c            | 11 ++++++++---
> >  4 files changed, 21 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index b3e5ff0125fe..299147c78b4a 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -16,6 +16,14 @@
> >  #define PAGE_SIZE      (_AC(1, UL) << PAGE_SHIFT)
> >  #define PAGE_MASK      (~(PAGE_SIZE - 1))
> >
> > +#if __riscv_xlen == 64
> > +/* Image load offset(2MB) from start of RAM */
> > +#define LOAD_OFFSET    0x200000
> > +#else
> > +/* Image load offset(4MB) from start of RAM */
> > +#define LOAD_OFFSET    0x400000
> > +#endif
> > +
> >  #ifdef CONFIG_64BIT
> >  #define HUGE_MAX_HSTATE                2
> >  #else
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index f52f01ecbeea..a6ac892d2ccf 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -61,13 +61,7 @@ ENTRY(_start)
> >         /* Image load offset (0MB) from start of RAM for M-mode */
> >         .dword 0
> >  #else
> > -#if __riscv_xlen == 64
> > -       /* Image load offset(2MB) from start of RAM */
> > -       .dword 0x200000
> > -#else
> > -       /* Image load offset(4MB) from start of RAM */
> > -       .dword 0x400000
> > -#endif
> > +       .dword LOAD_OFFSET
> >  #endif
> >         /* Effective size of kernel image */
> >         .dword _end - _start
> > @@ -94,6 +88,8 @@ relocate:
> >         la a1, kernel_map
> >         XIP_FIXUP_OFFSET a1
> >         REG_L a1, KERNEL_MAP_VIRT_ADDR(a1)
> > +       li a2, LOAD_OFFSET
> > +       add a1, a1, a2
> >         la a2, _start
> >         sub a1, a1, a2
> >         add ra, ra, a1
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index 5104f3a871e3..75b7c72cd4bd 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -11,10 +11,9 @@
> >  #else
> >
> >  #include <asm/pgtable.h>
> > -#define LOAD_OFFSET KERNEL_LINK_ADDR
> >
> > -#include <asm/vmlinux.lds.h>
> >  #include <asm/page.h>
> > +#include <asm/vmlinux.lds.h>
> >  #include <asm/cache.h>
> >  #include <asm/thread_info.h>
> >  #include <asm/set_memory.h>
> > @@ -32,7 +31,7 @@ PECOFF_FILE_ALIGNMENT = 0x200;
> >  SECTIONS
> >  {
> >         /* Beginning of code and text segment */
> > -       . = LOAD_OFFSET;
> > +       . = LOAD_OFFSET + KERNEL_LINK_ADDR;
> >         _start = .;
> >         HEAD_TEXT_SECTION
> >         . = ALIGN(PAGE_SIZE);
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 24b2b8044602..920e78f8c3e4 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -221,6 +221,11 @@ static void __init setup_bootmem(void)
> >         if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> >                 memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> >
> > +       /*
> > +        * Reserve OpenSBI region and depends on PMP to deny accesses.
> > +        */
> > +       memblock_reserve(__pa(PAGE_OFFSET), LOAD_OFFSET);
> > +
> >         early_init_fdt_scan_reserved_mem();
> >         dma_contiguous_reserve(dma32_phys_limit);
> >         if (IS_ENABLED(CONFIG_64BIT))
> > @@ -604,7 +609,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >
> >         kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
> >  #else
> > -       kernel_map.phys_addr = (uintptr_t)(&_start);
> > +       kernel_map.phys_addr = (uintptr_t)(&_start) - LOAD_OFFSET;
> >         kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
> >  #endif
> >         kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
> > @@ -645,8 +650,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >         create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
> >                            kernel_map.xiprom, PMD_SIZE, PAGE_KERNEL_EXEC);
> >  #else
> > -       create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
> > -                          kernel_map.phys_addr, PMD_SIZE, PAGE_KERNEL_EXEC);
> > +       create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr + LOAD_OFFSET,
> > +                          kernel_map.phys_addr + LOAD_OFFSET, PMD_SIZE, PAGE_KERNEL_EXEC);
> >  #endif
> >  #else
> >         /* Setup trampoline PGD */
> > --
> > 2.25.1
> >
