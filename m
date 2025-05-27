Return-Path: <linux-doc+bounces-47576-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B00AC48E1
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 08:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8C2D179D04
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 06:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19E8214211;
	Tue, 27 May 2025 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUxkMSpa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95504212FA0
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329058; cv=none; b=eHxDrV3cniJYc9VZxqraXkHA6lQpZAOSEm8BvYogRW5HlSC4CNzQvGmWnpNWHzQPeEmm0pYbZQxd1JpMNmFnFeMmenJY/+S2MIuOxdj5h0dk0W5UKqk2Hd/FWGJEpMdZ1lvPrJy+TxKNCcXpW1HmuKjT8zCyFeMdWyMJMcql8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329058; c=relaxed/simple;
	bh=Y/NKqwtnTjZCD2ugR+R3VlfaBOr86244ROBLgncJGvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSsWc4LrPbPU332E+BFlNczYwWQABjKlgkzrZB2wBNSdPDnoNr4hMAXBdG9ehJCwp0CTCPCfrDJuah0RSzpY6CX2NC6uFGszS+SkS+srPVuMIwkw7c6Sgu20BY0qtpZg09tLZgfYBE7QGPJw//Ok8BDugxxDgW4yoA5M9tgOmDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUxkMSpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R00Y6A022777
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgz//liGBEZwvdT40SnUQpdZ8TbRrNfrqmfkvy0QlfE=; b=cUxkMSpaaYtmNv8F
	50x2CEszAqrWKgk7sxlndnZTm+U5tlyXzKKYsy7EJ7bvbMkq6EG3Wj0Vu3Q3xkkc
	E4yqDdiNEK44wV113DbIj1M/yTbsi06qgbXOs78LfmB7KF+M900abgEqdt12W3Jg
	YRySLASP0xgHZzpTBvnpkM35zt67AihBu/vUnvBzgqzyJ5pMmnBgch4y232jQSF9
	nbify4KbcC/Im7+7gzQ+9SIpTXBfZ/IESv0xvacQn02DKnvtQbazoWbmbx0CPQr0
	WCQw4JPcqjya3KRyjncaKFBdttQB/d0NSxa8o4h+O2LiU8qIyh/UMFYqe3L/X/nX
	KTs/3w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8wwyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e73d375aso3096972a12.2
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 23:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329054; x=1748933854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgz//liGBEZwvdT40SnUQpdZ8TbRrNfrqmfkvy0QlfE=;
        b=CRIafFVIusv1yqkttPPLMaVC6/993EDuKeIfUosQF5SrdbYAE72sHKbL1wVfoVtOnj
         42il87AB4vdojCStgV2DeKA5GHiwCYM6lSYDL52Oq1ayhQxwUaLZMMnSanZxZ2wYNDZp
         WojIxlbZtWSab8pZJvIP1FPbbYJEkXDuXU8LE2HjoAxkAcAGwh9BOrslRf3OX8yWnaTU
         e934iuuR867aVhRLWj1W1qwFdy3Uo3Rg3dmXekAI6/jK3C8jCtvScQ8rS43HU881MWeK
         yqoWpXbM4DUX9UNtj6kG2RiL1/0l/PklJAnHo98m1bmWCoVfURNQCvB86RUU6r1f3jKa
         LXZw==
X-Forwarded-Encrypted: i=1; AJvYcCVLY4mwz6CwPWYWYsXWUDv7ri3dVHUvzUNHKB2lWDHnPOQGuuaJhsAX94nnuUFGauSk+jQZOgtFO60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxm2C05bhErSwAYGVaKuZwScVwBLwb/J0j4F2TZUs63YQJcDSH
	9boqkir7FTzUSTAqJWFHet/IYDXoKjQxV7P8z4d3wV9M3/liFIFDzCXoJ7HmAkHOtgI32HFu/r9
	0z36yOeh9k0eOpvSfS8xrZXjciiGj0mQ6N3qZIi/tn9XOSiijLY0D7jmoSBMq8Q==
