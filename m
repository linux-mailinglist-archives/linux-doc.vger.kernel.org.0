Return-Path: <linux-doc+bounces-56996-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD51B2E8D0
	for <lists+linux-doc@lfdr.de>; Thu, 21 Aug 2025 01:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CEB1188AF50
	for <lists+linux-doc@lfdr.de>; Wed, 20 Aug 2025 23:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DA02E3376;
	Wed, 20 Aug 2025 23:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouC1PMKk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB942E175E
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733153; cv=none; b=G0Ir86tLpWiXFQWWQk5ci/dEEB7Rv5OqQT2gGF/Us3WKcshJ6XBC4cs/rbDEaQ1EWElJl2rI+U3kpe2JmlDXUH5XJY750wVZl118DSDKDvfH43dIPCJ5ALDNxE4GpVmnLElov8Gvw+BpvWtk/s62/Qh5m8uVZKdhXBeu7AwrhSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733153; c=relaxed/simple;
	bh=dj4btS5nBngEZzNyD6G+olq64Gsd811bEd2WuVW80hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYxgrQmYznRcqNj07LX4bCC5Y4Owh92m+X2eK0Ab1z+vZBWhkVpjIJXX/RtyHI/6GSrzwnZNZZ/B7MJAbkKcMwX0oLIjvuXCVSNBRS8M1GzwSN0//5ZegArFbJLfijQDRBdr/hJyzQ/xh1hWCwvde3FgOenYisl7NpXS7wODalI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouC1PMKk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIlpvU010521
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iMXGO9mmIwbbSOem/q8ehPL0WWLTaAbujfNY+yRk5M=; b=ouC1PMKkLDc4chZy
	RnUT40cUlV8PPuRmb0ch50mgU1DZbMIwe11JhCV++cPboSQk1A6pyvphQRGAifHX
	EIDxcF+YwDPActn/6BmX0ouFRK2TtRfmIXt3mXX1ePggoBtlBAlN8QDbrNx2YoA3
	tDfSEqUJx4BpmNps9BsthbAfkRRwJpgEoz3Hr3ckvvEziaCha7jDHvYvGxUzU0kE
	8OiFQu6O0gd2ER7yJeGHKpY+EOIvmj2nhh0w+bNzY9LXHPggpLdKLBHOVkW9GCLw
	GMVMJl6DD1ut2gLxsQgxbplN5NClB1YIGmujIHZ9PBpUmuCAXJkxYMGZqpPol49m
	BDxAdA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a3e9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-324e41e946eso825035a91.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 16:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733149; x=1756337949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iMXGO9mmIwbbSOem/q8ehPL0WWLTaAbujfNY+yRk5M=;
        b=X9teOQrMbJzUzZ72asEucmrhclmKHtlPd8ww/BUXqSl6ZZfDM5eMltwPd40ahZ6v9r
         jmpr2jQOPpl30TSn66SZrB5DGYeg+SO2V8eCClPPyNrcSQ6ZkG9uqYqAAYYA1VTqi3Tq
         t8Tx/m4pyxddYLSgkqLDX0DRB+RwvQd5Jklp0wkDeEuJAnVrD1Ey2uDz66IBrHNjsOnm
         Qv5mBDBSXOXjWQpi52qcjhLlNhkUvKxLm1dSKW7+KSDEmoSDnge6MBf97VMf7vVbmbdY
         ew2OVeAnBmgQfvINCTdI6bynDWq5Dw3XwgQHsTfIRtQ1iMTO80nmPwWRaKlwbsDU/j3j
         RTig==
X-Forwarded-Encrypted: i=1; AJvYcCW9CY5l6c7N3wliRhLHEDrIr1AOixzHWteUrqf5A7efbbBHU9OrMqnh7yZrlaN5t0u7rOSi0nadTyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IbpG8G8UFG0CwKwBqKLE+DXdkjc1pDM0wyKs60bB9kCCLL1k
	1oxD05v5wP03u7ixi92JRcvZn35eo8Q+vkNQS8zO23EWy/X7RIlcUkriWi6ML27Rl/+rf7Ac7e6
	bnFrSGopUOw+JoGzgJojJZm1pxMyOCQ4QM0Xqo3y7G0mZ5SNVhhRY+ikuN6zeAw==
X-Gm-Gg: ASbGncvJZYZ9mq4a4GsNaFLU/O3ZhZHHan6GB0VaI5QzghberzsBOTsrvlI9m2n6AV4
	/p6hEhyt8YYcf+6UMz5VShUTANIxjGFg+vF+ZOYtnZpMHJ7Ib4vcTrEv09iMAJTNRllSTCtNMWl
	ReCxK51zjGrG0pE3w38O7XJy3pQAF3Ciz0hdbeu8RrQ7CQH22IY1TbmHPkVHq6hhL1O8v/X5scP
	dRgrEK8sfaKKH3PPNzYuQcuEDlfQHZ86iwR6zewdEUePNlTzhBqV1k6A3TUKlT0ElHfJ1Ym7OZJ
	/5tFvsG4P9ClSkbE0tmVqtHQrD4IKTBCQLwWDuMEbqCS7R4X2OmUjC5ASp97fvwTb9wZ6VmCmPh
	WQ5SwTsYdNicKNBJTotz1T8c=
