Return-Path: <linux-doc+bounces-21620-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ADF940665
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 06:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31A51C22449
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 04:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0363A191491;
	Tue, 30 Jul 2024 04:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bSUcwG74"
X-Original-To: linux-doc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41477190666;
	Tue, 30 Jul 2024 04:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722312641; cv=none; b=EbuyXSPjdpzf6bTQy2a7qPosZh47Q+2yNbnI7qL39gSa1lPiBBQj9I+tL+pPJco11ivxpNZRrXRJaRwU/CQ1wdLCkfK/jdp2YCTKC+uw2oWsjqR1ScoUIDiC5/DihXAVpyX4yTR0JR8UWaVRSU7QbwnJ3IXGd47i0vUTtjlgRiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722312641; c=relaxed/simple;
	bh=BxdorhblgPWbU6BHCTW3OKJNmsiqeQW8jQzd2lkD8Wc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRAAiVnpeiJjPqxLj5fz59rODppk2YGNrXTxsIxtVyJngby0gOHXZ4OAULQMgCjLs2UzzZQgWC4DgfeyVh2hleFQB9D3SNX9aGqZPFCn+L99alGMRlr9GzqWdB3UfCYlDI9TYG9kwr3IcIpEHA8PoWG6I3wq4FbfqGx4Ds0lj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bSUcwG74; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1722312640; x=1753848640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BxdorhblgPWbU6BHCTW3OKJNmsiqeQW8jQzd2lkD8Wc=;
  b=bSUcwG74l915f7mooggwuhTU9bhAKeGhI2fDfUlPPNX4KQflpZcN+EQR
   BoC4yF4LM4YsiNgRVRk+tSdlNfaJpssBCrp3Icrk8LQAJMKdOxtKqMizf
   aSiGNaZ7W51dR5xGN7lkS/AJjs7/Hbo1xSAfAFblbXWsaoaQ0uh6M1M+z
   b1KXt0aOVuTeYzK75Av1nYHaUN5+LdIJFY+B74fnX0Uasbv9NhSjCKVCM
   dcSk7vZYUf0/xYXpwfx47vvnkb1viyoLzToKIcagKSJVRCnTgwkIvtLmw
   hi+LoosoBfqIYerqDfIUeefswP7d6JQWGz7cTbUZ+ZBDIgaAqac09IGVu
   A==;
X-CSE-ConnectionGUID: 8D3Rtr+sQr6UvnFG/CGXxQ==
X-CSE-MsgGUID: GGTYWumyT6q4yXWG8SzoHw==
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="29812727"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2024 21:10:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jul 2024 21:10:34 -0700
Received: from CHE-LT-I17164LX.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jul 2024 21:10:23 -0700
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
CC: <parthiban.veerasooran@microchip.com>, <masahiroy@kernel.org>,
	<alexanderduyck@fb.com>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<rdunlap@infradead.org>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<UNGLinuxDriver@microchip.com>, <Thorsten.Kummermehr@microchip.com>,
	<Pier.Beruto@onsemi.com>, <Selvamani.Rajagopal@onsemi.com>,
	<Nicolas.Ferre@microchip.com>, <benjamin.bigler@bernformulastudent.ch>,
	<linux@bigler.io>, Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>
Subject: [PATCH net-next v5 11/14] net: ethernet: oa_tc6: implement mac-phy interrupt
Date: Tue, 30 Jul 2024 09:39:03 +0530
Message-ID: <20240730040906.53779-12-Parthiban.Veerasooran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730040906.53779-1-Parthiban.Veerasooran@microchip.com>
References: <20240730040906.53779-1-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The MAC-PHY interrupt is asserted when the following conditions are met.

Receive chunks available - This interrupt is asserted when the previous
data footer had no receive data chunks available and once the receive
data chunks become available for reading. On reception of the first data
header this interrupt will be deasserted.

Transmit chunk credits available - This interrupt is asserted when the
previous data footer indicated no transmit credits available and once the
transmit credits become available for transmitting transmit data chunks.
On reception of the first data header this interrupt will be deasserted.

