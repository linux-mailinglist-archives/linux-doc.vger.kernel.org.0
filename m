Return-Path: <linux-doc+bounces-44867-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F525AA3F68
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 02:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9777B1889EDE
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 00:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1C7280328;
	Wed, 30 Apr 2025 00:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xEXtSJ/K"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D527A44F
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972256; cv=none; b=AxcI2sdjnvGNh/jbcjx9cy3Z+hrVrl0YMdmgKlmO45/B6R525jPMxRnxxP5jY3Ay61xO1Amf3l0+lU8gkZ+nut4Aa0DyGkeu9migaMSez6iIFhlkmc0rzJvWFMGLGAPqsf4VZjXmE58L3wy1+JbaPoyXdC1xEjicY6uNG2zhkco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972256; c=relaxed/simple;
	bh=LEwg+PEEXgk17kSZjUwQnMqL3CegoSsO5m1ICVe2uCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cp/eqUJaM9sedRDPnB7DA0BP7DX8vjVXIHpwoEjDC/MgGzoAREA9PtIrPKAXfhTY7kPj0qmZGcoUvuvxbvCWrul23WxB+j4IRwSTl7fm6Tt83XwYIkPRGfVtYsQt2lYEVD7VUIem6IhuTaN68brIchdGeS8/QvI+yPj17CdBepo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xEXtSJ/K; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227d6b530d8so73988075ad.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972253; x=1746577053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aI596RAmm7Lv4XL+SxRun/ZHSsQZoWKcT7qQq9RSlTc=;
        b=xEXtSJ/KhdFcEzrjOeIcCwrbVfY8P4U3Ah2y97fCgArnnILdQR9oJhyCQy029jipHQ
         /Q2sR47ierNCFPJKSHsx/feXK+6uzqzVigXsTHEDiyqcrEI5/va8Lqvo45qY6/FJRiwr
         vIgrOUgCBLdBSkMwCZvOoIkVII9COu8c+IiOjTf6BMMXteS9oIhWvDJon73sExorjkQr
         neY0PoH3TGgWzlsQ07HD4d3BENp15DENbNyiZEHu9BZ7xqbiMU5kSlKf6HhVhJXmCClJ
         w3G8q8rcOtonW+FvaFL4phFRMovX99CFvWCVdtffnQJoxKzmT0uYX/hA8oyTQrx+tghD
         ETbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972253; x=1746577053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI596RAmm7Lv4XL+SxRun/ZHSsQZoWKcT7qQq9RSlTc=;
        b=HZsPh0BQcgLpGL8vmWx8i4T8OISEB2qDv90JhIs30Rwgc+zTvhvE7UGAKnDtTUhzV2
         A6g84m9YUREj0+L4hKK8Y+/EzAUIPo3jKbmRJxI95VEIQy0igIDSot05d9HHpMUKJiTj
         wX58EWEfcNS47JSX6Z0v50tE7S9DOuLV6Dl6JmbkzX/Dmv5ELMihkZMXWAPMm88mvlbA
         xsXZm5BYhQ0vSu70Sfn5KCUrIxTLDvbxj7Gbp51IimDCIn3XTJKIhZj2TL3yo7qYAts8
         RDzLLsdxVBSsePSWEof/oDwS8fvNURVt9e7ExTRQ5AFdHcbnjM/TGFaGtDcLWWLkBEQM
         DQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKQeBX+cS++GnC1tpcPI8ncZG5O9GxZB9IDCOAROpIIVh9B1O7tHViE5qFI1zPKtR7zc86ytGvJtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx827tX2Wx4k6FwIWUktMvQd1PlyqIqBgcZUzr7HPrh/uLwkpsB
	Sr3EqaSMSh4VA/V4twGAG9BXqEyXRoLVdRptXgQfoxtaoT2F79aIOt2uMdZJW/k=
X-Gm-Gg: ASbGncsrasiBG19Ul/ZAhgHeOaPuw+CpAmIAD6afOM5dcBztVdBnmgfoU2EJFgG9iAP
	dyfegEFr6hsVttO35tO1RBesYtcXDl/DgE7ZbpF33dRbsOfUFnY7wG7BKJzhPUvPaoW6hFGIRcK
	aWfF1DL3DuX068T6ZvTqbmyOsQVLQNicb7IyuhH8ySnLKiAN2ZVZJjlaCeP96yc/1Mdb7wDFgEG
	DGGNR24F4JTaE6EieVcTHLkW9WEhSurbf3XGw3B+qU/xs9FLo18XpCbzRmn2r9LznL4dFujVEWO
	CijlPG0HQc8vfA/IhDmcoKJ24ltleEbnCqu5xch9JXcai7qVcyBntrcwaOoycA==
X-Google-Smtp-Source: AGHT+IE1ImDWArA4vAOMZ3tPvYABZbcFyPq43rxtUjG5ptU/GyltCdFbvr8IQ/OkfIGhaCQBtfBIRg==
X-Received: by 2002:a17:902:d2cb:b0:224:fa0:36d2 with SMTP id d9443c01a7336-22df350917emr17573875ad.26.1745972252926;
        Tue, 29 Apr 2025 17:17:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:38 -0700
Subject: [PATCH v14 21/27] riscv: kernel command line option to opt out of
 user cfi
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-21-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

