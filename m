Return-Path: <linux-doc+bounces-20999-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B487934A00
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 10:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A03491C22A31
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 08:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABBB7D075;
	Thu, 18 Jul 2024 08:38:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AE976C76;
	Thu, 18 Jul 2024 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721291882; cv=none; b=aAPCEdzKfJiwPIa1AyX0fbiBLrrb/Tz4BaYo+KX+zdz0kr9hB20RFnWHEYDpKuAvCcTq6Nme1RHRXBuUqv1X10NWOyqPf3/EV6eqVfQd7X2c/u38kn13N/xlWPsYMHhVjdGsZ/kC6ubYGsFCewCkPIL5cOEIHHbXI+lRdRNgZ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721291882; c=relaxed/simple;
	bh=xOF3v7jcKewe4DuAEdY8Of/esmejmXUMnqHbkSEvLyw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ueurOqJHLV03RNiGM4aLdrb78BxImj5/coKIkwNY+g3AL9cwujMs/gmr/xCQ+9pfSGzUxjbc8IhyuMvL1vLQ1bsukaAQ9DR2TYzadSg6sWw1hfYKBtyZVNzO0TqIHAshBogsyTPePI9TJZjW8G/0GsClAGqVawWZ78w0KNSXJPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8CxhOhj1JhmG4QAAA--.2530S3;
	Thu, 18 Jul 2024 16:37:55 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxVcVf1Jhm45RNAA--.32192S3;
	Thu, 18 Jul 2024 16:37:53 +0800 (CST)
Subject: Re: [PATCH V5] LoongArch: Add AVEC irqchip support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, siyanteng@loongson.cn,
 kernel@xen0n.name, tglx@linutronix.de, jiaxun.yang@flygoat.com,
 gaoliang@loongson.cn, wangliupu@loongson.cn, lvjianmin@loongson.cn,
 yijun@loongson.cn, mhocko@suse.com, akpm@linux-foundation.org,
 dianders@chromium.org, maobibo@loongson.cn, xry111@xry111.site,
 zhaotianrui@loongson.cn, nathan@kernel.org, yangtiezhu@loongson.cn,
 zhoubinbin@loongson.cn, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240715033440.26506-1-zhangtianyang@loongson.cn>
 <CAAhV-H5BKzrKFrN6JzdDXPsqXA21P3RWE-SOp2oVdPuN4kjoGA@mail.gmail.com>
 <f9d2f0cf-3b99-35d5-508a-0b134357283c@loongson.cn>
 <CAAhV-H5Eej7caidqPJUwY4hMpDA6TXH0nY1ppfvL8piAvEF2rg@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <3bc6411c-a635-2462-1c7d-d9669abd5f31@loongson.cn>
Date: Thu, 18 Jul 2024 16:37:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5Eej7caidqPJUwY4hMpDA6TXH0nY1ppfvL8piAvEF2rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8BxVcVf1Jhm45RNAA--.32192S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoWDGrWrWw4UCFyrAFWfuw1kXrc_yoWrXw43Xo
	W5ZF1fAr1xGr15XryDJ34qqryjyw1UCrWUA347uwsxCr1Ut3Wjkr4UGw1UKFW3Ga95GF47
	Ja4UGrn5ZFW2qrn5l-sFpf9Il3svdjkaLaAFLSUrUUUU5b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUOn7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8XTm3
	UUUUU==

Hi, Huacai

