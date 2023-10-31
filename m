Return-Path: <linux-doc+bounces-1452-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 503CA7DD021
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5669C1C20BCD
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 15:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4849C1DFFE;
	Tue, 31 Oct 2023 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="KdnkIDNG";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="hj87Bk70"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2011B1DFF2;
	Tue, 31 Oct 2023 15:14:39 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFFE1B4;
	Tue, 31 Oct 2023 08:14:20 -0700 (PDT)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VCJjRi013616;
	Tue, 31 Oct 2023 15:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	dk201812; bh=8dq+QqSmsjfeCnpEMqrdByS/vt5CIgsbRHg15g6fD34=; b=Kdn
	kIDNGzeJnjNOSvVPhb9W9i5P31s94GqHBCMarfssRk/3HZO+7QgO7Kt2UdSPvwpG
	RoJiow1Euds+r1QONrD8Ff6o5Pz9myf6GreR7DynXt9KE1xbyJNtYzS6Uy0e8En+
	Z/wtOg6Ta/yKME+jceg+KDvVLmo2mlCWaKep8YFMFY6SAAvaXWfC64c+Ra5B3vP8
	lnrXGEFUrgbeD6FUI0mGSR5tq8Dm3yOIm/NpPmwUX+HhXwdz6i9R8B27ELc2L5A/
	mD/jnn98vmsAY1xtWZSM8URpvBK0okG/ofmvkMTi2qUqSBSESSLxdHuUG4rDHYCK
	L4ewPrZt2yKZTmC6m9g==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf42-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Oct 2023 15:13:32 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:28 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiSrhKobcnq+CRctqMZ5TWlsmZRb3oJJr1RZqhk6WXhQjBiV2/cbj58VXAAAyQs3Bn6tvDrhBw6ZfQpoYawnzpXrF6XQpUr1JZT5vDPeyRqrAGVhu6ZtuZqek7lT+DWJ4xFUwEeutRR9o50RGN2aK3P9ZP9QY3b36dn0489PdPe8C5AgSTbnjBKoliQ/jujjmdKHfwqSmEAJf/qOSJKDNXBgIlZkEH8zv/xYvPD6O0bIokbvtDAWXLIvIIFlh0MTip/AMHA4BauvxaGO9TXRKGDQdx1uWSOMrxiagRY9ZfXCgf2CJK3WVWO2AEHpHd7AHMESl4HJNTwjNzWEikDOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dq+QqSmsjfeCnpEMqrdByS/vt5CIgsbRHg15g6fD34=;
 b=drPttxayyobCZfwfbWvMkicJ9EzkmWLQcMOA1K5UyRic+7tww1eIPHnIPKquz0qANmzH8XBz1/w92xlYVF3pDGB3s3eBzLgomVBj5S5Kd3iKu1jCQESzGP2F51HIAt8yCGjMgKnG6EMQB061e7GxuZUlpeZpAJLUouvXkbxNNpXhx6HIqOIrudNTA0LAbnrJNoGj86Sm4rTkTF42uCvVSAEsjz+2UDDFjbzBxGHnVedxIstn6xzXSmGv5FooLGzsAF8aWiKst/ytrvtHGGGleBoXAIwNScfP8tBpwIsYYsQSW2dqJphOiYVVmXfXJY32JohYlklWPZ63XrOLLiTULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dq+QqSmsjfeCnpEMqrdByS/vt5CIgsbRHg15g6fD34=;
 b=hj87Bk70Ka6D9XjdyXl9PYSMnok3Talll0UqyfgviSNFnbRTsoSIIzfiRNBckfKTFiGQ8UH1K2sRxglCc8ArtYGKxn+88b/HV7ULsgZm4xHShKoAeKCrB2cbWMad5N8OD6gpooZwbplO4gmpOA6EWTdG+b3RdOXcnLCxuYAIxcA=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:21 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:21 +0000
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
Subject: [PATCH v8 13/20] drm/imagination: Implement firmware infrastructure and META FW support
Date: Tue, 31 Oct 2023 15:12:50 +0000
Message-Id: <20231031151257.90350-14-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1050a3f2-6ac5-41de-a9b8-08dbda23eba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1qzJgZnVA3WK0feBFTx+HO8zwqXj/97/MOS+dJA2bI4hc24JKCUmIIDjZiOqzy7JdI1ZpzFvCKndCHnCDR6qtL+KZJs1VlaFfyua4DipCe4SPBGpxwr7/vRvTWCVq9oasSN+d5FG2tGD03Cx/SEFEMnSmBTyqsy1G21asiDNMGPTiB/26NYOtI1iNTAp1kpFL0qUYmjMgrgFXB572+0tIs1cEYsgZn4aUPBVYpcfRjDE1GmIrz4weaciGlwqj02/scueLYMCP2HC14NCtvpiDcoL2amOa5ZQwcrug6m6UxKiDLBbin5wR8Cw0Nxbl76+Vop4LwvY1jSkDk0+rP80Bk/ADCzFWp3Z4lxBYFBwZbKd++WAboJvOR3u8G5KH/oqhsuJ3Wx7uJypU/Byvi1kGVVi1ZOeIRRqW8ZUuarnWN1Ink4sM/94NvbYkTlIpDIHW+2AtOqAbjLLKv6+3wgrZZ0X8exbbwmQMqVFdBxbk/LfxQ/s/YSSUpxyjM/qQZRCG0LZpdZlKNeplKBg3uNJmJeLqHgm5EP41bBUBG62PCmRZlsxv1v7cQzYblw6+Q29JwKt6IZ6XN7CCnttjXPSOqU/LfNRYyEp6ZA3K7rSPWTKP9m0bzwECxDtd1VyjKyJtlE2mpYNBPknwtDQKMHmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(2616005)(83380400001)(478600001)(6666004)(26005)(6512007)(6506007)(52116002)(6486002)(579004)(559001)(134885004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uNhLF1AJC433fVLBMTn/OuI0F0cwQGGu3IfTewQPepRYlhLJRPe6AkPHEkfd?=
 =?us-ascii?Q?rNkTphA44jLrY9uRycu+9KF7Gj1V7UcsMoWeftAjvi3woKB9NNRvip3QOFKm?=
 =?us-ascii?Q?xHYtOGjyBc5Vv6qPuAAecWgj7i9MmO6V/ROkX7cwss6uMezb7SiappdvkYwe?=
 =?us-ascii?Q?yhDlQO9+XaDADeQsg9oUr306u7DyrW492VIlComayaqrQ7NcJVc3eVjFC08I?=
 =?us-ascii?Q?GAePnqGwMeZUqxcBx7fUxsKUK/XMFTnk82/vsz1qOphOv0kLCVcJFRtPTQ6l?=
 =?us-ascii?Q?b27AO/0wnikmy1EIacVPZftWuLT9/4hUVpxrCk4VaAwPiYwMOLidGHKKJ7q7?=
 =?us-ascii?Q?xYP8lvkK+7YqvqbcbiphPI4PRpg/RQSUxGnGsO8bsy0SJFKN+rptAFSvzbUS?=
 =?us-ascii?Q?t9yCyw1RpAp9DW/OWrDDfyzmOva2elKVSVGfy06l3AvyhCgJBUDQXJWpVm7Z?=
 =?us-ascii?Q?VPpKn7vYVJvIokbhv01N+/EXr8mD1Fxr5MDYOdS1/LZB6W6GPtAZl4s2uXjB?=
 =?us-ascii?Q?WFiBoau/E0mbEQk2ye9zrDHtAbFtPRHO/MXllh+gjO9zWJL0xonBVzrb/g6V?=
 =?us-ascii?Q?svyJTKEv4KZNABAj9wLpk7tjGFkXKBt27aCaT7yi9+IiLbX02Vcy4DJ0TcOs?=
 =?us-ascii?Q?CUWw3QbhzpvYdSvBMf5atHvYBhGrRx4OPw/KL+q9qRcZHuLQMEQ1rvb7yCkQ?=
 =?us-ascii?Q?AGVYoYLIhMXaDNjbGAjp42PUzb6r8xHHMa2LiZziz7ll27uXcQt8uZWW+aRV?=
 =?us-ascii?Q?U+OEaHHhaEf6/qVX7F3lwl2OU9s8nAnxpHgVgNlhMEJUh7qFlaHRt/JRj28f?=
 =?us-ascii?Q?y8zhhQPKS807UZ2VegPc8/JgqBBzcVi3jafhdxfUVczt529GIOIAhHtLLxIX?=
 =?us-ascii?Q?HtyICWYOe4Ki49coR5ypsPR6UQ96e9m/WkBYW92eHxoIbLZWmk083DaMprT+?=
 =?us-ascii?Q?th5Dpx3SLEhB9gUpl0yENvr53QMTVflN5cPt3c7LUcLVjgAXwBXzT8FkeOF3?=
 =?us-ascii?Q?WFZcapZcRR4ITpRn08GrzpVkZzxc0YYYy4gQuwCQ3dSaUjZ8kDzh5nE3tGGY?=
 =?us-ascii?Q?hbNqhAeBXJd9N0bDhY4McV2ysdsnIqZBlb4ozNqtkyXQqOHK6EWKGzb+YpZL?=
 =?us-ascii?Q?ZsznzXXpSGQvDXWoilSou9nXpUMG8/8BO7qBiKTZqqVbYY3LTgly8fD8JT1u?=
 =?us-ascii?Q?5X+zcRUcJrlhqsIiSJ923+4RySmiwckQY/WCSR7Bylhky2P6/J+nDaOTCIq3?=
 =?us-ascii?Q?y8qU9TLV0tIXMCfeomUnPyfoE0K4Xe2t8+s5ItDXQMUqC8tPjHlMvn311LY2?=
 =?us-ascii?Q?ubhiLqzhgDyhX6oxfn2ceFUJSDzf4FH0g86YsIrnwvB8esvmGcFlvSNyPMh4?=
 =?us-ascii?Q?bQAxVb0l0XUD0B9+dZ3bEW/1n/ohi9BukFyAsDYfy1exFGLp7fbz9XKZLG+B?=
 =?us-ascii?Q?9HfMd/XPZZclBqc1l7b5dwB+G82ra8wkuLkIeWyjwhyBOzDo1Q0YEIvml/1y?=
 =?us-ascii?Q?EGInX1jnsrgGqfL1SQmffFh1DUNlP3U9fJTa7BePnfPgECBtKFHinmFwoF9I?=
 =?us-ascii?Q?0JEMjmqdvwogPrwkA+/0fkCOqYYeW7kHcSWNiu85mchyRNyKew5qw3/YmbEb?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1050a3f2-6ac5-41de-a9b8-08dbda23eba0
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:21.8135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0J7IAzP63VJT7v4VPo+nqJBec9D7DYdfxhhNunxTg/5FQ3GvavG0PSxX9wd7089iPB3ZbTLwekMx9saPSUROg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: CZWwyev0ukZLfYD9aEL0NApoVNq2PYKv
X-Proofpoint-ORIG-GUID: CZWwyev0ukZLfYD9aEL0NApoVNq2PYKv

The infrastructure includes parsing of the firmware image, initialising
FW-side structures, handling the kernel and firmware command
ringbuffers and starting & stopping the firmware processor.

This patch also adds the necessary support code for the META firmware
processor.

Changes since v6:
- Add a minimum retry count to pvr_kccb_reserve_slot_sync()

Changes since v5:
- Add workaround for BRN 71242
- Attempt to recover GPU on MMU flush command failure

Changes since v4:
- Remove use of drm_gem_shmem_get_pages()
- Remove interrupt resource name

Changes since v3:
- Hard reset FW processor on watchdog timeout
- Switch to threaded IRQ
- Rework FW object creation/initialisation to aid hard reset
- Added MODULE_FIRMWARE()
- Use drm_dev_{enter,exit}

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile          |    4 +
 drivers/gpu/drm/imagination/pvr_ccb.c         |  638 ++++++++
 drivers/gpu/drm/imagination/pvr_ccb.h         |   71 +
 drivers/gpu/drm/imagination/pvr_device.c      |  103 ++
 drivers/gpu/drm/imagination/pvr_device.h      |   60 +
 drivers/gpu/drm/imagination/pvr_drv.c         |    1 +
 drivers/gpu/drm/imagination/pvr_fw.c          | 1342 +++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw.h          |  474 ++++++
 drivers/gpu/drm/imagination/pvr_fw_meta.c     |  554 +++++++
 drivers/gpu/drm/imagination/pvr_fw_meta.h     |   14 +
 .../gpu/drm/imagination/pvr_fw_startstop.c    |  306 ++++
 .../gpu/drm/imagination/pvr_fw_startstop.h    |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |  120 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h    |   78 +
 drivers/gpu/drm/imagination/pvr_mmu.c         |   70 +-
 drivers/gpu/drm/imagination/pvr_power.c       |  166 +-
 drivers/gpu/drm/imagination/pvr_power.h       |    2 +
 drivers/gpu/drm/imagination/pvr_vm.c          |   26 +-
 18 files changed, 4018 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 235e2d329e29..5b02440841be 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -4,10 +4,14 @@
 subdir-ccflags-y := -I$(srctree)/$(src)
 
 powervr-y := \
+	pvr_ccb.o \
 	pvr_device.o \
 	pvr_device_info.o \
 	pvr_drv.o \
 	pvr_fw.o \
+	pvr_fw_meta.o \
+	pvr_fw_startstop.o \
+	pvr_fw_trace.o \
 	pvr_gem.o \
 	pvr_mmu.o \
 	pvr_power.o \
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
new file mode 100644
index 000000000000..64b58b8989ca
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -0,0 +1,638 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_ccb.h"
+#include "pvr_device.h"
+#include "pvr_drv.h"
+#include "pvr_fw.h"
+#include "pvr_gem.h"
+#include "pvr_power.h"
+
+#include <drm/drm_managed.h>
+#include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define RESERVE_SLOT_TIMEOUT (1 * HZ) /* 1s */
+#define RESERVE_SLOT_MIN_RETRIES 10
+
+static void
+ccb_ctrl_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_ccb_ctl *ctrl = cpu_ptr;
+	struct pvr_ccb *pvr_ccb = priv;
+
+	ctrl->write_offset = 0;
+	ctrl->read_offset = 0;
+	ctrl->wrap_mask = pvr_ccb->num_cmds - 1;
+	ctrl->cmd_size = pvr_ccb->cmd_size;
+}
+
+/**
+ * pvr_ccb_init() - Initialise a CCB
+ * @pvr_dev: Device pointer.
+ * @pvr_ccb: Pointer to CCB structure to initialise.
+ * @num_cmds_log2: Log2 of number of commands in this CCB.
+ * @cmd_size: Command size for this CCB.
+ *
+ * Return:
+ *  * Zero on success, or
+ *  * Any error code returned by pvr_fw_object_create_and_map().
+ */
+static int
+pvr_ccb_init(struct pvr_device *pvr_dev, struct pvr_ccb *pvr_ccb,
+	     u32 num_cmds_log2, size_t cmd_size)
+{
+	u32 num_cmds = 1 << num_cmds_log2;
+	u32 ccb_size = num_cmds * cmd_size;
+	int err;
+
+	pvr_ccb->num_cmds = num_cmds;
+	pvr_ccb->cmd_size = cmd_size;
+
+	err = drmm_mutex_init(from_pvr_device(pvr_dev), &pvr_ccb->lock);
+	if (err)
+		return err;
+
+	/*
+	 * Map CCB and control structure as uncached, so we don't have to flush
+	 * CPU cache repeatedly when polling for space.
+	 */
+	pvr_ccb->ctrl = pvr_fw_object_create_and_map(pvr_dev, sizeof(*pvr_ccb->ctrl),
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						     ccb_ctrl_init, pvr_ccb, &pvr_ccb->ctrl_obj);
+	if (IS_ERR(pvr_ccb->ctrl))
+		return PTR_ERR(pvr_ccb->ctrl);
+
+	pvr_ccb->ccb = pvr_fw_object_create_and_map(pvr_dev, ccb_size,
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						    NULL, NULL, &pvr_ccb->ccb_obj);
+	if (IS_ERR(pvr_ccb->ccb)) {
+		err = PTR_ERR(pvr_ccb->ccb);
+		goto err_free_ctrl;
+	}
+
+	pvr_fw_object_get_fw_addr(pvr_ccb->ctrl_obj, &pvr_ccb->ctrl_fw_addr);
+	pvr_fw_object_get_fw_addr(pvr_ccb->ccb_obj, &pvr_ccb->ccb_fw_addr);
+
+	WRITE_ONCE(pvr_ccb->ctrl->write_offset, 0);
+	WRITE_ONCE(pvr_ccb->ctrl->read_offset, 0);
+	WRITE_ONCE(pvr_ccb->ctrl->wrap_mask, num_cmds - 1);
+	WRITE_ONCE(pvr_ccb->ctrl->cmd_size, cmd_size);
+
+	return 0;
+
+err_free_ctrl:
+	pvr_fw_object_unmap_and_destroy(pvr_ccb->ctrl_obj);
+
+	return err;
+}
+
+/**
+ * pvr_ccb_fini() - Release CCB structure
+ * @pvr_ccb: CCB to release.
+ */
+void
+pvr_ccb_fini(struct pvr_ccb *pvr_ccb)
+{
+	pvr_fw_object_unmap_and_destroy(pvr_ccb->ccb_obj);
+	pvr_fw_object_unmap_and_destroy(pvr_ccb->ctrl_obj);
+}
+
+/**
+ * pvr_ccb_slot_available_locked() - Test whether any slots are available in CCB
+ * @pvr_ccb: CCB to test.
+ * @write_offset: Address to store number of next available slot. May be %NULL.
+ *
+ * Caller must hold @pvr_ccb->lock.
+ *
+ * Return:
+ *  * %true if a slot is available, or
+ *  * %false if no slot is available.
+ */
+static __always_inline bool
+pvr_ccb_slot_available_locked(struct pvr_ccb *pvr_ccb, u32 *write_offset)
+{
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_ccb->ctrl;
+	u32 next_write_offset = (READ_ONCE(ctrl->write_offset) + 1) & READ_ONCE(ctrl->wrap_mask);
+
+	lockdep_assert_held(&pvr_ccb->lock);
+
+	if (READ_ONCE(ctrl->read_offset) != next_write_offset) {
+		if (write_offset)
+			*write_offset = next_write_offset;
+		return true;
+	}
+
+	return false;
+}
+
+static void
+process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *cmd)
+{
+	switch (cmd->cmd_type) {
+	case ROGUE_FWIF_FWCCB_CMD_REQUEST_GPU_RESTART:
+		pvr_power_reset(pvr_dev, false);
+		break;
+
+	default:
+		drm_info(from_pvr_device(pvr_dev), "Received unknown FWCCB command %x\n",
+			 cmd->cmd_type);
+		break;
+	}
+}
+
+/**
+ * pvr_fwccb_process_worker() - Process any pending FWCCB commands
+ * @work: Work item.
+ *
+ * For this initial implementation, FWCCB commands will be printed to the console but otherwise not
+ * processed.
+ */
+void pvr_fwccb_process(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_fwccb_cmd *fwccb = pvr_dev->fwccb.ccb;
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_dev->fwccb.ctrl;
+	u32 read_offset;
+
+	mutex_lock(&pvr_dev->fwccb.lock);
+
+	while ((read_offset = READ_ONCE(ctrl->read_offset)) != READ_ONCE(ctrl->write_offset)) {
+		struct rogue_fwif_fwccb_cmd cmd = fwccb[read_offset];
+
+		WRITE_ONCE(ctrl->read_offset, (read_offset + 1) & READ_ONCE(ctrl->wrap_mask));
+
+		/* Drop FWCCB lock while we process command. */
+		mutex_unlock(&pvr_dev->fwccb.lock);
+
+		process_fwccb_command(pvr_dev, &cmd);
+
+		mutex_lock(&pvr_dev->fwccb.lock);
+	}
+
+	mutex_unlock(&pvr_dev->fwccb.lock);
+}
+
+/**
+ * pvr_kccb_capacity() - Returns the maximum number of usable KCCB slots.
+ * @pvr_dev: Target PowerVR device
+ *
+ * Return:
+ *  * The maximum number of active slots.
+ */
+static u32 pvr_kccb_capacity(struct pvr_device *pvr_dev)
+{
+	/* Capacity is the number of slot minus one to cope with the wrapping
+	 * mechanisms. If we were to use all slots, we might end up with
+	 * read_offset == write_offset, which the FW considers as a KCCB-is-empty
+	 * condition.
+	 */
+	return pvr_dev->kccb.slot_count - 1;
+}
+
+/**
+ * pvr_kccb_used_slot_count_locked() - Get the number of used slots
+ * @pvr_dev: Device pointer.
+ *
+ * KCCB lock must be held.
+ *
+ * Return:
+ *  * The number of slots currently used.
+ */
+static u32
+pvr_kccb_used_slot_count_locked(struct pvr_device *pvr_dev)
+{
+	struct pvr_ccb *pvr_ccb = &pvr_dev->kccb.ccb;
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_ccb->ctrl;
+	u32 wr_offset = READ_ONCE(ctrl->write_offset);
+	u32 rd_offset = READ_ONCE(ctrl->read_offset);
+	u32 used_count;
+
+	lockdep_assert_held(&pvr_ccb->lock);
+
+	if (wr_offset >= rd_offset)
+		used_count = wr_offset - rd_offset;
+	else
+		used_count = wr_offset + pvr_dev->kccb.slot_count - rd_offset;
+
+	return used_count;
+}
+
+/**
+ * pvr_kccb_send_cmd_reserved_powered() - Send command to the KCCB, with the PM ref
+ * held and a slot pre-reserved
+ * @pvr_dev: Device pointer.
+ * @cmd: Command to sent.
+ * @kccb_slot: Address to store the KCCB slot for this command. May be %NULL.
+ */
+void
+pvr_kccb_send_cmd_reserved_powered(struct pvr_device *pvr_dev,
+				   struct rogue_fwif_kccb_cmd *cmd,
+				   u32 *kccb_slot)
+{
+	struct pvr_ccb *pvr_ccb = &pvr_dev->kccb.ccb;
+	struct rogue_fwif_kccb_cmd *kccb = pvr_ccb->ccb;
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_ccb->ctrl;
+	u32 old_write_offset;
+	u32 new_write_offset;
+
+	WARN_ON(pvr_dev->lost);
+
+	mutex_lock(&pvr_ccb->lock);
+
+	if (WARN_ON(!pvr_dev->kccb.reserved_count))
+		goto out_unlock;
+
+	old_write_offset = READ_ONCE(ctrl->write_offset);
+
+	/* We reserved the slot, we should have one available. */
+	if (WARN_ON(!pvr_ccb_slot_available_locked(pvr_ccb, &new_write_offset)))
+		goto out_unlock;
+
+	memcpy(&kccb[old_write_offset], cmd,
+	       sizeof(struct rogue_fwif_kccb_cmd));
+	if (kccb_slot) {
+		*kccb_slot = old_write_offset;
+		/* Clear return status for this slot. */
+		WRITE_ONCE(pvr_dev->kccb.rtn[old_write_offset],
+			   ROGUE_FWIF_KCCB_RTN_SLOT_NO_RESPONSE);
+	}
+	mb(); /* memory barrier */
+	WRITE_ONCE(ctrl->write_offset, new_write_offset);
+	pvr_dev->kccb.reserved_count--;
+
+	/* Kick MTS */
+	pvr_fw_mts_schedule(pvr_dev,
+			    PVR_FWIF_DM_GP & ~ROGUE_CR_MTS_SCHEDULE_DM_CLRMSK);
+
+out_unlock:
+	mutex_unlock(&pvr_ccb->lock);
+}
+
+/**
+ * pvr_kccb_try_reserve_slot() - Try to reserve a KCCB slot
+ * @pvr_dev: Device pointer.
+ *
+ * Return:
+ *  * true if a KCCB slot was reserved, or
+ *  * false otherwise.
+ */
+static bool pvr_kccb_try_reserve_slot(struct pvr_device *pvr_dev)
+{
+	bool reserved = false;
+	u32 used_count;
+
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+
+	used_count = pvr_kccb_used_slot_count_locked(pvr_dev);
+	if (pvr_dev->kccb.reserved_count < pvr_kccb_capacity(pvr_dev) - used_count) {
+		pvr_dev->kccb.reserved_count++;
+		reserved = true;
+	}
+
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+
+	return reserved;
+}
+
+/**
+ * pvr_kccb_reserve_slot_sync() - Try to reserve a slot synchronously
+ * @pvr_dev: Device pointer.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -EBUSY if no slots were reserved after %RESERVE_SLOT_TIMEOUT, with a minimum of
+ *    %RESERVE_SLOT_MIN_RETRIES retries.
+ */
+static int pvr_kccb_reserve_slot_sync(struct pvr_device *pvr_dev)
+{
+	unsigned long start_timestamp = jiffies;
+	bool reserved = false;
+	u32 retries = 0;
+
+	while ((jiffies - start_timestamp) < (u32)RESERVE_SLOT_TIMEOUT ||
+	       retries < RESERVE_SLOT_MIN_RETRIES) {
+		reserved = pvr_kccb_try_reserve_slot(pvr_dev);
+		if (reserved)
+			break;
+
+		usleep_range(1, 50);
+
+		if (retries < U32_MAX)
+			retries++;
+	}
+
+	return reserved ? 0 : -EBUSY;
+}
+
+/**
+ * pvr_kccb_send_cmd_powered() - Send command to the KCCB, with a PM ref held
+ * @pvr_dev: Device pointer.
+ * @cmd: Command to sent.
+ * @kccb_slot: Address to store the KCCB slot for this command. May be %NULL.
+ *
+ * Returns:
+ *  * Zero on success, or
+ *  * -EBUSY if timeout while waiting for a free KCCB slot.
+ */
+int
+pvr_kccb_send_cmd_powered(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *cmd,
+			  u32 *kccb_slot)
+{
+	int err;
+
+	err = pvr_kccb_reserve_slot_sync(pvr_dev);
+	if (err)
+		return err;
+
+	pvr_kccb_send_cmd_reserved_powered(pvr_dev, cmd, kccb_slot);
+	return 0;
+}
+
+/**
+ * pvr_kccb_send_cmd() - Send command to the KCCB
+ * @pvr_dev: Device pointer.
+ * @cmd: Command to sent.
+ * @kccb_slot: Address to store the KCCB slot for this command. May be %NULL.
+ *
+ * Returns:
+ *  * Zero on success, or
+ *  * -EBUSY if timeout while waiting for a free KCCB slot.
+ */
+int
+pvr_kccb_send_cmd(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *cmd,
+		  u32 *kccb_slot)
+{
+	int err;
+
+	err = pvr_power_get(pvr_dev);
+	if (err)
+		return err;
+
+	err = pvr_kccb_send_cmd_powered(pvr_dev, cmd, kccb_slot);
+
+	pvr_power_put(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_kccb_wait_for_completion() - Wait for a KCCB command to complete
+ * @pvr_dev: Device pointer.
+ * @slot_nr: KCCB slot to wait on.
+ * @timeout: Timeout length (in jiffies).
+ * @rtn_out: Location to store KCCB command result. May be %NULL.
+ *
+ * Returns:
+ *  * Zero on success, or
+ *  * -ETIMEDOUT on timeout.
+ */
+int
+pvr_kccb_wait_for_completion(struct pvr_device *pvr_dev, u32 slot_nr,
+			     u32 timeout, u32 *rtn_out)
+{
+	int ret = wait_event_timeout(pvr_dev->kccb.rtn_q, READ_ONCE(pvr_dev->kccb.rtn[slot_nr]) &
+				     ROGUE_FWIF_KCCB_RTN_SLOT_CMD_EXECUTED, timeout);
+
+	if (ret && rtn_out)
+		*rtn_out = READ_ONCE(pvr_dev->kccb.rtn[slot_nr]);
+
+	return ret ? 0 : -ETIMEDOUT;
+}
+
+/**
+ * pvr_kccb_is_idle() - Returns whether the device's KCCB is idle
+ * @pvr_dev: Device pointer
+ *
+ * Returns:
+ *  * %true if the KCCB is idle (contains no commands), or
+ *  * %false if the KCCB contains pending commands.
+ */
+bool
+pvr_kccb_is_idle(struct pvr_device *pvr_dev)
+{
+	struct rogue_fwif_ccb_ctl *ctrl = pvr_dev->kccb.ccb.ctrl;
+	bool idle;
+
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+
+	idle = (READ_ONCE(ctrl->write_offset) == READ_ONCE(ctrl->read_offset));
+
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+
+	return idle;
+}
+
+static const char *
+pvr_kccb_fence_get_driver_name(struct dma_fence *f)
+{
+	return PVR_DRIVER_NAME;
+}
+
+static const char *
+pvr_kccb_fence_get_timeline_name(struct dma_fence *f)
+{
+	return "kccb";
+}
+
+static const struct dma_fence_ops pvr_kccb_fence_ops = {
+	.get_driver_name = pvr_kccb_fence_get_driver_name,
+	.get_timeline_name = pvr_kccb_fence_get_timeline_name,
+};
+
+/**
+ * struct pvr_kccb_fence - Fence object used to wait for a KCCB slot
+ */
+struct pvr_kccb_fence {
+	/** @base: Base dma_fence object. */
+	struct dma_fence base;
+
+	/** @node: Node used to insert the fence in the pvr_device::kccb::waiters list. */
+	struct list_head node;
+};
+
+/**
+ * pvr_kccb_wake_up_waiters() - Check the KCCB waiters
+ * @pvr_dev: Target PowerVR device
+ *
+ * Signal as many KCCB fences as we have slots available.
+ */
+void pvr_kccb_wake_up_waiters(struct pvr_device *pvr_dev)
+{
+	struct pvr_kccb_fence *fence, *tmp_fence;
+	u32 used_count, available_count;
+
+	/* Wake up those waiting for KCCB slot execution. */
+	wake_up_all(&pvr_dev->kccb.rtn_q);
+
+	/* Then iterate over all KCCB fences and signal as many as we can. */
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+	used_count = pvr_kccb_used_slot_count_locked(pvr_dev);
+
+	if (WARN_ON(used_count + pvr_dev->kccb.reserved_count > pvr_kccb_capacity(pvr_dev)))
+		goto out_unlock;
+
+	available_count = pvr_kccb_capacity(pvr_dev) - used_count - pvr_dev->kccb.reserved_count;
+	list_for_each_entry_safe(fence, tmp_fence, &pvr_dev->kccb.waiters, node) {
+		if (!available_count)
+			break;
+
+		list_del(&fence->node);
+		pvr_dev->kccb.reserved_count++;
+		available_count--;
+		dma_fence_signal(&fence->base);
+		dma_fence_put(&fence->base);
+	}
+
+out_unlock:
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+}
+
+/**
+ * pvr_kccb_fini() - Cleanup device KCCB
+ * @pvr_dev: Target PowerVR device
+ */
+void pvr_kccb_fini(struct pvr_device *pvr_dev)
+{
+	pvr_ccb_fini(&pvr_dev->kccb.ccb);
+	WARN_ON(!list_empty(&pvr_dev->kccb.waiters));
+	WARN_ON(pvr_dev->kccb.reserved_count);
+}
+
+/**
+ * pvr_kccb_init() - Initialise device KCCB
+ * @pvr_dev: Target PowerVR device
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_ccb_init().
+ */
+int
+pvr_kccb_init(struct pvr_device *pvr_dev)
+{
+	pvr_dev->kccb.slot_count = 1 << ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
+	INIT_LIST_HEAD(&pvr_dev->kccb.waiters);
+	pvr_dev->kccb.fence_ctx.id = dma_fence_context_alloc(1);
+	spin_lock_init(&pvr_dev->kccb.fence_ctx.lock);
+
+	return pvr_ccb_init(pvr_dev, &pvr_dev->kccb.ccb,
+			    ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT,
+			    sizeof(struct rogue_fwif_kccb_cmd));
+}
+
+/**
+ * pvr_kccb_fence_alloc() - Allocate a pvr_kccb_fence object
+ *
+ * Return:
+ *  * NULL if the allocation fails, or
+ *  * A valid dma_fence pointer otherwise.
+ */
+struct dma_fence *pvr_kccb_fence_alloc(void)
+{
+	struct pvr_kccb_fence *kccb_fence;
+
+	kccb_fence = kzalloc(sizeof(*kccb_fence), GFP_KERNEL);
+	if (!kccb_fence)
+		return NULL;
+
+	return &kccb_fence->base;
+}
+
+/**
+ * pvr_kccb_fence_put() - Drop a KCCB fence reference
+ * @fence: The fence to drop the reference on.
+ *
+ * If the fence hasn't been initialized yet, dma_fence_free() is called. This
+ * way we have a single function taking care of both cases.
+ */
+void pvr_kccb_fence_put(struct dma_fence *fence)
+{
+	if (!fence)
+		return;
+
+	if (!fence->ops) {
+		dma_fence_free(fence);
+	} else {
+		WARN_ON(fence->ops != &pvr_kccb_fence_ops);
+		dma_fence_put(fence);
+	}
+}
+
+/**
+ * pvr_kccb_reserve_slot() - Reserve a KCCB slot for later use
+ * @pvr_dev: Target PowerVR device
+ * @f: KCCB fence object previously allocated with pvr_kccb_fence_alloc()
+ *
+ * Try to reserve a KCCB slot, and if there's no slot available,
+ * initializes the fence object and queue it to the waiters list.
+ *
+ * If NULL is returned, that means the slot is reserved. In that case,
+ * the @f is freed and shouldn't be accessed after that point.
+ *
+ * Return:
+ *  * NULL if a slot was available directly, or
+ *  * A valid dma_fence object to wait on if no slot was available.
+ */
+struct dma_fence *
+pvr_kccb_reserve_slot(struct pvr_device *pvr_dev, struct dma_fence *f)
+{
+	struct pvr_kccb_fence *fence = container_of(f, struct pvr_kccb_fence, base);
+	struct dma_fence *out_fence = NULL;
+	u32 used_count;
+
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+
+	used_count = pvr_kccb_used_slot_count_locked(pvr_dev);
+	if (pvr_dev->kccb.reserved_count >= pvr_kccb_capacity(pvr_dev) - used_count) {
+		dma_fence_init(&fence->base, &pvr_kccb_fence_ops,
+			       &pvr_dev->kccb.fence_ctx.lock,
+			       pvr_dev->kccb.fence_ctx.id,
+			       atomic_inc_return(&pvr_dev->kccb.fence_ctx.seqno));
+		out_fence = dma_fence_get(&fence->base);
+		list_add_tail(&fence->node, &pvr_dev->kccb.waiters);
+	} else {
+		pvr_kccb_fence_put(f);
+		pvr_dev->kccb.reserved_count++;
+	}
+
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+
+	return out_fence;
+}
+
+/**
+ * pvr_kccb_release_slot() - Release a KCCB slot reserved with
+ * pvr_kccb_reserve_slot()
+ * @pvr_dev: Target PowerVR device
+ *
+ * Should only be called if something failed after the
+ * pvr_kccb_reserve_slot() call and you know you won't call
+ * pvr_kccb_send_cmd_reserved().
+ */
+void pvr_kccb_release_slot(struct pvr_device *pvr_dev)
+{
+	mutex_lock(&pvr_dev->kccb.ccb.lock);
+	if (!WARN_ON(!pvr_dev->kccb.reserved_count))
+		pvr_dev->kccb.reserved_count--;
+	mutex_unlock(&pvr_dev->kccb.ccb.lock);
+}
+
+/**
+ * pvr_fwccb_init() - Initialise device FWCCB
+ * @pvr_dev: Target PowerVR device
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_ccb_init().
+ */
+int
+pvr_fwccb_init(struct pvr_device *pvr_dev)
+{
+	return pvr_ccb_init(pvr_dev, &pvr_dev->fwccb,
+			    ROGUE_FWIF_FWCCB_NUMCMDS_LOG2,
+			    sizeof(struct rogue_fwif_fwccb_cmd));
+}
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.h b/drivers/gpu/drm/imagination/pvr_ccb.h
new file mode 100644
index 000000000000..60ebaa7dca63
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_ccb.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_CCB_H
+#define PVR_CCB_H
+
+#include "pvr_rogue_fwif.h"
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+struct pvr_ccb {
+	/** @ctrl_obj: FW object representing CCB control structure. */
+	struct pvr_fw_object *ctrl_obj;
+	/** @ccb_obj: FW object representing CCB. */
+	struct pvr_fw_object *ccb_obj;
+
+	/** @ctrl_fw_addr: FW virtual address of CCB control structure. */
+	u32 ctrl_fw_addr;
+	/** @ccb_fw_addr: FW virtual address of CCB. */
+	u32 ccb_fw_addr;
+
+	/** @num_cmds: Number of commands in this CCB. */
+	u32 num_cmds;
+
+	/** @cmd_size: Size of each command in this CCB, in bytes. */
+	u32 cmd_size;
+
+	/** @lock: Mutex protecting @ctrl and @ccb. */
+	struct mutex lock;
+	/**
+	 * @ctrl: Kernel mapping of CCB control structure. @lock must be held
+	 *        when accessing.
+	 */
+	struct rogue_fwif_ccb_ctl *ctrl;
+	/** @ccb: Kernel mapping of CCB. @lock must be held when accessing. */
+	void *ccb;
+};
+
+int pvr_kccb_init(struct pvr_device *pvr_dev);
+void pvr_kccb_fini(struct pvr_device *pvr_dev);
+int pvr_fwccb_init(struct pvr_device *pvr_dev);
+void pvr_ccb_fini(struct pvr_ccb *ccb);
+
+void pvr_fwccb_process(struct pvr_device *pvr_dev);
+
+struct dma_fence *pvr_kccb_fence_alloc(void);
+void pvr_kccb_fence_put(struct dma_fence *fence);
+struct dma_fence *
+pvr_kccb_reserve_slot(struct pvr_device *pvr_dev, struct dma_fence *f);
+void pvr_kccb_release_slot(struct pvr_device *pvr_dev);
+int pvr_kccb_send_cmd(struct pvr_device *pvr_dev,
+		      struct rogue_fwif_kccb_cmd *cmd, u32 *kccb_slot);
+int pvr_kccb_send_cmd_powered(struct pvr_device *pvr_dev,
+			      struct rogue_fwif_kccb_cmd *cmd,
+			      u32 *kccb_slot);
+void pvr_kccb_send_cmd_reserved_powered(struct pvr_device *pvr_dev,
+					struct rogue_fwif_kccb_cmd *cmd,
+					u32 *kccb_slot);
+int pvr_kccb_wait_for_completion(struct pvr_device *pvr_dev, u32 slot_nr, u32 timeout,
+				 u32 *rtn_out);
+bool pvr_kccb_is_idle(struct pvr_device *pvr_dev);
+void pvr_kccb_wake_up_waiters(struct pvr_device *pvr_dev);
+
+#endif /* PVR_CCB_H */
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 51ff10522d23..6055cf6054f7 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -114,6 +114,87 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
+static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
+{
+	struct pvr_device *pvr_dev = data;
+	irqreturn_t ret = IRQ_NONE;
+
+	/* We are in the threaded handler, we can keep dequeuing events until we
+	 * don't see any. This should allow us to reduce the number of interrupts
+	 * when the GPU is receiving a massive amount of short jobs.
+	 */
+	while (pvr_fw_irq_pending(pvr_dev)) {
+		pvr_fw_irq_clear(pvr_dev);
+
+		if (pvr_dev->fw_dev.booted) {
+			pvr_fwccb_process(pvr_dev);
+			pvr_kccb_wake_up_waiters(pvr_dev);
+		}
+
+		pm_runtime_mark_last_busy(from_pvr_device(pvr_dev)->dev);
+
+		ret = IRQ_HANDLED;
+	}
+
+	/* Unmask FW irqs before returning, so new interrupts can be received. */
+	pvr_fw_irq_enable(pvr_dev);
+	return ret;
+}
+
+static irqreturn_t pvr_device_irq_handler(int irq, void *data)
+{
+	struct pvr_device *pvr_dev = data;
+
+	if (!pvr_fw_irq_pending(pvr_dev))
+		return IRQ_NONE; /* Spurious IRQ - ignore. */
+
+	/* Mask the FW interrupts before waking up the thread. Will be unmasked
+	 * when the thread handler is done processing events.
+	 */
+	pvr_fw_irq_disable(pvr_dev);
+	return IRQ_WAKE_THREAD;
+}
+
+/**
+ * pvr_device_irq_init() - Initialise IRQ required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * Any error returned by platform_get_irq_byname(), or
+ *  * Any error returned by request_irq().
+ */
+static int
+pvr_device_irq_init(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+
+	init_waitqueue_head(&pvr_dev->kccb.rtn_q);
+
+	pvr_dev->irq = platform_get_irq(plat_dev, 0);
+	if (pvr_dev->irq < 0)
+		return pvr_dev->irq;
+
+	/* Clear any pending events before requesting the IRQ line. */
+	pvr_fw_irq_clear(pvr_dev);
+	pvr_fw_irq_enable(pvr_dev);
+
+	return request_threaded_irq(pvr_dev->irq, pvr_device_irq_handler,
+				    pvr_device_irq_thread_handler,
+				    IRQF_SHARED, "gpu", pvr_dev);
+}
+
+/**
+ * pvr_device_irq_fini() - Deinitialise IRQ required by a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ */
+static void
+pvr_device_irq_fini(struct pvr_device *pvr_dev)
+{
+	free_irq(pvr_dev->irq, pvr_dev);
+}
+
 /**
  * pvr_build_firmware_filename() - Construct a PowerVR firmware filename
  * @pvr_dev: Target PowerVR device.
@@ -324,7 +405,19 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 			return PTR_ERR(pvr_dev->kernel_vm_ctx);
 	}
 
+	err = pvr_fw_init(pvr_dev);
+	if (err)
+		goto err_vm_ctx_put;
+
 	return 0;
+
+err_vm_ctx_put:
+	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
+		pvr_vm_context_put(pvr_dev->kernel_vm_ctx);
+		pvr_dev->kernel_vm_ctx = NULL;
+	}
+
+	return err;
 }
 
 /**
@@ -334,6 +427,8 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 static void
 pvr_device_gpu_fini(struct pvr_device *pvr_dev)
 {
+	pvr_fw_fini(pvr_dev);
+
 	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
 		WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
 		pvr_dev->kernel_vm_ctx = NULL;
@@ -386,10 +481,17 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		goto err_pm_runtime_put;
 
+	err = pvr_device_irq_init(pvr_dev);
+	if (err)
+		goto err_device_gpu_fini;
+
 	pm_runtime_put(dev);
 
 	return 0;
 
+err_device_gpu_fini:
+	pvr_device_gpu_fini(pvr_dev);
+
 err_pm_runtime_put:
 	pm_runtime_put_sync_suspend(dev);
 
@@ -407,6 +509,7 @@ pvr_device_fini(struct pvr_device *pvr_dev)
 	 * Deinitialization stages are performed in reverse order compared to
 	 * the initialization stages in pvr_device_init().
 	 */
+	pvr_device_irq_fini(pvr_dev);
 	pvr_device_gpu_fini(pvr_dev);
 }
 
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 0f37d84e9c61..0d0648314de1 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -4,6 +4,7 @@
 #ifndef PVR_DEVICE_H
 #define PVR_DEVICE_H
 
+#include "pvr_ccb.h"
 #include "pvr_device_info.h"
 #include "pvr_fw.h"
 
@@ -123,6 +124,12 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	/** @irq: IRQ number. */
+	int irq;
+
+	/** @fwccb: Firmware CCB. */
+	struct pvr_ccb fwccb;
+
 	/**
 	 * @kernel_vm_ctx: Virtual memory context used for kernel mappings.
 	 *
@@ -153,6 +160,49 @@ struct pvr_device {
 		u32 kccb_stall_count;
 	} watchdog;
 
+	struct {
+		/** @ccb: Kernel CCB. */
+		struct pvr_ccb ccb;
+
+		/** @rtn_q: Waitqueue for KCCB command return waiters. */
+		wait_queue_head_t rtn_q;
+
+		/** @rtn_obj: Object representing KCCB return slots. */
+		struct pvr_fw_object *rtn_obj;
+
+		/**
+		 * @rtn: Pointer to CPU mapping of KCCB return slots. Must be accessed by
+		 *       READ_ONCE()/WRITE_ONCE().
+		 */
+		u32 *rtn;
+
+		/** @slot_count: Total number of KCCB slots available. */
+		u32 slot_count;
+
+		/** @reserved_count: Number of KCCB slots reserved for future use. */
+		u32 reserved_count;
+
+		/**
+		 * @waiters: List of KCCB slot waiters.
+		 */
+		struct list_head waiters;
+
+		/** @fence_ctx: KCCB fence context. */
+		struct {
+			/** @id: KCCB fence context ID allocated with dma_fence_context_alloc(). */
+			u64 id;
+
+			/** @seqno: Sequence number incremented each time a fence is created. */
+			atomic_t seqno;
+
+			/**
+			 * @lock: Lock used to synchronize access to fences allocated by this
+			 * context.
+			 */
+			spinlock_t lock;
+		} fence_ctx;
+	} kccb;
+
 	/**
 	 * @lost: %true if the device has been lost.
 	 *
@@ -161,6 +211,16 @@ struct pvr_device {
 	 */
 	bool lost;
 
