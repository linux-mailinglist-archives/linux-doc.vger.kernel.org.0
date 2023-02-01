Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29CBA6818CB
	for <lists+linux-doc@lfdr.de>; Mon, 30 Jan 2023 19:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238010AbjA3SX7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 30 Jan 2023 13:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238011AbjA3SXj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:23:39 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076E1252B2
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:08 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so5356724pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez9zOMlap25JS09j6G2VSm957wPlmGGDqcc/YOqCD/M=;
        b=ZALYsSd6QGZRuTtO53OYR7dsp9VVOw/W/YNYZ9/vVpK3xUlcx/wL651WUsOjDp9t7/
         WwA7Cv9udLCB6QweFEHYqFxxXznTkUUVYOPxtnUXVHNn2KMirZ7uFyDqj1LJ4zFgjvi+
         fLS+1TAT6YQG0vQo/kdBhwE5haBA8y/K+49TFsBnd5cfI+tlhBXXEZ9rRRXPpQIiqDCV
         W+4FpfdUqZyfoBklcJDVXTxZHlupNdKZOqtb1VvKGrvNySMlWdR+xWmUslkHuxTikP13
         2S9NebTlIk+0VjZ5RTL2EpZZQ33E5/sD3TJXbejwgpmb00P/iX3S1LwGxM0dJOxRha3B
         FGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ez9zOMlap25JS09j6G2VSm957wPlmGGDqcc/YOqCD/M=;
        b=ZaBi32jatVTxi/qznRMJYJvCn+vIWRcH2hsBrDdeMMzMCpuCdToXCLLrZXLL89OHNo
         C5+KXudmQzxZgIMBbKZ8ko2nxUfeVQLvDmq3LjWixlu70scIVMe9QVOIWUOischlGYT/
         Oc+AZBxW9+Ajhp4NKZvAIqIChXIxc9p8TJRoFsJo+FJV335rGngoOFIYH89cIVOgvQ5M
         96tBnVZVuuts7e5s7gDiG1Cc+T/ztEOIFtbhktAQZkhuG7GeSizhmLGdlADX5iJ7BhQL
         KEyIvdFeFoJpQfBDYJEY4x+bcoNLXcr0Z+JFcX/G8R75MnwTKphD0moj4/FZ3Aj4N0nH
         x+Tw==
X-Gm-Message-State: AO0yUKXMFuVFWpkTU0udVbtYQygVrjtXwxx3FlqQynAxgxYUaW8v2CfF
        2lWkkb7FAsK6y89BxzJ7SGhaVg==
X-Google-Smtp-Source: AK7set+hs3F+v3tOHd/3gMihfw9zgIr4f+ZWLQ0nZzTPXFNry0CAa3JQqlMOykw+1FPSzHeMdZ3O/Q==
X-Received: by 2002:a17:90b:3148:b0:22c:9a54:fea with SMTP id ip8-20020a17090b314800b0022c9a540feamr5483511pjb.48.1675102981886;
        Mon, 30 Jan 2023 10:23:01 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:01 -0800 (PST)
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
Subject: [PATCH 06/24] RISC-V: ACPI: Add PCI functions to build ACPI core
Date:   Mon, 30 Jan 2023 23:52:07 +0530
Message-Id: <20230130182225.2471414-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When CONFIG_PCI is enabled, ACPI core expects few arch
functions related to PCI. Add those functions so that
ACPI core gets build. These are levraged from arm64.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/Makefile |   1 +
 arch/riscv/kernel/pci.c    | 173 +++++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 arch/riscv/kernel/pci.c

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f979dc8cf47d..e9d37639751d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -92,3 +92,4 @@ obj-$(CONFIG_COMPAT)		+= compat_signal.o
 obj-$(CONFIG_COMPAT)		+= compat_vdso/
 
 obj-$(CONFIG_ACPI)              += acpi.o
