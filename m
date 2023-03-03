Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084986A98C2
	for <lists+linux-doc@lfdr.de>; Fri,  3 Mar 2023 14:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjCCNjo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Mar 2023 08:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjCCNjI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:39:08 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FEE5F6C3
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:38:22 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so2288767pjp.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUObxxi7Z2aUmCgcrqeWxF5lW/0L9jWTmCmlO9qrT1Q=;
        b=h9zxegf87/P6gRuaxexokAH8RlgQHTW9aNEdi0Cc5LWaIyJtjQufDamIzXWLLGiZF3
         USifV6YhmXfljWtfCtKoVzDSaMAlIMQl8P8W9iYkW9P1yN2X8mEbmYGh8JZAoaZt2kTe
         6LrgQhXh/gipg4ttInSYviVS133KQF2VIbLtkmOl8ztATlVtPeHdNKbw+uVMmcYZMdWZ
         5wMIv3VXRo46RR68LWy/VuxQFPl/DB83K6saS8aEZgnky6OIH2/ZZHTA1GVb9Z0Tz7AB
         uHHajGWlsqLl7rPfxfnmyX69OHuMKHkv8cWtHqUv5ZTl8j8X2nXZ8H6CiBIv6v5bjJQY
         21VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUObxxi7Z2aUmCgcrqeWxF5lW/0L9jWTmCmlO9qrT1Q=;
        b=TXq2URjbR2RMTV0TRf5PrRa/iuJkZI7Uq7R7RiIpAFhY675TeIzbV5rFwLex5ZeLNr
         hJ5dGuPUnz+NPE24Xsio5EpwhnkAL9hooDpzERLOt6ThNn4+tXhKonjRxK1Ubw+Z+vCk
         8RFWx+Xsl6kXBycGHP89hWKgDpT+qo5ECPjEM0hvGQjFJTE5ZNx5TcGDbspXgd8naX1V
         ssvtnh871SAcZ5rTrM+lDgjWn06aRwH6DF/yinMg7yNPGOdS4Y7ZFMZKBQmsPJsXp4H3
         4J5nNU1iHsKvM5v2yA1W8OF66wSfw5MChMmV1QKTSSLB64ALewW1nfgV87ae81kmDC2A
         tiHg==
X-Gm-Message-State: AO0yUKVUtqJV0Dk6F492GFDntoO4X35Lbm4OThWwf0XeWJFqhAQvU8Q1
        /dwHfUsJ33j1tjbmVwfaqCTaYw==
X-Google-Smtp-Source: AK7set9gzoFIZC/HHEQx2LoQ3xzYrgQmu1P8bhxmtZ9aRi/3fg7y+mEkZR5AU726XemKhjVyaS6WEQ==
X-Received: by 2002:a17:903:1c1:b0:19e:72c5:34df with SMTP id e1-20020a17090301c100b0019e72c534dfmr2360125plh.52.1677850697136;
        Fri, 03 Mar 2023 05:38:17 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:16 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V3 17/20] RISC-V: time.c: Add ACPI support for time_init()
Date:   Fri,  3 Mar 2023 19:06:44 +0530
Message-Id: <20230303133647.845095-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
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

On ACPI based platforms, timer related information is
available in RHCT. Add ACPI based probe support to the
timer initialization.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/time.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index babaf3b48ba8..2c29543549c3 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/of_clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
@@ -18,17 +19,27 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
 void __init time_init(void)
 {
 	struct device_node *cpu;
+	struct acpi_table_rhct *rhct;
+	acpi_status status;
 	u32 prop;
 
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	of_node_put(cpu);
-	riscv_timebase = prop;
+	if (acpi_disabled) {
+		cpu = of_find_node_by_path("/cpus");
+		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
+			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+		of_node_put(cpu);
+		riscv_timebase = prop;
+		of_clk_init(NULL);
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
+		if (ACPI_FAILURE(status))
+			panic("RISC-V ACPI system with no RHCT table\n");
+		riscv_timebase = rhct->time_base_freq;
+		acpi_put_table((struct acpi_table_header *)rhct);
+	}
 
 	lpj_fine = riscv_timebase / HZ;
 
-	of_clk_init(NULL);
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
-- 
2.34.1

