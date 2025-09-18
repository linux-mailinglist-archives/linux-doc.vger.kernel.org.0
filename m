Return-Path: <linux-doc+bounces-59622-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 020BBB509B1
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 02:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDEB81C2832B
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 00:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B1C3F9C5;
	Wed, 10 Sep 2025 00:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeYwalUE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731F2AD1F
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463082; cv=none; b=PULfRYUgFG/b4sY4LBgAhAXfPGzYU3K9fNQIO5+I3k53FaVUnbwW4+KLN7KAzhXYnnmV1urAae1mLYAVQ22rtRN3lB5DRULTaNtpmc8OaTWynrTuTJ/spoxN9RFQTt/mZSRIVjqnTc7yEBVAtMVfVo+VUtR4IwDcmq136Yl6qQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463082; c=relaxed/simple;
	bh=14ZTHl0WyMlTosvSsdQcfG20Corab0amwL7v8YXssQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKXe2BndtgAye+1H/J6pqyOHYS7Klp7+DUiIhcGetZog2rLkhTekYggM8hds6s/qYsTQd/kQ05QVdW7hQYc88QsUnr/L1v1p76FzqUKVbhYyF/QUatHvwHwn15M1BupTg0i+8PGOBzi4f29oRJPLG+TDycrNESJSpv0Z5Ge1sNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeYwalUE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HqxaL030492
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=; b=QeYwalUE9RS+dIeq
	zVZqu+TYV+H2TDSg3eaaY817tAMoGXTM8pWJPQh0KTeaw/Kzg7widV4Y7aU0XwVB
	CKW/vng6q9gPW8bs0i5wqWJv4iapO5uT0LfQD48HNx6h/uNc5ltYy6LmvKSMVkp3
	m+ePDUjnZvq/DFgXFJ/6QVUNF1dwrc/D5EDV3gfjcu768fEr2pYzyrzXmUx1RYjM
	RXOQSd1grQ9qGWpg+xrWgWYzPgNA19s829QodY20JXARHOoA0B4ftzYW8ucZ6Pc7
	3bo6rpD84O/FUglj4Y3Fzj0li04QKjYkGkBWfVkeVOcYUYG9c2i20IoQK0Nsxe2L
	PZjjBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9ja3s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-324e41e946eso13268442a91.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 17:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463078; x=1758067878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=;
        b=LCPVJiDQnZgNiXzUlY2Ly/ghKTqCAHI0yaaIZfzB3FtS+vdtJKDa8b4AM9Ck3kUeg7
         2FnpnijJgk0swzvwYWq0VhtaQdcTIVBQszUyEKDTlPsQAvN1b8y03SXA2myeim+K+Z/S
         M6JLGvMs1CZCBBoNdWF6ovXqd0jlzumZqQoQc8Z5RdPILlX70Y8lUU8XhT9u3A++loKl
         /G5wOl7F1y9YPNyAyv66EPzAaT9WPx8l+H/43O0Cq7QTC2J+hn3c7c8guCjIOrrjnhdU
         VJHcuVtweUSdBbguYcKN4kAXJ3+VeYlO9xLWVze1RdpmarAUqTFynrhRZM7wh1CMKz7R
         +BHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3Enwl1ttQfChcZz6w/tH4oEybD+5PHOUtn+v3SyMt+YHQ/StG77J4JOjdwLH89ErOz2AyDaogywM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxy7yoviTMJ6+X9pgv9VJAocujv6RdvisZ/XfIK9qdLyG0Vr3
	cTFdzw13Z+VYCGYHSkXxhWb9CWpDTXqe9QMxeKL9pBrXNoYLXVfEb0pcnseayhxi96POCcsaDm0
	EhnBZ/1AhrZvkhzcBxqyfgjMTbf82CSSpyKHbXl5OXWJK3hYuR2DKqQHqPnW/zA==
X-Gm-Gg: ASbGncvKqMrzYfvXAvskbuadO5HmADoFb+S8K2t7CiiXiE1vJ10QsPXpamfAqet3XAZ
	Lm0uY5v6A5/oB0ELusLbnCbwje9N711pbGBmvBQPgdcn+POGaBEhF9mnH5TdvrTkX4KR/FhKin+
	FVJf3PF3jy33XS9ANXu/UrTXWxScjartN2nMxWdCEql19kRlOSnSut3QqXOOsXQf/4gfsqJFCR+
	PiyaqJSq/nwAAChIJ1aYBQNNQ9QlletTh35sYQ6hfLRIuC3LytRCfGXhohWVgzNmlQqEsEHv8fB
	rYWUNPvhcGMq22ANV+IU9wr7B+gUrmhC8SP0qATWnsMCTk1cQgJikmljobtlnqkpUjPZf4hD+O/
	110q/AmDu9+8Fivkr6kmddCI=
X-Received: by 2002:a17:90b:278d:b0:328:acc:da37 with SMTP id 98e67ed59e1d1-32d43f04ffamr16696063a91.5.1757463077927;
        Tue, 09 Sep 2025 17:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIXpd0nyV+5W6CDzwhd16gTLrOkaPXC+72FYq1kyJ0evnvLYFejafDZfWoW96NTJmQ+vsCsQ==
X-Received: by 2002:a17:90b:278d:b0:328:acc:da37 with SMTP id 98e67ed59e1d1-32d43f04ffamr16696027a91.5.1757463077356;
        Tue, 09 Sep 2025 17:11:17 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:16 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:03 -0700
Subject: [PATCH v10 01/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-1-20b17855ef31@oss.qualcomm.com>
References: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
In-Reply-To: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
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
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuldeep Singh <quic_kuldsing@quicinc.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXyWZKu/WCGcm5
 jCj2CwPMnZV9gUxWq/25KLDejDy9akAyQ+RzyJNxh4A2n+Z4Nfw5bFej1ZXgTR3vW/sV/s777t6
 4LZJoidG9ss2e8xLQ4Y7D4eBB13NsUpV7TodcSZFfWMlzju57bpVYV2nA9OfOpHX1uwAIhe0fsH
 EUAzLqeNVOGev7nlSDy4kLxPiATU3/1wGTdEzJpfDZPi3w8jg9iW0RenaYPUaoJlNKZxyf2uRn1
 Tf/lVVwL6TrXxdrWcMJPsOVIO1Qq5r3+Ute5+KpNeFF39OC7enJMb6aOZeBHgXyUvvXNwVegLfy
 m2kbaZNjtWYrfTyouRpcq3CEi0lu7bcPCvVLbHtB/jrlX3ivlazn8+75wpf1y7R1aaQZZFB7uL8
 llKoQOJm
X-Proofpoint-ORIG-GUID: ASAEkYQ70jK5NUjDSCtAjMRy3gTYk3Jm
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c0c227 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ASAEkYQ70jK5NUjDSCtAjMRy3gTYk3Jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Reviewed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 63 ++++++++++++++++++++++++++------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 ++++++++
 2 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 12e448669b8b..9f232e53115e 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -110,7 +110,19 @@ static int qcom_tzmem_init(void)
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
 	int ret;
@@ -118,17 +130,49 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
+	if (ret) {
+		dev_err(qcom_tzmem_dev,
+			"SHM Bridge failed: ret %d paddr 0x%pa, size %zu\n",
+			ret, &paddr, size);
+
+		return ret;
+	}
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
 
@@ -141,10 +185,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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


