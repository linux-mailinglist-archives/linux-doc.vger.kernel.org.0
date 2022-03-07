Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 020BA4CF58D
	for <lists+linux-doc@lfdr.de>; Mon,  7 Mar 2022 10:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236981AbiCGJaE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Mar 2022 04:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238395AbiCGJ3J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 04:29:09 -0500
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFA066F81;
        Mon,  7 Mar 2022 01:27:17 -0800 (PST)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2278qQAm024110;
        Mon, 7 Mar 2022 01:26:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0220; bh=d1EP32SI2OiLwwJaiUyoux/fOrr7XKSsqDXZ++sMI9Q=;
 b=DndFII+OrgQcFnUxFm0ubHuyw2TNdaCbhNdBGWz7tNXkFxyWdWI0vCa+vBwGVfBGSxWz
 lLg0qOsN+msWrcwz1j9iDqdXEXeed5ipTQaFLeCluEXKIv7SL5CtTDwP6/nNEHI42wjg
 aznknbg/8JntGxTojfXZTs1yQJDaDYdZvNvCa1zbhT37rTXCohtd2ZAngMBhc/ROrF7W
 5Uq56G3yVRf9mPnMpCbI6Kq7iHxnucfR3YLIKfnhaGn0EBnEycaYMD3dpzYQdTEXZCBG
 eS6cO6+QxRiPa8hzBnjPtNwyi7mu8o+6KN4WDJ9C4ppWif0pGjniVxnJeWmItEUHZqbf eQ== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3em88re1h5-5
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 07 Mar 2022 01:26:53 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Mar
 2022 01:26:51 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 7 Mar 2022 01:26:50 -0800
Received: from sburla-PowerEdge-T630.caveonetworks.com (unknown [10.106.27.217])
        by maili.marvell.com (Postfix) with ESMTP id AFD3F3F7050;
        Mon,  7 Mar 2022 01:26:50 -0800 (PST)
From:   Veerasenareddy Burru <vburru@marvell.com>
To:     <vburru@marvell.com>, <davem@davemloft.net>, <kuba@kernel.org>,
        <corbet@lwn.net>, <netdev@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Abhijit Ayarekar <aayarekar@marvell.com>,
        Satananda Burla <sburla@marvell.com>
Subject: [PATCH v3 5/7] octeon_ep: add support for ndo ops
Date:   Mon, 7 Mar 2022 01:26:44 -0800
Message-ID: <20220307092646.17156-6-vburru@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220307092646.17156-1-vburru@marvell.com>
References: <20220307092646.17156-1-vburru@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4-zlxFxfbH6-tHB95jhTeY78u8BdsXfR
X-Proofpoint-GUID: 4-zlxFxfbH6-tHB95jhTeY78u8BdsXfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for ndo ops to set MAC address, change MTU, get stats.
Add control path support to set MAC address, change MTU, get stats,
set speed, get and set link mode.

Signed-off-by: Veerasenareddy Burru <vburru@marvell.com>
Signed-off-by: Abhijit Ayarekar <aayarekar@marvell.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
V2 -> V3: no change.

V1 -> V2:
  - Address review comments:
      - declare variables in reversed Christmas tree, in all functions.
      - Replace {0} with {} to zero initialize a structure.
      - use success oriented approach when returning on error; Replace
            err = foo(..);
            if (!err) {
              /* Scucess */
              ....
            }
            return err;

                  with

            err = foo(..);
            if (err)
              return err;
            /* Success */
            ....
  - fix build errors observed with clang and "make W=1 C=1".

 .../marvell/octeon_ep/octep_ctrl_net.c        | 63 +++++++++++++++
 .../ethernet/marvell/octeon_ep/octep_main.c   | 78 +++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/drivers/net/ethernet/marvell/octeon_ep/octep_ctrl_net.c b/drivers/net/ethernet/marvell/octeon_ep/octep_ctrl_net.c
index c3aca7b2775b..c5df3cf4f8f7 100644
--- a/drivers/net/ethernet/marvell/octeon_ep/octep_ctrl_net.c
+++ b/drivers/net/ethernet/marvell/octeon_ep/octep_ctrl_net.c
@@ -87,6 +87,69 @@ int octep_get_mac_addr(struct octep_device *oct, u8 *addr)
 	return err;
 }
 
