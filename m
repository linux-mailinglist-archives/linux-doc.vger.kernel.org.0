Return-Path: <linux-doc+bounces-21397-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A2693D33B
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 14:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9365E1F25AD8
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2024 12:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864BD17CA02;
	Fri, 26 Jul 2024 12:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="m+ezN04N"
X-Original-To: linux-doc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413D17C9F3;
	Fri, 26 Jul 2024 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721997594; cv=none; b=Uhpj0eGP5cd2pqEnK6uhAW6+JB1TQs+J0Kdf7/T3YOC6lJ41Qb+u8O2Lr6LwQ3toalD00aXOlk0HAdRwg4Ldvw5gjg5XBPUxlYpCNmz+5fXllBa1FPIOfLIldTx120G+CmiUdgDG6akJt3pBOZx/Wt4AeQPlXj+e6NhuqtP9DYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721997594; c=relaxed/simple;
	bh=7Q6DPxstv1mi5uIjJY6qqNAI5YBD/244F7PLAMwmxh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTsF/Y1ZB6MhFMm+6WlFj4iirtifFuK4WuO2/CYqcVUC8/usWtx9E2uyRS9VNDMKiblZm5yVlQb3wd2tfzmjyec4vzWya9QpRteTW4sozNJSmJLTLbNLj3NqkH2jxEQb4XSE4ew2/wStEDCAk37kVC9NYae0h2PvQ9pJL4lwuJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=m+ezN04N; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721997592; x=1753533592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Q6DPxstv1mi5uIjJY6qqNAI5YBD/244F7PLAMwmxh8=;
  b=m+ezN04NfeoveFmRgjvreCCQDBPbQwvEOFTUTtSE3ykY6Bvh7vMbiaUL
   NLc+uclFWwKqUUp+CfpXbdojWG5TwIWVFl9h1uFNBLcUPbAHb/m973RJI
   iEejfLFaIIUp9dd3Eu630GfVx3cmh3RWIlheu2dp7rGuQuZfg/edUGH/I
   dbmA3Y3SaR6rEkj535J9ETMYvRD0Zjc6TT2TFKIAKgo5mZlj1uPMbdLcX
   0TAb/odQIVx4PukcfN0Dc8HzFEhUJ/s8OBcIh0IaeCAXbgFWF1TjTLzeN
   hb+utAF9ulm+LE7oa9B457l1dYY3jcG+bNRTawAmSpAkwlWsNLJNWfVkU
   Q==;
X-CSE-ConnectionGUID: 9QqqTNubSCyt71n4eg2Syg==
X-CSE-MsgGUID: Nk3RwfHzSk+tQlyMRgxQnw==
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="32523225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jul 2024 05:39:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jul 2024 05:39:14 -0700
Received: from CHE-LT-I17164LX.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jul 2024 05:39:05 -0700
From: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <saeedm@nvidia.com>,
	<anthony.l.nguyen@intel.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <andrew@lunn.ch>, <corbet@lwn.net>,
	<linux-doc@vger.kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <horatiu.vultur@microchip.com>,
	<ruanjinjie@huawei.com>, <steen.hegelund@microchip.com>,
	<vladimir.oltean@nxp.com>
CC: <UNGLinuxDriver@microchip.com>, <Thorsten.Kummermehr@microchip.com>,
	<Pier.Beruto@onsemi.com>, <Selvamani.Rajagopal@onsemi.com>,
	<Nicolas.Ferre@microchip.com>, <benjamin.bigler@bernformulastudent.ch>,
	<linux@bigler.io>, Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>
Subject: [PATCH net-next v5 04/14] net: ethernet: oa_tc6: implement software reset
Date: Fri, 26 Jul 2024 18:08:57 +0530
Message-ID: <20240726123907.566348-5-Parthiban.Veerasooran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726123907.566348-1-Parthiban.Veerasooran@microchip.com>
References: <20240726123907.566348-1-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Reset complete bit is set when the MAC-PHY reset completes and ready for
configuration. Additionally reset complete bit in the STS0 register has
to be written by one upon reset complete to clear the interrupt.

