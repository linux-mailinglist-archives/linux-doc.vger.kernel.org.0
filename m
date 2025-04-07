Return-Path: <linux-doc+bounces-42309-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC0A7D32A
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 06:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DF793AFB8C
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 04:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA302222B3;
	Mon,  7 Apr 2025 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MdUy3juS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F449221F29
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 04:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001449; cv=none; b=NsGBXxPzi/xwASOzkzdWipYUI/igiFFyiSRWvMAdvuDWqoEdmTBg5iHFmjI7TR6yy3NTeQJa375OD4lkNtOjN63/dK+4Zwh4LAQhOiNBFcwhY8tMKuqzXlnDGXld20AWp/TmIsfUoQx2JoQPNTgEj+IcP3DOuMx6suOEf9B8DFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001449; c=relaxed/simple;
	bh=e2ODKiwGGGuPiOhZAw5LSSd25eK8cxcMLz1IG/9vd+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G64l/MTVEJ+runJ5NNA6bdMZQGvBl5JhaSrnXqFS7QskANkD1IC60wW6S4nuLhCrkbwMMoHN/wcjCaRMKIYEuGJ2KzFhmIjKjQDDMxWizv9MaFKHPifx20T3D4jpLSc9djdlFBfasbfvnHF6fy2QkMBIGV6uDkAuitGeXDaz7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=MdUy3juS; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-8613f456960so15715039f.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Apr 2025 21:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744001446; x=1744606246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSbT54uFLuQxmkO99JJbKmBYJPhP8w1aIEAoXHHJX9k=;
        b=MdUy3juS95eGjSHENJfsgXigio0nMQB/8oryG9WsH/mW1swIpHpUy0YhDoJKmSPDU/
         53SkzdBe5JEqwK8hC248DPNFigCeKXWZpX9H8N67Vd8zzXuiww7SNjLWHySXO+pRLiZz
         w2pPmZhk8uRio3b6zVkAT09VoQQkKrIfmrphX0vmhqUmGYnU0yHFYmgovBc7MD6U51XE
         CJcrAJ2NF9Ai3FV+dKvbnTiXbW09vtN2wAaiUcpjiZv8dv7qoMgUFxDQaUczJ6DqVQ8Q
         PF3a2H6R4OKSpAzV/60Hnp/JmThV1b2sPSwRc4RD9RZZi2G3Kk6YnZVPmLJzwONGMAnV
         4qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001446; x=1744606246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSbT54uFLuQxmkO99JJbKmBYJPhP8w1aIEAoXHHJX9k=;
        b=AXippvzHtcwD0M9wnA8Y/4gQ46RHe7Fm309PnFuhcZsmZK5RYAcE7AyE8mSGWtoOBf
         SYbiW8FTvwMve6JhRSs3iajtrvTgPUJwumwYOfi/RBKUV4uyUaAOVhMsmbm392Aqj36u
         OWfN8gLjkmHN/ew6Uak78zxfnI43sibzbCgZB3FaCZ/cblNZXsellSzOKhE86Y0hORZZ
         2qLchK9gJzk+F6v0JT/Km3fAjgh+fXM1GpNJMQxu47Auk7r50lBPQhqCEia79N0xSX+i
         SbvZbqFlp+eXtl/IsBTVNZBBcA+oMd3auuEpvumAmz7HX2BY3/2F2CM+vEe+c//SDQKz
         F+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPG4iqMV5gFJa3NYhH8LNc/chWKzEujakbNyI/ORGcVKIdHwtgVgafJcUkq5Lmm4kz8TbzQDt3FwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhz53SqEwn3oUtIr66TpghRSzZ8b90rzrdnEvUfxu2B16F15xH
	dhzPajrwgTyCaqUDvYjfQubDA3kbut7dy+1M+FM6cNAkni/nNJfxc/jsITaU8VAgtiTJShT68kk
	Av2mzbwnpIVrAv+hj+/iTQeOE4M5s7t5UwP7TIg==
