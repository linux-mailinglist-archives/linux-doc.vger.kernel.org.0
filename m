Return-Path: <linux-doc+bounces-8665-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337984DE06
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 11:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F5CB1F2152C
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 10:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6606F06B;
	Thu,  8 Feb 2024 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="jd1JJ9mL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F76D1C8;
	Thu,  8 Feb 2024 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387564; cv=none; b=sWvZD+ZtLbcoB6av/KqajRkYG4Vi2PznZlL39TwiI29m6iOL1CcTnjAM+Ilb5f3CJi1hEvPy9c3KxGahZ82xYPAd45gT+jfHX1qctsqRUZEFU0iyiXr/yIuHJSR7RKtXtg8VI/uKnHRGU1NvhOYRX/U43/qzz0cJ7kjgacaw4K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387564; c=relaxed/simple;
	bh=70gVW7F+pQKPSnCnPHX2BvcA0oxKKNQWKLErhoI1QT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odzd7FYAKcrPogJCuph6C+IjDksPcm75vwIm/xN/0hWTw8s+LOi/GNj7Y1IVFADcuw4FHY7WGd/Icnr2sJZJ+alr8wJ3CqM+I8WiUJz4HXCPw6ci6moMIYFTSbf2hYqzXgsd5RfNHqg5oA50xhS4fbNhH9cp3gmUVwO1l7Squww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=jd1JJ9mL; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4184HFA7003172;
	Thu, 8 Feb 2024 02:19:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=P4yO70dD2LFF2QfBI99hxNc1vJCj2hkTRXhIOVlQOB0=; b=jd1
	JJ9mLmMKBn8KN7o1VqV0N/k0kvzVSTxosUx+qIhPdzLX3yvCVbDwsgPNbKuiih6g
	mn8h9xBeyvgO1erSd/P1xesY+OO07p50Y/1fgfabuXtrz5vQ1EtCkmL+zF6XiPUX
	IyGjSjVVb4kw9rxdEwqKwn4TlCP6G7uHQVSLbFx8riR99quQtCRG3xqSI9IekaeE
	dOJj520l/vgC90+6mGut4YZDFngIqUu30dPFB24NECUXooQLlM9nvwu5b2p5PGKM
	N2OwV206reHn90gdGAGUO71NSzT9E3a0eGNHian8AoNwiUm12njrrDgn7Swjuc3k
	DJsVj/Cn8g4cxZampGA==
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3w4qsq0wgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 02:19:14 -0800 (PST)
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 8 Feb
 2024 02:19:12 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 8 Feb 2024 02:19:12 -0800
Received: from ubuntu-PowerEdge-T110-II.sclab.marvell.com (unknown [10.106.27.86])
	by maili.marvell.com (Postfix) with ESMTP id D03303F7054;
	Thu,  8 Feb 2024 02:19:11 -0800 (PST)
From: Shinas Rasheed <srasheed@marvell.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux-doc@vger.kernel.org>, <hgani@marvell.com>, <vimleshk@marvell.com>,
        <sedara@marvell.com>, <srasheed@marvell.com>, <egallen@redhat.com>,
        <mschmidt@redhat.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <horms@kernel.org>, <wizhao@redhat.com>, <kheib@redhat.com>,
        <konguyen@redhat.com>, Veerasenareddy Burru <vburru@marvell.com>,
        "Satananda
 Burla" <sburla@marvell.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>
Subject: [PATCH net-next v7 3/8] octeon_ep_vf: add VF-PF mailbox communication.
Date: Thu, 8 Feb 2024 02:18:35 -0800
Message-ID: <20240208101841.3108103-4-srasheed@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208101841.3108103-1-srasheed@marvell.com>
References: <20240208101841.3108103-1-srasheed@marvell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GMg7z7ZVKZQLBbD7lXuAl3b0kyUN19Bk
X-Proofpoint-GUID: GMg7z7ZVKZQLBbD7lXuAl3b0kyUN19Bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02

Implement VF-PF mailbox to send all control commands from VF to PF
and receive responses and notifications from PF to VF.

Signed-off-by: Shinas Rasheed <srasheed@marvell.com>
---
V7:
  - Moved introducing ndo ops to corresponding later patch

V6: https://lore.kernel.org/all/20240207065207.3092004-4-srasheed@marvell.com/
  - Changed error label of octep_get_fw_info in probe function to have
    action-specific name

