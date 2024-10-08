Return-Path: <linux-doc+bounces-26839-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722E995A87
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 00:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCC961F217F2
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 22:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2D621E97A;
	Tue,  8 Oct 2024 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PQLzToSQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E07221E963
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728427111; cv=none; b=ZgIW+x/xv3QdGa4OXzNf5KbX3LlSm+ErfkooHRpGgT5RjYRH+Ylt2BKliQojQ+e4Vlck9Jsi+l5QjYqVoLOazfrtUrPNi54nXxWbjeaVnnpyxWYmg7l1dO3bvSjVkbxumLoUvbgItPtqDhb3G6Ks9OybXuBUCmWHeaVtgSRu0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728427111; c=relaxed/simple;
	bh=DM0nMlw2whmq28lk4N5aijs06zkSXUMht2BPx2zcQ7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4kTXE2BqJ3BTC9Ih3ghzFJGU/F4G9NKEyyn1rppl8KTTXRxV70Rb9M37iiQYCy4qEAHrBZktTUlseC87joQTCazja7Dje2EgfJrH8WJQwwGk4JKbni16Z0bFj5IDnspNgPoC/tn+BCJ9C14KDXUAA4kel/X6KdNph7V9u/Pir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PQLzToSQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71de776bc69so3086046b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 15:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427109; x=1729031909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAoDcoPzZ5rcQ2NjFDcOAOgedZarol+OJwK/f74o/Zc=;
        b=PQLzToSQcyQ3vtY8poEApjOHUTG4dfNiibuGdXJpQO3l4GjZjgE+Mu9p0wHzOQ7aLI
         GkSPi7fQMrcPLgwXcjWbB5ccIYlGVZd9aN2oMPXlt5QkfUNDIh1p80SHKkVS8MqNboOq
         gpdRqYm5IrMHPjbl/szT2F6ypuZE/yqErB2hPAqtNvWH5421KysMK5xrhSeroMmGDDPt
         0Sef3UoDpoumDM5BTIUZkYcuNVdLDuhVq6vvTo4/lHrEQBGPKHn6E3bl9xeHcEbM9T2F
         hGO/8HBGRA5xcj1q1tPU8FcbAm9bUuqwYtq5Npr8kTyfFAPT32fPmodx5CpiGbPAyQfF
         vZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427109; x=1729031909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAoDcoPzZ5rcQ2NjFDcOAOgedZarol+OJwK/f74o/Zc=;
        b=Twle2qpbC0BRwz7bAX9HliMlRxStnLMS7dL3aiHpY0KJ0kMbCbEIPbNinRKtszDJRl
         c3Fcl77gyIPFRiyvWNTloYBFRImTYXXboy0yuxhEvhvrPyd6ZM0P03nUqAH6PM0QG02+
         VOYSj4swoJc305wAEQNQ7nmW+XQSGPzZVdGOItpCwQQBcBsYrGKyrAu2XIyB6fy8AwMC
         sh5GXdoGKRp1h7rQqXdgnlFCVYg7HO8djYlJ+1umDi4HSMNgtkeCjiuYQWaRqjYBqTwq
         uGD35r3c8yZM4QCMo8JrQtnR+E0H0Ilk+2wI9iSrjwsagEcGv/WGHLxBcjZyfS0gwlky
         GyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVNPQwUi0YoQdXu1csfCo1mQpjGlGYEO7DhOoaUmFwkRL4e/E5+VhnZfiCoYhFsVLmWvazGQW7qfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5ykwOWSzvq7OBUcu7ggy6CzdUhvfjndasSXomqiecl55p1AS
	hmvLBMidDrIlMjELH0rJFDQWVVal2jFbOEkosaaDe3pfd1niY0zQZBmT4UU8074=
X-Google-Smtp-Source: AGHT+IHxf+f6wcxCIHEfxEyDGg+gobzmOwypcXcxAkWl4oxuTMRGEzHBbNlZ3Xhs/sYeCJgcbfyheQ==
X-Received: by 2002:a05:6a00:928a:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-71e1dbb7c5cmr701400b3a.21.1728427109458;
        Tue, 08 Oct 2024 15:38:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:57 -0700
Subject: [PATCH v6 15/33] riscv/mm: Implement map_shadow_stack() syscall
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-v5_user_cfi_series-v6-15-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/Makefile      |   2 +
 arch/riscv/kernel/usercfi.c     | 145 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/asm-generic/mman.h |   4 ++
 3 files changed, 151 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 7f88cc4931f5..eb2c94dd0a9d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -117,3 +117,5 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
 obj-$(CONFIG_64BIT)		+= pi/
 obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
+
+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
new file mode 100644
index 000000000000..96bb324abafb
--- /dev/null
+++ b/arch/riscv/kernel/usercfi.c
@@ -0,0 +1,145 @@
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
+		RISCV_ACQUIRE_BARRIER
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
+	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long) ssp) == -1)
+		return -EFAULT;
+
+	if (token_addr)
+		*token_addr = addr;
+
+	return 0;
+}
+
+static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
+				unsigned long token_offset,
+				bool set_tok)
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
+				VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
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
diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
index 57e8195d0b53..9cfb3c1e337d 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -19,4 +19,8 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
+/* Set up a restore token in the shadow stack */
+#define SHADOW_STACK_SET_TOKEN (1ULL << 0)
+/* Set up a top of stack marker in the shadow stack */
+#define SHADOW_STACK_SET_MARKER (1ULL << 1)
 #endif /* __ASM_GENERIC_MMAN_H */

-- 
2.45.0


