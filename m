Return-Path: <linux-doc+bounces-385-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F96A7CB8BB
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 04:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BD41C20B71
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 02:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5747A5244;
	Tue, 17 Oct 2023 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NOgy8Dqh"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F02747B;
	Tue, 17 Oct 2023 02:56:10 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E84D45;
	Mon, 16 Oct 2023 19:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cD+0/xFMCrKfDOSEjl9GBGW9lIruUowKdobfxGe1JkmzNFhnRJFaaj1gI4ZnFF9TyOLq5j3KNv/GW3DCDMrFN1Ui4FEF6Npj0mnp7NyhCqCbJcFbD3tyJCk43q0XBfGeQykNTm0TB/jxHNQLM2LLYW/+7MLp85qpKCvVXFDUgcP99q4nuW2ZNkeu1bYX4MQofHujigSyulD/eBv7BG99HqhzBrSykt+zhHCqOzPQjfg1JMSxObAvR7W/5rPy9Z+px3w17+aNcgmFCRd35ZI1kptBWDgq1zqp/tHNTmr80ooaRazirzTpHvAkjM5ZrV5HRe3tET5CcVhfDcUuHdNOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6cgkUZB3K6hSFs80O98myajVY+K6slSkfVVi5DqonE=;
 b=TmaKyPoxP3d8fNcP8Q/sVZrHtSUCvk/FfpBDgDWW1T4nR4riDeZaAw+pStyE2QtFn7tcIghqulGL0AYG9UYuFbCF15mRZRQD0EDoaCre0lR73S083foemDaNQG4xG+ViBDatEbh4jM8gzMPeenMvTEQu9PDxuJ7FZOu7TajTap45g5iDGnE8EPPGPIGMCRODjXiMGSvjxYuYDekHEMGW3j+peGIYQ7x5x5s0uM13gcn6vu57Z0PKcH6RRcsg+KDkSl2GpC2jwOebCb3UMRXCDg3hvI01nTtN+dNV3Cpxkxa3WX33Z3oSMTDCKCzvU8bQA9m8GTkvEygPqVt1ovMHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6cgkUZB3K6hSFs80O98myajVY+K6slSkfVVi5DqonE=;
 b=NOgy8DqhrebzkIpNjAnF3OoOZfWRcHhE0yxjvQ9ML31MLmzkyydn3EYtkU+fjFIznEAge65luj09gAHOUaQSsW3F7NC2Do85Zl26glY7oAFeBCv5X7uL6r4XdMZXyghOFIH499BU9ttrKh0Y14TmzU8hNVgoT5L/rloUrJFLlH4=