V5: https://lore.kernel.org/all/20240129050254.3047778-4-srasheed@marvell.com/
  - No changes

V4: https://lore.kernel.org/all/20240108124213.2966536-4-srasheed@marvell.com/
  - No changes

V3: https://lore.kernel.org/all/20240105203823.2953604-4-srasheed@marvell.com/
  - No changes

V2: https://lore.kernel.org/all/20231223134000.2906144-4-srasheed@marvell.com/
  - No changes

V1: https://lore.kernel.org/all/20231221092844.2885872-4-srasheed@marvell.com/

 .../marvell/octeon_ep_vf/octep_vf_main.c      |  30 ++
 .../marvell/octeon_ep_vf/octep_vf_main.h      |   2 +
 .../marvell/octeon_ep_vf/octep_vf_mbox.c      | 336 +++++++++++++++++-
 .../marvell/octeon_ep_vf/octep_vf_mbox.h      | 143 +++++++-
 4 files changed, 509 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c
index 2ade88698f65..997deb5283bd 100644
--- a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c
@@ -186,6 +186,19 @@ static netdev_tx_t octep_vf_start_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 }
 
+int octep_vf_get_link_info(struct octep_vf_device *oct)
+{
+	int ret, size;
+
+	ret = octep_vf_mbox_bulk_read(oct, OCTEP_PFVF_MBOX_CMD_GET_LINK_INFO,
+				      (u8 *)&oct->link_info, &size);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Get VF link info failed via VF Mbox\n");
+		return ret;
+	}
+	return 0;
+}
+
 /**
  * octep_vf_tx_timeout_task - work queue task to Handle Tx queue timeout.
  *
@@ -412,11 +425,28 @@ static int octep_vf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto delete_mbox;
 	}
 
+	if (octep_vf_mbox_get_fw_info(octep_vf_dev)) {
+		dev_err(&pdev->dev, "unable to get fw info\n");
+		err = -EINVAL;
+		goto delete_mbox;
+	}
+
 	netdev->hw_features = NETIF_F_SG;
+	if (OCTEP_VF_TX_IP_CSUM(octep_vf_dev->fw_info.tx_ol_flags))
+		netdev->hw_features |= (NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM);
+
+	if (OCTEP_VF_RX_IP_CSUM(octep_vf_dev->fw_info.rx_ol_flags))
+		netdev->hw_features |= NETIF_F_RXCSUM;
+
 	netdev->min_mtu = OCTEP_VF_MIN_MTU;
 	netdev->max_mtu = OCTEP_VF_MAX_MTU;
 	netdev->mtu = OCTEP_VF_DEFAULT_MTU;
 
+	if (OCTEP_VF_TX_TSO(octep_vf_dev->fw_info.tx_ol_flags)) {
+		netdev->hw_features |= NETIF_F_TSO;
+		netif_set_tso_max_size(netdev, netdev->max_mtu);
+	}
+
 	netdev->features |= netdev->hw_features;
 	octep_vf_get_mac_addr(octep_vf_dev, octep_vf_dev->mac_addr);
 	eth_hw_addr_set(netdev, octep_vf_dev->mac_addr);
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h
index 4359e0e585ec..5a3b545ad590 100644
--- a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h
@@ -327,5 +327,7 @@ void octep_vf_device_setup_cn93(struct octep_vf_device *oct);
 void octep_vf_device_setup_cnxk(struct octep_vf_device *oct);
 int octep_vf_iq_process_completions(struct octep_vf_iq *iq, u16 budget);
 int octep_vf_oq_process_rx(struct octep_vf_oq *oq, int budget);
+int octep_vf_get_link_info(struct octep_vf_device *oct);
+int octep_vf_get_if_stats(struct octep_vf_device *oct);
 void octep_vf_mbox_work(struct work_struct *work);
 #endif /* _OCTEP_VF_MAIN_H_ */
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c
index 1c1fe293fc50..2eab21e43048 100644
--- a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c
@@ -10,6 +10,15 @@
 #include "octep_vf_config.h"
 #include "octep_vf_main.h"
 
