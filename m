Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09DFA647B56
	for <lists+linux-doc@lfdr.de>; Fri,  9 Dec 2022 02:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiLIBXf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Dec 2022 20:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiLIBXc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 20:23:32 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0CF82FB4;
        Thu,  8 Dec 2022 17:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670549011; x=1702085011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ka1cSePtifjHK4uLChKdCNuYKgE+Jy1p2zWMS3zdk+4=;
  b=SzEJbi/bhp3a1rpX34MS0S47opFIyIpp7Q9uRO+r/4Iv6UF1RYO7GaFT
   I+uhSj6/NyuNQoNN5rhFHMY9yKlPIZc+bcSprVeRw3vNHokMs+Mcm4fOx
   FiFojMhA3jiQor7owYNI8GIt0NxiOzbKWlj4dqyhf1U58v6T2FCF5B9hd
   rXFF6NIWuhgQ4isnb00S376uUEmZ13SnD7+eBN/FwCWQrU5PgX4L9TgXx
   mR93XkbIZcZGFl2U9kO1S5M14uvpd5Nw2gi5TKtJHlnK8So/y9Y0Il9Wb
   n+1gh7lHWuamjxnW02/JrAGLLFvLd+7+7aDJYrqch0BlZiROI8oFXv/HR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="318504871"
X-IronPort-AV: E=Sophos;i="5.96,228,1665471600"; 
   d="scan'208";a="318504871"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 17:23:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="715852802"
X-IronPort-AV: E=Sophos;i="5.96,228,1665471600"; 
   d="scan'208";a="715852802"
Received: from rhweight-wrk1.ra.intel.com ([137.102.106.139])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 17:23:29 -0800
From:   matthew.gerlach@linux.intel.com
To:     hao.wu@intel.com, yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, trix@redhat.com,
        mdf@kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianfei.zhang@intel.com, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, geert+renesas@glider.be,
        andriy.shevchenko@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, macro@orcam.me.uk,
        johan@kernel.org, lukas@wunner.de, ilpo.jarvinen@linux.intel.com,
        marpagan@redhat.com
Cc:     Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH v5 4/4] tty: serial: 8250: add DFL bus driver for Altera 16550.
Date:   Thu,  8 Dec 2022 17:23:48 -0800
Message-Id: <20221209012348.2883424-5-matthew.gerlach@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209012348.2883424-1-matthew.gerlach@linux.intel.com>
References: <20221209012348.2883424-1-matthew.gerlach@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Add a Device Feature List (DFL) bus driver for the Altera
16550 implementation of UART.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v5: removed unneeded blank line
    removed unneeded includes
    included device.h and types.h
    removed unneeded local variable
    remove calls to dev_dbg
    memset -> { }
    remove space after period
    explicitly include used headers
    remove redundant Inc from Copyright
    fix format specifier

v4: use dev_err_probe() everywhere that is appropriate
    clean up noise
    change error messages to use the word, unsupported
    tried again to sort Makefile and KConfig better
    reorder probe function for easier error handling
    use new dfh_find_param API

v3: use passed in location of registers
    use cleaned up functions for parsing parameters

v2: clean up error messages
    alphabetize header files
    fix 'missing prototype' error by making function static
    tried to sort Makefile and Kconfig better
---
 drivers/tty/serial/8250/8250_dfl.c | 147 +++++++++++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig    |  12 +++
 drivers/tty/serial/8250/Makefile   |   1 +
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_dfl.c

