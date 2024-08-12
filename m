Return-Path: <linux-doc+bounces-22645-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EBD94EAFD
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2024 12:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96091C2158A
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2024 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F569175D22;
	Mon, 12 Aug 2024 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="fdtfUtHm"
X-Original-To: linux-doc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566216FF37;
	Mon, 12 Aug 2024 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723458535; cv=none; b=SKTG5+jGtjRIQcUYBSk5itJroiecZ3khXUWLozukdfS8iDv8fbbyBnhOD+YdEWhU4RuNKeW+zzXT6jxDKsoTeACZ5eE6DXlwuuAqn7av9uHVo8KdEjUn30wrcToPx0K3rDZdtgkkBw4AVB64A5po/UDjRvVHtDHwGv06S9ys0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723458535; c=relaxed/simple;
	bh=6oS2/umIL+UEXzB6Gh8V+SPOmZU2bgyhodHYfOuiolc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jVtI1NBGFsdPGPP192l3uin60RZBrikyAlVlViWryQTmgSO1hv78asvEKCDN8WW9nBIliSedM77XwVR2wrGo3fv5v78A0fR2OhztftTch2F1+Fos+s75oZd+HD7UO8sDbHAazAfZjsumgdm5nce1apexywHd9lMaBKGLl0vrS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=fdtfUtHm; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1723458533; x=1754994533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6oS2/umIL+UEXzB6Gh8V+SPOmZU2bgyhodHYfOuiolc=;
  b=fdtfUtHmqp99Wb1Qq/2nNPpij2kQxxwQpG006ghoGuHRhCglA+rDPVHf
   ETSqBdY+cJ8l1z2YHtgj9R2PHeMrxJzNiGlHW2eoYPUi61++71TPvdfJD
   LXw9pv3/JnPRoVGikQoRIYP1AgbASjZDY7OpC7uZPXumhdHdCvwFM8kZn
   addEn0qAk7lwINkQn8TGyCaow7D0cPnR/rDMq8eze5A3jq2NjDH6TsD9L
   dfDyyLz0oVx7Bp6nBdo5KdSkrH+mGWWa0mrMu52VOZSjSMVetBD6aCapL
   BVKpvhDnmKEGf2vW6nyAR/aLT0pqCMizhhAQ3Vgs/DxZN1zb3CNmVGfrE
   Q==;
X-CSE-ConnectionGUID: V8iiM8k7Q5SAAbK/NPul4Q==
X-CSE-MsgGUID: 2GnaxCd+SIKcxTOif7kdrQ==
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="197798083"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Aug 2024 03:28:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Aug 2024 03:28:41 -0700
Received: from CHE-LT-I17164LX.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 12 Aug 2024 03:28:31 -0700
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
	<linux@bigler.io>, <markku.vorne@kempower.com>, Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>
Subject: [PATCH net-next v6 10/14] net: ethernet: oa_tc6: implement receive path to receive rx ethernet frames
Date: Mon, 12 Aug 2024 15:56:07 +0530
Message-ID: <20240812102611.489550-11-Parthiban.Veerasooran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812102611.489550-1-Parthiban.Veerasooran@microchip.com>
References: <20240812102611.489550-1-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

SPI rx data buffer can contain one or more receive data chunks. A receive
data chunk consists a 64 bytes receive data chunk payload followed a
4 bytes data footer at the end. The data footer contains the information
needed to determine the validity and location of the receive frame data
within the receive data chunk payload and the host can use these
information to generate ethernet frame. Initially the receive chunks
available will be updated from the buffer status register and then it
will be updated from the footer received on each spi data transfer. Tx
data valid or empty chunks equal to the number receive chunks available
will be transmitted in the MOSI to receive all the rx chunks.
Additionally the receive data footer contains the below information as
well. The received footer will be examined for the receive errors if any.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
---
 drivers/net/ethernet/oa_tc6.c | 242 ++++++++++++++++++++++++++++++++--
 1 file changed, 234 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
