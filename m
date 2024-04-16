Return-Path: <linux-doc+bounces-14262-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A897F8A6211
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 06:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CEC9B237E4
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 04:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58473376E5;
	Tue, 16 Apr 2024 04:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pRgGQUHu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838121342
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240726; cv=none; b=lGRnmkTwax33oCfN12UUgajaT6OBaKDEMSTR7DY+2zsbRPoUYwJVarmhpFt4wZ7+LCAjyBnxQKPjwC1qJUTdDkfWjENW+QObElq4S44pBIVcByf9d78LxbJTV9spQxe5XbnGKnXsQWdzdAwfrcNX1cc48FcDIofy0kuelGClXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240726; c=relaxed/simple;
	bh=dkmMwSQhSZqqA7hvCp11OQAJEfKHO37CqENn3GjjXso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNImFop2qVT1ZTNAHiSQ6KodbIbacJ29gHVW+p/SXSvgnX40twFkqGsG33ScILm72PhGgAGz7p6IyHH2Uh3rSW6K3e6brwPAmhjBzU3oFg0NA7wpyywYdkhPu/1DGqiadL3VvWnShr2c9yBDscff0bQSdAaDUhCRuSCY72ZHBd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pRgGQUHu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so2612118b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240723; x=1713845523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++xZy+ObBNE3KB89/8huI8TuSwtQKmJYk1fAnGCjGI8=;
        b=pRgGQUHu/xwOo8sWYbpY0O/5eYzb7hprPq53GeZ9TOOInzGSYB+XrsCpWGXNFLVp+b
         dPKc/PG9cHbqgi9d9Tx6g0CUpoDtbgVVcSZ7gUeYA4nwr3ycze0oGHVLZfr+15rQMNp5
         A5jdr2BNgc3+B4wBF/MXeMlxJ+i/T62TtaAYfFCi0TDC6QFbL3ynZTBxiCVynrfkL6bu
         0vyR05Ofk3tpOZC59LOadjE/gVIXQzBQftIWEzC6/RXrMUamdR71rfMlfHOggiRe7Tr6
         Rx0CKlwaSvk60G73xMu3t5tVGcn2XScQNs9EgFh+FHNmAGrWDI0oC4d7oDzg2/JAU8GZ
         V4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240723; x=1713845523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++xZy+ObBNE3KB89/8huI8TuSwtQKmJYk1fAnGCjGI8=;
        b=Hhxckg7eqXsQZTlFfgoBUxOHWZBfTFOhKfaotqrYVnms3uH+qm3L55FUTbq2pmEAXh
         SshanJ48ZsuTucV262DcuDF6XjX+gMWpcDmrLTWriUljSpGGDuYnbeLQTj9cNsz7CrfS
         JRYpr2X3TkPkFt5XhukPjrlsO36cav+6YMX2e8jIm3MpbnOWVQZgmrD9i5DI9EGmALNR
         8xfolknFtCqrSTYwOnm/09soyj6ST3QNHwIUDqartHkZWsw9g0DRp5qW8fiQZemUnT+b
         PIlMKfn5+LSvmJ6tYagefCGneQ0PB1ZXr9WnBKH0FJ04poMKZr3v9xrrvVLcAekHLWtT
         IUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7NNtOjHG2TOly7vJhUaEsFZxX4cvOeWLc4iPELv9kYcQw6CxQXMKbGOrsGSPTCvQOdBbO+qFFGQSXttQtO2X1enURumcVYdio
X-Gm-Message-State: AOJu0YyOBNdkoyQ546Ned3UpSnVy2+gB9IiwJDSrEzxxjYQosK6yX+Vn
	aGZh3z/38w+LxjJi5TknlOarUMKyM9It3sYTYrX44ztAXMLFwuDY4OTVRAWlkfs=
