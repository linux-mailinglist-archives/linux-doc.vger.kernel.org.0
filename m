Return-Path: <linux-doc+bounces-47566-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9550AC48B7
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 08:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51F843B6F5B
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 06:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197A11FBCAD;
	Tue, 27 May 2025 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSfV867V"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397341D6DDD
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329040; cv=none; b=LVgDelkhMIB/B93AgZMxdDvxjHqoIl6QKtR8igSUPLURtNQ5kAlRBh0Sj7qfhp3qpFOMbjc6avDZGJ/mM68C1XFHiDxTA+N0RU8L51D9/J2UPdrMPdiqGZpJ6QyDrCoOt2mJc4HdIwZHyZa4aPJPDiSlhqVPUeFfNfxhpAxU0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329040; c=relaxed/simple;
	bh=utl3UjzIhfO9pDpRJSg8RxvUjfVVuBH6Koxgz507w8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uLzC4qlEWMisSm+kmJtOIKFhDBJRsbo7A5QdEg85+5Pa3HUsnpV+0NXYdqQUH7h1yulzP7nSNl2PjOcEtm9Y93MaHeDUHr1XtRHa2ktOGRRQWhOl70bz7pdokC8KpjHCvfMMdnXYrJEr9/GKbAinLkUcKwfIl3DBUyrEDdp5WfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSfV867V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QJgW1J016786
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R/XXNjqqqmQQ2nBiWKgZ1m
	TILSavzSgd6ug36jOlfis=; b=MSfV867VdhsCNe0rGUbEtX/PvyT5LkhMrb4fZJ
	TuQ6t78H6Rz7c+O2LhlM3nuQKGzln9EHnlk3PfDmYddMLwRHoXurMwi/VEVQ+XS0
	WpRAyv9+NM8FP+L/NBozkfIXOE8rOjvJn58jrKAk+n5gui/ByMNZ5FOkDo5U6HAb
	neC4+KJbIqdc0s2MxrJ+WMGnQwBk3WfBdHQAzspyVzukh5pIe+jHrHRdnGulpd8I
	MAFvAb4Ah7UucGXmGjTLL9RaMHFi3wcvpbnyVOahgJFB0UA8Pc7Odzg9Paj+g6VI
	jDijS8jPxozCeDdJTA3UjqrVmL9X1KcRFjQJRkVM3Tl/eibw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq6437-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74620e98ec8so775958b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 23:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329035; x=1748933835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/XXNjqqqmQQ2nBiWKgZ1mTILSavzSgd6ug36jOlfis=;
        b=smu7zy1zwY/m6m9XwW6xujLZaWUkc5g7w5d9tHH0Ut0VgxRdPi9RPmemBqdLT7NOkW
         zegMpbAwaRhu2sduPNLfZiDVIESTfqiC+ge4w0JURzFw8DavhjwUVLO57yH3gLIIRS8t
         bmfYd34p5DR2GknJcuoJmBafS3yvgNd+Gz3Eqttbjea6vhf9HGNVsNItzmMixe9d1QgO
         bK4jKnBQWlzD63GMAf0/zjUVdaSQt3vbulRO5arqjtW4DcvpgF8zws46XTtoVnJVKdLZ
         wS+7IDnIzmhuO0D0g/kcecCDd/OrdxN7MeWP7Dbbh1F7GyXF6wC4kUXw+M5tuIKTifv2
         kbpA==
X-Forwarded-Encrypted: i=1; AJvYcCXOg3HEo4s+nnRCB9TbJSCaYcd7d6aKW3k5JkodIBJkOAqVMfON80jX4UiOFYJ150vKeWJiaUQcPMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlzRVTJ7OrEMIUVRniMD+qUkVtvrmbeMw1bk/hykv44vlgxlYV
	zvDNXsLZrM9we8l5upVFNAp3ax/Wq71sJL7F9gxHidqrGb4j9tJNhJODzP8r3+R9siD0ibhPDFk
	f1pqHFJJSVcyB/vNOyif4eR5AsEDCiup3zGLUVoqyO0qUUW56SJMyJKcoI7pz4w==
