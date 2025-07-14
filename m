Return-Path: <linux-doc+bounces-52953-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE8B033DC
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jul 2025 02:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B5CB3B951E
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jul 2025 00:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE791A5BBF;
	Mon, 14 Jul 2025 00:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p09MScsi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D71922F6
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454225; cv=none; b=UIsrd0cTHuD5CYT6hnLq4dIDgjTaSYWjkUZZ4exOP7Cf2engjtgCC9RSWwQYYzOA19q+GNn6eS71L+HA8zweFejbZrzAKLTwVJ4hZtffu/2o00GXKBs/fHtZuBQL3Y8zYcIHRZ3kaG3ufGQlrh0DImBRA2aX3wxBJEXsefdxSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454225; c=relaxed/simple;
	bh=/7EXQJB73/5gvIoUTG6KNRo3AVFSgdFix2K94IEW4HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sr/VitZaGSR5oG7ciwBm+f6DN0PSOjmlYYzLt4oqifbFyg4QK0ksLpINM2evHrb/R+jdLa1ZMmb2fszXFT6Px6Vhl0owIAep31yIlocAfgYTGCENL9yqQH62/ZvGGvwFQfVLWkN/74vJeKQ7/h6+g5A/o6Z1qD/m7QdHWcA7qOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p09MScsi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DJJZpx002917
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QvkKKmGa22ueSGt3EngA9F+r5r19tnVaQ1z09ewqLKU=; b=p09MScsiKDK6DM53
	DAhUDQah5I2Tl5ACEoaNgdyS6NZ/0wIoRefyau03Qni+RzdH1KEER4tGq1nqa40x
	EbkkEk8Nwss6S7LhrSG8y5n4oN80pno/CHHeBJFBTT6FgthVy0nUvL6pZWU84vlO
	TllYBfcetWPomThXp/zDDvx3Mwv6du03PAaGpkL2USJhl5s9PNTye1lbwzLg4Ctc
	AuJro/wV5g4Ef+ugpqwnJuqrz2ARrzmpAdCMatd+IlnAXa2+BRfk8pJdc1KatU9x
	umOdGQ9sj7P7LcigSSYZXJDQ7gsJPHMJrx9e1ovA7w4dlFdRLqkFl7uxhMPFDXfY
	/Hryfg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvxaugc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 00:50:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce66d7cso64680125ad.1
        for <linux-doc@vger.kernel.org>; Sun, 13 Jul 2025 17:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454221; x=1753059021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvkKKmGa22ueSGt3EngA9F+r5r19tnVaQ1z09ewqLKU=;
        b=DLbQcbDCrSYujslgs/nPlvZtEt8kDpEas2LNvF/uV76XM8u1TNqyp20F+SyRnWcYjW
         WDXhjmBPoiur2mZzeDFEYeqgYIDL3dbzxCDjaS7DbtE31B8fofVuGAR5t3o7bi2EaDsG
         SHFw3ynChkPnl8w3bvwZorIU0UekHLtmH6dAJrh5QVs738++b/VY12CjwviikPm4cmEO
         bBccMVwpqNUPB33u2ztGaC8wkzh0e6efrThl9fIQRtJNkNOZj97tLhaJTkhxBHxHew/Q
         NufZbGFOSpVDc7DH4/2O3V59/iKs4fUPKGg8CEodnK28b6w3gliAuCUPcXiQWrbOuF9Y
         GkWg==
X-Forwarded-Encrypted: i=1; AJvYcCXXmAnvXKhWk9s1Oj6mEl0efes9kCmn1cFpn4PgveQ6QOIEwQaG9yLxv32u6KQk7zZQeWUiZKr1IoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyIIpgdtzNNLIhX7RQ0pI/+9GTaSxg7+a+NXjqkmpecrAt27Ds
	9NQxVo5GozydrifIKacKkEVyhs5HYVrsKzZgJuDuh6wnHPnjDANgLJPi2SGKfdhCZwgUdsLOjWD
	BqYcNL0+u9Ji8qN6lAtLvUV14Ydz2KZPt58IgIW6fuWnWV4t3AlyZlld7bW0gzA==
