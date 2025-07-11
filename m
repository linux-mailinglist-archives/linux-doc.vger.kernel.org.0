Return-Path: <linux-doc+bounces-52868-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906AB024FE
	for <lists+linux-doc@lfdr.de>; Fri, 11 Jul 2025 21:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9716C178180
	for <lists+linux-doc@lfdr.de>; Fri, 11 Jul 2025 19:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158452F199D;
	Fri, 11 Jul 2025 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WMXOYQMb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9642F5331
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752263207; cv=none; b=j6GfVEvQpHFP1N+Cr1SlwGj2djo0K92T1XtwT12iEbsEeKwLIenIfChRnpMjUmrM2Bd4q5+GaO7baMuqKHE5+4a5mzxVXJg7c24TLKo3dYIbJkdNO0Rl4e6kFW1KG65Yah1bw8vACLY+gpREbHRmxZ6QepJ5lAnRNS2NjzNcJTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752263207; c=relaxed/simple;
	bh=JULYYGmP5ubamenOgOD2BgrBaD8z52B/O9SHQ4rl0i4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZqe12tfNcO9I7VQ4qB0GVqrjN7Wi18d5/8fJSo76IfW8ih2X3e/rzBm5Dk/WTPmmexVdRRJBnyQr4ipjofSp1OmKNYwScfUqbEd+gLQ/AiOQniovgz8pbzet+5uZerIvhV3uZ2K/Mbp6Ls0UAGPFporrheIu+kE/PDEAglvuDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WMXOYQMb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748f5a4a423so1648032b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263205; x=1752868005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDxI/yYSpi877MHHGVz9e95SZkFrsQJCFVNaVAxUNkQ=;
        b=WMXOYQMbbUFFcDpGFUAVp0OLN1GxhDUprTikgKOvsntcpB7OPDHrA+3hUO3ueUJjrG
         jCP2wvckKlCusWDT5zCgr+4v0fjRV1l96/w/I16EEDehf8NACOiwpTcdzsLz6tAGdd9q
         RC6trk/qNya7tb8j31H+ryz7xCyOXWoTb6wuztXpxqKDwh5fasgcoHv0hb7z+mt3qDxZ
         cC2eQ7cwQqOeSLVMmN7lyWhZGptJpFm3jccrg6UwA+pgKY1dozflYgvKdZLkJ31pYAyx
         WhCrjTjqUTn2DHgTsBjqMcMe4iUufSDj2C1AFQVETWs4CdSoDdYG7fdWFiE4TyzIDo+r
         Dj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263205; x=1752868005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDxI/yYSpi877MHHGVz9e95SZkFrsQJCFVNaVAxUNkQ=;
        b=WmImBr4eOslOreN3LrAyHsC9qiewIhaNB0AWuulNuIYQnZQreeN9vLDxwgNGs02MX1
         Cm5TBgpgezLNU5K9/3lXPtQj7NYXzYBWGWHUlszBRDx6wun6F4iaIFvgTsYyJhTO/ocs
         s2tlxyJa0qicFVO5A1XfGVri5lbk/FRQSJCSuuTIjMuUH+iP7x0q/gyiTLp6aDLAYz78
         D2BXsqBYt8JByZenlPzSRy7qmEVZ0StJTPmXPWyV3BzTj5sRiAbZcfTRuMrnaP5I5aqv
         sG149KMVD1mwhtzo8Yi+Wu6DI9Ld6ISyBEwvpGj7zIxcki5KImZ3ew5dDKdTd2jeQpxk
         rjMg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9zFZT2YYKi0SZODPImek86v1oFFo7D9KmkO4uXtOjZ7STCsZJFGTErqL26ryjzxZ2RzGAuQVLSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1UNfNkHmIoi7PLH/bdHZQ5W7AQRfAVAFg8ZRuWlfIF3ODY72g
	A8jXQJCxB0o/wHB1fC/Vu2McLiFY4vpWjaGIKnstpHigBuKV9chtVmJcADvsaWRPeMo=
X-Gm-Gg: ASbGncv+tSQCjYkZ3fZx6dMsqdCMMKdytD1oa3cadK4/a6zoMN/1IjreP8BPuJGcPv5
	Vp+z9GxZ2lupvGnDhWLjDP6Bi0yLB4dT7G+hnoaus4UH2MMsmon7U6wJjDFpFj2905GXCDH+OfL
	WzzTYmnclFF2bm5SyU1S3SJWGdHXx2jf0ewQJRn5O7c0n10a4+a9xphBbML7zi5G/iN7ljKf22s
	1YrXhVzhwywB+hshoFukpQFMRxjS0hmUbm3o9Xhv3Xc+IozKPujbCnHrSzoiTqEeCOv1TZ8cTQa
	uUQaa4h4BptLirzE0lCdDzqaPxowZz+zK75dFznnrxoaRb93TYBKf79gOg7tJSfNn/vy2UqDP6C
	9HTiU/VfkrjRl0TgnolJxp9bFTP/Sd/Em
X-Google-Smtp-Source: AGHT+IGIeX6vrogslsUp9I5/3g6LtLtxgz/7WJewirl1yVEouzuNOdEUzly1G/0zyOnokakybjg18Q==
X-Received: by 2002:a05:6a20:c6cd:b0:1f5:5a0b:4768 with SMTP id adf61e73a8af0-23136860063mr5873562637.21.1752263204646;
        Fri, 11 Jul 2025 12:46:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:44 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:15 -0700