+/* When a new command is implemented, the below table should be updated
+ * with new command and it's version info.
+ */
+static u32 pfvf_cmd_versions[OCTEP_PFVF_MBOX_CMD_MAX] = {
+	[0 ... OCTEP_PFVF_MBOX_CMD_DEV_REMOVE] = OCTEP_PFVF_MBOX_VERSION_V1,
+	[OCTEP_PFVF_MBOX_CMD_GET_FW_INFO ... OCTEP_PFVF_MBOX_NOTIF_LINK_STATUS] =
+		OCTEP_PFVF_MBOX_VERSION_V2
+};
+
 int octep_vf_setup_mbox(struct octep_vf_device *oct)
 {
 	int ring = 0;
@@ -23,6 +32,7 @@ int octep_vf_setup_mbox(struct octep_vf_device *oct)
 	oct->hw_ops.setup_mbox_regs(oct, ring);
 	INIT_WORK(&oct->mbox->wk.work, octep_vf_mbox_work);
 	oct->mbox->wk.ctxptr = oct;
+	oct->mbox_neg_ver = OCTEP_PFVF_MBOX_VERSION_CURRENT;
 	dev_info(&oct->pdev->dev, "setup vf mbox successfully\n");
 	return 0;
 }
@@ -42,55 +52,379 @@ void octep_vf_delete_mbox(struct octep_vf_device *oct)
 
 int octep_vf_mbox_version_check(struct octep_vf_device *oct)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int ret;