Signed-off-by: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
---
 drivers/net/ethernet/oa_tc6.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index 187f2fe0c790..15db24d87a00 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -6,8 +6,18 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/iopoll.h>
 #include <linux/oa_tc6.h>
 
+/* OPEN Alliance TC6 registers */
+/* Reset Control and Status Register */
+#define OA_TC6_REG_RESET			0x0003
+#define RESET_SWRESET				BIT(0)	/* Software Reset */
+
+/* Status Register #0 */
+#define OA_TC6_REG_STATUS0			0x0008
+#define STATUS0_RESETC				BIT(6)	/* Reset Complete */
+
 /* Control command header */
 #define OA_TC6_CTRL_HEADER_DATA_NOT_CTRL	BIT(31)
 #define OA_TC6_CTRL_HEADER_WRITE_NOT_READ	BIT(29)
@@ -24,6 +34,8 @@
 						(OA_TC6_CTRL_MAX_REGISTERS *\
 						OA_TC6_CTRL_REG_VALUE_SIZE) +\
 						OA_TC6_CTRL_IGNORED_SIZE)
+#define STATUS0_RESETC_POLL_DELAY		1000
+#define STATUS0_RESETC_POLL_TIMEOUT		1000000
 
 /* Internal structure for MAC-PHY drivers */
 struct oa_tc6 {
@@ -279,6 +291,42 @@ int oa_tc6_write_register(struct oa_tc6 *tc6, u32 address, u32 value)
 }
 EXPORT_SYMBOL_GPL(oa_tc6_write_register);
 
+static int oa_tc6_read_status0(struct oa_tc6 *tc6)
+{
+	u32 regval;
+	int ret;
+
+	ret = oa_tc6_read_register(tc6, OA_TC6_REG_STATUS0, &regval);
+	if (ret) {
+		dev_err(&tc6->spi->dev, "STATUS0 register read failed: %d\n",
+			ret);
+		return 0;
+	}
+
+	return regval;
+}
+
+static int oa_tc6_sw_reset_macphy(struct oa_tc6 *tc6)
+{
+	u32 regval = RESET_SWRESET;
+	int ret;
+
+	ret = oa_tc6_write_register(tc6, OA_TC6_REG_RESET, regval);
+	if (ret)
+		return ret;
+
+	/* Poll for soft reset complete for every 1ms until 1s timeout */
+	ret = readx_poll_timeout(oa_tc6_read_status0, tc6, regval,
+				 regval & STATUS0_RESETC,
+				 STATUS0_RESETC_POLL_DELAY,
+				 STATUS0_RESETC_POLL_TIMEOUT);
+	if (ret)
+		return -ENODEV;
+
+	/* Clear the reset complete status */
+	return oa_tc6_write_register(tc6, OA_TC6_REG_STATUS0, regval);
+}
+
 /**
  * oa_tc6_init - allocates and initializes oa_tc6 structure.
  * @spi: device with which data will be exchanged.
@@ -289,6 +337,7 @@ EXPORT_SYMBOL_GPL(oa_tc6_write_register);
 struct oa_tc6 *oa_tc6_init(struct spi_device *spi)
 {
 	struct oa_tc6 *tc6;
+	int ret;
 
 	tc6 = devm_kzalloc(&spi->dev, sizeof(*tc6), GFP_KERNEL);
 	if (!tc6)
@@ -311,6 +360,13 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi)
 	if (!tc6->spi_ctrl_rx_buf)
 		return NULL;
 
+	ret = oa_tc6_sw_reset_macphy(tc6);
+	if (ret) {
+		dev_err(&tc6->spi->dev,
+			"MAC-PHY software reset failed: %d\n", ret);
+		return NULL;
+	}
+
 	return tc6;
 }
 EXPORT_SYMBOL_GPL(oa_tc6_init);
-- 
2.34.1


