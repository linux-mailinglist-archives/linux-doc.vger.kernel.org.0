Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88367699C22
	for <lists+linux-doc@lfdr.de>; Thu, 16 Feb 2023 19:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjBPSWV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Feb 2023 13:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjBPSWK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:22:10 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C414505F8
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:38 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id bx22so2712019pjb.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TvuJr54uYfZYo8HSlRmVGPkAT+/kE+f0Y+wFUBrfiQ=;
        b=T8ZVYzQ363zfTHRmFc9Jj62v2RoZaVNJV/KSLrEC3vZXuFiM0hJTn+RLJkF6ILJA7J
         GArJJR5zxRlWWcUdo50vWXdvsthFhIsuTgkdCKDo47kU8XsBJ29b1FymHg2Js835U/mo
         CEtDFau+/1jI1mXWRLBnP1SKWAduXmIY1avdHCWj+//ufeIXUlnRmWt1M/tHVZ49S1X8
         BGwXlXGsaHbjRi8enrhc7NwEq9AKnN2ZUDIvySSMJNmYsbmn1beDmvNsglEV0svadKar
         6ptrElsOtU4YSa/V+Mxs9dnfeRU17fORaYp3yaFy6yiycz8YTqNd/lGtv2t/s6LLgUXB
         GrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TvuJr54uYfZYo8HSlRmVGPkAT+/kE+f0Y+wFUBrfiQ=;
        b=EEUniDVM9omQcRuXhXq3uw4AvNBoNcv4OKGXy/E/s+HrY7iITPrgwI2jIPUnrhWHt+
         pY/FOFwVbbqpFi7fnE0/rFleFb+Vk0GpBYzVi6A2/kCI9oK3OQMixXi4bdpoL4GqYVbs
         c8N4xx6pxgzTRpBD153cHIdmJYb0LTKUcSS1+RgpFMYVoNeM6BAxSO1U6J+hpxgDlekc
         HcbY7BI5Qxi8wNqd/EhIUx9bf3TY1aSgG5BOBxuQeOo304KQ4z5uUUrMyv/5ynI8KHxt
         hHMKLpM5Nq726fNgRKoOBQ3nRSDlIX6IXkiJpM3CdzYwF9X4m7bZ3SjTRHKYaS3m4/YL
         0cUg==
X-Gm-Message-State: AO0yUKW+PA1n4LGEWH6OU+Rddf4WLNUh80SxXOe3aKu9PKMgbUgrI0nD
        njWH3uwFm7/TGbc79WfIB569KJQFShp6rlhn
X-Google-Smtp-Source: AK7set9+BdbKgkpHzRAqTpNzOousZHvPUaa1x+OuyfWcWse1hD2JwD3lY47+FfAaFO3tCGLWbbQP9w==
X-Received: by 2002:a05:6a20:7f92:b0:c7:1bd0:c575 with SMTP id d18-20020a056a207f9200b000c71bd0c575mr4133361pzj.19.1676571695888;
        Thu, 16 Feb 2023 10:21:35 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:35 -0800 (PST)
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
Subject: [PATCH V2 09/21] RISC-V: smpboot: Create wrapper smp_setup()
Date:   Thu, 16 Feb 2023 23:50:31 +0530
Message-Id: <20230216182043.1946553-10-sunilvl@ventanamicro.com>
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

smp_setup() currently assumes DT-based platforms. To enable ACPI,
first make this a wrapper function and move existing code to
a separate DT-specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 00b53913d4c6..26214ddefaa4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-void __init setup_smp(void)
+static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
 	unsigned long hart;
@@ -116,6 +116,11 @@ void __init setup_smp(void)
 	}
 }
 
+void __init setup_smp(void)
+{
+	of_parse_and_init_cpus();
+}
+
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
 	if (cpu_ops[cpu]->cpu_start)
-- 
2.34.1