+
+	cmd.u64 = 0;
+	cmd.s_version.opcode = OCTEP_PFVF_MBOX_CMD_VERSION;
+	cmd.s_version.version = OCTEP_PFVF_MBOX_VERSION_CURRENT;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret == OCTEP_PFVF_MBOX_CMD_STATUS_NACK) {
+		dev_err(&oct->pdev->dev,
+			"VF Mbox version is incompatible with PF\n");
+		return -EINVAL;
+	}
+	oct->mbox_neg_ver = (u32)rsp.s_version.version;
+	dev_dbg(&oct->pdev->dev,
+		"VF Mbox version:%u Negotiated VF version with PF:%u\n",
+		 (u32)cmd.s_version.version,
+		 (u32)rsp.s_version.version);
 	return 0;
 }
 
 void octep_vf_mbox_work(struct work_struct *work)
 {
+	struct octep_vf_mbox_wk *wk = container_of(work, struct octep_vf_mbox_wk, work);
+	struct octep_vf_iface_link_info *link_info;
+	struct octep_vf_device *oct = NULL;
+	struct octep_vf_mbox *mbox = NULL;
+	union octep_pfvf_mbox_word *notif;
+	u64 pf_vf_data;
+
+	oct = (struct octep_vf_device *)wk->ctxptr;
+	link_info = &oct->link_info;
+	mbox = oct->mbox;
+	pf_vf_data = readq(mbox->mbox_read_reg);
+
+	notif = (union octep_pfvf_mbox_word *)&pf_vf_data;
+
+	switch (notif->s.opcode) {
+	case OCTEP_PFVF_MBOX_NOTIF_LINK_STATUS:
+		if (notif->s_link_status.status) {
+			link_info->oper_up = OCTEP_PFVF_LINK_STATUS_UP;
+			netif_carrier_on(oct->netdev);
+			dev_info(&oct->pdev->dev, "netif_carrier_on\n");
+		} else {
+			link_info->oper_up = OCTEP_PFVF_LINK_STATUS_DOWN;
+			netif_carrier_off(oct->netdev);
+			dev_info(&oct->pdev->dev, "netif_carrier_off\n");
+		}
+		break;
+	default:
+		dev_err(&oct->pdev->dev,
+			"Received unsupported notif %d\n", notif->s.opcode);
+		break;
+	}
+}
+
+static int __octep_vf_mbox_send_cmd(struct octep_vf_device *oct,
+				    union octep_pfvf_mbox_word cmd,
+				    union octep_pfvf_mbox_word *rsp)
+{
+	struct octep_vf_mbox *mbox = oct->mbox;
+	u64 reg_val = 0ull;
+	int count;
+
+	if (!mbox)
+		return OCTEP_PFVF_MBOX_CMD_STATUS_NOT_SETUP;
+
+	cmd.s.type = OCTEP_PFVF_MBOX_TYPE_CMD;
+	writeq(cmd.u64, mbox->mbox_write_reg);
+
+	/* No response for notification messages */
+	if (!rsp)
+		return 0;
+
+	for (count = 0; count < OCTEP_PFVF_MBOX_TIMEOUT_WAIT_COUNT; count++) {
+		usleep_range(1000, 1500);
+		reg_val = readq(mbox->mbox_write_reg);
+		if (reg_val != cmd.u64) {
+			rsp->u64 = reg_val;
+			break;
+		}
+	}
+	if (count == OCTEP_PFVF_MBOX_TIMEOUT_WAIT_COUNT) {
+		dev_err(&oct->pdev->dev, "mbox send command timed out\n");
+		return OCTEP_PFVF_MBOX_CMD_STATUS_TIMEDOUT;
+	}
+	if (rsp->s.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "mbox_send: Received NACK\n");
+		return OCTEP_PFVF_MBOX_CMD_STATUS_NACK;
+	}
+	rsp->u64 = reg_val;
+	return 0;
+}
+
+int octep_vf_mbox_send_cmd(struct octep_vf_device *oct, union octep_pfvf_mbox_word cmd,
+			   union octep_pfvf_mbox_word *rsp)
+{
+	struct octep_vf_mbox *mbox = oct->mbox;
+	int ret;
+
+	if (!mbox)
+		return OCTEP_PFVF_MBOX_CMD_STATUS_NOT_SETUP;
+	mutex_lock(&mbox->lock);
+	if (pfvf_cmd_versions[cmd.s.opcode] > oct->mbox_neg_ver) {
+		dev_dbg(&oct->pdev->dev, "CMD:%d not supported in Version:%d\n",
+			cmd.s.opcode, oct->mbox_neg_ver);
+		mutex_unlock(&mbox->lock);
+		return -EOPNOTSUPP;
+	}
+	ret = __octep_vf_mbox_send_cmd(oct, cmd, rsp);
+	mutex_unlock(&mbox->lock);
+	return ret;
+}
+
+int octep_vf_mbox_bulk_read(struct octep_vf_device *oct, enum octep_pfvf_mbox_opcode opcode,
+			    u8 *data, int *size)
+{
+	struct octep_vf_mbox *mbox = oct->mbox;
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int data_len = 0, tmp_len = 0;
+	int read_cnt, i = 0, ret;
+
+	if (!mbox)
+		return OCTEP_PFVF_MBOX_CMD_STATUS_NOT_SETUP;
+
+	mutex_lock(&mbox->lock);
+	cmd.u64 = 0;
+	cmd.s_data.opcode = opcode;
+	cmd.s_data.frag = 0;
+	/* Send cmd to read data from PF */
+	ret = __octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "send mbox cmd fail for data request\n");
+		mutex_unlock(&mbox->lock);
+		return ret;
+	}
+	/*  PF sends the data length of requested CMD
+	 *  in  ACK
+	 */
+	data_len = *((int32_t *)rsp.s_data.data);
+	tmp_len = data_len;
+	cmd.u64 = 0;
+	rsp.u64 = 0;
+	cmd.s_data.opcode = opcode;
+	cmd.s_data.frag = 1;
+	while (data_len) {
+		ret = __octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+		if (ret) {
+			dev_err(&oct->pdev->dev, "send mbox cmd fail for data request\n");
+			mutex_unlock(&mbox->lock);
+			mbox->mbox_data.data_index = 0;
+			memset(mbox->mbox_data.recv_data, 0, OCTEP_PFVF_MBOX_MAX_DATA_BUF_SIZE);
+			return ret;
+		}
+		if (data_len > OCTEP_PFVF_MBOX_MAX_DATA_SIZE) {
+			data_len -= OCTEP_PFVF_MBOX_MAX_DATA_SIZE;
+			read_cnt = OCTEP_PFVF_MBOX_MAX_DATA_SIZE;
+		} else {
+			read_cnt = data_len;
+			data_len = 0;
+		}
+		for (i = 0; i < read_cnt; i++) {
+			mbox->mbox_data.recv_data[mbox->mbox_data.data_index] =
+				rsp.s_data.data[i];
+			mbox->mbox_data.data_index++;
+		}
+		cmd.u64 = 0;
+		rsp.u64 = 0;
+		cmd.s_data.opcode = opcode;
+		cmd.s_data.frag = 1;
+	}
+	memcpy(data, mbox->mbox_data.recv_data, tmp_len);
+	*size = tmp_len;
+	mbox->mbox_data.data_index = 0;
+	memset(mbox->mbox_data.recv_data, 0, OCTEP_PFVF_MBOX_MAX_DATA_BUF_SIZE);
+	mutex_unlock(&mbox->lock);
+	return 0;
 }
 
 int octep_vf_mbox_set_mtu(struct octep_vf_device *oct, int mtu)
 {
+	int frame_size = mtu + ETH_HLEN + ETH_FCS_LEN;
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int ret = 0;
+
+	if (mtu < ETH_MIN_MTU || frame_size > ETH_MAX_MTU) {
+		dev_err(&oct->pdev->dev,
+			"Failed to set MTU to %d MIN MTU:%d MAX MTU:%d\n",
+			mtu, ETH_MIN_MTU, ETH_MAX_MTU);
+		return -EINVAL;
+	}
+
+	cmd.u64 = 0;
+	cmd.s_set_mtu.opcode = OCTEP_PFVF_MBOX_CMD_SET_MTU;
+	cmd.s_set_mtu.mtu = mtu;
+
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Mbox send failed; err=%d\n", ret);
+		return ret;
+	}
+	if (rsp.s_set_mtu.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "Received Mbox NACK from PF for MTU:%d\n", mtu);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
 int octep_vf_mbox_set_mac_addr(struct octep_vf_device *oct, char *mac_addr)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int i, ret;
