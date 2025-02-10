Return-Path: <linux-doc+bounces-37683-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA6A2FC2F
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 22:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F95218865ED
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C307A24FBF8;
	Mon, 10 Feb 2025 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tZ+JjSQA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE024CEDF
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223370; cv=none; b=MBZ93ckQQcwNgfm3t0sa7ltP9vGb/uVbl546XYbCQcuksVrgLD3ZKPumyfj5rercyqQVVhnC0arpyDAvg/pVJuE7s8E2VMMzDScDlbVbFKwaL1o+xuJKQC+HU81YjzWDFwViRIhocbGP5ArMiKvm9XNNgjkWadtKf5NfcFLR4rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223370; c=relaxed/simple;
	bh=FpB5O8tTVYsJf4s/U7ogtYS7K3aviElxXOMssz8eUCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOJ2zT5NrixLRd2X/zgvJ8Ga5zPONO/sZTy/R4v6WAZxhCh355cFAFq6++K7yRS/fpkc/U+AKlCgNRu2BsUivbp/4UTRFwwnXugH3gTmhQQnZAYfUPPQkC9wOe939zQpsXls2pTOu+v9SRxpWd9qz6/xoRzrWZTg1wB8ceFiZi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tZ+JjSQA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436249df846so33001895e9.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223366; x=1739828166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9JWUPguvJXyATshOaEX8SYplIWPzd3JQCRzjjvJvmU=;
        b=tZ+JjSQA+Ap6lIB85/I7ByYMIbZ+WtVNR8gDiU8JDzHacv0HnyWiJNBFkp0+sUHEuP
         jGADN5Ewf4zrMTiWKBetNqVgqywQbW9etDsn0ka8IzjnhtDp8Yd7vVrvccBYLypEiti1
         +AsdvZfm0HisZW4VcHdbJ3ffUoii08xZAw5ruW+9oRe7TspsTFFOhc4W3tMKfUU6QrQ1
         EaXikjnTQOr5ZGWrw8Olq9XlQThD9+YyioCfma7Sls2yBMMrg2YSAz2jt4Hb/CYiPkjM
         CHrPwut7vvCAsHJuGwUxlwSn0Q/9vM7WD2mWqgC78kYofbsVs7uJ0glN2sl9ayWUfW1a
         G3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223366; x=1739828166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9JWUPguvJXyATshOaEX8SYplIWPzd3JQCRzjjvJvmU=;
        b=qFzvD0LzweypTEVBFKs4m7scQ70AgPklbmjX2+1Uk6E2euZS11uUVKTVdRUtP7AS39
         TGXo8Qj78+zE+pXu3TApWvzotKx7dPKLsvO1KximhDFDSzFTMtrh7KLl92PwsfM5bDFa
         w7V0TlGzYjjhRb6UeyZ1Ywrqsi0b5k2WzRUThzxLqEqT9Uz294oS1JBis/ULxBUqPEMi
         nNGJ0ILb++LcbOsMwq8xDp1/UF47Hp2pRz0WnL/gEKre6g8V0hH53HIW1M5asE+cTqg0
         hZqfJp/ZUfiu+0dfSVNu7MAQnvOVRJ9p2pq0zl3X0HIpNEJSJYbBOG1y2bTbF1W2OEIv
         dang==
X-Forwarded-Encrypted: i=1; AJvYcCUk6QZUH0SuISzA3HlM8PYmw+6zTowTjZQpFwTorWQclu+Yk0/JF4+g6aBZdiV3Z3fqOuwwFy480DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3DeFBwsHnsySw8wi/hYQcsO4IRLmN1DwYY7MyICWQHdrxJfnn
	UDK5lf4v8BLKuQ3npBoUbTEy1h2a/50yL43oPhBwS49GaXrhWhwkAAWQI1ZWMHc=
X-Gm-Gg: ASbGnctPzp8h+0O7E2K9gyXl3SbDGxtoOcFNeJVBwCkiRN72m7oIayRMDHJFAeHCVBz
	B/04e3ObanPR9A5mspydXJ+mSfGol6XjURPiL4jXaYESA6a4aIGywGxCJQEvE6fk8fkLI1j6qWU
	hP1D304WHhZr1VxcrxRoCM0mR8y+7W7ZLes/oBc80ZAOu6t/Fg1ldEbSJMLaKUIylJUFnfhh1+h
	0X8n+/hcoiuUkbCrftjTBKTNksDa7q5ShoctCiAZN7S9mqLPkE/qMAqSoCB4AQo40CkujB+HUJz
	M2z87a0a0uVPawwu
