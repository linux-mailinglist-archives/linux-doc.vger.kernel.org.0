Return-Path: <linux-doc+bounces-36918-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B0A280D4
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 02:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7654F7A1A61
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 01:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9952E22A7E1;
	Wed,  5 Feb 2025 01:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dtzwY2m+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B4922A1EB
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 01:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718529; cv=none; b=pL/rmIraIOzsEbnNtSWLo89XAPUR6vlOHIP/h+vBwmttxvq1mBY9qrSbInmTSNp4ud55yaNx88dwWIImAjUhDNLqj5QLLchNfKAWfkNsn+Vy1yxBL+FyYlGizKicZF1AqGlApZGHxM4awAXS3ZH1yLuMhPS62tlGNqgdrnfsGRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718529; c=relaxed/simple;
	bh=toOY3g5UWbhyzFvpokgMbtCDrGwGLK+0MjdImo2Zc6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Elk8GtVqhUMPEhv9wgAtTRQ1Kg9CXrPkZbPzA/FhfhsA4uQmTr+p5Odx6ctSQ+mzR4tWvOKuq5LAMq6n1tYuRy1rp2a/mlEn37eBU4VsaxFSneAAXrfnrvrIlhlhRDvG6rgPlCn/1YktxtBHlYWz8c7Ukrj9SiLKRHgJZxjKj1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dtzwY2m+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f9d5e0e365so1310955a91.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 17:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718525; x=1739323325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1e5RgGuqZS+AKw5oTSgp47pWFJ0GDjWFc7jT6Xd5TJc=;
        b=dtzwY2m+FXezOKTSyjlDXgShTfRgwP5V1LTUmMIN22MWLRnKo+naWRMD/JvGnNSHaS
         UUbpg9X5n8TvdK3S2HsoBDqGpz2mlBktoSn+gyQqgdSrHiDc8RqR5hMWTmcfD2fJsG2x
         zPgR2oOKyXDsGyuLr3eyF2tEyHP06A1swN5pB0LMzNGwAjSCWxtikh7jIZEOgoFPZTyi
         xCIugqe79snPlKcgI9jwb8ubPbhhD6wmZ5r3wCLybUyw/JoZL/E92BpqrXzKo5SOUSBv
         g1EheIWV7IxZqZEquxGRTg3DYkkTEdBBvrH64yF6x6/5MvX9CG1IEWzsRCgSGygg5s/T
         eXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718525; x=1739323325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1e5RgGuqZS+AKw5oTSgp47pWFJ0GDjWFc7jT6Xd5TJc=;
        b=JTIiMqXwgFgprF5W8cJ449wsfiCzxDppkSzsuruSuOOwn5AEIPz3I/Gn1+wnZAzfHu
         ExvTV0rwN23p/YfuT0db3vZUQxMcKtFEysfKpMntfjVhZom8pSTJcrKwksPz26CtUM+q
         uIbPJeaUb4g3t9mnzjfOUKBlGFj5rKWRiO5EgAdWvY6QY8CSuaCSj4AkxGD9po2n7LDm
         kF3Wxe0tPwAsmUv4CpKNjtOZKW9nU9wR2EZItPBiy7/3SGuNzX5qC/er1wQeKmidjs0Z
         K/PcjDFAg/Dt6p5JFAGIZbUm809dhFL3FBcVCHMoZSRI/KgO4QDGgNfx0HqDKyN05ANc
         /M/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHwPhxycjlJUR35H631gm8KumGI+qEC5wGTu4yBPHfu6uM+RRhPPuE1wqNsJRiW2CJ3ZyDmTkybK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8CXqI9k+DDPIVY7RxrhqGez1q4eRxd+CQtoqCA4KGAZGBNn2
	d3F733+m/hNAluk7VUVM/9eZTd8fAMfFg8fV90DOjAi1hVqMET4ED2Wd92rq7Vc=
X-Gm-Gg: ASbGncttzamQzvSRsUQTSw0cYOLb2dw0/ZtXahyesbAShiIpCI+JDb+ySmgumQMLjBA
	LTebDO7LPkCjeSwGjT7RPTHhuZgUlOqTsQ+M+AXZNXDkSPPaaLjxHWreauM0K/t3O2vKEB90JBI
	4VkNUnCzkSTaBvZO2xwumVNA64VgK+EHvX8P+v5vlfBa4wYKs4g5P3Qf0q2YzcGC3hEHBzwSAaV
	yRNsRZ8UJB6A0cwaUa1svempUFuAE8JIhuSHkr0TEVnjY5zmAiVhmMNPaTZ0NsY918LEBasq1VL
	7P/UbUOrQScYG+H2336lI2Sa3g==
X-Google-Smtp-Source: AGHT+IGmwZmqjzvPRO4j1QnW6c26qtiThBAMPujeU03hhi/wAPDw8k7cHzAb2QmKpofb/oE3lFc7aw==
X-Received: by 2002:a05:6a00:e13:b0:725:e37d:cd36 with SMTP id d2e1a72fcca58-730350e4f2amr1787173b3a.2.1738718525565;
        Tue, 04 Feb 2025 17:22:05 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:05 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:53 -0800
Subject: [PATCH v9 06/26] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-6-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

`arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
This is to make sure that any existing apps using PROT_WRITE still work.

Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
encodings for shadow stack. Above changes ensure that existing apps
continue to work because underneath kernel will be picking
`protection_map[VM_WRITE|VM_READ]` PTE encodings.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mman.h    | 25 +++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/sys_riscv.c    | 10 ++++++++++
 arch/riscv/mm/init.c             |  2 +-
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..392c9c2d2e78
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <uapi/asm/mman.h>
+
+static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
+						   unsigned long pkey __always_unused)
+{
+	unsigned long ret = 0;
+
+	/*
+	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
+	 * Only VM_WRITE means shadow stack.
+	 */
+	if (prot & PROT_WRITE)
+		ret = (VM_READ | VM_WRITE);
+	return ret;
+}
+
+#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
+
+#endif /* ! __ASM_MMAN_H__ */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad..8c528cd7347a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -178,6 +178,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
 #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
 					 _PAGE_EXEC | _PAGE_WRITE)
+#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
 
 #define PAGE_COPY		PAGE_READ
 #define PAGE_COPY_EXEC		PAGE_READ_EXEC
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index d77afe05578f..43a448bf254b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -7,6 +7,7 @@
 
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
+#include <asm-generic/mman-common.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -16,6 +17,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
+	/*
+	 * If PROT_WRITE is specified then extend that to PROT_READ
+	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
+	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
+	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
+	 */
+	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
+		prot |= PROT_READ;
+
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 15b2eda4c364..9d6661638d0b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -342,7 +342,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= PAGE_NONE,
 	[VM_READ]					= PAGE_READ,
-	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE]					= PAGE_SHADOWSTACK,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,

-- 
2.34.1


