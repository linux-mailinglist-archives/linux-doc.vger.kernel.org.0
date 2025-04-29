Return-Path: <linux-doc+bounces-44689-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B368AAA027F
	for <lists+linux-doc@lfdr.de>; Tue, 29 Apr 2025 08:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1347846663A
	for <lists+linux-doc@lfdr.de>; Tue, 29 Apr 2025 06:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2772227585F;
	Tue, 29 Apr 2025 06:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtGsl3FO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD5275869
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906830; cv=none; b=uZfErMpbXLVRXqt5phlnxTjBIVMjMSo+zqaL84BfqF1WSnmtQ+EQF4lvGYJL80gmkr+GItJYYbZ233/9lVG8zp92g2q904vC6LJBlBRbswvx2pot71cCFKzAh7zzqWQKOkC3giQ29vQ02i0wtnYT5M3gsYWVbWKQzW/BH00bZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906830; c=relaxed/simple;
	bh=NZ9UoQrDtsa/bdxaCCDtRbtSyRUdRiMoDWerA6WxR6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9ywtGmj9H7LpoQJlpAzBgx/TL5xImI2xhBCShNajWl6ATpa/haWGTa3yUAld7N2edKz359hVhXD1TBaI95HO4le1pnt5K1bZpsbefG3DIvXGXDWSPOmdHV74stFbTwNv9g+qlHuhVL+a6832fnMtgqFBihxSO7ny6ds8L251Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtGsl3FO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqiqM005181
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=; b=ZtGsl3FOipkDgsFh
	sqDrYwvaDlCxRraUKyTkAY2kyqTLRhOpjEueW1qs4N1ci4Uq0fQk2V19q8Fd7+g/
	saIziV9O/f4wPl4M1WqF+s9jdoP8qyqhrEQr1+G3iuRixS7YIzhVaR3FLgVAMjBl
	i+YFR9AFQes6TpagJlMJwMdzCzbXNRqhb9pz5Dnr1MHZYOyOYoWYmCIzC79JnVSH
	YC00uGLspjsZpfWy3AT07Fkb4WWYbT91+puv48Rj1ryPRmOZ4O1CC4JH2Bmh7x+D
	N8pwe11pumMtETD09Y3nDZj+puX41l6+exAEGcf1+dOhqR0M2ZdPVNWDQTGrj8l2
	d5PeyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbaddf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736b5f9279cso4943248b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 23:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906826; x=1746511626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=;
        b=HZ3D66HR1+YR06E4VJsoKSIlHSdIu/RTT6HoT/1EdklTOYdtiejfGJ4bWVvSBpYZs/
         ffG/+9/KbATq/NzaBySuX7UGYw4NOtn8Dy2DC9fYtcIAPZ8Zbzg9ENJqU2tUfvmKau1i
         zGc5KKU4qYsNdERR4AD97TXXslk0qOkn2MJsFS0WU200PMUvH5xmX9hujTxEIbAx9o6f
         5r443/1pJ22706vitosiI9fgczYHuDcG+KI1PaGDXQUB7K7vBbkx6JRweX/eP+Ml4JKU
         UKObiUT5VjuquMYwyDswwHdLk3rK4e6bowLlw2N+o+GgJ/LZ+A5RtbzDj/AL6cTVPZ0a
         64CA==
X-Forwarded-Encrypted: i=1; AJvYcCXpPcJf8GknRXuFbw3t8UDpsYu653eoAm2bDDgsRqzvY+vS7wQfXAnh1jCTtn3tVqxyVqNpOw+SXhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHE6OAToqFoIN3mfS20hL/SOQR6S3HU2LhBE0KwnlVuDDc103
	Jc+vCn/hQ4SCuaVRj7ldqkNlF6GYXZhBF7QKxS5AYtKiKbMZ+iAxxi/U9HsvglHv2jSJF+uw5rd
	7qR+Z70S37FCgSIiK2SmEJ392fceTm0vSo4dssJGJdLkS/roTQOPuigyC14QJhfJcfzPY
