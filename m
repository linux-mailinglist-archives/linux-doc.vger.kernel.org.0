Return-Path: <linux-doc+bounces-63969-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E078ABF39A3
	for <lists+linux-doc@lfdr.de>; Mon, 20 Oct 2025 23:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A503B02DD
	for <lists+linux-doc@lfdr.de>; Mon, 20 Oct 2025 20:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAF533C526;
	Mon, 20 Oct 2025 20:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="X/03jF6Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197E3396F3
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993648; cv=none; b=Tpn31WI6cwln6ZGlfTNSQTud61eqpHk//zMmvibFGssje/UKHdU/wkYPus3zayjZl2t2UuCmkSkSw5J3Zxp/QWQI63Axs+aCOgSPTcUAlPBUcyHAzZ2EKnVCKBwIB76on5DQlC4KzBeggarZblhCY/mD+bicBxJU3ZGPZdb4Liw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993648; c=relaxed/simple;
	bh=//BKFL/B5DGzgzNcxCALX3+BH8HxJjmHBkOpM1C2zRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbpHBlBQnLJcgLnYmHoYeDq9L5eq8NFafnBR/77In3UH4+gbNMxcOo6M1J5lJ0y4jM3ciAzaVNYvL/AWbvySJsVh8adUrAUyCIVcF3CjZ7fdJ4PyfhRSrkMiEb1TKg/OZWOOuLcmTAk1vyyBqpHUOPLt0ZbvgUIDfF/a40U37UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=X/03jF6Q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781997d195aso3658547b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993645; x=1761598445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=X/03jF6QHwSKO/1DMDQXEEyxE+CuLMZbpfeV7tROqard5W3Ky3uS5xjK9XIe3JBvcc
         LJr/grjhdzuVHhXXEH7zAwMC+1iLXNYIgmrySqoGF+kzJ6cCztCyHbTmXyCfgPh25NSt
         WDyBjqCCzCDDN041VQwzjkJ15GAeRmXadyctlqn/vX9p2INLu5Db/VVAeVGCdK+mCj0l
         rKdtfcFbntfSaCfOXiQ9ez6yF4yFTImOJdIxUe5+Vj1tETmOSK4VoeP/wkeNYxTYXEtA
         jAItpv/Ryt5VyMnf/8xUxFOLKjhjja7m8kr6IQ4vlHt+5lpB4K9U8UpUWpVdaoIy4AIU
         RcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993645; x=1761598445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujHqL1CkFocnxfBg/TilHgsDv7qqfxACnquN+j6SpiE=;
        b=GaYUoDwWrAkbsYKGj4xHtB0ZJiAipfgl1QSgLGvT/v3zMd8PFkNktlHGG6Gqh74H87
         O4AHFB+XaqT2ERn/hteH/VjMQhLWCF2oIeuG+Awtu0ghwG/97bmb5OW0hBDt4mZg7NSA
         l7i+YMYko32ESO3DbzkKGpCGBY9PPBNLc3hFG5jusPPIJ+TjdXPDM7KH8azm8HafmsHg
         sUt3OluKFsWXu5E01y7yHwTzDxVewb3iaIUhVHbdcvBTe+FCBbV+qqxFzO5yTj+heM5Q
         Gyty2TKmhBZaTGow/BsqMocsUQTZIx8RRmXmvFIaxOBlsGK6eK467ZpbiAGfNloOAD3C
         QmGg==
X-Forwarded-Encrypted: i=1; AJvYcCWAGZUA3W6fGLpAzshEexbhvogV0Fs17kCuT1o+x/qECDNMfzUBTmtUsC8tFSpQ115dKDhHRLd0NuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsCZHlLRXMW5ISUHNnGCpjSnmoW7LiBunJRn0Ou8iTtS8Rjq1
	XkQ2fbNEjwJ7I+obNxyl38wcuCXCqR2D2pT2Fq+uPxRUs9NkcHVDfpwKrXoySiNxd0w=
