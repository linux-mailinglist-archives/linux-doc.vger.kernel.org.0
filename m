Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7695D4A67B6
	for <lists+linux-doc@lfdr.de>; Tue,  1 Feb 2022 23:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239112AbiBAWWb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Feb 2022 17:22:31 -0500
Received: from mail-dm3nam07on2059.outbound.protection.outlook.com ([40.107.95.59]:21696
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239046AbiBAWWa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Feb 2022 17:22:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHkoXABk8k0rwoZqdq2cgFnSWaKB2A1YlYMyljSpqXUSSrO4kQnoHkutcenjYGEKEW0rjDHz3q8ALg5dT2I1gar2nmovWYfFzpuiolCEz07h1Nhi+s/2Gk9fY9sCCErunYnZMiG+Jhi+sC5g7L4x4OTHEQ4wL6lA4BzdSn2k8/Z+We0qh2qW0IjKFbFFrLHYqAvsFKgoIHyhCk0W3CXRGRWpAV/HWatsy2D8b9zBT9w0hto1T/boX6VfkF6vEYE3poNAfWftB6uo6zdGABmz4VHxio5xzdzCkWtX8WdSEDnJgh5kJhNxjuUNOR4ZPiiKDG8YBbUvD6JVGueI7WHEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uYO4A0a4YfHu31WYautnODcpV0kdnLDrutV+ZOBEUA=;
 b=RWpeiTbTjraWXXIhUPs4KvJ+qQ/LQ31DegaNna1UWsFKrmI83Q3hIUdO5tSEUUNR2fw+8JcbLiHe3pvNyo3lNUA+fZFRQJ1tm+5ySg/pKyMDxRIJq8XG5iVIWjd9W2TlIONPGGq0577h7n91tDXUXtlctup/VLCE+gzPWehbggWlb968MyreuTsMzsXpbqbZyVORv27/GkgtvTktMEVB+aoVuwjrLiXXObiQ5D5FvSKditBEWLVr9UE18SHqfirIS1fGJ3AUMSD4Fmpcz6b1LUrSPNGxQ4HKCbZ02QFK6tnRRPUIoo6DkANjiqJceBxlXhGcjGnPhFayoHaYJe5cFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uYO4A0a4YfHu31WYautnODcpV0kdnLDrutV+ZOBEUA=;
 b=hRelsCLSs91lLddh96ktVi5LmK3V5l2A+9EL9afChUeDwspD6N5XQmvi3mTiei3XuHCMiM7NfS/uMwCCWwYxbrrI2vZZyeUakwCtIbYdLSiB4bEjbLLPTY65sNXP7FSwTlk81JRdb6bqv6F1wpKBsB26Ce6e3ya3IzAf8DcPUdhD7cFaUGpcXDVsDpeu527GQEpuFBobKb0I3ea3CCM+tcucIvXPNGYasdan6/35uZ538qVUaroHbfpKDin8HVaJejRUIckoIrlPo4soDeCCgAKKGC7c4qOXFKjwHU7uHquUO3ele3ile61G8+EP6eBxgQwgwzZAdy97+Kb2CV+pUw==
Received: from MW4PR03CA0007.namprd03.prod.outlook.com (2603:10b6:303:8f::12)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 22:22:28 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::9f) by MW4PR03CA0007.outlook.office365.com
 (2603:10b6:303:8f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 1 Feb 2022 22:22:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4951.12 via Frontend Transport; Tue, 1 Feb 2022 22:22:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 1 Feb
 2022 22:22:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Tue, 1 Feb 2022
 14:22:25 -0800
Received: from dipenp.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Tue, 1 Feb 2022 14:22:25 -0800
From:   Dipen Patel <dipenp@nvidia.com>
To:     <smangipudi@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <warthog618@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [PATCH v4 02/11] drivers: Add hardware timestamp engine (HTE)
Date:   Tue, 1 Feb 2022 14:26:21 -0800
Message-ID: <20220201222630.21246-3-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201222630.21246-1-dipenp@nvidia.com>
References: <20220201222630.21246-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03210a5e-30c7-4583-e80b-08d9e5d1546b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4391B29F828B9824699BFCFFAE269@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qf9vbFjMagjBE80z204XsLWpD3+ZHTcTulS3uLwtVvIEqf9By1KaGG8MSMzsHAQVHvxoHwLmjL2x+02gVSmqBa7Ju+tws1RRmlDCQhPbvo+JxNIldLp+vSI5ICz7Q7pHBdO9J68zwSbUYL2V3llbQPhB9O7yuAJDtL2EoFgAGJ31oNIaQdWNgTCvpGUlCFSDOdNgyI6zVchnRGQsrsO8F/nSWN/LcfRjIXSJLohYt+oEk2Iq9cmJBduurkfV81g6vcSpX7gcG365aoAsisKLCCcfElTc//FaZ4MP8j123liOIqDaILGTusDnhXSMX/FtHcGkPxggjrfypgiKSaz6MUsnRxGr6ZZzAzexVKRYaAsTIPDyLym1UCyfOLhYvrV+npWrwxRDfcq4a4E9Mz7xj3/50OcmefOjilLInqiG1Vk7qfHbgWEscT3w7qOXKAdeJMuPA+8T9Sb6R9xVPdn2bjhFN/lv8kMkRsiynpsOggfWtS/PTnesKpzQhlkVns8daEKzVezsPD2rZ4g+BVNa//NnxRs/fud0tPy/MaUMIBWbKnhozmswrXKkqfyfENgZx8e5uPWLgKl885f0WM+168x9GOvvM5HikiKSarjaz2STXQ8XtAV+lp83I8yIuZZqHIOcQG5TdeEgmxv/svmF4xRRk+ZfSasfz8aKIcPl/VGNkbXLY5E24Ee4OXfz2ZeeGnXhUUwTlrs/x9K8/T/kDymU5amHe+f2B617/PSc+urrQXhprrUljcRsSE1eKF31TopbbVf61cEsFX7gsqReSw==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8676002)(8936002)(47076005)(30864003)(6666004)(70206006)(4326008)(70586007)(110136005)(508600001)(316002)(2906002)(1076003)(26005)(107886003)(83380400001)(186003)(2616005)(336012)(426003)(86362001)(40460700003)(82310400004)(921005)(36860700001)(81166007)(7696005)(5660300002)(7416002)(36756003)(356005)(36900700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 22:22:27.3169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03210a5e-30c7-4583-e80b-08d9e5d1546b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some devices can timestamp system lines/signals/Buses in real-time
using the hardware counter or other hardware means which can give
finer granularity and help avoid jitter introduced by software
timestamping. To utilize such functionality, this patchset creates
HTE subsystem where devices can register themselves as providers so
that the consumers devices can request specific line from the
providers.

It provides below APIs for the provider:
- devm_hte_register_chip -- To register the HTE provider.
- hte_push_ts_ns() -- To push timestamp data into HTE subsystem.

It provides below APIs for the consumer:
- devm_of_hte_request_ts_ns() -- Request timestamp functionality.
- hte_req_ts_by_linedata_ns -- To request timestamp functionality by
using line data information provided by the consumer.
- hte_enable_ts() -- To disable timestamp functionality.
- hte_disable_ts() -- To enable timestamp functionality.
- hte_release_ts() -- To release timestamp functionality and its
associated resources.
- hte_get_clk_src_info() -- To query clock source information from
the provider

The detail about parameters and API usage are described in each
functions definitions in drivers/hte/hte.c file.

The patch adds compilation support in Makefile and menu options in
Kconfig.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/Kconfig      |   2 +
 drivers/Makefile     |   1 +
 drivers/hte/Kconfig  |  22 ++
 drivers/hte/Makefile |   2 +
 drivers/hte/hte.c    | 887 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/hte.h  | 250 ++++++++++++
 6 files changed, 1164 insertions(+)
 create mode 100644 drivers/hte/Kconfig
 create mode 100644 drivers/hte/Makefile
 create mode 100644 drivers/hte/hte.c
 create mode 100644 include/linux/hte.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 0d399ddaa185..b3c8332bf5c7 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -236,4 +236,6 @@ source "drivers/interconnect/Kconfig"
 source "drivers/counter/Kconfig"
 
 source "drivers/most/Kconfig"
+
+source "drivers/hte/Kconfig"
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index a110338c860c..bb06fd70cc2f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -187,3 +187,4 @@ obj-$(CONFIG_GNSS)		+= gnss/
 obj-$(CONFIG_INTERCONNECT)	+= interconnect/
 obj-$(CONFIG_COUNTER)		+= counter/
 obj-$(CONFIG_MOST)		+= most/
+obj-$(CONFIG_HTE)		+= hte/
diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
new file mode 100644
index 000000000000..1fcfe17cf28a
--- /dev/null
+++ b/drivers/hte/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menuconfig HTE
+	bool "Hardware Timestamping Engine (HTE) Support"
+	help
+	  Hardware Timestamping Engine (HTE) Support.
+
+	  Some devices provide a hardware timestamping engine which can
+	  timestamp certain device lines/signals in realtime. This provides a
+	  hardware-assisted timestamp to generic signals like GPIOs or IRQs
+	  lines. It comes with a benefit for applications like autonomous
+	  machines needing accurate timestamping event with less jitter.
+
+	  This framework provides a generic interface to such HTE devices
+	  within the Linux kernel. It provides an API to register and
+	  unregister a HTE provider chip, configurable software buffer to
+	  store the timestamps, push the timestamp from the HTE providers and
+	  retrieve timestamps for the consumers. It also provides means for the
+	  consumers to request signals it wishes to hardware timestamp and
+	  release them if not required.
+
+	  If unsure, say no.
+
diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
new file mode 100644
index 000000000000..fc03bdf44427
--- /dev/null
+++ b/drivers/hte/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_HTE)		+= hte.o
+
diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
new file mode 100644
index 000000000000..8534f5219660
--- /dev/null
+++ b/drivers/hte/hte.c
@@ -0,0 +1,887 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021-2022 NVIDIA Corporation
+ *
+ * Author: Dipen Patel <dipenp@nvidia.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/mutex.h>
+#include <linux/sched.h>
+#include <linux/uaccess.h>
+#include <linux/hte.h>
+#include <linux/delay.h>
+#include <linux/debugfs.h>
+#include <linux/kthread.h>
+
+#define HTE_TS_NAME_LEN		10
+
+/* Global list of the HTE devices */
+static DEFINE_SPINLOCK(hte_lock);
+static LIST_HEAD(hte_devices);
+
+enum {
+	HTE_TS_REGISTERED,
+	HTE_TS_DISABLE,
+};
+
+enum {
+	HTE_CB_RUN_THREAD,
+	HTE_CB_NUM,
+};
+
+/**
+ * struct hte_ts_info - Information related to requested timestamp.
+ *
+ * @xlated_id: Timestamp ID as understood between HTE subsys and HTE provider,
+ * See xlate callback API.
+ * @flags: Flags holding state informations.
+ * @hte_cb_flags: Callback related flags.
+ * @seq: Timestamp sequence counter.
+ * @line_name: HTE allocated line name.
+ * @cb: Callback function provided by clients.
+ * @tcb: Threaded callback function provided by clients.
+ * @dropped_ts: Dropped timestamps.
+ * @slock: Spin lock to synchronize between disable/enable,
+ * request/release APIs.
+ * @thread: Thread task when tcb is provided.
+ * @req_mlock: Lock during timestamp request/release APIs.
+ * @ts_dbg_root: Root for the debug fs.
+ * @gdev: HTE abstract device that this timestamp information belongs to.
+ * @cl_data: Client specific data.
+ */
+struct hte_ts_info {
+	u32 xlated_id;
+	unsigned long flags;
+	unsigned long hte_cb_flags;
+	u64 seq;
+	char *line_name;
+	hte_ts_cb_t cb;
+	hte_ts_threaded_cb_t tcb;
+	atomic_t dropped_ts;
+	spinlock_t slock;
+	struct task_struct *thread;
+	struct mutex req_mlock;
+	struct dentry *ts_dbg_root;
+	struct hte_device *gdev;
+	void *cl_data;
+};
+
+/**
+ * struct hte_device - HTE abstract device
+ * @nlines: Number of entities this device supports.
+ * @ts_req: Total number of entities requested.
+ * @sdev: Device used at various debug prints.
+ * @dbg_root: Root directory for debug fs.
+ * @list: List node to store hte_device for each provider.
+ * @chip: HTE chip providing this HTE device.
+ * @owner: helps prevent removal of modules when in use.
+ * @ei: Timestamp information.
+ */
+struct hte_device {
+	u32 nlines;
+	atomic_t ts_req;
+	struct device *sdev;
+	struct dentry *dbg_root;
+	struct list_head list;
+	struct hte_chip *chip;
+	struct module *owner;
+	struct hte_ts_info ei[];
+};
+
+#ifdef CONFIG_DEBUG_FS
+
+static struct dentry *hte_root;
+
+static int __init hte_subsys_dbgfs_init(void)
+{
+	/* creates /sys/kernel/debug/hte/ */
+	hte_root = debugfs_create_dir("hte", NULL);
+
+	return 0;
+}
+subsys_initcall(hte_subsys_dbgfs_init);
+
+static void hte_chip_dbgfs_init(struct hte_device *gdev)
+{
+	const struct hte_chip *chip = gdev->chip;
+	const char *name = chip->name ? chip->name : dev_name(chip->dev);
+
+	gdev->dbg_root = debugfs_create_dir(name, hte_root);
+
+	debugfs_create_atomic_t("ts_requested", 0444, gdev->dbg_root,
+				&gdev->ts_req);
+	debugfs_create_u32("total_ts", 0444, gdev->dbg_root,
+			   &gdev->nlines);
+}
+
+static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
+{
+	if (!ei->gdev->dbg_root || !name)
+		return;
+
+	ei->ts_dbg_root = debugfs_create_dir(name, ei->gdev->dbg_root);
+
+	debugfs_create_atomic_t("dropped_timestamps", 0444, ei->ts_dbg_root,
+				&ei->dropped_ts);
+}
+
+#else
+
+static void hte_chip_dbgfs_init(struct hte_device *gdev)
+{
+}
+
+static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
+{
+}
+
+#endif
+
+/**
+ * hte_release_ts() - Release and disable timestamp for the given desc.
+ *
+ * @desc: timestamp descriptor.
+ *
+ * Context: debugfs_remove_recursive() function call may use sleeping locks,
+ *	    not suitable from atomic context.
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int hte_release_ts(struct hte_ts_desc *desc)
+{
+	int ret = 0;
+	unsigned long flag;
+	struct hte_device *gdev;
+	struct hte_ts_info *ei;
+
+	if (!desc)
+		return -EINVAL;
+
+	ei = desc->hte_data;
+
+	if (!ei || !ei->gdev)
+		return -EINVAL;
+
+	gdev = ei->gdev;
+
+	mutex_lock(&ei->req_mlock);
+
+	if (!test_bit(HTE_TS_REGISTERED, &ei->flags)) {
+		dev_info(gdev->sdev, "id:%d is not registered",
+			 desc->attr.line_id);
+		ret = -EUSERS;
+		goto unlock;
+	}
+
+	ret = gdev->chip->ops->release(gdev->chip, desc, ei->xlated_id);
+	if (ret) {
+		dev_err(gdev->sdev, "id: %d free failed\n",
+			desc->attr.line_id);
+		goto unlock;
+	}
+
+	kfree(ei->line_name);
+
+	debugfs_remove_recursive(ei->ts_dbg_root);
+
+	spin_lock_irqsave(&ei->slock, flag);
+
+	atomic_dec(&gdev->ts_req);
+	atomic_set(&ei->dropped_ts, 0);
+
+	ei->seq = 1;
+	desc->hte_data = NULL;
+
+	clear_bit(HTE_TS_REGISTERED, &ei->flags);
+
+	spin_unlock_irqrestore(&ei->slock, flag);
+
+	if (ei->tcb) {
+		kthread_stop(ei->thread);
+		put_task_struct(ei->thread);
+	}
+
+	ei->cb = NULL;
+	ei->tcb = NULL;
+	ei->thread = NULL;
+	ei->cl_data = NULL;
+
+	module_put(gdev->owner);
+unlock:
+	mutex_unlock(&ei->req_mlock);
+	dev_dbg(gdev->sdev, "release id: %d\n", desc->attr.line_id);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hte_release_ts);
+
+static int hte_ts_dis_en_common(struct hte_ts_desc *desc, bool en)
+{
+	u32 ts_id;
+	struct hte_device *gdev;
+	struct hte_ts_info *ei;
+	int ret;
+	unsigned long flag;
+
+	if (!desc)
+		return -EINVAL;
+
+	ei = desc->hte_data;
+
+	if (!ei || !ei->gdev)
+		return -EINVAL;
+
+	gdev = ei->gdev;
+	ts_id = desc->attr.line_id;
+
+	mutex_lock(&ei->req_mlock);
+
+	if (!test_bit(HTE_TS_REGISTERED, &ei->flags)) {
+		dev_dbg(gdev->sdev, "id:%d is not registered", ts_id);
+		ret = -EUSERS;
+		goto out;
+	}
+
+	spin_lock_irqsave(&ei->slock, flag);
+
+	if (en) {
+		if (!test_bit(HTE_TS_DISABLE, &ei->flags)) {
+			ret = 0;
+			goto out_unlock;
+		}
+
+		spin_unlock_irqrestore(&ei->slock, flag);
+		ret = gdev->chip->ops->enable(gdev->chip, ei->xlated_id);
+		if (ret) {
+			dev_warn(gdev->sdev, "id: %d enable failed\n",
+				 ts_id);
+			goto out;
+		}
+
+		spin_lock_irqsave(&ei->slock, flag);
+		clear_bit(HTE_TS_DISABLE, &ei->flags);
+	} else {
+		if (test_bit(HTE_TS_DISABLE, &ei->flags)) {
+			ret = 0;
+			goto out_unlock;
+		}
+
+		spin_unlock_irqrestore(&ei->slock, flag);
+		ret = gdev->chip->ops->disable(gdev->chip, ei->xlated_id);
+		if (ret) {
+			dev_warn(gdev->sdev, "id: %d disable failed\n",
+				 ts_id);
+			goto out;
+		}
+
+		spin_lock_irqsave(&ei->slock, flag);
+		set_bit(HTE_TS_DISABLE, &ei->flags);
+	}
+
+out_unlock:
+	spin_unlock_irqrestore(&ei->slock, flag);
+out:
+	mutex_unlock(&ei->req_mlock);
+	return ret;
+}
+
+/**
+ * hte_disable_ts() - Disable timestamp on given descriptor.
+ *
+ * The API does not release any resources associated with desc.
+ *
+ * @desc: ts descriptor, this is the same as returned by the request API.
+ *
+ * Context: Holds mutex lock, not suitable from atomic context.
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int hte_disable_ts(struct hte_ts_desc *desc)
+{
+	return hte_ts_dis_en_common(desc, false);
+}
+EXPORT_SYMBOL_GPL(hte_disable_ts);
+
+/**
+ * hte_enable_ts() - Enable timestamp on given descriptor.
+ *
+ * @desc: ts descriptor, this is the same as returned by the request API.
+ *
+ * Context: Holds mutex lock, not suitable from atomic context.
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int hte_enable_ts(struct hte_ts_desc *desc)
+{
+	return hte_ts_dis_en_common(desc, true);
+}
+EXPORT_SYMBOL_GPL(hte_enable_ts);
+
+static int hte_simple_xlate(struct hte_chip *gc,
+			    const struct of_phandle_args *args,
+			    struct hte_ts_desc *desc,
+			    u32 *id)
+{
+	if (!id || !desc || !gc)
+		return -EINVAL;
+
+	/*
+	 * For the providers that do not have any internal mappings between
+	 * logically exposed ids and actual ids, will set both
+	 * the same.
+	 *
+	 * In case there is a internal mapping needed, providers will need to
+	 * provide its own xlate function where line_id will be sent as
+	 * args[0] and it will return xlated id. Later xlated id will be
+	 * used for any future exchanges between provider and subsystems.
+	 */
+
+	if (args) {
+		if (gc->of_hte_n_cells < 1)
+			return -EINVAL;
+
+		if (args->args_count != gc->of_hte_n_cells)
+			return -EINVAL;
+
+		*id = args->args[0];
+		desc->attr.line_id = *id;
+	} else {
+		*id = desc->attr.line_id;
+	}
+
+	if (desc->attr.line_id > gc->nlines)
+		return -EINVAL;
+
+	desc->hte_data = NULL;
+
+	return 0;
+}
+
+static int _hte_wait_for_ts_data(struct hte_ts_info *ei)
+{
+	for (;;) {
+		set_current_state(TASK_INTERRUPTIBLE);
+
+		if (kthread_should_stop()) {
+			if (test_and_clear_bit(HTE_CB_RUN_THREAD,
+			    &ei->hte_cb_flags)) {
+				__set_current_state(TASK_RUNNING);
+				return 0;
+			}
+			__set_current_state(TASK_RUNNING);
+			return -1;
+		}
+
+		if (test_and_clear_bit(HTE_CB_RUN_THREAD,
+				       &ei->hte_cb_flags)) {
+			__set_current_state(TASK_RUNNING);
+			return 0;
+		}
+		schedule();
+	}
+}
+
+static int _hte_threadfn(void *data)
+{
+	struct hte_ts_info *ei = data;
+
+	while (!_hte_wait_for_ts_data(ei))
+		ei->tcb(ei->cl_data);
+
+	return 0;
+}
+
+static int _hte_setup_thread(struct hte_ts_info *ei, u32 id)
+{
+	struct task_struct *t;
+
+	t = kthread_create(_hte_threadfn, ei, "hte-%u", id);
+	if (IS_ERR(t))
+		return PTR_ERR(t);
+
+	ei->thread = get_task_struct(t);
+
+	return 0;
+}
+
+static int ___hte_req_ts(struct hte_device *gdev, struct hte_ts_desc *desc,
+			 u32 xlated_id, hte_ts_cb_t cb,
+			 hte_ts_threaded_cb_t tcb, void *data)
+{
+	struct hte_ts_info *ei;
+	int ret;
+
+	if (!try_module_get(gdev->owner))
+		return -ENODEV;
+
+	ei = &gdev->ei[xlated_id];
+	ei->xlated_id = xlated_id;
+
+	/*
+	 * There is a chance that multiple consumers requesting same entity,
+	 * lock here.
+	 */
+	mutex_lock(&ei->req_mlock);
+
+	if (test_bit(HTE_TS_REGISTERED, &ei->flags)) {
+		dev_dbg(gdev->chip->dev, "id:%u is already registered",
+			xlated_id);
+		ret = -EUSERS;
+		goto unlock;
+	}
+
+	ei->cb = cb;
+	ei->tcb = tcb;
+	if (tcb) {
+		ret = _hte_setup_thread(ei, xlated_id);
+		if (ret < 0) {
+			dev_err(gdev->chip->dev, "setting thread failed\n");
+			goto unlock;
+		}
+	}
+
+	ret = gdev->chip->ops->request(gdev->chip, desc, xlated_id);
+	if (ret < 0) {
+		dev_err(gdev->chip->dev, "ts request failed\n");
+		goto unlock;
+	}
+
+	desc->hte_data = ei;
+	ei->cl_data = data;
+	ei->seq = 1;
+
+	atomic_inc(&gdev->ts_req);
+
+	ei->line_name = NULL;
+	if (!desc->attr.name) {
+		ei->line_name = kzalloc(HTE_TS_NAME_LEN, GFP_KERNEL);
+		if (ei->line_name)
+			scnprintf(ei->line_name, HTE_TS_NAME_LEN, "ts_%u",
+				  desc->attr.line_id);
+	}
+
+	hte_ts_dbgfs_init(desc->attr.name == NULL ?
+			  ei->line_name : desc->attr.name, ei);
+	set_bit(HTE_TS_REGISTERED, &ei->flags);
+
+	mutex_unlock(&ei->req_mlock);
+
+	dev_dbg(gdev->chip->dev, "id: %u, xlated id:%u",
+		desc->attr.line_id, xlated_id);
+
+	return 0;
+
+unlock:
+	module_put(gdev->owner);
+	mutex_unlock(&ei->req_mlock);
+
+	return ret;
+}
+
+static struct hte_device *of_node_to_htedevice(struct device_node *np)
+{
+	struct hte_device *gdev;
+
+	spin_lock(&hte_lock);
+
+	list_for_each_entry(gdev, &hte_devices, list)
+		if (gdev->chip && gdev->chip->dev &&
+		    gdev->chip->dev->of_node == np) {
+			spin_unlock(&hte_lock);
+			return gdev;
+		}
+
+	spin_unlock(&hte_lock);
+
+	return ERR_PTR(-ENODEV);
+}
+
+static struct hte_device *hte_find_dev_from_linedata(struct hte_ts_desc *desc)
+{
+	struct hte_device *gdev;
+
+	spin_lock(&hte_lock);
+
+	list_for_each_entry(gdev, &hte_devices, list)
+		if (gdev->chip && gdev->chip->match_from_linedata) {
+			if (!gdev->chip->match_from_linedata(gdev->chip, desc))
+				continue;
+			spin_unlock(&hte_lock);
+			return gdev;
+		}
+
+	spin_unlock(&hte_lock);
+
+	return ERR_PTR(-ENODEV);
+}
+
+static struct hte_device *of_hte_dev_get(struct device *dev,
+					 struct device_node *np,
+					 const char *label,
+					 struct of_phandle_args *args)
+{
+	struct hte_device *gdev = NULL;
+	int index = 0;
+	int err;
+
+	if (label) {
+		index = of_property_match_string(np,
+						 "hardware-timestamp-names",
+						 label);
+		if (index < 0)
+			return ERR_PTR(index);
+	}
+
+	err = of_parse_phandle_with_args(np, "hardware-timestamps",
+					 "#hardware-timestamp-cells", index,
+					 args);
+	if (err) {
+		pr_err("%s(): can't parse \"hardware-timestamps\" property\n",
+		       __func__);
+		return ERR_PTR(err);
+	}
+
+	gdev = of_node_to_htedevice(args->np);
+	if (IS_ERR(gdev)) {
+		pr_err("%s(): HTE chip not found\n", __func__);
+		of_node_put(args->np);
+		return gdev;
+	}
+
+	return gdev;
+}
+
+static int __hte_req_ts(struct device *dev, struct hte_ts_desc *desc,
+			hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb, void *data)
+{
+	struct hte_device *gdev = NULL;
+	struct of_phandle_args args;
+	int ret;
+	u32 xlated_id;
+
+	gdev = of_hte_dev_get(dev, dev->of_node, desc->attr.name, &args);
+	if (IS_ERR(gdev))
+		return PTR_ERR(gdev);
+
+	if (!gdev->chip) {
+		pr_debug("requested id does not have provider\n");
+		return -ENODEV;
+	}
+
+	ret = gdev->chip->xlate(gdev->chip, &args, desc, &xlated_id);
+	if (ret < 0)
+		goto put;
+
+	ret = ___hte_req_ts(gdev, desc, xlated_id, cb, tcb, data);
+	if (ret < 0)
+		goto put;
+
+	return 0;
+
+put:
+	of_node_put(args.np);
+
+	return ret;
+}
+
+static void __devm_hte_release_ts(void *res)
+{
+	hte_release_ts(res);
+}
+
+/**
+ * devm_of_hte_request_ts_ns() - Resource managed API to request hardware
+ * timestamp in nanoseconds.
+ *
+ * The entity is provider specific for example, GPIO lines, signals, buses
+ * etc...The API allocates necessary resources and enables the timestamp. It
+ * deallocates and disables automatically when the consumer exits.
+ *
+ * @dev: HTE consumer/client device.
+ * @desc: Pre-allocated timestamp descriptor. HTE core will fill out necessary
+ * details. The name will be used as an index to parse line_id from the device
+ * tree node.
+ * @cb: Callback to push the timestamp data to consumer.
+ * @tcb: Optional callback. If its provided, subsystem will create
+ * thread. This will be called when cb returns HTE_RUN_THREADED_CB.
+ * @data: Client data, will be sent back during cb and tcb callbacks.
+ *
+ * Context: Holds mutex lock.
+ * Returns: Returns 0 on success or negative error code on failure.
+ */
+int devm_of_hte_request_ts_ns(struct device *dev, struct hte_ts_desc *desc,
+			      hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb,
+			      void *data)
+{
+	int err;
+
+	if (!dev || !dev->of_node || !desc || !cb)
+		return -EINVAL;
+
+	err = __hte_req_ts(dev, desc, cb, tcb, data);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(dev, __devm_hte_release_ts, desc);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_of_hte_request_ts_ns);
+
+/**
+ * hte_req_ts_by_linedata_ns() - Request entity to hardware timestamp in
+ * nanoseconds.
+ *
+ * The meaning of the entity is HTE provider specific, for example lines,
+ * signals, GPIOs, buses etc...The consumer is responsible to set line_id and
+ * supporting line_data.
+ *
+ * @desc: Pre-allocated timestamp descriptor with line_id and line_data
+ * set by the consumer.
+ * @cb: Callback to push the timestamp data to consumer.
+ * @tcb: Optional callback. If its provided, subsystem will create
+ * thread. This will be called when cb returns HTE_RUN_THREADED_CB.
+ * @data: Client data, will be sent back during cb and tcb callbacks.
+ *
+ * Context: Holds mutex lock, can not be called from atomic context. The mutex
+ * lock is used to serialize multiple consumers.
+ * Returns: returns 0 on success or negative error code on failure.
+ */
+int hte_req_ts_by_linedata_ns(struct hte_ts_desc *desc, hte_ts_cb_t cb,
+			      hte_ts_threaded_cb_t tcb, void *data)
+{
+	struct hte_device *gdev;
+	int ret;
+	u32 xlated_id;
+
+	if (!desc || !cb)
+		return -EINVAL;
+
+	gdev = hte_find_dev_from_linedata(desc);
+
+	if (IS_ERR(gdev)) {
+		pr_err("%s: HTE dev not found\n", __func__);
+		return -ENOTSUPP;
+	}
+
+	ret = gdev->chip->xlate(gdev->chip, NULL, desc, &xlated_id);
+	if (ret < 0) {
+		dev_err(gdev->chip->dev,
+			"failed to xlate id: %d\n", desc->attr.line_id);
+		return ret;
+	}
+
+	ret = ___hte_req_ts(gdev, desc, xlated_id, cb, tcb, data);
+	if (ret < 0) {
+		dev_err(gdev->chip->dev,
+			"failed to request id: %d\n", desc->attr.line_id);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hte_req_ts_by_linedata_ns);
+
+/**
+ * hte_get_clk_src_info() - Get the clock source information for a ts
+ * descriptor.
+ *
+ * @desc: ts descriptor, same as returned from request API.
+ * @ci: The API fills this structure with the clock information data.
+ *
+ * Context: Any context.
+ * Returns: 0 on success else negative error code on failure.
+ */
+int hte_get_clk_src_info(const struct hte_ts_desc *desc,
+			 struct hte_clk_info *ci)
+{
+	struct hte_chip *chip;
+	struct hte_ts_info *ei;
+
+	if (!desc || !desc->hte_data || !ci) {
+		pr_debug("%s:%d\n", __func__, __LINE__);
+		return -EINVAL;
+	}
+
+	ei = desc->hte_data;
+	if (!ei->gdev || !ei->gdev->chip)
+		return -EINVAL;
+
+	chip = ei->gdev->chip;
+	if (!chip->ops->get_clk_src_info)
+		return -ENOTSUPP;
+
+	return chip->ops->get_clk_src_info(chip, ci);
+}
+EXPORT_SYMBOL_GPL(hte_get_clk_src_info);
+
+/**
+ * hte_push_ts_ns() - Push timestamp data in nanoseconds.
+ *
+ * It is used by the provider to push timestamp data.
+ *
+ * @chip: The HTE chip, used during the registration.
+ * @xlated_id: entity id understood by both subsystem and provider, this is
+ * obtained from xlate callback during request API.
+ * @data: timestamp data.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
+		   struct hte_ts_data *data)
+{
+	hte_return_t ret;
+	int st = 0;
+	struct hte_ts_info *ei;
+	unsigned long flag;
+
+	if (!chip || !data || !chip->gdev)
+		return -EINVAL;
+
+	if (xlated_id > chip->nlines)
+		return -EINVAL;
+
+	ei = &chip->gdev->ei[xlated_id];
+
+	spin_lock_irqsave(&ei->slock, flag);
+
+	/* timestamp sequence counter */
+	data->seq = ei->seq++;
+
+	if (!test_bit(HTE_TS_REGISTERED, &ei->flags) ||
+	    test_bit(HTE_TS_DISABLE, &ei->flags)) {
+		dev_dbg(chip->dev, "Unknown timestamp push\n");
+		atomic_inc(&ei->dropped_ts);
+		st = -EINVAL;
+		goto unlock;
+	}
+
+	ret = ei->cb(data, ei->cl_data);
+	if (ret == HTE_RUN_THREADED_CB && ei->thread) {
+		if (test_and_set_bit(HTE_CB_RUN_THREAD, &ei->hte_cb_flags))
+			goto unlock;
+		else
+			wake_up_process(ei->thread);
+	}
+
+unlock:
+	spin_unlock_irqrestore(&ei->slock, flag);
+
+	return st;
+}
+EXPORT_SYMBOL_GPL(hte_push_ts_ns);
+
+static int hte_register_chip(struct hte_chip *chip)
+{
+	struct hte_device *gdev;
+	u32 i;
+
+	if (!chip || !chip->dev || !chip->dev->of_node)
+		return -EINVAL;
+
+	if (!chip->ops || !chip->ops->request || !chip->ops->release) {
+		dev_err(chip->dev, "Driver needs to provide ops\n");
+		return -EINVAL;
+	}
+
+	gdev = kzalloc(struct_size(gdev, ei, chip->nlines), GFP_KERNEL);
+	if (!gdev)
+		return -ENOMEM;
+
+	gdev->chip = chip;
+	chip->gdev = gdev;
+	gdev->nlines = chip->nlines;
+	gdev->sdev = chip->dev;
+
+	for (i = 0; i < chip->nlines; i++) {
+		gdev->ei[i].gdev = gdev;
+		mutex_init(&gdev->ei[i].req_mlock);
+		spin_lock_init(&gdev->ei[i].slock);
+	}
+
+	if (chip->dev->driver)
+		gdev->owner = chip->dev->driver->owner;
+	else
+		gdev->owner = THIS_MODULE;
+
+	if (!chip->xlate) {
+		chip->xlate = hte_simple_xlate;
+		/* Just a id number to monitor */
+		chip->of_hte_n_cells = 1;
+	}
+
+	of_node_get(chip->dev->of_node);
+
+	INIT_LIST_HEAD(&gdev->list);
+
+	spin_lock(&hte_lock);
+	list_add_tail(&gdev->list, &hte_devices);
+	spin_unlock(&hte_lock);
+
+	hte_chip_dbgfs_init(gdev);
+
+	dev_dbg(chip->dev, "Added hte chip\n");
+
+	return 0;
+}
+
+static int hte_unregister_chip(struct hte_chip *chip)
+{
+	struct hte_device *gdev;
+
+	if (!chip)
+		return -EINVAL;
+
+	gdev = chip->gdev;
+
+	spin_lock(&hte_lock);
+	list_del(&gdev->list);
+	spin_unlock(&hte_lock);
+
+	gdev->chip = NULL;
+
+	of_node_put(chip->dev->of_node);
+	debugfs_remove_recursive(gdev->dbg_root);
+	kfree(gdev);
+
+	dev_dbg(chip->dev, "Removed hte chip\n");
+
+	return 0;
+}
+
+static void _hte_devm_unregister_chip(void *chip)
+{
+	hte_unregister_chip(chip);
+}
+
+/**
+ * devm_hte_register_chip() - Resource managed API to register HTE chip.
+ *
+ * It is used by the provider to register itself with the HTE subsystem.
+ * The unregistration is done automatically when the provider exits.
+ *
+ * @chip: the HTE chip to add to subsystem.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int devm_hte_register_chip(struct hte_chip *chip)
+{
+	int err;
+
+	err = hte_register_chip(chip);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(chip->dev, _hte_devm_unregister_chip,
+				       chip);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_hte_register_chip);
diff --git a/include/linux/hte.h b/include/linux/hte.h
new file mode 100644
index 000000000000..5bfccfe5d2ca
--- /dev/null
+++ b/include/linux/hte.h
@@ -0,0 +1,250 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_HTE_H
+#define __LINUX_HTE_H
+
+#include <linux/errno.h>
+
+struct hte_chip;
+struct hte_device;
+struct of_phandle_args;
+
+/**
+ * enum hte_edge - HTE line edge flags.
+ *
+ * @HTE_EDGE_NO_SETUP: No edge setup. In this case consumer will setup edges,
+ * for example during request irq call.
+ * @HTE_RISING_EDGE_TS: Rising edge.
+ * @HTE_FALLING_EDGE_TS: Falling edge.
+ *
+ */
+enum hte_edge {
+	HTE_EDGE_NO_SETUP = 1U << 0,
+	HTE_RISING_EDGE_TS = 1U << 1,
+	HTE_FALLING_EDGE_TS = 1U << 2,
+};
+
+/**
+ * enum hte_return- HTE subsystem return values used during callback.
+ *
+ * @HTE_CB_HANDLED: The consumer handled the data.
+ * @HTE_RUN_THREADED_CB: The consumer needs further processing, in that case HTE
+ * subsystem will invoke kernel thread and call secondary callback provided by
+ * the consumer.
+ */
+enum hte_return {
+	HTE_CB_HANDLED,
+	HTE_RUN_THREADED_CB,
+};
+typedef enum hte_return hte_return_t;
+
+/**
+ * struct hte_ts_data - HTE timestamp data.
+ *
+ * @tsc: Timestamp value.
+ * @seq: Sequence counter of the timestamps.
+ * @raw_level: Level of the line at the timestamp if provider supports it,
+ * -1 otherwise.
+ */
+struct hte_ts_data {
+	u64 tsc;
+	u64 seq;
+	int raw_level;
+};
+
+/**
+ * struct hte_clk_info - Clock source info that HTE provider uses to timestamp.
+ *
+ * @hz: Supported clock rate in HZ, for example 1KHz clock = 1000.
+ * @type: Supported clock type.
+ */
+struct hte_clk_info {
+	u64 hz;
+	clockid_t type;
+};
+
+/**
+ * typedef hte_ts_cb_t - HTE timestamp data processing primary callback.
+ *
+ * The callback is used to push timestamp data to client.
+ *
+ * @ts: HW timestamp data.
+ * @data: Client supplied data.
+ */
+typedef hte_return_t (*hte_ts_cb_t)(struct hte_ts_data *ts, void *data);
+
+/**
+ * typedef hte_ts_threaded_cb_t - HTE timestamp data processing secondary
+ * threaded callback.
+ *
+ * @data: Client supplied data.
+ *
+ */
+typedef hte_return_t (*hte_ts_threaded_cb_t)(void *data);
+
+/**
+ * struct hte_line_attr - Line attributes.
+ *
+ * @line_id: The logical ID understood by the consumers and providers.
+ * @line_data: Line data related to line_id.
+ * @edge_flags: Edge setup flags.
+ * @name: Descriptive name of the entity that is being monitored for the
+ * hardware timestamping. If null, HTE core will construct the name.
+ * It is the consumer's job to free any allocation if name is set by the
+ * consumer. In case of HTE API parsing line_id from the device tree node
+ * name will be used as indexing if set.
+ *
+ */
+struct hte_line_attr {
+	u32 line_id;
+	void *line_data;
+	unsigned long edge_flags;
+	const char *name;
+};
+
+/**
+ * struct hte_ts_desc - HTE timestamp descriptor.
+ *
+ * This structure is a communication token between consumers to subsystem
+ * and subsystem to providers.
+ *
+ * @attr: The line attributes.
+ * @hte_data: Subsystem's private data, set by HTE subsystem.
+ */
+struct hte_ts_desc {
+	struct hte_line_attr attr;
+	void *hte_data;
+};
+
+/**
+ * struct hte_ops - HTE operations set by providers.
+ *
+ * @request: Hook for requesting a HTE timestamp. Returns 0 on success,
+ * non-zero for failures.
+ * @release: Hook for releasing a HTE timestamp. Returns 0 on success,
+ * non-zero for failures.
+ * @enable: Hook to enable the specified timestamp. Returns 0 on success,
+ * non-zero for failures.
+ * @disable: Hook to disable specified timestamp. Returns 0 on success,
+ * non-zero for failures.
+ * @get_clk_src_info: Hook to get the clock information the provider uses
+ * to timestamp. Returns 0 for success and negative error code for failure. On
+ * success HTE subsystem fills up provided struct hte_clk_info.
+ *
+ * xlated_id parameter is used to communicate between HTE subsystem and the
+ * providers and is translated by the provider.
+ */
+struct hte_ops {
+	int (*request)(struct hte_chip *chip, struct hte_ts_desc *desc,
+		       u32 xlated_id);
+	int (*release)(struct hte_chip *chip, struct hte_ts_desc *desc,
+		       u32 xlated_id);
+	int (*enable)(struct hte_chip *chip, u32 xlated_id);
+	int (*disable)(struct hte_chip *chip, u32 xlated_id);
+	int (*get_clk_src_info)(struct hte_chip *chip,
+				struct hte_clk_info *ci);
+};
+
+/**
+ * struct hte_chip - Abstract HTE chip.
+ *
+ * @name: functional name of the HTE IP block.
+ * @dev: device providing the HTE.
+ * @ops: callbacks for this HTE.
+ * @nlines: number of lines/signals supported by this chip.
+ * @xlate: Callback which translates consumer supplied logical ids to
+ * physical ids, return 0 for the success and negative for the failures.
+ * It stores (between 0 to @nlines) in xlated_id parameter for the success.
+ * @match_from_linedata: Match HTE device using the line_data.
+ * @of_hte_n_cells: Number of cells used to form the HTE specifier.
+ * @gdev: HTE subsystem abstract device, internal to the HTE subsystem.
+ * @data: chip specific private data.
+ */
+struct hte_chip {
+	const char *name;
+	struct device *dev;
+	const struct hte_ops *ops;
+	u32 nlines;
+	int (*xlate)(struct hte_chip *gc,
+		     const struct of_phandle_args *args,
+		     struct hte_ts_desc *desc, u32 *xlated_id);
+	bool (*match_from_linedata)(const struct hte_chip *chip,
+				    const struct hte_ts_desc *hdesc);
+	u8 of_hte_n_cells;
+
+	struct hte_device *gdev;
+	void *data;
+};
+
+#if IS_ENABLED(CONFIG_HTE)
+/* HTE APIs for the providers */
+int devm_hte_register_chip(struct hte_chip *chip);
+int hte_push_ts_ns(const struct hte_chip *chip, u32 xlated_id,
+		   struct hte_ts_data *data);
+
+/* HTE APIs for the consumers */
+
+int hte_release_ts(struct hte_ts_desc *desc);
+int devm_of_hte_request_ts_ns(struct device *dev, struct hte_ts_desc *desc,
+			      hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb,
+			      void *data);
+int hte_req_ts_by_linedata_ns(struct hte_ts_desc *desc, hte_ts_cb_t cb,
+			      hte_ts_threaded_cb_t tcb, void *data);
+int hte_enable_ts(struct hte_ts_desc *desc);
+int hte_disable_ts(struct hte_ts_desc *desc);
+int hte_get_clk_src_info(const struct hte_ts_desc *desc,
+			 struct hte_clk_info *ci);
+
+#else /* !CONFIG_HTE */
+static inline int devm_hte_register_chip(struct hte_chip *chip)
+{
+	return -ENOTSUPP;
+}
+
+static inline int hte_push_ts_ns(const struct hte_chip *chip,
+				 u32 xlated_id,
+				 const struct hte_ts_data *data)
+{
+	return -ENOTSUPP;
+}
+
+static inline int hte_release_ts(struct hte_ts_desc *desc)
+{
+	return -ENOTSUPP;
+}
+
+static inline int devm_of_hte_request_ts_ns(struct device *dev,
+					    struct hte_ts_desc *desc,
+					    hte_ts_cb_t cb,
+					    hte_ts_threaded_cb_t tcb,
+					    void *data)
+{
+	return -ENOTSUPP;
+}
+
+static inline int hte_req_ts_by_linedata_ns(struct hte_ts_desc *desc,
+					    hte_ts_cb_t cb,
+					    hte_ts_threaded_cb_t tcb,
+					    void *data)
+{
+	return -ENOTSUPP;
+}
+
+static inline int hte_enable_ts(struct hte_ts_desc *desc)
+{
+	return -ENOTSUPP;
+}
+
+static inline int hte_disable_ts(struct hte_ts_desc *desc)
+{
+	return -ENOTSUPP;
+}
+
+static inline int hte_get_clk_src_info(const struct hte_ts_desc *desc,
+				       struct hte_clk_info *ci)
+{
+	return -ENOTSUPP;
+}
+#endif /* !CONFIG_HTE */
+
+#endif
-- 
2.17.1