+	/**
+	 * @reset_sem: Reset semaphore.
+	 *
+	 * GPU reset code will lock this for writing. Any code that submits commands to the firmware
+	 * that isn't in an IRQ handler or on the scheduler workqueue must lock this for reading.
+	 * Once this has been successfully locked, &pvr_dev->lost _must_ be checked, and -%EIO must
+	 * be returned if it is set.
+	 */
+	struct rw_semaphore reset_sem;
+
 	/** @sched_wq: Workqueue for schedulers. */
 	struct workqueue_struct *sched_wq;
 };
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index debec785a7c0..9f5d794e601f 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1331,3 +1331,4 @@ MODULE_AUTHOR("Imagination Technologies Ltd.");
 MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS(DMA_BUF);
+MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index c48de4a3af46..af0955b126b1 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -1,16 +1,84 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /* Copyright (c) 2023 Imagination Technologies Ltd. */
 
+#include "pvr_ccb.h"
 #include "pvr_device.h"
 #include "pvr_device_info.h"
 #include "pvr_fw.h"
+#include "pvr_fw_info.h"
+#include "pvr_fw_startstop.h"
+#include "pvr_fw_trace.h"
+#include "pvr_gem.h"
+#include "pvr_power.h"
+#include "pvr_rogue_fwif_dev_info.h"
+#include "pvr_rogue_heap_config.h"
+#include "pvr_vm.h"
 
 #include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_mm.h>
