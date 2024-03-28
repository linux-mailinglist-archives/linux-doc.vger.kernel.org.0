Return-Path: <linux-doc+bounces-12887-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2BC88EFA3
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 21:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FEC22A37A1
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 20:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693E612FB01;
	Wed, 27 Mar 2024 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WizOzDa9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D432152501
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569721; cv=none; b=IAFnTSbxIH37mHRJPSyqIH6G4ZpjrKebc4Bht/VFWZAkdITNditFUhi1xVb6xQ8hc4GLCxue3LJ3Ps0wVGeBLyvC808jDwLQZ9JLXrLDdgMGALs1M011fvsRUL9gLn5VfvbdPgmfCpMw3+mCvv2zVoP3Q51WmY3lSfEeX6482Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569721; c=relaxed/simple;
	bh=MzwBpy2FuowxhCGi0F1on+TpS6xpOXjA8uce1NQoqH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAQp64TbX64kduI/dvyDYJaNGFlUGruou1uTo/VdVjcqs09z9AE7YFbW/x/gE9/I/HxncIMNgLe2zZEzjFzJTTglJUN+P0dwXQoEBAkepJ0cJj8yUOVgy+yEd/6+lNB5lO18TdJKCozSHsVUtF4KDPkvJYA5lclMZikxv2xO1UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=WizOzDa9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1def89f0cfdso10666995ad.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569719; x=1712174519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfyGhgpaDuL/FUm+Bqequ3n7X/gQ/Scu0/x5tn5zB10=;
        b=WizOzDa9JjhTEYikaMo4F8SCFZQ9c2Wmz8LDwWF8Z7VEfyLONs5YYi0/W9/JQQRUi9
         7hoiP5RIhsTLS8xv/yQxHbnZ6InbCAa8RRFjvJnryxwByU9seqoNxKECv/MMndvZHrrg
         0KfafrjHArMGjG6ySWDA7H80dfOY7VycCyZoBFeNjPTSvvkiGnFkJxu1sdKq/D0ETiM5
         yp+HmHj7RjiIATWazr9YGiEpRVdxsEgXAyU8JnBWbpws9+ydUFkcP+Am7gIZJ9w7HvBy
         qg856e7fk99N2e5CtTIjl/hHL9Q/Pa7ciSc6yEwh3ZCKAcKt8ECCVlODeMCY65IEYp61
         tVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569719; x=1712174519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfyGhgpaDuL/FUm+Bqequ3n7X/gQ/Scu0/x5tn5zB10=;
        b=dDbuqqTvQK3ICHcgqbsQOuUAKXbmNrwW18TpyR35IL6yGSrka/PsrKMrdIHmo4OnF3
         kDitOa1f1T3MCkf4c8Mc6vN3RNja2w+8ug3F2SetUrWM5VdbgicgP2pq7ykDPc+HpFbw
         PlKuwNvcI8zeZBpGx6OhFGlRs4XD0lACyGlwVKfI2ORjqWUPQVJKgL5QaHN3UBrW9bGF
         dCmKZTOo25PevqHFvTNdBuV41TRovLzQ3EBcJHv+txZ3wamSxeInmwJZ9oYxl2B9vgZq
         ld7/rPKEGTCQ8MIdxJbfKPkAS48VpD/sOAKuauj+yBkaN1tga909VB+vCEmtykr9tgDy
         96Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVRF/vPh896uapkxVZO4mtieVV1yaJ0ZMzvLoofRZb7x12Gdp8GglgyYeKfbd2CSPmFYSMo6RIIIu8IzcWX8RR4GvrnpGbGRWCc
X-Gm-Message-State: AOJu0Yx0+LPFHWii1KXscOMgT5s3gETxs6acgVuwxglU5l9ikL1UtNVx
	tINqNEsydzI6PXz2vbJE3EkQRtGR5pcuKSdrNB8nY0ASk1yBTmhHOQSItzd+3ZY=
X-Google-Smtp-Source: AGHT+IEARU4E/EcVAHx8vARVbt2kMjNg+KIZramOtQSdDofKvpaWh4CU2DiZjPQFyzvcMxh9ySg0ww==
X-Received: by 2002:a17:902:d2cc:b0:1e0:e011:e3cb with SMTP id n12-20020a170902d2cc00b001e0e011e3cbmr442983plc.15.1711569718923;
        Wed, 27 Mar 2024 13:01:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:01:58 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 00/14] Unified cross-architecture kernel-mode FPU API
