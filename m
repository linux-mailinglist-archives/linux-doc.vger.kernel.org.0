Return-Path: <linux-doc+bounces-6380-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71148827C89
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 02:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9D921F2302E
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jan 2024 01:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28AF28F1;
	Tue,  9 Jan 2024 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="DqRomOwC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B028EC
	for <linux-doc@vger.kernel.org>; Tue,  9 Jan 2024 01:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atishpatra.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd08f0c12aso25527451fa.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jan 2024 17:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1704763500; x=1705368300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LI7RsQHT+MQ0HPpr0l5UjU5EPgbfYzbdDPhebxTuko=;
        b=DqRomOwChNh+9wD2BAnuEHziK8E+tJWZmbF4BEllrhwufIaYJjM/1E0YICBCil6hAB
         ltk/+uwhEhc5W+6yVhV2CN4YTWOupPYgyOiixwUw9QPncIw8GjpPGHEpIOOvV/f+RcHj
         CS2kSauOfEogy+pjFccJD+VeTHmhxDOIZNBXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704763500; x=1705368300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LI7RsQHT+MQ0HPpr0l5UjU5EPgbfYzbdDPhebxTuko=;
        b=Jnqrub6tKuvRMNv7a5bFZDKERtzISadgUWj0H0TOxJC2TlvR2nWe8zX/tRvyqVUP4a
         p2oifGrv302LMU7pmV463FZQQlIf7xDFRcZDX9UMKZefpFD5d7O51mrGBKffgf0b+db1
         FUyhJpwsNBWnTKyEzR3e3TKTstbe0VfdXO8Tn+l2uOk4ga7BqM5KIKo/mFlFndPC3V1d
         MczwbTXSkyAkMd5o7XeBiN7XEN4Q921ALd2dj2/MgAgTmQU0cs18o1HHF0gk+uzbcJL2
         t5v7lxxP6Eatj4CaBdYtDnwXb8lu/kC5vij4tH8FhQG+SxUGqevmVyXadEwDjvZFfLNH
         7KiA==
X-Gm-Message-State: AOJu0YyNGhtDU10ixfY2WLdemKVpZBQe62LR4r9beBN5hqGC10oVsLzF
	jUqsKdA1yJG+1/gvXRN1yx8oG+QymKmnMA4W5u0wFLUSZOm3
X-Google-Smtp-Source: AGHT+IEflcpw5PPeAqRFQj+i1KPY2cKdFJ6LjrWaNQDuSU8haUzGWHGve+ARfSRu5qj9ZC0cKrYONFwvq/ROkyUWIr8=
X-Received: by 2002:a2e:9212:0:b0:2cc:da2a:d266 with SMTP id
 k18-20020a2e9212000000b002ccda2ad266mr1270020ljg.71.1704763500076; Mon, 08
 Jan 2024 17:25:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com> <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com>
In-Reply-To: <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 8 Jan 2024 17:24:47 -0800
Message-ID: <CAOnJCUJQ-M1bVC_VhogMLo47mRyk3Pzq-GFH5P7ADn70BN9ObA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX
 prctl
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 10:42=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> Provide documentation that explains how to properly do CMODX in riscv.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/arch/riscv/cmodx.rst | 88 ++++++++++++++++++++++++++++++++=
++++++
>  Documentation/arch/riscv/index.rst |  1 +
>  2 files changed, 89 insertions(+)
>
> diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/risc=
v/cmodx.rst
> new file mode 100644
> index 000000000000..afd7086c222c
> --- /dev/null
> +++ b/Documentation/arch/riscv/cmodx.rst
> @@ -0,0 +1,88 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +Concurrent Modification and Execution of Instructions (CMODX) for RISC-V=
 Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +CMODX is a programming technique where a program executes instructions t=
hat were
> +modified by the program itself. Instruction storage and the instruction =
cache
> +(icache) are not guaranteed to be synchronized on RISC-V hardware. There=
fore, the
> +program must enforce its own synchronization with the unprivileged fence=
.i
> +instruction.
> +
> +However, the default Linux ABI prohibits the use of fence.i in userspace
> +applications. At any point the scheduler may migrate a task onto a new h=
art. If
> +migration occurs after the userspace synchronized the icache and instruc=
tion
> +storage with fence.i, the icache will no longer be clean. This is due to=
 the
> +behavior of fence.i only affecting the hart that it is called on. Thus, =
the hart
> +that the task has been migrated to may not have synchronized instruction=
 storage
> +and icache.
> +
> +There are two ways to solve this problem: use the riscv_flush_icache() s=
yscall,
> +or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
> +userspace. The syscall performs a one-off icache flushing operation. The=
 prctl
> +changes the Linux ABI to allow userspace to emit icache flushing operati=
ons.
> +
> +prctl() Interface
> +---------------------
> +
> +Call prctl() with ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` as the first argumen=
t. The
> +remaining arguments will be delegated to the riscv_set_icache_flush_ctx
> +function detailed below.
> +
> +.. kernel-doc:: arch/riscv/mm/cacheflush.c
> +       :identifiers: riscv_set_icache_flush_ctx
> +

Document the arguments of the prctl as well ?

> +Example usage:
> +
> +The following files are meant to be compiled and linked with each other.=
 The
> +modify_instruction() function replaces an add with 0 with an add with on=
e,
> +causing the instruction sequence in get_value() to change from returning=
 a zero
> +to returning a one.
> +
> +cmodx.c::
> +
> +       #include <stdio.h>
> +       #include <sys/prctl.h>
> +
> +       extern int get_value();
> +       extern void modify_instruction();
> +
> +       int main()
> +       {
> +               int value =3D get_value();
> +               printf("Value before cmodx: %d\n", value);
> +
> +               // Call prctl before first fence.i is called inside modif=
y_instruction
> +               prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_F=
ENCEI, 0);
> +               modify_instruction();
> +
> +               value =3D get_value();
> +               printf("Value after cmodx: %d\n", value);
> +               return 0;
> +       }
> +
> +cmodx.S::
> +
> +       .option norvc
> +
> +       .text
> +       .global modify_instruction
> +       modify_instruction:
> +       lw a0, new_insn
> +       lui a5,%hi(old_insn)
> +       sw  a0,%lo(old_insn)(a5)
> +       fence.i
> +       ret
> +
> +       .section modifiable, "awx"
> +       .global get_value
> +       get_value:
> +       li a0, 0
> +       old_insn:
> +       addi a0, a0, 0
> +       ret
> +
> +       .data
> +       new_insn:
> +       addi a0, a0, 1
> diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/risc=
v/index.rst
> index 4dab0cb4b900..eecf347ce849 100644
> --- a/Documentation/arch/riscv/index.rst
> +++ b/Documentation/arch/riscv/index.rst
> @@ -13,6 +13,7 @@ RISC-V architecture
>      patch-acceptance
>      uabi
>      vector
> +    cmodx
>
>      features
>
>
> --
> 2.43.0
>


--
Regards,
Atish