X-Gm-Gg: ASbGncuNJCQr2RBwNRk6MK5Ap5pCNkCzicUJJ4RsM6VtobhbtM9GGNcC85wgg7QsAQT
	mQ6KMn475C4pn/OTmjHaj+YOSz4ZPgo+mjbbrsDmalogQdmEcJ6JdupskZMGEanimoNwLmiG4pB
	LO3HAA8qKpGhm1+2xIMovTD+TXBPgXJ2tXAdH5f6dMxrJmSjtvA0hh1krQ/1IW7M2lz6b2pWZXA
	zERJp95Wz8VJKsnORmSqnaBCAc30lL3EvMpabwrU7VhTi8Z7JfNCe1BlMsbHZzfAplVs9IcBZZZ
	0PQSNvNCvwoSWjz/hwho917kqpgcqX4xbWx0uYNIp2ttJnTiG2Pp4d4t8ZBrWLc6HFrHfps=
X-Received: by 2002:a05:6a20:cf8c:b0:204:4573:d856 with SMTP id adf61e73a8af0-2188c1e7e13mr17412685637.4.1748329053959;
        Mon, 26 May 2025 23:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHswsc6WIOzF5kkWbGSyt8pqBiz02qV3ApczQkkC3AGWDd8ZSJsd1qRlrlmqAyShC14qzDg1A==
X-Received: by 2002:a05:6a20:cf8c:b0:204:4573:d856 with SMTP id adf61e73a8af0-2188c1e7e13mr17412653637.4.1748329053483;
        Mon, 26 May 2025 23:57:33 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:32 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:56 -0700
Subject: [PATCH v5 11/12] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-11-024e3221b0b9@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6835625f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OR1utrCcES5rRZ7Z870A:9 a=pAO9heLGEKS4qVLa:21 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Gcwsgum9evolc4Tk-1Et0yb7v38Xs0mM
X-Proofpoint-GUID: Gcwsgum9evolc4Tk-1Et0yb7v38Xs0mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX3wGatTEccRwn
 1kGc8ykoZnRSbB/sNtlnfYoXu/57Jb8MWTTZ8g/+IF8fdvoqKnE5K4OI8S6lwBOzrx9n0XuGbWu
 TmecPPZdm3HxDve0aNx2YPaBqV1cwH1NQqz7ggZuYoU6t9ZIzkvtoyOgdBSYyrCNC9RQHqGFQ4P
 qyWvZodxTbCdu+MvEFCXFax+hND6d0SCoMZMtrBVuR1ys6JsL+z8Bjw/3yV/R9zOTX5AjROUaxI
 Lk0dnBANW7mBZwFvw3i5SQVD9E4GbLyFDFF/qcOzeZetp6HlFzti1m2D7qSvVjzf9B23s0tzejX
 Bk9RerCqqcCC/Z9hd7ZX4glCH5DAF9GFu+w49ujXEqYwUO6oAYQiEWxSc4d5rwy06/1BXonSsa/
 2Lov9x/a8vkI0iwVZGAjYyHxLBvgLwVyhNRxgc8NZULiFkpxtk+o66iL9oEDiu+kNGEily10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

Enable userspace to allocate shared memory with QTEE. Since
QTEE handles shared memory as object, a wrapper is implemented
to represent tee_shm as an object. The shared memory identifier,
obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile         |   1 +
 drivers/tee/qcomtee/call.c           |  10 +-
 drivers/tee/qcomtee/mem_obj.c        | 172 +++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/primordial_obj.c |  50 ++++++++++
 drivers/tee/qcomtee/qcomtee.h        |  39 ++++++++
 drivers/tee/qcomtee/shm.c            |   3 -
 6 files changed, 270 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 78f8e899d143..7c466c9f32af 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += mem_obj.o
 qcomtee-objs += primordial_obj.o
 qcomtee-objs += shm.o
 qcomtee-objs += user_obj.o
diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index cd117295fce3..b3074d1bbae4 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -114,8 +114,8 @@ void qcomtee_context_del_qtee_object(struct tee_param *param,
  * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
  * the caller should manage to put it afterward.
  *
- * For user objects (i.e. (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_USER)),
- * qcomtee_user_param_to_object() calls qcomtee_object_get() to keep a
+ * For non-QTEE objects (i.e. !(param->u.objref.flags &
+ * QCOMTEE_OBJREF_FLAG_TEE)), qcomtee_object_get() is called to keep a
  * temporary copy for the driver as the release of objects are asynchronous
  * and they may go away even before returning from the invocation.
  *
@@ -139,6 +139,9 @@ int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
 	/* param is a QTEE object: */
 	} else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE) {
 		err = qcomtee_context_find_qtee_object(&arg->o, param, ctx);
+	/* param is a memory object: */
+	} else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_MEM) {
+		err = qcomtee_memobj_param_to_object(&arg->o, param, ctx);
 	} else {
 		err = -EINVAL;
 	}
@@ -185,6 +188,9 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
 		if (is_qcomtee_user_object(object))
 			err = qcomtee_user_param_from_object(param, object,
 							     ctx);
+		else if (is_qcomtee_memobj_object(object))
+			err = qcomtee_memobj_param_from_object(param, object,
+							       ctx);
 		else
 			err = -EINVAL;
 
