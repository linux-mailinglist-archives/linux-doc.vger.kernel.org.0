Return-Path: <linux-doc+bounces-39909-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B15A4DD5D
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 13:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3576188FB74
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 12:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0342040BF;
	Tue,  4 Mar 2025 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HMqkrFkx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A7203718
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089628; cv=none; b=qiwY4mYCNUAugoUAfSghm3HsZtGDKwpPxAbtyBB1OwuPnP73WnyIaOCLjGHr6blqnsKYPCAz1iJb/CK6fVwIKNHpcdfsCAVl82Ys16HPAuyQeeVxAMvMGNdyRMGMjHQyhsXeQqwDPg9kVFt/bpSX98L33Rn1Z38HkRSoWpirdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089628; c=relaxed/simple;
	bh=bN3N/w0YpFIFqTd7bEq/RU5i6s96R3kdEXdmYdu8VEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fr+Z6Nee/9n3f9LBL5KBKknGu9Yg0mZgSzBasGAxVyCyU+q8oZ1/z4UT1hGD42RZJY06X9WJvZLOQ6b8mcxw6ioOsC433ymzfgvcoYGVcyzRs3/WF++YKo8XKTXU/hKikUpJi1jYqT0Jv5IiTXs3v2+zsolcyDzRAV2y1IUajM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HMqkrFkx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bc638686eso10699405e9.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 04:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089625; x=1741694425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsvuidqxLzlkQbg+w8AmHQXcpq7FTNK4bF6tx3heuhc=;
        b=HMqkrFkxs7Zpcwb+47wi8Th/N0do9UW//3rMHRHjBl2TlNzSIZLX7dlRxZMKnqfgWF
         DZrDcxoyu6H3WOGdI6V6Ea5ZAPI1hZrqUU/oFBUe5Y+GEEs9kixGL3pMyFbQ6IQI0j4P
         rn/Yopp7azJKGvLTJvkbQlffYaR+3rwVb2A35zwx53tbLpqwIL41cUMCea+Ou95ZOfzq
         K2Y6QeQmnj6O/P9nc5r2atXzXNwxPRY2AFsv4rWb0Knh/R+k9NwBrd8p9Ttl+V20T8BD
         p3Mit5W5lmJGl3bd6ZT94i2S5z9q/SWxOBtMxfrefH8r48nvspW63CnF9sWPdHTwZGRt
         2HEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089625; x=1741694425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsvuidqxLzlkQbg+w8AmHQXcpq7FTNK4bF6tx3heuhc=;
        b=BBDBg4HI9w+Iky4WhjayQ/4K5y5DtFMKLWBj3AxFOmMsjBnOw5lI5G3ogT87cJdlNG
         lUiQaPgUU8YACFyxMHGqgsOe0osHaNZzGjNrVXTrfSMiTSmlMz/4fMlvJItwQqKZFhCV
         Jwyhkd0AURFbj1DsgbyZ1KeyUBKDWCcOXPVOourIE7/0Udr5udCeKdkQjE+R7PJ4GI+8
         do+v2VJ52BdStnPYSn91SUbnXmazpbeIsY8KVblX6rpEHiocZgZz/FGPucivZ7pTj0qc
         N3nfXIYCteLfTRZxQS8xTn0frc6IBKDAVfY9KcyCUJ3N71E4EZPKSpTe//psAfNPyFj6
         xVhw==
X-Forwarded-Encrypted: i=1; AJvYcCXLkk+JdiwihhV2sm1ocrGX4zY6AJdoYQqbYP2hq0nA7nul3fl6UWa2/iwyPtEQw+oo7iIreXdndEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh9c+VGwGvCTWXtZEi+jv6zwyNkBOFSZGdj9Kfj6kR8ls84RGZ
	gF/Kc9kRWmJ0LvKBuyRnQoXMfHAEZoHG5QCfd64otYEanMvwG+LMzpl8JqMZjJ4=
X-Gm-Gg: ASbGncssIqBsGZ8/PNlcOqmoZnGY2GS+zU8i7wBgEoHHvNzfnYUpAIM4mOzrnrbAN8Q
	WzwNcv77CITV1rHdFIBQ6smroqSzBMyXOPIJD6v4M1SRynJsYBF8ga34Pj9WWqnDiGSDybXltlY
	vL2GmMh+uJq/eKSDFbkF9p20ZhYzpoUXXTFH5a+YrAER/dwS5NR1xYmAPWHZBjvZOT2hBhOB7sx
	kX7frdT90ou2DuuDqckvV5VFUlPOGTZWSBsMxtiXzX5Nul+DNVG89VCFo8G40kkY/YCQQjp4SvX
	YkSjJ26T5UrMx0tqx3fU1W5O8VkAC4x0
X-Google-Smtp-Source: AGHT+IGQ5X8LL0DZ3UPHsnfOapJsPrretEHDDQzUDGpCH+nIE/GuITrQTn3tEhqjhrUytGCLIAwsgA==
X-Received: by 2002:a05:6000:144a:b0:391:bc8:564a with SMTP id ffacd0b85a97d-3911561aaeemr2394550f8f.22.1741089624562;
        Tue, 04 Mar 2025 04:00:24 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844ac6sm17312277f8f.71.2025.03.04.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:24 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
Date: Tue,  4 Mar 2025 13:00:22 +0100
Message-ID: <20250304120014.143628-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow skipping scalar and vector unaligned access speed tests. This
is useful for testing alternative code paths and to skip the tests in
environments where they run too slowly. All CPUs must have the same
unaligned access speed.

