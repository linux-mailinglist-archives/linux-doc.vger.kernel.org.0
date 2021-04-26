Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DF036B6BD
	for <lists+linux-doc@lfdr.de>; Mon, 26 Apr 2021 18:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhDZQ0C (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Apr 2021 12:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbhDZQ0B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 12:26:01 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0373FC06175F
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 09:25:20 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id z16so40388463pga.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 09:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=fSI8/NRCqwzanGzofgGeswpyryhOl5XK8N/2SPExUaM=;
        b=ZyHP65m0JRImHmM6z0hPa7p88MDC4qJnPBAiFXsCazeiEf8sVCdjZtPvmVHqYY67dJ
         IzP0XEBzBR8UzeDpv6weuSRRrh4OVpjOHYi6pyLuzvhJYJWYbHICIdwa2K3CLaoHSukd
         37D1ROX4l7xG/q710dJEeLbTFH4ip1I4t753y4OmZEUO+cSavc6B3wLi9BAMxEPMxOQE
         70xO8xijWxWxPUNrkQAhnSxqYlcGZsU7j8v/luvriloVOf3gqxzrICTDUHZT6vG0T6be
         eJ6uKP0tALSH3KY3L1g5TE+uJtGXqqKbISVfy7VPc1VIGDwq6nR51I9Z70hDgtXvrrRL
         MiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=fSI8/NRCqwzanGzofgGeswpyryhOl5XK8N/2SPExUaM=;
        b=j9XWU+qg3ZXVTdHg5TEpBZ3fbhCE+xvsdPKs6zCKqNt5SGlHHwEy6GGxkBZJZ5Bbuo
         qp1HibzQJIU0Ec9Fo+x6l1LlQJundvIq5lkgYRu3/GWdnxCUpSbYL0sDSEIa75N/AfQX
         SGZ8xBdrBWKFh0/Y+//nEooyUuhpytIfo/udQznNAI69/DzplVGsUfW8DmPUMe+fT410
         uyPOqNd530Q9FI2Ce7z0oUlddHAzAh3+f3z96Xp//zW9MU9GpcqJNfXiWyVEsI0l1rh7
         SLhMThgfRDKK3u1BFqhlvazcvkWpeYjIvcbR0h4JZpK3co2hXX2fpvRHWltYwroTIPic
         o9OQ==
X-Gm-Message-State: AOAM530aoFlqsz8rqp5rYWDJ5kGSwE3SjkFFBx4zpVTbAeT7BJ7Mz9DO
        EGPO77OArXl1GZqKTB8/te+gKA==
X-Google-Smtp-Source: ABdhPJyzUDRjAvbhDAsSYd7QnOPV1+zieZp/viVrdrq5mIFB3KrJRDUA9nwmtgatZd/53jvnAmVwIA==
X-Received: by 2002:a62:4e4c:0:b029:259:b25f:1bf with SMTP id c73-20020a624e4c0000b0290259b25f01bfmr18054066pfb.40.1619454319216;
        Mon, 26 Apr 2021 09:25:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id z2sm201012pfj.203.2021.04.26.09.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 09:25:18 -0700 (PDT)
Date:   Mon, 26 Apr 2021 09:25:18 -0700 (PDT)
X-Google-Original-Date: Mon, 26 Apr 2021 09:25:17 PDT (-0700)
Subject:     Re: [PATCH] riscv: Fix 32b kernel caused by 64b kernel mapping moving outside linear mapping
In-Reply-To: <97819559-0af0-0422-5b6c-30872f759daa@ghiti.fr>
CC:     anup@brainfault.org, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
        aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     alex@ghiti.fr
Message-ID: <mhng-9ced605b-ce0a-4fbd-b794-d01bc51b900c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Apr 2021 13:49:10 PDT (-0700), alex@ghiti.fr wrote:
>
>
> Le 4/23/21 à 12:57 PM, Palmer Dabbelt a écrit :
>> On Fri, 23 Apr 2021 01:34:02 PDT (-0700), alex@ghiti.fr wrote:
>>> Le 4/20/21 à 12:18 AM, Anup Patel a écrit :
>>>> On Sat, Apr 17, 2021 at 10:52 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>>>>
>>>>> Fix multiple leftovers when moving the kernel mapping outside the
>>>>> linear
>>>>> mapping for 64b kernel that left the 32b kernel unusable.
>>>>>
>>>>> Fixes: 4b67f48da707 ("riscv: Move kernel mapping outside of linear
>>>>> mapping")
>>>>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>>>>
>>>> Quite a few #ifdef but I don't see any better way at the moment.
>>>> Maybe we can
>>>> clean this later. Otherwise looks good to me.
>>
>> Agreed.  I'd recently sent out a patch set that got NACK'd because we're
>> supposed to be relying on the compiler to optimize away references that
>> can be staticly determined to not be exercised, which is probably the
>> way forward to getting rid of a lot of of preprocessor stuff.  That all
>> seems very fragile and is a bigger problem than this, though, so it's
>> probably best to do it as its own thing.
>>
>>>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>>
>>> Thanks Anup!
>>>
>>> @Palmer: This is not on for-next yet and then rv32 is broken. This does
>>> not apply immediately on top of for-next though, so if you need a new
>>> version, I can do that. But this squashes nicely with the patch it fixes
>>> if you prefer.
>>
>> Thanks.  I just hadn't gotten to this one yet, but as you pointed out
>> it's probably best to just squash it.  It's in the version on for-next
>> now, it caused few conflicts but I think I got everything sorted out.
>>
>> Now that everything is in I'm going to stop rewriting this stuff, as it
>> touches pretty much the whole tree.  I don't have much of a patch back
>> log as of right now, and as the new stuff will be on top of it that will
>> make everyone's lives easier.
>>
>>>
>>> Let me know, I can do that very quickly.
>>>
>>> Alex
>>>
>>>>
>>>> Regards,
>>>> Anup
>>>>
>>>>> ---
>>>>>   arch/riscv/include/asm/page.h    |  9 +++++++++
>>>>>   arch/riscv/include/asm/pgtable.h | 16 ++++++++++++----
>>>>>   arch/riscv/mm/init.c             | 25 ++++++++++++++++++++++++-
>>>>>   3 files changed, 45 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/include/asm/page.h
>>>>> b/arch/riscv/include/asm/page.h
>>>>> index 22cfb2be60dc..f64b61296c0c 100644
>>>>> --- a/arch/riscv/include/asm/page.h
>>>>> +++ b/arch/riscv/include/asm/page.h
>>>>> @@ -90,15 +90,20 @@ typedef struct page *pgtable_t;
>>>>>
>>>>>   #ifdef CONFIG_MMU
>>>>>   extern unsigned long va_pa_offset;
>>>>> +#ifdef CONFIG_64BIT
>>>>>   extern unsigned long va_kernel_pa_offset;
>>>>> +#endif
>>>>>   extern unsigned long pfn_base;
>>>>>   #define ARCH_PFN_OFFSET                (pfn_base)
>>>>>   #else
>>>>>   #define va_pa_offset           0
>>>>> +#ifdef CONFIG_64BIT
>>>>>   #define va_kernel_pa_offset    0
>>>>> +#endif
>>>>>   #define ARCH_PFN_OFFSET                (PAGE_OFFSET >> PAGE_SHIFT)
>>>>>   #endif /* CONFIG_MMU */
>>>>>
>>>>> +#ifdef CONFIG_64BIT
>
> This one is incorrect as kernel_virt_addr is used also in 32b kernel,
> which causes 32b failure when CONFIG_DEBUG_VIRTUAL is set, the following
> diff fixes it:
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index e280ba60cb34..6a7761c86ec2 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -106,9 +106,9 @@ extern unsigned long pfn_base;
>   #define ARCH_PFN_OFFSET                (PAGE_OFFSET >> PAGE_SHIFT)
>   #endif /* CONFIG_MMU */
>
> -#ifdef CONFIG_64BIT
>   extern unsigned long kernel_virt_addr;
>
> +#ifdef CONFIG_64BIT
>   #define linear_mapping_pa_to_va(x)     ((void *)((unsigned long)(x) +
> va_pa_offset))
>   #ifdef CONFIG_XIP_KERNEL
>   #define kernel_mapping_pa_to_va(y)     ({
>                   \

