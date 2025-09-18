Return-Path: <linux-doc+bounces-59625-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B67B509B8
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 02:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70705164A79
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 00:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE21B1A9FA7;
	Wed, 10 Sep 2025 00:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyBBvqZO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D8E81724
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463087; cv=none; b=kKP+Ivqez6e/syAU4xo4BNTT/9Y9mlVCReaEfOGTVnyY19qVoKFyQasn8vm7VX/03wQpUMpW6iQjs1cRXeqY7y56op1yA63bsw85uTXJBB530BPod+42GCJ3JRKaiL5G4qp9uWy3Z+vLTYxonxh5HQKu5x3Wok3y/Fc+w/rQUcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463087; c=relaxed/simple;
	bh=8TSbhEgUPN9kdxwy9KCMFyUVP58G/S0fhvuvLlT55sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECTvxHNXCZu87mVfcdwtIE0ib2UoUj3ccW/o3NFKrJJ30tNMFOdNLakSHCUKF6/8rXEfY9BSwRWQlHRZk6AgirR3D+QBNeVKSdo6RYsVhf7Gao2n/s6KeS3X3q2ncUmJdlDExR0QgU/i4gBrB/F4a83zSi8NxONXhMdnt9eKdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyBBvqZO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HR58U020143
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=; b=dyBBvqZOdh5SxqjV
	jdbIKh8nc2E3KsLOv182eqV1uZYQ4phHBm2lD8iW85CbQyvPUzFYvLlHuLETaje6
	PnzTR2Lu3m8eCMD3vLttCaZYTtxAg3BonTZzDCs9I4e0YOx76HHFzboUDI2wdeDW
	rwUfaxDa74+S+6UoXdfeQnCtfYk5q7ffsuhT0Uv/AaDtXiH4s02nONnSxgz3zco8
	DnTyF2J3lwMxfVD4XJluEwvmnmiD0bfZddLQmWn3a8CajVqGaW+M/35HuB85QPef
	4xKIgH6W2Ibt6rhgPo7CcoWjaRHlcN9IvHc4iMtCiVn0BB4X9wW2mY8TbKg0xLOW
	qvsNfg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a9x58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77422201fd8so4600223b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 17:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463084; x=1758067884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=;
        b=utMeVFUj0P7iNHJ+y3Sx0ZsQ7YbSgTeQvEbGFuGq2khmcM+oUKzrXzlioJGUFsNawL
         WnFsgDt5jIXEnRTt1bSby0ODrxzeKoOej8w5t0Q3hYUFAqoHpYY5b3Yss1ca37bOrXam
         pscAdTnccvig+QKHSVLisDLbMPeIqcwvS+s/f63t6hlNpalcJ2uxl2YJazF0ZUvBfK+h
         QttffBtruiN3P2iUxCPNiXwaUXa3pGmcuYcbV1oa/kVIB+vqJWEja4E3IxEwrhRnx122
         4JDCF1zgxaQzfzLMjYk9XlucOz2tOC9lhXf8gset9EYpLTq0/apSwidUsZ2rsHyM+SqV
         HKkA==
X-Forwarded-Encrypted: i=1; AJvYcCXnR+GPjR/QA5zMPPvNRDmyb63255e2ytRw/t66Oq7jagwuRKznQ0zDhg/Yfv1LaG7mbv8VzvkQBgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbOERUCiKlrfemerW1JmJzsOr7IMn6oC0Ae5wZlD1Kao7pNcak
	NNZrJpC3toPJIakZwL8xesCY3y3W97HpzePCgtB1PKVRf/pYzEvIULhb5kb74iLucOLLDRzkVjL
	zUG0bQ50facnKpa8laR383dFuRJ8dBvbD+fnqg4T7A21y84M+1w+t9EpGtS9Lgg==
X-Gm-Gg: ASbGncuHuWuJv4xMZi5hwTFOl1th9YlfRCJVfg7BZmF27sWaQVlFBYmB0CixfUJqBuO
	owhfP6Bfwot/WkF0zchikmiu15zastZsZAYVBwOE4K6ok5xDAoAxgarzv6OX7Lp72OFJBz2nJWK
	o+L2vp+k/Mdr9L+vNVu0LjN5n8ot961fTAUGii6WrWpp18Ee3n1S+nxJJ0lwK+mDoCWABT3Ao74
	YnPglAPpQhuAHSO3CLBWPOHHH+xZ6MhNRe9avxqyEzkwG+t5DRvErtIdAHfp3cqrDiM5qgMwcfX
	rYIVSOf8fY/zVROouhg+/fTnN3lcxZ9lBoZDf/r/dPV5sLqIhPs6Miphgl+Orjp2DSny3W7j9eB
	P4XuQfrFJhcJHuzNt6sKJJNk=
X-Received: by 2002:a05:6a20:4320:b0:24c:cb06:f0db with SMTP id adf61e73a8af0-253430ae888mr19487913637.35.1757463083409;
        Tue, 09 Sep 2025 17:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6YXV/yo/etuXH1mofBir8R0+46jHu2hZYYNv2+fbMH7+eQOvuVrW4JcNtH6BTxe1fJ2MX+Q==
X-Received: by 2002:a05:6a20:4320:b0:24c:cb06:f0db with SMTP id adf61e73a8af0-253430ae888mr19487873637.35.1757463082883;
        Tue, 09 Sep 2025 17:11:22 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:22 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:06 -0700
Subject: [PATCH v10 04/11] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-4-20b17855ef31@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c0c22c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: h7rrLKIp8RMLSoEFDDY5ZD0eB-2m_-1j
X-Proofpoint-ORIG-GUID: h7rrLKIp8RMLSoEFDDY5ZD0eB-2m_-1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX5hB7z9mqdxMr
 yHcCQvBfArvdPc3YZ8wvHEwPCcrOVSQbkMjR5eciT/O2LXbfFsJDg5EsXpYK7bk+vhwibMjCuer
 2SEoiHp7WjJkaC7eg92l6pWbrX7fkkOwf/022KEhGmoDwm9wssMYVVWBtzgDW4uGr+ygoMHIyG0
 Gg0fJWB+U2ULs1La7WW7W19/eF2P/rYTUptlj22iXOVXU5IH51G9omJU4CFose/48twkqJkGf2P
 j+vkRoJAiR5ZltAB1kteADVf/u4wSW+a/j6WN+CahNL7LOjM+n63oHv79uUTOJ9bT6gsrRXvuOm
 98ZyexWDP1uHiIXMMBKX1XauW6T8QnGz3K1zfjP0x2hY5DdjzXMUACcWLZWr+KHvfAnkveRVrVy
 kVe0mviT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

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
index 33091aa21be0..0b4c65dc14cc 100644
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
@@ -1001,6 +1006,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1013,6 +1019,7 @@ bool tee_device_get(struct tee_device *teedev)
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


