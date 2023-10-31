Return-Path: <linux-doc+bounces-1455-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 081CF7DD02D
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85202811A4
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 15:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221D51DFFC;
	Tue, 31 Oct 2023 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="CAQjrx/E";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="CrgSTdjs"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF35E1DFF5;
	Tue, 31 Oct 2023 15:14:43 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51181BD;
	Tue, 31 Oct 2023 08:14:21 -0700 (PDT)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VCJjRj013616;
	Tue, 31 Oct 2023 15:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	dk201812; bh=Ta/twkNe6G3IEMub1AaJ9LmqiwDb9AiUA4D49+ca+b0=; b=CAQ
	jrx/ERsNp4/KKfHOgf/PdCFEGHU3Vl2HdiNMwQiIxMTjugxhA1Q4WXsUDd5k7HJb
	t+WQbfX6s3qX+IDBv/BugQRFwpgOc70lRD+QXblY/AjCVw76FSsE2D/p6P0xouOm
	+iSf7r9ySRHa1C77RFyBof7EiNZamkbC0T/e3bEXscP2EXErE20p7X0+VHncuTcX
	NJoHLwg491smsaVaT4Lx+1mZvZk+b4ey/CXHt0ToF/jPx15Jx4ME+iN8cNrPe3QG
	CcPXwxz4SbIs8ghZh1gKrRGpK7pk/g9x8bAc/1M740vLWuIUyIdm2V3QxBITRla7
	89V0Stm6RnZC8/Ubmxw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf42-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Oct 2023 15:13:33 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:29 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyojaZ99KE25xGIo5bktpJ0ASc1dduu2cGLPK6avZXGfw2aPoW95Y0pGX2qfBEmtOQ5miS0sLwboCtCLwD7hSnFjTa3sgc8KhgxQWDb7iK/rC0tUA51Jp7w92SzR1OqKVbpuaO5GUG1JRwb0+zkp+BVv7ZVYdaNIDPcQjh53BKHngYg03BDf8UAT/ZGVFiKGIrFjGu3J75HsEIZYANjgC0GI4QMqDlNIjSft9Ni/TTtESl5HmO6RcLq71xiqibiVtbFBgTzPVBk341RFFVwuDi2aLwxQK5S0rmg+nbJCOZ+kFu3GN55b6WTb9GlwXzpkoOqgGZILiTgZZ2/o8N1Vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta/twkNe6G3IEMub1AaJ9LmqiwDb9AiUA4D49+ca+b0=;
 b=fsHZSWhMzMbdFTVJUT0kxoeDbGGstdQCQwvN7aWJuoxKtjSm8qfPtxjhSRcgTAMZiH9dOLWHmKwlAMV1kHKw/uM1LB4WqNUetFCIICnTXT6ERq9xYcJf+erF7wuGdeVI/RPz0SRG3J3B42maxe1OJmK9Fekee/yv4zmQRvK7hYx2Yr9sGpcfKsreYPs5HVjDprceNDU3FeZZdz4jqpAqta3LHwHrvAkO9A9sIy7SFjOwtTMdYm45Hu1Mrey8wBDiptRN5xfq+6TJlASZRmsdmI43X4XdOCENkTP2Mr5cM0HffEHW5GIK1cGgJxaRn04qkW5CUX+eHPRzNWV4ldPKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ta/twkNe6G3IEMub1AaJ9LmqiwDb9AiUA4D49+ca+b0=;
 b=CrgSTdjs0EdhMEbFFgBBkZMsXKsM9Z7E74ub8T8WsuqAX99rXfwUFK0JfOWuTxnTk59e1qFVInoKL6LkjCC6QeIcXOJ3Tv8uLgvE/MPHfdwT04gAJQTEqkxwobjiO7x6VagAzobYJx8C5VT39DePTte88U7MNednbwhVQrr/Y6g=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:24 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:24 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
CC: <frank.binns@imgtec.com>, <donald.robson@imgtec.com>,
        <boris.brezillon@collabora.com>, <faith.ekstrand@collabora.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <afd@ti.com>, <hns@goldelico.com>,
        <matthew.brost@intel.com>, <christian.koenig@amd.com>,
        <luben.tuikov@amd.com>, <dakr@redhat.com>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
Subject: [PATCH v8 17/20] drm/imagination: Implement job submission and scheduling
Date: Tue, 31 Oct 2023 15:12:54 +0000
Message-Id: <20231031151257.90350-18-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031151257.90350-1-sarah.walker@imgtec.com>
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2018:EE_
X-MS-Office365-Filtering-Correlation-Id: e515fc2a-4461-4fea-c4e9-08dbda23ed3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nsLxk5+eGsUa3YunMJPIcBvrs90e+M3Zee8Cd99E9pdsaFpE6lHZEYb2WWH2pOb6qrM64iySIfID7hBU3CBARKlLVe6EJ/DL9/nf5eEduEUXjLfFOAa9m8vP00Vs71UOc/4bfwYhL/8EwWlluaerg1ACKp5oeMyQXsEKnPI1wViEcmGRkUAcmaCoQIZ7iGCfU7j9DjdtpSQBfhGxoAha9x6uWDsA8VfgzRsPwqGThU2vSWczRB/UZzN1zdROno7nMwBU5fAK/uqCMFWuFy8d249W0/YZZWs232m/UlmiGsGpWIr81jbhlZj7qMMXqffwVll8t8a0VmtoSzOIzRcdsIiAqMvVDpYeyeCqSdYgBqZk2G2OArTd98ESIwLgPhbP/UYw1wXJavtRVllb6o5wYOT7N7N28id1bfFO7SkALMOqIwlZDSuYWYmcRVmqKdpFN+Z6YXyXecaTM/Xn7U+5QunsE8E/k+alXr0NH8OwMmE0kt/3nryU8TLGY+RkOgG1osjVJdHRx1gjhuHyfJpMKNyIcbBGmhBcDwPjROeXeF64Kl0/sy7W8g5ljTpHK71PUiE5msIMGlhg+xMvNL4aLjpka0a3gspWHvB5/hQw0t0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(2616005)(83380400001)(478600001)(6666004)(26005)(966005)(6512007)(6506007)(52116002)(6486002)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0PE+PsrTljECUX4GZClRkXB4GrygSV5OTPmRrNIbWrAXmn1hf2ove8G7BPgT?=
 =?us-ascii?Q?0GgvVi8SpOUrwvu6HYGyKtKGHiIR7gD8o4UV1YDWBQUlEFXD313YrY2IhMS3?=
 =?us-ascii?Q?V/KAnCbskB3XrizToMMA+Jx9sRemz+vKWy8he/rLXrPsN5M81DrzgG+l1VDy?=
 =?us-ascii?Q?7Tvs5UBRQqs3Nq6KADB8+c2tXgoOPMwp3i8IkUGePUdZxKzMqewmKduJa4HM?=
 =?us-ascii?Q?JyFTlTx4EswV6oA0PpvXhtCNifbl2eDObtoYreTci/K5NSwUU+C17ZRcqOBX?=
 =?us-ascii?Q?YONh2oWdn9dTZlwrD0XnqLvF78MTPPqHeGlBgyI1usmS6ihH5e9Si88jaEMT?=
 =?us-ascii?Q?TB7Z+b/vidX474T1y11k08lVubpPxkQb079BZfIGOVXJbF2D6yTVqCZ/xERD?=
 =?us-ascii?Q?HoKuueAoIkD+z1+IkkSO917MgOIJwbuXQH3P8IIUKOreE7Eb5dObi8TpC6mW?=
 =?us-ascii?Q?waI3y8HGzT6DCl3p6MG7dsFBQ2CAG4bnkYFRxiax27NcXuMY3PIkkxPZ2i7l?=
 =?us-ascii?Q?uM2lBi7IE4p1lqhjmlHXIVlVFv7Acbq/VFnyXQvvQHxhRBMoi05acW5Ctt6Y?=
 =?us-ascii?Q?M5MI+IVDOFkEghU+cx5/m8w908dlL5/4NUEcIp3afZaxDO/YkF3vR3ueqaNL?=
 =?us-ascii?Q?3J35t2U3FpTtqR8xCcUv1pqDbkvtbkKhlfL5BCAw/jcmv/0GnNU4dMVXCEnH?=
 =?us-ascii?Q?GjI+Gt5zAsAbMgd8kLobSnWpqqM4USZYZIsTAlJ+TOFbSsZApJ7ehEFozBgz?=
 =?us-ascii?Q?hg22QDyKEqW+Y7kXWwhsYez9GwRaha1Ydj1pko1U3VqRDJ9+HqJS31NuURM9?=
 =?us-ascii?Q?mRKiGAlaa8ksMBjdQ7mA12I2WvGUlaC87//P3PO0nBWPQrDp41I/h3TzFxff?=
 =?us-ascii?Q?ZdK/3cyXH0QPF4ogXVUmpeLJWAe/7qY+U8wJSz+8L1++lRlVZ73yfm5DgvDO?=
 =?us-ascii?Q?2ZkS1ESbd3gpnJ06pziQFRbXg/gMpQhWsszBO9IbHdklRztZgvl+EZYbvO3x?=
 =?us-ascii?Q?szTbie5qFEoAndbmsXwdfKOK5YGuD1aldeAj1uF+UrGpJ6NPnE7201Qqf4Ap?=
 =?us-ascii?Q?WI+W2S8OWgv8ZUGKi3vkFDbNtiGGrGUA79U2jMu4QyR27WGjcFEhtb4Mt2hK?=
 =?us-ascii?Q?cIoP9nMD6FAo1DC5UJwxP1YsaeyPjrJM1g9r2BL3zL4/vVZn/ydM+f2heC0k?=
 =?us-ascii?Q?CWRfavZznfhl50m8rTpWG+jZzVOiLkxUsrl5E4uvMwwc9pDLjJbP0Tj9sRSt?=
 =?us-ascii?Q?lxsg+1kvbrspK68cJMrTjcdmf6HN+/jiYzT51MP/WnBM7DsoDlVstA7VZ4Zp?=
 =?us-ascii?Q?VulL/6ceZAIihr4u/ZvSpWxGYPfug6cU2ON5RAEbFfIvwqo4/Q7L9ts11RJ5?=
 =?us-ascii?Q?HvwpLNxwspaR0dmAjCkBWXtQZ4jpW9V+QF+NnYMC732gdFbNFuy15YaCVWnf?=
 =?us-ascii?Q?gzEv2C8JdksTnEVitn5iaQtOX60E9e6x9pMv+oQ+mAmi+UBuPJBnF+62smCQ?=
 =?us-ascii?Q?RQKZXsIa/vWV4GsjMnAD8aKjRZMxnrfhBURejWysQAAC2CrwfXgVLNtZxxVd?=
 =?us-ascii?Q?zA6YQkEV4ZqeF0gLGbkkZJJUxczt0E8XU3RHig/echhizoGMKyb7P9eBbo/s?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e515fc2a-4461-4fea-c4e9-08dbda23ed3a
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:24.4153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KNzjeyA+1cUafqMYxDlkwZEXgBHQcRxvMW3+33VG6wMDLeCuZcGlArAfsLrAXMziBq2mfOs/Vc3nK5UBG21hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 5dUV9rraPEJYP5Wy-TuCk9qNB8k_nhtU
X-Proofpoint-ORIG-GUID: 5dUV9rraPEJYP5Wy-TuCk9qNB8k_nhtU

Implement job submission ioctl. Job scheduling is implemented using
drm_sched.

Jobs are submitted in a stream format. This is intended to allow the UAPI
data format to be independent of the actual FWIF structures in use, which
vary depending on the GPU in use.

The stream formats are documented at:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/f8d2b42ae65c2f16f36a43e0ae39d288431e4263/src/imagination/csbgen/rogue_kmd_stream.xml

This patch depends on:
drm/sched: Convert drm scheduler to use a work queue rather than kthread:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-2-matthew.brost@intel.com/
drm/sched: Move schedule policy to scheduler / entity:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-3-matthew.brost@intel.com/
drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-4-matthew.brost@intel.com/
drm/sched: Start run wq before TDR in drm_sched_start:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-6-matthew.brost@intel.com/
drm/sched: Submit job before starting TDR:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-7-matthew.brost@intel.com/
drm/sched: Add helper to set TDR timeout:
  https://lore.kernel.org/dri-devel/20230404002211.3611376-8-matthew.brost@intel.com/

Changes since v6:
- Fix fence handling in pvr_sync_signal_array_add()
- Add handling for SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE flag
- Fix missing dma_resv locking in job submit path

Changes since v5:
- Fix leak in job creation error path

Changes since v4:
- Use a regular workqueue for job scheduling

Changes since v3:
- Support partial render jobs
- Add job timeout handler
- Split sync handling out of job code
- Use drm_dev_{enter,exit}

Changes since v2:
- Use drm_sched for job scheduling

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Kconfig           |    1 +
 drivers/gpu/drm/imagination/Makefile          |    3 +
 drivers/gpu/drm/imagination/pvr_context.c     |  125 +-
 drivers/gpu/drm/imagination/pvr_context.h     |   44 +
 drivers/gpu/drm/imagination/pvr_device.c      |   31 +
 drivers/gpu/drm/imagination/pvr_device.h      |   21 +
 drivers/gpu/drm/imagination/pvr_drv.c         |   40 +-
 drivers/gpu/drm/imagination/pvr_job.c         |  788 +++++++++
 drivers/gpu/drm/imagination/pvr_job.h         |  161 ++
 drivers/gpu/drm/imagination/pvr_power.c       |   28 +
 drivers/gpu/drm/imagination/pvr_queue.c       | 1455 +++++++++++++++++
 drivers/gpu/drm/imagination/pvr_queue.h       |  179 ++
 drivers/gpu/drm/imagination/pvr_stream_defs.c |  226 +++
 drivers/gpu/drm/imagination/pvr_sync.c        |  289 ++++
 drivers/gpu/drm/imagination/pvr_sync.h        |   84 +
 15 files changed, 3471 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 2639fbf3ebac..084e72aa82eb 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -6,6 +6,7 @@ config DRM_POWERVR
 	depends on ARM64
 	depends on DRM
 	depends on PM
+	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED
 	select DRM_GPUVM
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 0c8ab120f277..313af5312d7b 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -18,10 +18,13 @@ powervr-y := \
 	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_hwrt.o \
+	pvr_job.o \
 	pvr_mmu.o \
 	pvr_power.o \
+	pvr_queue.o \
 	pvr_stream.o \
 	pvr_stream_defs.o \
+	pvr_sync.o \
 	pvr_vm.o \
 	pvr_vm_mips.o
 
diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/imagination/pvr_context.c
index 7ade4d395d1d..42385eb15271 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -6,10 +6,12 @@
 #include "pvr_device.h"
 #include "pvr_drv.h"
 #include "pvr_gem.h"
+#include "pvr_job.h"
 #include "pvr_power.h"
 #include "pvr_rogue_fwif.h"
 #include "pvr_rogue_fwif_common.h"
 #include "pvr_rogue_fwif_resetframework.h"
+#include "pvr_stream.h"
 #include "pvr_stream_defs.h"
 #include "pvr_vm.h"
 
@@ -164,6 +166,116 @@ ctx_fw_data_init(void *cpu_ptr, void *priv)
 	memcpy(cpu_ptr, ctx->data, ctx->data_size);
 }
 