+#include <linux/clk.h>
 #include <linux/firmware.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/sizes.h>
 
 #define FW_MAX_SUPPORTED_MAJOR_VERSION 1
 
+#define FW_BOOT_TIMEOUT_USEC 5000000
+
+/* Config heap occupies top 192k of the firmware heap. */
+#define PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY SZ_64K
+#define PVR_ROGUE_FW_CONFIG_HEAP_SIZE (3 * PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY)
+
+/* Main firmware allocations should come from the remainder of the heap. */
+#define PVR_ROGUE_FW_MAIN_HEAP_BASE ROGUE_FW_HEAP_BASE
+
+/* Offsets from start of configuration area of FW heap. */
+#define PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET 0
+#define PVR_ROGUE_FWIF_OSINIT_OFFSET \
+	(PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET + PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY)
+#define PVR_ROGUE_FWIF_SYSINIT_OFFSET \
+	(PVR_ROGUE_FWIF_OSINIT_OFFSET + PVR_ROGUE_FW_CONFIG_HEAP_GRANULARITY)
+
+#define PVR_ROGUE_FAULT_PAGE_SIZE SZ_4K
+
+#define PVR_SYNC_OBJ_SIZE sizeof(u32)
+
+const struct pvr_fw_layout_entry *
+pvr_fw_find_layout_entry(struct pvr_device *pvr_dev, enum pvr_fw_section_id id)
+{
+	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
+	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
+	u32 entry;
+
+	for (entry = 0; entry < num_layout_entries; entry++) {
+		if (layout_entries[entry].id == id)
+			return &layout_entries[entry];
+	}
+
+	return NULL;
+}
+
+static const struct pvr_fw_layout_entry *
+pvr_fw_find_private_data(struct pvr_device *pvr_dev)
+{
+	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
+	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
+	u32 entry;
+
+	for (entry = 0; entry < num_layout_entries; entry++) {
+		if (layout_entries[entry].id == META_PRIVATE_DATA ||
+		    layout_entries[entry].id == MIPS_PRIVATE_DATA ||
+		    layout_entries[entry].id == RISCV_PRIVATE_DATA)
+			return &layout_entries[entry];
+	}
+
+	return NULL;
+}
+
+#define DEV_INFO_MASK_SIZE(x) DIV_ROUND_UP(x, 64)
+
 /**
  * pvr_fw_validate() - Parse firmware header and check compatibility
  * @pvr_dev: Device pointer.
@@ -122,6 +190,704 @@ pvr_fw_get_device_info(struct pvr_device *pvr_dev)
 					    header->feature_param_size);
 }
 
+static void
+layout_get_sizes(struct pvr_device *pvr_dev)
+{
+	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
+	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
+	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
+
+	fw_mem->code_alloc_size = 0;
+	fw_mem->data_alloc_size = 0;
+	fw_mem->core_code_alloc_size = 0;
+	fw_mem->core_data_alloc_size = 0;
+
+	/* Extract section sizes from FW layout table. */
+	for (u32 entry = 0; entry < num_layout_entries; entry++) {
+		switch (layout_entries[entry].type) {
+		case FW_CODE:
+			fw_mem->code_alloc_size += layout_entries[entry].alloc_size;
+			break;
+		case FW_DATA:
+			fw_mem->data_alloc_size += layout_entries[entry].alloc_size;
+			break;
+		case FW_COREMEM_CODE:
+			fw_mem->core_code_alloc_size +=
+				layout_entries[entry].alloc_size;
+			break;
+		case FW_COREMEM_DATA:
+			fw_mem->core_data_alloc_size +=
+				layout_entries[entry].alloc_size;
+			break;
+		case NONE:
+			break;
+		}
+	}
+}
+
+int
+pvr_fw_find_mmu_segment(struct pvr_device *pvr_dev, u32 addr, u32 size, void *fw_code_ptr,
+			void *fw_data_ptr, void *fw_core_code_ptr, void *fw_core_data_ptr,
+			void **host_addr_out)
+{
+	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
+	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
+	u32 end_addr = addr + size;
+	int entry = 0;
+
+	/* Ensure requested range is not zero, and size is not causing addr to overflow. */
+	if (end_addr <= addr)
+		return -EINVAL;
+
+	for (entry = 0; entry < num_layout_entries; entry++) {
+		u32 entry_start_addr = layout_entries[entry].base_addr;
+		u32 entry_end_addr = entry_start_addr + layout_entries[entry].alloc_size;
+
+		if (addr >= entry_start_addr && addr < entry_end_addr &&
+		    end_addr > entry_start_addr && end_addr <= entry_end_addr) {
+			switch (layout_entries[entry].type) {
+			case FW_CODE:
+				*host_addr_out = fw_code_ptr;
+				break;
+
+			case FW_DATA:
+				*host_addr_out = fw_data_ptr;
+				break;
+
+			case FW_COREMEM_CODE:
+				*host_addr_out = fw_core_code_ptr;
+				break;
+
+			case FW_COREMEM_DATA:
+				*host_addr_out = fw_core_data_ptr;
+				break;
+
+			default:
+				return -EINVAL;
+			}
+			/* Direct Mem write to mapped memory */
+			addr -= layout_entries[entry].base_addr;
+			addr += layout_entries[entry].alloc_offset;
+
+			/*
+			 * Add offset to pointer to FW allocation only if that
+			 * allocation is available
+			 */
+			*(u8 **)host_addr_out += addr;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int
+pvr_fw_create_fwif_connection_ctl(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	fw_dev->fwif_connection_ctl =
+		pvr_fw_object_create_and_map_offset(pvr_dev,
+						    fw_dev->fw_heap_info.config_offset +
+						    PVR_ROGUE_FWIF_CONNECTION_CTL_OFFSET,
+						    sizeof(*fw_dev->fwif_connection_ctl),
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						    NULL, NULL,
+						    &fw_dev->mem.fwif_connection_ctl_obj);
+	if (IS_ERR(fw_dev->fwif_connection_ctl)) {
+		drm_err(drm_dev,
+			"Unable to allocate FWIF connection control memory\n");
+		return PTR_ERR(fw_dev->fwif_connection_ctl);
+	}
+
+	return 0;
+}
+
+static void
+pvr_fw_fini_fwif_connection_ctl(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	pvr_fw_object_unmap_and_destroy(fw_dev->mem.fwif_connection_ctl_obj);
+}
+
+static void
+fw_osinit_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_osinit *fwif_osinit = cpu_ptr;
+	struct pvr_device *pvr_dev = priv;
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+
+	fwif_osinit->kernel_ccbctl_fw_addr = pvr_dev->kccb.ccb.ctrl_fw_addr;
+	fwif_osinit->kernel_ccb_fw_addr = pvr_dev->kccb.ccb.ccb_fw_addr;
+	pvr_fw_object_get_fw_addr(pvr_dev->kccb.rtn_obj,
+				  &fwif_osinit->kernel_ccb_rtn_slots_fw_addr);
+
+	fwif_osinit->firmware_ccbctl_fw_addr = pvr_dev->fwccb.ctrl_fw_addr;
+	fwif_osinit->firmware_ccb_fw_addr = pvr_dev->fwccb.ccb_fw_addr;
+
+	fwif_osinit->work_est_firmware_ccbctl_fw_addr = 0;
+	fwif_osinit->work_est_firmware_ccb_fw_addr = 0;
+
+	pvr_fw_object_get_fw_addr(fw_mem->hwrinfobuf_obj,
+				  &fwif_osinit->rogue_fwif_hwr_info_buf_ctl_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_mem->osdata_obj, &fwif_osinit->fw_os_data_fw_addr);
+
+	fwif_osinit->hwr_debug_dump_limit = 0;
+
+	rogue_fwif_compchecks_bvnc_init(&fwif_osinit->rogue_comp_checks.hw_bvnc);
+	rogue_fwif_compchecks_bvnc_init(&fwif_osinit->rogue_comp_checks.fw_bvnc);
+}
+
+static void
+fw_osdata_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_osdata *fwif_osdata = cpu_ptr;
+	struct pvr_device *pvr_dev = priv;
+	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
+
+	pvr_fw_object_get_fw_addr(fw_mem->power_sync_obj, &fwif_osdata->power_sync_fw_addr);
+}
+
+static void
+fw_fault_page_init(void *cpu_ptr, void *priv)
+{
+	u32 *fault_page = cpu_ptr;
+
+	for (int i = 0; i < PVR_ROGUE_FAULT_PAGE_SIZE / sizeof(*fault_page); i++)
+		fault_page[i] = 0xdeadbee0;
+}
+
+static void
+fw_sysinit_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_sysinit *fwif_sysinit = cpu_ptr;
+	struct pvr_device *pvr_dev = priv;
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+	dma_addr_t fault_dma_addr = 0;
+	u32 clock_speed_hz = clk_get_rate(pvr_dev->core_clk);
+
+	WARN_ON(!clock_speed_hz);
+
+	WARN_ON(pvr_fw_object_get_dma_addr(fw_mem->fault_page_obj, 0, &fault_dma_addr));
+	fwif_sysinit->fault_phys_addr = (u64)fault_dma_addr;
+
+	fwif_sysinit->pds_exec_base = ROGUE_PDSCODEDATA_HEAP_BASE;
+	fwif_sysinit->usc_exec_base = ROGUE_USCCODE_HEAP_BASE;
+
+	pvr_fw_object_get_fw_addr(fw_mem->runtime_cfg_obj, &fwif_sysinit->runtime_cfg_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_dev->fw_trace.tracebuf_ctrl_obj,
+				  &fwif_sysinit->trace_buf_ctl_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_mem->sysdata_obj, &fwif_sysinit->fw_sys_data_fw_addr);
+	pvr_fw_object_get_fw_addr(fw_mem->gpu_util_fwcb_obj,
+				  &fwif_sysinit->gpu_util_fw_cb_ctl_fw_addr);
+	if (fw_mem->core_data_obj) {
+		pvr_fw_object_get_fw_addr(fw_mem->core_data_obj,
+					  &fwif_sysinit->coremem_data_store.fw_addr);
+	}
+
+	/* Currently unsupported. */
+	fwif_sysinit->counter_dump_ctl.buffer_fw_addr = 0;
+	fwif_sysinit->counter_dump_ctl.size_in_dwords = 0;
+
+	/* Skip alignment checks. */
+	fwif_sysinit->align_checks = 0;
+
+	fwif_sysinit->filter_flags = 0;
+	fwif_sysinit->hw_perf_filter = 0;
+	fwif_sysinit->firmware_perf = FW_PERF_CONF_NONE;
+	fwif_sysinit->initial_core_clock_speed = clock_speed_hz;
+	fwif_sysinit->active_pm_latency_ms = 0;
+	fwif_sysinit->gpio_validation_mode = ROGUE_FWIF_GPIO_VAL_OFF;
+	fwif_sysinit->firmware_started = false;
+	fwif_sysinit->marker_val = 1;
+
+	memset(&fwif_sysinit->bvnc_km_feature_flags, 0,
+	       sizeof(fwif_sysinit->bvnc_km_feature_flags));
+}
+
+#define ROGUE_FWIF_SLC_MIN_SIZE_FOR_DM_OVERLAP_KB 4
+
+static void
+fw_sysdata_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_sysdata *fwif_sysdata = cpu_ptr;
+	struct pvr_device *pvr_dev = priv;
+	u32 slc_size_in_kilobytes = 0;
+	u32 config_flags = 0;
+
+	WARN_ON(PVR_FEATURE_VALUE(pvr_dev, slc_size_in_kilobytes, &slc_size_in_kilobytes));
+
+	if (slc_size_in_kilobytes < ROGUE_FWIF_SLC_MIN_SIZE_FOR_DM_OVERLAP_KB)
+		config_flags |= ROGUE_FWIF_INICFG_DISABLE_DM_OVERLAP;
+
+	fwif_sysdata->config_flags = config_flags;
+}
+
+static void
+fw_runtime_cfg_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_runtime_cfg *runtime_cfg = cpu_ptr;
+	struct pvr_device *pvr_dev = priv;
+	u32 clock_speed_hz = clk_get_rate(pvr_dev->core_clk);
+
+	WARN_ON(!clock_speed_hz);
+
+	runtime_cfg->core_clock_speed = clock_speed_hz;
+	runtime_cfg->active_pm_latency_ms = 0;
+	runtime_cfg->active_pm_latency_persistant = true;
+	WARN_ON(PVR_FEATURE_VALUE(pvr_dev, num_clusters,
+				  &runtime_cfg->default_dusts_num_init) != 0);
+}
+
+static void
+fw_gpu_util_fwcb_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_gpu_util_fwcb *gpu_util_fwcb = cpu_ptr;
+
+	gpu_util_fwcb->last_word = PVR_FWIF_GPU_UTIL_STATE_IDLE;
+}
+
+static int
+pvr_fw_create_structures(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+	int err;
+
+	fw_dev->power_sync = pvr_fw_object_create_and_map(pvr_dev, sizeof(*fw_dev->power_sync),
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							  NULL, NULL, &fw_mem->power_sync_obj);
+	if (IS_ERR(fw_dev->power_sync)) {
+		drm_err(drm_dev, "Unable to allocate FW power_sync structure\n");
+		return PTR_ERR(fw_dev->power_sync);
+	}
+
+	fw_dev->hwrinfobuf = pvr_fw_object_create_and_map(pvr_dev, sizeof(*fw_dev->hwrinfobuf),
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							  NULL, NULL, &fw_mem->hwrinfobuf_obj);
+	if (IS_ERR(fw_dev->hwrinfobuf)) {
+		drm_err(drm_dev,
+			"Unable to allocate FW hwrinfobuf structure\n");
+		err = PTR_ERR(fw_dev->hwrinfobuf);
+		goto err_release_power_sync;
+	}
+
+	err = pvr_fw_object_create(pvr_dev, PVR_SYNC_OBJ_SIZE,
+				   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+				   NULL, NULL, &fw_mem->mmucache_sync_obj);
+	if (err) {
+		drm_err(drm_dev,
+			"Unable to allocate MMU cache sync object\n");
+		goto err_release_hwrinfobuf;
+	}
+
+	fw_dev->fwif_sysdata = pvr_fw_object_create_and_map(pvr_dev,
+							    sizeof(*fw_dev->fwif_sysdata),
+							    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							    fw_sysdata_init, pvr_dev,
+							    &fw_mem->sysdata_obj);
+	if (IS_ERR(fw_dev->fwif_sysdata)) {
+		drm_err(drm_dev, "Unable to allocate FW SYSDATA structure\n");
+		err = PTR_ERR(fw_dev->fwif_sysdata);
+		goto err_release_mmucache_sync_obj;
+	}
+
+	err = pvr_fw_object_create(pvr_dev, PVR_ROGUE_FAULT_PAGE_SIZE,
+				   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+				   fw_fault_page_init, NULL, &fw_mem->fault_page_obj);
+	if (err) {
+		drm_err(drm_dev, "Unable to allocate FW fault page\n");
+		goto err_release_sysdata;
+	}
+
+	err = pvr_fw_object_create(pvr_dev, sizeof(struct rogue_fwif_gpu_util_fwcb),
+				   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+				   fw_gpu_util_fwcb_init, pvr_dev, &fw_mem->gpu_util_fwcb_obj);
+	if (err) {
+		drm_err(drm_dev, "Unable to allocate GPU util FWCB\n");
+		goto err_release_fault_page;
+	}
+
+	err = pvr_fw_object_create(pvr_dev, sizeof(struct rogue_fwif_runtime_cfg),
+				   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+				   fw_runtime_cfg_init, pvr_dev, &fw_mem->runtime_cfg_obj);
+	if (err) {
+		drm_err(drm_dev, "Unable to allocate FW runtime config\n");
+		goto err_release_gpu_util_fwcb;
+	}
+
+	err = pvr_fw_trace_init(pvr_dev);
+	if (err)
+		goto err_release_runtime_cfg;
+
+	fw_dev->fwif_osdata = pvr_fw_object_create_and_map(pvr_dev,
+							   sizeof(*fw_dev->fwif_osdata),
+							   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							   fw_osdata_init, pvr_dev,
+							   &fw_mem->osdata_obj);
+	if (IS_ERR(fw_dev->fwif_osdata)) {
+		drm_err(drm_dev, "Unable to allocate FW OSDATA structure\n");
+		err = PTR_ERR(fw_dev->fwif_osdata);
+		goto err_fw_trace_fini;
+	}
+
+	fw_dev->fwif_osinit =
+		pvr_fw_object_create_and_map_offset(pvr_dev,
+						    fw_dev->fw_heap_info.config_offset +
+						    PVR_ROGUE_FWIF_OSINIT_OFFSET,
+						    sizeof(*fw_dev->fwif_osinit),
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						    fw_osinit_init, pvr_dev, &fw_mem->osinit_obj);
+	if (IS_ERR(fw_dev->fwif_osinit)) {
+		drm_err(drm_dev, "Unable to allocate FW OSINIT structure\n");
+		err = PTR_ERR(fw_dev->fwif_osinit);
+		goto err_release_osdata;
+	}
+
+	fw_dev->fwif_sysinit =
+		pvr_fw_object_create_and_map_offset(pvr_dev,
+						    fw_dev->fw_heap_info.config_offset +
+						    PVR_ROGUE_FWIF_SYSINIT_OFFSET,
+						    sizeof(*fw_dev->fwif_sysinit),
+						    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						    fw_sysinit_init, pvr_dev, &fw_mem->sysinit_obj);
+	if (IS_ERR(fw_dev->fwif_sysinit)) {
+		drm_err(drm_dev, "Unable to allocate FW SYSINIT structure\n");
+		err = PTR_ERR(fw_dev->fwif_sysinit);
+		goto err_release_osinit;
+	}
+
+	return 0;
+
+err_release_osinit:
+	pvr_fw_object_unmap_and_destroy(fw_mem->osinit_obj);
+
+err_release_osdata:
+	pvr_fw_object_unmap_and_destroy(fw_mem->osdata_obj);
+
+err_fw_trace_fini:
+	pvr_fw_trace_fini(pvr_dev);
+
+err_release_runtime_cfg:
+	pvr_fw_object_destroy(fw_mem->runtime_cfg_obj);
+
+err_release_gpu_util_fwcb:
+	pvr_fw_object_destroy(fw_mem->gpu_util_fwcb_obj);
+
+err_release_fault_page:
+	pvr_fw_object_destroy(fw_mem->fault_page_obj);
+
+err_release_sysdata:
+	pvr_fw_object_unmap_and_destroy(fw_mem->sysdata_obj);
+
+err_release_mmucache_sync_obj:
+	pvr_fw_object_destroy(fw_mem->mmucache_sync_obj);
+
+err_release_hwrinfobuf:
+	pvr_fw_object_unmap_and_destroy(fw_mem->hwrinfobuf_obj);
+
+err_release_power_sync:
+	pvr_fw_object_unmap_and_destroy(fw_mem->power_sync_obj);
+
+	return err;
+}
+
+static void
+pvr_fw_destroy_structures(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	struct pvr_fw_mem *fw_mem = &fw_dev->mem;
+
+	pvr_fw_trace_fini(pvr_dev);
+	pvr_fw_object_destroy(fw_mem->runtime_cfg_obj);
+	pvr_fw_object_destroy(fw_mem->gpu_util_fwcb_obj);
+	pvr_fw_object_destroy(fw_mem->fault_page_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->sysdata_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->sysinit_obj);
+
+	pvr_fw_object_destroy(fw_mem->mmucache_sync_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->hwrinfobuf_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->power_sync_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->osdata_obj);
+	pvr_fw_object_unmap_and_destroy(fw_mem->osinit_obj);
+}
+
+/**
+ * pvr_fw_process() - Process firmware image, allocate FW memory and create boot
+ *                    arguments
+ * @pvr_dev: Device pointer.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_fw_object_create_and_map_offset(), or
+ *  * Any error returned by pvr_fw_object_create_and_map().
+ */
+static int
+pvr_fw_process(struct pvr_device *pvr_dev)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
+	const u8 *fw = pvr_dev->fw_dev.firmware->data;
+	const struct pvr_fw_layout_entry *private_data;
+	u8 *fw_code_ptr;
+	u8 *fw_data_ptr;
+	u8 *fw_core_code_ptr;
+	u8 *fw_core_data_ptr;
+	int err;
+
+	layout_get_sizes(pvr_dev);
+
+	private_data = pvr_fw_find_private_data(pvr_dev);
+	if (!private_data)
+		return -EINVAL;
+
+	/* Allocate and map memory for firmware sections. */
+
+	/*
+	 * Code allocation must be at the start of the firmware heap, otherwise
+	 * firmware processor will be unable to boot.
+	 *
+	 * This has the useful side-effect that for every other object in the
+	 * driver, a firmware address of 0 is invalid.
+	 */
+	fw_code_ptr = pvr_fw_object_create_and_map_offset(pvr_dev, 0, fw_mem->code_alloc_size,
+							  PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							  NULL, NULL, &fw_mem->code_obj);
+	if (IS_ERR(fw_code_ptr)) {
+		drm_err(drm_dev, "Unable to allocate FW code memory\n");
+		return PTR_ERR(fw_code_ptr);
+	}
+
+	if (pvr_dev->fw_dev.defs->has_fixed_data_addr()) {
+		u32 base_addr = private_data->base_addr & pvr_dev->fw_dev.fw_heap_info.offset_mask;
+
+		fw_data_ptr =
+			pvr_fw_object_create_and_map_offset(pvr_dev, base_addr,
+							    fw_mem->data_alloc_size,
+							    PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							    NULL, NULL, &fw_mem->data_obj);
+	} else {
+		fw_data_ptr = pvr_fw_object_create_and_map(pvr_dev, fw_mem->data_alloc_size,
+							   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							   NULL, NULL, &fw_mem->data_obj);
+	}
+	if (IS_ERR(fw_data_ptr)) {
+		drm_err(drm_dev, "Unable to allocate FW data memory\n");
+		err = PTR_ERR(fw_data_ptr);
+		goto err_free_fw_code_obj;
+	}
+
+	/* Core code and data sections are optional. */
+	if (fw_mem->core_code_alloc_size) {
+		fw_core_code_ptr =
+			pvr_fw_object_create_and_map(pvr_dev, fw_mem->core_code_alloc_size,
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						     NULL, NULL, &fw_mem->core_code_obj);
+		if (IS_ERR(fw_core_code_ptr)) {
+			drm_err(drm_dev,
+				"Unable to allocate FW core code memory\n");
+			err = PTR_ERR(fw_core_code_ptr);
+			goto err_free_fw_data_obj;
+		}
+	} else {
+		fw_core_code_ptr = NULL;
+	}
+
+	if (fw_mem->core_data_alloc_size) {
+		fw_core_data_ptr =
+			pvr_fw_object_create_and_map(pvr_dev, fw_mem->core_data_alloc_size,
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+						     NULL, NULL, &fw_mem->core_data_obj);
+		if (IS_ERR(fw_core_data_ptr)) {
+			drm_err(drm_dev,
+				"Unable to allocate FW core data memory\n");
+			err = PTR_ERR(fw_core_data_ptr);
+			goto err_free_fw_core_code_obj;
+		}
+	} else {
+		fw_core_data_ptr = NULL;
+	}
+
+	fw_mem->code = kzalloc(fw_mem->code_alloc_size, GFP_KERNEL);
+	fw_mem->data = kzalloc(fw_mem->data_alloc_size, GFP_KERNEL);
+	if (fw_mem->core_code_alloc_size)
+		fw_mem->core_code = kzalloc(fw_mem->core_code_alloc_size, GFP_KERNEL);
+	if (fw_mem->core_data_alloc_size)
+		fw_mem->core_data = kzalloc(fw_mem->core_data_alloc_size, GFP_KERNEL);
+
+	if (!fw_mem->code || !fw_mem->data ||
+	    (!fw_mem->core_code && fw_mem->core_code_alloc_size) ||
+	    (!fw_mem->core_data && fw_mem->core_data_alloc_size)) {
+		err = -ENOMEM;
+		goto err_free_kdata;
+	}
+
+	err = pvr_dev->fw_dev.defs->fw_process(pvr_dev, fw,
+					       fw_mem->code, fw_mem->data, fw_mem->core_code,
+					       fw_mem->core_data, fw_mem->core_code_alloc_size);
+
+	if (err)
+		goto err_free_fw_core_data_obj;
+
+	memcpy(fw_code_ptr, fw_mem->code, fw_mem->code_alloc_size);
+	memcpy(fw_data_ptr, fw_mem->data, fw_mem->data_alloc_size);
+	if (fw_mem->core_code)
+		memcpy(fw_core_code_ptr, fw_mem->core_code, fw_mem->core_code_alloc_size);
+	if (fw_mem->core_data)
+		memcpy(fw_core_data_ptr, fw_mem->core_data, fw_mem->core_data_alloc_size);
+
+	/* We're finished with the firmware section memory on the CPU, unmap. */
+	if (fw_core_data_ptr)
+		pvr_fw_object_vunmap(fw_mem->core_data_obj);
+	if (fw_core_code_ptr)
+		pvr_fw_object_vunmap(fw_mem->core_code_obj);
+	pvr_fw_object_vunmap(fw_mem->data_obj);
+	fw_data_ptr = NULL;
+	pvr_fw_object_vunmap(fw_mem->code_obj);
+	fw_code_ptr = NULL;
+
+	err = pvr_fw_create_fwif_connection_ctl(pvr_dev);
+	if (err)
+		goto err_free_fw_core_data_obj;
+
+	return 0;
+
+err_free_kdata:
+	kfree(fw_mem->core_data);
+	kfree(fw_mem->core_code);
+	kfree(fw_mem->data);
+	kfree(fw_mem->code);
+
+err_free_fw_core_data_obj:
+	if (fw_core_data_ptr)
+		pvr_fw_object_unmap_and_destroy(fw_mem->core_data_obj);
+
+err_free_fw_core_code_obj:
+	if (fw_core_code_ptr)
+		pvr_fw_object_unmap_and_destroy(fw_mem->core_code_obj);
+
+err_free_fw_data_obj:
+	if (fw_data_ptr)
+		pvr_fw_object_vunmap(fw_mem->data_obj);
+	pvr_fw_object_destroy(fw_mem->data_obj);
+
+err_free_fw_code_obj:
+	if (fw_code_ptr)
+		pvr_fw_object_vunmap(fw_mem->code_obj);
+	pvr_fw_object_destroy(fw_mem->code_obj);
+
+	return err;
+}
+
+static int
+pvr_copy_to_fw(struct pvr_fw_object *dest_obj, u8 *src_ptr, u32 size)
+{
+	u8 *dest_ptr = pvr_fw_object_vmap(dest_obj);
+
+	if (IS_ERR(dest_ptr))
+		return PTR_ERR(dest_ptr);
+
+	memcpy(dest_ptr, src_ptr, size);
+
+	pvr_fw_object_vunmap(dest_obj);
+
+	return 0;
+}
+
+static int
+pvr_fw_reinit_code_data(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
+	int err;
+
+	err = pvr_copy_to_fw(fw_mem->code_obj, fw_mem->code, fw_mem->code_alloc_size);
+	if (err)
+		return err;
+
+	err = pvr_copy_to_fw(fw_mem->data_obj, fw_mem->data, fw_mem->data_alloc_size);
+	if (err)
+		return err;
+
+	if (fw_mem->core_code) {
+		err = pvr_copy_to_fw(fw_mem->core_code_obj, fw_mem->core_code,
+				     fw_mem->core_code_alloc_size);
+		if (err)
+			return err;
+	}
+
+	if (fw_mem->core_data) {
+		err = pvr_copy_to_fw(fw_mem->core_data_obj, fw_mem->core_data,
+				     fw_mem->core_data_alloc_size);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static void
+pvr_fw_cleanup(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
+
+	pvr_fw_fini_fwif_connection_ctl(pvr_dev);
+	if (fw_mem->core_code_obj)
+		pvr_fw_object_destroy(fw_mem->core_code_obj);
+	if (fw_mem->core_data_obj)
+		pvr_fw_object_destroy(fw_mem->core_data_obj);
+	pvr_fw_object_destroy(fw_mem->code_obj);
+	pvr_fw_object_destroy(fw_mem->data_obj);
+}
+
+/**
+ * pvr_wait_for_fw_boot() - Wait for firmware to finish booting
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%ETIMEDOUT if firmware fails to boot within timeout.
+ */
+int
+pvr_wait_for_fw_boot(struct pvr_device *pvr_dev)
+{
+	ktime_t deadline = ktime_add_us(ktime_get(), FW_BOOT_TIMEOUT_USEC);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	while (ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0) {
+		if (READ_ONCE(fw_dev->fwif_sysinit->firmware_started))
+			return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
+/*
+ * pvr_fw_heap_info_init() - Calculate size and masks for FW heap
+ * @pvr_dev: Target PowerVR device.
+ * @log2_size: Log2 of raw heap size.
+ * @reserved_size: Size of reserved area of heap, in bytes. May be zero.
+ */
+void
+pvr_fw_heap_info_init(struct pvr_device *pvr_dev, u32 log2_size, u32 reserved_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	fw_dev->fw_heap_info.gpu_addr = PVR_ROGUE_FW_MAIN_HEAP_BASE;
+	fw_dev->fw_heap_info.log2_size = log2_size;
+	fw_dev->fw_heap_info.reserved_size = reserved_size;
+	fw_dev->fw_heap_info.raw_size = 1 << fw_dev->fw_heap_info.log2_size;
+	fw_dev->fw_heap_info.offset_mask = fw_dev->fw_heap_info.raw_size - 1;
+	fw_dev->fw_heap_info.config_offset = fw_dev->fw_heap_info.raw_size -
+					     PVR_ROGUE_FW_CONFIG_HEAP_SIZE;
+	fw_dev->fw_heap_info.size = fw_dev->fw_heap_info.raw_size -
+				    (PVR_ROGUE_FW_CONFIG_HEAP_SIZE + reserved_size);
+}
+
 /**
  * pvr_fw_validate_init_device_info() - Validate firmware and initialise device information
  * @pvr_dev: Target PowerVR device.
@@ -143,3 +909,579 @@ pvr_fw_validate_init_device_info(struct pvr_device *pvr_dev)
 
 	return pvr_fw_get_device_info(pvr_dev);
 }
+
+/**
+ * pvr_fw_init() - Initialise and boot firmware
+ * @pvr_dev: Target PowerVR device
+ *
+ * On successful completion of the function the PowerVR device will be
+ * initialised and ready to use.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -%EINVAL on invalid firmware image,
+ *  * -%ENOMEM on out of memory, or
+ *  * -%ETIMEDOUT if firmware processor fails to boot or on register poll timeout.
+ */
+int
+pvr_fw_init(struct pvr_device *pvr_dev)
+{
+	u32 kccb_size_log2 = ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT;
+	u32 kccb_rtn_size = (1 << kccb_size_log2) * sizeof(*pvr_dev->kccb.rtn);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	int err;
+
+	if (fw_dev->processor_type == PVR_FW_PROCESSOR_TYPE_META)
+		fw_dev->defs = &pvr_fw_defs_meta;
+	else
+		return -EINVAL;
+
+	err = fw_dev->defs->init(pvr_dev);
+	if (err)
+		return err;
+
+	drm_mm_init(&fw_dev->fw_mm, ROGUE_FW_HEAP_BASE, fw_dev->fw_heap_info.raw_size);
+	fw_dev->fw_mm_base = ROGUE_FW_HEAP_BASE;
+	spin_lock_init(&fw_dev->fw_mm_lock);
+
+	INIT_LIST_HEAD(&fw_dev->fw_objs.list);
+	err = drmm_mutex_init(from_pvr_device(pvr_dev), &fw_dev->fw_objs.lock);
+	if (err)
+		goto err_mm_takedown;
+
+	err = pvr_fw_process(pvr_dev);
+	if (err)
+		goto err_mm_takedown;
+
+	/* Initialise KCCB and FWCCB. */
+	err = pvr_kccb_init(pvr_dev);
+	if (err)
+		goto err_fw_cleanup;
+
+	err = pvr_fwccb_init(pvr_dev);
+	if (err)
+		goto err_kccb_fini;
+
+	/* Allocate memory for KCCB return slots. */
+	pvr_dev->kccb.rtn = pvr_fw_object_create_and_map(pvr_dev, kccb_rtn_size,
+							 PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+							 NULL, NULL, &pvr_dev->kccb.rtn_obj);
+	if (IS_ERR(pvr_dev->kccb.rtn)) {
+		err = PTR_ERR(pvr_dev->kccb.rtn);
+		goto err_fwccb_fini;
+	}
+
+	err = pvr_fw_create_structures(pvr_dev);
+	if (err)
+		goto err_kccb_rtn_release;
+
+	err = pvr_fw_start(pvr_dev);
+	if (err)
+		goto err_destroy_structures;
+
+	err = pvr_wait_for_fw_boot(pvr_dev);
+	if (err) {
+		drm_err(from_pvr_device(pvr_dev), "Firmware failed to boot\n");
+		goto err_fw_stop;
+	}
+
+	fw_dev->booted = true;
+
+	return 0;
+
+err_fw_stop:
+	pvr_fw_stop(pvr_dev);
+
+err_destroy_structures:
+	pvr_fw_destroy_structures(pvr_dev);
+
+err_kccb_rtn_release:
+	pvr_fw_object_unmap_and_destroy(pvr_dev->kccb.rtn_obj);
+
+err_fwccb_fini:
+	pvr_ccb_fini(&pvr_dev->fwccb);
+
+err_kccb_fini:
+	pvr_kccb_fini(pvr_dev);
+
+err_fw_cleanup:
+	pvr_fw_cleanup(pvr_dev);
+
+err_mm_takedown:
+	drm_mm_takedown(&fw_dev->fw_mm);
+
+	if (fw_dev->defs->fini)
+		fw_dev->defs->fini(pvr_dev);
+
+	return err;
+}
+
+/**
+ * pvr_fw_fini() - Shutdown firmware processor and free associated memory
+ * @pvr_dev: Target PowerVR device
+ */
+void
+pvr_fw_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	fw_dev->booted = false;
+
+	pvr_fw_destroy_structures(pvr_dev);
+	pvr_fw_object_unmap_and_destroy(pvr_dev->kccb.rtn_obj);
+
+	/*
+	 * Ensure FWCCB worker has finished executing before destroying FWCCB. The IRQ handler has
+	 * been unregistered at this point so no new work should be being submitted.
+	 */
+	pvr_ccb_fini(&pvr_dev->fwccb);
+	pvr_kccb_fini(pvr_dev);
+	pvr_fw_cleanup(pvr_dev);
+
+	mutex_lock(&pvr_dev->fw_dev.fw_objs.lock);
+	WARN_ON(!list_empty(&pvr_dev->fw_dev.fw_objs.list));
+	mutex_unlock(&pvr_dev->fw_dev.fw_objs.lock);
+
+	drm_mm_takedown(&fw_dev->fw_mm);
+
+	if (fw_dev->defs->fini)
+		fw_dev->defs->fini(pvr_dev);
+}
+
+/**
+ * pvr_fw_mts_schedule() - Schedule work via an MTS kick
+ * @pvr_dev: Target PowerVR device
+ * @val: Kick mask. Should be a combination of %ROGUE_CR_MTS_SCHEDULE_*
+ */
+void
+pvr_fw_mts_schedule(struct pvr_device *pvr_dev, u32 val)
+{
+	/* Ensure memory is flushed before kicking MTS. */
+	wmb();
+
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_SCHEDULE, val);
+
+	/* Ensure the MTS kick goes through before continuing. */
+	mb();
+}
+
+/**
+ * pvr_fw_structure_cleanup() - Send FW cleanup request for an object
+ * @pvr_dev: Target PowerVR device.
+ * @type: Type of object to cleanup. Must be one of &enum rogue_fwif_cleanup_type.
+ * @fw_obj: Pointer to FW object containing object to cleanup.
+ * @offset: Offset within FW object of object to cleanup.
+ *
+ * Returns:
+ *  * 0 on success,
+ *  * -EBUSY if object is busy,
+ *  * -ETIMEDOUT on timeout, or
+ *  * -EIO if device is lost.
+ */
+int
+pvr_fw_structure_cleanup(struct pvr_device *pvr_dev, u32 type, struct pvr_fw_object *fw_obj,
+			 u32 offset)
+{
+	struct rogue_fwif_kccb_cmd cmd;
+	int slot_nr;
+	int idx;
+	int err;
+	u32 rtn;
+
+	struct rogue_fwif_cleanup_request *cleanup_req = &cmd.cmd_data.cleanup_data;
+
+	down_read(&pvr_dev->reset_sem);
+
+	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
+		err = -EIO;
+		goto err_up_read;
+	}
+
+	cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_CLEANUP;
+	cmd.kccb_flags = 0;
+	cleanup_req->cleanup_type = type;
+
+	switch (type) {
+	case ROGUE_FWIF_CLEANUP_FWCOMMONCONTEXT:
+		pvr_fw_object_get_fw_addr_offset(fw_obj, offset,
+						 &cleanup_req->cleanup_data.context_fw_addr);
+		break;
+	case ROGUE_FWIF_CLEANUP_HWRTDATA:
+		pvr_fw_object_get_fw_addr_offset(fw_obj, offset,
+						 &cleanup_req->cleanup_data.hwrt_data_fw_addr);
+		break;
+	case ROGUE_FWIF_CLEANUP_FREELIST:
+		pvr_fw_object_get_fw_addr_offset(fw_obj, offset,
+						 &cleanup_req->cleanup_data.freelist_fw_addr);
+		break;
+	default:
+		err = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd, &slot_nr);
+	if (err)
+		goto err_drm_dev_exit;
+
+	err = pvr_kccb_wait_for_completion(pvr_dev, slot_nr, HZ, &rtn);
+	if (err)
+		goto err_drm_dev_exit;
+
+	if (rtn & ROGUE_FWIF_KCCB_RTN_SLOT_CLEANUP_BUSY)
+		err = -EBUSY;
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+err_up_read:
+	up_read(&pvr_dev->reset_sem);
+
+	return err;
+}
+
+/**
+ * pvr_fw_object_fw_map() - Map a FW object in firmware address space
+ * @pvr_dev: Device pointer.
+ * @fw_obj: FW object to map.
+ * @dev_addr: Desired address in device space, if a specific address is
+ *            required. 0 otherwise.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if @fw_obj is already mapped but has no references, or
+ *  * Any error returned by DRM.
+ */
+static int
+pvr_fw_object_fw_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj, u64 dev_addr)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	struct drm_gem_object *gem_obj = gem_from_pvr_gem(pvr_obj);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	int err;
+
+	spin_lock(&fw_dev->fw_mm_lock);
+
+	if (drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
+		err = -EINVAL;
+		goto err_unlock;
+	}
+
+	if (!dev_addr) {
+		/*
+		 * Allocate from the main heap only (firmware heap minus
+		 * config space).
+		 */
+		err = drm_mm_insert_node_in_range(&fw_dev->fw_mm, &fw_obj->fw_mm_node,
+						  gem_obj->size, 0, 0,
+						  fw_dev->fw_heap_info.gpu_addr,
+						  fw_dev->fw_heap_info.gpu_addr +
+						  fw_dev->fw_heap_info.size, 0);
+		if (err)
+			goto err_unlock;
+	} else {
+		fw_obj->fw_mm_node.start = dev_addr;
+		fw_obj->fw_mm_node.size = gem_obj->size;
+		err = drm_mm_reserve_node(&fw_dev->fw_mm, &fw_obj->fw_mm_node);
+		if (err)
+			goto err_unlock;
+	}
+
+	spin_unlock(&fw_dev->fw_mm_lock);
+
+	/* Map object on GPU. */
+	err = fw_dev->defs->vm_map(pvr_dev, fw_obj);
+	if (err)
+		goto err_remove_node;
+
+	fw_obj->fw_addr_offset = (u32)(fw_obj->fw_mm_node.start - fw_dev->fw_mm_base);
+
+	return 0;
+
+err_remove_node:
+	spin_lock(&fw_dev->fw_mm_lock);
+	drm_mm_remove_node(&fw_obj->fw_mm_node);
+
+err_unlock:
+	spin_unlock(&fw_dev->fw_mm_lock);
+
+	return err;
+}
+
+/**
+ * pvr_fw_object_fw_unmap() - Unmap a previously mapped FW object
+ * @fw_obj: FW object to unmap.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if object is not currently mapped.
+ */
+static int
+pvr_fw_object_fw_unmap(struct pvr_fw_object *fw_obj)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	struct drm_gem_object *gem_obj = gem_from_pvr_gem(pvr_obj);
+	struct pvr_device *pvr_dev = to_pvr_device(gem_obj->dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	fw_dev->defs->vm_unmap(pvr_dev, fw_obj);
+
+	spin_lock(&fw_dev->fw_mm_lock);
+
+	if (!drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
+		spin_unlock(&fw_dev->fw_mm_lock);
+		return -EINVAL;
+	}
+
+	drm_mm_remove_node(&fw_obj->fw_mm_node);
+
+	spin_unlock(&fw_dev->fw_mm_lock);
+
+	return 0;
+}
+
+static void *
+pvr_fw_object_create_and_map_common(struct pvr_device *pvr_dev, size_t size,
+				    u64 flags, u64 dev_addr,
+				    void (*init)(void *cpu_ptr, void *priv),
+				    void *init_priv, struct pvr_fw_object **fw_obj_out)
+{
+	struct pvr_fw_object *fw_obj;
+	void *cpu_ptr;
+	int err;
+
+	/* %DRM_PVR_BO_PM_FW_PROTECT is implicit for FW objects. */
+	flags |= DRM_PVR_BO_PM_FW_PROTECT;
+
+	fw_obj = kzalloc(sizeof(*fw_obj), GFP_KERNEL);
+	if (!fw_obj)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&fw_obj->node);
+	fw_obj->init = init;
+	fw_obj->init_priv = init_priv;
+
+	fw_obj->gem = pvr_gem_object_create(pvr_dev, size, flags);
+	if (IS_ERR(fw_obj->gem)) {
+		err = PTR_ERR(fw_obj->gem);
+		fw_obj->gem = NULL;
+		goto err_put_object;
+	}
+
+	err = pvr_fw_object_fw_map(pvr_dev, fw_obj, dev_addr);
+	if (err)
+		goto err_put_object;
+
+	cpu_ptr = pvr_fw_object_vmap(fw_obj);
+	if (IS_ERR(cpu_ptr)) {
+		err = PTR_ERR(cpu_ptr);
+		goto err_put_object;
+	}
+
+	*fw_obj_out = fw_obj;
+
+	if (fw_obj->init)
+		fw_obj->init(cpu_ptr, fw_obj->init_priv);
+
+	mutex_lock(&pvr_dev->fw_dev.fw_objs.lock);
+	list_add_tail(&fw_obj->node, &pvr_dev->fw_dev.fw_objs.list);
+	mutex_unlock(&pvr_dev->fw_dev.fw_objs.lock);
+
+	return cpu_ptr;
+
+err_put_object:
+	pvr_fw_object_destroy(fw_obj);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_fw_object_create() - Create a FW object and map to firmware
+ * @pvr_dev: PowerVR device pointer.
+ * @size: Size of object, in bytes.
+ * @flags: Options which affect both this operation and future mapping
+ * operations performed on the returned object. Must be a combination of
+ * DRM_PVR_BO_* and/or PVR_BO_* flags.
+ * @init: Initialisation callback.
+ * @init_priv: Private pointer to pass to initialisation callback.
+ * @fw_obj_out: Pointer to location to store created object pointer.
+ *
+ * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT is implied for all FW objects. Consequently,
+ * this function will fail if @flags has %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS
+ * set.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_fw_object_create_common().
+ */
+int
+pvr_fw_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags,
+		     void (*init)(void *cpu_ptr, void *priv), void *init_priv,
+		     struct pvr_fw_object **fw_obj_out)
+{
+	void *cpu_ptr;
+
+	cpu_ptr = pvr_fw_object_create_and_map_common(pvr_dev, size, flags, 0, init, init_priv,
+						      fw_obj_out);
+	if (IS_ERR(cpu_ptr))
+		return PTR_ERR(cpu_ptr);
+
+	pvr_fw_object_vunmap(*fw_obj_out);
+
+	return 0;
+}
+
+/**
+ * pvr_fw_object_create_and_map() - Create a FW object and map to firmware and CPU
+ * @pvr_dev: PowerVR device pointer.
+ * @size: Size of object, in bytes.
+ * @flags: Options which affect both this operation and future mapping
+ * operations performed on the returned object. Must be a combination of
+ * DRM_PVR_BO_* and/or PVR_BO_* flags.
+ * @init: Initialisation callback.
+ * @init_priv: Private pointer to pass to initialisation callback.
+ * @fw_obj_out: Pointer to location to store created object pointer.
+ *
+ * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT is implied for all FW objects. Consequently,
+ * this function will fail if @flags has %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS
+ * set.
+ *
+ * Caller is responsible for calling pvr_fw_object_vunmap() to release the CPU
+ * mapping.
+ *
+ * Returns:
+ *  * Pointer to CPU mapping of newly created object, or
+ *  * Any error returned by pvr_fw_object_create(), or
+ *  * Any error returned by pvr_fw_object_vmap().
+ */
+void *
+pvr_fw_object_create_and_map(struct pvr_device *pvr_dev, size_t size, u64 flags,
+			     void (*init)(void *cpu_ptr, void *priv),
+			     void *init_priv, struct pvr_fw_object **fw_obj_out)
+{
+	return pvr_fw_object_create_and_map_common(pvr_dev, size, flags, 0, init, init_priv,
+						   fw_obj_out);
+}
+
+/**
+ * pvr_fw_object_create_and_map_offset() - Create a FW object and map to
+ * firmware at the provided offset and to the CPU.
+ * @pvr_dev: PowerVR device pointer.
+ * @dev_offset: Base address of desired FW mapping, offset from start of FW heap.
+ * @size: Size of object, in bytes.
+ * @flags: Options which affect both this operation and future mapping
+ * operations performed on the returned object. Must be a combination of
+ * DRM_PVR_BO_* and/or PVR_BO_* flags.
+ * @init: Initialisation callback.
+ * @init_priv: Private pointer to pass to initialisation callback.
+ * @fw_obj_out: Pointer to location to store created object pointer.
+ *
+ * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT is implied for all FW objects. Consequently,
+ * this function will fail if @flags has %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS
+ * set.
+ *
+ * Caller is responsible for calling pvr_fw_object_vunmap() to release the CPU
+ * mapping.
+ *
+ * Returns:
+ *  * Pointer to CPU mapping of newly created object, or
+ *  * Any error returned by pvr_fw_object_create(), or
+ *  * Any error returned by pvr_fw_object_vmap().
+ */
+void *
+pvr_fw_object_create_and_map_offset(struct pvr_device *pvr_dev,
+				    u32 dev_offset, size_t size, u64 flags,
+				    void (*init)(void *cpu_ptr, void *priv),
+				    void *init_priv, struct pvr_fw_object **fw_obj_out)
+{
+	u64 dev_addr = pvr_dev->fw_dev.fw_mm_base + dev_offset;
+
+	return pvr_fw_object_create_and_map_common(pvr_dev, size, flags, dev_addr, init, init_priv,
+						   fw_obj_out);
+}
+
+/**
+ * pvr_fw_object_destroy() - Destroy a pvr_fw_object
+ * @fw_obj: Pointer to object to destroy.
+ */
+void pvr_fw_object_destroy(struct pvr_fw_object *fw_obj)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	struct drm_gem_object *gem_obj = gem_from_pvr_gem(pvr_obj);
+	struct pvr_device *pvr_dev = to_pvr_device(gem_obj->dev);
+
+	mutex_lock(&pvr_dev->fw_dev.fw_objs.lock);
+	list_del(&fw_obj->node);
+	mutex_unlock(&pvr_dev->fw_dev.fw_objs.lock);
+
+	if (drm_mm_node_allocated(&fw_obj->fw_mm_node)) {
+		/* If we can't unmap, leak the memory. */
+		if (WARN_ON(pvr_fw_object_fw_unmap(fw_obj)))
+			return;
+	}
+
+	if (fw_obj->gem)
+		pvr_gem_object_put(fw_obj->gem);
+
+	kfree(fw_obj);
+}
+
+/**
+ * pvr_fw_object_get_fw_addr_offset() - Return address of object in firmware address space, with
+ * given offset.
+ * @fw_obj: Pointer to object.
+ * @offset: Desired offset from start of object.
+ * @fw_addr_out: Location to store address to.
+ */
+void pvr_fw_object_get_fw_addr_offset(struct pvr_fw_object *fw_obj, u32 offset, u32 *fw_addr_out)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(pvr_obj)->dev);
+
+	*fw_addr_out = pvr_dev->fw_dev.defs->get_fw_addr_with_offset(fw_obj, offset);
+}
+
+/*
+ * pvr_fw_hard_reset() - Re-initialise the FW code and data segments, and reset all global FW
+ *                       structures
+ * @pvr_dev: Device pointer
+ *
+ * If this function returns an error then the caller must regard the device as lost.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_fw_init_dev_structures() or pvr_fw_reset_all().
+ */
+int
+pvr_fw_hard_reset(struct pvr_device *pvr_dev)
+{
+	struct list_head *pos;
+	int err;
+
+	/* Reset all FW objects */
+	mutex_lock(&pvr_dev->fw_dev.fw_objs.lock);
+
+	list_for_each(pos, &pvr_dev->fw_dev.fw_objs.list) {
+		struct pvr_fw_object *fw_obj = container_of(pos, struct pvr_fw_object, node);
+		void *cpu_ptr = pvr_fw_object_vmap(fw_obj);
+
+		WARN_ON(IS_ERR(cpu_ptr));
+
+		if (!(fw_obj->gem->flags & PVR_BO_FW_NO_CLEAR_ON_RESET)) {
+			memset(cpu_ptr, 0, pvr_gem_object_size(fw_obj->gem));
+
+			if (fw_obj->init)
+				fw_obj->init(cpu_ptr, fw_obj->init_priv);
+		}
+
+		pvr_fw_object_vunmap(fw_obj);
+	}
+
+	mutex_unlock(&pvr_dev->fw_dev.fw_objs.lock);
+
+	err = pvr_fw_reinit_code_data(pvr_dev);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_fw.h b/drivers/gpu/drm/imagination/pvr_fw.h
index dca7fe5b3dd0..8b36fe6d85e3 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.h
+++ b/drivers/gpu/drm/imagination/pvr_fw.h
@@ -5,6 +5,10 @@
 #define PVR_FW_H
 
 #include "pvr_fw_info.h"
+#include "pvr_fw_trace.h"
+#include "pvr_gem.h"
+
+#include <drm/drm_mm.h>
 
 #include <linux/types.h>
 
@@ -12,6 +16,289 @@
 struct pvr_device;
 struct pvr_file;
 
+/* Forward declaration from "pvr_vm.h". */
+struct pvr_vm_context;
+
+#define ROGUE_FWIF_FWCCB_NUMCMDS_LOG2 5
+
+#define ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT 7
+
+/**
+ * struct pvr_fw_object - container for firmware memory allocations
+ */
+struct pvr_fw_object {
+	/** @ref_count: FW object reference counter. */
+	struct kref ref_count;
+
+	/** @gem: GEM object backing the FW object. */
+	struct pvr_gem_object *gem;
+
+	/**
+	 * @fw_mm_node: Node representing mapping in FW address space. @pvr_obj->lock must
+	 *              be held when writing.
+	 */
+	struct drm_mm_node fw_mm_node;
+
+	/**
+	 * @fw_addr_offset: Virtual address offset of firmware mapping. Only
+	 *                  valid if @flags has %PVR_GEM_OBJECT_FLAGS_FW_MAPPED
+	 *                  set.
+	 */
+	u32 fw_addr_offset;
+
+	/**
+	 * @init: Initialisation callback. Will be called on object creation and FW hard reset.
+	 *        Object will have been zeroed before this is called.
+	 */
+	void (*init)(void *cpu_ptr, void *priv);
+
+	/** @init_priv: Private data for initialisation callback. */
+	void *init_priv;
+
+	/** @node: Node for firmware object list. */
+	struct list_head node;
+};
+
+/**
+ * struct pvr_fw_defs - FW processor function table and static definitions
+ */
+struct pvr_fw_defs {
+	/**
+	 * @init:
+	 *
+	 * FW processor specific initialisation.
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function must call pvr_fw_heap_calculate() to initialise the firmware heap for this
+	 * FW processor.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success, or
+	 *  * Any appropriate error on failure.
+	 */
+	int (*init)(struct pvr_device *pvr_dev);
+
+	/**
+	 * @fini:
+	 *
+	 * FW processor specific finalisation.
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function is optional.
+	 */
+	void (*fini)(struct pvr_device *pvr_dev);
+
+	/**
+	 * @fw_process:
+	 *
+	 * Load and process firmware image.
+	 * @pvr_dev: Target PowerVR device.
+	 * @fw: Pointer to firmware image.
+	 * @fw_code_ptr: Pointer to firmware code section.
+	 * @fw_data_ptr: Pointer to firmware data section.
+	 * @fw_core_code_ptr: Pointer to firmware core code section. May be %NULL.
+	 * @fw_core_data_ptr: Pointer to firmware core data section. May be %NULL.
+	 * @core_code_alloc_size: Total allocation size of core code section.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success, or
+	 *  * Any appropriate error on failure.
+	 */
+	int (*fw_process)(struct pvr_device *pvr_dev, const u8 *fw,
+			  u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr,
+			  u8 *fw_core_data_ptr, u32 core_code_alloc_size);
+
+	/**
+	 * @vm_map:
+	 *
+	 * Map FW object into FW processor address space.
+	 * @pvr_dev: Target PowerVR device.
+	 * @fw_obj: FW object to map.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success, or
+	 *  * Any appropriate error on failure.
+	 */
+	int (*vm_map)(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+	/**
+	 * @vm_unmap:
+	 *
+	 * Unmap FW object from FW processor address space.
+	 * @pvr_dev: Target PowerVR device.
+	 * @fw_obj: FW object to map.
+	 *
+	 * This function is mandatory.
+	 */
+	void (*vm_unmap)(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj);
+
+	/**
+	 * @get_fw_addr_with_offset:
+	 *
+	 * Called to get address of object in firmware address space, with offset.
+	 * @fw_obj: Pointer to object.
+	 * @offset: Desired offset from start of object.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * Address in firmware address space.
+	 */
+	u32 (*get_fw_addr_with_offset)(struct pvr_fw_object *fw_obj, u32 offset);
+
+	/**
+	 * @wrapper_init:
+	 *
+	 * Called to initialise FW wrapper.
+	 * @pvr_dev: Target PowerVR device.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * 0 on success.
+	 *  * Any appropriate error on failure.
+	 */
+	int (*wrapper_init)(struct pvr_device *pvr_dev);
+
+	/**
+	 * @has_fixed_data_addr:
+	 *
+	 * Called to check if firmware fixed data must be loaded at the address given by the
+	 * firmware layout table.
+	 *
+	 * This function is mandatory.
+	 *
+	 * Returns:
+	 *  * %true if firmware fixed data must be loaded at the address given by the firmware
+	 *    layout table.
+	 *  * %false otherwise.
+	 */
+	bool (*has_fixed_data_addr)(void);
+
+	/**
+	 * @irq: FW Interrupt information.
+	 *
+	 * Those are processor dependent, and should be initialized by the
+	 * processor backend in pvr_fw_funcs::init().
+	 */
+	struct {
+		/** @enable_reg: FW interrupt enable register. */
+		u32 enable_reg;
+
+		/** @status_reg: FW interrupt status register. */
+		u32 status_reg;
+
+		/**
+		 * @clear_reg: FW interrupt clear register.
+		 *
+		 * If @status_reg == @clear_reg, we clear by write a bit to zero,
+		 * otherwise we clear by writing a bit to one.
+		 */
+		u32 clear_reg;
+
+		/** @event_mask: Bitmask of events to listen for. */
+		u32 event_mask;
+
+		/** @clear_mask: Value to write to the clear_reg in order to clear FW IRQs. */
+		u32 clear_mask;
+	} irq;
+};
+
+/**
+ * struct pvr_fw_mem - FW memory allocations
+ */
+struct pvr_fw_mem {
+	/** @code_obj: Object representing firmware code. */
+	struct pvr_fw_object *code_obj;
+
+	/** @data_obj: Object representing firmware data. */
+	struct pvr_fw_object *data_obj;
+
+	/**
+	 * @core_code_obj: Object representing firmware core code. May be
+	 *                 %NULL if firmware does not contain this section.
+	 */
+	struct pvr_fw_object *core_code_obj;
+
+	/**
+	 * @core_data_obj: Object representing firmware core data. May be
+	 *                 %NULL if firmware does not contain this section.
+	 */
+	struct pvr_fw_object *core_data_obj;
+
+	/** @code: Driver-side copy of firmware code. */
+	u8 *code;
+
+	/** @data: Driver-side copy of firmware data. */
+	u8 *data;
+
+	/**
+	 * @core_code: Driver-side copy of firmware core code. May be %NULL if firmware does not
+	 *             contain this section.
+	 */
+	u8 *core_code;
+
+	/**
+	 * @core_data: Driver-side copy of firmware core data. May be %NULL if firmware does not
+	 *             contain this section.
+	 */
+	u8 *core_data;
+
+	/** @code_alloc_size: Allocation size of firmware code section. */
+	u32 code_alloc_size;
+
+	/** @data_alloc_size: Allocation size of firmware data section. */
+	u32 data_alloc_size;
+
+	/** @core_code_alloc_size: Allocation size of firmware core code section. */
+	u32 core_code_alloc_size;
+
+	/** @core_data_alloc_size: Allocation size of firmware core data section. */
+	u32 core_data_alloc_size;
+
+	/**
+	 * @fwif_connection_ctl_obj: Object representing FWIF connection control
+	 *                           structure.
+	 */
+	struct pvr_fw_object *fwif_connection_ctl_obj;
+
+	/** @osinit_obj: Object representing FW OSINIT structure. */
+	struct pvr_fw_object *osinit_obj;
+
+	/** @sysinit_obj: Object representing FW SYSINIT structure. */
+	struct pvr_fw_object *sysinit_obj;
+
+	/** @osdata_obj: Object representing FW OSDATA structure. */
+	struct pvr_fw_object *osdata_obj;
+
+	/** @hwrinfobuf_obj: Object representing FW hwrinfobuf structure. */
+	struct pvr_fw_object *hwrinfobuf_obj;
+
+	/** @sysdata_obj: Object representing FW SYSDATA structure. */
+	struct pvr_fw_object *sysdata_obj;
+
+	/** @power_sync_obj: Object representing power sync state. */
+	struct pvr_fw_object *power_sync_obj;
+
+	/** @fault_page_obj: Object representing FW fault page. */
+	struct pvr_fw_object *fault_page_obj;
+
+	/** @gpu_util_fwcb_obj: Object representing FW GPU utilisation control structure. */
+	struct pvr_fw_object *gpu_util_fwcb_obj;
+
+	/** @runtime_cfg_obj: Object representing FW runtime config structure. */
+	struct pvr_fw_object *runtime_cfg_obj;
+
+	/** @mmucache_sync_obj: Object used as the sync parameter in an MMU cache operation. */
+	struct pvr_fw_object *mmucache_sync_obj;
+};
+
 struct pvr_fw_device {
 	/** @firmware: Handle to the firmware loaded into the device. */
 	const struct firmware *firmware;
@@ -22,13 +309,200 @@ struct pvr_fw_device {
 	/** @layout_entries: Pointer to firmware layout. */
 	const struct pvr_fw_layout_entry *layout_entries;
 
+	/** @mem: Structure containing objects representing firmware memory allocations. */
+	struct pvr_fw_mem mem;
+
+	/** @booted: %true if the firmware has been booted, %false otherwise. */
+	bool booted;
+
 	/**
 	 * @processor_type: FW processor type for this device. Must be one of
 	 *                  %PVR_FW_PROCESSOR_TYPE_*.
 	 */
 	u16 processor_type;
+
+	/** @funcs: Function table for the FW processor used by this device. */
+	const struct pvr_fw_defs *defs;
+
+	/** @processor_data: Pointer to data specific to FW processor. */
+	union {
+		/** @mips_data: Pointer to MIPS-specific data. */
+		struct pvr_fw_mips_data *mips_data;
+	} processor_data;
+
+	/** @fw_heap_info: Firmware heap information. */
+	struct {
+		/** @gpu_addr: Base address of firmware heap in GPU address space. */
+		u64 gpu_addr;
+
+		/** @size: Size of main area of heap. */
+		u32 size;
+
+		/** @offset_mask: Mask for offsets within FW heap. */
+		u32 offset_mask;
+
+		/** @raw_size: Raw size of heap, including reserved areas. */
+		u32 raw_size;
+
+		/** @log2_size: Log2 of raw size of heap. */
+		u32 log2_size;
+
+		/** @config_offset: Offset of config area within heap. */
+		u32 config_offset;
+
+		/** @reserved_size: Size of reserved area in heap. */
+		u32 reserved_size;
+	} fw_heap_info;
+
+	/** @fw_mm: Firmware address space allocator. */
+	struct drm_mm fw_mm;
+
+	/** @fw_mm_lock: Lock protecting access to &fw_mm. */
+	spinlock_t fw_mm_lock;
+
+	/** @fw_mm_base: Base address of address space managed by @fw_mm. */
+	u64 fw_mm_base;
+
+	/**
+	 * @fwif_connection_ctl: Pointer to CPU mapping of FWIF connection
+	 *                       control structure.
+	 */
+	struct rogue_fwif_connection_ctl *fwif_connection_ctl;
+
+	/** @fwif_sysinit: Pointer to CPU mapping of FW SYSINIT structure. */
+	struct rogue_fwif_sysinit *fwif_sysinit;
+
+	/** @fwif_sysdata: Pointer to CPU mapping of FW SYSDATA structure. */
+	struct rogue_fwif_sysdata *fwif_sysdata;
+
+	/** @fwif_osinit: Pointer to CPU mapping of FW OSINIT structure. */
+	struct rogue_fwif_osinit *fwif_osinit;
+
+	/** @fwif_osdata: Pointer to CPU mapping of FW OSDATA structure. */
+	struct rogue_fwif_osdata *fwif_osdata;
+
+	/** @power_sync: Pointer to CPU mapping of power sync state. */
+	u32 *power_sync;
+
+	/** @hwrinfobuf: Pointer to CPU mapping of FW HWR info buffer. */
+	struct rogue_fwif_hwrinfobuf *hwrinfobuf;
+
+	/** @fw_trace: Device firmware trace buffer state. */
+	struct pvr_fw_trace fw_trace;
+
+	/** @fw_objs: Structure tracking FW objects. */
+	struct {
+		/** @list: Head of FW object list. */
+		struct list_head list;
+
+		/** @lock: Lock protecting access to FW object list. */
+		struct mutex lock;
+	} fw_objs;
 };
 
+#define pvr_fw_irq_read_reg(pvr_dev, name) \
+	pvr_cr_read32((pvr_dev), (pvr_dev)->fw_dev.defs->irq.name ## _reg)
+
+#define pvr_fw_irq_write_reg(pvr_dev, name, value) \
+	pvr_cr_write32((pvr_dev), (pvr_dev)->fw_dev.defs->irq.name ## _reg, value)
+
+#define pvr_fw_irq_pending(pvr_dev) \
+	(pvr_fw_irq_read_reg(pvr_dev, status) & (pvr_dev)->fw_dev.defs->irq.event_mask)
+
+#define pvr_fw_irq_clear(pvr_dev) \
+	pvr_fw_irq_write_reg(pvr_dev, clear, (pvr_dev)->fw_dev.defs->irq.clear_mask)
+
+#define pvr_fw_irq_enable(pvr_dev) \
+	pvr_fw_irq_write_reg(pvr_dev, enable, (pvr_dev)->fw_dev.defs->irq.event_mask)
+
+#define pvr_fw_irq_disable(pvr_dev) \
+	pvr_fw_irq_write_reg(pvr_dev, enable, 0)
+
+extern const struct pvr_fw_defs pvr_fw_defs_meta;
+extern const struct pvr_fw_defs pvr_fw_defs_mips;
+
 int pvr_fw_validate_init_device_info(struct pvr_device *pvr_dev);
+int pvr_fw_init(struct pvr_device *pvr_dev);
+void pvr_fw_fini(struct pvr_device *pvr_dev);
+
+int pvr_wait_for_fw_boot(struct pvr_device *pvr_dev);
+
+int
+pvr_fw_hard_reset(struct pvr_device *pvr_dev);
+
+void pvr_fw_mts_schedule(struct pvr_device *pvr_dev, u32 val);
+
+void
+pvr_fw_heap_info_init(struct pvr_device *pvr_dev, u32 log2_size, u32 reserved_size);
+
+const struct pvr_fw_layout_entry *
+pvr_fw_find_layout_entry(struct pvr_device *pvr_dev, enum pvr_fw_section_id id);
+int
+pvr_fw_find_mmu_segment(struct pvr_device *pvr_dev, u32 addr, u32 size, void *fw_code_ptr,
+			void *fw_data_ptr, void *fw_core_code_ptr, void *fw_core_data_ptr,
+			void **host_addr_out);
+
+int
+pvr_fw_structure_cleanup(struct pvr_device *pvr_dev, u32 type, struct pvr_fw_object *fw_obj,
+			 u32 offset);
+
+int pvr_fw_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags,
+			 void (*init)(void *cpu_ptr, void *priv), void *init_priv,
+			 struct pvr_fw_object **pvr_obj_out);
+
+void *pvr_fw_object_create_and_map(struct pvr_device *pvr_dev, size_t size, u64 flags,
+				   void (*init)(void *cpu_ptr, void *priv),
+				   void *init_priv, struct pvr_fw_object **pvr_obj_out);
+
+void *
+pvr_fw_object_create_and_map_offset(struct pvr_device *pvr_dev, u32 dev_offset, size_t size,
+				    u64 flags, void (*init)(void *cpu_ptr, void *priv),
+				    void *init_priv, struct pvr_fw_object **pvr_obj_out);
+
+static __always_inline void *
+pvr_fw_object_vmap(struct pvr_fw_object *fw_obj)
+{
+	return pvr_gem_object_vmap(fw_obj->gem);
+}
+
+static __always_inline void
+pvr_fw_object_vunmap(struct pvr_fw_object *fw_obj)
+{
+	pvr_gem_object_vunmap(fw_obj->gem);
+}
+
+void pvr_fw_object_destroy(struct pvr_fw_object *fw_obj);
+
+static __always_inline void
+pvr_fw_object_unmap_and_destroy(struct pvr_fw_object *fw_obj)
+{
+	pvr_fw_object_vunmap(fw_obj);
+	pvr_fw_object_destroy(fw_obj);
+}
+
+/**
+ * pvr_fw_get_dma_addr() - Get DMA address for given offset in firmware object
+ * @fw_obj: Pointer to object to lookup address in.
+ * @offset: Offset within object to lookup address at.
+ * @dma_addr_out: Pointer to location to store DMA address.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if object is not currently backed, or if @offset is out of valid
+ *    range for this object.
+ */
+static __always_inline int
+pvr_fw_object_get_dma_addr(struct pvr_fw_object *fw_obj, u32 offset, dma_addr_t *dma_addr_out)
+{
+	return pvr_gem_get_dma_addr(fw_obj->gem, offset, dma_addr_out);
+}
+
+void pvr_fw_object_get_fw_addr_offset(struct pvr_fw_object *fw_obj, u32 offset, u32 *fw_addr_out);
+
+static __always_inline void
+pvr_fw_object_get_fw_addr(struct pvr_fw_object *fw_obj, u32 *fw_addr_out)
+{
+	pvr_fw_object_get_fw_addr_offset(fw_obj, 0, fw_addr_out);
+}
 
 #endif /* PVR_FW_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
new file mode 100644
index 000000000000..7a5d26c0b9e0
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -0,0 +1,554 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_info.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_cr_defs.h"
+#include "pvr_rogue_meta.h"
+#include "pvr_vm.h"
+
+#include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/ktime.h>
+#include <linux/types.h>
+
+#define ROGUE_FW_HEAP_META_SHIFT 25 /* 32 MB */
+
+#define POLL_TIMEOUT_USEC 1000000
+
+/**
+ * pvr_meta_cr_read32() - Read a META register via the Slave Port
+ * @pvr_dev: Device pointer.
+ * @reg_addr: Address of register to read.
+ * @reg_value_out: Pointer to location to store register value.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_cr_poll_reg32().
+ */
+int
+pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
+{
+	int err;
+
+	/* Wait for Slave Port to be Ready. */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL1,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	/* Issue a Read. */
+	pvr_cr_write32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL0,
+		       reg_addr | ROGUE_CR_META_SP_MSLVCTRL0_RD_EN);
+	(void)pvr_cr_read32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL0); /* Fence write. */
+
+	/* Wait for Slave Port to be Ready. */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_META_SP_MSLVCTRL1,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				ROGUE_CR_META_SP_MSLVCTRL1_READY_EN |
+					ROGUE_CR_META_SP_MSLVCTRL1_GBLPORT_IDLE_EN,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	*reg_value_out = pvr_cr_read32(pvr_dev, ROGUE_CR_META_SP_MSLVDATAX);
+
+	return 0;
+}
+
+static int
+pvr_meta_wrapper_init(struct pvr_device *pvr_dev)
+{
+	u64 garten_config;
+
+	/* Configure META to Master boot. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_META_BOOT, ROGUE_CR_META_BOOT_MODE_EN);
+
+	/* Set Garten IDLE to META idle and Set the Garten Wrapper BIF Fence address. */
+
+	/* Garten IDLE bit controlled by META. */
+	garten_config = ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_IDLE_CTRL_META;
+
+	/* The fence addr is set during the fw init sequence. */
+
+	/* Set PC = 0 for fences. */
+	garten_config &=
+		ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_FENCE_PC_BASE_CLRMSK;
+	garten_config |=
+		(u64)MMU_CONTEXT_MAPPING_FWPRIV
+		<< ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_FENCE_PC_BASE_SHIFT;
+
+	/* Set SLC DM=META. */
+	garten_config |= ((u64)ROGUE_FW_SEGMMU_META_BIFDM_ID)
+			 << ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG_FENCE_DM_SHIFT;
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_MTS_GARTEN_WRAPPER_CONFIG, garten_config);
+
+	return 0;
+}
+
+static __always_inline void
+add_boot_arg(u32 **boot_conf, u32 param, u32 data)
+{
+	*(*boot_conf)++ = param;
+	*(*boot_conf)++ = data;
+}
+
+static int
+meta_ldr_cmd_loadmem(struct drm_device *drm_dev, const u8 *fw,
+		     struct rogue_meta_ldr_l1_data_blk *l1_data, u32 coremem_size, u8 *fw_code_ptr,
+		     u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr, const u32 fw_size)
+{
+	struct rogue_meta_ldr_l2_data_blk *l2_block =
+		(struct rogue_meta_ldr_l2_data_blk *)(fw +
+						      l1_data->cmd_data[1]);
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	u32 offset = l1_data->cmd_data[0];
+	u32 data_size;
+	void *write_addr;
+	int err;
+
+	/* Verify header is within bounds. */
+	if (((u8 *)l2_block - fw) >= fw_size || ((u8 *)(l2_block + 1) - fw) >= fw_size)
+		return -EINVAL;
+
+	data_size = l2_block->length - 6 /* L2 Tag length and checksum */;
+
+	/* Verify data is within bounds. */
+	if (((u8 *)l2_block->block_data - fw) >= fw_size ||
+	    ((((u8 *)l2_block->block_data) + data_size) - fw) >= fw_size)
+		return -EINVAL;
+
+	if (!ROGUE_META_IS_COREMEM_CODE(offset, coremem_size) &&
+	    !ROGUE_META_IS_COREMEM_DATA(offset, coremem_size)) {
+		/* Global range is aliased to local range */
+		offset &= ~META_MEM_GLOBAL_RANGE_BIT;
+	}
+
+	err = pvr_fw_find_mmu_segment(pvr_dev, offset, data_size, fw_code_ptr, fw_data_ptr,
+				      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+	if (err) {
+		drm_err(drm_dev,
+			"Addr 0x%x (size: %d) not found in any firmware segment",
+			offset, data_size);
+		return err;
+	}
+
+	memcpy(write_addr, l2_block->block_data, data_size);
+
+	return 0;
+}
+
+static int
+meta_ldr_cmd_zeromem(struct drm_device *drm_dev,
+		     struct rogue_meta_ldr_l1_data_blk *l1_data, u32 coremem_size,
+		     u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	u32 offset = l1_data->cmd_data[0];
+	u32 byte_count = l1_data->cmd_data[1];
+	void *write_addr;
+	int err;
+
+	if (ROGUE_META_IS_COREMEM_DATA(offset, coremem_size)) {
+		/* cannot zero coremem directly */
+		return 0;
+	}
+
+	/* Global range is aliased to local range */
+	offset &= ~META_MEM_GLOBAL_RANGE_BIT;
+
+	err = pvr_fw_find_mmu_segment(pvr_dev, offset, byte_count, fw_code_ptr, fw_data_ptr,
+				      fw_core_code_ptr, fw_core_data_ptr, &write_addr);
+	if (err) {
+		drm_err(drm_dev,
+			"Addr 0x%x (size: %d) not found in any firmware segment",
+			offset, byte_count);
+		return err;
+	}
+
+	memset(write_addr, 0, byte_count);
+
+	return 0;
+}
+
+static int
+meta_ldr_cmd_config(struct drm_device *drm_dev, const u8 *fw,
+		    struct rogue_meta_ldr_l1_data_blk *l1_data,
+		    const u32 fw_size, u32 **boot_conf_ptr)
+{
+	struct rogue_meta_ldr_l2_data_blk *l2_block =
+		(struct rogue_meta_ldr_l2_data_blk *)(fw +
+						      l1_data->cmd_data[0]);
+	struct rogue_meta_ldr_cfg_blk *config_command;
+	u32 l2_block_size;
+	u32 curr_block_size = 0;
+	u32 *boot_conf = boot_conf_ptr ? *boot_conf_ptr : NULL;
+
+	/* Verify block header is within bounds. */
+	if (((u8 *)l2_block - fw) >= fw_size || ((u8 *)(l2_block + 1) - fw) >= fw_size)
+		return -EINVAL;
+
+	l2_block_size = l2_block->length - 6 /* L2 Tag length and checksum */;
+	config_command = (struct rogue_meta_ldr_cfg_blk *)l2_block->block_data;
+
+	if (((u8 *)config_command - fw) >= fw_size ||
+	    ((((u8 *)config_command) + l2_block_size) - fw) >= fw_size)
+		return -EINVAL;
+
+	while (l2_block_size >= 12) {
+		if (config_command->type != ROGUE_META_LDR_CFG_WRITE)
+			return -EINVAL;
+
+		/*
+		 * Only write to bootloader if we got a valid pointer to the FW
+		 * code allocation.
+		 */
+		if (boot_conf) {
+			u32 register_offset = config_command->block_data[0];
+			u32 register_value = config_command->block_data[1];
+
+			/* Do register write */
+			add_boot_arg(&boot_conf, register_offset,
+				     register_value);
+		}
+
+		curr_block_size = 12;
+		l2_block_size -= curr_block_size;
+		config_command = (struct rogue_meta_ldr_cfg_blk
+					  *)((uintptr_t)config_command +
+					     curr_block_size);
+	}
+
+	if (boot_conf_ptr)
+		*boot_conf_ptr = boot_conf;
+
+	return 0;
+}
+
+/**
+ * process_ldr_command_stream() - Process LDR firmware image and populate
+ *                                firmware sections
+ * @pvr_dev: Device pointer.
+ * @fw: Pointer to firmware image.
+ * @fw_code_ptr: Pointer to FW code section.
+ * @fw_data_ptr: Pointer to FW data section.
+ * @fw_core_code_ptr: Pointer to FW coremem code section.
+ * @fw_core_data_ptr: Pointer to FW coremem data section.
+ * @boot_conf_ptr: Pointer to boot config argument pointer.
+ *
+ * Returns :
+ *  * 0 on success, or
+ *  * -EINVAL on any error in LDR command stream.
+ */
+static int
+process_ldr_command_stream(struct pvr_device *pvr_dev, const u8 *fw, u8 *fw_code_ptr,
+			   u8 *fw_data_ptr, u8 *fw_core_code_ptr,
+			   u8 *fw_core_data_ptr, u32 **boot_conf_ptr)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	struct rogue_meta_ldr_block_hdr *ldr_header =
+		(struct rogue_meta_ldr_block_hdr *)fw;
+	struct rogue_meta_ldr_l1_data_blk *l1_data =
+		(struct rogue_meta_ldr_l1_data_blk *)(fw + ldr_header->sl_data);
+	const u32 fw_size = pvr_dev->fw_dev.firmware->size;
+	int err;
+
+	u32 *boot_conf = boot_conf_ptr ? *boot_conf_ptr : NULL;
+	u32 coremem_size;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, meta_coremem_size, &coremem_size);
+	if (err)
+		return err;
+
+	coremem_size *= SZ_1K;
+
+	while (l1_data) {
+		/* Verify block header is within bounds. */
+		if (((u8 *)l1_data - fw) >= fw_size || ((u8 *)(l1_data + 1) - fw) >= fw_size)
+			return -EINVAL;
+
+		if (ROGUE_META_LDR_BLK_IS_COMMENT(l1_data->cmd)) {
+			/* Don't process comment blocks */
+			goto next_block;
+		}
+
+		switch (l1_data->cmd & ROGUE_META_LDR_CMD_MASK)
+		case ROGUE_META_LDR_CMD_LOADMEM: {
+			err = meta_ldr_cmd_loadmem(drm_dev, fw, l1_data,
+						   coremem_size,
+						   fw_code_ptr, fw_data_ptr,
+						   fw_core_code_ptr,
+						   fw_core_data_ptr, fw_size);
+			if (err)
+				return err;
+			break;
+
+		case ROGUE_META_LDR_CMD_START_THREADS:
+			/* Don't process this block */
+			break;
+
+		case ROGUE_META_LDR_CMD_ZEROMEM:
+			err = meta_ldr_cmd_zeromem(drm_dev, l1_data,
+						   coremem_size,
+						   fw_code_ptr, fw_data_ptr,
+						   fw_core_code_ptr,
+						   fw_core_data_ptr);
+			if (err)
+				return err;
+			break;
+
+		case ROGUE_META_LDR_CMD_CONFIG:
+			err = meta_ldr_cmd_config(drm_dev, fw, l1_data, fw_size,
+						  &boot_conf);
+			if (err)
+				return err;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+next_block:
+		if (l1_data->next == 0xFFFFFFFF)
+			break;
+
+		l1_data = (struct rogue_meta_ldr_l1_data_blk *)(fw +
+								l1_data->next);
+	}
+
+	if (boot_conf_ptr)
+		*boot_conf_ptr = boot_conf;
+
+	return 0;
+}
+
+static void
+configure_seg_id(u64 seg_out_addr, u32 seg_base, u32 seg_limit, u32 seg_id,
+		 u32 **boot_conf_ptr)
+{
+	u32 seg_out_addr0 = seg_out_addr & 0x00000000FFFFFFFFUL;
+	u32 seg_out_addr1 = (seg_out_addr >> 32) & 0x00000000FFFFFFFFUL;
+	u32 *boot_conf = *boot_conf_ptr;
+
+	/* META segments have a minimum size. */
+	u32 limit_off = max(seg_limit, ROGUE_FW_SEGMMU_ALIGN);
+
+	/* The limit is an offset, therefore off = size - 1. */
+	limit_off -= 1;
+
+	seg_base |= ROGUE_FW_SEGMMU_ALLTHRS_WRITEABLE;
+
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_BASE(seg_id), seg_base);
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_LIMIT(seg_id), limit_off);
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_OUTA0(seg_id), seg_out_addr0);
+	add_boot_arg(&boot_conf, META_CR_MMCU_SEGMENT_N_OUTA1(seg_id), seg_out_addr1);
+
+	*boot_conf_ptr = boot_conf;
+}
+
+static u64 get_fw_obj_gpu_addr(struct pvr_fw_object *fw_obj)
+{
+	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(fw_obj->gem)->dev);
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+
+	return fw_obj->fw_addr_offset + fw_dev->fw_heap_info.gpu_addr;
+}
+
+static void
+configure_seg_mmu(struct pvr_device *pvr_dev, u32 **boot_conf_ptr)
+{
+	const struct pvr_fw_layout_entry *layout_entries = pvr_dev->fw_dev.layout_entries;
+	u32 num_layout_entries = pvr_dev->fw_dev.header->layout_entry_num;
+	u64 seg_out_addr_top;
+	u32 i;
+
+	seg_out_addr_top =
+		ROGUE_FW_SEGMMU_OUTADDR_TOP_SLC(MMU_CONTEXT_MAPPING_FWPRIV,
+						ROGUE_FW_SEGMMU_META_BIFDM_ID);
+
+	for (i = 0; i < num_layout_entries; i++) {
+		/*
+		 * FW code is using the bootloader segment which is already
+		 * configured on boot. FW coremem code and data don't use the
+		 * segment MMU. Only the FW data segment needs to be configured.
+		 */
+		if (layout_entries[i].type == FW_DATA) {
+			u32 seg_id = ROGUE_FW_SEGMMU_DATA_ID;
+			u64 seg_out_addr = get_fw_obj_gpu_addr(pvr_dev->fw_dev.mem.data_obj);
+
+			seg_out_addr += layout_entries[i].alloc_offset;
+			seg_out_addr |= seg_out_addr_top;
+
+			/* Write the sequence to the bootldr. */
+			configure_seg_id(seg_out_addr,
+					 layout_entries[i].base_addr,
+					 layout_entries[i].alloc_size, seg_id,
+					 boot_conf_ptr);
+
+			break;
+		}
+	}
+}
+
+static void
+configure_meta_caches(u32 **boot_conf_ptr)
+{
+	u32 *boot_conf = *boot_conf_ptr;
+	u32 d_cache_t0, i_cache_t0;
+	u32 d_cache_t1, i_cache_t1;
+	u32 d_cache_t2, i_cache_t2;
+	u32 d_cache_t3, i_cache_t3;
+
+	/* Initialise I/Dcache settings */
+	d_cache_t0 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	d_cache_t1 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	d_cache_t2 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	d_cache_t3 = META_CR_SYSC_DCPARTX_CACHED_WRITE_ENABLE;
+	i_cache_t0 = 0;
+	i_cache_t1 = 0;
+	i_cache_t2 = 0;
+	i_cache_t3 = 0;
+
+	d_cache_t0 |= META_CR_SYSC_XCPARTX_LOCAL_ADDR_FULL_CACHE;
+	i_cache_t0 |= META_CR_SYSC_XCPARTX_LOCAL_ADDR_FULL_CACHE;
+
+	/* Local region MMU enhanced bypass: WIN-3 mode for code and data caches */
+	add_boot_arg(&boot_conf, META_CR_MMCU_LOCAL_EBCTRL,
+		     META_CR_MMCU_LOCAL_EBCTRL_ICWIN |
+			     META_CR_MMCU_LOCAL_EBCTRL_DCWIN);
+
+	/* Data cache partitioning thread 0 to 3 */
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(0), d_cache_t0);
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(1), d_cache_t1);
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(2), d_cache_t2);
+	add_boot_arg(&boot_conf, META_CR_SYSC_DCPART(3), d_cache_t3);
+
+	/* Enable data cache hits */
+	add_boot_arg(&boot_conf, META_CR_MMCU_DCACHE_CTRL,
+		     META_CR_MMCU_XCACHE_CTRL_CACHE_HITS_EN);
+
+	/* Instruction cache partitioning thread 0 to 3 */
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(0), i_cache_t0);
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(1), i_cache_t1);
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(2), i_cache_t2);
+	add_boot_arg(&boot_conf, META_CR_SYSC_ICPART(3), i_cache_t3);
+
+	/* Enable instruction cache hits */
+	add_boot_arg(&boot_conf, META_CR_MMCU_ICACHE_CTRL,
+		     META_CR_MMCU_XCACHE_CTRL_CACHE_HITS_EN);
+
+	add_boot_arg(&boot_conf, 0x040000C0, 0);
+
+	*boot_conf_ptr = boot_conf;
+}
+
+static int
+pvr_meta_fw_process(struct pvr_device *pvr_dev, const u8 *fw,
+		    u8 *fw_code_ptr, u8 *fw_data_ptr, u8 *fw_core_code_ptr, u8 *fw_core_data_ptr,
+		    u32 core_code_alloc_size)
+{
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	u32 *boot_conf;
+	int err;
+
+	boot_conf = ((u32 *)fw_code_ptr) + ROGUE_FW_BOOTLDR_CONF_OFFSET;
+
+	/* Slave port and JTAG accesses are privileged. */
+	add_boot_arg(&boot_conf, META_CR_SYSC_JTAG_THREAD,
+		     META_CR_SYSC_JTAG_THREAD_PRIV_EN);
+
+	configure_seg_mmu(pvr_dev, &boot_conf);
+
+	/* Populate FW sections from LDR image. */
+	err = process_ldr_command_stream(pvr_dev, fw, fw_code_ptr, fw_data_ptr, fw_core_code_ptr,
+					 fw_core_data_ptr, &boot_conf);
+	if (err)
+		return err;
+
+	configure_meta_caches(&boot_conf);
+
+	/* End argument list. */
+	add_boot_arg(&boot_conf, 0, 0);
+
+	if (fw_dev->mem.core_code_obj) {
+		u32 core_code_fw_addr;
+
+		pvr_fw_object_get_fw_addr(fw_dev->mem.core_code_obj, &core_code_fw_addr);
+		add_boot_arg(&boot_conf, core_code_fw_addr, core_code_alloc_size);
+	} else {
+		add_boot_arg(&boot_conf, 0, 0);
+	}
+	/* None of the cores supported by this driver have META DMA. */
+	add_boot_arg(&boot_conf, 0, 0);
+
+	return 0;
+}
+
+static int
+pvr_meta_init(struct pvr_device *pvr_dev)
+{
+	pvr_fw_heap_info_init(pvr_dev, ROGUE_FW_HEAP_META_SHIFT, 0);
+
+	return 0;
+}
+
+static u32
+pvr_meta_get_fw_addr_with_offset(struct pvr_fw_object *fw_obj, u32 offset)
+{
+	u32 fw_addr = fw_obj->fw_addr_offset + offset + ROGUE_FW_SEGMMU_DATA_BASE_ADDRESS;
+
+	/* META cacheability is determined by address. */
+	if (fw_obj->gem->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
+		fw_addr |= ROGUE_FW_SEGMMU_DATA_META_UNCACHED |
+			   ROGUE_FW_SEGMMU_DATA_VIVT_SLC_UNCACHED;
+
+	return fw_addr;
+}
+
+static int
+pvr_meta_vm_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	struct pvr_gem_object *pvr_obj = fw_obj->gem;
+
+	return pvr_vm_map(pvr_dev->kernel_vm_ctx, pvr_obj, 0, fw_obj->fw_mm_node.start,
+			  pvr_gem_object_size(pvr_obj));
+}
+
+static void
+pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
+{
+	pvr_vm_unmap(pvr_dev->kernel_vm_ctx, fw_obj->fw_mm_node.start,
+		     fw_obj->fw_mm_node.size);
+}
+
+static bool
+pvr_meta_has_fixed_data_addr(void)
+{
+	return false;
+}
+
+const struct pvr_fw_defs pvr_fw_defs_meta = {
+	.init = pvr_meta_init,
+	.fw_process = pvr_meta_fw_process,
+	.vm_map = pvr_meta_vm_map,
+	.vm_unmap = pvr_meta_vm_unmap,
+	.get_fw_addr_with_offset = pvr_meta_get_fw_addr_with_offset,
+	.wrapper_init = pvr_meta_wrapper_init,
+	.has_fixed_data_addr = pvr_meta_has_fixed_data_addr,
+	.irq = {
+		.enable_reg = ROGUE_CR_META_SP_MSLVIRQENABLE,
+		.status_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
+		.clear_reg = ROGUE_CR_META_SP_MSLVIRQSTATUS,
+		.event_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_EN,
+		.clear_mask = ROGUE_CR_META_SP_MSLVIRQSTATUS_TRIGVECT2_CLRMSK,
+	},
+};
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.h b/drivers/gpu/drm/imagination/pvr_fw_meta.h
new file mode 100644
index 000000000000..d88970e82334
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_META_H
+#define PVR_FW_META_H
+
+#include <linux/types.h>
+
+/* Forward declaration from pvr_device.h */
+struct pvr_device;
+
+int pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out);
+
+#endif /* PVR_FW_META_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.c b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
new file mode 100644
index 000000000000..89794eb2078f
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_fw_meta.h"
+#include "pvr_fw_startstop.h"
+#include "pvr_rogue_cr_defs.h"
+#include "pvr_rogue_meta.h"
+#include "pvr_vm.h"
+
+#include <linux/compiler.h>
+#include <linux/delay.h>
+#include <linux/ktime.h>
+#include <linux/types.h>
+
+#define POLL_TIMEOUT_USEC 1000000
+
+static void
+rogue_axi_ace_list_init(struct pvr_device *pvr_dev)
+{
+	/* Setup AXI-ACE config. Set everything to outer cache. */
+	u64 reg_val =
+		(3U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_AWDOMAIN_NON_SNOOPING_SHIFT) |
+		(3U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARDOMAIN_NON_SNOOPING_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARDOMAIN_CACHE_MAINTENANCE_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_AWDOMAIN_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARDOMAIN_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_AWCACHE_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARCACHE_COHERENT_SHIFT) |
+		(2U << ROGUE_CR_AXI_ACE_LITE_CONFIGURATION_ARCACHE_CACHE_MAINTENANCE_SHIFT);
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_AXI_ACE_LITE_CONFIGURATION, reg_val);
+}
+
+static void
+rogue_bif_init(struct pvr_device *pvr_dev)
+{
+	dma_addr_t pc_dma_addr;
+	u64 pc_addr;
+
+	/* Acquire the address of the Kernel Page Catalogue. */
+	pc_dma_addr = pvr_vm_get_page_table_root_addr(pvr_dev->kernel_vm_ctx);
+
+	/* Write the kernel catalogue base. */
+	pc_addr = ((((u64)pc_dma_addr >> ROGUE_CR_BIF_CAT_BASE0_ADDR_ALIGNSHIFT)
+		    << ROGUE_CR_BIF_CAT_BASE0_ADDR_SHIFT) &
+		   ~ROGUE_CR_BIF_CAT_BASE0_ADDR_CLRMSK);
+
+	pvr_cr_write64(pvr_dev, BIF_CAT_BASEX(MMU_CONTEXT_MAPPING_FWPRIV),
+		       pc_addr);
+}
+
+static int
+rogue_slc_init(struct pvr_device *pvr_dev)
+{
+	u16 slc_cache_line_size_bits;
+	u32 reg_val;
+	int err;
+
+	/*
+	 * SLC Misc control.
+	 *
+	 * Note: This is a 64bit register and we set only the lower 32bits
+	 *       leaving the top 32bits (ROGUE_CR_SLC_CTRL_MISC_SCRAMBLE_BITS)
+	 *       unchanged from the HW default.
+	 */
+	reg_val = (pvr_cr_read32(pvr_dev, ROGUE_CR_SLC_CTRL_MISC) &
+		      ROGUE_CR_SLC_CTRL_MISC_ENABLE_PSG_HAZARD_CHECK_EN) |
+		     ROGUE_CR_SLC_CTRL_MISC_ADDR_DECODE_MODE_PVR_HASH1;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, slc_cache_line_size_bits, &slc_cache_line_size_bits);
+	if (err)
+		return err;
+
+	/* Bypass burst combiner if SLC line size is smaller than 1024 bits. */
+	if (slc_cache_line_size_bits < 1024)
+		reg_val |= ROGUE_CR_SLC_CTRL_MISC_BYPASS_BURST_COMBINER_EN;
+
+	if (PVR_HAS_QUIRK(pvr_dev, 71242) && !PVR_HAS_FEATURE(pvr_dev, gpu_multicore_support))
+		reg_val |= ROGUE_CR_SLC_CTRL_MISC_LAZYWB_OVERRIDE_EN;
+
+	pvr_cr_write32(pvr_dev, ROGUE_CR_SLC_CTRL_MISC, reg_val);
+
+	return 0;
+}
+
+/**
+ * pvr_fw_start() - Start FW processor and boot firmware
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by rogue_slc_init().
+ */
+int
+pvr_fw_start(struct pvr_device *pvr_dev)
+{
+	bool has_reset2 = PVR_HAS_FEATURE(pvr_dev, xe_tpu2);
+	u64 soft_reset_mask;
+	int err;
+
+	if (PVR_HAS_FEATURE(pvr_dev, pbe2_in_xe))
+		soft_reset_mask = ROGUE_CR_SOFT_RESET__PBE2_XE__MASKFULL;
+	else
+		soft_reset_mask = ROGUE_CR_SOFT_RESET_MASKFULL;
+
+	if (PVR_HAS_FEATURE(pvr_dev, sys_bus_secure_reset)) {
+		/*
+		 * Disable the default sys_bus_secure protection to perform
+		 * minimal setup.
+		 */
+		pvr_cr_write32(pvr_dev, ROGUE_CR_SYS_BUS_SECURE, 0);
+		(void)pvr_cr_read32(pvr_dev, ROGUE_CR_SYS_BUS_SECURE); /* Fence write */
+	}
+
+	/* Set Rogue in soft-reset. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, soft_reset_mask);
+	if (has_reset2)
+		pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET2, ROGUE_CR_SOFT_RESET2_MASKFULL);
+
+	/* Read soft-reset to fence previous write in order to clear the SOCIF pipeline. */
+	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+	if (has_reset2)
+		(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET2);
+
+	/* Take Rascal and Dust out of reset. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET,
+		       soft_reset_mask ^ ROGUE_CR_SOFT_RESET_RASCALDUSTS_EN);
+	if (has_reset2)
+		pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET2, 0);
+
+	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+	if (has_reset2)
+		(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET2);
+
+	/* Take everything out of reset but the FW processor. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, ROGUE_CR_SOFT_RESET_GARTEN_EN);
+	if (has_reset2)
+		pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET2, 0);
+
+	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+	if (has_reset2)
+		(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET2);
+
+	err = rogue_slc_init(pvr_dev);
+	if (err)
+		goto err_reset;
+
+	/* Initialise Firmware wrapper. */
+	pvr_dev->fw_dev.defs->wrapper_init(pvr_dev);
+
+	/* We must init the AXI-ACE interface before first BIF transaction. */
+	rogue_axi_ace_list_init(pvr_dev);
+
+	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
+		/* Initialise BIF. */
+		rogue_bif_init(pvr_dev);
+	}
+
+	/* Need to wait for at least 16 cycles before taking the FW processor out of reset ... */
+	udelay(3);
+
+	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, 0x0);
+	(void)pvr_cr_read64(pvr_dev, ROGUE_CR_SOFT_RESET);
+
+	/* ... and afterwards. */
+	udelay(3);
+
+	return 0;
+
+err_reset:
+	/* Put everything back into soft-reset. */
+	pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, soft_reset_mask);
+
+	return err;
+}
+
+/**
+ * pvr_fw_stop() - Stop FW processor
+ * @pvr_dev: Target PowerVR device.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_cr_poll_reg32().
+ */
+int
+pvr_fw_stop(struct pvr_device *pvr_dev)
+{
+	const u32 sidekick_idle_mask = ROGUE_CR_SIDEKICK_IDLE_MASKFULL &
+				       ~(ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN |
+					 ROGUE_CR_SIDEKICK_IDLE_SOCIF_EN |
+					 ROGUE_CR_SIDEKICK_IDLE_HOSTIF_EN);
+	bool skip_garten_idle = false;
+	u32 reg_value;
+	int err;
+
+	/*
+	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
+	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been
+	 * powered down by the FW.
+	 */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
+				sidekick_idle_mask, POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	/* Unset MTS DM association with threads. */
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC,
+		       ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC,
+		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC,
+		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
+	pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC,
+		       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_MASKFULL &
+		       ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
+
+	/* Extra Idle checks. */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIF_STATUS_MMU, 0,
+				ROGUE_CR_BIF_STATUS_MMU_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIFPM_STATUS_MMU, 0,
+				ROGUE_CR_BIFPM_STATUS_MMU_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	if (!PVR_HAS_FEATURE(pvr_dev, xt_top_infrastructure)) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIF_READS_EXT_STATUS, 0,
+					ROGUE_CR_BIF_READS_EXT_STATUS_MASKFULL,
+					POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
+
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIFPM_READS_EXT_STATUS, 0,
+				ROGUE_CR_BIFPM_READS_EXT_STATUS_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	err = pvr_cr_poll_reg64(pvr_dev, ROGUE_CR_SLC_STATUS1, 0,
+				ROGUE_CR_SLC_STATUS1_MASKFULL,
+				POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	/*
+	 * Wait for SLC to signal IDLE.
+	 * For cores with the LAYOUT_MARS feature, SLC would have been powered
+	 * down by the FW.
+	 */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SLC_IDLE,
+				ROGUE_CR_SLC_IDLE_MASKFULL,
+				ROGUE_CR_SLC_IDLE_MASKFULL, POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	/*
+	 * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
+	 * For cores with the LAYOUT_MARS feature, SIDEKICK would have been powered
+	 * down by the FW.
+	 */
+	err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
+				sidekick_idle_mask, POLL_TIMEOUT_USEC);
+	if (err)
+		return err;
+
+	if (pvr_dev->fw_dev.processor_type == PVR_FW_PROCESSOR_TYPE_META) {
+		err = pvr_meta_cr_read32(pvr_dev, META_CR_TxVECINT_BHALT, &reg_value);
+		if (err)
+			return err;
+
+		/*
+		 * Wait for Sidekick/Jones to signal IDLE including the Garten
+		 * Wrapper if there is no debugger attached (TxVECINT_BHALT =
+		 * 0x0).
+		 */
+		if (reg_value)
+			skip_garten_idle = true;
+	}
+
+	if (!skip_garten_idle) {
+		err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE,
+					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
+					ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN,
+					POLL_TIMEOUT_USEC);
+		if (err)
+			return err;
+	}
+
+	if (PVR_HAS_FEATURE(pvr_dev, pbe2_in_xe))
+		pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET,
+			       ROGUE_CR_SOFT_RESET__PBE2_XE__MASKFULL);
+	else
+		pvr_cr_write64(pvr_dev, ROGUE_CR_SOFT_RESET, ROGUE_CR_SOFT_RESET_MASKFULL);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_fw_startstop.h b/drivers/gpu/drm/imagination/pvr_fw_startstop.h
new file mode 100644
index 000000000000..ab84f14596c7
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_startstop.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_STARTSTOP_H
+#define PVR_FW_STARTSTOP_H
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+int pvr_fw_start(struct pvr_device *pvr_dev);
+int pvr_fw_stop(struct pvr_device *pvr_dev);
+
+#endif /* PVR_FW_STARTSTOP_H */
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
new file mode 100644
index 000000000000..075f67dd0f94
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_fwif.h"
+#include "pvr_fw_trace.h"
+
+#include <drm/drm_file.h>
+
+#include <linux/build_bug.h>
+#include <linux/dcache.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+static void
+tracebuf_ctrl_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_tracebuf *tracebuf_ctrl = cpu_ptr;
+	struct pvr_fw_trace *fw_trace = priv;
+	u32 thread_nr;
+
+	tracebuf_ctrl->tracebuf_size_in_dwords = ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS;
+	tracebuf_ctrl->tracebuf_flags = 0;
+
+	if (fw_trace->group_mask)
+		tracebuf_ctrl->log_type = fw_trace->group_mask | ROGUE_FWIF_LOG_TYPE_TRACE;
+	else
+		tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_NONE;
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct rogue_fwif_tracebuf_space *tracebuf_space =
+			&tracebuf_ctrl->tracebuf[thread_nr];
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		pvr_fw_object_get_fw_addr(trace_buffer->buf_obj,
+					  &tracebuf_space->trace_buffer_fw_addr);
+
+		tracebuf_space->trace_buffer = trace_buffer->buf;
+		tracebuf_space->trace_pointer = 0;
+	}
+}
+
+int pvr_fw_trace_init(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+	u32 thread_nr;
+	int err;
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		trace_buffer->buf =
+			pvr_fw_object_create_and_map(pvr_dev,
+						     ROGUE_FW_TRACE_BUF_DEFAULT_SIZE_IN_DWORDS *
+						     sizeof(*trace_buffer->buf),
+						     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+						     PVR_BO_FW_NO_CLEAR_ON_RESET,
+						     NULL, NULL, &trace_buffer->buf_obj);
+		if (IS_ERR(trace_buffer->buf)) {
+			drm_err(drm_dev, "Unable to allocate trace buffer\n");
+			err = PTR_ERR(trace_buffer->buf);
+			trace_buffer->buf = NULL;
+			goto err_free_buf;
+		}
+	}
+
+	/* TODO: Provide control of group mask. */
+	fw_trace->group_mask = 0;
+
+	fw_trace->tracebuf_ctrl =
+		pvr_fw_object_create_and_map(pvr_dev,
+					     sizeof(*fw_trace->tracebuf_ctrl),
+					     PVR_BO_FW_FLAGS_DEVICE_UNCACHED |
+					     PVR_BO_FW_NO_CLEAR_ON_RESET,
+					     tracebuf_ctrl_init, fw_trace,
+					     &fw_trace->tracebuf_ctrl_obj);
+	if (IS_ERR(fw_trace->tracebuf_ctrl)) {
+		drm_err(drm_dev, "Unable to allocate trace buffer control structure\n");
+		err = PTR_ERR(fw_trace->tracebuf_ctrl);
+		goto err_free_buf;
+	}
+
+	BUILD_BUG_ON(ARRAY_SIZE(fw_trace->tracebuf_ctrl->tracebuf) !=
+		     ARRAY_SIZE(fw_trace->buffers));
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct rogue_fwif_tracebuf_space *tracebuf_space =
+			&fw_trace->tracebuf_ctrl->tracebuf[thread_nr];
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		trace_buffer->tracebuf_space = tracebuf_space;
+	}
+
+	return 0;
+
+err_free_buf:
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		if (trace_buffer->buf)
+			pvr_fw_object_unmap_and_destroy(trace_buffer->buf_obj);
+	}
+
+	return err;
+}
+
+void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
+{
+	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
+	u32 thread_nr;
+
+	for (thread_nr = 0; thread_nr < ARRAY_SIZE(fw_trace->buffers); thread_nr++) {
+		struct pvr_fw_trace_buffer *trace_buffer = &fw_trace->buffers[thread_nr];
+
+		pvr_fw_object_unmap_and_destroy(trace_buffer->buf_obj);
+	}
+	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
+}
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.h b/drivers/gpu/drm/imagination/pvr_fw_trace.h
new file mode 100644
index 000000000000..e637bb9de2b4
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_FW_TRACE_H
+#define PVR_FW_TRACE_H
+
+#include <drm/drm_file.h>
+#include <linux/types.h>
+
+#include "pvr_rogue_fwif.h"
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_gem.h. */
+struct pvr_fw_object;
+
+/* Forward declarations from pvr_rogue_fwif.h */
+struct rogue_fwif_tracebuf;
+struct rogue_fwif_tracebuf_space;
+
+/**
+ * struct pvr_fw_trace_buffer - Structure representing a trace buffer
+ */
+struct pvr_fw_trace_buffer {
+	/** @buf_obj: FW buffer object representing trace buffer. */
+	struct pvr_fw_object *buf_obj;
+
+	/** @buf: Pointer to CPU mapping of trace buffer. */
+	u32 *buf;
+
+	/**
+	 * @tracebuf_space: Pointer to FW tracebuf_space structure for this
+	 *                  trace buffer.
+	 */
+	struct rogue_fwif_tracebuf_space *tracebuf_space;
+};
+
+/**
+ * struct pvr_fw_trace - Device firmware trace data
+ */
+struct pvr_fw_trace {
+	/**
+	 * @tracebuf_ctrl_obj: Object representing FW trace buffer control
+	 *                     structure.
+	 */
+	struct pvr_fw_object *tracebuf_ctrl_obj;
+
+	/**
+	 * @tracebuf_ctrl: Pointer to CPU mapping of FW trace buffer control
+	 *                 structure.
+	 */
+	struct rogue_fwif_tracebuf *tracebuf_ctrl;
+
+	/**
+	 * @buffers: Array representing the actual trace buffers owned by this
+	 *           device.
+	 */
+	struct pvr_fw_trace_buffer buffers[ROGUE_FW_THREAD_MAX];
+
+	/** @group_mask: Mask of enabled trace groups. */
+	u32 group_mask;
+};
+
+int pvr_fw_trace_init(struct pvr_device *pvr_dev);
+void pvr_fw_trace_fini(struct pvr_device *pvr_dev);
+
+#if defined(CONFIG_DEBUG_FS)
+/* Forward declaration from <linux/dcache.h>. */
+struct dentry;
+
+void pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask,
+			      u32 new_mask);
+
+void pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
+#endif /* defined(CONFIG_DEBUG_FS) */
+
+#endif /* PVR_FW_TRACE_H */
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 7de43b6c203e..c836ddebbf9b 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -3,9 +3,11 @@
 
 #include "pvr_mmu.h"
 
