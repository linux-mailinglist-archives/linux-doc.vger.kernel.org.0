Return-Path: <linux-doc+bounces-2581-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A74597EFE15
	for <lists+linux-doc@lfdr.de>; Sat, 18 Nov 2023 07:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D25F1F23788
	for <lists+linux-doc@lfdr.de>; Sat, 18 Nov 2023 06:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D9FEAD5;
	Sat, 18 Nov 2023 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IWkR7wxQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2ECD5C;
	Fri, 17 Nov 2023 22:28:35 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AI5xVLM019281;
	Sat, 18 Nov 2023 06:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=xoUh7MWwDswQU0Qbcu6kSaukCEbi0jZ75coOg98MRMg=;
 b=IWkR7wxQNF3xF/1TAV2J/lWHvc4BWLEpC38PnuSPPIagj6iWOUCdKqEDi+s6ISzdiRFP
 qQLPM2UlL29yJMB0BZ7VOIxIUFINkyvDNs3EIuCDq9Vv3RLbtqyQxdzgOYUR/nJrD97k
 a6bDjYkvpVbFndA1K4U66OTky+IeRuZZkRGnJUAiMdoCJYpX4IBfW1jI062N/LCp3dNI
 7IxivIvph565VhG0XX6tOhoW0MuodtE10kxTpsEHFgztaQOCpyqKkqelLPmavlGwla0T
 0Q74UtsABnMOftsbj/P6NUFg3Iw89GP5ORFWneEq/SgGPQLe5SB3lBW6h94EyvretN3X BQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uem80g8s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 06:28:25 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AI6SOSN001344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Nov 2023 06:28:24 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 22:28:21 -0800
From: Luo Jie <quic_luoj@quicinc.com>
To: <andrew@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <corbet@lwn.net>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v5 5/6] net: phy: at803x: Add qca8084_config_init function
Date: Sat, 18 Nov 2023 14:27:53 +0800
Message-ID: <20231118062754.2453-6-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118062754.2453-1-quic_luoj@quicinc.com>
References: <20231118062754.2453-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -Gic8IksuMB6moj_hsRoU1j51Q3Qc3CP
X-Proofpoint-ORIG-GUID: -Gic8IksuMB6moj_hsRoU1j51Q3Qc3CP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-18_04,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311180045

Configure MSE detect threshold and ADC clock edge invert.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/at803x.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index f56202f5944d..06a068ca5539 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -280,6 +280,15 @@
 #define QCA8081_PHY_SERDES_MMD1_FIFO_CTRL	0x9072
 #define QCA8081_PHY_FIFO_RSTN			BIT(11)
 
+/* QCA8084 ADC clock edge */
+#define QCA8084_ADC_CLK_SEL			0x8b80
+#define QCA8084_ADC_CLK_SEL_ACLK		GENMASK(7, 4)
+#define QCA8084_ADC_CLK_SEL_ACLK_FALL		0xf
+#define QCA8084_ADC_CLK_SEL_ACLK_RISE		0x0
+
+#define QCA8084_MSE_THRESHOLD			0x800a
+#define QCA8084_MSE_THRESHOLD_2P5G_VAL		0x51c6
+
 MODULE_DESCRIPTION("Qualcomm Atheros AR803x and QCA808X PHY driver");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_LICENSE("GPL");
@@ -2083,6 +2092,23 @@ static void qca808x_link_change_notify(struct phy_device *phydev)
 			QCA8081_PHY_FIFO_RSTN, phydev->link ? QCA8081_PHY_FIFO_RSTN : 0);
 }
 
+static int qca8084_config_init(struct phy_device *phydev)
+{
+	int ret;
+
+	/* Invert ADC clock edge */
+	ret = at803x_debug_reg_mask(phydev, QCA8084_ADC_CLK_SEL,
+				    QCA8084_ADC_CLK_SEL_ACLK,
+				    FIELD_PREP(QCA8084_ADC_CLK_SEL_ACLK,
+					       QCA8084_ADC_CLK_SEL_ACLK_FALL));
+	if (ret < 0)
+		return ret;
+
+	/* Adjust MSE threshold value to avoid link issue with some link partner */
+	return phy_write_mmd(phydev, MDIO_MMD_PMAPMD,
+			     QCA8084_MSE_THRESHOLD, QCA8084_MSE_THRESHOLD_2P5G_VAL);
+}
+
 static struct phy_driver at803x_driver[] = {
 {
 	/* Qualcomm Atheros AR8035 */
@@ -2280,6 +2306,7 @@ static struct phy_driver at803x_driver[] = {
 	.soft_reset		= qca808x_soft_reset,
 	.cable_test_start	= qca808x_cable_test_start,
 	.cable_test_get_status	= qca808x_cable_test_get_status,
+	.config_init		= qca8084_config_init,
 }, };
 
 module_phy_driver(at803x_driver);
-- 
2.42.0