Received: from MW4PR03CA0328.namprd03.prod.outlook.com (2603:10b6:303:dd::33)
 by CH2PR12MB5019.namprd12.prod.outlook.com (2603:10b6:610:6a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 02:55:41 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::1) by MW4PR03CA0328.outlook.office365.com
 (2603:10b6:303:dd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 02:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 02:55:41 +0000
Received: from compile-server.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 21:55:25 -0500
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <lenb@kernel.org>,
	<johannes@sipsolutions.net>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <alexander.deucher@amd.com>,
	<Lijo.Lazar@amd.com>, <mario.limonciello@amd.com>
CC: <majun@amd.com>, <netdev@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>, Evan Quan
	<quanliangl@hotmail.com>, Ma Jun <Jun.Ma2@amd.com>
Subject: [PATCH v12 6/9] drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
Date: Tue, 17 Oct 2023 10:53:55 +0800
Message-ID: <20231017025358.1773598-7-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017025358.1773598-1-Jun.Ma2@amd.com>
References: <20231017025358.1773598-1-Jun.Ma2@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|CH2PR12MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 00730bd4-434a-4931-cb8e-08dbcebc8cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	64UQBrlrR79dGViSjbCCHPnbKrBw/BVxOtP4sWbehipdxhHoEj9O6onZPBAn63bZ/vKHFvZiYOszPhwBNTVdB0XcIR8mUKMFyUoRWSJ4+J/6sUOTFsCt1EvNTVLuHWcw8yNR+P0nSCPsHV6mNO+qjArwkKOut/t4HoNFlLpM67AGpi++O5oB/3Hgqr853n2Ut977q9TAY9p4JLYID3lGIoZAg8hOrRLTWJEZljp27Sf5W+spo5g4BomBgSd6jgotgehNstuNqvq2GNu5ObMFKPK1MDA/ADyjN32qukLYiU0McYEtMcRidruSsqsoap/16PnzRfzpvZcXHXLv/F10JlygyzjqRPmSyMzS9aQD2b7GGxdR0KNAC1qKlyob48IXv+z1KGRRzGD8HWOZ+OmCP7RJnBxldG+HhFIwlqGVZpnBkkvdrru1n3kdsudc3wA/dJTuWNF3LUwu1PIhwHwJx81IinE7ZGNziYv87g3LcDYWRZ7JHSaEKZtBZZYUHv7gkxZbnbnRcMw68UsD75Lr43i/k8OwMEKSDeb2Ocd42RNk5/nRz9/w3V0oJHCqF+bAdxFSUPGA5M9eJ1Rp7mciHv4++ZBE/+9JJurKHM+0qpkjwoM8+YaStyzB79CuYvGMhbUR1Dgez4f7J+cjo1yJy8Zbw2/cHas9WioObPD4gfy6kjaaYBbsYAWtEKUuQT+zIuxwOaeTWHPSzKHus9b9chBhnnuzoQaRdbE7PGpm5z/kJbr7bgtJW4gLdFitFR4505QqlqqCwKJ0CYB4ctb9e0UqO+mOoPRZCIgNHoYXsS3np1As8RivWoKVWCOatpPNehr/K8Rq6daVloTImvrEwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(40470700004)(70586007)(54906003)(110136005)(70206006)(6636002)(83380400001)(316002)(426003)(336012)(7416002)(2906002)(6666004)(36756003)(30864003)(7696005)(45080400002)(478600001)(4326008)(82740400003)(8676002)(8936002)(36860700001)(41300700001)(40460700003)(26005)(32650700002)(16526019)(921005)(356005)(2616005)(40480700001)(86362001)(1076003)(5660300002)(81166007)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 02:55:41.4079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00730bd4-434a-4931-cb8e-08dbcebc8cde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5019
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Evan Quan <quanliangl@hotmail.com>

With WBRF feature supported, as a driver responding to the frequencies,
amdgpu driver is able to do shadow pstate switching to mitigate possible
interference(between its (G-)DDR memory clocks and local radio module
frequency bands used by Wifi 6/6e/7).

Signed-off-by: Evan Quan <quanliangl@hotmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
--
v1->v2:
  - update the prompt for feature support(Lijo)
v8->v9:
  - update parameter document for smu_wbrf_event_handler(Simon)
v9->v10:
v10->v11:
 - correct the logics for wbrf range sorting(Lijo)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  17 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 195 ++++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  23 +++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 5 files changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6dc950c1b689..11a19384df56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -247,6 +247,8 @@ extern int amdgpu_sg_display;
 
 extern int amdgpu_user_partt_mode;
 
+extern int amdgpu_wbrf;
+
 #define AMDGPU_VM_MAX_NUM_CTX			4096
 #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
 #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS	        3000
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 0593ef8fe0a6..1c574bd3b60d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -195,6 +195,7 @@ int amdgpu_use_xgmi_p2p = 1;
 int amdgpu_vcnfw_log;
 int amdgpu_sg_display = -1; /* auto */
 int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
+int amdgpu_wbrf = -1;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
@@ -981,6 +982,22 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
 module_param(enforce_isolation, bool, 0444);
 MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics and compute . enforce_isolation = on");
 
+/**
+ * DOC: wbrf (int)
+ * Enable Wifi RFI interference mitigation feature.
+ * Due to electrical and mechanical constraints there may be likely interference of
+ * relatively high-powered harmonics of the (G-)DDR memory clocks with local radio
+ * module frequency bands used by Wifi 6/6e/7. To mitigate the possible RFI interference,
+ * with this feature enabled, PMFW will use either “shadowed P-State” or “P-State” based
+ * on active list of frequencies in-use (to be avoided) as part of initial setting or
+ * P-state transition. However, there may be potential performance impact with this
+ * feature enabled.
+ * (0 = disabled, 1 = enabled, -1 = auto (default setting, will be enabled if supported))
+ */
+MODULE_PARM_DESC(wbrf,
+	"Enable Wifi RFI interference mitigation (0 = disabled, 1 = enabled, -1 = auto(default)");
+module_param_named(wbrf, amdgpu_wbrf, int, 0444);
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 222af2fae745..d52cd7ed2868 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1228,6 +1228,174 @@ static int smu_get_thermal_temperature_range(struct smu_context *smu)
 	return ret;
 }
 
