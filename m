Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFF05746D
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jun 2019 00:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfFZWjA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Jun 2019 18:39:00 -0400
Received: from mga11.intel.com ([192.55.52.93]:10648 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbfFZWjA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Jun 2019 18:39:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 15:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; 
   d="scan'208";a="313574969"
Received: from spandruv-mobl.amr.corp.intel.com ([10.251.133.109])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2019 15:38:58 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     dvhart@infradead.org, andy@infradead.org,
        andriy.shevchenko@intel.com, corbet@lwn.net
Cc:     rjw@rjwysocki.net, alan@linux.intel.com, lenb@kernel.org,
        prarit@redhat.com, darcari@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 02/10] platform/x86: ISST: Add common API to register and handle ioctls
Date:   Wed, 26 Jun 2019 15:38:43 -0700
Message-Id: <20190626223851.19138-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Encapsulate common functions which all Intel Speed Select Technology
interface drivers can use. This creates API to register misc device for
user kernel communication and handle all common IOCTLs. As part of the
registry it allows a callback which is to handle domain specific ioctl
processing.

There can be multiple drivers register for services, which can be built
as modules. So this driver handle contention during registry and as well
as during removal. Once user space opened the misc device, the registered
driver will be prevented from removal. Also once misc device is opened by
the user space new client driver can't register, till the misc device is
closed.

There are two types of client drivers, one to handle mail box interface
and the other is to allow direct read/write to some specific MMIO space.

This common driver implements IOCTL ISST_IF_GET_PLATFORM_INFO.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/Kconfig                  |   2 +
 drivers/platform/x86/Makefile                 |   1 +
 .../x86/intel_speed_select_if/Kconfig         |  17 ++
 .../x86/intel_speed_select_if/Makefile        |   7 +
 .../intel_speed_select_if/isst_if_common.c    | 182 ++++++++++++++++++
 .../intel_speed_select_if/isst_if_common.h    |  60 ++++++
 include/uapi/linux/isst_if.h                  |  41 ++++
 7 files changed, 310 insertions(+)
 create mode 100644 drivers/platform/x86/intel_speed_select_if/Kconfig
 create mode 100644 drivers/platform/x86/intel_speed_select_if/Makefile
 create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_common.c
 create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_common.h
 create mode 100644 include/uapi/linux/isst_if.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 85b92a95e4c8..24c9aa4ad3d4 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1328,6 +1328,8 @@ config PCENGINES_APU2
 	  To compile this driver as a module, choose M here: the module
 	  will be called pcengines-apuv2.
 
+source "drivers/platform/x86/intel_speed_select_if/Kconfig"
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 87b0069bd781..c43117d17fd8 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -98,3 +98,4 @@ obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
 obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
 obj-$(CONFIG_INTEL_ATOMISP2_PM)	+= intel_atomisp2_pm.o
 obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
+obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE) += intel_speed_select_if/
diff --git a/drivers/platform/x86/intel_speed_select_if/Kconfig b/drivers/platform/x86/intel_speed_select_if/Kconfig
new file mode 100644
index 000000000000..7fc1165ad4c9
--- /dev/null
+++ b/drivers/platform/x86/intel_speed_select_if/Kconfig
@@ -0,0 +1,17 @@
+menu "Intel Speed Select Technology interface support"
+	depends on PCI
+	depends on X86_64 || COMPILE_TEST
+
+config INTEL_SPEED_SELECT_INTERFACE
+	tristate "Intel(R) Speed Select Technology interface drivers"
+	help
+	  This config enables the Intel(R) Speed Select Technology interface
+	  drivers. The Intel(R) speed select technology features are non
+	  architectural and only supported on specific Xeon(R) servers.
+	  These drivers provide interface to directly communicate with hardware
+	  via MMIO and Mail boxes to enumerate and control all the speed select
+	  features.
+
+	  Enable this config, if there is a need to enable and control the
+	  Intel(R) Speed Select Technology features from the user space.
+endmenu
diff --git a/drivers/platform/x86/intel_speed_select_if/Makefile b/drivers/platform/x86/intel_speed_select_if/Makefile
new file mode 100644
index 000000000000..c12687672fc9
--- /dev/null
+++ b/drivers/platform/x86/intel_speed_select_if/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile - Intel Speed Select Interface drivers
+# Copyright (c) 2019, Intel Corporation.
+#
+
+obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE) += isst_if_common.o
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
new file mode 100644
index 000000000000..ab2bb4862dc8
--- /dev/null
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Speed Select Interface: Common functions
+ * Copyright (c) 2019, Intel Corporation.
+ * All rights reserved.
+ *
+ * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
+ */
+
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/isst_if.h>
+
+#include "isst_if_common.h"
+
+static struct isst_if_cmd_cb punit_callbacks[ISST_IF_DEV_MAX];
+
+static int isst_if_get_platform_info(void __user *argp)
+{
+	struct isst_if_platform_info info;
+
+	info.api_version = ISST_IF_API_VERSION,
+	info.driver_version = ISST_IF_DRIVER_VERSION,
+	info.max_cmds_per_ioctl = ISST_IF_CMD_LIMIT,
+	info.mbox_supported = punit_callbacks[ISST_IF_DEV_MBOX].registered;
+	info.mmio_supported = punit_callbacks[ISST_IF_DEV_MMIO].registered;
+
+	if (copy_to_user(argp, &info, sizeof(info)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long isst_if_def_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	long ret = -ENOTTY;
+
+	switch (cmd) {
+	case ISST_IF_GET_PLATFORM_INFO:
+		ret = isst_if_get_platform_info(argp);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static DEFINE_MUTEX(punit_misc_dev_lock);
+static int misc_usage_count;
+static int misc_device_ret;
+static int misc_device_open;
+
+static int isst_if_open(struct inode *inode, struct file *file)
+{
+	int i, ret = 0;
+
+	/* Fail open, if a module is going away */
+	mutex_lock(&punit_misc_dev_lock);
+	for (i = 0; i < ISST_IF_DEV_MAX; ++i) {
+		struct isst_if_cmd_cb *cb = &punit_callbacks[i];
+
+		if (cb->registered && !try_module_get(cb->owner)) {
+			ret = -ENODEV;
+			break;
+		}
+	}
+	if (ret) {
+		int j;
+
+		for (j = 0; j < i; ++j) {
+			struct isst_if_cmd_cb *cb;
+
+			cb = &punit_callbacks[j];
+			if (cb->registered)
+				module_put(cb->owner);
+		}
+	} else {
+		misc_device_open++;
+	}
+	mutex_unlock(&punit_misc_dev_lock);
+
+	return ret;
+}
+
+static int isst_if_relase(struct inode *inode, struct file *f)
+{
+	int i;
+
+	mutex_lock(&punit_misc_dev_lock);
+	misc_device_open--;
+	for (i = 0; i < ISST_IF_DEV_MAX; ++i) {
+		struct isst_if_cmd_cb *cb = &punit_callbacks[i];
+
+		if (cb->registered)
+			module_put(cb->owner);
+	}
+	mutex_unlock(&punit_misc_dev_lock);
+
+	return 0;
+}
+
+static const struct file_operations isst_if_char_driver_ops = {
+	.open = isst_if_open,
+	.unlocked_ioctl = isst_if_def_ioctl,
+	.release = isst_if_relase,
+};
+
+static struct miscdevice isst_if_char_driver = {
+	.minor		= MISC_DYNAMIC_MINOR,
+	.name		= "isst_interface",
+	.fops		= &isst_if_char_driver_ops,
+};
+
+/**
+ * isst_if_cdev_register() - Register callback for IOCTL
+ * @device_type: The device type this callback handling.
+ * @cb:	Callback structure.
+ *
+ * This function registers a callback to device type. On very first call
+ * it will register a misc device, which is used for user kernel interface.
+ * Other calls simply increment ref count. Registry will fail, if the user
+ * already opened misc device for operation. Also if the misc device
+ * creation failed, then it will not try again and all callers will get
+ * failure code.
+ *
+ * Return: Return the return value from the misc creation device or -EINVAL
+ * for unsupported device type.
+ */
+int isst_if_cdev_register(int device_type, struct isst_if_cmd_cb *cb)
+{
+	if (misc_device_ret)
+		return misc_device_ret;
+
+	if (device_type >= ISST_IF_DEV_MAX)
+		return -EINVAL;
+
+	mutex_lock(&punit_misc_dev_lock);
+	if (misc_device_open) {
+		mutex_unlock(&punit_misc_dev_lock);
+		return -EAGAIN;
+	}
+	if (!misc_usage_count) {
+		misc_device_ret = misc_register(&isst_if_char_driver);
+		if (misc_device_ret)
+			goto unlock_exit;
+	}
+	memcpy(&punit_callbacks[device_type], cb, sizeof(*cb));
+	punit_callbacks[device_type].registered = 1;
+	misc_usage_count++;
+unlock_exit:
+	mutex_unlock(&punit_misc_dev_lock);
+
+	return misc_device_ret;
+}
+EXPORT_SYMBOL_GPL(isst_if_cdev_register);
+
+/**
+ * isst_if_cdev_unregister() - Unregister callback for IOCTL
+ * @device_type: The device type to unregister.
+ *
+ * This function unregisters the previously registered callback. If this
+ * is the last callback unregistering, then misc device is removed.
+ *
+ * Return: None.
+ */
+void isst_if_cdev_unregister(int device_type)
+{
+	mutex_lock(&punit_misc_dev_lock);
+	misc_usage_count--;
+	punit_callbacks[device_type].registered = 0;
+	if (!misc_usage_count && !misc_device_ret)
+		misc_deregister(&isst_if_char_driver);
+	mutex_unlock(&punit_misc_dev_lock);
+}
+EXPORT_SYMBOL_GPL(isst_if_cdev_unregister);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.h b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
new file mode 100644
index 000000000000..11f339226fb4
--- /dev/null
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Intel Speed Select Interface: Drivers Internal defines
+ * Copyright (c) 2019, Intel Corporation.
+ * All rights reserved.
+ *
+ * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
+ */
+
+#ifndef __ISST_IF_COMMON_H
+#define __ISST_IF_COMMON_H
+
+/*
+ * Validate maximum commands in a single request.
+ * This is enough to handle command to every core in one ioctl, or all
+ * possible message id to one CPU. Limit is also helpful for resonse time
+ * per IOCTL request, as PUNIT may take different times to process each
+ * request and may hold for long for too many commands.
+ */
+#define ISST_IF_CMD_LIMIT	64
+
+#define ISST_IF_API_VERSION	0x01
+#define ISST_IF_DRIVER_VERSION	0x01
+
+#define ISST_IF_DEV_MBOX	0
+#define ISST_IF_DEV_MMIO	1
+#define ISST_IF_DEV_MAX		2
+
+/**
+ * struct isst_if_cmd_cb - Used to register a IOCTL handler
+ * @registered:	Used by the common code to store registry. Caller don't
+ *		to touch this field
+ * @cmd_size:	The command size of the individual command in IOCTL
+ * @offset:	Offset to the first valid member in command structure.
+ *		This will be the offset of the start of the command
+ *		after command count field
+ * @cmd_callback: Callback function to handle IOCTL. The callback has the
+ *		command pointer with data for command. There is a pointer
+ *		called write_only, which when set, will not copy the
+ *		response to user ioctl buffer. The "resume" argument
+ *		can be used to avoid storing the command for replay
+ *		during system resume
+ *
+ * This structure is used to register an handler for IOCTL. To avoid
+ * code duplication common code handles all the IOCTL command read/write
+ * including handling multiple command in single IOCTL. The caller just
+ * need to execute a command via the registered callback.
+ */
+struct isst_if_cmd_cb {
+	int registered;
+	int cmd_size;
+	int offset;
+	struct module *owner;
+	long (*cmd_callback)(u8 *ptr, int *write_only, int resume);
+};
+
+/* Internal interface functions */
+int isst_if_cdev_register(int type, struct isst_if_cmd_cb *cb);
+void isst_if_cdev_unregister(int type);
+#endif
diff --git a/include/uapi/linux/isst_if.h b/include/uapi/linux/isst_if.h
new file mode 100644
index 000000000000..fa94480b5f74
--- /dev/null
+++ b/include/uapi/linux/isst_if.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Intel Speed Select Interface: OS to hardware Interface
+ * Copyright (c) 2019, Intel Corporation.
+ * All rights reserved.
+ *
+ * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
+ */
+
+#ifndef __ISST_IF_H
+#define __ISST_IF_H
+
+#include <linux/types.h>
+
+/**
+ * struct isst_if_platform_info - Define platform information
+ * @api_version:	Version of the firmware document, which this driver
+ *			can communicate
+ * @driver_version:	Driver version, which will help user to send right
+ *			commands. Even if the firmware is capable, driver may
+ *			not be ready
+ * @max_cmds_per_ioctl:	Returns the maximum number of commands driver will
+ *			accept in a single ioctl
+ * @mbox_supported:	Support of mail box interface
+ * @mmio_supported:	Support of mmio interface for core-power feature
+ *
+ * Used to return output of IOCTL ISST_IF_GET_PLATFORM_INFO. This
+ * information can be used by the user space, to get the driver, firmware
+ * support and also number of commands to send in a single IOCTL request.
+ */
+struct isst_if_platform_info {
+	__u16 api_version;
+	__u16 driver_version;
+	__u16 max_cmds_per_ioctl;
+	__u8 mbox_supported;
+	__u8 mmio_supported;
+};
+
+#define ISST_IF_MAGIC			0xFE
+#define ISST_IF_GET_PLATFORM_INFO	_IOR(ISST_IF_MAGIC, 0, struct isst_if_platform_info *)
+#endif
-- 
2.17.2

