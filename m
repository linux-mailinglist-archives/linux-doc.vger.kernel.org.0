Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23254F7F0E
	for <lists+linux-doc@lfdr.de>; Thu,  7 Apr 2022 14:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242882AbiDGMeG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 Apr 2022 08:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245149AbiDGMeA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 08:34:00 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA25114090;
        Thu,  7 Apr 2022 05:32:00 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237ApwOU022051;
        Thu, 7 Apr 2022 14:31:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=OzzsSeRZXTJPRZje9ui1T8+kROrim9zZTezfZrmqwVA=;
 b=RHV+xEWvG+cC0j9k6+66x8UD+84FpPc/RKoKwBCKJ2RUj/7ACDKSt2eZ2aHU13e6cgFh
 +xSihihv9nG3l19cDC7LJR7BPwC53f+ILSvmUWE5i3r7x5Ikck3WkZJzZeprXoFcOq3L
 DdHPalcKI5R1Vqcu4wBI1ILovAIUIiqke4z2pxOta0ihE+3veVw/OPYlu3+DKP1J9NUK
 E1mgymvNfnmQcqbY/BvcJZbmc0TpWqa4y7YEjTy0hMf6KMuEuLv4AXE3cJpu9ZxiwMh9
 nlvh37p2nmwnOvDNSB0cun/LjSdpvgNrzena1G3I8yku7vMvVyK129qHzPkU/VDJBzzg ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f8x9gkwb6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 14:31:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D74A4100034;
        Thu,  7 Apr 2022 14:31:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D005621A223;
        Thu,  7 Apr 2022 14:31:21 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr 2022 14:31:21
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
Subject: [PATCH 1/3] serial: stm32: remove infinite loop possibility in putchar function
Date:   Thu, 7 Apr 2022 14:31:07 +0200
Message-ID: <20220407123109.132035-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407123109.132035-1-valentin.caron@foss.st.com>
References: <20220407123109.132035-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.49]
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

Rework stm32_usart_console_putchar() function in order to anticipate
the case where the character can never be sent.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/tty/serial/stm32-usart.c | 12 +++++++++---
 drivers/tty/serial/stm32-usart.h |  2 ++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 87b5cd4c9743..83895da84891 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1645,10 +1645,16 @@ static void stm32_usart_console_putchar(struct uart_port *port, unsigned char ch
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
+	u32 isr;
+	int ret;
 
-	while (!(readl_relaxed(port->membase + ofs->isr) & USART_SR_TXE))
-		cpu_relax();
-
+	ret = readl_relaxed_poll_timeout_atomic(port->membase + ofs->isr, isr,
+						(isr & USART_SR_TXE), 100,
+						STM32_USART_TIMEOUT_USEC);
+	if (ret != 0) {
+		dev_err(port->dev, "Error while sending data in UART TX : %d\n", ret);
+		return;
+	}
 	writel_relaxed(ch, port->membase + ofs->tdr);
 }
 
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index feab952aec16..d734c4a5fd24 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -251,6 +251,8 @@ struct stm32_usart_info stm32h7_info = {
 #define RX_BUF_P (RX_BUF_L / 2)	 /* dma rx buffer period     */
 #define TX_BUF_L RX_BUF_L	 /* dma tx buffer length     */
 
+#define STM32_USART_TIMEOUT_USEC USEC_PER_SEC /* 1s timeout in µs */
+
 struct stm32_port {
 	struct uart_port port;
 	struct clk *clk;
-- 
2.25.1

