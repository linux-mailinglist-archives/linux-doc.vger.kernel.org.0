Return-Path: <linux-doc+bounces-60069-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A996B54183
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 06:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F628AA13BF
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 04:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ADD286416;
	Fri, 12 Sep 2025 04:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWyMqAzc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4152284884
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650085; cv=none; b=BQIFGmerdDeO/M1suPo3SX3O4rqeeGeM3BvcuvdcAdZ4QoTt26i90vu3janY7S7fETf1kSox4pjTywyAZzaEX7QCqD4ZLKVeR1o9AYoRNidbyCxR/8h3AHcBknGVK63CrIk/2aW4z+hPr3DUNwRlO10bKsiChjf/dGwhUDCA1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650085; c=relaxed/simple;
	bh=+8dSfgrMG4eFIFtqJ20ROAswX13YmpqsL2XfyfUksAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TAVhW2jlwRGjkYb35Wedf7b/xX+yUb+n2MkDuOhqwFG3wwRMt81Sw2GU5DyJ1cwqW3ttB/2kiLdiczmbkbSuMDc4xKjEqFySr1y2eJWLMOG7le8tDfZakKInhbgqQ7m0yGmDilYiozA1pivQt/z1KrEtJMLpIlzkIU0R3Jm0UzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWyMqAzc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIrtmU031162
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaTc6vdim5GJ1OsrX7tFizDxK1+T66nxGle441QICfs=; b=KWyMqAzciNjXlkhD
	M+/07iiOAN6B3DLDX1mNLnNGMffDDrffbGD6E4s2Hm90z0HWSuoRp9NcKZOS1pIL
	8WFRLGYYaIR+QD94vzsMi4FtE0enS9y7OqsyiOGxZCH2dxrW3YX3MHl+p1122CEA
	+VsrB0wcTWv7tNV6HNxZOVZ4sQiljCtYkASNUszdoRyaasO2H3luU9OKPTXDcxn6
	UYcB1mksxK3HYeYYbj76YwT+TI2fT71MmlzVjIGU0MB/kG2yf6cI9lRH7gD3XXeq
	GpNm3eRZXF9l3P8zHR8FU77G3EnX1EnzQgMJYV/NZJY35NVdhvRb5rvPlWnixjeS
	nMaCLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg9x4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:08:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77615793f06so276302b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 21:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650082; x=1758254882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaTc6vdim5GJ1OsrX7tFizDxK1+T66nxGle441QICfs=;
        b=TM2l7ckjMxoZ1DJvqwZHynirgZwy4rY85SuhQQaxhKQrs92rmbDkJxHsKnUQmVEQMR
         2T12P8p93E0ab18ShOMf6l9dGJjzxD7qtcPvRl7uW0fdiuSYuGX8fGewFSzsKkyayvia
         aVj3jGy1wz5x9SeSPp+HH9H5IQIltqR/v4Fe5sbeYCsg0gG+F6IJsHOuPF26W0tflXF6
         RX3EAN8fAc5Ob+2H7bGvAu+Rz/e/zQ3D/KJOZDtgzJar8XkQg3GuwwL2+jPK9xGnKHDR
         Og2efGTR2M8X3lpIVlkW2nTO4BUDavPW4xJn1knjxRWsDaOCLfkE0QUhT6pjgSjCFEJP
         s1gA==
X-Forwarded-Encrypted: i=1; AJvYcCUBTCA1KY/9XhMIblVVFSCqzQ5R9Du8mlwpyivh2JLWPTNu8r7vru8u+iZBrxK7LexJ/+Qft3Fomyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKnr4Q9D1OkzVoM5Jm7U3C6q02aXncAIWp2RgJZ18TQuK8yTpY
	nHLD+cctjXfhIpwgRFMH4bMPiIzPfkcplgToDOdV7fwi47U9nuphF3iQijM730PvO+tCGgeHGe2
	QuKllBkKNLv79bH9jsuYGxuKkBPfsBr9Z4osr61au4E7HN6cNPxIiGGK1SS2cew==
X-Gm-Gg: ASbGncuPbmBog5xn0mwhe4y/oNLZgzGDP7d07YRIZbp8lnc2gdJP/1uRcQqgwl92Kxv
	EQYkwMrjFlbJ7TbsQIY2p8LZxLmev9FPq02NjRfoSD+o+XrwswJXhau8b59SG3hC3sXkY1xVfwB
	Qr2CcvJu29LluFAFxdbwtdYdMZkXgF32NGnXqnz2ymOWc1nT7cuABRslCpsOM5lxgrx1WtnZPje
	n6tufuE+TwijW4rmjtbRV8bK+2Nd19aVknPFmgCWQzJplb1b+TD9G7G0BvoHHHQm12+ZjsA5i1B
	gaE/AHNtPE3sAn8TbwN9FNfl0pzVYG2S7u17T2z5KWgwWiJYPvep5ZaEkDF30dUn7UIbULYkNPf
	eJbPbEc47gzeUXj3nKzYgMc0=
X-Received: by 2002:a05:6a20:939d:b0:24e:2cee:9592 with SMTP id adf61e73a8af0-2602c90ceb0mr1967982637.46.1757650082079;
        Thu, 11 Sep 2025 21:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6OG/5mnjJQYPbDxpKFK12IlfhWl46TZej0Vn5/G4+EVSGgvP8mYysplf1uK5zi0tFUMsB7g==
