Return-Path: <linux-doc+bounces-2919-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B87967F4CA5
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 17:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04D05B21026
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 16:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C8155792;
	Wed, 22 Nov 2023 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="xzaw7u3A";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="EpuP9uoQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A08D5C;
	Wed, 22 Nov 2023 08:35:59 -0800 (PST)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AMCaKJF020106;
	Wed, 22 Nov 2023 16:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	dk201812; bh=KVS9RmGljGo6v4Gif8xEoY8nF8L5OG7mLMGh73yT2+k=; b=xza
	w7u3Aao3UumDitmtjOpi8je+imyWGWlhn76ApPC/h1MtTfCpFF3hjjxF1cwBm6PJ
	jpxxkNb7yFbWAZu35LDXfDSreIAhBHjBzlQ7ZJSBiNbTUGtvxk1rLqYT4y/v+qtR
	6xa56jOBUojnJmxBLZsDCLy+IzP8ZBbfYtqcLE84tQIUwcyW1ESmV9KI0C/PwAQ3
	9rqaYH03tXHuk//Ro+Op4WSo6XR/Mn0AntPmZiSJY/MoVIt2bIOLNRm+ZWFzQXkh
	EBFDjukrChkmkbcbgRfN6cSfPHvBdW8X2eevrVxqB7c4IzhUI+bik5z1HmMlQMA3
	z87YOmHH0fGeCeanDEw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3ug99g9m28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 22 Nov 2023 16:35:27 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 16:35:27 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 16:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcKESi/wcrT4GkOZqSU91VcOfTCQcZCb7/xt4XsitdCqN9A+XnlOe2Y87zJ+8zxnVIIuFgf+i8d2wsQfYAbe+8CT9v4xrzrDc2jidGYGJRnGvdxntrPhD1C2As91y2WqJ5w3gCBmuzcEIAyeSYykPHBrvy686Z6gDK9MzopTnzVKx/UhM67myj/PdCkYnERp8UFJ8qUcwhehpuOqzPpH/eOTgoo4v65spu2bXy6ZuX1ki+18KUHPdehJhkrJSveceU6SvmkYpSKbZc655/nJ8EiuvuH41tWvh8KSx/y5oPwq6jcg/12QlUwav8ieW41Dob2De/FhelKWVqE2jrCVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVS9RmGljGo6v4Gif8xEoY8nF8L5OG7mLMGh73yT2+k=;
 b=V/vpTS0ydozmEglC6LosjpEA2ogRKe7rDXjZSCRHAn39M8d9diFd0YQBpa7k8RT/Ysy9gmWr4etQZeplwp/b8SieL4Q2zu+QnXa5PK6jewrLAELtL5fBKcoY43RaGAWBItGmIRvZsHyxk3Bd96Sov72+oofV8tuXfa937jAJKZ2HObeBGU8Qo+cQ7brwIa6R4Tze7aLQB4PiCd6zcgnTsc6hPHMFxMAcuFk19K8gxk2ISNCu79rdDfnnRtEIgbcwR7AnJWxmW9zNcwWPcBWd2ZWsx4i6oAfroKBK1Ez1QmQVHYsX2N9lOliAJQlj/L3DUHi6HiRIrW4atBKzJYUY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVS9RmGljGo6v4Gif8xEoY8nF8L5OG7mLMGh73yT2+k=;
 b=EpuP9uoQKeysvKhMul7gQPLwpc38oV95enKTlPz1L0TGKJLi7bFIeeoDtz3xvDXE+2Qu13Ruv4frSSTAw3PXbp/8bl7l7TOEY6mCZo9C0+sDIiPxJaGSnLZcHxBY4fFAnGKG6lMPzaat0BS3aZ6+r5sOKYj8hwCF6sBP123HVr0=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB6459.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 16:35:18 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 16:35:18 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
CC: <frank.binns@imgtec.com>, <matt.coster@imgtec.com>,
        <boris.brezillon@collabora.com>, <faith.ekstrand@collabora.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <afd@ti.com>, <hns@goldelico.com>,
        <matthew.brost@intel.com>, <christian.koenig@amd.com>,
        <luben.tuikov@amd.com>, <dakr@redhat.com>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, Sarah Walker <sarah.walker@imgtec.com>
Subject: [PATCH v9 10/20] drm/imagination: Add GPU ID parsing and firmware loading
Date: Wed, 22 Nov 2023 16:34:31 +0000
Message-Id: <1ff76f7a5b45c742279c78910f8491b8a5e7f6e6.1700668843.git.donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700668843.git.donald.robson@imgtec.com>
References: <cover.1700668843.git.donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO6P265MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cbd294-2389-4bfa-1bce-08dbeb79032e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ov1rBXnBwiqS2DoTGsjNuoF6gurwTE8xOfn7340/YA8EvQP+P+H82vGKlW+Wxt+x2EDEihsV25qDi+bd1kfmC4CUHBj2m13/7KbFtWDvkqRR3w/0ilR8Hy05uWbNCxYjSa4+BWYwSTxa6qPMeUeDs2zyxEHFtOMlCTqol/OMTKGw9GnV/hDXD8vkomPoNOt2fQ9W4J8V54J71ASGyaQqEzRkgZ3r+Le952Ocd2eAJdDo84Cp2dqxPThAUDyvd+nCK0YFnVnnVIhW4/BC0WVev1fJ8LuhxWWzMOqK9d8XSLe73AByfCLSr2FXKAcF5nXe/sUIVbEZkiub4iKnBkNewt4rjTLbchL+lGi31JbnWAG46gimQY/UyQTV4i4KOD3ips6LJX7k0L+4hzX3k4piX57NiXW7Q8bPZTaf882Hvu14QMfRvR4imDDisyQNaU+S+P3r3+kFPiCXJHl8xM1TsFAVYHyz/TEvoXgHioTFY2L5pL1kai2ubQAJLhcr5zI+36bq7awTtzh1wBwytSIAgAxm3Sl94ueU3Jh2wVCGuhuFdkuj++73Q6IqnNhBd7jurED/T60SqNNa4wGwKDduBxX8S8BEbLgfKv0g42UUHlzLjc4H1rJHxXaXvQ0fzz3x
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(30864003)(36756003)(7416002)(41300700001)(5660300002)(2906002)(86362001)(38350700005)(26005)(6666004)(478600001)(6506007)(2616005)(6486002)(107886003)(6512007)(52116002)(8936002)(8676002)(4326008)(44832011)(66946007)(316002)(6916009)(66556008)(66476007)(83380400001)(38100700002)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?61NTHv0FgjfBHkDzn0ZrQd4UKPvdl/NOHQlmNhkARHDG8xRGsEaTv0fC/YiE?=
 =?us-ascii?Q?jKTq/oVAEBxwVvP07YicSssbyQxZoz0u9pa8OWcMu509Ypq0rm4zJFVeac59?=
 =?us-ascii?Q?wZ032lgsXLZDtqFoQdP7FrrlqUSMul52nxyvMDd5vnb3H1q9u5t16evv1kYY?=
 =?us-ascii?Q?1XrG31ZHWig2SeuNIax2D5Im6HZVH+lR560tW2TIw7meh6wQc98yKJjWB4Vl?=
 =?us-ascii?Q?m6dmrfK4d2u+iQcAsRVA3STUxHVfzhEUTPf3QRrcBuG3ZjwO6BCJDFS4dKai?=
 =?us-ascii?Q?O9O+Iqp2vh/2zTlyLI/VfaxNrsmyO70/Zi84ILYJH8lcfLNKovJGE/Fqqu4z?=
 =?us-ascii?Q?7nLlZrt/rqMLOx20oHbCtB9w7lDuPyvae4uU+oQh76ZqPB59fq1kvb0lCBNB?=
 =?us-ascii?Q?qE1DLoOjy1QQrrxIKG4qWqWtVFbzS5yEv41cDFT2ukqU8iryaukyNQ9uK+9X?=
 =?us-ascii?Q?pf+I+Q8iQrBShsupDYQgJ4izqBGCeysZC72jOIBjTuumu7AtfKUebp+ywXni?=
 =?us-ascii?Q?uemBkXJMWAnYE0Gvqe62jGfwM1NLMYACeq/GlX86imn4TMnZvCh/uFhJsI90?=
 =?us-ascii?Q?YUbCuMoEBt4S7OEMzq/++sb2eYMGYqje5mdBCqFeFGZ0xgDIfaODEd8PeT+G?=
 =?us-ascii?Q?1oqEVP0MqGQfMPJBIipM7NUIPuMLnsi6Sm1i7BCxsEQtwFwQsPE8nnEa+MVF?=
 =?us-ascii?Q?OCgJUeMbDI9FyJupRFvf/W3to7SytM+maOz9Dla0PhUlXcURFk8wID/dxNb1?=
 =?us-ascii?Q?ToE9th5yWGEtlloPl6retsL2fGhACcz8JK0QnC/r01T9OFqKkmQW7OMsZx0P?=
 =?us-ascii?Q?O+UUfT1IMei+94EbUDGMk1v1ZXQulA2tumvxn3MRi6hbnqVx7oh9eGNYt6E+?=
 =?us-ascii?Q?dxq+P2L8pEOmjcQBPr1boZ6PglaagRN84hzOm5QjbuqH88X0k72UZYs7XNDs?=
 =?us-ascii?Q?uW4mvOlGRSQK8vGTHi5556LnGceshnYuGWYhOBFqv0eWggTAwyJmgWOe+kBu?=
 =?us-ascii?Q?3WDYCLcQHULOUbqgTVXXa43FrEioSqqBAqJ4TJEVxGHIiw+eo3GW+EcApabT?=
 =?us-ascii?Q?FFnKEusjcweb7EhAMFZrHUsOYYud42cUsVbT/ZrO56g94yZfEmoFruu1Vngb?=
 =?us-ascii?Q?gJVhEMroY845c//RLwySLXMAema5EKHchwvRaWiA3HG2SYoW44Xv2Q/DdnDV?=
 =?us-ascii?Q?wj5pJcUbeKGiVBGSCUUqzpS7TYBmR1erjViJhG4HAGGaSXIoowb5SILixYe3?=
 =?us-ascii?Q?nyeF3icArTaIxGgm8YZiRJ3pf7bqXfQK+xIWnI6BX7cURRQl2WvnEwSBIz8X?=
 =?us-ascii?Q?lCp+1p4jcgYwVRZ7Dcfmfd5GBbvM2tuQi1202efSCVaKmd3d18/ZsF1wJs5k?=
 =?us-ascii?Q?kvuPJxtaGmL/B841j3faQdYS8xEzn+0MKCfhk5iDswwTX2M3030kjrB/lBio?=
 =?us-ascii?Q?8Kq5hZ6/OXNxFvZqZWPGsKxNuX3jchxBLNZ5uiQRNKwIS07cRLkXZi152mHU?=
 =?us-ascii?Q?/JucSAvKJ0pPzUYpW/iA/P0TbHdATiZfoZ69cvqzMFwqxaXw2JJHosIchU0R?=
 =?us-ascii?Q?kHYUxTKbgCs9mtzb1pdaE26z1rOAITxTpNLCCJWegkFT/PcQ6B4vTheATEEC?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cbd294-2389-4bfa-1bce-08dbeb79032e
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 16:35:18.1511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CASSwvLvRIQVSIM+HQCpMKDc5NDx2cWy4FKsEpgxYuoM4AYKVItZheE4sTVNLGFrYXgoPFzFJPdue0Su1pEJOsoa6OYctSVHMgs+4V4lAVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6459
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 7fb2uokeA_vCpgjJaurk8Q6sYUM4RCsR
X-Proofpoint-GUID: 7fb2uokeA_vCpgjJaurk8Q6sYUM4RCsR

From: Sarah Walker <sarah.walker@imgtec.com>

Read the GPU ID register at probe time and select the correct
features/quirks/enhancements. Use the GPU ID to form the firmware
file name and load the firmware.

The features/quirks/enhancements arrays are currently hardcoded in
the driver for the supported GPUs. We are looking at moving this
information to the firmware image.

