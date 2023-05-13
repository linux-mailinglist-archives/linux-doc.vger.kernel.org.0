Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 226B7701569
	for <lists+linux-doc@lfdr.de>; Sat, 13 May 2023 10:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbjEMIyJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 13 May 2023 04:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbjEMIyI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 May 2023 04:54:08 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16CE576BD;
        Sat, 13 May 2023 01:53:50 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34D8bLjR024516;
        Sat, 13 May 2023 01:53:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0220; bh=0dfze3iK/WUZgzJR0s5Pho84F+bl4ihDbmOLbhUv/9g=;
 b=TGfXO/m0lAPJAeaxyd5Iyi4kjXQWXr4lwIBXLd8EzdRYz/26Q4j++h0/COIYjsozQ7aP
 YYndegNYU/gUbJCblyrpxx++vX4bipBA6dc1r7iYZyuIcZ/w+GzeUKUrFPfdeIKbQ+ZE
 wQmMx4fydTXlumFW8T8oAk31WsCvlRvQCyN6FBe73NUNA9Rj1GJv2VIzmOqESy7S1Ik3
 TpcgHsJb8IKnrL2m90txFucHp8CZN4XLGtp10FaGxVXxXjWIO3yhbg0t4T6qOJSLcIxU
 FCB1Xv/UrYv0XRv9d9Y33zNht6nV+DONr1rUIGulA32rJ+qeFSIQg7eblhP8qNDK1scU ZQ== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3qhs82tg8f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Sat, 13 May 2023 01:53:36 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 13 May
 2023 01:53:35 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Sat, 13 May 2023 01:53:33 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
        by maili.marvell.com (Postfix) with ESMTP id 2ADC3626BB6;
        Sat, 13 May 2023 01:52:29 -0700 (PDT)
From:   Hariprasad Kelam <hkelam@marvell.com>
To:     <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <kuba@kernel.org>, <davem@davemloft.net>,
        <willemdebruijn.kernel@gmail.com>, <andrew@lunn.ch>,
        <sgoutham@marvell.com>, <lcherian@marvell.com>,
        <gakula@marvell.com>, <jerinj@marvell.com>, <sbhatta@marvell.com>,
        <hkelam@marvell.com>, <naveenm@marvell.com>, <edumazet@google.com>,
        <pabeni@redhat.com>, <jhs@mojatatu.com>,
        <xiyou.wangcong@gmail.com>, <jiri@resnulli.us>,
        <maxtram95@gmail.com>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
Subject: [net-next Patch v10 6/8] octeontx2-pf: Add support for HTB offload
Date:   Sat, 13 May 2023 14:21:41 +0530
Message-ID: <20230513085143.3289-7-hkelam@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230513085143.3289-1-hkelam@marvell.com>
References: <20230513085143.3289-1-hkelam@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: HiZeLTfJgmCEyy2xHtXr0vrFmE9_elWL
X-Proofpoint-ORIG-GUID: HiZeLTfJgmCEyy2xHtXr0vrFmE9_elWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-13_05,2023-05-05_01,2023-02-09_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Naveen Mamindlapalli <naveenm@marvell.com>

This patch registers callbacks to support HTB offload.

Below are features supported,

- supports traffic shaping on the given class by honoring rate and ceil
configuration.

- supports traffic scheduling,  which prioritizes different types of
traffic based on strict priority values.

- supports the creation of leaf to inner classes such that parent node
rate limits apply to all child nodes.

Signed-off-by: Naveen Mamindlapalli <naveenm@marvell.com>
Signed-off-by: Hariprasad Kelam <hkelam@marvell.com>
Signed-off-by: Sunil Kovvuri Goutham <sgoutham@marvell.com>
---
 .../ethernet/marvell/octeontx2/af/common.h    |    2 +-
 .../ethernet/marvell/octeontx2/nic/Makefile   |    2 +-
 .../marvell/octeontx2/nic/otx2_common.c       |    5 +
 .../marvell/octeontx2/nic/otx2_common.h       |   10 +
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  |   53 +-
 .../ethernet/marvell/octeontx2/nic/otx2_tc.c  |    7 +-
 .../ethernet/marvell/octeontx2/nic/otx2_vf.c  |    1 +
 .../net/ethernet/marvell/octeontx2/nic/qos.c  | 1363 +++++++++++++++++
 .../net/ethernet/marvell/octeontx2/nic/qos.h  |   58 +-
 .../ethernet/marvell/octeontx2/nic/qos_sq.c   |   20 +-
 10 files changed, 1507 insertions(+), 14 deletions(-)
 create mode 100644 drivers/net/ethernet/marvell/octeontx2/nic/qos.c

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/common.h b/drivers/net/ethernet/marvell/octeontx2/af/common.h
index 8931864ee110..f5bf719a6ccf 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/common.h
+++ b/drivers/net/ethernet/marvell/octeontx2/af/common.h
@@ -142,7 +142,7 @@ enum nix_scheduler {
 
 #define TXSCH_RR_QTM_MAX		((1 << 24) - 1)
 #define TXSCH_TL1_DFLT_RR_QTM		TXSCH_RR_QTM_MAX
-#define TXSCH_TL1_DFLT_RR_PRIO		(0x1ull)
+#define TXSCH_TL1_DFLT_RR_PRIO		(0x7ull)
 #define CN10K_MAX_DWRR_WEIGHT          16384 /* Weight is 14bit on CN10K */
 
 /* Min/Max packet sizes, excluding FCS */
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/Makefile b/drivers/net/ethernet/marvell/octeontx2/nic/Makefile
index 3d31ddf7c652..5664f768cb0c 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/Makefile
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_OCTEONTX2_VF) += rvu_nicvf.o otx2_ptp.o
 
 rvu_nicpf-y := otx2_pf.o otx2_common.o otx2_txrx.o otx2_ethtool.o \
                otx2_flows.o otx2_tc.o cn10k.o otx2_dmac_flt.o \
-               otx2_devlink.o qos_sq.o
+               otx2_devlink.o qos_sq.o qos.o
 rvu_nicvf-y := otx2_vf.o otx2_devlink.o
 
 rvu_nicpf-$(CONFIG_DCB) += otx2_dcbnl.o
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
index 6df6f6380b55..f9286648e45c 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
@@ -89,6 +89,11 @@ int otx2_update_sq_stats(struct otx2_nic *pfvf, int qidx)
 	if (!pfvf->qset.sq)
 		return 0;
 
+	if (qidx >= pfvf->hw.non_qos_queues) {
+		if (!test_bit(qidx - pfvf->hw.non_qos_queues, pfvf->qos.qos_sq_bmap))
+			return 0;
+	}
+
 	otx2_nix_sq_op_stats(&sq->stats, pfvf, qidx);
 	return 1;
 }
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
index 8b6dab3ef67b..e36b4b85a30c 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
@@ -1094,8 +1094,18 @@ static inline void otx2_qos_init(struct otx2_nic *pfvf, int qos_txqs)
 	struct otx2_hw *hw = &pfvf->hw;
 
 	hw->tc_tx_queues = qos_txqs;
+	INIT_LIST_HEAD(&pfvf->qos.qos_tree);
+	mutex_init(&pfvf->qos.qos_lock);
+}
+
+static inline void otx2_shutdown_qos(struct otx2_nic *pfvf)
+{
+	mutex_destroy(&pfvf->qos.qos_lock);
 }
 
 u16 otx2_select_queue(struct net_device *netdev, struct sk_buff *skb,
 		      struct net_device *sb_dev);
