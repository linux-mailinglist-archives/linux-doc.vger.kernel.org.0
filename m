Return-Path: <linux-doc+bounces-59843-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D767DB5273E
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 05:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC8F87BA421
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 03:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B8424A066;
	Thu, 11 Sep 2025 03:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeVnbJLw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BC248F66
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562095; cv=none; b=D9g/b9eag6I4vBwWJWNVh0MID0LEFdsv3/qBnMQdgQxogbiMKox9wfFprJYYf5GsQBMa4R/ikgFn6bO+wdBogldc0fccV4KZsWT/mZ3LaXpdIvsUty7Z/iV/o5z1vU/p7Bshm/dJMuhfDLcPCoNX3Dk2bYtt3X0QGPZtmrGmy4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562095; c=relaxed/simple;
	bh=/X/slCEZNUYsN1/1Kb6qKCBb1SuAXT+Ssp2opHduLeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZI8Kmo9Suq1lAEWv+iLAwkoS2iWK1Fc9FQ/LMmdG/LHfG5YdzSeN5tuR2wRCEXs1e1nybEC4EUh1C4wY6Wqi5+cPHhjiPD95ZK6c3tjBW9D48L6I15ROCq/bS/ByB2NJG2WN8WWOZt4YWfoZStkgbJo5OMK2mWRRgu9wfX4ZITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeVnbJLw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J5Pe032588
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfnro9xo+EarbMqRFrPWzRQwLLoVHW/MmAqB1i9xt2Q=; b=GeVnbJLw5Qb6NLSF
	K+I9V5+6UJzRozu1AVPFBHRNBqFo/xlaP1Tun07LFpSzEWQZd+6eTTDHr5cvOZds
	OcoGnhLN4RRqeI//u/tzlMGRrFuCT/ZAd1PTTCPJJX37+sv2kQEjBzk7FlZxMrik
	CUNe/UHqQdJu8MWGN6vAQIiEtJI+v2zbsAdxQDunPPvnbdbkg0YXcHxWsX54gb4R
	HupxtCml0LK7/uaI/QqLMd4kzlFcUL9dKBV+qSwdSNswl3otScZYV1VrhBNnpISv
	gnBnjERXypPPCL7T6HaWIJ5eHjoM7g5Bx35bpGBN0nCqBtAyAfSJ8Ui0x7t9L+As
	9uoJ8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg5x4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445806b18aso2845765ad.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 20:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562091; x=1758166891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfnro9xo+EarbMqRFrPWzRQwLLoVHW/MmAqB1i9xt2Q=;
        b=NJucMK7tP1fjmoPjB/UpnXjrsZ0w95DO3kFK55IqWQ46NE/3FIj+TpuiUB3H4Xug9V
         Gxjg+m8fHTfXIpgc9dsC98eGowGbqdaO9Mj+SuZWOmHJY7do1CjiaMuWF60w6nDwQCRd
         3dIqvMLK1E6Li2BrCYtXp+rZ1OZTCGUZrlFqvoUCtKQj5/i5BXBEbe2xk5b5sETNLJHU
         qxB8VPLHhEoXzuJYpdaxlM1kzEhR4sNE3AQ4NJ2ONkCEsJKWv8JjrnfRPmMr8hcsMMin
         Tzr0J1AxXvE1F9owaWz1TBTKdSn47WHFD+lza/GYZn4IiW9OOpHHvoj7z2BXFHZqf1iA
         OE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOjHXbHISOxPUHiP028xWA/4XbWbf8IFofIt2BJqVD7aisFaUrv2HKd87YHLuYt9E8dlHBtMmsvWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQCwbfkB/944p00/ix5UiE/WeZcM/xLYsBNiUTPnLmBEqy17G
	1gLV1qQ0JyaYdxA7NBUuDtYjYeogTnZd6UunDNpIumJ498izJCZZXi9bfklJLw8hUbdZ+F4D6vC
	Hr6TuFyCZtbagoJhQlUZrQKY09+ePU7/Z4vdDt5BZiHRuI+dvX+iZjSWiCSV27Q==