Date: Wed, 27 Mar 2024 13:00:31 -0700
Message-ID: <20240327200157.1097089-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series unifies the kernel-mode FPU API across several architectures
by wrapping the existing functions (where needed) in consistently-named
functions placed in a consistent header location, with mostly the same
semantics: they can be called from preemptible or non-preemptible task
context, and are not assumed to be reentrant. Architectures are also
expected to provide CFLAGS adjustments for compiling FPU-dependent code.
For the moment, SIMD/vector units are out of scope for this common API.

This allows us to remove the ifdeffery and duplicated Makefile logic at
each FPU user. It then implements the common API on RISC-V, and converts
a couple of users to the new API: the AMDGPU DRM driver, and the FPU
self test.

The underlying goal of this series is to allow using newer AMD GPUs
(e.g. Navi) on RISC-V boards such as SiFive's HiFive Unmatched. Those
GPUs need CONFIG_DRM_AMD_DC_FP to initialize, which requires kernel-mode
FPU support.

Previous versions:
v2: https://lore.kernel.org/linux-kernel/20231228014220.3562640-1-samuel.holland@sifive.com/
v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/

Changes in v3:
 - Rebase on v6.9-rc1
 - Limit ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT

Changes in v2:
 - Add documentation explaining the built-time and runtime APIs
 - Add a linux/fpu.h header for generic isolation enforcement
 - Remove file name from header comment
 - Clean up arch/arm64/lib/Makefile, like for arch/arm
 - Remove RISC-V architecture-specific preprocessor check
 - Split altivec removal to a separate patch
 - Use linux/fpu.h instead of asm/fpu.h in consumers
 - Declare test_fpu() in a header

Michael Ellerman (1):
  drm/amd/display: Only use hard-float, not altivec on powerpc

Samuel Holland (13):
  arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
  LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  riscv: Add support for kernel-mode FPU
  drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
  selftests/fpu: Move FP code to a separate translation unit
  selftests/fpu: Allow building on other architectures

 Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
 Documentation/core-api/index.rst              |  1 +
 Makefile                                      |  5 ++
 arch/Kconfig                                  |  6 ++
 arch/arm/Kconfig                              |  1 +
 arch/arm/Makefile                             |  7 ++
 arch/arm/include/asm/fpu.h                    | 15 ++++
 arch/arm/lib/Makefile                         |  3 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/Makefile                           |  9 ++-
 arch/arm64/include/asm/fpu.h                  | 15 ++++
 arch/arm64/lib/Makefile                       |  6 +-
 arch/loongarch/Kconfig                        |  1 +
 arch/loongarch/Makefile                       |  5 +-
 arch/loongarch/include/asm/fpu.h              |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/Makefile                         |  5 +-
 arch/powerpc/include/asm/fpu.h                | 28 +++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/Makefile                           |  3 +
 arch/riscv/include/asm/fpu.h                  | 16 ++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
 arch/x86/Kconfig                              |  1 +
 arch/x86/Makefile                             | 20 +++++
 arch/x86/include/asm/fpu.h                    | 13 ++++
 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
 include/linux/fpu.h                           | 12 +++
 lib/Kconfig.debug                             |  2 +-
 lib/Makefile                                  | 26 +------
 lib/raid6/Makefile                            | 31 ++------
 lib/test_fpu.h                                |  8 ++
 lib/{test_fpu.c => test_fpu_glue.c}           | 37 ++-------
 lib/test_fpu_impl.c                           | 37 +++++++++
 37 files changed, 343 insertions(+), 190 deletions(-)
 create mode 100644 Documentation/core-api/floating-point.rst
 create mode 100644 arch/arm/include/asm/fpu.h
 create mode 100644 arch/arm64/include/asm/fpu.h
 create mode 100644 arch/powerpc/include/asm/fpu.h
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
 create mode 100644 arch/x86/include/asm/fpu.h
 create mode 100644 include/linux/fpu.h
 create mode 100644 lib/test_fpu.h
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

-- 
2.43.1


