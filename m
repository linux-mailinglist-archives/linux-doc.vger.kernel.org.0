Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBCB46D6BCD
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 20:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236309AbjDDSZW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 14:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236394AbjDDSYh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 14:24:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554C74EF2
        for <linux-doc@vger.kernel.org>; Tue,  4 Apr 2023 11:22:54 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id l14so22037529pfc.11
        for <linux-doc@vger.kernel.org>; Tue, 04 Apr 2023 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD5rRL/Qo33kIFahZhwUm29X+6vMDi/30v04/QLcXUQ=;
        b=UIHu2giA5QAUdfrzphOrCNgf8TXf9Q337RJyaEDTsCelh5V0xJtnF5gy2TpNyJ3dib
         JQxA71u/Yth+XIXINwX7ERs/pWdRfR6fiMjDKHJrVNobDIWnvCxoz9SL3ii/bn6LJZBh
         qavA3ViuTfTTmh5JPoKTiEy/TNg6PKmzql59rAOOlKjT0+Y4VR4Tllzag0CkfB7JI8mN
         oIT1dLLjFZkxEing3aWpLI3zfjPVUyoxqBL3Fp8HxThPD9NCws5Lfe2SXIhYWU6ns9yU
         ByteigMnS++tSxUZybtfzf4EpK7ugZVUS13o1Pu+O+857FM6pQJjzjC1bEyIuyYsBPBJ
         sKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zD5rRL/Qo33kIFahZhwUm29X+6vMDi/30v04/QLcXUQ=;
        b=7RjtUhndfa+PT40qnuKfYDf5FkkKtjWkU1fAKg3c+YozHNNmqfuizBrjtZ4teJF2JD
         CuJ+fndYMLrNmmaaD/RVQqon2qvM/otODf3hQQs5xjS9YHoPKZlx/ZvmDrGxv8MXzCHR
         T3P7Pni8XhkffjeV9gqpWHzGSd/5nfuBNfLhsqwHEcfN5qRrHPI9ER+bTSkGMebICjFE
         uxDn+AAJXMQpnFHebbgbR5z1zpc0sYdJXRuhym4/pvIIjJKXNfj0vleIE7B/nOWNtM7+
         jjfCtLtzw5iBVQhM1rSWbnUEg33rMJwBot1976GkiV/X20tw+CA0C9nxh/PiNgAQDYbB
         otFA==
X-Gm-Message-State: AAQBX9eNuSkKmZaXrGkKo5ouaH0CBUTt7Gu+DJ7jHrNmEPasBd/dDRFP
        qyoDq3DKYGx1Ws5Qcw/PNd0UaiDe2L4Aenco7jQ=
X-Google-Smtp-Source: AKy350bhrHRdDWNUPNswRwG+i3CBb1KLXEYk2mzXo0XGX7CeXMoT6FgV3O1l78I2J1umA2T5+KrIUw==
X-Received: by 2002:a62:6203:0:b0:62a:9d6f:98dc with SMTP id w3-20020a626203000000b0062a9d6f98dcmr2813704pfb.11.1680632566619;
        Tue, 04 Apr 2023 11:22:46 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:45 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V4 17/23] clocksource/timer-riscv: Add ACPI support
Date:   Tue,  4 Apr 2023 23:50:31 +0530
Message-Id: <20230404182037.863533-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Currently, ACPI doesn't support a flag to indicate that the
timer interrupt can wake up the cpu irrespective of its
power state. It will be added in future update.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cecc4662293b..da3071b387eb 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -207,3 +208,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 }
 
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+
+#ifdef CONFIG_ACPI
+static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
+{
+	return riscv_timer_init_common();
+}
+
+TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
+
+#endif
-- 
2.34.1