Extended status event - This interrupt is asserted when the previous data
footer indicated no extended status and once the extended event become
available. In this case the host should read status #0 register to know
the corresponding error/event. On reception of the first data header this
interrupt will be deasserted.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
---
 drivers/net/ethernet/oa_tc6.c | 53 +++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index fa1f9e74ceb8..b55a3347f58f 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -127,6 +127,7 @@ struct oa_tc6 {
 	u16 tx_credits;
 	u8 rx_chunks_available;
 	bool rx_buf_overflow;
+	bool int_flag;
 };
 
 enum oa_tc6_header_type {
@@ -1064,6 +1065,14 @@ static int oa_tc6_try_spi_transfer(struct oa_tc6 *tc6)
 
 		spi_len = oa_tc6_prepare_spi_tx_buf_for_rx_chunks(tc6, spi_len);
 
+		if (tc6->int_flag) {
+			tc6->int_flag = false;
+			if (spi_len == 0) {
+				oa_tc6_add_empty_chunks_to_spi_buf(tc6, 1);
+				spi_len = OA_TC6_CHUNK_SIZE;
+			}
+		}
+
 		if (spi_len == 0)
 			break;
 
@@ -1099,8 +1108,10 @@ static int oa_tc6_spi_thread_handler(void *data)
 	int ret;
 
 	while (likely(!kthread_should_stop())) {
-		/* This kthread will be waken up if there is a tx skb */
-		wait_event_interruptible(tc6->spi_wq,
+		/* This kthread will be waken up if there is a tx skb or mac-phy
+		 * interrupt to perform spi transfer with tx chunks.
+		 */
+		wait_event_interruptible(tc6->spi_wq, tc6->int_flag ||
 					 !skb_queue_empty(&tc6->tx_skb_q) ||
 					 kthread_should_stop());
 
@@ -1135,6 +1146,24 @@ static int oa_tc6_update_buffer_status_from_register(struct oa_tc6 *tc6)
 	return 0;
 }
 
+static irqreturn_t oa_tc6_macphy_isr(int irq, void *data)
+{
+	struct oa_tc6 *tc6 = data;
+
+	/* MAC-PHY interrupt can occur for the following reasons.
+	 * - availability of tx credits if it was 0 before and not reported in
+	 *   the previous rx footer.
+	 * - availability of rx chunks if it was 0 before and not reported in
+	 *   the previous rx footer.
+	 * - extended status event not reported in the previous rx footer.
+	 */
+	tc6->int_flag = true;
+	/* Wake spi kthread to perform spi transfer */
+	wake_up_interruptible(&tc6->spi_wq);
+
+	return IRQ_HANDLED;
+}
+
 /**
  * oa_tc6_start_xmit - function for sending the tx skb which consists ethernet
  * frame.
@@ -1263,8 +1292,28 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *netdev)
 
 	sched_set_fifo(tc6->spi_thread);
 
+	ret = devm_request_irq(&tc6->spi->dev, tc6->spi->irq, oa_tc6_macphy_isr,
+			       IRQF_TRIGGER_FALLING, dev_name(&tc6->spi->dev),
+			       tc6);
+	if (ret) {
+		dev_err(&tc6->spi->dev, "Failed to request macphy isr %d\n",
+			ret);
+		goto kthread_stop;
+	}
+
+	/* oa_tc6_sw_reset_macphy() function resets and clears the MAC-PHY reset
+	 * complete status. IRQ is also asserted on reset completion and it is
+	 * remain asserted until MAC-PHY receives a data chunk. So performing an
+	 * empty data chunk transmission will deassert the IRQ. Refer section
+	 * 7.7 and 9.2.8.8 in the OPEN Alliance specification for more details.
+	 */
+	tc6->int_flag = true;
+	wake_up_interruptible(&tc6->spi_wq);
+
 	return tc6;
 
+kthread_stop:
+	kthread_stop(tc6->spi_thread);
 phy_exit:
 	oa_tc6_phy_exit(tc6);
 	return NULL;
-- 
2.34.1


