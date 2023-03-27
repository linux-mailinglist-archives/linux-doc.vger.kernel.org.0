Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9DC6CA9A0
	for <lists+linux-doc@lfdr.de>; Mon, 27 Mar 2023 17:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbjC0Pzh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Mar 2023 11:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbjC0Pzf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Mar 2023 11:55:35 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54E72719;
        Mon, 27 Mar 2023 08:55:32 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32RE6LvA019377;
        Mon, 27 Mar 2023 15:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=pY/LLfD/hpa0lfcytqnmGd9KrthhI28TEQrPLcbONME=;
 b=lqjwM93v8yIdmJmoYKdGdj2gBeSjql7/pcsWUb7H9K0Cjn/3i3AAB9QE+XJuVFfvmFZ8
 pqFh690hORw9ZTIyU4E/61tugJ3NjS2Jn/K2qOyqdvrqvY70BFO9PHw6reesqmSjQNL+
 qIRc+ztd1HW/kgCy7WzBjVOOwuIBlccUBkwDwMbwvTNtTiUWii3lkN7cvu8YyZgIgIoB
 Z9zZgaZEzmeZA+OFYa6h3uYDmVoxEVEG6S3Lj1oHzj8bJ3wniDlrw/zWLqe6lKMrFT3C
 ZklfwgsiseqUgVIqltGT3gJBgJcduv3YKNnw9PRIjaltykWPmTf8qjYUTVVZYB03e9/N ew== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkcm2rc2e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 15:55:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32RFtBtM024080
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 15:55:11 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Mar 2023 08:55:10 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC:     <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <bagasdotme@gmail.com>, <mani@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v5 0/8] QAIC accel driver
Date:   Mon, 27 Mar 2023 09:54:49 -0600
Message-ID: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FvYEwFNZbjJ8cIAwUoJWPl-DafpXon4A
X-Proofpoint-GUID: FvYEwFNZbjJ8cIAwUoJWPl-DafpXon4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=721 bulkscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270127
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series introduces a driver under the accel subsystem (QAIC -
Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
a PCIe adapter card that hosts a dedicated machine learning inference
accelerator.

The previous version (v4) can be found at:
https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com/

v5:
-Drop version.h in mhi_qaic_cntl
-Remove DRM_RENDER_ALLOW on ioctls
-Use div_u64 in qaic_data for 32-bit architectures
-Documentation formatting changes
-cntl->cntrl for mhi controller instances
-char->u8 in mhi_controller

v4:
-Whitespace fixes
-Add MODULE_PARM_DESC for the module parameters
-Refactor qaic_open error handling
-Shorten mhi boot error message
-Remove extranious reset check
-Remove _ prefix in qaic_control structs
-Refactor encode_dma()
-Refactor __qaic_execute_bo_ioctl
-Remove extraniuous open_count checks
-List drm-misc tree in MAINTAINERS

v3:
-Various style updates and word smithing
-Remove unused function declarations
-Drop iommu workaround for sg lists and outdated reserve_pages()
-Remove unnecessary includes
-Refactor qaic_pci_probe()
-Use FIELD_PREP for ENCODE_SEM
-Gate qaic subdirectory on the kconfig symbol
-Add dri-devel@lists.freedesktop.org to MAINTAINERS entry
-Rename copy_sgt()
-Correct guard macro for qaic.h and cplusplus macro
-Add comment in qaic_mhi_remove
-Fix qaic_open use after free
-Use devm allocs in qaic_mhi_register_controller()
-Remove partition device ioctl.

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
 Documentation/accel/qaic/aic100.rst |  510 ++++++++++
 Documentation/accel/qaic/index.rst  |   13 +
 Documentation/accel/qaic/qaic.rst   |  170 ++++
 MAINTAINERS                         |   10 +
 drivers/accel/Kconfig               |    1 +
 drivers/accel/Makefile              |    1 +
 drivers/accel/qaic/Kconfig          |   23 +
 drivers/accel/qaic/Makefile         |   13 +
 drivers/accel/qaic/mhi_controller.c |  563 +++++++++++
 drivers/accel/qaic/mhi_controller.h |   16 +
 drivers/accel/qaic/mhi_qaic_ctrl.c  |  570 +++++++++++
 drivers/accel/qaic/mhi_qaic_ctrl.h  |   12 +
 drivers/accel/qaic/qaic.h           |  282 ++++++
 drivers/accel/qaic/qaic_control.c   | 1527 ++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_data.c      | 1903 +++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_drv.c       |  647 ++++++++++++
 include/uapi/drm/qaic_accel.h       |  397 ++++++++
 18 files changed, 6659 insertions(+)
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

