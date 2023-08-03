Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7A676F124
	for <lists+linux-doc@lfdr.de>; Thu,  3 Aug 2023 20:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbjHCSBQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Aug 2023 14:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbjHCSAr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 14:00:47 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9FA44BC
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 11:00:27 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so868679b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085627; x=1691690427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jB8h6dbqqCupn7mkThrMa44SDq8B8ddxZkj2FYKCJmg=;
        b=fgyTbFbSIA6WSJCx4y2YtZADUaRILhcOrq5BNe2S+JpaMMQ0Ar3+k0o7cWkjb5+Oph
         qgBwyGFPlW+7v51hDt9HQ+dtrg7U22mFpAu7AGnL5fuAFB8QL03bAsAKMo6sSfAAj9tO
         jDdTdbrk/xdtviUz8UQl6ciPU76HpqnEIzJeAn4Agqnq3ujBJaj6eWmT8346PeO5SvSe
         cfJeGA9L8Wkm3G2l4Ck34rZn0TOgsv9hlv86jHG53oUiopUDnXtQHXBZXzHV+0bItKrF
         EgPUIJwUqxHZV8Ws7XnyrnBbcjoxrzadVdmuq6TIh/vwPYyDsB1PIbLGFdMcXITCD8J5
         Hw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085627; x=1691690427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jB8h6dbqqCupn7mkThrMa44SDq8B8ddxZkj2FYKCJmg=;
        b=aWNhuhtS55F+5kUuo2vD7DnCsW0O2aeZsC9o5LWHZmrBeXtiVo358GA4jL4uY9x38/
         /4DuaxK27gws2J66m45M3w5b28JPHk6oxejb6qvwbFuEQM1J1Y94Q+4JRsh9mrjdaikr
         CqbaOm4VJJW1jdIUin6h8HipNDDSoHE73hGi1EQp40PLCmXKMW5Ij7uKppfmS7b5XsYX
         EXZjkYGvOsCa/TnPli2XOnxvMFrXoc6bGr/lsiaPhnRBgcztyiTS6F1RvRUeJGHzMOcD
         /QJom00zhiXWA2i4Bb67jkagNiCQW+bn/vj5B8LtbcA0BpUGpD+9Gsfp688ts1IZQdC2
         3uRA==
X-Gm-Message-State: ABy/qLY5Qg7s+Z7WqMBd9NTIu4QJVFNZ3PJZcO+kA1OxwnQHIOcjEQM3
        U1Uvg8asiBEolfOfxEFeglURa/EMvnD3ImtzB6E=
X-Google-Smtp-Source: APBJJlE5KEYBYCnrIQPqtzpicNM/OpO1N7fddfHFqyd3fUnS/DPSYBFhYR3yrvZPJTarCbPDg4LDUQ==
X-Received: by 2002:a05:6a00:2e8d:b0:667:d0ff:6a0f with SMTP id fd13-20020a056a002e8d00b00667d0ff6a0fmr24530632pfb.5.1691085626970;
        Thu, 03 Aug 2023 11:00:26 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:00:26 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anup Patel <anup@brainfault.org>,
        Marc Zyngier <maz@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Robert Moore <robert.moore@intel.com>,
        Haibo Xu <haibo1.xu@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>
Subject: [RFC PATCH v1 07/21] RISC-V: Kconfig: Select ECAM and MCFG
Date:   Thu,  3 Aug 2023 23:29:02 +0530
Message-Id: <20230803175916.3174453-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Enable ECAM and MCFG to support PCIe on ACPI based
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e19f32c12a68..79dc35e89d5f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
@@ -147,6 +148,7 @@ config RISCV
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
+	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
 	select RISCV_APLIC
-- 
2.39.2

