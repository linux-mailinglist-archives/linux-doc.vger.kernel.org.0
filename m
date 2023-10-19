Return-Path: <linux-doc+bounces-609-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69BC7CF463
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 11:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1954281EE3
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 09:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0F717723;
	Thu, 19 Oct 2023 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R6bwRuNj"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDBE171DE
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:48:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AC8131;
	Thu, 19 Oct 2023 02:48:02 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J7siPh002966;
	Thu, 19 Oct 2023 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=MUhzYguRNuFFCnbPijV6TT9fkbP4WSksbMRqsHfa5KE=;
 b=R6bwRuNj8GCZtZCZzfxogCi75Vo87gLNwazoCjcBbJ6IpET1ZRYEeMnxRkAk7UPBZLnf
 KEligqetJ3jvqihEWCxKVzXuvicpfLFMsoBsLXEnRRulTHACO3bZjSQT17emwncGWyfP
 mNBtiwMIEEP3symDRlqZg3xQFatUFmD+NGC30tl/0d8blVUw5kLUj6UtWwDyecLvnZlg
 9pkano/0aaaW/NTCFDROg62HiEWKKMdh7P7nnIXCSLMYQWal4l5gwtyw81BaNQPIWRm8
 /oWfuZelwMH8ulGa3MvEcwzTnpNAaoD9TJorBKzDHjyWPBhadqBGR1ws/mVxD0lAC0sm Dg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt905bd49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:47:50 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39J9lnM2000706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:47:49 GMT
Received: from hu-nprakash-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Thu, 19 Oct 2023 02:47:43 -0700
From: Nikhil V <quic_nprakash@quicinc.com>
To: Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>
CC: Nikhil V <quic_nprakash@quicinc.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Steven
 Rostedt (Google)" <rostedt@goodmis.org>,
        "Paul E. McKenney"
	<paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
        Randy Dunlap
	<rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_mpilaniy@quicinc.com>, <quic_shrekk@quicinc.com>,
        <mpleshivenkov@google.com>, <ericyin@google.com>
Subject: [PATCH v2 4/4] PM: hibernate: Support to select compression algorithm
Date: Thu, 19 Oct 2023 15:16:37 +0530
Message-ID: <ceb3f93be21d579f407da18cf8078e5e84a914db.1697707408.git.quic_nprakash@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1697707408.git.quic_nprakash@quicinc.com>
References: <cover.1697707408.git.quic_nprakash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9uIls0hZuIT0Xva8RGiQPr3RlT9tzcZ9
X-Proofpoint-ORIG-GUID: 9uIls0hZuIT0Xva8RGiQPr3RlT9tzcZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_07,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190082

Currently the default compression algorithm is selected based on
Kconfig. Introduce a kernel command line parameter "hib_compression" to
override this behaviour.

Different compression algorithms have different characteristics and
hibernation may benefit when it uses any of these algorithms, especially
when a secondary algorithm offers better decompression speeds over a
default algorithm, which in turn reduces hibernation image restore time.

Users can set "hib_compression" command line parameter to override the
default algorithm. Currently LZO and LZ4 are the supported algorithms.
Usage:
    LZO: hib_compression=lzo
    LZ4: hib_compression=lz4

LZO is the default compression algorithm used with hibernation.

Signed-off-by: Nikhil V <quic_nprakash@quicinc.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 ++++
 kernel/power/hibernate.c                      | 31 ++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0a1731a0f0ef..3f5f3e453db1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1734,6 +1734,12 @@
 				(that will set all pages holding image data
 				during restoration read-only).
 
+	hib_compression= [COMPRESSION ALGORITHM]
+		lzo		Select LZO compression algorithm to compress/decompress
+				hibernation images.
+		lz4		Select LZ4 compression algorithm to compress/decompress
+				hibernation images.
+
 	highmem=nn[KMG]	[KNL,BOOT] forces the highmem zone to have an exact
 			size of <nn>. This works even on boxes that have no
 			highmem otherwise. This also works to reduce highmem
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 87be8cda9b9b..ccc7a1aaed8d 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -742,7 +742,8 @@ int hibernate(void)
 	 * Query for the compression algorithm support if compression is enabled.
 	 */
 	if (!nocompress) {
-		strscpy(hib_comp_algo, default_compressor, sizeof(hib_comp_algo));
+		if (!hib_comp_algo[0])
+			strscpy(hib_comp_algo, default_compressor, sizeof(hib_comp_algo));
 		if (crypto_has_comp(hib_comp_algo, 0, 0) != 1) {
 			pr_err("%s compression is not available\n", hib_comp_algo);
 			return -EOPNOTSUPP;
@@ -1416,6 +1417,33 @@ static int __init nohibernate_setup(char *str)
 	return 1;
 }
 
+static const char * const comp_alg_enabled[] = {
+#if IS_ENABLED(CONFIG_CRYPTO_LZO)
+	COMPRESSION_ALGO_LZO,
+#endif
+#if IS_ENABLED(CONFIG_CRYPTO_LZ4)
+	COMPRESSION_ALGO_LZ4,
+#endif
+};
+
+static int __init compression_setup(char *str)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(comp_alg_enabled); i++) {
+		if (!strcmp(str, comp_alg_enabled[i])) {
+			strscpy(hib_comp_algo, str, sizeof(hib_comp_algo));
+			goto setup_done;
+		}
+	}
+	pr_info("Cannot set specified compressor. Falling back to %s\n",
+		default_compressor);
+	strscpy(hib_comp_algo, default_compressor, sizeof(hib_comp_algo));
+
+setup_done:
+	return 1;
+}
+
 __setup("noresume", noresume_setup);
 __setup("resume_offset=", resume_offset_setup);
 __setup("resume=", resume_setup);
@@ -1423,3 +1451,4 @@ __setup("hibernate=", hibernate_setup);
 __setup("resumewait", resumewait_setup);
 __setup("resumedelay=", resumedelay_setup);
 __setup("nohibernate", nohibernate_setup);
+__setup("hib_compression=", compression_setup);
-- 
2.17.1


