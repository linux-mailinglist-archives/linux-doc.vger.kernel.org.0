Return-Path: <linux-doc+bounces-17526-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5D8D81BC
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jun 2024 13:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E31288B76
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jun 2024 11:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B97B126F1C;
	Mon,  3 Jun 2024 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGAVbzQN"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3886ADC;
	Mon,  3 Jun 2024 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415849; cv=none; b=tzJm5ztBBkenXvIbIbQzPobIXqCq5Az3QvJJ6Z7kKQOd3lX8y6MbRyB63Q3s1rCHy0n2MEU8tO0PECneG+is8kH+njBFHFuYCC1k/EtmtLwOdzruRpcGpPeGhd/EzV+Y2EoqWdgTDyCHyT7Iy4QKePvSWza5h9MmJElhFLoados=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415849; c=relaxed/simple;
	bh=lydNfInmyOWOtaFTT5lJ/5jevI5Qys9ey6GqwIzBfs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNSj0Dka8CaO/nnBXMoNinciiEVmCBZJzqA9+A8NlS9YXylivJ/UaaZPZ33QrUQDcymnYdHXE9eJ/XbWtYZKabjfjY183kWFXRCbJufJoJWZJHF7q1cqvfTr4yk6L1qsaJL7u7UB/pX35cyvcr5B2I5adlHf3HmtSml8b+yHZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGAVbzQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FB0C4AF0F;
	Mon,  3 Jun 2024 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717415848;
	bh=lydNfInmyOWOtaFTT5lJ/5jevI5Qys9ey6GqwIzBfs4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OGAVbzQN3wZy+ks7hT5qcLmNmqwftBBPY0c/WME7PNs73jWO8QHAHf8XgHU/fAGZn
	 MJcA8iKud0a6SxtumX/4Fx0iWvonawzztSzNVoDoX2B/vhSOtfZ+4/x3Xo19K6pTIj
	 zoGc8T4EbCy+DtoWFefbFtw3n7e9swydSvhPg6jdUFqremhWI55E+gO4/XYkys1Zvv
	 gI/uKIbxiXSEwiXNNnZ5aPcnaXj2QF8iekGMJz8F2Xy/DIaA6GSL2HYH4M2ofUb/rM
	 6ceZlBvTXQ53uvI73BwlQeuOOhOOOLqKB/GiFILEahCIe5JL+doTOTPoB2ttW9OtUt
	 ZAhhaAUulcVng==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a52dfd081so1317297a12.2;
        Mon, 03 Jun 2024 04:57:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU//XQsqQA2MuHO+hG0wviN5PbUvZBKKWTXz4moclxt6zpQf6tBqmsW21RCEBwWpkfSSPy/PXRHR14r5XxS1vcWbIyuYl9nT1Qgc/EDpoCyA5Wgl8JhM6PIhnHV1KidhqTjwQaufeCJtArfzh/s0Y+wMybPgscHaYCXKTZbs+G8CQ5CJA==
X-Gm-Message-State: AOJu0YwzCsegNpcMjm5C001NVZv+xdSXS3dQ3CEy4rl1MLcO35qnAGXN
	u7gx9nT3bWSgnBSrl3BBb5jxm/L0fsWcLC5rHAmxQ1vYB45QrATWxju1PLN4Mhl5BdTx0icrNEY
	SmMvsZND81GfN7TFlKN27Izi3Zpg=
