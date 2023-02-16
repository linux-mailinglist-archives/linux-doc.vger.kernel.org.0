Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32B7699C33
	for <lists+linux-doc@lfdr.de>; Thu, 16 Feb 2023 19:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjBPSXO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Feb 2023 13:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjBPSWd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:22:33 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0DD5775D
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:06 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id x4-20020a17090a388400b002349a303ca5so2451687pjb.4
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4phaq6quaw8OEd5i/LKAI0eg66LQgH0oflAjuJIR3hM=;
        b=assdfSn79vHm0/djewQo2bAQqyjoTdSiGlBucWz/vkwhlh0gcU4AzKvvNGpbvajSzo
         pyLddLDI91C5MOJAqpvr+uIMgruD0aMCS5ZkzhicFmN14+x8C7nDK2QPkEwxAZY0cHrN
         njQ2zJIhkyPA0oCk8owapfaEaiAVm/jFqJqZHUtqhNpdOsJj6oyEzlmxzG7BmxRHGnTl
         010zIM+wIuONTlBkSYFy/AXiy57JLHaoy1nGIKW/GgvturAOhwh37d7TDfwp1XJZOcol
         NymKVNVqiyDZoXLOoFLIZsBv8PZxexq/CRxJGVCU0XPdAsT0x8D1+iC3ghJYaXGI5Q0c
         l0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4phaq6quaw8OEd5i/LKAI0eg66LQgH0oflAjuJIR3hM=;
        b=IQlX7j9pAbL+m+sV7GtQUCBY6FZO43j6M+SR5GrsH43joeSpgvHIW2QxNdxPgZq2nw
         0FrU/MZ1FSzamoD9wz4k1EhQDntKc5UTnPrHi46j8B/a2suqVAS3IUwLusWj7Uj0MQ8w
         4LLikJdrcyRZ34be3V4ZDZMPRGZ9KYaSePwfZsetASu1LKb/6y2omgXcrpc5xPmu3Io6
         C3xjNLqK4mp8DCee/IAiTlW9h+8UHy5U0uZUfgFBXUS29DoPedG3AAqTylBf1f2J7Njd
         Sq/vwr2HRWX6aX8ldCJ0LBwWHmcJyDgmjFzl6fnylaLUicwA/ba1oCIppIXJHnDz6Ruz
         I1fg==
X-Gm-Message-State: AO0yUKVBkpe6pK/8rHqWfbawYi3af5qJtdZAL+cHO2RQfp4Al572R+cF
        2SScVOP9+Wuo19TFGh6uUC/4qA==
X-Google-Smtp-Source: AK7set8C1pCi1Yn5xatlevccbWobHFbDGG2iAF9QZ/ZGlbvVWblYYzDHJ0Lrj8g7Jn58dLz+YVQtEQ==
X-Received: by 2002:a05:6a20:7350:b0:bc:80bd:462d with SMTP id v16-20020a056a20735000b000bc80bd462dmr8512373pzc.46.1676571724598;
        Thu, 16 Feb 2023 10:22:04 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:04 -0800 (PST)
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
Subject: [PATCH V2 15/21] clocksource/timer-riscv: Refactor riscv_timer_init_dt()
Date:   Thu, 16 Feb 2023 23:50:37 +0530
Message-Id: <20230216182043.1946553-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Refactor the timer init function such that few things can be
shared by both DT and ACPI based platforms.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/clocksource/timer-riscv.c | 82 +++++++++++++++----------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1b4b36df5484..2ae8e300d303 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -119,61 +119,28 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init riscv_timer_init_dt(struct device_node *n)
+static int __init riscv_timer_init_common(void)
 {
-	int cpuid, error;
-	unsigned long hartid;
-	struct device_node *child;
-	struct irq_domain *domain;
+	int error;
+	struct irq_domain *domain = NULL;
+	struct fwnode_handle *intc_fwnode = riscv_get_intc_hwnode();
 
-	error = riscv_of_processor_hartid(n, &hartid);
-	if (error < 0) {
-		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
-			n, hartid);
-		return error;
-	}
-
-	cpuid = riscv_hartid_to_cpuid(hartid);
-	if (cpuid < 0) {
-		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
-		return cpuid;
-	}
-
-	if (cpuid != smp_processor_id())
-		return 0;
-
-	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
-	if (child) {
-		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
-					"riscv,timer-cannot-wake-cpu");
-		of_node_put(child);
-	}
-
-	domain = NULL;
-	child = of_get_compatible_child(n, "riscv,cpu-intc");
-	if (!child) {
-		pr_err("Failed to find INTC node [%pOF]\n", n);
-		return -ENODEV;
-	}
-	domain = irq_find_host(child);
-	of_node_put(child);
+	domain = irq_find_matching_fwnode(intc_fwnode, DOMAIN_BUS_ANY);
 	if (!domain) {
-		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
+		pr_err("Failed to find irq_domain for INTC node [%pfwP]\n",
+		       intc_fwnode);
 		return -ENODEV;
 	}
 
 	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
 	if (!riscv_clock_event_irq) {
-		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
+		pr_err("Failed to map timer interrupt for node [%pfwP]\n", intc_fwnode);
 		return -ENODEV;
 	}
 
-	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
-	       __func__, cpuid, hartid);
 	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 	if (error) {
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("RISCV timer registration failed [%d]\n", error);
 		return error;
 	}
 
@@ -202,4 +169,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	return error;
 }
 
+static int __init riscv_timer_init_dt(struct device_node *n)
+{
+	int cpuid, error;
+	unsigned long hartid;
+	struct device_node *child;
+
+	error = riscv_of_processor_hartid(n, &hartid);
+	if (error < 0) {
+		pr_warn("Invalid hartid for node [%pOF] error = [%lu]\n",
+			n, hartid);
+		return error;
+	}
+
+	cpuid = riscv_hartid_to_cpuid(hartid);
+	if (cpuid < 0) {
+		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
+		return cpuid;
+	}
+
+	if (cpuid != smp_processor_id())
+		return 0;
+
+	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
+	if (child) {
+		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
+					"riscv,timer-cannot-wake-cpu");
+		of_node_put(child);
+	}
+	return riscv_timer_init_common();
+}
+
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
-- 
2.34.1

