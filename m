Return-Path: <linux-doc+bounces-63250-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B0FBD7E53
	for <lists+linux-doc@lfdr.de>; Tue, 14 Oct 2025 09:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8AE4257C6
	for <lists+linux-doc@lfdr.de>; Tue, 14 Oct 2025 07:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B20330E0FB;
	Tue, 14 Oct 2025 07:29:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFFC30E0C5
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426953; cv=none; b=BoqV8gimFKbuAgM8cbtfDadVBipKcg6UlbByGA/kzpbKmA7DB7OgSiBw2+e2+RPiJPn/zmZiWtf020zwjP39t1HRvWO08fxAUyoO0e+urPXjGxmZKhfDwOP2hUZscCL4+ihl+toGXu2SsudNxAxIiAsXpDyn5QMdBS/8RzeP+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426953; c=relaxed/simple;
	bh=TG1RgJEsVR/aHZhCSznAcSiMQiruU4NjsN5itqkUYcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q8oJs+4VghoaxagbOJvRGmHdYWV4LJY1vyitFYOHQHig50Eql6M38jMKJCnZsJYAvZw1bzRLVC0iv7Bf02ornHjPMEi6mhbo3mmAp4KxaWcY4gmTISfhonB4NLlQsp7RFy/lgVuiGIJMjPSj+2g6b/thJvHaDCnrafW8topZ+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz2t1760426863t1ebade9d
X-QQ-Originating-IP: Tz11S9/WaU5RUFL/yI8wPOxWIcSQxBW7zyKxmryRgfc=
Received: from localhost.localdomain ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 15:27:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9777684139916137296
EX-QQ-RecipientCnt: 13
From: Dong Yibo <dong100@mucse.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	andrew+netdev@lunn.ch,
	danishanwar@ti.com,
	vadim.fedorenko@linux.dev
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dong100@mucse.com
Subject: [PATCH net-next v14 5/5] net: rnpgbe: Add register_netdev
Date: Tue, 14 Oct 2025 15:27:11 +0800
Message-Id: <20251014072711.13448-6-dong100@mucse.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014072711.13448-1-dong100@mucse.com>
References: <20251014072711.13448-1-dong100@mucse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mom5ezI3X1cDp+sHj9Qs2u8h4y7CkzdtjhlhY9TXqz2ZvB1DI8f4RHqW
	oaGEL75T6uxwzl3MQnxDW0XG6oB+ngmLJFTfPXVBW1JG8cIthxzMN/jXfCB56h5AEQKbWSW
	DfVkK3x7Ia0R2Kl7sqHoS2ZNg5pf+GoissxTsdx5XdVDQC42XX1E0hiBMzXNw32eIQWmyRc
	Fpgo282slKG7bjL1OyxI/KRvxFgyTC5Bzv1ogmLH2rzZTSIzahLGX3MvCQXh4P0qxsz8VVO
	SoPSjzF6Fp7w2EimRe8RvZnqNoqRAyGEM/RETKeuZ26cOQQTYGyip+Ku3aRrsAMDhebbdwp
	mZwiSEF06FgvtlsuHn4gXg+R77hw91OGyN89/wsIP5KoxVgHJ2C7Zp5f/yqH31qHfUDSmul
	/6VcCc/XaXRpEdAbQxzwiprOmpl3D5/9gtWqrx8BSw6rCShW5uNJDjutMNnMVOGZFEXWHp4
	TjhmLfrc5+W2jH6Qs2d7sSonoqjZC2UBQ0Dps6jkfgZrP2xoHpo4+cZ13JmAQ06GfSLQzev
	AmZu0RiNwkH0iGAZW2t4ukT2hIzhIzt4Itj12N4PvSsU/Umz2AcjzZlCANDSLjvTSRW7BCi
	S0rXPhGfb+zVyjOlLQoyEEudgT8cC8Q6s+GZm3x6enNnFyB0D056+U7sbCVj5/iL5wN49T5
	/62vEdawGcl5SGhsv8jOrOof9lqnz+jmjNAvfQvhsjqXBmRrYefPUhVYCH5Oop+wb8OJ6j6
	dIKZoU/YyWlP6xsOrECBpuk9U0pqC5pm4Ji2XVij8Fm0LE5s+GdXo63ngtB1LYcjWvDZG4K
	A0WxCWNi6cV8lQE/+DDEByef0zCxvcfwnM7CaFThiEHw6kjJHC2MVxIPXVPgTXYqOz3nVxx
	phUuzE0htXWIX2OYE7tv72IUKIc2/t7MlO+H8j8XehtowuVVXSXCOdtobVp+f+c8sv1s/c9
	5L4jGyBfjBjOHGZQQWh/hPjrurfO2kVsuocwnB/q7X41VCRlVRZe++2ZVocpvEKHwrAjFUg
	EyFtJAAzW+gCDML7+TW/7XAk6s9c4=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Complete the network device (netdev) registration flow for Mucse Gbe