index 2a7180045394..fa1f9e74ceb8 100644
--- a/drivers/net/ethernet/oa_tc6.c
+++ b/drivers/net/ethernet/oa_tc6.c
@@ -29,11 +29,13 @@
 #define STATUS0_RESETC				BIT(6)	/* Reset Complete */
 #define STATUS0_HEADER_ERROR			BIT(5)
 #define STATUS0_LOSS_OF_FRAME_ERROR		BIT(4)
+#define STATUS0_RX_BUFFER_OVERFLOW_ERROR	BIT(3)
 #define STATUS0_TX_PROTOCOL_ERROR		BIT(0)
 
 /* Buffer Status Register */
 #define OA_TC6_REG_BUFFER_STATUS		0x000B
 #define BUFFER_STATUS_TX_CREDITS_AVAILABLE	GENMASK(15, 8)
+#define BUFFER_STATUS_RX_CHUNKS_AVAILABLE	GENMASK(7, 0)
 
 /* Interrupt Mask Register #0 */
 #define OA_TC6_REG_INT_MASK0			0x000C
@@ -67,6 +69,12 @@
 #define OA_TC6_DATA_FOOTER_EXTENDED_STS		BIT(31)
 #define OA_TC6_DATA_FOOTER_RXD_HEADER_BAD	BIT(30)
 #define OA_TC6_DATA_FOOTER_CONFIG_SYNC		BIT(29)
+#define OA_TC6_DATA_FOOTER_RX_CHUNKS		GENMASK(28, 24)
+#define OA_TC6_DATA_FOOTER_DATA_VALID		BIT(21)
+#define OA_TC6_DATA_FOOTER_START_VALID		BIT(20)
+#define OA_TC6_DATA_FOOTER_START_WORD_OFFSET	GENMASK(19, 16)
+#define OA_TC6_DATA_FOOTER_END_VALID		BIT(14)
+#define OA_TC6_DATA_FOOTER_END_BYTE_OFFSET	GENMASK(13, 8)
 #define OA_TC6_DATA_FOOTER_TX_CREDITS		GENMASK(5, 1)
 
 /* PHY – Clause 45 registers memory map selector (MMS) as per table 6 in the
@@ -111,11 +119,14 @@ struct oa_tc6 {
 	void *spi_data_rx_buf;
 	struct sk_buff_head tx_skb_q;
 	struct sk_buff *tx_skb;
+	struct sk_buff *rx_skb;
 	struct task_struct *spi_thread;
 	wait_queue_head_t spi_wq;
 	u16 tx_skb_offset;
 	u16 spi_data_tx_buf_offset;
 	u16 tx_credits;
+	u8 rx_chunks_available;
+	bool rx_buf_overflow;
 };
 
 enum oa_tc6_header_type {
@@ -638,6 +649,15 @@ static int oa_tc6_enable_data_transfer(struct oa_tc6 *tc6)
 	return oa_tc6_write_register(tc6, OA_TC6_REG_CONFIG0, value);
 }
 
+static void oa_tc6_cleanup_ongoing_rx_skb(struct oa_tc6 *tc6)
+{
+	if (tc6->rx_skb) {
+		tc6->netdev->stats.rx_dropped++;
+		kfree_skb(tc6->rx_skb);
+		tc6->rx_skb = NULL;
+	}
+}
+
 static void oa_tc6_cleanup_ongoing_tx_skb(struct oa_tc6 *tc6)
 {
 	if (tc6->tx_skb) {
@@ -667,6 +687,13 @@ static int oa_tc6_process_extended_status(struct oa_tc6 *tc6)
 		return ret;
 	}
 
+	if (FIELD_GET(STATUS0_RX_BUFFER_OVERFLOW_ERROR, value)) {
+		tc6->rx_buf_overflow = true;
+		oa_tc6_cleanup_ongoing_rx_skb(tc6);
+		net_err_ratelimited("%s: Receive buffer overflow error\n",
+				    tc6->netdev->name);
+		return -EAGAIN;
+	}
 	if (FIELD_GET(STATUS0_TX_PROTOCOL_ERROR, value)) {
 		netdev_err(tc6->netdev, "Transmit protocol error\n");
 		return -ENODEV;
@@ -691,8 +718,11 @@ static int oa_tc6_process_rx_chunk_footer(struct oa_tc6 *tc6, u32 footer)
 	/* Process rx chunk footer for the following,
 	 * 1. tx credits
 	 * 2. errors if any from MAC-PHY
+	 * 3. receive chunks available
 	 */
 	tc6->tx_credits = FIELD_GET(OA_TC6_DATA_FOOTER_TX_CREDITS, footer);