+
+	cmd.u64 = 0;
+	cmd.s_set_mac.opcode = OCTEP_PFVF_MBOX_CMD_SET_MAC_ADDR;
+	for (i = 0; i < ETH_ALEN; i++)
+		cmd.s_set_mac.mac_addr[i] = mac_addr[i];
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Mbox send failed; err = %d\n", ret);
+		return ret;
+	}
+	if (rsp.s_set_mac.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "received NACK\n");
+		return -EINVAL;
+	}
 	return 0;
 }
 
 int octep_vf_mbox_get_mac_addr(struct octep_vf_device *oct, char *mac_addr)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int i, ret;
+
+	cmd.u64 = 0;
+	cmd.s_set_mac.opcode = OCTEP_PFVF_MBOX_CMD_GET_MAC_ADDR;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "get_mac: mbox send failed; err = %d\n", ret);
+		return ret;
+	}
+	if (rsp.s_set_mac.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "get_mac: received NACK\n");
+		return -EINVAL;
+	}
+	for (i = 0; i < ETH_ALEN; i++)
+		mac_addr[i] = rsp.s_set_mac.mac_addr[i];
 	return 0;
 }
 
 int octep_vf_mbox_set_rx_state(struct octep_vf_device *oct, bool state)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int ret;
+
+	cmd.u64 = 0;
+	cmd.s_link_state.opcode = OCTEP_PFVF_MBOX_CMD_SET_RX_STATE;
+	cmd.s_link_state.state = state;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Set Rx state via VF Mbox send failed\n");
+		return ret;
+	}
+	if (rsp.s_link_state.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "Set Rx state received NACK\n");
+		return -EINVAL;
+	}
 	return 0;
 }
 
 int octep_vf_mbox_set_link_status(struct octep_vf_device *oct, bool status)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int ret;
+
+	cmd.u64 = 0;
+	cmd.s_link_status.opcode = OCTEP_PFVF_MBOX_CMD_SET_LINK_STATUS;
+	cmd.s_link_status.status = status;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Set link status via VF Mbox send failed\n");
+		return ret;
+	}
+	if (rsp.s_link_status.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "Set link status received NACK\n");
+		return -EINVAL;
+	}
 	return 0;
 }
 
 int octep_vf_mbox_get_link_status(struct octep_vf_device *oct, u8 *oper_up)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int ret;
+
+	cmd.u64 = 0;
+	cmd.s_link_status.opcode = OCTEP_PFVF_MBOX_CMD_GET_LINK_STATUS;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Get link status via VF Mbox send failed\n");
+		return ret;
+	}
+	if (rsp.s_link_status.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "Get link status received NACK\n");
+		return -EINVAL;
+	}
+	*oper_up = rsp.s_link_status.status;
 	return 0;
 }
 
 int octep_vf_mbox_dev_remove(struct octep_vf_device *oct)
 {
-	return 0;
+	union octep_pfvf_mbox_word cmd;
+	int ret;
+
+	cmd.u64 = 0;
+	cmd.s.opcode = OCTEP_PFVF_MBOX_CMD_DEV_REMOVE;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, NULL);
+	return ret;
 }
 
 int octep_vf_mbox_get_fw_info(struct octep_vf_device *oct)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int ret;