X-Received: by 2002:a17:90b:1350:b0:312:1d2d:18df with SMTP id 98e67ed59e1d1-324ed12f031mr743421a91.23.1755733149303;
        Wed, 20 Aug 2025 16:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJnTckBzzfU2t6f+Vy8t4gAdhm+ZwqA4rM9kaZxtZyzeOJtOzeyHxKTLDLIuNAeOlyqKXg4w==
X-Received: by 2002:a17:90b:1350:b0:312:1d2d:18df with SMTP id 98e67ed59e1d1-324ed12f031mr743381a91.23.1755733148715;
        Wed, 20 Aug 2025 16:39:08 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:08 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:51 -0700
Subject: [PATCH v8 04/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-4-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a65c9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=fw-SQdjKjSnpQ1BqlTsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UR8uX8EMK_6CGEf_qpgA3QGRWz2x_rYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX30Ci9QmzDZHn
 2Ts472xuraWrylZmusjEUWcLh9C1Mu9Z5qMRxO7Og8+AuKF3HOHBr8599OxDwBROayXgbPWt+lR
 gkXmBYgwJ6ya4j5xIHkbLeFjHcJ4XDZOdVuDAAOldhKPyPOCZkXadwHRozsYX0EvtAnSZcFUPEb
 k2vSxLXsCry/kd8+J3usWqy5z0Pxr35t/JlJfqc0zHnpQ6WoVlQL4hD57g7ZOdJjkemRAr/WH+T
 O7dmaP0dS2vRtnKdTM1/z3GL48QQjsf4yIbr643u13OZb+9aSalTsdPq90m5MtoDR7jltRDf1GR
 55d9Y1qlk9EKOUWH2iPspkyZEX+2gxCRxPaIdLQEqoDzP+2wxgGSTkuk1eOLFde9Bn5T/3hQaYl
 u/iDbHVtm1P+bGa9oprQVrQAgzHIuA==
X-Proofpoint-GUID: UR8uX8EMK_6CGEf_qpgA3QGRWz2x_rYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

The TEE subsystem allows session-based access to trusted services,
requiring a session to be established to receive a service. This
is not suitable for an environment that represents services as objects.
An object supports various operations that a client can invoke,
potentially generating a result or a new object that can be invoked
independently of the original object.

Add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT/INOUT to represent an
object. Objects may reside in either TEE or userspace. To invoke an
object in TEE, introduce a new ioctl. Use the existing SUPPL_RECV and
SUPPL_SEND to invoke an object in userspace.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/tee_core.h |  4 +++
 include/linux/tee_drv.h  |  6 ++++
 include/uapi/linux/tee.h | 41 +++++++++++++++++++----
 4 files changed, 130 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index ec0094291c69..c55d99f285f1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -343,6 +343,7 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
@@ -361,6 +362,11 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 				return -EFAULT;
 
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			params[n].u.objref.id = ip.a;
+			params[n].u.objref.flags = ip.b;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -434,6 +440,12 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
 			if (put_user((u64)p->u.ubuf.size, &up->b))
 				return -EFAULT;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			if (put_user(p->u.objref.id, &up->a) ||
+			    put_user(p->u.objref.flags, &up->b))
+				return -EFAULT;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (put_user((u64)p->u.memref.size, &up->b))
@@ -586,6 +598,66 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
 	return rc;
 }
 
