Return-Path: <linux-doc+bounces-777-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A37D258E
	for <lists+linux-doc@lfdr.de>; Sun, 22 Oct 2023 20:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAB85B20CD5
	for <lists+linux-doc@lfdr.de>; Sun, 22 Oct 2023 18:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFB3107B1;
	Sun, 22 Oct 2023 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RmrXWFsD"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9BB10791
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 18:58:35 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE64E6;
	Sun, 22 Oct 2023 11:58:34 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39MIqxiW016711;
	Sun, 22 Oct 2023 18:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=Z5FjhE0lXP7yPcnsHyhXfQkfD/iyz239cGkuzlE7Ktg=;
 b=RmrXWFsD7KNtCttW7ojuKc78oT1JdDKrfycHCYmsfz9CpxrSkhi4jgme76+mgOaYWmpS
 J6yIwuzE2SJ/U0YNpGZCqhcoiBPx7d0akExwEd/1crswrYw6rZ0cF2obtjSB3RpYeBeI
 0FJ9MwCYDe1vunXdlPZR+iJ6pERx6xzVcoZbvaWHSdpV6QW//Z5ivWjdD8QTEr91je0y
 GoE9uyqvRdQxfrklIKrNxqtLBuPrPmhbsMDsVRphCdN99WGRTBNak5b18CO/sWznOjCv
 MdVDWETm/jHOR1xLoZ77PQYyJ+IS1HUwKbeFfw9FbbgB7yCyAX1a2PB2QUBLjdgf71zn Jw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv68t9tp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2023 18:58:17 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39MHe2wh034522;
	Sun, 22 Oct 2023 18:58:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tv533795r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Oct 2023 18:58:16 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39MIwG0O035256;
	Sun, 22 Oct 2023 18:58:16 GMT
Received: from localhost.localdomain (dhcp-10-175-52-84.vpn.oracle.com [10.175.52.84])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3tv533794v-1;
	Sun, 22 Oct 2023 18:58:15 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: coresight: fix `make refcheckdocs` warning
Date: Sun, 22 Oct 2023 20:58:06 +0200
Message-Id: <20231022185806.919434-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-22_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310220175
X-Proofpoint-ORIG-GUID: zWnmiCGfJCLpShlQU7tsgurc83z9kgtE
X-Proofpoint-GUID: zWnmiCGfJCLpShlQU7tsgurc83z9kgtE

This reference uses a glob pattern to match multiple files, but the
asterisk was escaped as \* in order to not be interpreted by sphinx
as reStructuredText markup.

refcheckdocs/documentation-file-ref-check doesn't know about rST syntax
and tries to interpret the \* literally (instead of as a glob).

We can work around the warning by putting the Documentation reference
inside double backticks (``..``), which allows us to not escape the
asterisk.

Fixes: c06475910b52 ("Documentation: coresight: Escape coresight bindings file wildcard")
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Rob Herring <robh@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/trace/coresight/coresight.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 4a71ea6cb390..826e59a698da 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -130,7 +130,7 @@ Misc:
 Device Tree Bindings
 --------------------
 
-See Documentation/devicetree/bindings/arm/arm,coresight-\*.yaml for details.
+See ``Documentation/devicetree/bindings/arm/arm,coresight-*.yaml`` for details.
 
 As of this writing drivers for ITM, STMs and CTIs are not provided but are
 expected to be added as the solution matures.
-- 
2.34.1