X-Gm-Gg: ASbGncs43L3en72pFstlaZxryY/FYQ+N+TKvW7WteCt7+r8+ziowFzgeoUa4giYMGaz
	PeRXVqHOWPkvE1Xp30PLjUR3Y5Rre75fym7Gf03OT9I0sGZMkp2Gj5mmqQmkVQste7MBeTYpb+4
	/sI8EeNib3ZVyP4NiFdeGtbUNqCcQn0txnWAEQ+ZJe5R9xw+UuSCTyFistta2UtAMXYPhI00fmR
	hMqbPDrf3FFByjsyB4m0yon4mx7wVbxNmOlRrBU6pH1xb5eW1rPRZ3lOsdh7zq5bX/RuXeQlQI5
	zcOiVyWkCVxdKAi5AF8pWqhPz/Kdyhzlgvqk7xCXg/pyMf8nGW27CGCHFxJ/YU4uTdnV0DznLWn
	+W80eNdYMvvl6pykqydPjjwc=
X-Received: by 2002:a17:902:cf0e:b0:235:f078:473e with SMTP id d9443c01a7336-23dee262fb5mr193358245ad.43.1752454221390;
        Sun, 13 Jul 2025 17:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5X0qUNlSCOYZOXc+6fFe7qW/RjprPxFG+s/k+fDKrAs5f5Q2JYKfn8YqH6S388QYdLFb30A==
X-Received: by 2002:a17:902:cf0e:b0:235:f078:473e with SMTP id d9443c01a7336-23dee262fb5mr193357925ad.43.1752454220976;
        Sun, 13 Jul 2025 17:50:20 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:20 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:14 -0700
Subject: [PATCH v6 02/12] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-2-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: vbbZgD5qAFzjV7b6pnSu50-cIMzze9eZ
X-Proofpoint-ORIG-GUID: vbbZgD5qAFzjV7b6pnSu50-cIMzze9eZ
X-Authority-Analysis: v=2.4 cv=achhnQot c=1 sm=1 tr=0 ts=6874544e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX8d4WkMqwfHER
 kuceLBlF74lmYm+2+PRDsYMt8Tn3cgYRr/N9HH39kn597LFAHjgXTjO7/FYgEGvTzKmRgf0A/tB
 PPPL6OTWkEvQU9Bv93yE9Ei86fISPSFo1rYXMdHnGdg1hAjDgntN04IdfEcx66uvxnRpPorTowZ
 LTb5Pz7w2U3NzXFBPLy1zcGm/K+TafGsgPKXFCQ4J8875FuVZJ2nWHq8TL90gy9q1AlOt8RRzOT
 laqoK2s6zRRQUBvv4grYL1F/R5DDlXV7I+nxzXwGe5/yjUPO+M7FEVbuXNjRfFWiIZfdJ/WyY8g
 GqTYxWzeIVfHToWle/jwk7MUGIZkF/vZD449EGcOgrKsCcpCHQ+1cTkBmLAffyRU0BOlTPO/j2/
 R7dzlmHaYPaQiU1FLZBPkLuF7Rw8crS443kJ027yiXVMen8mRJYfGsa4r1B1ULEuVFALh4Zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002

The tee_context can be used to manage TEE user resources, including
those allocated by the driver for the TEE on behalf of the user.
The release() callback is invoked only when all resources, such as
tee_shm, are released and there are no references to the tee_context.

When a user closes the device file, the driver should notify the
TEE to release any resources it may hold and drop the context
references. To achieve this, a close_context() callback is
introduced to initiate resource release in the TEE driver when
the device file is closed.

Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
tee_device_get functions to tee_core.h to make them accessible
outside the TEE subsystem.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 133447f25065..b9ea5a85278c 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -80,6 +80,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -97,11 +98,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
 	kref_put(&ctx->refcount, teedev_ctx_release);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_put);
 
 void teedev_close_context(struct tee_context *ctx)
 {
 	struct tee_device *teedev = ctx->teedev;
 
+	if (teedev->desc->ops->close_context)
+		teedev->desc->ops->close_context(ctx);
+
 	teedev_ctx_put(ctx);
 	tee_device_put(teedev);
 }
