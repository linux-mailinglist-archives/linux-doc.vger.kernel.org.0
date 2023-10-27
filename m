Return-Path: <linux-doc+bounces-1283-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9457D9110
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 10:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34587281DC1
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 08:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0969813FFE;
	Fri, 27 Oct 2023 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i1/TC3St"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A414013
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 08:19:23 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07271D5E;
	Fri, 27 Oct 2023 01:19:18 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39R5i5w6003086;
	Fri, 27 Oct 2023 08:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2023-03-30;
 bh=phDJ9fYkNDZ1+LpOWiE4bE9znlIs1VUuwW3/CIkXJvU=;
 b=i1/TC3SthuFqudfz2WOcUUFklFcfOYAV3631LtS5OSRJ2rV+AuC/b/n8S4yT8hhblK1+
 r4GtCn4M8LXE7Vq9U8W5CFuvbcoXdG9aqaO5ge3F5v2kkRqFGNkl8oj8oB97ho1arWk8
 Oe5GhEACObCql/85AvATImIGY4CbZTn/SJrg+fwkGJagPoB4tyq+cDh6WcSkQGRA5IG0
 pKZgore+ZqGoX6Rr9Rso3gglbkCJfohhGxQpDx0CKSszC5iz5q1wcL/Qj7YYhq+H0hEn
 IIADLJuZVZmF7a3+IwzclK2MAuFznCkoUri5G4cXQm0St4yQhWOrbLaoKeZ1xkSJFJNg Kg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tyxmv8v0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:19:15 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39R62lO6009264;
	Fri, 27 Oct 2023 08:19:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tywqjebdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 08:19:03 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39R8Ig9X028975;
	Fri, 27 Oct 2023 08:19:03 GMT
Received: from t460-2.nl.oracle.com (dhcp-10-175-63-126.vpn.oracle.com [10.175.63.126])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tywqjeb1g-8;
	Fri, 27 Oct 2023 08:19:02 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH RFC 07/11] input: docs: properly format ToC headings
Date: Fri, 27 Oct 2023 10:18:26 +0200
Message-Id: <20231027081830.195056-8-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: aoJ9XceRi8i7_aMEaDo6B2ImGRMp_3ab
X-Proofpoint-ORIG-GUID: aoJ9XceRi8i7_aMEaDo6B2ImGRMp_3ab

"class:: toc-title" was a workaround for older Sphinx versions that are
no longer supported.

The canonical way to add a heading to the ToC is to use :caption:.
Do that.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/input/input_kapi.rst   | 5 +----
 Documentation/input/input_uapi.rst   | 5 +----
 Documentation/input/joydev/index.rst | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/Documentation/input/input_kapi.rst b/Documentation/input/input_kapi.rst
index 41f1b7e6b78e..9937522daa9b 100644
--- a/Documentation/input/input_kapi.rst
+++ b/Documentation/input/input_kapi.rst
@@ -4,11 +4,8 @@
 Linux Input Subsystem kernel API
 ################################
 
-.. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+   :caption: Table of Contents
    :maxdepth: 2
    :numbered:
 
diff --git a/Documentation/input/input_uapi.rst b/Documentation/input/input_uapi.rst
index 4a0391609327..8275b4223a84 100644
--- a/Documentation/input/input_uapi.rst
+++ b/Documentation/input/input_uapi.rst
@@ -4,11 +4,8 @@
 Linux Input Subsystem userspace API
 ###################################
 
-.. class:: toc-title
-
-        Table of Contents
-
 .. toctree::
+   :caption: Table of Contents
    :maxdepth: 2
    :numbered:
 
diff --git a/Documentation/input/joydev/index.rst b/Documentation/input/joydev/index.rst
index ebcff43056e2..d03d6f6cbfab 100644
--- a/Documentation/input/joydev/index.rst
+++ b/Documentation/input/joydev/index.rst
@@ -6,11 +6,8 @@ Linux Joystick support
 
 :Copyright: |copy| 1996-2000 Vojtech Pavlik <vojtech@ucw.cz> - Sponsored by SuSE
 
-.. class:: toc-title
-
-	Table of Contents
-
 .. toctree::
+	:caption: Table of Contents
 	:maxdepth: 3
 
 	joystick
-- 
2.34.1


