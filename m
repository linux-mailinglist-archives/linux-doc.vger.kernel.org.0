Return-Path: <linux-doc+bounces-42718-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC0A8279E
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 16:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E4CF4A6080
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 14:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8050069D2B;
	Wed,  9 Apr 2025 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hBqsiEd6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08371265CD3
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208375; cv=none; b=Nak5XrXL2SN6U05S8XYRZYs7j2zzfzcTsiLjG+pc3MIFOxlwKdv9PHxJQXW2dDCxy7oSY0BvWPTZ0bJGPY/ThP8s927UgFccOJKijstzt5QLG0XOEpD2BAP5KQhCMC4zzG4qpMr+eQX5LFdeNA45DnRHsS/fqZV11K+KYc9SneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208375; c=relaxed/simple;
	bh=OOjJOvnWzYhl5ueHhGfrtSt26gt/470fHuPjWSU/0Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+OC2LSiQeVy87KNXeOM+/LJqIio+8qfUYdA2VtLok1NkyZfYYVYNL00zJH/Uih4Xw4R6+7tik+djsbRwN/iZx3rtv4NND+D6IjQ5ctJO4v08B9fD7nRIU9g/T4HtxPs1a4G1qbcNAVv1G7vJFsZoa1N4skqj8qu+kIuzMioXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hBqsiEd6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227914acd20so7254745ad.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744208372; x=1744813172; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOgTt3TJCCtZC0mLU59SS0hlKxJUYGJ18JNxrJvKvcQ=;
        b=hBqsiEd6SoXe8PkOCerS5pqc/AVlx/Dh87oGF7jZnFAoNhMxOGPYCu88LoezMoVqGQ
         UQbwbrh54R3Gay9oGopM3IutE5OGcDx/LzRPxZ293p3rwOtTb0dZx8wDW34uYt/c807s
         JabfoJNq6JlxpteaJM/TvaDJ7ofWVeSVXx+lNK+TV0edvdvkWHklkxKkcWH0nDauEinE
         VURbnCyFGRFPiswvTFVBBAC48qHWkO6xkb5Jmt+ayw2GWxF9mvKbn8c73EIQXfKer67x
         IebGxmtKEQHW3bVVzvjNTSUNQhbjQYoLDRgPE61YJJb2rWfejsPCV0w7yuG1B8Zu2hWX
         nHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208372; x=1744813172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOgTt3TJCCtZC0mLU59SS0hlKxJUYGJ18JNxrJvKvcQ=;
        b=FkmNvvYFgqUji9iCTdLzhC5Cj1Wk5gs1tD1ftyBKUKdD5MCDBRxw//HJEbF8o1OCoe
         aUzQn54WSwjwfO76ug1K1hxWaTMYvmLXfTAetPMoSTTu+F7ictTil1h8eltb8q8hjwFy
         N5JifBQ3M69dGCt4O6ewqkBU028c85HKOXVwRUtrqDIEt7xrtUYFkzO+S4B4zEdbrtMK
         h6Ld+Q4ot+Yukl0zPmXf2J0GdKpPyX/F86ougQcrChgVsq52oWU5WBUnZBO4OhGekdBd
         HCPx+5VaWNkIeI9HK0DNIbtGXXlDm0ZZrPZs9Be60qBOojJzAvGgY1nnn+a23aGlVgWR
         o6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT88dLOjC2kKA4Sjp5GsT2U4CIuRD04zACbwtO55a4QynMmiohlMhs1KTAf1auL9z61JWG3aASrWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTqMth/r25yS/SwhOzqqgM4+QtojR9aHFi1uuYd8A/lSAV8VYc
	WjNRPtFmkXpFG/Mb4yNDeulIO+jOyBi4cGYt7Yf7gSM/DPWKL6Gb/BRboQRUaPY=
