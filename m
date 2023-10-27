Return-Path: <linux-doc+bounces-1280-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B327D910B
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 10:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF738281EE6
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ED813FF5;
	Fri, 27 Oct 2023 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="otszQ7Dw"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE16C13FFE
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:19:12 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0AED64;
	Fri, 27 Oct 2023 01:19:10 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5iCp3020795;
	Fri, 27 Oct 2023 08:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=90EykabD4ky8gN9ceDHoX9V0x2ufhKNuMutQG/mnc40=;
 b=otszQ7DwOSf2+NOtAFNw48W3FqanZs6xgE7Lqn03+ddKvQ1OtkxLNhK8oB3SZoDJXS8Q
 Lo6+c4wNJElWfPwQdhuWN/5R8WmvwCsIK1nMtm9szG7BNC76OWZFAcy3mjs0mEebuK5H
 mEUD4H3FiNjb2Zn4jwl7Nl2YpixAlBOmyfVoofPGltlImUVgoD3EHx0yKAXD6E7abG+f
 o2AS6Cs9UApu/9e6BAul2LOXLm9q0hkmEunfR+wS8zSvTDp/R173YcPUtphvRg2Rz2KH
 lCSP7BTQkxG4DfV+d7gIoxiFkRSDuDDYDUHqSemBMe6uYXzFR/fec6ody5H0pZmsOZcy 5w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tyx4tgx09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:57 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R678mw009213;
	Fri, 27 Oct 2023 08:18:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjebas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:56 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9T028975;
	Fri, 27 Oct 2023 08:18:55 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-6;
	Fri, 27 Oct 2023 08:18:55 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        gaochao <gaochao49@huawei.com>, Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>, Fangrui Song <maskray@google.com>,
        Wan Jiabing <wanjiabing@vivo.com>, Alex Shi <alexs@kernel.org>
Subject: [PATCH RFC 05/11] Documentation: dev-tools: properly format ToC headingss
Date: Fri, 27 Oct 2023 10:18:24 +0200
Message-Id: <20231027081830.195056-6-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027081830.195056-1-vegard.nossum@oracle.com>
References: <20231027081830.195056-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_06,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310270071
X-Proofpoint-GUID: fT_Oghynhwp9KiRAAPgCQEmUF9l74s6b
X-Proofpoint-ORIG-GUID: fT_Oghynhwp9KiRAAPgCQEmUF9l74s6b

"class:: toc-title" was a workaround for older Sphinx versions that are
no longer supported.

The canonical way to add a heading to the ToC is to use :caption:.
Do that.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: gaochao <gaochao49@huawei.com>
Cc: Yanteng Si <siyanteng@loongson.cn>
Cc: Wu XiangCheng <bobwxc@email.cn>
Cc: Fangrui Song <maskray@google.com>
Cc: Wan Jiabing <wanjiabing@vivo.com>
Cc: Alex Shi <alexs@kernel.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/dev-tools/index.rst                    | 5 +----
 Documentation/translations/zh_CN/dev-tools/index.rst | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 6b0663075dc0..3d2286c683bc 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -10,11 +10,8 @@ whole; patches welcome!
 A brief overview of testing-specific tools can be found in
 Documentation/dev-tools/testing-overview.rst
 
-.. class:: toc-title
-
-	   Table of contents
-
 .. toctree::
+   :caption: Table of contents
    :maxdepth: 2
 
    testing-overview
diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
index 02577c379007..c2db3e566b1b 100644
--- a/Documentation/translations/zh_CN/dev-tools/index.rst
+++ b/Documentation/translations/zh_CN/dev-tools/index.rst
@@ -14,11 +14,8 @@
 有关测试专用工具的简要概述，参见
 Documentation/translations/zh_CN/dev-tools/testing-overview.rst
 
-.. class:: toc-title
-
-	   目录
-
 .. toctree::
+   :caption: 目录
    :maxdepth: 2
 
    testing-overview
-- 
2.34.1


