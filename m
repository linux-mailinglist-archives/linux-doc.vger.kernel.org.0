Return-Path: <linux-doc+bounces-29113-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5B9B574D
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 00:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32AE1F23EE7
	for <lists+linux-doc@lfdr.de>; Tue, 29 Oct 2024 23:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8867620E033;
	Tue, 29 Oct 2024 23:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Vq8hH9el"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE220CCD5
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 23:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245472; cv=none; b=LJ7iI9+bhR7yBOSofWQ//jMCeGx/orumWT+ieHXIjw52OW0FyJFbAcjQLOksM5QW6nXkfQUmozSqbg0Vn8LqFS1rtC3mKXUMUAwDXx3DPV5CYzG77/QdcyXPBhQpI8kmTQJI+9G7vETXwRNnRs3tBMvKpjmixu5iZlwJT5P2vgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245472; c=relaxed/simple;
	bh=M7gTsMYJC6gVCP2HYGRtJbT2SRuSOyReRSkSCT0NLIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZ4RQUTMEULivOH+1zLF2G0IzgiQEp1F3hZY2BjPFlzjRFWrk8ZvK/gwWH6gxWw7+gTosmw/sPavWS0mxYyejD5CX6a0f17C0f25iriX08RlR1kI9wcS8j8yV4kRdcyYrmRrn1j/e1gA3q5PbxP1MiOucZa9kc9zRf/7x165+ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Vq8hH9el; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e74900866so4571819b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 16:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245469; x=1730850269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBYlqLcHDdUtNQoLJCRBG8R/P8wZP2gIPf6gwWr372U=;
        b=Vq8hH9elYwCQfmKLvyfYjx8a0prbTsHZ3ZNb6oQz4WsJLWKLeHn30IvtWB9folyyz4
         MNb4hpM7KOtleH8GGc3vUHR2pXNdo3Hr8ufVDgvpsffGawEXZRylZ6ityszRhGW5OLLv
         YGUsdQfnzUB2h/rXdCQ5hIeeuZb3uQISfMDbjKXEMJbv2Lcy6SCOkk519a/sbKOV3O84
         tL24NkPRO6F/7XoP1J9biJbZFz3b9/81jvKYyNi64Z506m1vUgxGact4zLWwpIu2wQQd
         Vq4p6s9Lh1XzvAymFIYaXPy1QDAYkiJVDQft74eZ9sKaF7WKHq7F/3CCbRNFSKDQZ6+v
         aEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245469; x=1730850269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBYlqLcHDdUtNQoLJCRBG8R/P8wZP2gIPf6gwWr372U=;
        b=sQdTnueF//zh2eObDfd/lyk3T8NM1rxwf8c7X7iajb3ns1TzVw1lxYqJO0D/4lQ9Ub
         NdzEErZ1D1KGqoUI0Ga5HOCg21gpPG9ZHn3C+Mn4+CQmJ3Bcsts86JZQJ0hEFBjj0xRj
         kkufizYA4ohfa8gJDF7kAgbSeIITPvonxdkeAz1bHui3Cge3eLbXZarGoP1798OGw0aY
         FM8+qnREsl04DMwzpr+fPG46FXnR11t4UzqacgmXocOWT9SXWndNAnqOSmKrZXrT1jgc
         XFNbnc9azmoyk20YgNZ6f8LpazYxYkR0uF4ut8n0z30mqOXvOR+aN/lF7GYtzhOIFIlN
         bDWQ==
X-Forwarded-Encrypted: i=1; AJvYcCURLX4siEnLvgO2ofYVAYHk8D2sILaPq830WGvbxPWy+dQL2AEyfADQHe+GvXk4bhGxzOgxb0WMzNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySo0ZKprthifS/Qp1zbb2M4t8vFIKbgoWn9+cNyC/OJU0qe4ol
	O760v9kKPjqTl0uVFDV5CrXWihSH/TSJXN84RmR/YbHqOI51p/15Bu0B5eOuew8=
X-Google-Smtp-Source: AGHT+IELZ2VSZVfVna2i/qkCG/IWw0r7P7GSQ8cnF6JfcdOHDu45D3ZJHWKDe58LG2WiYKkWATRH8g==
X-Received: by 2002:a05:6a00:10c7:b0:717:9154:b5d6 with SMTP id d2e1a72fcca58-72063028d41mr20002790b3a.22.1730245468803;
        Tue, 29 Oct 2024 16:44:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:28 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:05 -0700
Subject: [PATCH v7 05/32] riscv: Call riscv_user_isa_enable() only on the
 boot hart
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-v5_user_cfi_series-v7-5-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Deepak Gupta <debug@rivosinc.com>
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
index 27bafc5dd62d..b3a057c36996 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -920,12 +920,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void riscv_user_isa_enable(void)
+void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		current->thread.envcfg |= ENVCFG_CBZE;
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
2.34.1


