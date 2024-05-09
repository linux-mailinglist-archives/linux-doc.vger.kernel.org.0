Return-Path: <linux-doc+bounces-16066-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8318C082F
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 02:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 882431C20DD4
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 00:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BA79457;
	Thu,  9 May 2024 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KOBelhSM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F558C0B
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 00:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715212880; cv=none; b=c0gEIkYqSl+C4YZgQIKZ6KjpyZRmxf14OqbibLhnY/XLg+jPj6YckiAjwN+h5aarKmru2ZOmZWn5ZV/FeX4n7gFe1GwiA15YClLsLRh/VN5KFYf5IiHta7xT0n+Fv82pjdNhhDrIfQccscnDeIqlDwnEFmyNSUSHW4iZFkgZs8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715212880; c=relaxed/simple;
	bh=DdFm6FXok9o2w8ie7DArMzZHQkaaNAPPqsYf3n517R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aON4ykJZtN8Vr5xsiR4oHWa8svPtIb/YsBX6/5qH5RggvFS3GCRAZBQAcOoHn9zyufI9IXd/xC760rFWTpiIKJQHHgSQFCQ2p2wIoKmX/umwiLb7Gr+4PQ7KTFZsjvpt/l+zLNQxUiKGbTgqMM8RYsrm3GlnAi6qZV5rkk9vKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=KOBelhSM; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61804067da0so3185887b3.0
        for <linux-doc@vger.kernel.org>; Wed, 08 May 2024 17:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715212877; x=1715817677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMhzkytFcegfpjEh/i5eDjwDl8WcfrhpZN4TsMsNhbA=;
        b=KOBelhSM9yoiltZjhpi2LneWp7w8L5lrA7KSWGKRyOke4bHAGQye4ECOnygRLheaJt
         MVSfi/ZAucolX8UR3p1d3iz6MZswudylS0uRgUZjbC15Go0Dw+W3FKJCQSyHCK2GVN/B
         EfCjSX8nNHkZxrEvqMwoHLE5H0LjUdTCNVUs2F+1KU5wTN/QcUIYI2PwW7KM5nqBNyNV
         jJG36q2EMbPzs32CKRk6p3Hy/3jM6PUWS17Gdo4aivH4uzNTsSVTCWjPWVAWtBE4jo3M
         Dut5Tu/93zvIwffEovCU6MaPOUYdRVpZch1S3GEqkMtCp8FvLokecbgKbqAvDxn1I1eX
         GNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715212877; x=1715817677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMhzkytFcegfpjEh/i5eDjwDl8WcfrhpZN4TsMsNhbA=;
        b=Shg9W0BdE5TLcwLL3qm0VpBPvOPzXUUU2DmO0bOP0dVO/9FPifV/62aPBA37LBLOuv
         +DvIaP45lpAjI8Hsx971/AqZnREU7ypebsvJ4Z/Yv74+ULL65d4a0rHeN9V2P+F6Tv3T
         ArIW6wDcdQ+Mr+RADNpiaWevvRyS2crY7g8V2P5bJrCWh/Bx68OhWOzDJeLaSbNWXbju
         ZzIX85pN2/iBrxn1yjLE8mXEFtjrs4ZMFFJUvVZ5ELR4TkaE8ijctoFnJWzCrMxwPdLF
         XEJUnVPXUeJIBtB8yCzvbUrEeBWwUXAWReW6I3XumEUv+Mp43612HZpEePayeo+SBhZn
         exzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv/+ekf2pHTQaOpZOfJ2cyaKECYUxsOVqzl//xfVd9ftR8orws0DhEI5kXTTUY8IQwQ0E7zycCJTuscqu0kMeNinSpcswzP9b5
X-Gm-Message-State: AOJu0YzOTkSnuHoYQfKIUz3JwouUNz/wza4nM8VLMKN2Xk5RwTtTrzL+
	CL9O16zSAchQZGjdQCGOVtQHDCWqQwX50z+ZeXUft0ecH/Q4RMf7DXaB6N+/x5eZEU+xRyDwGIj
	BN2elYaoEnilLrYAC7G0ORDWS4rIkhvSzjj9fUA==