diff --git a/drivers/tee/qcomtee/mem_obj.c b/drivers/tee/qcomtee/mem_obj.c
new file mode 100644
index 000000000000..347ba98a2d97
--- /dev/null
+++ b/drivers/tee/qcomtee/mem_obj.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/mm.h>
+
+#include "qcomtee.h"
+
+/**
+ * DOC: Memory and Mapping Objects
+ *
+ * QTEE uses memory objects for memory sharing with Linux.
+ * A memory object can be a standard dma_buf or a contiguous memory range,
+ * e.g., tee_shm. A memory object should support one operation: map. When
+ * invoked by QTEE, a mapping object is generated. A mapping object supports
+ * one operation: unmap.
+ *
+ *  (1) To map a memory object, QTEE invokes the primordial object with
+ *      %QCOMTEE_OBJECT_OP_MAP_REGION operation; see
+ *      qcomtee_primordial_obj_dispatch().
+ *  (2) To unmap a memory object, QTEE releases the mapping object which
+ *      calls qcomtee_mem_object_release().
+ *
+ * The map operation is implemented in the primordial object as a privileged
+ * operation instead of qcomtee_mem_object_dispatch(). Otherwise, on
+ * platforms without shm_bridge, a user can trick QTEE into writing to the
+ * kernel memory by passing a user object as a memory object and returning a
+ * random physical address as the result of the mapping request.
+ */
+
+struct qcomtee_mem_object {
+	struct qcomtee_object object;
+	struct tee_shm *shm;
+	/* QTEE requires these felids to be page aligned. */
+	phys_addr_t paddr; /* Physical address of range. */
+	size_t size; /* Size of the range. */
+};
+
+#define to_qcomtee_mem_object(o) \
+	container_of((o), struct qcomtee_mem_object, object)
+
+static struct qcomtee_object_operations qcomtee_mem_object_ops;
+
+/* Is it a memory object using tee_shm? */
+int is_qcomtee_memobj_object(struct qcomtee_object *object)
+{
+	return object != NULL_QCOMTEE_OBJECT &&
+	       typeof_qcomtee_object(object) == QCOMTEE_OBJECT_TYPE_CB &&
+	       object->ops == &qcomtee_mem_object_ops;
+}
+
+static int qcomtee_mem_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				       struct qcomtee_object *object, u32 op,
+				       struct qcomtee_arg *args)
+{
+	return -EINVAL;
+}
+
+static void qcomtee_mem_object_release(struct qcomtee_object *object)
+{
+	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
+
+	/* Matching get is in qcomtee_memobj_param_to_object(). */
+	tee_shm_put(mem_object->shm);
+	kfree(mem_object);
+}
+
+static struct qcomtee_object_operations qcomtee_mem_object_ops = {
+	.release = qcomtee_mem_object_release,
+	.dispatch = qcomtee_mem_object_dispatch,
+};
+
+/**
+ * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
+ * It calls qcomtee_object_get() to keep a copy of @object for the driver
+ * as well as a copy for QTEE.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
+				   struct tee_param *param,
+				   struct tee_context *ctx)
+{
+	struct qcomtee_mem_object *mem_object __free(kfree) = NULL;
+	struct tee_shm *shm;
+	int err;
+
+	mem_object = kzalloc(sizeof(*mem_object), GFP_KERNEL);
+	if (!mem_object)
+		return -ENOMEM;
+
+	shm = tee_shm_get_from_id(ctx, param->u.objref.id);
+	if (IS_ERR(shm))
+		return PTR_ERR(shm);
+
+	/* mem-object wrapping the memref. */
+	err = qcomtee_object_user_init(&mem_object->object,
+				       QCOMTEE_OBJECT_TYPE_CB,
+				       &qcomtee_mem_object_ops, "tee-shm-%d",
+				       shm->id);
+	if (err) {
+		tee_shm_put(shm);
+
+		return err;
+	}
+
+	mem_object->paddr = shm->paddr;
+	mem_object->size = shm->size;
+	mem_object->shm = shm;
+
+	*object = &no_free_ptr(mem_object)->object;
+	qcomtee_object_get(*object);
+
+	return 0;
+}
+
+/* Reverse what qcomtee_memobj_param_to_object() does. */
+int qcomtee_memobj_param_from_object(struct tee_param *param,
+				     struct qcomtee_object *object,
+				     struct tee_context *ctx)
+{
+	struct qcomtee_mem_object *mem_object;
+
+	mem_object = to_qcomtee_mem_object(object);
+	/* Sure if the memobj is in a same context it is originated from. */
+	if (mem_object->shm->ctx != ctx)
+		return -EINVAL;
+
+	param->u.objref.id = mem_object->shm->id;
+	param->u.objref.flags = QCOMTEE_OBJREF_FLAG_MEM;
+
+	/* Passing shm->id to userspace; drop the reference. */
+	qcomtee_object_put(object);
+
+	return 0;
+}
+
+/**
+ * qcomtee_mem_object_map() - Map a memory object.
+ * @object: memory object.
+ * @map_object: created mapping object.
+ * @mem_paddr: physical address of the memory.
+ * @mem_size: size of the memory.
+ * @perms: QTEE access permissions.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_mem_object_map(struct qcomtee_object *object,
+			   struct qcomtee_object **map_object, u64 *mem_paddr,
+			   u64 *mem_size, u32 *perms)
+{
+	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
+
+	/* Reuses the memory object as a mapping object by re-sharing it. */
+	qcomtee_object_get(&mem_object->object);
+
+	*map_object = &mem_object->object;
+	*mem_paddr = mem_object->paddr;
+	*mem_size = mem_object->size;
+	*perms = QCOM_SCM_PERM_RW;
+
+	return 0;
+}
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
index 025346cde835..556e81083f55 100644
--- a/drivers/tee/qcomtee/primordial_obj.c
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -17,18 +17,31 @@
  * for native kernel services or privileged operations.
  *
  * We support:
+ *  - %QCOMTEE_OBJECT_OP_MAP_REGION to map a memory object and return mapping
+ *    object and mapping information (see qcomtee_mem_object_map()).
  *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
  *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
  */
 
+#define QCOMTEE_OBJECT_OP_MAP_REGION 0
 #define QCOMTEE_OBJECT_OP_YIELD 1
 #define QCOMTEE_OBJECT_OP_SLEEP 2
 
