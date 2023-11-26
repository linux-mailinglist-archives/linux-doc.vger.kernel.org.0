Return-Path: <linux-doc+bounces-3124-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D17F9185
	for <lists+linux-doc@lfdr.de>; Sun, 26 Nov 2023 07:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5860528120D
	for <lists+linux-doc@lfdr.de>; Sun, 26 Nov 2023 06:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD8D3FE4;
	Sun, 26 Nov 2023 06:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CLYhTMfy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314F8E4;
	Sat, 25 Nov 2023 22:08:38 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AQ62oWC001113;
	Sun, 26 Nov 2023 06:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=5akeRdGBH0Gei6ryYFUrDZ30FvI2MMkj0LH1ePIIkPw=;
 b=CLYhTMfyZTz1ueNf0tLIfzK3YKEdl9kisbST62bAlYmQK3ZwT6koIbZUvspM4VqnLHR2
 xiymWzzx3HlynWTYME6QN+I0pcb/G5BdU4J/LSTD3+4W8eYLVHlbvA0jhIwbYNzXsrz4
 tPLsOPciW+/MGOGdymeILyz8YDNIRjvv6Pezp4keywREiZn1egJ0Kpc2RYzE22AF/UEY
 zRzLg2H+pecBJPD5v9SzMsMMaFbsmttbKp2ESK7eGPIbYHUGJ9CGJKZK0xVg+kVScuI+
 V7XGSyR0V1DAYY7KxNeUb437KiTRk0hGnH2L5fsBA74MjznhjnEuk2NvFPRsxek3bGag PA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk8h8hsjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Nov 2023 06:08:09 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AQ688W7024506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Nov 2023 06:08:08 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 25 Nov 2023 22:08:04 -0800
From: Luo Jie <quic_luoj@quicinc.com>
To: <andrew@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <corbet@lwn.net>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v6 0/6] add qca8084 ethernet phy driver
Date: Sun, 26 Nov 2023 14:07:26 +0800
Message-ID: <20231126060732.31764-1-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AJoocCCCaCLmBEODcVVnZ-AjEYznKAJH
X-Proofpoint-GUID: AJoocCCCaCLmBEODcVVnZ-AjEYznKAJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-26_04,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=574 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311260042

QCA8084 is four-port PHY with maximum link capability 2.5G,
which supports the interface mode qusgmii and sgmii mode,
there are two PCSs available to connected with ethernet port.

QCA8084 can work in switch mode or PHY mode.
For switch mode, both PCS0 and PCS1 work on sgmii mode.
For PHY mode, PCS1 works on qusgmii mode.
The fourth PHY connected with PCS0 works on sgmii mode.

Besides this PHY driver patches, the PCS driver is also needed
to bring up the qca8084 device, which mainly configurs PCS
and clocks.

Changes in v3:
	* pick the two patches to introduce the interface mode
	  10g-qxgmii from Vladimir Oltean(olteanv@gmail.com).
	* add the function phydev_id_is_qca808x to identify the
	  PHY qca8081 and qca8084.
	* update the interface mode name PHY_INTERFACE_MODE_QUSGMII
	  to PHY_INTERFACE_MODE_10G_QXGMII.

Changes in v4:
	* remove the following patch:
	  <net: phylink: move phylink_pcs_neg_mode() to phylink.c>.
	* split out 10g_qxgmii change of ethernet-controller.yaml.

Changes in v5:
	* update the author of the patch below.
	  <introduce core support for phy-mode = "10g-qxgmii">.

Changes in v6:
	* drop the "inline" keyword.
	* apply the patches with "--max-line-length=80".

Luo Jie (4):
  net: phy: at803x: add QCA8084 ethernet phy support
  net: phy: at803x: add the function phydev_id_is_qca808x
  net: phy: at803x: Add qca8084_config_init function
  net: phy: qca8084: add qca8084_link_change_notify

Vladimir Oltean (2):
  net: phy: introduce core support for phy-mode = "10g-qxgmii"
  dt-bindings: net: ethernet-controller: add 10g-qxgmii mode

 .../bindings/net/ethernet-controller.yaml     |   1 +
 Documentation/networking/phy.rst              |   6 +
 drivers/net/phy/at803x.c                      | 139 +++++++++++++++++-
 drivers/net/phy/phy-core.c                    |   1 +
 drivers/net/phy/phylink.c                     |  11 +-
 include/linux/phy.h                           |   4 +
 include/linux/phylink.h                       |   2 +
 7 files changed, 156 insertions(+), 8 deletions(-)


base-commit: 8c9660f6515396aba78d1168d2e17951d653ebf2
-- 
2.42.0


