Return-Path: <linux-doc+bounces-25462-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FF97D5E0
	for <lists+linux-doc@lfdr.de>; Fri, 20 Sep 2024 14:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27F5CB2105A
	for <lists+linux-doc@lfdr.de>; Fri, 20 Sep 2024 12:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C7B16BE0D;
	Fri, 20 Sep 2024 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="T2Z7t27L"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124E16A94F
	for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726837045; cv=none; b=uMlleSAjvpSHk3YCNSItwl3xHMzhrsThRQbbkVpxjqucQal2QTgxSsO295agPRc3P3lm5hT7Xmwccf7g5rrXVDESgV4KQQ6flMcMICPu0W5cGzKvbP8TKOZxvNq10H+svwn7ejyL7Qhk4p6JByGkVirgctLo/yvPXTGxnH4sJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726837045; c=relaxed/simple;
	bh=c7QOjrhw6266N3BbYv4ZOi2g4euWje6OvrLBRKMmLUQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=CfBjnKDtKH06ezBSvoYjgdKi4B3A3Swkz9+BOseJ7uIHdgVV+6ebTcE4R+Jnpgj8LmZXecRHQwrDGwxOaj0d/QeKaSdrBE0kGqN7chGl7NJJKNZ6c+66+ulKplgLciVP06BoZyAFKO3/+SizzJQjU0w6GmDQ7r0xI4K02uDKEZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=T2Z7t27L; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7191fb54147so1495560b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 05:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726837043; x=1727441843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0c3cLyg1YvGor2bDqxSzz6JVUFgRwHa9Wa4Or/oI7nI=;
        b=T2Z7t27L3ne287i0RlRouMWEnhBJCmHBmquMUv0ypjHrr6D7CPl0NoKzej4TJBZ3jr
         rYJbr4ZGj/yEGI6reD24z/JCJWABaciyK9DY76FlHFdaLVgASpsZfu9Nwb2owaHYkJ7e
         +ppofoiNTEz0VK59uyyZzeALKYm7nHb8Ua+wnpTW5fFKJTwH1gOLGtupjVRDlhBfxYxs
         iqvCOuBUHvy1Ghr0Cl+iQnDNAVtA0bS4/d1eMRMz8wvhT4cn9e0ssJxV7KsLWQOS4HWv
         uFobCZQQKGy2KyNpc4xDw52I9PNPjklPluehkBzWaW1S6uGKHms7vlAQAiWD8tTmdhPo
         vxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726837043; x=1727441843;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c3cLyg1YvGor2bDqxSzz6JVUFgRwHa9Wa4Or/oI7nI=;
        b=FaNu/sUDSGnuTEeWs7Ms5X6EldUDXGUaWrVE/ZG73crZ59L+k4Fx/Aq1YkKB7+DvOj
         pntwW8799frPvbMAv6fyIUc0C5hbev4+Lgm5YK8uKb0Kni0U2juDdolHPBgcBmYOzdGg
         rJ74+6tNxgU7JaqfkO4wQC6+8lstbOno97px1Dlz14VSszELu+a53S5NdA5lNqMFRKuW
         E1YO754K+spHtvQFbEPgDdgP7rJbQDi3oyXlkajq/qa3sPTNWOFKnsWUNlN4X38dSA99
         r5/9g8ttI8y29JBvKafbYTsB2a5sruky4ZdkBDhwNQi9zGtOue12ucj/V0PkXUWENBOf
         66Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX7I+CcLIAHn4LDlFshnyw1n6fBhL9FNRdN98pV3bHngqYv6NnYVnvJOD0W0/Vjli7BP9mK0kuK19g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7Zj+8yXLBi0huGTVWVE8XCaph++RwqL83Rh18Y/sIk47vjnv
	oZ2N4iDcLliSPX28hUNENAKosGnkuBhtYL4fangvWL924zAq8+NbxlM8zE1/n8A=
X-Google-Smtp-Source: AGHT+IFEcEmieepmhhCBAp9vyPOGM/uDpWpO0h0hkALABgjhyRBXGu+BM1BtirEkdZcOfqw0yZOT6A==
X-Received: by 2002:a05:6a21:398e:b0:1d2:e888:fcd1 with SMTP id adf61e73a8af0-1d30cb1c91cmr4192601637.33.1726837042650;
        Fri, 20 Sep 2024 05:57:22 -0700 (PDT)