X-Google-Smtp-Source: AGHT+IHmVt3D1f9M2NJWrIBfKS+ywa2zQiwLNnWOiwr78hl/9CSscWihllGTFRw/No9gJ2WWzeLcgCWgz+43efCBLuQ=
X-Received: by 2002:a05:690c:6902:b0:61b:df5:7871 with SMTP id
 00721157ae682-62085c7bd51mr46770797b3.16.1715212877458; Wed, 08 May 2024
 17:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403234054.2020347-1-debug@rivosinc.com> <20240403234054.2020347-6-debug@rivosinc.com>
In-Reply-To: <20240403234054.2020347-6-debug@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 9 May 2024 08:00:00 +0800
Message-ID: <CABgGipX3vXeJ_RKnV17pE-NH6=L0XUF2sdKea7hZHbuq4skh_A@mail.gmail.com>
Subject: Re: [PATCH v3 05/29] riscv: zicfiss / zicfilp enumeration
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com, akpm@linux-foundation.org, 
	arnd@arndb.de, ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org, 
	jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com, 
	evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, dbarboza@ventanamicro.com, 
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org, 
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com, 
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de, bhe@redhat.com, 
	jeeheng.sia@starfivetech.com, cyy@cyyself.name, maskray@google.com, 
	ancientmodern4@gmail.com, mathis.salmen@matsal.de, cuiyunhui@bytedance.com, 
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, 
	david@redhat.com, catalin.marinas@arm.com, revest@chromium.org, 
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, 
	ojeda@kernel.org, jhubbard@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Deepak,

On Thu, Apr 4, 2024 at 7:41=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> wr=
ote:
>
> This patch adds support for detecting zicfiss and zicfilp. zicfiss and
> zicfilp stands for unprivleged integer spec extension for shadow stack
> and branch tracking on indirect branches, respectively.
>
> This patch looks for zicfiss and zicfilp in device tree and accordinlgy
> lights up bit in cpu feature bitmap. Furthermore this patch adds detectio=
n
> utility functions to return whether shadow stack or landing pads are
> supported by cpu.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h | 13 +++++++++++++
>  arch/riscv/include/asm/hwcap.h      |  2 ++
>  arch/riscv/include/asm/processor.h  |  1 +
>  arch/riscv/kernel/cpufeature.c      |  2 ++
>  4 files changed, 18 insertions(+)
>
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 0bd11862b760..f0fb8d8ae273 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -8,6 +8,7 @@
>
>  #include <linux/bitmap.h>
>  #include <linux/jump_label.h>
> +#include <linux/smp.h>
>  #include <asm/hwcap.h>
>  #include <asm/alternative-macros.h>
>  #include <asm/errno.h>
> @@ -137,4 +138,16 @@ static __always_inline bool riscv_cpu_has_extension_=
unlikely(int cpu, const unsi
>
>  DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
>
> +static inline bool cpu_supports_shadow_stack(void)
> +{
> +       return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
> +                   riscv_cpu_has_extension_unlikely(smp_processor_id(), =
RISCV_ISA_EXT_ZICFISS));
> +}
> +
> +static inline bool cpu_supports_indirect_br_lp_instr(void)
> +{
> +       return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
> +                   riscv_cpu_has_extension_unlikely(smp_processor_id(), =
RISCV_ISA_EXT_ZICFILP));
> +}
> +
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 1f2d2599c655..74b6c727f545 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,6 +80,8 @@
>  #define RISCV_ISA_EXT_ZFA              71
>  #define RISCV_ISA_EXT_ZTSO             72
>  #define RISCV_ISA_EXT_ZACAS            73
nit: two tabs for alignment


> +#define RISCV_ISA_EXT_ZICFILP  74
> +#define RISCV_ISA_EXT_ZICFISS  75
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index a8509cc31ab2..6c5b3d928b12 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -13,6 +13,7 @@
>  #include <vdso/processor.h>
>
>  #include <asm/ptrace.h>
> +#include <asm/hwcap.h>
>
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW     (UL(1) << (MMAP_VA_BITS - 1))
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 79a5a35fab96..d052cad5b82f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -263,6 +263,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>         __RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlin=
uxenvcfg_exts),
>         __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlin=
uxenvcfg_exts),
> +       __RISCV_ISA_EXT_SUPERSET(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xl=
inuxenvcfg_exts),
> +       __RISCV_ISA_EXT_SUPERSET(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xl=
inuxenvcfg_exts),
>         __RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>         __RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>         __RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> --
> 2.43.2
>

Thanks,
Andy

