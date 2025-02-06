Return-Path: <linux-doc+bounces-37105-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB6A29F96
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 05:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71731678BC
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 04:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDF3156F44;
	Thu,  6 Feb 2025 04:21:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD3246BF;
	Thu,  6 Feb 2025 04:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738815719; cv=none; b=TV+7PNURyeX9qw45deEPMvOEbX1lNMCPYM6tmNxfDmr9kx4N7fSfIelqUEAxILx4nWxQEHGovqTm9SIl4TQJ5E5vgzAdG8bQdxgMBWdfzQ4TSNnW3LOTYDT9HTmy0aTtHD79aBxYLskilyWQG2fVI661+IfBT1FW5sHeIasCQPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738815719; c=relaxed/simple;
	bh=2Hu+wGlgyE1yEoFVQUzUD28Np8bQBKIHac6+sTBpD9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSc8VRMRGwUmr726/0SZIyL1rVI4xgJeI34hueQwSDUnjD5C8cKGpNmCPCUnnhvBbMMYfOCslHCBq0W6avzs8/CsH6/AR3H5qhRAouRI4MPjaOGAQoJYUwPMQeRNH0zbtMjRuapNGwgofGeqgkyDPrze/+bWjkTWg7CkyWQCVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 823831007;
	Wed,  5 Feb 2025 20:22:19 -0800 (PST)
