Return-Path: <linux-doc+bounces-7222-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D0837535
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 22:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C8741F27E7A
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 21:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03BA40BEE;
	Mon, 22 Jan 2024 21:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ArFf3TaD"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C503DB92
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705958895; cv=fail; b=BXMjfgqLdc4HfeZkj35UweeC2pPBUn+/ZCYwJwh8bRB2xQtss6Fy7xGq5uAGmNos/lPRyDeHs+waTkDLJ7Q1zXIhAgs/WrwB47vmGsvO6+2hdN+N+LmW2q9jvLi08TwkRUdZF3WJHxoCytpWEiAUOoIK9urjSlQZdIOqLpu1Fiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705958895; c=relaxed/simple;
	bh=ENF+py1juUC9lhVankg8gxTucn31MQa5yvDcTlupqs8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkwW9Wakl2mZwooUNFE1CjUNwWQttYWsQ+oqny6oOnY5tTeWvgK6ZCb9ZvHR4RkUlRXCUsZU9ZfSotVjp9iYOC6FljbBUdBPofJ+0On5xbGVLYOMu/c995a75d93ENIAGRwDpPgnFVgCwRSIEz3abvnn009MASgP2XtzwsMVkpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ArFf3TaD; arc=fail smtp.client-ip=40.107.223.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6DuWAdgPNQS/T5+ornEYmeA1CCK0Fq4xRQUbja/DHcpDCNa+lzJjd5ni0nQ+MAedPE2u49A4KoJQgYwj1cBlgkE4WRP2YjwPq+PapkvS1ef3LDzzGqDSewdw7x06nFAd+Z+NmOytilhH/sEYZbKHHlyjmDpdns2+6b3IJx/tXHpU0C7o1ME6jVORFAluiPZZMmP8GyqWi6ksIGAmNqifK0GN78QyxO4BgfabkV4JXdM/SaAgxhfpSzdXusoCQ+bBIIBZhbNqfBxrBW2gGdG1O3bC47N0ih0iUEV1G2Ex79785dw0JW6YCgVnboaodXcVM1yHcnYo0XSSkMe1px+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehwkPc29H3G0iigQ4s5yxs1+hrJMirPlhAmommRCUbo=;
 b=hCDIgn3MZLG7IVHatKGI4UdY2l3MRJFspmQ5TN8mQMK2AFjqQeyJXTtvEqVTeGUxq9O04JCurANJbh5+tpSG2qQo0DA6hmrODrDk31gLbPIBFCs4nLOicRfUvgAZzOtYaXJHNd87kOqH75bef5eFt3j0qY6PySR22Ivkj6tjQUHaz71ty1ERFfbCGWBHaKLwtaWor2AUeDSE/Me9tEDPbvUVlHUtWYAMkAPo2lAOWOYYmmbgOKaCyhyHrC+BmmCa8Jb7TPVHYU5FIGnHPLXL8Qo92Lu0Qps/GNaeX/Sp6z/2FJyQ2d10B0iMS1WPhVhCy/EVO1UaTC1sk7dIYYBQaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehwkPc29H3G0iigQ4s5yxs1+hrJMirPlhAmommRCUbo=;
 b=ArFf3TaDEiOch/SBd+c1vSpQDqY/KjvJKoS7cDU+EuM2tJOEec8RcbLThUW4kqvZ7eH3Wng/KO1pDBzMP7Akj38UNfNcaqd7OmuQyK+mQE7ei+SMANK/pxrUhTXBQCVCA4GFFdSxnhaWaFxXMB9HB/pJMdY8Oa6xYrMF9wQ4tj0=