diff --git a/drivers/tty/serial/8250/8250_dfl.c b/drivers/tty/serial/8250/8250_dfl.c
new file mode 100644
index 000000000000..68b3c00d3fe9
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_dfl.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for FPGA UART
+ *
+ * Copyright (C) 2022 Intel Corporation.
+ *
+ * Authors:
+ *   Ananda Ravuri <ananda.ravuri@intel.com>
+ *   Matthew Gerlach <matthew.gerlach@linux.intel.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/dfl.h>
+#include <linux/errno.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/types.h>
+
+#include <linux/serial.h>
+#include <linux/serial_8250.h>
+
+struct dfl_uart {
+	int line;
+};
+
+static int dfl_uart_get_params(struct dfl_device *dfl_dev, struct uart_8250_port *uart)
+{
+	struct device *dev = &dfl_dev->dev;
+	u32 reg_width;
+	u64 fifo_len;
+	u64 *p;
+
+	p = dfh_find_param(dfl_dev, DFHv1_PARAM_ID_CLK_FRQ);
+	if (!p)
+		return dev_err_probe(dev, -EINVAL, "missing CLK_FRQ param\n");
+
+	p++;
+	uart->port.uartclk = *p;
+
+	p = dfh_find_param(dfl_dev, DFHv1_PARAM_ID_FIFO_LEN);
+	if (!p)
+		return dev_err_probe(dev, -EINVAL, "missing FIFO_LEN param\n");
+
+	p++;
+	fifo_len = *p;
+	switch (fifo_len) {
+	case 32:
+		uart->port.type = PORT_ALTR_16550_F32;
+		break;
+
+	case 64:
+		uart->port.type = PORT_ALTR_16550_F64;
+		break;
+
+	case 128:
+		uart->port.type = PORT_ALTR_16550_F128;
+		break;
+
+	default:
+		return dev_err_probe(dev, -EINVAL, "unsupported FIFO_LEN %llu\n", fifo_len);
+	}
+
+	p = dfh_find_param(dfl_dev, DFHv1_PARAM_ID_REG_LAYOUT);
+	if (!p)
+		return dev_err_probe(dev, -EINVAL, "missing REG_LAYOUT param\n");
+
+	p++;
+	uart->port.regshift = FIELD_GET(DFHv1_PARAM_REG_LAYOUT_SHIFT, *p);
+	reg_width = FIELD_GET(DFHv1_PARAM_REG_LAYOUT_WIDTH, *p);
+	switch (reg_width) {
+	case 4:
+		uart->port.iotype = UPIO_MEM32;
+		break;
+
+	case 2:
+		uart->port.iotype = UPIO_MEM16;
+		break;
+
+	default:
+		return dev_err_probe(dev, -EINVAL, "unsupported reg-width %u\n", reg_width);
+
+	}
+
+	return 0;
+}
+
+static int dfl_uart_probe(struct dfl_device *dfl_dev)
+{
+	struct device *dev = &dfl_dev->dev;
+	struct uart_8250_port uart = { };
+	struct dfl_uart *dfluart;
+	int ret;
+
+	uart.port.flags = UPF_IOREMAP;
+	uart.port.mapbase = dfl_dev->mmio_res.start;
+	uart.port.mapsize = resource_size(&dfl_dev->mmio_res);
+
+	ret = dfl_uart_get_params(dfl_dev, &uart);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed uart feature walk\n");
+
+	if (dfl_dev->num_irqs == 1)
+		uart.port.irq = dfl_dev->irqs[0];
+
+	dfluart = devm_kzalloc(dev, sizeof(*dfluart), GFP_KERNEL);
+	if (!dfluart)
+		return -ENOMEM;
+
+	dfluart->line = serial8250_register_8250_port(&uart);
+	if (dfluart->line < 0)
+		return dev_err_probe(dev, dfluart->line, "unable to register 8250 port.\n");
+
+	dev_set_drvdata(dev, dfluart);
+
+	return 0;
+}
+
+static void dfl_uart_remove(struct dfl_device *dfl_dev)
+{
+	struct dfl_uart *dfluart = dev_get_drvdata(&dfl_dev->dev);
+
+	serial8250_unregister_port(dfluart->line);
+}
+
+#define FME_FEATURE_ID_UART 0x24
+
+static const struct dfl_device_id dfl_uart_ids[] = {
+	{ FME_ID, FME_FEATURE_ID_UART },
+	{ }
+};
+MODULE_DEVICE_TABLE(dfl, dfl_uart_ids);
+
+static struct dfl_driver dfl_uart_driver = {
+	.drv = {
+		.name = "dfl-uart",
+	},
+	.id_table = dfl_uart_ids,
+	.probe = dfl_uart_probe,
+	.remove = dfl_uart_remove,
+};
+module_dfl_driver(dfl_uart_driver);
+
+MODULE_DESCRIPTION("DFL Intel UART driver");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index b0f62345bc84..08af2acd4645 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -370,6 +370,18 @@ config SERIAL_8250_FSL
 	  erratum for Freescale 16550 UARTs in the 8250 driver. It also
 	  enables support for ACPI enumeration.
 
+config SERIAL_8250_DFL
+	tristate "DFL bus driver for Altera 16550 UART"
+	depends on SERIAL_8250 && FPGA_DFL
+	help
+	  This option enables support for a Device Feature List (DFL) bus
+	  driver for the Altera 16650 UART. One or more Altera 16650 UARTs
+	  can be instantiated in a FPGA and then be discovered during
+	  enumeration of the DFL bus.
+
+	  To compile this driver as a module, chose M here: the
+	  module will be called 8250_dfl.
+
 config SERIAL_8250_DW
 	tristate "Support for Synopsys DesignWare 8250 quirks"
 	depends on SERIAL_8250
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 1615bfdde2a0..4e1a32812683 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_SERIAL_8250_EXAR_ST16C554)	+= 8250_exar_st16c554.o
 obj-$(CONFIG_SERIAL_8250_HUB6)		+= 8250_hub6.o
 obj-$(CONFIG_SERIAL_8250_FSL)		+= 8250_fsl.o
 obj-$(CONFIG_SERIAL_8250_MEN_MCB)	+= 8250_men_mcb.o
+obj-$(CONFIG_SERIAL_8250_DFL)		+= 8250_dfl.o
 obj-$(CONFIG_SERIAL_8250_DW)		+= 8250_dw.o
 obj-$(CONFIG_SERIAL_8250_EM)		+= 8250_em.o
 obj-$(CONFIG_SERIAL_8250_IOC3)		+= 8250_ioc3.o
-- 
2.25.1