X-Gm-Gg: ASbGnctf/+o/Ph1syxMnZ9ru6vOOpeTv98bgwyLo5elHfMgy5vByGKEcUItPMnKYK9Q
	w04C2WKvTrhRPLvhsBcvGMd/QJ8G75f8ecbvoCft/u6/SvXazCe47DZeNrUlGEF7j7oLj+UEsHF
	ovTFHM9+4aGavsD7tXDj8hJjkXUKExuP53r8c74x/mYRUPUbkG8uZcI1jaH1VTUErE0wg9L76DE
	g+H1oEVGzVKaLXCLmOaCQYloxIxpq/TeTjAnSLHWTCo1EEG2O3RdAgoLxbJlOXXssKzAI4KCPya
	xDcs/U0M5y15DmVhZ3ajjLsT7wC7ZdvYCKM4PpiTTVbHRZl0WlZjRqJTNE2WFr9zF2F/Khk=
X-Received: by 2002:a62:f24d:0:b0:746:2217:5863 with SMTP id d2e1a72fcca58-7462217598emr3300904b3a.6.1748329035353;
        Mon, 26 May 2025 23:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZrfcH3Sb55ANTjm+eWz4bJbtObaXuc1t3YV5MjNkK73rAKu9ia6cV/91JxIDr6Urj8Gki2g==
X-Received: by 2002:a62:f24d:0:b0:746:2217:5863 with SMTP id d2e1a72fcca58-7462217598emr3300873b3a.6.1748329034886;
        Mon, 26 May 2025 23:57:14 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:14 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v5 00/12] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Mon, 26 May 2025 23:56:45 -0700
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1iNWgC/5XNwU7DMAwG4FeZcsZT4qTJ4LT3QByy1FmDaEObt
 oCmvjteJdQDHMrF8h/F338ThYZERTwdbmKgOZWUOw7Vw0GExndXglRzFijRKB7Qh9zCSARTSd1
 13UqBjzQ2eRqhpRby5RW0xWCtNrJCJ9h6Hyimz7Xn+YVzk8qYh6+1dlb31/82zAokxEoiRalIK
 nvupxRSF458Lu4dM/64/Gu/i+zioyMfallrE3+7enM1ur2uZtdFUznpNJ6wPudSjv3k3/i83XC
 z4QZPe3HDuPXKaGukt+HyB74syzdaoFNc7gEAAA==
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
X-Proofpoint-GUID: P4QtSioZaT-xvpWOQQl1FHIS__p60hBC
X-Proofpoint-ORIG-GUID: P4QtSioZaT-xvpWOQQl1FHIS__p60hBC
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6835624c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=wdamrMJRu_bT6IjY2ZgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX+uVoh6JGJJ9s
 9gutc72CZRdZ7xdidaObDfhld2J5xs5fROWE9ymsF2eu9z2VYmoNcWwlkbhGV+flcEaMPS0lB81
 HtOegSMFqbx4gFgrQMXC1loATnw5tdZBOLxwoDVu3ZkneAl2jGekA5UZ3gJF9URPMOGJDkIMMTy
 4fDiWES7MNPDoDsrqXIUiilGF8m3mYgMf8FR/URjGLjEOz+J9Ae+AJp5vWAHqaHZ5Tn8EbQkpm+
 A1YdjXRtnQMaLcjBElpD1JqDYc7vXkR4hr/OaoAQJhKvKAih5v5cjFGIVhXpP7Wx2zTy04c3j4s
 YJ7tGb9A5dwmqbodAXui03bbmZfvdQhXPVTokV6JVN9Ax3FCRsBNjg/+bUWOlW1JIy1jts82G1j
 igA8z4IWVn9F3WFoECOVSakyHb4GTQWNKhrh47Z/VmK25fxY/I0flEg0Dnn2QAaZDuacSSrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270054

This patch series introduces a Trusted Execution Environment (TEE)
driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
and services to run securely. It uses an object-based interface, where
each service is an object with sets of operations. Clients can invoke
these operations on objects, which can generate results, including other
objects. For example, an object can load a TA and return another object
that represents the loaded TA, allowing access to its services.

