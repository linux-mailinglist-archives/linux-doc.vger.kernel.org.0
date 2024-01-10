Return-Path: <linux-doc+bounces-6265-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC7825DFF
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jan 2024 03:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6934C1F24291
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jan 2024 02:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F0115B3;
	Sat,  6 Jan 2024 02:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="SQzj5JDG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A0115AC
	for <linux-doc@vger.kernel.org>; Sat,  6 Jan 2024 02:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atishpatra.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50eaaf2c7deso168660e87.2
        for <linux-doc@vger.kernel.org>; Fri, 05 Jan 2024 18:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1704509742; x=1705114542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/OQHBKivyOXc5hkcFMaUfc9sdaOF7YeJXECyYCzUWU=;
        b=SQzj5JDGcjBIIWl05U6ZTucnP29OUKPirBmRHPMZmxDZvJ1wsi6Hs6ubvmiG+eZ0Fg
         fxYsRk+1t8QfCcVo3XhTz666gMjve5z3PZX/o6eOn7dGtF5/yyrUdNp+osEVWg0VlZq6
         e0TiN4Z2TH3YhQ0R5oBYXOJg6bkL0R+4IWiL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704509742; x=1705114542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/OQHBKivyOXc5hkcFMaUfc9sdaOF7YeJXECyYCzUWU=;
        b=J1IedixOciX4S8C4lTuArFoqCaz0861FrQmBEPAoVX0gFvZCJMehYikzgNW78o+tKa
         xMeTBZbuXlGRzVeSW6dczL5HPHROD4wQuffUH1Ju5Czk9lQTfGybUZFthT46ysDHn5gU
         M8MOUZosC5bhn5rA/B5lg0X9ZiQLu/ecAdQk7a7DB1oc2fSjVXcBW9W5b3eae+sTa6J4
         bYiZlEKhW2I3cvzA+0kFtiikcfpiyNb5iU8jWS8LeRsAJN7GFU9pcACwx8iHE/JhndPL
         Uceds1vUTf/N8bh5as6XxU4Lokfm5TA7KBSmQNRweEmTFig0HRj40X2Wxk+s24HdLwAm
         gjgQ==
X-Gm-Message-State: AOJu0YwEHmoWK7ZdHHueer0xyPN+Ic1awUlMF5zCqUWAxwhCPs9kOu06
	uBs9dg7ue8cHm6dubU7ps3qapn99k1tloRIEfsU/10ildir+
X-Google-Smtp-Source: AGHT+IE+P4Xfwa/GlczSvqxOFEJEP0wZ+Q70eGv5P6vv6fF9A1L8oOmViQt0qc/Fmyn0r0VhtUNFo+pNQCj1WtLvAdU=
X-Received: by 2002:a05:6512:70d:b0:50e:7b9e:3599 with SMTP id
 b13-20020a056512070d00b0050e7b9e3599mr138848lfs.46.1704509742375; Fri, 05 Jan
 2024 18:55:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com> <20231213-fencei-v3-1-b75158238eb7@rivosinc.com>
In-Reply-To: <20231213-fencei-v3-1-b75158238eb7@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 5 Jan 2024 18:55:31 -0800
Message-ID: <CAOnJCU+E_YFp_Mt7CbLrz7KHPS=8Mr_wqQy=qE263gPd6qCytg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 2:48=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> optimization of cross modifying code. This prctl enables userspace code
> to use icache flushing instructions such as fence.i with the guarantee
> that the icache will continue to be clean after thread migration.
>

