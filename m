Return-Path: <linux-doc+bounces-6301-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476C8267ED
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 07:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DEB81C21820
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 06:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD438BFC;
	Mon,  8 Jan 2024 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Ut+10Ooe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0179DC
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bd2a584fbcso345233b6e.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jan 2024 22:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704694911; x=1705299711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTagxW2qGB+SOLygMjXPo1Qtb5o4FGjhXHBVBibN0pU=;
        b=Ut+10OoeHFHsNusCYQ2BgY6Ks4st7F8UFjbQkeKSwLA4ArRiA75ibBVOGuhtxlXTok
         hDZ0syA/MyuqtQt/6CWpaD37fu/AgN+dsrFXqsI6E7zTloePgDJF4H4jFvx0Vt4V6CaL
         rFvbbvUnFFxfb2qaSCRNOUeZVPu8tJk5LpbwdbA3+6BYPYCj3TdIItJ1I5ANVEa4Q95m
         w3Pqom3BMDwMrAXAoNgngBhC/HxysQRKD3Sk/IqGF8KXPJMhG3km8E36d488q3zAhNqC
         7Plno6OiBajCMqMHxvmBID9FFDjlAKmivVw75gAi+8qVtA4oPlHah/TEIT4111kgyHuJ
         GQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704694911; x=1705299711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTagxW2qGB+SOLygMjXPo1Qtb5o4FGjhXHBVBibN0pU=;
        b=TEVoCREC3yfIldLO67X3EEi7ou3ug3+YEJ6QrI2DbCzktz/BsReFg9fq/2f3emnpVP
         05WEyUFbNrPhnT3kA0EO5dWRRJ5kH8DMMwmO71WbT1enl57vgz8aMw8wAXsSo2Xn2zzV
         9qQ6dRkBSMaFLTxRouaxkjEcdAjoWpQCUrrDlpx5j7pfncgZHPwyueum//BNrUN8T6in
         NvxiNi4YuNRQV+RjoCmpJGRvVuUgLfT2LOISs8FenDqqrWjehO32q0XHajWKfOxXwkJY
         CppL7Fax1znQUbrQ9HywsKxzceEpN63rN80JYRh6N60dFNKf55SNQCUVR8rZwEbDavJw
         K3GA==
X-Gm-Message-State: AOJu0YxnvntvZFWoudOMfKl5QrQxp4Isb/5fnd/4tAb2jKq0MkrXFbJF
	CNT4navZR3tg+LofLNt0n15HXRYGw3aCvg==
X-Google-Smtp-Source: AGHT+IFa/8crDGiw23IVD1Re4sfunNDvOsjvdYD9ocKdSLdiRngJSe7dZWlLFJzqhXakKcaX9nv6eQ==
X-Received: by 2002:a05:6871:341e:b0:1fa:f86b:8624 with SMTP id nh30-20020a056871341e00b001faf86b8624mr904328oac.19.1704694911244;
        Sun, 07 Jan 2024 22:21:51 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i12-20020a9d53cc000000b006dba99e1835sm1274322oth.4.2024.01.07.22.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 22:21:50 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 07 Jan 2024 22:21:45 -0800