+obj-$(CONFIG_PCI)               += pci.o
diff --git a/arch/riscv/kernel/pci.c b/arch/riscv/kernel/pci.c
new file mode 100644
index 000000000000..3388af3a67a0
--- /dev/null
+++ b/arch/riscv/kernel/pci.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Code borrowed from ARM64
+ *
+ * Copyright (C) 2003 Anton Blanchard <anton@au.ibm.com>, IBM
+ * Copyright (C) 2014 ARM Ltd.
+ * Copyright (C) 2022-2023 Ventana Micro System Inc.
+ */
+
+#include <linux/acpi.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/pci.h>
+#include <linux/pci-acpi.h>
+#include <linux/pci-ecam.h>
+
+#ifdef CONFIG_ACPI
+
+/*
+ * raw_pci_read/write - Platform-specific PCI config space access.
+ */
+int raw_pci_read(unsigned int domain, unsigned int bus,
+		  unsigned int devfn, int reg, int len, u32 *val)
+{
+	struct pci_bus *b = pci_find_bus(domain, bus);
+
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->read(b, devfn, reg, len, val);
+}
+
+int raw_pci_write(unsigned int domain, unsigned int bus,
+		unsigned int devfn, int reg, int len, u32 val)
+{
+	struct pci_bus *b = pci_find_bus(domain, bus);
+
+	if (!b)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	return b->ops->write(b, devfn, reg, len, val);
+}
+
+
+struct acpi_pci_generic_root_info {
+	struct acpi_pci_root_info	common;
+	struct pci_config_window	*cfg;	/* config space mapping */
+};
+
+int acpi_pci_bus_find_domain_nr(struct pci_bus *bus)
+{
+	struct pci_config_window *cfg = bus->sysdata;
+	struct acpi_device *adev = to_acpi_device(cfg->parent);
+	struct acpi_pci_root *root = acpi_driver_data(adev);
+
+	return root->segment;
+}
+
+static int pci_acpi_root_prepare_resources(struct acpi_pci_root_info *ci)
+{
+	struct resource_entry *entry, *tmp;
+	int status;
+
+	status = acpi_pci_probe_root_resources(ci);
+	resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
+		if (!(entry->res->flags & IORESOURCE_WINDOW))
+			resource_list_destroy_entry(entry);
+	}
+	return status;
+}
+
+/*
+ * Lookup the bus range for the domain in MCFG, and set up config space
+ * mapping.
+ */
+static struct pci_config_window *
+pci_acpi_setup_ecam_mapping(struct acpi_pci_root *root)
+{
+	struct device *dev = &root->device->dev;
+	struct resource *bus_res = &root->secondary;
+	u16 seg = root->segment;
+	const struct pci_ecam_ops *ecam_ops;
+	struct resource cfgres;
+	struct acpi_device *adev;
+	struct pci_config_window *cfg;
+	int ret;
+
+	ret = pci_mcfg_lookup(root, &cfgres, &ecam_ops);
+	if (ret) {
+		dev_err(dev, "%04x:%pR ECAM region not found\n", seg, bus_res);
+		return NULL;
+	}
+
+	adev = acpi_resource_consumer(&cfgres);
+	if (adev)
+		dev_info(dev, "ECAM area %pR reserved by %s\n", &cfgres,
+			 dev_name(&adev->dev));
+	else
+		dev_warn(dev, FW_BUG "ECAM area %pR not reserved in ACPI namespace\n",
+			 &cfgres);
+
+	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
+	if (IS_ERR(cfg)) {
+		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
+			PTR_ERR(cfg));
+		return NULL;
+	}
+
+	return cfg;
+}
+
+/* release_info: free resources allocated by init_info */
+static void pci_acpi_generic_release_info(struct acpi_pci_root_info *ci)
+{
+	struct acpi_pci_generic_root_info *ri;
+
+	ri = container_of(ci, struct acpi_pci_generic_root_info, common);
+	pci_ecam_free(ri->cfg);
+	kfree(ci->ops);
+	kfree(ri);
+}
+
+
+/* Interface called from ACPI code to setup PCI host controller */
+struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
+{
+	struct acpi_pci_generic_root_info *ri;
+	struct pci_bus *bus, *child;
+	struct acpi_pci_root_ops *root_ops;
+	struct pci_host_bridge *host;
+
+	ri = kzalloc(sizeof(*ri), GFP_KERNEL);
+	if (!ri)
+		return NULL;
+
+	root_ops = kzalloc(sizeof(*root_ops), GFP_KERNEL);
+	if (!root_ops) {
+		kfree(ri);
+		return NULL;
+	}
+
+	ri->cfg = pci_acpi_setup_ecam_mapping(root);
+	if (!ri->cfg) {
+		kfree(ri);
+		kfree(root_ops);
+		return NULL;
+	}
+
+	root_ops->release_info = pci_acpi_generic_release_info;
+	root_ops->prepare_resources = pci_acpi_root_prepare_resources;
+	root_ops->pci_ops = (struct pci_ops *)&ri->cfg->ops->pci_ops;
+	bus = acpi_pci_root_create(root, root_ops, &ri->common, ri->cfg);
+	if (!bus)
+		return NULL;
+
+	/* If we must preserve the resource configuration, claim now */
+	host = pci_find_host_bridge(bus);
+	if (host->preserve_config)
+		pci_bus_claim_resources(bus);
+
+	/*
+	 * Assign whatever was left unassigned. If we didn't claim above,
+	 * this will reassign everything.
+	 */
+	pci_assign_unassigned_root_bus_resources(bus);
+
+	list_for_each_entry(child, &bus->children, node)
+		pcie_bus_configure_settings(child);
+
+	return bus;
+}
+
+#endif
-- 
2.38.0