+int octep_set_mac_addr(struct octep_device *oct, u8 *addr)
+{
+	struct octep_ctrl_net_h2f_req req = {};
+	struct octep_ctrl_mbox_msg msg = {};
+
+	req.hdr.cmd = OCTEP_CTRL_NET_H2F_CMD_MAC;
+	req.mac.cmd = OCTEP_CTRL_NET_CMD_SET;
+	memcpy(&req.mac.addr, addr, ETH_ALEN);
+
+	msg.hdr.flags = OCTEP_CTRL_MBOX_MSG_HDR_FLAG_REQ;
+	msg.hdr.sizew = OCTEP_CTRL_NET_H2F_MAC_REQ_SZW;
+	msg.msg = &req;
+
+	return octep_ctrl_mbox_send(&oct->ctrl_mbox, &msg);
+}
+
+int octep_set_mtu(struct octep_device *oct, int mtu)
+{
+	struct octep_ctrl_net_h2f_req req = {};
+	struct octep_ctrl_mbox_msg msg = {};
+
+	req.hdr.cmd = OCTEP_CTRL_NET_H2F_CMD_MTU;
+	req.mtu.cmd = OCTEP_CTRL_NET_CMD_SET;
+	req.mtu.val = mtu;
+
+	msg.hdr.flags = OCTEP_CTRL_MBOX_MSG_HDR_FLAG_REQ;
+	msg.hdr.sizew = OCTEP_CTRL_NET_H2F_MTU_REQ_SZW;
+	msg.msg = &req;
+
+	return octep_ctrl_mbox_send(&oct->ctrl_mbox, &msg);
+}
+
+int octep_get_if_stats(struct octep_device *oct)
+{
+	struct octep_iface_rx_stats *iface_rx_stats;
+	struct octep_iface_tx_stats *iface_tx_stats;
+	struct octep_ctrl_net_h2f_req req = {};
+	struct octep_ctrl_mbox_msg msg = {};
+	int err;
+
+	req.hdr.cmd = OCTEP_CTRL_NET_H2F_CMD_GET_IF_STATS;
+	req.mac.cmd = OCTEP_CTRL_NET_CMD_GET;
+	req.get_stats.offset = oct->ctrl_mbox_ifstats_offset;
+
+	msg.hdr.flags = OCTEP_CTRL_MBOX_MSG_HDR_FLAG_REQ;
+	msg.hdr.sizew = OCTEP_CTRL_NET_H2F_GET_STATS_REQ_SZW;
+	msg.msg = &req;
+	err = octep_ctrl_mbox_send(&oct->ctrl_mbox, &msg);
+	if (err)
+		return err;
+
+	iface_rx_stats = (struct octep_iface_rx_stats *)(oct->ctrl_mbox.barmem +
+							 oct->ctrl_mbox_ifstats_offset);
+	iface_tx_stats = (struct octep_iface_tx_stats *)(oct->ctrl_mbox.barmem +
+							 oct->ctrl_mbox_ifstats_offset +
+							 sizeof(struct octep_iface_rx_stats)
+							);
+	memcpy(&oct->iface_rx_stats, iface_rx_stats, sizeof(struct octep_iface_rx_stats));
+	memcpy(&oct->iface_tx_stats, iface_tx_stats, sizeof(struct octep_iface_tx_stats));
+
+	return err;
+}
+
 int octep_get_link_info(struct octep_device *oct)
 {
 	struct octep_ctrl_net_h2f_req req = {};
diff --git a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
index fc142a5f500b..68123cc45067 100644
--- a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
+++ b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
@@ -152,6 +152,43 @@ static netdev_tx_t octep_start_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 }
 
+/**
+ * octep_get_stats64() - Get Octeon network device statistics.
+ *
+ * @netdev: kernel network device.
+ * @stats: pointer to stats structure to be filled in.
+ */
+static void octep_get_stats64(struct net_device *netdev,
+			      struct rtnl_link_stats64 *stats)
+{
+	u64 tx_packets, tx_bytes, rx_packets, rx_bytes;
+	struct octep_device *oct = netdev_priv(netdev);
+	int q;
+
+	octep_get_if_stats(oct);
+	tx_packets = 0;
+	tx_bytes = 0;
+	rx_packets = 0;
+	rx_bytes = 0;
+	for (q = 0; q < oct->num_oqs; q++) {
+		struct octep_iq *iq = oct->iq[q];
+		struct octep_oq *oq = oct->oq[q];
+
+		tx_packets += iq->stats.instr_completed;
+		tx_bytes += iq->stats.bytes_sent;
+		rx_packets += oq->stats.packets;
+		rx_bytes += oq->stats.bytes;
+	}
+	stats->tx_packets = tx_packets;
+	stats->tx_bytes = tx_bytes;
+	stats->rx_packets = rx_packets;
+	stats->rx_bytes = rx_bytes;
+	stats->multicast = oct->iface_rx_stats.mcast_pkts;
+	stats->rx_errors = oct->iface_rx_stats.err_pkts;
+	stats->collisions = oct->iface_tx_stats.xscol;
+	stats->tx_fifo_errors = oct->iface_tx_stats.undflw;
+}
+
 /**
  * octep_tx_timeout_task - work queue task to Handle Tx queue timeout.
  *
@@ -190,11 +227,52 @@ static void octep_tx_timeout(struct net_device *netdev, unsigned int txqueue)
 	queue_work(octep_wq, &oct->tx_timeout_task);
 }
 
+static int octep_set_mac(struct net_device *netdev, void *p)
+{
+	struct octep_device *oct = netdev_priv(netdev);
+	struct sockaddr *addr = (struct sockaddr *)p;
+	int err;
+
+	if (!is_valid_ether_addr(addr->sa_data))
+		return -EADDRNOTAVAIL;
+
+	err = octep_set_mac_addr(oct, addr->sa_data);
+	if (err)
+		return err;
+
+	memcpy(oct->mac_addr, addr->sa_data, ETH_ALEN);
+	eth_hw_addr_set(netdev, addr->sa_data);
+
+	return 0;
+}
+
+static int octep_change_mtu(struct net_device *netdev, int new_mtu)
+{
+	struct octep_device *oct = netdev_priv(netdev);
+	struct octep_iface_link_info *link_info;
+	int err = 0;
+
+	link_info = &oct->link_info;
+	if (link_info->mtu == new_mtu)
+		return 0;
+
+	err = octep_set_mtu(oct, new_mtu);
+	if (!err) {
+		oct->link_info.mtu = new_mtu;
+		netdev->mtu = new_mtu;
+	}
+
+	return err;
+}
+
 static const struct net_device_ops octep_netdev_ops = {
 	.ndo_open                = octep_open,
 	.ndo_stop                = octep_stop,
 	.ndo_start_xmit          = octep_start_xmit,
+	.ndo_get_stats64         = octep_get_stats64,
 	.ndo_tx_timeout          = octep_tx_timeout,
+	.ndo_set_mac_address     = octep_set_mac,
+	.ndo_change_mtu          = octep_change_mtu,
 };
 
 /**
-- 
2.17.1