Do we need a CLEAR option as well ? I am wondering if there is a use case w=
here
an application wants the prctl for only certain duration but may
invoke fence.i multiple times (syscall will still not be a good option
for them.)

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/mmu.h       |  2 ++
>  arch/riscv/include/asm/processor.h |  6 ++++++
>  arch/riscv/mm/cacheflush.c         | 37 ++++++++++++++++++++++++++++++++=
+++++
>  arch/riscv/mm/context.c            |  8 +++++---
>  include/uapi/linux/prctl.h         |  3 +++
>  kernel/sys.c                       |  6 ++++++
>  6 files changed, 59 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> index 355504b37f8e..60be458e94da 100644
> --- a/arch/riscv/include/asm/mmu.h
> +++ b/arch/riscv/include/asm/mmu.h
> @@ -19,6 +19,8 @@ typedef struct {
>  #ifdef CONFIG_SMP
>         /* A local icache flush is needed before user execution can resum=
e. */
>         cpumask_t icache_stale_mask;
> +       /* Force local icache flush on all migrations. */
> +       bool force_icache_flush;
>  #endif
>  #ifdef CONFIG_BINFMT_ELF_FDPIC
>         unsigned long exec_fdpic_loadmap;
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index f19f861cda54..7eda6c75e0f2 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -84,6 +84,9 @@ struct thread_struct {
>         unsigned long vstate_ctrl;
>         struct __riscv_v_ext_state vstate;
>         unsigned long align_ctl;
> +#ifdef CONFIG_SMP
> +       bool force_icache_flush;
> +#endif
>  };
>
>  /* Whitelist the fstate from the task_struct for hardened usercopy */
> @@ -145,6 +148,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, u=
nsigned int val);
>  #define GET_UNALIGN_CTL(tsk, addr)     get_unalign_ctl((tsk), (addr))
>  #define SET_UNALIGN_CTL(tsk, val)      set_unalign_ctl((tsk), (val))
>
> +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2) riscv_set_icache_flush_ct=
x(arg1, arg2)
> +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long p=
er_thread);
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _ASM_RISCV_PROCESSOR_H */
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 55a34f2020a8..3b2bf8256a10 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/of.h>
> +#include <linux/prctl.h>
>  #include <asm/acpi.h>
>  #include <asm/cacheflush.h>
>
> @@ -152,3 +153,39 @@ void __init riscv_init_cbo_blocksizes(void)
>         if (cboz_block_size)
>                 riscv_cboz_block_size =3D cboz_block_size;
>  }
> +
> +/**
> + * riscv_set_icache_flush_ctx() - Enable userspace to emit icache flushi=
ng instructions.
> + * @ctx: Sets the type of context
> + *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.=
i will
> + *                           emitted on thread/process migration.
> + * @per_thread: When set to 0, will use the default behavior of setting =
the
> + *  icache flush context per process. When set to 1, will use a per thre=
ad
> + *  context.
> + *
> + * When in per-process context, there may be multiple threads using the =
same mm.
> + * Therefore, the icache can never be assumed clean when. Multiple threa=
ds in
> + * the process may modify instructions in the mm concurrently.
> + *
> + * In per-thread context, it can be assumed that all modifications to
> + * instructions in memory will be performed by this thread. When the thr=
ead is
> + * migrated the icache will be flushed.
> + *
> + */
> +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thre=
ad)
> +{
> +#ifdef CONFIG_SMP
> +       switch (ctx) {
> +       case PR_RISCV_CTX_SW_FENCEI:
> +               if (per_thread)
> +                       current->thread.force_icache_flush =3D true;
> +               else
> +                       current->mm->context.force_icache_flush =3D true;
> +               break;
> +
> +       default:
> +               break;
> +       }
> +#endif
> +       return 0;
> +}
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 217fd4de6134..0146c61be0ab 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -297,12 +297,14 @@ static inline void set_mm(struct mm_struct *prev,
>   *
>   * The "cpu" argument must be the current local CPU number.
>   */
> -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned =
int cpu)
> +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned =
int cpu,
> +                                        struct task_struct *task)
>  {
>  #ifdef CONFIG_SMP
>         cpumask_t *mask =3D &mm->context.icache_stale_mask;
>
> -       if (cpumask_test_cpu(cpu, mask)) {
> +       if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush=
 ||
> +           (task && task->thread.force_icache_flush)) {
>                 cpumask_clear_cpu(cpu, mask);
>                 /*
>                  * Ensure the remote hart's writes are visible to this ha=
rt.
> @@ -332,5 +334,5 @@ void switch_mm(struct mm_struct *prev, struct mm_stru=
ct *next,
>
>         set_mm(prev, next, cpu);
>
> -       flush_icache_deferred(next, cpu);
> +       flush_icache_deferred(next, cpu, task);
>  }
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 370ed14b1ae0..472801ea78cc 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -306,4 +306,7 @@ struct prctl_mm_map {
>  # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK      0xc
>  # define PR_RISCV_V_VSTATE_CTRL_MASK           0x1f
>
> +#define PR_RISCV_SET_ICACHE_FLUSH_CTX  71
> +# define PR_RISCV_CTX_SW_FENCEI                0
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 420d9cb9cc8e..e806a8a67c36 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -146,6 +146,9 @@
>  #ifndef RISCV_V_GET_CONTROL
>  # define RISCV_V_GET_CONTROL()         (-EINVAL)
>  #endif
> +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)      (-EINVAL)
> +#endif
>
>  /*
>   * this is where the system-wide overflow UID and GID are defined, for
> @@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, =
arg2, unsigned long, arg3,
>         case PR_RISCV_V_GET_CONTROL:
>                 error =3D RISCV_V_GET_CONTROL();
>                 break;
> +       case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> +               error =3D RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> +               break;
>         default:
>                 error =3D -EINVAL;
>                 break;
>
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



--=20
Regards,
Atish

