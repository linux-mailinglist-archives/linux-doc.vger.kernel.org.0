Return-Path: <linux-doc+bounces-7573-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7B83D19F
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 01:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B2E28FA5E
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 00:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0922387;
	Fri, 26 Jan 2024 00:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jM69+poj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A9629
	for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706229897; cv=none; b=TCuQcNu09iFCxY6ZOuldOw2LX4G8QAHa+OqmqVmeS9cPkAd5FhVzvpGQvZsUY7myJRVcTMT2zN7l6yb1xU8bCXI03OsP55syLE9XMLUX8Wj46E5qwS3Ap/Fo0XVUrRHRT6nCaw4gbUqm5w4IgSKEOCXIktk1GILi7Wik4dCTWb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706229897; c=relaxed/simple;
	bh=bE4fpJuHj+yRAd5Uk//jR+Hp+5mYAmB2aXHCvPK+aUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkS/GuuBzscE4Xqk4VURwbF+onizdMTWHD35efDYbJGRjs675w/IXAYIuDl6GoZp/i/eo/1O8mKnjP4GpEPWwL0gTjv/Aw3mkjJF2AdDpw/0aNAX2fbjL+KGaynS/JbZVNcahRAOSWS27QLswEl/CJwPLxhk1hbpO5p5bdncHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jM69+poj; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d7005ea1d0so696564a12.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 16:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706229894; x=1706834694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtJqbwcd1aBKR50xMCAH1cHJy1bZ+E6DqnetizUbxLI=;
        b=jM69+pojODvLVe2jrMKa/EaXdecb9QK8Y3YQImKQ4klnJfHOXd5nr0FUJSwOGtZuWj
         4gXUeEwcAkZd3xqxrV3KOLd6CZW3ES9dTq3ouBLYUSmWCHzfVvJes7ph/euHe4zO0m77
         MG3glO/7AP3oo4hRhXgneMINfaWZiKIrml/ScEeoElXizP97Dp6F0vlPI3nn9conbYVl
         uUlEfAPNhnVNsQnsG6qZIlO1ufQDDSq8Y3NBnMHkdbL4aH/Ev2pOp5RY7COr1kzGCwjw
         FEhZ3twQbYv+Tgd0d8RJh6mU3e1egU2N5wd/DUCidAn2Esgg7cfw2si1yCl0zQlIhXML
         GRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706229894; x=1706834694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtJqbwcd1aBKR50xMCAH1cHJy1bZ+E6DqnetizUbxLI=;
        b=lcLh0jqIrsEImAO5CBDPdbgI7Ef7auzLyLSMqye+/sTyfxgkSU6wslhUUBL3/K4JvF
         wjhQFk07WbJtbM/6tTwIt3UmGucBE1PUf5hkicGojlRZFvROGW0eeXi56KALegjYVVnf
         saRTFfJCTWcCnvurY96Bwmivdi4+GvgkRHrEuQU1rN8d4TJWlKdu+Pa4xUYjqloimnw0
         R56MAWqqllQFQPOAfnx8GKesbCFDYPrXyp2QsBQGILV3G0HPtCgkhbRFT0D3qJL3l4TS
         jJEK/oRAKwA/eBrbYfyc00UzqmzSlP16mjGouZStzwfMPEZJM4YqdWEhONnGJ1RyEsFA
         YMcA==
X-Gm-Message-State: AOJu0YwHXeiN1p6VRK27Sy9tF9prVMcOu1WqMQy8azzUsgzkicYZSz2r
	iUETSCc5bOgRi6QtSzJ5zTG99h4MIGXBuJ/Eaq7rS34D47w7U9Q+7LlL4aidN9U=
X-Google-Smtp-Source: AGHT+IH+Bxa7letLB9xYoBzAsfuPFFdoXoVju5Pp59vvbK+VMz3/T3dc9A+D3CKZT1bi+po/3jE8Ug==
X-Received: by 2002:a05:6a20:12cb:b0:19c:6dc3:117e with SMTP id v11-20020a056a2012cb00b0019c6dc3117emr198322pzg.32.1706229894471;
        Thu, 25 Jan 2024 16:44:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id l2-20020a63f302000000b005cd8044c6fesm114817pgh.23.2024.01.25.16.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 16:44:54 -0800 (PST)
