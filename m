Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1486F4F7F10
	for <lists+linux-doc@lfdr.de>; Thu,  7 Apr 2022 14:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245184AbiDGMeG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 Apr 2022 08:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245180AbiDGMeF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 08:34:05 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE45C118F55;
        Thu,  7 Apr 2022 05:32:04 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237Aq3N5030696;
        Thu, 7 Apr 2022 14:31:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=76SYHV/KtKEG+X8D1Pons/IwXN4U2N6uF+AI+Dz58us=;
 b=5Bx2FHIgAJs3ebrtDjtwx1qrcK+TvTxgsJtwTC2Bm2TNJMBP7odiE3VIgMQChCBLmifw
 z1P847sk7fz4WLZBEedK9rEqD/GELssipSxQ1hFmZAs7Oig45GrtAThvrOjJ6byXWJOL
 xV8gjXxIzpPIQBpg6Y1qsP+8/ABs0D1sfZtJm4DKL6ErjaTznrB7L7zQLSfYmd9IDppt
 chM8h20HIPrnp+5psjWg8ST1C8+8fvgmhNot/+aPA1xK+oPsXaWXfRy+V1nG0T+8AVph
 cNYSZG3V0BS3zmSkDIa3xZVmfPKab23UBet8Q7y2AK8cillGT/epVnnq+WNzzYU0uWZg Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f6du14vyw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 14:31:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 583FF100034;
        Thu,  7 Apr 2022 14:31:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5092821A23C;
        Thu,  7 Apr 2022 14:31:26 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr 2022 14:31:25
 +0200
From:   Valentin Caron <valentin.caron@foss.st.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
CC:     Jiri Slaby <jirislaby@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Erwan Le Ray <erwan.leray@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        <linux-serial@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH 3/3] serial: stm32: add earlycon support
Date:   Thu, 7 Apr 2022 14:31:09 +0200
Message-ID: <20220407123109.132035-4-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407123109.132035-1-valentin.caron@foss.st.com>
References: <20220407123109.132035-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_01,2022-04-07_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add early console support in stm32 uart driver.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++
 drivers/tty/serial/Kconfig                    |  1 +
 drivers/tty/serial/stm32-usart.c              | 51 +++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3f1cc5e317ed..e941c3351c7a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1264,6 +1264,12 @@
 			address must be provided, and the serial port must
 			already be setup and configured.
 
+		stm32,<addr>
+			Use early console provided by ST Microelectronics
+			serial driver for STM32 SoCs. A valid base address
+			must be provided, and the serial port must already
+			be setup and configured.
+
 	earlyprintk=	[X86,SH,ARM,M68k,S390]
 			earlyprintk=vga
 			earlyprintk=sclp
diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 6949e883ffab..ed59de8d2e11 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1443,6 +1443,7 @@ config SERIAL_STM32_CONSOLE
 	bool "Support for console on STM32"
 	depends on SERIAL_STM32=y
 	select SERIAL_CORE_CONSOLE
+	select SERIAL_EARLYCON
 
 config SERIAL_MVEBU_UART
 	bool "Marvell EBU serial port support"
diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index d2cf789c7997..b6852a5a9143 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1767,6 +1767,57 @@ static struct console stm32_console = {
 #define STM32_SERIAL_CONSOLE NULL
 #endif /* CONFIG_SERIAL_STM32_CONSOLE */
 
+#ifdef CONFIG_SERIAL_EARLYCON
+static void early_stm32_usart_console_putchar(struct uart_port *port, unsigned char ch)
+{
+	struct stm32_usart_info *info = port->private_data;
+
+	while (!(readl_relaxed(port->membase + info->ofs.isr) & USART_SR_TXE))
+		cpu_relax();
+
+	writel_relaxed(ch, port->membase + info->ofs.tdr);
+}
+
+static void early_stm32_serial_write(struct console *console, const char *s, unsigned int count)
+{
+	struct earlycon_device *device = console->data;
+	struct uart_port *port = &device->port;
+
+	uart_console_write(port, s, count, early_stm32_usart_console_putchar);
+}
+
+static int __init early_stm32_h7_serial_setup(struct earlycon_device *device, const char *options)
+{
+	if (!(device->port.membase || device->port.iobase))
+		return -ENODEV;
+	device->port.private_data = &stm32h7_info;
+	device->con->write = early_stm32_serial_write;
+	return 0;
+}
+
+static int __init early_stm32_f7_serial_setup(struct earlycon_device *device, const char *options)
+{
+	if (!(device->port.membase || device->port.iobase))
+		return -ENODEV;
+	device->port.private_data = &stm32f7_info;
+	device->con->write = early_stm32_serial_write;
+	return 0;
+}
+
+static int __init early_stm32_f4_serial_setup(struct earlycon_device *device, const char *options)
+{
+	if (!(device->port.membase || device->port.iobase))
+		return -ENODEV;
+	device->port.private_data = &stm32f4_info;
+	device->con->write = early_stm32_serial_write;
+	return 0;
+}
+
+OF_EARLYCON_DECLARE(stm32, "st,stm32h7-uart", early_stm32_h7_serial_setup);
+OF_EARLYCON_DECLARE(stm32, "st,stm32f7-uart", early_stm32_f7_serial_setup);
+OF_EARLYCON_DECLARE(stm32, "st,stm32-uart", early_stm32_f4_serial_setup);
+#endif /* CONFIG_SERIAL_EARLYCON */
+
 static struct uart_driver stm32_usart_driver = {
 	.driver_name	= DRIVER_NAME,
 	.dev_name	= STM32_SERIAL_NAME,
-- 
2.25.1