+/**
+ * smu_wbrf_handle_exclusion_ranges - consume the wbrf exclusion ranges
+ *
+ * @smu: smu_context pointer
+ *
+ * Retrieve the wbrf exclusion ranges and send them to PMFW for proper handling.
+ * Returns 0 on success, error on failure.
+ */
+static int smu_wbrf_handle_exclusion_ranges(struct smu_context *smu)
+{
+	struct wbrf_ranges_in_out wbrf_exclusion = {0};
+	struct freq_band_range *wifi_bands = wbrf_exclusion.band_list;
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t num_of_wbrf_ranges = MAX_NUM_OF_WBRF_RANGES;
+	uint64_t start, end;
+	int ret, i, j;
+
+	ret = amd_wbrf_retrieve_freq_band(adev->dev, &wbrf_exclusion);
+	if (ret) {
+		dev_err(adev->dev, "Failed to retrieve exclusion ranges!\n");
+		return ret;
+	}
+
+	/*
+	 * The exclusion ranges array we got might be filled with holes and duplicate
+	 * entries. For example:
+	 * {(2400, 2500), (0, 0), (6882, 6962), (2400, 2500), (0, 0), (6117, 6189), (0, 0)...}
+	 * We need to do some sortups to eliminate those holes and duplicate entries.
+	 * Expected output: {(2400, 2500), (6117, 6189), (6882, 6962), (0, 0)...}
+	 */
+	for (i = 0; i < num_of_wbrf_ranges; i++) {
+		start = wifi_bands[i].start;
+		end = wifi_bands[i].end;
+
+		/* get the last valid entry to fill the intermediate hole */
+		if (!start && !end) {
+			for (j = num_of_wbrf_ranges - 1; j > i; j--)
+				if (wifi_bands[j].start &&
+				    wifi_bands[j].end)
+					break;
+
+			/* no valid entry left */
+			if (j <= i)
+				break;
+
+			start = wifi_bands[i].start = wifi_bands[j].start;
+			end = wifi_bands[i].end = wifi_bands[j].end;
+			wifi_bands[j].start = 0;
+			wifi_bands[j].end = 0;
+			num_of_wbrf_ranges = j;
+		}
+
+		/* eliminate duplicate entries */
+		for (j = i + 1; j < num_of_wbrf_ranges; j++) {
+			if ((wifi_bands[j].start == start) &&
+			     (wifi_bands[j].end == end)) {
+				wifi_bands[j].start = 0;
+				wifi_bands[j].end = 0;
+			}
+		}
+	}
+
+	/* Send the sorted wifi_bands to PMFW */
+	ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
+	/* Give it another chance */
+	if (unlikely(ret == -EBUSY)) {
+		mdelay(5);
+		ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
+	}
+
+	return ret;
+}
+
+/**
+ * smu_wbrf_event_handler - handle notify events
+ *
+ * @nb: notifier block
+ * @action: event type
+ * @_arg: event data
+ *
+ * Calls relevant amdgpu function in response to wbrf event
+ * notification from kernel.
+ */
+static int smu_wbrf_event_handler(struct notifier_block *nb,
+				  unsigned long action, void *_arg)
+{
+	struct smu_context *smu = container_of(nb, struct smu_context,
+					       wbrf_notifier);
+
+	switch (action) {
+	case WBRF_CHANGED:
+		smu_wbrf_handle_exclusion_ranges(smu);
+		break;
+	default:
+		return NOTIFY_DONE;
+	};
+
+	return NOTIFY_OK;
+}
+
+/**
+ * smu_wbrf_support_check - check wbrf support
+ *
+ * @smu: smu_context pointer
+ *
+ * Verifies the ACPI interface whether wbrf is supported.
+ */
+static void smu_wbrf_support_check(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	smu->wbrf_supported = smu_is_asic_wbrf_supported(smu) &&
+			      !!amdgpu_wbrf &&
+			      acpi_amd_wbrf_supported_consumer(adev->dev);
+
+	if (smu->wbrf_supported)
+		dev_info(adev->dev, "RF interference mitigation is supported\n");
+}
+
+/**
+ * smu_wbrf_init - init driver wbrf support
+ *
+ * @smu: smu_context pointer
+ *
+ * Verifies the AMD ACPI interfaces and registers with the wbrf
+ * notifier chain if wbrf feature is supported.
+ * Returns 0 on success, error on failure.
+ */
+static int smu_wbrf_init(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int ret;
+
+	if (!smu->wbrf_supported)
+		return 0;
+
+	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
+	ret = amd_wbrf_register_notifier(&smu->wbrf_notifier);
+	if (ret)
+		return ret;
+
+	/*
+	 * Some wifiband exclusion ranges may be already there
+	 * before our driver loaded. To make sure our driver
+	 * is awared of those exclusion ranges.
+	 */
+	ret = smu_wbrf_handle_exclusion_ranges(smu);
+	if (ret)
+		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
+
+	return ret;
+}
+
+/**
+ * smu_wbrf_fini - tear down driver wbrf support
+ *
+ * @smu: smu_context pointer
+ *
+ * Unregisters with the wbrf notifier chain.
+ */
+static void smu_wbrf_fini(struct smu_context *smu)
+{
+	if (!smu->wbrf_supported)
+		return;
+
+	amd_wbrf_unregister_notifier(&smu->wbrf_notifier);
+}
+
 static int smu_smc_hw_setup(struct smu_context *smu)
 {
 	struct smu_feature *feature = &smu->smu_feature;
@@ -1320,6 +1488,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 	if (ret)
 		return ret;
 
+	/* Enable UclkShadow on wbrf supported */
+	if (smu->wbrf_supported) {
+		ret = smu_enable_uclk_shadow(smu, true);
+		if (ret) {
+			dev_err(adev->dev, "Failed to enable UclkShadow feature to support wbrf!\n");
+			return ret;
+		}
+	}
+
 	/*
 	 * With SCPM enabled, these actions(and relevant messages) are
 	 * not needed and permitted.
@@ -1416,6 +1593,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 	 */
 	ret = smu_set_min_dcef_deep_sleep(smu,
 					  smu->smu_table.boot_values.dcefclk / 100);
+	if (ret) {
+		dev_err(adev->dev, "Error setting min deepsleep dcefclk\n");
+		return ret;
+	}
+
+	/* Init wbrf support. Properly setup the notifier */
+	ret = smu_wbrf_init(smu);
+	if (ret)
+		dev_err(adev->dev, "Error during wbrf init call\n");
 
 	return ret;
 }
