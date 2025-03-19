Return-Path: <linux-doc+bounces-41270-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD1A684AE
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 06:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A99A53BF9C3
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 05:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31DC24E004;
	Wed, 19 Mar 2025 05:55:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E08374FF;
	Wed, 19 Mar 2025 05:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742363740; cv=none; b=Gi74Q53x22W6cNqbwFg8P7/CR8i7Z5mOlTlVrsbQeIeeXSR5t/x0lju59Mdy095hmbzcUGnrOeEkXZamgNDWhIkAneFDJQ4+mM42dsD4ep4ZsWtgUljC3CGpyMOPoIpej4Y19lIbFVK5DN2onP+QgeQY84qciSDb1CYqR/GC82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742363740; c=relaxed/simple;
	bh=TcVSGPU6InW4T+tkmg9CkqJSSLQcvTYM4QRGFPnmXEQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WJCiBiiPz0l/7v5suCobnXryivoVfW6Y0rudaePddFsK3pNaok4dV8JdbGFLD1s/SF7p02UPgb/b8fnpYKcGlPyCihA9ANCFNvzyLRiWXrJwSIl4pHooQN5/G6eI6+DcePTUfdVIpznYKKTBG4NV4KsJUXXGXU7vhMy2vPG6YBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxfWtWXNpnrLGcAA--.2822S3;
	Wed, 19 Mar 2025 13:55:34 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMDxu8RRXNpnFSJTAA--.41309S3;
	Wed, 19 Mar 2025 13:55:32 +0800 (CST)
