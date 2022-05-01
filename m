Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F96751643F
	for <lists+linux-doc@lfdr.de>; Sun,  1 May 2022 13:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346668AbiEALmg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 1 May 2022 07:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346271AbiEALmf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 1 May 2022 07:42:35 -0400
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5341D333;
        Sun,  1 May 2022 04:39:07 -0700 (PDT)
Received: from [192.168.9.172] (unknown [101.88.28.48])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 62E126010C;
        Sun,  1 May 2022 19:39:05 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1651405145; bh=6N4B7MHpx7F9cMdl7ZSAK9Fez1oGVDCIZQ28Lm9KUwY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aZFPsiSPg618yRh8hMXaafjkLurCvhPtxirrHT9CywkyB6jeN8qUB+L0FZj8+VhWT
         gvqa6f4Yi2p+FCU2ukdwc2OsYbBLf0TSy/YW9SSUYMLFTDb97tQQ4zsdX2izgM8bIe
         XzAO26jOBmfoms3yKArZuA1PEmPD30i8CBiHUBxE=
Message-ID: <bc4b856c-770e-715c-27c2-c16f4c9490aa@xen0n.name>
Date:   Sun, 1 May 2022 19:39:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:101.0) Gecko/20100101
 Thunderbird/101.0a1
Subject: Re: [PATCH V9 08/24] LoongArch: Add other common headers
Content-Language: en-US
To:     Huacai Chen <chenhuacai@loongson.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220430090518.3127980-1-chenhuacai@loongson.cn>
 <20220430090518.3127980-9-chenhuacai@loongson.cn>
From:   WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20220430090518.3127980-9-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 4/30/22 17:05, Huacai Chen wrote:
> This patch adds some other common headers for basic LoongArch support.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/include/asm/asm-prototypes.h   |   7 +
>   arch/loongarch/include/asm/asm.h              | 190 +++++++++++
>   arch/loongarch/include/asm/asmmacro.h         | 294 ++++++++++++++++++
>   arch/loongarch/include/asm/clocksource.h      |  12 +
>   arch/loongarch/include/asm/compiler.h         |  15 +
>   arch/loongarch/include/asm/inst.h             |  63 ++++
>   arch/loongarch/include/asm/linkage.h          |  36 +++
>   arch/loongarch/include/asm/perf_event.h       |  10 +
>   arch/loongarch/include/asm/prefetch.h         |  29 ++
>   arch/loongarch/include/asm/serial.h           |  11 +
>   arch/loongarch/include/asm/time.h             |  50 +++
>   arch/loongarch/include/asm/timex.h            |  31 ++
>   arch/loongarch/include/asm/topology.h         |  15 +
>   arch/loongarch/include/asm/types.h            |  33 ++
>   arch/loongarch/include/uapi/asm/bitfield.h    |  15 +
>   arch/loongarch/include/uapi/asm/bitsperlong.h |   9 +
>   arch/loongarch/include/uapi/asm/byteorder.h   |  13 +
>   arch/loongarch/include/uapi/asm/inst.h        |  57 ++++
>   arch/loongarch/include/uapi/asm/reg.h         |  59 ++++
>   tools/include/uapi/asm/bitsperlong.h          |   2 +
>   20 files changed, 951 insertions(+)
>   create mode 100644 arch/loongarch/include/asm/asm-prototypes.h
>   create mode 100644 arch/loongarch/include/asm/asm.h
>   create mode 100644 arch/loongarch/include/asm/asmmacro.h
>   create mode 100644 arch/loongarch/include/asm/clocksource.h
>   create mode 100644 arch/loongarch/include/asm/compiler.h
>   create mode 100644 arch/loongarch/include/asm/inst.h
>   create mode 100644 arch/loongarch/include/asm/linkage.h
>   create mode 100644 arch/loongarch/include/asm/perf_event.h
>   create mode 100644 arch/loongarch/include/asm/prefetch.h
>   create mode 100644 arch/loongarch/include/asm/serial.h
>   create mode 100644 arch/loongarch/include/asm/time.h
>   create mode 100644 arch/loongarch/include/asm/timex.h
>   create mode 100644 arch/loongarch/include/asm/topology.h
>   create mode 100644 arch/loongarch/include/asm/types.h
>   create mode 100644 arch/loongarch/include/uapi/asm/bitfield.h
>   create mode 100644 arch/loongarch/include/uapi/asm/bitsperlong.h
>   create mode 100644 arch/loongarch/include/uapi/asm/byteorder.h
>   create mode 100644 arch/loongarch/include/uapi/asm/inst.h
>   create mode 100644 arch/loongarch/include/uapi/asm/reg.h
>
> diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
> new file mode 100644
> index 000000000000..ed06d3997420
> --- /dev/null
> +++ b/arch/loongarch/include/asm/asm-prototypes.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <linux/uaccess.h>
> +#include <asm/fpu.h>
> +#include <asm/mmu_context.h>
> +#include <asm/page.h>
> +#include <asm/ftrace.h>
> +#include <asm-generic/asm-prototypes.h>
> diff --git a/arch/loongarch/include/asm/asm.h b/arch/loongarch/include/asm/asm.h
> new file mode 100644
> index 000000000000..6de8f9e6a21e
> --- /dev/null
> +++ b/arch/loongarch/include/asm/asm.h
> @@ -0,0 +1,190 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Some useful macros for LoongArch assembler code
> + *
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + *
> + * Derived from MIPS:
> + * Copyright (C) 1995, 1996, 1997, 1999, 2001 by Ralf Baechle
> + * Copyright (C) 1999 by Silicon Graphics, Inc.
> + * Copyright (C) 2001 MIPS Technologies, Inc.
> + * Copyright (C) 2002  Maciej W. Rozycki
> + */
> +#ifndef __ASM_ASM_H
> +#define __ASM_ASM_H
> +
> +/* LoongArch pref instruction. */
> +#ifdef CONFIG_CPU_HAS_PREFETCH
> +
> +#define PREF(hint, addr, offs)				\
> +		preld	hint, addr, offs;		\
> +
> +#define PREFX(hint, addr, index)			\
> +		preldx	hint, addr, index;		\
> +
> +#else /* !CONFIG_CPU_HAS_PREFETCH */
> +
> +#define PREF(hint, addr, offs)
> +#define PREFX(hint, addr, index)
> +
> +#endif /* !CONFIG_CPU_HAS_PREFETCH */
> +
> +/*
> + * Stack alignment
> + */
> +#define ALSZ	0xf
> +#define ALMASK	~ALSZ
Name is too ugly... why not simply "STACK_ALIGNMENT"?
> +
> +/*
> + * Macros to handle different pointer/register sizes for 32/64-bit code
> + */
> +
> +/*
> + * Size of a register
> + */
> +#ifndef __loongarch64
> +#define SZREG	4
> +#else
> +#define SZREG	8
> +#endif
Better use something like the __REG_SEL in arch/riscv (and for all 
definitions below). This way we don't have to repeat the symbol name twice.
> +
> +/*
> + * Use the following macros in assemblercode to load/store registers,
> + * pointers etc.
> + */
> +#if (SZREG == 4)
> +#define REG_L		ld.w
> +#define REG_S		st.w
> +#define REG_ADDU	add.w
> +#define REG_SUBU	sub.w

