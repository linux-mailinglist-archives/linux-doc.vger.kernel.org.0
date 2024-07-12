Return-Path: <linux-doc+bounces-20563-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1292F1FA
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2024 00:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449541F27050
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 22:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6551C155CB5;
	Thu, 11 Jul 2024 22:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pRSiG+Wo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933AA155CA5
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 22:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737145; cv=none; b=n6by75bRU3jl2MEibj7GnkqeVpyWrM79Z1xt3rfeT4FOyZOQ2YJPxAxkOVUdQDS5pze4noqKvFxfbhqi5d2Uq0SfG+yKK8B0cBAR7egCAfmDoPyFynLUDzCiZPuLsU8dDcHAHZp9XEqOtbFx2b+JWy2fN4h7OtpMrWlbo2LztS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737145; c=relaxed/simple;
	bh=7ljcq76C8TMYD8pb0/jAqQch4p6OsUcCuUB1KLfr8pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdVofMDKwH7uSc417/ghsqiABklSUTFcZsnP0T0L97X2T89BENvJ/jQKrj4NKy/WYe7lPe/bY9zO5PFiRY+Wvo8Q+Gry5JY8YvfQhichNVuTJFUexUimz4xI+TF3pUJawTADWZlZk7h5YSjYlmNfs2C9oUcwbe232YPF91vEhnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pRSiG+Wo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c980b08b4bso1127553a91.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 15:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720737143; x=1721341943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz6SMaKbxQM/TiE/u9HESjvtjN+gL/cg2Eq0PvwsdLA=;
        b=pRSiG+Wo/dfUCCMYeLHdwR2hPCSivx+WfWBA2zEwJ3+oSHLwEfzOWq9dSdhqenXcbN
         Pf//x14dj3nPQe3O8UNxgZJH4bhT10R60u0r+z7hA1gaaj5F5beRRzeZ1IrybUqDtP6q
         0QUgUHrh/6MwVEn1OOoSrRt9C2H1UaGHbcBI3DQZL98cfSrNqFEZzZTJnFl3RIXn3fty
         6w8qGMOUwvtn7qq3KDiZZOAjHwJkoaxMjNuGKeeuk3dnSP5dpTNFjSgOaFTM9mx5tnk+
         JiwukoPdqzqZ8uftIvbvQh1g0zEFbABRBkw4dkRRD5BYar/YsgYGIcEJGzOCZQ+sb8u/
         a9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720737143; x=1721341943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz6SMaKbxQM/TiE/u9HESjvtjN+gL/cg2Eq0PvwsdLA=;
        b=c6ub8S0CZucP1He/jqOryqfioXRhZsOVnwxiEJ1mO/rBO6ahxNq4FVH2PLSJfNqToS
         aSekeA9PKh/pxegIzKY3WbhzT/JOIM96L007/zqsu9krWHn1Vq9JrKKPxoNJlOncg4S/
         hJ+6E1cwGT201nWMz5srWD467wA38z+kgLfIly0OMpB0Wzpus65l3IdnH9mKedchLwA7
         fUOY/U3OWNqmmWXe2wL3ihZ3RN+kUrfs4ykJLr1TzTOjmMxCM0Y1HITJJ4bl+vA9EuYd
         JGyJKv1HN3a8kMyzzDdZMJZjSl0EypJVqlNsw8JoVTXCkVD06O0H/F162P+9KMu04ocM
         ievA==
X-Forwarded-Encrypted: i=1; AJvYcCXMiYMAG7/Z8XAjF+hPquyI2R37p/00d7EtSjKo7Zq0eVickH8IZajxlKQRKNAVsuZjtjIiio2wvm0KnbsrJPKkgNpgtKuIE5d+
X-Gm-Message-State: AOJu0YyTiurZVcrCL+ZW1PCwzIypxVaDetCnHEs/bghrc6qbHaqJ5Ndl
	T1WQtlibRok8eldlhY6tdNIlqLiRTia7hvIRzS2PDQZvcmrrPOeTc4kinS6Uv+k=