Kernel and userspace services are also available to QTEE through a
similar approach. QTEE makes callback requests that are converted into
object invocations. These objects can represent services within the
kernel or userspace process.

Note: This patch series focuses on QTEE objects and userspace services.

Linux already provides a TEE subsystem, which is described in [1]. The
tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
can be used by userspace to talk to a TEE backend driver. We extend the
Linux TEE subsystem to understand object parameters and an ioctl call so
client can invoke objects in QTEE:

  - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
  - TEE_IOC_OBJECT_INVOKE

The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
used for invoking services in the userspace process by QTEE.

The TEE backend driver uses the QTEE Transport Message to communicate
with QTEE. Interactions through the object INVOKE interface are
translated into QTEE messages. Likewise, object invocations from QTEE
for userspace objects are converted into SEND/RECV ioctl calls to
supplicants.

The details of QTEE Transport Message to communicate with QTEE is
available in [PATCH 12/12] Documentation: tee: Add Qualcomm TEE driver.

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
needed to build the above.

This series has been tested for basic QTEE object invocations and
callback requests, including loading a TA and requesting services form
the TA.

Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v5:
- Remove references to kernel services and public APIs.
- Support auto detection for failing devices (e.g., RB1, RB4).
- Add helpers for obtaining client environment and service objects.
- Query the QTEE version and print it.
- Move remaining static variables, including the object table, to struct
  qcomtee.
- Update TEE_MAX_ARG_SIZE to 4096.
- Add a dependancy to QCOM_TZMEM_MODE_SHMBRIDGE in Kconfig
- Reorganize code by removing release.c and qcom_scm.c.
- Add more error messages and improve comments.
- updated Tested-by:, Acked-by:, and Reviewed-by: tags
- Link to v4: https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com

Changes in v4:
- Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
- Rename object to id in struct tee_ioctl_object_invoke_arg.
- Replace spinlock with mutex for qtee_objects_idr.
- Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
- More code cleanup following the comments.
- Cleanup documentations.
- Update MAINTAINERS file.
- Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com

Changes in v3:
- Export shm_bridge create/delete APIs.
- Enable support for QTEE memory objects.
- Update the memory management code to use the TEE subsystem for all
  allocations using the pool.
- Move all driver states into the driver's main service struct.
- Add more documentations.
- Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com

Changes in v2:
- Clean up commit messages and comments.
- Use better names such as ubuf instead of membuf or QCOMTEE prefix
  instead of QCOM_TEE, or names that are more consistent with other
  TEE-backend drivers such as qcomtee_context_data instead of
  qcom_tee_context.
- Drop the DTS patch and instantiate the device from the scm driver.
- Use a single structure for all driver's internal states.
- Drop srcu primitives and use the existing mutex for synchronization
  between the supplicant and QTEE.
- Directly use tee_context to track the lifetime of qcomtee_context_data.
- Add close_context() to be called when the user closes the tee_context.
- Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com

Changes in v1:
- It is a complete rewrite to utilize the TEE subsystem.
- Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com

---
Amirreza Zarrabi (12):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      tee: increase TEE_MAX_ARG_SIZE to 4096
      firmware: qcom: scm: add support for object invocation
      firmware: qcom: scm: remove unused arguments to the shm_brige
      firmware: qcom: tzmem: export shm_bridge create/delete
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               | 150 +++++
 MAINTAINERS                              |   8 +
 drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  57 +-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  11 +
 drivers/tee/qcomtee/Makefile             |   9 +
 drivers/tee/qcomtee/async.c              | 183 ++++++
 drivers/tee/qcomtee/call.c               | 833 +++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 930 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 172 ++++++
 drivers/tee/qcomtee/primordial_obj.c     | 116 ++++
 drivers/tee/qcomtee/qcomtee.h            | 266 +++++++++
 drivers/tee/qcomtee/qcomtee_msg.h        | 251 +++++++++
 drivers/tee/qcomtee/qcomtee_object.h     | 309 ++++++++++
 drivers/tee/qcomtee/shm.c                | 150 +++++
 drivers/tee/qcomtee/user_obj.c           | 694 +++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |  10 +-
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  56 +-
 27 files changed, 4528 insertions(+), 33 deletions(-)
---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


