Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C22E56FAF73
	for <lists+linux-doc@lfdr.de>; Mon,  8 May 2023 13:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbjEHL5w (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 May 2023 07:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbjEHL5T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 07:57:19 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B6544523
        for <linux-doc@vger.kernel.org>; Mon,  8 May 2023 04:55:16 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ab13da70a3so43472495ad.1
        for <linux-doc@vger.kernel.org>; Mon, 08 May 2023 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546915; x=1686138915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=fw9w2wVvyg18HQUViAb/q8qFm0YGCFl6OA5t0nEkt/x4efJjZz1AlZazIVHATLSW+w
         heUG1plkNWqhle47JUQzWHWSG+vGxo82ayY9ANGhfWkzbQO8Dr6YUiheG3svkLfmg+NN
         2GZx2gFnSEjoQGMVoLG9jHAqVyTSd707Zvc6pVK2NLdcrbmEHn3Glt7k/emJkDKaKSq2
         MIRlCk1P2l9380YHjRqRfnRuqH8OWIWYheVO0szdRaxlAliT5X3EoD3CDOtTxHsFXQ1y
         F8OptUnVg8xt4KdB2scf8uJ5YrNv+5MozGjfHscY0OiyRNm/5t2/AQGAJfIYOrKzz/J2
         rCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546915; x=1686138915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=K5ab3fPFbUungjmBIixa0MtjRLUfQozgqfkJkNXhxBePW1kUEJ6GuSkHRXSeXfNGu2
         e95Xp2bEUbIKpF+DQkoNnLvkgFfsohrQeYeVqlV+c8XWPBX2ZcH9CUaEMHcbJ34/579v
         cRpFZoxBjKB+iIiaG822H2PpFuxsEeSlPRmgSDIh/1Drd+r3Ul3B/qZwKXrxyFA28XP8
         x8XKKXz0VowZYIywB5YPShlcai77w76Arw6NxmIkagTX5Vd4hwvLguBT5iNZrU3fQ7ti
         V75PLgJTy3dqNCmi/fAw3HAkLoeDO1J+DpBIDo4/Wa9SGbnTvXcJsO86ihAXI2Up69Qu
         TQWg==
X-Gm-Message-State: AC+VfDzkUPTv7AGF/7nQUdLwVIBC4bEICk+KGCpXMbkdyyzjJKud/UaJ
        rssi87pdT7PE5jPAmMAS1gt7Oy8/H5hUy8wRjM8=
X-Google-Smtp-Source: ACHHUZ5LX88i99DmSCUmXSBK7hbOW5754EnsnTa/mud3XPBdrIA3mmjSCvDHn3cMXRSoaPysS72Dog==
X-Received: by 2002:a17:902:868f:b0:1a6:b971:faf8 with SMTP id g15-20020a170902868f00b001a6b971faf8mr9907040plo.53.1683546915118;
        Mon, 08 May 2023 04:55:15 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:55:14 -0700 (PDT)
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
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V5 17/21] clocksource/timer-riscv: Add ACPI support
Date:   Mon,  8 May 2023 17:22:33 +0530
Message-Id: <20230508115237.216337-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
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

