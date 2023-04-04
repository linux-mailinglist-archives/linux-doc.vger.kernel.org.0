Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452636D6B8A
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 20:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235962AbjDDSV7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 14:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236270AbjDDSVb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 14:21:31 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B1649C5
        for <linux-doc@vger.kernel.org>; Tue,  4 Apr 2023 11:21:22 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f22so28022280plr.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Apr 2023 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=lS5ulDLpGTFhacS/vmHeoNrA8WZMS9A1XD0ivXSE8k1m9UibbT/HDIYwmDj5dsTHzm
         khjVZGw/f+zG21uuCJRZ4P383v2CRWHkitSQ5bFYgsNJvPfImERO9jDlBRkunMUPqiAO
         49W+etiQwtzIpjxUIlH2B2LaPlM0qZAlhwE88kXncU/Z/de2KE5mtcuosQjsfjlZUaAs
         fp6NVPnjuihlvuWzPISUE5kl1VbgFLFjOo5lYVO7n9TJiPFNm/FP+KJDT+bNIGSBwUxj
         nOphCmWDomst3+OiuuhOSLh6CNn9cz4rDQ9C5FEGUERClo98uzNigXIfvs9y/lcE+KJJ
         Q6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=2R9sIPM3fGxXPyZg7wHM43+s2bLf2/mLySlF51grMR+1BUPTcuhGFpO43iwL2fuZfv
         ZSTRwUEwuZd8p3hTGl4sx9rxrBQ0yxzLEetEftod7B8ARbpCwahLUiGj2+65mv6Mt98t
         tbFYMGIdgZvdn/QfuvVU8RBvHSEZsY8mVLC9+8fIq/LC0YYZCB0xftwcnWfU3YqIWhDX
         +YphBDwoIEPSUWofYa4Vrt0eE+ageEZ7EDJ71hr0wlgVbpo3rwNujSFCr3klR7Uk2gaT
         ML4FNPQEUdDgDzacVnoViorvL7KZFPetFKpg6tpyfB8naCCRITgVoUr7gUeRrLkwEaBG
         vUBg==
X-Gm-Message-State: AAQBX9fqZsnVeU8xDDwcGJcSnvCUlnhMiFTJ7nI16+6Y2V/DXpOPCcP5
        T7+t8+wFazS+03O+lEfYb6GBVSid+le8ZNZu2qI=
X-Google-Smtp-Source: AKy350ZsAX/af2SGUjolLHmefDU/DyLThtAxyS7GCNHhc5U197X9IrYt3e8QE2hOBYNi+FCaIsr4/w==
X-Received: by 2002:a05:6a20:b286:b0:d9:237e:9d08 with SMTP id ei6-20020a056a20b28600b000d9237e9d08mr3003165pzb.3.1680632481697;
        Tue, 04 Apr 2023 11:21:21 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:21 -0700 (PDT)
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
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V4 05/23] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Date:   Tue,  4 Apr 2023 23:50:19 +0530
Message-Id: <20230404182037.863533-6-sunilvl@ventanamicro.com>
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

Without this, if the tables are larger than 4K,
acpi_map() will fail.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 3269a888fb7a..f725813d0cce 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size size)
 	return NULL;
 }
 
-#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
+#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /* ioremap will take care of cache attributes */
 #define should_use_kmap(pfn)   0
 #else
-- 
2.34.1

