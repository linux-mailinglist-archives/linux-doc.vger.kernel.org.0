Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F89557478
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jun 2019 00:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfFZWjZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jun 2019 18:39:25 -0400
Received: from mga11.intel.com ([192.55.52.93]:10653 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726640AbfFZWjH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Jun 2019 18:39:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 15:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; 
   d="scan'208";a="313575020"
Received: from spandruv-mobl.amr.corp.intel.com ([10.251.133.109])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2019 15:39:05 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     dvhart@infradead.org, andy@infradead.org,
        andriy.shevchenko@intel.com, corbet@lwn.net
Cc:     rjw@rjwysocki.net, alan@linux.intel.com, lenb@kernel.org,
        prarit@redhat.com, darcari@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 09/10] platform/x86: ISST: Restore state on resume
Date:   Wed, 26 Jun 2019 15:38:50 -0700
Message-Id: <20190626223851.19138-10-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commands which causes PUNIT writes, store them and restore them on system
resume. The driver stores all such requests in a hash table and stores the
the latest mailbox request parameters. On resume these commands mail box
commands are executed again. There are only 5 such mail box commands which
will trigger such processing so a very low overhead in store and execute
on resume. Also there is no order requirement for mail box commands for
these write/set commands. There is one MSR request for changing turbo
ratio limits, this also stored and get restored on resume and cpu online.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel_speed_select_if/isst_if_common.c    | 154 ++++++++++++++++++
 .../intel_speed_select_if/isst_if_common.h    |   3 +
 .../intel_speed_select_if/isst_if_mbox_msr.c  |  38 ++++-
 .../intel_speed_select_if/isst_if_mbox_pci.c  |  15 ++
 .../x86/intel_speed_select_if/isst_if_mmio.c  |  49 ++++++
 5 files changed, 258 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
index de2fb5292f1c..68d75391db57 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
@@ -10,6 +10,7 @@
 #include <linux/cpufeature.h>
 #include <linux/cpuhotplug.h>
 #include <linux/fs.h>
+#include <linux/hashtable.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -58,6 +59,151 @@ static const struct isst_cmd_set_req_type isst_cmd_set_reqs[] = {
 	{0x7F, 0x08, 0x00},
 };
 