X-Gm-Gg: ASbGncvEIDoVeytFNzkToA+7lTwZ3pYjxPLyRbI8+pJh+VxanV9GWYlvKXW38C8fLb6
	UFx7HzCDbxuCNVxfYGMxdHQIvQzFykKxZm8uqwlVvVloerpRp9suuRN6BfDOTnqp4mUtfgPEhoF
	w+fgZjIStSx9LeZE8DCrzxSGJLNHKY+OeCBPo0MCnQjeuulzW0mUzAeWVh0FnyD7G39Zqwap8eH
	gs2of3cceHuz9/L0uJpMaXAnHsJOfGtkcbutx6ACtopIpyiVbh8umVFSgnMiEHnR7FdwxMV8dZA
	Gi+/SkTVFGPapI2Sa0GFwfeuAVK0j5HV/3D+BuTBbprNcw2CiIlogvtsGmpsjTi6LeK0vtahWsJ
	YQ1pwWcJD7+i/iV9LEYtiBP9fjSBMyvk+btvrH7quUVD4I4whTV001XGG1tKrjoA2BUTDg99WYp
	HzKlidKwzpEoe3g5ehfLfF
X-Google-Smtp-Source: AGHT+IE9a+p4gNntL9Yr4pKUHTjGYyxFT7rSvoBoMzMJVF66u7Twee/tCo6lMxMG7nRGc0QWm7CxRQ==
X-Received: by 2002:a05:6a20:7483:b0:2cd:a43f:78fb with SMTP id adf61e73a8af0-334a8618514mr18898624637.48.1760993644661;
        Mon, 20 Oct 2025 13:54:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:54:04 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:42 -0700
Subject: [PATCH v22 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-13-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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

Three architectures (x86, aarch64, riscv) have support for indirect branch
tracking feature in a very similar fashion. On a very high level, indirect
branch tracking is a CPU feature where CPU tracks branches which uses
memory operand to perform control transfer in program. As part of this
tracking on indirect branches, CPU goes in a state where it expects a
landing pad instr on target and if not found then CPU raises some fault
(architecture dependent)

x86 landing pad instr - `ENDBRANCH`
arch64 landing pad instr - `BTI`
riscv landing instr - `lpad`

Given that three major arches have support for indirect branch tracking,
This patch makes `prctl` for indirect branch tracking arch agnostic.

To allow userspace to enable this feature for itself, following prtcls are
defined:
 - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
   branch tracking.
 - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
   tracking.
   Following status options are allowed
       - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
         thread.
       - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
         thread.
 - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
   tracking for user thread.

Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/cpu.h        |  4 ++++
 include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 487b3bf2e1ea..8239cd95a005 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -229,4 +229,8 @@ static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
 #define smt_mitigations SMT_MITIGATIONS_OFF
 #endif
 
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
+int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 51c4e8c82b1e..9b4afdc85099 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -386,4 +386,31 @@ struct prctl_mm_map {
 # define PR_FUTEX_HASH_SET_SLOTS	1
 # define PR_FUTEX_HASH_GET_SLOTS	2
 
+/*
+ * Get the current indirect branch tracking configuration for the current
+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ */
+#define PR_GET_INDIR_BR_LP_STATUS      79
+
+/*
+ * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
+ * enable cpu feature for user thread, to track all indirect branches and ensure
+ * they land on arch defined landing pad instruction.
+ * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
+ * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
+ * riscv - If enabled, an indirect branch must land on `lpad` instruction.
+ * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
+ * branches will no more be tracked by cpu to land on arch defined landing pad
+ * instruction.
+ */
+#define PR_SET_INDIR_BR_LP_STATUS      80
+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+
+/*
+ * Prevent further changes to the specified indirect branch tracking
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_INDIR_BR_LP_STATUS      81
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 8b58eece4e58..9071422c1609 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2388,6 +2388,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 	return -EINVAL;
 }
 
+int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 static int prctl_set_vma(unsigned long opt, unsigned long addr,
@@ -2868,6 +2883,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_FUTEX_HASH:
 		error = futex_hash_prctl(arg2, arg3, arg4);
 		break;
+	case PR_GET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *)arg2);
+		break;
+	case PR_SET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_indir_br_lp_status(me, arg2);
+		break;
+	case PR_LOCK_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_indir_br_lp_status(me, arg2);
+		break;
 	default:
 		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
 		error = -EINVAL;

-- 
2.43.0


