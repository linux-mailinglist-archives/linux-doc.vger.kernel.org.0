Return-Path: <linux-doc+bounces-18530-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8496907C38
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 21:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36F711F21C93
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 19:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CC7152E17;
	Thu, 13 Jun 2024 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PghC1xDV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0A4152533
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306241; cv=none; b=n20HpwMp0AN+VIaakUiZKWTiWOIQ6jTRTDNhJcNMuWimxJIw1q8Nsmc8WXGYrPY6X12vHzOaZwRhNPl18hPzwceJaifGinFkRjxL0x4ZEE5JBIfZ72aduRBTmbYyU5c2RF7Blq0SgxDNUfr44yZgNxlQPdGEwHL6zWsChDR2nlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306241; c=relaxed/simple;
	bh=+jnJtiUScAEX7YebGNkKf8lf6RqHQioTg5h1y/TviSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeEFcyUDoY0WbrwTBiL38NqCbUJVeCKCMWwf2zG57BmQ/KceZwyFoe1byHfys0x9/jnFEd/mkE8UZRucN61icguBKPUBceBZQZDKB7/vbjbDnu9vRR3rAAjGYmBOTiYVQKG0riRHGjT0MzxfgvmArrVEivM6sJJzq+gG8HrEkYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PghC1xDV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f7028196f2so12182635ad.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306239; x=1718911039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2si2x/qxMiiRgx/ptA73I3ih5KSBTyIVIweBGPWOt8=;
        b=PghC1xDVcvoeRzTkSxuMFXK0jJO/4JFGVDpQCQYwx1JDHGatOuKUhsvMC/T9XTVxZq
         ts7INWTFFDqwPdVnfDq2EgnnvjRCR6KBm4dKNdeAoWJYGtgmWcWPw9VEQYqxI5slI36m
         GZfHy72ZjoOaV1e7sU5iZLj2n5pHPe3n5Z/DEhAmykCmkAaK+2qcuPwCAVK9Cw8H5QUL
         y8Mlvvce2YZVSkw9XsNl9DHOUX+CsSOp4l4rl0Uuo4jvAbHOjVkREnwzTyNgoCD5RCrW
         yIkGBuD4W1jKiodGmintUg1KaOm9/WwfI7awiv9dje6cXPrTg1vnI8264qAUUK122VnM
         n+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306239; x=1718911039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2si2x/qxMiiRgx/ptA73I3ih5KSBTyIVIweBGPWOt8=;
        b=JnZ6VjZC82MAZ+gQWR52KFwT6ZU41+fG7RSrDsvil/mX88GSAdH/wsZyM+lb6ZL8Lu
         DPDWab6oMJQHx0Xg1h2TaFDYnMOUEHc4CFGjHJu179ZU++uAcw4z6YKKJQi/JcYAwOZw
         1QIse0v4t+QQ/Y1dk1/NYWuigXqDWMnBo/I+WzkXT/kLO2sEyFApkaGhGVm4Z0ObjvCz
         gK1HXnoddcsXUE4iqpdvvayw5XIwauGLXEROY350NouVD8Ym1unaUMSCi0zCj3aM6PjZ
         o9aPZTeJItsGfYl1W3Sc0aKTloc1dOWZ2wYRH5AWSB36g+Dxcgw0C3HMX+2chSdIyf8H
         RZmA==
X-Forwarded-Encrypted: i=1; AJvYcCWe8zigEEhNzufSLiJvogK86egeD78AK1Df3tI+Yu2YsoK8M5x21povMxEMdBoofaFCR2w3vFDSb1Z2ogfdFKZbu1De1/qZPJD8
X-Gm-Message-State: AOJu0Yx22FbFdmPfhtA7TDdRl3PVibrG5+5mj7QQNXdd+G6uEnrfJL6r
	GU22IqfCnbReTtdnUAsZdPzYDUspjduP6OTVYHeOl0Wx+vsUi0KcJLSjAYjrHpU=
X-Google-Smtp-Source: AGHT+IEe/pgm4wbdzYk9w01vIQjdm01pqBBmuWzC0VnQ7Vhdd+iuX8Zf6okO8XfjDwZx3EhOCo7asg==
X-Received: by 2002:a17:903:2341:b0:1f6:7ee8:8935 with SMTP id d9443c01a7336-1f8629fef3bmr7650085ad.59.1718306239110;
        Thu, 13 Jun 2024 12:17:19 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:17:18 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] RISC-V: Check scalar unaligned access on all CPUs
Date: Thu, 13 Jun 2024 15:16:12 -0400
Message-ID: <20240613191616.2101821-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613191616.2101821-1-jesse@rivosinc.com>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, the check_unaligned_access_emulated_all_cpus function
only checked the boot hart. This fixes the function to check all
harts.

Check for Zicclsm before checking for unaligned access. This will
greatly reduce the boot up time as finding the access speed is no longer
necessary.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
 - New patch
---
 arch/riscv/kernel/traps_misaligned.c       | 23 ++++++----------------
 arch/riscv/kernel/unaligned_access_speed.c | 23 +++++++++++++---------
 2 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..8fadbe00dd62 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,31 +526,17 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+static void check_unaligned_access_emulated(struct work_struct *unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
-
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
-	/*
-	 * If unaligned_ctl is already set, this means that we detected that all
-	 * CPUS uses emulated misaligned access at boot time. If that changed
-	 * when hotplugging the new cpu, this is something we don't handle.
-	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
-		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
-		while (true)
-			cpu_relax();
-	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +548,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..70c1588fc353 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -259,23 +259,28 @@ static int check_unaligned_access_speed_all_cpus(void)
 	kfree(bufs);
 	return 0;
 }
+#endif /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
 
 static int check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+	bool all_cpus_emulated;
+	int cpu;
 
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
+		for_each_online_cpu(cpu) {
+			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
+		}
+		return 0;
+	}
+
+	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
+
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	if (!all_cpus_emulated)
 		return check_unaligned_access_speed_all_cpus();
+#endif
 
 	return 0;
 }
-#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int check_unaligned_access_all_cpus(void)
-{
-	check_unaligned_access_emulated_all_cpus();
-
-	return 0;
-}
-#endif
 
 arch_initcall(check_unaligned_access_all_cpus);
-- 
2.43.0