@@ -1038,6 +1043,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1050,6 +1056,7 @@ bool tee_device_get(struct tee_device *teedev)
 	mutex_unlock(&teedev->mutex);
 	return true;
 }
+EXPORT_SYMBOL_GPL(tee_device_get);
 
 /**
  * tee_device_unregister() - Removes a TEE device
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 9bc50605227c..d3f40a03de36 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -14,12 +14,6 @@
 
 int tee_shm_get_fd(struct tee_shm *shm);
 
-bool tee_device_get(struct tee_device *teedev);
-void tee_device_put(struct tee_device *teedev);
-
-void teedev_ctx_get(struct tee_context *ctx);
-void teedev_ctx_put(struct tee_context *ctx);
-
 struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index a38494d6b5f4..284ca6b3e03a 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -65,8 +65,9 @@ struct tee_device {
 /**
  * struct tee_driver_ops - driver operations vtable
  * @get_version:	returns version of driver
- * @open:		called when the device file is opened
- * @release:		release this open file
+ * @open:		called for a context when the device file is opened
+ * @close_context:	called when the device file is closed
+ * @release:		called to release the context
  * @open_session:	open a new session
  * @close_session:	close a session
  * @system_session:	declare session as a system session
@@ -76,11 +77,17 @@ struct tee_device {
  * @supp_send:		called for supplicant to send a response
  * @shm_register:	register shared memory buffer in TEE
  * @shm_unregister:	unregister shared memory buffer in TEE
+ *
+ * The context given to @open might last longer than the device file if it is
+ * tied to other resources in the TEE driver. @close_context is called when the
+ * client closes the device file, even if there are existing references to the
+ * context. The TEE driver can use @close_context to start cleaning up.
  */
 struct tee_driver_ops {
 	void (*get_version)(struct tee_device *teedev,
 			    struct tee_ioctl_version_data *vers);
 	int (*open)(struct tee_context *ctx);
+	void (*close_context)(struct tee_context *ctx);
 	void (*release)(struct tee_context *ctx);
 	int (*open_session)(struct tee_context *ctx,
 			    struct tee_ioctl_open_session_arg *arg,
@@ -154,6 +161,24 @@ int tee_device_register(struct tee_device *teedev);
  */
 void tee_device_unregister(struct tee_device *teedev);
 
+/**
+ * tee_device_get() - Increment the user count for a tee_device
+ * @teedev: Pointer to the tee_device
+ *
+ * If tee_device_unregister() has been called and the final user of @teedev
+ * has already released the device, this function will fail to prevent new users
+ * from accessing the device during the unregistration process.
+ *
+ * Returns: true if @teedev remains valid, otherwise false
+ */
+bool tee_device_get(struct tee_device *teedev);
+
+/**
+ * tee_device_put() - Decrease the user count for a tee_device
+ * @teedev: pointer to the tee_device
+ */
+void tee_device_put(struct tee_device *teedev);
+
 /**
  * tee_device_set_dev_groups() - Set device attribute groups
  * @teedev:	Device to register
@@ -315,4 +340,25 @@ struct tee_context *teedev_open(struct tee_device *teedev);
  */
 void teedev_close_context(struct tee_context *ctx);
 
+/**
+ * teedev_ctx_get() - Increment the reference count of a context
+ * @ctx: Pointer to the context
+ *
+ * This function increases the refcount of the context, which is tied to
+ * resources shared by the same tee_device. During the unregistration process,
+ * the context may remain valid even after tee_device_unregister() has returned.
+ *
+ * Users should ensure that the context's refcount is properly decreased before
+ * calling tee_device_put(), typically within the context's release() function.
+ * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
+ * and release them simultaneously (see shm_alloc_helper()).
+ */
+void teedev_ctx_get(struct tee_context *ctx);
+
+/**
+ * teedev_ctx_put() - Decrease reference count on a context
+ * @ctx: pointer to the context
+ */
+void teedev_ctx_put(struct tee_context *ctx);
+
 #endif /*__TEE_CORE_H*/

-- 
2.34.1