X-Google-Smtp-Source: AGHT+IE2UM7qn9JHRra5nKKHDFw99Yc3X79Ggnd1bXAn1KOp+/ILKMs3FsaPY9rCdou0XHBhmNW78w==
X-Received: by 2002:a05:6a00:2382:b0:6ed:ca65:68b with SMTP id f2-20020a056a00238200b006edca65068bmr2125216pfc.4.1713240722785;
        Mon, 15 Apr 2024 21:12:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:11:58 -0700
Subject: [PATCH v2 01/17] riscv: cpufeature: Fix thead vector hwcap removal
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-1-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=4708;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=dkmMwSQhSZqqA7hvCp11OQAJEfKHO37CqENn3GjjXso=;
 b=RyAuMqKhMsNmgEPKgOmQFKT3iEAhF8iXw8f0UHK9Bdd0JU5h75VVCNI96WA048tjLZiiqaCDT
 Uw/yH0Jd01nCawauWBIhP1sdCDA+K4rGlevzJ9wvQyEf7//qeTPo3ZQ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The riscv_cpuinfo struct that contains mvendorid and marchid is not
populated until all harts are booted which happens after the DT parsing.
Use the vendorid/archid values from the DT if available or assume all
harts have the same values as the boot hart as a fallback.

Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 36 ++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 12 ++++++++++--
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6e68f8dff76b..0fab508a65b3 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -370,6 +370,8 @@ static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1
 static inline void sbi_init(void) {}
 #endif /* CONFIG_RISCV_SBI */
 
+unsigned long riscv_get_mvendorid(void);
+unsigned long riscv_get_marchid(void);
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id);
 unsigned long riscv_cached_marchid(unsigned int cpu_id);
 unsigned long riscv_cached_mimpid(unsigned int cpu_id);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..8c8250b98752 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -139,6 +139,34 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+unsigned long __init riscv_get_marchid(void)
+{
+	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
+
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	ci->marchid = csr_read(CSR_MARCHID);
+#else
+	ci->marchid = 0;
+#endif
+	return ci->marchid;
+}
+
+unsigned long __init riscv_get_mvendorid(void)
+{
+	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
+
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	ci->mvendorid = csr_read(CSR_MVENDORID);
+#else
+	ci->mvendorid = 0;
+#endif
+	return ci->mvendorid;
+}
+
 DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
@@ -170,12 +198,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
 	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
 
 #if IS_ENABLED(CONFIG_RISCV_SBI)
-	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
-	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+	ci->mvendorid = ci->mvendorid ? ci->mvendorid : sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+	ci->marchid = ci->marchid ? ci->marchid : sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
 	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
 #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
-	ci->mvendorid = csr_read(CSR_MVENDORID);
-	ci->marchid = csr_read(CSR_MARCHID);
+	ci->mvendorid = ci->mvendorid ? ci->mvendorid : csr_read(CSR_MVENDORID);
+	ci->marchid = ci->marchid ? ci->marchid : csr_read(CSR_MARCHID);
 	ci->mimpid = csr_read(CSR_MIMPID);
 #else
 	ci->mvendorid = 0;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..c6e27b45e192 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -490,6 +490,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 	struct acpi_table_header *rhct;
 	acpi_status status;
 	unsigned int cpu;
+	u64 boot_vendorid;
+	u64 boot_archid;
 
 	if (!acpi_disabled) {
 		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
@@ -497,6 +499,13 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 			return;
 	}
 
+	/*
+	 * Naively assume that all harts have the same mvendorid/marchid as the
+	 * boot hart.
+	 */
+	boot_vendorid = riscv_get_mvendorid();
+	boot_archid = riscv_get_marchid();
+
 	for_each_possible_cpu(cpu) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 		unsigned long this_hwcap = 0;
@@ -544,8 +553,7 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * CPU cores with the ratified spec will contain non-zero
 		 * marchid.
 		 */
-		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
-		    riscv_cached_marchid(cpu) == 0x0) {
+		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
 			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
 			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
 		}

-- 
2.44.0