Received: from localhost ([213.164.21.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a973bbsm9757320b3a.27.2024.09.20.05.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:57:22 -0700 (PDT)
Date: Fri, 20 Sep 2024 05:57:22 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Sep 2024 05:57:09 PDT (-0700)
Subject:     Re: [PATCH v9 0/6] RISC-V: Detect and report speed of unaligned vector accesses
In-Reply-To: <20240820152424.1973078-1-jesse@rivosinc.com>
CC: linux-riscv@lists.infradead.org, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>, robh@kernel.org,
  krzk+dt@kernel.org, cleger@rivosinc.com, Evan Green <evan@rivosinc.com>, ajones@ventanamicro.com,
  jesse@rivosinc.com, Charlie Jenkins <charlie@rivosinc.com>, xiao.w.wang@intel.com,
  andy.chiu@sifive.com, ebiggers@google.com, greentime.hu@sifive.com, Bjorn Topel <bjorn@rivosinc.com>,
  Heiko Stuebner <heiko@sntech.de>, costa.shul@redhat.com, akpm@linux-foundation.org, bhe@redhat.com,
  apatel@ventanamicro.com, zong.li@sifive.com, samitolvanen@google.com, ben.dooks@codethink.co.uk,
  alexghiti@rivosinc.com, gustavoars@kernel.org, erick.archer@gmx.com, j.granados@samsung.com,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jesse@rivosinc.com
Message-ID: <mhng-07137536-28ef-4262-a165-6388fffd2599@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 20 Aug 2024 08:24:18 PDT (-0700), jesse@rivosinc.com wrote:
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
> The Zicclsm is patches are no longer related to this set.
>
> Changes in v6:
>  Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")
>
> Changes in V8:
>  Dropped Zicclsm
>  s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
>   to match RISCV_HWPROBE_MISALIGNED_SCALAR_*
>  Rebased onto palmer/fixes (32d5f7add080a936e28ab4142bfeea6b06999789)
>
> Changes in V9:
>  Missed a RISCV_HWPROBE_VECTOR_MISALIGNED...
>
> Jesse Taube (6):
>   RISC-V: Check scalar unaligned access on all CPUs
>   RISC-V: Scalar unaligned access emulated on hotplug CPUs
>   RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
>   RISC-V: Detect unaligned vector accesses supported
>   RISC-V: Report vector unaligned access speed hwprobe
>   RISC-V: hwprobe: Document unaligned vector perf key
>
>  Documentation/arch/riscv/hwprobe.rst       |  16 +++
>  arch/riscv/Kconfig                         |  57 +++++++-
>  arch/riscv/include/asm/cpufeature.h        |  10 +-
>  arch/riscv/include/asm/entry-common.h      |  11 --
>  arch/riscv/include/asm/hwprobe.h           |   2 +-
>  arch/riscv/include/asm/vector.h            |   2 +
>  arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
>  arch/riscv/kernel/Makefile                 |   3 +-
>  arch/riscv/kernel/copy-unaligned.h         |   5 +
>  arch/riscv/kernel/fpu.S                    |   4 +-
>  arch/riscv/kernel/sys_hwprobe.c            |  41 ++++++
>  arch/riscv/kernel/traps_misaligned.c       | 131 +++++++++++++++--
>  arch/riscv/kernel/unaligned_access_speed.c | 156 +++++++++++++++++++--
>  arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++
>  arch/riscv/kernel/vector.c                 |   2 +-
>  15 files changed, 465 insertions(+), 38 deletions(-)
>  create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
>
> base-commit: 32d5f7add080a936e28ab4142bfeea6b06999789

I get a 

arch/riscv/kernel/traps_smisaligned.c: In function 'check_vector_unaligned_access_emulated':
arch/riscv/kernel/traps_misaligned.c:591:9: error: unknown register name 'v0' in 'asm'
  591 |         __asm__ __volatile__ (
      |         ^~~~~~~

on rv32/defconfig.  Looks like just a missing Kconfg guard as this 
depends on V support in the toolchain.