X-Google-Smtp-Source: AGHT+IE+bmbnr0mqsjJUEB8cNePLpoj0fYirswyD8tHSPvRYf67zyMcrQSgdOchaeYfNfN0xqihjfLoMrSN9FOBI7g4=
X-Received: by 2002:a50:d596:0:b0:574:eb69:fadf with SMTP id
 4fb4d7f45d1cf-57a3656455fmr5649253a12.36.1717415847150; Mon, 03 Jun 2024
 04:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-8-alexghiti@rivosinc.com> <CAJF2gTQgg-7Fzoz9TsjWD-_8ABbS7M66aEztCsZ9Ejk8LOvmiQ@mail.gmail.com>
 <CAHVXubg=T3AMER0z8-iRqqFmDQp8iEM92cXwPZcW2Sfm=_KOHQ@mail.gmail.com>
 <CAJF2gTT51oZqEq-1TV_UEUufsrq=jRr4FAbmdtrChAHyUC1rXg@mail.gmail.com>
 <b6b6d273-4d57-4611-8c67-1a67d443b7d0@ghiti.fr> <CAJF2gTTiz_gkaA8OVkZynKUAFHFGij1W97qVSS3RKyMK5vkpdw@mail.gmail.com>
 <1cb05816-6f2f-4940-8051-b645f9f52c14@ghiti.fr> <CAJF2gTS-8KHs8LqiR70AxKQB9=sAZznXAXSbk=Q8PVwdKQSrbg@mail.gmail.com>
 <3130486a-2269-4e6e-821f-d1a643794c01@ghiti.fr>
