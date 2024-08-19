Return-Path: <linux-doc+bounces-23252-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B837795767D
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 23:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471481F22941
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 21:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D52B1DC481;
	Mon, 19 Aug 2024 21:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Dr7oEpXW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB9315B54A
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102779; cv=none; b=PA3N0xCSSs4Uo6yztPMGcWJ3LXHgU6sgyRXukbXYe2prdhbOSSDbLvlefFshQU4EH1yJTul63JwqjoECcNWYD9n0jgmU29kpwi9timpX7K6qJFIHYWgU8OfIE0hBS/rUxT926GVF0SmxoeQbcLo+VzZVhtvhzX+IKWSOU4CiqYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102779; c=relaxed/simple;
	bh=+swL0N9Ohe3pxdW1tSbTGbGMKqvlYp0EJHBL9BmxbX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8vHmezd2/BH2kwzrT7Gem0YSyhk7KLwUX37ORDds0BzmNCJQivp2Vz+uHNph6ek5ozBqMUQyvCo8eP6wFbjP3Nldh6LwA90zgIGF3A2W3grvmpPf8+1p565gvWigDUOXOXNXlb5VoLC4Rabd9XaMT4dhZvO1s26vZzZqwU31kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Dr7oEpXW; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3dab336717fso3130343b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102776; x=1724707576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q20/OdSbvq9LUkG8U4wYOyihF5a7GCW9DX/TvPp6rr0=;
        b=Dr7oEpXW/yLHx5yHkRSdC5kbCOOk6wr3Cdj0vqbvi5kB7lpgAB8K2w2kn9fDjD0W2X
         Xgo+tKgucKiDLCgiTpD9aO7ie2o2amk213/AiZvFbVnHQRQUMior/iDnmiB9/2y0X3md
         SM69lp6/928QfJ+ukWjhg0SJuqdg0Dx1hCXSPT8oh/3cF4mYyyBU18Qm8wH8av7OCHIk
         ORlb/uv/XkpaJI59mqUJV31q/uquR+vwEIVTroTUPCSoMgDIgSa2FyR06di71U7Rpsth
         sn4uX9Y8nKdn/LlEcm+JRBLsq05cKrNEu3V/PHb1Qq3XtttodyFL6e8mRPkpDAIVpoF6
         Klbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102776; x=1724707576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q20/OdSbvq9LUkG8U4wYOyihF5a7GCW9DX/TvPp6rr0=;
        b=SYrE5H3C9oCSl9T6/FDvum683t5UpI5lRdAG7PqPybgXTkj6/ajqfYpwd2h8tH8c6x
         uw5aQQZvEXotCrSQVGJ923xPW4ZQ3lOnFaQXc3yrCfgt47OtD0eVPtKEwDFaTL0Ijrtp
         t8oRK2iifgcvPwOQeRPL/VC6WSYV0Ya7RRth0enKAgz8pS5GBthBMIBJW6LvCZjEC6/p
         9yuTbNPWaZ3UEJzOhU2cCi6o4tNyljLR3I2VyGegFBKYj0ilhAUu2q9ecP1qQdciOncw
         AyC0NmVdBgIXERzNmy2XVHa3Y2dvK3LngC9IHjGKNsuAm6jli/CCdY1SvAH1ZAFv8MP9
         25vg==
X-Forwarded-Encrypted: i=1; AJvYcCVmbgHWx2Y6UE6DaDzkNuBQZskf1uvKs9e3n8wnJzcldSvrzLA9N4TkxJ2IA7w66PmOhgyH+PxHAdY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9z4VuojtTuQMLaO5W87XH9hQ+08UTN5iVf2vHK9UgW8tEY+0M
	lTEz+fSgDo7Jt7PpMkpu7JUzZx53G0fOz70iC2TZNfsQHNGAZnwkBoJGqTuBWGY=
X-Google-Smtp-Source: AGHT+IGrOZgeSDndGKUvKoiCnKCFkQKTbYExlczlQ+uWZR6QQ0bCtLXdpQoy3WHfWNSC/eNU6Ilr+g==
X-Received: by 2002:a05:6808:13d6:b0:3db:215d:71f2 with SMTP id 5614622812f47-3dd3ae5535bmr12653199b6e.35.1724102775685;
        Mon, 19 Aug 2024 14:26:15 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:15 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v8 1/6] RISC-V: Check scalar unaligned access on all CPUs
Date: Mon, 19 Aug 2024 17:26:00 -0400
Message-ID: <20240819212605.1837175-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819212605.1837175-1-jesse@rivosinc.com>
References: <20240819212605.1837175-1-jesse@rivosinc.com>
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

Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
V1 -> V2:
 - New patch
V2 -> V3:
 - Split patch
V3 -> V4:
 - Re-add check for a system where a heterogeneous
    CPU is hotplugged into a previously homogenous
    system.
V4 -> V5:
 - Change work_struct *unused to work_struct *work __always_unused
V5 -> V6:
 - Change check_unaligned_access_emulated to extern
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto fixes
---
 arch/riscv/include/asm/cpufeature.h  |  2 ++
 arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 45f9c1171a48..dfa5cdddd367 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/jump_label.h>
+#include <linux/workqueue.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 #include <asm/errno.h>
@@ -60,6 +61,7 @@ void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
+void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 192cd5603e95..1ad981b2c7a3 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 
@@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
 
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED);
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
 	 * CPUS uses emulated misaligned access at boot time. If that changed
 	 * when hotplugging the new cpu, this is something we don't handle.
 	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
+	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
 		while (true)
 			cpu_relax();
 	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +559,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
-- 
2.45.2