Please don't "ADDU"; just "ADD". The U suffix clearly means "unsigned" 
in LoongArch instruction mnemonics, while in MIPS "addu" the "u" 
actually means "unchecked for overflow" (see the MIPS manual about this 
misnomer).

Similarly for "SUBU".

> +#else /* SZREG == 8 */
> +#define REG_L		ld.d
> +#define REG_S		st.d
> +#define REG_ADDU	add.d
> +#define REG_SUBU	sub.d
> +#endif
> +
> +/*
> + * How to add/sub/load/store/shift C int variables.
> + */
> +#if (_LOONGARCH_SZINT == 32)
> +#define INT_ADDU	add.w
> +#define INT_ADDIU	addi.w
> +#define INT_SUBU	sub.w
> +#define INT_L		ld.w
> +#define INT_S		st.w
> +#define INT_SLL		slli.w
> +#define INT_SLLV	sll.w
> +#define INT_SRL		srli.w
> +#define INT_SRLV	srl.w
> +#define INT_SRA		srai.w
> +#define INT_SRAV	sra.w
Again, please don't carry MIPS names over.
> +#endif
> +
> +#if (_LOONGARCH_SZINT == 64)
> +#define INT_ADDU	add.d
> +#define INT_ADDIU	addi.d
> +#define INT_SUBU	sub.d
> +#define INT_L		ld.d
> +#define INT_S		st.d
> +#define INT_SLL		slli.d
> +#define INT_SLLV	sll.d
> +#define INT_SRL		srli.d
> +#define INT_SRLV	srl.d
> +#define INT_SRA		sra.w
> +#define INT_SRAV	sra.d
> +#endif
> +
> +/*
> + * How to add/sub/load/store/shift C long variables.
> + */
> +#if (_LOONGARCH_SZLONG == 32)
> +#define LONG_ADDU	add.w
> +#define LONG_ADDIU	addi.w
> +#define LONG_SUBU	sub.w
> +#define LONG_L		ld.w
> +#define LONG_S		st.w
> +#define LONG_SP		swp
Is this a typo?
> +#define LONG_SLL	slli.w
> +#define LONG_SLLV	sll.w
> +#define LONG_SRL	srli.w
> +#define LONG_SRLV	srl.w
> +#define LONG_SRA	srai.w
> +#define LONG_SRAV	sra.w
> +
> +#ifdef __ASSEMBLY__
> +#define LONG		.word
> +#endif
> +#define LONGSIZE	4
> +#define LONGMASK	3
> +#define LONGLOG		2
> +#endif
> +
> +#if (_LOONGARCH_SZLONG == 64)
> +#define LONG_ADDU	add.d
> +#define LONG_ADDIU	addi.d
> +#define LONG_SUBU	sub.d
> +#define LONG_L		ld.d
> +#define LONG_S		st.d
> +#define LONG_SP		sdp
> +#define LONG_SLL	slli.d
> +#define LONG_SLLV	sll.d
> +#define LONG_SRL	srli.d
> +#define LONG_SRLV	srl.d
> +#define LONG_SRA	sra.w
> +#define LONG_SRAV	sra.d
> +
> +#ifdef __ASSEMBLY__
> +#define LONG		.dword
> +#endif
> +#define LONGSIZE	8
> +#define LONGMASK	7
> +#define LONGLOG		3
> +#endif
> +
> +/*
> + * How to add/sub/load/store/shift pointers.
> + */
> +#if (_LOONGARCH_SZPTR == 32)
> +#define PTR_ADDU	add.w
> +#define PTR_ADDIU	addi.w
> +#define PTR_SUBU	sub.w
> +#define PTR_L		ld.w
> +#define PTR_S		st.w
> +#define PTR_LI		li.w
> +#define PTR_SLL		slli.w
> +#define PTR_SLLV	sll.w
> +#define PTR_SRL		srli.w
> +#define PTR_SRLV	srl.w
> +#define PTR_SRA		srai.w
> +#define PTR_SRAV	sra.w
> +
> +#define PTR_SCALESHIFT	2
> +
> +#define PTR		.word
> +#define PTRSIZE		4
> +#define PTRLOG		2
> +#endif
> +
> +#if (_LOONGARCH_SZPTR == 64)
> +#define PTR_ADDU	add.d
> +#define PTR_ADDIU	addi.d
> +#define PTR_SUBU	sub.d
> +#define PTR_L		ld.d
> +#define PTR_S		st.d
> +#define PTR_LI		li.d
> +#define PTR_SLL		slli.d
> +#define PTR_SLLV	sll.d
> +#define PTR_SRL		srli.d
> +#define PTR_SRLV	srl.d
> +#define PTR_SRA		srai.d
> +#define PTR_SRAV	sra.d
> +
> +#define PTR_SCALESHIFT	3
> +
> +#define PTR		.dword
> +#define PTRSIZE		8
> +#define PTRLOG		3
> +#endif
> +
> +#endif /* __ASM_ASM_H */
> diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/include/asm/asmmacro.h
> new file mode 100644
> index 000000000000..d7089fab00e1
> --- /dev/null
> +++ b/arch/loongarch/include/asm/asmmacro.h
> @@ -0,0 +1,294 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _ASM_ASMMACRO_H
> +#define _ASM_ASMMACRO_H
> +
> +#include <asm/asm-offsets.h>
> +#include <asm/regdef.h>
> +#include <asm/fpregdef.h>
> +#include <asm/loongarch.h>
> +
> +#undef v0
> +#undef v1
> +
> +	.macro	parse_v var val
> +	\var	= \val
> +	.endm
> +
> +	.macro	parse_r var r
> +	\var	= -1
> +	.ifc	\r, $r0
> +	\var	= 0
> +	.endif
> +	.ifc	\r, $r1
> +	\var	= 1
> +	.endif
> +	.ifc	\r, $r2
> +	\var	= 2
> +	.endif
> +	.ifc	\r, $r3
> +	\var	= 3
> +	.endif
> +	.ifc	\r, $r4
> +	\var	= 4
> +	.endif
> +	.ifc	\r, $r5
> +	\var	= 5
> +	.endif
> +	.ifc	\r, $r6
> +	\var	= 6
> +	.endif
> +	.ifc	\r, $r7
> +	\var	= 7
> +	.endif
> +	.ifc	\r, $r8
> +	\var	= 8
> +	.endif
> +	.ifc	\r, $r9
> +	\var	= 9
> +	.endif
> +	.ifc	\r, $r10
> +	\var	= 10
> +	.endif
> +	.ifc	\r, $r11
> +	\var	= 11
> +	.endif
> +	.ifc	\r, $r12
> +	\var	= 12
> +	.endif
> +	.ifc	\r, $r13
> +	\var	= 13
> +	.endif
> +	.ifc	\r, $r14
> +	\var	= 14
> +	.endif
> +	.ifc	\r, $r15
> +	\var	= 15
> +	.endif
> +	.ifc	\r, $r16
> +	\var	= 16
> +	.endif
> +	.ifc	\r, $r17
> +	\var	= 17
> +	.endif
> +	.ifc	\r, $r18
> +	\var	= 18
> +	.endif
> +	.ifc	\r, $r19
> +	\var	= 19
> +	.endif
> +	.ifc	\r, $r20
> +	\var	= 20
> +	.endif
> +	.ifc	\r, $r21
> +	\var	= 21
> +	.endif
> +	.ifc	\r, $r22
> +	\var	= 22
> +	.endif
> +	.ifc	\r, $r23
> +	\var	= 23
> +	.endif
> +	.ifc	\r, $r24
> +	\var	= 24
> +	.endif
> +	.ifc	\r, $r25
> +	\var	= 25
> +	.endif
> +	.ifc	\r, $r26
> +	\var	= 26
> +	.endif
> +	.ifc	\r, $r27
> +	\var	= 27
> +	.endif
> +	.ifc	\r, $r28
> +	\var	= 28
> +	.endif
> +	.ifc	\r, $r29
> +	\var	= 29
> +	.endif
> +	.ifc	\r, $r30
> +	\var	= 30
> +	.endif
> +	.ifc	\r, $r31
> +	\var	= 31
> +	.endif
> +	.iflt	\var
> +	.error	"Unable to parse register name \r"
> +	.endif
> +	.endm
> +
> +	.macro	cpu_save_nonscratch thread
> +	stptr.d	s0, \thread, THREAD_REG23
> +	stptr.d	s1, \thread, THREAD_REG24
> +	stptr.d	s2, \thread, THREAD_REG25
> +	stptr.d	s3, \thread, THREAD_REG26
> +	stptr.d	s4, \thread, THREAD_REG27
> +	stptr.d	s5, \thread, THREAD_REG28
> +	stptr.d	s6, \thread, THREAD_REG29
> +	stptr.d	s7, \thread, THREAD_REG30
> +	stptr.d	s8, \thread, THREAD_REG31
> +	stptr.d	sp, \thread, THREAD_REG03
> +	stptr.d	fp, \thread, THREAD_REG22
> +	.endm
> +
> +	.macro	cpu_restore_nonscratch thread
> +	ldptr.d	s0, \thread, THREAD_REG23
> +	ldptr.d	s1, \thread, THREAD_REG24
> +	ldptr.d	s2, \thread, THREAD_REG25
> +	ldptr.d	s3, \thread, THREAD_REG26
> +	ldptr.d	s4, \thread, THREAD_REG27
> +	ldptr.d	s5, \thread, THREAD_REG28
> +	ldptr.d	s6, \thread, THREAD_REG29
> +	ldptr.d	s7, \thread, THREAD_REG30
> +	ldptr.d	s8, \thread, THREAD_REG31
> +	ldptr.d	ra, \thread, THREAD_REG01
> +	ldptr.d	sp, \thread, THREAD_REG03
> +	ldptr.d	fp, \thread, THREAD_REG22
> +	.endm
> +
> +	.macro fpu_save_csr thread tmp
> +	movfcsr2gr	\tmp, fcsr0
> +	stptr.w	\tmp, \thread, THREAD_FCSR
> +	.endm
> +
> +	.macro fpu_restore_csr thread tmp
> +	ldptr.w	\tmp, \thread, THREAD_FCSR
> +	movgr2fcsr	fcsr0, \tmp
> +	.endm
> +
> +	.macro fpu_save_cc thread tmp0 tmp1
> +	movcf2gr	\tmp0, $fcc0
> +	move	\tmp1, \tmp0
> +	movcf2gr	\tmp0, $fcc1
> +	bstrins.d	\tmp1, \tmp0, 15, 8
> +	movcf2gr	\tmp0, $fcc2
> +	bstrins.d	\tmp1, \tmp0, 23, 16
> +	movcf2gr	\tmp0, $fcc3
> +	bstrins.d	\tmp1, \tmp0, 31, 24
> +	movcf2gr	\tmp0, $fcc4
> +	bstrins.d	\tmp1, \tmp0, 39, 32
> +	movcf2gr	\tmp0, $fcc5
> +	bstrins.d	\tmp1, \tmp0, 47, 40
> +	movcf2gr	\tmp0, $fcc6
> +	bstrins.d	\tmp1, \tmp0, 55, 48
> +	movcf2gr	\tmp0, $fcc7
> +	bstrins.d	\tmp1, \tmp0, 63, 56
> +	stptr.d		\tmp1, \thread, THREAD_FCC
> +	.endm
> +
> +	.macro fpu_restore_cc thread tmp0 tmp1
> +	ldptr.d	\tmp0, \thread, THREAD_FCC
> +	bstrpick.d	\tmp1, \tmp0, 7, 0
> +	movgr2cf	$fcc0, \tmp1
> +	bstrpick.d	\tmp1, \tmp0, 15, 8
> +	movgr2cf	$fcc1, \tmp1
> +	bstrpick.d	\tmp1, \tmp0, 23, 16
> +	movgr2cf	$fcc2, \tmp1
> +	bstrpick.d	\tmp1, \tmp0, 31, 24
> +	movgr2cf	$fcc3, \tmp1
> +	bstrpick.d	\tmp1, \tmp0, 39, 32
> +	movgr2cf	$fcc4, \tmp1
> +	bstrpick.d	\tmp1, \tmp0, 47, 40
> +	movgr2cf	$fcc5, \tmp1
> +	bstrpick.d	\tmp1, \tmp0, 55, 48
> +	movgr2cf	$fcc6, \tmp1
> +	bstrpick.d	\tmp1, \tmp0, 63, 56
> +	movgr2cf	$fcc7, \tmp1
> +	.endm
> +
> +	.macro	fpu_save_double thread tmp
> +	li.w	\tmp, THREAD_FPR0
> +	PTR_ADDU \tmp, \tmp, \thread
> +	fst.d	$f0, \tmp, THREAD_FPR0  - THREAD_FPR0
> +	fst.d	$f1, \tmp, THREAD_FPR1  - THREAD_FPR0
> +	fst.d	$f2, \tmp, THREAD_FPR2  - THREAD_FPR0
> +	fst.d	$f3, \tmp, THREAD_FPR3  - THREAD_FPR0
> +	fst.d	$f4, \tmp, THREAD_FPR4  - THREAD_FPR0
> +	fst.d	$f5, \tmp, THREAD_FPR5  - THREAD_FPR0
> +	fst.d	$f6, \tmp, THREAD_FPR6  - THREAD_FPR0
> +	fst.d	$f7, \tmp, THREAD_FPR7  - THREAD_FPR0
> +	fst.d	$f8, \tmp, THREAD_FPR8  - THREAD_FPR0
> +	fst.d	$f9, \tmp, THREAD_FPR9  - THREAD_FPR0
> +	fst.d	$f10, \tmp, THREAD_FPR10 - THREAD_FPR0
> +	fst.d	$f11, \tmp, THREAD_FPR11 - THREAD_FPR0
> +	fst.d	$f12, \tmp, THREAD_FPR12 - THREAD_FPR0
> +	fst.d	$f13, \tmp, THREAD_FPR13 - THREAD_FPR0
> +	fst.d	$f14, \tmp, THREAD_FPR14 - THREAD_FPR0
> +	fst.d	$f15, \tmp, THREAD_FPR15 - THREAD_FPR0
> +	fst.d	$f16, \tmp, THREAD_FPR16 - THREAD_FPR0
> +	fst.d	$f17, \tmp, THREAD_FPR17 - THREAD_FPR0
> +	fst.d	$f18, \tmp, THREAD_FPR18 - THREAD_FPR0
> +	fst.d	$f19, \tmp, THREAD_FPR19 - THREAD_FPR0
> +	fst.d	$f20, \tmp, THREAD_FPR20 - THREAD_FPR0
> +	fst.d	$f21, \tmp, THREAD_FPR21 - THREAD_FPR0
> +	fst.d	$f22, \tmp, THREAD_FPR22 - THREAD_FPR0
> +	fst.d	$f23, \tmp, THREAD_FPR23 - THREAD_FPR0
> +	fst.d	$f24, \tmp, THREAD_FPR24 - THREAD_FPR0
> +	fst.d	$f25, \tmp, THREAD_FPR25 - THREAD_FPR0
> +	fst.d	$f26, \tmp, THREAD_FPR26 - THREAD_FPR0
> +	fst.d	$f27, \tmp, THREAD_FPR27 - THREAD_FPR0
> +	fst.d	$f28, \tmp, THREAD_FPR28 - THREAD_FPR0
> +	fst.d	$f29, \tmp, THREAD_FPR29 - THREAD_FPR0
> +	fst.d	$f30, \tmp, THREAD_FPR30 - THREAD_FPR0
> +	fst.d	$f31, \tmp, THREAD_FPR31 - THREAD_FPR0
> +	.endm
> +
> +	.macro	fpu_restore_double thread tmp
> +	li.w	\tmp, THREAD_FPR0
> +	PTR_ADDU \tmp, \tmp, \thread
> +	fld.d	$f0, \tmp, THREAD_FPR0  - THREAD_FPR0
> +	fld.d	$f1, \tmp, THREAD_FPR1  - THREAD_FPR0
> +	fld.d	$f2, \tmp, THREAD_FPR2  - THREAD_FPR0
> +	fld.d	$f3, \tmp, THREAD_FPR3  - THREAD_FPR0
> +	fld.d	$f4, \tmp, THREAD_FPR4  - THREAD_FPR0
> +	fld.d	$f5, \tmp, THREAD_FPR5  - THREAD_FPR0
> +	fld.d	$f6, \tmp, THREAD_FPR6  - THREAD_FPR0
> +	fld.d	$f7, \tmp, THREAD_FPR7  - THREAD_FPR0
> +	fld.d	$f8, \tmp, THREAD_FPR8  - THREAD_FPR0
> +	fld.d	$f9, \tmp, THREAD_FPR9  - THREAD_FPR0
> +	fld.d	$f10, \tmp, THREAD_FPR10 - THREAD_FPR0
> +	fld.d	$f11, \tmp, THREAD_FPR11 - THREAD_FPR0
> +	fld.d	$f12, \tmp, THREAD_FPR12 - THREAD_FPR0
> +	fld.d	$f13, \tmp, THREAD_FPR13 - THREAD_FPR0
> +	fld.d	$f14, \tmp, THREAD_FPR14 - THREAD_FPR0
> +	fld.d	$f15, \tmp, THREAD_FPR15 - THREAD_FPR0
> +	fld.d	$f16, \tmp, THREAD_FPR16 - THREAD_FPR0
> +	fld.d	$f17, \tmp, THREAD_FPR17 - THREAD_FPR0
> +	fld.d	$f18, \tmp, THREAD_FPR18 - THREAD_FPR0
> +	fld.d	$f19, \tmp, THREAD_FPR19 - THREAD_FPR0
> +	fld.d	$f20, \tmp, THREAD_FPR20 - THREAD_FPR0
> +	fld.d	$f21, \tmp, THREAD_FPR21 - THREAD_FPR0
> +	fld.d	$f22, \tmp, THREAD_FPR22 - THREAD_FPR0
> +	fld.d	$f23, \tmp, THREAD_FPR23 - THREAD_FPR0
> +	fld.d	$f24, \tmp, THREAD_FPR24 - THREAD_FPR0
> +	fld.d	$f25, \tmp, THREAD_FPR25 - THREAD_FPR0
> +	fld.d	$f26, \tmp, THREAD_FPR26 - THREAD_FPR0
> +	fld.d	$f27, \tmp, THREAD_FPR27 - THREAD_FPR0
> +	fld.d	$f28, \tmp, THREAD_FPR28 - THREAD_FPR0
> +	fld.d	$f29, \tmp, THREAD_FPR29 - THREAD_FPR0
> +	fld.d	$f30, \tmp, THREAD_FPR30 - THREAD_FPR0
> +	fld.d	$f31, \tmp, THREAD_FPR31 - THREAD_FPR0
> +	.endm
> +
> +.macro not dst src
> +	nor	\dst, \src, zero
> +.endm
> +
> +.macro bgt r0 r1 label
> +	blt	\r1, \r0, \label
> +.endm
> +
> +.macro bltz r0 label
> +	blt	\r0, zero, \label
> +.endm
> +
> +.macro bgez r0 label
> +	bge	\r0, zero, \label
> +.endm
These are all supported in upstream binutils, so you can just remove them.
> +
> +#define v0 $r4
> +#define v1 $r5
If you removed every mention of v0 and v1, this would be unnecessary as 
well. ;-)
> +#endif /* _ASM_ASMMACRO_H */
> diff --git a/arch/loongarch/include/asm/clocksource.h b/arch/loongarch/include/asm/clocksource.h
> new file mode 100644
> index 000000000000..58e64aa05d26
> --- /dev/null
> +++ b/arch/loongarch/include/asm/clocksource.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Author: Huacai Chen <chenhuacai@loongson.cn>
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef __ASM_CLOCKSOURCE_H
> +#define __ASM_CLOCKSOURCE_H
> +
> +#include <asm/vdso/clocksource.h>
> +
> +#endif /* __ASM_CLOCKSOURCE_H */
> diff --git a/arch/loongarch/include/asm/compiler.h b/arch/loongarch/include/asm/compiler.h
> new file mode 100644
> index 000000000000..657cebe70ace
> --- /dev/null
> +++ b/arch/loongarch/include/asm/compiler.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _ASM_COMPILER_H
> +#define _ASM_COMPILER_H
> +
> +#define GCC_OFF_SMALL_ASM() "ZC"
> +
> +#define LOONGARCH_ISA_LEVEL "loongarch"
> +#define LOONGARCH_ISA_ARCH_LEVEL "arch=loongarch"
> +#define LOONGARCH_ISA_LEVEL_RAW loongarch
Do these need updating? I remember "-march=loongarch" is an old-world thing.
> +#define LOONGARCH_ISA_ARCH_LEVEL_RAW LOONGARCH_ISA_LEVEL_RAW
> +
> +#endif /* _ASM_COMPILER_H */
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
> new file mode 100644
> index 000000000000..46166ee1e33f
> --- /dev/null
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _ASM_INST_H
> +#define _ASM_INST_H
> +
> +#include <linux/types.h>
> +#include <asm/asm.h>
> +#include <uapi/asm/inst.h>
> +
> +#define ADDR_IMMMASK_LU52ID	0xFFF0000000000000
> +#define ADDR_IMMMASK_LU32ID	0x000FFFFF00000000
> +#define ADDR_IMMMASK_ADDU16ID	0x00000000FFFF0000
> +
> +#define ADDR_IMMSHIFT_LU52ID	52
> +#define ADDR_IMMSHIFT_LU32ID	32
> +#define ADDR_IMMSHIFT_ADDU16ID	16
> +
> +#define ADDR_IMM(addr, INSN)	((addr & ADDR_IMMMASK_##INSN) >> ADDR_IMMSHIFT_##INSN)
> +
> +enum loongarch_gpr {
> +	LOONGARCH_GPR_ZERO = 0,
> +	LOONGARCH_GPR_RA = 1,
> +	LOONGARCH_GPR_TP = 2,
> +	LOONGARCH_GPR_SP = 3,
> +	LOONGARCH_GPR_A0 = 4,
> +	LOONGARCH_GPR_A1,
> +	LOONGARCH_GPR_A2,
> +	LOONGARCH_GPR_A3,
> +	LOONGARCH_GPR_A4,
> +	LOONGARCH_GPR_A5,
> +	LOONGARCH_GPR_A6,
> +	LOONGARCH_GPR_A7,
> +	LOONGARCH_GPR_V0 = 4,
> +	LOONGARCH_GPR_V1 = 5,
> +	LOONGARCH_GPR_T0 = 12,
> +	LOONGARCH_GPR_T1,
> +	LOONGARCH_GPR_T2,
> +	LOONGARCH_GPR_T3,
> +	LOONGARCH_GPR_T4,
> +	LOONGARCH_GPR_T5,
> +	LOONGARCH_GPR_T6,
> +	LOONGARCH_GPR_T7,
> +	LOONGARCH_GPR_T8,
> +	LOONGARCH_GPR_FP = 22,
> +	LOONGARCH_GPR_S0 = 23,
> +	LOONGARCH_GPR_S1,
> +	LOONGARCH_GPR_S2,
> +	LOONGARCH_GPR_S3,
> +	LOONGARCH_GPR_S4,
> +	LOONGARCH_GPR_S5,
> +	LOONGARCH_GPR_S6,
> +	LOONGARCH_GPR_S7,
> +	LOONGARCH_GPR_S8,
> +	LOONGARCH_GPR_MAX
> +};
> +
> +u32 larch_insn_gen_lu32id(enum loongarch_gpr rd, int imm);
> +u32 larch_insn_gen_lu52id(enum loongarch_gpr rd, enum loongarch_gpr rj, int imm);
> +u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum loongarch_gpr rj, unsigned long pc, unsigned long dest);
> +
> +#endif /* _ASM_INST_H */
> diff --git a/arch/loongarch/include/asm/linkage.h b/arch/loongarch/include/asm/linkage.h
> new file mode 100644
> index 000000000000..283b3389b561
> --- /dev/null
> +++ b/arch/loongarch/include/asm/linkage.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_LINKAGE_H
> +#define __ASM_LINKAGE_H
> +
> +#define __ALIGN		.align 2
> +#define __ALIGN_STR	".align 2"
Just __stringify(__ALIGN) where needed.
> +
> +#define SYM_FUNC_START(name)				\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> +	.cfi_startproc;
> +
> +#define SYM_FUNC_START_NOALIGN(name)			\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
> +	.cfi_startproc;
> +
> +#define SYM_FUNC_START_LOCAL(name)			\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
> +	.cfi_startproc;
> +
> +#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
> +	.cfi_startproc;
> +
> +#define SYM_FUNC_START_WEAK(name)			\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
> +	.cfi_startproc;
> +
> +#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
> +	.cfi_startproc;
> +
> +#define SYM_FUNC_END(name)				\
> +	.cfi_endproc;					\
> +	SYM_END(name, SYM_T_FUNC)
> +
> +#endif
> diff --git a/arch/loongarch/include/asm/perf_event.h b/arch/loongarch/include/asm/perf_event.h
> new file mode 100644
> index 000000000000..44293ec8c153
> --- /dev/null
> +++ b/arch/loongarch/include/asm/perf_event.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Author: Huacai Chen <chenhuacai@loongson.cn>
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef __LOONGARCH_PERF_EVENT_H__
> +#define __LOONGARCH_PERF_EVENT_H__
> +/* Leave it empty here. The file is required by linux/perf_event.h */
> +#endif /* __LOONGARCH_PERF_EVENT_H__ */
> diff --git a/arch/loongarch/include/asm/prefetch.h b/arch/loongarch/include/asm/prefetch.h
> new file mode 100644
> index 000000000000..1672262a5e2e
> --- /dev/null
> +++ b/arch/loongarch/include/asm/prefetch.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef __ASM_PREFETCH_H
> +#define __ASM_PREFETCH_H
> +
> +#define Pref_Load	0
> +#define Pref_Store	8
> +
> +#ifdef __ASSEMBLY__
> +
> +	.macro	__pref hint addr
> +#ifdef CONFIG_CPU_HAS_PREFETCH
> +	preld	\hint, \addr, 0
> +#endif
> +	.endm
> +
> +	.macro	pref_load addr
> +	__pref	Pref_Load, \addr
> +	.endm
> +
> +	.macro	pref_store addr
> +	__pref	Pref_Store, \addr
> +	.endm
> +
> +#endif
> +
> +#endif /* __ASM_PREFETCH_H */
> diff --git a/arch/loongarch/include/asm/serial.h b/arch/loongarch/include/asm/serial.h
> new file mode 100644
> index 000000000000..3fb550eb9115
> --- /dev/null
> +++ b/arch/loongarch/include/asm/serial.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef __ASM__SERIAL_H
> +#define __ASM__SERIAL_H
> +
> +#define BASE_BAUD 0
> +#define STD_COM_FLAGS (ASYNC_BOOT_AUTOCONF | ASYNC_SKIP_TEST)
> +
> +#endif /* __ASM__SERIAL_H */
> diff --git a/arch/loongarch/include/asm/time.h b/arch/loongarch/include/asm/time.h
> new file mode 100644
> index 000000000000..ace1665695b8
> --- /dev/null
> +++ b/arch/loongarch/include/asm/time.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _ASM_TIME_H
> +#define _ASM_TIME_H
> +
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <asm/loongarch.h>
> +
> +extern u64 cpu_clock_freq;
> +extern u64 const_clock_freq;
> +
> +extern void sync_counter(void);
> +
> +static inline unsigned int calc_const_freq(void)
> +{
> +	unsigned int res;
> +	unsigned int base_freq;
> +	unsigned int cfm, cfd;
> +
> +	res = read_cpucfg(LOONGARCH_CPUCFG2);
> +	if (!(res & CPUCFG2_LLFTP))
> +		return 0;
> +
> +	base_freq = read_cpucfg(LOONGARCH_CPUCFG4);
> +	res = read_cpucfg(LOONGARCH_CPUCFG5);
> +	cfm = res & 0xffff;
> +	cfd = (res >> 16) & 0xffff;
> +
> +	if (!base_freq || !cfm || !cfd)
> +		return 0;
> +	else
> +		return (base_freq * cfm / cfd);
No need for the "else" here.
> +}
> +
> +/*
> + * Initialize the calling CPU's timer interrupt as clockevent device
> + */
> +extern int constant_clockevent_init(void);
> +extern int constant_clocksource_init(void);
> +
> +static inline void clockevent_set_clock(struct clock_event_device *cd,
> +					unsigned int clock)
> +{
> +	clockevents_calc_mult_shift(cd, clock, 4);
> +}
> +
> +#endif /* _ASM_TIME_H */
> diff --git a/arch/loongarch/include/asm/timex.h b/arch/loongarch/include/asm/timex.h
> new file mode 100644
> index 000000000000..3f8db082f00d
> --- /dev/null
> +++ b/arch/loongarch/include/asm/timex.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _ASM_TIMEX_H
> +#define _ASM_TIMEX_H
> +
> +#ifdef __KERNEL__
> +
> +#include <linux/compiler.h>
> +
> +#include <asm/cpu.h>
> +#include <asm/cpu-features.h>
> +
> +/*
> + * Standard way to access the cycle counter.
> + * Currently only used on SMP for scheduling.
> + *
> + * We know that all SMP capable CPUs have cycle counters.
> + */
> +
> +typedef unsigned long cycles_t;
> +
> +static inline cycles_t get_cycles(void)
> +{
> +	return drdtime();
> +}
> +
> +#endif /* __KERNEL__ */
> +
> +#endif /*  _ASM_TIMEX_H */
> diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/include/asm/topology.h
> new file mode 100644
> index 000000000000..9ac71a25207a
> --- /dev/null
> +++ b/arch/loongarch/include/asm/topology.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef __ASM_TOPOLOGY_H
> +#define __ASM_TOPOLOGY_H
> +
> +#include <linux/smp.h>
> +
> +#define cpu_logical_map(cpu)  0
> +
> +#include <asm-generic/topology.h>
> +
> +static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> +#endif /* __ASM_TOPOLOGY_H */
> diff --git a/arch/loongarch/include/asm/types.h b/arch/loongarch/include/asm/types.h
> new file mode 100644
> index 000000000000..f783cf11ea52
> --- /dev/null
> +++ b/arch/loongarch/include/asm/types.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _ASM_TYPES_H
> +#define _ASM_TYPES_H
> +
> +#include <asm-generic/int-ll64.h>
> +#include <uapi/asm/types.h>
> +
> +/*
> + * The following macros are especially useful for __asm__
> + * inline assembler.
> + */
> +#ifndef __STR
> +#define __STR(x) #x
> +#endif
> +#ifndef STR
> +#define STR(x) __STR(x)
> +#endif
Again, just use __stringify from <linux/stringify.h> where appropriate.
> +
> +/*
> + *  Configure language
> + */
> +#ifdef __ASSEMBLY__
> +#define _ULCAST_
> +#define _U64CAST_
> +#else
> +#define _ULCAST_ (unsigned long)
> +#define _U64CAST_ (u64)
> +#endif
> +
> +#endif /* _ASM_TYPES_H */
> diff --git a/arch/loongarch/include/uapi/asm/bitfield.h b/arch/loongarch/include/uapi/asm/bitfield.h
> new file mode 100644
> index 000000000000..e31a719b7007
> --- /dev/null
> +++ b/arch/loongarch/include/uapi/asm/bitfield.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * Author: Hanlu Li <lihanlu@loongson.cn>
> + *         Huacai Chen <chenhuacai@loongson.cn>
> + *
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef __UAPI_ASM_BITFIELD_H
> +#define __UAPI_ASM_BITFIELD_H
> +
> +#define __BITFIELD_FIELD(field, more)					\
> +	more								\
> +	field;
> +
> +#endif /* __UAPI_ASM_BITFIELD_H */
> diff --git a/arch/loongarch/include/uapi/asm/bitsperlong.h b/arch/loongarch/include/uapi/asm/bitsperlong.h
> new file mode 100644
> index 000000000000..5c2c8779a695
> --- /dev/null
> +++ b/arch/loongarch/include/uapi/asm/bitsperlong.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef __ASM_LOONGARCH_BITSPERLONG_H
> +#define __ASM_LOONGARCH_BITSPERLONG_H
> +
> +#define __BITS_PER_LONG _LOONGARCH_SZLONG
Use __loongarch_grlen instead of the MIPS-like symbol, or 
__SIZEOF_LONG__ * 8.
> +
> +#include <asm-generic/bitsperlong.h>
> +
> +#endif /* __ASM_LOONGARCH_BITSPERLONG_H */
> diff --git a/arch/loongarch/include/uapi/asm/byteorder.h b/arch/loongarch/include/uapi/asm/byteorder.h
> new file mode 100644
> index 000000000000..b1722d890deb
> --- /dev/null
> +++ b/arch/loongarch/include/uapi/asm/byteorder.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * Author: Hanlu Li <lihanlu@loongson.cn>
> + *         Huacai Chen <chenhuacai@loongson.cn>
> + *
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _ASM_BYTEORDER_H
> +#define _ASM_BYTEORDER_H
> +
> +#include <linux/byteorder/little_endian.h>
> +
> +#endif /* _ASM_BYTEORDER_H */
> diff --git a/arch/loongarch/include/uapi/asm/inst.h b/arch/loongarch/include/uapi/asm/inst.h
File is named "inst" while talking all about "insn"... and do we even 
need this in the UAPI? We have to act quick before merging, or this 
unfortunate legacy from MIPS would continue to plague us.
> new file mode 100644
> index 000000000000..fa00cc5ede9d
> --- /dev/null
> +++ b/arch/loongarch/include/uapi/asm/inst.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Format of an instruction in memory.
> + *
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +#ifndef _UAPI_ASM_INST_H
> +#define _UAPI_ASM_INST_H
> +
> +#include <asm/bitfield.h>
> +
> +enum reg1i20_op {
> +	lu12iw_op	= 0x0a,
> +	lu32id_op	= 0x0b,
> +};
> +
> +enum reg2i12_op {
> +	lu52id_op	= 0x0c,
> +};
> +
> +enum reg2i16_op {
> +	jirl_op		= 0x13,
> +};
> +
> +struct reg1i20_format {
> +	__BITFIELD_FIELD(unsigned int opcode : 7,
> +	__BITFIELD_FIELD(unsigned int simmediate : 20,
> +	__BITFIELD_FIELD(unsigned int rd : 5,
> +	;)))
> +};
> +
> +struct reg2i12_format {
> +	__BITFIELD_FIELD(unsigned int opcode : 10,
> +	__BITFIELD_FIELD(signed int simmediate : 12,
> +	__BITFIELD_FIELD(unsigned int rj : 5,
> +	__BITFIELD_FIELD(unsigned int rd : 5,
> +	;))))
> +};
> +
> +struct reg2i16_format {
> +	__BITFIELD_FIELD(unsigned int opcode : 6,
> +	__BITFIELD_FIELD(unsigned int simmediate : 16,
> +	__BITFIELD_FIELD(unsigned int rj : 5,
> +	__BITFIELD_FIELD(unsigned int rd : 5,
> +	;))))
> +};
> +
> +union loongarch_instruction {
> +	unsigned int word;
> +	struct reg1i20_format reg1i20_format;
> +	struct reg2i12_format reg2i12_format;
> +	struct reg2i16_format reg2i16_format;

So the official names for instruction formats are like "2RI12" and 
"2RI16", while "1RI20" is not even one of the 9 "basic" formats... You 
may call the formats "fmt_XriXX", or better yet, use the 
loongarch-opcodes scheme [1] which is more well-defined than the 
official (which would be something like "struct fmt_djsk12 djsk12;").

Also while at it you could shorten "instruction" into "insn" like almost 
everywhere else (e.g. a few lines below).

[1]: https://github.com/loongson-community/loongarch-opcodes

> +};
> +
> +#define LOONGARCH_INSN_SIZE	sizeof(union loongarch_instruction)
> +
> +#endif /* _UAPI_ASM_INST_H */
> diff --git a/arch/loongarch/include/uapi/asm/reg.h b/arch/loongarch/include/uapi/asm/reg.h
> new file mode 100644
> index 000000000000..90ad910c60eb
> --- /dev/null
> +++ b/arch/loongarch/include/uapi/asm/reg.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Various register offset definitions for debuggers, core file
> + * examiners and whatnot.
> + *
> + * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef __UAPI_ASM_LOONGARCH_REG_H
> +#define __UAPI_ASM_LOONGARCH_REG_H
> +
> +#define LOONGARCH_EF_R0		0
> +#define LOONGARCH_EF_R1		1
> +#define LOONGARCH_EF_R2		2
> +#define LOONGARCH_EF_R3		3
> +#define LOONGARCH_EF_R4		4
> +#define LOONGARCH_EF_R5		5
> +#define LOONGARCH_EF_R6		6
> +#define LOONGARCH_EF_R7		7
> +#define LOONGARCH_EF_R8		8
> +#define LOONGARCH_EF_R9		9
> +#define LOONGARCH_EF_R10	10
> +#define LOONGARCH_EF_R11	11
> +#define LOONGARCH_EF_R12	12
> +#define LOONGARCH_EF_R13	13
> +#define LOONGARCH_EF_R14	14
> +#define LOONGARCH_EF_R15	15
> +#define LOONGARCH_EF_R16	16
> +#define LOONGARCH_EF_R17	17
> +#define LOONGARCH_EF_R18	18
> +#define LOONGARCH_EF_R19	19
> +#define LOONGARCH_EF_R20	20
> +#define LOONGARCH_EF_R21	21
> +#define LOONGARCH_EF_R22	22
> +#define LOONGARCH_EF_R23	23
> +#define LOONGARCH_EF_R24	24
> +#define LOONGARCH_EF_R25	25
> +#define LOONGARCH_EF_R26	26
> +#define LOONGARCH_EF_R27	27
> +#define LOONGARCH_EF_R28	28
> +#define LOONGARCH_EF_R29	29
> +#define LOONGARCH_EF_R30	30
> +#define LOONGARCH_EF_R31	31
> +
> +/*
> + * Saved special registers
> + */
> +#define LOONGARCH_EF_ORIG_A0	32
> +#define LOONGARCH_EF_CSR_ERA	33
> +#define LOONGARCH_EF_CSR_BADV	34
> +#define LOONGARCH_EF_CSR_CRMD	35
> +#define LOONGARCH_EF_CSR_PRMD	36
> +#define LOONGARCH_EF_CSR_EUEN	37
> +#define LOONGARCH_EF_CSR_ECFG	38
> +#define LOONGARCH_EF_CSR_ESTAT	39
> +
> +#define LOONGARCH_EF_SIZE	320	/* size in bytes */
> +
> +#endif /* __UAPI_ASM_LOONGARCH_REG_H */
> diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
> index edba4d93e9e6..da5206517158 100644
> --- a/tools/include/uapi/asm/bitsperlong.h
> +++ b/tools/include/uapi/asm/bitsperlong.h
> @@ -17,6 +17,8 @@
>   #include "../../../arch/riscv/include/uapi/asm/bitsperlong.h"
>   #elif defined(__alpha__)
>   #include "../../../arch/alpha/include/uapi/asm/bitsperlong.h"
> +#elif defined(__loongarch__)
> +#include "../../../arch/loongarch/include/uapi/asm/bitsperlong.h"
>   #else
>   #include <asm-generic/bitsperlong.h>
>   #endif