X-Gm-Gg: ASbGncvabPteRJR/R5zF+K9+tv8snoyebXPOqmRxsvv0jb1c8ENCqX9VSRuClSGIfF/
	2ov587rj5cNU4AtQPtaLuwQCQAt2HPXPTJeiHa4TsW9XVTtU25bZewyROoLvCYcp6CuV4+od8Oq
	seBH1XdU1sl77MGxlSUnIeAajf2k5L/7mk34/80ohQkfpfc8M9l/IO4rwc+XThY3VnnKkotwFEU
	PJ7SViH1in3euK/iRz0E15NjUvtmivB7MQ+wa5NC8KQ3orvxaztbHQ3RR5f2weQRgKUtTFJQPnx
	T3Ms/ziDoyZK5lFYkFcVXRTuW6RzIgLl68IM5ULGnSfdUUsENVc=
X-Google-Smtp-Source: AGHT+IEahP8JSiSgxvTh2n1gKbLAyTu8vcSecPJE9+mInATF99BTGal5h90YFsqI5Wz0yhAcDuqM7w==
X-Received: by 2002:a17:902:cec5:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22ac324879cmr39874945ad.7.1744208372199;
        Wed, 09 Apr 2025 07:19:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm12321045ad.148.2025.04.09.07.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:19:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 07:19:28 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack() syscall
Message-ID: <Z_aB8EoaqccRz8tn@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
 <CANXhq0rpHMWvJhWNUKuiMvJZoqN5iTz7USmZYHff=se-+-H+3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANXhq0rpHMWvJhWNUKuiMvJZoqN5iTz7USmZYHff=se-+-H+3w@mail.gmail.com>

