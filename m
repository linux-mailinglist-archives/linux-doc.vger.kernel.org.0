Return-Path: <linux-doc+bounces-13929-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B31108A24BB
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 06:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1251F2366F
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 04:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4B01B95B;
	Fri, 12 Apr 2024 04:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dZgs0TvX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174E18021
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 04:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895099; cv=none; b=AijBfKL1Jsa7h1CNX7ZprKuu30FLGc273D8GqNh8rdg0zYvtMBkmVaPQUNTxPbtT7f6fqqAF7smulB77Wun9KfUcF2Fu68E8zkdHey0IESjbSt55z3/bLhH+Vz1l9YyN9Y4m3KLJO/TgcmCsLHVqdy0Pqtz+AOyriwdBKBsPhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895099; c=relaxed/simple;
	bh=TaWdYIxX3mVr3KXwkzLHIXqWT8lH3rbWmT/MrcQcjQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRHx6Jp3RqSSKPDAt5Yznm6lp8dBKWl7hGmNy1gXZ1a7oUFIQRCTLOnIR3/R+V8+6vOzRsdNhaSMjCvsRRwangcXcRxoP3YP9OFcHClo8nfUADiKS2QgEMNevDT/ywuQGHd6/w2MwgZvvc+qdN94gRw1KIyNWUbCX80DX2zOnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dZgs0TvX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ed267f2936so458204b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895097; x=1713499897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTIOqHyitaw6nLqtSGaAxD1ZAsdnQdkiOW1srtvVpI4=;
        b=dZgs0TvXPs5hKs4oV6fYOqk+yAfFM3NcC7gWiaiUfENtGTv6J58Zx2XIyhARUeuGw5
         gqy7zbWkl3nqdQlCR1qlcDZKGZTp2+bGi0DH0tIVK0dD0ovrxoEIr/ZQu3KkuAS2DMPJ
         Byg5iBpCsO31opgjKK1/Jk1Lm7GK/2jm4Y2M7lzk1eDC5lZA6vThXc/hv3ptIfwzZo0j
         oojcrVoVa6nhYhNbi87gHct8Y2fCLv/UURpG+waKt4v4YWL9tH5a9nCGgNniJu0KGyd2
         KFYNAvLAy3oBJ9geUvkrm9SxnjjzW+/aknn9/hEzxEh+GscG09SPLmRepMyDgzJXMSW2
         lqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895097; x=1713499897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTIOqHyitaw6nLqtSGaAxD1ZAsdnQdkiOW1srtvVpI4=;
        b=sJezAhP+/Tob6xKNfm6ajP1V5xeVX/0U9Ri5vrp3r52sLM5cNVl8qvBP6ljrwIlJ5V
         Wr4Fz/+U16NZKOiBgMEbQg7wqdctS8glRYGgzUSh3kUUamLoJNS5B1gsWeF73BrbrNF2
         5mqfdIZ2zmIQ0RZ2jlZwbskh1GCvjC5lCewoiwlbLaRSjqgJm3HHhBukF0es3WlHQD+X
         r7A8ay/zAiQv7lqU7xvQwKwHvCaXVtko4gAi2NJHaJlMq6lz5OoNgwGS2XJyouE0jVlN
         eZ5gfBrciLZSwqwDq0O5lwENT4dCgDBXcTjGsCs87fjANsLEyl7pTqHoYHC/4E5LuX9/
         nMHw==
X-Forwarded-Encrypted: i=1; AJvYcCXftwVnIpEoUoJ4BKIU2mKAwaJBXLrcQrSQLU3Dqu2n2TJixshekKOlRlfflJG9WeT6+0xErVNLcu2C31kfgn7Ok/WaRfQiwb1f
X-Gm-Message-State: AOJu0YyCrsOXGpaG+KkQNNd/DbBFxdTyFE/BJNGd+9dAmn70ifCdq8Dw
	PoJKXO/fJ3TgVXKZR+wyqiQdiM5NNna5cOWe8lkWDOzx4ieT9ZeiPjMz2oHdHqA=
X-Google-Smtp-Source: AGHT+IGmK+ik5ga/31rI/jNfPQ7GtE4TagEsHRIAkTjciUmdXwpIc0jREUhAojeVSzBFcqdhAblJbQ==
X-Received: by 2002:a05:6a20:3943:b0:1a7:75ee:6062 with SMTP id r3-20020a056a20394300b001a775ee6062mr2043824pzg.54.1712895097299;
        Thu, 11 Apr 2024 21:11:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:36 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:08 -0700
Subject: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=4548;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=TaWdYIxX3mVr3KXwkzLHIXqWT8lH3rbWmT/MrcQcjQs=;
 b=aOQNAV7WlJGQ5TxDuyoKbXL84IAgkHRuEKyVZFxUi4+s64qdCpkNdySAxkP7WxVzO2uWucNmZ
 lM3z3ccbDFjCa8Wi5rrSQZD8cryU0oFUGhoHECrxkhBCfuB9jdZfbZ3
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
 arch/riscv/kernel/cpu.c        | 20 ++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

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
index d11d6320fb0d..08319a819f32 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -139,6 +139,26 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+unsigned long __init riscv_get_marchid(void)
+{
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	return sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	return csr_read(CSR_MARCHID);
+#endif
+	return 0;
+}
+
+unsigned long __init riscv_get_mvendorid(void)
+{
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	return sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
+#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
+	return csr_read(CSR_MVENDORID);
+#endif
+	return 0;
+}
+
 DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..cd156adbeb66 100644
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
@@ -497,9 +499,14 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 			return;
 	}
 
+	boot_vendorid = riscv_get_mvendorid();
+	boot_archid = riscv_get_marchid();
+
 	for_each_possible_cpu(cpu) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 		unsigned long this_hwcap = 0;
+		u64 this_vendorid;
+		u64 this_archid;
 
 		if (acpi_disabled) {
 			node = of_cpu_device_node_get(cpu);
@@ -514,12 +521,23 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 				continue;
 			}
+			if (of_property_read_u64(node, "riscv,vendorid", &this_vendorid) < 0) {
+				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using boot hart mvendorid instead\n");
+				this_vendorid = boot_vendorid;
+			}
+
+			if (of_property_read_u64(node, "riscv,archid", &this_archid) < 0) {
+				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using boot hart marchid instead\n");
+				this_archid = boot_archid;
+			}
 		} else {
 			rc = acpi_get_riscv_isa(rhct, cpu, &isa);
 			if (rc < 0) {
 				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
 				continue;
 			}
+			this_vendorid = boot_vendorid;
+			this_archid = boot_archid;
 		}
 
 		riscv_parse_isa_string(&this_hwcap, isainfo, isa2hwcap, isa);
@@ -544,8 +562,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * CPU cores with the ratified spec will contain non-zero
 		 * marchid.
 		 */
-		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
-		    riscv_cached_marchid(cpu) == 0x0) {
+		if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
+		    this_archid == 0x0) {
 			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
 			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
 		}

-- 
2.44.0