+int otx2_get_txq_by_classid(struct otx2_nic *pfvf, u16 classid);
+void otx2_qos_config_txschq(struct otx2_nic *pfvf);
+void otx2_clean_qos_queues(struct otx2_nic *pfvf);
 #endif /* OTX2_COMMON_H */
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index 8706bc2bcf75..c4a301d1b2ec 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -1387,6 +1387,9 @@ static void otx2_free_sq_res(struct otx2_nic *pf)
 	otx2_sq_free_sqbs(pf);
 	for (qidx = 0; qidx < otx2_get_total_tx_queues(pf); qidx++) {
 		sq = &qset->sq[qidx];
+		/* Skip freeing Qos queues if they are not initialized */
+		if (!sq->sqe)
+			continue;
 		qmem_free(pf->dev, sq->sqe);
 		qmem_free(pf->dev, sq->tso_hdrs);
 		kfree(sq->sg);
@@ -1566,6 +1569,8 @@ static void otx2_free_hw_resources(struct otx2_nic *pf)
 		otx2_pfc_txschq_stop(pf);
 #endif
 
+	otx2_clean_qos_queues(pf);
+
 	mutex_lock(&mbox->lock);
 	/* Disable backpressure */
 	if (!(pf->pcifunc & RVU_PFVF_FUNC_MASK))
@@ -1710,7 +1715,7 @@ int otx2_open(struct net_device *netdev)
 	if (!qset->cq)
 		goto err_free_mem;
 
-	qset->sq = kcalloc(pf->hw.non_qos_queues,
+	qset->sq = kcalloc(otx2_get_total_tx_queues(pf),
 			   sizeof(struct otx2_snd_queue), GFP_KERNEL);
 	if (!qset->sq)
 		goto err_free_mem;
@@ -1833,6 +1838,9 @@ int otx2_open(struct net_device *netdev)
 	/* 'intf_down' may be checked on any cpu */
 	smp_wmb();
 
+	/* Enable QoS configuration before starting tx queues */
+	otx2_qos_config_txschq(pf);
+
 	/* we have already received link status notification */
 	if (pf->linfo.link_up && !(pf->pcifunc & RVU_PFVF_FUNC_MASK))
 		otx2_handle_link_event(pf);
@@ -1977,14 +1985,48 @@ static netdev_tx_t otx2_xmit(struct sk_buff *skb, struct net_device *netdev)
 	return NETDEV_TX_OK;
 }
 
+static int otx2_qos_select_htb_queue(struct otx2_nic *pf, struct sk_buff *skb,
+				     u16 htb_maj_id)
+{
+	u16 classid;
+
+	if ((TC_H_MAJ(skb->priority) >> 16) == htb_maj_id)
+		classid = TC_H_MIN(skb->priority);
+	else
+		classid = READ_ONCE(pf->qos.defcls);
+
+	if (!classid)
+		return 0;
+
+	return otx2_get_txq_by_classid(pf, classid);
+}
+
 u16 otx2_select_queue(struct net_device *netdev, struct sk_buff *skb,
 		      struct net_device *sb_dev)
 {
-#ifdef CONFIG_DCB
 	struct otx2_nic *pf = netdev_priv(netdev);
+	bool qos_enabled;
+#ifdef CONFIG_DCB
 	u8 vlan_prio;
 #endif
+	int txq;
+
+	qos_enabled = (netdev->real_num_tx_queues > pf->hw.tx_queues) ? true : false;
+	if (unlikely(qos_enabled)) {
+		/* This smp_load_acquire() pairs with smp_store_release() in
+		 * otx2_qos_root_add() called from htb offload root creation
+		 */
+		u16 htb_maj_id = smp_load_acquire(&pf->qos.maj_id);
 
+		if (unlikely(htb_maj_id)) {
+			txq = otx2_qos_select_htb_queue(pf, skb, htb_maj_id);
+			if (txq > 0)
+				return txq;
+			goto process_pfc;
+		}
+	}
+
+process_pfc:
 #ifdef CONFIG_DCB
 	if (!skb_vlan_tag_present(skb))
 		goto pick_tx;
@@ -1998,7 +2040,11 @@ u16 otx2_select_queue(struct net_device *netdev, struct sk_buff *skb,
 
 pick_tx:
 #endif
-	return netdev_pick_tx(netdev, skb, NULL);
+	txq = netdev_pick_tx(netdev, skb, NULL);
+	if (unlikely(qos_enabled))
+		return txq % pf->hw.tx_queues;
+
+	return txq;
 }
 EXPORT_SYMBOL(otx2_select_queue);
 
@@ -3113,6 +3159,7 @@ static void otx2_remove(struct pci_dev *pdev)
 	otx2_ptp_destroy(pf);
 	otx2_mcam_flow_del(pf);
 	otx2_shutdown_tc(pf);
+	otx2_shutdown_qos(pf);
 	otx2_detach_resources(&pf->mbox);
 	if (pf->hw.lmt_info)
 		free_percpu(pf->hw.lmt_info);
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
index 15729e9506ea..7484356ec3bf 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c
@@ -19,6 +19,7 @@
 
 #include "cn10k.h"
 #include "otx2_common.h"
+#include "qos.h"
 
 #define CN10K_MAX_BURST_MANTISSA	0x7FFFULL
 #define CN10K_MAX_BURST_SIZE		8453888ULL
@@ -132,8 +133,8 @@ static void otx2_get_egress_rate_cfg(u64 maxrate, u32 *exp,
 	}
 }
 
-static u64 otx2_get_txschq_rate_regval(struct otx2_nic *nic,
-				       u64 maxrate, u32 burst)
+u64 otx2_get_txschq_rate_regval(struct otx2_nic *nic,
+				u64 maxrate, u32 burst)
 {
 	u32 burst_exp, burst_mantissa;
 	u32 exp, mantissa, div_exp;
@@ -1109,6 +1110,8 @@ int otx2_setup_tc(struct net_device *netdev, enum tc_setup_type type,
 	switch (type) {
 	case TC_SETUP_BLOCK:
 		return otx2_setup_tc_block(netdev, type_data);
+	case TC_SETUP_QDISC_HTB:
+		return otx2_setup_tc_htb(netdev, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
index ce8ffb71ff38..46114be67274 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
@@ -760,6 +760,7 @@ static void otx2vf_remove(struct pci_dev *pdev)
 	otx2_ptp_destroy(vf);
 	otx2_mcam_flow_del(vf);
 	otx2_shutdown_tc(vf);
+	otx2_shutdown_qos(vf);
 	otx2vf_disable_mbox_intr(vf);
 	otx2_detach_resources(&vf->mbox);
 	free_percpu(vf->hw.lmt_info);
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/qos.c b/drivers/net/ethernet/marvell/octeontx2/nic/qos.c
new file mode 100644
index 000000000000..d3a76c5ccda8
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/qos.c
@@ -0,0 +1,1363 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Marvell RVU Ethernet driver
+ *
+ * Copyright (C) 2023 Marvell.
+ *
+ */
+#include <linux/netdevice.h>
+#include <linux/etherdevice.h>
+#include <linux/inetdevice.h>
+#include <linux/bitfield.h>
+
+#include "otx2_common.h"
+#include "cn10k.h"
+#include "qos.h"
+
+#define OTX2_QOS_QID_INNER		0xFFFFU
+#define OTX2_QOS_QID_NONE		0xFFFEU
+#define OTX2_QOS_ROOT_CLASSID		0xFFFFFFFF
+#define OTX2_QOS_CLASS_NONE		0
+#define OTX2_QOS_DEFAULT_PRIO		0xF
+#define OTX2_QOS_INVALID_SQ		0xFFFF
+
+static void otx2_qos_update_tx_netdev_queues(struct otx2_nic *pfvf)
+{
+	struct otx2_hw *hw = &pfvf->hw;
+	int tx_queues, qos_txqs, err;
+
+	qos_txqs = bitmap_weight(pfvf->qos.qos_sq_bmap,
+				 OTX2_QOS_MAX_LEAF_NODES);
+
+	tx_queues = hw->tx_queues + qos_txqs;
+
+	err = netif_set_real_num_tx_queues(pfvf->netdev, tx_queues);
+	if (err) {
+		netdev_err(pfvf->netdev,
+			   "Failed to set no of Tx queues: %d\n", tx_queues);
+		return;
+	}
+}
+
+static void otx2_qos_get_regaddr(struct otx2_qos_node *node,
+				 struct nix_txschq_config *cfg,
+				 int index)
+{
+	if (node->level == NIX_TXSCH_LVL_SMQ) {
+		cfg->reg[index++] = NIX_AF_MDQX_PARENT(node->schq);
+		cfg->reg[index++] = NIX_AF_MDQX_SCHEDULE(node->schq);
+		cfg->reg[index++] = NIX_AF_MDQX_PIR(node->schq);
+		cfg->reg[index]   = NIX_AF_MDQX_CIR(node->schq);
+	} else if (node->level == NIX_TXSCH_LVL_TL4) {
+		cfg->reg[index++] = NIX_AF_TL4X_PARENT(node->schq);
+		cfg->reg[index++] = NIX_AF_TL4X_SCHEDULE(node->schq);
+		cfg->reg[index++] = NIX_AF_TL4X_PIR(node->schq);
+		cfg->reg[index]   = NIX_AF_TL4X_CIR(node->schq);
+	} else if (node->level == NIX_TXSCH_LVL_TL3) {
+		cfg->reg[index++] = NIX_AF_TL3X_PARENT(node->schq);
+		cfg->reg[index++] = NIX_AF_TL3X_SCHEDULE(node->schq);
+		cfg->reg[index++] = NIX_AF_TL3X_PIR(node->schq);
+		cfg->reg[index]   = NIX_AF_TL3X_CIR(node->schq);
+	} else if (node->level == NIX_TXSCH_LVL_TL2) {
+		cfg->reg[index++] = NIX_AF_TL2X_PARENT(node->schq);
+		cfg->reg[index++] = NIX_AF_TL2X_SCHEDULE(node->schq);
+		cfg->reg[index++] = NIX_AF_TL2X_PIR(node->schq);
+		cfg->reg[index]   = NIX_AF_TL2X_CIR(node->schq);
+	}
+}
+
+static void otx2_config_sched_shaping(struct otx2_nic *pfvf,
+				      struct otx2_qos_node *node,
+				      struct nix_txschq_config *cfg,
+				      int *num_regs)
+{
+	u64 maxrate;
+
+	otx2_qos_get_regaddr(node, cfg, *num_regs);
+
+	/* configure parent txschq */
+	cfg->regval[*num_regs] = node->parent->schq << 16;
+	(*num_regs)++;
+
+	/* configure prio/quantum */
+	if (node->qid == OTX2_QOS_QID_NONE) {
+		cfg->regval[*num_regs] =  node->prio << 24 |
+					  mtu_to_dwrr_weight(pfvf, pfvf->tx_max_pktlen);
+		(*num_regs)++;
+		return;
+	}
+
+	/* configure priority  */
+	cfg->regval[*num_regs] = (node->schq - node->parent->prio_anchor) << 24;
+	(*num_regs)++;
+
+	/* configure PIR */
+	maxrate = (node->rate > node->ceil) ? node->rate : node->ceil;
+
+	cfg->regval[*num_regs] =
+		otx2_get_txschq_rate_regval(pfvf, maxrate, 65536);
+	(*num_regs)++;
+
+	/* Don't configure CIR when both CIR+PIR not supported
+	 * On 96xx, CIR + PIR + RED_ALGO=STALL causes deadlock
+	 */
+	if (!test_bit(QOS_CIR_PIR_SUPPORT, &pfvf->hw.cap_flag))
+		return;
+
+	cfg->regval[*num_regs] =
+		otx2_get_txschq_rate_regval(pfvf, node->rate, 65536);
+	(*num_regs)++;
+}
+
+static void __otx2_qos_txschq_cfg(struct otx2_nic *pfvf,
+				  struct otx2_qos_node *node,
+				  struct nix_txschq_config *cfg)
+{
+	struct otx2_hw *hw = &pfvf->hw;
+	int num_regs = 0;
+	u8 level;
+
+	level = node->level;
+
+	/* program txschq registers */
+	if (level == NIX_TXSCH_LVL_SMQ) {
+		cfg->reg[num_regs] = NIX_AF_SMQX_CFG(node->schq);
+		cfg->regval[num_regs] = ((u64)pfvf->tx_max_pktlen << 8) |
+					OTX2_MIN_MTU;
+		cfg->regval[num_regs] |= (0x20ULL << 51) | (0x80ULL << 39) |
+					 (0x2ULL << 36);
+		num_regs++;
+
+		otx2_config_sched_shaping(pfvf, node, cfg, &num_regs);
+
+	} else if (level == NIX_TXSCH_LVL_TL4) {
+		otx2_config_sched_shaping(pfvf, node, cfg, &num_regs);
+	} else if (level == NIX_TXSCH_LVL_TL3) {
+		/* configure link cfg */
+		if (level == pfvf->qos.link_cfg_lvl) {
+			cfg->reg[num_regs] = NIX_AF_TL3_TL2X_LINKX_CFG(node->schq, hw->tx_link);
+			cfg->regval[num_regs] = BIT_ULL(13) | BIT_ULL(12);
+			num_regs++;
+		}
+
+		otx2_config_sched_shaping(pfvf, node, cfg, &num_regs);
+	} else if (level == NIX_TXSCH_LVL_TL2) {
+		/* configure link cfg */
+		if (level == pfvf->qos.link_cfg_lvl) {
+			cfg->reg[num_regs] = NIX_AF_TL3_TL2X_LINKX_CFG(node->schq, hw->tx_link);
+			cfg->regval[num_regs] = BIT_ULL(13) | BIT_ULL(12);
+			num_regs++;
+		}
+
+		/* check if node is root */
+		if (node->qid == OTX2_QOS_QID_INNER && !node->parent) {
+			cfg->reg[num_regs] = NIX_AF_TL2X_SCHEDULE(node->schq);
+			cfg->regval[num_regs] =  TXSCH_TL1_DFLT_RR_PRIO << 24 |
+						 mtu_to_dwrr_weight(pfvf,
+								    pfvf->tx_max_pktlen);
+			num_regs++;
+			goto txschq_cfg_out;
+		}
+
+		otx2_config_sched_shaping(pfvf, node, cfg, &num_regs);
+	}
+
+txschq_cfg_out:
+	cfg->num_regs = num_regs;
+}
+
+static int otx2_qos_txschq_set_parent_topology(struct otx2_nic *pfvf,
+					       struct otx2_qos_node *parent)
+{
+	struct mbox *mbox = &pfvf->mbox;
+	struct nix_txschq_config *cfg;
+	int rc;
+
+	if (parent->level == NIX_TXSCH_LVL_MDQ)
+		return 0;
+
+	mutex_lock(&mbox->lock);
+
+	cfg = otx2_mbox_alloc_msg_nix_txschq_cfg(&pfvf->mbox);
+	if (!cfg) {
+		mutex_unlock(&mbox->lock);
+		return -ENOMEM;
+	}
+
+	cfg->lvl = parent->level;
+
+	if (parent->level == NIX_TXSCH_LVL_TL4)
+		cfg->reg[0] = NIX_AF_TL4X_TOPOLOGY(parent->schq);
+	else if (parent->level == NIX_TXSCH_LVL_TL3)
+		cfg->reg[0] = NIX_AF_TL3X_TOPOLOGY(parent->schq);
+	else if (parent->level == NIX_TXSCH_LVL_TL2)
+		cfg->reg[0] = NIX_AF_TL2X_TOPOLOGY(parent->schq);
+	else if (parent->level == NIX_TXSCH_LVL_TL1)
+		cfg->reg[0] = NIX_AF_TL1X_TOPOLOGY(parent->schq);
+
+	cfg->regval[0] = (u64)parent->prio_anchor << 32;
+	if (parent->level == NIX_TXSCH_LVL_TL1)
+		cfg->regval[0] |= (u64)TXSCH_TL1_DFLT_RR_PRIO << 1;
+
+	cfg->num_regs++;
+
+	rc = otx2_sync_mbox_msg(&pfvf->mbox);
+
+	mutex_unlock(&mbox->lock);
+
+	return rc;
+}
+
+static void otx2_qos_free_hw_node_schq(struct otx2_nic *pfvf,
+				       struct otx2_qos_node *parent)
+{
+	struct otx2_qos_node *node;
+
+	list_for_each_entry_reverse(node, &parent->child_schq_list, list)
+		otx2_txschq_free_one(pfvf, node->level, node->schq);
+}
+
+static void otx2_qos_free_hw_node(struct otx2_nic *pfvf,
+				  struct otx2_qos_node *parent)
+{
+	struct otx2_qos_node *node, *tmp;
+
+	list_for_each_entry_safe(node, tmp, &parent->child_list, list) {
+		otx2_qos_free_hw_node(pfvf, node);
+		otx2_qos_free_hw_node_schq(pfvf, node);
+		otx2_txschq_free_one(pfvf, node->level, node->schq);
+	}
+}
+
+static void otx2_qos_free_hw_cfg(struct otx2_nic *pfvf,
+				 struct otx2_qos_node *node)
+{
+	mutex_lock(&pfvf->qos.qos_lock);
+
+	/* free child node hw mappings */
+	otx2_qos_free_hw_node(pfvf, node);
+	otx2_qos_free_hw_node_schq(pfvf, node);
+
+	/* free node hw mappings */
+	otx2_txschq_free_one(pfvf, node->level, node->schq);
+
+	mutex_unlock(&pfvf->qos.qos_lock);
+}
+
+static void otx2_qos_sw_node_delete(struct otx2_nic *pfvf,
+				    struct otx2_qos_node *node)
+{
+	hash_del_rcu(&node->hlist);
+
+	if (node->qid != OTX2_QOS_QID_INNER && node->qid != OTX2_QOS_QID_NONE) {
+		__clear_bit(node->qid, pfvf->qos.qos_sq_bmap);
+		otx2_qos_update_tx_netdev_queues(pfvf);
+	}
+
+	list_del(&node->list);
+	kfree(node);
+}
+
+static void otx2_qos_free_sw_node_schq(struct otx2_nic *pfvf,
+				       struct otx2_qos_node *parent)
+{
+	struct otx2_qos_node *node, *tmp;
+
+	list_for_each_entry_safe(node, tmp, &parent->child_schq_list, list) {
+		list_del(&node->list);
+		kfree(node);
+	}
+}
+
+static void __otx2_qos_free_sw_node(struct otx2_nic *pfvf,
+				    struct otx2_qos_node *parent)
+{
+	struct otx2_qos_node *node, *tmp;
+
+	list_for_each_entry_safe(node, tmp, &parent->child_list, list) {
+		__otx2_qos_free_sw_node(pfvf, node);
+		otx2_qos_free_sw_node_schq(pfvf, node);
+		otx2_qos_sw_node_delete(pfvf, node);
+	}
+}
+
+static void otx2_qos_free_sw_node(struct otx2_nic *pfvf,
+				  struct otx2_qos_node *node)
+{
+	mutex_lock(&pfvf->qos.qos_lock);
+
+	__otx2_qos_free_sw_node(pfvf, node);
+	otx2_qos_free_sw_node_schq(pfvf, node);
+	otx2_qos_sw_node_delete(pfvf, node);
+
+	mutex_unlock(&pfvf->qos.qos_lock);
+}
+
+static void otx2_qos_destroy_node(struct otx2_nic *pfvf,
+				  struct otx2_qos_node *node)
+{
+	otx2_qos_free_hw_cfg(pfvf, node);
+	otx2_qos_free_sw_node(pfvf, node);
+}
+
+static void otx2_qos_fill_cfg_schq(struct otx2_qos_node *parent,
+				   struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *node;
+
+	list_for_each_entry(node, &parent->child_schq_list, list)
+		cfg->schq[node->level]++;
+}
+
+static void otx2_qos_fill_cfg_tl(struct otx2_qos_node *parent,
+				 struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *node;
+
+	list_for_each_entry(node, &parent->child_list, list) {
+		otx2_qos_fill_cfg_tl(node, cfg);
+		cfg->schq_contig[node->level]++;
+		otx2_qos_fill_cfg_schq(node, cfg);
+	}
+}
+
+static void otx2_qos_prepare_txschq_cfg(struct otx2_nic *pfvf,
+					struct otx2_qos_node *parent,
+					struct otx2_qos_cfg *cfg)
+{
+	mutex_lock(&pfvf->qos.qos_lock);
+	otx2_qos_fill_cfg_tl(parent, cfg);
+	mutex_unlock(&pfvf->qos.qos_lock);
+}
+
+static void otx2_qos_read_txschq_cfg_schq(struct otx2_qos_node *parent,
+					  struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *node;
+	int cnt;
+
+	list_for_each_entry(node, &parent->child_schq_list, list) {
+		cnt = cfg->dwrr_node_pos[node->level];
+		cfg->schq_list[node->level][cnt] = node->schq;
+		cfg->schq[node->level]++;
+		cfg->dwrr_node_pos[node->level]++;
+	}
+}
+
+static void otx2_qos_read_txschq_cfg_tl(struct otx2_qos_node *parent,
+					struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *node;
+	int cnt;
+
+	list_for_each_entry(node, &parent->child_list, list) {
+		otx2_qos_read_txschq_cfg_tl(node, cfg);
+		cnt = cfg->static_node_pos[node->level];
+		cfg->schq_contig_list[node->level][cnt] = node->schq;
+		cfg->schq_contig[node->level]++;
+		cfg->static_node_pos[node->level]++;
+		otx2_qos_read_txschq_cfg_schq(node, cfg);
+	}
+}
+
+static void otx2_qos_read_txschq_cfg(struct otx2_nic *pfvf,
+				     struct otx2_qos_node *node,
+				     struct otx2_qos_cfg *cfg)
+{
+	mutex_lock(&pfvf->qos.qos_lock);
+	otx2_qos_read_txschq_cfg_tl(node, cfg);
+	mutex_unlock(&pfvf->qos.qos_lock);
+}
+
+static struct otx2_qos_node *
+otx2_qos_alloc_root(struct otx2_nic *pfvf)
+{
+	struct otx2_qos_node *node;
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->parent = NULL;
+	if (!is_otx2_vf(pfvf->pcifunc))
+		node->level = NIX_TXSCH_LVL_TL1;
+	else
+		node->level = NIX_TXSCH_LVL_TL2;
+
+	WRITE_ONCE(node->qid, OTX2_QOS_QID_INNER);
+	node->classid = OTX2_QOS_ROOT_CLASSID;
+
+	hash_add_rcu(pfvf->qos.qos_hlist, &node->hlist, node->classid);
+	list_add_tail(&node->list, &pfvf->qos.qos_tree);
+	INIT_LIST_HEAD(&node->child_list);
+	INIT_LIST_HEAD(&node->child_schq_list);
+
+	return node;
+}
+
+static int otx2_qos_add_child_node(struct otx2_qos_node *parent,
+				   struct otx2_qos_node *node)
+{
+	struct list_head *head = &parent->child_list;
+	struct otx2_qos_node *tmp_node;
+	struct list_head *tmp;
+
+	for (tmp = head->next; tmp != head; tmp = tmp->next) {
+		tmp_node = list_entry(tmp, struct otx2_qos_node, list);
+		if (tmp_node->prio == node->prio)
+			return -EEXIST;
+		if (tmp_node->prio > node->prio) {
+			list_add_tail(&node->list, tmp);
+			return 0;
+		}
+	}
+
+	list_add_tail(&node->list, head);
+	return 0;
+}
+
+static int otx2_qos_alloc_txschq_node(struct otx2_nic *pfvf,
+				      struct otx2_qos_node *node)
+{
+	struct otx2_qos_node *txschq_node, *parent, *tmp;
+	int lvl;
+
+	parent = node;
+	for (lvl = node->level - 1; lvl >= NIX_TXSCH_LVL_MDQ; lvl--) {
+		txschq_node = kzalloc(sizeof(*txschq_node), GFP_KERNEL);
+		if (!txschq_node)
+			goto err_out;
+
+		txschq_node->parent = parent;
+		txschq_node->level = lvl;
+		txschq_node->classid = OTX2_QOS_CLASS_NONE;
+		WRITE_ONCE(txschq_node->qid, OTX2_QOS_QID_NONE);
+		txschq_node->rate = 0;
+		txschq_node->ceil = 0;
+		txschq_node->prio = 0;
+
+		mutex_lock(&pfvf->qos.qos_lock);
+		list_add_tail(&txschq_node->list, &node->child_schq_list);
+		mutex_unlock(&pfvf->qos.qos_lock);
+
+		INIT_LIST_HEAD(&txschq_node->child_list);
+		INIT_LIST_HEAD(&txschq_node->child_schq_list);
+		parent = txschq_node;
+	}
+
+	return 0;
+
+err_out:
+	list_for_each_entry_safe(txschq_node, tmp, &node->child_schq_list,
+				 list) {
+		list_del(&txschq_node->list);
+		kfree(txschq_node);
+	}
+	return -ENOMEM;
+}
+
+static struct otx2_qos_node *
+otx2_qos_sw_create_leaf_node(struct otx2_nic *pfvf,
+			     struct otx2_qos_node *parent,
+			     u16 classid, u32 prio, u64 rate, u64 ceil,
+			     u16 qid)
+{
+	struct otx2_qos_node *node;
+	int err;
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->parent = parent;
+	node->level = parent->level - 1;
+	node->classid = classid;
+	WRITE_ONCE(node->qid, qid);
+
+	node->rate = otx2_convert_rate(rate);
+	node->ceil = otx2_convert_rate(ceil);
+	node->prio = prio;
+
+	__set_bit(qid, pfvf->qos.qos_sq_bmap);
+
+	hash_add_rcu(pfvf->qos.qos_hlist, &node->hlist, classid);
+
+	mutex_lock(&pfvf->qos.qos_lock);
+	err = otx2_qos_add_child_node(parent, node);
+	if (err) {
+		mutex_unlock(&pfvf->qos.qos_lock);
+		return ERR_PTR(err);
+	}
+	mutex_unlock(&pfvf->qos.qos_lock);
+
+	INIT_LIST_HEAD(&node->child_list);
+	INIT_LIST_HEAD(&node->child_schq_list);
+
+	err = otx2_qos_alloc_txschq_node(pfvf, node);
+	if (err) {
+		otx2_qos_sw_node_delete(pfvf, node);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return node;
+}
+
+static struct otx2_qos_node *
+otx2_sw_node_find(struct otx2_nic *pfvf, u32 classid)
+{
+	struct otx2_qos_node *node = NULL;
+
+	hash_for_each_possible(pfvf->qos.qos_hlist, node, hlist, classid) {
+		if (node->classid == classid)
+			break;
+	}
+
+	return node;
+}
+
+static struct otx2_qos_node *
+otx2_sw_node_find_rcu(struct otx2_nic *pfvf, u32 classid)
+{
+	struct otx2_qos_node *node = NULL;
+
+	hash_for_each_possible_rcu(pfvf->qos.qos_hlist, node, hlist, classid) {
+		if (node->classid == classid)
+			break;
+	}
+
+	return node;
+}
+
+int otx2_get_txq_by_classid(struct otx2_nic *pfvf, u16 classid)
+{
+	struct otx2_qos_node *node;
+	u16 qid;
+	int res;
+
+	node = otx2_sw_node_find_rcu(pfvf, classid);
+	if (!node) {
+		res = -ENOENT;
+		goto out;
+	}
+	qid = READ_ONCE(node->qid);
+	if (qid == OTX2_QOS_QID_INNER) {
+		res = -EINVAL;
+		goto out;
+	}
+	res = pfvf->hw.tx_queues + qid;
+out:
+	return res;
+}
+
+static int
+otx2_qos_txschq_config(struct otx2_nic *pfvf, struct otx2_qos_node *node)
+{
+	struct mbox *mbox = &pfvf->mbox;
+	struct nix_txschq_config *req;
+	int rc;
+
+	mutex_lock(&mbox->lock);
+
+	req = otx2_mbox_alloc_msg_nix_txschq_cfg(&pfvf->mbox);
+	if (!req) {
+		mutex_unlock(&mbox->lock);
+		return -ENOMEM;
+	}
+
+	req->lvl = node->level;
+	__otx2_qos_txschq_cfg(pfvf, node, req);
+
+	rc = otx2_sync_mbox_msg(&pfvf->mbox);
+
+	mutex_unlock(&mbox->lock);
+
+	return rc;
+}
+
+static int otx2_qos_txschq_alloc(struct otx2_nic *pfvf,
+				 struct otx2_qos_cfg *cfg)
+{
+	struct nix_txsch_alloc_req *req;
+	struct nix_txsch_alloc_rsp *rsp;
+	struct mbox *mbox = &pfvf->mbox;
+	int lvl, rc, schq;
+
+	mutex_lock(&mbox->lock);
+	req = otx2_mbox_alloc_msg_nix_txsch_alloc(&pfvf->mbox);
+	if (!req) {
+		mutex_unlock(&mbox->lock);
+		return -ENOMEM;
+	}
+
+	for (lvl = 0; lvl < NIX_TXSCH_LVL_CNT; lvl++) {
+		req->schq[lvl] = cfg->schq[lvl];
+		req->schq_contig[lvl] = cfg->schq_contig[lvl];
+	}
+
+	rc = otx2_sync_mbox_msg(&pfvf->mbox);
+	if (rc) {
+		mutex_unlock(&mbox->lock);
+		return rc;
+	}
+
+	rsp = (struct nix_txsch_alloc_rsp *)
+	      otx2_mbox_get_rsp(&pfvf->mbox.mbox, 0, &req->hdr);
+
+	if (IS_ERR(rsp)) {
+		rc = PTR_ERR(rsp);
+		goto out;
+	}
+
+	for (lvl = 0; lvl < NIX_TXSCH_LVL_CNT; lvl++) {
+		for (schq = 0; schq < rsp->schq_contig[lvl]; schq++) {
+			cfg->schq_contig_list[lvl][schq] =
+				rsp->schq_contig_list[lvl][schq];
+		}
+	}
+
+	for (lvl = 0; lvl < NIX_TXSCH_LVL_CNT; lvl++) {
+		for (schq = 0; schq < rsp->schq[lvl]; schq++) {
+			cfg->schq_list[lvl][schq] =
+				rsp->schq_list[lvl][schq];
+		}
+	}
+
+	pfvf->qos.link_cfg_lvl = rsp->link_cfg_lvl;
+
+out:
+	mutex_unlock(&mbox->lock);
+	return rc;
+}
+
+static void otx2_qos_txschq_fill_cfg_schq(struct otx2_nic *pfvf,
+					  struct otx2_qos_node *node,
+					  struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *tmp;
+	int cnt;
+
+	list_for_each_entry(tmp, &node->child_schq_list, list) {
+		cnt = cfg->dwrr_node_pos[tmp->level];
+		tmp->schq = cfg->schq_list[tmp->level][cnt];
+		cfg->dwrr_node_pos[tmp->level]++;
+	}
+}
+
+static void otx2_qos_txschq_fill_cfg_tl(struct otx2_nic *pfvf,
+					struct otx2_qos_node *node,
+					struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *tmp;
+	int cnt;
+
+	list_for_each_entry(tmp, &node->child_list, list) {
+		otx2_qos_txschq_fill_cfg_tl(pfvf, tmp, cfg);
+		cnt = cfg->static_node_pos[tmp->level];
+		tmp->schq = cfg->schq_contig_list[tmp->level][cnt];
+		if (cnt == 0)
+			node->prio_anchor = tmp->schq;
+		cfg->static_node_pos[tmp->level]++;
+		otx2_qos_txschq_fill_cfg_schq(pfvf, tmp, cfg);
+	}
+}
+
+static void otx2_qos_txschq_fill_cfg(struct otx2_nic *pfvf,
+				     struct otx2_qos_node *node,
+				     struct otx2_qos_cfg *cfg)
+{
+	mutex_lock(&pfvf->qos.qos_lock);
+	otx2_qos_txschq_fill_cfg_tl(pfvf, node, cfg);
+	otx2_qos_txschq_fill_cfg_schq(pfvf, node, cfg);
+	mutex_unlock(&pfvf->qos.qos_lock);
+}
+
+static int otx2_qos_txschq_push_cfg_schq(struct otx2_nic *pfvf,
+					 struct otx2_qos_node *node,
+					 struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *tmp;
+	int ret;
+
+	list_for_each_entry(tmp, &node->child_schq_list, list) {
+		ret = otx2_qos_txschq_config(pfvf, tmp);
+		if (ret)
+			return -EIO;
+		ret = otx2_qos_txschq_set_parent_topology(pfvf, tmp->parent);
+		if (ret)
+			return -EIO;
+	}
+
+	return 0;
+}
+
+static int otx2_qos_txschq_push_cfg_tl(struct otx2_nic *pfvf,
+				       struct otx2_qos_node *node,
+				       struct otx2_qos_cfg *cfg)
+{
+	struct otx2_qos_node *tmp;
+	int ret;
+
+	list_for_each_entry(tmp, &node->child_list, list) {
+		ret = otx2_qos_txschq_push_cfg_tl(pfvf, tmp, cfg);
+		if (ret)
+			return -EIO;
+		ret = otx2_qos_txschq_config(pfvf, tmp);
+		if (ret)
+			return -EIO;
+		ret = otx2_qos_txschq_push_cfg_schq(pfvf, tmp, cfg);
+		if (ret)
+			return -EIO;
+	}
+
+	ret = otx2_qos_txschq_set_parent_topology(pfvf, node);
+	if (ret)
+		return -EIO;
+
+	return 0;
+}
+
+static int otx2_qos_txschq_push_cfg(struct otx2_nic *pfvf,
+				    struct otx2_qos_node *node,
+				    struct otx2_qos_cfg *cfg)
+{
+	int ret;
+
+	mutex_lock(&pfvf->qos.qos_lock);
+	ret = otx2_qos_txschq_push_cfg_tl(pfvf, node, cfg);
+	if (ret)
+		goto out;
+	ret = otx2_qos_txschq_push_cfg_schq(pfvf, node, cfg);
+out:
+	mutex_unlock(&pfvf->qos.qos_lock);
+	return ret;
+}
+
+static int otx2_qos_txschq_update_config(struct otx2_nic *pfvf,
+					 struct otx2_qos_node *node,
+					 struct otx2_qos_cfg *cfg)
+{
+	otx2_qos_txschq_fill_cfg(pfvf, node, cfg);
+
+	return otx2_qos_txschq_push_cfg(pfvf, node, cfg);
+}
+
+static int otx2_qos_txschq_update_root_cfg(struct otx2_nic *pfvf,
+					   struct otx2_qos_node *root,
+					   struct otx2_qos_cfg *cfg)
+{
+	root->schq = cfg->schq_list[root->level][0];
+	return otx2_qos_txschq_config(pfvf, root);
+}
+
+static void otx2_qos_free_cfg(struct otx2_nic *pfvf, struct otx2_qos_cfg *cfg)
+{
+	int lvl, idx, schq;
+
+	for (lvl = 0; lvl < NIX_TXSCH_LVL_CNT; lvl++) {
+		for (idx = 0; idx < cfg->schq[lvl]; idx++) {
+			schq = cfg->schq_list[lvl][idx];
+			otx2_txschq_free_one(pfvf, lvl, schq);
+		}
+	}
+
+	for (lvl = 0; lvl < NIX_TXSCH_LVL_CNT; lvl++) {
+		for (idx = 0; idx < cfg->schq_contig[lvl]; idx++) {
+			schq = cfg->schq_contig_list[lvl][idx];
+			otx2_txschq_free_one(pfvf, lvl, schq);
+		}
+	}
+}
+
+static void otx2_qos_enadis_sq(struct otx2_nic *pfvf,
+			       struct otx2_qos_node *node,
+			       u16 qid)
+{
+	if (pfvf->qos.qid_to_sqmap[qid] != OTX2_QOS_INVALID_SQ)
+		otx2_qos_disable_sq(pfvf, qid);
+
+	pfvf->qos.qid_to_sqmap[qid] = node->schq;
+	otx2_qos_enable_sq(pfvf, qid);
+}
+
+static void otx2_qos_update_smq_schq(struct otx2_nic *pfvf,
+				     struct otx2_qos_node *node,
+				     bool action)
+{
+	struct otx2_qos_node *tmp;
+
+	if (node->qid == OTX2_QOS_QID_INNER)
+		return;
+
+	list_for_each_entry(tmp, &node->child_schq_list, list) {
+		if (tmp->level == NIX_TXSCH_LVL_MDQ) {
+			if (action == QOS_SMQ_FLUSH)
+				otx2_smq_flush(pfvf, tmp->schq);
+			else
+				otx2_qos_enadis_sq(pfvf, tmp, node->qid);
+		}
+	}
+}
+
+static void __otx2_qos_update_smq(struct otx2_nic *pfvf,
+				  struct otx2_qos_node *node,
+				  bool action)
+{
+	struct otx2_qos_node *tmp;
+
+	list_for_each_entry(tmp, &node->child_list, list) {
+		__otx2_qos_update_smq(pfvf, tmp, action);
+		if (tmp->qid == OTX2_QOS_QID_INNER)
+			continue;
+		if (tmp->level == NIX_TXSCH_LVL_MDQ) {
+			if (action == QOS_SMQ_FLUSH)
+				otx2_smq_flush(pfvf, tmp->schq);
+			else
+				otx2_qos_enadis_sq(pfvf, tmp, tmp->qid);
+		} else {
+			otx2_qos_update_smq_schq(pfvf, tmp, action);
+		}
+	}
+}
+
+static void otx2_qos_update_smq(struct otx2_nic *pfvf,
+				struct otx2_qos_node *node,
+				bool action)
+{
+	mutex_lock(&pfvf->qos.qos_lock);
+	__otx2_qos_update_smq(pfvf, node, action);
+	otx2_qos_update_smq_schq(pfvf, node, action);
+	mutex_unlock(&pfvf->qos.qos_lock);
+}
+
+static int otx2_qos_push_txschq_cfg(struct otx2_nic *pfvf,
+				    struct otx2_qos_node *node,
+				    struct otx2_qos_cfg *cfg)
+{
+	int ret;
+
+	ret = otx2_qos_txschq_alloc(pfvf, cfg);
+	if (ret)
+		return -ENOSPC;
+
+	if (!(pfvf->netdev->flags & IFF_UP)) {
+		otx2_qos_txschq_fill_cfg(pfvf, node, cfg);
+		return 0;
+	}
+
+	ret = otx2_qos_txschq_update_config(pfvf, node, cfg);
+	if (ret) {
+		otx2_qos_free_cfg(pfvf, cfg);
+		return -EIO;
+	}
+
+	otx2_qos_update_smq(pfvf, node, QOS_CFG_SQ);
+
+	return 0;
+}
+
+static int otx2_qos_update_tree(struct otx2_nic *pfvf,
+				struct otx2_qos_node *node,
+				struct otx2_qos_cfg *cfg)
+{
+	otx2_qos_prepare_txschq_cfg(pfvf, node->parent, cfg);
+	return otx2_qos_push_txschq_cfg(pfvf, node->parent, cfg);
+}
+
+static int otx2_qos_root_add(struct otx2_nic *pfvf, u16 htb_maj_id, u16 htb_defcls,
+			     struct netlink_ext_ack *extack)
+{
+	struct otx2_qos_cfg *new_cfg;
+	struct otx2_qos_node *root;
+	int err;
+
+	netdev_dbg(pfvf->netdev,
+		   "TC_HTB_CREATE: handle=0x%x defcls=0x%x\n",
+		   htb_maj_id, htb_defcls);
+
+	root = otx2_qos_alloc_root(pfvf);
+	if (IS_ERR(root)) {
+		err = PTR_ERR(root);
+		return err;
+	}
+
+	/* allocate txschq queue */
+	new_cfg = kzalloc(sizeof(*new_cfg), GFP_KERNEL);
+	if (!new_cfg) {
+		NL_SET_ERR_MSG_MOD(extack, "Memory allocation error");
+		err = -ENOMEM;
+		goto free_root_node;
+	}
+	/* allocate htb root node */
+	new_cfg->schq[root->level] = 1;
+	err = otx2_qos_txschq_alloc(pfvf, new_cfg);
+	if (err) {
+		NL_SET_ERR_MSG_MOD(extack, "Error allocating txschq");
+		goto free_root_node;
+	}
+
+	if (!(pfvf->netdev->flags & IFF_UP) ||
+	    root->level == NIX_TXSCH_LVL_TL1) {
+		root->schq = new_cfg->schq_list[root->level][0];
+		goto out;
+	}
+
+	/* update the txschq configuration in hw */
+	err = otx2_qos_txschq_update_root_cfg(pfvf, root, new_cfg);
+	if (err) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Error updating txschq configuration");
+		goto txschq_free;
+	}
+
+out:
+	WRITE_ONCE(pfvf->qos.defcls, htb_defcls);
+	/* Pairs with smp_load_acquire() in ndo_select_queue */
+	smp_store_release(&pfvf->qos.maj_id, htb_maj_id);
+	kfree(new_cfg);
+	return 0;
+
+txschq_free:
+	otx2_qos_free_cfg(pfvf, new_cfg);
+free_root_node:
+	kfree(new_cfg);
+	otx2_qos_sw_node_delete(pfvf, root);
+	return err;
+}
+
+static int otx2_qos_root_destroy(struct otx2_nic *pfvf)
+{
+	struct otx2_qos_node *root;
+
+	netdev_dbg(pfvf->netdev, "TC_HTB_DESTROY\n");
+
+	/* find root node */
+	root = otx2_sw_node_find(pfvf, OTX2_QOS_ROOT_CLASSID);
+	if (!root)
+		return -ENOENT;
+
+	/* free the hw mappings */
+	otx2_qos_destroy_node(pfvf, root);
+
+	return 0;
+}
+
+static int otx2_qos_validate_configuration(struct otx2_qos_node *parent,
+					   struct netlink_ext_ack *extack,
+					   struct otx2_nic *pfvf,
+					   u64 prio)
+{
+	if (test_bit(prio, parent->prio_bmap)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Static priority child with same priority exists");
+		return -EEXIST;
+	}
+
+	if (prio == TXSCH_TL1_DFLT_RR_PRIO) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Priority is reserved for Round Robin");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int otx2_qos_leaf_alloc_queue(struct otx2_nic *pfvf, u16 classid,
+				     u32 parent_classid, u64 rate, u64 ceil,
+				     u64 prio, struct netlink_ext_ack *extack)
+{
+	struct otx2_qos_cfg *old_cfg, *new_cfg;
+	struct otx2_qos_node *node, *parent;
+	int qid, ret, err;
+
+	netdev_dbg(pfvf->netdev,
+		   "TC_HTB_LEAF_ALLOC_QUEUE: classid=0x%x parent_classid=0x%x rate=%lld ceil=%lld prio=%lld\n",
+		   classid, parent_classid, rate, ceil, prio);
+
+	if (prio > OTX2_QOS_MAX_PRIO) {
+		NL_SET_ERR_MSG_MOD(extack, "Valid priority range 0 to 7");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	/* get parent node */
+	parent = otx2_sw_node_find(pfvf, parent_classid);
+	if (!parent) {
+		NL_SET_ERR_MSG_MOD(extack, "parent node not found");
+		ret = -ENOENT;
+		goto out;
+	}
+	if (parent->level == NIX_TXSCH_LVL_MDQ) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB qos max levels reached");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	ret = otx2_qos_validate_configuration(parent, extack, pfvf, prio);
+	if (ret)
+		goto out;
+
+	set_bit(prio, parent->prio_bmap);
+
+	/* read current txschq configuration */
+	old_cfg = kzalloc(sizeof(*old_cfg), GFP_KERNEL);
+	if (!old_cfg) {
+		NL_SET_ERR_MSG_MOD(extack, "Memory allocation error");
+		ret = -ENOMEM;
+		goto reset_prio;
+	}
+	otx2_qos_read_txschq_cfg(pfvf, parent, old_cfg);
+
+	/* allocate a new sq */
+	qid = otx2_qos_get_qid(pfvf);
+	if (qid < 0) {
+		NL_SET_ERR_MSG_MOD(extack, "Reached max supported QOS SQ's");
+		ret = -ENOMEM;
+		goto free_old_cfg;
+	}
+
+	/* Actual SQ mapping will be updated after SMQ alloc */
+	pfvf->qos.qid_to_sqmap[qid] = OTX2_QOS_INVALID_SQ;
+
+	/* allocate and initialize a new child node */
+	node = otx2_qos_sw_create_leaf_node(pfvf, parent, classid, prio, rate,
+					    ceil, qid);
+	if (IS_ERR(node)) {
+		NL_SET_ERR_MSG_MOD(extack, "Unable to allocate leaf node");
+		ret = PTR_ERR(node);
+		goto free_old_cfg;
+	}
+
+	/* push new txschq config to hw */
+	new_cfg = kzalloc(sizeof(*new_cfg), GFP_KERNEL);
+	if (!new_cfg) {
+		NL_SET_ERR_MSG_MOD(extack, "Memory allocation error");
+		ret = -ENOMEM;
+		goto free_node;
+	}
+	ret = otx2_qos_update_tree(pfvf, node, new_cfg);
+	if (ret) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB HW configuration error");
+		kfree(new_cfg);
+		otx2_qos_sw_node_delete(pfvf, node);
+		/* restore the old qos tree */
+		err = otx2_qos_txschq_update_config(pfvf, parent, old_cfg);
+		if (err) {
+			netdev_err(pfvf->netdev,
+				   "Failed to restore txcshq configuration");
+			goto free_old_cfg;
+		}
+
+		otx2_qos_update_smq(pfvf, parent, QOS_CFG_SQ);
+		goto free_old_cfg;
+	}
+
+	/* update tx_real_queues */
+	otx2_qos_update_tx_netdev_queues(pfvf);
+
+	/* free new txschq config */
+	kfree(new_cfg);
+
+	/* free old txschq config */
+	otx2_qos_free_cfg(pfvf, old_cfg);
+	kfree(old_cfg);
+
+	return pfvf->hw.tx_queues + qid;
+
+free_node:
+	otx2_qos_sw_node_delete(pfvf, node);
+free_old_cfg:
+	kfree(old_cfg);
+reset_prio:
+	clear_bit(prio, parent->prio_bmap);
+out:
+	return ret;
+}
+
+static int otx2_qos_leaf_to_inner(struct otx2_nic *pfvf, u16 classid,
+				  u16 child_classid, u64 rate, u64 ceil, u64 prio,
+				  struct netlink_ext_ack *extack)
+{
+	struct otx2_qos_cfg *old_cfg, *new_cfg;
+	struct otx2_qos_node *node, *child;
+	int ret, err;
+	u16 qid;
+
+	netdev_dbg(pfvf->netdev,
+		   "TC_HTB_LEAF_TO_INNER classid %04x, child %04x, rate %llu, ceil %llu\n",
+		   classid, child_classid, rate, ceil);
+
+	if (prio > OTX2_QOS_MAX_PRIO) {
+		NL_SET_ERR_MSG_MOD(extack, "Valid priority range 0 to 7");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	/* find node related to classid */
+	node = otx2_sw_node_find(pfvf, classid);
+	if (!node) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB node not found");
+		ret = -ENOENT;
+		goto out;
+	}
+	/* check max qos txschq level */
+	if (node->level == NIX_TXSCH_LVL_MDQ) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB qos level not supported");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	set_bit(prio, node->prio_bmap);
+
+	/* store the qid to assign to leaf node */
+	qid = node->qid;
+
+	/* read current txschq configuration */
+	old_cfg = kzalloc(sizeof(*old_cfg), GFP_KERNEL);
+	if (!old_cfg) {
+		NL_SET_ERR_MSG_MOD(extack, "Memory allocation error");
+		ret = -ENOMEM;
+		goto reset_prio;
+	}
+	otx2_qos_read_txschq_cfg(pfvf, node, old_cfg);
+
+	/* delete the txschq nodes allocated for this node */
+	otx2_qos_free_sw_node_schq(pfvf, node);
+
+	/* mark this node as htb inner node */
+	WRITE_ONCE(node->qid, OTX2_QOS_QID_INNER);
+
+	/* allocate and initialize a new child node */
+	child = otx2_qos_sw_create_leaf_node(pfvf, node, child_classid,
+					     prio, rate, ceil, qid);
+	if (IS_ERR(child)) {
+		NL_SET_ERR_MSG_MOD(extack, "Unable to allocate leaf node");
+		ret = PTR_ERR(child);
+		goto free_old_cfg;
+	}
+
+	/* push new txschq config to hw */
+	new_cfg = kzalloc(sizeof(*new_cfg), GFP_KERNEL);
+	if (!new_cfg) {
+		NL_SET_ERR_MSG_MOD(extack, "Memory allocation error");
+		ret = -ENOMEM;
+		goto free_node;
+	}
+	ret = otx2_qos_update_tree(pfvf, child, new_cfg);
+	if (ret) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB HW configuration error");
+		kfree(new_cfg);
+		otx2_qos_sw_node_delete(pfvf, child);
+		/* restore the old qos tree */
+		WRITE_ONCE(node->qid, qid);
+		err = otx2_qos_alloc_txschq_node(pfvf, node);
+		if (err) {
+			netdev_err(pfvf->netdev,
+				   "Failed to restore old leaf node");
+			goto free_old_cfg;
+		}
+		err = otx2_qos_txschq_update_config(pfvf, node, old_cfg);
+		if (err) {
+			netdev_err(pfvf->netdev,
+				   "Failed to restore txcshq configuration");
+			goto free_old_cfg;
+		}
+		otx2_qos_update_smq(pfvf, node, QOS_CFG_SQ);
+		goto free_old_cfg;
+	}
+
+	/* free new txschq config */
+	kfree(new_cfg);
+
+	/* free old txschq config */
+	otx2_qos_free_cfg(pfvf, old_cfg);
+	kfree(old_cfg);
+
+	return 0;
+
+free_node:
+	otx2_qos_sw_node_delete(pfvf, child);
+free_old_cfg:
+	kfree(old_cfg);
+reset_prio:
+	clear_bit(prio, node->prio_bmap);
+out:
+	return ret;
+}
+
+static int otx2_qos_leaf_del(struct otx2_nic *pfvf, u16 *classid,
+			     struct netlink_ext_ack *extack)
+{
+	struct otx2_qos_node *node, *parent;
+	u64 prio;
+	u16 qid;
+
+	netdev_dbg(pfvf->netdev, "TC_HTB_LEAF_DEL classid %04x\n", *classid);
+
+	/* find node related to classid */
+	node = otx2_sw_node_find(pfvf, *classid);
+	if (!node) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB node not found");
+		return -ENOENT;
+	}
+	parent = node->parent;
+	prio   = node->prio;
+	qid    = node->qid;
+
+	otx2_qos_disable_sq(pfvf, node->qid);
+
+	otx2_qos_destroy_node(pfvf, node);
+	pfvf->qos.qid_to_sqmap[qid] = OTX2_QOS_INVALID_SQ;
+
+	clear_bit(prio, parent->prio_bmap);
+
+	return 0;
+}
+
+static int otx2_qos_leaf_del_last(struct otx2_nic *pfvf, u16 classid, bool force,
+				  struct netlink_ext_ack *extack)
+{
+	struct otx2_qos_node *node, *parent;
+	struct otx2_qos_cfg *new_cfg;
+	u64 prio;
+	int err;
+	u16 qid;
+
+	netdev_dbg(pfvf->netdev,
+		   "TC_HTB_LEAF_DEL_LAST classid %04x\n", classid);
+
+	/* find node related to classid */
+	node = otx2_sw_node_find(pfvf, classid);
+	if (!node) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB node not found");
+		return -ENOENT;
+	}
+
+	/* save qid for use by parent */
+	qid = node->qid;
+	prio = node->prio;
+
+	parent = otx2_sw_node_find(pfvf, node->parent->classid);
+	if (!parent) {
+		NL_SET_ERR_MSG_MOD(extack, "parent node not found");
+		return -ENOENT;
+	}
+
+	/* destroy the leaf node */
+	otx2_qos_destroy_node(pfvf, node);
+	pfvf->qos.qid_to_sqmap[qid] = OTX2_QOS_INVALID_SQ;
+
+	clear_bit(prio, parent->prio_bmap);
+
+	/* create downstream txschq entries to parent */
+	err = otx2_qos_alloc_txschq_node(pfvf, parent);
+	if (err) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB failed to create txsch configuration");
+		return err;
+	}
+	WRITE_ONCE(parent->qid, qid);
+	__set_bit(qid, pfvf->qos.qos_sq_bmap);
+
+	/* push new txschq config to hw */
+	new_cfg = kzalloc(sizeof(*new_cfg), GFP_KERNEL);
+	if (!new_cfg) {
+		NL_SET_ERR_MSG_MOD(extack, "Memory allocation error");
+		return -ENOMEM;
+	}
+	/* fill txschq cfg and push txschq cfg to hw */
+	otx2_qos_fill_cfg_schq(parent, new_cfg);
+	err = otx2_qos_push_txschq_cfg(pfvf, parent, new_cfg);
+	if (err) {
+		NL_SET_ERR_MSG_MOD(extack, "HTB HW configuration error");
+		kfree(new_cfg);
+		return err;
+	}
+	kfree(new_cfg);
+
+	/* update tx_real_queues */
+	otx2_qos_update_tx_netdev_queues(pfvf);
+
+	return 0;
+}
+
+void otx2_clean_qos_queues(struct otx2_nic *pfvf)
+{
+	struct otx2_qos_node *root;
+
+	root = otx2_sw_node_find(pfvf, OTX2_QOS_ROOT_CLASSID);
+	if (!root)
+		return;
+
+	otx2_qos_update_smq(pfvf, root, QOS_SMQ_FLUSH);
+}
+
+void otx2_qos_config_txschq(struct otx2_nic *pfvf)
+{
+	struct otx2_qos_node *root;
+	int err;
+
+	root = otx2_sw_node_find(pfvf, OTX2_QOS_ROOT_CLASSID);
+	if (!root)
+		return;
+
+	err = otx2_qos_txschq_config(pfvf, root);
+	if (err) {
+		netdev_err(pfvf->netdev, "Error update txschq configuration\n");
+		goto root_destroy;
+	}
+
+	err = otx2_qos_txschq_push_cfg_tl(pfvf, root, NULL);
+	if (err) {
+		netdev_err(pfvf->netdev, "Error update txschq configuration\n");
+		goto root_destroy;
+	}
+
+	otx2_qos_update_smq(pfvf, root, QOS_CFG_SQ);
+	return;
+
+root_destroy:
+	netdev_err(pfvf->netdev, "Failed to update Scheduler/Shaping config in Hardware\n");
+	/* Free resources allocated */
+	otx2_qos_root_destroy(pfvf);
+}
+
+int otx2_setup_tc_htb(struct net_device *ndev, struct tc_htb_qopt_offload *htb)
+{
+	struct otx2_nic *pfvf = netdev_priv(ndev);
+	int res;
+
+	switch (htb->command) {
+	case TC_HTB_CREATE:
+		return otx2_qos_root_add(pfvf, htb->parent_classid,
+					 htb->classid, htb->extack);
+	case TC_HTB_DESTROY:
+		return otx2_qos_root_destroy(pfvf);
+	case TC_HTB_LEAF_ALLOC_QUEUE:
+		res = otx2_qos_leaf_alloc_queue(pfvf, htb->classid,
+						htb->parent_classid,
+						htb->rate, htb->ceil,
+						htb->prio, htb->extack);
+		if (res < 0)
+			return res;
+		htb->qid = res;
+		return 0;
+	case TC_HTB_LEAF_TO_INNER:
+		return otx2_qos_leaf_to_inner(pfvf, htb->parent_classid,
+					      htb->classid, htb->rate,
+					      htb->ceil, htb->prio,
+					      htb->extack);
+	case TC_HTB_LEAF_DEL:
+		return otx2_qos_leaf_del(pfvf, &htb->classid, htb->extack);
+	case TC_HTB_LEAF_DEL_LAST:
+	case TC_HTB_LEAF_DEL_LAST_FORCE:
+		return otx2_qos_leaf_del_last(pfvf, htb->classid,
+				htb->command == TC_HTB_LEAF_DEL_LAST_FORCE,
+					      htb->extack);
+	case TC_HTB_LEAF_QUERY_QUEUE:
+		res = otx2_get_txq_by_classid(pfvf, htb->classid);
+		htb->qid = res;
+		return 0;
+	case TC_HTB_NODE_MODIFY:
+		fallthrough;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/qos.h b/drivers/net/ethernet/marvell/octeontx2/nic/qos.h
index 73a62d092e99..19773284be27 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/qos.h
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/qos.h
@@ -7,13 +7,63 @@
 #ifndef OTX2_QOS_H
 #define OTX2_QOS_H
 
+#include <linux/types.h>
+#include <linux/netdevice.h>
+#include <linux/rhashtable.h>
+
+#define OTX2_QOS_MAX_LVL		4
+#define OTX2_QOS_MAX_PRIO		7
 #define OTX2_QOS_MAX_LEAF_NODES                16
 
-int otx2_qos_enable_sq(struct otx2_nic *pfvf, int qidx, u16 smq);
-void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx, u16 mdq);
+enum qos_smq_operations {
+	QOS_CFG_SQ,
+	QOS_SMQ_FLUSH,
+};
+
+u64 otx2_get_txschq_rate_regval(struct otx2_nic *nic, u64 maxrate, u32 burst);
+
+int otx2_setup_tc_htb(struct net_device *ndev, struct tc_htb_qopt_offload *htb);
+int otx2_qos_get_qid(struct otx2_nic *pfvf);
+void otx2_qos_free_qid(struct otx2_nic *pfvf, int qidx);
+int otx2_qos_enable_sq(struct otx2_nic *pfvf, int qidx);
+void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx);
+
+struct otx2_qos_cfg {
+	u16 schq[NIX_TXSCH_LVL_CNT];
+	u16 schq_contig[NIX_TXSCH_LVL_CNT];
+	int static_node_pos[NIX_TXSCH_LVL_CNT];
+	int dwrr_node_pos[NIX_TXSCH_LVL_CNT];
+	u16 schq_contig_list[NIX_TXSCH_LVL_CNT][MAX_TXSCHQ_PER_FUNC];
+	u16 schq_list[NIX_TXSCH_LVL_CNT][MAX_TXSCHQ_PER_FUNC];
+};
 
 struct otx2_qos {
-	       u16 qid_to_sqmap[OTX2_QOS_MAX_LEAF_NODES];
-	};
+	DECLARE_HASHTABLE(qos_hlist, order_base_2(OTX2_QOS_MAX_LEAF_NODES));
+	struct mutex qos_lock; /* child list lock */
+	u16 qid_to_sqmap[OTX2_QOS_MAX_LEAF_NODES];
+	struct list_head qos_tree;
+	DECLARE_BITMAP(qos_sq_bmap, OTX2_QOS_MAX_LEAF_NODES);
+	u16 maj_id;
+	u16 defcls;
+	u8  link_cfg_lvl; /* LINKX_CFG CSRs mapped to TL3 or TL2's index ? */
+};
+
+struct otx2_qos_node {
+	struct list_head list; /* list management */
+	struct list_head child_list;
+	struct list_head child_schq_list;
+	struct hlist_node hlist;
+	DECLARE_BITMAP(prio_bmap, OTX2_QOS_MAX_PRIO + 1);
+	struct otx2_qos_node *parent;	/* parent qos node */
+	u64 rate; /* htb params */
+	u64 ceil;
+	u32 classid;
+	u32 prio;
+	u16 schq; /* hw txschq */
+	u16 qid;
+	u16 prio_anchor;
+	u8 level;
+};
+
 
 #endif
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
index e142d43f5a62..d96ed29c1567 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
@@ -217,7 +217,22 @@ static int otx2_qos_ctx_disable(struct otx2_nic *pfvf, u16 qidx, int aura_id)
 	return otx2_sync_mbox_msg(&pfvf->mbox);
 }
 