Ethernet chips, including:
1. Hardware state initialization:
   - Send powerup notification to firmware (via echo_fw_status)
   - Sync with firmware
   - Reset hardware
2. MAC address handling:
   - Retrieve permanent MAC from firmware (via mucse_mbx_get_macaddr)
   - Fallback to random valid MAC (eth_random_addr) if not valid mac
     from Fw

Signed-off-by: Dong Yibo <dong100@mucse.com>
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  24 ++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   |  73 +++++++++++
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h |   2 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   | 117 +++++++++++++++++-
 4 files changed, 214 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index 794581471b22..a8604bf34fc6 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -6,6 +6,7 @@
 
 #include <linux/types.h>
 #include <linux/mutex.h>
+#include <linux/netdevice.h>
 
 enum rnpgbe_boards {
 	board_n500,
@@ -34,18 +35,38 @@ struct mucse_mbx_info {
 	u32 fwpf_ctrl_base;
 };
 
+/* Enum for firmware notification modes,
+ * more modes (e.g., portup, link_report) will be added in future
+ **/
+enum {
+	mucse_fw_powerup,
+};
+
 struct mucse_hw {
 	void __iomem *hw_addr;
+	struct pci_dev *pdev;
 	struct mucse_mbx_info mbx;
+	int port;
+	u8 perm_addr[ETH_ALEN];
 	u8 pfvfnum;
 };
 
+struct mucse_stats {
+	u64 tx_dropped;
+};
+
 struct mucse {
 	struct net_device *netdev;
 	struct pci_dev *pdev;
 	struct mucse_hw hw;
+	struct mucse_stats stats;
 };
 
+int rnpgbe_get_permanent_mac(struct mucse_hw *hw);
+int rnpgbe_reset_hw(struct mucse_hw *hw);
+int rnpgbe_send_notify(struct mucse_hw *hw,
+		       bool enable,
+		       int mode);
 int rnpgbe_init_hw(struct mucse_hw *hw, int board_type);
 
 /* Device IDs */
@@ -54,4 +75,7 @@ int rnpgbe_init_hw(struct mucse_hw *hw, int board_type);
 #define RNPGBE_DEVICE_ID_N500_DUAL_PORT   0x8318
 #define RNPGBE_DEVICE_ID_N210             0x8208
 #define RNPGBE_DEVICE_ID_N210L            0x820a
+
+#define mucse_hw_wr32(hw, reg, val) \
+	writel((val), (hw)->hw_addr + (reg))
 #endif /* _RNPGBE_H */
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
index 5739db98f12a..2ec6e28d2c35 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
@@ -1,11 +1,82 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2020 - 2025 Mucse Corporation. */
 
+#include <linux/pci.h>
 #include <linux/errno.h>
+#include <linux/etherdevice.h>
 
 #include "rnpgbe.h"
 #include "rnpgbe_hw.h"
 #include "rnpgbe_mbx.h"
+#include "rnpgbe_mbx_fw.h"
+
+/**
+ * rnpgbe_get_permanent_mac - Get permanent mac
+ * @hw: hw information structure
+ *
+ * rnpgbe_get_permanent_mac tries to get mac from hw
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+int rnpgbe_get_permanent_mac(struct mucse_hw *hw)
+{
+	struct device *dev = &hw->pdev->dev;
+	u8 *mac_addr = hw->perm_addr;
+	int err;
+
+	err = mucse_mbx_get_macaddr(hw, hw->pfvfnum, mac_addr, hw->port);
+	if (err) {
+		dev_err(dev, "Failed to get MAC from FW %d\n", err);
+		return err;
+	}
+
+	if (!is_valid_ether_addr(mac_addr)) {
+		dev_err(dev, "Failed to get valid MAC from FW\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * rnpgbe_reset_hw - Do a hardware reset
+ * @hw: hw information structure
+ *
+ * rnpgbe_reset_hw calls fw to do a hardware
+ * reset, and cleans some regs to default.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+int rnpgbe_reset_hw(struct mucse_hw *hw)
+{
+	mucse_hw_wr32(hw, RNPGBE_DMA_AXI_EN, 0);
+	return mucse_mbx_reset_hw(hw);
+}
+
+/**
+ * rnpgbe_send_notify - Echo fw status
+ * @hw: hw information structure
+ * @enable: true or false status
+ * @mode: status mode
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+int rnpgbe_send_notify(struct mucse_hw *hw,
+		       bool enable,
+		       int mode)
+{
+	int err;
+	/* Keep switch struct to support more modes in the future */
+	switch (mode) {
+	case mucse_fw_powerup:
+		err = mucse_mbx_powerup(hw, enable);
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
 
 /**
  * rnpgbe_init_n500 - Setup n500 hw info
@@ -50,6 +121,8 @@ int rnpgbe_init_hw(struct mucse_hw *hw, int board_type)
 {
 	struct mucse_mbx_info *mbx = &hw->mbx;
 
+	hw->port = 0;
+
 	mbx->pf2fw_mbx_ctrl = MUCSE_GBE_PFFW_MBX_CTRL_OFFSET;
 	mbx->fwpf_mbx_mask = MUCSE_GBE_FWPF_MBX_MASK_OFFSET;
 
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
index 268f572936aa..e77e6bc3d3e3 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
@@ -11,5 +11,7 @@
 #define MUCSE_N210_FWPF_CTRL_BASE      0x29400
 #define MUCSE_N210_FWPF_SHM_BASE       0x2d900
 
+#define RNPGBE_DMA_AXI_EN              0x0010
+
 #define RNPGBE_MAX_QUEUES 8
 #endif /* _RNPGBE_HW_H */
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index d8aaac79ff4b..e4392ddfbce2 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -7,6 +7,7 @@
 
 #include "rnpgbe.h"
 #include "rnpgbe_hw.h"
+#include "rnpgbe_mbx_fw.h"
 
 static const char rnpgbe_driver_name[] = "rnpgbe";
 
@@ -24,6 +25,58 @@ static struct pci_device_id rnpgbe_pci_tbl[] = {
 	{0, },
 };
 
+/**
+ * rnpgbe_open - Called when a network interface is made active
+ * @netdev: network interface device structure
+ *
+ * The open entry point is called when a network interface is made
+ * active by the system (IFF_UP).
+ *
+ * Return: 0
+ **/
+static int rnpgbe_open(struct net_device *netdev)
+{
+	return 0;
+}
+
+/**
+ * rnpgbe_close - Disables a network interface
+ * @netdev: network interface device structure
+ *
+ * The close entry point is called when an interface is de-activated
+ * by the OS.
+ *
+ * Return: 0, this is not allowed to fail
+ **/
+static int rnpgbe_close(struct net_device *netdev)
+{
+	return 0;
+}
+
+/**
+ * rnpgbe_xmit_frame - Send a skb to driver
+ * @skb: skb structure to be sent
+ * @netdev: network interface device structure
+ *
+ * Return: NETDEV_TX_OK
+ **/
+static netdev_tx_t rnpgbe_xmit_frame(struct sk_buff *skb,
+				     struct net_device *netdev)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+
+	dev_kfree_skb_any(skb);
+	mucse->stats.tx_dropped++;
+
+	return NETDEV_TX_OK;
+}
+
+static const struct net_device_ops rnpgbe_netdev_ops = {
+	.ndo_open       = rnpgbe_open,
+	.ndo_stop       = rnpgbe_close,
+	.ndo_start_xmit = rnpgbe_xmit_frame,
+};
+
 /**
  * rnpgbe_add_adapter - Add netdev for this pci_dev
  * @pdev: PCI device information structure
@@ -42,7 +95,7 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 	void __iomem *hw_addr;
 	struct mucse *mucse;
 	struct mucse_hw *hw;
-	int err;
+	int err, err_notify;
 
 	netdev = alloc_etherdev_mq(sizeof(struct mucse), RNPGBE_MAX_QUEUES);
 	if (!netdev)
@@ -64,14 +117,66 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 	}
 
 	hw->hw_addr = hw_addr;
+	hw->pdev = pdev;
+
 	err = rnpgbe_init_hw(hw, board_type);
 	if (err) {
 		dev_err(&pdev->dev, "Init hw err %d\n", err);
 		goto err_free_net;
 	}
+	/* Step 1: Send power-up notification to firmware (no response expected)
+	 * This informs firmware to initialize hardware power state, but
+	 * firmware only acknowledges receipt without returning data. Must be
+	 * done before synchronization as firmware may be in low-power idle
+	 * state initially.
+	 */
+	err_notify = rnpgbe_send_notify(hw, true, mucse_fw_powerup);
+	if (err_notify) {
+		dev_warn(&pdev->dev, "Send powerup to hw failed %d\n",
+			 err_notify);
+		dev_warn(&pdev->dev, "Maybe low performance\n");
+	}
+	/* Step 2: Synchronize mailbox communication with firmware (requires
+	 * response) After power-up, confirm firmware is ready to process
+	 * requests with responses. This ensures subsequent request/response
+	 * interactions work reliably.
+	 */
+	err = mucse_mbx_sync_fw(hw);
+	if (err) {
+		dev_err(&pdev->dev, "Sync fw failed! %d\n", err);
+		goto err_powerdown;
+	}
 
-	return 0;
+	netdev->netdev_ops = &rnpgbe_netdev_ops;
+	err = rnpgbe_reset_hw(hw);
+	if (err) {
+		dev_err(&pdev->dev, "Hw reset failed %d\n", err);
+		goto err_powerdown;
+	}
+
+	err = rnpgbe_get_permanent_mac(hw);
+	if (err == -EINVAL) {
+		dev_warn(&pdev->dev, "Using random MAC\n");
+		eth_random_addr(hw->perm_addr);
+	} else if (err) {
+		dev_err(&pdev->dev, "get perm_addr failed %d\n", err);
+		goto err_powerdown;
+	}
+
+	eth_hw_addr_set(netdev, hw->perm_addr);
+	err = register_netdev(netdev);
+	if (err)
+		goto err_powerdown;
 
+	return 0;
+err_powerdown:
+	/* notify powerdown only powerup ok */
+	if (!err_notify) {
+		err_notify = rnpgbe_send_notify(hw, false, mucse_fw_powerup);
+		if (err_notify)
+			dev_warn(&pdev->dev, "Send powerdown to hw failed %d\n",
+				 err_notify);
+	}
 err_free_net:
 	free_netdev(netdev);
 	return err;
@@ -138,11 +243,17 @@ static int rnpgbe_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static void rnpgbe_rm_adapter(struct pci_dev *pdev)
 {
 	struct mucse *mucse = pci_get_drvdata(pdev);
+	struct mucse_hw *hw = &mucse->hw;
 	struct net_device *netdev;
+	int err;
 
 	if (!mucse)
 		return;
 	netdev = mucse->netdev;
+	unregister_netdev(netdev);
+	err = rnpgbe_send_notify(hw, false, mucse_fw_powerup);
+	if (err)
+		dev_warn(&pdev->dev, "Send powerdown to hw failed %d\n", err);
 	free_netdev(netdev);
 }
 
@@ -173,6 +284,8 @@ static void rnpgbe_dev_shutdown(struct pci_dev *pdev)
 
 	rtnl_lock();
 	netif_device_detach(netdev);
+	if (netif_running(netdev))
+		rnpgbe_close(netdev);
 	rtnl_unlock();
 	pci_disable_device(pdev);
 }
-- 
2.25.1


