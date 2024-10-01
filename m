Return-Path: <linux-doc+bounces-26124-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A24B98C266
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 18:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F13528490A
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 16:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26281CC8BC;
	Tue,  1 Oct 2024 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gVrh5Ykh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DBA1CC89C
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798834; cv=none; b=V2XvfjFfhEX9r/fOYbYFaTB/yZ/6ZMH83Xt6dliuuFLnSRgv1GaujewyEXbhpkpZweTfXHCdmv/HZZ8bLNg3N+WrrH4oG86h2OlBQ2jWNInKCrdZvQkpSbeZAsbJ6SjgHp5DWv3FfjwwAgpXFMqs6+hFR1rwtxf7wYTzP5xZ4pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798834; c=relaxed/simple;
	bh=Q6gtuJzM/MF65bP/ly/fmxi6CUiczezK+tibtuC6KK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDoJApC1fQ+pgm7MGfugtRs/vsFGHk0SR+DMS8+kvUpw02ZdmqAxwsToK/4aKzbQbgt9HsqVQplmxo6P6p8QGE6FfCcXt78P42AY1KGPhoBhUXby072E9fVxLJZJiobktP//T4TPb5hSRE+phU7p+KkjQXhgjZxKdYfxTRU62nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gVrh5Ykh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e082bf1c7fso4201882a91.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798832; x=1728403632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOwX8zEWq9u2vqkDVwGK82xZureIgOdXeRz6EPpdBWc=;
        b=gVrh5YkhSYJsePM9K2pFclvjEbCb0hbrM1DM3T1mCK8owlbSxPcfLPSHBLT9UPIBp0
         ZZ78xchhVxYaYSDRJjNTdhujQDzlkLtZls3O2Tqa8v1E0TL8sX5JnYkWX5wJpXt/0h+E
         TJdUhJXlvJECKZ6hxEv2UMarIbyf/ix+rS7HEbru6vnHQRRH5GUqEdVkUoKYFvsmN5Zh
         J13D77XhtpDnVN5bonuBA+5HwKv/g+trBmoMiyUDcYreJGLSlZopFq5bi4Ol25cqPB1G
         0V3ZJbxSv5gpK4XxrJdaeFC6xLlorw6b5q51VaD94+3Su/1MbyWGfdEwjYNlEvWz9Lo3
         S50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798832; x=1728403632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOwX8zEWq9u2vqkDVwGK82xZureIgOdXeRz6EPpdBWc=;
        b=k/QkS1FyVlTuZuwvKEpLgk65bZzMGYKmKqAPxQKMhcj9m7ZO3WaIUyNgaDcZa5jHK3
         J2VPa1K8gX/HWekuFImagV9LZWn5OD5gmmeM7weADntB5j3tWfmRJ+0xFBkzWnIiHRAp
         dydua/EnvOycx4Mc0czekb4A9ZXl+L4zbwDaUbdOYhzVrc4l6fcMwkRr/wmeD1jr+DRo
         6K6lDZf/ynAkL8jtWMo9CpQIumIoD6fyBWU3/WkkiD/ETHUuuvb+HuAu7VzHtFyUmNV6
         Fu7Ik3kII3aDW4yQjrVZU80Z9GNfN9HWDSWRrRPI+dh2kl6dqWrXO6G0rgqu/sQSGaH1
         lS7A==
X-Forwarded-Encrypted: i=1; AJvYcCWK8lWQCNqxKiB5ABF/puZIq6PO+Xb75Rpvix7Gp/LdycMQLRv/mcyug/9Eu2iZt5KOJO362TLya20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaq9JOkNzrtbPG5br9vvMR2+sTIv2kbeskL0XSoQCw3rMjvhsN
	H4poArKw+ZAPAOVI3Yug8vqEr5WTmbu3aicQAV0VSlhSadKRmE82joNZVDqyytI=
X-Google-Smtp-Source: AGHT+IG+QoJp6SaYR4NX7gvJQsxk2XpCmBA5X0cJPckGFJwiDNphfS2kILfudd4XZsrEP9ImoMA9pw==
X-Received: by 2002:a17:90b:4a86:b0:2e0:a9e8:b9c1 with SMTP id 98e67ed59e1d1-2e1846aff84mr236832a91.22.1727798832417;
        Tue, 01 Oct 2024 09:07:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:12 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:10 -0700
Subject: [PATCH 05/33] riscv: Call riscv_user_isa_enable() only on the boot
 hart
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-v5_user_cfi_series-v1-5-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0

From: Samuel Holland <samuel.holland@sifive.com>

Now that the [ms]envcfg CSR value is maintained per thread, not per
hart, riscv_user_isa_enable() only needs to be called once during boot,
to set the value for the init task. This also allows it to be marked as
__init.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/asm/cpufeature.h | 2 +-
 arch/riscv/kernel/cpufeature.c      | 4 ++--
 arch/riscv/kernel/smpboot.c         | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 45f9c1171a48..ce9a995730c1 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,7 +31,7 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void riscv_user_isa_enable(void);
+void __init riscv_user_isa_enable(void);
 
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
 	.name = #_name,									\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0986291696a..7117366d80db 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -920,12 +920,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void riscv_user_isa_enable(void)
+void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		current->thread_info.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
-		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
+		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 0f8f1c95ac38..e36d20205bd7 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -233,8 +233,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, true);
 
-	riscv_user_isa_enable();
-
 	/*
 	 * Remote cache and TLB flushes are ignored while the CPU is offline,
 	 * so flush them both right now just in case.

-- 
2.45.0


