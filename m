Return-Path: <linux-doc+bounces-18142-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 916DA90274C
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 18:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3D31F2288D
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 16:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3521509BD;
	Mon, 10 Jun 2024 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="mlTapbJx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1314B967
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038256; cv=none; b=uaZv3gR1GQfs2KCIpXVAktzxT/dwxc2N3hta8M8jszZOiP4NhPkQvCy1pEowh3x2Ky4yEmOsC0WtSglGghdQrVZKlfT8sbu92iHPkLqFrxPX9ZgWq3qbmg1VufA3Dz2FLocFJzZIziVUXsmnza2sAaRBZwECJUnYWsPA+Ate1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038256; c=relaxed/simple;
	bh=xH3hKQqms7rJx4v+wnLM1MmS11+7mqDvvvLcx+CHLIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGTE6ZNSmyT4gldr2bj4qCtPuVS4gdk7NxR/yMCrQeqMTF9x1+2FlJqYxEynrChCLx1/NwULL3WcwnujOor55QjC3EAq7lvO4AgHcL9reBWw+W6jChVYp/H0xeOj62IVxNCuEJDiJMCnR87jGmZqHGbAxjc+ufNgnWR0A/vP4bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=mlTapbJx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6f177b78dcso184503666b.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718038252; x=1718643052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3CvU2+4Pp+gJs/m0S3akbCT1HtMsWu1kYlbd4/2dvU=;
        b=mlTapbJxtYYogMILHAFVEsc2AqRyLoCJV3zCJ9J/cza3YbQ4u7HrLUQkdtClNlb4dD
         fqZnSRkYfGkSIdx8kB5R/6T7CQ7mz2A+SzSi+f4vOOkDiuMKuUzW0N7RMm/iTEszu4p2
         4qWGlJXy/4vLnavbFth8nsy4Pcd4bCZkm16geEuVgNm/WB4H2nNfxYCRoXA+U0DpjsVq
         VO9fMASzmpf2zGpIa1AWtnSwGiv8aAH+ib7flJP79elteQOVK9m61ZLKwDfYJJlaT88/
         DMN5SOVk25LYnq9hjPQh1DsEQ8cDJNg9tj7CtBxFc+8QKRKKhlUuJEhFoYiD0LtJnx5S
         VlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718038252; x=1718643052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3CvU2+4Pp+gJs/m0S3akbCT1HtMsWu1kYlbd4/2dvU=;
        b=VUstgiEHidEzOIBDiStF6+8s7/oIWouZdr8yTKWA/Il9hei5MG3R1oSY2/rbzhhG27
         2BU5qd+mTmFIrV/oDa8uoOmFeyZGzgkOyFgu5h6E5m6zHYl+oQ7XDoq5Fr6qp8+pJli+
         scZv0X9dBh+PAKKGUQ+R5hklv0YFUP4tFrry14Ec8fpFltwI7gXSjfVT88uKTNXK4uNT
         kpeVmGH6AN+1Y+VCYmIxbjUAVy/9PqlZdrw/gSJcqkrcsjNrn8A4qd+ysrY0HB1oJt8E
         SRNQoCsKyChxnu8vYR4ABB34OWi8M925tcSWXfYo1TugT+ZPD5bt9vaq7iusqIczcUua
         Acsg==
X-Forwarded-Encrypted: i=1; AJvYcCVYR8zN+OhK0VEeMvNRAdoaBPnzsIg7knfCTdayba0mZANH4fOTBmaoEZuMZqXjxDqoGjaPqatFWrp3UjjfJDKEZb3/g0eDAy8/
X-Gm-Message-State: AOJu0Ywp66mxnRMGN3yfgPi3XApyVytchhk0V9M3qSGuLi6Jncu/JKli
	J9nqL0thddUb7ZeSGrXGz1aGK7TRF/DWDPjISncPPji2sOQeONpgoeZ3+DnRRGfqTX+rbpQYm5i
	2q9dCEVqkZlWfi8WohfZIV2FfK8CbXfWmy+2ocQ==
X-Google-Smtp-Source: AGHT+IGXGuIQA06ggIa7WUkyS+qpZAhdyv14xr5Qaj3dvR4PDpZ6pVMzgpmyrwPmfFam1PGSgnbhdyUr2qfE6KexKIM=
X-Received: by 2002:a17:906:228b:b0:a6e:f62d:bd02 with SMTP id
 a640c23a62f3a-a6ef62dbe00mr436200766b.7.1718038252570; Mon, 10 Jun 2024
 09:50:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com> <20240609-xtheadvector-v1-10-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-10-3fe591d7f109@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 10 Jun 2024 09:50:16 -0700
Message-ID: <CALs-HssK3p7yiOg1P_f+xw_b2kFtMX8wQRkM1-RMOTdsgh9zKQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] riscv: hwprobe: Add thead vendor extension probing
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 9, 2024 at 9:45=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> vendor extension.
>
> This new key will allow userspace code to probe for which thead vendor
> extensions are supported. This API is modeled to be consistent with
> RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> corresponding to a supported thead vendor extension of the cpumask set.
> Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> to determine all of the supported thead vendor extensions in one call.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>

You can continue to keep my tag, but I came up with some nits to pick anywa=
y.