Subject: Re: [PATCH 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
To: chenhuacai@kernel.org, kernel@xen0n.name, corbet@lwn.net,
 alexs@kernel.org, si.yanteng@linux.dev, tglx@linutronix.de,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250317082253.20520-1-zhangtianyang@loongson.cn>
 <20250317082253.20520-3-zhangtianyang@loongson.cn>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <59c6a714-e862-7d04-3843-7e2ad349764a@loongson.cn>
Date: Wed, 19 Mar 2025 13:55:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250317082253.20520-3-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMDxu8RRXNpnFSJTAA--.41309S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoWfXw4UWr4rGFWkGF1rWry5ZFc_yoW5Jr4kXo
	WfJFsak3yrWr18CFW5K3y2qFyav34rGr4kA39xZFZ5ZF12vrWYkrW7G3yYvFyIgF10qFnr
	AayIgan5JFWxtwn3l-sFpf9Il3svdjkaLaAFLSUrUUUUeb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUOj7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=

Hi, Everyone

We've got feedback on issues from this patch. Please disregard v1. I'll 
test and push v2 soon.

�� 2025/3/17 ����4:22, Tianyang Zhang д��:
> The main function of the Redirected interrupt controller is to manage the
> redirected-interrupt table, which consists of many redirected entries.
> When MSI interrupts are requested, the driver creates a corresponding
> redirected entry that describes the target CPU/vector number and the
> operating mode of the interrupt. The redirected interrupt module has an
> independent cache, and during the interrupt routing process, it will
> prioritize the redirected entries that hit the cache. The driver
> invalidates certain entry caches via a command queue.
>
> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>   arch/loongarch/include/asm/cpu-features.h |   1 +
>   arch/loongarch/include/asm/cpu.h          |   2 +
>   arch/loongarch/include/asm/loongarch.h    |   6 +
>   arch/loongarch/kernel/cpu-probe.c         |   3 +
>   drivers/irqchip/Makefile                  |   2 +-
>   drivers/irqchip/irq-loongarch-avec.c      |  21 +-
>   drivers/irqchip/irq-loongarch-ir.c        | 561 ++++++++++++++++++++++
>   drivers/irqchip/irq-loongson.h            |  12 +
>   include/linux/cpuhotplug.h                |   1 +
>   9 files changed, 595 insertions(+), 14 deletions(-)
>   create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>
> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
> index fc83bb32f9f0..03f7e93e81e0 100644
> --- a/arch/loongarch/include/asm/cpu-features.h
> +++ b/arch/loongarch/include/asm/cpu-features.h
> @@ -68,5 +68,6 @@
>   #define cpu_has_ptw		cpu_opt(LOONGARCH_CPU_PTW)
>   #define cpu_has_lspw		cpu_opt(LOONGARCH_CPU_LSPW)
>   #define cpu_has_avecint		cpu_opt(LOONGARCH_CPU_AVECINT)
> +#define cpu_has_redirectint	cpu_opt(LOONGARCH_CPU_REDIRECTINT)
>   
>   #endif /* __ASM_CPU_FEATURES_H */
> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/asm/cpu.h
> index 98cf4d7b4b0a..33cd96e569d8 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -102,6 +102,7 @@ enum cpu_type_enum {
>   #define CPU_FEATURE_PTW			27	/* CPU has hardware page table walker */
>   #define CPU_FEATURE_LSPW		28	/* CPU has LSPW (lddir/ldpte instructions) */
>   #define CPU_FEATURE_AVECINT		29	/* CPU has AVEC interrupt */
> +#define CPU_FEATURE_REDIRECTINT		30      /* CPU has interrupt remmap */
>   
>   #define LOONGARCH_CPU_CPUCFG		BIT_ULL(CPU_FEATURE_CPUCFG)
>   #define LOONGARCH_CPU_LAM		BIT_ULL(CPU_FEATURE_LAM)
> @@ -133,5 +134,6 @@ enum cpu_type_enum {
>   #define LOONGARCH_CPU_PTW		BIT_ULL(CPU_FEATURE_PTW)
>   #define LOONGARCH_CPU_LSPW		BIT_ULL(CPU_FEATURE_LSPW)
>   #define LOONGARCH_CPU_AVECINT		BIT_ULL(CPU_FEATURE_AVECINT)
> +#define LOONGARCH_CPU_REDIRECTINT	BIT_ULL(CPU_FEATURE_REDIRECTINT)
>   
>   #endif /* _ASM_CPU_H */
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
> index 52651aa0e583..95e06cb6831e 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -1130,6 +1130,7 @@
>   #define  IOCSRF_FLATMODE		BIT_ULL(10)
>   #define  IOCSRF_VM			BIT_ULL(11)
>   #define  IOCSRF_AVEC			BIT_ULL(15)
> +#define  IOCSRF_REDIRECTINT		BIT_ULL(16)
>   
>   #define LOONGARCH_IOCSR_VENDOR		0x10
>   
> @@ -1189,6 +1190,11 @@
>   
>   #define LOONGARCH_IOCSR_EXTIOI_NODEMAP_BASE	0x14a0
>   #define LOONGARCH_IOCSR_EXTIOI_IPMAP_BASE	0x14c0
> +#define LOONGARCH_IOCSR_REDIRECT_CFG		0x15e0
> +#define LOONGARCH_IOCSR_REDIRECT_TBR		0x15e8  /* IRT BASE REG*/
> +#define LOONGARCH_IOCSR_REDIRECT_CQB		0x15f0  /* IRT CACHE QUEUE BASE */
> +#define LOONGARCH_IOCSR_REDIRECT_CQH		0x15f8  /* IRT CACHE QUEUE HEAD, 32bit */
> +#define LOONGARCH_IOCSR_REDIRECT_CQT		0x15fc  /* IRT CACHE QUEUE TAIL, 32bit */
>   #define LOONGARCH_IOCSR_EXTIOI_EN_BASE		0x1600
>   #define LOONGARCH_IOCSR_EXTIOI_BOUNCE_BASE	0x1680
>   #define LOONGARCH_IOCSR_EXTIOI_ISR_BASE		0x1800
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
> index fedaa67cde41..89a41c9ba0c0 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -289,6 +289,9 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
>   		c->options |= LOONGARCH_CPU_EIODECODE;
>   	if (config & IOCSRF_AVEC)
>   		c->options |= LOONGARCH_CPU_AVECINT;
> +	if (config & IOCSRF_REDIRECTINT)
> +		c->options |= LOONGARCH_CPU_REDIRECTINT;
> +	c->options |= LOONGARCH_CPU_REDIRECTINT;
>   	if (config & IOCSRF_VM)
>   		c->options |= LOONGARCH_CPU_HYPERVISOR;
>   }
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 25e9ad29b8c4..5dd7d6b151d9 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -113,7 +113,7 @@ obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
>   obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
>   obj-$(CONFIG_TI_SCI_INTA_IRQCHIP)	+= irq-ti-sci-inta.o
>   obj-$(CONFIG_TI_PRUSS_INTC)		+= irq-pruss-intc.o
> -obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o
> +obj-$(CONFIG_IRQ_LOONGARCH_CPU)		+= irq-loongarch-cpu.o irq-loongarch-avec.o irq-loongarch-ir.o
>   obj-$(CONFIG_LOONGSON_LIOINTC)		+= irq-loongson-liointc.o
>   obj-$(CONFIG_LOONGSON_EIOINTC)		+= irq-loongson-eiointc.o
>   obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
> index 80e55955a29f..a2a8c819cfb1 100644
> --- a/drivers/irqchip/irq-loongarch-avec.c
> +++ b/drivers/irqchip/irq-loongarch-avec.c
> @@ -24,7 +24,6 @@
>   #define VECTORS_PER_REG		64
>   #define IRR_VECTOR_MASK		0xffUL
>   #define IRR_INVALID_MASK	0x80000000UL
> -#define AVEC_MSG_OFFSET		0x100000
>   
>   #ifdef CONFIG_SMP
>   struct pending_list {
> @@ -47,15 +46,6 @@ struct avecintc_chip {
>   
>   static struct avecintc_chip loongarch_avec;
>   
> -struct avecintc_data {
> -	struct list_head	entry;
> -	unsigned int		cpu;
> -	unsigned int		vec;
> -	unsigned int		prev_cpu;
> -	unsigned int		prev_vec;
> -	unsigned int		moving;
> -};
> -
>   static inline void avecintc_enable(void)
>   {
>   	u64 value;
> @@ -85,7 +75,7 @@ static inline void pending_list_init(int cpu)
>   	INIT_LIST_HEAD(&plist->head);
>   }
>   
> -static void avecintc_sync(struct avecintc_data *adata)
> +void avecintc_sync(struct avecintc_data *adata)
>   {
>   	struct pending_list *plist;
>   
> @@ -109,7 +99,7 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
>   			return -EBUSY;
>   
>   		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
> -			return 0;
> +			return IRQ_SET_MASK_OK_DONE;
>   
>   		cpumask_and(&intersect_mask, dest, cpu_online_mask);
>   
> @@ -121,7 +111,8 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
>   		adata->cpu = cpu;
>   		adata->vec = vector;
>   		per_cpu_ptr(irq_map, adata->cpu)[adata->vec] = irq_data_to_desc(data);
> -		avecintc_sync(adata);
> +		if (!cpu_has_redirectint)
> +			avecintc_sync(adata);
>   	}
>   
>   	irq_data_update_effective_affinity(data, cpumask_of(cpu));
> @@ -242,6 +233,7 @@ static void avecintc_irq_dispatch(struct irq_desc *desc)
>   		d = this_cpu_read(irq_map[vector]);
>   		if (d) {
>   			generic_handle_irq_desc(d);
> +
>   		} else {
>   			spurious_interrupt();
>   			pr_warn("Unexpected IRQ occurs on CPU#%d [vector %ld]\n", smp_processor_id(), vector);
> @@ -412,6 +404,9 @@ static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
>   
>   static inline int __init acpi_cascade_irqdomain_init(void)
>   {
> +	if (cpu_has_redirectint)
> +		return redirect_acpi_init(loongarch_avec.domain);
> +
>   	return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
>   }
>   
> diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loongarch-ir.c
> new file mode 100644
> index 000000000000..9e1cbbb72e29
> --- /dev/null
> +++ b/drivers/irqchip/irq-loongarch-ir.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Loongson Technologies, Inc.
> + */
> +
> +#include <linux/cpuhotplug.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/spinlock.h>
> +#include <linux/msi.h>
> +
> +#include <asm/irq.h>
> +#include <asm/loongarch.h>
> +#include <asm/setup.h>
> +#include <larchintrin.h>
> +
> +#include "irq-loongson.h"
> +#include "irq-msi-lib.h"
> +
> +#define IRD_ENTRIES			65536
> +
> +/* redirect entry size 128bits */
> +#define IRD_PAGE_ORDER			(20 - PAGE_SHIFT)
> +
> +/* irt cache invalid queue */
> +#define	INVALID_QUEUE_SIZE		4096
> +
> +#define INVALID_QUEUE_PAGE_ORDER	(16 - PAGE_SHIFT)
> +
> +#define GPID_ADDR_MASK			0x3ffffffffffULL
> +#define GPID_ADDR_SHIFT			6
> +
> +#define CQB_SIZE_SHIFT			0
> +#define CQB_SIZE_MASK			0xf
> +#define CQB_ADDR_SHIFT			12
> +#define CQB_ADDR_MASK			(0xfffffffffULL)
> +
> +#define CFG_DISABLE_IDLE		2
> +#define INVALID_INDEX			0
> +
> +#define MAX_IR_ENGINES			16
> +
> +struct irq_domain *redirect_domain;
> +
> +struct redirect_entry {
> +	struct  {
> +		__u64	valid	: 1,
> +			res1	: 5,
> +			gpid	: 42,
> +			res2	: 8,
> +			vector	: 8;
> +	}	lo;
> +	__u64	hi;
> +};
> +
> +struct redirect_gpid {
> +	u64	pir[4];      /* Pending interrupt requested */
> +	u8	en	: 1, /* doorbell */
> +		res0	: 7;
> +	u8	irqnum;
> +	u16	res1;
> +	u32	dst;
> +	u32	rsvd[6];
> +} __aligned(64);
> +
> +struct redirect_table {
> +	int			node;
> +	struct redirect_entry	*table;
> +	unsigned long		*bitmap;
> +	unsigned int		nr_ird;
> +	struct page		*page;
> +	raw_spinlock_t		lock;
> +};
> +
> +struct redirect_item {
> +	int			index;
> +	struct redirect_entry	*entry;
> +	struct redirect_gpid	*gpid;
> +	struct redirect_table	*table;
> +};
> +
> +struct redirect_queue {
> +	int		node;
> +	u64		base;
> +	u32		max_size;
> +	int		head;
> +	int		tail;
> +	struct page	*page;
> +	raw_spinlock_t	lock;
> +};
> +
> +
> +struct irde_desc {
> +	struct redirect_table	ird_table;
> +	struct redirect_queue	inv_queue;
> +};
> +
> +struct irde_inv_cmd {
> +	union {
> +		__u64	cmd_info;
> +		struct {
> +			__u64	res1		: 4,
> +				type		: 1,
> +				need_notice	: 1,
> +				pad		: 2,
> +				index		: 16,
> +				pad2		: 40;
> +		}	index;
> +	};
> +	__u64		notice_addr;
> +};
> +
> +struct smp_invalid_arg {
> +	struct redirect_queue	*queue;
> +	struct irde_inv_cmd	*cmd;
> +};
> +
> +static struct irde_desc irde_descs[MAX_IR_ENGINES];
> +static phys_addr_t msi_base_addr;
> +
> +static inline bool invalid_queue_is_full(int node_id, u32 *tail)
> +{
> +	u32 head;
> +
> +	head = iocsr_read32(LOONGARCH_IOCSR_REDIRECT_CQH);
> +	*tail = iocsr_read32(LOONGARCH_IOCSR_REDIRECT_CQT);
> +
> +	return !!(head == ((*tail + 1) % INVALID_QUEUE_SIZE));
> +}
> +
> +static void invalid_enqueue(struct redirect_queue *rqueue, struct irde_inv_cmd *cmd)
> +{
> +	struct irde_inv_cmd *inv_addr;
> +	u32 tail;
> +
> +	guard(raw_spinlock_irqsave)(&rqueue->lock);
> +
> +	while (invalid_queue_is_full(rqueue->node, &tail))
> +		cpu_relax();
> +
> +	inv_addr = (struct irde_inv_cmd *)(rqueue->base + tail * sizeof(struct irde_inv_cmd));
> +	memcpy(inv_addr, cmd, sizeof(struct irde_inv_cmd));
> +	tail = (tail + 1) % INVALID_QUEUE_SIZE;
> +
> +	wmb();
> +
> +	iocsr_write32(tail, LOONGARCH_IOCSR_REDIRECT_CQT);
> +}
> +
> +static void smp_call_invalid_enqueue(void *arg)
> +{
> +	struct smp_invalid_arg *s_arg = (struct smp_invalid_arg *)arg;
> +
> +	invalid_enqueue(s_arg->queue, s_arg->cmd);
> +}
> +
> +static void irde_invlid_entry_node(struct redirect_item *item)
> +{
> +	struct redirect_queue *rqueue;
> +	struct smp_invalid_arg arg;
> +	struct irde_inv_cmd cmd;
> +	volatile u64 raddr = 0;
> +	int node = item->table->node, cpu;
> +
> +	rqueue = &(irde_descs[node].inv_queue);
> +	cmd.cmd_info = 0;
> +	cmd.index.type = INVALID_INDEX;
> +	cmd.index.need_notice = 1;
> +	cmd.index.index = item->index;
> +	cmd.notice_addr = (u64)(__pa(&raddr));
> +
> +	if (cpu_to_node(smp_processor_id()) == node)
> +		invalid_enqueue(rqueue, &cmd);
> +	else {
> +		for_each_cpu(cpu, cpumask_of_node(node)) {
> +			if (cpu_online(cpu))
> +				break;
> +		}
> +		arg.queue = rqueue;
> +		arg.cmd = &cmd;
> +		smp_call_function_single(cpu, smp_call_invalid_enqueue, &arg, 0);
> +	}
> +
> +	while (!raddr)
> +		cpu_relax();
> +
> +}
> +
> +static inline struct avecintc_data *irq_data_get_avec_data(struct irq_data *data)
> +{
> +	return data->parent_data->chip_data;
> +}
> +
> +static int redirect_table_alloc(struct redirect_item *item, struct redirect_table *ird_table)
> +{
> +	int index;
> +
> +	guard(raw_spinlock_irqsave)(&ird_table->lock);
> +
> +	index = find_first_zero_bit(ird_table->bitmap, IRD_ENTRIES);
> +	if (index > IRD_ENTRIES) {
> +		pr_err("No redirect entry to use\n");
> +		return -ENOMEM;
> +	}
> +
> +	__set_bit(index, ird_table->bitmap);
> +
> +	item->index = index;
> +	item->entry = &ird_table->table[index];
> +	item->table = ird_table;
> +
> +	return 0;
> +}
> +
> +static int redirect_table_free(struct redirect_item *item)
> +{
> +	struct redirect_table *ird_table;
> +	struct redirect_entry *entry;
> +	unsigned long flags;
> +
> +	ird_table = item->table;
> +
> +	entry = item->entry;
> +	memset(entry, 0, sizeof(struct redirect_entry));
> +
> +	raw_spin_lock_irqsave(&ird_table->lock, flags);
> +	bitmap_release_region(ird_table->bitmap, item->index, 0);
> +	raw_spin_unlock_irqrestore(&ird_table->lock, flags);
> +
> +	kfree(item->gpid);
> +
> +	irde_invlid_entry_node(item);
> +
> +	return 0;
> +}
> +
> +static inline void redirect_domain_prepare_entry(struct redirect_item *item, struct avecintc_data *adata)
> +{
> +	struct redirect_entry *entry = item->entry;
> +
> +	item->gpid->en = 1;
> +	item->gpid->irqnum = adata->vec;
> +	item->gpid->dst = adata->cpu;
> +
> +	entry->lo.valid = 1;
> +	entry->lo.gpid = ((long)item->gpid >> GPID_ADDR_SHIFT) & (GPID_ADDR_MASK);
> +	entry->lo.vector = 0xff;
> +	wmb();
> +}
> +
> +static int redirect_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
> +{
> +	struct redirect_item *item = data->chip_data;
> +	struct avecintc_data *adata;
> +	int ret;
> +
> +	ret = irq_chip_set_affinity_parent(data, dest, force);
> +	if (ret == IRQ_SET_MASK_OK_DONE)
> +		return IRQ_SET_MASK_OK;
> +	else if (ret) {
> +		pr_err("IRDE:set_affinity error %d\n", ret);
> +		return ret;
> +	}
> +
> +	adata = irq_data_get_avec_data(data);
> +
> +	redirect_domain_prepare_entry(item, adata);
> +
> +	irde_invlid_entry_node(item);
> +
> +	avecintc_sync(adata);
> +	return IRQ_SET_MASK_OK;
> +}
> +
> +static void redirect_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
> +{
> +	struct redirect_item *item;
> +
> +	item = irq_data_get_irq_chip_data(d);
> +	msg->address_lo = (msi_base_addr | 1 << 2 | ((item->index & 0xffff) << 4));
> +	msg->address_hi = 0x0;
> +	msg->data = 0x0;
> +}
> +
> +static inline void redirect_ack_irq(struct irq_data *d)
> +{
> +}
> +
> +static inline void redirect_unmask_irq(struct irq_data *d)
> +{
> +}
> +
> +static inline void redirect_mask_irq(struct irq_data *d)
> +{
> +}
> +
> +static struct irq_chip loongarch_redirect_chip = {
> +	.name			= "REDIRECT",
> +	.irq_ack		= redirect_ack_irq,
> +	.irq_mask		= redirect_mask_irq,
> +	.irq_unmask		= redirect_unmask_irq,
> +	.irq_set_affinity	= redirect_set_affinity,
> +	.irq_compose_msi_msg	= redirect_compose_msi_msg,
> +};
> +
> +static void redirect_free_resources(struct irq_domain *domain,
> +						unsigned int virq, unsigned int nr_irqs)
> +{
> +	struct irq_data *irq_data;
> +	struct redirect_item *item;
> +
> +	for (int i = 0; i < nr_irqs; i++) {
> +		irq_data = irq_domain_get_irq_data(domain, virq  + i);
> +		if (irq_data && irq_data->chip_data) {
> +			item = irq_data->chip_data;
> +			redirect_table_free(item);
> +			kfree(item);
> +		}
> +	}
> +}
> +
> +static int redirect_alloc(struct irq_domain *domain,
> +					unsigned int virq, unsigned int nr_irqs,
> +					 void *arg)
> +{
> +	struct redirect_table *ird_table;
> +	struct avecintc_data *avec_data;
> +	struct irq_data *irq_data;
> +	int ret, i, node;
> +
> +#ifdef CONFIG_NUMA
> +	node = ((msi_alloc_info_t *)arg)->desc->dev->numa_node;
> +#else
> +	node = 0;
> +#endif
> +	ird_table = &irde_descs[node].ird_table;
> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct redirect_item *item;
> +
> +		item = kzalloc(sizeof(struct redirect_item), GFP_KERNEL);
> +		if (!item) {
> +			pr_err("Alloc redirect descriptor failed\n");
> +			goto out_free_resources;
> +		}
> +
> +		irq_data = irq_domain_get_irq_data(domain, virq + i);
> +
> +		avec_data = irq_data_get_avec_data(irq_data);
> +		ret = redirect_table_alloc(item, ird_table);
> +		if (ret) {
> +			pr_err("Alloc redirect table entry failed\n");
> +			goto out_free_resources;
> +		}
> +
> +		item->gpid = kzalloc_node(sizeof(struct redirect_gpid), GFP_KERNEL, node);
> +		if (!item->gpid) {
> +			pr_err("Alloc redirect GPID failed\n");
> +			goto out_free_resources;
> +		}
> +
> +		irq_data->chip_data = item;
> +		irq_data->chip = &loongarch_redirect_chip;
> +		redirect_domain_prepare_entry(item, avec_data);
> +	}
> +	return 0;
> +
> +out_free_resources:
> +	redirect_free_resources(domain, virq, nr_irqs);
> +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
> +
> +	return -EINVAL;
> +}
> +
> +static void redirect_free(struct irq_domain *domain,
> +				     unsigned int virq, unsigned int nr_irqs)
> +{
> +	redirect_free_resources(domain, virq, nr_irqs);
> +	return irq_domain_free_irqs_common(domain, virq, nr_irqs);
> +}
> +
> +static const struct irq_domain_ops redirect_domain_ops = {
> +	.alloc		= redirect_alloc,
> +	.free		= redirect_free,
> +	.select		= msi_lib_irq_domain_select,
> +};
> +
> +static int redirect_queue_init(int node)
> +{
> +	struct redirect_queue *rqueue = &(irde_descs[node].inv_queue);
> +	struct page *pages;
> +
> +	pages = alloc_pages_node(0, GFP_KERNEL | __GFP_ZERO, INVALID_QUEUE_PAGE_ORDER);
> +	if (!pages) {
> +		pr_err("Node [%d] Invalid Queue alloc pages failed!\n", node);
> +		return -ENOMEM;
> +	}
> +
> +	rqueue->page = pages;
> +	rqueue->base = (u64)page_address(pages);
> +	rqueue->max_size = INVALID_QUEUE_SIZE;
> +	rqueue->head = 0;
> +	rqueue->tail = 0;
> +	rqueue->node = node;
> +	raw_spin_lock_init(&rqueue->lock);
> +
> +	iocsr_write32(0, LOONGARCH_IOCSR_REDIRECT_CQH);
> +	iocsr_write32(0, LOONGARCH_IOCSR_REDIRECT_CQT);
> +	iocsr_write64(((rqueue->base & (CQB_ADDR_MASK << CQB_ADDR_SHIFT)) |
> +				(CQB_SIZE_MASK << CQB_SIZE_SHIFT)), LOONGARCH_IOCSR_REDIRECT_CQB);
> +	return 0;
> +}
> +
> +static int redirect_table_init(int node)
> +{
> +	struct redirect_table *ird_table = &(irde_descs[node].ird_table);
> +	struct page *pages;
> +	unsigned long *bitmap;
> +
> +	pages = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, IRD_PAGE_ORDER);
> +	if (!pages) {
> +		pr_err("Node [%d] redirect table alloc pages failed!\n", node);
> +		return -ENOMEM;
> +	}
> +	ird_table->page = pages;
> +	ird_table->table = page_address(pages);
> +
> +	bitmap = bitmap_zalloc(IRD_ENTRIES, GFP_KERNEL);
> +	if (!bitmap) {
> +		pr_err("Node [%d] redirect table bitmap alloc pages failed!\n", node);
> +		return -ENOMEM;
> +	}
> +
> +	ird_table->bitmap = bitmap;
> +	ird_table->nr_ird = IRD_ENTRIES;
> +	ird_table->node = node;
> +
> +	raw_spin_lock_init(&ird_table->lock);
> +
> +	if (redirect_queue_init(node))
> +		return -EINVAL;
> +
> +	iocsr_write64(CFG_DISABLE_IDLE, LOONGARCH_IOCSR_REDIRECT_CFG);
> +	iocsr_write64(__pa(ird_table->table), LOONGARCH_IOCSR_REDIRECT_TBR);
> +
> +	return 0;
> +}
> +
> +static void redirect_table_fini(int node)
> +{
> +	struct redirect_table *ird_table = &(irde_descs[node].ird_table);
> +	struct redirect_queue *rqueue = &(irde_descs[node].inv_queue);
> +
> +	if (ird_table->page) {
> +		__free_pages(ird_table->page, IRD_PAGE_ORDER);
> +		ird_table->table = NULL;
> +		ird_table->page = NULL;
> +	}
> +
> +	if (ird_table->page) {
> +		bitmap_free(ird_table->bitmap);
> +		ird_table->bitmap = NULL;
> +	}
> +
> +	if (rqueue->page) {
> +		__free_pages(rqueue->page, INVALID_QUEUE_PAGE_ORDER);
> +		rqueue->page = NULL;
> +		rqueue->base = 0;
> +	}
> +
> +	iocsr_write64(0, LOONGARCH_IOCSR_REDIRECT_CQB);
> +	iocsr_write64(0, LOONGARCH_IOCSR_REDIRECT_TBR);
> +}
> +
> +static int redirect_cpu_online(unsigned int cpu)
> +{
> +	int ret, node = cpu_to_node(cpu);
> +
> +	if (cpu != cpumask_first(cpumask_of_node(node)))
> +		return 0;
> +
> +	ret = redirect_table_init(node);
> +	if (ret) {
> +		redirect_table_fini(node);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +#if defined(CONFIG_ACPI)
> +static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
> +		const unsigned long end)
> +{
> +	struct acpi_madt_msi_pic *pchmsi_entry = (struct acpi_madt_msi_pic *)header;
> +
> +	msi_base_addr = pchmsi_entry->msg_address - AVEC_MSG_OFFSET;
> +
> +	return pch_msi_acpi_init_avec(redirect_domain);
> +}
> +
> +static int __init acpi_cascade_irqdomain_init(void)
> +{
> +	return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
> +}
> +
> +int __init redirect_acpi_init(struct irq_domain *parent)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct irq_domain *domain;
> +	int ret;
> +
> +	fwnode = irq_domain_alloc_named_fwnode("redirect");
> +	if (!fwnode) {
> +		pr_err("Unable to alloc redirect domain handle\n");
> +		goto fail;
> +	}
> +
> +	domain = irq_domain_create_hierarchy(parent, 0, IRD_ENTRIES, fwnode,
> +			&redirect_domain_ops, irde_descs);
> +	if (!domain) {
> +		pr_err("Unable to alloc redirect domain\n");
> +		goto out_free_fwnode;
> +	}
> +
> +	redirect_domain = domain;
> +
> +	ret = redirect_table_init(0);
> +	if (ret)
> +		goto out_free_table;
> +
> +	ret = acpi_cascade_irqdomain_init();
> +	if (ret < 0) {
> +		pr_err("Failed to cascade IRQ domain, ret=%d\n", ret);
> +		goto out_free_table;
> +	}
> +
> +	cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_REDIRECT_STARTING,
> +				  "irqchip/loongarch/redirect:starting",
> +				  redirect_cpu_online, NULL);
> +
> +	pr_info("loongarch irq redirect modules init succeeded\n");
> +	return 0;
> +
> +out_free_table:
> +	redirect_table_fini(0);
> +	irq_domain_remove(redirect_domain);
> +	redirect_domain = NULL;
> +out_free_fwnode:
> +	irq_domain_free_fwnode(fwnode);
> +fail:
> +	return -EINVAL;
> +}
> +#endif
> diff --git a/drivers/irqchip/irq-loongson.h b/drivers/irqchip/irq-loongson.h
> index 11fa138d1f44..05ad40ffb62b 100644
> --- a/drivers/irqchip/irq-loongson.h
> +++ b/drivers/irqchip/irq-loongson.h
> @@ -5,6 +5,15 @@
>   
>   #ifndef _DRIVERS_IRQCHIP_IRQ_LOONGSON_H
>   #define _DRIVERS_IRQCHIP_IRQ_LOONGSON_H
> +#define AVEC_MSG_OFFSET		0x100000
> +struct avecintc_data {
> +	struct list_head        entry;
> +	unsigned int            cpu;
> +	unsigned int            vec;
> +	unsigned int            prev_cpu;
> +	unsigned int            prev_vec;
> +	unsigned int            moving;
> +};
>   
>   int find_pch_pic(u32 gsi);
>   
> @@ -24,4 +33,7 @@ int pch_msi_acpi_init(struct irq_domain *parent,
>   					struct acpi_madt_msi_pic *acpi_pchmsi);
>   int pch_msi_acpi_init_avec(struct irq_domain *parent);
>   
> +int redirect_acpi_init(struct irq_domain *parent);
> +
> +void avecintc_sync(struct avecintc_data *adata);
>   #endif /* _DRIVERS_IRQCHIP_IRQ_LOONGSON_H */
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 6cc5e484547c..2fd5531fa378 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -146,6 +146,7 @@ enum cpuhp_state {
>   	CPUHP_AP_IRQ_MIPS_GIC_STARTING,
>   	CPUHP_AP_IRQ_EIOINTC_STARTING,
>   	CPUHP_AP_IRQ_AVECINTC_STARTING,
> +	CPUHP_AP_IRQ_REDIRECT_STARTING,
>   	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
>   	CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
>   	CPUHP_AP_IRQ_RISCV_IMSIC_STARTING,