+
+	cmd.u64 = 0;
+	cmd.s_fw_info.opcode = OCTEP_PFVF_MBOX_CMD_GET_FW_INFO;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Get link status via VF Mbox send failed\n");
+		return ret;
+	}
+	if (rsp.s_fw_info.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "Get link status received NACK\n");
+		return -EINVAL;
+	}
+	oct->fw_info.pkind = rsp.s_fw_info.pkind;
+	oct->fw_info.fsz = rsp.s_fw_info.fsz;
+	oct->fw_info.rx_ol_flags = rsp.s_fw_info.rx_ol_flags;
+	oct->fw_info.tx_ol_flags = rsp.s_fw_info.tx_ol_flags;
+
 	return 0;
 }
 
 int octep_vf_mbox_set_offloads(struct octep_vf_device *oct, u16 tx_offloads,
 			       u16 rx_offloads)
 {
+	union octep_pfvf_mbox_word cmd;
+	union octep_pfvf_mbox_word rsp;
+	int ret;
+
+	cmd.u64 = 0;
+	cmd.s_offloads.opcode = OCTEP_PFVF_MBOX_CMD_SET_OFFLOADS;
+	cmd.s_offloads.rx_ol_flags = rx_offloads;
+	cmd.s_offloads.tx_ol_flags = tx_offloads;
+	ret = octep_vf_mbox_send_cmd(oct, cmd, &rsp);
+	if (ret) {
+		dev_err(&oct->pdev->dev, "Set offloads via VF Mbox send failed\n");
+		return ret;
+	}
+	if (rsp.s_link_state.type != OCTEP_PFVF_MBOX_TYPE_RSP_ACK) {
+		dev_err(&oct->pdev->dev, "Set offloads received NACK\n");
+		return -EINVAL;
+	}
 	return 0;
 }
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h
index 14f4fb19445b..9b5efad37eab 100644
--- a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h
@@ -7,10 +7,151 @@
 #ifndef _OCTEP_VF_MBOX_H_
 #define _OCTEP_VF_MBOX_H_
 