+/* Mapping information format as expected by QTEE. */
+struct qcomtee_mapping_info {
+	u64 paddr;
+	u64 len;
+	u32 perms;
+} __packed;
+
 static int
 qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 				struct qcomtee_object *primordial_object_unused,
 				u32 op, struct qcomtee_arg *args)
 {
+	struct qcomtee_mapping_info *map_info;
+	struct qcomtee_object *mem_object;
+	struct qcomtee_object *map_object;
 	int err = 0;
 
 	switch (op) {
@@ -36,6 +49,7 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 		cond_resched();
 		/* No output object. */
 		oic->data = NULL;
+
 		break;
 	case QCOMTEE_OBJECT_OP_SLEEP:
 		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
@@ -47,6 +61,29 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 		msleep(*(u32 *)(args[0].b.addr));
 		/* No output object. */
 		oic->data = NULL;
+
+		break;
+	case QCOMTEE_OBJECT_OP_MAP_REGION:
+		if (qcomtee_args_len(args) != 3 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_OB ||
+		    args[1].type != QCOMTEE_ARG_TYPE_IO ||
+		    args[2].type != QCOMTEE_ARG_TYPE_OO ||
+		    args[0].b.size < sizeof(struct qcomtee_mapping_info))
+			return -EINVAL;
+
+		map_info = args[0].b.addr;
+		mem_object = args[1].o;
+
+		qcomtee_mem_object_map(mem_object, &map_object,
+				       &map_info->paddr, &map_info->len,
+				       &map_info->perms);
+
+		args[2].o = map_object;
+		/* One output object; pass it for cleanup to notify. */
+		oic->data = map_object;
+
+		qcomtee_object_put(mem_object);
+
 		break;
 	default:
 		err = -EINVAL;
@@ -55,8 +92,21 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 	return err;
 }
 
+/* Called after submitting the callback response. */
+static void qcomtee_primordial_obj_notify(struct qcomtee_object_invoke_ctx *oic,
+					  struct qcomtee_object *unused,
+					  int err)
+{
+	struct qcomtee_object *object = oic->data;
+
+	/* If err, QTEE did not obtain mapping object. Drop it. */
+	if (object && err)
+		qcomtee_object_put(object);
+}
+
 static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
 	.dispatch = qcomtee_primordial_obj_dispatch,
+	.notify = qcomtee_primordial_obj_notify,
 };
 
 struct qcomtee_object qcomtee_primordial_object = {
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f3a5c4658792..2285dfe6ab6b 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -15,6 +15,7 @@
 /* Flags relating to object reference. */
 #define QCOMTEE_OBJREF_FLAG_TEE		BIT(0)
 #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
+#define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
 
 /**
  * struct qcomtee - Main service struct.
@@ -224,4 +225,42 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 /* (2) Primordial Object. */
 extern struct qcomtee_object qcomtee_primordial_object;
 
+/* (3) Memory Object API. */
+
+/* Is it a memory object using tee_shm? */
+int is_qcomtee_memobj_object(struct qcomtee_object *object);
+
+/**
+ * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
+				   struct tee_param *param,
+				   struct tee_context *ctx);
+
+/* Reverse what qcomtee_memobj_param_to_object() does. */
+int qcomtee_memobj_param_from_object(struct tee_param *param,
+				     struct qcomtee_object *object,
+				     struct tee_context *ctx);
+
+/**
+ * qcomtee_mem_object_map() - Map a memory object.
+ * @object: memory object.
+ * @map_object: created mapping object.
+ * @mem_paddr: physical address of the memory.
+ * @mem_size: size of the memory.
+ * @perms: QTEE access permissions.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_mem_object_map(struct qcomtee_object *object,
+			   struct qcomtee_object **map_object, u64 *mem_paddr,
+			   u64 *mem_size, u32 *perms);
+
 #endif /* QCOMTEE_H */
diff --git a/drivers/tee/qcomtee/shm.c b/drivers/tee/qcomtee/shm.c
index ab1182bb84ee..ae04458492be 100644
--- a/drivers/tee/qcomtee/shm.c
+++ b/drivers/tee/qcomtee/shm.c
@@ -117,9 +117,6 @@ static int qcomtee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
 static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
 			 size_t size, size_t align)
 {
-	if (!(shm->flags & TEE_SHM_PRIV))
-		return -ENOMEM;
-
 	return tee_dyn_shm_alloc_helper(shm, size, align, qcomtee_shm_register);
 }
 

-- 
2.34.1


