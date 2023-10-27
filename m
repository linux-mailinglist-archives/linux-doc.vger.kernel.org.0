Return-Path: <linux-doc+bounces-1282-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7EF7D910E
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 10:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E07281FC5
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 08:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA0113FF5;
	Fri, 27 Oct 2023 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="4Kpy5f/I"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9EE1401D
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:19:19 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A32CD4D;
	Fri, 27 Oct 2023 01:19:15 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5i7VK020414;
	Fri, 27 Oct 2023 08:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=DXSUD6D4gKvGLEozl2neVPvk09OeuaDfgn2a+Uvpugo=;
 b=4Kpy5f/I89OCxsliZBqE9SKvfTop/EnnMkIkvl+APmvoLPgZZjNDz/qV3LdF83fRv2M3
 pmYakKDxbAutVzK+IIjgrn40F/FqJgDVlvyPavy34fgyAdj6dFYy1jmLOiVKONxeYCGt
 EKZVTMgEqfGs8ggYWyyTa0bxtUmiUyFLV8GH1gLqxumxydAFeI6AC8NxX2L5mjNQWSxE
 nYTc43XbG9bH/rsF2vQRdYd35P1d5Ce9kgGsDRYO2hzCemIzeiPPP8nFgoFr1fq9gPp7
 76sCvrZvinMeb8UX7YMBMQxGxHqA7brRPlXQW1aZet5GdCp0bZRyHy9bZouUrlGIo2YI TA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tyxge0vaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:19:09 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R6Jdh0009176;
	Fri, 27 Oct 2023 08:19:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjebfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:19:08 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9b028975;
	Fri, 27 Oct 2023 08:19:08 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-10;
	Fri, 27 Oct 2023 08:19:08 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>, linux-media@vger.kernel.org
Subject: [PATCH RFC 09/11] media: doc: properly format ToC headings
Date: Fri, 27 Oct 2023 10:18:28 +0200
Message-Id: <20231027081830.195056-10-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027081830.195056-1-vegard.nossum@oracle.com>
References: <20231027081830.195056-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_06,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310270071
X-Proofpoint-GUID: E4AH135QpSPthVEXi7VDe67BysDZfm3d
X-Proofpoint-ORIG-GUID: E4AH135QpSPthVEXi7VDe67BysDZfm3d

"class:: toc-title" was a workaround for older Sphinx versions that are
no longer supported.

The canonical way to add a heading to the ToC is to use :caption:.
Do that.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/userspace-api/media/cec/cec-api.rst          | 7 +------
 Documentation/userspace-api/media/drivers/index.rst        | 7 +------
 Documentation/userspace-api/media/dvb/dvbapi.rst           | 7 +------
 Documentation/userspace-api/media/index.rst                | 7 +------
 .../userspace-api/media/mediactl/media-controller.rst      | 7 +------
 .../userspace-api/media/rc/remote_controllers.rst          | 7 +------
 Documentation/userspace-api/media/v4l/v4l2.rst             | 7 +------
 7 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-api.rst b/Documentation/userspace-api/media/cec/cec-api.rst
index 4d229ed8a1d9..578303d484f3 100644
--- a/Documentation/userspace-api/media/cec/cec-api.rst
+++ b/Documentation/userspace-api/media/cec/cec-api.rst
@@ -10,13 +10,8 @@ Part V - Consumer Electronics Control API
 This part describes the CEC: Consumer Electronics Control
 
 
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+    :caption: Table of Contents
     :maxdepth: 5
     :numbered:
 
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 6708d649afd7..d4338dc506dd 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -21,13 +21,8 @@ more details.
 
 For more details see the file COPYING in the source distribution of Linux.
 
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+	:caption: Table of Contents
 	:maxdepth: 5
 	:numbered:
 
diff --git a/Documentation/userspace-api/media/dvb/dvbapi.rst b/Documentation/userspace-api/media/dvb/dvbapi.rst
index 1dda69343f34..4ac0c1bc54ca 100644
--- a/Documentation/userspace-api/media/dvb/dvbapi.rst
+++ b/Documentation/userspace-api/media/dvb/dvbapi.rst
@@ -27,13 +27,8 @@ Part II - Digital TV API
 
 **Version 5.10**
 
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+    :caption: Table of Contents
     :maxdepth: 5
     :numbered:
 
diff --git a/Documentation/userspace-api/media/index.rst b/Documentation/userspace-api/media/index.rst
index d839904be085..337ef6c7c47f 100644
--- a/Documentation/userspace-api/media/index.rst
+++ b/Documentation/userspace-api/media/index.rst
@@ -21,13 +21,8 @@ Documentation/driver-api/media/index.rst
     media devices;
 
 
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+    :caption: Table of Contents
     :maxdepth: 1
 
     intro
diff --git a/Documentation/userspace-api/media/mediactl/media-controller.rst b/Documentation/userspace-api/media/mediactl/media-controller.rst
index 508dd693bf6c..73a87f82f92d 100644
--- a/Documentation/userspace-api/media/mediactl/media-controller.rst
+++ b/Documentation/userspace-api/media/mediactl/media-controller.rst
@@ -7,13 +7,8 @@
 Part IV - Media Controller API
 ##############################
 
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+    :caption: Table of Contents
     :maxdepth: 5
     :numbered:
 
diff --git a/Documentation/userspace-api/media/rc/remote_controllers.rst b/Documentation/userspace-api/media/rc/remote_controllers.rst
index f89291838637..483f9ae92a90 100644
--- a/Documentation/userspace-api/media/rc/remote_controllers.rst
+++ b/Documentation/userspace-api/media/rc/remote_controllers.rst
@@ -7,13 +7,8 @@
 Part III - Remote Controller API
 ################################
 
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+    :caption: Table of Contents
     :maxdepth: 5
     :numbered:
 
diff --git a/Documentation/userspace-api/media/v4l/v4l2.rst b/Documentation/userspace-api/media/v4l/v4l2.rst
index ad7a2bf0cf26..cf8ae56a008c 100644
--- a/Documentation/userspace-api/media/v4l/v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2.rst
@@ -11,13 +11,8 @@ This part describes the Video for Linux API version 2 (V4L2 API) specification.
 
 **Revision 4.5**
 
-.. only:: html
-
-   .. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+    :caption: Table of Contents
     :numbered:
     :maxdepth: 5
 
-- 
2.34.1


