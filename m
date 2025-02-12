Return-Path: <linux-doc+bounces-37871-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171BA328A6
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 15:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B1437A3687
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 14:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B82213232;
	Wed, 12 Feb 2025 14:37:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2520FAB7;
	Wed, 12 Feb 2025 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371051; cv=none; b=HB1cYEdDab42lPshDzoXWQ4XKmoC34vdL8SVJKLukY1V7R+gubRmq0Ci2gJD63+rd8HSFiP1DUKthlApM9pCQzHbhwLOxAloJlr7a56wApOVrw40kzEN8iTcRX2BtqdpD21gkCCJ7ZohB4WED4w5I2WN2P4D9EVuR4fdmg1mfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371051; c=relaxed/simple;
	bh=RHjauFyIv6ZzKBJ44OTJGIPXiIrSB2x31MOj7BPeHz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLrfgK/OPt+mqVcxvnVWUiSV+YayQsqxXdwSp37Te+egKwoyJ/8z/Z3Bc+LD1MyIP72gpvfmnnCGJzZVJE3zZSnD1TAjzgc3jDo+IlkI5JTghvG3j6qJAAqoniD4ggvyxGUq+oj32JCnkwKnaw76lc8FGE2nRdKeC3ZReJMS/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YtLSP0gymz6J7gL;
	Wed, 12 Feb 2025 22:35:01 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 722C4140AA7;
	Wed, 12 Feb 2025 22:37:26 +0800 (CST)
Received: from P_UKIT01-A7bmah.china.huawei.com (10.126.169.206) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Feb 2025 15:37:24 +0100
From: <shiju.jose@huawei.com>
To: <linux-edac@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <linux-doc@vger.kernel.org>, <bp@alien8.de>, <tony.luck@intel.com>,
	<rafael@kernel.org>, <lenb@kernel.org>, <mchehab@kernel.org>,
	<dan.j.williams@intel.com>, <dave@stgolabs.net>,
	<jonathan.cameron@huawei.com>, <dave.jiang@intel.com>,
	<alison.schofield@intel.com>, <vishal.l.verma@intel.com>,
	<ira.weiny@intel.com>, <david@redhat.com>, <Vilas.Sridharan@amd.com>,
	<leo.duran@amd.com>, <Yazen.Ghannam@amd.com>, <rientjes@google.com>,
	<jiaqiyan@google.com>, <Jon.Grimm@amd.com>, <dave.hansen@linux.intel.com>,
	<naoya.horiguchi@nec.com>, <james.morse@arm.com>, <jthoughton@google.com>,
	<somasundaram.a@hpe.com>, <erdemaktas@google.com>, <pgonda@google.com>,
	<duenwen@google.com>, <gthelen@google.com>, <wschwartz@amperecomputing.com>,
	<dferguson@amperecomputing.com>, <wbs@os.amperecomputing.com>,
	<nifan.cxl@gmail.com>, <yazen.ghannam@amd.com>, <tanxiaofei@huawei.com>,
	<prime.zeng@hisilicon.com>, <roberto.sassu@huawei.com>,
	<kangkang.shen@futurewei.com>, <wanghuiqiang@huawei.com>,
	<linuxarm@huawei.com>, <shiju.jose@huawei.com>
Subject: [PATCH v20 05/15] ACPI:RAS2: Add ACPI RAS2 driver
Date: Wed, 12 Feb 2025 14:36:43 +0000
Message-ID: <20250212143654.1893-6-shiju.jose@huawei.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20250212143654.1893-1-shiju.jose@huawei.com>
References: <20250212143654.1893-1-shiju.jose@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500007.china.huawei.com (7.182.85.172)

From: Shiju Jose <shiju.jose@huawei.com>

Add support for ACPI RAS2 feature table (RAS2) defined in the
ACPI 6.5 Specification, section 5.2.21.
Driver contains RAS2 Init, which extracts the RAS2 table and driver
adds auxiliary device for each memory feature which binds to the
RAS2 memory driver.

