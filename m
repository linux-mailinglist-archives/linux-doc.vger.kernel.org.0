Return-Path: <linux-doc+bounces-6771-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAC82D15D
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jan 2024 17:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F3DB28199C
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jan 2024 16:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6633C29;
	Sun, 14 Jan 2024 16:05:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5B7E;
	Sun, 14 Jan 2024 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC5841BF206;
	Sun, 14 Jan 2024 16:05:20 +0000 (UTC)
Message-ID: <a75ed906-7dd5-44aa-8809-f1758de188e4@ghiti.fr>
Date: Sun, 14 Jan 2024 17:05:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
References: <20240112-fencei-v7-0-78f0614e1db0@rivosinc.com>
 <20240112-fencei-v7-1-78f0614e1db0@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240112-fencei-v7-1-78f0614e1db0@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

Hi Charlie,

On 13/01/2024 00:56, Charlie Jenkins wrote:
> Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> optimization of cross modifying code. This prctl enables userspace code
> to use icache flushing instructions such as fence.i with the guarantee
> that the icache will continue to be clean after thread migration.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>   arch/riscv/include/asm/mmu.h       |  2 ++
>   arch/riscv/include/asm/processor.h |  6 ++++
>   arch/riscv/mm/cacheflush.c         | 67 ++++++++++++++++++++++++++++++++++++++
>   arch/riscv/mm/context.c            |  8 +++--
>   include/uapi/linux/prctl.h         |  6 ++++
>   kernel/sys.c                       |  6 ++++
>   6 files changed, 92 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index 355504b37f8e..60be458e94da 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -19,6 +19,8 @@ typedef struct {
>   #ifdef CONFIG_SMP
>   	/* A local icache flush is needed before user execution can resume. */
>   	cpumask_t icache_stale_mask;
> +	/* Force local icache flush on all migrations. */
> +	bool force_icache_flush;
>   #endif
>   #ifdef CONFIG_BINFMT_ELF_FDPIC
>   	unsigned long exec_fdpic_loadmap;
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index f19f861cda54..7eda6c75e0f2 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -84,6 +84,9 @@ struct thread_struct {
>   	unsigned long vstate_ctrl;
>   	struct __riscv_v_ext_state vstate;
>   	unsigned long align_ctl;
> +#ifdef CONFIG_SMP
> +	bool force_icache_flush;
> +#endif
>   };
>   
>   /* Whitelist the fstate from the task_struct for hardened usercopy */
> @@ -145,6 +148,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
>   #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
>   #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
>   
> +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
> +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* _ASM_RISCV_PROCESSOR_H */
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 55a34f2020a8..ff545f19f07a 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/of.h>
> +#include <linux/prctl.h>
>   #include <asm/acpi.h>
>   #include <asm/cacheflush.h>
>   
> @@ -152,3 +153,69 @@ void __init riscv_init_cbo_blocksizes(void)
>   	if (cboz_block_size)
>   		riscv_cboz_block_size = cboz_block_size;
>   }
> +
> +/**
> + * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in
> + * userspace.
> + * @ctx: Set the type of icache flushing instructions permitted/prohibited in
> + *	 userspace. Supported values described below.
> + *
> + * Supported values for ctx:
> + *
> + * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in userspace.
> + *
> + * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in userspace. When ``scope ==
> + *   PR_RISCV_SCOPE_PER_PROCESS``, this will effect all threads in a process.
> + *   Therefore, caution must be taken -- only use this flag when you can
> + *   guarantee that no thread in the process will emit fence.i from this point
> + *   onward.
> + *
> + * @scope: Set scope of where icache flushing instructions are allowed to be
> + *	   emitted. Supported values described below.
> + *
> + * Supported values for scope:
> + *
> + * * PR_RISCV_SCOPE_PER_PROCESS: Ensure the icache of any thread in this process
> + *                               is coherent with instruction storage upon
> + *                               migration.
> + *
> + * * PR_RISCV_SCOPE_PER_THREAD: Ensure the icache of the current thread is
> + *                              coherent with instruction storage upon
> + *                              migration.
> + *
> + * When ``scope == PR_RISCV_SCOPE_PER_PROCESS``, all threads in the process are
> + * permitted to emit icache flushing instructions. Whenever any thread in the
> + * process is migrated, the corresponding hart's icache will be guaranteed to be
> + * consistent with instruction storage. Note this does not enforce any
> + * guarantees outside of migration. If a thread modifies an instruction that
> + * another thread may attempt to execute, the other thread must still emit an
> + * icache flushing instruction before attempting to execute the potentially
> + * modified instruction. This must be performed by the userspace program.
> + *
> + * In per-thread context (eg. ``scope == PR_RISCV_SCOPE_PER_THREAD``), only the
> + * thread calling this function is permitted to emit icache flushing
> + * instructions. When the thread is migrated, the corresponding hart's icache
> + * will be guaranteed to be consistent with instruction storage.
> + *
> + * On kernels configured without SMP, this function is a nop as migrations
> + * across harts will not occur.
> + */
> +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
> +{
> +#ifdef CONFIG_SMP
> +	switch (ctx) {
> +	case PR_RISCV_CTX_SW_FENCEI_ON:
> +		switch (scope) {
> +		case PR_RISCV_SCOPE_PER_PROCESS:
> +			current->mm->context.force_icache_flush = true;
> +			break;
> +		case PR_RISCV_SCOPE_PER_THREAD:
> +			current->thread.force_icache_flush = true;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +#endif
> +	return 0;
> +}
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 217fd4de6134..0146c61be0ab 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -297,12 +297,14 @@ static inline void set_mm(struct mm_struct *prev,
>    *
>    * The "cpu" argument must be the current local CPU number.
>    */
> -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
> +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
> +					 struct task_struct *task)
>   {
>   #ifdef CONFIG_SMP
>   	cpumask_t *mask = &mm->context.icache_stale_mask;
>   
> -	if (cpumask_test_cpu(cpu, mask)) {
> +	if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush ||
> +	    (task && task->thread.force_icache_flush)) {


IIUC, if a process/thread enables force_icache_flush, at every context 
switch, the process/thread will flush the local icache but, as you said, 
that's actually only needed in case of a migration. So we should check 
that there has been a migration before flushing the icache. Maybe by 
storing the last cpu the process/thread executed on and checking when it 
is scheduled back if the current cpu if different from the last cpu, WDYT?

Thanks,

Alex


>   		cpumask_clear_cpu(cpu, mask);
>   		/*
>   		 * Ensure the remote hart's writes are visible to this hart.
> @@ -332,5 +334,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>   
>   	set_mm(prev, next, cpu);
>   
> -	flush_icache_deferred(next, cpu);
> +	flush_icache_deferred(next, cpu, task);
>   }
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 370ed14b1ae0..524d546d697b 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -306,4 +306,10 @@ struct prctl_mm_map {
>   # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
>   # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
>   
> +#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> +# define PR_RISCV_CTX_SW_FENCEI_ON	0
> +# define PR_RISCV_CTX_SW_FENCEI_OFF	1
> +# define PR_RISCV_SCOPE_PER_PROCESS	0
> +# define PR_RISCV_SCOPE_PER_THREAD	1
> +
>   #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 420d9cb9cc8e..e806a8a67c36 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -146,6 +146,9 @@
>   #ifndef RISCV_V_GET_CONTROL
>   # define RISCV_V_GET_CONTROL()		(-EINVAL)
>   #endif
> +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> +#endif
>   
>   /*
>    * this is where the system-wide overflow UID and GID are defined, for
> @@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>   	case PR_RISCV_V_GET_CONTROL:
>   		error = RISCV_V_GET_CONTROL();
>   		break;
> +	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> +		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> +		break;
>   	default:
>   		error = -EINVAL;
>   		break;
>