This commit adds a kernel command line option using which user cfi can be
disabled. User backward cfi and forward cfi can be enabled independently.
Kernel command line parameter "riscv_nousercfi" can take below values:
 - "all" : Disable forward and backward cfi both.
 - "bcfi" : Disable backward cfi.
 - "fcfi" : Disable forward cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++
 arch/riscv/include/asm/usercfi.h                |  7 +++
 arch/riscv/kernel/usercfi.c                     | 59 ++++++++++++++++++++-----
 3 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 76e538c77e31..f75d50420a56 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6237,6 +6237,14 @@
 			replacement properties are not found. See the Kconfig
 			entry for RISCV_ISA_FALLBACK.
 
+	riscv_nousercfi=
+		all	Disable user cfi ABI to userspace even if cpu extension
+			are available.
+		bcfi	Disable user backward cfi ABI to userspace even if
+			shadow stack extension is available.
+		fcfi	Disable user forward cfi ABI to userspace even if landing
+			pad extension is available.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL,EARLY]
diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 68da5b7b79fd..6867ba6bd5a5 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -5,6 +5,10 @@
 #ifndef _ASM_RISCV_USERCFI_H
 #define _ASM_RISCV_USERCFI_H
 
+#define CMDLINE_DISABLE_RISCV_USERCFI_FCFI	1
+#define CMDLINE_DISABLE_RISCV_USERCFI_BCFI	2
+#define CMDLINE_DISABLE_RISCV_USERCFI		3
+
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <linux/prctl.h>
@@ -83,6 +87,9 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #endif /* CONFIG_RISCV_USER_CFI */
 
+bool is_user_shstk_enabled(void);
+bool is_user_lpad_enabled(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_USERCFI_H */
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 8bc3e1e3f712..5ef357f43ad7 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+unsigned int riscv_nousercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -59,7 +61,7 @@ unsigned long get_active_shstk(struct task_struct *task)
 
 void set_shstk_status(struct task_struct *task, bool enable)
 {
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return;
 
 	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
@@ -89,7 +91,7 @@ bool is_indir_lp_locked(struct task_struct *task)
 
 void set_indir_lp_status(struct task_struct *task, bool enable)
 {
-	if (!cpu_supports_indirect_br_lp_instr())
+	if (!is_user_lpad_enabled())
 		return;
 
 	task->thread_info.user_cfi_state.ufcfi_en = enable ? 1 : 0;
@@ -259,7 +261,7 @@ SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsi
 	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
 	unsigned long aligned_size = 0;
 
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return -EOPNOTSUPP;
 
 	/* Anything other than set token should result in invalid param */
@@ -306,7 +308,7 @@ unsigned long shstk_alloc_thread_stack(struct task_struct *tsk,
 	unsigned long addr, size;
 
 	/* If shadow stack is not supported, return 0 */
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return 0;
 
 	/*
@@ -352,7 +354,7 @@ void shstk_release(struct task_struct *tsk)
 {
 	unsigned long base = 0, size = 0;
 	/* If shadow stack is not supported or not enabled, nothing to release */
-	if (!cpu_supports_shadow_stack() || !is_shstk_enabled(tsk))
+	if (!is_user_shstk_enabled() || !is_shstk_enabled(tsk))
 		return;
 
 	/*
@@ -381,7 +383,7 @@ int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *st
 {
 	unsigned long bcfi_status = 0;
 
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return -EINVAL;
 
 	/* this means shadow stack is enabled on the task */
@@ -395,7 +397,7 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
-	if (!cpu_supports_shadow_stack())
+	if (!is_user_shstk_enabled())
 		return -EINVAL;
 
 	/* Reject unknown flags */
@@ -448,7 +450,7 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 				  unsigned long arg)
 {
 	/* If shtstk not supported or not enabled on task, nothing to lock here */
-	if (!cpu_supports_shadow_stack() ||
+	if (!is_user_shstk_enabled() ||
 	    !is_shstk_enabled(task) || arg != 0)
 		return -EINVAL;
 
@@ -461,7 +463,7 @@ int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *sta
 {
 	unsigned long fcfi_status = 0;
 
-	if (!cpu_supports_indirect_br_lp_instr())
+	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
 	/* indirect branch tracking is enabled on the task or not */
@@ -474,7 +476,7 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
-	if (!cpu_supports_indirect_br_lp_instr())
+	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
 	/* indirect branch tracking is locked and further can't be modified by user */
@@ -498,7 +500,7 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 	 * If indirect branch tracking is not supported or not enabled on task,
 	 * nothing to lock here
 	 */
-	if (!cpu_supports_indirect_br_lp_instr() ||
+	if (!is_user_lpad_enabled() ||
 	    !is_indir_lp_enabled(task) || arg != 0)
 		return -EINVAL;
 
@@ -506,3 +508,38 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+bool is_user_shstk_enabled(void)
+{
+	return (cpu_supports_shadow_stack() &&
+		!(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI));
+}
+
+bool is_user_lpad_enabled(void)
+{
+	return (cpu_supports_indirect_br_lp_instr() &&
+		!(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI));
+}
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "all") == 0)
+		riscv_nousercfi = CMDLINE_DISABLE_RISCV_USERCFI;
+
+	if (strcmp(str, "fcfi") == 0)
+		riscv_nousercfi |= CMDLINE_DISABLE_RISCV_USERCFI_FCFI;
+
+	if (strcmp(str, "bcfi") == 0)
+		riscv_nousercfi |= CMDLINE_DISABLE_RISCV_USERCFI_BCFI;
+
+	if (riscv_nousercfi)
+		pr_info("riscv user cfi disabled via cmdline"
+			"shadow stack status : %s, landing pad status : %s\n",
+			(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI) ? "disabled" :
+			"enabled", (riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI) ?
+			"disabled" : "enabled");
+
+	return 1;
+}
+
+__setup("riscv_nousercfi=", setup_global_riscv_enable);

-- 
2.43.0