Changes since v8:
- Corrected license identifiers

Changes since v7:
- Fix kerneldoc for pvr_device_info_set_enhancements()

Changes since v5:
- Add BRN 71242 to device info

Changes since v4:
- Retrieve device information from firmware header
- Pull forward firmware header parsing from FW infrastructure patch
- Use devm_add_action_or_reset to release firmware

Changes since v3:
- Use drm_dev_{enter,exit}

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile          |   2 +
 drivers/gpu/drm/imagination/pvr_device.c      | 323 ++++++++++-
 drivers/gpu/drm/imagination/pvr_device.h      | 220 ++++++++
 drivers/gpu/drm/imagination/pvr_device_info.c | 254 +++++++++
 drivers/gpu/drm/imagination/pvr_device_info.h | 186 +++++++
 drivers/gpu/drm/imagination/pvr_drv.c         | 521 +++++++++++++++++-
 drivers/gpu/drm/imagination/pvr_drv.h         | 107 ++++
 drivers/gpu/drm/imagination/pvr_fw.c          | 145 +++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  34 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h     | 135 +++++
 10 files changed, 1925 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index d36007f2825c..0b863e9f51b8 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -5,6 +5,8 @@ subdir-ccflags-y := -I$(srctree)/$(src)
 
 powervr-y := \
 	pvr_device.o \
+	pvr_device_info.o \
 	pvr_drv.o \
+	pvr_fw.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index abcdf733f57b..05e382cacb27 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -2,19 +2,31 @@
 /* Copyright (c) 2023 Imagination Technologies Ltd. */
 
 #include "pvr_device.h"
+#include "pvr_device_info.h"
+
+#include "pvr_fw.h"
+#include "pvr_rogue_cr_defs.h"
 
 #include <drm/drm_print.h>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/firmware.h>
 #include <linux/gfp.h>
+#include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
+
+/* Major number for the supported version of the firmware. */
+#define PVR_FW_VERSION_MAJOR 1
 
 /**
  * pvr_device_reg_init() - Initialize kernel access to a PowerVR device's
@@ -100,6 +112,209 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
+/**
+ * pvr_build_firmware_filename() - Construct a PowerVR firmware filename
+ * @pvr_dev: Target PowerVR device.
+ * @base: First part of the filename.
+ * @major: Major version number.
+ *
+ * A PowerVR firmware filename consists of three parts separated by underscores
+ * (``'_'``) along with a '.fw' file suffix. The first part is the exact value
+ * of @base, the second part is the hardware version string derived from @pvr_fw
+ * and the final part is the firmware version number constructed from @major with
+ * a 'v' prefix, e.g. powervr/rogue_4.40.2.51_v1.fw.
+ *
+ * The returned string will have been slab allocated and must be freed with
+ * kfree().
+ *
+ * Return:
+ *  * The constructed filename on success, or
+ *  * Any error returned by kasprintf().
+ */
+static char *
+pvr_build_firmware_filename(struct pvr_device *pvr_dev, const char *base,
+			    u8 major)
+{
+	struct pvr_gpu_id *gpu_id = &pvr_dev->gpu_id;
+
+	return kasprintf(GFP_KERNEL, "%s_%d.%d.%d.%d_v%d.fw", base, gpu_id->b,
+			 gpu_id->v, gpu_id->n, gpu_id->c, major);
+}
+
+static void
+pvr_release_firmware(void *data)
+{
+	struct pvr_device *pvr_dev = data;
+
+	release_firmware(pvr_dev->fw_dev.firmware);
+}
+
+/**
+ * pvr_request_firmware() - Load firmware for a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * See pvr_build_firmware_filename() for details on firmware file naming.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by pvr_build_firmware_filename(), or
+ *  * Any error returned by request_firmware().
+ */
+static int
+pvr_request_firmware(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = &pvr_dev->base;
+	char *filename;
+	const struct firmware *fw;
+	int err;
+
+	filename = pvr_build_firmware_filename(pvr_dev, "powervr/rogue",
+					       PVR_FW_VERSION_MAJOR);
+	if (IS_ERR(filename))
+		return PTR_ERR(filename);
+
+	/*
+	 * This function takes a copy of &filename, meaning we can free our
+	 * instance before returning.
+	 */
+	err = request_firmware(&fw, filename, pvr_dev->base.dev);
+	if (err) {
+		drm_err(drm_dev, "failed to load firmware %s (err=%d)\n",
+			filename, err);
+		goto err_free_filename;
+	}
+
+	drm_info(drm_dev, "loaded firmware %s\n", filename);
+	kfree(filename);
+
+	pvr_dev->fw_dev.firmware = fw;
+
+	return devm_add_action_or_reset(drm_dev->dev, pvr_release_firmware, pvr_dev);
+
+err_free_filename:
+	kfree(filename);
+
+	return err;
+}
+
+/**
+ * pvr_load_gpu_id() - Load a PowerVR device's GPU ID (BVNC) from control registers.
+ *
+ * Sets struct pvr_dev.gpu_id.
+ *
+ * @pvr_dev: Target PowerVR device.
+ */
+static void
+pvr_load_gpu_id(struct pvr_device *pvr_dev)
+{
+	struct pvr_gpu_id *gpu_id = &pvr_dev->gpu_id;
+	u64 bvnc;
+
+	/*
+	 * Try reading the BVNC using the newer (cleaner) method first. If the
+	 * B value is zero, fall back to the older method.
+	 */
+	bvnc = pvr_cr_read64(pvr_dev, ROGUE_CR_CORE_ID__PBVNC);
+
+	gpu_id->b = PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__BRANCH_ID);
+	if (gpu_id->b != 0) {
+		gpu_id->v = PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__VERSION_ID);
+		gpu_id->n = PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__NUMBER_OF_SCALABLE_UNITS);
+		gpu_id->c = PVR_CR_FIELD_GET(bvnc, CORE_ID__PBVNC__CONFIG_ID);
+	} else {
+		u32 core_rev = pvr_cr_read32(pvr_dev, ROGUE_CR_CORE_REVISION);
+		u32 core_id = pvr_cr_read32(pvr_dev, ROGUE_CR_CORE_ID);
+		u16 core_id_config = PVR_CR_FIELD_GET(core_id, CORE_ID_CONFIG);
+
+		gpu_id->b = PVR_CR_FIELD_GET(core_rev, CORE_REVISION_MAJOR);
+		gpu_id->v = PVR_CR_FIELD_GET(core_rev, CORE_REVISION_MINOR);
+		gpu_id->n = FIELD_GET(0xFF00, core_id_config);
+		gpu_id->c = FIELD_GET(0x00FF, core_id_config);
+	}
+}
+
+/**
+ * pvr_set_dma_info() - Set PowerVR device DMA information
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Sets the DMA mask and max segment size for the PowerVR device.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by PVR_FEATURE_VALUE(), or
+ *  * Any error returned by dma_set_mask().
+ */
+
+static int
+pvr_set_dma_info(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u16 phys_bus_width;
+	int err;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, phys_bus_width, &phys_bus_width);
+	if (err) {
+		drm_err(drm_dev, "Failed to get device physical bus width\n");
+		return err;
+	}
+
+	err = dma_set_mask(drm_dev->dev, DMA_BIT_MASK(phys_bus_width));
+	if (err) {
+		drm_err(drm_dev, "Failed to set DMA mask (err=%d)\n", err);
+		return err;
+	}
+
+	dma_set_max_seg_size(drm_dev->dev, UINT_MAX);
+
+	return 0;
+}
+
+/**
+ * pvr_device_gpu_init() - GPU-specific initialization for a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * The following steps are taken to ensure the device is ready:
+ *
+ *  1. Read the hardware version information from control registers,
+ *  2. Initialise the hardware feature information,
+ *  3. Setup the device DMA information,
+ *  4. Setup the device-scoped memory context, and
+ *  5. Load firmware into the device.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%ENODEV if the GPU is not supported,
+ *  * Any error returned by pvr_set_dma_info(),
+ *  * Any error returned by pvr_memory_context_init(), or
+ *  * Any error returned by pvr_request_firmware().
+ */
+static int
+pvr_device_gpu_init(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	pvr_load_gpu_id(pvr_dev);
+
+	err = pvr_request_firmware(pvr_dev);
+	if (err)
+		return err;
+
+	err = pvr_fw_validate_init_device_info(pvr_dev);
+	if (err)
+		return err;
+
+	if (PVR_HAS_FEATURE(pvr_dev, meta))
+		pvr_dev->fw_dev.processor_type = PVR_FW_PROCESSOR_TYPE_META;
+	else if (PVR_HAS_FEATURE(pvr_dev, mips))
+		pvr_dev->fw_dev.processor_type = PVR_FW_PROCESSOR_TYPE_MIPS;
+	else if (PVR_HAS_FEATURE(pvr_dev, riscv_fw_processor))
+		pvr_dev->fw_dev.processor_type = PVR_FW_PROCESSOR_TYPE_RISCV;
+	else
+		return -EINVAL;
+
+	return pvr_set_dma_info(pvr_dev);
+}
+
 /**
  * pvr_device_init() - Initialize a PowerVR device
  * @pvr_dev: Target PowerVR device.
@@ -130,7 +345,12 @@ pvr_device_init(struct pvr_device *pvr_dev)
 		return err;
 
 	/* Map the control registers into memory. */
-	return pvr_device_reg_init(pvr_dev);
+	err = pvr_device_reg_init(pvr_dev);
+	if (err)
+		return err;
+
+	/* Perform GPU-specific initialization steps. */
+	return pvr_device_gpu_init(pvr_dev);
 }
 
 /**
@@ -145,3 +365,104 @@ pvr_device_fini(struct pvr_device *pvr_dev)
 	 * the initialization stages in pvr_device_init().
 	 */
 }
+
+bool
+pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk)
+{
+	switch (quirk) {
+	case 47217:
+		return PVR_HAS_QUIRK(pvr_dev, 47217);
+	case 48545:
+		return PVR_HAS_QUIRK(pvr_dev, 48545);
+	case 49927:
+		return PVR_HAS_QUIRK(pvr_dev, 49927);
+	case 51764:
+		return PVR_HAS_QUIRK(pvr_dev, 51764);
+	case 62269:
+		return PVR_HAS_QUIRK(pvr_dev, 62269);
+	default:
+		return false;
+	};
+}
+
+bool
+pvr_device_has_uapi_enhancement(struct pvr_device *pvr_dev, u32 enhancement)
+{
+	switch (enhancement) {
+	case 35421:
+		return PVR_HAS_ENHANCEMENT(pvr_dev, 35421);
+	case 42064:
+		return PVR_HAS_ENHANCEMENT(pvr_dev, 42064);
+	default:
+		return false;
+	};
+}
+
+/**
+ * pvr_device_has_feature() - Look up device feature based on feature definition
+ * @pvr_dev: Device pointer.
+ * @feature: Feature to look up. Should be one of %PVR_FEATURE_*.
+ *
+ * Returns:
+ *  * %true if feature is present on device, or
+ *  * %false if feature is not present on device.
+ */
+bool
+pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature)
+{
+	switch (feature) {
+	case PVR_FEATURE_CLUSTER_GROUPING:
+		return PVR_HAS_FEATURE(pvr_dev, cluster_grouping);
+
+	case PVR_FEATURE_COMPUTE_MORTON_CAPABLE:
+		return PVR_HAS_FEATURE(pvr_dev, compute_morton_capable);
+
+	case PVR_FEATURE_FB_CDC_V4:
+		return PVR_HAS_FEATURE(pvr_dev, fb_cdc_v4);
+
+	case PVR_FEATURE_GPU_MULTICORE_SUPPORT:
+		return PVR_HAS_FEATURE(pvr_dev, gpu_multicore_support);
+
+	case PVR_FEATURE_ISP_ZLS_D24_S8_PACKING_OGL_MODE:
+		return PVR_HAS_FEATURE(pvr_dev, isp_zls_d24_s8_packing_ogl_mode);
+
+	case PVR_FEATURE_S7_TOP_INFRASTRUCTURE:
+		return PVR_HAS_FEATURE(pvr_dev, s7_top_infrastructure);
+
+	case PVR_FEATURE_TESSELLATION:
+		return PVR_HAS_FEATURE(pvr_dev, tessellation);
+
+	case PVR_FEATURE_TPU_DM_GLOBAL_REGISTERS:
+		return PVR_HAS_FEATURE(pvr_dev, tpu_dm_global_registers);
+
+	case PVR_FEATURE_VDM_DRAWINDIRECT:
+		return PVR_HAS_FEATURE(pvr_dev, vdm_drawindirect);
+
+	case PVR_FEATURE_VDM_OBJECT_LEVEL_LLS:
+		return PVR_HAS_FEATURE(pvr_dev, vdm_object_level_lls);
+
+	case PVR_FEATURE_ZLS_SUBTILE:
+		return PVR_HAS_FEATURE(pvr_dev, zls_subtile);
+
+	/* Derived features. */
+	case PVR_FEATURE_CDM_USER_MODE_QUEUE: {
+		u8 cdm_control_stream_format = 0;
+
+		PVR_FEATURE_VALUE(pvr_dev, cdm_control_stream_format, &cdm_control_stream_format);
+		return (cdm_control_stream_format >= 2 && cdm_control_stream_format <= 4);
+	}
+
+	case PVR_FEATURE_REQUIRES_FB_CDC_ZLS_SETUP:
+		if (PVR_HAS_FEATURE(pvr_dev, fbcdc_algorithm)) {
+			u8 fbcdc_algorithm = 0;
+
+			PVR_FEATURE_VALUE(pvr_dev, fbcdc_algorithm, &fbcdc_algorithm);
+			return (fbcdc_algorithm < 3 || PVR_HAS_FEATURE(pvr_dev, fb_cdc_v4));
+		}
+		return false;
+
+	default:
+		WARN(true, "Looking up undefined feature %u\n", feature);
+		return false;
+	}
+}
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index d9d2804f4454..36fe67bed27f 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -4,6 +4,9 @@
 #ifndef PVR_DEVICE_H
 #define PVR_DEVICE_H
 
