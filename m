Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903E16818FF
	for <lists+linux-doc@lfdr.de>; Mon, 30 Jan 2023 19:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235960AbjA3S0k (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 30 Jan 2023 13:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238081AbjA3S0J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:26:09 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6400A46D6E
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:24:24 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so1472122pjd.2
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkGE01Mpgd0zQdA3GENSlYo9eU6sEMItLJR0OaGMyjQ=;
        b=jbIhshr5uVfA86th0bcTdtMzr9oS1VyqbMLYF5ZGlBRXNpHrcs8DWHf/D9IgTeFh1F
         Y5e11T4Vvtref1QDKQ+XiHXojUg0e+i+S38peWV4Apx94P0NKRcB0DAmJRk0RrJle8Fm
         3awc1GpI7w1j7MnnGL3ciDCIf90r85C3QXXXCK0L3ojt2238HEnvWEsLTfjYhakRe3hG
         wbMlKcmEJuWJHEPilJoudPQPRUa6ARXhJ98TEnIkJtu3FyXxlmD89cMv78BzfLFR5kYy
         Qc3rHv2CCGYsIixWXWQgdM+5g+FKaEJDGviWmeoLzOH5zJk9RSqhHAdf13vmHvrp3x82
         1r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkGE01Mpgd0zQdA3GENSlYo9eU6sEMItLJR0OaGMyjQ=;
        b=L/+3B0WQpTuP8qeH55opR3AuQzRTxG2eaRGT2GtwKPqPPXm5Hd/b34tXTRoxoOfStJ
         tX4H6h3iKZzhp7ygAfg+KLd8uTPnLUxmm5Q1ZSKlBUaGBvrZ1Sa0NLWrqs71Ha9xmb4o
         btCJj3/HrgIPoLeF7YYwRJV45gBoEw5vFP1bRdhS2oPXyOhxe8PROah6sgnKW3I0dk3x
         yzsFU6Ff/SFXA3uaDSt0g0nHae0vzpwygKHKFIUYEiHLgxjf4kcgzqVVNrMpAEU5sbFg
         G7h2qsyQUSKtR9Nd1C/yX+7VUD/R5YoZF4IaG0oYV9UVjvP0YO0AdaE792jfbPwBaDZu
         X3sg==
X-Gm-Message-State: AO0yUKUrPvfrsPFsqgy/1RasGDheMV0+BUSwySDV+yt8ugTe0T1+JQl8
        KUhKnPXclJod80HX89va7mx/xg==
X-Google-Smtp-Source: AK7set9Pnqr1BTxPCJQr0H6gTIG5Wj6YCKgECl1AdrucdYZkfWDBH80CoQiA1a+eIyoZ5cYvuPNGpQ==
X-Received: by 2002:a17:90b:3909:b0:22e:5ffa:2a34 with SMTP id ob9-20020a17090b390900b0022e5ffa2a34mr1813190pjb.36.1675103055398;
        Mon, 30 Jan 2023 10:24:15 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:14 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 22/24] RISC-V: ACPI: Enable ACPI in defconfig
Date:   Mon, 30 Jan 2023 23:52:23 +0530
Message-Id: <20230130182225.2471414-23-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
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

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 128dcf4c0814..8ce06fb0dde8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -218,3 +218,7 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ARCH_SUPPORTS_ACPI=y
+CONFIG_ACPI=y
+CONFIG_ACPI_MCFG=y
+# CONFIG_PCI_QUIRKS is not set
-- 
2.38.0