X-Gm-Gg: ASbGncvK7O7CkCQ3aFU7mgi7omstDtbWuqlrnsAllGuL2ZmrKBy6Y48KX/q+P+71u0a
	VBKLQjw/eg0ZCdvO0H1G+JtbT/Afbmu02cbIalOuQS7OW1CNEbcRdewdrtmYaIBEmP5tdw9zuTH
	qS8hHGkkVb3gRksR4Xwl/TdQiwalg/tQcYOyiesm1KQiks4DbJ3UzvBgREhtQFA655dzz/s0Bfi
	pU8S/38eOXYbX9sKehMAqzTR9+jyMGLZp2/ZaOygAmb2rkxsDwbbEFOFrWQcm6akBHIX6IUUGJy
	lKrGX2y7EdMKs3o8wJkNekSrudSoboXR/eb379peYkBLvyIfqdZoTLtKPr9P7Q2ZpY1g4HA=
X-Received: by 2002:a05:6a00:ac2:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-73ff7246ffamr16789996b3a.4.1745906826415;
        Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Iw5QWLjVAX0CA1a1Lr5eZnBvSqfuSz+6cNc/A6mOFVZZHAZTnGn+CTOmtVDh40vcM4lMOQ==
X-Received: by 2002:a05:6a00:ac2:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-73ff7246ffamr16789968b3a.4.1745906826019;
        Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:28 -0700
Subject: [PATCH v4 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-7-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NSBTYWx0ZWRfX5gkYT4QXWElW C8+CgqDleqrlbAEuylWJ11hKX3r460/8h8zDlq88nBuy5cEUDO3FHn0y9+rgEVsimCzs7nNayQU UhQlTxoVj9+uu0oyKxnlVtz5cJ2uzIeyJODc+r470BdeJji+Y8cjh4cSg1rrqmcZvqPMGX/6KbM
 I1/JkDvo/0HQMrDgQ3AoiR+XxGa/xRPS6CwDrI3j8lCCipDDYRDY0Har4rwK/43uR+dBNgfazVg Nl1ge81jgHEwG3TxvnSIX9qKCSjJucc3BLXl2EQCqWDHVK5JQ0C7AmPRo0pS4IrxM0BzSDKz1QH KO3xvmwZvjnS79fmA4Dz9pxC/CfSFfsd4Ahvk8B4doMJmGKniA4VIvc86gtvxHBMm5HqAiVFuLP
 olnPXqgV7s0zib7qnP896ykckNmviwp2YJByAT4jpOlFtvpgmkIGEiYx+OI4gL7T29aT1fgf
X-Proofpoint-GUID: 8USNmaABEALC_yiR0b5EtIZ0_-4sfbit
X-Proofpoint-ORIG-GUID: 8USNmaABEALC_yiR0b5EtIZ0_-4sfbit
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=68106c8b cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=F9FMNDSCD7THEPBdllMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290045

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 548dbd346b1b..a02913665801 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -107,25 +107,61 @@ static int qcom_tzmem_init(void)
 	return 0;
 }
 
-static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+/**
+ * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
+ * @paddr: Physical address of the memory to share.
+ * @size: Size of the memory to share.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function creates a SHM bridge
+ * for the given memory region with QTEE. The handle returned by this function
+ * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
 {
 	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
-	int ret;
 
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	if (qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+				       size_and_flags, QCOM_SCM_VMID_HLOS,
+				       handle))
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);
+
+/**
+ * qcom_tzmem_shm_bridge_delete() - Delete a SHM bridge.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function deletes the SHM bridge
+ * for the given memory region. The handle must be the same as the one
+ * returned by qcom_tzmem_shm_bridge_create().
+ */
+void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+	if (qcom_tzmem_using_shm_bridge)
+		qcom_scm_shm_bridge_delete(handle);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_delete);
+
+static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+{
+	int ret;
 
 	u64 *handle __free(kfree) = kzalloc(sizeof(*handle), GFP_KERNEL);
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
-					 size_and_flags, QCOM_SCM_VMID_HLOS,
-					 handle);
+	ret = qcom_tzmem_shm_bridge_create(area->paddr, area->size, handle);
 	if (ret)
 		return ret;
 
@@ -138,10 +174,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 {
 	u64 *handle = area->priv;
 
-	if (!qcom_tzmem_using_shm_bridge)
-		return;
-
-	qcom_scm_shm_bridge_delete(*handle);
+	qcom_tzmem_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index b83b63a0c049..48ac0e5454c7 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -53,4 +53,19 @@ DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 
+#if IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle);
+void qcom_tzmem_shm_bridge_delete(u64 handle);
+#else
+static inline int qcom_tzmem_shm_bridge_create(phys_addr_t paddr,
+					       size_t size, u64 *handle)
+{
+	return 0;
+}
+
+static inline void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+}
+#endif
+
 #endif /* __QCOM_TZMEM */

-- 
2.34.1


