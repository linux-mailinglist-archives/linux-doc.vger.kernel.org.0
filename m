Return-Path: <linux-doc+bounces-47571-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED18AC48D1
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 08:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98D0F3A9332
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 06:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A6E20551C;
	Tue, 27 May 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzA0Q4Mf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E71DEFD2
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329049; cv=none; b=XM4V2euI0k/t5q7Sr9o3XyH3EYoCC37Wf2J43Vxhy2cGyu0HEQWcN3CWCYKBeTwN1o+lqR2Qi/RI6qYe0Ucdf+NjMH8ejSlp6y/mpamNEsVnpoqthE4QplmGvS9CsdgD0Bf5MptRgu+nfop1KLyG2YA2eSjHbYZdy/39qRx4J2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329049; c=relaxed/simple;
	bh=cT4xLgSWOqfNuREgIqfSkNTrYlsBLiswRyt83c71RTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezd/+Fcirb/yvUQSH9s1hNwZ1g90MGfbzqCoiQGbt/tGRPVYXp9bowCMkrxo86yVt7115yJ/aNm5pMAyJEVRAshWyVt0Dg7EqgwiZb11zlGB8GeWgWslMrUp0uJGJcas62pyxIwryueKl/PSVab5oVjz9NA4KyzgDWKnj2s5e44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzA0Q4Mf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R2cJMh007771
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygugRm4SsXMkb/d+FivUiOwn/n8fxWFcMiA6Lz8ODvY=; b=WzA0Q4MfOh83M+fD
	7oRXp45i0ixKCECLgsV34qTA/i9+n7Hzb5XL4oCQj6roNNE9jK7PswgsAxTwaUge
	OWXqZk28jxjeLFnkco7pAGfZoe4Y/3BUmx6IM+CkyK6HkPuDWM4fmttF9iQUb9hy
	Nqoywfe/j5+UM7C/ubbpT7aXTgIoBSn6kZcXwqCLhKSA5B/8lgJXFEW6j4acAyVJ
	cfCnL+PsRT5YEik6jArF0YPdQ0AkgSeLmIQBDNtFKGV/DvqsAEwKfd/J604uDU8e
	N+N2miyVyBg5r5n6eM0hmEEhZQft0tm3pPakovMwYruFRByuPTe421CiO4nVmHe+
	MRmu8A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5p0qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so1739160a12.2
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 23:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329039; x=1748933839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygugRm4SsXMkb/d+FivUiOwn/n8fxWFcMiA6Lz8ODvY=;
        b=jEkeJUp9L+8d2Kxpc+IsTGiY4J6Lj4YJhlzqk/2ubD0pcGo/BTAegCRkAFV8Tz2VWf
         077xrPXGZ9V+Q32CrIzx/MPKQAKxMCLIi1Mi1uSkBVInrUWNOEdlpj9n6WXj8SJQHze+
         LJiNkmXtGe7jPKUoXKOKWI8TxngQupc29jB0Nr/qRmsgDSeZFVicnH6fpteq07TV+Y0c
         JMj39+q/YEpPDBOJ8MYbZXWn9iKQc2bK0edZon0eCoWM9whIdY4XnXoMuWi7RxUXQgaz
         EiG5cxufKCFOLArtIq9MQ8WLVUcRycpsxy1NCTe/rJWCwrpKS/RlAEhYX7x0vn0U0YWV
         btDg==
X-Forwarded-Encrypted: i=1; AJvYcCXHw2E7EsA47UDrAfHZyUqzl2kyjA0ymAU2NdZS65IeDO2AgMO/FSjjfeCjZwZ2L0PoTUlDEX7hO2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrw4dCXDzOovPRqPdZZv8D2r7AC0gOu7FjSPyrapnAp/IlYNco
	xSPUerA+lJ3CxW4FwEz4ixc1ZpqrigEKrDP4n8VLnjMaZlaxZWq6VhEVCEa1wxQillk3fKmM0en
	K+PQasAteXyENjYHvELAU3FzOSF9meJ4ipxJcnqPjVoXaTfLZyVbN4cJLKcClmA==
X-Gm-Gg: ASbGnctRh7j1CrJnQoMhGfkML+JYGQshnZfiPS1ocUI/G9QTNvyMKY0dYBoMfE34u12
	NiEddDrRgsLZJhCnJu8WM5gMkaX4InHBUKklCRMNJ+cL5La7BamR1vppMPyg2vaEvLXWv0bYOX7
	Zj6JV+zk+RMLzmRYrv/xkHq1b7aY4Su3MQv/hIQKqd5rZnqUJd3cjvxLa0dlW7J1ZYJHpyWdj+l
	5WqovNo4a4fk//ErL5/laihaVJ8x3g9HkjLyw+JgeYhaa5BIH0cv6wupV+dOnsLHU0C3JKcpy7d
	ZVv9n42mqc3zsPuATvh+5rvJMutA3h10AXhJ9JMjf69KHhDK4tq+j2QYvrXBeO4bTPQyOXI=
X-Received: by 2002:a05:6a20:9d90:b0:215:db66:2a32 with SMTP id adf61e73a8af0-2188c34144cmr16951458637.33.1748329038790;
        Mon, 26 May 2025 23:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXEN+b4LBU0sjDfJGjW0s5KtMVUe6w1X1BROAUzJDl+VzOFSY+j3GfW20682wQFapRYyItgQ==
X-Received: by 2002:a05:6a20:9d90:b0:215:db66:2a32 with SMTP id adf61e73a8af0-2188c34144cmr16951418637.33.1748329038363;
        Mon, 26 May 2025 23:57:18 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:17 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:47 -0700
Subject: [PATCH v5 02/12] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-2-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6835624f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX7D56k6R32ICq
 lSqC8MSjTMSQ2/s1OR0v2OOIi9o3EC3maxftV6jZ75tpA8GQI4GA1EtA/bCVkYSwArxOqwIrRpI
 MmJQ0rfwFI+5him6hzxerZJf3Pb6wIwoeUv833wWBJQBVPjdB87upsQzA+x7BPu3e3gEmPYznZ+
 ra37LFicusr48jdWLJCuGk4U3WwuZPVZ+O8sNtRozfkVQY6vxTP6w/pHSebYY6EsiuuNc9PWOxU
 km9cVhL4bere0ybw3nBblL6CNWxa6whd+Ju6BN7Ps1teowpJIzI1vmF0WCIGequaRK5g3xdKTaK
 uRI+k/dDWtiZIr5y8dyNDcvfMapcwWIyG1Y4LB08yqieeZuOP1P5QkqO7S+XdFZMQ5lYj1ArvSQ
 g3l7YWTSAwZhP6UyKA2hHfpdwTIllZqWDq2MQaOLEfVlR9BaDORxAua1qeugn2sLd6N9XIKD
X-Proofpoint-GUID: y1buU1QD1q1eEoxOLRQu9l8wayXCrMY0
X-Proofpoint-ORIG-GUID: y1buU1QD1q1eEoxOLRQu9l8wayXCrMY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

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