+static int tee_ioctl_object_invoke(struct tee_context *ctx,
+				   struct tee_ioctl_buf_data __user *ubuf)
+{
+	int rc;
+	size_t n;
+	struct tee_ioctl_buf_data buf;
+	struct tee_ioctl_object_invoke_arg __user *uarg;
+	struct tee_ioctl_object_invoke_arg arg;
+	struct tee_ioctl_param __user *uparams = NULL;
+	struct tee_param *params = NULL;
+
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	if (copy_from_user(&buf, ubuf, sizeof(buf)))
+		return -EFAULT;
+
+	if (buf.buf_len > TEE_MAX_ARG_SIZE ||
+	    buf.buf_len < sizeof(struct tee_ioctl_object_invoke_arg))
+		return -EINVAL;
+
+	uarg = u64_to_user_ptr(buf.buf_ptr);
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) != buf.buf_len)
+		return -EINVAL;
+
+	if (arg.num_params) {
+		params = kcalloc(arg.num_params, sizeof(struct tee_param),
+				 GFP_KERNEL);
+		if (!params)
+			return -ENOMEM;
+		uparams = uarg->params;
+		rc = params_from_user(ctx, params, arg.num_params, uparams);
+		if (rc)
+			goto out;
+	}
+
+	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
+	if (rc)
+		goto out;
+
+	if (put_user(arg.ret, &uarg->ret)) {
+		rc = -EFAULT;
+		goto out;
+	}
+	rc = params_to_user(uparams, arg.num_params, params);
+out:
+	if (params) {
+		/* Decrease ref count for all valid shared memory pointers */
+		for (n = 0; n < arg.num_params; n++)
+			if (tee_param_is_memref(params + n) &&
+			    params[n].u.memref.shm)
+				tee_shm_put(params[n].u.memref.shm);
+		kfree(params);
+	}
+	return rc;
+}
+
 static int tee_ioctl_cancel(struct tee_context *ctx,
 			    struct tee_ioctl_cancel_arg __user *uarg)
 {
@@ -641,6 +713,12 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.ubuf.size;
 			ip.c = 0;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			ip.a = p->u.objref.id;
+			ip.b = p->u.objref.flags;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -753,6 +831,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
 				return -EFAULT;
 
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT:
+			p->u.objref.id = ip.a;
+			p->u.objref.flags = ip.b;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			/*
@@ -833,6 +916,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_open_session(ctx, uarg);
 	case TEE_IOC_INVOKE:
 		return tee_ioctl_invoke(ctx, uarg);
+	case TEE_IOC_OBJECT_INVOKE:
+		return tee_ioctl_object_invoke(ctx, uarg);
 	case TEE_IOC_CANCEL:
 		return tee_ioctl_cancel(ctx, uarg);
 	case TEE_IOC_CLOSE_SESSION:
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 284ca6b3e03a..eb891de81e12 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -72,6 +72,7 @@ struct tee_device {
  * @close_session:	close a session
  * @system_session:	declare session as a system session
  * @invoke_func:	invoke a trusted function
+ * @object_invoke_func:	invoke a TEE object
  * @cancel_req:		request cancel of an ongoing invoke or open
  * @supp_recv:		called for supplicant to get a command
  * @supp_send:		called for supplicant to send a response
@@ -97,6 +98,9 @@ struct tee_driver_ops {
 	int (*invoke_func)(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
+	int (*object_invoke_func)(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
 	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
 	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
 			 struct tee_param *param);
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index bec9a918b950..92992148b687 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -87,6 +87,11 @@ struct tee_param_ubuf {
 	size_t size;
 };
 
+struct tee_param_objref {
+	u64 id;
+	u64 flags;
+};
+
 struct tee_param_value {
 	u64 a;
 	u64 b;
@@ -97,6 +102,7 @@ struct tee_param {
 	u64 attr;
 	union {
 		struct tee_param_memref memref;
+		struct tee_param_objref objref;
 		struct tee_param_ubuf ubuf;
 		struct tee_param_value value;
 	} u;
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 3e9b1ec5dfde..441d97add53f 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -48,8 +48,10 @@
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */
 #define TEE_GEN_CAP_REG_MEM	(1 << 2)/* Supports registering shared memory */
 #define TEE_GEN_CAP_MEMREF_NULL	(1 << 3)/* NULL MemRef support */
+#define TEE_GEN_CAP_OBJREF	(1 << 4)/* Supports generic object reference */
 
-#define TEE_MEMREF_NULL		(__u64)(-1) /* NULL MemRef Buffer */
+#define TEE_MEMREF_NULL		((__u64)(-1)) /* NULL MemRef Buffer */
+#define TEE_OBJREF_NULL		((__u64)(-1)) /* NULL ObjRef Object */
 
 /*
  * TEE Implementation ID
@@ -158,6 +160,13 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
 #define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
 
+/*
+ * These defines object reference parameters.
+ */
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT	11
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT	12
+#define TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT	13
+
 /*
  * Mask for the type part of the attribute, leaves room for more types
  */
@@ -195,15 +204,16 @@ struct tee_ioctl_buf_data {
  * @attr: attributes
  * @a: if a memref, offset into the shared memory object,
  *     else if a ubuf, address of the user buffer,
- *     else a value parameter
- * @b: if a memref or ubuf, size of the buffer, else a value parameter
+ *     else if an objref, object identifier, else a value parameter
+ * @b: if a memref or ubuf, size of the buffer,
+ *     else if objref, flags for the object, else a value parameter
  * @c: if a memref, shared memory identifier, else a value parameter
  *
  * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
  * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
- * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
- * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
- * are used.
+ * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, TEE_PARAM_ATTR_TYPE_UBUF_*
+ * indicates ubuf, and TEE_PARAM_ATTR_TYPE_OBJREF_* indicates objref.
+ * TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members are used.
  *
  * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
  * identifier representing the shared memory object. A memref can reference
@@ -411,4 +421,23 @@ struct tee_ioctl_shm_register_data {
  * munmap(): unmaps previously shared memory
  */
 
+/**
+ * struct tee_ioctl_invoke_func_arg - Invokes an object in a Trusted Application
+ * @id:		[in] Object id
+ * @op:		[in] Object operation, specific to the object
+ * @ret:	[out] return value
+ * @num_params	[in] number of parameters following this struct
+ */
+struct tee_ioctl_object_invoke_arg {
+	__u64 id;
+	__u32 op;
+	__u32 ret;
+	__u32 num_params;
+	/* num_params tells the actual number of element in params */
+	struct tee_ioctl_param params[];
+};
+
+#define TEE_IOC_OBJECT_INVOKE	_IOR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
+				     struct tee_ioctl_buf_data)
+
 #endif /*__TEE_H*/

-- 
2.34.1


