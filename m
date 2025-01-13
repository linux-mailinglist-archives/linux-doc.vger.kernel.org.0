Return-Path: <linux-doc+bounces-35020-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC3A0B5C2
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 12:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94FA03A95BC
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 11:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B348922CF29;
	Mon, 13 Jan 2025 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="emuyriMm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345622CF0D
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767794; cv=none; b=tokTiNlUjVdStIliuoyg04j8s9uCVuCG2/LR62SnDS323lvcCStW47/dllggmsUtODUMJNzNZGFHer43EGuTG50XBJl1JMIctPkRH2uVZVaeLgaU5XWZIhRztrf5K6zJbn+u3Vf1j80+hKf9usxAcWOmFT/BzRVMsvxmICJPRdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767794; c=relaxed/simple;
	bh=HsY4lN9JnVDWPfE+u6AprMygYjbd//6tBydPZAXXZ18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGSuzxvYNYpQvTh9Rp8XoKMlRjjhecGEaE7e9DmjmpOtE+fYaDhgzNPbW4wbJzheCNLxhXlcY3JAzwNUjFNZ3hVNz4gj9nnzr1WRFMyyAOxFhtBbR8wVoVf+vAkotcODnXplXWy7kljz6xkuQMgLGSI4YI1Pmnf3GVTdJM4XGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=emuyriMm; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2aa179a8791so2612055fac.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 03:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736767791; x=1737372591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1oNLuALwfKPcxcMaw300mn/ndsMj7w+nf7EvNjeH1I=;
        b=emuyriMm/C7/XoxQY6VV9GAQcvAXhcO2RZ9lDYsleSpkI06KDCH/xkshN4L76J1VN7
         PDlGk0Xta6CTA666VYhopaOhPyJ5BD5WQVbu/+PvHUwneF9RwkESyBuNiOhnEwPz3cQt
         7vjppbHcXVCrzDV58HT0eZ4ak2l8S3kRkvgUYvkwFl0qK8aR3qnwxD/99FvJXmjhWMd4
         7Ci5TYdDTu7mrlBf971TiuAbi+F7KKey4wSRAWu/XydaRBIyvs/K5hq+wx+EW8uLqb4m
         UvC5swV4rQzvJm42YHWZ8mlIcVJsc2jP7pEnN9RxZ6Uj6JvNGUl8IEX0hLmMZbJivtuW
         thsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767791; x=1737372591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1oNLuALwfKPcxcMaw300mn/ndsMj7w+nf7EvNjeH1I=;
        b=gVRXjndzwXqJVugNf8HRcxYUK4SO4iUOqomT+FRew1euiEwD8k0kGvBJeWD9S8aKJS
         hIB/HYmYtv+Rnj565mgZzJKrQiyaH4xKC0CkoetfwXe6TbszNM0LE2opCKfrzSzlrv67
         gf3r0E19bA8ynGW0NJp8L16o/9Z+YJ8s8vMofW3przVwvWDiaH96B/8DnVHJDlEpgo2r
         Rkr2r0ais3svjyy2v+iwkcqHtTI5p8ssuEhD3WFel/eSyHGm/4zLeWwO/Qjz5QXgQBOZ
         yew5IibGW7eKJygaEAHHWk3EYYPM1J8nqQMYGM+4ArKmR2vSQ+YX1Jb44iORfpkuB+g8
         YHpw==
X-Forwarded-Encrypted: i=1; AJvYcCUCHkzPUW55sJufbBgsZYRbncQ1KJEo2yvKPEf3B0eIhpoo7nfgkovfN03Uzn/be4BqTfIPPh4Clz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNpSqPbrMiq62hIsMQgLxMOZgiG524bHCuivFdUO3nU7QM29D
	blULSurnHyCO1ZOQESVBbv5hlvRLXrWt2mtS3v7dC+e7NIRYK5dyU5UbZQ5DgLDioS2XDk2PvXg
	g78Oy/TYuvTBgmgClEZ5zBweEoTWjpoo8+Bfl4A==
X-Gm-Gg: ASbGncsrcu2dwC317I/x91Ncpxg9YyXMU+8o/H3Y+JNcfkVPI64yIW8qc+zH0YJixZD
	c1fBsnPR7+bwx3YaImtNzfULTXstpXxTgKEthqZXg