Date: Thu, 25 Jan 2024 16:44:50 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, ruscur@russell.cc,
	bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il,
	zhangqing@loongson.cn, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Message-ID: <ZbMAgl5RqaUEs3Dr@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-16-debug@rivosinc.com>
 <ZbLRgEVZvh7LE+k/@ghost>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZbLRgEVZvh7LE+k/@ghost>

On Thu, Jan 25, 2024 at 01:24:16PM -0800, Charlie Jenkins wrote:
>On Wed, Jan 24, 2024 at 10:21:40PM -0800, debug@rivosinc.com wrote:
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> As discussed extensively in the changelog for the addition of this
>> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
>> existing mmap() and madvise() syscalls do not map entirely well onto the
>> security requirements for guarded control stacks since they lead to
>> windows where memory is allocated but not yet protected or stacks which
>> are not properly and safely initialised. Instead a new syscall
>> map_shadow_stack() has been defined which allocates and initialises a
>> shadow stack page.
>>
>> This patch implements this syscall for riscv. riscv doesn't require token
>> to be setup by kernel because user mode can do that by itself. However to
>> provide compatiblity and portability with other architectues, user mode can
>> specify token set flag.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/kernel/Makefile      |   2 +
>>  arch/riscv/kernel/usercfi.c     | 150 ++++++++++++++++++++++++++++++++
>>  include/uapi/asm-generic/mman.h |   1 +
>>  3 files changed, 153 insertions(+)
>>  create mode 100644 arch/riscv/kernel/usercfi.c
>>
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index fee22a3d1b53..8c668269e886 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -102,3 +102,5 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
>>
>>  obj-$(CONFIG_64BIT)		+= pi/
>>  obj-$(CONFIG_ACPI)		+= acpi.o
>> +
>> +obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
>> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
>> new file mode 100644
>> index 000000000000..35ede2cbc05b
>> --- /dev/null
>> +++ b/arch/riscv/kernel/usercfi.c
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 Rivos, Inc.
>Nit: Should be updated to 2024

noted

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
>> +	/*
>> +	 * In case ssamoswap faults, return -1.
>> +	 * Never expect -1 on shadow stack. Expect return addresses and zero
>> +	 */
>> +	unsigned long swap = -1;
>> +
>> +	__enable_user_access();
>> +	asm_volatile_goto(
>> +				".option push\n"
>> +				".option arch, +zicfiss\n"
>> +#ifdef CONFIG_64BIT
>> +				"1: ssamoswap.d %0, %2, %1\n"
>> +#else
>> +				"1: ssamoswap.w %0, %2, %1\n"
>
>A SSAMOSWAP macro that conditionally defines this would be cleaner

Yes I need to do that. Infact I need to gate CONFIG_RISCV_USER_CFI behind
some riscv-gnu toolchain version as well. Becuase not all toolchain versions will
recognize this.

>
>> +#endif
>> +				_ASM_EXTABLE(1b, %l[fault])
>> +				RISCV_ACQUIRE_BARRIER
>> +				".option pop\n"
>> +				: "=r" (swap), "+A" (*addr)
>
>I just ran into this on one of my patches that not every compiler
>supports output args in asm goto blocks. You need to guard this with the
>kconfig option CC_HAS_ASM_GOTO_TIED_OUTPUT. Unfortunately, that means
>that this code needs two versions, or you can choose to gate CFI behind
>this option, it's supported by recent versions of GCC/CLANG.

Thanks.
I'll gate behind CC_HAS_ASM_GOTO_TIED_OUTPUT. Earlier versions of GCC/CLANG
won't have CFI support in them anyways.

>
>For readability it is also nice to use labels for the asm variables such
>as `"=r" (swap)` can be `[swap] "=r" (swap)` and then replace %0 with
>%[swap].

noted, will do that. I copied it from gcc asm snippet `amoswap` somewhere in
kernel. Goes without saying, I am terrible with gcc asm syntax.

>
>- Charlie
>
>> +				: "r" (val)
>> +				: "memory"
>> +				: fault

