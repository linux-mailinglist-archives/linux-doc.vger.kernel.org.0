Return-Path: <linux-doc+bounces-35341-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3648EA11F7C
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jan 2025 11:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1FF188D797
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jan 2025 10:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498882416AC;
	Wed, 15 Jan 2025 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ixZ1fPwy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9631EEA21;
	Wed, 15 Jan 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937044; cv=none; b=rifiou4zOyXbkaDfVqqHaswnmDMj+zyg9Hd9i6dudOq+1yji3hYALbgOb2t1if6rYCH1tvAUlhS67GZqR+WIwzyNil1s7KjNEZ3ITbR5hQNmojPWziiXJdk54nuUT04Abxbay6nhVC/KmiNt7kU7Kl94pNuMRsc7chmVDvAgMQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937044; c=relaxed/simple;
	bh=unwnLLcRoE6XVkBr2/pqLPDgInCwHVVrviIRY1dkjok=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dz2Gn690ZBWk3OtQgZG3z+mJj36DgL/9zzS4Fbu/7Dd+1RJaiYoVyl2jtbe4Yob7Ggt3cbPzKi3zvsVxxl9KTLuGCFhj3ItBSgoooA5vkCZT3NfWfDdvxAKdjUQla9nuvP+v3skgVmkEP+9wSpmF3U7OeVczp2k88jUFmLNQvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ixZ1fPwy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F9cU3n017661;
	Wed, 15 Jan 2025 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4B+HBQ/JATt7wC07UePFPe
	KfktZmgMxYiWcnWeyOV1U=; b=ixZ1fPwyb5/Tnz7aNGA5xBDIxnTdsL+ERkDimb
	trLozh1qPlh8ZWwkf+NLMLyxSwCE2cnPqUFAnhT/Jv27XqD+CBpiI4r3QkMWgtji
	LyVPwXzAtu4R3hsMCloXSkMU+0NwGhZwKlKLr0P6I83BVM4vGFUgnPweCiq2BtDY
	V0ofv0kTyekxj+gano1S7e3FWbAv5aTc+914tc8mWRD45qtbKodtfwell73eX42w
	sfA5ZC5olc4uahpwmy39XLnGknvD3mkr+3V9HpNBDFxxV09I0A5LGZKB8M5knX+7
	kuMwosuvyljF+caxkRWnQcAStlsFRCJlUkc8HhqplQ0pA9hw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446ajn040b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:30:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FAUSZo025157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:30:28 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 Jan 2025 02:30:23 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <vkoul@kernel.org>, <corbet@lwn.net>, <thara.gopinath@gmail.com>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <martin.petersen@oracle.com>, <enghua.yu@intel.com>,
        <u.kleine-koenig@baylibre.com>, <dmaengine@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_mdalam@quicinc.com>, <quic_utiwari@quicinc.com>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v6 00/12] dmaengine: qcom: bam_dma: add cmd descriptor support
Date: Wed, 15 Jan 2025 15:59:52 +0530
Message-ID: <20250115103004.3350561-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SfdnIsGLr5aRJzqEP7oiF3yoEKL8oY7C
X-Proofpoint-ORIG-GUID: SfdnIsGLr5aRJzqEP7oiF3yoEKL8oY7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150079

Requirements:
  In QCE crypto driver we are accessing the crypto engine registers 
  directly via CPU read/write. Trust Zone could possibly to perform some
  crypto operations simultaneously, a race condition will be created and
  this could result in undefined behavior.

  To avoid this behavior we need to use BAM HW LOCK/UNLOCK feature on BAM 
  pipes, and this LOCK/UNLOCK will be set via sending a command descriptor,
  where the HLOS/TZ QCE crypto driver prepares a command descriptor with a
  dummy write operation on one of the QCE crypto engine register and pass
  the LOCK/UNLOCK flag along with it.

  This feature tested with tcrypt.ko and "libkcapi" with all the AES 
  algorithm supported by QCE crypto engine. Tested on IPQ9574 and 
  qcm6490.LE chipset.

  insmod tcrypt.ko mode=101
  insmod tcrypt.ko mode=102
  insmod tcrypt.ko mode=155
  insmod tcrypt.ko mode=180
  insmod tcrypt.ko mode=181
  insmod tcrypt.ko mode=182
  insmod tcrypt.ko mode=185
  insmod tcrypt.ko mode=186
  insmod tcrypt.ko mode=212
  insmod tcrypt.ko mode=216
  insmod tcrypt.ko mode=403
  insmod tcrypt.ko mode=404
  insmod tcrypt.ko mode=500
  insmod tcrypt.ko mode=501
  insmod tcrypt.ko mode=502
  insmod tcrypt.ko mode=600
  insmod tcrypt.ko mode=601
  insmod tcrypt.ko mode=602

  Encryption command line:
 ./kcapi -x 1 -e -c "cbc(aes)" -k
 8d7dd9b0170ce0b5f2f8e1aa768e01e91da8bfc67fd486d081b28254c99eb423 -i
 7fbc02ebf5b93322329df9bfccb635af -p 48981da18e4bb9ef7e2e3162d16b1910
 * 8b19050f66582cb7f7e4b6c873819b71
 *
 Decryption command line:
 * $ ./kcapi -x 1 -c "cbc(aes)" -k
 3023b2418ea59a841757dcf07881b3a8def1c97b659a4dad -i
 95aa5b68130be6fcf5cabe7d9f898a41 -q c313c6b50145b69a77b33404cb422598
 * 836de0065f9d6f6a3dd2c53cd17e33a

 * $ ./kcapi -x 3 -c sha256 -p 38f86d
 * cc42f645c5aa76ac3154b023359b665375fc3ae42f025fe961fb0f65205ad70e
 * $ ./kcapi -x 3 -c sha256 -p bbb300ac5eda9d
 * 61f7b48577a613fbdfe0d6d90b49985e07a42c99e7a439b6efb76d5ec71b3d30

 ./kcapi -x 12 -c "hmac(sha256)" -k
 0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b -i
 000102030405060708090a0b0c -p f0f1f2f3f4f5f6f7f8f9 -b 42
 *
 3cb25f25faacd57a90434f64d0362f2a2d2d0a90cf1a5a4c5db02d56ecc4c5bf3400720
 8d5b887185865

 Paraller test with two different EE's (Execution Environment)

 EE1 (Trust Zone)                          EE2 (HLOS)

 There is a TZ application which    "libkcapi" or "tcrypt.ko" will run in 
 will do continuous enc/dec with     continuous loop to do enc/dec with 
 different AES algorithm supported   different algorithm supported QCE
 by QCE crypto engine.     	     crypto engine. 

