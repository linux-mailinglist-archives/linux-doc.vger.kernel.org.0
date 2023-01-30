Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5A076818BF
	for <lists+linux-doc@lfdr.de>; Mon, 30 Jan 2023 19:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237728AbjA3SXV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 30 Jan 2023 13:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237797AbjA3SXT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:23:19 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9264F124
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:22:50 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id be8so12533596plb.7
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV9EY4GcIdMg2ei4Z2c7LvEp7Me6Q3TdFGwPQrDSIKc=;
        b=HnFGgGXu5x/MzSPNUPo2v/pKakFqmqRWg6BQwRTPrZG4sJqOl/VUF4GTP9i9fJrngn
         LxjYkozJRcGqTFtpW1ZJenp6ieACXPwwdG8MofsYgdXKJo5bGJiU0jbTysRY6DO9X+JD
         d9Zk77XxcXjHiM85uUyrqJTmc7fAHFRL1A4fD+B7GRTbo7uY2M8vLRiPTp5ZYb/dLo9T
         /SYJqVtO/2F4YdkMHCFjfdUDBtdyKQHJsdI5DwhbrCwQaIjM5lYyqZYggOVeBPbj4vo2
         dDyQwLdHBvmIGLO/TMUSRZtfcaEzTpFPU9j3uW5NE2cW9jpp5hZ1pilvVSBNhPXLL49z
         JgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uV9EY4GcIdMg2ei4Z2c7LvEp7Me6Q3TdFGwPQrDSIKc=;
        b=IUIfq0uO1MbaL2waAmSrPxdT8hEGzvIFfttHMJUqBTHIBfkYLImHrnH9UZxN4WLD9/
         DhWZqbXQJ63VOx6u5XysA4yzRrb0tGHPd4EAWDUZEbiI3Uj5H2rNSM4G9H0kiBha5JWz
         pv6X0OtTTm6DiBYrvSXx5S6dTuICBenBfL4Cyb7eEohJT+/WR9VOPTH90g73DMk6JkbD
         r0RPQuPlBJfpvKfQTllzTv+HxKkhaq4KiRsdFmnaqzv3BO77GzhZLQURPwY7t0vqwDgC
         HYgWMzA3RfLFV9j7ZtOIAAIX14NHX0yka0jxBkTxYyELBNlw4LVMwuGDvpHcQ9H4Ehog
         tqpw==
X-Gm-Message-State: AO0yUKUxL6J5rdlvuw7WRYOPuynZ7Itb5bet7VuLTuWUxY1l/X9KIpT3
        0rMy0Qf6gbTXQOeucsK4Q3XRdA==
X-Google-Smtp-Source: AK7set81m2sVmD0y/bGOO8qzoxXZgLQgJIi7xrMyNGd5m9OOckwQkYd5K05oM4haw3dx8ZgNydqYQw==
X-Received: by 2002:a17:90b:3805:b0:22c:4e1:93e with SMTP id mq5-20020a17090b380500b0022c04e1093emr23296691pjb.15.1675102963434;
        Mon, 30 Jan 2023 10:22:43 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:22:43 -0800 (PST)
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
        Sunil V L <sunilvl@ventanamicro.com>,
        Robert Moore <robert.moore@intel.com>,
        acpica-devel@lists.linuxfoundation.org
Subject: [PATCH 02/24] ACPICA: MADT: Add RISC-V INTC interrupt controller
Date:   Mon, 30 Jan 2023 23:52:03 +0530
Message-Id: <20230130182225.2471414-3-sunilvl@ventanamicro.com>
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

The ECR to add RISC-V INTC interrupt controller is approved by
the UEFI forum and will be availabl in the next revision of
the ACPI specification.

This patch is not yet merged in ACPICA but a PR is raised.

ACPICA PR: https://github.com/acpica/acpica/pull/804
Reference: Mantis ID: 2348

Cc: Robert Moore <robert.moore@intel.com>
Cc: acpica-devel@lists.linuxfoundation.org
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/acpi/actbl2.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index b2973dbe37ee..c432fd15db65 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -891,7 +891,8 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_MSI_PIC = 21,
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
-	ACPI_MADT_TYPE_RESERVED = 24,	/* 24 to 0x7F are reserved */
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_RESERVED = 25,	/* 25 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
 	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 24: RISC-V INTC */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u64 hart_id;
+	u32 uid;		/* ACPI processor UID */
+};
+
+/* Values for RISC-V INTC Version field above */
+
+enum acpi_madt_rintc_version {
+	ACPI_MADT_RINTC_VERSION_NONE = 0,
+	ACPI_MADT_RINTC_VERSION_V1 = 1,
+	ACPI_MADT_RINTC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.38.0