Received: from BL1PR13CA0146.namprd13.prod.outlook.com (2603:10b6:208:2bb::31)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Mon, 22 Jan
 2024 21:28:11 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::8f) by BL1PR13CA0146.outlook.office365.com
 (2603:10b6:208:2bb::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.17 via Frontend
 Transport; Mon, 22 Jan 2024 21:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 21:28:11 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 15:28:09 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Harry Wentland
	<harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Hamza Mahfooz
	<hamza.mahfooz@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
CC: <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>, "Rodrigo
 Siqueira" <Rodrigo.Siqueira@amd.com>, Harry Wentland <Harry.Wentland@amd.com>
Subject: [PATCH v2 2/8] Documentation/gpu: Add simple doc page for DCHUBBUB
Date: Mon, 22 Jan 2024 14:24:55 -0700
Message-ID: <20240122212719.647008-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122212719.647008-1-Rodrigo.Siqueira@amd.com>
References: <20240122212719.647008-1-Rodrigo.Siqueira@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2f1db2-0829-424c-2db8-08dc1b9108e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wPzOf6EF/bW+zdvd5zSnrnMXCl7DMeoJoZXgQyt6dyDyfZItU9XtLSM9cGlGt9gKXUbx2mAc9U98KfSf18h115JgdPm4OLyZilh2AGCkmRH02m845oMEXitTx1Ep2gItCx9c/WG7hFs0WBO/YYkYAeL5smWoAXnTRq5TwCXJ66sefEC+/MFfzATQiWJGm4jhZkqZYXBdGC3O51XgJFVXQzcHzo/lmbT89/D6SE83B2su2H6w6NaLANpnWYouOjREEDivzZaiw93iVd7jMdIErUEB49vNDJMwFd3PkxlUKyZzYDxH8SjWSm2G435DtnTz8n6QjGrXR5W+2mq7SN+EUy55sGgBaFOB5o3xcGHMOrBmI1vvIsIvLAd+UCwz1owKo/qOHMpwv1rTNqVH/hXcDsqefnKSAfcnelp3PGwqm8oPHbMLA1QUwssToOH8gan5Vd7R8zzo1sGpz1DY0WktAwpWExl2+XmBtRUJAM0suPQnykpH7A3v6FJz+udPHK59FdJ3kJWEeBJw+0cDOOrs9do7+jv9Bq2QOBum7YSygChLd7xEMDnv7qu+6k6Jwln7wNICY44v43CYksJEmWPR0Seimjq/6gZEhI6XPnKQEIcn4JEw1El0EwEJLAZbd/L60+MwolM/YfQOlCWWhmZhJwboScDLZgsoTe1YFCoCHU0ZYe/WkoTHtkE4q6CUCm1nR1Aa6j+cqKQsa16rRJkN1ZT7npWhkBO7s5BFpuAHzuhMNbGl8CUUzp8chtRFxaTegTKAxwVvLWF/Gh5gkPgegnHwmdebVu/kM/igmLP05SQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(426003)(2616005)(16526019)(336012)(66574015)(1076003)(41300700001)(26005)(47076005)(36756003)(40480700001)(40460700003)(86362001)(82740400003)(36860700001)(5660300002)(83380400001)(316002)(70586007)(70206006)(478600001)(8676002)(8936002)(4326008)(54906003)(110136005)(6666004)(356005)(81166007)(2906002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 21:28:11.2875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2f1db2-0829-424c-2db8-08dc1b9108e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353

Enable the documentation to extract code documentation from dchubbub.h
file.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/dcn-blocks.rst  | 12 ++++++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/dcn-blocks.rst b/Documentation/gpu/amdgpu/display/dcn-blocks.rst
index 5da34d5b73d8..e4e0a4ddca4e 100644
--- a/Documentation/gpu/amdgpu/display/dcn-blocks.rst
+++ b/Documentation/gpu/amdgpu/display/dcn-blocks.rst
@@ -5,6 +5,18 @@ DCN Blocks
 In this section, you will find some extra details about some of the DCN blocks
 and the code documentation when it is automatically generated.
 
+DCHUBBUB
+--------
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+   :export:
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+   :internal:
+
 HUBP
 ----
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
index 901891316dfb..2ae7484d18af 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
@@ -26,6 +26,12 @@
 #ifndef __DAL_DCHUBBUB_H__
 #define __DAL_DCHUBBUB_H__
 
+/**
+ * DOC: overview
+ *
+ * There is only one common DCHUBBUB. It contains the common request and return
+ * blocks for the Data Fabric Interface that are not clock/power gated.
+ */
 
 enum dcc_control {
 	dcc_control__256_256_xxx,
-- 
2.43.0


