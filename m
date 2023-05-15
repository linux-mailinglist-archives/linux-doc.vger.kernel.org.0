Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9BA7023DE
	for <lists+linux-doc@lfdr.de>; Mon, 15 May 2023 07:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238340AbjEOF4D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 May 2023 01:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239119AbjEOFy6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 01:54:58 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE3F4214
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:51:43 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1aad5245632so87279735ad.3
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129900; x=1686721900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=B/2s07xO4JsvpjeFQXLK9epGxKSolGR137ahXL6Xqpu6cvJdjAuvwFfJTToBH27hFx
         iU1eFj0lfQMJxAK3JCa7YpUoLShxQppRs9krLSWJt0lywC6dWcEPg/rXvsy8hGJZBrZQ
         aAqH2ZDdzbSNReetY5GYcij66xNie7S3Ek1SV0mHfB2S6EjF5fy4DYd2rkos7AXiUp7r
         A7mM1MxwDNuHsULDMKmoeD2CS+aY1S1YK7CEPqzDEfCTjgx/DjSdsn3f6HZ1Og81975E
         71WOPu6Hm4MeLzAZvw6s1lAIaAMu94JwdS+HB8ZmbyvdOAqMnV3uLCalVpLAenNxNcVi
         9S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129900; x=1686721900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=G1XYaAB9hxFInqzLbUugJYcprxR5WLPcDF63z7KGYdhPDKJI48sT48IDnD63FrYKxG
         EdEW3r/WvbSGpDGufn4un14e5t6+TV1i9eB6IsX3MN+QVmhbhngrBs06enmNCYS4ja4i
         T1veX/QImvMgcoBVFJu0o8/yhEQInA6QMe3XkuzK9FZMajMQauaCNw3BfoEPmztysGzr
         4L7sIPejuyY54c9m0M1dSGWAcUJ2Ew0WLTUdq9Vme5uIeS0eSLJCfo8QKlKevMolmtC+
         wtiEFkgeqMf4iK/Hm3wlfSQxP3ZZVc2/wYgq+l7GN6KgjIL5YODG8Wc5BzPUfO+HdyYY
         TvwA==
X-Gm-Message-State: AC+VfDwzWsSGNJPUhkBaiQOUCARxSes7pzu4flf5r5LuJz/hRSv5czor
        zVjpuonlBFZlomHZNEK6vr8ClU0XnefKWPXFVyE=
X-Google-Smtp-Source: ACHHUZ5p6rTF1JyYq/6jX97XqVSLRtHjCcktupUgoSF3DN/rvwg29xnalX3XmhPORDR68lFdXczR3Q==
X-Received: by 2002:a17:902:e80c:b0:1ab:1dff:9540 with SMTP id u12-20020a170902e80c00b001ab1dff9540mr41677533plg.14.1684129899921;
        Sun, 14 May 2023 22:51:39 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:39 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V6 18/21] clocksource/timer-riscv: Add ACPI support
Date:   Mon, 15 May 2023 11:19:25 +0530
Message-Id: <20230515054928.2079268-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

