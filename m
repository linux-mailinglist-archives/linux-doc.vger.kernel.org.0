Return-Path: <linux-doc+bounces-15730-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781F8BB2CC
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 20:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B591F21C57
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 18:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB54159908;
	Fri,  3 May 2024 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lyba4WAC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5245F1598FB
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760336; cv=none; b=ZQgHyu1WiX74LeircVdMLiJg8hU4NA9Y+g3ciyzo06TZ9+cqftqN3y5h6ukb07MP5sPVId75AkDr4yjKHzAelYjRbq0cKGVappAubs4aEumn8UHhdTFlUwu/3eIDKz70BWBMi5c23N6y5ksc8VRUPtjGkCPJLo1QU0xvy/A6D7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760336; c=relaxed/simple;
	bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kw2SiOjLLYO8BEW7Zro/pE6J1xFmL9raWPVvLZTE6Lbv47S1vIr1Jk6YCbI7z6iulyrEX2rYiJCUaJ+MSYI4jq1LMB66LwvOUO2ZttaYZ/CnrMsStZdqsGjMTG1fd3Ze8Zzi4QX9VKMV2mk9hafaNtIOm2ozQKnNoTxGCPd2p+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lyba4WAC; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4302187c0so1909982b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760335; x=1715365135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=lyba4WACzGSqraro/e4yYMBxoBGMjBs6+b0QtPONCbdHAHV44o4GcfXq5AIYXE1QMJ
         aaw9KiMooSTgFx2RaoGXbMkvWbcg3bPJxrm9c1ZJFJ+SAmjn3OAK10FdthJ0QnV8lU8P
         j2OBHg21OXVaaW2YYCH84PN7Q3+yTBFLN0LR+I4njMWwP5rRk4suH5FuJ9qcuHRGVadu
         GNRrHzIvmAqFUElsHHBlPJvMi6HkI0pwCzNbn42bvpwMTCizEdCnegWpuLT7shZVMOzr
         I06C3IiVWHGBMdZjDIEfFLw1bdQUEkOvZ13FngaZ+wU/ReddVelxDpAhrjIvbJ1UcTEP
         uEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760335; x=1715365135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=v7phGkFUfWx7V75ZiufcBHtBVwvP75w56EJqT+p+gM2VwEvhpuSI+QAd4wwHA0FzgE
         diDWBTepczhBCImD2uylFKRL4A/hhWO2JaBqOuptCArPD9OGbI0r5ZKdm5cu/4SHQYc4
         KYvgFssSsxcxTo+khpiM9nJucVw7xA2kt1/pSDQzezhCEiHB5UkIFUQgAiLw1X525wXu
         ERlxi/Xe9o2q4VIffcV/JZz+ZBB2ThwMrkXBYqIufT2jtXZ/xXMuAqARRW2/Ng7m5ouH
         3yrCn8hlKYyN3UVIG5XimAPKCTh9F0yCwtDtIK/RDiCRZnbsMZCFRZ7z5GIGEHTxFeSg
         pI/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOb/bgYOqMitHhRoe+jssVi5z9er2FGNFUtFjpd0Itj7s+dzrne6b9oYxz5VYgo0dInkgfm3z9UG0x9WyBoFoadk3tCN8gvZ/S
X-Gm-Message-State: AOJu0YzAtwBcuQ04kXaA3g7x6CfBiLfcsy6QS/036DF+T6Q3rVpEDULt
	pUsSFg68RnaVciEfDdGs/l+4nLFDn1jEprqqO8N4I/xGiMjDhfMUGTPtE0RXdZ0=
X-Google-Smtp-Source: AGHT+IFtffChuwBhS5Hm7XU8F8qXkdTP8YFkTdZYyG5ns+Etj9MDZuxDDNk7FtJ718xCtJB8CuLs2g==
X-Received: by 2002:a05:6a20:104d:b0:1a9:11e5:2915 with SMTP id gt13-20020a056a20104d00b001a911e52915mr3981411pzc.27.1714760334670;
        Fri, 03 May 2024 11:18:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:21 -0700
Subject: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=2459;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
 b=mSKF8x/jDoWL2qt9MbecKfiOANTWEfzH0iw4ND1E+SV0TbNnB9ytivBteSpS+Z2vjGFzFTRiQ
 UdfwX8NaOz5BpeYweh8Wk3kACtc1ksmEmsYKFfUKkaZcms6Ck2Wyrck
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

All of the supported vendor extensions that have been listed in
riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..2a7924dd809b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -16,6 +16,7 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
+#include <asm/vendor_extensions.h>
 
 bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 {
@@ -203,7 +204,33 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
+#define ALL_CPUS -1
+
+static void print_vendor_isa(struct seq_file *f, int cpu)
+{
+	struct riscv_isavendorinfo *vendor_bitmap;
+	struct riscv_isa_vendor_ext_data_list *ext_list;
+	const struct riscv_isa_ext_data *ext_data;
+
+	for (int i = 0; i < riscv_isa_vendor_ext_list_size; i++) {
+		ext_list = riscv_isa_vendor_ext_list[i];
+		ext_data = riscv_isa_vendor_ext_list[i]->ext_data;
+
+		if (cpu == ALL_CPUS)
+			vendor_bitmap = &ext_list->all_harts_isa_bitmap;
+		else
+			vendor_bitmap = &ext_list->per_hart_isa_bitmap[cpu];
+
+		for (int j = 0; j < ext_list->ext_data_count; j++) {
+			if (!__riscv_isa_extension_available(vendor_bitmap->isa, ext_data[j].id))
+				continue;
+
+			seq_printf(f, "_%s", ext_data[j].name);
+		}
+	}
+}
+
+static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap, int cpu)
 {
 
 	if (IS_ENABLED(CONFIG_32BIT))
@@ -222,6 +249,8 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 		seq_printf(f, "%s", riscv_isa_ext[i].name);
 	}
 
+	print_vendor_isa(f, cpu);
+
 	seq_puts(f, "\n");
 }
 
@@ -284,7 +313,7 @@ static int c_show(struct seq_file *m, void *v)
 	 * line.
 	 */
 	seq_puts(m, "isa\t\t: ");
-	print_isa(m, NULL);
+	print_isa(m, NULL, ALL_CPUS);
 	print_mmu(m);
 
 	if (acpi_disabled) {
@@ -306,7 +335,7 @@ static int c_show(struct seq_file *m, void *v)
 	 * additional extensions not present across all harts.
 	 */
 	seq_puts(m, "hart isa\t: ");
-	print_isa(m, hart_isa[cpu_id].isa);
+	print_isa(m, hart_isa[cpu_id].isa, cpu_id);
 	seq_puts(m, "\n");
 
 	return 0;

-- 
2.44.0


