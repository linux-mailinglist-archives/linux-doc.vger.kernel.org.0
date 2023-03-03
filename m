Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65B0E6A989B
	for <lists+linux-doc@lfdr.de>; Fri,  3 Mar 2023 14:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjCCNhx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Mar 2023 08:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbjCCNhd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:37:33 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6755470422
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:37:20 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id x34so2572968pjj.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=Zsc6LaeJTpGX1sgtByVE6O8d9udmKb3fR8oUsq0FNYih6Tsi4uKgSRk6XDvsBjOfbl
         1KTWbpwaFjpI21q3iRGZkju0DVreKkZJb5upDlXkI5pllv+9x5Hq7n7Zaol2tB6zq5El
         zE7YMzWWP8RP8qm7jM/VyT4r+BHa1khQw75ZNQ+RCFrXbe9POTWcDU31NAc6erzEcWWp
         iXD/utPdJrbpDyEWHIy3hEvtWAnybAALp0Di7/6PkNLP0Kv4NpxQEz41nUnD9jHjZ7lB
         ynYP6TOiOHbSCvvXMA4pBxnLBS0SqnPSPI5mcnsUgiR9U0N8YmEuuWMQ5J/sNa6nt/Pe
         G+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=lsxrPJi9W+fDZRGvwyPSx9NUux6qsK3I/BSclq8mNErmNehnWnc3hoiBqZn8H2AyZd
         AkIfEwkqgj1od5g8Qn9IomF2ixk7m+FfThiOF1lo2Arap6hz5Dirdo/wHIbAgbfEeF0b
         C1KTjfRiMPdrewYN8cYqy3GNv31fqZKMF0E/YcHsEhcnoDupboKzhY8BUhwMI07cTG+k
         KaUXbugDj/70cSzYey8KYlrBeyBLnHNdSXP/TECbn5gz6pkHWyNaEUCr+oKJ31aZV4ws
         WbtMaCE3qXt3VT4Vp7O4KIIW3A2ogrXberE6UlsR/JF1NquCwxt2AdmCQpQ71AT5uqoB
         Pu+g==
X-Gm-Message-State: AO0yUKViKY3z6PqhiKJuVVFmpCIIwQo0q6rggR+own92wJnOM4AE3TSP
        KmrKpQoQ9zq9elwaABSA+jSVrQ==
X-Google-Smtp-Source: AK7set/G1m0QP8TwASMfiHdCi9Qj8Nix2/s9AwyTOx8M1PebkEi+mADM4ez9JdpRzBLNQbgkk8W3Hg==
X-Received: by 2002:a17:902:e80a:b0:19d:243:d5d3 with SMTP id u10-20020a170902e80a00b0019d0243d5d3mr1978853plg.33.1677850639872;
        Fri, 03 Mar 2023 05:37:19 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:19 -0800 (PST)
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
Subject: [PATCH V3 05/20] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Date:   Fri,  3 Mar 2023 19:06:32 +0530
Message-Id: <20230303133647.845095-6-sunilvl@ventanamicro.com>
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