-int otx2_qos_enable_sq(struct otx2_nic *pfvf, int qidx, u16 smq)
+int otx2_qos_get_qid(struct otx2_nic *pfvf)
+{
+	int qidx;
+
+	qidx = find_first_zero_bit(pfvf->qos.qos_sq_bmap,
+				   pfvf->hw.tc_tx_queues);
+
+	return qidx == pfvf->hw.tc_tx_queues ? -ENOSPC : qidx;
+}
+
+void otx2_qos_free_qid(struct otx2_nic *pfvf, int qidx)
+{
+	clear_bit(qidx, pfvf->qos.qos_sq_bmap);
+}
+
+int otx2_qos_enable_sq(struct otx2_nic *pfvf, int qidx)
 {
 	struct otx2_hw *hw = &pfvf->hw;
 	int pool_id, sq_idx, err;
@@ -233,7 +248,6 @@ int otx2_qos_enable_sq(struct otx2_nic *pfvf, int qidx, u16 smq)
 		goto out;
 
 	pool_id = otx2_get_pool_idx(pfvf, AURA_NIX_SQ, sq_idx);
-	pfvf->qos.qid_to_sqmap[qidx] = smq;
 	err = otx2_sq_init(pfvf, sq_idx, pool_id);
 	if (err)
 		goto out;
@@ -242,7 +256,7 @@ int otx2_qos_enable_sq(struct otx2_nic *pfvf, int qidx, u16 smq)
 	return err;
 }
 
-void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx, u16 mdq)
+void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx)
 {
 	struct otx2_qset *qset = &pfvf->qset;
 	struct otx2_hw *hw = &pfvf->hw;
-- 
2.17.1