The code movement is because we now need the scalar cpu hotplug
callback to always run, so we need to bring it and its supporting
functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 187 +++++++++++++--------
 1 file changed, 121 insertions(+), 66 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index d9d4ca1fadc7..18e334549544 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -24,8 +24,12 @@
 DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+static long unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
+static long unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN;
+
 static cpumask_t fast_misaligned_access;
+
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 static int check_unaligned_access(void *param)
 {
 	int cpu = smp_processor_id();
@@ -130,6 +134,50 @@ static void __init check_unaligned_access_nonboot_cpu(void *param)
 		check_unaligned_access(pages[cpu]);
 }
 
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static void __init check_unaligned_access_speed_all_cpus(void)
+{
+	unsigned int cpu;
+	unsigned int cpu_count = num_possible_cpus();
+	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
+
+	if (!bufs) {
+		pr_warn("Allocation failure, not measuring misaligned performance\n");
+		return;
+	}
+
+	/*
+	 * Allocate separate buffers for each CPU so there's no fighting over
+	 * cache lines.
+	 */
+	for_each_cpu(cpu, cpu_online_mask) {
+		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+		if (!bufs[cpu]) {
+			pr_warn("Allocation failure, not measuring misaligned performance\n");
+			goto out;
+		}
+	}
+
+	/* Check everybody except 0, who stays behind to tend jiffies. */
+	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
+
+	/* Check core 0. */
+	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
+
+out:
+	for_each_cpu(cpu, cpu_online_mask) {
+		if (bufs[cpu])
+			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
+	}
+
+	kfree(bufs);
+}
+#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
+static void __init check_unaligned_access_speed_all_cpus(void)
+{
+}
+#endif
+
 DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
 
 static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
@@ -188,21 +236,29 @@ arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
 static int riscv_online_cpu(unsigned int cpu)
 {
-	static struct page *buf;
-
 	/* We are already set since the last check */
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
+		goto exit;
+	} else if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
+		per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
 		goto exit;
-
-	check_unaligned_access_emulated(NULL);
-	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-	if (!buf) {
-		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return -ENOMEM;
 	}
 
-	check_unaligned_access(buf);
-	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+	{
+		static struct page *buf;
+
+		check_unaligned_access_emulated(NULL);
+		buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+		if (!buf) {
+			pr_warn("Allocation failure, not measuring misaligned performance\n");
+			return -ENOMEM;
+		}
+
+		check_unaligned_access(buf);
+		__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+	}
+#endif
 
 exit:
 	set_unaligned_access_static_branches();
@@ -217,50 +273,6 @@ static int riscv_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-/* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static void __init check_unaligned_access_speed_all_cpus(void)
-{
-	unsigned int cpu;
-	unsigned int cpu_count = num_possible_cpus();
-	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
-
-	if (!bufs) {
-		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return;
-	}
-
-	/*
-	 * Allocate separate buffers for each CPU so there's no fighting over
-	 * cache lines.
-	 */
-	for_each_cpu(cpu, cpu_online_mask) {
-		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-		if (!bufs[cpu]) {
-			pr_warn("Allocation failure, not measuring misaligned performance\n");
-			goto out;
-		}
-	}
-
-	/* Check everybody except 0, who stays behind to tend jiffies. */
-	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
-
-	/* Check core 0. */
-	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
-
-out:
-	for_each_cpu(cpu, cpu_online_mask) {
-		if (bufs[cpu])
-			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
-	}
-
-	kfree(bufs);
-}
-#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static void __init check_unaligned_access_speed_all_cpus(void)
-{
-}
-#endif
-
 #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 static void check_vector_unaligned_access(struct work_struct *work __always_unused)
 {
@@ -372,8 +384,8 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector()) {
-		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
+		per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
 		return 0;
 	}
 
@@ -388,30 +400,73 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 	return 0;
 }
 
+static const char * const speed_str[] __initconst = { NULL, NULL, "slow", "fast", "unsupported" };
+
+static int __init set_unaligned_scalar_speed_param(char *str)
+{
+	if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW]))
+		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_FAST]))
+		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED]))
+		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED;
+	else
+		return -EINVAL;
+
+	return 1;
+}
+__setup("unaligned_scalar_speed=", set_unaligned_scalar_speed_param);
+
+static int __init set_unaligned_vector_speed_param(char *str)
+{
+	if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW]))
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_FAST]))
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_FAST;
+	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED]))
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	else
+		return -EINVAL;
+
+	return 1;
+}
+__setup("unaligned_vector_speed=", set_unaligned_vector_speed_param);
+
 static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
-	if (!check_unaligned_access_emulated_all_cpus())
+	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
+	    !check_unaligned_access_emulated_all_cpus()) {
 		check_unaligned_access_speed_all_cpus();
-
-	if (!has_vector()) {
+	} else {
+		pr_info("scalar unaligned access speed set to '%s' by command line\n",
+			speed_str[unaligned_scalar_speed_param]);
 		for_each_online_cpu(cpu)
-			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
-		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+			per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
+	}
+
+	if (!has_vector())
+		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+
+	if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
+	    !check_vector_unaligned_access_emulated_all_cpus() &&
+	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
+	} else {
+		pr_info("vector unaligned access speed set to '%s' by command line\n",
+			speed_str[unaligned_vector_speed_param]);
+		for_each_online_cpu(cpu)
+			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
 	}
 
 	/*
 	 * Setup hotplug callbacks for any new CPUs that come online or go
 	 * offline.
 	 */
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu, riscv_offline_cpu);
-#endif
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu_vec, NULL);
 
-- 
2.48.1