> ---
>  arch/riscv/include/asm/hwprobe.h                   |  4 +--
>  .../include/asm/vendor_extensions/thead_hwprobe.h  | 18 +++++++++++
>  .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++=
++++++
>  arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>  arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>  arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
>  arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>  .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
>  8 files changed, 87 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hw=
probe.h
> index 630507dff5ea..e68496b4f8de 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _ASM_HWPROBE_H
> @@ -8,7 +8,7 @@
>
>  #include <uapi/asm/hwprobe.h>
>
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/a=
rch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> new file mode 100644
> index 000000000000..925fef39a2c0
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +
> +#include <linux/cpumask.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus);
> +#else
> +static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *=
pair, const struct cpumask *cpus)
> +{
> +       pair->value =3D 0;
> +}
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h b/=
arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> new file mode 100644
> index 000000000000..b6222e7b519e
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2024 Rivos, Inc
> + */
> +
> +#ifndef _ASM_RISCV_SYS_HWPROBE_H
> +#define _ASM_RISCV_SYS_HWPROBE_H
> +
> +#include <asm/cpufeature.h>
> +
> +#define EXT_KEY(ext)                                                    =
               \

Nit: Do you think it should be VENDOR_EXT_KEY? I had a slight ping of
worry that the identifier sounds so generic it might conflict with
something later, but meh maybe it's fine.


> +       do {                                                             =
               \
> +               if (__riscv_isa_extension_available(isainfo->isa, RISCV_I=
SA_VENDOR_EXT_##ext)) \
> +                       pair->value |=3D RISCV_HWPROBE_VENDOR_EXT_##ext; =
                 \
> +               else                                                     =
               \
> +                       missing |=3D RISCV_HWPROBE_VENDOR_EXT_##ext;     =
                 \
> +       } while (false)
> +
> +/*
> + * Loop through and record extensions that 1) anyone has, and 2) anyone
> + * doesn't have.
> + *
> + * _extension_checks is an arbitrary C block to set the values of pair->=
value
> + * and missing. It should be filled with EXT_KEY expressions.
> + */
> +#define VENDOR_EXTENSION_SUPPORTED(pair, cpus, per_hart_thead_bitmap, _e=
xtension_checks)       \

Nit: This macro was meant to be generic for all vendors, but you've
named one of the parameters per_hart_thead_bitmap. :)

> +       do {                                                             =
                       \
> +               int cpu;                                                 =
                       \
> +               u64 missing;                                             =
                       \
> +               for_each_cpu(cpu, (cpus)) {                              =
                       \
> +                       struct riscv_isavendorinfo *isainfo =3D &(per_har=
t_thead_bitmap)[cpu];    \
> +                       _extension_checks                                =
                       \
> +               }                                                        =
                       \
> +               (pair)->value &=3D ~missing;                             =
                         \
> +       } while (false)                                                  =
                       \
> +
> +#endif /* _ASM_RISCV_SYS_HWPROBE_H */
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index dda76a05420b..155a83dd1cdf 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _UAPI_ASM_HWPROBE_H
> @@ -68,6 +68,7 @@ struct riscv_hwprobe {
>  #define                RISCV_HWPROBE_MISALIGNED_UNSUPPORTED    (4 << 0)
>  #define                RISCV_HWPROBE_MISALIGNED_MASK           (7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE    6
> +#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0   7
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
>  /* Flags */
> diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/incl=
ude/uapi/asm/vendor/thead.h
> new file mode 100644
> index 000000000000..43790ebe5faf
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/vendor/thead.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#define                RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR   (1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 969ef3d59dbe..e39fa70083d3 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -13,6 +13,7 @@
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
>  #include <asm/vector.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <vdso/vsyscall.h>
>
>
> @@ -217,6 +218,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *p=
air,
>                         pair->value =3D riscv_cboz_block_size;
>                 break;
>
> +       case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
> +               hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> +               break;
> +
>         /*
>          * For forward compatibility, unknown keys don't fail the whole
>          * call, but get their element key set to -1 and value set to 0
> diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/ke=
rnel/vendor_extensions/Makefile
> index 353522cb3bf0..866414c81a9f 100644
> --- a/arch/riscv/kernel/vendor_extensions/Makefile
> +++ b/arch/riscv/kernel/vendor_extensions/Makefile
> @@ -2,3 +2,4 @@
>
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)       +=3D andes.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)       +=3D thead.o
> +obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)       +=3D thead_hwprobe.o
> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/r=
iscv/kernel/vendor_extensions/thead_hwprobe.c
> new file mode 100644
> index 000000000000..53f65942f7e8
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/vendor_extensions/thead.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
> +#include <asm/vendor_extensions/vendor_hwprobe.h>
> +
> +#include <linux/cpumask.h>
> +#include <linux/types.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +#include <uapi/asm/vendor/thead.h>
> +
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const st=
ruct cpumask *cpus)
> +{
> +       VENDOR_EXTENSION_SUPPORTED(pair, cpus,
> +                                  riscv_isa_vendor_ext_list_thead.per_ha=
rt_isa_bitmap, {
> +               EXT_KEY(XTHEADVECTOR);
> +       });
> +}
>
> --
> 2.44.0
>

