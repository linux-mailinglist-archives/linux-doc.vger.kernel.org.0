Return-Path: <linux-doc+bounces-1278-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49D7D9105
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 10:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CED4B1C21019
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 08:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66271401D;
	Fri, 27 Oct 2023 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vg/5HBbf"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642C413FFE
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:19:00 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FD1FA;
	Fri, 27 Oct 2023 01:18:59 -0700 (PDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5jogH007956;
	Fri, 27 Oct 2023 08:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=5c5YvRGx45E/+CpHH1wWVK8msPoSxpNh0E1Lgo5HjKg=;
 b=Vg/5HBbfSOSiVtEKMpurNNLEl7cWPNsa2QGjRFCbGOyKSva5U2ffD1x0HjVPVy8NlBZh
 lqO10Kf5gumPSloaB9U1nGZ7GXXHhCC5YCAgeAS8poyPcV8asvgKiYua/4w0orGsUv3i
 YDgEmDt6X6aRnEzWbOjaUgDyz3mw/xSC8WR4ZrnIStGyDqC0PzIXqYNGaV/quw4CuxV2
 tYEkymQlswAxuixozm1BMfSL/SuCRh6bEY5ZIxEukZrsiBInVygLFt/s4q1D+I9/wMg0
 cK28WaDjL2C0xcE6XjpHNQBA53h8b7/Y/XMIaHw7L0lVLPmmYV90JMhrK9tFRQdt2BPu Eg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tywtt0yme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:53 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R6K2cZ009162;
	Fri, 27 Oct 2023 08:18:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjeb9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:18:52 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9R028975;
	Fri, 27 Oct 2023 08:18:52 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-5;
	Fri, 27 Oct 2023 08:18:52 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Stephan Mueller <smueller@chronox.de>
Subject: [PATCH RFC 04/11] crypto: doc: properly format ToC headings
Date: Fri, 27 Oct 2023 10:18:23 +0200
Message-Id: <20231027081830.195056-5-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: QehSy-H1XCn1uln3sRzJuY2bFJDiWyhb
X-Proofpoint-ORIG-GUID: QehSy-H1XCn1uln3sRzJuY2bFJDiWyhb

"class:: toc-title" was a workaround for older Sphinx versions that are
no longer supported.

The canonical way to add a heading to the ToC is to use :caption:.
Do that.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Stephan Mueller <smueller@chronox.de>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/crypto/api.rst   | 5 +----
 Documentation/crypto/index.rst | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/crypto/api.rst b/Documentation/crypto/api.rst
index b91b31736df8..ff31c30561d4 100644
--- a/Documentation/crypto/api.rst
+++ b/Documentation/crypto/api.rst
@@ -1,11 +1,8 @@
 Programming Interface
 =====================
 
-.. class:: toc-title
-
-	   Table of contents
-
 .. toctree::
+   :caption: Table of contents
    :maxdepth: 2
 
    api-skcipher
diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index da5d5ad2bdf3..10647c5ae2ea 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -9,11 +9,8 @@ This documentation outlines the Linux kernel crypto API with its
 concepts, details about developing cipher implementations, employment of the API
 for cryptographic use cases, as well as programming examples.
 
-.. class:: toc-title
-
-	   Table of contents
-
 .. toctree::
+   :caption: Table of contents
    :maxdepth: 2
 
    intro
-- 
2.34.1


