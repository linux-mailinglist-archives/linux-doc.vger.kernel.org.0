Return-Path: <linux-doc+bounces-1464-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA77DD170
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8111DB20E1C
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CF6200DB;
	Tue, 31 Oct 2023 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="hzBjkfLa"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3923D6B;
	Tue, 31 Oct 2023 16:21:44 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661DDA6;
	Tue, 31 Oct 2023 09:21:39 -0700 (PDT)
Received: from pps.filterd (m0168887.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VGKgMs010204;
	Tue, 31 Oct 2023 16:20:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0sq78apf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Oct 2023 16:20:42 +0000 (GMT)
Received: from pps.reinject (m0168887.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39VGKfds010199;
	Tue, 31 Oct 2023 16:20:41 GMT
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf42-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Oct 2023 15:13:30 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:28 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.51) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F42PUTRF7+IQLWIBOS4Fv9/6RYmAyhb6/EeVV4RXaAqykxMvww+KSOo3m8TGgJOwHKpF2GSjuWo5U5zUf3H9xEUQf3cWvb85Fs7P4BRqPePJiI7mRjM+wJnP8XvcrbgeFygQpgzo/refIFSsLkEGneTpIdZ9ozpdPWPXAduuzWAoxt5tzKYRknFerikN+xW6dEUNdmTgqYbr7E7rBNWOgGG/4X++igX8DVb6JnrGyKD4zlHn7SY+d+iI2FxFYNyqXxOAQIQ3uPTG7l/QipTeYdGg+9ZxdLuoiq5ZIkPzZBO3wKz2p7qiLrzJjYWrvQUKUTJTgLf5Sz4n9GOJJpjQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PjzXUn6EZd0u+rWwiIiNhCnn2yCzyLGk7fx1EdmuFg=;
 b=DbYLy3NJzGjb0mejX+CKhbG3MzMn63rSri1a/owsYOMNE+5ov3uYIhwai6tuSVKTcmHE4aI4dZOcHJQ87tBj9stGSs8Tji0PD8JytOmtZbzqzuX8oSpnlxEyF4hdEWGlwVQYClrH/TaQh6hW+Zq1c5mM11tjJBG7k8DBMx5WtZEBaw99Qd6TgAC+8JdlvEiQ79tXsW3PrIurbxTq77Q2IYXpwrXJ3Y7dlT2axqKzZcS0gKmc7MEYTlpV2igDuyFh+DB3TgCpj8iqdq5Ey7y59E7PMsXXKJOixhyUW6yoYu/klggf/BmxVuatI10wdcYuUMIU56a3ulnZqtwr2I28mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PjzXUn6EZd0u+rWwiIiNhCnn2yCzyLGk7fx1EdmuFg=;
 b=hzBjkfLadpTPzO7/6dJv6z7KLNMBwwA7+O+o8Iobjp+o9c6F8i55FD8LUTN/kb/BrRXGM2FE0wr0H8LkLFg9NX78wJ2rk3xxTQlovMy1EQqB8qIEe8se9zDiClJffIllimanesNU7UBtOh7RLqWfTj4F5ZBXR/exL7FILWtrMNk=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:20 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:20 +0000
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
        <linux-doc@vger.kernel.org>, Matt Coster <matt.coster@imgtec.com>
Date: Tue, 31 Oct 2023 15:12:48 +0000
Message-Id: <20231031151257.90350-12-sarah.walker@imgtec.com>
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
X-MS-Office365-Filtering-Correlation-Id: e5a296e9-f4e4-44e1-d653-08dbda23eaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Vgj+7G6uAGpk+Bvkb3EyEfE8J8Q9M/mBPXyMZqhUemyCuUk34foQ4BetikQfZycNP4oFEJgwxq5cx6vR20P5UH5qt/yg4Liw2mt/5h8vOi+4VtK6ZYD5vPtdh/NAkIxfR/To9MTo6M5mH5W8cpflZ6J/DX5UO+aFDrJye0uRCTCdSdKiqWMHEWNBMI0f00AgJh0jzDKetxLOe8o8yl3xiJVpph8HA93oscQxYo2yktW6LegI8jljLooIuNvmiXIDY0NKKa7XBXvN0W3zxDx8Zj7lpCMRRblkjh+kpkAaldW75BOFORpxZ4jaqlsg6PN5QiHGxjiKrkjtRMgXEa0fT5rwqQtTVT/rQEs/XsIbbhVXyH9249zqh47XxOxGB7dfUcx7p3QCDdbRUbZBlsAHfjcEzXyAX8qU6eyfe1k8Y7cBiL4T+AYrXK01fT6OxLEJx+VpNGkA4B3vfiQnvEvtXbsKqFSp9CReWEMJbumLmtmdwK9E1JAT3kF7HXxbhYqVFTlnnb4FTSN3CkX5ye0QVEXrN0DiBBQmJxrt/x6GjHfDGswjanGbmAQ+soEdta+5SgGhR/D/Ax9Koj2Fj2mmdbnjF+FheqfCgzzRVQo4YrefVdfegFLMoZB6C/pMJEpiUGZ6HMrhvTS0ubV3ZTV4vJ84KD1cBMlz4doVWcDeB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(107886003)(1076003)(316002)(6916009)(66946007)(66476007)(66556008)(2616005)(83380400001)(478600001)(6666004)(26005)(6512007)(6506007)(52116002)(6486002)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3McxCOYttcm3ATkdIzGj1vz83IUpgY2wQBdcMwlvH0j7C+Kq7oPhreJ9YqpI?=
 =?us-ascii?Q?slIVgs1f3V1yFBAgiBndecRsIDq1hWwiEPKZKELfspPLYnwdhSoIN1OrgS1U?=
 =?us-ascii?Q?6ipYdLq4eOAsaHkD3BcI9FDU3e6cTl0dASPJVfiNkaxhoFfamHINLuhqr1rP?=
 =?us-ascii?Q?Rh6f/E6XtQSWG0UCQBThUHtY1NKuZXPl8DA3U0uc1iZUk0wF4iNLyOiHVbjR?=
 =?us-ascii?Q?lLbNQkaOx56BVROXAR4saasnfFD6Rpb7wKQ1RVAlfg4S541dsa0NBwWc22Qa?=
 =?us-ascii?Q?8oj4EIJ8VvAS+WgfY68PkCh5l+ncEytZ6TDPc0kIgi2F2AfHgeV9YNDBhtni?=
 =?us-ascii?Q?eHJ13j4/qThBhiSnxcx8JrsJGgPKNhsHc97R/FZg/IgPF+gsLugnN3ye+45K?=
 =?us-ascii?Q?9pV+7lu2Q4e/y3L0vMqXLmbhAZGB/kFtYU5zFINRtOh3tGtdMLLdDigM5SeU?=
 =?us-ascii?Q?hCEdkLW31TvgyE2OTKww1PR/U7fJSiwlPiXi8P4Ha8LB6AjFUzx5bKhoaHBW?=
 =?us-ascii?Q?x5DQq2BCCQRJozdzks0DpQIlgZgKyvi7zL5D3POHCvhjDJswKZUSeI8oJQss?=
 =?us-ascii?Q?RDQzMCR81cdh74Ktv+YeTAtsrVqVVOaVgZlhxW3uqfLp1QPUyIS9o8rSwfby?=
 =?us-ascii?Q?cPBbWgjS0R+twM+ceK1+k5zng3jFVwzLWLQ6evKscUBH8KfEyhhZeLIRKyg1?=
 =?us-ascii?Q?UR2irscENxesf2q1nzY71hvI9RwI99CEF/XgEGp7+nMNHWP1MKkqv/2hToYA?=
 =?us-ascii?Q?48FOFjJXgIK1zAj15JtMaRafrHAZbpDmnFzb3p+QnCTQAYk1FZXLw69P3tXO?=
 =?us-ascii?Q?lWBopecUADNM7VC98AzEennKNaud+nZHxJ/Lffb8AZ9WmcptfLwEVELwr/17?=
 =?us-ascii?Q?SSI9PWg8uSEdI5S05zG285M2JJPXWK3vKm6I/7PPLdNB5UaeVN7HTexj40Ay?=
 =?us-ascii?Q?cFp0lSt+ams3ddQi4W1OoiF37YglIekqxLRyn4loyef3cw3ZPrk+fBRqZ8Ns?=
 =?us-ascii?Q?DBJqg3A9W1TMlMB3+CBXPHncHrRFxmxCrljsZN4BW2eWOE2H5MheNWyst/a1?=
 =?us-ascii?Q?+7ow4n2DlPJYDHK9wfGcg2xG66AHMHijU1UxdFFX0BnCERR/Xr1JGOW0FjoL?=
 =?us-ascii?Q?gT9rryKVc5K8v5u6t3dHpm6dYW6QUyQrIrYTsCDVkR9ZAUFIJYjDA1RVXGBf?=
 =?us-ascii?Q?CL8k0KsbPOTJY5NxvmxVT49zocfbIdCdU5FhhCehRn3OAV6w6b6Nz5vsSst1?=
 =?us-ascii?Q?IjE0xiSXstTYHSCi6B8Vj+23xhYQNd+ei/PgtqeNJ2uiRCsdcbLYyQzC1RUH?=
 =?us-ascii?Q?L9d/H4+f7/ilkSrcEeQZtbbOr5hWe1PmZxS7lQSzenLCf0I354SJo8pQOMKn?=
 =?us-ascii?Q?SPUl1EgPDkkJK7nwRKxn7Eot9cTT7N2iuDZ9Ce+P73STccS0LjrrmNcL/85f?=
 =?us-ascii?Q?waJOgHhjU3Gui45+bmtK2pySAoudNAQPJOwaqT0T82LdYli5T0IeAkSZo3l4?=
 =?us-ascii?Q?bExqfx3g4LwGcIQB5QyUQNdLBwgHp5bGglSscOrYCttm8sBXcEyT5IrAeLuc?=
 =?us-ascii?Q?moRcOW2XP+SvaeQ1eJw2VsGBRZHJiMczi3xDRxLCqgD4Uwl8XdG360rkdWOi?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a296e9-f4e4-44e1-d653-08dbda23eaed
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:20.6321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObkFSndIALCDvRBidcpT2i2ERlJ8HhTvUH1XeVYlWeiS2YOHY6c0Ia2JYyM5Jp41MK8PEOO4kqb7nJ+Thpj6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 0h-MnNyQxe-SJHH5lSLQpQPed-oAOA-Y
X-Proofpoint-ORIG-GUID: 0h-MnNyQxe-SJHH5lSLQpQPed-oAOA-Y
subject: [PATCH v8 11/20] drm/imagination: Add GEM and VM related code

Add a GEM implementation based on drm_gem_shmem, and support code for the
PowerVR GPU MMU. The GPU VA manager is used for address space management.

Changes since v7:
- kernel-doc fixes
- Remove prefixes from DRM_PVR_BO_* flags
- CREATE_BO ioctl now returns an error if provided size isn't page aligned
- Optimised MMU flushes

Changes since v6:
- Don't initialise kernel_vm_ctx when using MIPS firmware processor
- Rename drm_gpuva_manager uses to drm_gpuvm
- Sync GEM object to device on creation

Changes since v5:
- Use WRITE_ONCE() when writing to page tables
- Add memory barriers to page table insertion
- Fixed double backing page alloc on page table objects
- Fix BO mask checks in DRM_IOCTL_PVR_CREATE_BO handler
- Document use of pvr_page_table_*_idx when preallocing page table objs
- Remove pvr_vm_gpuva_mapping_init()
- Remove NULL check for unmap op in remap function
- Protect gem object with mutex during drm_gpuva_link/unlink
- Defer free or release of page table pages until after TLB flush
- Use drm_gpuva_op_remap_get_unmap_range() helper

Changes since v4:
- Correct sync function in vmap/vunmap function documentation
- Update for upstream GPU VA manager
- Fix missing frees when unmapping drm_gpuva objects
- Always zero GEM BOs on creation

Changes since v3:
- Split MMU and VM code
- Register page table allocations with kmemleak
- Use drm_dev_{enter,exit}

Changes since v2:
- Use GPU VA manager
- Use drm_gem_shmem

Co-developed-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Co-developed-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 drivers/gpu/drm/imagination/Kconfig      |    1 +
 drivers/gpu/drm/imagination/Makefile     |    5 +-
 drivers/gpu/drm/imagination/pvr_device.c |   27 +-
 drivers/gpu/drm/imagination/pvr_device.h |   24 +
 drivers/gpu/drm/imagination/pvr_drv.c    |  289 ++-
 drivers/gpu/drm/imagination/pvr_gem.c    |  421 ++++
 drivers/gpu/drm/imagination/pvr_gem.h    |  175 ++
 drivers/gpu/drm/imagination/pvr_mmu.c    | 2573 ++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_mmu.h    |  109 +
 drivers/gpu/drm/imagination/pvr_vm.c     |  942 ++++++++
 drivers/gpu/drm/imagination/pvr_vm.h     |   60 +
 11 files changed, 4615 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index e9aaa5313485..3e167d5470b4 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -7,6 +7,7 @@ config DRM_POWERVR
 	depends on DRM
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_SCHED
+	select DRM_GPUVM
 	select FW_LOADER
 	help
 	  Choose this option if you have a system that has an Imagination
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 9e144ff2742b..8fcabc1bea36 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -7,6 +7,9 @@ powervr-y := \
 	pvr_device.o \
 	pvr_device_info.o \
 	pvr_drv.o \
-	pvr_fw.o
+	pvr_fw.o \
+	pvr_gem.o \
+	pvr_mmu.o \
+	pvr_vm.o
 
 obj-$(CONFIG_DRM_POWERVR) += powervr.o
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index b1fae182c4f6..f71e400ea24e 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -6,6 +6,7 @@
 
 #include "pvr_fw.h"
 #include "pvr_rogue_cr_defs.h"
+#include "pvr_vm.h"
 
 #include <drm/drm_print.h>
 
@@ -312,7 +313,30 @@ pvr_device_gpu_init(struct pvr_device *pvr_dev)
 	else
 		return -EINVAL;
 
-	return pvr_set_dma_info(pvr_dev);
+	err = pvr_set_dma_info(pvr_dev);
+	if (err)
+		return err;
+
+	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
+		pvr_dev->kernel_vm_ctx = pvr_vm_create_context(pvr_dev, false);
+		if (IS_ERR(pvr_dev->kernel_vm_ctx))
+			return PTR_ERR(pvr_dev->kernel_vm_ctx);
+	}
+
+	return 0;
+}
+
+/**
+ * pvr_device_gpu_fini() - GPU-specific deinitialization for a PowerVR device
+ * @pvr_dev: Target PowerVR device.
+ */
+static void
+pvr_device_gpu_fini(struct pvr_device *pvr_dev)
+{
+	if (pvr_dev->fw_dev.processor_type != PVR_FW_PROCESSOR_TYPE_MIPS) {
+		WARN_ON(!pvr_vm_context_put(pvr_dev->kernel_vm_ctx));
+		pvr_dev->kernel_vm_ctx = NULL;
+	}
 }
 
 /**
@@ -364,6 +388,7 @@ pvr_device_fini(struct pvr_device *pvr_dev)
 	 * Deinitialization stages are performed in reverse order compared to
 	 * the initialization stages in pvr_device_init().
 	 */
+	pvr_device_gpu_fini(pvr_dev);
 }
 
 bool
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 833fd686c8eb..a5e62ca00737 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -123,8 +123,24 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	/**
+	 * @kernel_vm_ctx: Virtual memory context used for kernel mappings.
+	 *
+	 * This is used for mappings in the firmware address region when a META firmware processor
+	 * is in use.
+	 *
+	 * When a MIPS firmware processor is in use, this will be %NULL.
+	 */
+	struct pvr_vm_context *kernel_vm_ctx;
+
 	/** @fw_dev: Firmware related data. */
 	struct pvr_fw_device fw_dev;
+
+	/**
+	 * @mmu_flush_cache_flags: Records which MMU caches require flushing
+	 * before submitting the next job.
+	 */
+	atomic_t mmu_flush_cache_flags;
 };
 
 /**
@@ -145,6 +161,14 @@ struct pvr_file {
 	 *           to_pvr_device().
 	 */
 	struct pvr_device *pvr_dev;
+
+	/**
+	 * @vm_ctx_handles: Array of VM contexts belonging to this file. Array
+	 * members are of type "struct pvr_vm_context *".
+	 *
+	 * This array is used to allocate handles returned to userspace.
+	 */
+	struct xarray vm_ctx_handles;
 };
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 02a0ccc51f3e..c3a5cc04c3de 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -3,9 +3,12 @@
 
 #include "pvr_device.h"
 #include "pvr_drv.h"
+#include "pvr_gem.h"
+#include "pvr_mmu.h"
 #include "pvr_rogue_defs.h"
 #include "pvr_rogue_fwif_client.h"
 #include "pvr_rogue_fwif_shared.h"
+#include "pvr_vm.h"
 
 #include <uapi/drm/pvr_drm.h>
 
@@ -60,7 +63,72 @@ static int
 pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
 		    struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_create_bo_args *args = raw_args;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_file *pvr_file = to_pvr_file(file);
+
+	struct pvr_gem_object *pvr_obj;
+	size_t sanitized_size;
+
+	int idx;
+	int err;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	/* All padding fields must be zeroed. */
+	if (args->_padding_c != 0) {
+		err = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	/*
+	 * On 64-bit platforms (our primary target), size_t is a u64. However,
+	 * on other architectures we have to check for overflow when casting
+	 * down to size_t from u64.
+	 *
+	 * We also disallow zero-sized allocations, and reserved (kernel-only)
+	 * flags.
+	 */
+	if (args->size > SIZE_MAX || args->size == 0 || args->flags &
+	    ~DRM_PVR_BO_FLAGS_MASK || args->size & (PVR_DEVICE_PAGE_SIZE - 1)) {
+		err = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	sanitized_size = (size_t)args->size;
+
+	/*
+	 * Create a buffer object and transfer ownership to a userspace-
+	 * accessible handle.
+	 */
+	pvr_obj = pvr_gem_object_create(pvr_dev, sanitized_size, args->flags);
+	if (IS_ERR(pvr_obj)) {
+		err = PTR_ERR(pvr_obj);
+		goto err_drm_dev_exit;
+	}
+
+	/* This function will not modify &args->handle unless it succeeds. */
+	err = pvr_gem_object_into_handle(pvr_obj, pvr_file, &args->handle);
+	if (err)
+		goto err_destroy_obj;
+
+	drm_dev_exit(idx);
+
+	return 0;
+
+err_destroy_obj:
+	/*
+	 * GEM objects are refcounted, so there is no explicit destructor
+	 * function. Instead, we release the singular reference we currently
+	 * hold on the object and let GEM take care of the rest.
+	 */
+	pvr_gem_object_put(pvr_obj);
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return err;
 }
 
 /**
@@ -87,7 +155,61 @@ static int
 pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_dev, void *raw_args,
 			     struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_get_bo_mmap_offset_args *args = raw_args;
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_gem_object *pvr_obj;
+	struct drm_gem_object *gem_obj;
+	int idx;
+	int ret;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	/* All padding fields must be zeroed. */
+	if (args->_padding_4 != 0) {
+		ret = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	/*
+	 * Obtain a kernel reference to the buffer object. This reference is
+	 * counted and must be manually dropped before returning. If a buffer
+	 * object cannot be found for the specified handle, return -%ENOENT (No
+	 * such file or directory).
+	 */
+	pvr_obj = pvr_gem_object_from_handle(pvr_file, args->handle);
+	if (!pvr_obj) {
+		ret = -ENOENT;
+		goto err_drm_dev_exit;
+	}
+
+	gem_obj = gem_from_pvr_gem(pvr_obj);
+
+	/*
+	 * Allocate a fake offset which can be used in userspace calls to mmap
+	 * on the DRM device file. If this fails, return the error code. This
+	 * operation is idempotent.
+	 */
+	ret = drm_gem_create_mmap_offset(gem_obj);
+	if (ret != 0) {
+		/* Drop our reference to the buffer object. */
+		drm_gem_object_put(gem_obj);
+		goto err_drm_dev_exit;
+	}
+
+	/*
+	 * Read out the fake offset allocated by the earlier call to
+	 * drm_gem_create_mmap_offset.
+	 */
+	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+
+	/* Drop our reference to the buffer object. */
+	pvr_gem_object_put(pvr_obj);
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return ret;
 }
 
 static __always_inline u64
@@ -516,10 +638,12 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
 		break;
 
 	case DRM_PVR_DEV_QUERY_HEAP_INFO_GET:
-		return -EINVAL;
+		ret = pvr_heap_info_get(pvr_dev, args);
+		break;
 
 	case DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET:
-		return -EINVAL;
+		ret = pvr_static_data_areas_get(pvr_dev, args);
+		break;
 	}
 
 	drm_dev_exit(idx);