+	tc6->rx_chunks_available = FIELD_GET(OA_TC6_DATA_FOOTER_RX_CHUNKS,
+					     footer);
 
 	if (FIELD_GET(OA_TC6_DATA_FOOTER_EXTENDED_STS, footer)) {
 		int ret = oa_tc6_process_extended_status(tc6);
@@ -718,6 +748,142 @@ static int oa_tc6_process_rx_chunk_footer(struct oa_tc6 *tc6, u32 footer)
 	return 0;
 }
 
+static void oa_tc6_submit_rx_skb(struct oa_tc6 *tc6)
+{
+	tc6->rx_skb->protocol = eth_type_trans(tc6->rx_skb, tc6->netdev);
+	tc6->netdev->stats.rx_packets++;
+	tc6->netdev->stats.rx_bytes += tc6->rx_skb->len;
+
+	if (netif_rx(tc6->rx_skb) == NET_RX_DROP)
+		tc6->netdev->stats.rx_dropped++;
+
+	tc6->rx_skb = NULL;
+}
+
+static void oa_tc6_update_rx_skb(struct oa_tc6 *tc6, u8 *payload, u8 length)
+{
+	memcpy(skb_put(tc6->rx_skb, length), payload, length);
+}
+
+static int oa_tc6_allocate_rx_skb(struct oa_tc6 *tc6)
+{
+	tc6->rx_skb = netdev_alloc_skb_ip_align(tc6->netdev, tc6->netdev->mtu +
+						ETH_HLEN + ETH_FCS_LEN);
+	if (!tc6->rx_skb) {
+		tc6->netdev->stats.rx_dropped++;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int oa_tc6_prcs_complete_rx_frame(struct oa_tc6 *tc6, u8 *payload,
+					 u16 size)
+{
+	int ret;
+
+	ret = oa_tc6_allocate_rx_skb(tc6);
+	if (ret)
+		return ret;
+
+	oa_tc6_update_rx_skb(tc6, payload, size);
+
+	oa_tc6_submit_rx_skb(tc6);
+
+	return 0;
+}
+
+static int oa_tc6_prcs_rx_frame_start(struct oa_tc6 *tc6, u8 *payload, u16 size)
+{
+	int ret;
+
+	ret = oa_tc6_allocate_rx_skb(tc6);
+	if (ret)
+		return ret;
+
+	oa_tc6_update_rx_skb(tc6, payload, size);
+
+	return 0;
+}
+
+static void oa_tc6_prcs_rx_frame_end(struct oa_tc6 *tc6, u8 *payload, u16 size)
+{
+	oa_tc6_update_rx_skb(tc6, payload, size);
+
+	oa_tc6_submit_rx_skb(tc6);
+}
+
+static void oa_tc6_prcs_ongoing_rx_frame(struct oa_tc6 *tc6, u8 *payload,
+					 u32 footer)
+{
+	oa_tc6_update_rx_skb(tc6, payload, OA_TC6_CHUNK_PAYLOAD_SIZE);
+}
+
+static int oa_tc6_prcs_rx_chunk_payload(struct oa_tc6 *tc6, u8 *data,
+					u32 footer)
+{
+	u8 start_byte_offset = FIELD_GET(OA_TC6_DATA_FOOTER_START_WORD_OFFSET,
+					 footer) * sizeof(u32);
+	u8 end_byte_offset = FIELD_GET(OA_TC6_DATA_FOOTER_END_BYTE_OFFSET,
+				       footer);
+	bool start_valid = FIELD_GET(OA_TC6_DATA_FOOTER_START_VALID, footer);
+	bool end_valid = FIELD_GET(OA_TC6_DATA_FOOTER_END_VALID, footer);
+	u16 size;
+
+	/* Restart the new rx frame after receiving rx buffer overflow error */
+	if (start_valid && tc6->rx_buf_overflow)
+		tc6->rx_buf_overflow = false;
+
+	if (tc6->rx_buf_overflow)
+		return 0;
+
+	/* Process the chunk with complete rx frame */
+	if (start_valid && end_valid && start_byte_offset < end_byte_offset) {
+		size = end_byte_offset + 1 - start_byte_offset;
+		return oa_tc6_prcs_complete_rx_frame(tc6,
+						     &data[start_byte_offset],
+						     size);
+	}
+
+	/* Process the chunk with only rx frame start */
+	if (start_valid && !end_valid) {
+		size = OA_TC6_CHUNK_PAYLOAD_SIZE - start_byte_offset;
+		return oa_tc6_prcs_rx_frame_start(tc6,
+						  &data[start_byte_offset],
+						  size);
+	}
+
+	/* Process the chunk with only rx frame end */
+	if (end_valid && !start_valid) {
+		size = end_byte_offset + 1;
+		oa_tc6_prcs_rx_frame_end(tc6, data, size);
+		return 0;
+	}
+
+	/* Process the chunk with previous rx frame end and next rx frame
+	 * start.
+	 */
+	if (start_valid && end_valid && start_byte_offset > end_byte_offset) {
+		/* After rx buffer overflow error received, there might be a
+		 * possibility of getting an end valid of a previously
+		 * incomplete rx frame along with the new rx frame start valid.
+		 */
+		if (tc6->rx_skb) {
+			size = end_byte_offset + 1;
+			oa_tc6_prcs_rx_frame_end(tc6, data, size);
+		}
+		size = OA_TC6_CHUNK_PAYLOAD_SIZE - start_byte_offset;
+		return oa_tc6_prcs_rx_frame_start(tc6,
+						  &data[start_byte_offset],
+						  size);
+	}
+
+	/* Process the chunk with ongoing rx frame data */
+	oa_tc6_prcs_ongoing_rx_frame(tc6, data, footer);
+
+	return 0;
+}
+
 static u32 oa_tc6_get_rx_chunk_footer(struct oa_tc6 *tc6, u16 footer_offset)
 {
 	u8 *rx_buf = tc6->spi_data_rx_buf;
@@ -743,6 +909,20 @@ static int oa_tc6_process_spi_data_rx_buf(struct oa_tc6 *tc6, u16 length)
 		ret = oa_tc6_process_rx_chunk_footer(tc6, footer);
 		if (ret)
 			return ret;
+
+		/* If there is a data valid chunks then process it for the
+		 * information needed to determine the validity and the location
+		 * of the receive frame data.
+		 */
+		if (FIELD_GET(OA_TC6_DATA_FOOTER_DATA_VALID, footer)) {
+			u8 *payload = tc6->spi_data_rx_buf + i *
+				      OA_TC6_CHUNK_SIZE;
+
+			ret = oa_tc6_prcs_rx_chunk_payload(tc6, payload,
+							   footer);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
@@ -833,31 +1013,74 @@ static u16 oa_tc6_prepare_spi_tx_buf_for_tx_skbs(struct oa_tc6 *tc6)
 	return used_tx_credits * OA_TC6_CHUNK_SIZE;
 }
 
+static void oa_tc6_add_empty_chunks_to_spi_buf(struct oa_tc6 *tc6,
+					       u16 needed_empty_chunks)
+{
+	__be32 header;
+
+	header = oa_tc6_prepare_data_header(OA_TC6_DATA_INVALID,
+					    OA_TC6_DATA_START_INVALID,
+					    OA_TC6_DATA_END_INVALID, 0);
+
+	while (needed_empty_chunks--) {
+		__be32 *tx_buf = tc6->spi_data_tx_buf +
+				 tc6->spi_data_tx_buf_offset;
+
+		*tx_buf = header;
+		tc6->spi_data_tx_buf_offset += OA_TC6_CHUNK_SIZE;
+	}
+}
+
+static u16 oa_tc6_prepare_spi_tx_buf_for_rx_chunks(struct oa_tc6 *tc6, u16 len)
+{
+	u16 tx_chunks = len / OA_TC6_CHUNK_SIZE;
+	u16 needed_empty_chunks;
+
+	/* If there are more chunks to receive than to transmit, we need to add
+	 * enough empty tx chunks to allow the reception of the excess rx
+	 * chunks.
+	 */
+	if (tx_chunks >= tc6->rx_chunks_available)
+		return len;
+
+	needed_empty_chunks = tc6->rx_chunks_available - tx_chunks;
+
+	oa_tc6_add_empty_chunks_to_spi_buf(tc6, needed_empty_chunks);
+
+	return needed_empty_chunks * OA_TC6_CHUNK_SIZE + len;
+}
+
 static int oa_tc6_try_spi_transfer(struct oa_tc6 *tc6)
 {
 	int ret;
 
 	while (true) {
-		u16 spi_length = 0;
+		u16 spi_len = 0;
 
 		tc6->spi_data_tx_buf_offset = 0;
 
 		if (tc6->tx_skb || !skb_queue_empty(&tc6->tx_skb_q))
-			spi_length = oa_tc6_prepare_spi_tx_buf_for_tx_skbs(tc6);
+			spi_len = oa_tc6_prepare_spi_tx_buf_for_tx_skbs(tc6);
 
-		if (spi_length == 0)
+		spi_len = oa_tc6_prepare_spi_tx_buf_for_rx_chunks(tc6, spi_len);
+
+		if (spi_len == 0)
 			break;
 
-		ret = oa_tc6_spi_transfer(tc6, OA_TC6_DATA_HEADER, spi_length);
+		ret = oa_tc6_spi_transfer(tc6, OA_TC6_DATA_HEADER, spi_len);
 		if (ret) {
 			netdev_err(tc6->netdev, "SPI data transfer failed: %d\n",
 				   ret);
 			return ret;
 		}
 
-		ret = oa_tc6_process_spi_data_rx_buf(tc6, spi_length);
+		ret = oa_tc6_process_spi_data_rx_buf(tc6, spi_len);
 		if (ret) {
+			if (ret == -EAGAIN)
+				continue;
+
 			oa_tc6_cleanup_ongoing_tx_skb(tc6);
+			oa_tc6_cleanup_ongoing_rx_skb(tc6);
 			netdev_err(tc6->netdev, "Device error: %d\n", ret);
 			return ret;
 		}
@@ -897,15 +1120,17 @@ static int oa_tc6_update_buffer_status_from_register(struct oa_tc6 *tc6)
 	u32 value;
 	int ret;
 
-	/* Initially tx credits to be updated from the register as there is no
-	 * data transfer performed yet. Later it will be updated from the rx
-	 * footer.
+	/* Initially tx credits and rx chunks available to be updated from the
+	 * register as there is no data transfer performed yet. Later they will
+	 * be updated from the rx footer.
 	 */
 	ret = oa_tc6_read_register(tc6, OA_TC6_REG_BUFFER_STATUS, &value);
 	if (ret)
 		return ret;
 
 	tc6->tx_credits = FIELD_GET(BUFFER_STATUS_TX_CREDITS_AVAILABLE, value);
+	tc6->rx_chunks_available = FIELD_GET(BUFFER_STATUS_RX_CHUNKS_AVAILABLE,
+					     value);
 
 	return 0;
 }
@@ -1055,6 +1280,7 @@ void oa_tc6_exit(struct oa_tc6 *tc6)
 	oa_tc6_phy_exit(tc6);
 	kthread_stop(tc6->spi_thread);
 	dev_kfree_skb_any(tc6->tx_skb);
+	dev_kfree_skb_any(tc6->rx_skb);
 	skb_queue_purge(&tc6->tx_skb_q);
 }
 EXPORT_SYMBOL_GPL(oa_tc6_exit);
-- 
2.34.1