Subject: [PATCH v4 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240107-fencei-v4-1-d4cf2fb905d3@rivosinc.com>
References: <20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com>
In-Reply-To: <20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704694908; l=7194;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=44jA1SP4uAeWO8J8wsxBQ+ZD40NMHu45EJStFpvhUWw=;
 b=D7UBMh9ebhLewE4U2l7cKbc38/hZBpH6xpofpr+GzFrjeRWkPTAn7+VNKdzVmd8uEW+nIITMh
 tylX6iA10nEDdAPm3eerU9jJAkXoOSV9+UJ82fUbrUu5dM88k8NUmdj
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
optimization of cross modifying code. This prctl enables userspace code
to use icache flushing instructions such as fence.i with the guarantee
that the icache will continue to be clean after thread migration.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/mmu.h       |  2 ++
 arch/riscv/include/asm/processor.h |  6 ++++
 arch/riscv/mm/cacheflush.c         | 56 ++++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/context.c            |  8 ++++--
 include/uapi/linux/prctl.h         |  4 +++
 kernel/sys.c                       |  6 ++++
 6 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 355504b37f8e..60be458e94da 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -19,6 +19,8 @@ typedef struct {
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
+	/* Force local icache flush on all migrations. */
+	bool force_icache_flush;
 #endif
 #ifdef CONFIG_BINFMT_ELF_FDPIC
 	unsigned long exec_fdpic_loadmap;
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..7eda6c75e0f2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -84,6 +84,9 @@ struct thread_struct {
 	unsigned long vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
+#ifdef CONFIG_SMP
+	bool force_icache_flush;
+#endif
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
@@ -145,6 +148,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
 #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
 
+#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
+extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 55a34f2020a8..f483b6090c27 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -5,6 +5,7 @@
 
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/prctl.h>
 #include <asm/acpi.h>
 #include <asm/cacheflush.h>
 
@@ -152,3 +153,58 @@ void __init riscv_init_cbo_blocksizes(void)
 	if (cboz_block_size)
 		riscv_cboz_block_size = cboz_block_size;
 }
+
+/**
+ * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in userspace.
+ * @ctx: Set the type of icache flushing instructions permitted/prohibited.
+ *
+ * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in userspace.
+ *
+ * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in userspace. When
+ *   ``per_thread == 0``, this will effect all threads in a process. Therefore,
+ *   caution must be taken -- only use this flag when you can guarantee that no
+ *   thread in the process will emit fence.i from this point onward.
+ *
+ * @per_thread: When set to 0, will perform operation on process migration. When
+ *  set to 1, will perform operation on thread migration.
+ *
+ * When (per_thread == 0), all threads in the process are permitted to emit
+ * icache flushing instructions. Whenever any thread in the process is migrated,
+ * the corresponding hart's icache will be guaranteed to be consistent with
+ * instruction memory. Note this does not enforce any guarantees outside of
+ * migration. If a thread modifies an instruction that another thread may attempt
+ * to execute, the other thread must still emit an icache flushing instruction
+ * before attempting to execute the potentially modified instruction. This must
+ * be performed by the userspace program.
+ *
+ * In per-thread context (eg. per_thread == 1), only the thread calling this
+ * function is permitted to emit icache flushing instructions. When the thread
+ * is migrated, the corresponding hart's icache will be guaranteed to be
+ * consistent with instruction memory.
+ *
+ * On kernels configured without SMP, this function is a nop as migrations
+ * across harts will not occur.
+ */
+int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)
+{
+#ifdef CONFIG_SMP
+	switch (ctx) {
+	case PR_RISCV_CTX_SW_FENCEI_ON:
+		if (per_thread)
+			current->thread.force_icache_flush = true;
+		else
+			current->mm->context.force_icache_flush = true;
+		break;
+	case PR_RISCV_CTX_SW_FENCEI_OFF:
+		if (per_thread)
+			current->thread.force_icache_flush = false;
+		else
+			current->mm->context.force_icache_flush = false;
+		break;
+
+	default:
+		break;
+	}
+#endif
+	return 0;
+}
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de6134..0146c61be0ab 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -297,12 +297,14 @@ static inline void set_mm(struct mm_struct *prev,
  *
  * The "cpu" argument must be the current local CPU number.
  */
-static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
+static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
+					 struct task_struct *task)
 {
 #ifdef CONFIG_SMP
 	cpumask_t *mask = &mm->context.icache_stale_mask;
 
-	if (cpumask_test_cpu(cpu, mask)) {
+	if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush ||
+	    (task && task->thread.force_icache_flush)) {
 		cpumask_clear_cpu(cpu, mask);
 		/*
 		 * Ensure the remote hart's writes are visible to this hart.
@@ -332,5 +334,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 
 	set_mm(prev, next, cpu);
 
-	flush_icache_deferred(next, cpu);
+	flush_icache_deferred(next, cpu, task);
 }
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..ec731dda5b8e 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,8 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
+# define PR_RISCV_CTX_SW_FENCEI_ON	0
+# define PR_RISCV_CTX_SW_FENCEI_OFF	1
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 420d9cb9cc8e..e806a8a67c36 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -146,6 +146,9 @@
 #ifndef RISCV_V_GET_CONTROL
 # define RISCV_V_GET_CONTROL()		(-EINVAL)
 #endif
+#ifndef RISCV_SET_ICACHE_FLUSH_CTX
+# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_V_GET_CONTROL:
 		error = RISCV_V_GET_CONTROL();
 		break;
+	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
+		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
+		break;
 	default:
 		error = -EINVAL;
 		break;

-- 
2.43.0


