Return-Path: <linux-doc+bounces-10495-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D486067E
	for <lists+linux-doc@lfdr.de>; Fri, 23 Feb 2024 00:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 833EA1F25BFE
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 23:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E9B14039B;
	Thu, 22 Feb 2024 23:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bhz4VzzK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC013793B;
	Thu, 22 Feb 2024 23:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708643829; cv=none; b=GS1ak8RlUX/++5ZQPP6oNxu9uFJUs2NYiHxuSHz7zVjyRvLucugbqkRlLrVcFPxf8lPrDtO58qKz4bX3tsBzp6HMIuGmK/dWjDLwiP7oSWsXm6kymlE4D27nDGNm0q4+KjrobUnWGZX8r603VfASknLRsxNimItsgD4KAyQeQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708643829; c=relaxed/simple;
	bh=81BApNCWE2zAa6zVLXDQtQyI6GDLb22xqMDfC0+wXC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DvZMMj9EIZuENV2rJj9CWqVaDb/95DXTtPQlnyXFG6JItSdd6ZbZBgiXYQ6jxqfXR55+lvJ4O1q/1FLQoaQkBhFT3/fpz0WbENtd48bPrT0QAFIFbgVn1jNOJE7hI9Rnx3YRpaXzksdpE1OXVZmY2kU7NZ/hZHVDv3OiUT3Spu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bhz4VzzK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MMMRup001705;
	Thu, 22 Feb 2024 23:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=+zMY+8BLDygCeJCo/brQThGUolvO8zPvVZb2gI6VQ0M
	=; b=bhz4VzzKARL6SdGXSrvf7HpKg2LGXOgzL6K7pg/1mxN6ikdt1uL39LQATj0
	qeRJY45qwUsMy4IM1nMQosVq9cnOY28HyN8oA8Dfl1WkIeRbmhAif6KvvxNxveAl
	JfS6K11kLqnX+FRDlbGQEGWThzEatRazCJD0UiTweKSoTKa80/k815TsTDYbFirX
	LkvfFbJfDweNNze1UoAgFM4ou1iTP67fPQIbMgkQo/pvGDu3qrvTVYJGEQo+Gq7i
	ZeTdRO24wOoVTYX2vMHJQPCDl38izLSLuuwasS1cb24yVcGTc8Tx71Iwuv+ewwie
	gciQeeICaNC4QoOqddVi3iDEr8Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we2kf9puu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 23:16:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MNGjEm017978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 23:16:45 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 15:16:44 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Thu, 22 Feb 2024 15:16:54 -0800
Subject: [PATCH v17 31/35] virt: gunyah: Add hypercalls for sending
 doorbell
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240222-gunyah-v17-31-1e9da6763d38@quicinc.com>
References: <20240222-gunyah-v17-0-1e9da6763d38@quicinc.com>
In-Reply-To: <20240222-gunyah-v17-0-1e9da6763d38@quicinc.com>
To: Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Murali Nalajal <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Philip Derrin <quic_pderrin@quicinc.com>,
        Prakruthi Deepak Heragu
	<quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Fuad
 Tabba" <tabba@google.com>,
        Sean Christopherson <seanjc@google.com>,
        "Andrew
 Morton" <akpm@linux-foundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
        Elliot Berman
	<quic_eberman@quicinc.com>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VZTBPD9GNP7fE8d0d0Q9iN80QKQFlH07
X-Proofpoint-GUID: VZTBPD9GNP7fE8d0d0Q9iN80QKQFlH07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=713 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220179

Gunyah doorbells allow a virtual machine to signal another using
interrupts. Add the hypercalls needed to assert the interrupt.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 arch/arm64/gunyah/gunyah_hypercall.c | 38 ++++++++++++++++++++++++++++++++++++
 include/linux/gunyah.h               |  5 +++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
index 38403dc28c66f..3c2672d683ae2 100644
--- a/arch/arm64/gunyah/gunyah_hypercall.c
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -37,6 +37,8 @@ EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
 
 /* clang-format off */
 #define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+#define GUNYAH_HYPERCALL_BELL_SEND		GUNYAH_HYPERCALL(0x8012)
+#define GUNYAH_HYPERCALL_BELL_SET_MASK		GUNYAH_HYPERCALL(0x8015)
 #define GUNYAH_HYPERCALL_MSGQ_SEND		GUNYAH_HYPERCALL(0x801B)
 #define GUNYAH_HYPERCALL_MSGQ_RECV		GUNYAH_HYPERCALL(0x801C)
 #define GUNYAH_HYPERCALL_ADDRSPACE_MAP		GUNYAH_HYPERCALL(0x802B)
@@ -64,6 +66,42 @@ void gunyah_hypercall_hyp_identify(
 }
 EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
 
+/**
+ * gunyah_hypercall_bell_send() - Assert a gunyah doorbell
+ * @capid: capability ID of the doorbell
+ * @new_flags: bits to set on the doorbell
+ * @old_flags: Filled with the bits set before the send call if return value is GUNYAH_ERROR_OK
+ */
+enum gunyah_error gunyah_hypercall_bell_send(u64 capid, u64 new_flags, u64 *old_flags)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_BELL_SEND, capid, new_flags, 0, &res);
+
+	if (res.a0 == GUNYAH_ERROR_OK && old_flags)
+		*old_flags = res.a1;
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_bell_send);
+
+/**
+ * gunyah_hypercall_bell_set_mask() - Set masks on a Gunyah doorbell
+ * @capid: capability ID of the doorbell
+ * @enable_mask: which bits trigger the receiver interrupt
+ * @ack_mask: which bits are automatically acknowledged when the receiver
+ *            interrupt is ack'd
+ */
+enum gunyah_error gunyah_hypercall_bell_set_mask(u64 capid, u64 enable_mask, u64 ack_mask)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_BELL_SET_MASK, capid, enable_mask, ack_mask, 0, &res);
+
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_bell_set_mask);
+
 /**
  * gunyah_hypercall_msgq_send() - Send a buffer on a message queue
  * @capid: capability ID of the message queue to add message
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index cfb80f40d4e4a..a9d58150de696 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -359,6 +359,11 @@ gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
 void gunyah_hypercall_hyp_identify(
 	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
 
+enum gunyah_error gunyah_hypercall_bell_send(u64 capid, u64 new_flags,
+					     u64 *old_flags);
+enum gunyah_error gunyah_hypercall_bell_set_mask(u64 capid, u64 enable_mask,
+						 u64 ack_mask);
+
 /* Immediately raise RX vIRQ on receiver VM */
 #define GUNYAH_HYPERCALL_MSGQ_TX_FLAGS_PUSH BIT(0)
 

-- 
2.34.1