+struct isst_cmd {
+	struct hlist_node hnode;
+	u64 data;
+	u32 cmd;
+	int cpu;
+	int mbox_cmd_type;
+	u32 param;
+};
+
+static DECLARE_HASHTABLE(isst_hash, 8);
+static DEFINE_MUTEX(isst_hash_lock);
+
+static int isst_store_new_cmd(int cmd, u32 cpu, int mbox_cmd_type, u32 param,
+			      u32 data)
+{
+	struct isst_cmd *sst_cmd;
+
+	sst_cmd = kmalloc(sizeof(*sst_cmd), GFP_KERNEL);
+	if (!sst_cmd)
+		return -ENOMEM;
+
+	sst_cmd->cpu = cpu;
+	sst_cmd->cmd = cmd;
+	sst_cmd->mbox_cmd_type = mbox_cmd_type;
+	sst_cmd->param = param;
+	sst_cmd->data = data;
+
+	hash_add(isst_hash, &sst_cmd->hnode, sst_cmd->cmd);
+
+	return 0;
+}
+
+static void isst_delete_hash(void)
+{
+	struct isst_cmd *sst_cmd;
+	struct hlist_node *tmp;
+	int i;
+
+	hash_for_each_safe(isst_hash, i, tmp, sst_cmd, hnode) {
+		hash_del(&sst_cmd->hnode);
+		kfree(sst_cmd);
+	}
+}
+
+/**
+ * isst_store_cmd() - Store command to a hash table
+ * @cmd: Mailbox command.
+ * @sub_cmd: Mailbox sub-command or MSR id.
+ * @mbox_cmd_type: Mailbox or MSR command.
+ * @param: Mailbox parameter.
+ * @data: Mailbox request data or MSR data.
+ *
+ * Stores the command to a hash table if there is no such command already
+ * stored. If already stored update the latest parameter and data for the
+ * command.
+ *
+ * Return: Return result of store to hash table, 0 for success, others for
+ * failure.
+ */
+int isst_store_cmd(int cmd, int sub_cmd, u32 cpu, int mbox_cmd_type,
+		   u32 param, u64 data)
+{
+	struct isst_cmd *sst_cmd;
+	int full_cmd, ret;
+
+	full_cmd = (cmd & GENMASK_ULL(15, 0)) << 16;
+	full_cmd |= (sub_cmd & GENMASK_ULL(15, 0));
+	mutex_lock(&isst_hash_lock);
+	hash_for_each_possible(isst_hash, sst_cmd, hnode, full_cmd) {
+		if (sst_cmd->cmd == full_cmd && sst_cmd->cpu == cpu &&
+		    sst_cmd->mbox_cmd_type == mbox_cmd_type) {
+			sst_cmd->param = param;
+			sst_cmd->data = data;
+			mutex_unlock(&isst_hash_lock);
+			return 0;
+		}
+	}
+
+	ret = isst_store_new_cmd(full_cmd, cpu, mbox_cmd_type, param, data);
+	mutex_unlock(&isst_hash_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(isst_store_cmd);
+
+static void isst_mbox_resume_command(struct isst_if_cmd_cb *cb,
+				     struct isst_cmd *sst_cmd)
+{
+	struct isst_if_mbox_cmd mbox_cmd;
+	int wr_only;
+
+	mbox_cmd.command = (sst_cmd->cmd & GENMASK_ULL(31, 16)) >> 16;
+	mbox_cmd.sub_command = sst_cmd->cmd & GENMASK_ULL(15, 0);
+	mbox_cmd.parameter = sst_cmd->param;
+	mbox_cmd.req_data = sst_cmd->data;
+	mbox_cmd.logical_cpu = sst_cmd->cpu;
+	(cb->cmd_callback)((u8 *)&mbox_cmd, &wr_only, 1);
+}
+
+/**
+ * isst_resume_common() - Process Resume request
+ *
+ * On resume replay all mailbox commands and MSRs.
+ *
+ * Return: None.
+ */
+void isst_resume_common(void)
+{
+	struct isst_cmd *sst_cmd;
+	int i;
+
+	hash_for_each(isst_hash, i, sst_cmd, hnode) {
+		struct isst_if_cmd_cb *cb;
+
+		if (sst_cmd->mbox_cmd_type) {
+			cb = &punit_callbacks[ISST_IF_DEV_MBOX];
+			if (cb->registered)
+				isst_mbox_resume_command(cb, sst_cmd);
+		} else {
+			wrmsrl_safe_on_cpu(sst_cmd->cpu, sst_cmd->cmd,
+					   sst_cmd->data);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(isst_resume_common);
+
+static void isst_restore_msr_local(int cpu)
+{
+	struct isst_cmd *sst_cmd;
+	int i;
+
+	mutex_lock(&isst_hash_lock);
+	for (i = 0; i < ARRAY_SIZE(punit_msr_white_list); ++i) {
+		if (!punit_msr_white_list[i])
+			break;
+
+		hash_for_each_possible(isst_hash, sst_cmd, hnode,
+				       punit_msr_white_list[i]) {
+			if (!sst_cmd->mbox_cmd_type && sst_cmd->cpu == cpu)
+				wrmsrl_safe(sst_cmd->cmd, sst_cmd->data);
+		}
+	}
+	mutex_unlock(&isst_hash_lock);
+}
+
 /**
  * isst_if_mbox_cmd_invalid() - Check invalid mailbox commands
  * @cmd: Pointer to the command structure to verify.
@@ -185,6 +331,8 @@ static int isst_if_cpu_online(unsigned int cpu)
 	}
 	isst_cpu_info[cpu].punit_cpu_id = data;
 
+	isst_restore_msr_local(cpu);
+
 	return 0;
 }
 
@@ -267,6 +415,10 @@ static long isst_if_msr_cmd_req(u8 *cmd_ptr, int *write_only, int resume)
 					 msr_cmd->msr,
 					 msr_cmd->data);
 		*write_only = 1;
+		if (!ret && !resume)
+			ret = isst_store_cmd(0, msr_cmd->msr,
+					     msr_cmd->logical_cpu,
+					     0, 0, msr_cmd->data);
 	} else {
 		u64 data;
 
@@ -507,6 +659,8 @@ void isst_if_cdev_unregister(int device_type)
 	mutex_lock(&punit_misc_dev_lock);
 	misc_usage_count--;
 	punit_callbacks[device_type].registered = 0;
+	if (device_type == ISST_IF_DEV_MBOX)
+		isst_delete_hash();
 	if (!misc_usage_count && !misc_device_ret) {
 		misc_deregister(&isst_if_char_driver);
 		isst_if_cpu_info_exit();
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.h b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
index 7c0f71221da7..1409a5bb5582 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
@@ -63,4 +63,7 @@ void isst_if_cdev_unregister(int type);
 struct pci_dev *isst_if_get_pci_dev(int cpu, int bus, int dev, int fn);
 bool isst_if_mbox_cmd_set_req(struct isst_if_mbox_cmd *mbox_cmd);
 bool isst_if_mbox_cmd_invalid(struct isst_if_mbox_cmd *cmd);
+int isst_store_cmd(int cmd, int sub_command, u32 cpu, int mbox_cmd,
+		   u32 param, u64 data);
+void isst_resume_common(void);
 #endif
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_msr.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_msr.c
index a949ec436c73..afd0b23be5ba 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_msr.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_msr.c
@@ -12,6 +12,7 @@
 #include <linux/pci.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
+#include <linux/suspend.h>
 #include <linux/topology.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/isst_if.h>
@@ -128,11 +129,37 @@ static long isst_if_mbox_proc_cmd(u8 *cmd_ptr, int *write_only, int resume)
 	if (ret)
 		return ret;
 
+	if (!action.err && !resume && isst_if_mbox_cmd_set_req(action.mbox_cmd))
+		action.err = isst_store_cmd(action.mbox_cmd->command,
+					    action.mbox_cmd->sub_command,
+					    action.mbox_cmd->logical_cpu, 1,
+					    action.mbox_cmd->parameter,
+					    action.mbox_cmd->req_data);
 	*write_only = 0;
 
 	return action.err;
 }
 
+
+static int isst_pm_notify(struct notifier_block *nb,
+			       unsigned long mode, void *_unused)
+{
+	switch (mode) {
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		isst_resume_common();
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static struct notifier_block isst_pm_nb = {
+	.notifier_call = isst_pm_notify,
+};
+
 #define ICPU(model)     { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
 
 static const struct x86_cpu_id isst_if_cpu_ids[] = {
@@ -166,12 +193,21 @@ static int __init isst_if_mbox_init(void)
 	cb.offset = offsetof(struct isst_if_mbox_cmds, mbox_cmd);
 	cb.cmd_callback = isst_if_mbox_proc_cmd;
 	cb.owner = THIS_MODULE;
-	return isst_if_cdev_register(ISST_IF_DEV_MBOX, &cb);
+	ret = isst_if_cdev_register(ISST_IF_DEV_MBOX, &cb);
+	if (ret)
+		return ret;
+
+	ret = register_pm_notifier(&isst_pm_nb);
+	if (ret)
+		isst_if_cdev_unregister(ISST_IF_DEV_MBOX);
+
+	return ret;
 }
 module_init(isst_if_mbox_init)
 
 static void __exit isst_if_mbox_exit(void)
 {
+	unregister_pm_notifier(&isst_pm_nb);
 	isst_if_cdev_unregister(ISST_IF_DEV_MBOX);
 }
 module_exit(isst_if_mbox_exit)
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
index f03e79afd3f1..100a76cc27a5 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mbox_pci.c
@@ -131,6 +131,12 @@ static long isst_if_mbox_proc_cmd(u8 *cmd_ptr, int *write_only, int resume)
 	 */
 	mutex_lock(&punit_dev->mutex);
 	ret = isst_if_mbox_cmd(pdev, mbox_cmd);
+	if (!ret && !resume && isst_if_mbox_cmd_set_req(mbox_cmd))
+		ret = isst_store_cmd(mbox_cmd->command,
+				     mbox_cmd->sub_command,
+				     mbox_cmd->logical_cpu, 1,
+				     mbox_cmd->parameter,
+				     mbox_cmd->req_data);
 	mutex_unlock(&punit_dev->mutex);
 	if (ret)
 		return ret;
@@ -186,11 +192,20 @@ static void isst_if_mbox_remove(struct pci_dev *pdev)
 	mutex_destroy(&punit_dev->mutex);
 }
 
+static int __maybe_unused isst_if_resume(struct device *device)
+{
+	isst_resume_common();
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(isst_if_pm_ops, NULL, isst_if_resume);
+
 static struct pci_driver isst_if_pci_driver = {
 	.name			= "isst_if_mbox_pci",
 	.id_table		= isst_if_mbox_ids,
 	.probe			= isst_if_mbox_probe,
 	.remove			= isst_if_mbox_remove,
+	.driver.pm		= &isst_if_pm_ops,
 };
 
 module_pci_driver(isst_if_pci_driver);
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
index 1c25a1235b9e..f7266a115a08 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
@@ -15,8 +15,20 @@
 
 #include "isst_if_common.h"
 
+struct isst_mmio_range {
+	int beg;
+	int end;
+};
+
+struct isst_mmio_range mmio_range[] = {
+	{0x04, 0x14},
+	{0x20, 0xD0},
+};
+
 struct isst_if_device {
 	void __iomem *punit_mmio;
+	u32 range_0[5];
+	u32 range_1[45];
 	struct mutex mutex;
 };
 
@@ -118,11 +130,48 @@ static void isst_if_remove(struct pci_dev *pdev)
 	mutex_destroy(&punit_dev->mutex);
 }
 
+static int __maybe_unused isst_if_suspend(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct isst_if_device *punit_dev;
+	int i;
+
+	punit_dev = pci_get_drvdata(pdev);
+	for (i = 0; i < ARRAY_SIZE(punit_dev->range_0); ++i)
+		punit_dev->range_0[i] = readl(punit_dev->punit_mmio +
+						mmio_range[0].beg + 4 * i);
+	for (i = 0; i < ARRAY_SIZE(punit_dev->range_1); ++i)
+		punit_dev->range_1[i] = readl(punit_dev->punit_mmio +
+						mmio_range[1].beg + 4 * i);
+
+	return 0;
+}
+
+static int __maybe_unused isst_if_resume(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct isst_if_device *punit_dev;
+	int i;
+
+	punit_dev = pci_get_drvdata(pdev);
+	for (i = 0; i < ARRAY_SIZE(punit_dev->range_0); ++i)
+		writel(punit_dev->range_0[i], punit_dev->punit_mmio +
+						mmio_range[0].beg + 4 * i);
+	for (i = 0; i < ARRAY_SIZE(punit_dev->range_1); ++i)
+		writel(punit_dev->range_1[i], punit_dev->punit_mmio +
+						mmio_range[1].beg + 4 * i);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(isst_if_pm_ops, isst_if_suspend, isst_if_resume);
+
 static struct pci_driver isst_if_pci_driver = {
 	.name			= "isst_if_pci",
 	.id_table		= isst_if_ids,
 	.probe			= isst_if_probe,
 	.remove			= isst_if_remove,
+	.driver.pm		= &isst_if_pm_ops,
 };
 
 module_pci_driver(isst_if_pci_driver);
-- 
2.17.2

