Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016662D5725
	for <lists+linux-doc@lfdr.de>; Thu, 10 Dec 2020 10:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgLJJ3h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Dec 2020 04:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgLJJ3h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 04:29:37 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F75BC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 01:28:57 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id s2so2468551plr.9
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtTPet9oDPw24qFP8KZPfexGo1l3A98lwPda+meYJFQ=;
        b=etcpFAjPzZ2+Tsn1PFjacaKd2MjbA2G5lHk812WRAiDf0Dt99sB3LlTPyKlbzqyxyp
         EyY80O7N5nV5CX5KYt1Hq3cjP/z2E4s2a6wiLbyKHF9HsDQz0c77y2qFPWwQ7h4PUXA7
         cxmoG/c4/TcLHwdHD3WUCgSkq8o0YILPHpX9eQ8UWidSjFaRAv8r6NW05S3QRjX0T6BV
         IHPIz6HAnEtCzNmtOFdHTl068/n7Nd4yWJVRG6v9rlCZd8D+FoPwTB4n1pB7aOovHSVq
         zX5nbFSSWGTNygtJuvrejxXCaoVVc7VkAdODhnFbi2yjJUxxc+NGs06UYCE28ipPxGjJ
         9q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtTPet9oDPw24qFP8KZPfexGo1l3A98lwPda+meYJFQ=;
        b=nXLLxbmUAjIg2zF0vCp1bBqGvq5eshzxe5gxEjwNXb98rc9zUGV8rl9irJbfc22Fgt
         /SIhUYDY/HqHYS+92X23Qd2au6u1b7165NmE405seQsXOvuwXJg93gG13nHzLEYhW46a
         q4YnDbd+so3jEvLyrA/Gl6GUpVruLI4TA7m8aA5QUPeXgJbzAc3+ukYF0C1QW08gejlj
         f9R8BfHhQl6O40hnbJkDBay2ugVtyFh3cdo07+AV0OGuJaX9UMJ/OZ5MDZQRRnE3fKAZ
         vj0OjFfwxuFpea58Z3rIi3pwcCxS7F+ylmKFnH3E9GIsthsu6cBV0tvE+b4b84OQ1lbG
         1Cvg==
X-Gm-Message-State: AOAM530Q+s4X2uaCs2GpLpp/cc/1RNN0OE97xW3xSquVRED/GAI8SN80
        YneljXST4YdBm6Mn5JFhXf8rVA==
X-Google-Smtp-Source: ABdhPJynT+XiVZ3FQP4Ywv0PhsnTAW+HK/555OCBWju6sqEGUCIw7fbYsxWRSsWxABZW0KjhvZI0Ag==
X-Received: by 2002:a17:902:9891:b029:d8:fdf6:7c04 with SMTP id s17-20020a1709029891b02900d8fdf67c04mr5966239plp.54.1607592536733;
        Thu, 10 Dec 2020 01:28:56 -0800 (PST)
Received: from localhost ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id g202sm5361604pfb.196.2020.12.10.01.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 01:28:56 -0800 (PST)
From:   John Wang <wangzhiqiang.bj@bytedance.com>
To:     xuxiaohan@bytedance.com, yulei.sh@bytedance.com
Cc:     Oskar Senft <osk@google.com>, Yong Li <yong.b.li@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list),
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH 1/3] misc: aspeed: Add Aspeed UART routing control driver.
Date:   Thu, 10 Dec 2020 17:28:53 +0800
Message-Id: <20201210092853.303-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Oskar Senft <osk@google.com>

This driver adds sysfs files that allow the BMC userspace to configure
how UARTs and physical serial I/O ports are routed.

Tested: Checked correct behavior (both read & write) on TYAN S7106
board by manually changing routing settings and confirming that bits
flow as expected. Tested for UART1 and UART3 as this board doesn't have
the other UARTs wired up in a testable way.

Signed-off-by: Oskar Senft <osk@google.com>
Signed-off-by: Yong Li <yong.b.li@linux.intel.com>
Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 .../stable/sysfs-driver-aspeed-uart-routing   |  14 +
 .../misc-devices/aspeed-uart-routing.txt      |  49 +++
 drivers/misc/Kconfig                          |   6 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/aspeed-uart-routing.c            | 383 ++++++++++++++++++
 5 files changed, 453 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
 create mode 100644 Documentation/misc-devices/aspeed-uart-routing.txt
 create mode 100644 drivers/misc/aspeed-uart-routing.c

diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
new file mode 100644
index 000000000000..5068737d9c12
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
@@ -0,0 +1,14 @@
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/io*
+Date:		August 2018
+Contact:	Oskar Senft <osk@google.com>
+Description:	Configures the input source for the specific physical
+		serial I/O port.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
+Date:		August 2018
+Contact:	Oskar Senft <osk@google.com>
+Description:	Configures the input source for the specific UART.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/Documentation/misc-devices/aspeed-uart-routing.txt b/Documentation/misc-devices/aspeed-uart-routing.txt
new file mode 100644
index 000000000000..cf1c2a466875
--- /dev/null
+++ b/Documentation/misc-devices/aspeed-uart-routing.txt
@@ -0,0 +1,49 @@
+Kernel driver aspeed-uart-routing
+=================================
+
+Supported chips:
+ASPEED AST2500/AST2600
+
+Author:
+Google LLC
+
+Description
+-----------
+
+The Aspeed AST2500/AST2600 allows to dynamically route the inputs for the
+built-in UARTS and physical serial I/O ports.
+
+This allows, for example, to connect the output of UART to another UART.
+This can be used to enable host<->BMC communication via UARTs, e.g. to allow
+access to the host's serial console.
+
+This driver is for the BMC side. The sysfs files allow the BMC userspace
+which owns the system configuration policy, to configure how UARTs and
+physical serial I/O ports are routed.
+
+The driver provides the following files in sysfs:
+uart1		Configure the input signal to UART1.
+uart2		Configure the input signal to UART2.
+uart3		Configure the input signal to UART3.
+uart4		Configure the input signal to UART4.
+uart5		Configure the input signal to UART5.
+io1		Configure the input signal to physical serial port 1.
+io2		Configure the input signal to physical serial port 2.
+io3		Configure the input signal to physical serial port 3.
+io4		Configure the input signal to physical serial port 4.
+io5		Configure the input signal to physical serial port 5.
+
+When read, each file shows the list of available options with the currently
+selected option marked by square brackets "[]". The list of available options
+depends on the selected file.
+
+Example:
+$ cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+[io1] io2 io3 io4 uart2 uart3 uart4 io6
+
+In this case, UART1 gets its input signal from IO1 (physical serial port 1).
+
+$ echo -n "uart3" \
+  >/sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+$ cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+io1 io2 io3 io4 uart2 [uart3] uart4 io6
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index d8626a0d3e31..48a519c59bdf 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -451,6 +451,12 @@ config MCTP_LPC
 	  Implements the MCTP LPC binding via KCS LPC IO cycles for control and
           LPC FWH cycles for data
 
+config ASPEED_UART_ROUTING
+	tristate "Aspeed ast2500 UART routing control"
+	help
+	  If you want to configure UART routing on Aspeed BMC platforms, enable
+	  this option.
+
 config MISC_RTSX
 	tristate
 	default MISC_RTSX_PCI || MISC_RTSX_USB
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 183970192ced..4e67e21c2e65 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -60,3 +60,4 @@ obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_NPCM7XX_LPC_BPC)	+= npcm7xx-lpc-bpc.o
 obj-$(CONFIG_NPCM7XX_PCI_MBOX)	+= npcm7xx-pci-mbox.o
 obj-$(CONFIG_MCTP_LPC)		+= mctp-lpc.o