+#include "pvr_ccb.h"
 #include "pvr_device.h"
 #include "pvr_fw.h"
 #include "pvr_gem.h"
+#include "pvr_power.h"
 #include "pvr_rogue_fwif.h"
 #include "pvr_rogue_mmu_defs.h"
 
@@ -95,7 +97,7 @@ static void pvr_mmu_set_flush_flags(struct pvr_device *pvr_dev, u32 flags)
  */
 void pvr_mmu_flush_request_all(struct pvr_device *pvr_dev)
 {
-	/* TODO: implement */
+	pvr_mmu_set_flush_flags(pvr_dev, PVR_MMU_SYNC_LEVEL_2_FLAGS);
 }
 
 /**
@@ -120,8 +122,70 @@ void pvr_mmu_flush_request_all(struct pvr_device *pvr_dev)
  */
 int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, bool wait)
 {
-	/* TODO: implement */
-	return -ENODEV;
+	struct rogue_fwif_kccb_cmd cmd_mmu_cache = {};
+	struct rogue_fwif_mmucachedata *cmd_mmu_cache_data =
+		&cmd_mmu_cache.cmd_data.mmu_cache_data;
+	int err = 0;
+	u32 slot;
+	int idx;
+
+	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx))
+		return -EIO;
+
+	/* Can't flush MMU if the firmware hasn't booted yet. */
+	if (!pvr_dev->fw_dev.booted)
+		goto err_drm_dev_exit;
+
+	cmd_mmu_cache_data->cache_flags =
+		atomic_xchg(&pvr_dev->mmu_flush_cache_flags, 0);
+
+	if (!cmd_mmu_cache_data->cache_flags)
+		goto err_drm_dev_exit;
+
+	cmd_mmu_cache.cmd_type = ROGUE_FWIF_KCCB_CMD_MMUCACHE;
+
+	pvr_fw_object_get_fw_addr(pvr_dev->fw_dev.mem.mmucache_sync_obj,
+				  &cmd_mmu_cache_data->mmu_cache_sync_fw_addr);
+	cmd_mmu_cache_data->mmu_cache_sync_update_value = 0;
+
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd_mmu_cache, &slot);
+	if (err)
+		goto err_reset_and_retry;
+
+	err = pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
+	if (err)
+		goto err_reset_and_retry;
+
+	drm_dev_exit(idx);
+
+	return 0;
+
+err_reset_and_retry:
+	/*
+	 * Flush command failure is most likely the result of a firmware lockup. Hard
+	 * reset the GPU and retry.
+	 */
+	err = pvr_power_reset(pvr_dev, true);
+	if (err)
+		goto err_drm_dev_exit; /* Device is lost. */
+
+	/* Retry sending flush request. */
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd_mmu_cache, &slot);
+	if (err) {
+		pvr_device_lost(pvr_dev);
+		goto err_drm_dev_exit;
+	}
+
+	if (wait) {
+		err = pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
+		if (err)
+			pvr_device_lost(pvr_dev);
+	}
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index a494fed92e81..40ade2226552 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -3,6 +3,7 @@
 
 #include "pvr_device.h"
 #include "pvr_fw.h"
