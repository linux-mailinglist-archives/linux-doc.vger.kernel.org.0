Return-Path: <linux-doc+bounces-605-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 308EF7CF459
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 11:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9087C281EF7
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 09:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979B717723;
	Thu, 19 Oct 2023 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nHRc45rK"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43B14F6D
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:47:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A247011D;
	Thu, 19 Oct 2023 02:47:39 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J9bWGc015350;
	Thu, 19 Oct 2023 09:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=d/LRBcgUOKI8CzuX0DfvgrJ2RKaI2w5IC+EtJfAJAB4=;
 b=nHRc45rKe7r+Imm0mDy3VLyAlQm3k1Ih+qsC0asrGdBKMcV7KEsriOIZJXAsgtcJhlkg
 Xtk3VOQb4kkI7zMSitZixk+eG7zQHN8AAXqhA5yPdqEPH/Ukx9EVgXQPHCLm7ZIG/ZS5
 c46U+4KoNDY0Rr7PTFIAhGaKrjz1hNCSVvv+e2tM4O3X/MkMPvH4XyZMIg4d4QfRZaGQ
 UBTTGca6PxkyPMUdJ/l8XxL7RBTI98ei+GBIxGc9TmfbtvSVImi1OTbO0ybZgLDPSobZ
 VyQZZG7YmZ0oJyRplG7zt8xFfTHwx+EoAzZce3Z6G05xebmePO6FF99PqUSrNH2r2gbP 0w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttcuv2u52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:47:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39J9lD4f031318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 09:47:13 GMT
Received: from hu-nprakash-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Thu, 19 Oct 2023 02:47:06 -0700
From: Nikhil V <quic_nprakash@quicinc.com>
To: Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        "Rafael J.
 Wysocki" <rafael@kernel.org>
CC: Nikhil V <quic_nprakash@quicinc.com>, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Peter Zijlstra
	<peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Paul E.
 McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
        Randy Dunlap
	<rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_mpilaniy@quicinc.com>, <quic_shrekk@quicinc.com>,
        <mpleshivenkov@google.com>, <ericyin@google.com>
Subject: [PATCH v2 0/4] PM: hibernate: LZ4 compression support
Date: Thu, 19 Oct 2023 15:16:33 +0530
Message-ID: <cover.1697707408.git.quic_nprakash@quicinc.com>
X-Mailer: git-send-email 2.17.1
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
X-Proofpoint-ORIG-GUID: oYnHSVhVJwt5vtusK7SueU_pKNui8MK_
X-Proofpoint-GUID: oYnHSVhVJwt5vtusK7SueU_pKNui8MK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_07,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190082

This patch series covers the following:
1. Renaming lzo* to generic names, except for lzo_xxx() APIs. This is
used in the next patch where we move to crypto based APIs for
compression. There are no functional changes introduced by this
approach.


2. Replace LZO library calls with crypto generic APIs

Currently for hibernation, LZO is the only compression algorithm
available and uses the existing LZO library calls. However, there
is no flexibility to switch to other algorithms which provides better
results. The main idea is that different compression algorithms have
different characteristics and hibernation may benefit when it uses
alternate algorithms.

By moving to crypto based APIs, it lays a foundation to use other
compression algorithms for hibernation.


3. LZ4 compression
Extend the support for LZ4 compression to be used with hibernation.
The main idea is that different compression algorithms
have different characteristics and hibernation may benefit when it uses
any of these algorithms: a default algorithm, having higher
compression rate but is slower(compression/decompression) and a
secondary algorithm, that is faster(compression/decompression) but has
lower compression rate.

LZ4 algorithm has better decompression speeds over LZO. This reduces
the hibernation image restore time.
As per test results:
                                    LZO             LZ4
Size before Compression(bytes)   682696704       682393600
Size after Compression(bytes)    146502402       155993547
Decompression Rate               335.02 MB/s     501.05 MB/s
Restore time                       4.4s             3.8s

LZO is the default compression algorithm used for hibernation. Enable
CONFIG_HIBERNATION_DEF_COMP_LZ4 to set the default compressor as LZ4.

Compression Benchmarks: https://github.com/lz4/lz4


4. Support to select compression algorithm

Currently the default compression algorithm is selected based on
Kconfig. Introduce a kernel command line parameter "hib_compression" to
override this behaviour.

Users can set "hib_compression" command line parameter to specify
the algorithm.
Usage:
    LZO: hib_compression=lzo
    LZ4: hib_compression=lz4
LZO is the default compression algorithm used with hibernation.


Changes in v2:
 - Fixed build issues reported by kernel test robot for ARCH=sh, [1].
 - Based on 6.6-rc6.

[1] https://lore.kernel.org/oe-kbuild-all/202310171226.pLUPeuC7-lkp@intel.com/

Nikhil V (4):
  PM: hibernate: Rename lzo* to make it generic
  PM: hibernate: Move to crypto APIs for LZO compression
  PM: hibernate: Add support for LZ4 compression for hibernation
  PM: hibernate: Support to select compression algorithm

 .../admin-guide/kernel-parameters.txt         |   6 +
 kernel/power/Kconfig                          |  26 ++-
 kernel/power/hibernate.c                      |  85 +++++++-
 kernel/power/power.h                          |  19 ++
 kernel/power/swap.c                           | 189 +++++++++++-------
 5 files changed, 251 insertions(+), 74 deletions(-)

-- 
2.17.1


