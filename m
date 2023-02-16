Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFEC2699C1C
	for <lists+linux-doc@lfdr.de>; Thu, 16 Feb 2023 19:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjBPSWL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Feb 2023 13:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjBPSWJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:22:09 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEF850ACA
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:29 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id o8so2906558pls.11
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcT4AtxywBaHPbxQbaGHDpYZBRDu3wCeHMqaXv1EYt0=;
        b=DBvjTCZIk+vcPUW8htmerk0xAsi1O8tw5BcDSym3jNNFaZhhj3sFESEoaQ0Yhv+703
         j8AYTC/u7Z/JO44B/X+ZAXpYgAeZo6CliuHuUiaI2SCgIHy08Vso71L7TFcQ5jrXVdXU
         +8DDEuVrWcKm2wX9Z65//j6ETTkMzUIUCeacXa28ze6Z91EQ+V9RcPVlcirQdwLHMQ7L
         Tb3icHXPx7r/fuy+GHWyv6oMBMJ0RbQNMBQT1CGYvHYJA9xXnvOHefF7BG38Ka/VjJj6
         dzyVpCKn22c8RKIuz91QYGwKHayKz4n9RlwrYMCMj1lzUiRCr7SMicUmQQmj7eXcCd2B
         6kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcT4AtxywBaHPbxQbaGHDpYZBRDu3wCeHMqaXv1EYt0=;
        b=Zep8Pa/IehSLg4hrqUOem7nas5nFPDZ2T6kqGowyW7vG44ZJMmCy7Y8g5x3gGgN4ea
         Gan1UQj2Xk/HJTUtWDjWJX44IuA5IA6C7G4URekYUNJ/41YmixO3l2cgomWuK3Xm+aZS
         hzV3bHavv2FXVSfzQLm4Qu2+MpyhiI+S7cCTxgHAPHVbpul6BHFh5TGks+lximMepVFr
         pFz41ovOPPwACUANpEG83ZREj/z+/n+EQPi779TcHHk4IbUkb7SsfxCKijBmj/Y428bG
         HDPXLFI1QqvWHsQ193m2JzYEA4j5H32Vefyz61d5P3Ut/Xpk6qNQzH+OUJ9nEIwXyO3w
         6vgQ==
X-Gm-Message-State: AO0yUKUiDEHgMgkeRxLK4xyqFGK60TEs/Q2XtCSUHkh5ZVQNw09UB6W7
        tvmRQsSFp6vw/X1Kt7VbNpn1FQ==
X-Google-Smtp-Source: AK7set/AV2KvpGFqrQGHQJmsjVHVKIBcpK63WtqcfvUGKzjHaIsSSBk+G/PwqwPeXhCn+qXzFNe57w==
X-Received: by 2002:a17:902:f312:b0:19a:a647:1880 with SMTP id c18-20020a170902f31200b0019aa6471880mr5075210ple.24.1676571686430;
        Thu, 16 Feb 2023 10:21:26 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:26 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V2 07/21] ACPI: processor_core: RISC-V: Enable mapping processor to the hartid
Date:   Thu, 16 Feb 2023 23:50:29 +0530
Message-Id: <20230216182043.1946553-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

processor_core needs arch-specific functions to map the ACPI ID
to the physical ID. In RISC-V platforms, hartid is the physical id
and RINTC structure in MADT provides this mapping. Add arch-specific
function to get this mapping from RINTC.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/include/asm/acpi.h |  3 +++
 drivers/acpi/processor_core.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 7f9dce3c39d0..4a3622b38159 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -15,6 +15,9 @@
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
 
+typedef u64 phys_cpuid_t;
+#define PHYS_CPUID_INVALID INVALID_HARTID
+
 /* ACPI table mapping after acpi_permanent_mmap is set */
 void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
 #define acpi_os_ioremap acpi_os_ioremap
diff --git a/drivers/acpi/processor_core.c b/drivers/acpi/processor_core.c
index 2ac48cda5b20..d6606a9f2da6 100644
--- a/drivers/acpi/processor_core.c
+++ b/drivers/acpi/processor_core.c
@@ -106,6 +106,32 @@ static int map_gicc_mpidr(struct acpi_subtable_header *entry,
 	return -EINVAL;
 }
 
+/*
+ * Retrieve the RISC-V hartid for the processor
+ */
+static int map_rintc_hartid(struct acpi_subtable_header *entry,
+			    int device_declaration, u32 acpi_id,
+			    phys_cpuid_t *hartid)
+{
+	struct acpi_madt_rintc *rintc =
+	    container_of(entry, struct acpi_madt_rintc, header);
+
+	if (!(rintc->flags & ACPI_MADT_ENABLED))
+		return -ENODEV;
+
+	/* device_declaration means Device object in DSDT, in the
+	 * RISC-V, logical processors are required to
+	 * have a Processor Device object in the DSDT, so we should
+	 * check device_declaration here
+	 */
+	if (device_declaration && rintc->uid == acpi_id) {
+		*hartid = rintc->hart_id;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
 				   int type, u32 acpi_id)
 {
@@ -136,6 +162,9 @@ static phys_cpuid_t map_madt_entry(struct acpi_table_madt *madt,
 		} else if (header->type == ACPI_MADT_TYPE_GENERIC_INTERRUPT) {
 			if (!map_gicc_mpidr(header, type, acpi_id, &phys_id))
 				break;
+		} else if (header->type == ACPI_MADT_TYPE_RINTC) {
+			if (!map_rintc_hartid(header, type, acpi_id, &phys_id))
+				break;
 		}
 		entry += header->length;
 	}
-- 
2.34.1