In-Reply-To: <3130486a-2269-4e6e-821f-d1a643794c01@ghiti.fr>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 3 Jun 2024 19:57:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSgf-a8HTubcx_ERGUbzaYMB02_Xv9NOknf-te8Vc=d+Q@mail.gmail.com>
Message-ID: <CAJF2gTSgf-a8HTubcx_ERGUbzaYMB02_Xv9NOknf-te8Vc=d+Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] riscv: Add qspinlock support based on Zabha extension
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 7:49=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
> On 03/06/2024 13:44, Guo Ren wrote:
> > On Mon, Jun 3, 2024 at 7:34=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> =
wrote:
> >> On 03/06/2024 13:28, Guo Ren wrote:
> >>> On Mon, Jun 3, 2024 at 5:49=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr=
> wrote:
> >>>> Hi Guo,
> >>>>
> >>>> On 31/05/2024 15:10, Guo Ren wrote:
> >>>>> On Wed, May 29, 2024 at 9:03=E2=80=AFPM Alexandre Ghiti <alexghiti@=
rivosinc.com> wrote:
> >>>>>> Hi Guo,
> >>>>>>
> >>>>>> On Wed, May 29, 2024 at 11:24=E2=80=AFAM Guo Ren <guoren@kernel.or=
g> wrote:
> >>>>>>> On Tue, May 28, 2024 at 11:18=E2=80=AFPM Alexandre Ghiti <alexghi=
ti@rivosinc.com> wrote:
> >>>>>>>> In order to produce a generic kernel, a user can select
> >>>>>>>> CONFIG_QUEUED_SPINLOCKS which will fallback at runtime to the ti=
cket
> >>>>>>>> spinlock implementation if Zabha is not present.
> >>>>>>>>
> >>>>>>>> Note that we can't use alternatives here because the discovery o=
f
> >>>>>>>> extensions is done too late and we need to start with the qspinl=
ock
> >>>>>>>> implementation because the ticket spinlock implementation would =
pollute
> >>>>>>>> the spinlock value, so let's use static keys.
> >>>>> Zabha is not a prerequisite for qspinlock; the prerequisite for
> >>>>> qspinlock is the *forward progress guarantee* in the atomic operati=
on
> >>>>> loop during intense contention. Even with Zabha enabled to meet the
> >>>>> requirements of xchg_tail, that still only applies when the number =
of
> >>>>> CPUs is less than 16K. The qspinlock uses cmpxchg loop instead of
> >>>>> xchg_tail when the number of cores is more than 16K. Thus, hardware
> >>>>> support for Zabha does not equate to the safe use of qspinlock.
> >>>> But if we have Zacas to implement cmpxchg(), we still provide the
> >>>> "forward progress guarantee" then right? Let me know if I missed som=
ething.
> >>> The qspinlock needs a "forward progress guarantee," not Zacas, and
> >>> Zabha could give a guarantee to qspinlock xchg_tail (CPUs < 16K) with
> >>> AMOSWAP.H instruction. But, using "LR/SC pairs" also could give enoug=
h
> >>> fwd guarantee that depends on the micro-arch design of the riscv core=
.
> >>> I think the help of AMO instead of LR/SC is it could off-load AMO
> >>> operations from LSU to CIU(Next Level Cache or Interconnect), which
> >>> gains better performance. "LR/SC pairs" only provide Near-Atomic, but
> >>> AMO gives Far-Atomic additionally.
> >>
> >> I understand qspinlocks require forward progress and that your company=
's
> >> LR/SC implementations provide such guarantee, I'm not arguing against
> >> your new extension proposal.
> >>
> >> It seemed to me in your previous message that you implied that when
> >> NR_CPUS > 16k, we should not use qspinlocks. My question was: "Don't
> >> Zacas provide such guarantee"? I think it does, so qspinlocks should
> >> actually depend on Zabha *and* Zacas. Is that correct to you?
> > See kernel/locking/qspinlock.c
> > #if _Q_PENDING_BITS =3D=3D 8 (NR_CPUS < 16K)
> > static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> > {
> >          /*
> >           * We can use relaxed semantics since the caller ensures that =
the
> >           * MCS node is properly initialized before updating the tail.
> >           */
> >          return (u32)xchg_relaxed(&lock->tail,
> >                                   tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OF=
FSET;
> > }
> > #else /* NR_CPUS >=3D 16K */
> > static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> > {
> >          u32 old, new;
> >
> >          old =3D atomic_read(&lock->val);
> >          do {
> >                  new =3D (old & _Q_LOCKED_PENDING_MASK) | tail;
> >                  /*
> >                   * We can use relaxed semantics since the caller ensur=
es that
> >                   * the MCS node is properly initialized before updatin=
g the
> >                   * tail.
> >                   */
> >          } while (!atomic_try_cmpxchg_relaxed(&lock->val, &old, new));
> >
> >          return old;
> > }
> > #endif
> >
> > Look! You, Zacas, still need an additional FWD guarantee to break the
> > loop. That is, how *stickiness* your cache line is?
>
>
> But then the problem comes from this generic implementation of
> xchg_tail(), not from the arch cas implementation right?
The cmpxchg loop forward guarantee problems are needed in the whole
Linux, not only in qspinlock. If the machine couldn't give a fwd
guarantee, that seems a crap one.

>
>
> >
> >> Let me know if I misunderstood something again.
> >>
> >> Thanks,
> >>
> >> Alex
> >>
> >>
> >>>
> >>>> Thanks,
> >>>>
> >>>> Alex
> >>>>
> >>>>
> >>>>> Therefore, I would like to propose a new ISA extension: Zafpg(Atomi=
c
> >>>>> Forward Progress Guarantee). If RISC-V vendors can ensure the progr=
ess
> >>>>> of LR/SC or CMPXCHG LOOP at the microarchitectural level or if cach=
e
> >>>>> lines are sufficiently sticky, they could then claim support for th=
is
> >>>>> extension. Linux could then select different spinlock implementatio=
ns
> >>>>> based on this extension's support or not.
> >>>>>
> >>>>>>>> This is largely based on Guo's work and Leonardo reviews at [1].
> >>>>>>>>
> >>>>>>>> Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638=
-1-guoren@kernel.org/ [1]
> >>>>>>>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> >>>>>>>> ---
> >>>>>>>>     .../locking/queued-spinlocks/arch-support.txt |  2 +-
> >>>>>>>>     arch/riscv/Kconfig                            |  1 +
> >>>>>>>>     arch/riscv/include/asm/Kbuild                 |  4 +-
> >>>>>>>>     arch/riscv/include/asm/spinlock.h             | 39 +++++++++=
++++++++++
> >>>>>>>>     arch/riscv/kernel/setup.c                     | 18 +++++++++
> >>>>>>>>     include/asm-generic/qspinlock.h               |  2 +
> >>>>>>>>     include/asm-generic/ticket_spinlock.h         |  2 +
> >>>>>>>>     7 files changed, 66 insertions(+), 2 deletions(-)
> >>>>>>>>     create mode 100644 arch/riscv/include/asm/spinlock.h
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/features/locking/queued-spinlocks/arc=
h-support.txt b/Documentation/features/locking/queued-spinlocks/arch-suppor=
t.txt
> >>>>>>>> index 22f2990392ff..cf26042480e2 100644
> >>>>>>>> --- a/Documentation/features/locking/queued-spinlocks/arch-suppo=
rt.txt
> >>>>>>>> +++ b/Documentation/features/locking/queued-spinlocks/arch-suppo=
rt.txt
> >>>>>>>> @@ -20,7 +20,7 @@
> >>>>>>>>         |    openrisc: |  ok  |
> >>>>>>>>         |      parisc: | TODO |
> >>>>>>>>         |     powerpc: |  ok  |
> >>>>>>>> -    |       riscv: | TODO |
> >>>>>>>> +    |       riscv: |  ok  |
> >>>>>>>>         |        s390: | TODO |
> >>>>>>>>         |          sh: | TODO |
> >>>>>>>>         |       sparc: |  ok  |
> >>>>>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>>>>>>> index 184a9edb04e0..ccf1703edeb9 100644
> >>>>>>>> --- a/arch/riscv/Kconfig
> >>>>>>>> +++ b/arch/riscv/Kconfig
> >>>>>>>> @@ -59,6 +59,7 @@ config RISCV
> >>>>>>>>            select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW=
_CALL_STACK
> >>>>>>>>            select ARCH_USE_MEMTEST
> >>>>>>>>            select ARCH_USE_QUEUED_RWLOCKS
> >>>>>>>> +       select ARCH_USE_QUEUED_SPINLOCKS if TOOLCHAIN_HAS_ZABHA
> >>>>>>> Using qspinlock or not depends on real hardware capabilities, not=
 the
> >>>>>>> compiler flag. That's why I introduced combo-spinlock, ticket-spi=
nlock
> >>>>>>> & qspinlock three Kconfigs, and the combo-spinlock would compat a=
ll
> >>>>>>> hardware platforms but waste some qspinlock code size.
> >>>>>> You're right, and I think your comment matches what Conor mentione=
d
> >>>>>> about the lack of clarity with some extensions: TOOLCHAIN_HAS_ZABH=
A
> >>>>>> will allow a platform with Zabha capability to use qspinlocks. But=
 if
> >>>>>> the hardware does not, it will fallback to the ticket spinlocks.
> >>>>>>
> >>>>>> But I agree that looking at the config alone may be misleading, ev=
en
> >>>>>> though it will work as expected at runtime. So I agree with you:
> >>>>>> unless anyone is strongly against the combo spinlocks, I will do w=
hat
> >>>>>> you suggest and add them.
> >>>>>>
> >>>>>> Thanks again for your initial work,
> >>>>>>
> >>>>>> Alex
> >>>>>>
> >>>>>>>>            select ARCH_USES_CFI_TRAPS if CFI_CLANG
> >>>>>>>>            select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if SMP && MM=
U
> >>>>>>>>            select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> >>>>>>>> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/=
asm/Kbuild
> >>>>>>>> index 504f8b7e72d4..ad72f2bd4cc9 100644
> >>>>>>>> --- a/arch/riscv/include/asm/Kbuild
> >>>>>>>> +++ b/arch/riscv/include/asm/Kbuild
> >>>>>>>> @@ -2,10 +2,12 @@
> >>>>>>>>     generic-y +=3D early_ioremap.h
> >>>>>>>>     generic-y +=3D flat.h
> >>>>>>>>     generic-y +=3D kvm_para.h
> >>>>>>>> +generic-y +=3D mcs_spinlock.h
> >>>>>>>>     generic-y +=3D parport.h
> >>>>>>>> -generic-y +=3D spinlock.h
> >>>>>>>>     generic-y +=3D spinlock_types.h
> >>>>>>>> +generic-y +=3D ticket_spinlock.h
> >>>>>>>>     generic-y +=3D qrwlock.h
> >>>>>>>>     generic-y +=3D qrwlock_types.h
> >>>>>>>> +generic-y +=3D qspinlock.h
> >>>>>>>>     generic-y +=3D user.h
> >>>>>>>>     generic-y +=3D vmlinux.lds.h
> >>>>>>>> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/incl=
ude/asm/spinlock.h
> >>>>>>>> new file mode 100644
> >>>>>>>> index 000000000000..e00429ac20ed
> >>>>>>>> --- /dev/null
> >>>>>>>> +++ b/arch/riscv/include/asm/spinlock.h
> >>>>>>>> @@ -0,0 +1,39 @@
> >>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>>>>>>> +
> >>>>>>>> +#ifndef __ASM_RISCV_SPINLOCK_H
> >>>>>>>> +#define __ASM_RISCV_SPINLOCK_H
> >>>>>>>> +
> >>>>>>>> +#ifdef CONFIG_QUEUED_SPINLOCKS
> >>>>>>>> +#define _Q_PENDING_LOOPS       (1 << 9)
> >>>>>>>> +
> >>>>>>>> +#define __no_arch_spinlock_redefine
> >>>>>>>> +#include <asm/ticket_spinlock.h>
> >>>>>>>> +#include <asm/qspinlock.h>
> >>>>>>>> +#include <asm/alternative.h>
> >>>>>>>> +
> >>>>>>>> +DECLARE_STATIC_KEY_TRUE(qspinlock_key);
> >>>>>>>> +
> >>>>>>>> +#define SPINLOCK_BASE_DECLARE(op, type, type_lock)             =
        \
> >>>>>>>> +static __always_inline type arch_spin_##op(type_lock lock)     =
        \
> >>>>>>>> +{                                                              =
        \
> >>>>>>>> +       if (static_branch_unlikely(&qspinlock_key))             =
        \
> >>>>>>>> +               return queued_spin_##op(lock);                  =
        \
> >>>>>>>> +       return ticket_spin_##op(lock);                          =
        \
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +SPINLOCK_BASE_DECLARE(lock, void, arch_spinlock_t *)
> >>>>>>>> +SPINLOCK_BASE_DECLARE(unlock, void, arch_spinlock_t *)
> >>>>>>>> +SPINLOCK_BASE_DECLARE(is_locked, int, arch_spinlock_t *)
> >>>>>>>> +SPINLOCK_BASE_DECLARE(is_contended, int, arch_spinlock_t *)
> >>>>>>>> +SPINLOCK_BASE_DECLARE(trylock, bool, arch_spinlock_t *)
> >>>>>>>> +SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
> >>>>>>>> +
> >>>>>>>> +#else
> >>>>>>>> +
> >>>>>>>> +#include <asm/ticket_spinlock.h>
> >>>>>>>> +
> >>>>>>>> +#endif
> >>>>>>>> +
> >>>>>>>> +#include <asm/qrwlock.h>
> >>>>>>>> +
> >>>>>>>> +#endif /* __ASM_RISCV_SPINLOCK_H */
> >>>>>>>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup=
.c
> >>>>>>>> index 4f73c0ae44b2..31ce75522fd4 100644
> >>>>>>>> --- a/arch/riscv/kernel/setup.c
> >>>>>>>> +++ b/arch/riscv/kernel/setup.c
> >>>>>>>> @@ -244,6 +244,23 @@ static void __init parse_dtb(void)
> >>>>>>>>     #endif
> >>>>>>>>     }
> >>>>>>>>
> >>>>>>>> +DEFINE_STATIC_KEY_TRUE(qspinlock_key);
> >>>>>>>> +EXPORT_SYMBOL(qspinlock_key);
> >>>>>>>> +
> >>>>>>>> +static void __init riscv_spinlock_init(void)
> >>>>>>>> +{
> >>>>>>>> +       asm goto(ALTERNATIVE("nop", "j %[qspinlock]", 0, RISCV_I=
SA_EXT_ZABHA, 1)
> >>>>>>>> +                : : : : qspinlock);
> >>>>>>>> +
> >>>>>>>> +       static_branch_disable(&qspinlock_key);
> >>>>>>>> +       pr_info("Ticket spinlock: enabled\n");
> >>>>>>>> +
> >>>>>>>> +       return;
> >>>>>>>> +
> >>>>>>>> +qspinlock:
> >>>>>>>> +       pr_info("Queued spinlock: enabled\n");
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>>     extern void __init init_rt_signal_env(void);
> >>>>>>>>
> >>>>>>>>     void __init setup_arch(char **cmdline_p)
> >>>>>>>> @@ -295,6 +312,7 @@ void __init setup_arch(char **cmdline_p)
> >>>>>>>>            riscv_set_dma_cache_alignment();
> >>>>>>>>
> >>>>>>>>            riscv_user_isa_enable();
> >>>>>>>> +       riscv_spinlock_init();
> >>>>>>>>     }
> >>>>>>>>
> >>>>>>>>     bool arch_cpu_is_hotpluggable(int cpu)
> >>>>>>>> diff --git a/include/asm-generic/qspinlock.h b/include/asm-gener=
ic/qspinlock.h
> >>>>>>>> index 0655aa5b57b2..bf47cca2c375 100644
> >>>>>>>> --- a/include/asm-generic/qspinlock.h
> >>>>>>>> +++ b/include/asm-generic/qspinlock.h
> >>>>>>>> @@ -136,6 +136,7 @@ static __always_inline bool virt_spin_lock(s=
truct qspinlock *lock)
> >>>>>>>>     }
> >>>>>>>>     #endif
> >>>>>>>>
> >>>>>>>> +#ifndef __no_arch_spinlock_redefine
> >>>>>>>>     /*
> >>>>>>>>      * Remapping spinlock architecture specific functions to the=
 corresponding
> >>>>>>>>      * queued spinlock functions.
> >>>>>>>> @@ -146,5 +147,6 @@ static __always_inline bool virt_spin_lock(s=
truct qspinlock *lock)
> >>>>>>>>     #define arch_spin_lock(l)              queued_spin_lock(l)
> >>>>>>>>     #define arch_spin_trylock(l)           queued_spin_trylock(l=
)
> >>>>>>>>     #define arch_spin_unlock(l)            queued_spin_unlock(l)
> >>>>>>>> +#endif
> >>>>>>>>
> >>>>>>>>     #endif /* __ASM_GENERIC_QSPINLOCK_H */
> >>>>>>>> diff --git a/include/asm-generic/ticket_spinlock.h b/include/asm=
-generic/ticket_spinlock.h
> >>>>>>>> index cfcff22b37b3..325779970d8a 100644
> >>>>>>>> --- a/include/asm-generic/ticket_spinlock.h
> >>>>>>>> +++ b/include/asm-generic/ticket_spinlock.h
> >>>>>>>> @@ -89,6 +89,7 @@ static __always_inline int ticket_spin_is_cont=
ended(arch_spinlock_t *lock)
> >>>>>>>>            return (s16)((val >> 16) - (val & 0xffff)) > 1;
> >>>>>>>>     }
> >>>>>>>>
> >>>>>>>> +#ifndef __no_arch_spinlock_redefine
> >>>>>>>>     /*
> >>>>>>>>      * Remapping spinlock architecture specific functions to the=
 corresponding
> >>>>>>>>      * ticket spinlock functions.
> >>>>>>>> @@ -99,5 +100,6 @@ static __always_inline int ticket_spin_is_con=
tended(arch_spinlock_t *lock)
> >>>>>>>>     #define arch_spin_lock(l)              ticket_spin_lock(l)
> >>>>>>>>     #define arch_spin_trylock(l)           ticket_spin_trylock(l=
)
> >>>>>>>>     #define arch_spin_unlock(l)            ticket_spin_unlock(l)
> >>>>>>>> +#endif
> >>>>>>>>
> >>>>>>>>     #endif /* __ASM_GENERIC_TICKET_SPINLOCK_H */
> >>>>>>>> --
> >>>>>>>> 2.39.2
> >>>>>>>>
> >>>>>>> --
> >>>>>>> Best Regards
> >>>>>>>     Guo Ren
> >>>
> >
> >
>


--=20
Best Regards
 Guo Ren