在 2024/7/18 下午12:37, Huacai Chen 写道:
> On Thu, Jul 18, 2024 at 11:12 AM Tianyang Zhang
> <zhangtianyang@loongson.cn> wrote:
>> Hi , Huacai
>>
>> 在 2024/7/16 下午5:24, Huacai Chen 写道:
>>> Hi, Tianyang,
>>>
>>> I'm fixing potential bugs, except NR_IRQS I found some other issues
>>> which need your double check. Please see below carefully.
>>>
>>> On Mon, Jul 15, 2024 at 11:34 AM Tianyang Zhang
>>> <zhangtianyang@loongson.cn> wrote:
>>>> Introduce the advanced extended interrupt controllers. This feature will
>>>> allow each core to have 256 independent interrupt vectors and MSI
>>>> interrupts can be independently routed to any vector on any CPU.
>>>>
>>>> Co-developed-by: Jianmin Lv <lvjianmin@loongson.cn>
>>>> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>>>> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
>>>> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
>>>> Co-developed-by: Thomas Gleixner <tglx@linutronix.de>
>>>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>>>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>>>> ---
>>>>    .../arch/loongarch/irq-chip-model.rst         |  33 ++
>>>>    .../zh_CN/arch/loongarch/irq-chip-model.rst   |  37 +-
>>>>    arch/loongarch/Kconfig                        |   1 +
>>>>    arch/loongarch/include/asm/cpu-features.h     |   1 +
>>>>    arch/loongarch/include/asm/cpu.h              |   2 +
>>>>    arch/loongarch/include/asm/hardirq.h          |   3 +-
>>>>    arch/loongarch/include/asm/irq.h              |  23 +-
>>>>    arch/loongarch/include/asm/loongarch.h        |  18 +-
>>>>    arch/loongarch/include/asm/smp.h              |   2 +
>>>>    arch/loongarch/kernel/cpu-probe.c             |   3 +-
>>>>    arch/loongarch/kernel/paravirt.c              |   5 +
>>>>    arch/loongarch/kernel/smp.c                   |   5 +
>>>>    drivers/irqchip/Makefile                      |   2 +-
>>>>    drivers/irqchip/irq-loongarch-avec.c          | 433 ++++++++++++++++++
>>>>    drivers/irqchip/irq-loongarch-cpu.c           |   4 +-
>>>>    drivers/irqchip/irq-loongson-eiointc.c        |   3 +
>>>>    drivers/irqchip/irq-loongson-pch-msi.c        |  42 +-
>>>>    17 files changed, 603 insertions(+), 14 deletions(-)
>>>>    create mode 100644 drivers/irqchip/irq-loongarch-avec.c
>>>>
>>>> Changes log:
>>>>    V0->V1:
>>>>            1.Modified some formats and declarations
>>>>            2.Removed kmalloc/kfree when adding affinity related data to pending_list,
>>>>              and used moving tag to replace the original behavior
>>>>            3.Adjusted the process that enables AVEC interrupts, now it is at the end of all processes
>>>>            4.Removed CPUHP related callbacks, now irq_matrix_online/irq_matrix_offline is completed in start_secondary/loongson_cpu_disable
>>>>            5.Adjusted compatibility issues for CONFIG_ACPI
>>>>            6.About question:
>>>>            > irr = csr_read64(LOONGARCH_CSR_IRR0 + vector / 64);
>>>>            > should be good enough, no?
>>>>            csr_read64 was built-in as __csrrd_d, it doesn't seem to support variables as parameters
>>>>            >>>>
>>>>            drivers/irqchip/irq-loongarch-avec.c: In function ‘complete_irq_moving’:
>>>>            ./arch/loongarch/include/asm/loongarch.h:164:25: error: invalid argument to built-in function
>>>>              164 | #define csr_read64(reg) __csrrd_d(reg)
>>>>                  |                         ^~~~~~~~~
>>>>            drivers/irqchip/irq-loongarch-avec.c:170:23: note: in expansion of macro ‘csr_read64’
>>>>              170 |                 irr = csr_read64(LOONGARCH_CSR_IRR_BASE + vector / VECTORS_PER_REG);
>>>>                  |                       ^~~~~~~~~~
>>>>            >>>>
>>>>            So we have temporarily retained the previous implementation.
>>>>
>>>>    V1->V2:
>>>>            Fixed up coding style. Made on/offline functions void
>>>>            Added compatibility when CONFIG_SMP is turned off
>>>>
>>>>    V2->V3:
>>>>           Squash two patches into one
>>>>
>>>>    V3->V4:
>>>>           Update NR_IRQS
>>>>           Update Register's name
>>>>           Fixed up coding style
>>>>    V4->V5:
>>>>           Retain feature CPUCFG1_MSGINT
>>>>           Fixed up coding style
>>>>           Delete the test code introduced by V4, and now msi msg address still uses the 32-bit address
>>>>
>>>> diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
>>>> index 7988f4192363..a90c78c8e5bb 100644
>>>> --- a/Documentation/arch/loongarch/irq-chip-model.rst
>>>> +++ b/Documentation/arch/loongarch/irq-chip-model.rst
>>>> @@ -85,6 +85,39 @@ to CPUINTC directly::
>>>>        | Devices |
>>>>        +---------+
>>>>
>>>> +Advanced Extended IRQ model
>>>> +===========================
>>>> +
>>>> +In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
>>>> +to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, PCH-MSI interrupts go to AVEC,
>>>> +and then go to CPUINTC, Other devices interrupts go to PCH-PIC/PCH-LPC and gathered
>>>> +by EIOINTC, and then go to CPUINTC directly::
>>>> +
>>>> + +-----+     +--------------------------+     +-------+
>>>> + | IPI | --> |           CPUINTC        | <-- | Timer |
>>>> + +-----+     +--------------------------+     +-------+
>>>> +              ^        ^             ^
>>>> +              |        |             |
>>>> +      +--------+  +---------+ +---------+     +-------+
>>>> +      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
>>>> +      +--------+  +---------+ +---------+     +-------+
>>>> +           ^            ^
>>>> +           |            |
>>>> +         +---------+  +---------+
>>>> +         | PCH-MSI |  | PCH-PIC |
>>>> +         +---------+  +---------+
>>>> +            ^          ^       ^
>>>> +            |          |       |
>>>> +    +---------+ +---------+ +---------+
>>>> +    | Devices | | PCH-LPC | | Devices |
>>>> +    +---------+ +---------+ +---------+
>>>> +                     ^
>>>> +                     |
>>>> +                +---------+
>>>> +                | Devices |
>>>> +                +---------+
>>>> +
>>>> +
>>>>    ACPI-related definitions
>>>>    ========================
>>>>
>>>> diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
>>>> index f1e9ab18206c..b54567380c90 100644
>>>> --- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
>>>> +++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
>>>> @@ -9,9 +9,8 @@
>>>>    LoongArch的IRQ芯片模型（层级关系）
>>>>    ==================================
>>>>
>>>> -目前，基于LoongArch的处理器（如龙芯3A5000）只能与LS7A芯片组配合工作。LoongArch计算机
>>>> -中的中断控制器（即IRQ芯片）包括CPUINTC（CPU Core Interrupt Controller）、LIOINTC（
>>>> -Legacy I/O Interrupt Controller）、EIOINTC（Extended I/O Interrupt Controller）、
>>>> +LoongArch计算机中的中断控制器（即IRQ芯片）包括CPUINTC（CPU Core Interrupt Controller）、
>>>> +LIOINTC（Legacy I/O Interrupt Controller）、EIOINTC（Extended I/O Interrupt Controller）、
>>>>    HTVECINTC（Hyper-Transport Vector Interrupt Controller）、PCH-PIC（LS7A芯片组的主中
>>>>    断控制器）、PCH-LPC（LS7A芯片组的LPC中断控制器）和PCH-MSI（MSI中断控制器）。
>>>>
>>>> @@ -87,6 +86,38 @@ PCH-LPC/PCH-MSI，然后被EIOINTC统一收集，再直接到达CPUINTC::
>>>>        | Devices |
>>>>        +---------+
>>>>
>>>> +高级扩展IRQ模型
>>>> +=======================
>>>> +
>>>> +在这种模型里面，IPI（Inter-Processor Interrupt）和CPU本地时钟中断直接发送到CPUINTC，
>>>> +CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断发送到AVEC，而后通过AVEC送达CPUINTC，而
>>>> +其他所有设备的中断则分别发送到所连接的PCH-PIC/PCH-LPC，然后由EIOINTC统一收集，再直
>>>> +接到达CPUINTC::
>>>> +
>>>> + +-----+     +--------------------------+     +-------+
>>>> + | IPI | --> |           CPUINTC        | <-- | Timer |
>>>> + +-----+     +--------------------------+     +-------+
>>>> +              ^        ^             ^
>>>> +              |        |             |
>>>> +      +--------+  +---------+ +---------+     +-------+
>>>> +      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
>>>> +      +--------+  +---------+ +---------+     +-------+
>>>> +              ^        ^
>>>> +              |        |
>>>> +      +---------+  +-------------+
>>>> +      | PCH-MSI |  |   PCH-PIC   |
>>>> +      +---------+  +-------------+
>>>> +            ^          ^       ^
>>>> +            |          |       |
>>>> +    +---------+ +---------+ +---------+
>>>> +    | Devices | | PCH-LPC | | Devices |
>>>> +    +---------+ +---------+ +---------+
>>>> +                     ^
>>>> +                     |
>>>> +                +---------+
>>>> +                | Devices |
>>>> +                +---------+
>>>> +
>>>>    ACPI相关的定义
>>>>    ==============
>>>>
>>>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>>>> index e38139c576ee..a66e49b5a68c 100644
>>>> --- a/arch/loongarch/Kconfig
>>>> +++ b/arch/loongarch/Kconfig
>>>> @@ -83,6 +83,7 @@ config LOONGARCH
>>>>           select GENERIC_ENTRY
>>>>           select GENERIC_GETTIMEOFDAY
>>>>           select GENERIC_IOREMAP if !ARCH_IOREMAP
>>>> +       select GENERIC_IRQ_MATRIX_ALLOCATOR
>>>>           select GENERIC_IRQ_MULTI_HANDLER
>>>>           select GENERIC_IRQ_PROBE
>>>>           select GENERIC_IRQ_SHOW
>>>> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
>>>> index 2eafe6a6aca8..16a716f88a5c 100644
>>>> --- a/arch/loongarch/include/asm/cpu-features.h
>>>> +++ b/arch/loongarch/include/asm/cpu-features.h
>>>> @@ -65,5 +65,6 @@
>>>>    #define cpu_has_guestid                cpu_opt(LOONGARCH_CPU_GUESTID)
>>>>    #define cpu_has_hypervisor     cpu_opt(LOONGARCH_CPU_HYPERVISOR)
>>>>    #define cpu_has_ptw            cpu_opt(LOONGARCH_CPU_PTW)
>>>> +#define cpu_has_avecint                cpu_opt(LOONGARCH_CPU_AVECINT)
>>>>
>>>>    #endif /* __ASM_CPU_FEATURES_H */
>>>> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
>>>> index 48b9f7168bcc..843f9c4ec980 100644
>>>> --- a/arch/loongarch/include/asm/cpu.h
>>>> +++ b/arch/loongarch/include/asm/cpu.h
>>>> @@ -99,6 +99,7 @@ enum cpu_type_enum {
>>>>    #define CPU_FEATURE_GUESTID            24      /* CPU has GuestID feature */
>>>>    #define CPU_FEATURE_HYPERVISOR         25      /* CPU has hypervisor (running in VM) */
>>>>    #define CPU_FEATURE_PTW                        26      /* CPU has hardware page table walker */
>>>> +#define CPU_FEATURE_AVECINT            27      /* CPU has avec interrupt */
>>>>
>>>>    #define LOONGARCH_CPU_CPUCFG           BIT_ULL(CPU_FEATURE_CPUCFG)
>>>>    #define LOONGARCH_CPU_LAM              BIT_ULL(CPU_FEATURE_LAM)
>>>> @@ -127,5 +128,6 @@ enum cpu_type_enum {
>>>>    #define LOONGARCH_CPU_GUESTID          BIT_ULL(CPU_FEATURE_GUESTID)
>>>>    #define LOONGARCH_CPU_HYPERVISOR       BIT_ULL(CPU_FEATURE_HYPERVISOR)
>>>>    #define LOONGARCH_CPU_PTW              BIT_ULL(CPU_FEATURE_PTW)
>>>> +#define LOONGARCH_CPU_AVECINT          BIT_ULL(CPU_FEATURE_AVECINT)
>>>>
>>>>    #endif /* _ASM_CPU_H */
>>>> diff --git a/arch/loongarch/include/asm/hardirq.h b/arch/loongarch/include/asm/hardirq.h
>>>> index d41138abcf26..b09891e4a4b2 100644
>>>> --- a/arch/loongarch/include/asm/hardirq.h
>>>> +++ b/arch/loongarch/include/asm/hardirq.h
>>>> @@ -12,11 +12,12 @@
>>>>    extern void ack_bad_irq(unsigned int irq);
>>>>    #define ack_bad_irq ack_bad_irq
>>>>
>>>> -#define NR_IPI 2
>>>> +#define NR_IPI 3
>>>>
>>>>    enum ipi_msg_type {
>>>>           IPI_RESCHEDULE,
>>>>           IPI_CALL_FUNCTION,
>>>> +       IPI_CLEAR_VECT,
>>>>    };
>>>>
>>>>    typedef struct {
>>>> diff --git a/arch/loongarch/include/asm/irq.h b/arch/loongarch/include/asm/irq.h
>>>> index 480418bc5071..899e6f9a9eaa 100644
>>>> --- a/arch/loongarch/include/asm/irq.h
>>>> +++ b/arch/loongarch/include/asm/irq.h
>>>> @@ -39,11 +39,22 @@ void spurious_interrupt(void);
>>>>
>>>>    #define NR_IRQS_LEGACY 16
>>>>
>>>> +/*
>>>> + * 256 vectors Map:
>>>> + *
>>>> + * 0 - 15: mapping legacy IPs, e.g. IP0-12.
>>>> + * 16 - 255: mapping a vector for external IRQ.
>>>> + *
>>>> + */
>>>> +#define NR_VECTORS             256
>>>> +#define IRQ_MATRIX_BITS                NR_VECTORS
>>>> +#define NR_LEGACY_VECTORS      16
>>>> +
>>>>    #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
>>>>    void arch_trigger_cpumask_backtrace(const struct cpumask *mask, int exclude_cpu);
>>>>
>>>>    #define MAX_IO_PICS 2
>>>> -#define NR_IRQS        (64 + (256 * MAX_IO_PICS))
>>>> +#define NR_IRQS        ((64 + (64 * MAX_IO_PICS)) + NR_VECTORS * NR_CPUS)
>>>>
>>>>    struct acpi_vector_group {
>>>>           int node;
>>>> @@ -65,7 +76,7 @@ extern struct acpi_vector_group msi_group[MAX_IO_PICS];
>>>>    #define LOONGSON_LPC_LAST_IRQ          (LOONGSON_LPC_IRQ_BASE + 15)
>>>>
>>>>    #define LOONGSON_CPU_IRQ_BASE          16
>>>> -#define LOONGSON_CPU_LAST_IRQ          (LOONGSON_CPU_IRQ_BASE + 14)
>>>> +#define LOONGSON_CPU_LAST_IRQ          (LOONGSON_CPU_IRQ_BASE + 15)
>>>>
>>>>    #define LOONGSON_PCH_IRQ_BASE          64
>>>>    #define LOONGSON_PCH_ACPI_IRQ          (LOONGSON_PCH_IRQ_BASE + 47)
>>>> @@ -101,6 +112,14 @@ int pch_msi_acpi_init(struct irq_domain *parent,
>>>>                                           struct acpi_madt_msi_pic *acpi_pchmsi);
>>>>    int pch_pic_acpi_init(struct irq_domain *parent,
>>>>                                           struct acpi_madt_bio_pic *acpi_pchpic);
>>>> +
>>>> +int __init pch_msi_acpi_init_v2(struct irq_domain *parent,
>>>> +               struct acpi_madt_msi_pic *pch_msi_entry);
>>>> +int __init loongarch_avec_acpi_init(struct irq_domain *parent);
>>>> +void complete_irq_moving(void);
>>>> +void loongarch_avec_offline_cpu(unsigned int cpu);
>>>> +void loongarch_avec_online_cpu(unsigned int cpu);
>>> Maybe it is better to use cpuhotplug callbacks, which is similar to
>>> this method in irq-loongson-eiointc.c
>>>
>>> cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_EIOINTC_STARTING,
>>>                                             "irqchip/loongarch/eiointc:starting",
>>>                                             eiointc_router_init, NULL);
>>>
>> Okay, I will adapt to this in the next version
> Unnecessary, I have completed here and you can test with it.
> https://github.com/chenhuacai/linux/commits/loongarch-next
>
> If no problems, please submit the last patch as V6, otherwise please
> feedback to me.
>
> Huacai
I have received your modifications and will test them as soon as 
possible and submit V6 patch based on other feedback

Thank you again


Tianyang

>
>>>> +
>>>>    int find_pch_pic(u32 gsi);
>>>>    struct fwnode_handle *get_pch_msi_handle(int pci_segment);
>>>>
>>>> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
>>>> index eb09adda54b7..c21dc52338e3 100644
>>>> --- a/arch/loongarch/include/asm/loongarch.h
>>>> +++ b/arch/loongarch/include/asm/loongarch.h
>>>> @@ -252,8 +252,8 @@
>>>>    #define  CSR_ESTAT_EXC_WIDTH           6
>>>>    #define  CSR_ESTAT_EXC                 (_ULCAST_(0x3f) << CSR_ESTAT_EXC_SHIFT)
>>>>    #define  CSR_ESTAT_IS_SHIFT            0
>>>> -#define  CSR_ESTAT_IS_WIDTH            14
>>>> -#define  CSR_ESTAT_IS                  (_ULCAST_(0x3fff) << CSR_ESTAT_IS_SHIFT)
>>>> +#define  CSR_ESTAT_IS_WIDTH            15
>>>> +#define  CSR_ESTAT_IS                  (_ULCAST_(0x7fff) << CSR_ESTAT_IS_SHIFT)
>>>>
>>>>    #define LOONGARCH_CSR_ERA              0x6     /* ERA */
>>>>
>>>> @@ -999,10 +999,17 @@
>>>>    #define CSR_FWPC_SKIP_SHIFT            16
>>>>    #define CSR_FWPC_SKIP                  (_ULCAST_(1) << CSR_FWPC_SKIP_SHIFT)
>>>>
>>>> +#define LOONGARCH_CSR_ISR0             0xa0
>>>> +#define LOONGARCH_CSR_ISR1             0xa1
>>>> +#define LOONGARCH_CSR_ISR2             0xa2
>>>> +#define LOONGARCH_CSR_ISR3             0xa3
>>>> +
>>>> +#define        LOONGARCH_CSR_IRR               0xa4
>>>> +
>>>>    /*
>>>>     * CSR_ECFG IM
>>>>     */
>>>> -#define ECFG0_IM               0x00001fff
>>>> +#define ECFG0_IM               0x00005fff
>>>>    #define ECFGB_SIP0             0
>>>>    #define ECFGF_SIP0             (_ULCAST_(1) << ECFGB_SIP0)
>>>>    #define ECFGB_SIP1             1
>>>> @@ -1045,6 +1052,7 @@
>>>>    #define  IOCSRF_EIODECODE              BIT_ULL(9)
>>>>    #define  IOCSRF_FLATMODE               BIT_ULL(10)
>>>>    #define  IOCSRF_VM                     BIT_ULL(11)
>>>> +#define  IOCSRF_AVEC                   BIT_ULL(15)
>>>>
>>>>    #define LOONGARCH_IOCSR_VENDOR         0x10
>>>>
>>>> @@ -1055,6 +1063,7 @@
>>>>    #define LOONGARCH_IOCSR_MISC_FUNC      0x420
>>>>    #define  IOCSR_MISC_FUNC_TIMER_RESET   BIT_ULL(21)
>>>>    #define  IOCSR_MISC_FUNC_EXT_IOI_EN    BIT_ULL(48)
>>>> +#define  IOCSR_MISC_FUNC_AVEC_EN       BIT_ULL(51)
>>>>
>>>>    #define LOONGARCH_IOCSR_CPUTEMP                0x428
>>>>
>>>> @@ -1375,9 +1384,10 @@ __BUILD_CSR_OP(tlbidx)
>>>>    #define INT_TI         11      /* Timer */
>>>>    #define INT_IPI                12
>>>>    #define INT_NMI                13
>>>> +#define INT_AVEC       14
>>>>
>>>>    /* ExcCodes corresponding to interrupts */
>>>> -#define EXCCODE_INT_NUM                (INT_NMI + 1)
>>>> +#define EXCCODE_INT_NUM                (INT_AVEC + 1)
>>>>    #define EXCCODE_INT_START      64
>>>>    #define EXCCODE_INT_END                (EXCCODE_INT_START + EXCCODE_INT_NUM - 1)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
>>>> index 278700cfee88..2399004596a3 100644
>>>> --- a/arch/loongarch/include/asm/smp.h
>>>> +++ b/arch/loongarch/include/asm/smp.h
>>>> @@ -69,9 +69,11 @@ extern int __cpu_logical_map[NR_CPUS];
>>>>    #define ACTION_BOOT_CPU        0
>>>>    #define ACTION_RESCHEDULE      1
>>>>    #define ACTION_CALL_FUNCTION   2
>>>> +#define ACTION_CLEAR_VECT      3
>>>>    #define SMP_BOOT_CPU           BIT(ACTION_BOOT_CPU)
>>>>    #define SMP_RESCHEDULE         BIT(ACTION_RESCHEDULE)
>>>>    #define SMP_CALL_FUNCTION      BIT(ACTION_CALL_FUNCTION)
>>>> +#define SMP_CLEAR_VECT         BIT(ACTION_CLEAR_VECT)
>>>>
>>>>    struct secondary_data {
>>>>           unsigned long stack;
>>>> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
>>>> index 55320813ee08..3b2e72e8f9bd 100644
>>>> --- a/arch/loongarch/kernel/cpu-probe.c
>>>> +++ b/arch/loongarch/kernel/cpu-probe.c
>>>> @@ -106,7 +106,6 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
>>>>                   elf_hwcap |= HWCAP_LOONGARCH_CRC32;
>>>>           }
>>>>
>>>> -
>>>>           config = read_cpucfg(LOONGARCH_CPUCFG2);
>>>>           if (config & CPUCFG2_LAM) {
>>>>                   c->options |= LOONGARCH_CPU_LAM;
>>>> @@ -176,6 +175,8 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
>>>>                   c->options |= LOONGARCH_CPU_EIODECODE;
>>>>           if (config & IOCSRF_VM)
>>>>                   c->options |= LOONGARCH_CPU_HYPERVISOR;
>>>> +       if (config & IOCSRF_AVEC)
>>>> +               c->options |= LOONGARCH_CPU_AVECINT;
>>>>
>>>>           config = csr_read32(LOONGARCH_CSR_ASID);
>>>>           config = (config & CSR_ASID_BIT) >> CSR_ASID_BIT_SHIFT;
>>>> diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
>>>> index 1633ed4f692f..834c99cb4df4 100644
>>>> --- a/arch/loongarch/kernel/paravirt.c
>>>> +++ b/arch/loongarch/kernel/paravirt.c
>>>> @@ -97,6 +97,11 @@ static irqreturn_t pv_ipi_interrupt(int irq, void *dev)
>>>>                   info->ipi_irqs[IPI_CALL_FUNCTION]++;
>>>>           }
>>>>
>>>> +       if (action & SMP_CLEAR_VECT) {
>>>> +               complete_irq_moving();
>>>> +               info->ipi_irqs[IPI_CLEAR_VECT]++;
>>>> +       }
>>>> +
>>>>           return IRQ_HANDLED;
>>>>    }
>>>>
>>>> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
>>>> index 0dfe2388ef41..6dfedef306f3 100644
>>>> --- a/arch/loongarch/kernel/smp.c
>>>> +++ b/arch/loongarch/kernel/smp.c
>>>> @@ -234,6 +234,9 @@ static irqreturn_t loongson_ipi_interrupt(int irq, void *dev)
>>>>                   per_cpu(irq_stat, cpu).ipi_irqs[IPI_CALL_FUNCTION]++;
>>>>           }
>>>>
>>>> +       if (action & SMP_CLEAR_VECT)
>>>> +               complete_irq_moving();
>>>> +
>>>>           return IRQ_HANDLED;
>>>>    }
>>>>
>>>> @@ -388,6 +391,7 @@ int loongson_cpu_disable(void)
>>>>           irq_migrate_all_off_this_cpu();
>>>>           clear_csr_ecfg(ECFG0_IM);
>>>>           local_irq_restore(flags);
>>>> +       loongarch_avec_offline_cpu(cpu);
>>>>           local_flush_tlb_all();
>>>>
>>>>           return 0;
>>>> @@ -566,6 +570,7 @@ asmlinkage void start_secondary(void)
>>>>            * early is dangerous.
>>>>            */
>>>>           WARN_ON_ONCE(!irqs_disabled());
>>>> +       loongarch_avec_online_cpu(cpu);
>>>>           loongson_smp_finish();
>>>>
>>>>           cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
>>>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>>>> index 9f6f88274bec..1062e713cea4 100644
>>>> --- a/drivers/irqchip/Makefile
>>>> +++ b/drivers/irqchip/Makefile
>>>> @@ -109,7 +109,7 @@ obj-$(CONFIG_LS1X_IRQ)                      += irq-ls1x.o
>>>>    obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)      += irq-ti-sci-intr.o
>>>>    obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)      += irq-ti-sci-inta.o
>>>>    obj-$(CONFIG_TI_PRUSS_INTC)            += irq-pruss-intc.o
>>>> -obj-$(CONFIG_IRQ_LOONGARCH_CPU)                += irq-loongarch-cpu.o
>>>> +obj-$(CONFIG_IRQ_LOONGARCH_CPU)                += irq-loongarch-cpu.o irq-loongarch-avec.o
>>>>    obj-$(CONFIG_LOONGSON_LIOINTC)         += irq-loongson-liointc.o
>>>>    obj-$(CONFIG_LOONGSON_EIOINTC)         += irq-loongson-eiointc.o
>>>>    obj-$(CONFIG_LOONGSON_HTPIC)           += irq-loongson-htpic.o
>>>> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
>>>> new file mode 100644
>>>> index 000000000000..744f46638def
>>>> --- /dev/null
>>>> +++ b/drivers/irqchip/irq-loongarch-avec.c
>>>> @@ -0,0 +1,433 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (C) 2020-2024 Loongson Technologies, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/cpuhotplug.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/irq.h>
>>>> +#include <linux/irqchip.h>
>>>> +#include <linux/irqchip/chained_irq.h>
>>>> +#include <linux/irqdomain.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/msi.h>
>>>> +#include <linux/radix-tree.h>
>>>> +#include <linux/spinlock.h>
>>>> +
>>>> +#include <asm/loongarch.h>
>>>> +#include <asm/setup.h>
>>>> +
>>>> +#define VECTORS_PER_REG                64
>>>> +#define IRR_INVALID_MASK       0x80000000UL
>>>> +#define IRR_VECTOR_MASK                0xffUL
>>>> +#define AVEC_MSG_OFFSET                0x100000
>>>> +
>>>> +static phys_addr_t msi_base_v2;
>>>> +static DEFINE_PER_CPU(struct irq_desc * [NR_VECTORS], irq_map);
>>>> +
>>>> +#ifdef CONFIG_SMP
>>>> +struct pending_list {
>>>> +       struct list_head        head;
>>>> +};
>>>> +
>>>> +static DEFINE_PER_CPU(struct pending_list, pending_list);
>>>> +static struct cpumask intersect_mask;
>>>> +#endif
>>>> +
>>>> +struct loongarch_avec_chip {
>>>> +       struct fwnode_handle    *fwnode;
>>>> +       struct irq_domain       *domain;
>>>> +       struct irq_matrix       *vector_matrix;
>>>> +       raw_spinlock_t          lock;
>>>> +};
>>>> +
>>>> +static struct loongarch_avec_chip loongarch_avec;
>>>> +
>>>> +struct loongarch_avec_data {
>>>> +       struct list_head        entry;
>>>> +       unsigned int            cpu;
>>>> +       unsigned int            vec;
>>>> +       unsigned int            prev_cpu;
>>>> +       unsigned int            prev_vec;
>>>> +       unsigned int            moving          : 1,
>>>> +                               managed         : 1;
>>>> +};
>>>> +
>>>> +static inline void loongarch_avec_ack_irq(struct irq_data *d)
>>>> +{
>>>> +}
>>>> +
>>>> +static inline void loongarch_avec_unmask_irq(struct irq_data *d)
>>>> +{
>>>> +}
>>>> +
>>>> +static inline void loongarch_avec_mask_irq(struct irq_data *d)
>>>> +{
>>>> +}
>>>> +
>>>> +#ifdef CONFIG_SMP
>>>> +static inline void pending_list_init(int cpu)
>>>> +{
>>>> +       struct pending_list *plist = per_cpu_ptr(&pending_list, cpu);
>>>> +
>>>> +       INIT_LIST_HEAD(&plist->head);
>>>> +}
>>>> +
>>>> +static void loongarch_avec_sync(struct loongarch_avec_data *adata)
>>>> +{
>>>> +       struct pending_list *plist;
>>>> +
>>>> +       if (cpu_online(adata->prev_cpu)) {
>>>> +               plist = per_cpu_ptr(&pending_list, adata->prev_cpu);
>>>> +               list_add_tail(&adata->entry, &plist->head);
>>>> +               adata->moving = true;
>>>> +               mp_ops.send_ipi_single(adata->prev_cpu, ACTION_CLEAR_VECT);
>>>> +       }
>>>> +}
>>>> +
>>>> +static int loongarch_avec_set_affinity(struct irq_data *data, const struct cpumask *dest,
>>>> +                                      bool force)
>>>> +{
>>>> +       struct loongarch_avec_data *adata;
>>>> +       unsigned int cpu, vector;
>>>> +       unsigned long flags;
>>>> +       int ret;
>>>> +
>>>> +       raw_spin_lock_irqsave(&loongarch_avec.lock, flags);
>>>> +       adata = irq_data_get_irq_chip_data(data);
>>>> +
>>>> +       if (adata->vec && cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest)) {
>>>> +               raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +               return 0;
>>>> +       }
>>>> +       if (adata->moving)
>>>> +               return -EBUSY;
>>>> +
>>>> +       cpumask_and(&intersect_mask, dest, cpu_online_mask);
>>>> +
>>>> +       ret = irq_matrix_alloc(loongarch_avec.vector_matrix, &intersect_mask, false, &cpu);
>>>> +       if (ret < 0) {
>>>> +               raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +               return ret;
>>>> +       }
>>>> +       vector = ret;
>>>> +       adata->cpu = cpu;
>>>> +       adata->vec = vector;
>>>> +       per_cpu_ptr(irq_map, adata->cpu)[adata->vec] = irq_data_to_desc(data);
>>>> +       loongarch_avec_sync(adata);
>>>> +
>>>> +       raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +       irq_data_update_effective_affinity(data, cpumask_of(cpu));
>>>> +
>>>> +       return IRQ_SET_MASK_OK;
>>>> +}
>>>> +
>>>> +void complete_irq_moving(void)
>>>> +{
>>>> +       struct pending_list *plist = this_cpu_ptr(&pending_list);
>>>> +       struct loongarch_avec_data *adata, *tmp;
>>>> +       int cpu, vector, bias;
>>>> +       u64 isr;
>>>> +
>>>> +       raw_spin_lock(&loongarch_avec.lock);
>>>> +
>>>> +       list_for_each_entry_safe(adata, tmp, &plist->head, entry) {
>>>> +               cpu = adata->prev_cpu;
>>>> +               vector = adata->prev_vec;
>>>> +               bias = vector / VECTORS_PER_REG;
>>>> +               switch (bias) {
>>>> +               case 0:
>>>> +                       isr = csr_read64(LOONGARCH_CSR_ISR0);
>>>> +               case 1:
>>>> +                       isr = csr_read64(LOONGARCH_CSR_ISR1);
>>>> +               case 2:
>>>> +                       isr = csr_read64(LOONGARCH_CSR_ISR2);
>>>> +               case 3:
>>>> +                       isr = csr_read64(LOONGARCH_CSR_ISR3);
>>>> +               }
>>>> +
>>>> +               if (isr & (1UL << (vector % VECTORS_PER_REG))) {
>>>> +                       mp_ops.send_ipi_single(cpu, ACTION_CLEAR_VECT);
>>>> +                       continue;
>>>> +               }
>>>> +               list_del(&adata->entry);
>>>> +               irq_matrix_free(loongarch_avec.vector_matrix, cpu, vector, adata->managed);
>>>> +               this_cpu_write(irq_map[vector], NULL);
>>>> +               adata->prev_cpu = adata->cpu;
>>>> +               adata->prev_vec = adata->vec;
>>>> +               adata->moving = 0;
>>>> +       }
>>>> +       raw_spin_unlock(&loongarch_avec.lock);
>>>> +}
>>>> +
>>>> +void loongarch_avec_offline_cpu(unsigned int cpu)
>>>> +{
>>>> +       struct pending_list *plist = per_cpu_ptr(&pending_list, cpu);
>>>> +       unsigned long flags;
>>>> +
>>>> +       if (!loongarch_avec.vector_matrix)
>>>> +               return;
>>>> +
>>>> +       raw_spin_lock_irqsave(&loongarch_avec.lock, flags);
>>>> +       if (list_empty(&plist->head))
>>>> +               irq_matrix_offline(loongarch_avec.vector_matrix);
>>>> +       else
>>>> +               pr_warn("cpu %d advanced extioi is busy\n", cpu);
>>>> +       raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +}
>>>> +
>>>> +void loongarch_avec_online_cpu(unsigned int cpu)
>>>> +{
>>>> +       unsigned long flags;
>>>> +
>>>> +       if (!loongarch_avec.vector_matrix)
>>>> +               return;
>>>> +
>>>> +       raw_spin_lock_irqsave(&loongarch_avec.lock, flags);
>>>> +
>>>> +       irq_matrix_online(loongarch_avec.vector_matrix);
>>>> +
>>>> +       pending_list_init(cpu);
>>>> +
>>>> +       raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +}
>>>> +
>>>> +#else
>>>> +#define loongarch_avec_set_affinity            NULL
>>>> +#endif
>>>> +
>>>> +static void loongarch_avec_compose_msg(struct irq_data *d,
>>>> +               struct msi_msg *msg)
>>>> +{
>>>> +       struct loongarch_avec_data *avec_data;
>>>> +
>>>> +       avec_data = irq_data_get_irq_chip_data(d);
>>>> +
>>>> +       msg->address_hi = 0x0;
>>>> +       msg->address_lo = (msi_base_v2 | (avec_data->vec & 0xff) << 4) |
>>>> +                         ((cpu_logical_map(avec_data->cpu & 0xffff)) << 12);
>>>> +       msg->data = 0x0;
>>>> +
>>>> +}
>>>> +
>>>> +static struct irq_chip loongarch_avec_controller = {
>>>> +       .name                   = "AVECINTC",
>>>> +       .irq_ack                = loongarch_avec_ack_irq,
>>>> +       .irq_mask               = loongarch_avec_mask_irq,
>>>> +       .irq_unmask             = loongarch_avec_unmask_irq,
>>>> +       .irq_set_affinity       = loongarch_avec_set_affinity,
>>>> +       .irq_compose_msi_msg    = loongarch_avec_compose_msg,
>>>> +};
>>>> +
>>>> +static void loongarch_avec_dispatch(struct irq_desc *desc)
>>>> +{
>>>> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>>>> +       unsigned long vector;
>>>> +       struct irq_desc *d;
>>>> +
>>>> +       chained_irq_enter(chip, desc);
>>>> +       vector = csr_read64(LOONGARCH_CSR_IRR);
>>>> +       if (vector & IRR_INVALID_MASK)
>>>> +               return;
>>> Here missing a  chained_irq_exit(chip, desc), right?
>>>
>>> Moreover, I think it is better to handle all avecintc interrupts in
>>> one dispatch, which means
>>>
>>>           chained_irq_enter(chip, desc);
>>>
>>>           while (true) {
>>>                   vector = csr_read64(LOONGARCH_CSR_IRR);
>>>                   if (vector & IRR_INVALID_MASK)
>>>                           goto out;
>>>
>>>                   vector &= IRR_VECTOR_MASK;
>>>
>>>                   d = this_cpu_read(irq_map[vector]);
>>>                   if (d)
>>>                           generic_handle_irq_desc(d);
>>>                   else {
>>>                           spurious_interrupt();
>>>                           pr_warn("Unexpected IRQ occurs on CPU#%d
>>> [vector %ld]\n", smp_processor_id(), vector);
>>>                   }
>>>           }
>>>
>>> out:
>>>           chained_irq_exit(chip, desc);
>>>
>>> Do you think so?
>> Miss  chained_irq_exit is realy a potential bugs, Thanks
>>
>> Regarding the second suggestion, the consideration at that time was to
>> minimize the
>>
>> granularity of avec interrupt execution as much as possible, so that
>> higher priority tasks could be executed.
>>
>> However, this has indeed caused some efficiency reduction. I am
>> consulting with hardware personnel,
>>
>> and if the value of the IRR register will not be infinitely refreshed
>> when the interrupt is turned off,
>>
>> then I think the above code is more appropriate
>>
>>
>>>> +
>>>> +       vector &= IRR_VECTOR_MASK;
>>>> +
>>>> +       d = this_cpu_read(irq_map[vector]);
>>>> +       if (d) {
>>>> +               generic_handle_irq_desc(d);
>>>> +       } else {
>>>> +               pr_warn("IRQ ERROR:Unexpected irq  occur on cpu %d[vector %ld]\n",
>>>> +                       smp_processor_id(), vector);
>>>> +       }
>>>> +
>>>> +       chained_irq_exit(chip, desc);
>>>> +}
>>>> +
>>>> +static int loongarch_avec_alloc(struct irq_domain *domain, unsigned int virq,
>>>> +                               unsigned int nr_irqs, void *arg)
>>>> +{
>>>> +       struct loongarch_avec_data *adata;
>>>> +       struct irq_data *irqd;
>>>> +       unsigned int cpu, vector, i, ret;
>>>> +       unsigned long flags;
>>>> +
>>>> +       raw_spin_lock_irqsave(&loongarch_avec.lock, flags);
>>>> +       for (i = 0; i < nr_irqs; i++) {
>>>> +               irqd = irq_domain_get_irq_data(domain, virq + i);
>>>> +               adata = kzalloc(sizeof(*adata), GFP_KERNEL);
>>>> +               if (!adata) {
>>>> +                       raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +                       return -ENOMEM;
>>>> +               }
>>>> +               ret = irq_matrix_alloc(loongarch_avec.vector_matrix, cpu_online_mask, false, &cpu);
>>>> +               if (ret < 0) {
>>>> +                       raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +                       return ret;
>>>> +               }
>>>> +               vector = ret;
>>>> +               adata->prev_cpu = adata->cpu = cpu;
>>>> +               adata->prev_vec = adata->vec = vector;
>>>> +               adata->managed = irqd_affinity_is_managed(irqd);
>>>> +               irq_domain_set_info(domain, virq + i, virq + i, &loongarch_avec_controller,
>>>> +                               adata, handle_edge_irq, NULL, NULL);
>>>> +               adata->moving = 0;
>>>> +               irqd_set_single_target(irqd);
>>>> +               irqd_set_affinity_on_activate(irqd);
>>>> +
>>>> +               per_cpu_ptr(irq_map, adata->cpu)[adata->vec] = irq_data_to_desc(irqd);
>>>> +       }
>>>> +       raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static void clear_free_vector(struct irq_data *irqd)
>>>> +{
>>>> +       struct loongarch_avec_data *adata = irq_data_get_irq_chip_data(irqd);
>>>> +       bool managed = irqd_affinity_is_managed(irqd);
>>>> +
>>>> +       per_cpu(irq_map, adata->cpu)[adata->vec] = NULL;
>>>> +       irq_matrix_free(loongarch_avec.vector_matrix, adata->cpu, adata->vec, managed);
>>>> +       adata->cpu = 0;
>>>> +       adata->vec = 0;
>>>> +#ifdef CONFIG_SMP
>>>> +       if (!adata->moving)
>>>> +               return;
>>>> +
>>>> +       per_cpu(irq_map, adata->prev_cpu)[adata->prev_vec] = 0;
>>>> +       irq_matrix_free(loongarch_avec.vector_matrix, adata->prev_cpu,
>>>> +                       adata->prev_vec, adata->managed);
>>>> +       adata->prev_vec = 0;
>>>> +       adata->prev_cpu = 0;
>>>> +       adata->moving = 0;
>>>> +       list_del_init(&adata->entry);
>>>> +#endif
>>>> +}
>>>> +
>>>> +static void loongarch_avec_free(struct irq_domain *domain, unsigned int virq,
>>>> +               unsigned int nr_irqs)
>>>> +{
>>>> +       struct irq_data *d;
>>>> +       unsigned long flags;
>>>> +       unsigned int i;
>>>> +
>>>> +       raw_spin_lock_irqsave(&loongarch_avec.lock, flags);
>>>> +       for (i = 0; i < nr_irqs; i++) {
>>>> +               d = irq_domain_get_irq_data(domain, virq + i);
>>>> +               if (d) {
>>>> +                       clear_free_vector(d);
>>>> +                       irq_domain_reset_irq_data(d);
>>>> +
>>>> +               }
>>>> +       }
>>>> +
>>>> +       raw_spin_unlock_irqrestore(&loongarch_avec.lock, flags);
>>>> +}
>>>> +
>>>> +static const struct irq_domain_ops loongarch_avec_domain_ops = {
>>>> +       .alloc          = loongarch_avec_alloc,
>>>> +       .free           = loongarch_avec_free,
>>>> +};
>>>> +
>>>> +static int __init irq_matrix_init(void)
>>>> +{
>>>> +       int i;
>>>> +
>>>> +       loongarch_avec.vector_matrix = irq_alloc_matrix(NR_VECTORS, 0, NR_VECTORS - 1);
>>>> +       if (!loongarch_avec.vector_matrix)
>>>> +               return -ENOMEM;
>>>> +       for (i = 0; i < NR_LEGACY_VECTORS; i++)
>>>> +               irq_matrix_assign_system(loongarch_avec.vector_matrix, i, false);
>>>> +
>>>> +       irq_matrix_online(loongarch_avec.vector_matrix);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int __init loongarch_avec_init(struct irq_domain *parent)
>>>> +{
>>>> +       int ret = 0, parent_irq;
>>>> +       unsigned long tmp;
>>>> +
>>>> +       raw_spin_lock_init(&loongarch_avec.lock);
>>>> +
>>>> +       loongarch_avec.fwnode = irq_domain_alloc_named_fwnode("CORE_AVEC");
>>>> +       if (!loongarch_avec.fwnode) {
>>>> +               pr_err("Unable to allocate domain handle\n");
>>>> +               ret = -ENOMEM;
>>>> +               goto out;
>>>> +       }
>>>> +
>>>> +       loongarch_avec.domain = irq_domain_create_tree(loongarch_avec.fwnode,
>>>> +                       &loongarch_avec_domain_ops, NULL);
>>>> +       if (!loongarch_avec.domain) {
>>>> +               pr_err("core-vec: cannot create IRQ domain\n");
>>>> +               ret = -ENOMEM;
>>>> +               goto out_free_handle;
>>>> +       }
>>>> +
>>>> +       parent_irq = irq_create_mapping(parent, INT_AVEC);
>>>> +       if (!parent_irq) {
>>>> +               pr_err("Failed to mapping hwirq\n");
>>>> +               ret = -EINVAL;
>>>> +               goto out_remove_domain;
>>>> +       }
>>>> +       irq_set_chained_handler_and_data(parent_irq, loongarch_avec_dispatch, NULL);
>>>> +
>>>> +       ret = irq_matrix_init();
>>>> +       if (ret) {
>>>> +               pr_err("Failed to init irq matrix\n");
>>>> +               goto out_free_matrix;
>>>> +       }
>>>> +#ifdef CONFIG_SMP
>>>> +       pending_list_init(0);
>>>> +#endif
>>>> +       tmp = iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
>>>> +       tmp |= IOCSR_MISC_FUNC_AVEC_EN;
>>>> +       iocsr_write64(tmp, LOONGARCH_IOCSR_MISC_FUNC);
>>>> +
>>>> +       return ret;
>>>> +
>>>> +out_free_matrix:
>>>> +       kfree(loongarch_avec.vector_matrix);
>>>> +out_remove_domain:
>>>> +       irq_domain_remove(loongarch_avec.domain);
>>>> +out_free_handle:
>>>> +       irq_domain_free_fwnode(loongarch_avec.fwnode);
>>>> +out:
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
>>>> +                                    const unsigned long end)
>>>> +{
>>>> +       struct acpi_madt_msi_pic *pchmsi_entry = (struct acpi_madt_msi_pic *)header;
>>>> +
>>>> +       msi_base_v2 = pchmsi_entry->msg_address - AVEC_MSG_OFFSET;
>>>> +       return pch_msi_acpi_init_v2(loongarch_avec.domain, pchmsi_entry);
>>>> +}
>>>> +
>>>> +static inline int __init acpi_cascade_irqdomain_init(void)
>>>> +{
>>>> +       return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
>>>> +}
>>>> +
>>>> +int __init loongarch_avec_acpi_init(struct irq_domain *parent)
>>>> +{
>>>> +       int ret = 0;
>>>> +
>>>> +       ret = loongarch_avec_init(parent);
>>>> +       if (ret) {
>>>> +               pr_err("Failed to init irq domain\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       ret = acpi_cascade_irqdomain_init();
>>>> +       if (ret) {
>>>> +               pr_err("Failed to cascade IRQ domain\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       return ret;
>>>> +}
>>>> diff --git a/drivers/irqchip/irq-loongarch-cpu.c b/drivers/irqchip/irq-loongarch-cpu.c
>>>> index 9d8f2c406043..1ecac59925c6 100644
>>>> --- a/drivers/irqchip/irq-loongarch-cpu.c
>>>> +++ b/drivers/irqchip/irq-loongarch-cpu.c
>>>> @@ -138,7 +138,9 @@ static int __init acpi_cascade_irqdomain_init(void)
>>>>           if (r < 0)
>>>>                   return r;
>>>>
>>>> -       return 0;
>>>> +       if (cpu_has_avecint)
>>>> +               r = loongarch_avec_acpi_init(irq_domain);
>>>> +       return r;
>>>>    }
>>>>
>>>>    static int __init cpuintc_acpi_init(union acpi_subtable_headers *header,
>>>> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
>>>> index c7ddebf312ad..1f9a30488137 100644
>>>> --- a/drivers/irqchip/irq-loongson-eiointc.c
>>>> +++ b/drivers/irqchip/irq-loongson-eiointc.c
>>>> @@ -359,6 +359,9 @@ static int __init acpi_cascade_irqdomain_init(void)
>>>>           if (r < 0)
>>>>                   return r;
>>>>
>>>> +       if (cpu_has_avecint)
>>>> +               return 0;
>>>> +
>>>>           r = acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
>>>>           if (r < 0)
>>>>                   return r;
>>>> diff --git a/drivers/irqchip/irq-loongson-pch-msi.c b/drivers/irqchip/irq-loongson-pch-msi.c
>>>> index dd4d699170f4..8b7aae22e782 100644
>>>> --- a/drivers/irqchip/irq-loongson-pch-msi.c
>>>> +++ b/drivers/irqchip/irq-loongson-pch-msi.c
>>>> @@ -16,7 +16,6 @@
>>>>    #include <linux/slab.h>
>>>>
>>>>    static int nr_pics;
>>>> -
>>>>    struct pch_msi_data {
>>>>           struct mutex    msi_map_lock;
>>>>           phys_addr_t     doorbell;
>>>> @@ -100,6 +99,17 @@ static struct irq_chip middle_irq_chip = {
>>>>           .irq_compose_msi_msg    = pch_msi_compose_msi_msg,
>>>>    };
>>>>
>>>> +static struct irq_chip pch_msi_irq_chip_v2 = {
>>>> +       .name                   = "MSI",
>>>> +       .irq_ack                = irq_chip_ack_parent,
>>> I think these lines are also needed, right?
>>>           .irq_mask               = irq_chip_mask_parent,
>>>           .irq_unmask             = irq_chip_unmask_parent,
>>>           .irq_set_affinity       = irq_chip_set_affinity_parent,
>>>
>>> Huacai
>> The original intention of this design was to use
>> MSI_FLAG_USE_DEF_CHIP_OPS, and
>>
>> then update it with the default value in pci_msi_domain_update_chip_ops
>> & msi_domain_update_chip_ops,
>>
>> so there is no explicit indication
>>
>>
>> Tianyang
>>
>>>> +};
>>>> +
>>>> +static struct msi_domain_info pch_msi_domain_info_v2 = {
>>>> +       .flags          = MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
>>>> +                       MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
>>>> +       .chip   = &pch_msi_irq_chip_v2,
>>>> +};
>>>> +
>>>>    static int pch_msi_parent_domain_alloc(struct irq_domain *domain,
>>>>                                           unsigned int virq, int hwirq)
>>>>    {
>>>> @@ -268,6 +278,9 @@ struct fwnode_handle *get_pch_msi_handle(int pci_segment)
>>>>    {
>>>>           int i;
>>>>
>>>> +       if (cpu_has_avecint)
>>>> +               return pch_msi_handle[0];
>>>> +
>>>>           for (i = 0; i < MAX_IO_PICS; i++) {
>>>>                   if (msi_group[i].pci_segment == pci_segment)
>>>>                           return pch_msi_handle[i];
>>>> @@ -289,4 +302,31 @@ int __init pch_msi_acpi_init(struct irq_domain *parent,
>>>>
>>>>           return ret;
>>>>    }
>>>> +
>>>> +int __init pch_msi_acpi_init_v2(struct irq_domain *parent, struct acpi_madt_msi_pic *msi_entry)
>>>> +{
>>>> +       struct irq_domain *msi_domain;
>>>> +
>>>> +       if (pch_msi_handle[0])
>>>> +               return 0;
>>>> +
>>>> +       pch_msi_handle[0] = irq_domain_alloc_named_fwnode("msipic-v2");
>>>> +       if (!pch_msi_handle[0]) {
>>>> +               pr_err("Unable to allocate domain handle\n");
>>>> +               kfree(pch_msi_handle[0]);
>>>> +               return -ENOMEM;
>>>> +       }
>>>> +
>>>> +       msi_domain = pci_msi_create_irq_domain(pch_msi_handle[0],
>>>> +                       &pch_msi_domain_info_v2,
>>>> +                       parent);
>>>> +       if (!msi_domain) {
>>>> +               pr_err("Failed to create PCI MSI domain\n");
>>>> +               kfree(pch_msi_handle[0]);
>>>> +               return -ENOMEM;
>>>> +       }
>>>> +
>>>> +       pr_info("IRQ domain MSIPIC-V2 init done.\n");
>>>> +       return 0;
>>>> +}
>>>>    #endif
>>>> --
>>>> 2.36.0
>>>>
>>>>


