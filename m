Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C95357474
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jun 2019 00:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfFZWjF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jun 2019 18:39:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:10652 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbfFZWjF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Jun 2019 18:39:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 15:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; 
   d="scan'208";a="313575003"
Received: from spandruv-mobl.amr.corp.intel.com ([10.251.133.109])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2019 15:39:02 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     dvhart@infradead.org, andy@infradead.org,
        andriy.shevchenko@intel.com, corbet@lwn.net
Cc:     rjw@rjwysocki.net, alan@linux.intel.com, lenb@kernel.org,
        prarit@redhat.com, darcari@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 06/10] platform/x86: ISST: Add Intel Speed Select mailbox interface via PCI
Date:   Wed, 26 Jun 2019 15:38:47 -0700
Message-Id: <20190626223851.19138-7-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an IOCTL to send mailbox commands to PUNIT using PUNIT PCI device.
A limited set of mailbox commands can be sent to PUNIT.

This MMIO interface is used by the intel-speed-select tool under
tools/x86/power to enumerate and control Intel Speed Select features.
The MBOX commands ids and semantics of the message can be checked from
the source code of the tool.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel_speed_select_if/Makefile        |   1 +
 .../intel_speed_select_if/isst_if_common.c    |  85 ++++++++
 .../intel_speed_select_if/isst_if_common.h    |   3 +
 .../intel_speed_select_if/isst_if_mbox_pci.c  | 199 ++++++++++++++++++
 include/uapi/linux/isst_if.h                  |  38 ++++
 5 files changed, 326 insertions(+)
 create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c

diff --git a/drivers/platform/x86/intel_speed_select_if/Makefile b/drivers/platform/x86/intel_speed_select_if/Makefile
index 7e94919208d3..8dec8c858649 100644
--- a/drivers/platform/x86/intel_speed_select_if/Makefile
+++ b/drivers/platform/x86/intel_speed_select_if/Makefile
@@ -6,3 +6,4 @@
 
 obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE) += isst_if_common.o
 obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE) += isst_if_mmio.o
+obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE) += isst_if_mbox_pci.o
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
index 3f96a3925bc6..391fc3f12161 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
@@ -25,6 +25,86 @@
 
 static struct isst_if_cmd_cb punit_callbacks[ISST_IF_DEV_MAX];
 