+#include "pvr_fw_startstop.h"
 #include "pvr_power.h"
 #include "pvr_rogue_fwif.h"
 
@@ -21,11 +22,38 @@
 
 #define WATCHDOG_TIME_MS (500)
 
+/**
+ * pvr_device_lost() - Mark GPU device as lost
+ * @pvr_dev: Target PowerVR device.
+ *
+ * This will cause the DRM device to be unplugged.
+ */
+void
+pvr_device_lost(struct pvr_device *pvr_dev)
+{
+	if (!pvr_dev->lost) {
+		pvr_dev->lost = true;
+		drm_dev_unplug(from_pvr_device(pvr_dev));
+	}
+}
+
 static int
 pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
 {
-	/* TODO: implement */
-	return -ENODEV;
+	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
+	u32 slot_nr;
+	u32 value;
+	int err;
+
+	WRITE_ONCE(*fw_dev->power_sync, 0);
+
+	err = pvr_kccb_send_cmd_powered(pvr_dev, pow_cmd, &slot_nr);
+	if (err)
+		return err;
+
+	/* Wait for FW to acknowledge. */
+	return readl_poll_timeout(pvr_dev->fw_dev.power_sync, value, value != 0, 100,
+				  POWER_SYNC_TIMEOUT_US);
 }
 
 static int