X-Gm-Gg: ASbGncscjHFzG9zMzkfM3qu8kq++YSFOoQbUCRMmzVQDqhbMMpSvNlff2Wy9Z1GiFai
	J/w+r06hX0ngDtbyuRcKDFVtDHYdebicnowo/uzCtS6U3upQluRVXLLIrbZmW1jqprI/i+W3AnY
	HOz4/MVSKEA8FLC6OLe2YEhD495ErGE5VW2QB6S55iz6SHt00xRPwzkzHkKMQK+wkITeuSJgPJv
	LKmCakJWjdT6+kzKs/bWIlZHAnX2lgYJ1gNjgpbfbkEKe2rVKIwatEYTo+Lx7C+/bKQ3eSRnF2P
	nB6B0SWqSAKUSp+bOKumUKAQjupZcKs1lZiTUSXfhrZoKhu7HRPSvfzegDnQzNzm7HqeqnN6ugz
	P0GTCozeffZpKlHI0ytMpwlE=
X-Received: by 2002:a17:902:f681:b0:250:74b2:a840 with SMTP id d9443c01a7336-25172483a34mr238752975ad.44.1757562090726;
        Wed, 10 Sep 2025 20:41:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2b0ipDRDvZkbzduHPtXWYapgLH3UaQWL1xsBCUzaccisMS56SSp8yl7NyLyuUuiRKSMRPXg==
X-Received: by 2002:a17:902:f681:b0:250:74b2:a840 with SMTP id d9443c01a7336-25172483a34mr238752765ad.44.1757562090085;
        Wed, 10 Sep 2025 20:41:30 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:29 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:17 -0700
Subject: [PATCH v11 04/11] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-4-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5F15ib3wQcAwlKmYm205vZyi8rQ4kHv0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX4raf17RMyAyF
 M+6tEQt+o8fbU6j/fW1qMxIdfjXtJ4MFQUGqM4/3+Ms3xpJWouIAQ5oh4u7G4KY6yPgT+kCJ52X
 umLbLslSnDqU9kIqDH1yM6eRDQMCP7mFPsDIvoF08W39uzNWi+hSFDrnBX0OwP2WgxIf8Wbp/XY
 dddM9CjgtZgHrup/oWLSzWZbwJLmHQEMKNpL63mKRpX7/I3DlJp7YkxydSUC1d4ScSdwz/AhqbQ
 FdzEjSUaPpcP4fG9wsTUY8oUtUaLzlvNOb8AzoU8lGkuk0qTZEnmDbwDybtPb+GYdocjReE8ZSv
 hFN76crSaH1GpXhL519qJQtSDks/OlsUKI5g71jZt/XaE4KRU/PJXCzbhsYq9pTZlwbkxkutBP0
 7G0IEws/
X-Proofpoint-GUID: 5F15ib3wQcAwlKmYm205vZyi8rQ4kHv0
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c244ec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

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
index 9fa042d80622..f8534a00c56c 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -79,6 +79,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -96,11 +97,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
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
@@ -1075,6 +1080,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1087,6 +1093,7 @@ bool tee_device_get(struct tee_device *teedev)
 	mutex_unlock(&teedev->mutex);
 	return true;
 }
+EXPORT_SYMBOL_GPL(tee_device_get);
 
 /**
  * tee_device_unregister() - Removes a TEE device
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index a9b5e4a6a8f7..6bde688bfcb1 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -23,12 +23,6 @@ struct tee_shm_dmabuf_ref {
 
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
index 7b0c1da2ca6c..456a940d4710 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -76,8 +76,9 @@ struct tee_device {
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
@@ -87,11 +88,17 @@ struct tee_device {
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
@@ -200,6 +207,24 @@ int tee_device_register_dma_heap(struct tee_device *teedev,
 				 struct tee_protmem_pool *pool);
 void tee_device_put_all_dma_heaps(struct tee_device *teedev);
 
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
@@ -374,4 +399,25 @@ struct tee_context *teedev_open(struct tee_device *teedev);
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