+/**
+ * pvr_context_destroy_queues() - Destroy all queues attached to a context.
+ * @ctx: Context to destroy queues on.
+ *
+ * Should be called when the last reference to a context object is dropped.
+ * It releases all resources attached to the queues bound to this context.
+ */
+static void pvr_context_destroy_queues(struct pvr_context *ctx)
+{
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		pvr_queue_destroy(ctx->queues.fragment);
+		pvr_queue_destroy(ctx->queues.geometry);
+		break;
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		pvr_queue_destroy(ctx->queues.compute);
+		break;
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		pvr_queue_destroy(ctx->queues.transfer);
+		break;
+	}
+}
+
+/**
+ * pvr_context_create_queues() - Create all queues attached to a context.
+ * @ctx: Context to create queues on.
+ * @args: Context creation arguments passed by userspace.
+ * @fw_ctx_map: CPU mapping of the FW context object.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * A negative error code otherwise.
+ */
+static int pvr_context_create_queues(struct pvr_context *ctx,
+				     struct drm_pvr_ioctl_create_context_args *args,
+				     void *fw_ctx_map)
+{
+	int err;
+
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		ctx->queues.geometry = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_GEOMETRY,
+							args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.geometry)) {
+			err = PTR_ERR(ctx->queues.geometry);
+			ctx->queues.geometry = NULL;
+			goto err_destroy_queues;
+		}
+
+		ctx->queues.fragment = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_FRAGMENT,
+							args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.fragment)) {
+			err = PTR_ERR(ctx->queues.fragment);
+			ctx->queues.fragment = NULL;
+			goto err_destroy_queues;
+		}
+		return 0;
+
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		ctx->queues.compute = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_COMPUTE,
+						       args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.compute)) {
+			err = PTR_ERR(ctx->queues.compute);
+			ctx->queues.compute = NULL;
+			goto err_destroy_queues;
+		}
+		return 0;
+
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		ctx->queues.transfer = pvr_queue_create(ctx, DRM_PVR_JOB_TYPE_TRANSFER_FRAG,
+							args, fw_ctx_map);
+		if (IS_ERR(ctx->queues.transfer)) {
+			err = PTR_ERR(ctx->queues.transfer);
+			ctx->queues.transfer = NULL;
+			goto err_destroy_queues;
+		}
+		return 0;
+	}
+
+	return -EINVAL;
+
+err_destroy_queues:
+	pvr_context_destroy_queues(ctx);
+	return err;
+}
+
+/**
+ * pvr_context_kill_queues() - Kill queues attached to context.
+ * @ctx: Context to kill queues on.
+ *
+ * Killing the queues implies making them unusable for future jobs, while still
+ * letting the currently submitted jobs a chance to finish. Queue resources will
+ * stay around until pvr_context_destroy_queues() is called.
+ */
+static void pvr_context_kill_queues(struct pvr_context *ctx)
+{
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		pvr_queue_kill(ctx->queues.fragment);
+		pvr_queue_kill(ctx->queues.geometry);
+		break;
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		pvr_queue_kill(ctx->queues.compute);
+		break;
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		pvr_queue_kill(ctx->queues.transfer);
+		break;
+	}
+}
+
 /**
  * pvr_context_create() - Create a context.
  * @pvr_file: File to attach the created context to.
@@ -214,10 +326,14 @@ int pvr_context_create(struct pvr_file *pvr_file, struct drm_pvr_ioctl_create_co
 		goto err_put_vm;
 	}
 
-	err = init_fw_objs(ctx, args, ctx->data);
+	err = pvr_context_create_queues(ctx, args, ctx->data);
 	if (err)
 		goto err_free_ctx_data;
 
+	err = init_fw_objs(ctx, args, ctx->data);
+	if (err)
+		goto err_destroy_queues;
+
 	err = pvr_fw_object_create(pvr_dev, ctx_size, PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
 				   ctx_fw_data_init, ctx, &ctx->fw_obj);
 	if (err)
@@ -243,6 +359,9 @@ int pvr_context_create(struct pvr_file *pvr_file, struct drm_pvr_ioctl_create_co
 err_destroy_fw_obj:
 	pvr_fw_object_destroy(ctx->fw_obj);
 
+err_destroy_queues:
+	pvr_context_destroy_queues(ctx);
+
 err_free_ctx_data:
 	kfree(ctx->data);
 
@@ -262,6 +381,7 @@ pvr_context_release(struct kref *ref_count)
 	struct pvr_device *pvr_dev = ctx->pvr_dev;
 
 	xa_erase(&pvr_dev->ctx_ids, ctx->ctx_id);
+	pvr_context_destroy_queues(ctx);
 	pvr_fw_object_destroy(ctx->fw_obj);
 	kfree(ctx->data);
 	pvr_vm_context_put(ctx->vm_ctx);
@@ -299,6 +419,9 @@ pvr_context_destroy(struct pvr_file *pvr_file, u32 handle)
 	if (!ctx)
 		return -EINVAL;
 
+	/* Make sure nothing can be queued to the queues after that point. */
+	pvr_context_kill_queues(ctx);
+
 	/* Release the reference held by the handle set. */
 	pvr_context_put(ctx);
 
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/imagination/pvr_context.h
index fa7115380272..582d64c44d5f 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -15,6 +15,7 @@
 
 #include "pvr_cccb.h"
 #include "pvr_device.h"
+#include "pvr_queue.h"
 
 /* Forward declaration from pvr_gem.h. */
 struct pvr_fw_object;
@@ -58,8 +59,51 @@ struct pvr_context {
 
 	/** @ctx_id: FW context ID. */
 	u32 ctx_id;
+
+	/**
+	 * @faulty: Set to 1 when the context queues had unfinished job when
+	 * a GPU reset happened.
+	 *
+	 * In that case, the context is in an inconsistent state and can't be
+	 * used anymore.
+	 */
+	atomic_t faulty;
+
+	/** @queues: Union containing all kind of queues. */
+	union {
+		struct {
+			/** @geometry: Geometry queue. */
+			struct pvr_queue *geometry;
+
+			/** @fragment: Fragment queue. */
+			struct pvr_queue *fragment;
+		};
+
+		/** @compute: Compute queue. */
+		struct pvr_queue *compute;
+
+		/** @compute: Transfer queue. */
+		struct pvr_queue *transfer;
+	} queues;
 };
 
