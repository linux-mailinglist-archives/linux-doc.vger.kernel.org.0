Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D056C461C
	for <lists+linux-doc@lfdr.de>; Wed, 22 Mar 2023 10:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjCVJUP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Mar 2023 05:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjCVJUN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 05:20:13 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC490231F8;
        Wed, 22 Mar 2023 02:20:12 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M3vqnH020844;
        Wed, 22 Mar 2023 02:20:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=gwdIhPJepSWbraCIQ4kjZL2eELNF5fGWgjj88Mk05JI=;
 b=Cpc4IRIOAMl9FuzszFdZFAPcUcaHuPc6JD+C+HiQYFx11/vTepLLT3L8i2pCM+byfDUS
 kemCOf0WQdEm01xd5gOgv+Av5aW+x/QwAiUGqxE7Yvd0oDX/+kIjgki5Zc8dx3B5iJpg
 R/lqNXiSuzv6328kTEWQ5GYAOnMJToDz6lfJzvVNeZ3W3CYtj0qAiAjW5CW7iGpmaJBt
 VLOD70tkUvJJrMu24GA0O7E6OnHjbqsQIB5hq04vslRcpTQ4+Jq/9XpL+/CsiCMWFCHp
 0jK5gjI/a5BYnxmeJbw7GvtHL285J7hduCOAhA3wtDbXvOZxYZ3uOGPLFP4glpjRXPov mA== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3pft7uh1rx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 22 Mar 2023 02:20:07 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 02:20:05 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Wed, 22 Mar 2023 02:20:05 -0700
Received: from sburla-PowerEdge-T630.sclab.marvell.com (unknown [10.106.27.217])
        by maili.marvell.com (Postfix) with ESMTP id 7B2C25B6936;
        Wed, 22 Mar 2023 02:20:05 -0700 (PDT)
From:   Veerasenareddy Burru <vburru@marvell.com>
To:     <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <aayarekar@marvell.com>, <sedara@marvell.com>, <sburla@marvell.com>
CC:     <linux-doc@vger.kernel.org>,
        Veerasenareddy Burru <vburru@marvell.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v4 1/8] octeon_ep: defer probe if firmware not ready
Date:   Wed, 22 Mar 2023 02:19:50 -0700
Message-ID: <20230322091958.13103-2-vburru@marvell.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230322091958.13103-1-vburru@marvell.com>
References: <20230322091958.13103-1-vburru@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OaJr-6FqEos8C7UoFA_z1-x1X-aZPur3
X-Proofpoint-ORIG-GUID: OaJr-6FqEos8C7UoFA_z1-x1X-aZPur3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_06,2023-03-21_01,2023-02-09_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Defer probe if firmware is not ready for device usage.

Signed-off-by: Veerasenareddy Burru <vburru@marvell.com>
Signed-off-by: Abhijit Ayarekar <aayarekar@marvell.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
v3 -> v4:
 * address review comments
   https://lore.kernel.org/all/Y+vFlfakHj33DEkt@boxer/
   - fix return statement for get_fw_ready_status().

v2 -> v3:
 * fix review comments
   https://lore.kernel.org/all/Y4chWyR6qTlptkTE@unreal/
   - change get_fw_ready_status() to return bool
   - fix the success oriented flow while looking for
     PCI extended capability

v1 -> v2:
 * was scheduling workqueue task to wait for firmware ready,
   to probe/initialize the device.
 * now, removed the workqueue task; the probe returns EPROBE_DEFER,
   if firmware is not ready.
 * removed device status oct->status, as it is not required with the
   modified implementation.

 .../ethernet/marvell/octeon_ep/octep_main.c   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
index fdce78ceea87..0a50da52dc27 100644
--- a/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
+++ b/drivers/net/ethernet/marvell/octeon_ep/octep_main.c
@@ -1016,6 +1016,26 @@ static void octep_device_cleanup(struct octep_device *oct)
 	oct->conf = NULL;
 }
 
+static bool get_fw_ready_status(struct pci_dev *pdev)
+{
+	u32 pos = 0;
+	u16 vsec_id;
+	u8 status;
+
+	while ((pos = pci_find_next_ext_capability(pdev, pos,
+						   PCI_EXT_CAP_ID_VNDR))) {
+		pci_read_config_word(pdev, pos + 4, &vsec_id);
+#define FW_STATUS_VSEC_ID  0xA3
+		if (vsec_id != FW_STATUS_VSEC_ID)
+			continue;
+
+		pci_read_config_byte(pdev, (pos + 8), &status);
+		dev_info(&pdev->dev, "Firmware ready status = %u\n", status);
+		return status;
+	}
+	return false;
+}
+
 /**
  * octep_probe() - Octeon PCI device probe handler.
  *
@@ -1051,6 +1071,12 @@ static int octep_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
+	if (!get_fw_ready_status(pdev)) {
+		dev_notice(&pdev->dev, "Firmware not ready; defer probe.\n");
+		err = -EPROBE_DEFER;
+		goto err_alloc_netdev;
+	}
+
 	netdev = alloc_etherdev_mq(sizeof(struct octep_device),
 				   OCTEP_MAX_QUEUES);
 	if (!netdev) {
-- 
2.36.0