X-Google-Smtp-Source: AGHT+IFCUBo5ZJUEfRAM++W2IWKipAW2usGjFmvIL0zfj471rainYZRPFDdB0RmyHu2I/2e1UVroug==
X-Received: by 2002:a05:600c:1d86:b0:439:4499:54de with SMTP id 5b1f17b1804b1-439449955c6mr51321255e9.31.1739223365934;
        Mon, 10 Feb 2025 13:36:05 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:05 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 02/15] riscv: misaligned: request misaligned exception from SBI
Date: Mon, 10 Feb 2025 22:35:35 +0100
Message-ID: <20250210213549.1867704-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the kernel can handle misaligned accesses in S-mode, request
misaligned access exception delegation from SBI. This uses the FWFT SBI
extension defined in SBI version 3.0.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h        |  3 +-
 arch/riscv/kernel/traps_misaligned.c       | 96 +++++++++++++++++++++-
 arch/riscv/kernel/unaligned_access_speed.c | 11 ++-
 3 files changed, 105 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 569140d6e639..ad7d26788e6a 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -64,8 +64,9 @@ void __init riscv_user_isa_enable(void);
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
 bool check_unaligned_access_emulated_all_cpus(void);
+void unaligned_access_init(void);
+int cpu_online_unaligned_access_init(unsigned int cpu);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
-void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7cc108aed74e..66eef398bad4 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -16,6 +16,7 @@
 #include <asm/entry-common.h>
 #include <asm/hwprobe.h>
 #include <asm/cpufeature.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #define INSN_MATCH_LB			0x3
@@ -635,7 +636,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -646,6 +647,13 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
+}
+
+static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
+{
+	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
+
+	check_unaligned_access_emulated(NULL);
 
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
@@ -654,9 +662,10 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	 */
 	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
-		while (true)
-			cpu_relax();
+		return -EINVAL;
 	}
+
+	return 0;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -688,4 +697,85 @@ bool check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
+static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
+{
+	return 0;
+}
 #endif
+
+#ifdef CONFIG_RISCV_SBI
+
+struct misaligned_deleg_req {
+	atomic_t error;
+};
+
+static int sbi_request_unaligned_delegation(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
+			SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(ret.error);
+}
+
+static bool misaligned_traps_delegated;
+
+static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
+{
+	if (sbi_request_unaligned_delegation() && misaligned_traps_delegated) {
+		pr_crit("Misaligned trap delegation non homogeneous (expected delegated)");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void
+cpu_unaligned_sbi_request_delegation(void *arg)
+{
+	struct misaligned_deleg_req *req = arg;
+
+	if (sbi_request_unaligned_delegation())
+		atomic_set(&req->error, 1);
+}
+
+static void unaligned_sbi_request_delegation(void)
+{
+	struct misaligned_deleg_req req = {.error = ATOMIC_INIT(0)};
+
+	on_each_cpu(cpu_unaligned_sbi_request_delegation, &req, 1);
+	if (atomic_read(&req.error) == 0) {
+		pr_info("SBI misaligned access exception delegation ok\n");
+		misaligned_traps_delegated = true;
+		/*
+		 * Note that we don't have to take any specific action here, if
+		 * the delegation is successful, then
+		 * check_unaligned_access_emulated() will verify that indeed the
+		 * platform traps on misaligned accesses.
+		 */
+	}
+}
+
+void unaligned_access_init(void)
+{
+	if (sbi_probe_extension(SBI_EXT_FWFT) > 0)
+		unaligned_sbi_request_delegation();
+}
+#else
+void unaligned_access_init(void) {}
+
+static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
+{
+	return 0;
+}
+#endif
+
+int cpu_online_unaligned_access_init(unsigned int cpu)
+{
+	int ret = cpu_online_sbi_unaligned_setup(cpu);
+	if (ret)
+		return ret;
+
+	return cpu_online_check_unaligned_access_emulated(cpu);
+}
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 91f189cf1611..2f3aba073297 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -188,13 +188,20 @@ arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
 static int riscv_online_cpu(unsigned int cpu)
 {
+	int ret;
 	static struct page *buf;
 
 	/* We are already set since the last check */
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
 		goto exit;
 
-	check_unaligned_access_emulated(NULL);
+	ret = cpu_online_unaligned_access_init(cpu);
+	if (ret)
+		return ret;
+
+	if (per_cpu(misaligned_access_speed, cpu) == RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
+		goto exit;
+
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
@@ -403,6 +410,8 @@ static int check_unaligned_access_all_cpus(void)
 {
 	bool all_cpus_emulated, all_cpus_vec_unsupported;
 
+	unaligned_access_init();
+
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
 	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
-- 
2.47.2


