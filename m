Return-Path: <linux-doc+bounces-728-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5F7D18D8
	for <lists+linux-doc@lfdr.de>; Sat, 21 Oct 2023 00:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7562E28261B
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 22:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA9530D11;
	Fri, 20 Oct 2023 22:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f//xyCVl"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72BE24A17
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 22:06:30 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7660CD5A
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 15:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faChtodxNgo2qASkSvr3aHfkyw0HFFKax47eS+6HHKJhiWa/1Jx5HtdaTfEnSvu1LjnQC/4rmDwcigILmESib4pFucofyibAOyJpwW/EAg8Ctyr4iL052Uv26BDIGdcHyshOFl4PnQsJuKK1Dk59tR7qzRKIzAle56Ta77Jw3Uni+YvOXdwkGXRJeqr7vehUOeSx3EI8eU0DHagYdTGOv5W+con+vIEpsbryjg9HUcjcKgHghdUEwhKqj5iq+U2ZTp5IMS7qoSfxBzLfmL5zavlz2EB4q4CqUpkgX6SKbMWOL8etJZUr5BPhdyZCoGN8YzQ9PHqYVJv4deRisjJIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2+GAPTJqOgVccyUMiQJ0m2xvY6fdLAtvxSIBfeSKR8=;
 b=hBr0h9vul76BbsP2Sb5bvmJn518OLw1Jv6+H2t+OspDDpiI0D4im+PYWsRQqaI/WFdWZTxkP7isj2N9sA7pZDwrshLQ69YEUhVP2N91bbWN4KeqQksTBVx48VSm9U5SrlhY5r8khTlHHesfNL9KmxwhSkg3x6sf7D9I5QWGtHND954/7BOpsvHaVMLiEtd9Ku/z0+ax+VYmku1GQtnE6ZCv4sE2/8ZGBX1HOyGgiWZoZ3SbAW0t0MprfR3FgU12RH9aGw3ioelw6lPJQ/uCBTT0+otFzS72NLY+Vd+ebIU0cHpVbXlXQ3A9IhZzO2GKaXZD5E5XTJCWINUoX7KlEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2+GAPTJqOgVccyUMiQJ0m2xvY6fdLAtvxSIBfeSKR8=;
 b=f//xyCVlfVvIxS6wCRwhr5JdtC5Lf5xbobXLuAi0iOgzEBF3xpkiEqn97NHlzW0aENSOncWZXu5x2kjCQ+FpzBugJUa6l+9i/yGZxASSrOZj1+qJivOFEdCx1yyS7dnePoHKuPkCAZ1ES1V5K/v5NQK7jP92IEFH8TVsjMhHzE4=
Received: from MN2PR22CA0017.namprd22.prod.outlook.com (2603:10b6:208:238::22)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:130::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 22:06:27 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::fb) by MN2PR22CA0017.outlook.office365.com
 (2603:10b6:208:238::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Fri, 20 Oct 2023 22:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 22:06:26 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 17:06:10 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <linux-doc@vger.kernel.org>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH 0/8] Expand and improve AMDGPU documentation
Date: Fri, 20 Oct 2023 16:05:13 -0600
Message-ID: <20231020220549.493808-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: e05eee7a-9a5c-4d96-a15f-08dbd1b8ce72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ard9gX8/qvx3394xK+0QgZnktq9fzgSfHYLFrMFE4uEQyxgc5fJpWfKm5nv2ZLvTeT8lL9isjKbHhtMGSEo8iWUCpTGkmLb1hNV8EIc87hAdkrRK3K9yRa5yPLfHeQsB5AeTM74SPgnbIoI0TMF3rHD7O1hD7IKjz7O99+CLN+3+lT0A9ujd2dGennQOo877Oh/x6WNVIHY3p/mtNYiNUKCQ8ZvKNxjxCNlub6McyF3OyY3aa2MdPrGoyO0A7MHg3FKRlkLryh7YGfufMnrFZl9hbCKy48OkSpJmBRym9B5aM604os8eqWcCphQnvqIVjMxWLBaVIiJcm1qqUhggvrEOpKQ4pnwVSXl3tDhc+ZzuXSa2kNtLWbjPby9bJLb+o2wdyHb7SnSChRY7IYIN6FVsfnL5KWJcX+0VMJZwMq1nVY2N32r687HoVoFYXg3Vxyr5yTrdA8oYxIWsFoPGDUr/CdNYM+rfb3Bw9KknMz0a/5ZQVEOsJ9cl7bMBJshrOBQuWaQH5j+mbVyWH9YRFtzjI2/PSy0H10VLqaVUC+POviReVyFlyzHw+iyMZVc3G6T+Q+2me9yObaoRhPS0VoLl9JaS6ZJwMwHV6ipNylZRVg7YMne1avGS27euZpAmoj2gykbuwXLBM6NuNPJXaTLWNS8KCEz8n0ty8ia3XawxpihF4Csgax8ypvTfsdQpW4ZTNtjvkbazU9OEJJmK0EoZE9GcLOSd3f4f7Z/2cQPWqHFknl39g/LJqw/gv5qUhxO7jk4numeFMld6kLb+7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(4326008)(40460700003)(86362001)(47076005)(36756003)(5660300002)(41300700001)(2906002)(81166007)(1076003)(356005)(40480700001)(16526019)(336012)(426003)(82740400003)(36860700001)(26005)(83380400001)(2616005)(8936002)(8676002)(478600001)(110136005)(70586007)(70206006)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 22:06:26.9769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e05eee7a-9a5c-4d96-a15f-08dbd1b8ce72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704

This patchset improves how the AMDGPU display documentation is
organized, expands the kerne-doc to extract information from the source,
and adds more context about DC workflow. Finally, at the end of this
series, we also introduce a contribution session for those interested in
contributing with the display code.

Thanks
Siqueira

Rodrigo Siqueira (8):
  Documentation/gpu: Add basic page for HUBP
  Documentation/gpu: Add simple doc page for DCHUBBUB
  Documentation/gpu: Add kernel doc entry for DPP
  Documentation/gpu: Add kernel doc entry for MPC
  Documentation/gpu: Add entry for OPP in the kernel doc
  Documentation/gpu: Add entry for the DIO component
  Documentation/gpu: Add an explanation about the DC weekly patches
  Documentation/gpu: Introduce a simple contribution list for display
    code

 .../gpu/amdgpu/display/dcn-blocks.rst         |  78 ++++++
 .../amdgpu/display/display-contributing.rst   |  88 +++++++
 Documentation/gpu/amdgpu/display/index.rst    | 114 +++++++-
 drivers/gpu/drm/amd/display/TODO              | 110 --------
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |   6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  26 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |  13 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 248 ++++++++++++------
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h   |  16 ++
 .../amd/display/dc/link/hwss/link_hwss_dio.h  |  10 +
 10 files changed, 520 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/dcn-blocks.rst
 create mode 100644 Documentation/gpu/amdgpu/display/display-contributing.rst
 delete mode 100644 drivers/gpu/drm/amd/display/TODO

-- 
2.42.0