+static __always_inline struct pvr_queue *
+pvr_context_get_queue_for_job(struct pvr_context *ctx, enum drm_pvr_job_type type)
+{
+	switch (type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return ctx->type == DRM_PVR_CTX_TYPE_RENDER ? ctx->queues.geometry : NULL;
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return ctx->type == DRM_PVR_CTX_TYPE_RENDER ? ctx->queues.fragment : NULL;
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return ctx->type == DRM_PVR_CTX_TYPE_COMPUTE ? ctx->queues.compute : NULL;
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return ctx->type == DRM_PVR_CTX_TYPE_TRANSFER_FRAG ? ctx->queues.transfer : NULL;
+	}
+
+	return NULL;
+}
+
 /**
  * pvr_context_get() - Take additional reference on context.
  * @ctx: Context pointer.
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index aac5e62d6cbe..e22a62ba21a4 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -6,7 +6,9 @@
 
 #include "pvr_fw.h"
 #include "pvr_power.h"
+#include "pvr_queue.h"
 #include "pvr_rogue_cr_defs.h"
+#include "pvr_stream.h"
 #include "pvr_vm.h"
 
 #include <drm/drm_print.h>
@@ -117,6 +119,32 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
+/**
+ * pvr_device_process_active_queues() - Process all queue related events.
+ * @pvr_dev: PowerVR device to check
+ *
+ * This is called any time we receive a FW event. It iterates over all
+ * active queues and calls pvr_queue_process() on them.
+ */
+void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
+{
+	struct pvr_queue *queue, *tmp_queue;
+	LIST_HEAD(active_queues);
+
+	mutex_lock(&pvr_dev->queues.lock);
+
+	/* Move all active queues to a temporary list. Queues that remain
+	 * active after we're done processing them are re-inserted to
+	 * the queues.active list by pvr_queue_process().
+	 */
+	list_splice_init(&pvr_dev->queues.active, &active_queues);
+
+	list_for_each_entry_safe(queue, tmp_queue, &active_queues, node)
+		pvr_queue_process(queue);
+
+	mutex_unlock(&pvr_dev->queues.lock);
+}
+
 static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
 {
 	struct pvr_device *pvr_dev = data;
@@ -132,6 +160,7 @@ static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
 		if (pvr_dev->fw_dev.booted) {
 			pvr_fwccb_process(pvr_dev);
 			pvr_kccb_wake_up_waiters(pvr_dev);
+			pvr_device_process_active_queues(pvr_dev);
 		}
 
 		pm_runtime_mark_last_busy(from_pvr_device(pvr_dev)->dev);
@@ -398,6 +427,8 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 	else
 		return -EINVAL;
 
+	pvr_stream_create_musthave_masks(pvr_dev);
+
 	err = pvr_set_dma_info(pvr_dev);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 506b83d4c782..31aaf9230e71 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -173,6 +173,26 @@ struct pvr_device {
 	 */
 	struct xarray free_list_ids;
 
+	/**
+	 * @job_ids: Array of jobs belonging to this device. Array members
+	 *           are of type "struct pvr_job *".
+	 */
+	struct xarray job_ids;
+
+	/**
+	 * @queues: Queue-related fields.
+	 */
+	struct {
+		/** @active: Active queue list. */
+		struct list_head active;
+
+		/** @idle: Idle queue list. */
+		struct list_head idle;
+
+		/** @lock: Lock protecting access to the active/idle lists. */
+		struct mutex lock;
+	} queues;
+
 	struct {
 		/** @work: Work item for watchdog callback. */
 		struct delayed_work work;
@@ -442,6 +462,7 @@ packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gpu_id *gpu_id)
 
 int pvr_device_init(struct pvr_device *pvr_dev);
 void pvr_device_fini(struct pvr_device *pvr_dev);
+void pvr_device_reset(struct pvr_device *pvr_dev);
 
 bool
 pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk);
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 76ec2a3a21ee..adbf2e8d0ac8 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -7,6 +7,7 @@
 #include "pvr_free_list.h"
 #include "pvr_gem.h"
 #include "pvr_hwrt.h"
+#include "pvr_job.h"
 #include "pvr_mmu.h"
 #include "pvr_power.h"
 #include "pvr_rogue_defs.h"
@@ -32,6 +33,8 @@
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/xarray.h>
 
 /**
  * DOC: PowerVR (Series 6 and later) and IMG Graphics Driver
@@ -397,7 +400,8 @@ pvr_dev_query_runtime_info_get(struct pvr_device *pvr_dev,
 		return 0;
 	}
 
-	runtime_info.free_list_min_pages = 0; /* FIXME */
+	runtime_info.free_list_min_pages =
+		pvr_get_free_list_min_pages(pvr_dev);
 	runtime_info.free_list_max_pages =
 		ROGUE_PM_MAX_FREELIST_SIZE / ROGUE_PM_PAGE_SIZE;
 	runtime_info.common_store_alloc_region_size =
@@ -1137,7 +1141,20 @@ static int
 pvr_ioctl_submit_jobs(struct drm_device *drm_dev, void *raw_args,
 		      struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_submit_jobs_args *args = raw_args;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	int idx;
+	int err;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	err = pvr_submit_jobs(pvr_dev, pvr_file, args);
+
+	drm_dev_exit(idx);
+
+	return err;
 }
 
 int
@@ -1353,7 +1370,8 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
 
 static struct drm_driver pvr_drm_driver = {
-	.driver_features = DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDER,
+	.driver_features = DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDER |
+			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
 	.open = pvr_drm_driver_open,
 	.postclose = pvr_drm_driver_postclose,
 	.ioctls = pvr_drm_driver_ioctls,
@@ -1386,8 +1404,15 @@ pvr_probe(struct platform_device *plat_dev)
 	drm_dev = &pvr_dev->base;
 
 	platform_set_drvdata(plat_dev, drm_dev);
+
+	init_rwsem(&pvr_dev->reset_sem);
+
 	pvr_context_device_init(pvr_dev);
 
+	err = pvr_queue_device_init(pvr_dev);
+	if (err)
+		goto err_context_fini;
+
 	devm_pm_runtime_enable(&plat_dev->dev);
 	pm_runtime_mark_last_busy(&plat_dev->dev);
 
@@ -1404,6 +1429,7 @@ pvr_probe(struct platform_device *plat_dev)
 		goto err_device_fini;
 
 	xa_init_flags(&pvr_dev->free_list_ids, XA_FLAGS_ALLOC1);
+	xa_init_flags(&pvr_dev->job_ids, XA_FLAGS_ALLOC1);
 
 	return 0;
 
@@ -1413,6 +1439,11 @@ pvr_probe(struct platform_device *plat_dev)
 err_watchdog_fini:
 	pvr_watchdog_fini(pvr_dev);
 
+	pvr_queue_device_fini(pvr_dev);
+
+err_context_fini:
+	pvr_context_device_fini(pvr_dev);
+
 	return err;
 }
 
@@ -1422,14 +1453,17 @@ pvr_remove(struct platform_device *plat_dev)
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
 
+	WARN_ON(!xa_empty(&pvr_dev->job_ids));
 	WARN_ON(!xa_empty(&pvr_dev->free_list_ids));
 
+	xa_destroy(&pvr_dev->job_ids);
 	xa_destroy(&pvr_dev->free_list_ids);
 
 	pm_runtime_suspend(drm_dev->dev);
 	pvr_device_fini(pvr_dev);
 	drm_dev_unplug(drm_dev);
 	pvr_watchdog_fini(pvr_dev);
+	pvr_queue_device_fini(pvr_dev);
 	pvr_context_device_fini(pvr_dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
new file mode 100644
index 000000000000..f1cbd85109e5
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -0,0 +1,788 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_context.h"
+#include "pvr_device.h"
+#include "pvr_drv.h"
+#include "pvr_gem.h"
+#include "pvr_hwrt.h"
+#include "pvr_job.h"
+#include "pvr_mmu.h"
+#include "pvr_power.h"
+#include "pvr_rogue_fwif.h"
+#include "pvr_rogue_fwif_client.h"
+#include "pvr_stream.h"
+#include "pvr_stream_defs.h"
+#include "pvr_sync.h"
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/types.h>
+#include <uapi/drm/pvr_drm.h>
+
+static void pvr_job_release(struct kref *kref)
+{
+	struct pvr_job *job = container_of(kref, struct pvr_job, ref_count);
+
+	xa_erase(&job->pvr_dev->job_ids, job->id);
+
+	pvr_hwrt_data_put(job->hwrt);
+	pvr_context_put(job->ctx);
+
+	WARN_ON(job->paired_job);
+
+	pvr_queue_job_cleanup(job);
+	pvr_job_release_pm_ref(job);
+
+	kfree(job->cmd);
+	kfree(job);
+}
+
+/**
+ * pvr_job_put() - Release reference on job
+ * @job: Target job.
+ */
+void
+pvr_job_put(struct pvr_job *job)
+{
+	if (job)
+		kref_put(&job->ref_count, pvr_job_release);
+}
+
+/**
+ * pvr_job_process_stream() - Build job FW structure from stream
+ * @pvr_dev: Device pointer.
+ * @cmd_defs: Stream definition.
+ * @stream: Pointer to command stream.
+ * @stream_size: Size of command stream, in bytes.
+ * @job: Pointer to job.
+ *
+ * Caller is responsible for freeing the output structure.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%ENOMEM on out of memory, or
+ *  * -%EINVAL on malformed stream.
+ */
+static int
+pvr_job_process_stream(struct pvr_device *pvr_dev, const struct pvr_stream_cmd_defs *cmd_defs,
+		       void *stream, u32 stream_size, struct pvr_job *job)
+{
+	int err;
+
+	job->cmd = kzalloc(cmd_defs->dest_size, GFP_KERNEL);
+	if (!job->cmd)
+		return -ENOMEM;
+
+	job->cmd_len = cmd_defs->dest_size;
+
+	err = pvr_stream_process(pvr_dev, cmd_defs, stream, stream_size, job->cmd);
+	if (err)
+		kfree(job->cmd);
+
+	return err;
+}
+
+static int pvr_fw_cmd_init(struct pvr_device *pvr_dev, struct pvr_job *job,
+			   const struct pvr_stream_cmd_defs *stream_def,
+			   u64 stream_userptr, u32 stream_len)
+{
+	void *stream;
+	int err;
+
+	stream = kzalloc(stream_len, GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	if (copy_from_user(stream, u64_to_user_ptr(stream_userptr), stream_len)) {
+		err = -EFAULT;
+		goto err_free_stream;
+	}
+
+	err = pvr_job_process_stream(pvr_dev, stream_def, stream, stream_len, job);
+
+err_free_stream:
+	kfree(stream);
+
+	return err;
+}
+
+static u32
+convert_geom_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST)
+		out_flags |= ROGUE_GEOM_FLAGS_FIRSTKICK;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST)
+		out_flags |= ROGUE_GEOM_FLAGS_LASTKICK;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_GEOM_FLAGS_SINGLE_CORE;
+
+	return out_flags;
+}
+
+static u32
+convert_frag_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_FRAG_FLAGS_SINGLE_CORE;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER)
+		out_flags |= ROGUE_FRAG_FLAGS_DEPTHBUFFER;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER)
+		out_flags |= ROGUE_FRAG_FLAGS_STENCILBUFFER;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP)
+		out_flags |= ROGUE_FRAG_FLAGS_PREVENT_CDM_OVERLAP;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER)
+		out_flags |= ROGUE_FRAG_FLAGS_SCRATCHBUFFER;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS)
+		out_flags |= ROGUE_FRAG_FLAGS_GET_VIS_RESULTS;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE)
+		out_flags |= ROGUE_FRAG_FLAGS_DISABLE_PIXELMERGE;
+
+	return out_flags;
+}
+
+static int
+pvr_geom_job_fw_cmd_init(struct pvr_job *job,
+			 struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_geom *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_RENDER)
+		return -EINVAL;
+
+	if (!job->hwrt)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = ROGUE_FWIF_CCB_CMD_TYPE_GEOM;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_geom_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->cmd_shared.cmn.frame_num = 0;
+	cmd->flags = convert_geom_flags(args->flags);
+	pvr_fw_object_get_fw_addr(job->hwrt->fw_obj, &cmd->cmd_shared.hwrt_data_fw_addr);
+	return 0;
+}
+
+static int
+pvr_frag_job_fw_cmd_init(struct pvr_job *job,
+			 struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_frag *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_RENDER)
+		return -EINVAL;
+
+	if (!job->hwrt)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = (args->flags & DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER) ?
+			       ROGUE_FWIF_CCB_CMD_TYPE_FRAG_PR :
+			       ROGUE_FWIF_CCB_CMD_TYPE_FRAG;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_frag_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->cmd_shared.cmn.frame_num = 0;
+	cmd->flags = convert_frag_flags(args->flags);
+	pvr_fw_object_get_fw_addr(job->hwrt->fw_obj, &cmd->cmd_shared.hwrt_data_fw_addr);
+	return 0;
+}
+
+static u32
+convert_compute_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP)
+		out_flags |= ROGUE_COMPUTE_FLAG_PREVENT_ALL_OVERLAP;
+	if (in_flags & DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_COMPUTE_FLAG_SINGLE_CORE;
+
+	return out_flags;
+}
+
+static int
+pvr_compute_job_fw_cmd_init(struct pvr_job *job,
+			    struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_compute *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_COMPUTE)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = ROGUE_FWIF_CCB_CMD_TYPE_CDM;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_compute_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->common.frame_num = 0;
+	cmd->flags = convert_compute_flags(args->flags);
+	return 0;
+}
+
+static u32
+convert_transfer_flags(u32 in_flags)
+{
+	u32 out_flags = 0;
+
+	if (in_flags & DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE)
+		out_flags |= ROGUE_TRANSFER_FLAGS_SINGLE_CORE;
+
+	return out_flags;
+}
+
+static int
+pvr_transfer_job_fw_cmd_init(struct pvr_job *job,
+			     struct drm_pvr_job *args)
+{
+	struct rogue_fwif_cmd_transfer *cmd;
+	int err;
+
+	if (args->flags & ~DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK)
+		return -EINVAL;
+
+	if (job->ctx->type != DRM_PVR_CTX_TYPE_TRANSFER_FRAG)
+		return -EINVAL;
+
+	job->fw_ccb_cmd_type = ROGUE_FWIF_CCB_CMD_TYPE_TQ_3D;
+	err = pvr_fw_cmd_init(job->pvr_dev, job, &pvr_cmd_transfer_stream,
+			      args->cmd_stream, args->cmd_stream_len);
+	if (err)
+		return err;
+
+	cmd = job->cmd;
+	cmd->common.frame_num = 0;
+	cmd->flags = convert_transfer_flags(args->flags);
+	return 0;
+}
+
+static int
+pvr_job_fw_cmd_init(struct pvr_job *job,
+		    struct drm_pvr_job *args)
+{
+	switch (args->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return pvr_geom_job_fw_cmd_init(job, args);
+
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return pvr_frag_job_fw_cmd_init(job, args);
+
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return pvr_compute_job_fw_cmd_init(job, args);
+
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return pvr_transfer_job_fw_cmd_init(job, args);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * struct pvr_job_data - Helper container for pairing jobs with the
+ * sync_ops supplied for them by the user.
+ */
+struct pvr_job_data {
+	/** @job: Pointer to the job. */
+	struct pvr_job *job;
+
+	/** @sync_ops: Pointer to the sync_ops associated with @job. */
+	struct drm_pvr_sync_op *sync_ops;
+
+	/** @sync_op_count: Number of members of @sync_ops. */
+	u32 sync_op_count;
+};
+
+/**
+ * prepare_job_syncs() - Prepare all sync objects for a single job.
+ * @pvr_file: PowerVR file.
+ * @job_data: Precreated job and sync_ops array.
+ * @signal_array: xarray to receive signal sync objects.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_sync_signal_array_collect_ops(),
+ *    pvr_sync_add_deps_to_job(), drm_sched_job_add_resv_dependencies() or
+ *    pvr_sync_signal_array_update_fences().
+ */
+static int
+prepare_job_syncs(struct pvr_file *pvr_file,
+		  struct pvr_job_data *job_data,
+		  struct xarray *signal_array)
+{
+	struct dma_fence *done_fence;
+	int err = pvr_sync_signal_array_collect_ops(signal_array,
+						    from_pvr_file(pvr_file),
+						    job_data->sync_op_count,
+						    job_data->sync_ops);
+
+	if (err)
+		return err;
+
+	err = pvr_sync_add_deps_to_job(pvr_file, &job_data->job->base,
+				       job_data->sync_op_count,
+				       job_data->sync_ops, signal_array);
+	if (err)
+		return err;
+
+	if (job_data->job->hwrt) {
+		/* The geometry job writes the HWRT region headers, which are
+		 * then read by the fragment job.
+		 */
+		struct drm_gem_object *obj =
+			gem_from_pvr_gem(job_data->job->hwrt->fw_obj->gem);
+		enum dma_resv_usage usage =
+			dma_resv_usage_rw(job_data->job->type ==
+					  DRM_PVR_JOB_TYPE_GEOMETRY);
+
+		dma_resv_lock(obj->resv, NULL);
+		err = drm_sched_job_add_resv_dependencies(&job_data->job->base,
+							  obj->resv, usage);
+		dma_resv_unlock(obj->resv);
+		if (err)
+			return err;
+	}
+
+	/* We need to arm the job to get the job done fence. */
+	done_fence = pvr_queue_job_arm(job_data->job);
+
+	err = pvr_sync_signal_array_update_fences(signal_array,
+						  job_data->sync_op_count,
+						  job_data->sync_ops,
+						  done_fence);
+	return err;
+}
+
+/**
+ * prepare_job_syncs_for_each() - Prepare all sync objects for an array of jobs.
+ * @file: PowerVR file.
+ * @job_data: Array of precreated jobs and their sync_ops.
+ * @job_count: Number of jobs.
+ * @signal_array: xarray to receive signal sync objects.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_vm_bind_job_prepare_syncs().
+ */
+static int
+prepare_job_syncs_for_each(struct pvr_file *pvr_file,
+			   struct pvr_job_data *job_data,
+			   u32 *job_count,
+			   struct xarray *signal_array)
+{
+	for (u32 i = 0; i < *job_count; i++) {
+		int err = prepare_job_syncs(pvr_file, &job_data[i],
+					    signal_array);
+
+		if (err) {
+			*job_count = i;
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static struct pvr_job *
+create_job(struct pvr_device *pvr_dev,
+	   struct pvr_file *pvr_file,
+	   struct drm_pvr_job *args)
+{
+	struct pvr_job *job = NULL;
+	int err;
+
+	if (!args->cmd_stream || !args->cmd_stream_len)
+		return ERR_PTR(-EINVAL);
+
+	if (args->type != DRM_PVR_JOB_TYPE_GEOMETRY &&
+	    args->type != DRM_PVR_JOB_TYPE_FRAGMENT &&
+	    (args->hwrt.set_handle || args->hwrt.data_index))
+		return ERR_PTR(-EINVAL);
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&job->ref_count);
+	job->type = args->type;
+	job->pvr_dev = pvr_dev;
+
+	err = xa_alloc(&pvr_dev->job_ids, &job->id, job, xa_limit_32b, GFP_KERNEL);
+	if (err)
+		goto err_put_job;
+
+	job->ctx = pvr_context_lookup(pvr_file, args->context_handle);
+	if (!job->ctx) {
+		err = -EINVAL;
+		goto err_put_job;
+	}
+
+	if (args->hwrt.set_handle) {
+		job->hwrt = pvr_hwrt_data_lookup(pvr_file, args->hwrt.set_handle,
+						 args->hwrt.data_index);
+		if (!job->hwrt) {
+			err = -EINVAL;
+			goto err_put_job;
+		}
+	}
+
+	err = pvr_job_fw_cmd_init(job, args);
+	if (err)
+		goto err_put_job;
+
+	err = pvr_queue_job_init(job);
+	if (err)
+		goto err_put_job;
+
+	return job;
+
+err_put_job:
+	pvr_job_put(job);
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_job_data_fini() - Cleanup all allocs used to set up job submission.
+ * @job_data: Job data array.
+ * @job_count: Number of members of @job_data.
+ */
+static void
+pvr_job_data_fini(struct pvr_job_data *job_data, u32 job_count)
+{
+	for (u32 i = 0; i < job_count; i++) {
+		pvr_job_put(job_data[i].job);
+		kvfree(job_data[i].sync_ops);
+	}
+}
+
+/**
+ * pvr_job_data_init() - Init an array of created jobs, associating them with
+ * the appropriate sync_ops args, which will be copied in.
+ * @pvr_dev: Target PowerVR device.
+ * @pvr_file: Pointer to PowerVR file structure.
+ * @job_args: Job args array copied from user.
+ * @job_count: Number of members of @job_args.
+ * @job_data_out: Job data array.
+ */
+static int pvr_job_data_init(struct pvr_device *pvr_dev,
+			     struct pvr_file *pvr_file,
+			     struct drm_pvr_job *job_args,
+			     u32 *job_count,
+			     struct pvr_job_data *job_data_out)
+{
+	int err = 0, i = 0;
+
+	for (; i < *job_count; i++) {
+		job_data_out[i].job =
+			create_job(pvr_dev, pvr_file, &job_args[i]);
+		err = PTR_ERR_OR_ZERO(job_data_out[i].job);
+
+		if (err) {
+			*job_count = i;
+			job_data_out[i].job = NULL;
+			goto err_cleanup;
+		}
+
+		err = PVR_UOBJ_GET_ARRAY(job_data_out[i].sync_ops,
+					 &job_args[i].sync_ops);
+		if (err) {
+			*job_count = i;
+
+			/* Ensure the job created above is also cleaned up. */
+			i++;
+			goto err_cleanup;
+		}
+
+		job_data_out[i].sync_op_count = job_args[i].sync_ops.count;
+	}
+
+	return 0;
+
+err_cleanup:
+	pvr_job_data_fini(job_data_out, i);
+
+	return err;
+}
+
+static void
+push_jobs(struct pvr_job_data *job_data, u32 job_count)
+{
+	for (u32 i = 0; i < job_count; i++)
+		pvr_queue_job_push(job_data[i].job);
+}
+
+static int
+prepare_fw_obj_resv(struct drm_exec *exec, struct pvr_fw_object *fw_obj)
+{
+	return drm_exec_prepare_obj(exec, gem_from_pvr_gem(fw_obj->gem), 1);
+}
+
+static int
+jobs_lock_all_objs(struct drm_exec *exec, struct pvr_job_data *job_data,
+		   u32 job_count)
+{
+	for (u32 i = 0; i < job_count; i++) {
+		struct pvr_job *job = job_data[i].job;
+
+		/* Grab a lock on a the context, to guard against
+		 * concurrent submission to the same queue.
+		 */
+		int err = drm_exec_lock_obj(exec,
+					    gem_from_pvr_gem(job->ctx->fw_obj->gem));
+
+		if (err)
+			return err;
+
+		if (job->hwrt) {
+			err = prepare_fw_obj_resv(exec,
+						  job->hwrt->fw_obj);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+static int
+prepare_job_resvs_for_each(struct drm_exec *exec, struct pvr_job_data *job_data,
+			   u32 job_count)
+{
+	drm_exec_until_all_locked(exec) {
+		int err = jobs_lock_all_objs(exec, job_data, job_count);
+
+		drm_exec_retry_on_contention(exec);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static void
+update_job_resvs(struct pvr_job *job)
+{
+	if (job->hwrt) {
+		enum dma_resv_usage usage = job->type == DRM_PVR_JOB_TYPE_GEOMETRY ?
+					    DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ;
+		struct drm_gem_object *obj = gem_from_pvr_gem(job->hwrt->fw_obj->gem);
+
+		dma_resv_add_fence(obj->resv, &job->base.s_fence->finished, usage);
+	}
+}
+
+static void
+update_job_resvs_for_each(struct pvr_job_data *job_data, u32 job_count)
+{
+	for (u32 i = 0; i < job_count; i++)
+		update_job_resvs(job_data[i].job);
+}
+
+static bool can_combine_jobs(struct pvr_job *a, struct pvr_job *b)
+{
+	struct pvr_job *geom_job = a, *frag_job = b;
+	struct dma_fence *fence;
+	unsigned long index;
+
+	/* Geometry and fragment jobs can be combined if they are queued to the
+	 * same context and targeting the same HWRT.
+	 */
+	if (a->type != DRM_PVR_JOB_TYPE_GEOMETRY ||
+	    b->type != DRM_PVR_JOB_TYPE_FRAGMENT ||
+	    a->ctx != b->ctx ||
+	    a->hwrt != b->hwrt)
+		return false;
+
+	xa_for_each(&frag_job->base.dependencies, index, fence) {
+		/* We combine when we see an explicit geom -> frag dep. */
+		if (&geom_job->base.s_fence->scheduled == fence)
+			return true;
+	}
+
+	return false;
+}
+
+static struct dma_fence *
+get_last_queued_job_scheduled_fence(struct pvr_queue *queue,
+				    struct pvr_job_data *job_data,
+				    u32 cur_job_pos)
+{
+	/* We iterate over the current job array in reverse order to grab the
+	 * last to-be-queued job targeting the same queue.
+	 */
+	for (u32 i = cur_job_pos; i > 0; i--) {
+		struct pvr_job *job = job_data[i - 1].job;
+
+		if (job->ctx == queue->ctx && job->type == queue->type)
+			return dma_fence_get(&job->base.s_fence->scheduled);
+	}
+
+	/* If we didn't find any, we just return the last queued job scheduled
+	 * fence attached to the queue.
+	 */
+	return dma_fence_get(queue->last_queued_job_scheduled_fence);
+}
+
+static int
+pvr_jobs_link_geom_frag(struct pvr_job_data *job_data, u32 *job_count)
+{
+	for (u32 i = 0; i < *job_count - 1; i++) {
+		struct pvr_job *geom_job = job_data[i].job;
+		struct pvr_job *frag_job = job_data[i + 1].job;
+		struct pvr_queue *frag_queue;
+		struct dma_fence *f;
+
+		if (!can_combine_jobs(job_data[i].job, job_data[i + 1].job))
+			continue;
+
+		/* The fragment job will be submitted by the geometry queue. We
+		 * need to make sure it comes after all the other fragment jobs
+		 * queued before it.
+		 */
+		frag_queue = pvr_context_get_queue_for_job(frag_job->ctx,
+							   frag_job->type);
+		f = get_last_queued_job_scheduled_fence(frag_queue, job_data,
+							i);
+		if (f) {
+			int err = drm_sched_job_add_dependency(&geom_job->base,
+							       f);
+			if (err) {
+				*job_count = i;
+				return err;
+			}
+		}
+
+		/* The KCCB slot will be reserved by the geometry job, so we can
+		 * drop the KCCB fence on the fragment job.
+		 */
+		pvr_kccb_fence_put(frag_job->kccb_fence);
+		frag_job->kccb_fence = NULL;
+
+		geom_job->paired_job = frag_job;
+		frag_job->paired_job = geom_job;
+
+		/* Skip the fragment job we just paired to the geometry job. */
+		i++;
+	}
+
+	return 0;
+}
+
+/**
+ * pvr_submit_jobs() - Submit jobs to the GPU
+ * @pvr_dev: Target PowerVR device.
+ * @pvr_file: Pointer to PowerVR file structure.
+ * @args: Ioctl args.
+ * @job_count: Number of jobs in @jobs_args. On error this will be updated
+ * with the index into @jobs_args where the error occurred.
+ *
+ * This initial implementation is entirely synchronous; on return the GPU will
+ * be idle. This will not be the case for future implementations.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EFAULT if arguments can not be copied from user space, or
+ *  * -%EINVAL on invalid arguments, or
+ *  * Any other error.
+ */
+int
+pvr_submit_jobs(struct pvr_device *pvr_dev, struct pvr_file *pvr_file,
+		struct drm_pvr_ioctl_submit_jobs_args *args)
+{
+	struct pvr_job_data *job_data = NULL;
+	struct drm_pvr_job *job_args;
+	struct xarray signal_array;
+	u32 jobs_alloced = 0;
+	struct drm_exec exec;
+	int err;
+
+	if (!args->jobs.count)
+		return -EINVAL;
+
+	err = PVR_UOBJ_GET_ARRAY(job_args, &args->jobs);
+	if (err)
+		return err;
+
+	job_data = kvmalloc_array(args->jobs.count, sizeof(*job_data),
+				  GFP_KERNEL | __GFP_ZERO);
+	if (!job_data) {
+		err = -ENOMEM;
+		goto out_free;
+	}
+
+	err = pvr_job_data_init(pvr_dev, pvr_file, job_args, &args->jobs.count,
+				job_data);
+	if (err)
+		goto out_free;
+
+	jobs_alloced = args->jobs.count;
+
+	/*
+	 * Flush MMU if needed - this has been deferred until now to avoid
+	 * overuse of this expensive operation.
+	 */
+	err = pvr_mmu_flush_exec(pvr_dev, false);
+	if (err)
+		goto out_job_data_cleanup;
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES);
+
+	xa_init_flags(&signal_array, XA_FLAGS_ALLOC);
+
+	err = prepare_job_syncs_for_each(pvr_file, job_data, &args->jobs.count,
+					 &signal_array);
+	if (err)
+		goto out_exec_fini;
+
+	err = prepare_job_resvs_for_each(&exec, job_data, args->jobs.count);
+	if (err)
+		goto out_exec_fini;
+
+	err = pvr_jobs_link_geom_frag(job_data, &args->jobs.count);
+	if (err)
+		goto out_exec_fini;
+
+	/* Anything after that point must succeed because we start exposing job
+	 * finished fences to the outside world.
+	 */
+	update_job_resvs_for_each(job_data, args->jobs.count);
+	push_jobs(job_data, args->jobs.count);
+	pvr_sync_signal_array_push_fences(&signal_array);
+	err = 0;
+
+out_exec_fini:
+	drm_exec_fini(&exec);
+	pvr_sync_signal_array_cleanup(&signal_array);
+
+out_job_data_cleanup:
+	pvr_job_data_fini(job_data, jobs_alloced);
+
+out_free:
+	kvfree(job_data);
+	kvfree(job_args);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_job.h b/drivers/gpu/drm/imagination/pvr_job.h
new file mode 100644
index 000000000000..dd5f9e9677f9
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_job.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_JOB_H
+#define PVR_JOB_H
+
+#include <uapi/drm/pvr_drm.h>
+
+#include <linux/kref.h>
+#include <linux/types.h>
+
+#include <drm/drm_gem.h>
+#include <drm/gpu_scheduler.h>
+
+#include "pvr_power.h"
+
+/* Forward declaration from "pvr_context.h". */
+struct pvr_context;
+
+/* Forward declarations from "pvr_device.h". */
+struct pvr_device;
+struct pvr_file;
+
+/* Forward declarations from "pvr_hwrt.h". */
+struct pvr_hwrt_data;
+
+/* Forward declaration from "pvr_queue.h". */
+struct pvr_queue;
+
+struct pvr_job {
+	/** @base: drm_sched_job object. */
+	struct drm_sched_job base;
+
+	/** @ref_count: Refcount for job. */
+	struct kref ref_count;
+
+	/** @type: Type of job. */
+	enum drm_pvr_job_type type;
+
+	/** @id: Job ID number. */
+	u32 id;
+
+	/**
+	 * @paired_job: Job paired to this job.
+	 *
+	 * This field is only meaningful for geometry and fragment jobs.
+	 *
+	 * Paired jobs are executed on the same context, and need to be submitted
+	 * atomically to the FW, to make sure the partial render logic has a
+	 * fragment job to execute when the Parameter Manager runs out of memory.
+	 *
+	 * The geometry job should point to the fragment job it's paired with,
+	 * and the fragment job should point to the geometry job it's paired with.
+	 */
+	struct pvr_job *paired_job;
+
+	/** @cccb_fence: Fence used to wait for CCCB space. */
+	struct dma_fence *cccb_fence;
+
+	/** @kccb_fence: Fence used to wait for KCCB space. */
+	struct dma_fence *kccb_fence;
+
+	/** @done_fence: Fence to signal when the job is done. */
+	struct dma_fence *done_fence;
+
+	/** @pvr_dev: Device pointer. */
+	struct pvr_device *pvr_dev;
+
+	/** @ctx: Pointer to owning context. */
+	struct pvr_context *ctx;
+
+	/** @cmd: Command data. Format depends on @type. */
+	void *cmd;
+
+	/** @cmd_len: Length of command data, in bytes. */
+	u32 cmd_len;
+
+	/**
+	 * @fw_ccb_cmd_type: Firmware CCB command type. Must be one of %ROGUE_FWIF_CCB_CMD_TYPE_*.
+	 */
+	u32 fw_ccb_cmd_type;
+
+	/** @hwrt: HWRT object. Will be NULL for compute and transfer jobs. */
+	struct pvr_hwrt_data *hwrt;
+
+	/**
+	 * @has_pm_ref: True if the job has a power ref, thus forcing the GPU to stay on until
+	 * the job is done.
+	 */
+	bool has_pm_ref;
+};
+
+/**
+ * pvr_job_get() - Take additional reference on job.
+ * @job: Job pointer.
+ *
+ * Call pvr_job_put() to release.
+ *
+ * Returns:
+ *  * The requested job on success, or
+ *  * %NULL if no job pointer passed.
+ */
+static __always_inline struct pvr_job *
+pvr_job_get(struct pvr_job *job)
+{
+	if (job)
+		kref_get(&job->ref_count);
+
+	return job;
+}
+
+void pvr_job_put(struct pvr_job *job);
+
+/**
+ * pvr_job_release_pm_ref() - Release the PM ref if the job acquired it.
+ * @job: The job to release the PM ref on.
+ */
+static __always_inline void
+pvr_job_release_pm_ref(struct pvr_job *job)
+{
+	if (job->has_pm_ref) {
+		pvr_power_put(job->pvr_dev);
+		job->has_pm_ref = false;
+	}
+}
+
+/**
+ * pvr_job_get_pm_ref() - Get a PM ref and attach it to the job.
+ * @job: The job to attach the PM ref to.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_power_get() otherwise.
+ */
+static __always_inline int
+pvr_job_get_pm_ref(struct pvr_job *job)
+{
+	int err;
+
+	if (job->has_pm_ref)
+		return 0;
+
+	err = pvr_power_get(job->pvr_dev);
+	if (!err)
+		job->has_pm_ref = true;
+
+	return err;
+}
+
+int pvr_job_wait_first_non_signaled_native_dep(struct pvr_job *job);
+
+bool pvr_job_non_native_deps_done(struct pvr_job *job);
+
+int pvr_job_fits_in_cccb(struct pvr_job *job, unsigned long native_dep_count);
+
+void pvr_job_submit(struct pvr_job *job);
+
+int pvr_submit_jobs(struct pvr_device *pvr_dev, struct pvr_file *pvr_file,
+		    struct drm_pvr_ioctl_submit_jobs_args *args);
+
+#endif /* PVR_JOB_H */
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 40ade2226552..920828c4f579 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -5,6 +5,7 @@
 #include "pvr_fw.h"
 #include "pvr_fw_startstop.h"
 #include "pvr_power.h"
+#include "pvr_queue.h"
 #include "pvr_rogue_fwif.h"
 
 #include <drm/drm_drv.h>
@@ -155,6 +156,21 @@ pvr_watchdog_kccb_stalled(struct pvr_device *pvr_dev)
 			pvr_dev->watchdog.kccb_stall_count = 0;
 			return true;
 		}
+	} else if (pvr_dev->watchdog.old_kccb_cmds_executed == kccb_cmds_executed) {
+		bool has_active_contexts;
+
+		mutex_lock(&pvr_dev->queues.lock);
+		has_active_contexts = list_empty(&pvr_dev->queues.active);
+		mutex_unlock(&pvr_dev->queues.lock);
+
+		if (has_active_contexts) {
+			/* Send a HEALTH_CHECK command so we can verify FW is still alive. */
+			struct rogue_fwif_kccb_cmd health_check_cmd;
+
+			health_check_cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_HEALTH_CHECK;
+
+			pvr_kccb_send_cmd_powered(pvr_dev, &health_check_cmd, NULL);
+		}
 	} else {
 		pvr_dev->watchdog.old_kccb_cmds_executed = kccb_cmds_executed;
 		pvr_dev->watchdog.kccb_stall_count = 0;
@@ -318,6 +334,7 @@ pvr_power_device_idle(struct device *dev)
 int
 pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 {
+	bool queues_disabled = false;
 	int err;
 
 	/*
@@ -337,6 +354,11 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 	disable_irq(pvr_dev->irq);
 
 	do {
+		if (hard_reset) {
+			pvr_queue_device_pre_reset(pvr_dev);
+			queues_disabled = true;
+		}
+
 		err = pvr_power_fw_disable(pvr_dev, hard_reset);
 		if (!err) {
 			if (hard_reset) {
@@ -372,6 +394,9 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 		}
 	} while (err);
 
+	if (queues_disabled)
+		pvr_queue_device_post_reset(pvr_dev);
+
 	enable_irq(pvr_dev->irq);
 
 	up_write(&pvr_dev->reset_sem);
@@ -386,6 +411,9 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 
 	/* Leave IRQs disabled if the device is lost. */
 
+	if (queues_disabled)
+		pvr_queue_device_post_reset(pvr_dev);
+
 err_up_write:
 	up_write(&pvr_dev->reset_sem);
 
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
new file mode 100644
index 000000000000..3a5a73fb7f0a
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -0,0 +1,1455 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include <drm/drm_managed.h>
+#include <drm/gpu_scheduler.h>
+
+#include "pvr_cccb.h"
+#include "pvr_context.h"
+#include "pvr_device.h"
+#include "pvr_drv.h"
+#include "pvr_job.h"
+#include "pvr_queue.h"
+#include "pvr_vm.h"
+
+#include "pvr_rogue_fwif_client.h"
+
+#define MAX_DEADLINE_MS 30000
+
+#define CTX_COMPUTE_CCCB_SIZE_LOG2 15
+#define CTX_FRAG_CCCB_SIZE_LOG2 15
+#define CTX_GEOM_CCCB_SIZE_LOG2 15
+#define CTX_TRANSFER_CCCB_SIZE_LOG2 15
+
+static int get_xfer_ctx_state_size(struct pvr_device *pvr_dev)
+{
+	u32 num_isp_store_registers;
+
+	if (PVR_HAS_FEATURE(pvr_dev, xe_memory_hierarchy)) {
+		num_isp_store_registers = 1;
+	} else {
+		int err;
+
+		err = PVR_FEATURE_VALUE(pvr_dev, num_isp_ipp_pipes, &num_isp_store_registers);
+		if (WARN_ON(err))
+			return err;
+	}
+
+	return sizeof(struct rogue_fwif_frag_ctx_state) +
+	       (num_isp_store_registers *
+		sizeof(((struct rogue_fwif_frag_ctx_state *)0)->frag_reg_isp_store[0]));
+}
+
+static int get_frag_ctx_state_size(struct pvr_device *pvr_dev)
+{
+	u32 num_isp_store_registers;
+	int err;
+
+	if (PVR_HAS_FEATURE(pvr_dev, xe_memory_hierarchy)) {
+		err = PVR_FEATURE_VALUE(pvr_dev, num_raster_pipes, &num_isp_store_registers);
+		if (WARN_ON(err))
+			return err;
+
+		if (PVR_HAS_FEATURE(pvr_dev, gpu_multicore_support)) {
+			u32 xpu_max_slaves;
+
+			err = PVR_FEATURE_VALUE(pvr_dev, xpu_max_slaves, &xpu_max_slaves);
+			if (WARN_ON(err))
+				return err;
+
+			num_isp_store_registers *= (1 + xpu_max_slaves);
+		}
+	} else {
+		err = PVR_FEATURE_VALUE(pvr_dev, num_isp_ipp_pipes, &num_isp_store_registers);
+		if (WARN_ON(err))
+			return err;
+	}
+
+	return sizeof(struct rogue_fwif_frag_ctx_state) +
+	       (num_isp_store_registers *
+		sizeof(((struct rogue_fwif_frag_ctx_state *)0)->frag_reg_isp_store[0]));
+}
+
+static int get_ctx_state_size(struct pvr_device *pvr_dev, enum drm_pvr_job_type type)
+{
+	switch (type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return sizeof(struct rogue_fwif_geom_ctx_state);
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return get_frag_ctx_state_size(pvr_dev);
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return sizeof(struct rogue_fwif_compute_ctx_state);
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return get_xfer_ctx_state_size(pvr_dev);
+	}
+
+	WARN(1, "Invalid queue type");
+	return -EINVAL;
+}
+
+static u32 get_ctx_offset(enum drm_pvr_job_type type)
+{
+	switch (type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return offsetof(struct rogue_fwif_fwrendercontext, geom_context);
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return offsetof(struct rogue_fwif_fwrendercontext, frag_context);
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return offsetof(struct rogue_fwif_fwcomputecontext, cdm_context);
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return offsetof(struct rogue_fwif_fwtransfercontext, tq_context);
+	}
+
+	return 0;
+}
+
+static const char *
+pvr_queue_fence_get_driver_name(struct dma_fence *f)
+{
+	return PVR_DRIVER_NAME;
+}
+
+static void pvr_queue_fence_release(struct dma_fence *f)
+{
+	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+
+	pvr_context_put(fence->queue->ctx);
+	dma_fence_free(f);
+}
+
+static const char *
+pvr_queue_job_fence_get_timeline_name(struct dma_fence *f)
+{
+	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+
+	switch (fence->queue->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return "geometry";
+
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return "fragment";
+
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return "compute";
+
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return "transfer";
+	}
+
+	WARN(1, "Invalid queue type");
+	return "invalid";
+}
+
+static const char *
+pvr_queue_cccb_fence_get_timeline_name(struct dma_fence *f)
+{
+	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+
+	switch (fence->queue->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return "geometry-cccb";
+
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return "fragment-cccb";
+
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return "compute-cccb";
+
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+		return "transfer-cccb";
+	}
+
+	WARN(1, "Invalid queue type");
+	return "invalid";
+}
+
+static const struct dma_fence_ops pvr_queue_job_fence_ops = {
+	.get_driver_name = pvr_queue_fence_get_driver_name,
+	.get_timeline_name = pvr_queue_job_fence_get_timeline_name,
+	.release = pvr_queue_fence_release,
+};
+
+/**
+ * to_pvr_queue_job_fence() - Return a pvr_queue_fence object if the fence is
+ * backed by a UFO.
+ * @f: The dma_fence to turn into a pvr_queue_fence.
+ *
+ * Return:
+ *  * A non-NULL pvr_queue_fence object if the dma_fence is backed by a UFO, or
+ *  * NULL otherwise.
+ */
+static struct pvr_queue_fence *
+to_pvr_queue_job_fence(struct dma_fence *f)
+{
+	struct drm_sched_fence *sched_fence = to_drm_sched_fence(f);
+
+	if (sched_fence)
+		f = sched_fence->parent;
+
+	if (f && f->ops == &pvr_queue_job_fence_ops)
+		return container_of(f, struct pvr_queue_fence, base);
+
+	return NULL;
+}
+
+static const struct dma_fence_ops pvr_queue_cccb_fence_ops = {
+	.get_driver_name = pvr_queue_fence_get_driver_name,
+	.get_timeline_name = pvr_queue_cccb_fence_get_timeline_name,
+	.release = pvr_queue_fence_release,
+};
+
+/**
+ * pvr_queue_fence_put() - Put wrapper for pvr_queue_fence objects.
+ * @f: The dma_fence object to put.
+ *
+ * If the pvr_queue_fence has been initialized, we call dma_fence_put(),
+ * otherwise we free the object with dma_fence_free(). This allows us
+ * to do the right thing before and after pvr_queue_fence_init() had been
+ * called.
+ */
+static void pvr_queue_fence_put(struct dma_fence *f)
+{
+	if (!f)
+		return;
+
+	if (WARN_ON(f->ops &&
+		    f->ops != &pvr_queue_cccb_fence_ops &&
+		    f->ops != &pvr_queue_job_fence_ops))
+		return;
+
+	/* If the fence hasn't been initialized yet, free the object directly. */
+	if (f->ops)
+		dma_fence_put(f);
+	else
+		dma_fence_free(f);
+}
+
+/**
+ * pvr_queue_fence_alloc() - Allocate a pvr_queue_fence fence object
+ *
+ * Call this function to allocate job CCCB and done fences. This only
+ * allocates the objects. Initialization happens when the underlying
+ * dma_fence object is to be returned to drm_sched (in prepare_job() or
+ * run_job()).
+ *
+ * Return:
+ *  * A valid pointer if the allocation succeeds, or
+ *  * NULL if the allocation fails.
+ */
+static struct dma_fence *
+pvr_queue_fence_alloc(void)
+{
+	struct pvr_queue_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return NULL;
+
+	return &fence->base;
+}
+
+/**
+ * pvr_queue_fence_init() - Initializes a pvr_queue_fence object.
+ * @f: The fence to initialize
+ * @queue: The queue this fence belongs to.
+ * @fence_ops: The fence operations.
+ * @fence_ctx: The fence context.
+ *
+ * Wrapper around dma_fence_init() that takes care of initializing the
+ * pvr_queue_fence::queue field too.
+ */
+static void
+pvr_queue_fence_init(struct dma_fence *f,
+		     struct pvr_queue *queue,
+		     const struct dma_fence_ops *fence_ops,
+		     struct pvr_queue_fence_ctx *fence_ctx)
+{
+	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+
+	pvr_context_get(queue->ctx);
+	fence->queue = queue;
+	dma_fence_init(&fence->base, fence_ops,
+		       &fence_ctx->lock, fence_ctx->id,
+		       atomic_inc_return(&fence_ctx->seqno));
+}
+
+/**
+ * pvr_queue_cccb_fence_init() - Initializes a CCCB fence object.
+ * @fence: The fence to initialize.
+ * @queue: The queue this fence belongs to.
+ *
+ * Initializes a fence that can be used to wait for CCCB space.
+ *
+ * Should be called in the ::prepare_job() path, so the fence returned to
+ * drm_sched is valid.
+ */
+static void
+pvr_queue_cccb_fence_init(struct dma_fence *fence, struct pvr_queue *queue)
+{
+	pvr_queue_fence_init(fence, queue, &pvr_queue_cccb_fence_ops,
+			     &queue->cccb_fence_ctx.base);
+}
+
+/**
+ * pvr_queue_job_fence_init() - Initializes a job done fence object.
+ * @fence: The fence to initialize.
+ * @queue: The queue this fence belongs to.
+ *
+ * Initializes a fence that will be signaled when the GPU is done executing
+ * a job.
+ *
+ * Should be called in the ::run_job() path, so the fence returned to drm_sched
+ * is valid.
+ */
+static void
+pvr_queue_job_fence_init(struct dma_fence *fence, struct pvr_queue *queue)
+{
+	pvr_queue_fence_init(fence, queue, &pvr_queue_job_fence_ops,
+			     &queue->job_fence_ctx);
+}
+
+/**
+ * pvr_queue_fence_ctx_init() - Queue fence context initialization.
+ * @fence_ctx: The context to initialize
+ */
+static void
+pvr_queue_fence_ctx_init(struct pvr_queue_fence_ctx *fence_ctx)
+{
+	spin_lock_init(&fence_ctx->lock);
+	fence_ctx->id = dma_fence_context_alloc(1);
+	atomic_set(&fence_ctx->seqno, 0);
+}
+
+static u32 ufo_cmds_size(u32 elem_count)
+{
+	/* We can pass at most ROGUE_FWIF_CCB_CMD_MAX_UFOS per UFO-related command. */
+	u32 full_cmd_count = elem_count / ROGUE_FWIF_CCB_CMD_MAX_UFOS;
+	u32 remaining_elems = elem_count % ROGUE_FWIF_CCB_CMD_MAX_UFOS;
+	u32 size = full_cmd_count *
+		   pvr_cccb_get_size_of_cmd_with_hdr(ROGUE_FWIF_CCB_CMD_MAX_UFOS *
+						     sizeof(struct rogue_fwif_ufo));
+
+	if (remaining_elems) {
+		size += pvr_cccb_get_size_of_cmd_with_hdr(remaining_elems *
+							  sizeof(struct rogue_fwif_ufo));
+	}
+
+	return size;
+}
+
+static u32 job_cmds_size(struct pvr_job *job, u32 ufo_wait_count)
+{
+	/* One UFO cmd for the fence signaling, one UFO cmd per native fence native,
+	 * and a command for the job itself.
+	 */
+	return ufo_cmds_size(1) + ufo_cmds_size(ufo_wait_count) +
+	       pvr_cccb_get_size_of_cmd_with_hdr(job->cmd_len);
+}
+
+/**
+ * job_count_remaining_native_deps() - Count the number of non-signaled native dependencies.
+ * @job: Job to operate on.
+ *
+ * Returns: Number of non-signaled native deps remaining.
+ */
+static unsigned long job_count_remaining_native_deps(struct pvr_job *job)
+{
+	unsigned long remaining_count = 0;
+	struct dma_fence *fence = NULL;
+	unsigned long index;
+
+	xa_for_each(&job->base.dependencies, index, fence) {
+		struct pvr_queue_fence *jfence;
+
+		jfence = to_pvr_queue_job_fence(fence);
+		if (!jfence)
+			continue;
+
+		if (!dma_fence_is_signaled(&jfence->base))
+			remaining_count++;
+	}
+
+	return remaining_count;
+}
+
+/**
+ * pvr_queue_get_job_cccb_fence() - Get the CCCB fence attached to a job.
+ * @queue: The queue this job will be submitted to.
+ * @job: The job to get the CCCB fence on.
+ *
+ * The CCCB fence is a synchronization primitive allowing us to delay job
+ * submission until there's enough space in the CCCB to submit the job.
+ *
+ * Return:
+ *  * NULL if there's enough space in the CCCB to submit this job, or
+ *  * A valid dma_fence object otherwise.
+ */
+static struct dma_fence *
+pvr_queue_get_job_cccb_fence(struct pvr_queue *queue, struct pvr_job *job)
+{
+	struct pvr_queue_fence *cccb_fence;
+	unsigned int native_deps_remaining;
+
+	/* If the fence is NULL, that means we already checked that we had
+	 * enough space in the cccb for our job.
+	 */
+	if (!job->cccb_fence)
+		return NULL;
+
+	mutex_lock(&queue->cccb_fence_ctx.job_lock);
+
+	/* Count remaining native dependencies and check if the job fits in the CCCB. */
+	native_deps_remaining = job_count_remaining_native_deps(job);
+	if (pvr_cccb_cmdseq_fits(&queue->cccb, job_cmds_size(job, native_deps_remaining))) {
+		pvr_queue_fence_put(job->cccb_fence);
+		job->cccb_fence = NULL;
+		goto out_unlock;
+	}
+
+	/* There should be no job attached to the CCCB fence context:
+	 * drm_sched_entity guarantees that jobs are submitted one at a time.
+	 */
+	if (WARN_ON(queue->cccb_fence_ctx.job))
+		pvr_job_put(queue->cccb_fence_ctx.job);
+
+	queue->cccb_fence_ctx.job = pvr_job_get(job);
+
+	/* Initialize the fence before returning it. */
+	cccb_fence = container_of(job->cccb_fence, struct pvr_queue_fence, base);
+	if (!WARN_ON(cccb_fence->queue))
+		pvr_queue_cccb_fence_init(job->cccb_fence, queue);
+
+out_unlock:
+	mutex_unlock(&queue->cccb_fence_ctx.job_lock);
+
+	return dma_fence_get(job->cccb_fence);
+}
+
+/**
+ * pvr_queue_get_job_kccb_fence() - Get the KCCB fence attached to a job.
+ * @queue: The queue this job will be submitted to.
+ * @job: The job to get the KCCB fence on.
+ *
+ * The KCCB fence is a synchronization primitive allowing us to delay job
+ * submission until there's enough space in the KCCB to submit the job.
+ *
+ * Return:
+ *  * NULL if there's enough space in the KCCB to submit this job, or
+ *  * A valid dma_fence object otherwise.
+ */
+static struct dma_fence *
+pvr_queue_get_job_kccb_fence(struct pvr_queue *queue, struct pvr_job *job)
+{
+	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
+	struct dma_fence *kccb_fence = NULL;
+
+	/* If the fence is NULL, that means we already checked that we had
+	 * enough space in the KCCB for our job.
+	 */
+	if (!job->kccb_fence)
+		return NULL;
+
+	if (!WARN_ON(job->kccb_fence->ops)) {
+		kccb_fence = pvr_kccb_reserve_slot(pvr_dev, job->kccb_fence);
+		job->kccb_fence = NULL;
+	}
+
+	return kccb_fence;
+}
+
+static struct dma_fence *
+pvr_queue_get_paired_frag_job_dep(struct pvr_queue *queue, struct pvr_job *job)
+{
+	struct pvr_job *frag_job = job->type == DRM_PVR_JOB_TYPE_GEOMETRY ?
+				   job->paired_job : NULL;
+	struct dma_fence *f;
+	unsigned long index;
+
+	if (!frag_job)
+		return NULL;
+
+	xa_for_each(&frag_job->base.dependencies, index, f) {
+		/* Skip already signaled fences. */
+		if (dma_fence_is_signaled(f))
+			continue;
+
+		/* Skip our own fence. */
+		if (f == &job->base.s_fence->scheduled)
+			continue;
+
+		return dma_fence_get(f);
+	}
+
+	return frag_job->base.sched->ops->prepare_job(&frag_job->base, &queue->entity);
+}
+
+/**
+ * pvr_queue_prepare_job() - Return the next internal dependencies expressed as a dma_fence.
+ * @sched_job: The job to query the next internal dependency on
+ * @s_entity: The entity this job is queue on.
+ *
+ * After iterating over drm_sched_job::dependencies, drm_sched let the driver return
+ * its own internal dependencies. We use this function to return our internal dependencies.
+ */
+static struct dma_fence *
+pvr_queue_prepare_job(struct drm_sched_job *sched_job,
+		      struct drm_sched_entity *s_entity)
+{
+	struct pvr_job *job = container_of(sched_job, struct pvr_job, base);
+	struct pvr_queue *queue = container_of(s_entity, struct pvr_queue, entity);
+	struct dma_fence *internal_dep = NULL;
+
+	/* CCCB fence is used to make sure we have enough space in the CCCB to
+	 * submit our commands.
+	 */
+	internal_dep = pvr_queue_get_job_cccb_fence(queue, job);
+
+	/* KCCB fence is used to make sure we have a KCCB slot to queue our
+	 * CMD_KICK.
+	 */
+	if (!internal_dep)
+		internal_dep = pvr_queue_get_job_kccb_fence(queue, job);
+
+	/* Any extra internal dependency should be added here, using the following
+	 * the following pattern:
+	 *
+	 *	if (!internal_dep)
+	 *		internal_dep = pvr_queue_get_job_xxxx_fence(queue, job);
+	 */
+
+	/* The paired job fence should come last, when everything else is ready. */
+	if (!internal_dep)
+		internal_dep = pvr_queue_get_paired_frag_job_dep(queue, job);
+
+	return internal_dep;
+}
+
+/**
+ * pvr_queue_update_active_state_locked() - Update the queue active state.
+ * @queue: Queue to update the state on.
+ *
+ * Locked version of pvr_queue_update_active_state(). Must be called with
+ * pvr_device::queue::lock held.
+ */
+static void pvr_queue_update_active_state_locked(struct pvr_queue *queue)
+{
+	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
+
+	lockdep_assert_held(&pvr_dev->queues.lock);
+
+	/* The queue is temporary out of any list when it's being reset,
+	 * we don't want a call to pvr_queue_update_active_state_locked()
+	 * to re-insert it behind our back.
+	 */
+	if (list_empty(&queue->node))
+		return;
+
+	if (!atomic_read(&queue->in_flight_job_count))
+		list_move_tail(&queue->node, &pvr_dev->queues.idle);
+	else
+		list_move_tail(&queue->node, &pvr_dev->queues.active);
+}
+
+/**
+ * pvr_queue_update_active_state() - Update the queue active state.
+ * @queue: Queue to update the state on.
+ *
+ * Active state is based on the in_flight_job_count value.
+ *
+ * Updating the active state implies moving the queue in or out of the
+ * active queue list, which also defines whether the queue is checked
+ * or not when a FW event is received.
+ *
+ * This function should be called any time a job is submitted or it done
+ * fence is signaled.
+ */
+static void pvr_queue_update_active_state(struct pvr_queue *queue)
+{
+	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
+
+	mutex_lock(&pvr_dev->queues.lock);
+	pvr_queue_update_active_state_locked(queue);
+	mutex_unlock(&pvr_dev->queues.lock);
+}
+
+static void pvr_queue_submit_job_to_cccb(struct pvr_job *job)
+{
+	struct pvr_queue *queue = container_of(job->base.sched, struct pvr_queue, scheduler);
+	struct rogue_fwif_ufo ufos[ROGUE_FWIF_CCB_CMD_MAX_UFOS];
+	struct pvr_cccb *cccb = &queue->cccb;
+	struct pvr_queue_fence *jfence;
+	struct dma_fence *fence;
+	unsigned long index;
+	u32 ufo_count = 0;
+
+	/* Initialize the done_fence, so we can signal it. */
+	pvr_queue_job_fence_init(job->done_fence, queue);
+
+	/* We need to add the queue to the active list before updating the CCCB,
+	 * otherwise we might miss the FW event informing us that something
+	 * happened on this queue.
+	 */
+	atomic_inc(&queue->in_flight_job_count);
+	pvr_queue_update_active_state(queue);
+
+	xa_for_each(&job->base.dependencies, index, fence) {
+		jfence = to_pvr_queue_job_fence(fence);
+		if (!jfence)
+			continue;
+
+		/* Skip the partial render fence, we will place it at the end. */
+		if (job->type == DRM_PVR_JOB_TYPE_FRAGMENT && job->paired_job &&
+		    &job->paired_job->base.s_fence->scheduled == fence)
+			continue;
+
+		if (dma_fence_is_signaled(&jfence->base))
+			continue;
+
+		pvr_fw_object_get_fw_addr(jfence->queue->timeline_ufo.fw_obj,
+					  &ufos[ufo_count].addr);
+		ufos[ufo_count++].value = jfence->base.seqno;
+
+		if (ufo_count == ARRAY_SIZE(ufos)) {
+			pvr_cccb_write_command_with_header(cccb, ROGUE_FWIF_CCB_CMD_TYPE_FENCE_PR,
+							   sizeof(ufos), ufos, 0, 0);
+			ufo_count = 0;
+		}
+	}
+
+	/* Partial render fence goes last. */
+	if (job->type == DRM_PVR_JOB_TYPE_FRAGMENT && job->paired_job) {
+		jfence = to_pvr_queue_job_fence(job->paired_job->done_fence);
+		if (!WARN_ON(!jfence)) {
+			pvr_fw_object_get_fw_addr(jfence->queue->timeline_ufo.fw_obj,
+						  &ufos[ufo_count].addr);
+			ufos[ufo_count++].value = job->paired_job->done_fence->seqno;
+		}
+	}
+
+	if (ufo_count) {
+		pvr_cccb_write_command_with_header(cccb, ROGUE_FWIF_CCB_CMD_TYPE_FENCE_PR,
+						   sizeof(ufos[0]) * ufo_count, ufos, 0, 0);
+	}
+
+	if (job->type == DRM_PVR_JOB_TYPE_GEOMETRY && job->paired_job) {
+		struct rogue_fwif_cmd_geom *cmd = job->cmd;
+
+		/* Reference value for the partial render test is the current queue fence
+		 * seqno minus one.
+		 */
+		pvr_fw_object_get_fw_addr(queue->timeline_ufo.fw_obj,
+					  &cmd->partial_render_geom_frag_fence.addr);
+		cmd->partial_render_geom_frag_fence.value = job->done_fence->seqno - 1;
+	}
+
+	/* Submit job to FW */
+	pvr_cccb_write_command_with_header(cccb, job->fw_ccb_cmd_type, job->cmd_len, job->cmd,
+					   job->id, job->id);
+
+	/* Signal the job fence. */
+	pvr_fw_object_get_fw_addr(queue->timeline_ufo.fw_obj, &ufos[0].addr);
+	ufos[0].value = job->done_fence->seqno;
+	pvr_cccb_write_command_with_header(cccb, ROGUE_FWIF_CCB_CMD_TYPE_UPDATE,
+					   sizeof(ufos[0]), ufos, 0, 0);
+
+	/* The job we submit is added to the drm_gpu_scheduler::pending_list in
+	 * drm_sched_job_begin() which is called after ::run_job() returns. But the
+	 * GPU might be done executing the job before drm_sched_main() had a chance
+	 * to queue it to the pending_list, resulting in a lost event. Work around
+	 * this race by keeping track of the last submitted job so we can check it in
+	 * pvr_queue_signal_done_fences() if this job is not part of the pending_list
+	 * already.
+	 * No need to keep a reference to the job object here, because we only use
+	 * check the pointer value.
+	 */
+	spin_lock(&queue->scheduler.job_list_lock);
+	queue->last_submitted_job = job;
+	spin_unlock(&queue->scheduler.job_list_lock);
+}
+
+/**
+ * pvr_queue_run_job() - Submit a job to the FW.
+ * @sched_job: The job to submit.
+ *
+ * This function is called when all non-native dependencies have been met and
+ * when the commands resulting from this job are guaranteed to fit in the CCCB.
+ */
+static struct dma_fence *pvr_queue_run_job(struct drm_sched_job *sched_job)
+{
+	struct pvr_job *job = container_of(sched_job, struct pvr_job, base);
+	struct pvr_device *pvr_dev = job->pvr_dev;
+	int err;
+
+	/* The fragment job is issued along the geometry job when we use combined
+	 * geom+frag kicks. When we get there, we should simply return the
+	 * done_fence that's been initialized earlier.
+	 */
+	if (job->type == DRM_PVR_JOB_TYPE_FRAGMENT && job->done_fence->ops)
+		return dma_fence_get(job->done_fence);
+
+	/* The only kind of jobs that can be paired are geometry and fragment, and
+	 * we bail out early if we see a fragment job that's paired with a geomtry
+	 * job.
+	 * Paired jobs must also target the same context and point to the same
+	 * HWRT.
+	 */
+	if (WARN_ON(job->paired_job &&
+		    (job->type != DRM_PVR_JOB_TYPE_GEOMETRY ||
+		     job->paired_job->type != DRM_PVR_JOB_TYPE_FRAGMENT ||
+		     job->hwrt != job->paired_job->hwrt ||
+		     job->ctx != job->paired_job->ctx)))
+		return ERR_PTR(-EINVAL);
+
+	err = pvr_job_get_pm_ref(job);
+	if (WARN_ON(err))
+		return ERR_PTR(err);
+
+	if (job->paired_job) {
+		err = pvr_job_get_pm_ref(job->paired_job);
+		if (WARN_ON(err))
+			return ERR_PTR(err);
+	}
+
+	/* Submit our job to the CCCB */
+	pvr_queue_submit_job_to_cccb(job);
+
+	if (job->paired_job) {
+		struct pvr_job *geom_job = job;
+		struct pvr_job *frag_job = job->paired_job;
+		struct pvr_queue *geom_queue = job->ctx->queues.geometry;
+		struct pvr_queue *frag_queue = job->ctx->queues.fragment;
+
+		/* Submit the fragment job along the geometry job and send a combined kick. */
+		pvr_queue_submit_job_to_cccb(frag_job);
+		pvr_cccb_send_kccb_combined_kick(pvr_dev,
+						 &geom_queue->cccb, &frag_queue->cccb,
+						 pvr_context_get_fw_addr(geom_job->ctx) +
+						 geom_queue->ctx_offset,
+						 pvr_context_get_fw_addr(frag_job->ctx) +
+						 frag_queue->ctx_offset,
+						 job->hwrt,
+						 frag_job->fw_ccb_cmd_type ==
+						 ROGUE_FWIF_CCB_CMD_TYPE_FRAG_PR);
+		geom_job->paired_job = NULL;
+		frag_job->paired_job = NULL;
+	} else {
+		struct pvr_queue *queue = container_of(job->base.sched,
+						       struct pvr_queue, scheduler);
+
+		pvr_cccb_send_kccb_kick(pvr_dev, &queue->cccb,
+					pvr_context_get_fw_addr(job->ctx) + queue->ctx_offset,
+					job->hwrt);
+	}
+
+	return dma_fence_get(job->done_fence);
+}
+
+static void pvr_queue_stop(struct pvr_queue *queue, struct pvr_job *bad_job)
+{
+	drm_sched_stop(&queue->scheduler, bad_job ? &bad_job->base : NULL);
+}
+
+static void pvr_queue_start(struct pvr_queue *queue)
+{
+	struct pvr_job *job;
+
+	/* Make sure we CPU-signal the UFO object, so other queues don't get
+	 * blocked waiting on it.
+	 */
+	*queue->timeline_ufo.value = atomic_read(&queue->job_fence_ctx.seqno);
+
+	list_for_each_entry(job, &queue->scheduler.pending_list, base.list) {
+		if (dma_fence_is_signaled(job->done_fence)) {
+			/* Jobs might have completed after drm_sched_stop() was called.
+			 * In that case, re-assign the parent field to the done_fence.
+			 */
+			WARN_ON(job->base.s_fence->parent);
+			job->base.s_fence->parent = dma_fence_get(job->done_fence);
+		} else {
+			/* If we had unfinished jobs, flag the entity as guilty so no
+			 * new job can be submitted.
+			 */
+			atomic_set(&queue->ctx->faulty, 1);
+
+			if (job == queue->last_submitted_job) {
+				queue->last_submitted_job = NULL;
+				dma_fence_signal(job->done_fence);
+				pvr_job_release_pm_ref(job);
+				atomic_dec(&queue->in_flight_job_count);
+			}
+		}
+	}
+
+	drm_sched_start(&queue->scheduler, true);
+}
+
+/**
+ * pvr_queue_timedout_job() - Handle a job timeout event.
+ * @s_job: The job this timeout occurred on.
+ *
+ * FIXME: We don't do anything here to unblock the situation, we just stop+start
+ * the scheduler, and re-assign parent fences in the middle.
+ *
+ * Return:
+ *  * DRM_GPU_SCHED_STAT_NOMINAL.
+ */
+static enum drm_gpu_sched_stat
+pvr_queue_timedout_job(struct drm_sched_job *s_job)
+{
+	struct drm_gpu_scheduler *sched = s_job->sched;
+	struct pvr_queue *queue = container_of(sched, struct pvr_queue, scheduler);
+	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
+	struct pvr_job *job;
+	u32 job_count = 0;
+
+	dev_err(sched->dev, "Job timeout\n");
+
+	/* Before we stop the scheduler, make sure the queue is out of any list, so
+	 * any call to pvr_queue_update_active_state_locked() that might happen
+	 * until the scheduler is really stopped doesn't end up re-inserting the
+	 * queue in the active list. This would cause
+	 * pvr_queue_signal_done_fences() and drm_sched_stop() to race with each
+	 * other when accessing the pending_list, since drm_sched_stop() doesn't
+	 * grab the job_list_lock when modifying the list (it's assuming the
+	 * only other accessor is the scheduler, and it's safe to not grab the
+	 * lock since it's stopped).
+	 */
+	mutex_lock(&pvr_dev->queues.lock);
+	list_del_init(&queue->node);
+	mutex_unlock(&pvr_dev->queues.lock);
+
+	drm_sched_stop(sched, s_job);
+
+	/* Reset the last_submitted_job field now, just in case. No need to grab
+	 * the job_list_lock here, all the path accessing this field are guaranteed
+	 * to be turned off at that point.
+	 */
+	queue->last_submitted_job = NULL;
+
+	/* Re-assign job parent fences. */
+	list_for_each_entry(job, &sched->pending_list, base.list) {
+		job->base.s_fence->parent = dma_fence_get(job->done_fence);
+		job_count++;
+	}
+	WARN_ON(atomic_read(&queue->in_flight_job_count) != job_count);
+
+	/* Re-insert the queue in the proper list, and kick a queue processing
+	 * operation if there were jobs pending.
+	 */
+	mutex_lock(&pvr_dev->queues.lock);
+	if (!atomic_read(&queue->in_flight_job_count)) {
+		list_move_tail(&queue->node, &pvr_dev->queues.idle);
+	} else {
+		list_move_tail(&queue->node, &pvr_dev->queues.active);
+		pvr_queue_process(queue);
+	}
+	mutex_unlock(&pvr_dev->queues.lock);
+
+	drm_sched_start(sched, true);
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+/**
+ * pvr_queue_free_job() - Release the reference the scheduler had on a job object.
+ * @sched_job: Job object to free.
+ */
+static void pvr_queue_free_job(struct drm_sched_job *sched_job)
+{
+	struct pvr_job *job = container_of(sched_job, struct pvr_job, base);
+
+	drm_sched_job_cleanup(sched_job);
+	job->paired_job = NULL;
+	pvr_job_put(job);
+}
+
+static const struct drm_sched_backend_ops pvr_queue_sched_ops = {
+	.prepare_job = pvr_queue_prepare_job,
+	.run_job = pvr_queue_run_job,
+	.timedout_job = pvr_queue_timedout_job,
+	.free_job = pvr_queue_free_job,
+};
+
+/**
+ * pvr_queue_fence_is_ufo_backed() - Check if a dma_fence is backed by a UFO object
+ * @f: Fence to test.
+ *
+ * A UFO-backed fence is a fence that can be signaled or waited upon FW-side.
+ * pvr_job::done_fence objects are backed by the timeline UFO attached to the queue
+ * they are pushed to, but those fences are not directly exposed to the outside
+ * world, so we also need to check if the fence we're being passed is a
+ * drm_sched_fence that was coming from our driver.
+ */
+bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f)
+{
+	struct drm_sched_fence *sched_fence = f ? to_drm_sched_fence(f) : NULL;
+
+	if (sched_fence &&
+	    sched_fence->sched->ops == &pvr_queue_sched_ops)
+		return true;
+
+	if (f && f->ops == &pvr_queue_job_fence_ops)
+		return true;
+
+	return false;
+}
+
+/**
+ * pvr_queue_signal_done_fences() - Signal done fences.
+ * @queue: Queue to check.
+ *
+ * Signal done fences of jobs whose seqno is less than the current value of
+ * the UFO object attached to the queue.
+ */
+static void
+pvr_queue_signal_done_fences(struct pvr_queue *queue)
+{
+	struct pvr_job *job, *tmp_job;
+	u32 cur_seqno;
+
+	spin_lock(&queue->scheduler.job_list_lock);
+	cur_seqno = *queue->timeline_ufo.value;
+	list_for_each_entry_safe(job, tmp_job, &queue->scheduler.pending_list, base.list) {
+		if ((int)(cur_seqno - lower_32_bits(job->done_fence->seqno)) < 0)
+			break;
+
+		if (!dma_fence_is_signaled(job->done_fence)) {
+			dma_fence_signal(job->done_fence);
+			pvr_job_release_pm_ref(job);
+			atomic_dec(&queue->in_flight_job_count);
+		}
+	}
+
+	/* We don't want to test jobs twice, so reset last_submitted_job
+	 * if the job is already part of the pending_list.
+	 */
+	job = list_last_entry(&queue->scheduler.pending_list, struct pvr_job, base.list);
+	if (job == queue->last_submitted_job)
+		queue->last_submitted_job = NULL;
+
+	if (queue->last_submitted_job &&
+	    (int)(cur_seqno - lower_32_bits(queue->last_submitted_job->done_fence->seqno)) >= 0) {
+		dma_fence_signal(queue->last_submitted_job->done_fence);
+		pvr_job_release_pm_ref(queue->last_submitted_job);
+		atomic_dec(&queue->in_flight_job_count);
+
+		/* We signaled the job, so no need to check it again next time. Most importantly,
+		 * it's addressing a race where we signal the job before and drm_sched cleans it
+		 * up before pvr_queue_signal_done_fences() is called again, meaning the job
+		 * will never show up in the pending_list, and we might be pointing to an already
+		 * freed job next time pvr_queue_signal_done_fences() is called.
+		 */
+		queue->last_submitted_job = NULL;
+	}
+	spin_unlock(&queue->scheduler.job_list_lock);
+}
+
+/**
+ * pvr_queue_check_job_waiting_for_cccb_space() - Check if the job waiting for CCCB space
+ * can be unblocked
+ * pushed to the CCCB
+ * @queue: Queue to check
+ *
+ * If we have a job waiting for CCCB, and this job now fits in the CCCB, we signal
+ * its CCCB fence, which should kick drm_sched.
+ */
+static void
+pvr_queue_check_job_waiting_for_cccb_space(struct pvr_queue *queue)
+{
+	struct pvr_queue_fence *cccb_fence;
+	u32 native_deps_remaining;
+	struct pvr_job *job;
+
+	mutex_lock(&queue->cccb_fence_ctx.job_lock);
+	job = queue->cccb_fence_ctx.job;
+	if (!job)
+		goto out_unlock;
+
+	/* If we have a job attached to the CCCB fence context, its CCCB fence
+	 * shouldn't be NULL.
+	 */
+	if (WARN_ON(!job->cccb_fence)) {
+		job = NULL;
+		goto out_unlock;
+	}
+
+	/* If we get there, CCCB fence has to be initialized. */
+	cccb_fence = container_of(job->cccb_fence, struct pvr_queue_fence, base);
+	if (WARN_ON(!cccb_fence->queue)) {
+		job = NULL;
+		goto out_unlock;
+	}
+
+	/* Evict signaled dependencies before checking for CCCB space.
+	 * If the job fits, signal the CCCB fence, this should unblock
+	 * the drm_sched_entity.
+	 */
+	native_deps_remaining = job_count_remaining_native_deps(job);
+	if (!pvr_cccb_cmdseq_fits(&queue->cccb, job_cmds_size(job, native_deps_remaining))) {
+		job = NULL;
+		goto out_unlock;
+	}
+
+	dma_fence_signal(job->cccb_fence);
+	pvr_queue_fence_put(job->cccb_fence);
+	job->cccb_fence = NULL;
+	queue->cccb_fence_ctx.job = NULL;
+
+out_unlock:
+	mutex_unlock(&queue->cccb_fence_ctx.job_lock);
+
+	pvr_job_put(job);
+}
+
+/**
+ * pvr_queue_process() - Process events that happened on a queue.
+ * @queue: Queue to check
+ *
+ * Signal job fences and check if jobs waiting for CCCB space can be unblocked.
+ */
+void pvr_queue_process(struct pvr_queue *queue)
+{
+	lockdep_assert_held(&queue->ctx->pvr_dev->queues.lock);
+
+	pvr_queue_check_job_waiting_for_cccb_space(queue);
+	pvr_queue_signal_done_fences(queue);
+	pvr_queue_update_active_state_locked(queue);
+}
+
+static u32 get_dm_type(struct pvr_queue *queue)
+{
+	switch (queue->type) {
+	case DRM_PVR_JOB_TYPE_GEOMETRY:
+		return PVR_FWIF_DM_GEOM;
+	case DRM_PVR_JOB_TYPE_TRANSFER_FRAG:
+	case DRM_PVR_JOB_TYPE_FRAGMENT:
+		return PVR_FWIF_DM_FRAG;
+	case DRM_PVR_JOB_TYPE_COMPUTE:
+		return PVR_FWIF_DM_CDM;
+	}
+
+	return ~0;
+}
+
+/**
+ * init_fw_context() - Initializes the queue part of a FW context.
+ * @queue: Queue object to initialize the FW context for.
+ * @fw_ctx_map: The FW context CPU mapping.
+ *
+ * FW contexts are containing various states, one of them being a per-queue state
+ * that needs to be initialized for each queue being exposed by a context. This
+ * function takes care of that.
+ */
+static void init_fw_context(struct pvr_queue *queue, void *fw_ctx_map)
+{
+	struct pvr_context *ctx = queue->ctx;
+	struct pvr_fw_object *fw_mem_ctx_obj = pvr_vm_get_fw_mem_context(ctx->vm_ctx);
+	struct rogue_fwif_fwcommoncontext *cctx_fw;
+	struct pvr_cccb *cccb = &queue->cccb;
+
+	cctx_fw = fw_ctx_map + queue->ctx_offset;
+	cctx_fw->ccbctl_fw_addr = cccb->ctrl_fw_addr;
+	cctx_fw->ccb_fw_addr = cccb->cccb_fw_addr;
+
+	cctx_fw->dm = get_dm_type(queue);
+	cctx_fw->priority = ctx->priority;
+	cctx_fw->priority_seq_num = 0;
+	cctx_fw->max_deadline_ms = MAX_DEADLINE_MS;
+	cctx_fw->pid = task_tgid_nr(current);
+	cctx_fw->server_common_context_id = ctx->ctx_id;
+
+	pvr_fw_object_get_fw_addr(fw_mem_ctx_obj, &cctx_fw->fw_mem_context_fw_addr);
+
+	pvr_fw_object_get_fw_addr(queue->reg_state_obj, &cctx_fw->context_state_addr);
+}
+
+/**
+ * pvr_queue_cleanup_fw_context() - Wait for the FW context to be idle and clean it up.
+ * @queue: Queue on FW context to clean up.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by pvr_fw_structure_cleanup() otherwise.
+ */
+static int pvr_queue_cleanup_fw_context(struct pvr_queue *queue)
+{
+	return pvr_fw_structure_cleanup(queue->ctx->pvr_dev,
+					ROGUE_FWIF_CLEANUP_FWCOMMONCONTEXT,
+					queue->ctx->fw_obj, queue->ctx_offset);
+}
+
+/**
+ * pvr_queue_job_init() - Initialize queue related fields in a pvr_job object.
+ * @job: The job to initialize.
+ *
+ * Bind the job to a queue and allocate memory to guarantee pvr_queue_job_arm()
+ * and pvr_queue_job_push() can't fail. We also make sure the context type is
+ * valid and the job can fit in the CCCB.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * An error code if something failed.
+ */
+int pvr_queue_job_init(struct pvr_job *job)
+{
+	/* Fragment jobs need at least one native fence wait on the geometry job fence. */
+	u32 min_native_dep_count = job->type == DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
+	struct pvr_queue *queue;
+	int err;
+
+	if (atomic_read(&job->ctx->faulty))
+		return -EIO;
+
+	queue = pvr_context_get_queue_for_job(job->ctx, job->type);
+	if (!queue)
+		return -EINVAL;
+
+	if (!pvr_cccb_cmdseq_can_fit(&queue->cccb, job_cmds_size(job, min_native_dep_count)))
+		return -E2BIG;
+
+	err = drm_sched_job_init(&job->base, &queue->entity, THIS_MODULE);
+	if (err)
+		return err;
+
+	job->cccb_fence = pvr_queue_fence_alloc();
+	job->kccb_fence = pvr_kccb_fence_alloc();
+	job->done_fence = pvr_queue_fence_alloc();
+	if (!job->cccb_fence || !job->done_fence)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * pvr_queue_job_arm() - Arm a job object.
+ * @job: The job to arm.
+ *
+ * Initializes fences and return the drm_sched finished fence so it can
+ * be exposed to the outside world. Once this function is called, you should
+ * make sure the job is pushed using pvr_queue_job_push(), or guarantee that
+ * no one grabbed a reference to the returned fence. The latter can happen if
+ * we do multi-job submission, and something failed when creating/initializing
+ * a job. In that case, we know the fence didn't leave the driver, and we
+ * can thus guarantee nobody will wait on an dead fence object.
+ *
+ * Return:
+ *  * A dma_fence object.
+ */
+struct dma_fence *pvr_queue_job_arm(struct pvr_job *job)
+{
+	drm_sched_job_arm(&job->base);
+
+	return &job->base.s_fence->finished;
+}
+
+/**
+ * pvr_queue_job_cleanup() - Cleanup fence/scheduler related fields in the job object.
+ * @job: The job to cleanup.
+ *
+ * Should be called in the job release path.
+ */
+void pvr_queue_job_cleanup(struct pvr_job *job)
+{
+	pvr_queue_fence_put(job->done_fence);
+	pvr_queue_fence_put(job->cccb_fence);
+	pvr_kccb_fence_put(job->kccb_fence);
+
+	if (job->base.s_fence)
+		drm_sched_job_cleanup(&job->base);
+}
+
+/**
+ * pvr_queue_job_push() - Push a job to its queue.
+ * @job: The job to push.
+ *
+ * Must be called after pvr_queue_job_init() and after all dependencies
+ * have been added to the job. This will effectively queue the job to
+ * the drm_sched_entity attached to the queue. We grab a reference on
+ * the job object, so the caller is free to drop its reference when it's
+ * done accessing the job object.
+ */
+void pvr_queue_job_push(struct pvr_job *job)
+{
+	struct pvr_queue *queue = container_of(job->base.sched, struct pvr_queue, scheduler);
+
+	/* Keep track of the last queued job scheduled fence for combined submit. */
+	dma_fence_put(queue->last_queued_job_scheduled_fence);
+	queue->last_queued_job_scheduled_fence = dma_fence_get(&job->base.s_fence->scheduled);
+
+	pvr_job_get(job);
+	drm_sched_entity_push_job(&job->base);
+}
+
+static void reg_state_init(void *cpu_ptr, void *priv)
+{
+	struct pvr_queue *queue = priv;
+
+	if (queue->type == DRM_PVR_JOB_TYPE_GEOMETRY) {
+		struct rogue_fwif_geom_ctx_state *geom_ctx_state_fw = cpu_ptr;
+
+		geom_ctx_state_fw->geom_core[0].geom_reg_vdm_call_stack_pointer_init =
+			queue->callstack_addr;
+	}
+}
+
+/**
+ * pvr_queue_create() - Create a queue object.
+ * @ctx: The context this queue will be attached to.
+ * @type: The type of jobs being pushed to this queue.
+ * @args: The arguments passed to the context creation function.
+ * @fw_ctx_map: CPU mapping of the FW context object.
+ *
+ * Create a queue object that will be used to queue and track jobs.
+ *
+ * Return:
+ *  * A valid pointer to a pvr_queue object, or
+ *  * An error pointer if the creation/initialization failed.
+ */
+struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
+				   enum drm_pvr_job_type type,
+				   struct drm_pvr_ioctl_create_context_args *args,
+				   void *fw_ctx_map)
+{
+	static const struct {
+		u32 cccb_size;
+		const char *name;
+	} props[] = {
+		[DRM_PVR_JOB_TYPE_GEOMETRY] = {
+			.cccb_size = CTX_GEOM_CCCB_SIZE_LOG2,
+			.name = "geometry",
+		},
+		[DRM_PVR_JOB_TYPE_FRAGMENT] = {
+			.cccb_size = CTX_FRAG_CCCB_SIZE_LOG2,
+			.name = "fragment"
+		},
+		[DRM_PVR_JOB_TYPE_COMPUTE] = {
+			.cccb_size = CTX_COMPUTE_CCCB_SIZE_LOG2,
+			.name = "compute"
+		},
+		[DRM_PVR_JOB_TYPE_TRANSFER_FRAG] = {
+			.cccb_size = CTX_TRANSFER_CCCB_SIZE_LOG2,
+			.name = "transfer_frag"
+		},
+	};
+	struct pvr_device *pvr_dev = ctx->pvr_dev;
+	struct drm_gpu_scheduler *sched;
+	struct pvr_queue *queue;
+	int ctx_state_size, err;
+	void *cpu_map;
+
+	if (WARN_ON(type >= sizeof(props)))
+		return ERR_PTR(-EINVAL);
+
+	switch (ctx->type) {
+	case DRM_PVR_CTX_TYPE_RENDER:
+		if (type != DRM_PVR_JOB_TYPE_GEOMETRY &&
+		    type != DRM_PVR_JOB_TYPE_FRAGMENT)
+			return ERR_PTR(-EINVAL);
+		break;
+	case DRM_PVR_CTX_TYPE_COMPUTE:
+		if (type != DRM_PVR_JOB_TYPE_COMPUTE)
+			return ERR_PTR(-EINVAL);
+		break;
+	case DRM_PVR_CTX_TYPE_TRANSFER_FRAG:
+		if (type != DRM_PVR_JOB_TYPE_TRANSFER_FRAG)
+			return ERR_PTR(-EINVAL);
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	ctx_state_size = get_ctx_state_size(pvr_dev, type);
+	if (ctx_state_size < 0)
+		return ERR_PTR(ctx_state_size);
+
+	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	if (!queue)
+		return ERR_PTR(-ENOMEM);
+
+	queue->type = type;
+	queue->ctx_offset = get_ctx_offset(type);
+	queue->ctx = ctx;
+	queue->callstack_addr = args->callstack_addr;
+	sched = &queue->scheduler;
+	INIT_LIST_HEAD(&queue->node);
+	mutex_init(&queue->cccb_fence_ctx.job_lock);
+	pvr_queue_fence_ctx_init(&queue->cccb_fence_ctx.base);
+	pvr_queue_fence_ctx_init(&queue->job_fence_ctx);
+
+	err = pvr_cccb_init(pvr_dev, &queue->cccb, props[type].cccb_size, props[type].name);
+	if (err)
+		goto err_free_queue;
+
+	err = pvr_fw_object_create(pvr_dev, ctx_state_size,
+				   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+				   reg_state_init, queue, &queue->reg_state_obj);
+	if (err)
+		goto err_cccb_fini;
+
+	init_fw_context(queue, fw_ctx_map);
+
+	if (type != DRM_PVR_JOB_TYPE_GEOMETRY && type != DRM_PVR_JOB_TYPE_FRAGMENT &&
+	    args->callstack_addr) {
+		err = -EINVAL;
+		goto err_release_reg_state;
+	}
+
+	cpu_map = pvr_fw_object_create_and_map(pvr_dev, sizeof(*queue->timeline_ufo.value),
+					       PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+					       NULL, NULL, &queue->timeline_ufo.fw_obj);
+	if (IS_ERR(cpu_map)) {
+		err = PTR_ERR(cpu_map);
+		goto err_release_reg_state;
+	}
+
+	queue->timeline_ufo.value = cpu_map;
+
+	err = drm_sched_init(&queue->scheduler,
+			     &pvr_queue_sched_ops,
+			     pvr_dev->sched_wq, 64 * 1024, 1,
+			     msecs_to_jiffies(500),
+			     pvr_dev->sched_wq, NULL, "pvr-queue",
+			     DRM_SCHED_POLICY_SINGLE_ENTITY,
+			     pvr_dev->base.dev);
+	if (err)
+		goto err_release_ufo;
+
+	err = drm_sched_entity_init(&queue->entity,
+				    DRM_SCHED_PRIORITY_MIN,
+				    &sched, 1, &ctx->faulty);
+	if (err)
+		goto err_sched_fini;
+
+	mutex_lock(&pvr_dev->queues.lock);
+	list_add_tail(&queue->node, &pvr_dev->queues.idle);
+	mutex_unlock(&pvr_dev->queues.lock);
+
+	return queue;
+
+err_sched_fini:
+	drm_sched_fini(&queue->scheduler);
+
+err_release_ufo:
+	pvr_fw_object_unmap_and_destroy(queue->timeline_ufo.fw_obj);
+
+err_release_reg_state:
+	pvr_fw_object_destroy(queue->reg_state_obj);
+
+err_cccb_fini:
+	pvr_cccb_fini(&queue->cccb);
+
+err_free_queue:
+	mutex_destroy(&queue->cccb_fence_ctx.job_lock);
+	kfree(queue);
+
+	return ERR_PTR(err);
+}
+
+void pvr_queue_device_pre_reset(struct pvr_device *pvr_dev)
+{
+	struct pvr_queue *queue;
+
+	mutex_lock(&pvr_dev->queues.lock);
+	list_for_each_entry(queue, &pvr_dev->queues.idle, node)
+		pvr_queue_stop(queue, NULL);
+	list_for_each_entry(queue, &pvr_dev->queues.active, node)
+		pvr_queue_stop(queue, NULL);
+	mutex_unlock(&pvr_dev->queues.lock);
+}
+
+void pvr_queue_device_post_reset(struct pvr_device *pvr_dev)
+{
+	struct pvr_queue *queue;
+
+	mutex_lock(&pvr_dev->queues.lock);
+	list_for_each_entry(queue, &pvr_dev->queues.active, node)
+		pvr_queue_start(queue);
+	list_for_each_entry(queue, &pvr_dev->queues.idle, node)
+		pvr_queue_start(queue);
+	mutex_unlock(&pvr_dev->queues.lock);
+}
+
+/**
+ * pvr_queue_kill() - Kill a queue.
+ * @queue: The queue to kill.
+ *
+ * Kill the queue so no new jobs can be pushed. Should be called when the
+ * context handle is destroyed. The queue object might last longer if jobs
+ * are still in flight and holding a reference to the context this queue
+ * belongs to.
+ */
+void pvr_queue_kill(struct pvr_queue *queue)
+{
+	drm_sched_entity_destroy(&queue->entity);
+	dma_fence_put(queue->last_queued_job_scheduled_fence);
+	queue->last_queued_job_scheduled_fence = NULL;
+}
+
+/**
+ * pvr_queue_destroy() - Destroy a queue.
+ * @queue: The queue to destroy.
+ *
+ * Cleanup the queue and free the resources attached to it. Should be
+ * called from the context release function.
+ */
+void pvr_queue_destroy(struct pvr_queue *queue)
+{
+	if (!queue)
+		return;
+
+	mutex_lock(&queue->ctx->pvr_dev->queues.lock);
+	list_del_init(&queue->node);
+	mutex_unlock(&queue->ctx->pvr_dev->queues.lock);
+
+	drm_sched_fini(&queue->scheduler);
+	drm_sched_entity_fini(&queue->entity);
+
+	if (WARN_ON(queue->last_queued_job_scheduled_fence))
+		dma_fence_put(queue->last_queued_job_scheduled_fence);
+
+	pvr_queue_cleanup_fw_context(queue);
+
+	pvr_fw_object_unmap_and_destroy(queue->timeline_ufo.fw_obj);
+	pvr_fw_object_destroy(queue->reg_state_obj);
+	pvr_cccb_fini(&queue->cccb);
+	mutex_destroy(&queue->cccb_fence_ctx.job_lock);
+	kfree(queue);
+}
+
+/**
+ * pvr_queue_device_init() - Device-level initialization of queue related fields.
+ * @pvr_dev: The device to initialize.
+ *
+ * Initializes all fields related to queue management in pvr_device.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * An error code on failure.
+ */
+int pvr_queue_device_init(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	INIT_LIST_HEAD(&pvr_dev->queues.active);
+	INIT_LIST_HEAD(&pvr_dev->queues.idle);
+	err = drmm_mutex_init(from_pvr_device(pvr_dev), &pvr_dev->queues.lock);
+	if (err)
+		return err;
+
+	pvr_dev->sched_wq = alloc_workqueue("powervr-sched", WQ_UNBOUND, 0);
+	if (!pvr_dev->sched_wq)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * pvr_queue_device_fini() - Device-level cleanup of queue related fields.
+ * @pvr_dev: The device to cleanup.
+ *
+ * Cleanup/free all queue-related resources attached to a pvr_device object.
+ */
+void pvr_queue_device_fini(struct pvr_device *pvr_dev)
+{
+	destroy_workqueue(pvr_dev->sched_wq);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_queue.h b/drivers/gpu/drm/imagination/pvr_queue.h
new file mode 100644
index 000000000000..01bdeff777bf
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_queue.h
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_QUEUE_H
+#define PVR_QUEUE_H
+
+#include <drm/gpu_scheduler.h>
+
+#include "pvr_cccb.h"
+#include "pvr_device.h"
+
+struct pvr_context;
+struct pvr_queue;
+
+/**
+ * struct pvr_queue_fence_ctx - Queue fence context
+ *
+ * Used to implement dma_fence_ops for pvr_job::{done,cccb}_fence.
+ */
+struct pvr_queue_fence_ctx {
+	/** @id: Fence context ID allocated with dma_fence_context_alloc(). */
+	u64 id;
+
+	/** @seqno: Sequence number incremented each time a fence is created. */
+	atomic_t seqno;
+
+	/** @lock: Lock used to synchronize access to fences allocated by this context. */
+	spinlock_t lock;
+};
+
+/**
+ * struct pvr_queue_cccb_fence_ctx - CCCB fence context
+ *
+ * Context used to manage fences controlling access to the CCCB. No fences are
+ * issued if there's enough space in the CCCB to push job commands.
+ */
+struct pvr_queue_cccb_fence_ctx {
+	/** @base: Base queue fence context. */
+	struct pvr_queue_fence_ctx base;
+
+	/**
+	 * @job: Job waiting for CCCB space.
+	 *
+	 * Thanks to the serializationg done at the drm_sched_entity level,
+	 * there's no more than one job waiting for CCCB at a given time.
+	 *
+	 * This field is NULL if no jobs are currently waiting for CCCB space.
+	 *
+	 * Must be accessed with @job_lock held.
+	 */
+	struct pvr_job *job;
+
+	/** @lock: Lock protecting access to the job object. */
+	struct mutex job_lock;
+};
+
+/**
+ * struct pvr_queue_fence - Queue fence object
+ */
+struct pvr_queue_fence {
+	/** @base: Base dma_fence. */
+	struct dma_fence base;
+
+	/** @queue: Queue that created this fence. */
+	struct pvr_queue *queue;
+};
+
+/**
+ * struct pvr_queue - Job queue
+ *
+ * Used to queue and track execution of pvr_job objects.
+ */
+struct pvr_queue {
+	/** @scheduler: Single entity scheduler use to push jobs to this queue. */
+	struct drm_gpu_scheduler scheduler;
+
+	/** @entity: Scheduling entity backing this queue. */
+	struct drm_sched_entity entity;
+
+	/** @type: Type of jobs queued to this queue. */
+	enum drm_pvr_job_type type;
+
+	/** @ctx: Context object this queue is bound to. */
+	struct pvr_context *ctx;
+
+	/** @node: Used to add the queue to the active/idle queue list. */
+	struct list_head node;
+
+	/**
+	 * @in_flight_job_count: Number of jobs submitted to the CCCB that
+	 * have not been processed yet.
+	 */
+	atomic_t in_flight_job_count;
+
+	/**
+	 * @cccb_fence_ctx: CCCB fence context.
+	 *
+	 * Used to control access to the CCCB is full, such that we don't
+	 * end up trying to push commands to the CCCB if there's not enough
+	 * space to receive all commands needed for a job to complete.
+	 */
+	struct pvr_queue_cccb_fence_ctx cccb_fence_ctx;
+
+	/** @job_fence_ctx: Job fence context object. */
+	struct pvr_queue_fence_ctx job_fence_ctx;
+
+	/** @timeline_ufo: Timeline UFO for the context queue. */
+	struct {
+		/** @fw_obj: FW object representing the UFO value. */
+		struct pvr_fw_object *fw_obj;
+
+		/** @value: CPU mapping of the UFO value. */
+		u32 *value;
+	} timeline_ufo;
+
+	/**
+	 * @last_submitted_job: Last submitted job.
+	 *
+	 * We need to keep that one around because drm_sched_main() only
+	 * queues the job to the drm_gpu_scheduler::pending_list after
+	 * ::run_job() has returned, which is racy with the queue process
+	 * worker that's handling done job signaling.
+	 */
+	struct pvr_job *last_submitted_job;
+
+	/**
+	 * last_queued_job_scheduled_fence: The scheduled fence of the last
+	 * job queued to this queue.
+	 *
+	 * We use it to insert frag -> geom dependencies when issuing combined
+	 * geom+frag jobs, to guarantee that the fragment job that's part of
+	 * the combined operation comes after all fragment jobs that were queued
+	 * before it.
+	 */
+	struct dma_fence *last_queued_job_scheduled_fence;
+
+	/** @cccb: Client Circular Command Buffer. */
+	struct pvr_cccb cccb;
+
+	/** @reg_state_obj: FW object representing the register state of this queue. */
+	struct pvr_fw_object *reg_state_obj;
+
+	/** @ctx_offset: Offset of the queue context in the FW context object. */
+	u32 ctx_offset;
+
+	/** @callstack_addr: Initial call stack address for register state object. */
+	u64 callstack_addr;
+};
+
+bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
+
+int pvr_queue_job_init(struct pvr_job *job);
+
+void pvr_queue_job_cleanup(struct pvr_job *job);
+
+void pvr_queue_job_push(struct pvr_job *job);
+
+struct dma_fence *pvr_queue_job_arm(struct pvr_job *job);
+
+struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
+				   enum drm_pvr_job_type type,
+				   struct drm_pvr_ioctl_create_context_args *args,
+				   void *fw_ctx_map);
+
+void pvr_queue_kill(struct pvr_queue *queue);
+
+void pvr_queue_destroy(struct pvr_queue *queue);
+
+void pvr_queue_process(struct pvr_queue *queue);
+
+void pvr_queue_device_pre_reset(struct pvr_device *pvr_dev);
+
+void pvr_queue_device_post_reset(struct pvr_device *pvr_dev);
+
+int pvr_queue_device_init(struct pvr_device *pvr_dev);
+
+void pvr_queue_device_fini(struct pvr_device *pvr_dev);
+
+#endif /* PVR_QUEUE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_stream_defs.c b/drivers/gpu/drm/imagination/pvr_stream_defs.c
index 3c646e25accf..ca1dc5e66a6f 100644
--- a/drivers/gpu/drm/imagination/pvr_stream_defs.c
+++ b/drivers/gpu/drm/imagination/pvr_stream_defs.c
@@ -43,6 +43,232 @@
  * existing parameters, to preserve order. As parameters are naturally aligned, care must be taken
  * with respect to implicit padding in the stream; padding should be minimised as much as possible.
  */
+static const struct pvr_stream_def rogue_fwif_cmd_geom_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.vdm_ctrl_stream_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.tpu_border_colour_table, 64),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.vdm_draw_indirect0, 64,
+			       PVR_FEATURE_VDM_DRAWINDIRECT),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.vdm_draw_indirect1, 32,
+			       PVR_FEATURE_VDM_DRAWINDIRECT),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.ppp_ctrl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.te_psg, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.vdm_context_resume_task0_size, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.vdm_context_resume_task3_size, 32,
+			       PVR_FEATURE_VDM_OBJECT_LEVEL_LLS),
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.view_idx, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_geom, regs.pds_coeff_free_prog, 32,
+			       PVR_FEATURE_TESSELLATION),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_geom_stream_brn49927[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_geom, regs.tpu, 32),
+};
+
+static const struct pvr_stream_ext_def cmd_geom_ext_streams_0[] = {
+	{
+		.stream = rogue_fwif_cmd_geom_stream_brn49927,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_geom_stream_brn49927),
+		.header_mask = PVR_STREAM_EXTHDR_GEOM0_BRN49927,
+		.quirk = 49927,
+	},
+};
+
+static const struct pvr_stream_ext_header cmd_geom_ext_headers[] = {
+	{
+		.ext_streams = cmd_geom_ext_streams_0,
+		.ext_streams_num = ARRAY_SIZE(cmd_geom_ext_streams_0),
+		.valid_mask = PVR_STREAM_EXTHDR_GEOM0_VALID,
+	},
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_geom_stream = {
+	.type = PVR_STREAM_TYPE_GEOM,
+
+	.main_stream = rogue_fwif_cmd_geom_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_geom_stream),
+
+	.ext_nr_headers = ARRAY_SIZE(cmd_geom_ext_headers),
+	.ext_headers = cmd_geom_ext_headers,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_geom),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_frag_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_scissor_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_dbias_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_oclqry_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_zlsctl, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_zload_store_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_stencil_load_store_base, 64),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.fb_cdc_zls, 64,
+			       PVR_FEATURE_REQUIRES_FB_CDC_ZLS_SETUP),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.pbe_word),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.tpu_border_colour_table, 64),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.pds_bgnd),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.pds_pr_bgnd),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_frag, regs.usc_clear_register),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.usc_pixel_output_ctrl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_bgobjdepth, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_bgobjvals, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_aa, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.isp_xtp_pipe_enable, 32,
+			       PVR_FEATURE_S7_TOP_INFRASTRUCTURE),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_ctl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.event_pixel_pds_info, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.pixel_phantom, 32,
+			       PVR_FEATURE_CLUSTER_GROUPING),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.view_idx, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.event_pixel_pds_data, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.isp_oclqry_stride, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.isp_zls_pixels, 32,
+			       PVR_FEATURE_ZLS_SUBTILE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, regs.rgx_cr_blackpearl_fix, 32,
+			       PVR_FEATURE_ISP_ZLS_D24_S8_PACKING_OGL_MODE),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, zls_stride, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, sls_stride, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_frag, execute_count, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_frag_stream_brn47217[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.isp_oclqry_stride, 32),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_frag_stream_brn49927[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_frag, regs.tpu, 32),
+};
+
+static const struct pvr_stream_ext_def cmd_frag_ext_streams_0[] = {
+	{
+		.stream = rogue_fwif_cmd_frag_stream_brn47217,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_frag_stream_brn47217),
+		.header_mask = PVR_STREAM_EXTHDR_FRAG0_BRN47217,
+		.quirk = 47217,
+	},
+	{
+		.stream = rogue_fwif_cmd_frag_stream_brn49927,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_frag_stream_brn49927),
+		.header_mask = PVR_STREAM_EXTHDR_FRAG0_BRN49927,
+		.quirk = 49927,
+	},
+};
+
+static const struct pvr_stream_ext_header cmd_frag_ext_headers[] = {
+	{
+		.ext_streams = cmd_frag_ext_streams_0,
+		.ext_streams_num = ARRAY_SIZE(cmd_frag_ext_streams_0),
+		.valid_mask = PVR_STREAM_EXTHDR_FRAG0_VALID,
+	},
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_frag_stream = {
+	.type = PVR_STREAM_TYPE_FRAG,
+
+	.main_stream = rogue_fwif_cmd_frag_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_frag_stream),
+
+	.ext_nr_headers = ARRAY_SIZE(cmd_frag_ext_headers),
+	.ext_headers = cmd_frag_ext_headers,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_frag),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_compute_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.tpu_border_colour_table, 64),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_cb_queue, 64,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_cb_base, 64,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_cb, 64,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_NOT_FEATURE(rogue_fwif_cmd_compute, regs.cdm_ctrl_stream_base, 64,
+				   PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.cdm_context_state_base_addr, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.cdm_resume_pds1, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.cdm_item, 32,
+			       PVR_FEATURE_COMPUTE_MORTON_CAPABLE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.compute_cluster, 32,
+			       PVR_FEATURE_CLUSTER_GROUPING),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, regs.tpu_tag_cdm_ctrl, 32,
+			       PVR_FEATURE_TPU_DM_GLOBAL_REGISTERS),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, stream_start_offset, 32,
+			       PVR_FEATURE_CDM_USER_MODE_QUEUE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_compute, execute_count, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_compute_stream_brn49927[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_compute, regs.tpu, 32),
+};
+
+static const struct pvr_stream_ext_def cmd_compute_ext_streams_0[] = {
+	{
+		.stream = rogue_fwif_cmd_compute_stream_brn49927,
+		.stream_len = ARRAY_SIZE(rogue_fwif_cmd_compute_stream_brn49927),
+		.header_mask = PVR_STREAM_EXTHDR_COMPUTE0_BRN49927,
+		.quirk = 49927,
+	},
+};
+
+static const struct pvr_stream_ext_header cmd_compute_ext_headers[] = {
+	{
+		.ext_streams = cmd_compute_ext_streams_0,
+		.ext_streams_num = ARRAY_SIZE(cmd_compute_ext_streams_0),
+		.valid_mask = PVR_STREAM_EXTHDR_COMPUTE0_VALID,
+	},
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_compute_stream = {
+	.type = PVR_STREAM_TYPE_COMPUTE,
+
+	.main_stream = rogue_fwif_cmd_compute_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_compute_stream),
+
+	.ext_nr_headers = ARRAY_SIZE(cmd_compute_ext_headers),
+	.ext_headers = cmd_compute_ext_headers,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_compute),
+};
+
+static const struct pvr_stream_def rogue_fwif_cmd_transfer_stream[] = {
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.pds_bgnd0_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.pds_bgnd1_base, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.pds_bgnd3_sizeinfo, 64),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_mtile_base, 64),
+	PVR_STREAM_DEF_ARRAY(rogue_fwif_cmd_transfer, regs.pbe_wordx_mrty),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_bgobjvals, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_pixel_output_ctrl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register0, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register1, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register2, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.usc_clear_register3, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_mtile_size, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_render_origin, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_ctl, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_aa, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.event_pixel_pds_info, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.event_pixel_pds_code, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.event_pixel_pds_data, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_render, 32),
+	PVR_STREAM_DEF(rogue_fwif_cmd_transfer, regs.isp_rgn, 32),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_transfer, regs.isp_xtp_pipe_enable, 32,
+			       PVR_FEATURE_S7_TOP_INFRASTRUCTURE),
+	PVR_STREAM_DEF_FEATURE(rogue_fwif_cmd_transfer, regs.frag_screen, 32,
+			       PVR_FEATURE_GPU_MULTICORE_SUPPORT),
+};
+
+const struct pvr_stream_cmd_defs pvr_cmd_transfer_stream = {
+	.type = PVR_STREAM_TYPE_TRANSFER,
+
+	.main_stream = rogue_fwif_cmd_transfer_stream,
+	.main_stream_len = ARRAY_SIZE(rogue_fwif_cmd_transfer_stream),
+
+	.ext_nr_headers = 0,
+
+	.dest_size = sizeof(struct rogue_fwif_cmd_transfer),
+};
+
 static const struct pvr_stream_def rogue_fwif_static_render_context_state_stream[] = {
 	PVR_STREAM_DEF(rogue_fwif_geom_registers_caswitch,
 		       geom_reg_vdm_context_state_base_addr, 64),
diff --git a/drivers/gpu/drm/imagination/pvr_sync.c b/drivers/gpu/drm/imagination/pvr_sync.c
new file mode 100644
index 000000000000..e284edb20913
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_sync.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include <uapi/drm/pvr_drm.h>
+
+#include <drm/drm_syncobj.h>
+#include <drm/gpu_scheduler.h>
+#include <linux/xarray.h>
+#include <linux/dma-fence-unwrap.h>
+
+#include "pvr_device.h"
+#include "pvr_queue.h"
+#include "pvr_sync.h"
+
+static int
+pvr_check_sync_op(const struct drm_pvr_sync_op *sync_op)
+{
+	u8 handle_type;
+
+	if (sync_op->flags & ~DRM_PVR_SYNC_OP_FLAGS_MASK)
+		return -EINVAL;
+
+	handle_type = sync_op->flags & DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK;
+	if (handle_type != DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ &&
+	    handle_type != DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ)
+		return -EINVAL;
+
+	if (handle_type == DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ &&
+	    sync_op->value != 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void
+pvr_sync_signal_free(struct pvr_sync_signal *sig_sync)
+{
+	if (!sig_sync)
+		return;
+
+	drm_syncobj_put(sig_sync->syncobj);
+	dma_fence_chain_free(sig_sync->chain);
+	dma_fence_put(sig_sync->fence);
+	kfree(sig_sync);
+}
+
+void
+pvr_sync_signal_array_cleanup(struct xarray *array)
+{
+	struct pvr_sync_signal *sig_sync;
+	unsigned long i;
+
+	xa_for_each(array, i, sig_sync)
+		pvr_sync_signal_free(sig_sync);
+
+	xa_destroy(array);
+}
+
+static struct pvr_sync_signal *
+pvr_sync_signal_array_add(struct xarray *array, struct drm_file *file, u32 handle, u64 point)
+{
+	struct pvr_sync_signal *sig_sync;
+	struct dma_fence *cur_fence;
+	int err;
+	u32 id;
+
+	sig_sync = kzalloc(sizeof(*sig_sync), GFP_KERNEL);
+	if (!sig_sync)
+		return ERR_PTR(-ENOMEM);
+
+	sig_sync->handle = handle;
+	sig_sync->point = point;
+
+	if (point > 0) {
+		sig_sync->chain = dma_fence_chain_alloc();
+		if (!sig_sync->chain) {
+			err = -ENOMEM;
+			goto err_free_sig_sync;
+		}
+	}
+
+	sig_sync->syncobj = drm_syncobj_find(file, handle);
+	if (!sig_sync->syncobj) {
+		err = -EINVAL;
+		goto err_free_sig_sync;
+	}
+
+	/* Retrieve the current fence attached to that point. It's
+	 * perfectly fine to get a NULL fence here, it just means there's
+	 * no fence attached to that point yet.
+	 */
+	if (!drm_syncobj_find_fence(file, handle, point, 0, &cur_fence))
+		sig_sync->fence = cur_fence;
+
+	err = xa_alloc(array, &id, sig_sync, xa_limit_32b, GFP_KERNEL);
+	if (err)
+		goto err_free_sig_sync;
+
+	return sig_sync;
+
+err_free_sig_sync:
+	pvr_sync_signal_free(sig_sync);
+	return ERR_PTR(err);
+}
+
+static struct pvr_sync_signal *
+pvr_sync_signal_array_search(struct xarray *array, u32 handle, u64 point)
+{
+	struct pvr_sync_signal *sig_sync;
+	unsigned long i;
+
+	xa_for_each(array, i, sig_sync) {
+		if (handle == sig_sync->handle && point == sig_sync->point)
+			return sig_sync;
+	}
+
+	return NULL;
+}
+
+static struct pvr_sync_signal *
+pvr_sync_signal_array_get(struct xarray *array, struct drm_file *file, u32 handle, u64 point)
+{
+	struct pvr_sync_signal *sig_sync;
+
+	sig_sync = pvr_sync_signal_array_search(array, handle, point);
+	if (sig_sync)
+		return sig_sync;
+
+	return pvr_sync_signal_array_add(array, file, handle, point);
+}
+
+int
+pvr_sync_signal_array_collect_ops(struct xarray *array,
+				  struct drm_file *file,
+				  u32 sync_op_count,
+				  const struct drm_pvr_sync_op *sync_ops)
+{
+	for (u32 i = 0; i < sync_op_count; i++) {
+		struct pvr_sync_signal *sig_sync;
+		int ret;
+
+		if (!(sync_ops[i].flags & DRM_PVR_SYNC_OP_FLAG_SIGNAL))
+			continue;
+
+		ret = pvr_check_sync_op(&sync_ops[i]);
+		if (ret)
+			return ret;
+
+		sig_sync = pvr_sync_signal_array_get(array, file,
+						     sync_ops[i].handle,
+						     sync_ops[i].value);
+		if (IS_ERR(sig_sync))
+			return PTR_ERR(sig_sync);
+	}
+
+	return 0;
+}
+
+int
+pvr_sync_signal_array_update_fences(struct xarray *array,
+				    u32 sync_op_count,
+				    const struct drm_pvr_sync_op *sync_ops,
+				    struct dma_fence *done_fence)
+{
+	for (u32 i = 0; i < sync_op_count; i++) {
+		struct dma_fence *old_fence;
+		struct pvr_sync_signal *sig_sync;
+
+		if (!(sync_ops[i].flags & DRM_PVR_SYNC_OP_FLAG_SIGNAL))
+			continue;
+
+		sig_sync = pvr_sync_signal_array_search(array, sync_ops[i].handle,
+							sync_ops[i].value);
+		if (WARN_ON(!sig_sync))
+			return -EINVAL;
+
+		old_fence = sig_sync->fence;
+		sig_sync->fence = dma_fence_get(done_fence);
+		dma_fence_put(old_fence);
+
+		if (WARN_ON(!sig_sync->fence))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+void
+pvr_sync_signal_array_push_fences(struct xarray *array)
+{
+	struct pvr_sync_signal *sig_sync;
+	unsigned long i;
+
+	xa_for_each(array, i, sig_sync) {
+		if (sig_sync->chain) {
+			drm_syncobj_add_point(sig_sync->syncobj, sig_sync->chain,
+					      sig_sync->fence, sig_sync->point);
+			sig_sync->chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(sig_sync->syncobj, sig_sync->fence);
+		}
+	}
+}
+
+static int
+pvr_sync_add_dep_to_job(struct drm_sched_job *job, struct dma_fence *f)
+{
+	struct dma_fence_unwrap iter;
+	u32 native_fence_count = 0;
+	struct dma_fence *uf;
+	int err = 0;
+
+	dma_fence_unwrap_for_each(uf, &iter, f) {
+		if (pvr_queue_fence_is_ufo_backed(uf))
+			native_fence_count++;
+	}
+
+	/* No need to unwrap the fence if it's fully non-native. */
+	if (!native_fence_count)
+		return drm_sched_job_add_dependency(job, f);
+
+	dma_fence_unwrap_for_each(uf, &iter, f) {
+		/* There's no dma_fence_unwrap_stop() helper cleaning up the refs
+		 * owned by dma_fence_unwrap(), so let's just iterate over all
+		 * entries without doing anything when something failed.
+		 */
+		if (err)
+			continue;
+
+		if (pvr_queue_fence_is_ufo_backed(uf)) {
+			struct drm_sched_fence *s_fence = to_drm_sched_fence(uf);
+
+			/* If this is a native dependency, we wait for the scheduled fence,
+			 * and we will let pvr_queue_run_job() issue FW waits.
+			 */
+			err = drm_sched_job_add_dependency(job,
+							   dma_fence_get(&s_fence->scheduled));
+		} else {
+			err = drm_sched_job_add_dependency(job, dma_fence_get(uf));
+		}
+	}
+
+	dma_fence_put(f);
+	return err;
+}
+
+int
+pvr_sync_add_deps_to_job(struct pvr_file *pvr_file, struct drm_sched_job *job,
+			 u32 sync_op_count,
+			 const struct drm_pvr_sync_op *sync_ops,
+			 struct xarray *signal_array)
+{
+	int err = 0;
+
+	if (!sync_op_count)
+		return 0;
+
+	for (u32 i = 0; i < sync_op_count; i++) {
+		struct pvr_sync_signal *sig_sync;
+		struct dma_fence *fence;
+
+		if (sync_ops[i].flags & DRM_PVR_SYNC_OP_FLAG_SIGNAL)
+			continue;
+
+		err = pvr_check_sync_op(&sync_ops[i]);
+		if (err)
+			return err;
+
+		sig_sync = pvr_sync_signal_array_search(signal_array, sync_ops[i].handle,
+							sync_ops[i].value);
+		if (sig_sync) {
+			if (WARN_ON(!sig_sync->fence))
+				return -EINVAL;
+
+			fence = dma_fence_get(sig_sync->fence);
+		} else {
+			err = drm_syncobj_find_fence(from_pvr_file(pvr_file), sync_ops[i].handle,
+						     sync_ops[i].value, 0, &fence);
+			if (err)
+				return err;
+		}
+
+		err = pvr_sync_add_dep_to_job(job, fence);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_sync.h b/drivers/gpu/drm/imagination/pvr_sync.h
new file mode 100644
index 000000000000..e6278f0384c6
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_sync.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_SYNC_H
+#define PVR_SYNC_H
+
+#include <uapi/drm/pvr_drm.h>
+
+/* Forward declaration from <linux/xarray.h>. */
+struct xarray;
+
+/* Forward declaration from <drm/drm_file.h>. */
+struct drm_file;
+
+/* Forward declaration from <drm/gpu_scheduler.h>. */
+struct drm_sched_job;
+
+/* Forward declaration from "pvr_device.h". */
+struct pvr_file;
+
+/**
+ * struct pvr_sync_signal - Object encoding a syncobj signal operation
+ *
+ * The job submission logic collects all signal operations in an array of
+ * pvr_sync_signal objects. This array also serves as a cache to get the
+ * latest dma_fence when multiple jobs are submitted at once, and one job
+ * signals a syncobj point that's later waited on by a subsequent job.
+ */
+struct pvr_sync_signal {
+	/** @handle: Handle of the syncobj to signal. */
+	u32 handle;
+
+	/**
+	 * @point: Point to signal in the syncobj.
+	 *
+	 * Only relevant for timeline syncobjs.
+	 */
+	u64 point;
+
+	/** @syncobj: Syncobj retrieved from the handle. */
+	struct drm_syncobj *syncobj;
+
+	/**
+	 * @chain: Chain object used to link the new fence with the
+	 *	   existing timeline syncobj.
+	 *
+	 * Should be zero when manipulating a regular syncobj.
+	 */
+	struct dma_fence_chain *chain;
+
+	/**
+	 * @fence: New fence object to attach to the syncobj.
+	 *
+	 * This pointer starts with the current fence bound to
+	 * the <handle,point> pair.
+	 */
+	struct dma_fence *fence;
+};
+
+void
+pvr_sync_signal_array_cleanup(struct xarray *array);
+
+int
+pvr_sync_signal_array_collect_ops(struct xarray *array,
+				  struct drm_file *file,
+				  u32 sync_op_count,
+				  const struct drm_pvr_sync_op *sync_ops);
+
+int
+pvr_sync_signal_array_update_fences(struct xarray *array,
+				    u32 sync_op_count,
+				    const struct drm_pvr_sync_op *sync_ops,
+				    struct dma_fence *done_fence);
+
+void
+pvr_sync_signal_array_push_fences(struct xarray *array);
+
+int
+pvr_sync_add_deps_to_job(struct pvr_file *pvr_file, struct drm_sched_job *job,
+			 u32 sync_op_count,
+			 const struct drm_pvr_sync_op *sync_ops,
+			 struct xarray *signal_array);
+
+#endif /* PVR_SYNC_H */
-- 
2.42.0