Subject: [PATCH v18 10/27] riscv/mm: Implement map_shadow_stack() syscall
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-v5_user_cfi_series-v18-10-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

As discussed extensively in the changelog for the addition of this
syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
existing mmap() and madvise() syscalls do not map entirely well onto the
security requirements for shadow stack memory since they lead to windows
where memory is allocated but not yet protected or stacks which are not
properly and safely initialised. Instead a new syscall map_shadow_stack()
has been defined which allocates and initialises a shadow stack page.

This patch implements this syscall for riscv. riscv doesn't require token
to be setup by kernel because user mode can do that by itself. However to
provide compatibility and portability with other architectues, user mode
can specify token set flag.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/Makefile  |   1 +
 arch/riscv/kernel/usercfi.c | 143 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index c7b542573407..0b245f36731e 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -125,3 +125,4 @@ obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
 
 obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
new file mode 100644
index 000000000000..0b3bbb41490a
--- /dev/null
+++ b/arch/riscv/kernel/usercfi.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Rivos, Inc.
+ * Deepak Gupta <debug@rivosinc.com>
+ */
+
+#include <linux/sched.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/uaccess.h>
+#include <linux/sizes.h>
+#include <linux/user.h>
+#include <linux/syscalls.h>
+#include <linux/prctl.h>
+#include <asm/csr.h>
+#include <asm/usercfi.h>
+
+#define SHSTK_ENTRY_SIZE sizeof(void *)
+
+/*
+ * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
+ * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
+ * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
+ * stack.
+ */
+static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
+{
+	/*
+	 * Never expect -1 on shadow stack. Expect return addresses and zero
+	 */
+	unsigned long swap = -1;
+
+	__enable_user_access();
+	asm goto(
+		".option push\n"
+		".option arch, +zicfiss\n"
+		"1: ssamoswap.d %[swap], %[val], %[addr]\n"
+		_ASM_EXTABLE(1b, %l[fault])
+		".option pop\n"
+		: [swap] "=r" (swap), [addr] "+A" (*addr)
+		: [val] "r" (val)
+		: "memory"
+		: fault
+		);
+	__disable_user_access();
+	return swap;
+fault:
+	__disable_user_access();
+	return -1;
+}
+
+/*
+ * Create a restore token on the shadow stack.  A token is always XLEN wide
+ * and aligned to XLEN.
+ */
+static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
+{
+	unsigned long addr;
+
+	/* Token must be aligned */
+	if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
+		return -EINVAL;
+
+	/* On RISC-V we're constructing token to be function of address itself */
+	addr = ssp - SHSTK_ENTRY_SIZE;
+
+	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)ssp) == -1)
+		return -EFAULT;
+
+	if (token_addr)
+		*token_addr = addr;
+
+	return 0;
+}
+
+static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
+					   unsigned long token_offset, bool set_tok)
+{
+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+	struct mm_struct *mm = current->mm;
+	unsigned long populate, tok_loc = 0;
+
+	if (addr)
+		flags |= MAP_FIXED_NOREPLACE;
+
+	mmap_write_lock(mm);
+	addr = do_mmap(NULL, addr, size, PROT_READ, flags,
+		       VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
+	mmap_write_unlock(mm);
+
+	if (!set_tok || IS_ERR_VALUE(addr))
+		goto out;
+
+	if (create_rstor_token(addr + token_offset, &tok_loc)) {
+		vm_munmap(addr, size);
+		return -EINVAL;
+	}
+
+	addr = tok_loc;
+
+out:
+	return addr;
+}
+
+SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
+{
+	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
+	unsigned long aligned_size = 0;
+
+	if (!cpu_supports_shadow_stack())
+		return -EOPNOTSUPP;
+
+	/* Anything other than set token should result in invalid param */
+	if (flags & ~SHADOW_STACK_SET_TOKEN)
+		return -EINVAL;
+
+	/*
+	 * Unlike other architectures, on RISC-V, SSP pointer is held in CSR_SSP and is available
+	 * CSR in all modes. CSR accesses are performed using 12bit index programmed in instruction
+	 * itself. This provides static property on register programming and writes to CSR can't
+	 * be unintentional from programmer's perspective. As long as programmer has guarded areas
+	 * which perform writes to CSR_SSP properly, shadow stack pivoting is not possible. Since
+	 * CSR_SSP is writeable by user mode, it itself can setup a shadow stack token subsequent
+	 * to allocation. Although in order to provide portablity with other architecture (because
+	 * `map_shadow_stack` is arch agnostic syscall), RISC-V will follow expectation of a token
+	 * flag in flags and if provided in flags, setup a token at the base.
+	 */
+
+	/* If there isn't space for a token */
+	if (set_tok && size < SHSTK_ENTRY_SIZE)
+		return -ENOSPC;
+
+	if (addr && (addr & (PAGE_SIZE - 1)))
+		return -EINVAL;
+
+	aligned_size = PAGE_ALIGN(size);
+	if (aligned_size < size)
+		return -EOVERFLOW;
+
+	return allocate_shadow_stack(addr, aligned_size, size, set_tok);
+}

-- 
2.43.0