X-Received: by 2002:a05:6a20:939d:b0:24e:2cee:9592 with SMTP id adf61e73a8af0-2602c90ceb0mr1967944637.46.1757650081589;
        Thu, 11 Sep 2025 21:08:01 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:08:01 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:48 -0700
Subject: [PATCH v12 09/11] tee: qcom: add primordial object
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-9-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: a4VqlznMrB7NzGYhpImw07WtJoItzfIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX24IIKqw1NRIa
 2g9ECfX7vg7qybWFFhiJkxUuEL5bkSfBJnLq7Zf9p4YBeQsTsd21YURbP6LV0TlBL8x2ldbNHGU
 C5plzxjxEBEVyX3JqcTNQboi5G3qQas1/KCnnEs4yyZcpji5dEtP4Shpvk/+OkBQthQpOkGEJ/6
 5ISviKaL7/2smM7CmO4ghWa1ENUQZsyxgH3oyozw6ZKZ94bERRIzlcs6YvSirBmdjL8zTvwrN/N
 mtoYke21KrZFxHzdq8C6l9fLgPdFgSIemM77UN8dd3P/FVq5TzwMKKzQp+TtSkrqPSeSvx59ZJ+
 uxBeFPfp17//m4V7uQCLB1VnC19kmBZASG+ZOqjYtZQ8zlbbRrYlkGvoq0qz4eMqJoxlGOCjVZv
 3bvB/CQl
X-Proofpoint-GUID: a4VqlznMrB7NzGYhpImw07WtJoItzfIm
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c39ca3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

After booting, the kernel provides a static object known as the
primordial object. This object is utilized by QTEE for native
kernel services such as yield or privileged operations.

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile         |  1 +
 drivers/tee/qcomtee/core.c           | 19 ++++++++---
 drivers/tee/qcomtee/primordial_obj.c | 63 ++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee.h        |  3 ++
 4 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 600af2b8f1c1..78f8e899d143 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += shm.o
 qcomtee-objs += user_obj.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b6931ed6f200..783acc59cfa9 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -31,10 +31,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
 }
 
 /*
- * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
- * of the QCOMTEE_OBJECT_TYPE_CB type.
+ * QTEE expects IDs with QCOMTEE_MSG_OBJECT_NS_BIT set for objects of
+ * QCOMTEE_OBJECT_TYPE_CB type. The first ID with QCOMTEE_MSG_OBJECT_NS_BIT
+ * set is reserved for the primordial object.
  */
-#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
+#define QCOMTEE_OBJECT_PRIMORDIAL (QCOMTEE_MSG_OBJECT_NS_BIT)
+#define QCOMTEE_OBJECT_ID_START (QCOMTEE_OBJECT_PRIMORDIAL + 1)
 #define QCOMTEE_OBJECT_ID_END (U32_MAX)
 
 #define QCOMTEE_OBJECT_SET(p, type, ...) \
@@ -157,7 +159,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -169,7 +173,9 @@ int qcomtee_object_get(struct qcomtee_object *object)
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 
@@ -261,6 +267,9 @@ qcomtee_local_object_get(struct qcomtee_object_invoke_ctx *oic,
 	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
 	struct qcomtee_object *object;
 
+	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
+		return &qcomtee_primordial_object;
+
 	guard(rcu)();
 	object = xa_load(&qcomtee->xa_local_objects, object_id);
 	/* It already checks for %NULL_QCOMTEE_OBJECT. */
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..0e43f04493e2
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
+#include "qcomtee.h"
+
+/**
+ * DOC: Primordial Object
+ *
+ * After boot, the kernel provides a static object of type
+ * %QCOMTEE_OBJECT_TYPE_CB called the primordial object. This object is used
+ * for native kernel services or privileged operations.
+ *
+ * We support:
+ *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
+ *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
+ */
+
+#define QCOMTEE_OBJECT_OP_YIELD 1
+#define QCOMTEE_OBJECT_OP_SLEEP 2
+
+static int
+qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				struct qcomtee_object *primordial_object_unused,
+				u32 op, struct qcomtee_arg *args)
+{
+	int err = 0;
+
+	switch (op) {
+	case QCOMTEE_OBJECT_OP_YIELD:
+		cond_resched();
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	case QCOMTEE_OBJECT_OP_SLEEP:
+		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
+		if (qcomtee_args_len(args) != 1 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_IB ||
+		    args[0].b.size < sizeof(u32))
+			return -EINVAL;
+
+		msleep(*(u32 *)(args[0].b.addr));
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
+	.dispatch = qcomtee_primordial_obj_dispatch,
+};
+
+struct qcomtee_object qcomtee_primordial_object = {
+	.name = "primordial",
+	.object_type = QCOMTEE_OBJECT_TYPE_CB,
+	.ops = &qcomtee_primordial_obj_ops
+};
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f34be992e68b..084b3882017e 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -140,4 +140,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 			       struct tee_param *params, int num_params,
 			       int req_id, int errno);
 
+/* (2) Primordial Object. */
+extern struct qcomtee_object qcomtee_primordial_object;
+
 #endif /* QCOMTEE_H */

-- 
2.34.1