@@ -666,7 +790,46 @@ static int
 pvr_ioctl_create_vm_context(struct drm_device *drm_dev, void *raw_args,
 			    struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_create_vm_context_args *args = raw_args;
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_vm_context *vm_ctx;
+	int idx;
+	int err;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	if (args->_padding_4) {
+		err = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	vm_ctx = pvr_vm_create_context(pvr_file->pvr_dev, true);
+	if (IS_ERR(vm_ctx)) {
+		err = PTR_ERR(vm_ctx);
+		goto err_drm_dev_exit;
+	}
+
+	/* Allocate object handle for userspace. */
+	err = xa_alloc(&pvr_file->vm_ctx_handles,
+		       &args->handle,
+		       vm_ctx,
+		       xa_limit_32b,
+		       GFP_KERNEL);
+	if (err < 0)
+		goto err_cleanup;
+
+	drm_dev_exit(idx);
+
+	return 0;
+
+err_cleanup:
+	pvr_vm_context_put(vm_ctx);
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return err;
 }
 
 /**
@@ -686,7 +849,19 @@ static int
 pvr_ioctl_destroy_vm_context(struct drm_device *drm_dev, void *raw_args,
 			     struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_destroy_vm_context_args *args = raw_args;
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_vm_context *vm_ctx;
+
+	if (args->_padding_4)
+		return -EINVAL;
+
+	vm_ctx = xa_erase(&pvr_file->vm_ctx_handles, args->handle);
+	if (!vm_ctx)
+		return -EINVAL;
+
+	pvr_vm_context_put(vm_ctx);
+	return 0;
 }
 
 /**
@@ -716,7 +891,79 @@ static int
 pvr_ioctl_vm_map(struct drm_device *drm_dev, void *raw_args,
 		 struct drm_file *file)
 {
-	return -ENOTTY;
+	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct drm_pvr_ioctl_vm_map_args *args = raw_args;
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_vm_context *vm_ctx;
+
+	struct pvr_gem_object *pvr_obj;
+	size_t pvr_obj_size;
+
+	u64 offset_plus_size;
+	int idx;
+	int err;
+
+	if (!drm_dev_enter(drm_dev, &idx))
+		return -EIO;
+
+	/* Initial validation of args. */
+	if (args->_padding_14) {
+		err = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	if (args->flags != 0 ||
+	    check_add_overflow(args->offset, args->size, &offset_plus_size) ||
+	    !pvr_find_heap_containing(pvr_dev, args->device_addr, args->size)) {
+		err = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	vm_ctx = pvr_vm_context_lookup(pvr_file, args->vm_context_handle);
+	if (!vm_ctx) {
+		err = -EINVAL;
+		goto err_drm_dev_exit;
+	}
+
+	pvr_obj = pvr_gem_object_from_handle(pvr_file, args->handle);
+	if (!pvr_obj) {
+		err = -ENOENT;
+		goto err_put_vm_context;
+	}
+
+	pvr_obj_size = pvr_gem_object_size(pvr_obj);
+
+	/*
+	 * Validate offset and size args. The alignment of these will be
+	 * checked when mapping; for now just check that they're within valid
+	 * bounds
+	 */
+	if (args->offset >= pvr_obj_size || offset_plus_size > pvr_obj_size) {
+		err = -EINVAL;
+		goto err_put_pvr_object;
+	}
+
+	err = pvr_vm_map(vm_ctx, pvr_obj, args->offset,
+			 args->device_addr, args->size);
+	if (err)
+		goto err_put_pvr_object;
+
+	/*
+	 * In order to set up the mapping, we needed a reference to &pvr_obj.
+	 * However, pvr_vm_map() obtains and stores its own reference, so we
+	 * must release ours before returning.
+	 */
+
+err_put_pvr_object:
+	pvr_gem_object_put(pvr_obj);
+
+err_put_vm_context:
+	pvr_vm_context_put(vm_ctx);
+
+err_drm_dev_exit:
+	drm_dev_exit(idx);
+
+	return err;
 }
 
 /**
@@ -739,7 +986,24 @@ static int
 pvr_ioctl_vm_unmap(struct drm_device *drm_dev, void *raw_args,
 		   struct drm_file *file)
 {
-	return -ENOTTY;
+	struct drm_pvr_ioctl_vm_unmap_args *args = raw_args;
+	struct pvr_file *pvr_file = to_pvr_file(file);
+	struct pvr_vm_context *vm_ctx;
+	int err;
+
+	/* Initial validation of args. */
+	if (args->_padding_4)
+		return -EINVAL;
+
+	vm_ctx = pvr_vm_context_lookup(pvr_file, args->vm_context_handle);
+	if (!vm_ctx)
+		return -EINVAL;
+
+	err = pvr_vm_unmap(vm_ctx, args->device_addr, args->size);
+
+	pvr_vm_context_put(vm_ctx);
+
+	return err;
 }
 
 /*
@@ -930,6 +1194,8 @@ pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
 	 */
 	pvr_file->pvr_dev = pvr_dev;
 
+	xa_init_flags(&pvr_file->vm_ctx_handles, XA_FLAGS_ALLOC1);
+
 	/*
 	 * Store reference to powervr-specific file private data in DRM file
 	 * private data.
@@ -955,6 +1221,9 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 {
 	struct pvr_file *pvr_file = to_pvr_file(file);
 
+	/* Drop references on any remaining objects. */
+	pvr_destroy_vm_contexts_for_file(pvr_file);
+
 	kfree(pvr_file);
 	file->driver_priv = NULL;
 }