@@ -71,8 +99,7 @@ pvr_power_fw_disable(struct pvr_device *pvr_dev, bool hard_reset)
 			return err;
 	}
 
-	/* TODO: stop firmware */
-	return -ENODEV;
+	return pvr_fw_stop(pvr_dev);
 }
 
 static int
@@ -80,11 +107,17 @@ pvr_power_fw_enable(struct pvr_device *pvr_dev)
 {
 	int err;
 
-	/* TODO: start firmware */
-	err = -ENODEV;
+	err = pvr_fw_start(pvr_dev);
 	if (err)
 		return err;
 
+	err = pvr_wait_for_fw_boot(pvr_dev);
+	if (err) {
+		drm_err(from_pvr_device(pvr_dev), "Firmware failed to boot\n");
+		pvr_fw_stop(pvr_dev);
+		return err;
+	}
+
 	queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
 			   msecs_to_jiffies(WATCHDOG_TIME_MS));
 
@@ -94,14 +127,39 @@ pvr_power_fw_enable(struct pvr_device *pvr_dev)
 bool
 pvr_power_is_idle(struct pvr_device *pvr_dev)
 {
-	/* TODO: implement */
-	return true;
+	/*
+	 * FW power state can be out of date if a KCCB command has been submitted but the FW hasn't
+	 * started processing it yet. So also check the KCCB status.
+	 */
+	enum rogue_fwif_pow_state pow_state = READ_ONCE(pvr_dev->fw_dev.fwif_sysdata->pow_state);
+	bool kccb_idle = pvr_kccb_is_idle(pvr_dev);
+
+	return (pow_state == ROGUE_FWIF_POW_IDLE) && kccb_idle;
 }
 
 static bool
 pvr_watchdog_kccb_stalled(struct pvr_device *pvr_dev)
 {
-	/* TODO: implement */
+	/* Check KCCB commands are progressing. */
+	u32 kccb_cmds_executed = pvr_dev->fw_dev.fwif_osdata->kccb_cmds_executed;
+	bool kccb_is_idle = pvr_kccb_is_idle(pvr_dev);
+
+	if (pvr_dev->watchdog.old_kccb_cmds_executed == kccb_cmds_executed && !kccb_is_idle) {
+		pvr_dev->watchdog.kccb_stall_count++;
+
+		/*
+		 * If we have commands pending with no progress for 2 consecutive polls then
+		 * consider KCCB command processing stalled.
+		 */
+		if (pvr_dev->watchdog.kccb_stall_count == 2) {
+			pvr_dev->watchdog.kccb_stall_count = 0;
+			return true;
+		}
+	} else {
+		pvr_dev->watchdog.old_kccb_cmds_executed = kccb_cmds_executed;
+		pvr_dev->watchdog.kccb_stall_count = 0;
+	}
+
 	return false;
 }
 