+struct isst_valid_cmd_ranges {
+	u16 cmd;
+	u16 sub_cmd_beg;
+	u16 sub_cmd_end;
+};
+
+struct isst_cmd_set_req_type {
+	u16 cmd;
+	u16 sub_cmd;
+	u16 param;
+};
+
+static const struct isst_valid_cmd_ranges isst_valid_cmds[] = {
+	{0xD0, 0x00, 0x03},
+	{0x7F, 0x00, 0x0B},
+	{0x7F, 0x10, 0x12},
+	{0x7F, 0x20, 0x23},
+};
+
+static const struct isst_cmd_set_req_type isst_cmd_set_reqs[] = {
+	{0xD0, 0x00, 0x08},
+	{0xD0, 0x01, 0x08},
+	{0xD0, 0x02, 0x08},
+	{0xD0, 0x03, 0x08},
+	{0x7F, 0x02, 0x00},
+	{0x7F, 0x08, 0x00},
+};
+
+/**
+ * isst_if_mbox_cmd_invalid() - Check invalid mailbox commands
+ * @cmd: Pointer to the command structure to verify.
+ *
+ * Invalid command to PUNIT to may result in instability of the platform.
+ * This function has a whitelist of commands, which are allowed.
+ *
+ * Return: Return true if the command is invalid, else false.
+ */
+bool isst_if_mbox_cmd_invalid(struct isst_if_mbox_cmd *cmd)
+{
+	int i;
+
+	if (cmd->logical_cpu >= nr_cpu_ids)
+		return true;
+
+	for (i = 0; i < ARRAY_SIZE(isst_valid_cmds); ++i) {
+		if (cmd->command == isst_valid_cmds[i].cmd &&
+		    (cmd->sub_command >= isst_valid_cmds[i].sub_cmd_beg &&
+		     cmd->sub_command <= isst_valid_cmds[i].sub_cmd_end)) {
+			return false;
+		}
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(isst_if_mbox_cmd_invalid);
+
+/**
+ * isst_if_mbox_cmd_set_req() - Check mailbox command is a set request
+ * @cmd: Pointer to the command structure to verify.
+ *
+ * Check if the given mail box level is set request and not a get request.
+ *
+ * Return: Return true if the command is set_req, else false.
+ */
+bool isst_if_mbox_cmd_set_req(struct isst_if_mbox_cmd *cmd)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(isst_cmd_set_reqs); ++i) {
+		if (cmd->command == isst_cmd_set_reqs[i].cmd &&
+		    cmd->sub_command == isst_cmd_set_reqs[i].sub_cmd &&
+		    cmd->parameter == isst_cmd_set_reqs[i].param) {
+			return true;
+		}
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(isst_if_mbox_cmd_set_req);
+
 static int isst_if_get_platform_info(void __user *argp)
 {
 	struct isst_if_platform_info info;
@@ -224,6 +304,11 @@ static long isst_if_def_ioctl(struct file *file, unsigned int cmd,
 		if (cb->registered)
 			ret = isst_if_exec_multi_cmd(argp, cb);
 		break;
+	case ISST_IF_MBOX_COMMAND:
+		cb = &punit_callbacks[ISST_IF_DEV_MBOX];
+		if (cb->registered)
+			ret = isst_if_exec_multi_cmd(argp, cb);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.h b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
index cdc7d019748a..7c0f71221da7 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
@@ -11,6 +11,7 @@
 #define __ISST_IF_COMMON_H
 
 #define INTEL_RAPL_PRIO_DEVID_0	0x3451
+#define INTEL_CFG_MBOX_DEVID_0	0x3459
 
 /*
  * Validate maximum commands in a single request.
@@ -60,4 +61,6 @@ struct isst_if_cmd_cb {
 int isst_if_cdev_register(int type, struct isst_if_cmd_cb *cb);
 void isst_if_cdev_unregister(int type);
 struct pci_dev *isst_if_get_pci_dev(int cpu, int bus, int dev, int fn);
+bool isst_if_mbox_cmd_set_req(struct isst_if_mbox_cmd *mbox_cmd);
+bool isst_if_mbox_cmd_invalid(struct isst_if_mbox_cmd *cmd);
 #endif
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
new file mode 100644
index 000000000000..f03e79afd3f1
--- /dev/null
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Speed Select Interface: Mbox via PCI Interface
+ * Copyright (c) 2019, Intel Corporation.
+ * All rights reserved.
+ *
+ * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
+ */
+
+#include <linux/cpufeature.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sched/signal.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/isst_if.h>
+
+#include "isst_if_common.h"
+
+#define PUNIT_MAILBOX_DATA		0xA0
+#define PUNIT_MAILBOX_INTERFACE		0xA4
+#define PUNIT_MAILBOX_BUSY_BIT		31
+
+/*
+ * Commands has variable amount of processing time. Most of the commands will
+ * be done in 0-3 tries, but some takes up to 50.
+ * The real processing time was observed as 25us for the most of the commands
+ * at 2GHz. It is possible to optimize this count taking samples on customer
+ * systems.
+ */
+#define OS_MAILBOX_RETRY_COUNT		50
+
+struct isst_if_device {
+	struct mutex mutex;
+};
+
+static int isst_if_mbox_cmd(struct pci_dev *pdev,
+			    struct isst_if_mbox_cmd *mbox_cmd)
+{
+	u32 retries, data;
+	int ret;
+
+	/* Poll for rb bit == 0 */
+	retries = OS_MAILBOX_RETRY_COUNT;
+	do {
+		ret = pci_read_config_dword(pdev, PUNIT_MAILBOX_INTERFACE,
+					    &data);
+		if (ret)
+			return ret;
+
+		if (data & BIT_ULL(PUNIT_MAILBOX_BUSY_BIT)) {
+			ret = -EBUSY;
+			continue;
+		}
+		ret = 0;
+		break;
+	} while (--retries);
+
+	if (ret)
+		return ret;
+
+	/* Write DATA register */
+	ret = pci_write_config_dword(pdev, PUNIT_MAILBOX_DATA,
+				     mbox_cmd->req_data);
+	if (ret)
+		return ret;
+
+	/* Write command register */
+	data = BIT_ULL(PUNIT_MAILBOX_BUSY_BIT) |
+		      (mbox_cmd->parameter & GENMASK_ULL(13, 0)) << 16 |
+		      (mbox_cmd->sub_command << 8) |
+		      mbox_cmd->command;
+
+	ret = pci_write_config_dword(pdev, PUNIT_MAILBOX_INTERFACE, data);
+	if (ret)
+		return ret;
+
+	/* Poll for rb bit == 0 */
+	retries = OS_MAILBOX_RETRY_COUNT;
+	do {
+		ret = pci_read_config_dword(pdev, PUNIT_MAILBOX_INTERFACE,
+					    &data);
+		if (ret)
+			return ret;
+
+		if (data & BIT_ULL(PUNIT_MAILBOX_BUSY_BIT)) {
+			ret = -EBUSY;
+			continue;
+		}
+
+		if (data & 0xff)
+			return -ENXIO;
+
+		ret = pci_read_config_dword(pdev, PUNIT_MAILBOX_DATA, &data);
+		if (ret)
+			return ret;
+
+		mbox_cmd->resp_data = data;
+		ret = 0;
+		break;
+	} while (--retries);
+
+	return ret;
+}
+
+static long isst_if_mbox_proc_cmd(u8 *cmd_ptr, int *write_only, int resume)
+{
+	struct isst_if_mbox_cmd *mbox_cmd;
+	struct isst_if_device *punit_dev;
+	struct pci_dev *pdev;
+	int ret;
+
+	mbox_cmd = (struct isst_if_mbox_cmd *)cmd_ptr;
+
+	if (isst_if_mbox_cmd_invalid(mbox_cmd))
+		return -EINVAL;
+
+	if (isst_if_mbox_cmd_set_req(mbox_cmd) && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	pdev = isst_if_get_pci_dev(mbox_cmd->logical_cpu, 1, 30, 1);
+	if (!pdev)
+		return -EINVAL;
+
+	punit_dev = pci_get_drvdata(pdev);
+	if (!punit_dev)
+		return -EINVAL;
+
+	/*
+	 * Basically we are allowing one complete mailbox transaction on
+	 * a mapped PCI device at a time.
+	 */
+	mutex_lock(&punit_dev->mutex);
+	ret = isst_if_mbox_cmd(pdev, mbox_cmd);
+	mutex_unlock(&punit_dev->mutex);
+	if (ret)
+		return ret;
+
+	*write_only = 0;
+
+	return 0;
+}
+
+static const struct pci_device_id isst_if_mbox_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, INTEL_CFG_MBOX_DEVID_0)},
+	{ 0 },
+};
+MODULE_DEVICE_TABLE(pci, isst_if_mbox_ids);
+
+static int isst_if_mbox_probe(struct pci_dev *pdev,
+			      const struct pci_device_id *ent)
+{
+	struct isst_if_device *punit_dev;
+	struct isst_if_cmd_cb cb;
+	int ret;
+
+	punit_dev = devm_kzalloc(&pdev->dev, sizeof(*punit_dev), GFP_KERNEL);
+	if (!punit_dev)
+		return -ENOMEM;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	mutex_init(&punit_dev->mutex);
+	pci_set_drvdata(pdev, punit_dev);
+
+	memset(&cb, 0, sizeof(cb));
+	cb.cmd_size = sizeof(struct isst_if_mbox_cmd);
+	cb.offset = offsetof(struct isst_if_mbox_cmds, mbox_cmd);
+	cb.cmd_callback = isst_if_mbox_proc_cmd;
+	cb.owner = THIS_MODULE;
+	ret = isst_if_cdev_register(ISST_IF_DEV_MBOX, &cb);
+
+	if (ret)
+		mutex_destroy(&punit_dev->mutex);
+
+	return ret;
+}
+
+static void isst_if_mbox_remove(struct pci_dev *pdev)
+{
+	struct isst_if_device *punit_dev;
+
+	punit_dev = pci_get_drvdata(pdev);
+	isst_if_cdev_unregister(ISST_IF_DEV_MBOX);
+	mutex_destroy(&punit_dev->mutex);
+}
+
+static struct pci_driver isst_if_pci_driver = {
+	.name			= "isst_if_mbox_pci",
+	.id_table		= isst_if_mbox_ids,
+	.probe			= isst_if_mbox_probe,
+	.remove			= isst_if_mbox_remove,
+};
+
+module_pci_driver(isst_if_pci_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel speed select interface pci mailbox driver");
diff --git a/include/uapi/linux/isst_if.h b/include/uapi/linux/isst_if.h
index fe2492ade078..e4b1c2ec3279 100644
--- a/include/uapi/linux/isst_if.h
+++ b/include/uapi/linux/isst_if.h
@@ -95,8 +95,46 @@ struct isst_if_io_regs {
 	struct isst_if_io_reg io_reg[1];
 };
 
+/**
+ * struct isst_if_mbox_cmd - Structure to define mail box command
+ * @logical_cpu:	Logical CPU number to get target PCI device
+ * @parameter:		Mailbox parameter value
+ * @req_data:		Request data for the mailbox
+ * @resp_data:		Response data for mailbox command response
+ * @command:		Mailbox command value
+ * @sub_command:	Mailbox sub command value
+ * @reserved:		Unused, set to 0
+ *
+ * Structure to specify mailbox command to be sent to PUNIT.
+ */
+struct isst_if_mbox_cmd {
+	__u32 logical_cpu;
+	__u32 parameter;
+	__u32 req_data;
+	__u32 resp_data;
+	__u16 command;
+	__u16 sub_command;
+	__u32 reserved;
+};
+
+/**
+ * struct isst_if_mbox_cmds - structure for mailbox commands
+ * @cmd_count:	Number of mailbox commands in mbox_cmd[]
+ * @mbox_cmd[]:	Holds one or more mbox commands
+ *
+ * This structure used with ioctl ISST_IF_MBOX_COMMAND to send
+ * one or more mailbox commands to PUNIT. Here IOCTL return value
+ * indicates number of commands sent or error number if no commands have
+ * been sent.
+ */
+struct isst_if_mbox_cmds {
+	__u32 cmd_count;
+	struct isst_if_mbox_cmd mbox_cmd[1];
+};
+
 #define ISST_IF_MAGIC			0xFE
 #define ISST_IF_GET_PLATFORM_INFO	_IOR(ISST_IF_MAGIC, 0, struct isst_if_platform_info *)
 #define ISST_IF_GET_PHY_ID		_IOWR(ISST_IF_MAGIC, 1, struct isst_if_cpu_map *)
 #define ISST_IF_IO_CMD		_IOW(ISST_IF_MAGIC, 2, struct isst_if_io_regs *)
+#define ISST_IF_MBOX_COMMAND	_IOWR(ISST_IF_MAGIC, 3, struct isst_if_mbox_cmds *)
 #endif
-- 
2.17.2