Can you send a patch for this one?  I'm trying to avoid rebasing any 
more, as there's more stuff on top of this now.

>
>>>>>   extern unsigned long kernel_virt_addr;
>>>>>
>>>>>   #define linear_mapping_pa_to_va(x)     ((void *)((unsigned
>>>>> long)(x) + va_pa_offset))
>>>>> @@ -112,6 +117,10 @@ extern unsigned long kernel_virt_addr;
>>>>>          (_x < kernel_virt_addr)
>>>>> ?                                               \
>>>>>                  linear_mapping_va_to_pa(_x) :
>>>>> kernel_mapping_va_to_pa(_x);      \
>>>>>          })
>>>>> +#else
>>>>> +#define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) +
>>>>> va_pa_offset))
>>>>> +#define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
>>>>> +#endif
>>>>>
>>>>>   #ifdef CONFIG_DEBUG_VIRTUAL
>>>>>   extern phys_addr_t __virt_to_phys(unsigned long x);
>>>>> diff --git a/arch/riscv/include/asm/pgtable.h
>>>>> b/arch/riscv/include/asm/pgtable.h
>>>>> index 80e63a93e903..5afda75cc2c3 100644
>>>>> --- a/arch/riscv/include/asm/pgtable.h
>>>>> +++ b/arch/riscv/include/asm/pgtable.h
>>>>> @@ -16,19 +16,27 @@
>>>>>   #else
>>>>>
>>>>>   #define ADDRESS_SPACE_END      (UL(-1))
>>>>> -/*
>>>>> - * Leave 2GB for kernel and BPF at the end of the address space
>>>>> - */
>>>>> +
>>>>> +#ifdef CONFIG_64BIT
>>>>> +/* Leave 2GB for kernel and BPF at the end of the address space */
>>>>>   #define KERNEL_LINK_ADDR       (ADDRESS_SPACE_END - SZ_2G + 1)
>>>>> +#else
>>>>> +#define KERNEL_LINK_ADDR       PAGE_OFFSET
>>>>> +#endif
>>>>>
>>>>>   #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
>>>>>   #define VMALLOC_END      (PAGE_OFFSET - 1)
>>>>>   #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>>>>>
>>>>> -/* KASLR should leave at least 128MB for BPF after the kernel */
>>>>>   #define BPF_JIT_REGION_SIZE    (SZ_128M)
>>>>> +#ifdef CONFIG_64BIT
>>>>> +/* KASLR should leave at least 128MB for BPF after the kernel */
>>>>>   #define BPF_JIT_REGION_START   PFN_ALIGN((unsigned long)&_end)
>>>>>   #define BPF_JIT_REGION_END     (BPF_JIT_REGION_START +
>>>>> BPF_JIT_REGION_SIZE)
>>>>> +#else
>>>>> +#define BPF_JIT_REGION_START   (PAGE_OFFSET - BPF_JIT_REGION_SIZE)
>>>>> +#define BPF_JIT_REGION_END     (VMALLOC_END)
>>>>> +#endif
>>>>>
>>>>>   /* Modules always live before the kernel */
>>>>>   #ifdef CONFIG_64BIT
>>>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>>>> index 093f3a96ecfc..dc9b988e0778 100644
>>>>> --- a/arch/riscv/mm/init.c
>>>>> +++ b/arch/riscv/mm/init.c
>>>>> @@ -91,8 +91,10 @@ static void print_vm_layout(void)
>>>>>                    (unsigned long)VMALLOC_END);
>>>>>          print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
>>>>>                    (unsigned long)high_memory);
>>>>> +#ifdef CONFIG_64BIT
>>>>>          print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
>>>>>                    (unsigned long)ADDRESS_SPACE_END);
>>>>> +#endif
>>>>>   }
>>>>>   #else
>>>>>   static void print_vm_layout(void) { }
>>>>> @@ -165,9 +167,11 @@ static struct pt_alloc_ops pt_ops;
>>>>>   /* Offset between linear mapping virtual address and kernel load
>>>>> address */
>>>>>   unsigned long va_pa_offset;
>>>>>   EXPORT_SYMBOL(va_pa_offset);
>>>>> +#ifdef CONFIG_64BIT
>>>>>   /* Offset between kernel mapping virtual address and kernel load
>>>>> address */
>>>>>   unsigned long va_kernel_pa_offset;
>>>>>   EXPORT_SYMBOL(va_kernel_pa_offset);
>>>>> +#endif
>>>>>   unsigned long pfn_base;
>>>>>   EXPORT_SYMBOL(pfn_base);
>>>>>
>>>>> @@ -410,7 +414,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>>>>          load_sz = (uintptr_t)(&_end) - load_pa;
>>>>>
>>>>>          va_pa_offset = PAGE_OFFSET - load_pa;
>>>>> +#ifdef CONFIG_64BIT
>>>>>          va_kernel_pa_offset = kernel_virt_addr - load_pa;
>>>>> +#endif
>>>>>
>>>>>          pfn_base = PFN_DOWN(load_pa);
>>>>>
>>>>> @@ -469,12 +475,16 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>>>>                             pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
>>>>>          dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa &
>>>>> (PMD_SIZE - 1));
>>>>>   #else /* CONFIG_BUILTIN_DTB */
>>>>> +#ifdef CONFIG_64BIT
>>>>>          /*
>>>>>           * __va can't be used since it would return a linear
>>>>> mapping address
>>>>>           * whereas dtb_early_va will be used before setup_vm_final
>>>>> installs
>>>>>           * the linear mapping.
>>>>>           */
>>>>>          dtb_early_va = kernel_mapping_pa_to_va(dtb_pa);
>>>>> +#else
>>>>> +       dtb_early_va = __va(dtb_pa);
>>>>> +#endif /* CONFIG_64BIT */
>>>>>   #endif /* CONFIG_BUILTIN_DTB */
>>>>>   #else
>>>>>   #ifndef CONFIG_BUILTIN_DTB
>>>>> @@ -486,7 +496,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>>>>                             pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
>>>>>          dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa &
>>>>> (PGDIR_SIZE - 1));
>>>>>   #else /* CONFIG_BUILTIN_DTB */
>>>>> +#ifdef CONFIG_64BIT
>>>>>          dtb_early_va = kernel_mapping_pa_to_va(dtb_pa);
>>>>> +#else
>>>>> +       dtb_early_va = __va(dtb_pa);
>>>>> +#endif /* CONFIG_64BIT */
>>>>>   #endif /* CONFIG_BUILTIN_DTB */
>>>>>   #endif
>>>>>          dtb_early_pa = dtb_pa;
>>>>> @@ -571,12 +585,21 @@ static void __init setup_vm_final(void)
>>>>>                  for (pa = start; pa < end; pa += map_size) {
>>>>>                          va = (uintptr_t)__va(pa);
>>>>>                          create_pgd_mapping(swapper_pg_dir, va, pa,
>>>>> -                                          map_size, PAGE_KERNEL);
>>>>> +                                          map_size,
>>>>> +#ifdef CONFIG_64BIT
>>>>> +                                          PAGE_KERNEL
>>>>> +#else
>>>>> +                                          PAGE_KERNEL_EXEC
>>>>> +#endif
>>>>> +                                       );
>>>>> +
>>>>>                  }
>>>>>          }
>>>>>
>>>>> +#ifdef CONFIG_64BIT
>>>>>          /* Map the kernel */
>>>>>          create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
>>>>> +#endif
>>>>>
>>>>>          /* Clear fixmap PTE and PMD mappings */
>>>>>          clear_fixmap(FIX_PTE);
>>>>> --
>>>>> 2.20.1
>>>>>
>
> I agree with you, too much #ifdef, it is hardly readable: I take a look
> at how I can make it simpler.
>
> Sorry for all those fixes,
>
> Alex
>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
