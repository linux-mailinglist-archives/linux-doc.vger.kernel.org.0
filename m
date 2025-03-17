Return-Path: <linux-doc+bounces-41091-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DDDA65A17
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 18:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CFEE19C4475
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 17:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14671DDC16;
	Mon, 17 Mar 2025 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tvOaMH18"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C881B6D18
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231296; cv=none; b=m4bAR2fpIC7/GXrLSnUZNXWL1RZruSDhlkBP1bcWGlavLzIQz93dLX7pN5mdb0nZWDn83GtZKgs+4s42fUeOs4DR6iHaYkDAB7KY2IRhPGelLYtxgcFBv4LtyZJzoIMmMyZejQD0A17gyYu8Ghyob9R9oiY8/yZyHHDMGUXefC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231296; c=relaxed/simple;
	bh=OtY2EOfT7IN04wGt9UYX2OMYcXbBRcTX/gnN/1KIezs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bHnBhD9rbXbBbIaDAgGxQR6TU1YToaiKgffRVhgPJXGVGWTZl7S33TNKtvmM+VzuXuk0d73gXQSu8NHQdxOs6ltNnewvVt1ytH3xVa7P0zYlwtGhWYEpRLeuEOATTx2+7Ad0NmQ0nqkDOJ6URbm676xSqVMGLvp+18GzsyAqwfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tvOaMH18; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso17141395e9.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231293; x=1742836093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k1emOUih8WEclNZ1DDbkx/NdClZ1In2F+3XrsHVDoI=;
        b=tvOaMH18T9CtLFZq5KraGw0x+pTpzzEMKdmbxJqRWSqYJXMXdxs/OS48Gu3giV/9y1
         lu4om5ULPsFngpEHwv6tlRnUVQ1C5sFKkMDsK3P68kgNziaUpkhpI9muayQtHLEnZp90
         werpjkD909udm6NWc3AaJUFruVSa/UMrrTn1G13o3zdRstM7kLw/mYS2qcPRED3j/51A
         tpBCm3kUlRFAgZjBZUbvBUiZeg2zWFhJYuXZFWm96MQpx1P0tNViDmMzIACf/wipWMr7
         oM9F5NCGe48K+rKy3MZlII2Q/jU2nnhn1WjrVtKFJG+b+jeoDDtn4q/iliCn59hzPkDQ
         BQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231293; x=1742836093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k1emOUih8WEclNZ1DDbkx/NdClZ1In2F+3XrsHVDoI=;
        b=xCP6bTsqljwTGH+gImrTb+Stt3F5ZcCw0JL4+PhLbSw0RhBOkNi3P4mfWia2dqzg7W
         GwGtrazYYKBDNkaZ9qncFPRJeTvT6QbUzsUjzxJN6DyQikeMTZ1ZvISXZCL7g4aNmfuR
         hV5pWigmCmXyv0a+Mx724mOwP6WIl3W1k/odVEqvXrQ+zai/o4OLFcL/FvJTPl4hQDyO
         dDX2weT+qUpxHFKeWrAW/SXm63riHhBcqbR0rLXFq0kbNdWxpdVySu6p9ImtzL4yoGpJ
         r1ile7u5fuFeOf5HQPpfYFX7Qr33Wm1F/Nz9proZq9mAfyCG76O77BgcMu4k0BnulSf9
         +yHg==
X-Forwarded-Encrypted: i=1; AJvYcCVEwp4KAxWcSRKdPIhbjGf3TypRX/5gq551ruYkgrZ+xooh11nwoRfwG6pmagGtXM6HMwKoqIWkasY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7DjLE6GMsSFfRy7mQZP1UxJtT89uoIX/MF5lqZPPK/twd/su0
	s1fqNsvLi3BTRT9DDkEFOjFQLtx+DiDXzf8rD0XL094UYAwb3MhTbarZ+PiUZIo=
X-Gm-Gg: ASbGncsRi8ZdOrG7iQ/2vhGbX0cHBGFRu2UzlooFL/4yj61Q5jYan//zL47tDfJ2zHP
	/09qlcalaXTf3Xr4RWZiOksEyUkHlIryL4LAqfTZNJq2Z9XxPKrOEIiWJX5+j26YpnAbHMyPqq7
	3RWlUrSLLNsY4BQ3VE8jDdSslAEZ6Kj2L3vLn8K8p9AJXyKJ1yDN7EbDc3EI/We6Yht+LEJc7QJ
	Ikn5OAfYl1Ln8E6WwFd3MQtZliFMGRWJc+dKeoVE0nIczH1qCQWmrRM+MaL/wQZnTGQvzR1KuSk
	L9Fl3hRAicwgldlkDvJOeHk73JNprYEFuIvrRqIhLLbmoA==
X-Google-Smtp-Source: AGHT+IGirZlNuMI7AkYZLJxITsbB2mx0iqkOoTwEVui95+l6OuB5d7SYtKlA2CI4i4rX//+fE8Z8jQ==
X-Received: by 2002:a05:600c:468a:b0:43c:fb36:d296 with SMTP id 5b1f17b1804b1-43d1ed0e03dmr115529165e9.25.1742231292646;
        Mon, 17 Mar 2025 10:08:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:11 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 05/18] riscv: misaligned: request misaligned exception from SBI
Date: Mon, 17 Mar 2025 18:06:11 +0100
Message-ID: <20250317170625.1142870-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h        |  3 +-
 arch/riscv/kernel/traps_misaligned.c       | 77 +++++++++++++++++++++-
 arch/riscv/kernel/unaligned_access_speed.c | 11 +++-
 3 files changed, 86 insertions(+), 5 deletions(-)

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
index 7cc108aed74e..fa7f100b95bd 100644
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
@@ -688,4 +697,66 @@ bool check_unaligned_access_emulated_all_cpus(void)
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
+static bool misaligned_traps_delegated;
+
+static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
+{
+	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
+	    misaligned_traps_delegated) {
+		pr_crit("Misaligned trap delegation non homogeneous (expected delegated)");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void unaligned_sbi_request_delegation(void)
+{
+	int ret;
+
+	ret = sbi_fwft_local_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
+	if (ret)
+		return;
+
+	misaligned_traps_delegated = true;
+	pr_info("SBI misaligned access exception delegation ok\n");
+	/*
+	 * Note that we don't have to take any specific action here, if
+	 * the delegation is successful, then
+	 * check_unaligned_access_emulated() will verify that indeed the
+	 * platform traps on misaligned accesses.
+	 */
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
+	int ret;
+
+	ret = cpu_online_sbi_unaligned_setup(cpu);
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