Driver uses PCC mailbox to communicate with the ACPI HW and the
driver adds OSPM interfaces to send RAS2 commands.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Co-developed-by: A Somasundaram <somasundaram.a@hpe.com>
Signed-off-by: A Somasundaram <somasundaram.a@hpe.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Daniel Ferguson <danielf@os.amperecomputing.com>
Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
---
 drivers/acpi/Kconfig     |  11 ++
 drivers/acpi/Makefile    |   1 +
 drivers/acpi/ras2.c      | 417 +++++++++++++++++++++++++++++++++++++++
 include/acpi/ras2_acpi.h |  47 +++++
 4 files changed, 476 insertions(+)
 create mode 100755 drivers/acpi/ras2.c
 create mode 100644 include/acpi/ras2_acpi.h

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index d81b55f5068c..bae9a47c829d 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -293,6 +293,17 @@ config ACPI_CPPC_LIB
 	  If your platform does not support CPPC in firmware,
 	  leave this option disabled.
 
+config ACPI_RAS2
+	bool "ACPI RAS2 driver"
+	select AUXILIARY_BUS
+	select MAILBOX
+	select PCC
+	help
+	  The driver adds support for ACPI RAS2 feature table(extracts RAS2
+	  table from OS system table) and OSPM interfaces to send RAS2
+	  commands via PCC mailbox subspace. Driver adds platform device for
+	  the RAS2 memory features which binds to the RAS2 memory driver.
+
 config ACPI_PROCESSOR
 	tristate "Processor"
 	depends on X86 || ARM64 || LOONGARCH || RISCV
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 40208a0f5dfb..797b38cdc2f3 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_ACPI_EC_DEBUGFS)	+= ec_sys.o
 obj-$(CONFIG_ACPI_BGRT)		+= bgrt.o
 obj-$(CONFIG_ACPI_CPPC_LIB)	+= cppc_acpi.o
 obj-$(CONFIG_ACPI_SPCR_TABLE)	+= spcr.o
+obj-$(CONFIG_ACPI_RAS2)		+= ras2.o
 obj-$(CONFIG_ACPI_DEBUGGER_USER) += acpi_dbg.o
 obj-$(CONFIG_ACPI_PPTT) 	+= pptt.o
 obj-$(CONFIG_ACPI_PFRUT)	+= pfr_update.o pfr_telemetry.o