@@ -118,6 +176,9 @@ pvr_watchdog_worker(struct work_struct *work)
 	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <= 0)
 		goto out_requeue;
 
+	if (!pvr_dev->fw_dev.booted)
+		goto out_pm_runtime_put;
+
 	stalled = pvr_watchdog_kccb_stalled(pvr_dev);
 
 	if (stalled) {
@@ -127,6 +188,7 @@ pvr_watchdog_worker(struct work_struct *work)
 		/* Device may be lost at this point. */
 	}
 
+out_pm_runtime_put:
 	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
 
 out_requeue:
@@ -158,18 +220,26 @@ pvr_power_device_suspend(struct device *dev)
 	struct platform_device *plat_dev = to_platform_device(dev);
 	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	int err = 0;
 	int idx;
 
 	if (!drm_dev_enter(drm_dev, &idx))
 		return -EIO;
 
+	if (pvr_dev->fw_dev.booted) {
+		err = pvr_power_fw_disable(pvr_dev, false);
+		if (err)
+			goto err_drm_dev_exit;
+	}
+
 	clk_disable_unprepare(pvr_dev->mem_clk);
 	clk_disable_unprepare(pvr_dev->sys_clk);
 	clk_disable_unprepare(pvr_dev->core_clk);
 
+err_drm_dev_exit:
 	drm_dev_exit(idx);
 