1) dummy write with LOCK bit set    1) dummy write with LOCK bit set                        
2) bam will lock all other pipes    2) bam will lock all other pipes which
   which not belongs to current	       not belongs to current EE's, i.e tz 
   EE's, i.e HLOS pipe and keep        pipe and keep handling current
   handling current pipe only.         pipe only. 
                                    3) hlos prepare data descriptor and               
3) tz prepare data descriptor          submit to CE5
   and submit to CE5                4) dummy write with UNLOCK bit set
4) dummy write with UNLOCK bit      5) bam will release all the locked 
   set                                 pipes
5) bam will release all the locked
   pipes                   

 Upon encountering a descriptor with Lock bit set, the BAM will lock all
 other pipes not related to the current pipe group, and keep handling the 
 current pipe only until it sees the Un-Lock set (then it will release all
 locked pipes). The actual locking is done on the new descriptor fetching
 for publishing, i.e. locked pipe will not fetch new descriptors even if 
 it got event/events adding more descriptors for this pipe.

v6:
 * change "BAM" to "DMA" 
 * Ensured this series is compilable with the current Linux-next tip of 
   the tree (TOT).

v5:
 * Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
 * Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
 * Added FIELD_GET and GENMASK macro to extract major and minor version

v4:
  * Added feature description and test hardware
    with test command
  * Fixed patch version numbering
  * Dropped dt-binding patch
  * Dropped device tree changes
  * Added BAM_SW_VERSION register read
  * Handled the error path for the api dma_map_resource()
    in probe
  * updated the commit messages for batter redability
  * Squash the change where qce_bam_acquire_lock() and
    qce_bam_release_lock() api got introduce to the change where
    the lock/unlock flag get introced
  * changed cover letter subject heading to
    "dmaengine: qcom: bam_dma: add cmd descriptor support"
  * Added the very initial post for BAM lock/unlock patch link
    as v1 to track this feature

v3:
  * https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
  * Addressed all the comments from v2
  * Added the dt-binding
  * Fix alignment issue
  * Removed type casting from qce_write_reg_dma()
    and qce_read_reg_dma()
  * Removed qce_bam_txn = dma->qce_bam_txn; line from
    qce_alloc_bam_txn() api and directly returning
    dma->qce_bam_txn

v2:
  * https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
  * Initial set of patches for cmd descriptor support
  * Add client driver to use BAM lock/unlock feature
  * Added register read/write via BAM in QCE Crypto driver
    to use BAM lock/unlock feature

v1:
  * https://lore.kernel.org/all/1608215842-15381-1-git-send-email-mdalam@codeaurora.org/
  * Initial support for LOCK/UNLOCK in bam_dma driver


Md Sadre Alam (12):
  dmaengine: qcom: bam_dma: Add bam_sw_version register read
  dmaengine: add DMA_PREP_LOCK and DMA_PREP_UNLOCK flag
  dmaengine: qcom: bam_dma: add bam_pipe_lock flag support
  crypto: qce - Add support for crypto address read
  crypto: qce - Add bam dma support for crypto register r/w
  crypto: qce - Convert register r/w for skcipher via BAM/DMA
  crypto: qce - Convert register r/w for sha via BAM/DMA
  crypto: qce - Convert register r/w for aead via BAM/DMA
  crypto: qce - Add LOCK and UNLOCK flag support
  crypto: qce - Add support for lock/unlock in skcipher
  crypto: qce - Add support for lock/unlock in sha
  crypto: qce - Add support for lock/unlock in aead

 .../driver-api/dmaengine/provider.rst         |  15 ++
 drivers/crypto/qce/aead.c                     |   4 +
 drivers/crypto/qce/common.c                   | 141 +++++++----
 drivers/crypto/qce/core.c                     |  16 +-
 drivers/crypto/qce/core.h                     |  12 +
 drivers/crypto/qce/dma.c                      | 231 ++++++++++++++++++
 drivers/crypto/qce/dma.h                      |  26 ++
 drivers/crypto/qce/sha.c                      |   4 +
 drivers/crypto/qce/skcipher.c                 |   4 +
 drivers/dma/qcom/bam_dma.c                    |  29 ++-
 include/linux/dmaengine.h                     |   6 +
 11 files changed, 444 insertions(+), 44 deletions(-)

-- 
2.34.1


