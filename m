Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA6368C2BC
	for <lists+linux-doc@lfdr.de>; Mon,  6 Feb 2023 17:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbjBFQN5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Feb 2023 11:13:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbjBFQNg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 11:13:36 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC78B2A994;
        Mon,  6 Feb 2023 08:13:15 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316C0PhC015227;
        Mon, 6 Feb 2023 15:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=lXF/rNvlyElCUh8Y3twha6RuV32W6dBQ0Klr8IIYMvg=;
 b=Gn46WYZs/s+axc6bbT8kFA6sPRyOMNWRigSeCTnzbDWWHdYe1nAapQorfbsDWudbTFQa
 n18RwxpjLxslWElA9DfEReWZBbpCs3fFQWTaGOLkXE+fCl9BcW7XsjA+mM0inb1SN6lu
 U+DE238tzvy5yPdPoCBRtiMB5tpiEyaADWE+P0eJMv3a5urv+HOVUgaHUMWYmliOGbTG
 upjOtvhqM+uzd4ipk++dEF16Gr7Z3tV8tnc26sOd5PyuS3kMaE4S4Dj+y6AZIRKw56/f
 VQzkXt6RXHN86fwfA9K+laDfNlqFwQaAzgwedQ/KTM0quCd9Hmwz3CJT1aIUHD1jBuVS Yg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhff2m17v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Feb 2023 15:42:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316Fg8gk021200
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Feb 2023 15:42:08 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Feb 2023 07:42:07 -0800
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC:     <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@qti.qualcomm.com>
Subject: [PATCH v2 0/8] QAIC accel driver
Date:   Mon, 6 Feb 2023 08:41:37 -0700
Message-ID: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rCZPYX2tyLX9kVyXtwd7NsRHqq1VwVAT
X-Proofpoint-GUID: rCZPYX2tyLX9kVyXtwd7NsRHqq1VwVAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=698
 suspectscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060135
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jeffrey Hugo <jhugo@qti.qualcomm.com>

This series introduces a driver under the accel subsystem (QAIC -
Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
a PCIe adapter card that hosts a dedicated machine learning inference
accelerator.

Regarding the open userspace (see the documentation patch), the UMD and
compiler are a week or so away from being posted in the indicated repos.
Just need to polish some documentation.

The previous version (RFC) can be found at:
https://lore.kernel.org/all/1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com/

v2:
-Addressed comments from RFC
-Reduced the code to the core minimum by dropping telemetery, etc
-Conversion to accel subsystem
-Dropped versioning
-Add mhi_qaic_cntl component
-Restructure the documentation
-Pull in a few fixes from the downstream tree

Jeffrey Hugo (7):
  accel/qaic: Add documentation for AIC100 accelerator driver
  accel/qaic: Add uapi and core driver file
  accel/qaic: Add MHI controller
  accel/qaic: Add control path
  accel/qaic: Add datapath
  accel/qaic: Add qaic driver to the build system
  MAINTAINERS: Add entry for QAIC driver

Pranjal Ramajor Asha Kanojiya (1):
  accel/qaic: Add mhi_qaic_cntl

 Documentation/accel/index.rst       |    1 +
 Documentation/accel/qaic/aic100.rst |  498 +++++++++
 Documentation/accel/qaic/index.rst  |   13 +
 Documentation/accel/qaic/qaic.rst   |  169 +++
 MAINTAINERS                         |    8 +
 drivers/accel/Kconfig               |    1 +
 drivers/accel/Makefile              |    1 +
 drivers/accel/qaic/Kconfig          |   23 +
 drivers/accel/qaic/Makefile         |   13 +
 drivers/accel/qaic/mhi_controller.c |  576 +++++++++++
 drivers/accel/qaic/mhi_controller.h |   19 +
 drivers/accel/qaic/mhi_qaic_ctrl.c  |  586 +++++++++++
 drivers/accel/qaic/mhi_qaic_ctrl.h  |   11 +
 drivers/accel/qaic/qaic.h           |  321 ++++++
 drivers/accel/qaic/qaic_control.c   | 1656 +++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_data.c      | 1952 +++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_drv.c       |  771 ++++++++++++++
 include/uapi/drm/qaic_accel.h       |  283 +++++
 18 files changed, 6902 insertions(+)
 create mode 100644 Documentation/accel/qaic/aic100.rst
 create mode 100644 Documentation/accel/qaic/index.rst
 create mode 100644 Documentation/accel/qaic/qaic.rst
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile
 create mode 100644 drivers/accel/qaic/mhi_controller.c
 create mode 100644 drivers/accel/qaic/mhi_controller.h
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
 create mode 100644 drivers/accel/qaic/qaic.h
 create mode 100644 drivers/accel/qaic/qaic_control.c
 create mode 100644 drivers/accel/qaic/qaic_data.c
 create mode 100644 drivers/accel/qaic/qaic_drv.c
 create mode 100644 include/uapi/drm/qaic_accel.h

-- 
2.7.4