+obj-$(CONFIG_ASPEED_UART_ROUTING) += aspeed-uart-routing.o
diff --git a/drivers/misc/aspeed-uart-routing.c b/drivers/misc/aspeed-uart-routing.c
new file mode 100644
index 000000000000..21ef5d98c317
--- /dev/null
+++ b/drivers/misc/aspeed-uart-routing.c
@@ -0,0 +1,383 @@
+/*
+ * UART Routing driver for Aspeed AST2500
+ *
+ * Copyright (c) 2018 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+/* The Aspeed AST2500 allows to dynamically route the inputs for the built-in
+ * UARTS and physical serial I/O ports.
+ *
+ * This allows, for example, to connect the output of UART to another UART.
+ * This can be used to enable host<->BMC communication via UARTs, e.g. to allow
+ * access to the host's serial console.
+ *
+ * This driver is for the BMC side. The sysfs files allow the BMC userspace
+ * which owns the system configuration policy, to configure how UARTs and
+ * physical serial I/O ports are routed.
+ */
+
+#define ASPEED_HICRA_IO1	"io1"
+#define ASPEED_HICRA_IO2	"io2"
+#define ASPEED_HICRA_IO3	"io3"
+#define ASPEED_HICRA_IO4	"io4"
+#define ASPEED_HICRA_IO5	"io5"
+#define ASPEED_HICRA_IO6	"io6"
+#define ASPEED_HICRA_UART1	"uart1"
+#define ASPEED_HICRA_UART2	"uart2"
+#define ASPEED_HICRA_UART3	"uart3"
+#define ASPEED_HICRA_UART4	"uart4"
+#define ASPEED_HICRA_UART5	"uart5"
+
+struct aspeed_uart_routing {
+	struct device		*dev;
+	void __iomem		*regs;
+	spinlock_t		lock;
+};
+
+struct aspeed_uart_routing_selector {
+	struct device_attribute	dev_attr;
+	int				shift;
+	int				mask;
+	const char * const options[];
+};
+
+#define to_routing_selector(_dev_attr)					\
+	container_of(_dev_attr, struct aspeed_uart_routing_selector, dev_attr)
+
+
+static ssize_t aspeed_uart_routing_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf);
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count);
+
+#define ROUTING_ATTR(_name) {						\
+	.attr = {.name = _name,					\
+		 .mode = VERIFY_OCTAL_PERMISSIONS(S_IWUSR | S_IRUGO) }, \
+	.show = aspeed_uart_routing_show,				\
+	.store = aspeed_uart_routing_store,				\
+}
+
+static struct aspeed_uart_routing_selector uart5_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART5),
+	.shift = 28,
+	.mask = 0xf,
+	.options = {
+		    ASPEED_HICRA_IO5,   // 0
+		    ASPEED_HICRA_IO1,   // 1
+		    ASPEED_HICRA_IO2,   // 2
+		    ASPEED_HICRA_IO3,   // 3
+		    ASPEED_HICRA_IO4,   // 4
+		    ASPEED_HICRA_UART1, // 5
+		    ASPEED_HICRA_UART2, // 6
+		    ASPEED_HICRA_UART3, // 7
+		    ASPEED_HICRA_UART4, // 8
+		    ASPEED_HICRA_IO6,   // 9
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector uart4_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART4),
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO4,   // 0
+		    ASPEED_HICRA_IO1,   // 1
+		    ASPEED_HICRA_IO2,   // 2
+		    ASPEED_HICRA_IO3,   // 3
+		    ASPEED_HICRA_UART1, // 4
+		    ASPEED_HICRA_UART2, // 5
+		    ASPEED_HICRA_UART3, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+	},
+};
+
+static struct aspeed_uart_routing_selector uart3_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART3),
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO3,   // 0
+		    ASPEED_HICRA_IO4,   // 1
+		    ASPEED_HICRA_IO1,   // 2
+		    ASPEED_HICRA_IO2,   // 3
+		    ASPEED_HICRA_UART4, // 4
+		    ASPEED_HICRA_UART1, // 5
+		    ASPEED_HICRA_UART2, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector uart2_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART2),
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO2,   // 0
+		    ASPEED_HICRA_IO3,   // 1
+		    ASPEED_HICRA_IO4,   // 2
+		    ASPEED_HICRA_IO1,   // 3
+		    ASPEED_HICRA_UART3, // 4
+		    ASPEED_HICRA_UART4, // 5
+		    ASPEED_HICRA_UART1, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector uart1_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART1),
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO1,   // 0
+		    ASPEED_HICRA_IO2,   // 1
+		    ASPEED_HICRA_IO3,   // 2
+		    ASPEED_HICRA_IO4,   // 3
+		    ASPEED_HICRA_UART2, // 4
+		    ASPEED_HICRA_UART3, // 5
+		    ASPEED_HICRA_UART4, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io5_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO5),
+	.shift = 12,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART5, // 0
+		    ASPEED_HICRA_UART1, // 1
+		    ASPEED_HICRA_UART2, // 2
+		    ASPEED_HICRA_UART3, // 3
+		    ASPEED_HICRA_UART4, // 4
+		    ASPEED_HICRA_IO1,   // 5
+		    ASPEED_HICRA_IO3,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io4_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO4),
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART4, // 0
+		    ASPEED_HICRA_UART5, // 1
+		    ASPEED_HICRA_UART1, // 2
+		    ASPEED_HICRA_UART2, // 3
+		    ASPEED_HICRA_UART3, // 4
+		    ASPEED_HICRA_IO1,   // 5
+		    ASPEED_HICRA_IO2,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io3_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO3),
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART3, // 0
+		    ASPEED_HICRA_UART4, // 1
+		    ASPEED_HICRA_UART5, // 2
+		    ASPEED_HICRA_UART1, // 3
+		    ASPEED_HICRA_UART2, // 4
+		    ASPEED_HICRA_IO1,   // 5
+		    ASPEED_HICRA_IO2,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io2_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO2),
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART2, // 0
+		    ASPEED_HICRA_UART3, // 1
+		    ASPEED_HICRA_UART4, // 2
+		    ASPEED_HICRA_UART5, // 3
+		    ASPEED_HICRA_UART1, // 4
+		    ASPEED_HICRA_IO3,   // 5
+		    ASPEED_HICRA_IO4,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io1_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO1),
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART1, // 0
+		    ASPEED_HICRA_UART2, // 1
+		    ASPEED_HICRA_UART3, // 2
+		    ASPEED_HICRA_UART4, // 3
+		    ASPEED_HICRA_UART5, // 4
+		    ASPEED_HICRA_IO3,   // 5
+		    ASPEED_HICRA_IO4,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+
+static struct attribute *aspeed_uart_routing_attrs[] = {
+	&uart1_sel.dev_attr.attr,
+	&uart2_sel.dev_attr.attr,
+	&uart3_sel.dev_attr.attr,
+	&uart4_sel.dev_attr.attr,
+	&uart5_sel.dev_attr.attr,
+	&io1_sel.dev_attr.attr,
+	&io2_sel.dev_attr.attr,
+	&io3_sel.dev_attr.attr,
+	&io4_sel.dev_attr.attr,
+	&io5_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group aspeed_uart_routing_attr_group = {
+	.attrs = aspeed_uart_routing_attrs,
+};
+
+static ssize_t aspeed_uart_routing_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
+	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
+	int val, pos, len;
+
+	val = (readl(uart_routing->regs) >> sel->shift) & sel->mask;
+
+	len = 0;
+	for (pos = 0; sel->options[pos] != NULL; ++pos) {
+		if (pos == val) {
+			len += snprintf(buf + len, PAGE_SIZE - 1 - len,
+					"[%s] ", sel->options[pos]);
+		} else {
+			len += snprintf(buf + len, PAGE_SIZE - 1 - len,
+					"%s ", sel->options[pos]);
+		}
+	}
+
+	if (val >= pos) {
+		len += snprintf(buf + len, PAGE_SIZE - 1 - len,
+				"[unknown(%d)]", val);
+	}
+
+	len += snprintf(buf + len, PAGE_SIZE - 1 - len, "\n");
+
+	return len;
+}
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
+	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
+	int val;
+	u32 reg;
+
+	val = match_string(sel->options, -1, buf);
+	if (val < 0) {
+		dev_err(dev, "invalid value \"%s\"\n", buf);
+		return -EINVAL;
+	}
+
+	spin_lock(&uart_routing->lock);
+	reg = readl(uart_routing->regs);
+	// Zero out existing value in specified bits.
+	reg &= ~(sel->mask << sel->shift);
+	// Set new value in specified bits.
+	reg |= (val & sel->mask) << sel->shift;
+	writel(reg, uart_routing->regs);
+	spin_unlock(&uart_routing->lock);
+
+	return count;
+}
+
+static int aspeed_uart_routing_probe(struct platform_device *pdev)
+{
+	struct aspeed_uart_routing *uart_routing;
+	struct resource *res;
+	int rc;
+
+	uart_routing = devm_kzalloc(&pdev->dev,
+				    sizeof(*uart_routing),
+				    GFP_KERNEL);
+	if (!uart_routing)
+		return -ENOMEM;
+
+	spin_lock_init(&uart_routing->lock);
+	uart_routing->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	uart_routing->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(uart_routing->regs))
+		return PTR_ERR(uart_routing->regs);
+
+	rc = sysfs_create_group(&uart_routing->dev->kobj,
+				&aspeed_uart_routing_attr_group);
+	if (rc < 0)
+		return rc;
+
+	platform_set_drvdata(pdev, uart_routing);
+
+	return 0;
+}
+
+static int aspeed_uart_routing_remove(struct platform_device *pdev)
+{
+	struct aspeed_uart_routing *uart_routing = platform_get_drvdata(pdev);
+
+	sysfs_remove_group(&uart_routing->dev->kobj,
+			   &aspeed_uart_routing_attr_group);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_uart_routing_table[] = {
+	{ .compatible = "aspeed,ast2500-uart-routing" },
+	{ },
+};
+
+static struct platform_driver aspeed_uart_routing_driver = {
+	.driver = {
+		.name = "aspeed-uart-routing",
+		.of_match_table = aspeed_uart_routing_table,
+	},
+	.probe = aspeed_uart_routing_probe,
+	.remove = aspeed_uart_routing_remove,
+};
+
+module_platform_driver(aspeed_uart_routing_driver);
+
+MODULE_AUTHOR("Oskar Senft <osk@google.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Driver to configure Aspeed UART routing");
-- 
2.25.1