X-Google-Smtp-Source: AGHT+IEb8eWHUw5IrIXidt2Niw54kyg/KUv5N5U3VVq6KgJ0Y3khzK6QMTtYunRfJ9U+b2MVWWdxsg==
X-Received: by 2002:a17:90b:1191:b0:2c7:c6c4:1693 with SMTP id 98e67ed59e1d1-2ca35c788a9mr8554667a91.21.1720737142825;
        Thu, 11 Jul 2024 15:32:22 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd7027b5sm98687a91.54.2024.07.11.15.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:32:22 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:32:19 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/7] RISC-V: Detect and report speed of unaligned
 vector accesses
Message-ID: <ZpBdc9bCrAPWmhEz@ghost>
References: <20240711215846.834365-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>

On Thu, Jul 11, 2024 at 05:58:39PM -0400, Jesse Taube wrote:
> Adds support for detecting and reporting the speed of unaligned vector
> accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
> adds Zicclsm to cpufeature and fixes the check for scalar unaligned
> emulated all CPUs. The vec_misaligned_speed key keeps the same format
> as the scalar unaligned access speed key.
> 
> This set does not emulate unaligned vector accesses on CPUs that do not
> support them. Only reports if userspace can run them and speed of
> unaligned vector accesses if supported.
> 
> If Zicclsm is present, the kernel will set both scalar and vector unaligned access speed to FAST.

Now that we have unfortunately realized that Zicclsm is not useful, this
patch no longer does this check, and doesn't use the Zicclsm bindings
in patch 1 and 2. This could be split out into a separate series, but
it's probably fine to leave the bindings in this series.

> 
> This patch requires the following patche to be applied first:
> RISC-V: fix vector insn load/store width mask
> https://lore.kernel.org/all/20240606182800.415831-1-jesse@rivosinc.com/
> 
> V1 -> V2:
>  - New patch: dt-bindings: riscv: Add Zicclsm ISA extension description.
>  - New patch: RISC-V: Check scalar unaligned access on all CPUs
>  - New patch: RISC-V: hwprobe: Document unaligned vector perf
> V2 -> V3:
>  - New patch: RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
>  - Split patch: RISC-V: Check scalar unaligned access on all CPUs
>  - New patch: RISC-V: Check Zicclsm to set unaligned access speed
> V3 -> V4:
>  - Drop patch: RISC-V: Check Zicclsm to set unaligned access speed
> 
> Jesse Taube (7):
>   RISC-V: Add Zicclsm to cpufeature and hwprobe
>   dt-bindings: riscv: Add Zicclsm ISA extension description.
>   RISC-V: Check scalar unaligned access on all CPUs
>   RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
>   RISC-V: Detect unaligned vector accesses supported
>   RISC-V: Report vector unaligned access speed hwprobe
>   RISC-V: hwprobe: Document unaligned vector perf key
> 
>  Documentation/arch/riscv/hwprobe.rst          |  21 +++
>  .../devicetree/bindings/riscv/extensions.yaml |   7 +
>  arch/riscv/Kconfig                            |  57 ++++++-
>  arch/riscv/include/asm/cpufeature.h           |   7 +-
>  arch/riscv/include/asm/entry-common.h         |  11 --
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/hwprobe.h              |   2 +-
>  arch/riscv/include/asm/vector.h               |   1 +
>  arch/riscv/include/uapi/asm/hwprobe.h         |   6 +
>  arch/riscv/kernel/Makefile                    |   3 +-
>  arch/riscv/kernel/copy-unaligned.h            |   5 +
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  arch/riscv/kernel/fpu.S                       |   4 +-
>  arch/riscv/kernel/sys_hwprobe.c               |  42 +++++
>  arch/riscv/kernel/traps_misaligned.c          | 134 ++++++++++++++--
>  arch/riscv/kernel/unaligned_access_speed.c    | 148 +++++++++++++++++-
>  arch/riscv/kernel/vec-copy-unaligned.S        |  58 +++++++
>  arch/riscv/kernel/vector.c                    |   2 +-
>  18 files changed, 472 insertions(+), 38 deletions(-)
>  create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
> 
> -- 
> 2.45.2
> 