X-Gm-Gg: ASbGncume+etuvpRPOe0v2Z3N+/Q6hksrIppt/FpwHv9C8d4SkHMurIhEfyrzxRBIpt
	KQjNVzS7FzCFzdA24s/PDxC6G4rTGdnJ6KMz7oXg5RKigbNGIVQOjIKhZS64y2s23OPwv9X8wQ4
	D3JB9HnO9VX3LTMlooViMTC+JIG1lA
X-Google-Smtp-Source: AGHT+IHhVdalfJg/Z7eY6UsCfbBA0DkGD01gM9P/N23DqqMhnu+Yb+G3qK68lvaA0KDDPK6sloLhNYPOVe1kjlQCo1M=
X-Received: by 2002:a05:6602:4009:b0:85e:201e:3e35 with SMTP id
 ca18e2360f4ac-8611c2a4dc8mr1200799239f.3.1744001446586; Sun, 06 Apr 2025
 21:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com> <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 7 Apr 2025 12:50:35 +0800
X-Gm-Features: ATxdqUEcEvSvDd4YNmxt5x00v_2QFe_U7ZYW7BCOZdpLL6G50qHXNh2VbNcPJLM
Message-ID: <CANXhq0rpHMWvJhWNUKuiMvJZoqN5iTz7USmZYHff=se-+-H+3w@mail.gmail.com>
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack() syscall
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 5:39=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> w=
rote:
>
> As discussed extensively in the changelog for the addition of this
> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
> existing mmap() and madvise() syscalls do not map entirely well onto the
> security requirements for shadow stack memory since they lead to windows
> where memory is allocated but not yet protected or stacks which are not
> properly and safely initialised. Instead a new syscall map_shadow_stack()
> has been defined which allocates and initialises a shadow stack page.
>
> This patch implements this syscall for riscv. riscv doesn't require token
> to be setup by kernel because user mode can do that by itself. However to
> provide compatibility and portability with other architectues, user mode
> can specify token set flag.
>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kernel/Makefile  |   1 +
>  arch/riscv/kernel/usercfi.c | 144 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 145 insertions(+)
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 8d186bfced45..3a861d320654 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -125,3 +125,4 @@ obj-$(CONFIG_ACPI)          +=3D acpi.o
>  obj-$(CONFIG_ACPI_NUMA)        +=3D acpi_numa.o
>
>  obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) +=3D bugs.o
> +obj-$(CONFIG_RISCV_USER_CFI) +=3D usercfi.o
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> new file mode 100644
> index 000000000000..24022809a7b5
> --- /dev/null
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Rivos, Inc.
> + * Deepak Gupta <debug@rivosinc.com>
> + */
> +
> +#include <linux/sched.h>
> +#include <linux/bitops.h>
> +#include <linux/types.h>
> +#include <linux/mm.h>
> +#include <linux/mman.h>
> +#include <linux/uaccess.h>
> +#include <linux/sizes.h>
> +#include <linux/user.h>
> +#include <linux/syscalls.h>
> +#include <linux/prctl.h>
> +#include <asm/csr.h>
> +#include <asm/usercfi.h>
> +
> +#define SHSTK_ENTRY_SIZE sizeof(void *)
> +
> +/*
> + * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush=
` can happen
> + * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap`=
 takes pointer to
> + * shadow stack. To keep it simple, we plan to use `ssamoswap` to perfor=
m writes on shadow
> + * stack.
> + */
> +static noinline unsigned long amo_user_shstk(unsigned long *addr, unsign=
ed long val)
> +{
> +       /*
> +        * Never expect -1 on shadow stack. Expect return addresses and z=
ero
> +        */
> +       unsigned long swap =3D -1;
> +
> +       __enable_user_access();
> +       asm goto(
> +               ".option push\n"
> +               ".option arch, +zicfiss\n"
> +               "1: ssamoswap.d %[swap], %[val], %[addr]\n"

Hi Deepak,
It just came to my mind, do we need to ensure that menvcfg.SSE is not
zero before executing the ssamoswap instruction? Since ssamoswap is
not encoded using MOP, I=E2=80=99m wondering if we should make sure that
executing ssamoswap won=E2=80=99t accidentally trigger an illegal instructi=
on
exception. Thanks.

> +               _ASM_EXTABLE(1b, %l[fault])
> +               RISCV_ACQUIRE_BARRIER
> +               ".option pop\n"
> +               : [swap] "=3Dr" (swap), [addr] "+A" (*addr)
> +               : [val] "r" (val)
> +               : "memory"
> +               : fault
> +               );
> +       __disable_user_access();
> +       return swap;
> +fault:
> +       __disable_user_access();
> +       return -1;
> +}
> +
> +/*
> + * Create a restore token on the shadow stack.  A token is always XLEN w=
ide
> + * and aligned to XLEN.
> + */
> +static int create_rstor_token(unsigned long ssp, unsigned long *token_ad=
dr)
> +{
> +       unsigned long addr;
> +
> +       /* Token must be aligned */
> +       if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
> +               return -EINVAL;
> +
> +       /* On RISC-V we're constructing token to be function of address i=
tself */
> +       addr =3D ssp - SHSTK_ENTRY_SIZE;
> +
> +       if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)s=
sp) =3D=3D -1)
> +               return -EFAULT;
> +
> +       if (token_addr)
> +               *token_addr =3D addr;
> +
> +       return 0;
> +}
> +
> +static unsigned long allocate_shadow_stack(unsigned long addr, unsigned =
long size,
> +                                          unsigned long token_offset, bo=
ol set_tok)
> +{
> +       int flags =3D MAP_ANONYMOUS | MAP_PRIVATE;
> +       struct mm_struct *mm =3D current->mm;
> +       unsigned long populate, tok_loc =3D 0;
> +
> +       if (addr)
> +               flags |=3D MAP_FIXED_NOREPLACE;
> +
> +       mmap_write_lock(mm);
> +       addr =3D do_mmap(NULL, addr, size, PROT_READ, flags,
> +                      VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
> +       mmap_write_unlock(mm);
> +
> +       if (!set_tok || IS_ERR_VALUE(addr))
> +               goto out;
> +
> +       if (create_rstor_token(addr + token_offset, &tok_loc)) {
> +               vm_munmap(addr, size);
> +               return -EINVAL;
> +       }
> +
> +       addr =3D tok_loc;
> +
> +out:
> +       return addr;
> +}
> +
> +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, si=
ze, unsigned int, flags)
> +{
> +       bool set_tok =3D flags & SHADOW_STACK_SET_TOKEN;
> +       unsigned long aligned_size =3D 0;
> +
> +       if (!cpu_supports_shadow_stack())
> +               return -EOPNOTSUPP;
> +
> +       /* Anything other than set token should result in invalid param *=
/
> +       if (flags & ~SHADOW_STACK_SET_TOKEN)
> +               return -EINVAL;
> +
> +       /*
> +        * Unlike other architectures, on RISC-V, SSP pointer is held in =
CSR_SSP and is available
> +        * CSR in all modes. CSR accesses are performed using 12bit index=
 programmed in instruction
> +        * itself. This provides static property on register programming =
and writes to CSR can't
> +        * be unintentional from programmer's perspective. As long as pro=
grammer has guarded areas
> +        * which perform writes to CSR_SSP properly, shadow stack pivotin=
g is not possible. Since
> +        * CSR_SSP is writeable by user mode, it itself can setup a shado=
w stack token subsequent
> +        * to allocation. Although in order to provide portablity with ot=
her architecture (because
> +        * `map_shadow_stack` is arch agnostic syscall), RISC-V will foll=
ow expectation of a token
> +        * flag in flags and if provided in flags, setup a token at the b=
ase.
> +        */
> +
> +       /* If there isn't space for a token */
> +       if (set_tok && size < SHSTK_ENTRY_SIZE)
> +               return -ENOSPC;
> +
> +       if (addr && (addr & (PAGE_SIZE - 1)))
> +               return -EINVAL;
> +
> +       aligned_size =3D PAGE_ALIGN(size);
> +       if (aligned_size < size)
> +               return -EOVERFLOW;
> +
> +       return allocate_shadow_stack(addr, aligned_size, size, set_tok);
> +}
>
> --
> 2.34.1
>