X-Google-Smtp-Source: AGHT+IFy17OZn7f/tSfO2jEbRT7YAGzCK+oRC58OSKvdfFecQunHYY4uItTShRvfINeTtd4YufQ5rkoxaECN8na/eBk=
X-Received: by 2002:a05:6871:581e:b0:2a3:c59d:f09d with SMTP id
 586e51a60fabf-2aa066ee020mr12295921fac.14.1736767790649; Mon, 13 Jan 2025
 03:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-2-cuiyunhui@bytedance.com> <20250113-65f27ad723c0f6585f86ae7f@orel>
In-Reply-To: <20250113-65f27ad723c0f6585f86ae7f@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 13 Jan 2025 19:29:39 +0800
X-Gm-Features: AbW1kvbpyOAFPxL3X1Ko2GPHhJdVip_TGmXjyMWfNjCUNBIKd-MlEVf9Wb9TG1Q
Message-ID: <CAEEQ3w=fgb7Jxg6SP_hp0Z+T0Tfb-_Pa4-CzU8PpGUKA+dHxyA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi drew,

On Mon, Jan 13, 2025 at 5:07=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Mon, Jan 13, 2025 at 04:36:34PM +0800, Yunhui Cui wrote:
> > Expose Zicbom through hwprobe and also provide a key to extract its
> > respective block size.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
> >  arch/riscv/include/asm/hwprobe.h      | 2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
> >  4 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index 955fbcd19ce9..7a47cbdbcf8e 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -94,6 +94,9 @@ The following keys are defined:
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is suppo=
rted, as
> >         ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv=
-CMOs.
> >
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is suppo=
rted, as
> > +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv=
-CMOs.
> > +
>
> This should come after RISCV_HWPROBE_EXT_SUPM since this document has the
> defines sorted in the order in which they are introduced (although I
> personally wouldn't mind if we ordered them alphabetically instead)
OK

>
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, a=
s defined
> >         in version 1.0 of the Bit-Manipulation ISA extensions.
> >
> > @@ -273,6 +276,9 @@ The following keys are defined:
> >  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int whic=
h
> >    represents the size of the Zicboz block in bytes.
> >
> > +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int whic=
h
> > +  represents the size of the Zicbom block in bytes.
> > +
>
> Should be moved below RISCV_HWPROBE_KEY_TIME_CSR_FREQ

Why should it be moved below RISCV_HWPROBE_KEY_TIME_CSR_FREQ?


> >  * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long =
which
> >    represent the highest userspace virtual address usable.
> >
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/=
hwprobe.h
> > index 1ce1df6d0ff3..89379f9a2e6e 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,7 @@
> >
> >  #include <uapi/asm/hwprobe.h>
> >
> > -#define RISCV_HWPROBE_MAX_KEY 10
> > +#define RISCV_HWPROBE_MAX_KEY 11
> >
> >  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >  {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 3af142b99f77..892dd71a3793 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -73,6 +73,7 @@ struct riscv_hwprobe {
> >  #define              RISCV_HWPROBE_EXT_ZCMOP         (1ULL << 47)
> >  #define              RISCV_HWPROBE_EXT_ZAWRS         (1ULL << 48)
> >  #define              RISCV_HWPROBE_EXT_SUPM          (1ULL << 49)
> > +#define              RISCV_HWPROBE_EXT_ZICBOM        (1ULL << 50)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0  5
> >  #define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >  #define              RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> > @@ -90,6 +91,7 @@ struct riscv_hwprobe {
> >  #define              RISCV_HWPROBE_MISALIGNED_SCALAR_FAST            3
> >  #define              RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED     4
> >  #define RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF     10
> > +#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE  11
>
> Move below the bit defines of RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF
> (notice how its bit defines are indented, indicating they belong to it)
OK

>
> >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN         0
> >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW            2
> >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_FAST            3
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index cb93adfffc48..affcc3e58df9 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> >               EXT_KEY(ZCB);
> >               EXT_KEY(ZCMOP);
> >               EXT_KEY(ZICBOZ);
> > +             EXT_KEY(ZICBOM);
>
> This list is in alphabetical order, which means ZICBOM should come before
> ZICBOZ.
OK

>
> >               EXT_KEY(ZICOND);
> >               EXT_KEY(ZIHINTNTL);
> >               EXT_KEY(ZIHINTPAUSE);
> > @@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe =
*pair,
> >               if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
> >                       pair->value =3D riscv_cboz_block_size;
> >               break;
> > +     case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
> > +             pair->value =3D 0;
> > +             if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
> > +                     pair->value =3D riscv_cbom_block_size;
> > +             break;
> >       case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
> >               pair->value =3D user_max_virt_addr();
> >               break;
> > --
> > 2.39.2
> >
>
> Thanks,
> drew

Thanks,
Yunhui

