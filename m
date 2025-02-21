Return-Path: <linux-doc+bounces-38928-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50FA3F7E4
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 16:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8684236A7
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 14:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9F4215050;
	Fri, 21 Feb 2025 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hrHAlFht"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6D213E86
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149853; cv=none; b=kLkPBLVLEB3KDn+SnB9NBTRSbDwq5Mg/I9nFk8HETTaNf018WDKN+J4Qoasdkmj/dvRad8s54RCl3WA/rF5ziadwy3zfcutel4U3FeslVu4iYNs1gndW/ZLnXKmkXjgYBYYoMuMUolt1z1pKpYpexDtwv+Rg2YVFQWsGQ7VbLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149853; c=relaxed/simple;
	bh=7NZ83h5NX7SAZm6QCFNB7KR8wRb4XkVpB5XJ+5Fh86w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9bxH3pGvchoWGCxY2yKNvMS424bdufgstJ8WChPL+y2GwxIxmIzi4KMSvby2JKGiyzLJupji6u/rxYl1E6Ja09JY0zjm1Q+8sUbrStuZ0fjAIwTRwUoHGeXQ1JfJEpsYjdzesZFjunEf5C3/56zQESvbTDZK9z5PUnlroNyROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hrHAlFht; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f6475f747so991517f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 06:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149849; x=1740754649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn5/NCGaSe0l3cHfov0pCSQdo/p0YZ9zobfu9KR9U04=;
        b=hrHAlFht16sdzWjg+JeYFEEOj8Jkg+QPLaBh3nGAuZLY+8OvcM1/il34NdIQMCF1CB
         7sWb9oBEmm+ywToOs71Kat85XR28ZEt59GgrYvr8Bf0XN4Km9tNkOdB0UyvA7DvXCd6s
         Sm43kkuYRSWps1NjKpSX7YMFYz6GH5JiM6u4m8s7Tiit1JHri5FSC/WtTbMZAbhdWK77
         57Y/WaPUI8EhNcpkCzcfAqkaUIeSzZRrBVYCCuzPF2E8+lK6gCwimWaGD5gFTPtJXF8q
         IeMC+obirmcTCdntU99ctEEuU9sfy5ttcXCMXzfB+1ElAa5clowRyvFcMzDWU6/WkPyn
         MgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149849; x=1740754649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn5/NCGaSe0l3cHfov0pCSQdo/p0YZ9zobfu9KR9U04=;
        b=BqBZCJ8ZhFwXFY73NbPEIZpnZX0z9KfSqgygu3QFHRistEIDRxgCdc+eYlmnLA+eM+
         n+FLfDrPuRhAlFmSd3eo0vFkIBjGu6VQS/pmXYAYTayV3JSLkj1B86Fxcf8LURsJM4Si
         W5VZQ/vqKkHDqObXSIkDPbH5aoHyKo7ev09RUmJGa8Rp/UTHL/LpJbC0E0WOrEM4kaBF
         my9aShL2utShMjaWf75C5i42SGxphl2US/gKBiB8ls5T6skTci6NxGJzK3ZL0LdiB8TO
         j9Y9OjibCy8d2eYLS8R52f4gZpQXVP5BN6VhDRoF4ddUL9XpSSZzn0FK+Ege9ZwlXo0I
         rP0A==
X-Forwarded-Encrypted: i=1; AJvYcCWy2stOmvquIUBOhfJL5oeAw64yXuXEP9EL3yQI0hqSDncp3hcl076/AjqK34dGw0psK9H0ms76u1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9MLEtJZjGd/BosdapblTnRTPnq2Y6a4oZHzYcIs+Mtn09/K70
	5/zVhH1ZbfW3WrxHNkBYOk0auCD1W4+zZW9Mo/TskGbeoJDUqIIcL9kcQLz7rxw=
X-Gm-Gg: ASbGncttY+hVDxCug31zLV2xpk6vWx6V/xjXtugp6nRoFs77gej28n0dLzTiB+5Gcnm
	oNcb/X/a5QHgglKvn+xDe0XBlNMliFmLbqygilMp24V2aO5DsiN5Vu3MB2Knc7SBqIbp4y38p77
	/88r7bP/ZlsxvwoBSHvdiDziaMRmaVKk90cC2aefOBpww4zpeI2kH6clgSVVOJECxX32nSM2xOA
	7CpyCEWlXDdhGGo5XdSRtufAaPCl95GQ21CEBi2VqN6gyOf1zI/A8lM6MFEblflExH5BwgbQQzU
	Lg1lBdoqX3sOjA==
X-Google-Smtp-Source: AGHT+IHx/xR0hU26C0luF7JCqRur1mrlX3ev+Org0F1aBDScnbAW8fdMK9SKCnjI9IEZG4FO1cj34Q==
X-Received: by 2002:a5d:64af:0:b0:38f:452f:9f89 with SMTP id ffacd0b85a97d-38f6f0ae2c4mr3479590f8f.50.1740149849237;
        Fri, 21 Feb 2025 06:57:29 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4423sm23984504f8f.11.2025.02.21.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:28 -0800 (PST)
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
Subject: [PATCH v2 7/8] riscv: Add parameter for skipping access speed tests
Date: Fri, 21 Feb 2025 15:57:26 +0100
Message-ID: <20250221145718.115076-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
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
 arch/riscv/kernel/unaligned_access_speed.c | 162 ++++++++++++++-------
 1 file changed, 107 insertions(+), 55 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index d9d4ca1fadc7..241d47004f37 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -24,6 +24,9 @@
 DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 
+static long unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
+static long unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN;
+
 #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 static cpumask_t fast_misaligned_access;
 static int check_unaligned_access(void *param)
@@ -130,6 +133,50 @@ static void __init check_unaligned_access_nonboot_cpu(void *param)
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
@@ -191,9 +238,14 @@ static int riscv_online_cpu(unsigned int cpu)
 	static struct page *buf;
 
 	/* We are already set since the last check */
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
 		goto exit;
+	} else if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
+		per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
+		goto exit;
+	}
 
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
@@ -203,6 +255,7 @@ static int riscv_online_cpu(unsigned int cpu)
 
 	check_unaligned_access(buf);
 	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+#endif
 
 exit:
 	set_unaligned_access_static_branches();
@@ -217,50 +270,6 @@ static int riscv_offline_cpu(unsigned int cpu)
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
@@ -372,8 +381,8 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector()) {
-		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
+		per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
 		return 0;
 	}
 
@@ -388,30 +397,73 @@ static int riscv_online_cpu_vec(unsigned int cpu)
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