diff --git a/drivers/acpi/ras2.c b/drivers/acpi/ras2.c
new file mode 100755
index 000000000000..cc8eef49c158
--- /dev/null
+++ b/drivers/acpi/ras2.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Implementation of ACPI RAS2 driver.
+ *
+ * Copyright (c) 2024-2025 HiSilicon Limited.
+ *
+ * Support for RAS2 - ACPI 6.5 Specification, section 5.2.21
+ *
+ * Driver contains ACPI RAS2 init, which extracts the ACPI RAS2 table and
+ * get the PCC channel subspace for communicating with the ACPI compliant
+ * HW platform which supports ACPI RAS2. Driver adds platform devices
+ * for each RAS2 memory feature which binds to the memory ACPI RAS2 driver.
+ */
+
+#define pr_fmt(fmt)    "ACPI RAS2: " fmt
+
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/ktime.h>
+#include <linux/platform_device.h>
+#include <acpi/pcc.h>
+#include <acpi/ras2_acpi.h>
+
+/* Data structure for PCC communication */
+struct ras2_pcc_subspace {
+	int pcc_subspace_id;
+	struct mbox_client mbox_client;
+	struct pcc_mbox_chan *pcc_chan;
+	struct acpi_ras2_shared_memory __iomem *pcc_comm_addr;
+	bool pcc_channel_acquired;
+	ktime_t deadline;
+	unsigned int pcc_mpar;
+	unsigned int pcc_mrtt;
+	struct list_head elem;
+	u16 ref_count;
+};
+
+/*
+ * Arbitrary Retries for PCC commands because the
+ * remote processor could be much slower to reply.
+ */
+#define RAS2_NUM_RETRIES 600
+
+#define RAS2_FEATURE_TYPE_MEMORY        0x00
+
+/* global variables for the RAS2 PCC subspaces */
+static DEFINE_MUTEX(ras2_pcc_subspace_lock);
+static LIST_HEAD(ras2_pcc_subspaces);
+
+static int ras2_report_cap_error(u32 cap_status)
+{
+	switch (cap_status) {
+	case ACPI_RAS2_NOT_VALID:
+	case ACPI_RAS2_NOT_SUPPORTED:
+		return -EPERM;
+	case ACPI_RAS2_BUSY:
+		return -EBUSY;
+	case ACPI_RAS2_FAILED:
+	case ACPI_RAS2_ABORTED:
+	case ACPI_RAS2_INVALID_DATA:
+		return -EINVAL;
+	default: /* 0 or other, Success */
+		return 0;
+	}
+}
+
+static int ras2_check_pcc_chan(struct ras2_pcc_subspace *pcc_subspace)
+{
+	struct acpi_ras2_shared_memory __iomem *generic_comm_base = pcc_subspace->pcc_comm_addr;
+	ktime_t next_deadline = ktime_add(ktime_get(), pcc_subspace->deadline);
+	u32 cap_status;
+	u16 status;
+	u32 ret;
+
+	while (!ktime_after(ktime_get(), next_deadline)) {
+		/*
+		 * As per ACPI spec, the PCC space will be initialized by
+		 * platform and should have set the command completion bit when
+		 * PCC can be used by OSPM
+		 */
+		status = readw_relaxed(&generic_comm_base->status);
+		if (status & RAS2_PCC_CMD_ERROR) {
+			cap_status = readw_relaxed(&generic_comm_base->set_capabilities_status);
+			ret = ras2_report_cap_error(cap_status);
+
+			status &= ~RAS2_PCC_CMD_ERROR;
+			writew_relaxed(status, &generic_comm_base->status);
+			return ret;
+		}
+		if (status & RAS2_PCC_CMD_COMPLETE)
+			return 0;
+		/*
+		 * Reducing the bus traffic in case this loop takes longer than
+		 * a few retries.
+		 */
+		msleep(10);
+	}
+
+	return -EIO;
+}
+
+/**
+ * ras2_send_pcc_cmd() - Send RAS2 command via PCC channel
+ * @ras2_ctx:	pointer to the RAS2 context structure
+ * @cmd:	command to send
+ *
+ * Returns: 0 on success, an error otherwise
+ */
+int ras2_send_pcc_cmd(struct ras2_mem_ctx *ras2_ctx, u16 cmd)
+{
+	struct ras2_pcc_subspace *pcc_subspace = ras2_ctx->pcc_subspace;
+	struct acpi_ras2_shared_memory *generic_comm_base = pcc_subspace->pcc_comm_addr;
+	static ktime_t last_cmd_cmpl_time, last_mpar_reset;
+	struct mbox_chan *pcc_channel;
+	unsigned int time_delta;
+	static int mpar_count;
+	int ret;
+
+	guard(mutex)(&ras2_pcc_subspace_lock);
+	ret = ras2_check_pcc_chan(pcc_subspace);
+	if (ret < 0)
+		return ret;
+	pcc_channel = pcc_subspace->pcc_chan->mchan;
+
+	/*
+	 * Handle the Minimum Request Turnaround Time(MRTT)
+	 * "The minimum amount of time that OSPM must wait after the completion
+	 * of a command before issuing the next command, in microseconds"
+	 */
+	if (pcc_subspace->pcc_mrtt) {
+		time_delta = ktime_us_delta(ktime_get(), last_cmd_cmpl_time);
+		if (pcc_subspace->pcc_mrtt > time_delta)
+			udelay(pcc_subspace->pcc_mrtt - time_delta);
+	}
+
+	/*
+	 * Handle the non-zero Maximum Periodic Access Rate(MPAR)
+	 * "The maximum number of periodic requests that the subspace channel can
+	 * support, reported in commands per minute. 0 indicates no limitation."
+	 *
+	 * This parameter should be ideally zero or large enough so that it can
+	 * handle maximum number of requests that all the cores in the system can
+	 * collectively generate. If it is not, we will follow the spec and just
+	 * not send the request to the platform after hitting the MPAR limit in
+	 * any 60s window
+	 */
+	if (pcc_subspace->pcc_mpar) {
+		if (mpar_count == 0) {
+			time_delta = ktime_ms_delta(ktime_get(), last_mpar_reset);
+			if (time_delta < 60 * MSEC_PER_SEC) {
+				dev_dbg(ras2_ctx->dev,
+					"PCC cmd not sent due to MPAR limit");
+				return -EIO;
+			}
+			last_mpar_reset = ktime_get();
+			mpar_count = pcc_subspace->pcc_mpar;
+		}
+		mpar_count--;
+	}
+
+	/* Write to the shared comm region. */
+	writew_relaxed(cmd, &generic_comm_base->command);
+
+	/* Flip CMD COMPLETE bit */
+	writew_relaxed(0, &generic_comm_base->status);
+
+	/* Ring doorbell */
+	ret = mbox_send_message(pcc_channel, &cmd);
+	if (ret < 0) {
+		dev_err(ras2_ctx->dev,
+			"Err sending PCC mbox message. cmd:%d, ret:%d\n",
+			cmd, ret);
+		return ret;
+	}
+
+	/*
+	 * If Minimum Request Turnaround Time is non-zero, we need
+	 * to record the completion time of both READ and WRITE
+	 * command for proper handling of MRTT, so we need to check
+	 * for pcc_mrtt in addition to CMD_READ
+	 */
+	if (cmd == RAS2_PCC_CMD_EXEC || pcc_subspace->pcc_mrtt) {
+		ret = ras2_check_pcc_chan(pcc_subspace);
+		if (pcc_subspace->pcc_mrtt)
+			last_cmd_cmpl_time = ktime_get();
+	}
+
+	if (pcc_channel->mbox->txdone_irq)
+		mbox_chan_txdone(pcc_channel, ret);
+	else
+		mbox_client_txdone(pcc_channel, ret);
+
+	return ret >= 0 ? 0 : ret;
+}
+EXPORT_SYMBOL_GPL(ras2_send_pcc_cmd);
+
+static int ras2_register_pcc_channel(struct ras2_mem_ctx *ras2_ctx, int pcc_subspace_id)
+{
+	struct ras2_pcc_subspace *pcc_subspace;
+	struct pcc_mbox_chan *pcc_chan;
+	struct mbox_client *mbox_cl;
+
+	if (pcc_subspace_id < 0)
+		return -EINVAL;
+
+	mutex_lock(&ras2_pcc_subspace_lock);
+	list_for_each_entry(pcc_subspace, &ras2_pcc_subspaces, elem) {
+		if (pcc_subspace->pcc_subspace_id != pcc_subspace_id)
+			continue;
+		ras2_ctx->pcc_subspace = pcc_subspace;
+		pcc_subspace->ref_count++;
+		mutex_unlock(&ras2_pcc_subspace_lock);
+		return 0;
+	}
+	mutex_unlock(&ras2_pcc_subspace_lock);
+
+	pcc_subspace = kcalloc(1, sizeof(*pcc_subspace), GFP_KERNEL);
+	if (!pcc_subspace)
+		return -ENOMEM;
+	mbox_cl = &pcc_subspace->mbox_client;
+	mbox_cl->knows_txdone = true;
+
+	pcc_chan = pcc_mbox_request_channel(mbox_cl, pcc_subspace_id);
+	if (IS_ERR(pcc_chan)) {
+		kfree(pcc_subspace);
+		return PTR_ERR(pcc_chan);
+	}
+	*pcc_subspace = (struct ras2_pcc_subspace) {
+		.pcc_subspace_id = pcc_subspace_id,
+		.pcc_chan = pcc_chan,
+		.pcc_comm_addr = acpi_os_ioremap(pcc_chan->shmem_base_addr,
+						 pcc_chan->shmem_size),
+		.deadline = ns_to_ktime(RAS2_NUM_RETRIES *
+					pcc_chan->latency *
+					NSEC_PER_USEC),
+		.pcc_mrtt = pcc_chan->min_turnaround_time,
+		.pcc_mpar = pcc_chan->max_access_rate,
+		.mbox_client = {
+			.knows_txdone = true,
+		},
+		.pcc_channel_acquired = true,
+	};
+	mutex_lock(&ras2_pcc_subspace_lock);
+	list_add(&pcc_subspace->elem, &ras2_pcc_subspaces);
+	pcc_subspace->ref_count++;
+	mutex_unlock(&ras2_pcc_subspace_lock);
+	ras2_ctx->pcc_subspace = pcc_subspace;
+	ras2_ctx->pcc_comm_addr = pcc_subspace->pcc_comm_addr;
+	ras2_ctx->dev = pcc_chan->mchan->mbox->dev;
+
+	return 0;
+}
+
+static DEFINE_IDA(ras2_ida);
+static void ras2_remove_pcc(struct ras2_mem_ctx *ras2_ctx)
+{
+	struct ras2_pcc_subspace *pcc_subspace = ras2_ctx->pcc_subspace;
+
+	guard(mutex)(&ras2_pcc_subspace_lock);
+	if (pcc_subspace->ref_count > 0)
+		pcc_subspace->ref_count--;
+	if (!pcc_subspace->ref_count) {
+		list_del(&pcc_subspace->elem);
+		pcc_mbox_free_channel(pcc_subspace->pcc_chan);
+		kfree(pcc_subspace);
+	}
+}
+
+static void ras2_release(struct device *device)
+{
+	struct auxiliary_device *auxdev = container_of(device, struct auxiliary_device, dev);
+	struct ras2_mem_ctx *ras2_ctx = container_of(auxdev, struct ras2_mem_ctx, adev);
+
+	ida_free(&ras2_ida, auxdev->id);
+	ras2_remove_pcc(ras2_ctx);
+	kfree(ras2_ctx);
+}
+
+static struct ras2_mem_ctx *ras2_add_aux_device(char *name, int channel)
+{
+	struct ras2_mem_ctx *ras2_ctx;
+	int id, ret;
+
+	ras2_ctx = kzalloc(sizeof(*ras2_ctx), GFP_KERNEL);
+	if (!ras2_ctx)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&ras2_ctx->lock);
+
+	ret = ras2_register_pcc_channel(ras2_ctx, channel);
+	if (ret < 0) {
+		pr_debug("failed to register pcc channel ret=%d\n", ret);
+		goto ctx_free;
+	}
+
+	id = ida_alloc(&ras2_ida, GFP_KERNEL);
+	if (id < 0) {
+		ret = id;
+		goto pcc_free;
+	}
+	ras2_ctx->id = id;
+	ras2_ctx->adev.id = id;
+	ras2_ctx->adev.name = RAS2_MEM_DEV_ID_NAME;
+	ras2_ctx->adev.dev.release = ras2_release;
+	ras2_ctx->adev.dev.parent = ras2_ctx->dev;
+
+	ret = auxiliary_device_init(&ras2_ctx->adev);
+	if (ret)
+		goto ida_free;
+
+	ret = auxiliary_device_add(&ras2_ctx->adev);
+	if (ret) {
+		auxiliary_device_uninit(&ras2_ctx->adev);
+		return ERR_PTR(ret);
+	}
+
+	return ras2_ctx;
+
+ida_free:
+	ida_free(&ras2_ida, id);
+pcc_free:
+	ras2_remove_pcc(ras2_ctx);
+ctx_free:
+	kfree(ras2_ctx);
+	return ERR_PTR(ret);
+}
+
+static int ras2_acpi_parse_table(struct acpi_table_header *pAcpiTable)
+{
+	struct acpi_ras2_pcc_desc *pcc_desc_list;
+	struct acpi_table_ras2 *pRas2Table;
+	struct ras2_mem_ctx *ras2_ctx;
+	int pcc_subspace_id;
+	acpi_size ras2_size;
+	acpi_status status;
+	u8 count = 0, i;
+
+	status = acpi_get_table("RAS2", 0, &pAcpiTable);
+	if (ACPI_FAILURE(status) || !pAcpiTable) {
+		pr_err("ACPI RAS2 driver failed to initialize, get table failed\n");
+		return -EINVAL;
+	}
+
+	ras2_size = pAcpiTable->length;
+	if (ras2_size < sizeof(struct acpi_table_ras2)) {
+		pr_err("ACPI RAS2 table present but broken (too short #1)\n");
+		return -EINVAL;
+	}
+
+	pRas2Table = (struct acpi_table_ras2 *)pAcpiTable;
+	if (pRas2Table->num_pcc_descs <= 0) {
+		pr_err("ACPI RAS2 table does not contain PCC descriptors\n");
+		return -EINVAL;
+	}
+
+	pcc_desc_list = (struct acpi_ras2_pcc_desc *)(pRas2Table + 1);
+	/* Double scan for the case of only one actual controller */
+	pcc_subspace_id = -1;
+	count = 0;
+	for (i = 0; i < pRas2Table->num_pcc_descs; i++, pcc_desc_list++) {
+		if (pcc_desc_list->feature_type != RAS2_FEATURE_TYPE_MEMORY)
+			continue;
+		if (pcc_subspace_id == -1) {
+			pcc_subspace_id = pcc_desc_list->channel_id;
+			count++;
+		}
+		if (pcc_desc_list->channel_id != pcc_subspace_id)
+			count++;
+	}
+	/*
+	 * Workaround for the client platform with multiple scrub devices
+	 * but uses single PCC subspace for communication.
+	 */
+	if (count == 1) {
+		/* Add auxiliary device and bind ACPI RAS2 memory driver */
+		ras2_ctx = ras2_add_aux_device(RAS2_MEM_DEV_ID_NAME, pcc_subspace_id);
+		if (IS_ERR(ras2_ctx))
+			return PTR_ERR(ras2_ctx);
+		return 0;
+	}
+
+	pcc_desc_list = (struct acpi_ras2_pcc_desc *)(pRas2Table + 1);
+	count = 0;
+	for (i = 0; i < pRas2Table->num_pcc_descs; i++, pcc_desc_list++) {
+		if (pcc_desc_list->feature_type != RAS2_FEATURE_TYPE_MEMORY)
+			continue;
+		pcc_subspace_id = pcc_desc_list->channel_id;
+		/* Add auxiliary device and bind ACPI RAS2 memory driver */
+		ras2_ctx = ras2_add_aux_device(RAS2_MEM_DEV_ID_NAME, pcc_subspace_id);
+		if (IS_ERR(ras2_ctx))
+			return PTR_ERR(ras2_ctx);
+	}
+
+	return 0;
+}
+
+static int __init ras2_acpi_init(void)
+{
+	struct acpi_table_header *pAcpiTable = NULL;
+	acpi_status status;
+	int ret;
+
+	status = acpi_get_table("RAS2", 0, &pAcpiTable);
+	if (ACPI_FAILURE(status) || !pAcpiTable) {
+		pr_err("ACPI RAS2 driver failed to initialize, get table failed\n");
+		return -EINVAL;
+	}
+
+	ret = ras2_acpi_parse_table(pAcpiTable);
+	if (ret)
+		pr_err("ras2_acpi_parse_table failed\n");
+
+	acpi_put_table(pAcpiTable);
+
+	return ret;
+}
+late_initcall(ras2_acpi_init)
diff --git a/include/acpi/ras2_acpi.h b/include/acpi/ras2_acpi.h
new file mode 100644
index 000000000000..0d24c42eb34f
--- /dev/null
+++ b/include/acpi/ras2_acpi.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * RAS2 ACPI driver header file
+ *
+ * (C) Copyright 2014, 2015 Hewlett-Packard Enterprises
+ *
+ * Copyright (c) 2024-2025 HiSilicon Limited
+ */
+
+#ifndef _RAS2_ACPI_H
+#define _RAS2_ACPI_H
+
+#include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#define RAS2_PCC_CMD_COMPLETE	BIT(0)
+#define RAS2_PCC_CMD_ERROR	BIT(2)
+
+/* RAS2 specific PCC commands */
+#define RAS2_PCC_CMD_EXEC 0x01
+
+#define RAS2_AUX_DEV_NAME "ras2"
+#define RAS2_MEM_DEV_ID_NAME "acpi_ras2_mem"
+
+/* Data structure RAS2 table */
+struct ras2_mem_ctx {
+	struct auxiliary_device adev;
+	/* Lock to provide mutually exclusive access to PCC channel */
+	struct mutex lock;
+	struct device *dev;
+	struct device *scrub_dev;
+	struct acpi_ras2_shared_memory __iomem *pcc_comm_addr;
+	void *pcc_subspace;
+	u64 base, size;
+	int id;
+	u8 instance;
+	u8 scrub_cycle_hrs;
+	u8 min_scrub_cycle;
+	u8 max_scrub_cycle;
+	bool bg;
+};
+
+int ras2_send_pcc_cmd(struct ras2_mem_ctx *ras2_ctx, u16 cmd);
+#endif /* _RAS2_ACPI_H */
-- 
2.43.0