-#define OCTEP_PFVF_MBOX_MAX_DATA_BUF_SIZE 256
+/* When a new command is implemented, VF Mbox version should be bumped.
+ */
+enum octep_pfvf_mbox_version {
+	OCTEP_PFVF_MBOX_VERSION_V0,
+	OCTEP_PFVF_MBOX_VERSION_V1,
+	OCTEP_PFVF_MBOX_VERSION_V2
+};
+
+#define OCTEP_PFVF_MBOX_VERSION_CURRENT OCTEP_PFVF_MBOX_VERSION_V2
+
+enum octep_pfvf_mbox_opcode {
+	OCTEP_PFVF_MBOX_CMD_VERSION,
+	OCTEP_PFVF_MBOX_CMD_SET_MTU,
+	OCTEP_PFVF_MBOX_CMD_SET_MAC_ADDR,
+	OCTEP_PFVF_MBOX_CMD_GET_MAC_ADDR,
+	OCTEP_PFVF_MBOX_CMD_GET_LINK_INFO,
+	OCTEP_PFVF_MBOX_CMD_GET_STATS,
+	OCTEP_PFVF_MBOX_CMD_SET_RX_STATE,
+	OCTEP_PFVF_MBOX_CMD_SET_LINK_STATUS,
+	OCTEP_PFVF_MBOX_CMD_GET_LINK_STATUS,
+	OCTEP_PFVF_MBOX_CMD_GET_MTU,
+	OCTEP_PFVF_MBOX_CMD_DEV_REMOVE,
+	OCTEP_PFVF_MBOX_CMD_GET_FW_INFO,
+	OCTEP_PFVF_MBOX_CMD_SET_OFFLOADS,
+	OCTEP_PFVF_MBOX_NOTIF_LINK_STATUS,
+	OCTEP_PFVF_MBOX_CMD_MAX,
+};
+
+enum octep_pfvf_mbox_word_type {
+	OCTEP_PFVF_MBOX_TYPE_CMD,
+	OCTEP_PFVF_MBOX_TYPE_RSP_ACK,
+	OCTEP_PFVF_MBOX_TYPE_RSP_NACK,
+};
+
+enum octep_pfvf_mbox_cmd_status {
+	OCTEP_PFVF_MBOX_CMD_STATUS_NOT_SETUP = 1,
+	OCTEP_PFVF_MBOX_CMD_STATUS_TIMEDOUT = 2,
+	OCTEP_PFVF_MBOX_CMD_STATUS_NACK = 3,
+	OCTEP_PFVF_MBOX_CMD_STATUS_BUSY = 4,
+	OCTEP_PFVF_MBOX_CMD_STATUS_ERR = 5
+};
+
+enum octep_pfvf_link_status {
+	OCTEP_PFVF_LINK_STATUS_DOWN,
+	OCTEP_PFVF_LINK_STATUS_UP,
+};
+
+enum octep_pfvf_link_speed {
+	OCTEP_PFVF_LINK_SPEED_NONE,
+	OCTEP_PFVF_LINK_SPEED_1000,
+	OCTEP_PFVF_LINK_SPEED_10000,
+	OCTEP_PFVF_LINK_SPEED_25000,
+	OCTEP_PFVF_LINK_SPEED_40000,
+	OCTEP_PFVF_LINK_SPEED_50000,
+	OCTEP_PFVF_LINK_SPEED_100000,
+	OCTEP_PFVF_LINK_SPEED_LAST,
+};
+
+enum octep_pfvf_link_duplex {
+	OCTEP_PFVF_LINK_HALF_DUPLEX,
+	OCTEP_PFVF_LINK_FULL_DUPLEX,
+};
+
+enum octep_pfvf_link_autoneg {
+	OCTEP_PFVF_LINK_AUTONEG,
+	OCTEP_PFVF_LINK_FIXED,
+};
+
+#define OCTEP_PFVF_MBOX_TIMEOUT_WAIT_COUNT  8000
+#define OCTEP_PFVF_MBOX_TIMEOUT_WAIT_UDELAY 1000
+#define OCTEP_PFVF_MBOX_MAX_RETRIES    2
+#define OCTEP_PFVF_MBOX_VERSION        0
+#define OCTEP_PFVF_MBOX_MAX_DATA_SIZE  6
+#define OCTEP_PFVF_MBOX_MAX_DATA_BUF_SIZE 320
+#define OCTEP_PFVF_MBOX_MORE_FRAG_FLAG 1
+
+union octep_pfvf_mbox_word {
+	u64 u64;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 rsvd:6;
+		u64 data:48;
+	} s;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 frag:1;
+		u64 rsvd:5;
+		u8 data[6];
+	} s_data;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 rsvd:6;
+		u64 version:48;
+	} s_version;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 rsvd:6;
+		u8 mac_addr[6];
+	} s_set_mac;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 rsvd:6;
+		u64 mtu:48;
+	} s_set_mtu;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 state:1;
+		u64 rsvd:53;
+	} s_link_state;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 status:1;
+		u64 rsvd:53;
+	} s_link_status;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 pkind:8;
+		u64 fsz:8;
+		u64 rx_ol_flags:16;
+		u64 tx_ol_flags:16;
+		u64 rsvd:6;
+	} s_fw_info;
+	struct {
+		u64 opcode:8;
+		u64 type:2;
+		u64 rsvd:22;
+		u64 rx_ol_flags:16;
+		u64 tx_ol_flags:16;
+	} s_offloads;
+} __packed;
 
 int octep_vf_setup_mbox(struct octep_vf_device *oct);
 void octep_vf_delete_mbox(struct octep_vf_device *oct);
+int octep_vf_mbox_send_cmd(struct octep_vf_device *oct, union octep_pfvf_mbox_word cmd,
+			   union octep_pfvf_mbox_word *rsp);
+int octep_vf_mbox_bulk_read(struct octep_vf_device *oct, enum octep_pfvf_mbox_opcode opcode,
+			    u8 *data, int *size);
 int octep_vf_mbox_set_mtu(struct octep_vf_device *oct, int mtu);
 int octep_vf_mbox_set_mac_addr(struct octep_vf_device *oct, char *mac_addr);
 int octep_vf_mbox_get_mac_addr(struct octep_vf_device *oct, char *mac_addr);
-- 
2.25.1