+#include "pvr_device_info.h"
+#include "pvr_fw.h"
+
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_mm.h>
@@ -28,6 +31,26 @@ struct clk;
 /* Forward declaration from <linux/firmware.h>. */
 struct firmware;
 
+/**
+ * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device
+ * @b: Branch ID.
+ * @v: Version ID.
+ * @n: Number of scalable units.
+ * @c: Config ID.
+ */
+struct pvr_gpu_id {
+	u16 b, v, n, c;
+};
+
+/**
+ * struct pvr_fw_version - Firmware version information
+ * @major: Major version number.
+ * @minor: Minor version number.
+ */
+struct pvr_fw_version {
+	u16 major, minor;
+};
+
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
  */
@@ -40,6 +63,35 @@ struct pvr_device {
 	 */
 	struct drm_device base;
 
+	/** @gpu_id: GPU ID detected at runtime. */
+	struct pvr_gpu_id gpu_id;
+
+	/**
+	 * @features: Hardware feature information.
+	 *
+	 * Do not access this member directly, instead use PVR_HAS_FEATURE()
+	 * or PVR_FEATURE_VALUE() macros.
+	 */
+	struct pvr_device_features features;
+
+	/**
+	 * @quirks: Hardware quirk information.
+	 *
+	 * Do not access this member directly, instead use PVR_HAS_QUIRK().
+	 */
+	struct pvr_device_quirks quirks;
+
+	/**
+	 * @enhancements: Hardware enhancement information.
+	 *
+	 * Do not access this member directly, instead use
+	 * PVR_HAS_ENHANCEMENT().
+	 */
+	struct pvr_device_enhancements enhancements;
+
+	/** @fw_version: Firmware version detected at runtime. */
+	struct pvr_fw_version fw_version;
+
 	/**
 	 * @regs: Device control registers.
 	 *
@@ -70,6 +122,9 @@ struct pvr_device {
 	 * Interface (MEMIF). If present, this needs to be enabled/disabled together with @core_clk.
 	 */
 	struct clk *mem_clk;
+
+	/** @fw_dev: Firmware related data. */
+	struct pvr_fw_device fw_dev;
 };
 
 /**
@@ -92,6 +147,76 @@ struct pvr_file {
 	struct pvr_device *pvr_dev;
 };
 
+/**
+ * PVR_HAS_FEATURE() - Tests whether a PowerVR device has a given feature
+ * @pvr_dev: [IN] Target PowerVR device.
+ * @feature: [IN] Hardware feature name.
+ *
+ * Feature names are derived from those found in &struct pvr_device_features by
+ * dropping the 'has_' prefix, which is applied by this macro.
+ *
+ * Return:
+ *  * true if the named feature is present in the hardware
+ *  * false if the named feature is not present in the hardware
+ */
+#define PVR_HAS_FEATURE(pvr_dev, feature) ((pvr_dev)->features.has_##feature)
+
+/**
+ * PVR_FEATURE_VALUE() - Gets a PowerVR device feature value
+ * @pvr_dev: [IN] Target PowerVR device.
+ * @feature: [IN] Feature name.
+ * @value_out: [OUT] Feature value.
+ *
+ * This macro will get a feature value for those features that have values.
+ * If the feature is not present, nothing will be stored to @value_out.
+ *
+ * Feature names are derived from those found in &struct pvr_device_features by
+ * dropping the 'has_' prefix.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EINVAL if the named feature is not present in the hardware
+ */
+#define PVR_FEATURE_VALUE(pvr_dev, feature, value_out)             \
+	({                                                         \
+		struct pvr_device *_pvr_dev = pvr_dev;             \
+		int _ret = -EINVAL;                                \
+		if (_pvr_dev->features.has_##feature) {            \
+			*(value_out) = _pvr_dev->features.feature; \
+			_ret = 0;                                  \
+		}                                                  \
+		_ret;                                              \
+	})
+
+/**
+ * PVR_HAS_QUIRK() - Tests whether a physical device has a given quirk
+ * @pvr_dev: [IN] Target PowerVR device.
+ * @quirk: [IN] Hardware quirk name.
+ *
+ * Quirk numbers are derived from those found in #pvr_device_quirks by
+ * dropping the 'has_brn' prefix, which is applied by this macro.
+ *
+ * Returns
+ *  * true if the quirk is present in the hardware, or
+ *  * false if the quirk is not present in the hardware.
+ */
+#define PVR_HAS_QUIRK(pvr_dev, quirk) ((pvr_dev)->quirks.has_brn##quirk)
+
+/**
+ * PVR_HAS_ENHANCEMENT() - Tests whether a physical device has a given
+ *                         enhancement
+ * @pvr_dev: [IN] Target PowerVR device.
+ * @enhancement: [IN] Hardware enhancement name.
+ *
+ * Enhancement numbers are derived from those found in #pvr_device_enhancements
+ * by dropping the 'has_ern' prefix, which is applied by this macro.
+ *
+ * Returns
+ *  * true if the enhancement is present in the hardware, or
+ *  * false if the enhancement is not present in the hardware.
+ */
+#define PVR_HAS_ENHANCEMENT(pvr_dev, enhancement) ((pvr_dev)->enhancements.has_ern##enhancement)
+
 #define from_pvr_device(pvr_dev) (&(pvr_dev)->base)
 
 #define to_pvr_device(drm_dev) container_of_const(drm_dev, struct pvr_device, base)
@@ -100,9 +225,77 @@ struct pvr_file {
 
 #define to_pvr_file(file) ((file)->driver_priv)
 
+/**
+ * PVR_PACKED_BVNC() - Packs B, V, N and C values into a 64-bit unsigned integer
+ * @b: Branch ID.
+ * @v: Version ID.
+ * @n: Number of scalable units.
+ * @c: Config ID.
+ *
+ * The packed layout is as follows:
+ *
+ *    +--------+--------+--------+-------+
+ *    | 63..48 | 47..32 | 31..16 | 15..0 |
+ *    +========+========+========+=======+
+ *    | B      | V      | N      | C     |
+ *    +--------+--------+--------+-------+
+ *
+ * pvr_gpu_id_to_packed_bvnc() should be used instead of this macro when a
+ * &struct pvr_gpu_id is available in order to ensure proper type checking.
+ *
+ * Return: Packed BVNC.
+ */
+/* clang-format off */
+#define PVR_PACKED_BVNC(b, v, n, c) \
+	((((u64)(b) & GENMASK_ULL(15, 0)) << 48) | \
+	 (((u64)(v) & GENMASK_ULL(15, 0)) << 32) | \
+	 (((u64)(n) & GENMASK_ULL(15, 0)) << 16) | \
+	 (((u64)(c) & GENMASK_ULL(15, 0)) <<  0))
+/* clang-format on */
+
+/**
+ * pvr_gpu_id_to_packed_bvnc() - Packs B, V, N and C values into a 64-bit
+ * unsigned integer
+ * @gpu_id: GPU ID.
+ *
+ * The packed layout is as follows:
+ *
+ *    +--------+--------+--------+-------+
+ *    | 63..48 | 47..32 | 31..16 | 15..0 |
+ *    +========+========+========+=======+
+ *    | B      | V      | N      | C     |
+ *    +--------+--------+--------+-------+
+ *
+ * This should be used in preference to PVR_PACKED_BVNC() when a &struct
+ * pvr_gpu_id is available in order to ensure proper type checking.
+ *
+ * Return: Packed BVNC.
+ */
+static __always_inline u64
+pvr_gpu_id_to_packed_bvnc(struct pvr_gpu_id *gpu_id)
+{
+	return PVR_PACKED_BVNC(gpu_id->b, gpu_id->v, gpu_id->n, gpu_id->c);
+}
+
+static __always_inline void
+packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gpu_id *gpu_id)
+{
+	gpu_id->b = (bvnc & GENMASK_ULL(63, 48)) >> 48;
+	gpu_id->v = (bvnc & GENMASK_ULL(47, 32)) >> 32;
+	gpu_id->n = (bvnc & GENMASK_ULL(31, 16)) >> 16;
+	gpu_id->c = bvnc & GENMASK_ULL(15, 0);
+}
+
 int pvr_device_init(struct pvr_device *pvr_dev);
 void pvr_device_fini(struct pvr_device *pvr_dev);
 
