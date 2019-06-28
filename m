Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5F5590D7
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jun 2019 04:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfF1CUP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jun 2019 22:20:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3712 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725770AbfF1CUP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 22:20:15 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5S2GZ9g023953
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 22:20:14 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2td695yr7s-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 22:20:13 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bauerman@linux.ibm.com>;
        Fri, 28 Jun 2019 03:20:13 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
        by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 28 Jun 2019 03:20:08 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x5S2K7oN52363742
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Jun 2019 02:20:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 817D6112062;
        Fri, 28 Jun 2019 02:20:07 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E15A0112067;
        Fri, 28 Jun 2019 02:20:03 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.218.134])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Fri, 28 Jun 2019 02:20:03 +0000 (GMT)
From:   Thiago Jung Bauermann <bauerman@linux.ibm.com>
To:     linux-integrity@vger.kernel.org
Cc:     linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mimi Zohar <zohar@linux.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jessica Yu <jeyu@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "AKASHI, Takahiro" <takahiro.akashi@linaro.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: [PATCH v12 04/11] integrity: Select CONFIG_KEYS instead of depending on it
Date:   Thu, 27 Jun 2019 23:19:27 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628021934.4260-1-bauerman@linux.ibm.com>
References: <20190628021934.4260-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062802-0052-0000-0000-000003D7411E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011344; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224269; UDB=6.00644348; IPR=6.01005460;
 MB=3.00027497; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-28 02:20:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062802-0053-0000-0000-0000617CC278
Message-Id: <20190628021934.4260-5-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-27_15:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280019
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This avoids a dependency cycle in soon-to-be-introduced
CONFIG_IMA_APPRAISE_MODSIG: it will select CONFIG_MODULE_SIG_FORMAT
which in turn selects CONFIG_KEYS. Kconfig then complains that
CONFIG_INTEGRITY_SIGNATURE depends on CONFIG_KEYS.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 3ba1168b1756..93d73902c571 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -17,8 +17,8 @@ if INTEGRITY
 
 config INTEGRITY_SIGNATURE
 	bool "Digital signature verification using multiple keyrings"
-	depends on KEYS
 	default n
+	select KEYS
 	select SIGNATURE
 	help
 	  This option enables digital signature verification support