On Mon, Apr 07, 2025 at 12:50:35PM +0800, Zong Li wrote:
>On Sat, Mar 15, 2025 at 5:39 AM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> As discussed extensively in the changelog for the addition of this
>> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
>> existing mmap() and madvise() syscalls do not map entirely well onto the
>> security requirements for shadow stack memory since they lead to windows
>> where memory is allocated but not yet protected or stacks which are not
>> properly and safely initialised. Instead a new syscall map_shadow_stack()
>> has been defined which allocates and initialises a shadow stack page.
>>
>> This patch implements this syscall for riscv. riscv doesn't require token
>> to be setup by kernel because user mode can do that by itself. However to
>> provide compatibility and portability with other architectues, user mode
>> can specify token set flag.
>>
>> Reviewed-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/kernel/Makefile  |   1 +
>>  arch/riscv/kernel/usercfi.c | 144 ++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 145 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index 8d186bfced45..3a861d320654 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -125,3 +125,4 @@ obj-$(CONFIG_ACPI)          += acpi.o
>>  obj-$(CONFIG_ACPI_NUMA)        += acpi_numa.o
>>
>>  obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
>> +obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
>> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
>> new file mode 100644
>> index 000000000000..24022809a7b5
>> --- /dev/null
>> +++ b/arch/riscv/kernel/usercfi.c
>> @@ -0,0 +1,144 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2024 Rivos, Inc.
>> + * Deepak Gupta <debug@rivosinc.com>
>> + */
>> +
>> +#include <linux/sched.h>
>> +#include <linux/bitops.h>
>> +#include <linux/types.h>
>> +#include <linux/mm.h>
>> +#include <linux/mman.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/sizes.h>
>> +#include <linux/user.h>
>> +#include <linux/syscalls.h>
>> +#include <linux/prctl.h>
>> +#include <asm/csr.h>
>> +#include <asm/usercfi.h>
>> +
>> +#define SHSTK_ENTRY_SIZE sizeof(void *)
>> +
>> +/*
>> + * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
>> + * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
>> + * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
>> + * stack.
>> + */
>> +static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
>> +{
>> +       /*
>> +        * Never expect -1 on shadow stack. Expect return addresses and zero
>> +        */
>> +       unsigned long swap = -1;
>> +
>> +       __enable_user_access();
>> +       asm goto(
>> +               ".option push\n"
>> +               ".option arch, +zicfiss\n"
>> +               "1: ssamoswap.d %[swap], %[val], %[addr]\n"
>
>Hi Deepak,
>It just came to my mind, do we need to ensure that menvcfg.SSE is not
>zero before executing the ssamoswap instruction? Since ssamoswap is
>not encoded using MOP, I’m wondering if we should make sure that
>executing ssamoswap won’t accidentally trigger an illegal instruction
>exception. Thanks.

FWFT patches turn SSE during early boot. There is a bug there though,
I need to check if those FWFT SBI call succeeded or not. If it failed
then itshould set a global variable indicating shadow stack can't be
turned on. And in that case this flow wouldn't be reachable. Soon I
will post v13 with these changes.

Thanks for noticing.
>
>> +               _ASM_EXTABLE(1b, %l[fault])
>> +               RISCV_ACQUIRE_BARRIER
>> +               ".option pop\n"
>> +               : [swap] "=r" (swap), [addr] "+A" (*addr)
>> +               : [val] "r" (val)
>> +               : "memory"
>> +               : fault
>> +               );
>> +       __disable_user_access();
>> +       return swap;
>> +fault:
>> +       __disable_user_access();
>> +       return -1;
>> +}
>> +
>> +/*
>> + * Create a restore token on the shadow stack.  A token is always XLEN wide
>> + * and aligned to XLEN.
>> + */
>> +static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
>> +{
>> +       unsigned long addr;
>> +
>> +       /* Token must be aligned */
>> +       if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
>> +               return -EINVAL;
>> +
>> +       /* On RISC-V we're constructing token to be function of address itself */
>> +       addr = ssp - SHSTK_ENTRY_SIZE;
>> +
>> +       if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)ssp) == -1)
>> +               return -EFAULT;
>> +
>> +       if (token_addr)
>> +               *token_addr = addr;
>> +
>> +       return 0;
>> +}
>> +
>> +static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
>> +                                          unsigned long token_offset, bool set_tok)
>> +{
>> +       int flags = MAP_ANONYMOUS | MAP_PRIVATE;
>> +       struct mm_struct *mm = current->mm;
>> +       unsigned long populate, tok_loc = 0;
>> +
>> +       if (addr)
>> +               flags |= MAP_FIXED_NOREPLACE;
>> +
>> +       mmap_write_lock(mm);
>> +       addr = do_mmap(NULL, addr, size, PROT_READ, flags,
>> +                      VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
>> +       mmap_write_unlock(mm);
>> +
>> +       if (!set_tok || IS_ERR_VALUE(addr))
>> +               goto out;
>> +
>> +       if (create_rstor_token(addr + token_offset, &tok_loc)) {
>> +               vm_munmap(addr, size);
>> +               return -EINVAL;
>> +       }
>> +
>> +       addr = tok_loc;
>> +
>> +out:
>> +       return addr;
>> +}
>> +
>> +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
>> +{
>> +       bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
>> +       unsigned long aligned_size = 0;
>> +
>> +       if (!cpu_supports_shadow_stack())
>> +               return -EOPNOTSUPP;
>> +
>> +       /* Anything other than set token should result in invalid param */
>> +       if (flags & ~SHADOW_STACK_SET_TOKEN)
>> +               return -EINVAL;
>> +
>> +       /*
>> +        * Unlike other architectures, on RISC-V, SSP pointer is held in CSR_SSP and is available
>> +        * CSR in all modes. CSR accesses are performed using 12bit index programmed in instruction
>> +        * itself. This provides static property on register programming and writes to CSR can't
>> +        * be unintentional from programmer's perspective. As long as programmer has guarded areas
>> +        * which perform writes to CSR_SSP properly, shadow stack pivoting is not possible. Since
>> +        * CSR_SSP is writeable by user mode, it itself can setup a shadow stack token subsequent
>> +        * to allocation. Although in order to provide portablity with other architecture (because
>> +        * `map_shadow_stack` is arch agnostic syscall), RISC-V will follow expectation of a token
>> +        * flag in flags and if provided in flags, setup a token at the base.
>> +        */
>> +
>> +       /* If there isn't space for a token */
>> +       if (set_tok && size < SHSTK_ENTRY_SIZE)
>> +               return -ENOSPC;
>> +
>> +       if (addr && (addr & (PAGE_SIZE - 1)))
>> +               return -EINVAL;
>> +
>> +       aligned_size = PAGE_ALIGN(size);
>> +       if (aligned_size < size)
>> +               return -EOVERFLOW;
>> +
>> +       return allocate_shadow_stack(addr, aligned_size, size, set_tok);
>> +}
>>
>> --
>> 2.34.1
>>