Received: from [10.163.34.115] (unknown [10.163.34.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38B13F5A1;
	Wed,  5 Feb 2025 20:21:48 -0800 (PST)
Message-ID: <d5a2b423-2e13-48a1-b3b7-8e1c638bf716@arm.com>
Date: Thu, 6 Feb 2025 09:51:45 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mm/ptdump: Drop GENERIC_PTDUMP
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, steven.price@arm.com, christophe.leroy@csgroup.eu,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250205050039.1506377-1-anshuman.khandual@arm.com>
 <Z6M23dR5wvZKW4JE@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z6M23dR5wvZKW4JE@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 15:31, Mark Rutland wrote:
> On Wed, Feb 05, 2025 at 10:30:39AM +0530, Anshuman Khandual wrote:
>> GENERIC_PTDUMP does not guard any code but instead just used for platform's
>> subscription into core ptdump defined under PTDUMP_CORE, which is selected.
> 
> Selected by what?

I guess that sentence was incomplete. PTDUMP_CORE gets selected by all
the real users which requires core PTDUMP to be built and enabled.

arch/arm64/kvm/Kconfig: select PTDUMP_CORE	/* config PTDUMP_STAGE2_DEBUGFS */
arch/x86/Kconfig.debug: select PTDUMP_CORE	/* config EFI_PGT_DUMP */

mm/Kconfig.debug:       select PTDUMP_CORE	/* config PTDUMP_DEBUGFS */
mm/Kconfig.debug:       select PTDUMP_CORE	/* config DEBUG_WX */

> 
>> Instead use PTDUMP_CORE for platform subscription and drop GENERIC_PTDUMP.
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Heiko Carstens <hca@linux.ibm.com>
>> Cc: Vasily Gorbik <gor@linux.ibm.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kvmarm@lists.linux.dev
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-s390@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on v6.14-rc1
>>
>> Changes in V2:
>>
>> - Keep arch/powerpc/Kconfig alphabetically sorted per Christophe
>>
>> Changes in V1:
>>
>> https://lore.kernel.org/all/20241217034807.2541349-1-anshuman.khandual@arm.com/
>>
>>  Documentation/arch/arm64/ptdump.rst       | 1 -
>>  arch/arm64/Kconfig                        | 2 +-
>>  arch/arm64/kvm/Kconfig                    | 3 +--
>>  arch/powerpc/Kconfig                      | 2 +-
>>  arch/powerpc/configs/mpc885_ads_defconfig | 1 -
>>  arch/riscv/Kconfig                        | 2 +-
>>  arch/s390/Kconfig                         | 2 +-
>>  arch/x86/Kconfig                          | 2 +-
>>  arch/x86/Kconfig.debug                    | 2 +-
>>  kernel/configs/debug.config               | 1 -
>>  mm/Kconfig.debug                          | 8 ++------
>>  11 files changed, 9 insertions(+), 17 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
>> index 5dcfc5d7cddf..61ca040a885b 100644
>> --- a/Documentation/arch/arm64/ptdump.rst
>> +++ b/Documentation/arch/arm64/ptdump.rst
>> @@ -22,7 +22,6 @@ offlining of memory being accessed by the ptdump code.
>>  In order to dump the kernel page tables, enable the following
>>  configurations and mount debugfs::
>>  
>> - CONFIG_GENERIC_PTDUMP=y
>>   CONFIG_PTDUMP_CORE=y
>>   CONFIG_PTDUMP_DEBUGFS=y
>>  
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index fcdd0ed3eca8..1f516bed81dd 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -157,7 +157,7 @@ config ARM64
>>  	select GENERIC_IRQ_SHOW_LEVEL
>>  	select GENERIC_LIB_DEVMEM_IS_ALLOWED
>>  	select GENERIC_PCI_IOMAP
>> -	select GENERIC_PTDUMP
>> +	select PTDUMP_CORE
>>  	select GENERIC_SCHED_CLOCK
>>  	select GENERIC_SMP_IDLE_THREAD
>>  	select GENERIC_TIME_VSYSCALL
> 
> This change means that the ptdump core code will be built regardless of
> whether any users are selected:
> 
>   [mark@lakrids:~/src/linux]% git grep CONFIG_PTDUMP_CORE
>   Documentation/arch/arm64/ptdump.rst: CONFIG_PTDUMP_CORE=y
>   arch/arm64/include/asm/ptdump.h:#ifdef CONFIG_PTDUMP_CORE
>   arch/arm64/include/asm/ptdump.h:#endif /* CONFIG_PTDUMP_CORE */
>   arch/arm64/mm/Makefile:obj-$(CONFIG_PTDUMP_CORE)        += ptdump.o
>   arch/powerpc/mm/Makefile:obj-$(CONFIG_PTDUMP_CORE)      += ptdump/
>   arch/riscv/mm/Makefile:obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
>   arch/s390/mm/Makefile:obj-$(CONFIG_PTDUMP_CORE) += dump_pagetables.o
>   arch/x86/mm/Makefile:obj-$(CONFIG_PTDUMP_CORE)  += dump_pagetables.o
>   mm/Makefile:obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
> 
> GENERIC_PTDUMP means "this architecture uses generic ptdump code for
> ptdump", i.e. the architecture implements all the necessary bits for
> that to work *IF* it is built.
> 
> PTDUMP_CORE means "actually build the core ptdump code".
> 
> If everyone uses the generic ptdump code now, maybe it's worth renaming
> GENERIC_PTDUMP to ARCH_HAS_PTDUMP or something like that, but I don't
> think this change makes sense as-is.

Seems like a combination of ARCH_HAS_CORE_PTDUMP for subscription and
CORE_PTDUMP for actual enablement will make things clear. _CORE_ here
would still let platforms define their own CONFIG_PTDUMP if preferred
and not subscribe the generic CORE_DUMP.

currently GENERIC_PTDUMP and CORE_PTDUMP just seems disjoint, because
GENERIC_PTDUMP does not not appear to be the platform opt in required
for CORE_PTDUMP.

There is another problem.

mm/Kconfig.debug

config DEBUG_WX
        bool "Warn on W+X mappings at boot"
        depends on ARCH_HAS_DEBUG_WX
        depends on MMU
        select PTDUMP_CORE
        help

Before selecting PTDUMP_CORE it does not ensure platform has opted in
via GENERIC_PTDUMP or not. Instead it should be

config DEBUG_WX
        bool "Warn on W+X mappings at boot"
        depends on ARCH_HAS_DEBUG_WX
	depends on GENERIC_PTDUMP
	depends on 
        depends on MMU
        select PTDUMP_CORE
        help

PTDUMP_STAGE2_DEBUGFS on arm64 does that where as EFI_PGT_DUMP on x86
does not. Although it will be ideal but that's not a problem if the
platform knows for sure that it opts in GENERIC_PTDUMP.

> 
> [...]
> 
>> diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
>> index 20552f163930..8aafd050b754 100644
>> --- a/kernel/configs/debug.config
>> +++ b/kernel/configs/debug.config
>> @@ -73,7 +73,6 @@ CONFIG_DEBUG_VM=y
>>  CONFIG_DEBUG_VM_PGFLAGS=y
>>  CONFIG_DEBUG_VM_RB=y
>>  CONFIG_DEBUG_VM_VMACACHE=y
>> -CONFIG_GENERIC_PTDUMP=y
>>  CONFIG_KASAN=y
>>  CONFIG_KASAN_GENERIC=y
>>  CONFIG_KASAN_INLINE=y
> 
> I think this is wrong today, and removing it is the right thing to do.
> 
> Architectures with support will select this themselves, and on
> architectures without support this either does nothing or causes a build
> failure.

Alright, will separate this change out first.