@@ -962,7 +1231,7 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
 
 static struct drm_driver pvr_drm_driver = {
-	.driver_features = DRIVER_RENDER,
+	.driver_features = DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDER,
 	.open = pvr_drm_driver_open,
 	.postclose = pvr_drm_driver_postclose,
 	.ioctls = pvr_drm_driver_ioctls,
@@ -976,6 +1245,8 @@ static struct drm_driver pvr_drm_driver = {
 	.minor = PVR_DRIVER_MINOR,
 	.patchlevel = PVR_DRIVER_PATCHLEVEL,
 
+	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_create_object = pvr_gem_create_object,
 };
 
 static int
diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
new file mode 100644
index 000000000000..beaaff062a85
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_device.h"
+#include "pvr_gem.h"
+#include "pvr_vm.h"
+
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+
+#include <linux/compiler.h>
+#include <linux/compiler_attributes.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/gfp.h>
+#include <linux/iosys-map.h>
+#include <linux/log2.h>
+#include <linux/mutex.h>
+#include <linux/pagemap.h>
+#include <linux/refcount.h>
+#include <linux/scatterlist.h>
+
+static void pvr_gem_object_free(struct drm_gem_object *obj)
+{
+	struct pvr_gem_object *pvr_gem = gem_to_pvr_gem(obj);
+
+	mutex_destroy(&pvr_gem->gpuva_lock);
+	drm_gem_shmem_object_free(obj);
+}
+
+static int pvr_gem_mmap(struct drm_gem_object *gem_obj, struct vm_area_struct *vma)
+{
+	struct pvr_gem_object *pvr_obj = gem_to_pvr_gem(gem_obj);
+	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
+
+	if (!(pvr_obj->flags & DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS))
+		return -EINVAL;
+
+	return drm_gem_shmem_mmap(shmem_obj, vma);
+}
+
+static const struct drm_gem_object_funcs pvr_gem_object_funcs = {
+	.free = pvr_gem_object_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = pvr_gem_mmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+};
+
+/**
+ * pvr_gem_object_flags_validate() - Verify that a collection of PowerVR GEM
+ * mapping and/or creation flags form a valid combination.
+ * @flags: PowerVR GEM mapping/creation flags to validate.
+ *
+ * This function explicitly allows kernel-only flags. All ioctl entrypoints
+ * should do their own validation as well as relying on this function.
+ *
+ * Return:
+ *  * %true if @flags contains valid mapping and/or creation flags, or
+ *  * %false otherwise.
+ */
+static bool
+pvr_gem_object_flags_validate(u64 flags)
+{
+	static const u64 invalid_combinations[] = {
+		/*
+		 * Memory flagged as PM/FW-protected cannot be mapped to
+		 * userspace. To make this explicit, we require that the two
+		 * flags allowing each of these respective features are never
+		 * specified together.
+		 */
+		(DRM_PVR_BO_PM_FW_PROTECT |
+		 DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS),
+	};
+
+	int i;
+
+	/*
+	 * Check for bits set in undefined regions. Reserved regions refer to
+	 * options that can only be set by the kernel. These are explicitly
+	 * allowed in most cases, and must be checked specifically in IOCTL
+	 * callback code.
+	 */
+	if ((flags & PVR_BO_UNDEFINED_MASK) != 0)
+		return false;
+
+	/*
+	 * Check for all combinations of flags marked as invalid in the array
+	 * above.
+	 */
+	for (i = 0; i < ARRAY_SIZE(invalid_combinations); ++i) {
+		u64 combo = invalid_combinations[i];
+
+		if ((flags & combo) == combo)
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * pvr_gem_object_into_handle() - Convert a reference to an object into a
+ * userspace-accessible handle.
+ * @pvr_obj: [IN] Target PowerVR-specific object.
+ * @pvr_file: [IN] File to associate the handle with.
+ * @handle: [OUT] Pointer to store the created handle in. Remains unmodified if
+ * an error is encountered.
+ *
+ * If an error is encountered, ownership of @pvr_obj will not have been
+ * transferred. If this function succeeds, however, further use of @pvr_obj is
+ * considered undefined behaviour unless another reference to it is explicitly
+ * held.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error encountered while attempting to allocate a handle on @pvr_file.
+ */
+int
+pvr_gem_object_into_handle(struct pvr_gem_object *pvr_obj,
+			   struct pvr_file *pvr_file, u32 *handle)
+{
+	struct drm_gem_object *gem_obj = gem_from_pvr_gem(pvr_obj);
+	struct drm_file *file = from_pvr_file(pvr_file);
+
+	u32 new_handle;
+	int err;
+
+	err = drm_gem_handle_create(file, gem_obj, &new_handle);
+	if (err)
+		return err;
+
+	/*
+	 * Release our reference to @pvr_obj, effectively transferring
+	 * ownership to the handle.
+	 */
+	pvr_gem_object_put(pvr_obj);
+
+	/*
+	 * Do not store the new handle in @handle until no more errors can
+	 * occur.
+	 */
+	*handle = new_handle;
+
+	return 0;
+}
+
+/**
+ * pvr_gem_object_from_handle() - Obtain a reference to an object from a
+ * userspace handle.
+ * @pvr_file: PowerVR-specific file to which @handle is associated.
+ * @handle: Userspace handle referencing the target object.
+ *
+ * On return, @handle always maintains its reference to the requested object
+ * (if it had one in the first place). If this function succeeds, the returned
+ * object will hold an additional reference. When the caller is finished with
+ * the returned object, they should call pvr_gem_object_put() on it to release
+ * this reference.
+ *
+ * Return:
+ *  * A pointer to the requested PowerVR-specific object on success, or
+ *  * %NULL otherwise.
+ */
+struct pvr_gem_object *
+pvr_gem_object_from_handle(struct pvr_file *pvr_file, u32 handle)
+{
+	struct drm_file *file = from_pvr_file(pvr_file);
+	struct drm_gem_object *gem_obj;
+
+	gem_obj = drm_gem_object_lookup(file, handle);
+	if (!gem_obj)
+		return NULL;
+
+	return gem_to_pvr_gem(gem_obj);
+}
+
+/**
+ * pvr_gem_object_vmap() - Map a PowerVR GEM object into CPU virtual address
+ * space.
+ * @pvr_obj: Target PowerVR GEM object.
+ *
+ * Once the caller is finished with the CPU mapping, they must call
+ * pvr_gem_object_vunmap() on @pvr_obj.
+ *
+ * If @pvr_obj is CPU-cached, dma_sync_sgtable_for_cpu() is called to make
+ * sure the CPU mapping is consistent.
+ *
+ * Return:
+ *  * A pointer to the CPU mapping on success,
+ *  * -%ENOMEM if the mapping fails, or
+ *  * Any error encountered while attempting to acquire a reference to the
+ *    backing pages for @pvr_obj.
+ */
+void *
+pvr_gem_object_vmap(struct pvr_gem_object *pvr_obj)
+{
+	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
+	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
+	struct iosys_map map;
+	int err;
+
+	dma_resv_lock(obj->resv, NULL);
+
+	err = drm_gem_shmem_vmap(shmem_obj, &map);
+	if (err)
+		goto err_unlock;
+
+	if (pvr_obj->flags & PVR_BO_CPU_CACHED) {
+		struct device *dev = shmem_obj->base.dev->dev;
+
+		/* If shmem_obj->sgt is NULL, that means the buffer hasn't been mapped
+		 * in GPU space yet.
+		 */
+		if (shmem_obj->sgt)
+			dma_sync_sgtable_for_cpu(dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+	}
+
+	dma_resv_unlock(obj->resv);
+
+	return map.vaddr;
+
+err_unlock:
+	dma_resv_unlock(obj->resv);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_gem_object_vunmap() - Unmap a PowerVR memory object from CPU virtual
+ * address space.
+ * @pvr_obj: Target PowerVR GEM object.
+ *
+ * If @pvr_obj is CPU-cached, dma_sync_sgtable_for_device() is called to make
+ * sure the GPU mapping is consistent.
+ */
+void
+pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
+{
+	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(shmem_obj->vaddr);
+	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
+
+	if (WARN_ON(!map.vaddr))
+		return;
+
+	dma_resv_lock(obj->resv, NULL);
+
+	if (pvr_obj->flags & PVR_BO_CPU_CACHED) {
+		struct device *dev = shmem_obj->base.dev->dev;
+
+		/* If shmem_obj->sgt is NULL, that means the buffer hasn't been mapped
+		 * in GPU space yet.
+		 */
+		if (shmem_obj->sgt)
+			dma_sync_sgtable_for_device(dev, shmem_obj->sgt, DMA_BIDIRECTIONAL);
+	}
+
+	drm_gem_shmem_vunmap(shmem_obj, &map);
+
+	dma_resv_unlock(obj->resv);
+}
+
+/**
+ * pvr_gem_object_zero() - Zeroes the physical memory behind an object.
+ * @pvr_obj: Target PowerVR GEM object.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error encountered while attempting to map @pvr_obj to the CPU (see
+ *    pvr_gem_object_vmap()).
+ */
+static int
+pvr_gem_object_zero(struct pvr_gem_object *pvr_obj)
+{
+	void *cpu_ptr;
+
+	cpu_ptr = pvr_gem_object_vmap(pvr_obj);
+	if (IS_ERR(cpu_ptr))
+		return PTR_ERR(cpu_ptr);
+
+	memset(cpu_ptr, 0, pvr_gem_object_size(pvr_obj));
+
+	/* Make sure the zero-ing is done before vumap-ing the object. */
+	wmb();
+
+	pvr_gem_object_vunmap(pvr_obj);
+
+	return 0;
+}
+
+/**
+ * pvr_gem_create_object() - Allocate and pre-initializes a pvr_gem_object
+ * @drm_dev: DRM device creating this object.
+ * @size: Size of the object to allocate in bytes.
+ *
+ * Return:
+ *  * The new pre-initialized GEM object on success,
+ *  * -ENOMEM if the allocation failed.
+ */
+struct drm_gem_object *pvr_gem_create_object(struct drm_device *drm_dev, size_t size)
+{
+	struct drm_gem_object *gem_obj;
+	struct pvr_gem_object *pvr_obj;
+
+	pvr_obj = kzalloc(sizeof(*pvr_obj), GFP_KERNEL);
+	if (!pvr_obj)
+		return ERR_PTR(-ENOMEM);
+
+	gem_obj = gem_from_pvr_gem(pvr_obj);
+	gem_obj->funcs = &pvr_gem_object_funcs;
+
+	drm_gem_gpuva_set_lock(gem_obj, &pvr_obj->gpuva_lock);
+
+	return gem_obj;
+}
+
+/**
+ * pvr_gem_object_create() - Creates a PowerVR-specific buffer object.
+ * @pvr_dev: Target PowerVR device.
+ * @size: Size of the object to allocate in bytes. Must be greater than zero.
+ * Any value which is not an exact multiple of the system page size will be
+ * rounded up to satisfy this condition.
+ * @flags: Options which affect both this operation and future mapping
+ * operations performed on the returned object. Must be a combination of
+ * DRM_PVR_BO_* and/or PVR_BO_* flags.
+ *
+ * The created object may be larger than @size, but can never be smaller. To
+ * get the exact size, call pvr_gem_object_size() on the returned pointer.
+ *
+ * Return:
+ *  * The newly-minted PowerVR-specific buffer object on success,
+ *  * -%EINVAL if @size is zero or @flags is not valid,
+ *  * -%ENOMEM if sufficient physical memory cannot be allocated, or
+ *  * Any other error returned by drm_gem_create_mmap_offset().
+ */
+struct pvr_gem_object *
+pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
+{
+	struct drm_gem_shmem_object *shmem_obj;
+	struct pvr_gem_object *pvr_obj;
+	struct sg_table *sgt;
+	int err;
+
+	/* Verify @size and @flags before continuing. */
+	if (size == 0 || !pvr_gem_object_flags_validate(flags))
+		return ERR_PTR(-EINVAL);
+
+	shmem_obj = drm_gem_shmem_create(from_pvr_device(pvr_dev), size);
+	if (IS_ERR(shmem_obj))
+		return ERR_CAST(shmem_obj);
+
+	shmem_obj->pages_mark_dirty_on_put = true;
+	shmem_obj->map_wc = !(flags & PVR_BO_CPU_CACHED);
+	pvr_obj = shmem_gem_to_pvr_gem(shmem_obj);
+	pvr_obj->flags = flags;
+
+	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	if (IS_ERR(sgt)) {
+		err = PTR_ERR(sgt);
+		goto err_shmem_object_free;
+	}
+
+	mutex_init(&pvr_obj->gpuva_lock);
+
+	dma_sync_sgtable_for_device(shmem_obj->base.dev->dev, sgt,
+				    DMA_BIDIRECTIONAL);
+
+	/*
+	 * Do this last because pvr_gem_object_zero() requires a fully
+	 * configured instance of struct pvr_gem_object.
+	 */
+	pvr_gem_object_zero(pvr_obj);
+
+	return pvr_obj;
+
+err_shmem_object_free:
+	drm_gem_shmem_free(shmem_obj);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_gem_get_dma_addr() - Get DMA address for given offset in object
+ * @pvr_obj: Pointer to object to lookup address in.
+ * @offset: Offset within object to lookup address at.
+ * @dma_addr_out: Pointer to location to store DMA address.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * -%EINVAL if object is not currently backed, or if @offset is out of valid
+ *    range for this object.
+ */
+int
+pvr_gem_get_dma_addr(struct pvr_gem_object *pvr_obj, u32 offset,
+		     dma_addr_t *dma_addr_out)
+{
+	struct drm_gem_shmem_object *shmem_obj = shmem_gem_from_pvr_gem(pvr_obj);
+	u32 accumulated_offset = 0;
+	struct scatterlist *sgl;
+	unsigned int sgt_idx;
+
+	WARN_ON(!shmem_obj->sgt);
+	for_each_sgtable_dma_sg(shmem_obj->sgt, sgl, sgt_idx) {
+		u32 new_offset = accumulated_offset + sg_dma_len(sgl);
+
+		if (offset >= accumulated_offset && offset < new_offset) {
+			*dma_addr_out = sg_dma_address(sgl) +
+					(offset - accumulated_offset);
+			return 0;
+		}
+
+		accumulated_offset = new_offset;
+	}
+
+	return -EINVAL;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_gem.h b/drivers/gpu/drm/imagination/pvr_gem.h
new file mode 100644
index 000000000000..5209b7625233
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_gem.h
@@ -0,0 +1,175 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_GEM_H
+#define PVR_GEM_H
+
+#include "pvr_rogue_heap_config.h"
+#include "pvr_rogue_meta.h"
+
+#include <uapi/drm/pvr_drm.h>
+
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_mm.h>
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/const.h>
+#include <linux/compiler_attributes.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/refcount.h>
+#include <linux/scatterlist.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+/* Forward declaration from "pvr_device.h". */
+struct pvr_device;
+struct pvr_file;
+
+/**
+ * DOC: Flags for DRM_IOCTL_PVR_CREATE_BO (kernel-only)
+ *
+ * Kernel-only values allowed in &pvr_gem_object->flags. The majority of options
+ * for this field are specified in the UAPI header "pvr_drm.h" with a
+ * DRM_PVR_BO_ prefix. To distinguish these internal options (which must exist
+ * in ranges marked as "reserved" in the UAPI header), we drop the DRM prefix.
+ * The public options should be used directly, DRM prefix and all.
+ *
+ * To avoid potentially confusing gaps in the UAPI options, these kernel-only
+ * options are specified "in reverse", starting at bit 63.
+ *
+ * We use "reserved" to refer to bits defined here and not exposed in the UAPI.
+ * Bits not defined anywhere are "undefined".
+ *
+ * CPU mapping options
+ *    :PVR_BO_CPU_CACHED: By default, all GEM objects are mapped write-combined on the CPU. Set this
+ *       flag to override this behaviour and map the object cached.
+ *
+ * Firmware options
+ *    :PVR_BO_FW_NO_CLEAR_ON_RESET: By default, all FW objects are cleared and reinitialised on hard
+ *       reset. Set this flag to override this behaviour and preserve buffer contents on reset.
+ */
+#define PVR_BO_CPU_CACHED BIT_ULL(63)
+
+#define PVR_BO_FW_NO_CLEAR_ON_RESET BIT_ULL(62)
+
+#define PVR_BO_KERNEL_FLAGS_MASK (PVR_BO_CPU_CACHED | PVR_BO_FW_NO_CLEAR_ON_RESET)
+
+/* Bits 61..3 are undefined. */
+/* Bits 2..0 are defined in the UAPI. */
+
+/* Other utilities. */
+#define PVR_BO_UNDEFINED_MASK ~(PVR_BO_KERNEL_FLAGS_MASK | DRM_PVR_BO_FLAGS_MASK)
+
+/*
+ * All firmware-mapped memory uses (mostly) the same flags. Specifically,
+ * firmware-mapped memory should be:
+ *  * Read/write on the device,
+ *  * Read/write on the CPU, and
+ *  * Write-combined on the CPU.
+ *
+ * The only variation is in caching on the device.
+ */
+#define PVR_BO_FW_FLAGS_DEVICE_CACHED (ULL(0))
+#define PVR_BO_FW_FLAGS_DEVICE_UNCACHED DRM_PVR_BO_BYPASS_DEVICE_CACHE
+
+/**
+ * struct pvr_gem_object - powervr-specific wrapper for &struct drm_gem_object
+ */
+struct pvr_gem_object {
+	/**
+	 * @base: The underlying &struct drm_gem_shmem_object.
+	 *
+	 * Do not access this member directly, instead call
+	 * shem_gem_from_pvr_gem().
+	 */
+	struct drm_gem_shmem_object base;
+
+	/**
+	 * @flags: Options set at creation-time. Some of these options apply to
+	 * the creation operation itself (which are stored here for reference)
+	 * with the remainder used for mapping options to both the device and
+	 * CPU. These are used every time this object is mapped, but may be
+	 * changed after creation.
+	 *
+	 * Must be a combination of DRM_PVR_BO_* and/or PVR_BO_* flags.
+	 *
+	 * .. note::
+	 *
+	 *    This member is declared const to indicate that none of these
+	 *    options may change or be changed throughout the object's
+	 *    lifetime.
+	 */
+	u64 flags;
+
+	/**
+	 * @gpuva_lock: Lock for preventing concurrent access during memory
+	 * mapping operations.
+	 */
+	struct mutex gpuva_lock;
+};
+
+static_assert(offsetof(struct pvr_gem_object, base) == 0,
+	      "offsetof(struct pvr_gem_object, base) not zero");
+
+#define shmem_gem_from_pvr_gem(pvr_obj) (&(pvr_obj)->base)
+
+#define shmem_gem_to_pvr_gem(shmem_obj) container_of_const(shmem_obj, struct pvr_gem_object, base)
+
+#define gem_from_pvr_gem(pvr_obj) (&(pvr_obj)->base.base)
+
+#define gem_to_pvr_gem(gem_obj) container_of_const(gem_obj, struct pvr_gem_object, base.base)
+
+/* Functions defined in pvr_gem.c */
+
+struct drm_gem_object *pvr_gem_create_object(struct drm_device *drm_dev, size_t size);
+
+struct pvr_gem_object *pvr_gem_object_create(struct pvr_device *pvr_dev,
+					     size_t size, u64 flags);
+
+int pvr_gem_object_into_handle(struct pvr_gem_object *pvr_obj,
+			       struct pvr_file *pvr_file, u32 *handle);
+struct pvr_gem_object *pvr_gem_object_from_handle(struct pvr_file *pvr_file,
+						  u32 handle);
+
+static __always_inline struct sg_table *
+pvr_gem_object_get_pages_sgt(struct pvr_gem_object *pvr_obj)
+{
+	return drm_gem_shmem_get_pages_sgt(shmem_gem_from_pvr_gem(pvr_obj));
+}
+
+void *pvr_gem_object_vmap(struct pvr_gem_object *pvr_obj);
+void pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj);
+
+int pvr_gem_get_dma_addr(struct pvr_gem_object *pvr_obj, u32 offset,
+			 dma_addr_t *dma_addr_out);
+
+/**
+ * pvr_gem_object_get() - Acquire reference on pvr_gem_object
+ * @pvr_obj: Pointer to object to acquire reference on.
+ */
+static __always_inline void
+pvr_gem_object_get(struct pvr_gem_object *pvr_obj)
+{
+	drm_gem_object_get(gem_from_pvr_gem(pvr_obj));
+}
+
+/**
+ * pvr_gem_object_put() - Release reference on pvr_gem_object
+ * @pvr_obj: Pointer to object to release reference on.
+ */
+static __always_inline void
+pvr_gem_object_put(struct pvr_gem_object *pvr_obj)
+{
+	drm_gem_object_put(gem_from_pvr_gem(pvr_obj));
+}
+
+static __always_inline size_t
+pvr_gem_object_size(struct pvr_gem_object *pvr_obj)
+{
+	return gem_from_pvr_gem(pvr_obj)->size;
+}
+
+#endif /* PVR_GEM_H */
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
new file mode 100644
index 000000000000..7de43b6c203e
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -0,0 +1,2573 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_mmu.h"
+
+#include "pvr_device.h"
+#include "pvr_fw.h"
+#include "pvr_gem.h"
+#include "pvr_rogue_fwif.h"
+#include "pvr_rogue_mmu_defs.h"
+
+#include <drm/drm_drv.h>
+#include <linux/atomic.h>
+#include <linux/bitops.h>
+#include <linux/dma-mapping.h>
+#include <linux/kmemleak.h>
+#include <linux/minmax.h>
+#include <linux/sizes.h>
+
+#define PVR_SHIFT_FROM_SIZE(size_) (__builtin_ctzll(size_))
+#define PVR_MASK_FROM_SIZE(size_) (~((size_) - U64_C(1)))
+
+/*
+ * The value of the device page size (%PVR_DEVICE_PAGE_SIZE) is currently
+ * pegged to the host page size (%PAGE_SIZE). This chunk of macro goodness both
+ * ensures that the selected host page size corresponds to a valid device page
+ * size and sets up values needed by the MMU code below.
+ */
+#if (PVR_DEVICE_PAGE_SIZE == SZ_4K)
+# define ROGUE_MMUCTRL_PAGE_SIZE_X ROGUE_MMUCTRL_PAGE_SIZE_4KB
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT ROGUE_MMUCTRL_PAGE_4KB_RANGE_SHIFT
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK ROGUE_MMUCTRL_PAGE_4KB_RANGE_CLRMSK
+#elif (PVR_DEVICE_PAGE_SIZE == SZ_16K)
+# define ROGUE_MMUCTRL_PAGE_SIZE_X ROGUE_MMUCTRL_PAGE_SIZE_16KB
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT ROGUE_MMUCTRL_PAGE_16KB_RANGE_SHIFT
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK ROGUE_MMUCTRL_PAGE_16KB_RANGE_CLRMSK
+#elif (PVR_DEVICE_PAGE_SIZE == SZ_64K)
+# define ROGUE_MMUCTRL_PAGE_SIZE_X ROGUE_MMUCTRL_PAGE_SIZE_64KB
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT ROGUE_MMUCTRL_PAGE_64KB_RANGE_SHIFT
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK ROGUE_MMUCTRL_PAGE_64KB_RANGE_CLRMSK
+#elif (PVR_DEVICE_PAGE_SIZE == SZ_256K)
+# define ROGUE_MMUCTRL_PAGE_SIZE_X ROGUE_MMUCTRL_PAGE_SIZE_256KB
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT ROGUE_MMUCTRL_PAGE_256KB_RANGE_SHIFT
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK ROGUE_MMUCTRL_PAGE_256KB_RANGE_CLRMSK
+#elif (PVR_DEVICE_PAGE_SIZE == SZ_1M)
+# define ROGUE_MMUCTRL_PAGE_SIZE_X ROGUE_MMUCTRL_PAGE_SIZE_1MB
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT ROGUE_MMUCTRL_PAGE_1MB_RANGE_SHIFT
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK ROGUE_MMUCTRL_PAGE_1MB_RANGE_CLRMSK
+#elif (PVR_DEVICE_PAGE_SIZE == SZ_2M)
+# define ROGUE_MMUCTRL_PAGE_SIZE_X ROGUE_MMUCTRL_PAGE_SIZE_2MB
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT ROGUE_MMUCTRL_PAGE_2MB_RANGE_SHIFT
+# define ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK ROGUE_MMUCTRL_PAGE_2MB_RANGE_CLRMSK
+#else
+# error Unsupported device page size PVR_DEVICE_PAGE_SIZE
+#endif
+
+#define ROGUE_MMUCTRL_ENTRIES_PT_VALUE_X   \
+	(ROGUE_MMUCTRL_ENTRIES_PT_VALUE >> \
+	 (PVR_DEVICE_PAGE_SHIFT - PVR_SHIFT_FROM_SIZE(SZ_4K)))
+
+enum pvr_mmu_sync_level {
+	PVR_MMU_SYNC_LEVEL_NONE = -1,
+	PVR_MMU_SYNC_LEVEL_0 = 0,
+	PVR_MMU_SYNC_LEVEL_1 = 1,
+	PVR_MMU_SYNC_LEVEL_2 = 2,
+};
+
+#define PVR_MMU_SYNC_LEVEL_0_FLAGS (ROGUE_FWIF_MMUCACHEDATA_FLAGS_PT | \
+				    ROGUE_FWIF_MMUCACHEDATA_FLAGS_INTERRUPT | \
+				    ROGUE_FWIF_MMUCACHEDATA_FLAGS_TLB)
+#define PVR_MMU_SYNC_LEVEL_1_FLAGS (PVR_MMU_SYNC_LEVEL_0_FLAGS | ROGUE_FWIF_MMUCACHEDATA_FLAGS_PD)
+#define PVR_MMU_SYNC_LEVEL_2_FLAGS (PVR_MMU_SYNC_LEVEL_1_FLAGS | ROGUE_FWIF_MMUCACHEDATA_FLAGS_PC)
+
+/**
+ * pvr_mmu_set_flush_flags() - Set MMU cache flush flags for next call to
+ *                             pvr_mmu_flush_exec().
+ * @pvr_dev: Target PowerVR device.
+ * @flags: MMU flush flags. Must be one of %PVR_MMU_SYNC_LEVEL_*_FLAGS.
+ *
+ * This function must be called following any possible change to the MMU page
+ * tables.
+ */
+static void pvr_mmu_set_flush_flags(struct pvr_device *pvr_dev, u32 flags)
+{
+	atomic_fetch_or(flags, &pvr_dev->mmu_flush_cache_flags);
+}
+
+/**
+ * pvr_mmu_flush_request_all() - Request flush of all MMU caches when
+ * subsequently calling pvr_mmu_flush_exec().
+ * @pvr_dev: Target PowerVR device.
+ *
+ * This function must be called following any possible change to the MMU page
+ * tables.
+ */
+void pvr_mmu_flush_request_all(struct pvr_device *pvr_dev)
+{
+	/* TODO: implement */
+}
+
+/**
+ * pvr_mmu_flush_exec() - Execute a flush of all MMU caches previously
+ * requested.
+ * @pvr_dev: Target PowerVR device.
+ * @wait: Do not return until the flush is completed.
+ *
+ * This function must be called prior to submitting any new GPU job. The flush
+ * will complete before the jobs are scheduled, so this can be called once after
+ * a series of maps. However, a single unmap should always be immediately
+ * followed by a flush and it should be explicitly waited by setting @wait.
+ *
+ * As a failure to flush the MMU caches could risk memory corruption, if the
+ * flush fails (implying the firmware is not responding) then the GPU device is
+ * marked as lost.
+ *
+ * Returns:
+ *  * 0 on success when @wait is true, or
+ *  * -%EIO if the device is unavailable, or
+ *  * Any error encountered while submitting the flush command via the KCCB.
+ */
+int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, bool wait)
+{
+	/* TODO: implement */
+	return -ENODEV;
+}
+
+/**
+ * DOC: PowerVR Virtual Memory Handling
+ */
+/**
+ * DOC: PowerVR Virtual Memory Handling (constants)
+ *
+ * .. c:macro:: PVR_IDX_INVALID
+ *
+ *    Default value for a u16-based index.
+ *
+ *    This value cannot be zero, since zero is a valid index value.
+ */
+#define PVR_IDX_INVALID ((u16)(-1))
+
+/**
+ * DOC: MMU backing pages
+ */
+/**
+ * DOC: MMU backing pages (constants)
+ *
+ * .. c:macro:: PVR_MMU_BACKING_PAGE_SIZE
+ *
+ *    Page size of a PowerVR device's integrated MMU. The CPU page size must be
+ *    at least as large as this value for the current implementation; this is
+ *    checked at compile-time.
+ */
+#define PVR_MMU_BACKING_PAGE_SIZE SZ_4K
+static_assert(PAGE_SIZE >= PVR_MMU_BACKING_PAGE_SIZE);
+
+/**
+ * struct pvr_mmu_backing_page - Represents a single page used to back a page
+ *                              table of any level.
+ * @dma_addr: DMA address of this page.
+ * @host_ptr: CPU address of this page.
+ * @pvr_dev: The PowerVR device to which this page is associated. **For
+ *           internal use only.**
+ */
+struct pvr_mmu_backing_page {
+	dma_addr_t dma_addr;
+	void *host_ptr;
+/* private: internal use only */
+	struct page *raw_page;
+	struct pvr_device *pvr_dev;
+};
+
+/**
+ * pvr_mmu_backing_page_init() - Initialize a MMU backing page.
+ * @page: Target backing page.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * This function performs three distinct operations:
+ *
+ * 1. Allocate a single page,
+ * 2. Map the page to the CPU, and
+ * 3. Map the page to DMA-space.
+ *
+ * It is expected that @page be zeroed (e.g. from kzalloc()) before calling
+ * this function.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%ENOMEM if allocation of the backing page or mapping of the backing
+ *    page to DMA fails.
+ */
+static int
+pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
+			  struct pvr_device *pvr_dev)
+{
+	struct device *dev = from_pvr_device(pvr_dev)->dev;
+
+	struct page *raw_page;
+	int err;
+
+	dma_addr_t dma_addr;
+	void *host_ptr;
+
+	raw_page = alloc_page(__GFP_ZERO | GFP_KERNEL);
+	if (!raw_page)
+		return -ENOMEM;
+
+	host_ptr = vmap(&raw_page, 1, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	if (!host_ptr) {
+		err = -ENOMEM;
+		goto err_free_page;
+	}
+
+	dma_addr = dma_map_page(dev, raw_page, 0, PVR_MMU_BACKING_PAGE_SIZE,
+				DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, dma_addr)) {
+		err = -ENOMEM;
+		goto err_unmap_page;
+	}
+
+	page->dma_addr = dma_addr;
+	page->host_ptr = host_ptr;
+	page->pvr_dev = pvr_dev;
+	page->raw_page = raw_page;
+	kmemleak_alloc(page->host_ptr, PAGE_SIZE, 1, GFP_KERNEL);
+
+	return 0;
+
+err_unmap_page:
+	vunmap(host_ptr);
+
+err_free_page:
+	__free_page(raw_page);
+
+	return err;
+}
+
+/**
+ * pvr_mmu_backing_page_fini() - Teardown a MMU backing page.
+ * @page: Target backing page.
+ *
+ * This function performs the mirror operations to pvr_mmu_backing_page_init(),
+ * in reverse order:
+ *
+ * 1. Unmap the page from DMA-space,
+ * 2. Unmap the page from the CPU, and
+ * 3. Free the page.
+ *
+ * It also zeros @page.
+ *
+ * It is a no-op to call this function a second (or further) time on any @page.
+ */
+static void
+pvr_mmu_backing_page_fini(struct pvr_mmu_backing_page *page)
+{
+	struct device *dev = from_pvr_device(page->pvr_dev)->dev;
+
+	/* Do nothing if no allocation is present. */
+	if (!page->pvr_dev)
+		return;
+
+	dma_unmap_page(dev, page->dma_addr, PVR_MMU_BACKING_PAGE_SIZE,
+		       DMA_TO_DEVICE);
+
+	kmemleak_free(page->host_ptr);
+	vunmap(page->host_ptr);
+
+	__free_page(page->raw_page);
+
+	memset(page, 0, sizeof(*page));
+}
+
+/**
+ * pvr_mmu_backing_page_sync() - Flush a MMU backing page from the CPU to the
+ *                              device.
+ * @page: Target backing page.
+ *
+ * .. caution::
+ *
+ *    **This is potentially an expensive function call.** Only call
+ *    pvr_mmu_backing_page_sync() once you're sure you have no more changes to
+ *    make to the backing page in the immediate future.
+ */
+static void
+pvr_mmu_backing_page_sync(struct pvr_mmu_backing_page *page, u32 flags)
+{
+	struct pvr_device *pvr_dev = page->pvr_dev;
+	struct device *dev;
+
+	/*
+	 * Do nothing if no allocation is present. This may be the case if
+	 * we are unmapping pages.
+	 */
+	if (!pvr_dev)
+		return;
+
+	dev = from_pvr_device(pvr_dev)->dev;
+
+	dma_sync_single_for_device(dev, page->dma_addr,
+				   PVR_MMU_BACKING_PAGE_SIZE, DMA_TO_DEVICE);
+
+	pvr_mmu_set_flush_flags(pvr_dev, flags);
+}
+
+/**
+ * DOC: Raw page tables
+ */
+
+#define PVR_PAGE_TABLE_TYPEOF_ENTRY(level_) \
+	typeof_member(struct pvr_page_table_l##level_##_entry_raw, val)
+
+#define PVR_PAGE_TABLE_FIELD_GET(level_, name_, field_, entry_)           \
+	(((entry_).val &                                           \
+	  ~ROGUE_MMUCTRL_##name_##_DATA_##field_##_CLRMSK) >> \
+	 ROGUE_MMUCTRL_##name_##_DATA_##field_##_SHIFT)
+
+#define PVR_PAGE_TABLE_FIELD_PREP(level_, name_, field_, val_)            \
+	((((PVR_PAGE_TABLE_TYPEOF_ENTRY(level_))(val_))            \
+	  << ROGUE_MMUCTRL_##name_##_DATA_##field_##_SHIFT) & \
+	 ~ROGUE_MMUCTRL_##name_##_DATA_##field_##_CLRMSK)
+
+/**
+ * struct pvr_page_table_l2_entry_raw - A single entry in a level 2 page table.
+ * @val: The raw value of this entry.
+ *
+ * This type is a structure for type-checking purposes. At compile-time, its
+ * size is checked against %ROGUE_MMUCTRL_ENTRY_SIZE_PC_VALUE.
+ *
+ * The value stored in this structure can be decoded using the following bitmap:
+ *
+ * .. flat-table::
+ *    :widths: 1 5
+ *    :stub-columns: 1
+ *
+ *    * - 31..4
+ *      - **Level 1 Page Table Base Address:** Bits 39..12 of the L1
+ *        page table base address, which is 4KiB aligned.
+ *
+ *    * - 3..2
+ *      - *(reserved)*
+ *
+ *    * - 1
+ *      - **Pending:** When valid bit is not set, indicates that a valid
+ *        entry is pending and the MMU should wait for the driver to map
+ *        the entry. This is used to support page demand mapping of
+ *        memory.
+ *
+ *    * - 0
+ *      - **Valid:** Indicates that the entry contains a valid L1 page
+ *        table. If the valid bit is not set, then an attempted use of
+ *        the page would result in a page fault.
+ */
+struct pvr_page_table_l2_entry_raw {
+	u32 val;
+} __packed;
+static_assert(sizeof(struct pvr_page_table_l2_entry_raw) * 8 ==
+	      ROGUE_MMUCTRL_ENTRY_SIZE_PC_VALUE);
+
+static bool
+pvr_page_table_l2_entry_raw_is_valid(struct pvr_page_table_l2_entry_raw entry)
+{
+	return PVR_PAGE_TABLE_FIELD_GET(2, PC, VALID, entry);
+}
+
+/**
+ * pvr_page_table_l2_entry_raw_set() - Write a valid entry into a raw level 2
+ *                                     page table.
+ * @entry: Target raw level 2 page table entry.
+ * @child_table_dma_addr: DMA address of the level 1 page table to be
+ *                        associated with @entry.
+ *
+ * When calling this function, @child_table_dma_addr must be a valid DMA
+ * address and a multiple of %ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSIZE.
+ */
+static void
+pvr_page_table_l2_entry_raw_set(struct pvr_page_table_l2_entry_raw *entry,
+				dma_addr_t child_table_dma_addr)
+{
+	child_table_dma_addr >>= ROGUE_MMUCTRL_PC_DATA_PD_BASE_ALIGNSHIFT;
+
+	WRITE_ONCE(entry->val,
+		   PVR_PAGE_TABLE_FIELD_PREP(2, PC, VALID, true) |
+		   PVR_PAGE_TABLE_FIELD_PREP(2, PC, ENTRY_PENDING, false) |
+		   PVR_PAGE_TABLE_FIELD_PREP(2, PC, PD_BASE, child_table_dma_addr));
+}
+
+static void
+pvr_page_table_l2_entry_raw_clear(struct pvr_page_table_l2_entry_raw *entry)
+{
+	WRITE_ONCE(entry->val, 0);
+}
+
+/**
+ * struct pvr_page_table_l1_entry_raw - A single entry in a level 1 page table.
+ * @val: The raw value of this entry.
+ *
+ * This type is a structure for type-checking purposes. At compile-time, its
+ * size is checked against %ROGUE_MMUCTRL_ENTRY_SIZE_PD_VALUE.
+ *
+ * The value stored in this structure can be decoded using the following bitmap:
+ *
+ * .. flat-table::
+ *    :widths: 1 5
+ *    :stub-columns: 1
+ *
+ *    * - 63..41
+ *      - *(reserved)*
+ *
+ *    * - 40
+ *      - **Pending:** When valid bit is not set, indicates that a valid entry
+ *        is pending and the MMU should wait for the driver to map the entry.
+ *        This is used to support page demand mapping of memory.
+ *
+ *    * - 39..5
+ *      - **Level 0 Page Table Base Address:** The way this value is
+ *        interpreted depends on the page size. Bits not specified in the
+ *        table below (e.g. bits 11..5 for page size 4KiB) should be
+ *        considered reserved.
+ *
+ *        This table shows the bits used in an L1 page table entry to
+ *        represent the Physical Table Base Address for a given Page Size.
+ *        Since each L1 page table entry covers 2MiB of address space, the
+ *        maximum page size is 2MiB.
+ *
+ *        .. flat-table::
+ *           :widths: 1 1 1 1
+ *           :header-rows: 1
+ *           :stub-columns: 1
+ *
+ *           * - Page size
+ *             - L0 page table base address bits
+ *             - Number of L0 page table entries
+ *             - Size of L0 page table
+ *
+ *           * - 4KiB
+ *             - 39..12
+ *             - 512
+ *             - 4KiB
+ *
+ *           * - 16KiB
+ *             - 39..10
+ *             - 128
+ *             - 1KiB
+ *
+ *           * - 64KiB
+ *             - 39..8
+ *             - 32
+ *             - 256B
+ *
+ *           * - 256KiB
+ *             - 39..6
+ *             - 8
+ *             - 64B
+ *
+ *           * - 1MiB
+ *             - 39..5 (4 = '0')
+ *             - 2
+ *             - 16B
+ *
+ *           * - 2MiB
+ *             - 39..5 (4..3 = '00')
+ *             - 1
+ *             - 8B
+ *
+ *    * - 4
+ *      - *(reserved)*
+ *
+ *    * - 3..1
+ *      - **Page Size:** Sets the page size, from 4KiB to 2MiB.
+ *
+ *    * - 0
+ *      - **Valid:** Indicates that the entry contains a valid L0 page table.
+ *        If the valid bit is not set, then an attempted use of the page would
+ *        result in a page fault.
+ */
+struct pvr_page_table_l1_entry_raw {
+	u64 val;
+} __packed;
+static_assert(sizeof(struct pvr_page_table_l1_entry_raw) * 8 ==
+	      ROGUE_MMUCTRL_ENTRY_SIZE_PD_VALUE);
+
+static bool
+pvr_page_table_l1_entry_raw_is_valid(struct pvr_page_table_l1_entry_raw entry)
+{
+	return PVR_PAGE_TABLE_FIELD_GET(1, PD, VALID, entry);
+}
+
+/**
+ * pvr_page_table_l1_entry_raw_set() - Write a valid entry into a raw level 1
+ *                                     page table.
+ * @entry: Target raw level 1 page table entry.
+ * @child_table_dma_addr: DMA address of the level 0 page table to be
+ *                        associated with @entry.
+ *
+ * When calling this function, @child_table_dma_addr must be a valid DMA
+ * address and a multiple of 4 KiB.
+ */
+static void
+pvr_page_table_l1_entry_raw_set(struct pvr_page_table_l1_entry_raw *entry,
+				dma_addr_t child_table_dma_addr)
+{
+	WRITE_ONCE(entry->val,
+		   PVR_PAGE_TABLE_FIELD_PREP(1, PD, VALID, true) |
+		   PVR_PAGE_TABLE_FIELD_PREP(1, PD, ENTRY_PENDING, false) |
+		   PVR_PAGE_TABLE_FIELD_PREP(1, PD, PAGE_SIZE, ROGUE_MMUCTRL_PAGE_SIZE_X) |
+		   /*
+		    * The use of a 4K-specific macro here is correct. It is
+		    * a future optimization to allocate sub-host-page-sized
+		    * blocks for individual tables, so the condition that any
+		    * page table address is aligned to the size of the
+		    * largest (a 4KB) table currently holds.
+		    */
+		   (child_table_dma_addr & ~ROGUE_MMUCTRL_PT_BASE_4KB_RANGE_CLRMSK));
+}
+
+static void
+pvr_page_table_l1_entry_raw_clear(struct pvr_page_table_l1_entry_raw *entry)
+{
+	WRITE_ONCE(entry->val, 0);
+}
+
+/**
+ * struct pvr_page_table_l0_entry_raw - A single entry in a level 0 page table.
+ * @val: The raw value of this entry.
+ *
+ * This type is a structure for type-checking purposes. At compile-time, its
+ * size is checked against %ROGUE_MMUCTRL_ENTRY_SIZE_PT_VALUE.
+ *
+ * The value stored in this structure can be decoded using the following bitmap:
+ *
+ * .. flat-table::
+ *    :widths: 1 5
+ *    :stub-columns: 1
+ *
+ *    * - 63
+ *      - *(reserved)*
+ *
+ *    * - 62
+ *      - **PM/FW Protect:** Indicates a protected region which only the
+ *        Parameter Manager (PM) or firmware processor can write to.
+ *
+ *    * - 61..40
+ *      - **VP Page (High):** Virtual-physical page used for Parameter Manager
+ *        (PM) memory. This field is only used if the additional level of PB
+ *        virtualization is enabled. The VP Page field is needed by the PM in
+ *        order to correctly reconstitute the free lists after render
+ *        completion. This (High) field holds bits 39..18 of the value; the
+ *        Low field holds bits 17..12. Bits 11..0 are always zero because the
+ *        value is always aligned to the 4KiB page size.
+ *
+ *    * - 39..12
+ *      - **Physical Page Address:** The way this value is interpreted depends
+ *        on the page size. Bits not specified in the table below (e.g. bits
+ *        20..12 for page size 2MiB) should be considered reserved.
+ *
+ *        This table shows the bits used in an L0 page table entry to represent
+ *        the Physical Page Address for a given page size (as defined in the
+ *        associated L1 page table entry).
+ *
+ *        .. flat-table::
+ *           :widths: 1 1
+ *           :header-rows: 1
+ *           :stub-columns: 1
+ *
+ *           * - Page size
+ *             - Physical address bits
+ *
+ *           * - 4KiB
+ *             - 39..12
+ *
+ *           * - 16KiB
+ *             - 39..14
+ *
+ *           * - 64KiB
+ *             - 39..16
+ *
+ *           * - 256KiB
+ *             - 39..18
+ *
+ *           * - 1MiB
+ *             - 39..20
+ *
+ *           * - 2MiB
+ *             - 39..21
+ *
+ *    * - 11..6
+ *      - **VP Page (Low):** Continuation of VP Page (High).
+ *
+ *    * - 5
+ *      - **Pending:** When valid bit is not set, indicates that a valid entry
+ *        is pending and the MMU should wait for the driver to map the entry.
+ *        This is used to support page demand mapping of memory.
+ *
+ *    * - 4
+ *      - **PM Src:** Set on Parameter Manager (PM) allocated page table
+ *        entries when indicated by the PM. Note that this bit will only be set
+ *        by the PM, not by the device driver.
+ *
+ *    * - 3
+ *      - **SLC Bypass Control:** Specifies requests to this page should bypass
+ *        the System Level Cache (SLC), if enabled in SLC configuration.
+ *
+ *    * - 2
+ *      - **Cache Coherency:** Indicates that the page is coherent (i.e. it
+ *        does not require a cache flush between operations on the CPU and the
+ *        device).
+ *
+ *    * - 1
+ *      - **Read Only:** If set, this bit indicates that the page is read only.
+ *        An attempted write to this page would result in a write-protection
+ *        fault.
+ *
+ *    * - 0
+ *      - **Valid:** Indicates that the entry contains a valid page. If the
+ *        valid bit is not set, then an attempted use of the page would result
+ *        in a page fault.
+ */
+struct pvr_page_table_l0_entry_raw {
+	u64 val;
+} __packed;
+static_assert(sizeof(struct pvr_page_table_l0_entry_raw) * 8 ==
+	      ROGUE_MMUCTRL_ENTRY_SIZE_PT_VALUE);
+
+/**
+ * struct pvr_page_flags_raw - The configurable flags from a single entry in a
+ *                             level 0 page table.
+ * @val: The raw value of these flags. Since these are a strict subset of
+ *       &struct pvr_page_table_l0_entry_raw; use that type for our member here.
+ *
+ * The flags stored in this type are: PM/FW Protect; SLC Bypass Control; Cache
+ * Coherency, and Read Only (bits 62, 3, 2 and 1 respectively).
+ *
+ * This type should never be instantiated directly; instead use
+ * pvr_page_flags_raw_create() to ensure only valid bits of @val are set.
+ */
+struct pvr_page_flags_raw {
+	struct pvr_page_table_l0_entry_raw val;
+} __packed;
+static_assert(sizeof(struct pvr_page_flags_raw) ==
+	      sizeof(struct pvr_page_table_l0_entry_raw));
+
+static bool
+pvr_page_table_l0_entry_raw_is_valid(struct pvr_page_table_l0_entry_raw entry)
+{
+	return PVR_PAGE_TABLE_FIELD_GET(0, PT, VALID, entry);
+}
+
+/**
+ * pvr_page_table_l0_entry_raw_set() - Write a valid entry into a raw level 0
+ *                                     page table.
+ * @entry: Target raw level 0 page table entry.
+ * @dma_addr: DMA address of the physical page to be associated with @entry.
+ * @flags: Options to be set on @entry.
+ *
+ * When calling this function, @child_table_dma_addr must be a valid DMA
+ * address and a multiple of %PVR_DEVICE_PAGE_SIZE.
+ *
+ * The @flags parameter is directly assigned into @entry. It is the callers
+ * responsibility to ensure that only bits specified in
+ * &struct pvr_page_flags_raw are set in @flags.
+ */
+static void
+pvr_page_table_l0_entry_raw_set(struct pvr_page_table_l0_entry_raw *entry,
+				dma_addr_t dma_addr,
+				struct pvr_page_flags_raw flags)
+{
+	WRITE_ONCE(entry->val, PVR_PAGE_TABLE_FIELD_PREP(0, PT, VALID, true) |
+			       PVR_PAGE_TABLE_FIELD_PREP(0, PT, ENTRY_PENDING, false) |
+			       (dma_addr & ~ROGUE_MMUCTRL_PAGE_X_RANGE_CLRMSK) |
+			       flags.val.val);
+}
+
+static void
+pvr_page_table_l0_entry_raw_clear(struct pvr_page_table_l0_entry_raw *entry)
+{
+	WRITE_ONCE(entry->val, 0);
+}
+
+/**
+ * pvr_page_flags_raw_create() - Initialize the flag bits of a raw level 0 page
+ *                               table entry.
+ * @read_only: This page is read-only (see: Read Only).
+ * @cache_coherent: This page does not require cache flushes (see: Cache
+ *                  Coherency).
+ * @slc_bypass: This page bypasses the device cache (see: SLC Bypass Control).
+ * @pm_fw_protect: This page is only for use by the firmware or Parameter
+ *                 Manager (see PM/FW Protect).
+ *
+ * For more details on the use of these four options, see their respective
+ * entries in the table under &struct pvr_page_table_l0_entry_raw.
+ *
+ * Return:
+ * A new &struct pvr_page_flags_raw instance which can be passed directly to
+ * pvr_page_table_l0_entry_raw_set() or pvr_page_table_l0_insert().
+ */
+static struct pvr_page_flags_raw
+pvr_page_flags_raw_create(bool read_only, bool cache_coherent, bool slc_bypass,
+			  bool pm_fw_protect)
+{
+	struct pvr_page_flags_raw flags;
+
+	flags.val.val =
+		PVR_PAGE_TABLE_FIELD_PREP(0, PT, READ_ONLY, read_only) |
+		PVR_PAGE_TABLE_FIELD_PREP(0, PT, CC, cache_coherent) |
+		PVR_PAGE_TABLE_FIELD_PREP(0, PT, SLC_BYPASS_CTRL, slc_bypass) |
+		PVR_PAGE_TABLE_FIELD_PREP(0, PT, PM_META_PROTECT, pm_fw_protect);
+
+	return flags;
+}
+
+/**
+ * struct pvr_page_table_l2_raw - The raw data of a level 2 page table.
+ *
+ * This type is a structure for type-checking purposes. At compile-time, its
+ * size is checked against %PVR_MMU_BACKING_PAGE_SIZE.
+ */
+struct pvr_page_table_l2_raw {
+	/** @entries: The raw values of this table. */
+	struct pvr_page_table_l2_entry_raw
+		entries[ROGUE_MMUCTRL_ENTRIES_PC_VALUE];
+} __packed;
+static_assert(sizeof(struct pvr_page_table_l2_raw) == PVR_MMU_BACKING_PAGE_SIZE);
+
+/**
+ * struct pvr_page_table_l1_raw - The raw data of a level 1 page table.
+ *
+ * This type is a structure for type-checking purposes. At compile-time, its
+ * size is checked against %PVR_MMU_BACKING_PAGE_SIZE.
+ */
+struct pvr_page_table_l1_raw {
+	/** @entries: The raw values of this table. */
+	struct pvr_page_table_l1_entry_raw
+		entries[ROGUE_MMUCTRL_ENTRIES_PD_VALUE];
+} __packed;
+static_assert(sizeof(struct pvr_page_table_l1_raw) == PVR_MMU_BACKING_PAGE_SIZE);
+
+/**
+ * struct pvr_page_table_l0_raw - The raw data of a level 0 page table.
+ *
+ * This type is a structure for type-checking purposes. At compile-time, its
+ * size is checked against %PVR_MMU_BACKING_PAGE_SIZE.
+ *
+ * .. caution::
+ *
+ *    The size of level 0 page tables is variable depending on the page size
+ *    specified in the associated level 1 page table entry. Since the device
+ *    page size in use is pegged to the host page size, it cannot vary at
+ *    runtime. This structure is therefore only defined to contain the required
+ *    number of entries for the current device page size. **You should never
+ *    read or write beyond the last supported entry.**
+ */
+struct pvr_page_table_l0_raw {
+	/** @entries: The raw values of this table. */
+	struct pvr_page_table_l0_entry_raw
+		entries[ROGUE_MMUCTRL_ENTRIES_PT_VALUE_X];
+} __packed;
+static_assert(sizeof(struct pvr_page_table_l0_raw) <= PVR_MMU_BACKING_PAGE_SIZE);
+
+/**
+ * DOC: Mirror page tables
+ */
+
+/*
+ * We pre-declare these types because they cross-depend on pointers to each
+ * other.
+ */
+struct pvr_page_table_l1;
+struct pvr_page_table_l0;
+
+/**
+ * struct pvr_page_table_l2 - A wrapped level 2 page table.
+ *
+ * To access the raw part of this table, use pvr_page_table_l2_get_raw().
+ * Alternatively to access a raw entry directly, use
+ * pvr_page_table_l2_get_entry_raw().
+ *
+ * A level 2 page table forms the root of the page table tree structure, so
+ * this type has no &parent or &parent_idx members.
+ */
+struct pvr_page_table_l2 {
+	/**
+	 * @entries: The children of this node in the page table tree
+	 * structure. These are also mirror tables. The indexing of this array
+	 * is identical to that of the raw equivalent
+	 * (&pvr_page_table_l1_raw.entries).
+	 */
+	struct pvr_page_table_l1 *entries[ROGUE_MMUCTRL_ENTRIES_PC_VALUE];
+
+	/**
+	 * @backing_page: A handle to the memory which holds the raw
+	 * equivalent of this table. **For internal use only.**
+	 */
+	struct pvr_mmu_backing_page backing_page;
+
+	/**
+	 * @entry_count: The current number of valid entries (that we know of)
+	 * in this table. This value is essentially a refcount - the table is
+	 * destroyed when this value is decremented to zero by
+	 * pvr_page_table_l2_remove().
+	 */
+	u16 entry_count;
+};
+
+/**
+ * pvr_page_table_l2_init() - Initialize a level 2 page table.
+ * @table: Target level 2 page table.
+ * @pvr_dev: Target PowerVR device
+ *
+ * It is expected that @table be zeroed (e.g. from kzalloc()) before calling
+ * this function.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error encountered while intializing &table->backing_page using
+ *    pvr_mmu_backing_page_init().
+ */
+static int
+pvr_page_table_l2_init(struct pvr_page_table_l2 *table,
+		       struct pvr_device *pvr_dev)
+{
+	return pvr_mmu_backing_page_init(&table->backing_page, pvr_dev);
+}
+
+/**
+ * pvr_page_table_l2_fini() - Teardown a level 2 page table.
+ * @table: Target level 2 page table.
+ *
+ * It is an error to attempt to use @table after calling this function.
+ */
+static void
+pvr_page_table_l2_fini(struct pvr_page_table_l2 *table)
+{
+	pvr_mmu_backing_page_fini(&table->backing_page);
+}
+
+/**
+ * pvr_page_table_l2_sync() - Flush a level 2 page table from the CPU to the
+ *                            device.
+ * @table: Target level 2 page table.
+ *
+ * This is just a thin wrapper around pvr_mmu_backing_page_sync(), so the
+ * warning there applies here too: **Only call pvr_page_table_l2_sync() once
+ * you're sure you have no more changes to make to** @table **in the immediate
+ * future.**
+ *
+ * If child level 1 page tables of @table also need to be flushed, this should
+ * be done first using pvr_page_table_l1_sync() *before* calling this function.
+ */
+static void
+pvr_page_table_l2_sync(struct pvr_page_table_l2 *table)
+{
+	pvr_mmu_backing_page_sync(&table->backing_page, PVR_MMU_SYNC_LEVEL_2_FLAGS);
+}
+
+/**
+ * pvr_page_table_l2_get_raw() - Access the raw equivalent of a mirror level 2
+ *                               page table.
+ * @table: Target level 2 page table.
+ *
+ * Essentially returns the CPU address of the raw equivalent of @table, cast to
+ * a &struct pvr_page_table_l2_raw pointer.
+ *
+ * You probably want to call pvr_page_table_l2_get_entry_raw() instead.
+ *
+ * Return:
+ * The raw equivalent of @table.
+ */
+static struct pvr_page_table_l2_raw *
+pvr_page_table_l2_get_raw(struct pvr_page_table_l2 *table)
+{
+	return table->backing_page.host_ptr;
+}
+
+/**
+ * pvr_page_table_l2_get_entry_raw() - Access an entry from the raw equivalent
+ *                                     of a mirror level 2 page table.
+ * @table: Target level 2 page table.
+ * @idx: Index of the entry to access.
+ *
+ * Technically this function returns a pointer to a slot in a raw level 2 page
+ * table, since the returned "entry" is not guaranteed to be valid. The caller
+ * must verify the validity of the entry at the returned address (perhaps using
+ * pvr_page_table_l2_entry_raw_is_valid()) before reading or overwriting it.
+ *
+ * The value of @idx is not checked here; it is the callers responsibility to
+ * ensure @idx refers to a valid index within @table before dereferencing the
+ * returned pointer.
+ *
+ * Return:
+ * A pointer to the requested raw level 2 page table entry.
+ */
+static struct pvr_page_table_l2_entry_raw *
+pvr_page_table_l2_get_entry_raw(struct pvr_page_table_l2 *table, u16 idx)
+{
+	return &pvr_page_table_l2_get_raw(table)->entries[idx];
+}
+
+/**
+ * pvr_page_table_l2_entry_is_valid() - Check if a level 2 page table entry is
+ *                                      marked as valid.
+ * @table: Target level 2 page table.
+ * @idx: Index of the entry to check.
+ *
+ * The value of @idx is not checked here; it is the callers responsibility to
+ * ensure @idx refers to a valid index within @table before calling this
+ * function.
+ */
+static bool
+pvr_page_table_l2_entry_is_valid(struct pvr_page_table_l2 *table, u16 idx)
+{
+	struct pvr_page_table_l2_entry_raw entry_raw =
+		*pvr_page_table_l2_get_entry_raw(table, idx);
+
+	return pvr_page_table_l2_entry_raw_is_valid(entry_raw);
+}
+
+/**
+ * struct pvr_page_table_l1 - A wrapped level 1 page table.
+ *
+ * To access the raw part of this table, use pvr_page_table_l1_get_raw().
+ * Alternatively to access a raw entry directly, use
+ * pvr_page_table_l1_get_entry_raw().
+ */
+struct pvr_page_table_l1 {
+	/**
+	 * @entries: The children of this node in the page table tree
+	 * structure. These are also mirror tables. The indexing of this array
+	 * is identical to that of the raw equivalent
+	 * (&pvr_page_table_l0_raw.entries).
+	 */
+	struct pvr_page_table_l0 *entries[ROGUE_MMUCTRL_ENTRIES_PD_VALUE];
+
+	/**
+	 * @backing_page: A handle to the memory which holds the raw
+	 * equivalent of this table. **For internal use only.**
+	 */
+	struct pvr_mmu_backing_page backing_page;
+
+	union {
+		/**
+		 * @parent: The parent of this node in the page table tree structure.
+		 *
+		 * This is also a mirror table.
+		 *
+		 * Only valid when the L1 page table is active. When the L1 page table
+		 * has been removed and queued for destruction, the next_free field
+		 * should be used instead.
+		 */
+		struct pvr_page_table_l2 *parent;
+
+		/**
+		 * @next_free: Pointer to the next L1 page table to take/free.
+		 *
+		 * Used to form a linked list of L1 page tables. This is used
+		 * when preallocating tables and when the page table has been
+		 * removed and queued for destruction.
+		 */
+		struct pvr_page_table_l1 *next_free;
+	};
+
+	/**
+	 * @parent_idx: The index of the entry in the parent table (see
+	 * @parent) which corresponds to this table.
+	 */
+	u16 parent_idx;
+
+	/**
+	 * @entry_count: The current number of valid entries (that we know of)
+	 * in this table. This value is essentially a refcount - the table is
+	 * destroyed when this value is decremented to zero by
+	 * pvr_page_table_l1_remove().
+	 */
+	u16 entry_count;
+};
+
+/**
+ * pvr_page_table_l1_init() - Initialize a level 1 page table.
+ * @table: Target level 1 page table.
+ * @pvr_dev: Target PowerVR device
+ *
+ * When this function returns successfully, @table is still not considered
+ * valid. It must be inserted into the page table tree structure with
+ * pvr_page_table_l2_insert() before it is ready for use.
+ *
+ * It is expected that @table be zeroed (e.g. from kzalloc()) before calling
+ * this function.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error encountered while intializing &table->backing_page using
+ *    pvr_mmu_backing_page_init().
+ */
+static int
+pvr_page_table_l1_init(struct pvr_page_table_l1 *table,
+		       struct pvr_device *pvr_dev)
+{
+	table->parent_idx = PVR_IDX_INVALID;
+
+	return pvr_mmu_backing_page_init(&table->backing_page, pvr_dev);
+}
+
+/**
+ * pvr_page_table_l1_free() - Teardown a level 1 page table.
+ * @table: Target level 1 page table.
+ *
+ * It is an error to attempt to use @table after calling this function, even
+ * indirectly. This includes calling pvr_page_table_l2_remove(), which must
+ * be called *before* pvr_page_table_l1_free().
+ */
+static void
+pvr_page_table_l1_free(struct pvr_page_table_l1 *table)
+{
+	pvr_mmu_backing_page_fini(&table->backing_page);
+	kfree(table);
+}
+
+/**
+ * pvr_page_table_l1_sync() - Flush a level 1 page table from the CPU to the
+ *                            device.
+ * @table: Target level 1 page table.
+ *
+ * This is just a thin wrapper around pvr_mmu_backing_page_sync(), so the
+ * warning there applies here too: **Only call pvr_page_table_l1_sync() once
+ * you're sure you have no more changes to make to** @table **in the immediate
+ * future.**
+ *
+ * If child level 0 page tables of @table also need to be flushed, this should
+ * be done first using pvr_page_table_l0_sync() *before* calling this function.
+ */
+static void
+pvr_page_table_l1_sync(struct pvr_page_table_l1 *table)
+{
+	pvr_mmu_backing_page_sync(&table->backing_page, PVR_MMU_SYNC_LEVEL_1_FLAGS);
+}
+
+/**
+ * pvr_page_table_l1_get_raw() - Access the raw equivalent of a mirror level 1
+ *                               page table.
+ * @table: Target level 1 page table.
+ *
+ * Essentially returns the CPU address of the raw equivalent of @table, cast to
+ * a &struct pvr_page_table_l1_raw pointer.
+ *
+ * You probably want to call pvr_page_table_l1_get_entry_raw() instead.
+ *
+ * Return:
+ * The raw equivalent of @table.
+ */
+static struct pvr_page_table_l1_raw *
+pvr_page_table_l1_get_raw(struct pvr_page_table_l1 *table)
+{
+	return table->backing_page.host_ptr;
+}
+
+/**
+ * pvr_page_table_l1_get_entry_raw() - Access an entry from the raw equivalent
+ *                                     of a mirror level 1 page table.
+ * @table: Target level 1 page table.
+ * @idx: Index of the entry to access.
+ *
+ * Technically this function returns a pointer to a slot in a raw level 1 page
+ * table, since the returned "entry" is not guaranteed to be valid. The caller
+ * must verify the validity of the entry at the returned address (perhaps using
+ * pvr_page_table_l1_entry_raw_is_valid()) before reading or overwriting it.
+ *
+ * The value of @idx is not checked here; it is the callers responsibility to
+ * ensure @idx refers to a valid index within @table before dereferencing the
+ * returned pointer.
+ *
+ * Return:
+ * A pointer to the requested raw level 1 page table entry.
+ */
+static struct pvr_page_table_l1_entry_raw *
+pvr_page_table_l1_get_entry_raw(struct pvr_page_table_l1 *table, u16 idx)
+{
+	return &pvr_page_table_l1_get_raw(table)->entries[idx];
+}
+
+/**
+ * pvr_page_table_l1_entry_is_valid() - Check if a level 1 page table entry is
+ *                                      marked as valid.
+ * @table: Target level 1 page table.
+ * @idx: Index of the entry to check.
+ *
+ * The value of @idx is not checked here; it is the callers responsibility to
+ * ensure @idx refers to a valid index within @table before calling this
+ * function.
+ */
+static bool
+pvr_page_table_l1_entry_is_valid(struct pvr_page_table_l1 *table, u16 idx)
+{
+	struct pvr_page_table_l1_entry_raw entry_raw =
+		*pvr_page_table_l1_get_entry_raw(table, idx);
+
+	return pvr_page_table_l1_entry_raw_is_valid(entry_raw);
+}
+
+/**
+ * struct pvr_page_table_l0 - A wrapped level 0 page table.
+ *
+ * To access the raw part of this table, use pvr_page_table_l0_get_raw().
+ * Alternatively to access a raw entry directly, use
+ * pvr_page_table_l0_get_entry_raw().
+ *
+ * There is no mirror representation of an individual page, so this type has no
+ * &entries member.
+ */
+struct pvr_page_table_l0 {
+	/**
+	 * @backing_page: A handle to the memory which holds the raw
+	 * equivalent of this table. **For internal use only.**
+	 */
+	struct pvr_mmu_backing_page backing_page;
+
+	union {
+		/**
+		 * @parent: The parent of this node in the page table tree structure.
+		 *
+		 * This is also a mirror table.
+		 *
+		 * Only valid when the L0 page table is active. When the L0 page table
+		 * has been removed and queued for destruction, the next_free field
+		 * should be used instead.
+		 */
+		struct pvr_page_table_l1 *parent;
+
+		/**
+		 * @next_free: Pointer to the next L0 page table to take/free.
+		 *
+		 * Used to form a linked list of L0 page tables. This is used
+		 * when preallocating tables and when the page table has been
+		 * removed and queued for destruction.
+		 */
+		struct pvr_page_table_l0 *next_free;
+	};
+
+	/**
+	 * @parent_idx: The index of the entry in the parent table (see
+	 * @parent) which corresponds to this table.
+	 */
+	u16 parent_idx;
+
+	/**
+	 * @entry_count: The current number of valid entries (that we know of)
+	 * in this table. This value is essentially a refcount - the table is
+	 * destroyed when this value is decremented to zero by
+	 * pvr_page_table_l0_remove().
+	 */
+	u16 entry_count;
+};
+
+/**
+ * pvr_page_table_l0_init() - Initialize a level 0 page table.
+ * @table: Target level 0 page table.
+ * @pvr_dev: Target PowerVR device
+ *
+ * When this function returns successfully, @table is still not considered
+ * valid. It must be inserted into the page table tree structure with
+ * pvr_page_table_l1_insert() before it is ready for use.
+ *
+ * It is expected that @table be zeroed (e.g. from kzalloc()) before calling
+ * this function.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error encountered while intializing &table->backing_page using
+ *    pvr_mmu_backing_page_init().
+ */
+static int
+pvr_page_table_l0_init(struct pvr_page_table_l0 *table,
+		       struct pvr_device *pvr_dev)
+{
+	table->parent_idx = PVR_IDX_INVALID;
+
+	return pvr_mmu_backing_page_init(&table->backing_page, pvr_dev);
+}
+
+/**
+ * pvr_page_table_l0_free() - Teardown a level 0 page table.
+ * @table: Target level 0 page table.
+ *
+ * It is an error to attempt to use @table after calling this function, even
+ * indirectly. This includes calling pvr_page_table_l1_remove(), which must
+ * be called *before* pvr_page_table_l0_free().
+ */
+static void
+pvr_page_table_l0_free(struct pvr_page_table_l0 *table)
+{
+	pvr_mmu_backing_page_fini(&table->backing_page);
+	kfree(table);
+}
+
+/**
+ * pvr_page_table_l0_sync() - Flush a level 0 page table from the CPU to the
+ *                            device.
+ * @table: Target level 0 page table.
+ *
+ * This is just a thin wrapper around pvr_mmu_backing_page_sync(), so the
+ * warning there applies here too: **Only call pvr_page_table_l0_sync() once
+ * you're sure you have no more changes to make to** @table **in the immediate
+ * future.**
+ *
+ * If child pages of @table also need to be flushed, this should be done first
+ * using a DMA sync function (e.g. dma_sync_sg_for_device()) *before* calling
+ * this function.
+ */
+static void
+pvr_page_table_l0_sync(struct pvr_page_table_l0 *table)
+{
+	pvr_mmu_backing_page_sync(&table->backing_page, PVR_MMU_SYNC_LEVEL_0_FLAGS);
+}
+
+/**
+ * pvr_page_table_l0_get_raw() - Access the raw equivalent of a mirror level 0
+ *                               page table.
+ * @table: Target level 0 page table.
+ *
+ * Essentially returns the CPU address of the raw equivalent of @table, cast to
+ * a &struct pvr_page_table_l0_raw pointer.
+ *
+ * You probably want to call pvr_page_table_l0_get_entry_raw() instead.
+ *
+ * Return:
+ * The raw equivalent of @table.
+ */
+static struct pvr_page_table_l0_raw *
+pvr_page_table_l0_get_raw(struct pvr_page_table_l0 *table)
+{
+	return table->backing_page.host_ptr;
+}
+
+/**
+ * pvr_page_table_l0_get_entry_raw() - Access an entry from the raw equivalent
+ *                                     of a mirror level 0 page table.
+ * @table: Target level 0 page table.
+ * @idx: Index of the entry to access.
+ *
+ * Technically this function returns a pointer to a slot in a raw level 0 page
+ * table, since the returned "entry" is not guaranteed to be valid. The caller
+ * must verify the validity of the entry at the returned address (perhaps using
+ * pvr_page_table_l0_entry_raw_is_valid()) before reading or overwriting it.
+ *
+ * The value of @idx is not checked here; it is the callers responsibility to
+ * ensure @idx refers to a valid index within @table before dereferencing the
+ * returned pointer. This is espcially important for level 0 page tables, which
+ * can have a variable number of entries.
+ *
+ * Return:
+ * A pointer to the requested raw level 0 page table entry.
+ */
+static struct pvr_page_table_l0_entry_raw *
+pvr_page_table_l0_get_entry_raw(struct pvr_page_table_l0 *table, u16 idx)
+{
+	return &pvr_page_table_l0_get_raw(table)->entries[idx];
+}
+
+/**
+ * pvr_page_table_l0_entry_is_valid() - Check if a level 0 page table entry is
+ *                                      marked as valid.
+ * @table: Target level 0 page table.
+ * @idx: Index of the entry to check.
+ *
+ * The value of @idx is not checked here; it is the callers responsibility to
+ * ensure @idx refers to a valid index within @table before calling this
+ * function.
+ */
+static bool
+pvr_page_table_l0_entry_is_valid(struct pvr_page_table_l0 *table, u16 idx)
+{
+	struct pvr_page_table_l0_entry_raw entry_raw =
+		*pvr_page_table_l0_get_entry_raw(table, idx);
+
+	return pvr_page_table_l0_entry_raw_is_valid(entry_raw);
+}
+
+/**
+ * struct pvr_mmu_context - context holding data for operations at page
+ * catalogue level, intended for use with a VM context.
+ */
+struct pvr_mmu_context {
+	/** @pvr_dev: The PVR device associated with the owning VM context. */
+	struct pvr_device *pvr_dev;
+
+	/** @page_table_l2: The MMU table root. */
+	struct pvr_page_table_l2 page_table_l2;
+};
+
+/**
+ * struct pvr_page_table_ptr - A reference to a single physical page as indexed
+ * by the page table structure.
+ *
+ * Intended for embedding in a &struct pvr_mmu_op_context.
+ */
+struct pvr_page_table_ptr {
+	/**
+	 * @l1_table: A cached handle to the level 1 page table the
+	 * context is currently traversing.
+	 */
+	struct pvr_page_table_l1 *l1_table;
+
+	/**
+	 * @l0_table: A cached handle to the level 0 page table the
+	 * context is currently traversing.
+	 */
+	struct pvr_page_table_l0 *l0_table;
+
+	/**
+	 * @l2_idx: Index into the level 2 page table the context is
+	 * currently referencing.
+	 */
+	u16 l2_idx;
+
+	/**
+	 * @l1_idx: Index into the level 1 page table the context is
+	 * currently referencing.
+	 */
+	u16 l1_idx;
+
+	/**
+	 * @l0_idx: Index into the level 0 page table the context is
+	 * currently referencing.
+	 */
+	u16 l0_idx;
+};
+
+/**
+ * struct pvr_mmu_op_context - context holding data for individual
+ * device-virtual mapping operations. Intended for use with a VM bind operation.
+ */
+struct pvr_mmu_op_context {
+	/** @mmu_ctx: The MMU context associated with the owning VM context. */
+	struct pvr_mmu_context *mmu_ctx;
+
+	/** @map: Data specifically for map operations. */
+	struct {
+		/**
+		 * @sgt: Scatter gather table containing pages pinned for use by
+		 * this context - these are currently pinned when initialising
+		 * the VM bind operation.
+		 */
+		struct sg_table *sgt;
+
+		/** @sgt_offset: Start address of the device-virtual mapping. */
+		u64 sgt_offset;
+
+		/**
+		 * @l1_prealloc_tables: Preallocated l1 page table objects
+		 * use by this context when creating a page mapping. Linked list
+		 * fully created during initialisation.
+		 */
+		struct pvr_page_table_l1 *l1_prealloc_tables;
+
+		/**
+		 * @l0_prealloc_tables: Preallocated l0 page table objects
+		 * use by this context when creating a page mapping. Linked list
+		 * fully created during initialisation.
+		 */
+		struct pvr_page_table_l0 *l0_prealloc_tables;
+	} map;
+
+	/** @unmap: Data specifically for unmap operations. */
+	struct {
+		/**
+		 * @l1_free_tables: Collects page table objects freed by unmap
+		 * ops. Linked list empty at creation.
+		 */
+		struct pvr_page_table_l1 *l1_free_tables;
+
+		/**
+		 * @l0_free_tables: Collects page table objects freed by unmap
+		 * ops. Linked list empty at creation.
+		 */
+		struct pvr_page_table_l0 *l0_free_tables;
+	} unmap;
+
+	/**
+	 * @curr_page: A reference to a single physical page as indexed by the
+	 * page table structure.
+	 */
+	struct pvr_page_table_ptr curr_page;
+
+	/**
+	 * @sync_level_required: The maximum level of the page table tree
+	 * structure which has (possibly) been modified since it was last
+	 * flushed to the device.
+	 *
+	 * This field should only be set with pvr_mmu_op_context_require_sync()
+	 * or indirectly by pvr_mmu_op_context_sync_partial().
+	 */
+	enum pvr_mmu_sync_level sync_level_required;
+};
+
+/**
+ * pvr_page_table_l2_insert() - Insert an entry referring to a level 1 page
+ * table into a level 2 page table.
+ * @op_ctx: Target MMU op context pointing at the entry to insert the L1 page
+ * table into.
+ * @child_table: Target level 1 page table to be referenced by the new entry.
+ *
+ * It is the caller's responsibility to ensure @op_ctx.curr_page points to a
+ * valid L2 entry.
+ *
+ * It is the caller's responsibility to execute any memory barries to ensure
+ * that the creation of @child_table is ordered before the L2 entry is inserted.
+ */
+static void
+pvr_page_table_l2_insert(struct pvr_mmu_op_context *op_ctx,
+			 struct pvr_page_table_l1 *child_table)
+{
+	struct pvr_page_table_l2 *l2_table =
+		&op_ctx->mmu_ctx->page_table_l2;
+	struct pvr_page_table_l2_entry_raw *entry_raw =
+		pvr_page_table_l2_get_entry_raw(l2_table,
+						op_ctx->curr_page.l2_idx);
+
+	pvr_page_table_l2_entry_raw_set(entry_raw,
+					child_table->backing_page.dma_addr);
+
+	child_table->parent = l2_table;
+	child_table->parent_idx = op_ctx->curr_page.l2_idx;
+	l2_table->entries[op_ctx->curr_page.l2_idx] = child_table;
+	++l2_table->entry_count;
+	op_ctx->curr_page.l1_table = child_table;
+}
+
+/**
+ * pvr_page_table_l2_remove() - Remove a level 1 page table from a level 2 page
+ * table.
+ * @op_ctx: Target MMU op context pointing at the L2 entry to remove.
+ *
+ * It is the caller's responsibility to ensure @op_ctx.curr_page points to a
+ * valid L2 entry.
+ */
+static void
+pvr_page_table_l2_remove(struct pvr_mmu_op_context *op_ctx)
+{
+	struct pvr_page_table_l2 *l2_table =
+		&op_ctx->mmu_ctx->page_table_l2;
+	struct pvr_page_table_l2_entry_raw *entry_raw =
+		pvr_page_table_l2_get_entry_raw(l2_table,
+						op_ctx->curr_page.l1_table->parent_idx);
+
+	WARN_ON(op_ctx->curr_page.l1_table->parent != l2_table);
+
+	pvr_page_table_l2_entry_raw_clear(entry_raw);
+
+	l2_table->entries[op_ctx->curr_page.l1_table->parent_idx] = NULL;
+	op_ctx->curr_page.l1_table->parent_idx = PVR_IDX_INVALID;
+	op_ctx->curr_page.l1_table->next_free = op_ctx->unmap.l1_free_tables;
+	op_ctx->unmap.l1_free_tables = op_ctx->curr_page.l1_table;
+	op_ctx->curr_page.l1_table = NULL;
+
+	--l2_table->entry_count;
+}
+
+/**
+ * pvr_page_table_l1_insert() - Insert an entry referring to a level 0 page
+ * table into a level 1 page table.
+ * @op_ctx: Target MMU op context pointing at the entry to insert the L0 page
+ * table into.
+ * @child_table: L0 page table to insert.
+ *
+ * It is the caller's responsibility to ensure @op_ctx.curr_page points to a
+ * valid L1 entry.
+ *
+ * It is the caller's responsibility to execute any memory barries to ensure
+ * that the creation of @child_table is ordered before the L1 entry is inserted.
+ */
+static void
+pvr_page_table_l1_insert(struct pvr_mmu_op_context *op_ctx,
+			 struct pvr_page_table_l0 *child_table)
+{
+	struct pvr_page_table_l1_entry_raw *entry_raw =
+		pvr_page_table_l1_get_entry_raw(op_ctx->curr_page.l1_table,
+						op_ctx->curr_page.l1_idx);
+
+	pvr_page_table_l1_entry_raw_set(entry_raw,
+					child_table->backing_page.dma_addr);
+
+	child_table->parent = op_ctx->curr_page.l1_table;
+	child_table->parent_idx = op_ctx->curr_page.l1_idx;
+	op_ctx->curr_page.l1_table->entries[op_ctx->curr_page.l1_idx] = child_table;
+	++op_ctx->curr_page.l1_table->entry_count;
+	op_ctx->curr_page.l0_table = child_table;
+}
+
+/**
+ * pvr_page_table_l1_remove() - Remove a level 0 page table from a level 1 page
+ *                              table.
+ * @op_ctx: Target MMU op context pointing at the L1 entry to remove.
+ *
+ * If this function results in the L1 table becoming empty, it will be removed
+ * from its parent level 2 page table and destroyed.
+ *
+ * It is the caller's responsibility to ensure @op_ctx.curr_page points to a
+ * valid L1 entry.
+ */
+static void
+pvr_page_table_l1_remove(struct pvr_mmu_op_context *op_ctx)
+{
+	struct pvr_page_table_l1_entry_raw *entry_raw =
+		pvr_page_table_l1_get_entry_raw(op_ctx->curr_page.l0_table->parent,
+						op_ctx->curr_page.l0_table->parent_idx);
+
+	WARN_ON(op_ctx->curr_page.l0_table->parent !=
+		op_ctx->curr_page.l1_table);
+
+	pvr_page_table_l1_entry_raw_clear(entry_raw);
+
+	op_ctx->curr_page.l1_table->entries[op_ctx->curr_page.l0_table->parent_idx] = NULL;
+	op_ctx->curr_page.l0_table->parent_idx = PVR_IDX_INVALID;
+	op_ctx->curr_page.l0_table->next_free = op_ctx->unmap.l0_free_tables;
+	op_ctx->unmap.l0_free_tables = op_ctx->curr_page.l0_table;
+	op_ctx->curr_page.l0_table = NULL;
+
+	if (--op_ctx->curr_page.l1_table->entry_count == 0) {
+		/* Clear the parent L2 page table entry. */
+		if (op_ctx->curr_page.l1_table->parent_idx != PVR_IDX_INVALID)
+			pvr_page_table_l2_remove(op_ctx);
+	}
+}
+
+/**
+ * pvr_page_table_l0_insert() - Insert an entry referring to a physical page
+ * into a level 0 page table.
+ * @op_ctx: Target MMU op context pointing at the L0 entry to insert.
+ * @dma_addr: Target DMA address to be referenced by the new entry.
+ * @flags: Page options to be stored in the new entry.
+ *
+ * It is the caller's responsibility to ensure @op_ctx.curr_page points to a
+ * valid L0 entry.
+ */
+static void
+pvr_page_table_l0_insert(struct pvr_mmu_op_context *op_ctx,
+			 dma_addr_t dma_addr, struct pvr_page_flags_raw flags)
+{
+	struct pvr_page_table_l0_entry_raw *entry_raw =
+		pvr_page_table_l0_get_entry_raw(op_ctx->curr_page.l0_table,
+						op_ctx->curr_page.l0_idx);
+
+	pvr_page_table_l0_entry_raw_set(entry_raw, dma_addr, flags);
+
+	/*
+	 * There is no entry to set here - we don't keep a mirror of
+	 * individual pages.
+	 */
+
+	++op_ctx->curr_page.l0_table->entry_count;
+}
+
+/**
+ * pvr_page_table_l0_remove() - Remove a physical page from a level 0 page
+ * table.
+ * @op_ctx: Target MMU op context pointing at the L0 entry to remove.
+ *
+ * If this function results in the L0 table becoming empty, it will be removed
+ * from its parent L1 page table and destroyed.
+ *
+ * It is the caller's responsibility to ensure @op_ctx.curr_page points to a
+ * valid L0 entry.
+ */
+static void
+pvr_page_table_l0_remove(struct pvr_mmu_op_context *op_ctx)
+{
+	struct pvr_page_table_l0_entry_raw *entry_raw =
+		pvr_page_table_l0_get_entry_raw(op_ctx->curr_page.l0_table,
+						op_ctx->curr_page.l0_idx);
+
+	pvr_page_table_l0_entry_raw_clear(entry_raw);
+
+	/*
+	 * There is no entry to clear here - we don't keep a mirror of
+	 * individual pages.
+	 */
+
+	if (--op_ctx->curr_page.l0_table->entry_count == 0) {
+		/* Clear the parent L1 page table entry. */
+		if (op_ctx->curr_page.l0_table->parent_idx != PVR_IDX_INVALID)
+			pvr_page_table_l1_remove(op_ctx);
+	}
+}
+
+/**
+ * DOC: Page table index utilities
+ */
+
+/**
+ * pvr_page_table_l2_idx() - Calculate the level 2 page table index for a
+ *                           device-virtual address.
+ * @device_addr: Target device-virtual address.
+ *
+ * This function does not perform any bounds checking - it is the caller's
+ * responsibility to ensure that @device_addr is valid before interpreting
+ * the result.
+ *
+ * Return:
+ * The index into a level 2 page table corresponding to @device_addr.
+ */
+static u16
+pvr_page_table_l2_idx(u64 device_addr)
+{
+	return (device_addr & ~ROGUE_MMUCTRL_VADDR_PC_INDEX_CLRMSK) >>
+	       ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIFT;
+}
+
+/**
+ * pvr_page_table_l1_idx() - Calculate the level 1 page table index for a
+ *                           device-virtual address.
+ * @device_addr: Target device-virtual address.
+ *
+ * This function does not perform any bounds checking - it is the caller's
+ * responsibility to ensure that @device_addr is valid before interpreting
+ * the result.
+ *
+ * Return:
+ * The index into a level 1 page table corresponding to @device_addr.
+ */
+static u16
+pvr_page_table_l1_idx(u64 device_addr)
+{
+	return (device_addr & ~ROGUE_MMUCTRL_VADDR_PD_INDEX_CLRMSK) >>
+	       ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIFT;
+}
+
+/**
+ * pvr_page_table_l0_idx() - Calculate the level 0 page table index for a
+ *                           device-virtual address.
+ * @device_addr: Target device-virtual address.
+ *
+ * This function does not perform any bounds checking - it is the caller's
+ * responsibility to ensure that @device_addr is valid before interpreting
+ * the result.
+ *
+ * Return:
+ * The index into a level 0 page table corresponding to @device_addr.
+ */
+static u16
+pvr_page_table_l0_idx(u64 device_addr)
+{
+	return (device_addr & ~ROGUE_MMUCTRL_VADDR_PT_INDEX_CLRMSK) >>
+	       ROGUE_MMUCTRL_PAGE_X_RANGE_SHIFT;
+}
+
+/**
+ * DOC: High-level page table operations
+ */
+
+/**
+ * pvr_page_table_l1_get_or_insert() - Retrieves (optionally inserting if
+ * necessary) a level 1 page table from the specified level 2 page table entry.
+ * @op_ctx: Target MMU op context.
+ * @should_insert: [IN] Specifies whether new page tables should be inserted
+ * when empty page table entries are encountered during traversal.
+ *
+ * Return:
+ *  * 0 on success, or
+ *
+ *    If @should_insert is %false:
+ *     * -%ENXIO if a level 1 page table would have been inserted.
+ *
+ *    If @should_insert is %true:
+ *     * Any error encountered while inserting the level 1 page table.
+ */
+static int
+pvr_page_table_l1_get_or_insert(struct pvr_mmu_op_context *op_ctx,
+				bool should_insert)
+{
+	struct pvr_page_table_l2 *l2_table =
+		&op_ctx->mmu_ctx->page_table_l2;
+	struct pvr_page_table_l1 *table;
+
+	if (pvr_page_table_l2_entry_is_valid(l2_table,
+					     op_ctx->curr_page.l2_idx)) {
+		op_ctx->curr_page.l1_table =
+			l2_table->entries[op_ctx->curr_page.l2_idx];
+		return 0;
+	}
+
+	if (!should_insert)
+		return -ENXIO;
+
+	/* Take a prealloced table. */
+	table = op_ctx->map.l1_prealloc_tables;
+	if (!table)
+		return -ENOMEM;
+
+	/* Pop */
+	op_ctx->map.l1_prealloc_tables = table->next_free;
+	table->next_free = NULL;
+
+	/* Ensure new table is fully written out before adding to L2 page table. */
+	wmb();
+
+	pvr_page_table_l2_insert(op_ctx, table);
+
+	return 0;
+}
+
+/**
+ * pvr_page_table_l0_get_or_insert() - Retrieves (optionally inserting if
+ * necessary) a level 0 page table from the specified level 1 page table entry.
+ * @op_ctx: Target MMU op context.
+ * @should_insert: [IN] Specifies whether new page tables should be inserted
+ * when empty page table entries are encountered during traversal.
+ *
+ * Return:
+ *  * 0 on success,
+ *
+ *    If @should_insert is %false:
+ *     * -%ENXIO if a level 0 page table would have been inserted.
+ *
+ *    If @should_insert is %true:
+ *     * Any error encountered while inserting the level 0 page table.
+ */
+static int
+pvr_page_table_l0_get_or_insert(struct pvr_mmu_op_context *op_ctx,
+				bool should_insert)
+{
+	struct pvr_page_table_l0 *table;
+
+	if (pvr_page_table_l1_entry_is_valid(op_ctx->curr_page.l1_table,
+					     op_ctx->curr_page.l1_idx)) {
+		op_ctx->curr_page.l0_table =
+			op_ctx->curr_page.l1_table->entries[op_ctx->curr_page.l1_idx];
+		return 0;
+	}
+
+	if (!should_insert)
+		return -ENXIO;
+
+	/* Take a prealloced table. */
+	table = op_ctx->map.l0_prealloc_tables;
+	if (!table)
+		return -ENOMEM;
+
+	/* Pop */
+	op_ctx->map.l0_prealloc_tables = table->next_free;
+	table->next_free = NULL;
+
+	/* Ensure new table is fully written out before adding to L1 page table. */
+	wmb();
+
+	pvr_page_table_l1_insert(op_ctx, table);
+
+	return 0;
+}
+
+/**
+ * pvr_mmu_context_create() - Create an MMU context.
+ * @pvr_dev: PVR device associated with owning VM context.
+ *
+ * Returns:
+ *  * Newly created MMU context object on success, or
+ *  * -%ENOMEM if no memory is available,
+ *  * Any error code returned by pvr_page_table_l2_init().
+ */
+struct pvr_mmu_context *pvr_mmu_context_create(struct pvr_device *pvr_dev)
+{
+	struct pvr_mmu_context *ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	int err;
+
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	err = pvr_page_table_l2_init(&ctx->page_table_l2, pvr_dev);
+	if (err)
+		return ERR_PTR(err);
+
+	ctx->pvr_dev = pvr_dev;
+
+	return ctx;
+}
+
+/**
+ * pvr_mmu_context_destroy() - Destroy an MMU context.
+ * @ctx: Target MMU context.
+ */
+void pvr_mmu_context_destroy(struct pvr_mmu_context *ctx)
+{
+	pvr_page_table_l2_fini(&ctx->page_table_l2);
+	kfree(ctx);
+}
+
+/**
+ * pvr_mmu_get_root_table_dma_addr() - Get the DMA address of the root of the
+ * page table structure behind a VM context.
+ * @ctx: Target MMU context.
+ */
+dma_addr_t pvr_mmu_get_root_table_dma_addr(struct pvr_mmu_context *ctx)
+{
+	return ctx->page_table_l2.backing_page.dma_addr;
+}
+
+/**
+ * pvr_page_table_l1_alloc() - Allocate a l1 page_table object.
+ * @ctx: MMU context of owning VM context.
+ *
+ * Returns:
+ *  * Newly created page table object on success, or
+ *  * -%ENOMEM if no memory is available,
+ *  * Any error code returned by pvr_page_table_l1_init().
+ */
+static struct pvr_page_table_l1 *
+pvr_page_table_l1_alloc(struct pvr_mmu_context *ctx)
+{
+	int err;
+
+	struct pvr_page_table_l1 *table =
+		kzalloc(sizeof(*table), GFP_KERNEL);
+
+	if (!table)
+		return ERR_PTR(-ENOMEM);
+
+	err = pvr_page_table_l1_init(table, ctx->pvr_dev);
+	if (err) {
+		kfree(table);
+		return ERR_PTR(err);
+	}
+
+	return table;
+}
+
+/**
+ * pvr_page_table_l0_alloc() - Allocate a l0 page_table object.
+ * @ctx: MMU context of owning VM context.
+ *
+ * Returns:
+ *  * Newly created page table object on success, or
+ *  * -%ENOMEM if no memory is available,
+ *  * Any error code returned by pvr_page_table_l0_init().
+ */
+static struct pvr_page_table_l0 *
+pvr_page_table_l0_alloc(struct pvr_mmu_context *ctx)
+{
+	int err;
+
+	struct pvr_page_table_l0 *table =
+		kzalloc(sizeof(*table), GFP_KERNEL);
+
+	if (!table)
+		return ERR_PTR(-ENOMEM);
+
+	err = pvr_page_table_l0_init(table, ctx->pvr_dev);
+	if (err) {
+		kfree(table);
+		return ERR_PTR(err);
+	}
+
+	return table;
+}
+
+/**
+ * pvr_mmu_op_context_require_sync() - Mark an MMU op context as requiring a
+ * sync operation for the referenced page tables up to a specified level.
+ * @op_ctx: Target MMU op context.
+ * @level: Maximum page table level for which a sync is required.
+ */
+static void
+pvr_mmu_op_context_require_sync(struct pvr_mmu_op_context *op_ctx,
+				enum pvr_mmu_sync_level level)
+{
+	if (op_ctx->sync_level_required < level)
+		op_ctx->sync_level_required = level;
+}
+
+/**
+ * pvr_mmu_op_context_sync_manual() - Trigger a sync of some or all of the
+ * page tables referenced by a MMU op context.
+ * @op_ctx: Target MMU op context.
+ * @level: Maximum page table level to sync.
+ *
+ * Do not call this function directly. Instead use
+ * pvr_mmu_op_context_sync_partial() which is checked against the current
+ * value of &op_ctx->sync_level_required as set by
+ * pvr_mmu_op_context_require_sync().
+ */
+static void
+pvr_mmu_op_context_sync_manual(struct pvr_mmu_op_context *op_ctx,
+			       enum pvr_mmu_sync_level level)
+{
+	/*
+	 * We sync the page table levels in ascending order (starting from the
+	 * leaf node) to ensure consistency.
+	 */
+
+	WARN_ON(level < PVR_MMU_SYNC_LEVEL_NONE);
+
+	if (level <= PVR_MMU_SYNC_LEVEL_NONE)
+		return;
+
+	if (op_ctx->curr_page.l0_table)
+		pvr_page_table_l0_sync(op_ctx->curr_page.l0_table);
+
+	if (level < PVR_MMU_SYNC_LEVEL_1)
+		return;
+
+	if (op_ctx->curr_page.l1_table)
+		pvr_page_table_l1_sync(op_ctx->curr_page.l1_table);
+
+	if (level < PVR_MMU_SYNC_LEVEL_2)
+		return;
+
+	pvr_page_table_l2_sync(&op_ctx->mmu_ctx->page_table_l2);
+}
+
+/**
+ * pvr_mmu_op_context_sync_partial() - Trigger a sync of some or all of the
+ * page tables referenced by a MMU op context.
+ * @op_ctx: Target MMU op context.
+ * @level: Requested page table level to sync up to (inclusive).
+ *
+ * If @level is greater than the maximum level recorded by @op_ctx as requiring
+ * a sync operation, only the previously recorded maximum will be used.
+ *
+ * Additionally, if @level is greater than or equal to the maximum level
+ * recorded by @op_ctx as requiring a sync operation, that maximum level will be
+ * reset as a full sync will be performed. This is equivalent to calling
+ * pvr_mmu_op_context_sync().
+ */
+static void
+pvr_mmu_op_context_sync_partial(struct pvr_mmu_op_context *op_ctx,
+				enum pvr_mmu_sync_level level)
+{
+	/*
+	 * If the requested sync level is greater than or equal to the
+	 * currently required sync level, we do two things:
+	 *  * Don't waste time syncing levels we haven't previously marked as
+	 *    requiring a sync, and
+	 *  * Reset the required sync level since we are about to sync
+	 *    everything that was previously marked as requiring a sync.
+	 */
+	if (level >= op_ctx->sync_level_required) {
+		level = op_ctx->sync_level_required;
+		op_ctx->sync_level_required = PVR_MMU_SYNC_LEVEL_NONE;
+	}
+
+	pvr_mmu_op_context_sync_manual(op_ctx, level);
+}
+
+/**
+ * pvr_mmu_op_context_sync() - Trigger a sync of every page table referenced by
+ * a MMU op context.
+ * @op_ctx: Target MMU op context.
+ *
+ * The maximum level marked internally as requiring a sync will be reset so
+ * that subsequent calls to this function will be no-ops unless @op_ctx is
+ * otherwise updated.
+ */
+static void
+pvr_mmu_op_context_sync(struct pvr_mmu_op_context *op_ctx)
+{
+	pvr_mmu_op_context_sync_manual(op_ctx, op_ctx->sync_level_required);
+
+	op_ctx->sync_level_required = PVR_MMU_SYNC_LEVEL_NONE;
+}
+
+/**
+ * pvr_mmu_op_context_load_tables() - Load pointers to tables in each level of
+ * the page table tree structure needed to reference the physical page
+ * referenced by a MMU op context.
+ * @op_ctx: Target MMU op context.
+ * @should_create: Specifies whether new page tables should be created when
+ * empty page table entries are encountered during traversal.
+ * @load_level_required: Maximum page table level to load.
+ *
+ * If @should_create is %true, this function may modify the stored required
+ * sync level of @op_ctx as new page tables are created and inserted into their
+ * respective parents.
+ *
+ * Since there is only one root page table, it is technically incorrect to call
+ * this function with a value of @load_level_required greater than or equal to
+ * the root level number. However, this is not explicitly disallowed here.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * Any error returned by pvr_page_table_l1_get_or_create() if
+ *    @load_level_required >= 1 except -%ENXIO, or
+ *  * Any error returned by pvr_page_table_l0_get_or_create() if
+ *    @load_level_required >= 0 except -%ENXIO.
+ */
+static int
+pvr_mmu_op_context_load_tables(struct pvr_mmu_op_context *op_ctx,
+			       bool should_create,
+			       enum pvr_mmu_sync_level load_level_required)
+{
+	const struct pvr_page_table_l1 *l1_head_before =
+		op_ctx->map.l1_prealloc_tables;
+	const struct pvr_page_table_l0 *l0_head_before =
+		op_ctx->map.l0_prealloc_tables;
+	int err;
+
+	/* Clear tables we're about to fetch in case of error states. */
+	if (load_level_required >= PVR_MMU_SYNC_LEVEL_1)
+		op_ctx->curr_page.l1_table = NULL;
+
+	if (load_level_required >= PVR_MMU_SYNC_LEVEL_0)
+		op_ctx->curr_page.l0_table = NULL;
+
+	/* Get or create L1 page table. */
+	if (load_level_required >= PVR_MMU_SYNC_LEVEL_1) {
+		err = pvr_page_table_l1_get_or_insert(op_ctx, should_create);
+		if (err) {
+			/*
+			 * If @should_create is %false and no L1 page table was
+			 * found, return early but without an error. Since
+			 * pvr_page_table_l1_get_or_create() can only return
+			 * -%ENXIO if @should_create is %false, there is no
+			 * need to check it here.
+			 */
+			if (err == -ENXIO)
+				err = 0;
+
+			return err;
+		}
+	}
+
+	/* Get or create L0 page table. */
+	if (load_level_required >= PVR_MMU_SYNC_LEVEL_0) {
+		err = pvr_page_table_l0_get_or_insert(op_ctx, should_create);
+		if (err) {
+			/*
+			 * If @should_create is %false and no L0 page table was
+			 * found, return early but without an error. Since
+			 * pvr_page_table_l0_get_or_insert() can only return
+			 * -%ENXIO if @should_create is %false, there is no
+			 * need to check it here.
+			 */
+			if (err == -ENXIO)
+				err = 0;
+
+			/*
+			 * At this point, an L1 page table could have been
+			 * inserted but is now empty due to the failed attempt
+			 * at inserting an L0 page table. In this instance, we
+			 * must remove the empty L1 page table ourselves as
+			 * pvr_page_table_l1_remove() is never called as part
+			 * of the error path in
+			 * pvr_page_table_l0_get_or_insert().
+			 */
+			if (l1_head_before != op_ctx->map.l1_prealloc_tables) {
+				pvr_page_table_l2_remove(op_ctx);
+				pvr_mmu_op_context_require_sync(op_ctx, PVR_MMU_SYNC_LEVEL_2);
+			}
+
+			return err;
+		}
+	}
+
+	/*
+	 * A sync is only needed if table objects were inserted. This can be
+	 * inferred by checking if the pointer at the head of the linked list
+	 * has changed.
+	 */
+	if (l1_head_before != op_ctx->map.l1_prealloc_tables)
+		pvr_mmu_op_context_require_sync(op_ctx, PVR_MMU_SYNC_LEVEL_2);
+	else if (l0_head_before != op_ctx->map.l0_prealloc_tables)
+		pvr_mmu_op_context_require_sync(op_ctx, PVR_MMU_SYNC_LEVEL_1);
+
+	return 0;
+}
+
+/**
+ * pvr_mmu_op_context_set_curr_page() - Reassign the current page of an MMU op
+ * context, syncing any page tables previously assigned to it which are no
+ * longer relevant.
+ * @op_ctx: Target MMU op context.
+ * @device_addr: New pointer target.
+ * @should_create: Specify whether new page tables should be created when
+ * empty page table entries are encountered during traversal.
+ *
+ * This function performs a full sync on the pointer, regardless of which
+ * levels are modified.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_mmu_op_context_load_tables().
+ */
+static int
+pvr_mmu_op_context_set_curr_page(struct pvr_mmu_op_context *op_ctx,
+				 u64 device_addr, bool should_create)
+{
+	pvr_mmu_op_context_sync(op_ctx);
+
+	op_ctx->curr_page.l2_idx = pvr_page_table_l2_idx(device_addr);
+	op_ctx->curr_page.l1_idx = pvr_page_table_l1_idx(device_addr);
+	op_ctx->curr_page.l0_idx = pvr_page_table_l0_idx(device_addr);
+	op_ctx->curr_page.l1_table = NULL;
+	op_ctx->curr_page.l0_table = NULL;
+
+	return pvr_mmu_op_context_load_tables(op_ctx, should_create,
+					      PVR_MMU_SYNC_LEVEL_1);
+}
+
+/**
+ * pvr_mmu_op_context_next_page() - Advance the current page of an MMU op
+ * context.
+ * @op_ctx: Target MMU op context.
+ * @should_create: Specify whether new page tables should be created when
+ * empty page table entries are encountered during traversal.
+ *
+ * If @should_create is %false, it is the caller's responsibility to verify that
+ * the state of the table references in @op_ctx is valid on return. If -%ENXIO
+ * is returned, at least one of the table references is invalid. It should be
+ * noted that @op_ctx as a whole will be left in a valid state if -%ENXIO is
+ * returned, unlike other error codes. The caller should check which references
+ * are invalid by comparing them to %NULL. Only &@ptr->l2_table is guaranteed
+ * to be valid, since it represents the root of the page table tree structure.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EPERM if the operation would wrap at the top of the page table
+ *    hierarchy,
+ *  * -%ENXIO if @should_create is %false and a page table of any level would
+ *    have otherwise been created, or
+ *  * Any error returned while attempting to create missing page tables if
+ *    @should_create is %true.
+ */
+static int
+pvr_mmu_op_context_next_page(struct pvr_mmu_op_context *op_ctx,
+			     bool should_create)
+{
+	s8 load_level_required = PVR_MMU_SYNC_LEVEL_NONE;
+
+	if (++op_ctx->curr_page.l0_idx != ROGUE_MMUCTRL_ENTRIES_PT_VALUE_X)
+		goto load_tables;
+
+	op_ctx->curr_page.l0_idx = 0;
+	load_level_required = PVR_MMU_SYNC_LEVEL_0;
+
+	if (++op_ctx->curr_page.l1_idx != ROGUE_MMUCTRL_ENTRIES_PD_VALUE)
+		goto load_tables;
+
+	op_ctx->curr_page.l1_idx = 0;
+	load_level_required = PVR_MMU_SYNC_LEVEL_1;
+
+	if (++op_ctx->curr_page.l2_idx != ROGUE_MMUCTRL_ENTRIES_PC_VALUE)
+		goto load_tables;
+
+	/*
+	 * If the pattern continued, we would set &op_ctx->curr_page.l2_idx to
+	 * zero here. However, that would wrap the top layer of the page table
+	 * hierarchy which is not a valid operation. Instead, we warn and return
+	 * an error.
+	 */
+	WARN(true,
+	     "%s(%p) attempted to loop the top of the page table hierarchy",
+	     __func__, op_ctx);
+	return -EPERM;
+
+	/* If indices have wrapped, we need to load new tables. */
+load_tables:
+	/* First, flush tables which will be unloaded. */
+	pvr_mmu_op_context_sync_partial(op_ctx, load_level_required);
+
+	/* Then load tables from the required level down. */
+	return pvr_mmu_op_context_load_tables(op_ctx, should_create,
+					      load_level_required);
+}
+
+/**
+ * DOC: Single page operations
+ */
+
+/**
+ * pvr_page_create() - Create a device-virtual memory page and insert it into
+ * a level 0 page table.
+ * @op_ctx: Target MMU op context pointing at the device-virtual address of the
+ * target page.
+ * @dma_addr: DMA address of the physical page backing the created page.
+ * @flags: Page options saved on the level 0 page table entry for reading by
+ *         the device.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * -%EEXIST if the requested page already exists.
+ */
+static int
+pvr_page_create(struct pvr_mmu_op_context *op_ctx, dma_addr_t dma_addr,
+		struct pvr_page_flags_raw flags)
+{
+	/* Do not create a new page if one already exists. */
+	if (pvr_page_table_l0_entry_is_valid(op_ctx->curr_page.l0_table,
+					     op_ctx->curr_page.l0_idx)) {
+		return -EEXIST;
+	}
+
+	pvr_page_table_l0_insert(op_ctx, dma_addr, flags);
+
+	pvr_mmu_op_context_require_sync(op_ctx, PVR_MMU_SYNC_LEVEL_0);
+
+	return 0;
+}
+
+/**
+ * pvr_page_destroy() - Destroy a device page after removing it from its
+ * parent level 0 page table.
+ * @op_ctx: Target MMU op context.
+ */
+static void
+pvr_page_destroy(struct pvr_mmu_op_context *op_ctx)
+{
+	/* Do nothing if the page does not exist. */
+	if (!pvr_page_table_l0_entry_is_valid(op_ctx->curr_page.l0_table,
+					      op_ctx->curr_page.l0_idx)) {
+		return;
+	}
+
+	/* Clear the parent L0 page table entry. */
+	pvr_page_table_l0_remove(op_ctx);
+
+	pvr_mmu_op_context_require_sync(op_ctx, PVR_MMU_SYNC_LEVEL_0);
+}
+
+/**
+ * pvr_mmu_op_context_destroy() - Destroy an MMU op context.
+ * @op_ctx: Target MMU op context.
+ */
+void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx)
+{
+	const bool flush_caches =
+		op_ctx->sync_level_required != PVR_MMU_SYNC_LEVEL_NONE;
+
+	pvr_mmu_op_context_sync(op_ctx);
+
+	/* Unmaps should be flushed immediately. Map flushes can be deferred. */
+	if (flush_caches && !op_ctx->map.sgt)
+		pvr_mmu_flush_exec(op_ctx->mmu_ctx->pvr_dev, true);
+
+	while (op_ctx->map.l0_prealloc_tables) {
+		struct pvr_page_table_l0 *tmp = op_ctx->map.l0_prealloc_tables;
+
+		op_ctx->map.l0_prealloc_tables =
+			op_ctx->map.l0_prealloc_tables->next_free;
+		pvr_page_table_l0_free(tmp);
+	}
+
+	while (op_ctx->map.l1_prealloc_tables) {
+		struct pvr_page_table_l1 *tmp = op_ctx->map.l1_prealloc_tables;
+
+		op_ctx->map.l1_prealloc_tables =
+			op_ctx->map.l1_prealloc_tables->next_free;
+		pvr_page_table_l1_free(tmp);
+	}
+
+	while (op_ctx->unmap.l0_free_tables) {
+		struct pvr_page_table_l0 *tmp = op_ctx->unmap.l0_free_tables;
+
+		op_ctx->unmap.l0_free_tables =
+			op_ctx->unmap.l0_free_tables->next_free;
+		pvr_page_table_l0_free(tmp);
+	}
+
+	while (op_ctx->unmap.l1_free_tables) {
+		struct pvr_page_table_l1 *tmp = op_ctx->unmap.l1_free_tables;
+
+		op_ctx->unmap.l1_free_tables =
+			op_ctx->unmap.l1_free_tables->next_free;
+		pvr_page_table_l1_free(tmp);
+	}
+
+	kfree(op_ctx);
+}
+
+/**
+ * pvr_mmu_op_context_create() - Create an MMU op context.
+ * @ctx: MMU context associated with owning VM context.
+ * @sgt: Scatter gather table containing pages pinned for use by this context.
+ * @sgt_offset: Start offset of the requested device-virtual memory mapping.
+ * @size: Size in bytes of the requested device-virtual memory mapping. For an
+ * unmapping, this should be zero so that no page tables are allocated.
+ *
+ * Returns:
+ *  * Newly created MMU op context object on success, or
+ *  * -%ENOMEM if no memory is available,
+ *  * Any error code returned by pvr_page_table_l2_init().
+ */
+struct pvr_mmu_op_context *
+pvr_mmu_op_context_create(struct pvr_mmu_context *ctx, struct sg_table *sgt,
+			  u64 sgt_offset, u64 size)
+{
+	int err;
+
+	struct pvr_mmu_op_context *op_ctx =
+		kzalloc(sizeof(*op_ctx), GFP_KERNEL);
+
+	if (!op_ctx)
+		return ERR_PTR(-ENOMEM);
+
+	op_ctx->mmu_ctx = ctx;
+	op_ctx->map.sgt = sgt;
+	op_ctx->map.sgt_offset = sgt_offset;
+	op_ctx->sync_level_required = PVR_MMU_SYNC_LEVEL_NONE;
+
+	if (size) {
+		/*
+		 * The number of page table objects we need to prealloc is
+		 * indicated by the mapping size, start offset and the sizes
+		 * of the areas mapped per PT or PD. The range calculation is
+		 * identical to that for the index into a table for a device
+		 * address, so we reuse those functions here.
+		 */
+		const u32 l1_start_idx = pvr_page_table_l2_idx(sgt_offset);
+		const u32 l1_end_idx = pvr_page_table_l2_idx(sgt_offset + size);
+		const u32 l1_count = l1_end_idx - l1_start_idx + 1;
+		const u32 l0_start_idx = pvr_page_table_l1_idx(sgt_offset);
+		const u32 l0_end_idx = pvr_page_table_l1_idx(sgt_offset + size);
+		const u32 l0_count = l0_end_idx - l0_start_idx + 1;
+
+		/*
+		 * Alloc and push page table entries until we have enough of
+		 * each type, ending with linked lists of l0 and l1 entries in
+		 * reverse order.
+		 */
+		for (int i = 0; i < l1_count; i++) {
+			struct pvr_page_table_l1 *l1_tmp =
+				pvr_page_table_l1_alloc(ctx);
+
+			err = PTR_ERR_OR_ZERO(l1_tmp);
+			if (err)
+				goto err_cleanup;
+
+			l1_tmp->next_free = op_ctx->map.l1_prealloc_tables;
+			op_ctx->map.l1_prealloc_tables = l1_tmp;
+		}
+
+		for (int i = 0; i < l0_count; i++) {
+			struct pvr_page_table_l0 *l0_tmp =
+				pvr_page_table_l0_alloc(ctx);
+
+			err = PTR_ERR_OR_ZERO(l0_tmp);
+			if (err)
+				goto err_cleanup;
+
+			l0_tmp->next_free = op_ctx->map.l0_prealloc_tables;
+			op_ctx->map.l0_prealloc_tables = l0_tmp;
+		}
+	}
+
+	return op_ctx;
+
+err_cleanup:
+	pvr_mmu_op_context_destroy(op_ctx);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_mmu_op_context_unmap_curr_page() - Unmap pages from a memory context
+ * starting from the current page of an MMU op context.
+ * @op_ctx: Target MMU op context pointing at the first page to unmap.
+ * @nr_pages: Number of pages to unmap.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error encountered while advancing @op_ctx.curr_page with
+ *    pvr_mmu_op_context_next_page() (except -%ENXIO).
+ */
+static int
+pvr_mmu_op_context_unmap_curr_page(struct pvr_mmu_op_context *op_ctx,
+				   u64 nr_pages)
+{
+	int err;
+
+	if (nr_pages == 0)
+		return 0;
+
+	/*
+	 * Destroy first page outside loop, as it doesn't require a page
+	 * advance beforehand. If the L0 page table reference in
+	 * @op_ctx.curr_page is %NULL, there cannot be a mapped page at
+	 * @op_ctx.curr_page (so skip ahead).
+	 */
+	if (op_ctx->curr_page.l0_table)
+		pvr_page_destroy(op_ctx);
+
+	for (u64 page = 1; page < nr_pages; ++page) {
+		err = pvr_mmu_op_context_next_page(op_ctx, false);
+		/*
+		 * If the page table tree structure at @op_ctx.curr_page is
+		 * incomplete, skip ahead. We don't care about unmapping pages
+		 * that cannot exist.
+		 *
+		 * FIXME: This could be made more efficient by jumping ahead
+		 * using pvr_mmu_op_context_set_curr_page().
+		 */
+		if (err == -ENXIO)
+			continue;
+		else if (err)
+			return err;
+
+		pvr_page_destroy(op_ctx);
+	}
+
+	return 0;
+}
+
+/**
+ * pvr_mmu_unmap() - Unmap pages from a memory context.
+ * @op_ctx: Target MMU op context.
+ * @device_addr: First device-virtual address to unmap.
+ * @size: Size in bytes to unmap.
+ *
+ * The total amount of device-virtual memory unmapped is
+ * @nr_pages * %PVR_DEVICE_PAGE_SIZE.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_page_table_ptr_init(), or
+ *  * Any error code returned by pvr_page_table_ptr_unmap().
+ */
+int pvr_mmu_unmap(struct pvr_mmu_op_context *op_ctx, u64 device_addr, u64 size)
+{
+	int err = pvr_mmu_op_context_set_curr_page(op_ctx, device_addr, false);
+
+	if (err)
+		return err;
+
+	return pvr_mmu_op_context_unmap_curr_page(op_ctx,
+						  size >> PVR_DEVICE_PAGE_SHIFT);
+}
+
+/**
+ * pvr_mmu_map_sgl() - Map part of a scatter-gather table entry to
+ * device-virtual memory.
+ * @op_ctx: Target MMU op context pointing to the first page that should be
+ * mapped.
+ * @sgl: Target scatter-gather table entry.
+ * @offset: Offset into @sgl to map from. Must result in a starting address
+ * from @sgl which is CPU page-aligned.
+ * @size: Size of the memory to be mapped in bytes. Must be a non-zero multiple
+ * of the device page size.
+ * @page_flags: Page options to be applied to every device-virtual memory page
+ * in the created mapping.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if the range specified by @offset and @size is not completely
+ *    within @sgl, or
+ *  * Any error encountered while creating a page with pvr_page_create(), or
+ *  * Any error encountered while advancing @op_ctx.curr_page with
+ *    pvr_mmu_op_context_next_page().
+ */
+static int
+pvr_mmu_map_sgl(struct pvr_mmu_op_context *op_ctx, struct scatterlist *sgl,
+		u64 offset, u64 size, struct pvr_page_flags_raw page_flags)
+{
+	const unsigned int pages = size >> PVR_DEVICE_PAGE_SHIFT;
+	dma_addr_t dma_addr = sg_dma_address(sgl) + offset;
+	const unsigned int dma_len = sg_dma_len(sgl);
+	struct pvr_page_table_ptr ptr_copy;
+	unsigned int page;
+	int err;
+
+	if (size > dma_len || offset > dma_len - size)
+		return -EINVAL;
+
+	/*
+	 * Before progressing, save a copy of the start pointer so we can use
+	 * it again if we enter an error state and have to destroy pages.
+	 */
+	memcpy(&ptr_copy, &op_ctx->curr_page, sizeof(ptr_copy));
+
+	/*
+	 * Create first page outside loop, as it doesn't require a page advance
+	 * beforehand.
+	 */
+	err = pvr_page_create(op_ctx, dma_addr, page_flags);
+	if (err)
+		return err;
+
+	for (page = 1; page < pages; ++page) {
+		err = pvr_mmu_op_context_next_page(op_ctx, true);
+		if (err)
+			goto err_destroy_pages;
+
+		dma_addr += PVR_DEVICE_PAGE_SIZE;
+
+		err = pvr_page_create(op_ctx, dma_addr, page_flags);
+		if (err)
+			goto err_destroy_pages;
+	}
+
+	return 0;
+
+err_destroy_pages:
+	memcpy(&op_ctx->curr_page, &ptr_copy, sizeof(op_ctx->curr_page));
+	err = pvr_mmu_op_context_unmap_curr_page(op_ctx, page);
+
+	return err;
+}
+
+/**
+ * pvr_mmu_map() - Map an object's virtual memory to physical memory.
+ * @op_ctx: Target MMU op context.
+ * @size: Size of memory to be mapped in bytes. Must be a non-zero multiple
+ * of the device page size.
+ * @flags: Flags from pvr_gem_object associated with the mapping.
+ * @device_addr: Virtual device address to map to. Must be device page-aligned.
+ *
+ * Returns:
+ *  * 0 on success, or
+ *  * Any error code returned by pvr_page_table_ptr_init(), or
+ *  * Any error code returned by pvr_mmu_map_sgl(), or
+ *  * Any error code returned by pvr_page_table_ptr_next_page().
+ */
+int pvr_mmu_map(struct pvr_mmu_op_context *op_ctx, u64 size, u64 flags,
+		u64 device_addr)
+{
+	struct pvr_page_table_ptr ptr_copy;
+	struct pvr_page_flags_raw flags_raw;
+	struct scatterlist *sgl;
+	u64 mapped_size = 0;
+	unsigned int count;
+	int err;
+
+	if (!size)
+		return 0;
+
+	if ((op_ctx->map.sgt_offset | size) & ~PVR_DEVICE_PAGE_MASK)
+		return -EINVAL;
+
+	err = pvr_mmu_op_context_set_curr_page(op_ctx, device_addr, true);
+	if (err)
+		return -EINVAL;
+
+	memcpy(&ptr_copy, &op_ctx->curr_page, sizeof(ptr_copy));
+
+	flags_raw = pvr_page_flags_raw_create(false, false,
+					      flags & DRM_PVR_BO_BYPASS_DEVICE_CACHE,
+					      flags & DRM_PVR_BO_PM_FW_PROTECT);
+
+	/* Map scatter gather table */
+	for_each_sgtable_dma_sg(op_ctx->map.sgt, sgl, count) {
+		const size_t sgl_len = sg_dma_len(sgl);
+		u64 sgl_offset, map_sgl_len;
+
+		if (sgl_len <= op_ctx->map.sgt_offset) {
+			op_ctx->map.sgt_offset -= sgl_len;
+			continue;
+		}
+
+		sgl_offset = op_ctx->map.sgt_offset;
+		map_sgl_len = min_t(u64, sgl_len - sgl_offset, size - mapped_size);
+
+		err = pvr_mmu_map_sgl(op_ctx, sgl, sgl_offset, map_sgl_len,
+				      flags_raw);
+		if (err)
+			break;
+
+		/*
+		 * Flag the L0 page table as requiring a flush when the MMU op
+		 * context is destroyed.
+		 */
+		pvr_mmu_op_context_require_sync(op_ctx, PVR_MMU_SYNC_LEVEL_0);
+
+		op_ctx->map.sgt_offset = 0;
+		mapped_size += map_sgl_len;
+
+		if (mapped_size >= size)
+			break;
+
+		err = pvr_mmu_op_context_next_page(op_ctx, true);
+		if (err)
+			break;
+	}
+
+	if (err && mapped_size) {
+		memcpy(&op_ctx->curr_page, &ptr_copy, sizeof(op_ctx->curr_page));
+		pvr_mmu_op_context_unmap_curr_page(op_ctx,
+						   mapped_size >> PVR_DEVICE_PAGE_SHIFT);
+	}
+
+	return err;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.h b/drivers/gpu/drm/imagination/pvr_mmu.h
new file mode 100644
index 000000000000..7a0d72e1f523
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_mmu.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_MMU_H
+#define PVR_MMU_H
+
+#include <linux/memory.h>
+#include <linux/types.h>
+
+/* Forward declaration from "pvr_device.h" */
+struct pvr_device;
+
+/* Forward declaration from "pvr_mmu.c" */
+struct pvr_mmu_context;
+struct pvr_mmu_op_context;
+
+/* Forward declaration from "pvr_vm.c" */
+struct pvr_vm_context;
+
+/* Forward declaration from <linux/scatterlist.h> */
+struct sg_table;
+
+/**
+ * DOC: Public API (constants)
+ *
+ * .. c:macro:: PVR_DEVICE_PAGE_SIZE
+ *
+ *    Fixed page size referenced by leaf nodes in the page table tree
+ *    structure. In the current implementation, this value is pegged to the
+ *    CPU page size (%PAGE_SIZE). It is therefore an error to specify a CPU
+ *    page size which is not also a supported device page size. The supported
+ *    device page sizes are: 4KiB, 16KiB, 64KiB, 256KiB, 1MiB and 2MiB.
+ *
+ * .. c:macro:: PVR_DEVICE_PAGE_SHIFT
+ *
+ *    Shift value used to efficiently multiply or divide by
+ *    %PVR_DEVICE_PAGE_SIZE.
+ *
+ *    This value is derived from %PVR_DEVICE_PAGE_SIZE.
+ *
+ * .. c:macro:: PVR_DEVICE_PAGE_MASK
+ *
+ *    Mask used to round a value down to the nearest multiple of
+ *    %PVR_DEVICE_PAGE_SIZE. When bitwise negated, it will indicate whether a
+ *    value is already a multiple of %PVR_DEVICE_PAGE_SIZE.
+ *
+ *    This value is derived from %PVR_DEVICE_PAGE_SIZE.
+ */
+
+/* PVR_DEVICE_PAGE_SIZE determines the page size */
+#define PVR_DEVICE_PAGE_SIZE (PAGE_SIZE)
+#define PVR_DEVICE_PAGE_SHIFT (PAGE_SHIFT)
+#define PVR_DEVICE_PAGE_MASK (PAGE_MASK)
+
+/**
+ * DOC: Page table index utilities (constants)
+ *
+ * .. c:macro:: PVR_PAGE_TABLE_ADDR_SPACE_SIZE
+ *
+ *    Size of device-virtual address space which can be represented in the page
+ *    table structure.
+ *
+ *    This value is checked at runtime against
+ *    &pvr_device_features.virtual_address_space_bits by
+ *    pvr_vm_create_context(), which will return an error if the feature value
+ *    does not match this constant.
+ *
+ *    .. admonition:: Future work
+ *
+ *       It should be possible to support other values of
+ *       &pvr_device_features.virtual_address_space_bits, but so far no
+ *       hardware has been created which advertises an unsupported value.
+ *
+ * .. c:macro:: PVR_PAGE_TABLE_ADDR_BITS
+ *
+ *    Number of bits needed to represent any value less than
+ *    %PVR_PAGE_TABLE_ADDR_SPACE_SIZE exactly.
+ *
+ * .. c:macro:: PVR_PAGE_TABLE_ADDR_MASK
+ *
+ *    Bitmask of device-virtual addresses which are valid in the page table
+ *    structure.
+ *
+ *    This value is derived from %PVR_PAGE_TABLE_ADDR_SPACE_SIZE, so the same
+ *    notes on that constant apply here.
+ */
+#define PVR_PAGE_TABLE_ADDR_SPACE_SIZE SZ_1T
+#define PVR_PAGE_TABLE_ADDR_BITS __ffs(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)
+#define PVR_PAGE_TABLE_ADDR_MASK (PVR_PAGE_TABLE_ADDR_SPACE_SIZE - 1)
+
+void pvr_mmu_flush_request_all(struct pvr_device *pvr_dev);
+int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, bool wait);
+
+struct pvr_mmu_context *pvr_mmu_context_create(struct pvr_device *pvr_dev);
+void pvr_mmu_context_destroy(struct pvr_mmu_context *ctx);
+
+dma_addr_t pvr_mmu_get_root_table_dma_addr(struct pvr_mmu_context *ctx);
+
+void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx);
+struct pvr_mmu_op_context *
+pvr_mmu_op_context_create(struct pvr_mmu_context *ctx,
+			  struct sg_table *sgt, u64 sgt_offset, u64 size);
+
+int pvr_mmu_map(struct pvr_mmu_op_context *op_ctx, u64 size, u64 flags,
+		u64 device_addr);
+int pvr_mmu_unmap(struct pvr_mmu_op_context *op_ctx, u64 device_addr, u64 size);
+
+#endif /* PVR_MMU_H */
+
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
new file mode 100644
index 000000000000..edf6fbabe554
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -0,0 +1,942 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#include "pvr_vm.h"
+
+#include "pvr_device.h"
+#include "pvr_drv.h"
+#include "pvr_gem.h"
+#include "pvr_mmu.h"
+#include "pvr_rogue_fwif.h"
+#include "pvr_rogue_heap_config.h"
+
+#include <drm/drm_gem.h>
+#include <drm/drm_gpuvm.h>
+
+#include <linux/container_of.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/kref.h>
+#include <linux/mutex.h>
+#include <linux/stddef.h>
+
+/**
+ * DOC: Memory context
+ *
+ * This is the "top level" datatype in the VM code. It's exposed in the public
+ * API as an opaque handle.
+ */
+
+/**
+ * struct pvr_vm_context - Context type which encapsulates an entire page table
+ * tree structure.
+ * @pvr_dev: The PowerVR device to which this context is bound.
+ *
+ * This binding is immutable for the life of the context.
+ * @mmu_ctx: The context for binding to physical memory.
+ * @gpuvm_mgr: GPUVM object associated with this context.
+ * @lock: Global lock on this entire structure of page tables.
+ * @fw_mem_ctx_obj: Firmware object representing firmware memory context.
+ * @ref_count: Reference count of object.
+ */
+struct pvr_vm_context {
+	struct pvr_device *pvr_dev;
+	struct pvr_mmu_context *mmu_ctx;
+	struct drm_gpuvm gpuvm_mgr;
+	struct mutex lock;
+	struct pvr_fw_object *fw_mem_ctx_obj;
+	struct kref ref_count;
+};
+
+/**
+ * pvr_vm_get_page_table_root_addr() - Get the DMA address of the root of the
+ *                                     page table structure behind a VM context.
+ * @vm_ctx: Target VM context.
+ */
+dma_addr_t pvr_vm_get_page_table_root_addr(struct pvr_vm_context *vm_ctx)
+{
+	return pvr_mmu_get_root_table_dma_addr(vm_ctx->mmu_ctx);
+}
+
+/**
+ * DOC: Memory mappings
+ */
+
+/**
+ * struct pvr_vm_gpuva - Wrapper type representing a single VM mapping.
+ */
+struct pvr_vm_gpuva {
+	/** @base: The wrapped drm_gpuva object. */
+	struct drm_gpuva base;
+
+	/**
+	 * @node: Linked list node, to build a list of mappings to cleanup after
+	 * unmapping, so that all associated &struct pvr_gem_object can be freed
+	 * outside of callback context.
+	 */
+	struct list_head node;
+};
+
+static __always_inline
+struct pvr_vm_gpuva *to_pvr_vm_gpuva(struct drm_gpuva *gpuva)
+{
+	return container_of(gpuva, struct pvr_vm_gpuva, base);
+}
+
+/**
+ * pvr_vm_gpuva_mapping_init() - Setup a mapping object.
+ * @va: Pointer to pvr_vm_gpuva mapping object.
+ *
+ * The parameters of the mapping are handled internally by DRM GPUVA manager.
+ */
+static void
+pvr_vm_gpuva_mapping_init(struct pvr_vm_gpuva *va)
+{
+	INIT_LIST_HEAD(&va->node);
+}
+
+/**
+ * struct pvr_vm_gpuva_op_ctx - Context of a map/unmap operation.
+ */
+struct pvr_vm_gpuva_op_ctx {
+	/** @pvr_obj: Object associated with mapping (map only). */
+	struct pvr_gem_object *pvr_obj;
+
+	/**
+	 * @vm_ctx: VM context where the mapping will be created or destroyed.
+	 */
+	struct pvr_vm_context *vm_ctx;
+
+	/** @mmu_op_ctx: MMU op context. */
+	struct pvr_mmu_op_context *mmu_op_ctx;
+
+	/**
+	 * @new_va: Prealloced VA mapping object (init in callback).
+	 * Used when creating a mapping.
+	 */
+	struct pvr_vm_gpuva *new_va;
+
+	/**
+	 * @prev_va: Prealloced VA mapping object (init in callback).
+	 * Used when a mapping or unmapping operation overlaps an existing
+	 * mapping and splits away the beginning into a new mapping.
+	 */
+	struct pvr_vm_gpuva *prev_va;
+
+	/**
+	 * @next_va: Prealloced VA mapping object (init in callback).
+	 * Used when a mapping or unmapping operation overlaps an existing
+	 * mapping and splits away the end into a new mapping.
+	 */
+	struct pvr_vm_gpuva *next_va;
+
+	/**
+	 * @returned_gpuvas: When unlinking, this list holds now unused
+	 * &struct pvr_vm_gpuva objects. These must be cleaned up when this
+	 * object is cleaned up.
+	 */
+	struct list_head returned_gpuvas;
+};
+
+static void
+pvr_vm_gpuva_link(struct pvr_vm_gpuva *va)
+{
+	struct pvr_gem_object *pvr_gem = gem_to_pvr_gem(va->base.gem.obj);
+
+	mutex_lock(&pvr_gem->gpuva_lock);
+	drm_gpuva_link(&va->base);
+	mutex_unlock(&pvr_gem->gpuva_lock);
+}
+
+static void
+pvr_vm_gpuva_unlink(struct pvr_vm_gpuva_op_ctx *op, struct pvr_vm_gpuva *va)
+{
+	struct pvr_gem_object *pvr_gem = gem_to_pvr_gem(va->base.gem.obj);
+
+	mutex_lock(&pvr_gem->gpuva_lock);
+	drm_gpuva_unlink(&va->base);
+	mutex_unlock(&pvr_gem->gpuva_lock);
+
+	list_move_tail(&va->node, &op->returned_gpuvas);
+}
+
+/**
+ * pvr_vm_gpuva_map() - Insert a mapping into a memory context.
+ * @op: gpuva op containing the remap details.
+ * @op_ctx: Operation context.
+ *
+ * Context: Called by drm_gpuvm_sm_map following a successful mapping while
+ * @op_ctx.vm_ctx mutex is held.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_mmu_map().
+ */
+static int
+pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
+{
+	struct pvr_gem_object *pvr_gem = gem_to_pvr_gem(op->map.gem.obj);
+	struct pvr_vm_gpuva_op_ctx *ctx = op_ctx;
+	int err;
+
+	if ((op->map.gem.offset | op->map.va.range) & ~PVR_DEVICE_PAGE_MASK)
+		return -EINVAL;
+
+	err = pvr_mmu_map(ctx->mmu_op_ctx, op->map.va.range, pvr_gem->flags,
+			  op->map.va.addr);
+	if (err)
+		return err;
+
+	drm_gpuva_map(&ctx->vm_ctx->gpuvm_mgr, &ctx->new_va->base, &op->map);
+	pvr_vm_gpuva_link(ctx->new_va);
+	ctx->new_va = NULL;
+
+	/*
+	 * Setting the pvr_obj pointer to NULL in the pvr_vm_bind_op means that
+	 * the reference won't be released when it is cleaned up.
+	 */
+	ctx->pvr_obj = NULL;
+
+	return 0;
+}
+
+/**
+ * pvr_vm_gpuva_unmap() - Remove a mapping from a memory context.
+ * @op: gpuva op containing the unmap details.
+ * @op_ctx: Operation context.
+ *
+ * Context: Called by drm_gpuvm_sm_unmap following a successful unmapping while
+ * @op_ctx.vm_ctx mutex is held.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_mmu_unmap().
+ */
+static int
+pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
+{
+	struct pvr_vm_gpuva_op_ctx *ctx = op_ctx;
+
+	int err = pvr_mmu_unmap(ctx->mmu_op_ctx, op->unmap.va->va.addr,
+				op->unmap.va->va.range);
+
+	if (err)
+		return err;
+
+	drm_gpuva_unmap(&op->unmap);
+	pvr_vm_gpuva_unlink(ctx, to_pvr_vm_gpuva(op->unmap.va));
+
+	return 0;
+}
+
+/**
+ * pvr_vm_gpuva_remap() - Remap a mapping within a memory context.
+ * @op: gpuva op containing the remap details.
+ * @op_ctx: Operation context.
+ *
+ * Context: Called by either drm_gpuvm_sm_map or drm_gpuvm_sm_unmap when a
+ * mapping or unmapping operation causes a region to be split. The
+ * @op_ctx.vm_ctx mutex is held.
+ *
+ * Return:
+ *  * 0 on success, or
+ *  * Any error returned by pvr_vm_gpuva_unmap() or pvr_vm_gpuva_unmap().
+ */
+static int
+pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
+{
+	struct pvr_vm_gpuva_op_ctx *ctx = op_ctx;
+	u64 va_start = 0, va_range = 0;
+	int err;
+
+	drm_gpuva_op_remap_to_unmap_range(&op->remap, &va_start, &va_range);
+	err = pvr_mmu_unmap(ctx->mmu_op_ctx, va_start, va_range);
+	if (err)
+		return err;
+
+	/* No actual remap required: the page table tree depth is fixed to 3,
+	 * and we use 4k page table entries only for now.
+	 */
+	drm_gpuva_remap(&ctx->prev_va->base, &ctx->next_va->base, &op->remap);
+
+	if (op->remap.prev) {
+		pvr_gem_object_get(gem_to_pvr_gem(ctx->prev_va->base.gem.obj));
+		pvr_vm_gpuva_link(ctx->prev_va);
+		ctx->prev_va = NULL;
+	}
+
+	if (op->remap.next) {
+		pvr_gem_object_get(gem_to_pvr_gem(ctx->next_va->base.gem.obj));
+		pvr_vm_gpuva_link(ctx->next_va);
+		ctx->next_va = NULL;
+	}
+
+	pvr_vm_gpuva_unlink(ctx, to_pvr_vm_gpuva(op->remap.unmap->va));
+
+	return 0;
+}
+
+/*
+ * Public API
+ *
+ * For an overview of these functions, see *DOC: Public API* in "pvr_vm.h".
+ */
+
+/**
+ * pvr_device_addr_is_valid() - Tests whether a device-virtual address
+ *                              is valid.
+ * @device_addr: Virtual device address to test.
+ *
+ * Return:
+ *  * %true if @device_addr is within the valid range for a device page
+ *    table and is aligned to the device page size, or
+ *  * %false otherwise.
+ */
+bool
+pvr_device_addr_is_valid(u64 device_addr)
+{
+	return (device_addr & ~PVR_PAGE_TABLE_ADDR_MASK) == 0 &&
+	       (device_addr & ~PVR_DEVICE_PAGE_MASK) == 0;
+}
+
+/**
+ * pvr_device_addr_and_size_are_valid() - Tests whether a device-virtual
+ * address and associated size are both valid.
+ * @device_addr: Virtual device address to test.
+ * @size: Size of the range based at @device_addr to test.
+ *
+ * Calling pvr_device_addr_is_valid() twice (once on @size, and again on
+ * @device_addr + @size) to verify a device-virtual address range initially
+ * seems intuitive, but it produces a false-negative when the address range
+ * is right at the end of device-virtual address space.
+ *
+ * This function catches that corner case, as well as checking that
+ * @size is non-zero.
+ *
+ * Return:
+ *  * %true if @device_addr is device page aligned; @size is device page
+ *    aligned; the range specified by @device_addr and @size is within the
+ *    bounds of the device-virtual address space, and @size is non-zero, or
+ *  * %false otherwise.
+ */
+bool
+pvr_device_addr_and_size_are_valid(u64 device_addr, u64 size)
+{
+	return pvr_device_addr_is_valid(device_addr) &&
+	       size != 0 && (size & ~PVR_DEVICE_PAGE_MASK) == 0 &&
+	       (device_addr + size <= PVR_PAGE_TABLE_ADDR_SPACE_SIZE);
+}
+
+static const struct drm_gpuvm_ops pvr_vm_gpuva_ops = {
+	.sm_step_map = pvr_vm_gpuva_map,
+	.sm_step_remap = pvr_vm_gpuva_remap,
+	.sm_step_unmap = pvr_vm_gpuva_unmap,
+};
+
+/**
+ * pvr_vm_create_context() - Create a new VM context.
+ * @pvr_dev: Target PowerVR device.
+ * @is_userspace_context: %true if this context is for userspace. This will
+ *                        create a firmware memory context for the VM context
+ *                        and disable warnings when tearing down mappings.
+ *
+ * Return:
+ *  * A handle to the newly-minted VM context on success,
+ *  * -%EINVAL if the feature "virtual address space bits" on @pvr_dev is
+ *    missing or has an unsupported value,
+ *  * -%ENOMEM if allocation of the structure behind the opaque handle fails,
+ *    or
+ *  * Any error encountered while setting up internal structures.
+ */
+struct pvr_vm_context *
+pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	struct pvr_vm_context *vm_ctx;
+	u16 device_addr_bits;
+
+	int err;
+
+	err = PVR_FEATURE_VALUE(pvr_dev, virtual_address_space_bits,
+				&device_addr_bits);
+	if (err) {
+		drm_err(drm_dev,
+			"Failed to get device virtual address space bits\n");
+		return ERR_PTR(err);
+	}
+
+	if (device_addr_bits != PVR_PAGE_TABLE_ADDR_BITS) {
+		drm_err(drm_dev,
+			"Device has unsupported virtual address space size\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	vm_ctx = kzalloc(sizeof(*vm_ctx), GFP_KERNEL);
+	if (!vm_ctx)
+		return ERR_PTR(-ENOMEM);
+
+	vm_ctx->pvr_dev = pvr_dev;
+	kref_init(&vm_ctx->ref_count);
+	mutex_init(&vm_ctx->lock);
+
+	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
+		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
+		       0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
+
+	vm_ctx->mmu_ctx = pvr_mmu_context_create(pvr_dev);
+	err = PTR_ERR_OR_ZERO(&vm_ctx->mmu_ctx);
+	if (err) {
+		vm_ctx->mmu_ctx = NULL;
+		goto err_put_ctx;
+	}
+
+	if (is_userspace_context) {
+		/* TODO: Create FW mem context */
+		err = -ENODEV;
+		goto err_put_ctx;
+	}
+
+	return vm_ctx;
+
+err_put_ctx:
+	pvr_vm_context_put(vm_ctx);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * pvr_vm_context_release() - Teardown a VM context.
+ * @ref_count: Pointer to reference counter of the VM context.
+ *
+ * This function ensures that no mappings are left dangling by unmapping them
+ * all in order of ascending device-virtual address.
+ */
+static void
+pvr_vm_context_release(struct kref *ref_count)
+{
+	struct pvr_vm_context *vm_ctx =
+		container_of(ref_count, struct pvr_vm_context, ref_count);
+
+	/* TODO: Destroy FW mem context */
+	WARN_ON(vm_ctx->fw_mem_ctx_obj);
+
+	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
+			     vm_ctx->gpuvm_mgr.mm_range));
+
+	drm_gpuvm_destroy(&vm_ctx->gpuvm_mgr);
+	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
+	mutex_destroy(&vm_ctx->lock);
+
+	kfree(vm_ctx);
+}
+
+/**
+ * pvr_vm_context_lookup() - Look up VM context from handle
+ * @pvr_file: Pointer to pvr_file structure.
+ * @handle: Object handle.
+ *
+ * Takes reference on VM context object. Call pvr_vm_context_put() to release.
+ *
+ * Returns:
+ *  * The requested object on success, or
+ *  * %NULL on failure (object does not exist in list, or is not a VM context)
+ */
+struct pvr_vm_context *
+pvr_vm_context_lookup(struct pvr_file *pvr_file, u32 handle)
+{
+	struct pvr_vm_context *vm_ctx;
+
+	xa_lock(&pvr_file->vm_ctx_handles);
+	vm_ctx = xa_load(&pvr_file->vm_ctx_handles, handle);
+	if (vm_ctx)
+		kref_get(&vm_ctx->ref_count);
+
+	xa_unlock(&pvr_file->vm_ctx_handles);
+
+	return vm_ctx;
+}
+
+/**
+ * pvr_vm_context_put() - Release a reference on a VM context
+ * @vm_ctx: Target VM context.
+ *
+ * Returns:
+ *  * %true if the VM context was destroyed, or
+ *  * %false if there are any references still remaining.
+ */
+bool
+pvr_vm_context_put(struct pvr_vm_context *vm_ctx)
+{
+	WARN_ON(!vm_ctx);
+
+	if (vm_ctx)
+		return kref_put(&vm_ctx->ref_count, pvr_vm_context_release);
+
+	return true;
+}
+
+/**
+ * pvr_destroy_vm_contexts_for_file: Destroy any VM contexts associated with the
+ * given file.
+ * @pvr_file: Pointer to pvr_file structure.
+ *
+ * Removes all vm_contexts associated with @pvr_file from the device VM context
+ * list and drops initial references. vm_contexts will then be destroyed once
+ * all outstanding references are dropped.
+ */
+void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
+{
+	struct pvr_vm_context *vm_ctx;
+	unsigned long handle;
+
+	xa_for_each(&pvr_file->vm_ctx_handles, handle, vm_ctx) {
+		/* vm_ctx is not used here because that would create a race with xa_erase */
+		pvr_vm_context_put(xa_erase(&pvr_file->vm_ctx_handles, handle));
+	}
+}
+
+/**
+ * pvr_vm_map() - Map a section of physical memory into a section of device-virtual memory.
+ * @vm_ctx: Target VM context.
+ * @pvr_obj: Target PowerVR memory object.
+ * @pvr_obj_offset: Offset into @pvr_obj to map from.
+ * @device_addr: Virtual device address at the start of the requested mapping.
+ * @size: Size of the requested mapping.
+ *
+ * No handle is returned to represent the mapping. Instead, callers should
+ * remember @device_addr and use that as a handle.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if @device_addr is not a valid page-aligned device-virtual
+ *    address; the region specified by @pvr_obj_offset and @size does not fall
+ *    entirely within @pvr_obj, or any part of the specified region of @pvr_obj
+ *    is not device-virtual page-aligned,
+ *  * Any error encountered while performing internal operations required to
+ *    destroy the mapping (returned from pvr_vm_gpuva_map or
+ *    pvr_vm_gpuva_remap).
+ */
+int
+pvr_vm_map(struct pvr_vm_context *vm_ctx,
+	   struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
+	   u64 device_addr, u64 size)
+{
+	const size_t pvr_obj_size = pvr_gem_object_size(pvr_obj);
+	struct pvr_vm_gpuva_op_ctx op_ctx = { .vm_ctx = vm_ctx };
+	struct pvr_vm_gpuva *gpuva, *tmp_gpuva;
+	struct sg_table *sgt;
+	int err;
+
+	if (!pvr_device_addr_and_size_are_valid(device_addr, size) ||
+	    pvr_obj_offset & ~PAGE_MASK || size & ~PAGE_MASK ||
+	    pvr_obj_offset + size > pvr_obj_size ||
+	    pvr_obj_offset > pvr_obj_size) {
+		return -EINVAL;
+	}
+
+	INIT_LIST_HEAD(&op_ctx.returned_gpuvas);
+
+	op_ctx.new_va = kzalloc(sizeof(*op_ctx.new_va), GFP_KERNEL);
+	op_ctx.prev_va = kzalloc(sizeof(*op_ctx.prev_va), GFP_KERNEL);
+	op_ctx.next_va = kzalloc(sizeof(*op_ctx.next_va), GFP_KERNEL);
+	if (!op_ctx.new_va || !op_ctx.prev_va || !op_ctx.next_va) {
+		err = -ENOMEM;
+		goto out_free;
+	}
+
+	pvr_vm_gpuva_mapping_init(op_ctx.new_va);
+	pvr_vm_gpuva_mapping_init(op_ctx.prev_va);
+	pvr_vm_gpuva_mapping_init(op_ctx.next_va);
+
+	sgt = pvr_gem_object_get_pages_sgt(pvr_obj);
+	err = PTR_ERR_OR_ZERO(sgt);
+	if (err)
+		goto out_free;
+
+	op_ctx.mmu_op_ctx = pvr_mmu_op_context_create(vm_ctx->mmu_ctx, sgt,
+						      pvr_obj_offset, size);
+	err = PTR_ERR_OR_ZERO(op_ctx.mmu_op_ctx);
+	if (err) {
+		op_ctx.mmu_op_ctx = NULL;
+		goto out_mmu_op_ctx_destroy;
+	}
+
+	pvr_gem_object_get(pvr_obj);
+	op_ctx.pvr_obj = pvr_obj;
+
+	mutex_lock(&vm_ctx->lock);
+	err = drm_gpuvm_sm_map(&vm_ctx->gpuvm_mgr, &op_ctx, device_addr, size,
+			       gem_from_pvr_gem(pvr_obj), pvr_obj_offset);
+	mutex_unlock(&vm_ctx->lock);
+
+	pvr_gem_object_put(op_ctx.pvr_obj);
+
+out_mmu_op_ctx_destroy:
+	pvr_mmu_op_context_destroy(op_ctx.mmu_op_ctx);
+
+out_free:
+	kfree(op_ctx.next_va);
+	kfree(op_ctx.prev_va);
+	kfree(op_ctx.new_va);
+
+	list_for_each_entry_safe(gpuva, tmp_gpuva, &op_ctx.returned_gpuvas,
+				 node) {
+		drm_gem_object_put(gpuva->base.gem.obj);
+		list_del(&gpuva->node);
+		kfree(gpuva);
+	}
+
+	return err;
+}
+
+/**
+ * pvr_vm_unmap() - Unmap an already mapped section of device-virtual memory.
+ * @vm_ctx: Target VM context.
+ * @device_addr: Virtual device address at the start of the target mapping.
+ * @size: Size of the target mapping.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if @device_addr is not a valid page-aligned device-virtual
+ *    address,
+ *  * Any error encountered while performing internal operations required to
+ *    destroy the mapping (returned from pvr_vm_gpuva_unmap or
+ *    pvr_vm_gpuva_remap).
+ */
+int
+pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
+{
+	struct pvr_vm_gpuva_op_ctx op_ctx = { .vm_ctx = vm_ctx };
+	struct pvr_vm_gpuva *gpuva, *tmp_gpuva;
+	int err;
+
+	if (!pvr_device_addr_and_size_are_valid(device_addr, size))
+		return -EINVAL;
+
+	INIT_LIST_HEAD(&op_ctx.returned_gpuvas);
+
+	op_ctx.prev_va = kzalloc(sizeof(*op_ctx.prev_va), GFP_KERNEL);
+	op_ctx.next_va = kzalloc(sizeof(*op_ctx.next_va), GFP_KERNEL);
+	if (!op_ctx.prev_va || !op_ctx.next_va) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	pvr_vm_gpuva_mapping_init(op_ctx.prev_va);
+	pvr_vm_gpuva_mapping_init(op_ctx.next_va);
+
+	op_ctx.mmu_op_ctx =
+		pvr_mmu_op_context_create(vm_ctx->mmu_ctx, NULL, 0, 0);
+	err = PTR_ERR_OR_ZERO(op_ctx.mmu_op_ctx);
+	if (err) {
+		op_ctx.mmu_op_ctx = NULL;
+		goto out;
+	}
+
+	mutex_lock(&vm_ctx->lock);
+	err = drm_gpuvm_sm_unmap(&vm_ctx->gpuvm_mgr, &op_ctx, device_addr, size);
+	mutex_unlock(&vm_ctx->lock);
+
+out:
+	pvr_mmu_op_context_destroy(op_ctx.mmu_op_ctx);
+	kfree(op_ctx.next_va);
+	kfree(op_ctx.prev_va);
+
+	list_for_each_entry_safe(gpuva, tmp_gpuva, &op_ctx.returned_gpuvas,
+				 node) {
+		drm_gem_object_put(gpuva->base.gem.obj);
+		list_del(&gpuva->node);
+		kfree(gpuva);
+	}
+
+	return err;
+}
+
+/* Static data areas are determined by firmware. */
+static const struct drm_pvr_static_data_area static_data_areas[] = {
+	{
+		.area_usage = DRM_PVR_STATIC_DATA_AREA_FENCE,
+		.location_heap_id = DRM_PVR_HEAP_GENERAL,
+		.offset = 0,
+		.size = 128,
+	},
+	{
+		.area_usage = DRM_PVR_STATIC_DATA_AREA_YUV_CSC,
+		.location_heap_id = DRM_PVR_HEAP_GENERAL,
+		.offset = 128,
+		.size = 1024,
+	},
+	{
+		.area_usage = DRM_PVR_STATIC_DATA_AREA_VDM_SYNC,
+		.location_heap_id = DRM_PVR_HEAP_PDS_CODE_DATA,
+		.offset = 0,
+		.size = 128,
+	},
+	{
+		.area_usage = DRM_PVR_STATIC_DATA_AREA_EOT,
+		.location_heap_id = DRM_PVR_HEAP_PDS_CODE_DATA,
+		.offset = 128,
+		.size = 128,
+	},
+	{
+		.area_usage = DRM_PVR_STATIC_DATA_AREA_VDM_SYNC,
+		.location_heap_id = DRM_PVR_HEAP_USC_CODE,
+		.offset = 0,
+		.size = 128,
+	},
+};
+
+#define GET_RESERVED_SIZE(last_offset, last_size) round_up((last_offset) + (last_size), PAGE_SIZE)
+
+/*
+ * The values given to GET_RESERVED_SIZE() are taken from the last entry in the corresponding
+ * static data area for each heap.
+ */
+static const struct drm_pvr_heap pvr_heaps[] = {
+	[DRM_PVR_HEAP_GENERAL] = {
+		.base = ROGUE_GENERAL_HEAP_BASE,
+		.size = ROGUE_GENERAL_HEAP_SIZE,
+		.flags = 0,
+		.page_size_log2 = PVR_DEVICE_PAGE_SHIFT,
+	},
+	[DRM_PVR_HEAP_PDS_CODE_DATA] = {
+		.base = ROGUE_PDSCODEDATA_HEAP_BASE,
+		.size = ROGUE_PDSCODEDATA_HEAP_SIZE,
+		.flags = 0,
+		.page_size_log2 = PVR_DEVICE_PAGE_SHIFT,
+	},
+	[DRM_PVR_HEAP_USC_CODE] = {
+		.base = ROGUE_USCCODE_HEAP_BASE,
+		.size = ROGUE_USCCODE_HEAP_SIZE,
+		.flags = 0,
+		.page_size_log2 = PVR_DEVICE_PAGE_SHIFT,
+	},
+	[DRM_PVR_HEAP_RGNHDR] = {
+		.base = ROGUE_RGNHDR_HEAP_BASE,
+		.size = ROGUE_RGNHDR_HEAP_SIZE,
+		.flags = 0,
+		.page_size_log2 = PVR_DEVICE_PAGE_SHIFT,
+	},
+	[DRM_PVR_HEAP_VIS_TEST] = {
+		.base = ROGUE_VISTEST_HEAP_BASE,
+		.size = ROGUE_VISTEST_HEAP_SIZE,
+		.flags = 0,
+		.page_size_log2 = PVR_DEVICE_PAGE_SHIFT,
+	},
+	[DRM_PVR_HEAP_TRANSFER_FRAG] = {
+		.base = ROGUE_TRANSFER_FRAG_HEAP_BASE,
+		.size = ROGUE_TRANSFER_FRAG_HEAP_SIZE,
+		.flags = 0,
+		.page_size_log2 = PVR_DEVICE_PAGE_SHIFT,
+	},
+};
+
+int
+pvr_static_data_areas_get(const struct pvr_device *pvr_dev,
+			  struct drm_pvr_ioctl_dev_query_args *args)
+{
+	struct drm_pvr_dev_query_static_data_areas query = {0};
+	int err;
+
+	if (!args->pointer) {
+		args->size = sizeof(struct drm_pvr_dev_query_static_data_areas);
+		return 0;
+	}
+
+	err = PVR_UOBJ_GET(query, args->size, args->pointer);
+	if (err < 0)
+		return err;
+
+	if (!query.static_data_areas.array) {
+		query.static_data_areas.count = ARRAY_SIZE(static_data_areas);
+		query.static_data_areas.stride = sizeof(struct drm_pvr_static_data_area);
+		goto copy_out;
+	}
+
+	if (query.static_data_areas.count > ARRAY_SIZE(static_data_areas))
+		query.static_data_areas.count = ARRAY_SIZE(static_data_areas);
+
+	err = PVR_UOBJ_SET_ARRAY(&query.static_data_areas, static_data_areas);
+	if (err < 0)
+		return err;
+
+copy_out:
+	err = PVR_UOBJ_SET(args->pointer, args->size, query);
+	if (err < 0)
+		return err;
+
+	args->size = sizeof(query);
+	return 0;
+}
+
+int
+pvr_heap_info_get(const struct pvr_device *pvr_dev,
+		  struct drm_pvr_ioctl_dev_query_args *args)
+{
+	struct drm_pvr_dev_query_heap_info query = {0};
+	u64 dest;
+	int err;
+
+	if (!args->pointer) {
+		args->size = sizeof(struct drm_pvr_dev_query_heap_info);
+		return 0;
+	}
+
+	err = PVR_UOBJ_GET(query, args->size, args->pointer);
+	if (err < 0)
+		return err;
+
+	if (!query.heaps.array) {
+		query.heaps.count = ARRAY_SIZE(pvr_heaps);
+		query.heaps.stride = sizeof(struct drm_pvr_heap);
+		goto copy_out;
+	}
+
+	if (query.heaps.count > ARRAY_SIZE(pvr_heaps))
+		query.heaps.count = ARRAY_SIZE(pvr_heaps);
+
+	/* Region header heap is only present if BRN63142 is present. */
+	dest = query.heaps.array;
+	for (size_t i = 0; i < query.heaps.count; i++) {
+		struct drm_pvr_heap heap = pvr_heaps[i];
+
+		if (i == DRM_PVR_HEAP_RGNHDR && !PVR_HAS_QUIRK(pvr_dev, 63142))
+			heap.size = 0;
+
+		err = PVR_UOBJ_SET(dest, query.heaps.stride, heap);
+		if (err < 0)
+			return err;
+
+		dest += query.heaps.stride;
+	}
+
+copy_out:
+	err = PVR_UOBJ_SET(args->pointer, args->size, query);
+	if (err < 0)
+		return err;
+
+	args->size = sizeof(query);
+	return 0;
+}
+
+/**
+ * pvr_heap_contains_range() - Determine if a given heap contains the specified
+ *                             device-virtual address range.
+ * @pvr_heap: Target heap.
+ * @start: Inclusive start of the target range.
+ * @end: Inclusive end of the target range.
+ *
+ * It is an error to call this function with values of @start and @end that do
+ * not satisfy the condition @start <= @end.
+ */
+static __always_inline bool
+pvr_heap_contains_range(const struct drm_pvr_heap *pvr_heap, u64 start, u64 end)
+{
+	return pvr_heap->base <= start && end < pvr_heap->base + pvr_heap->size;
+}
+
+/**
+ * pvr_find_heap_containing() - Find a heap which contains the specified
+ *                              device-virtual address range.
+ * @pvr_dev: Target PowerVR device.
+ * @start: Start of the target range.
+ * @size: Size of the target range.
+ *
+ * Return:
+ *  * A pointer to a constant instance of struct drm_pvr_heap representing the
+ *    heap containing the entire range specified by @start and @size on
+ *    success, or
+ *  * %NULL if no such heap exists.
+ */
+const struct drm_pvr_heap *
+pvr_find_heap_containing(struct pvr_device *pvr_dev, u64 start, u64 size)
+{
+	u64 end;
+
+	if (check_add_overflow(start, size - 1, &end))
+		return NULL;
+
+	/*
+	 * There are no guarantees about the order of address ranges in
+	 * &pvr_heaps, so iterate over the entire array for a heap whose
+	 * range completely encompasses the given range.
+	 */
+	for (u32 heap_id = 0; heap_id < ARRAY_SIZE(pvr_heaps); heap_id++) {
+		/* Filter heaps that present only with an associated quirk */
+		if (heap_id == DRM_PVR_HEAP_RGNHDR &&
+		    !PVR_HAS_QUIRK(pvr_dev, 63142)) {
+			continue;
+		}
+
+		if (pvr_heap_contains_range(&pvr_heaps[heap_id], start, end))
+			return &pvr_heaps[heap_id];
+	}
+
+	return NULL;
+}
+
+/**
+ * pvr_vm_find_gem_object() - Look up a buffer object from a given
+ *                            device-virtual address.
+ * @vm_ctx: [IN] Target VM context.
+ * @device_addr: [IN] Virtual device address at the start of the required
+ *               object.
+ * @mapped_offset_out: [OUT] Pointer to location to write offset of the start
+ *                     of the mapped region within the buffer object. May be
+ *                     %NULL if this information is not required.
+ * @mapped_size_out: [OUT] Pointer to location to write size of the mapped
+ *                   region. May be %NULL if this information is not required.
+ *
+ * If successful, a reference will be taken on the buffer object. The caller
+ * must drop the reference with pvr_gem_object_put().
+ *
+ * Return:
+ *  * The PowerVR buffer object mapped at @device_addr if one exists, or
+ *  * %NULL otherwise.
+ */
+struct pvr_gem_object *
+pvr_vm_find_gem_object(struct pvr_vm_context *vm_ctx, u64 device_addr,
+		       u64 *mapped_offset_out, u64 *mapped_size_out)
+{
+	struct pvr_gem_object *pvr_obj;
+	struct drm_gpuva *va;
+
+	mutex_lock(&vm_ctx->lock);
+
+	va = drm_gpuva_find_first(&vm_ctx->gpuvm_mgr, device_addr, 1);
+	if (!va)
+		goto err_unlock;
+
+	pvr_obj = gem_to_pvr_gem(va->gem.obj);
+	pvr_gem_object_get(pvr_obj);
+
+	if (mapped_offset_out)
+		*mapped_offset_out = va->gem.offset;
+	if (mapped_size_out)
+		*mapped_size_out = va->va.range;
+
+	mutex_unlock(&vm_ctx->lock);
+
+	return pvr_obj;
+
+err_unlock:
+	mutex_unlock(&vm_ctx->lock);
+
+	return NULL;
+}
+
+/**
+ * pvr_vm_get_fw_mem_context: Get object representing firmware memory context
+ * @vm_ctx: Target VM context.
+ *
+ * Returns:
+ *  * FW object representing firmware memory context, or
+ *  * %NULL if this VM context does not have a firmware memory context.
+ */
+struct pvr_fw_object *
+pvr_vm_get_fw_mem_context(struct pvr_vm_context *vm_ctx)
+{
+	return vm_ctx->fw_mem_ctx_obj;
+}
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagination/pvr_vm.h
new file mode 100644
index 000000000000..b98bc3981807
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_VM_H
+#define PVR_VM_H
+
+#include "pvr_rogue_mmu_defs.h"
+
+#include <uapi/drm/pvr_drm.h>
+
+#include <linux/types.h>
+
+/* Forward declaration from "pvr_device.h" */
+struct pvr_device;
+struct pvr_file;
+
+/* Forward declaration from "pvr_gem.h" */
+struct pvr_gem_object;
+
+/* Forward declaration from "pvr_vm.c" */
+struct pvr_vm_context;
+
+/* Forward declaration from <uapi/drm/pvr_drm.h> */
+struct drm_pvr_ioctl_get_heap_info_args;
+
+/* Functions defined in pvr_vm.c */
+
+bool pvr_device_addr_is_valid(u64 device_addr);
+bool pvr_device_addr_and_size_are_valid(u64 device_addr, u64 size);
+
+struct pvr_vm_context *pvr_vm_create_context(struct pvr_device *pvr_dev,
+					     bool is_userspace_context);
+
+int pvr_vm_map(struct pvr_vm_context *vm_ctx,
+	       struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
+	       u64 device_addr, u64 size);
+int pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size);
+
+dma_addr_t pvr_vm_get_page_table_root_addr(struct pvr_vm_context *vm_ctx);
+
+int pvr_static_data_areas_get(const struct pvr_device *pvr_dev,
+			      struct drm_pvr_ioctl_dev_query_args *args);
+int pvr_heap_info_get(const struct pvr_device *pvr_dev,
+		      struct drm_pvr_ioctl_dev_query_args *args);
+const struct drm_pvr_heap *pvr_find_heap_containing(struct pvr_device *pvr_dev,
+						    u64 addr, u64 size);
+
+struct pvr_gem_object *pvr_vm_find_gem_object(struct pvr_vm_context *vm_ctx,
+					      u64 device_addr,
+					      u64 *mapped_offset_out,
+					      u64 *mapped_size_out);
+
+struct pvr_fw_object *
+pvr_vm_get_fw_mem_context(struct pvr_vm_context *vm_ctx);
+
+struct pvr_vm_context *pvr_vm_context_lookup(struct pvr_file *pvr_file, u32 handle);
+bool pvr_vm_context_put(struct pvr_vm_context *vm_ctx);
+void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file);
+
+#endif /* PVR_VM_H */
-- 
2.42.0