+bool
+pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk);
+bool
+pvr_device_has_uapi_enhancement(struct pvr_device *pvr_dev, u32 enhancement);
+bool
+pvr_device_has_feature(struct pvr_device *pvr_dev, u32 feature);
+
 /**
  * PVR_CR_FIELD_GET() - Extract a single field from a PowerVR control register
  * @val: Value of the target register.
@@ -208,6 +401,29 @@ pvr_cr_poll_reg64(struct pvr_device *pvr_dev, u32 reg_addr, u64 reg_value,
 		(value & reg_mask) == reg_value, 0, timeout_usec);
 }
 
+/**
+ * pvr_round_up_to_cacheline_size() - Round up a provided size to be cacheline
+ *                                    aligned
+ * @pvr_dev: Target PowerVR device.
+ * @size: Initial size, in bytes.
+ *
+ * Returns:
+ *  * Size aligned to cacheline size.
+ */
+static __always_inline size_t
+pvr_round_up_to_cacheline_size(struct pvr_device *pvr_dev, size_t size)
+{
+	u16 slc_cacheline_size_bits = 0;
+	u16 slc_cacheline_size_bytes;
+
+	WARN_ON(!PVR_HAS_FEATURE(pvr_dev, slc_cache_line_size_bits));
+	PVR_FEATURE_VALUE(pvr_dev, slc_cache_line_size_bits,
+			  &slc_cacheline_size_bits);
+	slc_cacheline_size_bytes = slc_cacheline_size_bits / 8;
+
+	return round_up(size, slc_cacheline_size_bytes);
+}
+
 /**
  * DOC: IOCTL validation helpers
  *
@@ -302,4 +518,8 @@ pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
 					      __union_size, __member_size);  \
 	})
 
+#define PVR_FW_PROCESSOR_TYPE_META  0
+#define PVR_FW_PROCESSOR_TYPE_MIPS  1
+#define PVR_FW_PROCESSOR_TYPE_RISCV 2
+
 #endif /* PVR_DEVICE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_device_info.c b/drivers/gpu/drm/imagination/pvr_device_info.c
new file mode 100644
index 000000000000..11e6bef52ecd
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device_info.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_device_info.h"
+#include "pvr_rogue_fwif_dev_info.h"
+
+#include <drm/drm_print.h>
+
+#include <linux/bits.h>
+#include <linux/minmax.h>
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+#define QUIRK_MAPPING(quirk) \
+	[PVR_FW_HAS_BRN_##quirk] = offsetof(struct pvr_device, quirks.has_brn##quirk)
+
+static const uintptr_t quirks_mapping[] = {
+	QUIRK_MAPPING(44079),
+	QUIRK_MAPPING(47217),
+	QUIRK_MAPPING(48492),
+	QUIRK_MAPPING(48545),
+	QUIRK_MAPPING(49927),
+	QUIRK_MAPPING(50767),
+	QUIRK_MAPPING(51764),
+	QUIRK_MAPPING(62269),
+	QUIRK_MAPPING(63142),
+	QUIRK_MAPPING(63553),
+	QUIRK_MAPPING(66011),
+	QUIRK_MAPPING(71242),
+};
+
+#undef QUIRK_MAPPING
+
+#define ENHANCEMENT_MAPPING(enhancement)                             \
+	[PVR_FW_HAS_ERN_##enhancement] = offsetof(struct pvr_device, \
+						  enhancements.has_ern##enhancement)
+
+static const uintptr_t enhancements_mapping[] = {
+	ENHANCEMENT_MAPPING(35421),
+	ENHANCEMENT_MAPPING(38020),
+	ENHANCEMENT_MAPPING(38748),
+	ENHANCEMENT_MAPPING(42064),
+	ENHANCEMENT_MAPPING(42290),
+	ENHANCEMENT_MAPPING(42606),
+	ENHANCEMENT_MAPPING(47025),
+	ENHANCEMENT_MAPPING(57596),
+};
+
+#undef ENHANCEMENT_MAPPING
+
+static void pvr_device_info_set_common(struct pvr_device *pvr_dev, const u64 *bitmask,
+				       u32 bitmask_size, const uintptr_t *mapping, u32 mapping_max)
+{
+	const u32 mapping_max_size = (mapping_max + 63) >> 6;
+	const u32 nr_bits = min(bitmask_size * 64, mapping_max);
+
+	/* Warn if any unsupported values in the bitmask. */
+	if (bitmask_size > mapping_max_size) {
+		if (mapping == quirks_mapping)
+			drm_warn(from_pvr_device(pvr_dev), "Unsupported quirks in firmware image");
+		else
+			drm_warn(from_pvr_device(pvr_dev),
+				 "Unsupported enhancements in firmware image");
+	} else if (bitmask_size == mapping_max_size && (mapping_max & 63)) {
+		u64 invalid_mask = ~0ull << (mapping_max & 63);
+
+		if (bitmask[bitmask_size - 1] & invalid_mask) {
+			if (mapping == quirks_mapping)
+				drm_warn(from_pvr_device(pvr_dev),
+					 "Unsupported quirks in firmware image");
+			else
+				drm_warn(from_pvr_device(pvr_dev),
+					 "Unsupported enhancements in firmware image");
+		}
+	}
+
+	for (u32 i = 0; i < nr_bits; i++) {
+		if (bitmask[i >> 6] & BIT_ULL(i & 63))
+			*(bool *)((u8 *)pvr_dev + mapping[i]) = true;
+	}
+}
+
+/**
+ * pvr_device_info_set_quirks() - Set device quirks from device information in firmware
+ * @pvr_dev: Device pointer.
+ * @quirks: Pointer to quirks mask in device information.
+ * @quirks_size: Size of quirks mask, in u64s.
+ */
+void pvr_device_info_set_quirks(struct pvr_device *pvr_dev, const u64 *quirks, u32 quirks_size)
+{
+	BUILD_BUG_ON(ARRAY_SIZE(quirks_mapping) != PVR_FW_HAS_BRN_MAX);
+
+	pvr_device_info_set_common(pvr_dev, quirks, quirks_size, quirks_mapping,
+				   ARRAY_SIZE(quirks_mapping));
+}
+
+/**
+ * pvr_device_info_set_enhancements() - Set device enhancements from device information in firmware
+ * @pvr_dev: Device pointer.
+ * @enhancements: Pointer to enhancements mask in device information.
+ * @enhancements_size: Size of enhancements mask, in u64s.
+ */
+void pvr_device_info_set_enhancements(struct pvr_device *pvr_dev, const u64 *enhancements,
+				      u32 enhancements_size)
+{
+	BUILD_BUG_ON(ARRAY_SIZE(enhancements_mapping) != PVR_FW_HAS_ERN_MAX);
+
+	pvr_device_info_set_common(pvr_dev, enhancements, enhancements_size,
+				   enhancements_mapping, ARRAY_SIZE(enhancements_mapping));
+}
+
+#define FEATURE_MAPPING(fw_feature, feature)                                        \
+	[PVR_FW_HAS_FEATURE_##fw_feature] = {                                       \
+		.flag_offset = offsetof(struct pvr_device, features.has_##feature), \
+		.value_offset = 0                                                   \
+	}
+
+#define FEATURE_MAPPING_VALUE(fw_feature, feature)                                  \
+	[PVR_FW_HAS_FEATURE_##fw_feature] = {                                       \
+		.flag_offset = offsetof(struct pvr_device, features.has_##feature), \
+		.value_offset = offsetof(struct pvr_device, features.feature)       \
+	}
+
+static const struct {
+	uintptr_t flag_offset;
+	uintptr_t value_offset;
+} features_mapping[] = {
+	FEATURE_MAPPING(AXI_ACELITE, axi_acelite),
+	FEATURE_MAPPING_VALUE(CDM_CONTROL_STREAM_FORMAT, cdm_control_stream_format),
+	FEATURE_MAPPING(CLUSTER_GROUPING, cluster_grouping),
+	FEATURE_MAPPING_VALUE(COMMON_STORE_SIZE_IN_DWORDS, common_store_size_in_dwords),
+	FEATURE_MAPPING(COMPUTE, compute),
+	FEATURE_MAPPING(COMPUTE_MORTON_CAPABLE, compute_morton_capable),
+	FEATURE_MAPPING(COMPUTE_OVERLAP, compute_overlap),
+	FEATURE_MAPPING(COREID_PER_OS, coreid_per_os),
+	FEATURE_MAPPING(DYNAMIC_DUST_POWER, dynamic_dust_power),
+	FEATURE_MAPPING_VALUE(ECC_RAMS, ecc_rams),
+	FEATURE_MAPPING_VALUE(FBCDC, fbcdc),
+	FEATURE_MAPPING_VALUE(FBCDC_ALGORITHM, fbcdc_algorithm),
+	FEATURE_MAPPING_VALUE(FBCDC_ARCHITECTURE, fbcdc_architecture),
+	FEATURE_MAPPING_VALUE(FBC_MAX_DEFAULT_DESCRIPTORS, fbc_max_default_descriptors),
+	FEATURE_MAPPING_VALUE(FBC_MAX_LARGE_DESCRIPTORS, fbc_max_large_descriptors),
+	FEATURE_MAPPING(FB_CDC_V4, fb_cdc_v4),
+	FEATURE_MAPPING(GPU_MULTICORE_SUPPORT, gpu_multicore_support),
+	FEATURE_MAPPING(GPU_VIRTUALISATION, gpu_virtualisation),
+	FEATURE_MAPPING(GS_RTA_SUPPORT, gs_rta_support),
+	FEATURE_MAPPING(IRQ_PER_OS, irq_per_os),
+	FEATURE_MAPPING_VALUE(ISP_MAX_TILES_IN_FLIGHT, isp_max_tiles_in_flight),
+	FEATURE_MAPPING_VALUE(ISP_SAMPLES_PER_PIXEL, isp_samples_per_pixel),
+	FEATURE_MAPPING(ISP_ZLS_D24_S8_PACKING_OGL_MODE, isp_zls_d24_s8_packing_ogl_mode),
+	FEATURE_MAPPING_VALUE(LAYOUT_MARS, layout_mars),
+	FEATURE_MAPPING_VALUE(MAX_PARTITIONS, max_partitions),
+	FEATURE_MAPPING_VALUE(META, meta),
+	FEATURE_MAPPING_VALUE(META_COREMEM_SIZE, meta_coremem_size),
+	FEATURE_MAPPING(MIPS, mips),
+	FEATURE_MAPPING_VALUE(NUM_CLUSTERS, num_clusters),
+	FEATURE_MAPPING_VALUE(NUM_ISP_IPP_PIPES, num_isp_ipp_pipes),
+	FEATURE_MAPPING_VALUE(NUM_OSIDS, num_osids),
+	FEATURE_MAPPING_VALUE(NUM_RASTER_PIPES, num_raster_pipes),
+	FEATURE_MAPPING(PBE2_IN_XE, pbe2_in_xe),
+	FEATURE_MAPPING(PBVNC_COREID_REG, pbvnc_coreid_reg),
+	FEATURE_MAPPING(PERFBUS, perfbus),
+	FEATURE_MAPPING(PERF_COUNTER_BATCH, perf_counter_batch),
+	FEATURE_MAPPING_VALUE(PHYS_BUS_WIDTH, phys_bus_width),
+	FEATURE_MAPPING(RISCV_FW_PROCESSOR, riscv_fw_processor),
+	FEATURE_MAPPING(ROGUEXE, roguexe),
+	FEATURE_MAPPING(S7_TOP_INFRASTRUCTURE, s7_top_infrastructure),
+	FEATURE_MAPPING(SIMPLE_INTERNAL_PARAMETER_FORMAT, simple_internal_parameter_format),
+	FEATURE_MAPPING(SIMPLE_INTERNAL_PARAMETER_FORMAT_V2, simple_internal_parameter_format_v2),
+	FEATURE_MAPPING_VALUE(SIMPLE_PARAMETER_FORMAT_VERSION, simple_parameter_format_version),
+	FEATURE_MAPPING_VALUE(SLC_BANKS, slc_banks),
+	FEATURE_MAPPING_VALUE(SLC_CACHE_LINE_SIZE_BITS, slc_cache_line_size_bits),
+	FEATURE_MAPPING(SLC_SIZE_CONFIGURABLE, slc_size_configurable),
+	FEATURE_MAPPING_VALUE(SLC_SIZE_IN_KILOBYTES, slc_size_in_kilobytes),
+	FEATURE_MAPPING(SOC_TIMER, soc_timer),
+	FEATURE_MAPPING(SYS_BUS_SECURE_RESET, sys_bus_secure_reset),
+	FEATURE_MAPPING(TESSELLATION, tessellation),
+	FEATURE_MAPPING(TILE_REGION_PROTECTION, tile_region_protection),
+	FEATURE_MAPPING_VALUE(TILE_SIZE_X, tile_size_x),
+	FEATURE_MAPPING_VALUE(TILE_SIZE_Y, tile_size_y),
+	FEATURE_MAPPING(TLA, tla),
+	FEATURE_MAPPING(TPU_CEM_DATAMASTER_GLOBAL_REGISTERS, tpu_cem_datamaster_global_registers),
+	FEATURE_MAPPING(TPU_DM_GLOBAL_REGISTERS, tpu_dm_global_registers),
+	FEATURE_MAPPING(TPU_FILTERING_MODE_CONTROL, tpu_filtering_mode_control),
+	FEATURE_MAPPING_VALUE(USC_MIN_OUTPUT_REGISTERS_PER_PIX, usc_min_output_registers_per_pix),
+	FEATURE_MAPPING(VDM_DRAWINDIRECT, vdm_drawindirect),
+	FEATURE_MAPPING(VDM_OBJECT_LEVEL_LLS, vdm_object_level_lls),
+	FEATURE_MAPPING_VALUE(VIRTUAL_ADDRESS_SPACE_BITS, virtual_address_space_bits),
+	FEATURE_MAPPING(WATCHDOG_TIMER, watchdog_timer),
+	FEATURE_MAPPING(WORKGROUP_PROTECTION, workgroup_protection),
+	FEATURE_MAPPING_VALUE(XE_ARCHITECTURE, xe_architecture),
+	FEATURE_MAPPING(XE_MEMORY_HIERARCHY, xe_memory_hierarchy),
+	FEATURE_MAPPING(XE_TPU2, xe_tpu2),
+	FEATURE_MAPPING_VALUE(XPU_MAX_REGBANKS_ADDR_WIDTH, xpu_max_regbanks_addr_width),
+	FEATURE_MAPPING_VALUE(XPU_MAX_SLAVES, xpu_max_slaves),
+	FEATURE_MAPPING_VALUE(XPU_REGISTER_BROADCAST, xpu_register_broadcast),
+	FEATURE_MAPPING(XT_TOP_INFRASTRUCTURE, xt_top_infrastructure),
+	FEATURE_MAPPING(ZLS_SUBTILE, zls_subtile),
+};
+
+#undef FEATURE_MAPPING_VALUE
+#undef FEATURE_MAPPING
+
+/**
+ * pvr_device_info_set_features() - Set device features from device information in firmware
+ * @pvr_dev: Device pointer.
+ * @features: Pointer to features mask in device information.
+ * @features_size: Size of features mask, in u64s.
+ * @feature_param_size: Size of feature parameters, in u64s.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL on malformed stream.
+ */
+int pvr_device_info_set_features(struct pvr_device *pvr_dev, const u64 *features, u32 features_size,
+				 u32 feature_param_size)
+{
+	const u32 mapping_max = ARRAY_SIZE(features_mapping);
+	const u32 mapping_max_size = (mapping_max + 63) >> 6;
+	const u32 nr_bits = min(features_size * 64, mapping_max);
+	const u64 *feature_params = features + features_size;
+	u32 param_idx = 0;
+
+	BUILD_BUG_ON(ARRAY_SIZE(features_mapping) != PVR_FW_HAS_FEATURE_MAX);
+
+	/* Verify no unsupported values in the bitmask. */
+	if (features_size > mapping_max_size) {
+		drm_warn(from_pvr_device(pvr_dev), "Unsupported features in firmware image");
+	} else if (features_size == mapping_max_size && (mapping_max & 63)) {
+		u64 invalid_mask = ~0ull << (mapping_max & 63);
+
+		if (features[features_size - 1] & invalid_mask)
+			drm_warn(from_pvr_device(pvr_dev),
+				 "Unsupported features in firmware image");
+	}
+
+	for (u32 i = 0; i < nr_bits; i++) {
+		if (features[i >> 6] & BIT_ULL(i & 63)) {
+			*(bool *)((u8 *)pvr_dev + features_mapping[i].flag_offset) = true;
+
+			if (features_mapping[i].value_offset) {
+				if (param_idx >= feature_param_size)
+					return -EINVAL;
+
+				*(u64 *)((u8 *)pvr_dev + features_mapping[i].value_offset) =
+					feature_params[param_idx];
+				param_idx++;
+			}
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_device_info.h b/drivers/gpu/drm/imagination/pvr_device_info.h
new file mode 100644
index 000000000000..f61fb988b553
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_device_info.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_DEVICE_INFO_H
+#define PVR_DEVICE_INFO_H
+
+#include <linux/types.h>
+
+struct pvr_device;
+
+/*
+ * struct pvr_device_features - Hardware feature information
+ */
+struct pvr_device_features {
+	bool has_axi_acelite;
+	bool has_cdm_control_stream_format;
+	bool has_cluster_grouping;
+	bool has_common_store_size_in_dwords;
+	bool has_compute;
+	bool has_compute_morton_capable;
+	bool has_compute_overlap;
+	bool has_coreid_per_os;
+	bool has_dynamic_dust_power;
+	bool has_ecc_rams;
+	bool has_fb_cdc_v4;
+	bool has_fbc_max_default_descriptors;
+	bool has_fbc_max_large_descriptors;
+	bool has_fbcdc;
+	bool has_fbcdc_algorithm;
+	bool has_fbcdc_architecture;
+	bool has_gpu_multicore_support;
+	bool has_gpu_virtualisation;
+	bool has_gs_rta_support;
+	bool has_irq_per_os;
+	bool has_isp_max_tiles_in_flight;
+	bool has_isp_samples_per_pixel;
+	bool has_isp_zls_d24_s8_packing_ogl_mode;
+	bool has_layout_mars;
+	bool has_max_partitions;
+	bool has_meta;
+	bool has_meta_coremem_size;
+	bool has_mips;
+	bool has_num_clusters;
+	bool has_num_isp_ipp_pipes;
+	bool has_num_osids;
+	bool has_num_raster_pipes;
+	bool has_pbe2_in_xe;
+	bool has_pbvnc_coreid_reg;
+	bool has_perfbus;
+	bool has_perf_counter_batch;
+	bool has_phys_bus_width;
+	bool has_riscv_fw_processor;
+	bool has_roguexe;
+	bool has_s7_top_infrastructure;
+	bool has_simple_internal_parameter_format;
+	bool has_simple_internal_parameter_format_v2;
+	bool has_simple_parameter_format_version;
+	bool has_slc_banks;
+	bool has_slc_cache_line_size_bits;
+	bool has_slc_size_configurable;
+	bool has_slc_size_in_kilobytes;
+	bool has_soc_timer;
+	bool has_sys_bus_secure_reset;
+	bool has_tessellation;
+	bool has_tile_region_protection;
+	bool has_tile_size_x;
+	bool has_tile_size_y;
+	bool has_tla;
+	bool has_tpu_cem_datamaster_global_registers;
+	bool has_tpu_dm_global_registers;
+	bool has_tpu_filtering_mode_control;
+	bool has_usc_min_output_registers_per_pix;
+	bool has_vdm_drawindirect;
+	bool has_vdm_object_level_lls;
+	bool has_virtual_address_space_bits;
+	bool has_watchdog_timer;
+	bool has_workgroup_protection;
+	bool has_xe_architecture;
+	bool has_xe_memory_hierarchy;
+	bool has_xe_tpu2;
+	bool has_xpu_max_regbanks_addr_width;
+	bool has_xpu_max_slaves;
+	bool has_xpu_register_broadcast;
+	bool has_xt_top_infrastructure;
+	bool has_zls_subtile;
+
+	u64 cdm_control_stream_format;
+	u64 common_store_size_in_dwords;
+	u64 ecc_rams;
+	u64 fbc_max_default_descriptors;
+	u64 fbc_max_large_descriptors;
+	u64 fbcdc;
+	u64 fbcdc_algorithm;
+	u64 fbcdc_architecture;
+	u64 isp_max_tiles_in_flight;
+	u64 isp_samples_per_pixel;
+	u64 layout_mars;
+	u64 max_partitions;
+	u64 meta;
+	u64 meta_coremem_size;
+	u64 num_clusters;
+	u64 num_isp_ipp_pipes;
+	u64 num_osids;
+	u64 num_raster_pipes;
+	u64 phys_bus_width;
+	u64 simple_parameter_format_version;
+	u64 slc_banks;
+	u64 slc_cache_line_size_bits;
+	u64 slc_size_in_kilobytes;
+	u64 tile_size_x;
+	u64 tile_size_y;
+	u64 usc_min_output_registers_per_pix;
+	u64 virtual_address_space_bits;
+	u64 xe_architecture;
+	u64 xpu_max_regbanks_addr_width;
+	u64 xpu_max_slaves;
+	u64 xpu_register_broadcast;
+};
+
+/*
+ * struct pvr_device_quirks - Hardware quirk information
+ */
+struct pvr_device_quirks {
+	bool has_brn44079;
+	bool has_brn47217;
+	bool has_brn48492;
+	bool has_brn48545;
+	bool has_brn49927;
+	bool has_brn50767;
+	bool has_brn51764;
+	bool has_brn62269;
+	bool has_brn63142;
+	bool has_brn63553;
+	bool has_brn66011;
+	bool has_brn71242;
+};
+
+/*
+ * struct pvr_device_enhancements - Hardware enhancement information
+ */
+struct pvr_device_enhancements {
+	bool has_ern35421;
+	bool has_ern38020;
+	bool has_ern38748;
+	bool has_ern42064;
+	bool has_ern42290;
+	bool has_ern42606;
+	bool has_ern47025;
+	bool has_ern57596;
+};
+
+void pvr_device_info_set_quirks(struct pvr_device *pvr_dev, const u64 *bitmask,
+				u32 bitmask_len);
+void pvr_device_info_set_enhancements(struct pvr_device *pvr_dev, const u64 *bitmask,
+				      u32 bitmask_len);
+int pvr_device_info_set_features(struct pvr_device *pvr_dev, const u64 *features, u32 features_size,
+				 u32 feature_param_size);
+
+/*
+ * Meta cores
+ *
+ * These are the values for the 'meta' feature when the feature is present
+ * (as per &struct pvr_device_features)/
+ */
+#define PVR_META_MTP218 (1)
+#define PVR_META_MTP219 (2)
+#define PVR_META_LTP218 (3)
+#define PVR_META_LTP217 (4)
+
+enum {
+	PVR_FEATURE_CDM_USER_MODE_QUEUE,
+	PVR_FEATURE_CLUSTER_GROUPING,
+	PVR_FEATURE_COMPUTE_MORTON_CAPABLE,
+	PVR_FEATURE_FB_CDC_V4,
+	PVR_FEATURE_GPU_MULTICORE_SUPPORT,
+	PVR_FEATURE_ISP_ZLS_D24_S8_PACKING_OGL_MODE,
+	PVR_FEATURE_REQUIRES_FB_CDC_ZLS_SETUP,
+	PVR_FEATURE_S7_TOP_INFRASTRUCTURE,
+	PVR_FEATURE_TESSELLATION,
+	PVR_FEATURE_TPU_DM_GLOBAL_REGISTERS,
+	PVR_FEATURE_VDM_DRAWINDIRECT,
+	PVR_FEATURE_VDM_OBJECT_LEVEL_LLS,
+	PVR_FEATURE_ZLS_SUBTILE,
+};
+
+#endif /* PVR_DEVICE_INFO_H */
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 597188b31f96..1e4408f33e94 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -3,6 +3,9 @@
 
 #include "pvr_device.h"
 #include "pvr_drv.h"
+#include "pvr_rogue_defs.h"
+#include "pvr_rogue_fwif_client.h"
+#include "pvr_rogue_fwif_shared.h"
 
 #include <uapi/drm/pvr_drm.h>
 
@@ -87,6 +90,382 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_dev, void *raw_args,
 	return -ENOTTY;
 }
 
+static __always_inline u64
+pvr_fw_version_packed(u32 major, u32 minor)
+{
+	return ((u64)major << 32) | minor;
+}
+
+static u32
+rogue_get_common_store_partition_space_size(struct pvr_device *pvr_dev)
+{
+	u32 max_partitions = 0;
+	u32 tile_size_x = 0;
+	u32 tile_size_y = 0;
+
+	PVR_FEATURE_VALUE(pvr_dev, tile_size_x, &tile_size_x);
+	PVR_FEATURE_VALUE(pvr_dev, tile_size_y, &tile_size_y);
+	PVR_FEATURE_VALUE(pvr_dev, max_partitions, &max_partitions);
+
+	if (tile_size_x == 16 && tile_size_y == 16) {
+		u32 usc_min_output_registers_per_pix = 0;
+
+		PVR_FEATURE_VALUE(pvr_dev, usc_min_output_registers_per_pix,
+				  &usc_min_output_registers_per_pix);
+
+		return tile_size_x * tile_size_y * max_partitions *
+		       usc_min_output_registers_per_pix;
+	}
+
+	return max_partitions * 1024;
+}
+
+static u32
+rogue_get_common_store_alloc_region_size(struct pvr_device *pvr_dev)
+{
+	u32 common_store_size_in_dwords = 512 * 4 * 4;
+	u32 alloc_region_size;
+
+	PVR_FEATURE_VALUE(pvr_dev, common_store_size_in_dwords, &common_store_size_in_dwords);
+
+	alloc_region_size = common_store_size_in_dwords - (256U * 4U) -
+			    rogue_get_common_store_partition_space_size(pvr_dev);
+
+	if (PVR_HAS_QUIRK(pvr_dev, 44079)) {
+		u32 common_store_split_point = (768U * 4U * 4U);
+
+		return min(common_store_split_point - (256U * 4U), alloc_region_size);
+	}
+
+	return alloc_region_size;
+}
+
+static inline u32
+rogue_get_num_phantoms(struct pvr_device *pvr_dev)
+{
+	u32 num_clusters = 1;
+
+	PVR_FEATURE_VALUE(pvr_dev, num_clusters, &num_clusters);
+
+	return ROGUE_REQ_NUM_PHANTOMS(num_clusters);
+}
+
+static inline u32
+rogue_get_max_coeffs(struct pvr_device *pvr_dev)
+{
+	u32 max_coeff_additional_portion = ROGUE_MAX_VERTEX_SHARED_REGISTERS;
+	u32 pending_allocation_shared_regs = 2U * 1024U;
+	u32 pending_allocation_coeff_regs = 0U;
+	u32 num_phantoms = rogue_get_num_phantoms(pvr_dev);
+	u32 tiles_in_flight = 0;
+	u32 max_coeff_pixel_portion;
+
+	PVR_FEATURE_VALUE(pvr_dev, isp_max_tiles_in_flight, &tiles_in_flight);
+	max_coeff_pixel_portion = DIV_ROUND_UP(tiles_in_flight, num_phantoms);
+	max_coeff_pixel_portion *= ROGUE_MAX_PIXEL_SHARED_REGISTERS;
+
+	/*
+	 * Compute tasks on cores with BRN48492 and without compute overlap may lock
+	 * up without two additional lines of coeffs.
+	 */
+	if (PVR_HAS_QUIRK(pvr_dev, 48492) && !PVR_HAS_FEATURE(pvr_dev, compute_overlap))
+		pending_allocation_coeff_regs = 2U * 1024U;
+
+	if (PVR_HAS_ENHANCEMENT(pvr_dev, 38748))
+		pending_allocation_shared_regs = 0;
+
+	if (PVR_HAS_ENHANCEMENT(pvr_dev, 38020))
+		max_coeff_additional_portion += ROGUE_MAX_COMPUTE_SHARED_REGISTERS;
+
+	return rogue_get_common_store_alloc_region_size(pvr_dev) + pending_allocation_coeff_regs -
+		(max_coeff_pixel_portion + max_coeff_additional_portion +
+		 pending_allocation_shared_regs);
+}
+
+static inline u32
+rogue_get_cdm_max_local_mem_size_regs(struct pvr_device *pvr_dev)
+{
+	u32 available_coeffs_in_dwords = rogue_get_max_coeffs(pvr_dev);
+
+	if (PVR_HAS_QUIRK(pvr_dev, 48492) && PVR_HAS_FEATURE(pvr_dev, roguexe) &&
+	    !PVR_HAS_FEATURE(pvr_dev, compute_overlap)) {
+		/* Driver must not use the 2 reserved lines. */
+		available_coeffs_in_dwords -= ROGUE_CSRM_LINE_SIZE_IN_DWORDS * 2;
+	}
+
+	/*
+	 * The maximum amount of local memory available to a kernel is the minimum
+	 * of the total number of coefficient registers available and the max common
+	 * store allocation size which can be made by the CDM.
+	 *
+	 * If any coeff lines are reserved for tessellation or pixel then we need to
+	 * subtract those too.
+	 */
+	return min(available_coeffs_in_dwords, (u32)ROGUE_MAX_PER_KERNEL_LOCAL_MEM_SIZE_REGS);
+}
+
+/**
+ * pvr_dev_query_gpu_info_get()
+ * @pvr_dev: Device pointer.
+ * @args: [IN] Device query arguments containing a pointer to a userspace
+ *        struct drm_pvr_dev_query_gpu_info.
+ *
+ * If the query object pointer is NULL, the size field is updated with the
+ * expected size of the query object.
+ *
+ * Returns:
+ *  * 0 on success, or if size is requested using a NULL pointer, or
+ *  * -%E2BIG if the indicated length of the allocation is less than is
+ *    required to contain the copied data, or
+ *  * -%EFAULT if local memory could not be copied to userspace.
+ */
+static int
+pvr_dev_query_gpu_info_get(struct pvr_device *pvr_dev,
+			   struct drm_pvr_ioctl_dev_query_args *args)
+{
+	struct drm_pvr_dev_query_gpu_info gpu_info = {0};
+	int err;
+
+	if (!args->pointer) {
+		args->size = sizeof(struct drm_pvr_dev_query_gpu_info);
+		return 0;
+	}
+
+	gpu_info.gpu_id =
+		pvr_gpu_id_to_packed_bvnc(&pvr_dev->gpu_id);
+	gpu_info.num_phantoms = rogue_get_num_phantoms(pvr_dev);
+
+	err = PVR_UOBJ_SET(args->pointer, args->size, gpu_info);
+	if (err < 0)
+		return err;
+
+	if (args->size > sizeof(gpu_info))
+		args->size = sizeof(gpu_info);
+	return 0;
+}
+
+/**
+ * pvr_dev_query_runtime_info_get()
+ * @pvr_dev: Device pointer.
+ * @args: [IN] Device query arguments containing a pointer to a userspace
+ *        struct drm_pvr_dev_query_runtime_info.
+ *
+ * If the query object pointer is NULL, the size field is updated with the
+ * expected size of the query object.
+ *
+ * Returns:
+ *  * 0 on success, or if size is requested using a NULL pointer, or
+ *  * -%E2BIG if the indicated length of the allocation is less than is
+ *    required to contain the copied data, or
+ *  * -%EFAULT if local memory could not be copied to userspace.
+ */
+static int
+pvr_dev_query_runtime_info_get(struct pvr_device *pvr_dev,
+			       struct drm_pvr_ioctl_dev_query_args *args)
+{
+	struct drm_pvr_dev_query_runtime_info runtime_info = {0};
+	int err;
+
+	if (!args->pointer) {
+		args->size = sizeof(struct drm_pvr_dev_query_runtime_info);
+		return 0;
+	}
+
+	runtime_info.free_list_min_pages = 0; /* FIXME */
+	runtime_info.free_list_max_pages =
+		ROGUE_PM_MAX_FREELIST_SIZE / ROGUE_PM_PAGE_SIZE;
+	runtime_info.common_store_alloc_region_size =
+		rogue_get_common_store_alloc_region_size(pvr_dev);
+	runtime_info.common_store_partition_space_size =
+		rogue_get_common_store_partition_space_size(pvr_dev);
+	runtime_info.max_coeffs = rogue_get_max_coeffs(pvr_dev);
+	runtime_info.cdm_max_local_mem_size_regs =
+		rogue_get_cdm_max_local_mem_size_regs(pvr_dev);
+
+	err = PVR_UOBJ_SET(args->pointer, args->size, runtime_info);
+	if (err < 0)
+		return err;
+
+	if (args->size > sizeof(runtime_info))
+		args->size = sizeof(runtime_info);
+	return 0;
+}
+
+/**
+ * pvr_dev_query_quirks_get() - Unpack array of quirks at the address given
+ * in a struct drm_pvr_dev_query_quirks, or gets the amount of space required
+ * for it.
+ * @pvr_dev: Device pointer.
+ * @args: [IN] Device query arguments containing a pointer to a userspace
+ *        struct drm_pvr_dev_query_query_quirks.
+ *
+ * If the query object pointer is NULL, the size field is updated with the
+ * expected size of the query object.
+ * If the userspace pointer in the query object is NULL, or the count is
+ * short, no data is copied.
+ * The count field will be updated to that copied, or if either pointer is
+ * NULL, that which would have been copied.
+ * The size field in the query object will be updated to the size copied.
+ *
+ * Returns:
+ *  * 0 on success, or if size/count is requested using a NULL pointer, or
+ *  * -%EINVAL if args contained non-zero reserved fields, or
+ *  * -%E2BIG if the indicated length of the allocation is less than is
+ *    required to contain the copied data, or
+ *  * -%EFAULT if local memory could not be copied to userspace.
+ */
+static int
+pvr_dev_query_quirks_get(struct pvr_device *pvr_dev,
+			 struct drm_pvr_ioctl_dev_query_args *args)
+{
+	/*
+	 * @FIXME - hardcoding of numbers here is intended as an
+	 * intermediate step so the UAPI can be fixed, but requires a
+	 * a refactor in the future to store them in a more appropriate
+	 * location
+	 */
+	static const u32 umd_quirks_musthave[] = {
+		47217,
+		49927,
+		62269,
+	};
+	static const u32 umd_quirks[] = {
+		48545,
+		51764,
+	};
+	struct drm_pvr_dev_query_quirks query;
+	u32 out[ARRAY_SIZE(umd_quirks_musthave) + ARRAY_SIZE(umd_quirks)];
+	size_t out_musthave_count = 0;
+	size_t out_count = 0;
+	int err;
+
+	if (!args->pointer) {
+		args->size = sizeof(struct drm_pvr_dev_query_quirks);
+		return 0;
+	}
+
+	err = PVR_UOBJ_GET(query, args->size, args->pointer);
+
+	if (err < 0)
+		return err;
+	if (query._padding_c)
+		return -EINVAL;
+
+	for (int i = 0; i < ARRAY_SIZE(umd_quirks_musthave); i++) {
+		if (pvr_device_has_uapi_quirk(pvr_dev, umd_quirks_musthave[i])) {
+			out[out_count++] = umd_quirks_musthave[i];
+			out_musthave_count++;
+		}
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(umd_quirks); i++) {
+		if (pvr_device_has_uapi_quirk(pvr_dev, umd_quirks[i]))
+			out[out_count++] = umd_quirks[i];
+	}
+
+	if (!query.quirks)
+		goto copy_out;
+	if (query.count < out_count)
+		return -E2BIG;
+
+	if (copy_to_user(u64_to_user_ptr(query.quirks), out,
+			 out_count * sizeof(u32))) {
+		return -EFAULT;
+	}
+
+	query.musthave_count = out_musthave_count;
+
+copy_out:
+	query.count = out_count;
+	err = PVR_UOBJ_SET(args->pointer, args->size, query);
+	if (err < 0)
+		return err;
+
+	args->size = sizeof(query);
+	return 0;
+}
+
+/**
+ * pvr_dev_query_enhancements_get() - Unpack array of enhancements at the
+ * address given in a struct drm_pvr_dev_query_enhancements, or gets the amount
+ * of space required for it.
+ * @pvr_dev: Device pointer.
+ * @args: [IN] Device query arguments containing a pointer to a userspace
+ *        struct drm_pvr_dev_query_enhancements.
+ *
+ * If the query object pointer is NULL, the size field is updated with the
+ * expected size of the query object.
+ * If the userspace pointer in the query object is NULL, or the count is
+ * short, no data is copied.
+ * The count field will be updated to that copied, or if either pointer is
+ * NULL, that which would have been copied.
+ * The size field in the query object will be updated to the size copied.
+ *
+ * Returns:
+ *  * 0 on success, or if size/count is requested using a NULL pointer, or
+ *  * -%EINVAL if args contained non-zero reserved fields, or
+ *  * -%E2BIG if the indicated length of the allocation is less than is
+ *    required to contain the copied data, or
+ *  * -%EFAULT if local memory could not be copied to userspace.
+ */
+static int
+pvr_dev_query_enhancements_get(struct pvr_device *pvr_dev,
+			       struct drm_pvr_ioctl_dev_query_args *args)
+{
+	/*
+	 * @FIXME - hardcoding of numbers here is intended as an
+	 * intermediate step so the UAPI can be fixed, but requires a
+	 * a refactor in the future to store them in a more appropriate
+	 * location
+	 */
+	const u32 umd_enhancements[] = {
+		35421,
+		42064,
+	};
+	struct drm_pvr_dev_query_enhancements query;
+	u32 out[ARRAY_SIZE(umd_enhancements)];
+	size_t out_idx = 0;
+	int err;
+
+	if (!args->pointer) {
+		args->size = sizeof(struct drm_pvr_dev_query_enhancements);
+		return 0;
+	}
+
+	err = PVR_UOBJ_GET(query, args->size, args->pointer);
+
+	if (err < 0)
+		return err;
+	if (query._padding_a)
+		return -EINVAL;
+	if (query._padding_c)
+		return -EINVAL;
+
+	for (int i = 0; i < ARRAY_SIZE(umd_enhancements); i++) {
+		if (pvr_device_has_uapi_enhancement(pvr_dev, umd_enhancements[i]))
+			out[out_idx++] = umd_enhancements[i];
+	}
+
+	if (!query.enhancements)
+		goto copy_out;
+	if (query.count < out_idx)
+		return -E2BIG;
+
+	if (copy_to_user(u64_to_user_ptr(query.enhancements), out,
+			 out_idx * sizeof(u32))) {
+		return -EFAULT;
+	}
+
+copy_out:
+	query.count = out_idx;
+	err = PVR_UOBJ_SET(args->pointer, args->size, query);
+	if (err < 0)
+		return err;
+
+	args->size = sizeof(query);
+	return 0;
+}
+
 /**
  * pvr_ioctl_dev_query() - IOCTL to copy information about a device
  * @drm_dev: [IN] DRM device.
@@ -111,7 +490,41 @@ static int
 pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
 		    struct drm_file *file)
 {
-	return -ENOTTY;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct drm_pvr_ioctl_dev_query_args *args = raw_args;
+	int idx;
+	int ret = -EINVAL;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	switch ((enum drm_pvr_dev_query)args->type) {
+	case DRM_PVR_DEV_QUERY_GPU_INFO_GET:
+		ret = pvr_dev_query_gpu_info_get(pvr_dev, args);
+		break;
+
+	case DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET:
+		ret = pvr_dev_query_runtime_info_get(pvr_dev, args);
+		break;
+
+	case DRM_PVR_DEV_QUERY_QUIRKS_GET:
+		ret = pvr_dev_query_quirks_get(pvr_dev, args);
+		break;
+
+	case DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET:
+		ret = pvr_dev_query_enhancements_get(pvr_dev, args);
+		break;
+
+	case DRM_PVR_DEV_QUERY_HEAP_INFO_GET:
+		return -EINVAL;
+
+	case DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET:
+		return -EINVAL;
+	}
+
+	drm_dev_exit(idx);
+
+	return ret;
 }
 
 /**
@@ -349,6 +762,112 @@ pvr_ioctl_submit_jobs(struct drm_device *drm_dev, void *raw_args,
 	return -ENOTTY;
 }
 
+int
+pvr_get_uobj(u64 usr_ptr, u32 usr_stride, u32 min_stride, u32 obj_size, void *out)
+{
+	if (usr_stride < min_stride)
+		return -EINVAL;
+
+	return copy_struct_from_user(out, obj_size, u64_to_user_ptr(usr_ptr), usr_stride);
+}
+
+int
+pvr_set_uobj(u64 usr_ptr, u32 usr_stride, u32 min_stride, u32 obj_size, const void *in)
+{
+	if (usr_stride < min_stride)
+		return -EINVAL;
+
+	if (copy_to_user(u64_to_user_ptr(usr_ptr), in, min_t(u32, usr_stride, obj_size)))
+		return -EFAULT;
+
+	if (usr_stride > obj_size &&
+	    clear_user(u64_to_user_ptr(usr_ptr + obj_size), usr_stride - obj_size)) {
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+int
+pvr_get_uobj_array(const struct drm_pvr_obj_array *in, u32 min_stride, u32 obj_size, void **out)
+{
+	int ret = 0;
+	void *out_alloc;
+
+	if (in->stride < min_stride)
+		return -EINVAL;
+
+	if (!in->count)
+		return 0;
+
+	out_alloc = kvmalloc_array(in->count, obj_size, GFP_KERNEL);
+	if (!out_alloc)
+		return -ENOMEM;
+
+	if (obj_size == in->stride) {
+		if (copy_from_user(out_alloc, u64_to_user_ptr(in->array),
+				   (unsigned long)obj_size * in->count))
+			ret = -EFAULT;
+	} else {
+		void __user *in_ptr = u64_to_user_ptr(in->array);
+		void *out_ptr = out_alloc;
+
+		for (u32 i = 0; i < in->count; i++) {
+			ret = copy_struct_from_user(out_ptr, obj_size, in_ptr, in->stride);
+			if (ret)
+				break;
+
+			out_ptr += obj_size;
+			in_ptr += in->stride;
+		}
+	}
+
+	if (ret) {
+		kvfree(out_alloc);
+		return ret;
+	}
+
+	*out = out_alloc;
+	return 0;
+}
+
+int
+pvr_set_uobj_array(const struct drm_pvr_obj_array *out, u32 min_stride, u32 obj_size,
+		   const void *in)
+{
+	if (out->stride < min_stride)
+		return -EINVAL;
+
+	if (!out->count)
+		return 0;
+
+	if (obj_size == out->stride) {
+		if (copy_to_user(u64_to_user_ptr(out->array), in,
+				 (unsigned long)obj_size * out->count))
+			return -EFAULT;
+	} else {
+		u32 cpy_elem_size = min_t(u32, out->stride, obj_size);
+		void __user *out_ptr = u64_to_user_ptr(out->array);
+		const void *in_ptr = in;
+
+		for (u32 i = 0; i < out->count; i++) {
+			if (copy_to_user(out_ptr, in_ptr, cpy_elem_size))
+				return -EFAULT;
+
+			out_ptr += obj_size;
+			in_ptr += out->stride;
+		}
+
+		if (out->stride > obj_size &&
+		    clear_user(u64_to_user_ptr(out->array + obj_size),
+			       out->stride - obj_size)) {
+			return -EFAULT;
+		}
+	}
+
+	return 0;
+}
+
 #define DRM_PVR_IOCTL(_name, _func, _flags) \
 	DRM_IOCTL_DEF_DRV(PVR_##_name, pvr_ioctl_##_func, _flags)
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imagination/pvr_drv.h
index c29d11af88fe..378fe477b759 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.h
+++ b/drivers/gpu/drm/imagination/pvr_drv.h
@@ -19,4 +19,111 @@
 #define PVR_DRIVER_MINOR 0
 #define PVR_DRIVER_PATCHLEVEL 0
 
+int pvr_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 obj_size, void *out);
+int pvr_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 obj_size, const void *in);
+int pvr_get_uobj_array(const struct drm_pvr_obj_array *in, u32 min_stride, u32 obj_size,
+		       void **out);
+int pvr_set_uobj_array(const struct drm_pvr_obj_array *out, u32 min_stride, u32 obj_size,
+		       const void *in);
+
+#define PVR_UOBJ_MIN_SIZE_INTERNAL(_typename, _last_mandatory_field) \
+	(offsetof(_typename, _last_mandatory_field) + \
+	 sizeof(((_typename *)NULL)->_last_mandatory_field))
+
+/* NOLINTBEGIN(bugprone-macro-parentheses) */
+#define PVR_UOBJ_DECL(_typename, _last_mandatory_field) \
+	, _typename : PVR_UOBJ_MIN_SIZE_INTERNAL(_typename, _last_mandatory_field)
+/* NOLINTEND(bugprone-macro-parentheses) */
+
+/**
+ * DOC: PVR user objects.
+ *
+ * Macros used to aid copying structured and array data to and from
+ * userspace. Objects can differ in size, provided the minimum size
+ * allowed is specified (using the last mandatory field in the struct).
+ * All types used with PVR_UOBJ_GET/SET macros must be listed here under
+ * PVR_UOBJ_MIN_SIZE, with the last mandatory struct field specified.
+ */
+
+/**
+ * PVR_UOBJ_MIN_SIZE() - Fetch the minimum copy size of a compatible type object.
+ * @_obj_name: The name of the object. Cannot be a typename - this is deduced.
+ *
+ * This cannot fail. Using the macro with an incompatible type will result in a
+ * compiler error.
+ *
+ * To add compatibility for a type, list it within the macro in an orderly
+ * fashion. The second argument is the name of the last mandatory field of the
+ * struct type, which is used to calculate the size. See also PVR_UOBJ_DECL().
+ *
+ * Return: The minimum copy size.
+ */
+#define PVR_UOBJ_MIN_SIZE(_obj_name) _Generic(_obj_name \
+	PVR_UOBJ_DECL(struct drm_pvr_job, hwrt) \
+	PVR_UOBJ_DECL(struct drm_pvr_sync_op, value) \
+	PVR_UOBJ_DECL(struct drm_pvr_dev_query_gpu_info, num_phantoms) \
+	PVR_UOBJ_DECL(struct drm_pvr_dev_query_runtime_info, cdm_max_local_mem_size_regs) \
+	PVR_UOBJ_DECL(struct drm_pvr_dev_query_quirks, _padding_c) \
+	PVR_UOBJ_DECL(struct drm_pvr_dev_query_enhancements, _padding_c) \
+	PVR_UOBJ_DECL(struct drm_pvr_heap, page_size_log2) \
+	PVR_UOBJ_DECL(struct drm_pvr_dev_query_heap_info, heaps) \
+	PVR_UOBJ_DECL(struct drm_pvr_static_data_area, offset) \
+	PVR_UOBJ_DECL(struct drm_pvr_dev_query_static_data_areas, static_data_areas) \
+	)
+
+/**
+ * PVR_UOBJ_GET() - Copies from _src_usr_ptr to &_dest_obj.
+ * @_dest_obj: The destination container object in kernel space.
+ * @_usr_size: The size of the source container in user space.
+ * @_src_usr_ptr: __u64 raw pointer to the source container in user space.
+ *
+ * Return: Error code. See pvr_get_uobj().
+ */
+#define PVR_UOBJ_GET(_dest_obj, _usr_size, _src_usr_ptr) \
+	pvr_get_uobj(_src_usr_ptr, _usr_size, \
+		     PVR_UOBJ_MIN_SIZE(_dest_obj), \
+		     sizeof(_dest_obj), &(_dest_obj))
+
+/**
+ * PVR_UOBJ_SET() - Copies from &_src_obj to _dest_usr_ptr.
+ * @_dest_usr_ptr: __u64 raw pointer to the destination container in user space.
+ * @_usr_size: The size of the destination container in user space.
+ * @_src_obj: The source container object in kernel space.
+ *
+ * Return: Error code. See pvr_set_uobj().
+ */
+#define PVR_UOBJ_SET(_dest_usr_ptr, _usr_size, _src_obj) \
+	pvr_set_uobj(_dest_usr_ptr, _usr_size, \
+		     PVR_UOBJ_MIN_SIZE(_src_obj), \
+		     sizeof(_src_obj), &(_src_obj))
+
+/**
+ * PVR_UOBJ_GET_ARRAY() - Copies from @_src_drm_pvr_obj_array.array to
+ * alloced memory and returns a pointer in _dest_array.
+ * @_dest_array: The destination C array object in kernel space.
+ * @_src_drm_pvr_obj_array: The &struct drm_pvr_obj_array containing a __u64 raw
+ * pointer to the source C array in user space and the size of each array
+ * element in user space (the 'stride').
+ *
+ * Return: Error code. See pvr_get_uobj_array().
+ */
+#define PVR_UOBJ_GET_ARRAY(_dest_array, _src_drm_pvr_obj_array) \
+	pvr_get_uobj_array(_src_drm_pvr_obj_array, \
+			   PVR_UOBJ_MIN_SIZE((_dest_array)[0]), \
+			   sizeof((_dest_array)[0]), (void **)&(_dest_array))
+
+/**
+ * PVR_UOBJ_SET_ARRAY() - Copies from _src_array to @_dest_drm_pvr_obj_array.array.
+ * @_dest_drm_pvr_obj_array: The &struct drm_pvr_obj_array containing a __u64 raw
+ * pointer to the destination C array in user space and the size of each array
+ * element in user space (the 'stride').
+ * @_src_array: The source C array object in kernel space.
+ *
+ * Return: Error code. See pvr_set_uobj_array().
+ */
+#define PVR_UOBJ_SET_ARRAY(_dest_drm_pvr_obj_array, _src_array) \
+	pvr_set_uobj_array(_dest_drm_pvr_obj_array, \
+			   PVR_UOBJ_MIN_SIZE((_src_array)[0]), \
+			   sizeof((_src_array)[0]), _src_array)
+
 #endif /* PVR_DRV_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
new file mode 100644
index 000000000000..a9377c735c9c
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_device_info.h"
+#include "pvr_fw.h"
+
+#include <drm/drm_drv.h>
+#include <linux/firmware.h>
+#include <linux/sizes.h>
+
+#define FW_MAX_SUPPORTED_MAJOR_VERSION 1
+
+/**
+ * pvr_fw_validate() - Parse firmware header and check compatibility
+ * @pvr_dev: Device pointer.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -EINVAL if firmware is incompatible.
+ */
+static int
+pvr_fw_validate(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	const struct firmware *firmware = pvr_dev->fw_dev.firmware;
+	const struct pvr_fw_layout_entry *layout_entries;
+	const struct pvr_fw_info_header *header;
+	const u8 *fw = firmware->data;
+	u32 fw_offset = firmware->size - SZ_4K;
+	u32 layout_table_size;
+	u32 entry;
+
+	if (firmware->size < SZ_4K || (firmware->size % FW_BLOCK_SIZE))
+		return -EINVAL;
+
+	header = (const struct pvr_fw_info_header *)&fw[fw_offset];
+
+	if (header->info_version != PVR_FW_INFO_VERSION) {
+		drm_err(drm_dev, "Unsupported fw info version %u\n",
+			header->info_version);
+		return -EINVAL;
+	}
+
+	if (header->header_len != sizeof(struct pvr_fw_info_header) ||
+	    header->layout_entry_size != sizeof(struct pvr_fw_layout_entry) ||
+	    header->layout_entry_num > PVR_FW_INFO_MAX_NUM_ENTRIES) {
+		drm_err(drm_dev, "FW info format mismatch\n");
+		return -EINVAL;
+	}
+
+	if (!(header->flags & PVR_FW_FLAGS_OPEN_SOURCE) ||
+	    header->fw_version_major > FW_MAX_SUPPORTED_MAJOR_VERSION ||
+	    header->fw_version_major == 0) {
+		drm_err(drm_dev, "Unsupported FW version %u.%u (build: %u%s)\n",
+			header->fw_version_major, header->fw_version_minor,
+			header->fw_version_build,
+			(header->flags & PVR_FW_FLAGS_OPEN_SOURCE) ? " OS" : "");
+		return -EINVAL;
+	}
+
+	if (pvr_gpu_id_to_packed_bvnc(&pvr_dev->gpu_id) != header->bvnc) {
+		struct pvr_gpu_id fw_gpu_id;
+
+		packed_bvnc_to_pvr_gpu_id(header->bvnc, &fw_gpu_id);
+		drm_err(drm_dev, "FW built for incorrect GPU ID %i.%i.%i.%i (expected %i.%i.%i.%i)\n",
+			fw_gpu_id.b, fw_gpu_id.v, fw_gpu_id.n, fw_gpu_id.c,
+			pvr_dev->gpu_id.b, pvr_dev->gpu_id.v, pvr_dev->gpu_id.n, pvr_dev->gpu_id.c);
+		return -EINVAL;
+	}
+
+	fw_offset += header->header_len;
+	layout_table_size =
+		header->layout_entry_size * header->layout_entry_num;
+	if ((fw_offset + layout_table_size) > firmware->size)
+		return -EINVAL;
+
+	layout_entries = (const struct pvr_fw_layout_entry *)&fw[fw_offset];
+	for (entry = 0; entry < header->layout_entry_num; entry++) {
+		u32 start_addr = layout_entries[entry].base_addr;
+		u32 end_addr = start_addr + layout_entries[entry].alloc_size;
+
+		if (start_addr >= end_addr)
+			return -EINVAL;
+	}
+
+	fw_offset = (firmware->size - SZ_4K) - header->device_info_size;
+
+	drm_info(drm_dev, "FW version v%u.%u (build %u OS)\n", header->fw_version_major,
+		 header->fw_version_minor, header->fw_version_build);
+
+	pvr_dev->fw_version.major = header->fw_version_major;
+	pvr_dev->fw_version.minor = header->fw_version_minor;
+
+	pvr_dev->fw_dev.header = header;
+	pvr_dev->fw_dev.layout_entries = layout_entries;
+
+	return 0;
+}
+
+static int
+pvr_fw_get_device_info(struct pvr_device *pvr_dev)
+{
+	const struct firmware *firmware = pvr_dev->fw_dev.firmware;
+	struct pvr_fw_device_info_header *header;
+	const u8 *fw = firmware->data;
+	const u64 *dev_info;
+	u32 fw_offset;
+
+	fw_offset = (firmware->size - SZ_4K) - pvr_dev->fw_dev.header->device_info_size;
+
+	header = (struct pvr_fw_device_info_header *)&fw[fw_offset];
+	dev_info = (u64 *)(header + 1);
+
+	pvr_device_info_set_quirks(pvr_dev, dev_info, header->brn_mask_size);
+	dev_info += header->brn_mask_size;
+
+	pvr_device_info_set_enhancements(pvr_dev, dev_info, header->ern_mask_size);
+	dev_info += header->ern_mask_size;
+
+	return pvr_device_info_set_features(pvr_dev, dev_info, header->feature_mask_size,
+					    header->feature_param_size);
+}
+
+/**
+ * pvr_fw_validate_init_device_info() - Validate firmware and initialise device information
+ * @pvr_dev: Target PowerVR device.
+ *
+ * This function must be called before querying device information.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if firmware validation fails.
+ */
+int
+pvr_fw_validate_init_device_info(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	err = pvr_fw_validate(pvr_dev);
+	if (err)
+		return err;
+
+	return pvr_fw_get_device_info(pvr_dev);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
new file mode 100644
index 000000000000..8331344e83ea
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_H
+#define PVR_FW_H
+
+#include "pvr_fw_info.h"
+
+#include <linux/types.h>
+
+/* Forward declarations from "pvr_device.h". */
+struct pvr_device;
+struct pvr_file;
+
+struct pvr_fw_device {
+	/** @firmware: Handle to the firmware loaded into the device. */
+	const struct firmware *firmware;
+
+	/** @header: Pointer to firmware header. */
+	const struct pvr_fw_info_header *header;
+
+	/** @layout_entries: Pointer to firmware layout. */
+	const struct pvr_fw_layout_entry *layout_entries;
+
+	/**
+	 * @processor_type: FW processor type for this device. Must be one of
+	 *                  %PVR_FW_PROCESSOR_TYPE_*.
+	 */
+	u16 processor_type;
+};
+
+int pvr_fw_validate_init_device_info(struct pvr_device *pvr_dev);
+
+#endif /* PVR_FW_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_info.h b/drivers/gpu/drm/imagination/pvr_fw_info.h
new file mode 100644
index 000000000000..ad5d44a3067a
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_info.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_INFO_H
+#define PVR_FW_INFO_H
+
+#include <linux/bits.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+/*
+ * Firmware binary block unit in bytes.
+ * Raw data stored in FW binary will be aligned to this size.
+ */
+#define FW_BLOCK_SIZE SZ_4K
+
+/* Maximum number of entries in firmware layout table. */
+#define PVR_FW_INFO_MAX_NUM_ENTRIES 8
+
+enum pvr_fw_section_id {
+	META_CODE = 0,
+	META_PRIVATE_DATA,
+	META_COREMEM_CODE,
+	META_COREMEM_DATA,
+	MIPS_CODE,
+	MIPS_EXCEPTIONS_CODE,
+	MIPS_BOOT_CODE,
+	MIPS_PRIVATE_DATA,
+	MIPS_BOOT_DATA,
+	MIPS_STACK,
+	RISCV_UNCACHED_CODE,
+	RISCV_CACHED_CODE,
+	RISCV_PRIVATE_DATA,
+	RISCV_COREMEM_CODE,
+	RISCV_COREMEM_DATA,
+};
+
+enum pvr_fw_section_type {
+	NONE = 0,
+	FW_CODE,
+	FW_DATA,
+	FW_COREMEM_CODE,
+	FW_COREMEM_DATA,
+};
+
+/*
+ * FW binary format with FW info attached:
+ *
+ *          Contents        Offset
+ *     +-----------------+
+ *     |                 |    0
+ *     |                 |
+ *     | Original binary |
+ *     |      file       |
+ *     |   (.ldr/.elf)   |
+ *     |                 |
+ *     |                 |
+ *     +-----------------+
+ *     |   Device info   |  FILE_SIZE - 4K - device_info_size
+ *     +-----------------+
+ *     | FW info header  |  FILE_SIZE - 4K
+ *     +-----------------+
+ *     |                 |
+ *     | FW layout table |
+ *     |                 |
+ *     +-----------------+
+ *                          FILE_SIZE
+ */
+
+#define PVR_FW_INFO_VERSION 3
+
+#define PVR_FW_FLAGS_OPEN_SOURCE BIT(0)
+
+/** struct pvr_fw_info_header - Firmware header */
+struct pvr_fw_info_header {
+	/** @info_version: FW info header version. */
+	u32 info_version;
+	/** @header_len: Header length. */
+	u32 header_len;
+	/** @layout_entry_num: Number of entries in the layout table. */
+	u32 layout_entry_num;
+	/** @layout_entry_size: Size of an entry in the layout table. */
+	u32 layout_entry_size;
+	/** @bvnc: GPU ID supported by firmware. */
+	aligned_u64 bvnc;
+	/** @fw_page_size: Page size of processor on which firmware executes. */
+	u32 fw_page_size;
+	/** @flags: Compatibility flags. */
+	u32 flags;
+	/** @fw_version_major: Firmware major version number. */
+	u16 fw_version_major;
+	/** @fw_version_minor: Firmware minor version number. */
+	u16 fw_version_minor;
+	/** @fw_version_build: Firmware build number. */
+	u32 fw_version_build;
+	/** @device_info_size: Size of device info structure. */
+	u32 device_info_size;
+	/** @padding: Padding. */
+	u32 padding;
+};
+
+/**
+ * struct pvr_fw_layout_entry - Entry in firmware layout table, describing a
+ *                              section of the firmware image
+ */
+struct pvr_fw_layout_entry {
+	/** @id: Section ID. */
+	enum pvr_fw_section_id id;
+	/** @type: Section type. */
+	enum pvr_fw_section_type type;
+	/** @base_addr: Base address of section in FW address space. */
+	u32 base_addr;
+	/** @max_size: Maximum size of section, in bytes. */
+	u32 max_size;
+	/** @alloc_size: Allocation size of section, in bytes. */
+	u32 alloc_size;
+	/** @alloc_offset: Allocation offset of section. */
+	u32 alloc_offset;
+};
+
+/**
+ * struct pvr_fw_device_info_header - Device information header.
+ */
+struct pvr_fw_device_info_header {
+	/* BRN Mask size (in u64s). */
+	u64 brn_mask_size;
+	/* ERN Mask size (in u64s). */
+	u64 ern_mask_size;
+	/* Feature Mask size (in u64s). */
+	u64 feature_mask_size;
+	/* Feature Parameter size (in u64s). */
+	u64 feature_param_size;
+};
+
+#endif /* PVR_FW_INFO_H */
-- 
2.25.1