@@ -1471,6 +1657,13 @@ static int smu_hw_init(void *handle)
 		return ret;
 	}
 
+	/*
+	 * Check whether wbrf is supported. This needs to be done
+	 * before SMU setup starts since part of SMU configuration
+	 * relies on this.
+	 */
+	smu_wbrf_support_check(smu);
+
 	if (smu->is_apu) {
 		ret = smu_set_gfx_imu_enable(smu);
 		if (ret)
@@ -1623,6 +1816,8 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0;
 
+	smu_wbrf_fini(smu);
+
 	cancel_work_sync(&smu->throttling_logging_work);
 	cancel_work_sync(&smu->interrupt_work);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 6e2069dcb6b9..39c1620d68c9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -22,6 +22,8 @@
 #ifndef __AMDGPU_SMU_H__
 #define __AMDGPU_SMU_H__
 
+#include <linux/acpi_amd_wbrf.h>
+
 #include "amdgpu.h"
 #include "kgd_pp_interface.h"
 #include "dm_pp_interface.h"
@@ -575,6 +577,10 @@ struct smu_context
 	u32 debug_resp_reg;
 
 	struct delayed_work		swctf_delayed_work;
+
+	/* data structures for wbrf feature support */
+	bool				wbrf_supported;
+	struct notifier_block		wbrf_notifier;
 };
 
 struct i2c_adapter;
@@ -1356,6 +1362,23 @@ struct pptable_funcs {
 	 * @init_pptable_microcode: Prepare the pptable microcode to upload via PSP
 	 */
 	int (*init_pptable_microcode)(struct smu_context *smu);
+
+	/**
+	 * @is_asic_wbrf_supported: check whether PMFW supports the wbrf feature
+	 */
+	bool (*is_asic_wbrf_supported)(struct smu_context *smu);
+
+	/**
+	 * @enable_uclk_shadow: Enable the uclk shadow feature on wbrf supported
+	 */
+	int (*enable_uclk_shadow)(struct smu_context *smu,
+				  bool enablement);
+
+	/**
+	 * @set_wbrf_exclusion_ranges: notify SMU the wifi bands occupied
+	 */
+	int (*set_wbrf_exclusion_ranges)(struct smu_context *smu,
+					 struct freq_band_range *exclusion_ranges);
 };
 
 typedef enum {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
index ceb13c838067..aa64c7cdf3c9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
@@ -97,6 +97,9 @@
 #define smu_get_default_config_table_settings(smu, config_table)	smu_ppt_funcs(get_default_config_table_settings, -EOPNOTSUPP, smu, config_table)
 #define smu_set_config_table(smu, config_table)				smu_ppt_funcs(set_config_table, -EOPNOTSUPP, smu, config_table)
 #define smu_init_pptable_microcode(smu)					smu_ppt_funcs(init_pptable_microcode, 0, smu)
+#define smu_is_asic_wbrf_supported(smu)					smu_ppt_funcs(is_asic_wbrf_supported, false, smu)
+#define smu_enable_uclk_shadow(smu, enablement)				smu_ppt_funcs(enable_uclk_shadow, 0, smu, enablement)
+#define smu_set_wbrf_exclusion_ranges(smu, freq_band_range)		smu_ppt_funcs(set_wbrf_exclusion_ranges, -EOPNOTSUPP, smu, freq_band_range)
 
 #endif
 #endif
-- 
2.34.1


