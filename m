Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA746D6B7F
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 20:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbjDDSV2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 14:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236410AbjDDSVX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 14:21:23 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1163F4C2C
        for <linux-doc@vger.kernel.org>; Tue,  4 Apr 2023 11:21:16 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s19so20242276pgi.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Apr 2023 11:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=aYnlk3BgOfMNMmnnhaJrZqutCOgYZzErmuUTfDAmJFbvnkoL40ha8ijOrqYPZBnsvX
         ycgrTCK+kybVGhevfZFf/SGdnPx4JTrEY/3nEoA07S7d5HXOb2elq4hnDxEyN6ynebyX
         pxRENZLVc0MVnk0sqIXk0LiheSEXSJfSZYELyQaaaESNbrIvTGzzFGa80tp0dixJwm26
         MFd72Gyap2rcWTEzOB7E2LJyMrSviE1LMGX1n+TmEeB9vhYzg8cDk7jRSGhYZbMxL/6K
         AK4NCOD4Jkn6qi9PR3YhUp4EKjjdlwzOK8m4HBMWjFa/5J0IG6nZymCMMx2rvgDS4P3m
         8OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=4DP/jIdBm48rnnZ7EMmyH0S0F3avzj81GfkWjIJcoKQpDpl6BIklKDwz70H82Mnwv0
         QkChA99lz8AahbWLMHAc3i8PUyNUFm+WJrFfvtHWXNp8iGKRJZMRPd5i8ryXi4r+3LUm
         jxniYZ+gYCkxBf2p33N16MW/cNQMP0rxjeyd0KQEgh4LwkxmjUrmP2eTsPludTUvTYWW
         ZdfR1EmgP/crf4YIH7t914uNdYl1CdVoVrFUi/Kq3MQmzy00b34EJcPdl8DmTX4d9sFE
         VlI0kAt6ax1rYxPe69gXHUJ2XwhpBvgaUYtJFQBjlibACZGBXEjCHNA+bDJVmzWbssp3
         nBow==
X-Gm-Message-State: AAQBX9co1+96a+HcvHb2kGeTxrheUInf5nYjbCHQ44bKmv0G8uQfRhMM
        62TIQBlO6MCsrcx8GNTnZqUOAMYyiMTjIq8qf+0=
X-Google-Smtp-Source: AKy350bk0wFBRLbn4XAN/Q3xySFnNlV3qYKkPkqFm43h5C2tri1AqLTnk71cXWF8+MbPS5+mwyzFrg==
X-Received: by 2002:a62:7bc7:0:b0:625:c048:2f81 with SMTP id w190-20020a627bc7000000b00625c0482f81mr3438951pfc.32.1680632474822;
        Tue, 04 Apr 2023 11:21:14 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:14 -0700 (PDT)
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
Subject: [PATCH V4 04/23] ACPI: tables: Print RINTC information when MADT is parsed
Date:   Tue,  4 Apr 2023 23:50:18 +0530
Message-Id: <20230404182037.863533-5-sunilvl@ventanamicro.com>
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

When MADT is parsed, print RINTC information as below:

ACPI: RISC-V INTC (acpi_uid[0x0000] hart_id[0x0] enabled)
ACPI: RISC-V INTC (acpi_uid[0x0001] hart_id[0x1] enabled)
...
ACPI: RISC-V INTC (acpi_uid[0x000f] hart_id[0xf] enabled)

This debug information will be very helpful during bring up.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/acpi/tables.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 7b4680da57d7..8ab0a82b4da4 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -220,6 +220,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 		}
 		break;
 
+	case ACPI_MADT_TYPE_RINTC:
+		{
+			struct acpi_madt_rintc *p = (struct acpi_madt_rintc *)header;
+
+			pr_debug("RISC-V INTC (acpi_uid[0x%04x] hart_id[0x%llx] %s)\n",
+				 p->uid, p->hart_id,
+				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+		}
+		break;
+
 	default:
 		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
 			header->type);
-- 
2.34.1