-	return 0;
+	return err;
 }
 
 int
@@ -196,10 +266,19 @@ pvr_power_device_resume(struct device *dev)
 	if (err)
 		goto err_sys_clk_disable;
 
+	if (pvr_dev->fw_dev.booted) {
+		err = pvr_power_fw_enable(pvr_dev);
+		if (err)
+			goto err_mem_clk_disable;
+	}
+
 	drm_dev_exit(idx);
 
 	return 0;
 
+err_mem_clk_disable:
+	clk_disable_unprepare(pvr_dev->mem_clk);
+
 err_sys_clk_disable:
 	clk_disable_unprepare(pvr_dev->sys_clk);
 
@@ -239,7 +318,6 @@ pvr_power_device_idle(struct device *dev)
 int
 pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 {
-	/* TODO: Implement hard reset. */
 	int err;
 
 	/*
@@ -248,13 +326,69 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 	 */
 	WARN_ON(pvr_power_get(pvr_dev));
 
-	err = pvr_power_fw_disable(pvr_dev, false);
-	if (err)
-		goto err_power_put;
+	down_write(&pvr_dev->reset_sem);
+
+	if (pvr_dev->lost) {
+		err = -EIO;
+		goto err_up_write;
+	}
+
+	/* Disable IRQs for the duration of the reset. */
+	disable_irq(pvr_dev->irq);
+
+	do {
+		err = pvr_power_fw_disable(pvr_dev, hard_reset);
+		if (!err) {
+			if (hard_reset) {
+				pvr_dev->fw_dev.booted = false;
+				WARN_ON(pm_runtime_force_suspend(from_pvr_device(pvr_dev)->dev));
+
+				err = pvr_fw_hard_reset(pvr_dev);
+				if (err)
+					goto err_device_lost;
+
+				err = pm_runtime_force_resume(from_pvr_device(pvr_dev)->dev);
+				pvr_dev->fw_dev.booted = true;
+				if (err)
+					goto err_device_lost;
+			} else {
+				/* Clear the FW faulted flags. */
+				pvr_dev->fw_dev.fwif_sysdata->hwr_state_flags &=
+					~(ROGUE_FWIF_HWR_FW_FAULT |
+					  ROGUE_FWIF_HWR_RESTART_REQUESTED);
+			}
+
+			pvr_fw_irq_clear(pvr_dev);
+
+			err = pvr_power_fw_enable(pvr_dev);
+		}
+
+		if (err && hard_reset)
+			goto err_device_lost;
+
+		if (err && !hard_reset) {
+			drm_err(from_pvr_device(pvr_dev), "FW stalled, trying hard reset");
+			hard_reset = true;
+		}
+	} while (err);
+
+	enable_irq(pvr_dev->irq);
+
+	up_write(&pvr_dev->reset_sem);
+
+	pvr_power_put(pvr_dev);
+
+	return 0;
+
+err_device_lost:
+	drm_err(from_pvr_device(pvr_dev), "GPU device lost");
+	pvr_device_lost(pvr_dev);
+
+	/* Leave IRQs disabled if the device is lost. */
 
-	err = pvr_power_fw_enable(pvr_dev);
+err_up_write:
+	up_write(&pvr_dev->reset_sem);
 
-err_power_put:
 	pvr_power_put(pvr_dev);
 
 	return err;
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
index 439f08d13655..3e53189f0eda 100644
--- a/drivers/gpu/drm/imagination/pvr_power.h
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -12,6 +12,8 @@
 int pvr_watchdog_init(struct pvr_device *pvr_dev);
 void pvr_watchdog_fini(struct pvr_device *pvr_dev);
 
+void pvr_device_lost(struct pvr_device *pvr_dev);
+
 bool pvr_power_is_idle(struct pvr_device *pvr_dev);
 
 int pvr_power_device_suspend(struct device *dev);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index edf6fbabe554..a9d3ea990aa8 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -334,6 +334,16 @@ static const struct drm_gpuvm_ops pvr_vm_gpuva_ops = {
 	.sm_step_unmap = pvr_vm_gpuva_unmap,
 };
 
+static void
+fw_mem_context_init(void *cpu_ptr, void *priv)
+{
+	struct rogue_fwif_fwmemcontext *fw_mem_ctx = cpu_ptr;
+	struct pvr_vm_context *vm_ctx = priv;
+
+	fw_mem_ctx->pc_dev_paddr = pvr_vm_get_page_table_root_addr(vm_ctx);
+	fw_mem_ctx->page_cat_base_reg_set = ROGUE_FW_BIF_INVALID_PCSET;
+}
+
 /**
  * pvr_vm_create_context() - Create a new VM context.
  * @pvr_dev: Target PowerVR device.
@@ -393,13 +403,19 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	}
 
 	if (is_userspace_context) {
-		/* TODO: Create FW mem context */
-		err = -ENODEV;
-		goto err_put_ctx;
+		err = pvr_fw_object_create(pvr_dev, sizeof(struct rogue_fwif_fwmemcontext),
+					   PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
+					   fw_mem_context_init, vm_ctx, &vm_ctx->fw_mem_ctx_obj);
+
+		if (err)
+			goto err_page_table_destroy;
 	}
 
 	return vm_ctx;
 
+err_page_table_destroy:
+	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
+
 err_put_ctx:
 	pvr_vm_context_put(vm_ctx);
 
@@ -419,8 +435,8 @@ pvr_vm_context_release(struct kref *ref_count)
 	struct pvr_vm_context *vm_ctx =
 		container_of(ref_count, struct pvr_vm_context, ref_count);
 
-	/* TODO: Destroy FW mem context */
-	WARN_ON(vm_ctx->fw_mem_ctx_obj);
+	if (vm_ctx->fw_mem_ctx_obj)
+		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
 
 	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
 			     vm_ctx->gpuvm_mgr.mm_range));
-- 
2.42.0


