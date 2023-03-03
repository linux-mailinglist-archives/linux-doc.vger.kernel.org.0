Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBC66A9897
	for <lists+linux-doc@lfdr.de>; Fri,  3 Mar 2023 14:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbjCCNhm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Mar 2023 08:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjCCNh2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:37:28 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F876233C
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:37:15 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so5647239pjn.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjsYubhOT8xU6uZ8EboYvG8E1YP64zOg4cL5+jWYP1s=;
        b=Hvr+Hc1XRLAdZgNfNuAzW7tZ3Jst7xXrcAt+TnMcYTTLwc5wp6kNAfA9iV7bpheE3w
         30D3Sg3uLvZGge9n1VW/QotxJRsCwg3F2z2NiTXSKyFzmZ1MsPzHGNTxO8gwOWrENOa0
         uxGLTMfQ262BzvGKDN2vFo2zi0vTJBZLz3k+a2g+bSD1qqIsQw4D7BbqLxent7xZS5Wf
         ucDJiD+//aTmk/zeGZ7RB28XJ08Bd/dM/1RIsL6Frh6+DPZgmmbCpSngQ5E3P3+sdRC5
         phAfg8rheC2NR51rKDCzXdTuWl++IO7mR63qciSfymfVVq52oFHrnWBukhznu4haQi/W
         hwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjsYubhOT8xU6uZ8EboYvG8E1YP64zOg4cL5+jWYP1s=;
        b=tUr2a61a45KIGPnjxR/qcj4pR8g52hGG4g7Is9cBpzAittUTjgkZ/xfi5ewSWD75uH
         Ovrks/8R6GnaxzUeBxnfafI4q4pNkI9QMtcPsTTb6XE5hP4fd41Qni0zVksUU2zdaD7S
         jC6SNdYayg8UaygbcMgICWt8mtXHUNLgXB7NWENXcDTElrj6YRQDKgptb8o06anxfh5E
         HaKKTKurZ95hs9hYOjYyoXVrt+A8VMHgEPkhzdjtuxTwERVbVIHjuCSzSXIqzPi/QgmG
         gq2gP04VNnTWZatao0baQLQLeXGTgxSvx5h8ZFDUNttN2dzScbChJShswHyhZOPrhWOr
         IVdw==
X-Gm-Message-State: AO0yUKUWpa63UUCcihE6/MFDBsiXJHRNdK4acroYFZTYB8SlPjpPbVMC
        gHGH7iH6py+JDtlk5oY2bjgnMA==
X-Google-Smtp-Source: AK7set9B1fiLkNd83KQWe4fA7X0LkdUmSRy81AmP2oBssWYdZqx7Ou3vE7sWIWYFK1AdjIt5iZD8cQ==
X-Received: by 2002:a17:902:ab8a:b0:19c:d559:8661 with SMTP id f10-20020a170902ab8a00b0019cd5598661mr1709826plr.38.1677850635141;
        Fri, 03 Mar 2023 05:37:15 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:14 -0800 (PST)
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
Subject: [PATCH V3 04/20] ACPI: tables: Print RINTC information when MADT is parsed
Date:   Fri,  3 Mar 2023 19:06:31 +0530
Message-Id: <20230303133647.845095-5-sunilvl@ventanamicro.com>
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

When MADT is parsed, print RINTC information as below:

ACPI: RISC-V INTC (acpi_uid[0x0000] hart_id[0x0] enabled)
ACPI: RISC-V INTC (acpi_uid[0x0001] hart_id[0x1] enabled)
...
ACPI: RISC-V INTC (acpi_uid[0x000f] hart_id[0xf] enabled)

This debug information will be very helpful during bring up.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
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

