Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8113093E0
	for <lists+linux-doc@lfdr.de>; Sat, 30 Jan 2021 11:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhA3KAQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 30 Jan 2021 05:00:16 -0500
Received: from mga12.intel.com ([192.55.52.136]:24255 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233067AbhA3Crm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 29 Jan 2021 21:47:42 -0500
IronPort-SDR: pvqibxXFBPmQdFLwu9pn9XA0oYdPE9LXzgoTjNyt5bQjDzmJowVOcp1x1UmDCvl2alusoanH+P
 cxRAbvh9fJzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="159675242"
X-IronPort-AV: E=Sophos;i="5.79,387,1602572400"; 
   d="scan'208";a="159675242"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 18:21:28 -0800
IronPort-SDR: 0bJEx7gr46JYUelTHcvfezcRgGTIzgfMK+NQMrpQZEwY7YXAkRYHx1ymZ1b5d68SRSRzfxz5mY
 r3ccxaO2yISQ==
X-IronPort-AV: E=Sophos;i="5.79,387,1602572400"; 
   d="scan'208";a="431263318"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 18:21:28 -0800
Received: from mtg-dev.jf.intel.com (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id 8C5E3636E;
        Fri, 29 Jan 2021 18:21:28 -0800 (PST)
Received: by mtg-dev.jf.intel.com (Postfix, from userid 1000)
        id 80C0E363486; Fri, 29 Jan 2021 18:21:28 -0800 (PST)
From:   mgross@linux.intel.com
To:     markgross@kernel.org, mgross@linux.intel.com, arnd@arndb.de,
        bp@suse.de, damien.lemoal@wdc.com, dragan.cvetic@xilinx.com,
        gregkh@linuxfoundation.org, corbet@lwn.net,
        palmerdabbelt@google.com, paul.walmsley@sifive.com,
        peng.fan@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        jassisinghbrar@gmail.com
Cc:     linux-kernel@vger.kernel.org,
        Seamus Kelly <seamus.kelly@intel.com>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 20/34] xlink-core: Add xlink core driver xLink
Date:   Fri, 29 Jan 2021 18:20:35 -0800
Message-Id: <20210130022124.65083-21-mgross@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210130022124.65083-1-mgross@linux.intel.com>
References: <20210130022124.65083-1-mgross@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Seamus Kelly <seamus.kelly@intel.com>

    Add xLink driver, which provides an abstracted control and communication
    subsystem based on channel identification.
    It is intended to support VPU technology both at SoC level as well as at
    IP level, over multiple interfaces.  This initial patch enables local host
    user mode to open/close/read/write via IOCTLs.

    Specifically the driver enables application/process to:

    * Access a common xLink API across all interfaces from both kernel and
      user space.
    * Call typical APIs types (open, close, read, write) that you would
      associate with a communication interface.
    * Call other APIs that are related to other functions that the
      device can perform e.g. boot, reset get/set device mode.  Device mode
      refers to the power load of the VPU and an API can be used to read and
      control it.
    * Use multiple commnication channels that the driver manages from one
      interface to another, providing routing of data through these multiple
      channels across a single physical interface.

    xLink: Add xLink Core device tree bindings

    Add device tree bindings for the xLink Core driver which enables xLink
    to control and communicate with the VPU IP present on the Intel Keem Bay
    SoC.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Derek Kiernan <derek.kiernan@xilinx.com>
Cc: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Reviewed-by: Mark Gross <mgross@linux.intel.com>
Signed-off-by: Seamus Kelly <seamus.kelly@intel.com>
---
 Documentation/vpu/index.rst                 |   1 +
 Documentation/vpu/xlink-core.rst            |  81 +++
 MAINTAINERS                                 |  12 +
 drivers/misc/Kconfig                        |   1 +
 drivers/misc/Makefile                       |   1 +
 drivers/misc/xlink-core/Kconfig             |  33 +
 drivers/misc/xlink-core/Makefile            |   5 +
 drivers/misc/xlink-core/xlink-core.c        | 738 ++++++++++++++++++++
 drivers/misc/xlink-core/xlink-core.h        |  22 +
 drivers/misc/xlink-core/xlink-defs.h        | 175 +++++
 drivers/misc/xlink-core/xlink-ioctl.c       | 212 ++++++
 drivers/misc/xlink-core/xlink-ioctl.h       |  21 +
 drivers/misc/xlink-core/xlink-multiplexer.c | 534 ++++++++++++++
 drivers/misc/xlink-core/xlink-multiplexer.h |  35 +
 drivers/misc/xlink-core/xlink-platform.c    | 160 +++++
 drivers/misc/xlink-core/xlink-platform.h    |  65 ++
 include/linux/xlink.h                       | 108 +++
 include/uapi/misc/xlink_uapi.h              | 145 ++++
 18 files changed, 2349 insertions(+)
 create mode 100644 Documentation/vpu/xlink-core.rst
 create mode 100644 drivers/misc/xlink-core/Kconfig
 create mode 100644 drivers/misc/xlink-core/Makefile
 create mode 100644 drivers/misc/xlink-core/xlink-core.c
 create mode 100644 drivers/misc/xlink-core/xlink-core.h
 create mode 100644 drivers/misc/xlink-core/xlink-defs.h
 create mode 100644 drivers/misc/xlink-core/xlink-ioctl.c
 create mode 100644 drivers/misc/xlink-core/xlink-ioctl.h
 create mode 100644 drivers/misc/xlink-core/xlink-multiplexer.c
 create mode 100644 drivers/misc/xlink-core/xlink-multiplexer.h
 create mode 100644 drivers/misc/xlink-core/xlink-platform.c
 create mode 100644 drivers/misc/xlink-core/xlink-platform.h
 create mode 100644 include/linux/xlink.h
 create mode 100644 include/uapi/misc/xlink_uapi.h

diff --git a/Documentation/vpu/index.rst b/Documentation/vpu/index.rst
index 49c78bb65b83..cd4272e089ec 100644
--- a/Documentation/vpu/index.rst
+++ b/Documentation/vpu/index.rst
@@ -16,3 +16,4 @@ This documentation contains information for the Intel VPU stack.
    vpu-stack-overview
    xlink-pcie
    xlink-ipc
+   xlink-core
diff --git a/Documentation/vpu/xlink-core.rst b/Documentation/vpu/xlink-core.rst
new file mode 100644
index 000000000000..441c18230491
--- /dev/null
+++ b/Documentation/vpu/xlink-core.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+xLink-core software subsystem
+=============================
+
+The purpose of the xLink software subsystem is to facilitate communication
+between multiple users on multiple nodes in the system.
+
+There are three types of xLink nodes:
+
+1. Remote Host: this is an external IA/x86 host system that is only capable of
+   communicating directly to the Local Host node on VPU 2.x products.
+2. Local Host: this is the ARM core within the VPU 2.x  SoC. The Local Host can
+   communicate upstream to the Remote Host node, and downstream to the VPU IP
+   node.
+3. VPU IP: this is the Leon RT core within the VPU 2.x SoC. The VPU IP can only
+   communicate upstream to the Local Host node.
+
+xLink provides a common API across all interfaces for users to access xLink
+functions and provides user space APIs via an IOCTL interface implemented in
+the xLink core.
+
+xLink manages communications from one interface to another and provides routing
+of data through multiple channels across a single physical interface.
+
+It exposes a common API across all interfaces at both kernel and user levels
+for processes/applications to access.
+
+It has typical API types (open, close, read, write) that you would associate
+with a communication interface.
+
+It also has other APIs that are related to other functions that the device can
+perform, e.g. boot, reset get/set device mode.
+The driver is broken down into 4 source files.
+
+xlink-core:
+Contains driver initialization, driver API and IOCTL interface (for user
+space).
+
+xlink-multiplexer:
+The Multiplexer component is responsible for securely routing messages through
+multiple communication channels over a single physical interface.
+
+xlink-dispatcher:
+The Dispatcher component is responsible for queueing and handling xLink
+communication requests from all users in the system and invoking the underlying
+platform interface drivers.
+
+xlink-platform:
+provides abstraction to each interface supported (PCIe, USB, IPC, etc).
+
+Typical xLink transaction (simplified):
+When a user wants to send data across an interface via xLink it firstly calls
+xlink connect which connects to the relevant interface (PCIe, USB, IPC, etc.)
+and then xlink open channel.
+
+Then it calls xlink write function. This takes the data, passes it to the
+kernel which packages up the data and channel and then adds it to a transmit
+queue.
+
+A separate thread reads this transaction queue and pops off data if available
+and passes the data to the underlying interface (e.g. PCIe) write function.
+Using this thread provides serialization of transactions and decouples the user
+write from the platform write.
+
+On the other side of the interface, a thread is continually reading the
+interface (e.g. PCIe) via the platform interface read function and if it reads
+any data it adds it to channel packet container.
+
+The application at this side of the interface will have called xlink connect,
+opened the channel and called xlink read function to read data from the
+interface and if any exists for that channel, the data gets popped from the
+channel packet container and copied from kernel space to user space buffer
+provided by the call.
+
+xLink can handle API requests from multi-process and multi-threaded
+application/processes.
+
+xLink maintains 4096 channels per device connected (via xlink connect) and
+maintains a separate channel infrastructure for each device.
diff --git a/MAINTAINERS b/MAINTAINERS
index 22a7a1b03601..2b5631ced220 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1961,6 +1961,12 @@ F:	Documentation/devicetree/bindings/arm/intel,keembay.yaml
 F:	arch/arm64/boot/dts/intel/keembay-evm.dts
 F:	arch/arm64/boot/dts/intel/keembay-soc.dtsi
 
+ARM/INTEL XLINK CORE SUPPORT
+M:	Seamus Kelly <seamus.kelly@intel.com>
+M:	Mark Gross <mgross@linux.intel.com>
+S:	Supported
+F:	drivers/misc/xlink-core/
+
 ARM/INTEL XLINK IPC SUPPORT
 M:	Seamus Kelly <seamus.kelly@intel.com>
 M:	Mark Gross <mgross@linux.intel.com>
@@ -1973,6 +1979,12 @@ M:	Mark Gross <mgross@linux.intel.com>
 S:	Supported
 F:	drivers/misc/xlink-pcie/
 
+ARM/INTEL TSENS SUPPORT
+M:	Udhayakumar C <udhayakumar.c@intel.com>
+S:	Supported
+F:	drivers/misc/hddl_device/
+F:	drivers/misc/intel_tsens/
+
 ARM/INTEL RESEARCH IMOTE/STARGATE 2 MACHINE SUPPORT
 M:	Jonathan Cameron <jic23@cam.ac.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 1f81ea915b95..09ae65e98681 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -483,4 +483,5 @@ source "drivers/misc/habanalabs/Kconfig"
 source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/xlink-pcie/Kconfig"
 source "drivers/misc/xlink-ipc/Kconfig"
+source "drivers/misc/xlink-core/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b51495a2f1e0..f3a6eb03bae9 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
 obj-y                           += xlink-pcie/
 obj-$(CONFIG_XLINK_IPC)		+= xlink-ipc/
+obj-$(CONFIG_XLINK_CORE)	+= xlink-core/
diff --git a/drivers/misc/xlink-core/Kconfig b/drivers/misc/xlink-core/Kconfig
new file mode 100644
index 000000000000..a0ceb0b48219
--- /dev/null
+++ b/drivers/misc/xlink-core/Kconfig
@@ -0,0 +1,33 @@
+config XLINK_CORE
+	tristate "Support for XLINK CORE"
+	depends on ((XLINK_PCIE_RH_DRIVER || XBAY_XLINK_PCIE_RH_DRIVER) || (XLINK_LOCAL_HOST && (XLINK_PCIE_LH_DRIVER || XBAY_XLINK_PCIE_RH_DRIVER)))
+	help
+	  XLINK CORE enables the communication/control subsystem.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called xlink.ko.
+
+config XLINK_LOCAL_HOST
+	tristate "Support for XLINK LOCAL HOST"
+	depends on XLINK_IPC
+	help
+	  XLINK LOCAL HOST enables local host functionality for
+	  the communication/control Sub-System.
+
+	  Enable this config when building the kernel for the Intel Vision
+	  Processing Unit (VPU) Local Host core.
+
+	  If building for a Remote Host kernel, say N.
+
+config XLINK_PSS
+	tristate "Support for XLINK PSS (Pre-Silicon Solution)"
+	depends on XLINK_LOCAL_HOST
+	help
+	  XLINK PSS enables the communication/control subsystem on a PSS platform.
+
+	  Enable this config when building the kernel for the Intel Vision
+	  Processing Unit (VPU) in a simulated env.
+
+	  If building for a VPU silicon, say N.
diff --git a/drivers/misc/xlink-core/Makefile b/drivers/misc/xlink-core/Makefile
new file mode 100644
index 000000000000..e82b7c72b6b9
--- /dev/null
+++ b/drivers/misc/xlink-core/Makefile
@@ -0,0 +1,5 @@
+#
+# Makefile for Keem Bay xlink Linux driver
+#
+obj-$(CONFIG_XLINK_CORE) += xlink.o
+xlink-objs += xlink-core.o xlink-multiplexer.o xlink-platform.o xlink-ioctl.o
diff --git a/drivers/misc/xlink-core/xlink-core.c b/drivers/misc/xlink-core/xlink-core.c
new file mode 100644
index 000000000000..dd8db834c184
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-core.c
@@ -0,0 +1,738 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * xlink Core Driver.
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/fs.h>
+#include <linux/cdev.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/kref.h>
+
+#ifdef CONFIG_XLINK_LOCAL_HOST
+#include <linux/xlink-ipc.h>
+#endif
+
+#include "xlink-core.h"
+#include "xlink-defs.h"
+#include "xlink-ioctl.h"
+#include "xlink-multiplexer.h"
+#include "xlink-platform.h"
+
+// xlink version number
+#define XLINK_VERSION_MAJOR		0
+#define XLINK_VERSION_MINOR		1
+#define XLINK_VERSION_REVISION		2
+#define XLINK_VERSION_SUB_REV		"a"
+
+// timeout in milliseconds used to wait for the reay message from the VPU
+#ifdef CONFIG_XLINK_PSS
+#define XLINK_VPU_WAIT_FOR_READY (3000000)
+#else
+#define XLINK_VPU_WAIT_FOR_READY (3000)
+#endif
+
+// device, class, and driver names
+#define DEVICE_NAME	"xlnk"
+#define CLASS_NAME	"xlkcore"
+#define DRV_NAME	"xlink-driver"
+
+// used to determine if an API was called from user or kernel space
+#define CHANNEL_SET_USER_BIT(chan)	((chan) |= (1 << 15))
+#define CHANNEL_USER_BIT_IS_SET(chan)	((chan) & (1 << 15))
+#define CHANNEL_CLEAR_USER_BIT(chan)	((chan) &= ~(1 << 15))
+
+static dev_t xdev;
+static struct class *dev_class;
+static struct cdev xlink_cdev;
+
+static long xlink_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
+
+static const struct file_operations fops = {
+		.owner		= THIS_MODULE,
+		.unlocked_ioctl = xlink_ioctl,
+};
+
+struct xlink_link {
+	u32 id;
+	struct xlink_handle handle;
+	struct kref refcount;
+};
+
+struct keembay_xlink_dev {
+	struct platform_device *pdev;
+	struct xlink_link links[XLINK_MAX_CONNECTIONS];
+	u32 nmb_connected_links;
+	struct mutex lock;  // protect access to xlink_dev
+};
+
+/*
+ * global variable pointing to our xlink device.
+ *
+ * This is meant to be used only when platform_get_drvdata() cannot be used
+ * because we lack a reference to our platform_device.
+ */
+static struct keembay_xlink_dev *xlink;
+
+/*
+ * get_next_link() - Searches the list of links to find the next available.
+ *
+ * Note: This function is only used in xlink_connect, where the xlink mutex is
+ * already locked.
+ *
+ * Return: the next available link, or NULL if maximum connections reached.
+ */
+static struct xlink_link *get_next_link(void)
+{
+	struct xlink_link *link = NULL;
+	int i;
+
+	for (i = 0; i < XLINK_MAX_CONNECTIONS; i++) {
+		if (xlink->links[i].handle.sw_device_id == XLINK_INVALID_SW_DEVICE_ID) {
+			link = &xlink->links[i];
+			break;
+		}
+	}
+	return link;
+}
+
+/*
+ * get_link_by_sw_device_id()
+ *
+ * Searches the list of links to find a link by sw device id.
+ *
+ * Return: the handle, or NULL if the handle is not found.
+ */
+static struct xlink_link *get_link_by_sw_device_id(u32 sw_device_id)
+{
+	struct xlink_link *link = NULL;
+	int i;
+
+	mutex_lock(&xlink->lock);
+	for (i = 0; i < XLINK_MAX_CONNECTIONS; i++) {
+		if (xlink->links[i].handle.sw_device_id == sw_device_id) {
+			link = &xlink->links[i];
+			break;
+		}
+	}
+	mutex_unlock(&xlink->lock);
+	return link;
+}
+
+// For now , do nothing and leave for further consideration
+static void release_after_kref_put(struct kref *ref) {}
+
+/* Driver probing. */
+static int kmb_xlink_probe(struct platform_device *pdev)
+{
+	struct keembay_xlink_dev *xlink_dev;
+	struct device *dev_ret;
+	int rc, i;
+
+	dev_info(&pdev->dev, "Keem Bay xlink v%d.%d.%d:%s\n", XLINK_VERSION_MAJOR,
+		 XLINK_VERSION_MINOR, XLINK_VERSION_REVISION, XLINK_VERSION_SUB_REV);
+
+	xlink_dev = devm_kzalloc(&pdev->dev, sizeof(*xlink), GFP_KERNEL);
+	if (!xlink_dev)
+		return -ENOMEM;
+
+	xlink_dev->pdev = pdev;
+
+	// initialize multiplexer
+	rc = xlink_multiplexer_init(xlink_dev->pdev);
+	if (rc != X_LINK_SUCCESS) {
+		pr_err("Multiplexer initialization failed\n");
+		goto r_multiplexer;
+	}
+
+	// initialize xlink data structure
+	xlink_dev->nmb_connected_links = 0;
+	mutex_init(&xlink_dev->lock);
+	for (i = 0; i < XLINK_MAX_CONNECTIONS; i++) {
+		xlink_dev->links[i].id = i;
+		xlink_dev->links[i].handle.sw_device_id =
+				XLINK_INVALID_SW_DEVICE_ID;
+	}
+
+	platform_set_drvdata(pdev, xlink_dev);
+
+	/* Set the global reference to our device. */
+	xlink = xlink_dev;
+
+	/*Allocating Major number*/
+	if ((alloc_chrdev_region(&xdev, 0, 1, "xlinkdev")) < 0) {
+		dev_info(&pdev->dev, "Cannot allocate major number\n");
+		goto r_multiplexer;
+	}
+	dev_info(&pdev->dev, "Major = %d Minor = %d\n", MAJOR(xdev),
+		 MINOR(xdev));
+
+	/*Creating struct class*/
+	dev_class = class_create(THIS_MODULE, CLASS_NAME);
+	if (IS_ERR(dev_class)) {
+		dev_info(&pdev->dev, "Cannot create the struct class - Err %ld\n",
+			 PTR_ERR(dev_class));
+		goto r_class;
+	}
+
+	/*Creating device*/
+	dev_ret = device_create(dev_class, NULL, xdev, NULL, DEVICE_NAME);
+	if (IS_ERR(dev_ret)) {
+		dev_info(&pdev->dev, "Cannot create the Device 1 - Err %ld\n",
+			 PTR_ERR(dev_ret));
+		goto r_device;
+	}
+	dev_info(&pdev->dev, "Device Driver Insert...Done!!!\n");
+
+	/*Creating cdev structure*/
+	cdev_init(&xlink_cdev, &fops);
+
+	/*Adding character device to the system*/
+	if ((cdev_add(&xlink_cdev, xdev, 1)) < 0) {
+		dev_info(&pdev->dev, "Cannot add the device to the system\n");
+		goto r_class;
+	}
+
+	return 0;
+
+r_device:
+	class_destroy(dev_class);
+r_class:
+	unregister_chrdev_region(xdev, 1);
+r_multiplexer:
+	xlink_multiplexer_destroy();
+	return -1;
+}
+
+/* Driver removal. */
+static int kmb_xlink_remove(struct platform_device *pdev)
+{
+	int rc;
+
+	mutex_lock(&xlink->lock);
+	// destroy multiplexer
+	rc = xlink_multiplexer_destroy();
+	if (rc != X_LINK_SUCCESS)
+		pr_err("Multiplexer destroy failed\n");
+
+	mutex_unlock(&xlink->lock);
+	mutex_destroy(&xlink->lock);
+	// unregister and destroy device
+	unregister_chrdev_region(xdev, 1);
+	device_destroy(dev_class, xdev);
+	cdev_del(&xlink_cdev);
+	class_destroy(dev_class);
+	pr_info("XLink Driver removed\n");
+	return 0;
+}
+
+/*
+ * IOCTL function for User Space access to xlink kernel functions
+ *
+ */
+
+static long xlink_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	int rc;
+
+	switch (cmd) {
+	case XL_CONNECT:
+		rc = ioctl_connect(arg);
+		break;
+	case XL_OPEN_CHANNEL:
+		rc = ioctl_open_channel(arg);
+		break;
+	case XL_READ_DATA:
+		rc = ioctl_read_data(arg);
+		break;
+	case XL_WRITE_DATA:
+		rc = ioctl_write_data(arg);
+		break;
+	case XL_WRITE_VOLATILE:
+		rc = ioctl_write_volatile_data(arg);
+		break;
+	case XL_RELEASE_DATA:
+		rc = ioctl_release_data(arg);
+		break;
+	case XL_CLOSE_CHANNEL:
+		rc = ioctl_close_channel(arg);
+		break;
+	case XL_DISCONNECT:
+		rc = ioctl_disconnect(arg);
+		break;
+	}
+	if (rc)
+		return -EIO;
+	else
+		return 0;
+}
+
+/*
+ * xlink Kernel API.
+ */
+
+enum xlink_error xlink_initialize(void)
+{
+	return X_LINK_SUCCESS;
+}
+EXPORT_SYMBOL_GPL(xlink_initialize);
+
+enum xlink_error xlink_connect(struct xlink_handle *handle)
+{
+	struct xlink_link *link;
+	enum xlink_error rc;
+	int interface;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	mutex_lock(&xlink->lock);
+	if (!link) {
+		link = get_next_link();
+		if (!link) {
+			pr_err("max connections reached %d\n",
+			       XLINK_MAX_CONNECTIONS);
+			mutex_unlock(&xlink->lock);
+			return X_LINK_ERROR;
+		}
+		// platform connect
+		interface = get_interface_from_sw_device_id(handle->sw_device_id);
+		rc = xlink_platform_connect(interface, handle->sw_device_id);
+		if (rc) {
+			pr_err("platform connect failed %d\n", rc);
+			mutex_unlock(&xlink->lock);
+			return X_LINK_ERROR;
+		}
+		// set link handle reference and link id
+		link->handle = *handle;
+		xlink->nmb_connected_links++;
+		kref_init(&link->refcount);
+		// initialize multiplexer connection
+		rc = xlink_multiplexer_connect(link->id);
+		if (rc) {
+			pr_err("multiplexer connect failed\n");
+			goto r_cleanup;
+		}
+		pr_info("dev 0x%x connected - dev_type %d - nmb_connected_links %d\n",
+			link->handle.sw_device_id,
+			link->handle.dev_type,
+			xlink->nmb_connected_links);
+	} else {
+		// already connected
+		pr_info("dev 0x%x ALREADY connected - dev_type %d\n",
+			link->handle.sw_device_id,
+			link->handle.dev_type);
+		kref_get(&link->refcount);
+		*handle = link->handle;
+	}
+	mutex_unlock(&xlink->lock);
+	// TODO: implement ping
+	return X_LINK_SUCCESS;
+
+r_cleanup:
+	link->handle.sw_device_id = XLINK_INVALID_SW_DEVICE_ID;
+	mutex_unlock(&xlink->lock);
+	return X_LINK_ERROR;
+}
+EXPORT_SYMBOL_GPL(xlink_connect);
+
+enum xlink_error xlink_open_channel(struct xlink_handle *handle,
+				    u16 chan, enum xlink_opmode mode,
+				    u32 data_size, u32 timeout)
+{
+	struct xlink_event *event;
+	struct xlink_link *link;
+	int event_queued = 0;
+	enum xlink_error rc;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_OPEN_CHANNEL_REQ,
+				   &link->handle, chan, data_size, timeout);
+	if (!event)
+		return X_LINK_ERROR;
+
+	event->data = (void *)mode;
+	rc = xlink_multiplexer_tx(event, &event_queued);
+	if (!event_queued)
+		xlink_destroy_event(event);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(xlink_open_channel);
+
+enum xlink_error xlink_close_channel(struct xlink_handle *handle,
+				     u16 chan)
+{
+	struct xlink_event *event;
+	struct xlink_link *link;
+	enum xlink_error rc;
+	int event_queued = 0;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_CLOSE_CHANNEL_REQ,
+				   &link->handle, chan, 0, 0);
+	if (!event)
+		return X_LINK_ERROR;
+
+	rc = xlink_multiplexer_tx(event, &event_queued);
+	if (!event_queued)
+		xlink_destroy_event(event);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(xlink_close_channel);
+
+enum xlink_error xlink_write_data(struct xlink_handle *handle,
+				  u16 chan, u8 const *pmessage, u32 size)
+{
+	struct xlink_event *event;
+	struct xlink_link *link;
+	enum xlink_error rc;
+	int event_queued = 0;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	if (size > XLINK_MAX_DATA_SIZE)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_WRITE_REQ, &link->handle,
+				   chan, size, 0);
+	if (!event)
+		return X_LINK_ERROR;
+
+	if (chan < XLINK_IPC_MAX_CHANNELS &&
+	    event->interface == IPC_INTERFACE) {
+		/* only passing message address across IPC interface */
+		event->data = &pmessage;
+		rc = xlink_multiplexer_tx(event, &event_queued);
+		xlink_destroy_event(event);
+	} else {
+		event->data = (u8 *)pmessage;
+		event->paddr = 0;
+		rc = xlink_multiplexer_tx(event, &event_queued);
+		if (!event_queued)
+			xlink_destroy_event(event);
+	}
+	return rc;
+}
+EXPORT_SYMBOL_GPL(xlink_write_data);
+
+enum xlink_error xlink_write_data_user(struct xlink_handle *handle,
+				       u16 chan, u8 const *pmessage,
+				       u32 size)
+{
+	struct xlink_event *event;
+	struct xlink_link *link;
+	enum xlink_error rc;
+	int event_queued = 0;
+	dma_addr_t paddr = 0;
+	u32 addr;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	if (size > XLINK_MAX_DATA_SIZE)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_WRITE_REQ, &link->handle,
+				   chan, size, 0);
+	if (!event)
+		return X_LINK_ERROR;
+	event->user_data = 1;
+
+	if (chan < XLINK_IPC_MAX_CHANNELS &&
+	    event->interface == IPC_INTERFACE) {
+		/* only passing message address across IPC interface */
+		if (get_user(addr, (u32 __user *)pmessage)) {
+			xlink_destroy_event(event);
+			return X_LINK_ERROR;
+		}
+		event->data = &addr;
+		rc = xlink_multiplexer_tx(event, &event_queued);
+		xlink_destroy_event(event);
+	} else {
+		event->data = xlink_platform_allocate(&xlink->pdev->dev, &paddr,
+						      size,
+						      XLINK_PACKET_ALIGNMENT,
+						      XLINK_NORMAL_MEMORY);
+		if (!event->data) {
+			xlink_destroy_event(event);
+			return X_LINK_ERROR;
+		}
+		if (copy_from_user(event->data, (void __user *)pmessage, size)) {
+			xlink_platform_deallocate(&xlink->pdev->dev,
+						  event->data, paddr, size,
+						  XLINK_PACKET_ALIGNMENT,
+						  XLINK_NORMAL_MEMORY);
+			xlink_destroy_event(event);
+			return X_LINK_ERROR;
+		}
+		event->paddr = paddr;
+		rc = xlink_multiplexer_tx(event, &event_queued);
+		if (!event_queued) {
+			xlink_platform_deallocate(&xlink->pdev->dev,
+						  event->data, paddr, size,
+						  XLINK_PACKET_ALIGNMENT,
+						  XLINK_NORMAL_MEMORY);
+			xlink_destroy_event(event);
+		}
+	}
+	return rc;
+}
+
+enum xlink_error xlink_write_volatile(struct xlink_handle *handle,
+				      u16 chan, u8 const *message, u32 size)
+{
+	enum xlink_error rc = 0;
+
+	rc = do_xlink_write_volatile(handle, chan, message, size, 0);
+	return rc;
+}
+
+enum xlink_error do_xlink_write_volatile(struct xlink_handle *handle,
+					 u16 chan, u8 const *message,
+					 u32 size, u32 user_flag)
+{
+	enum xlink_error rc = 0;
+	struct xlink_link *link = NULL;
+	struct xlink_event *event = NULL;
+	int event_queued = 0;
+	dma_addr_t paddr;
+	int region = 0;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	if (size > XLINK_MAX_BUF_SIZE)
+		return X_LINK_ERROR; // TODO: XLink Parameter Error
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_WRITE_VOLATILE_REQ,
+				   &link->handle, chan, size, 0);
+	if (!event)
+		return X_LINK_ERROR;
+
+	region = XLINK_NORMAL_MEMORY;
+	event->data = xlink_platform_allocate(&xlink->pdev->dev, &paddr, size,
+					      XLINK_PACKET_ALIGNMENT, region);
+	if (!event->data) {
+		xlink_destroy_event(event);
+		return X_LINK_ERROR;
+	}
+	memcpy(event->data, message, size);
+	event->user_data = user_flag;
+	event->paddr = paddr;
+	rc = xlink_multiplexer_tx(event, &event_queued);
+	if (!event_queued) {
+		xlink_platform_deallocate(&xlink->pdev->dev, event->data, paddr, size,
+					  XLINK_PACKET_ALIGNMENT, region);
+		xlink_destroy_event(event);
+	}
+	return rc;
+}
+
+enum xlink_error xlink_read_data(struct xlink_handle *handle,
+				 u16 chan, u8 **pmessage, u32 *size)
+{
+	struct xlink_event *event;
+	struct xlink_link *link;
+	int event_queued = 0;
+	enum xlink_error rc;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_READ_REQ, &link->handle,
+				   chan, *size, 0);
+	if (!event)
+		return X_LINK_ERROR;
+
+	event->pdata = (void **)pmessage;
+	event->length = size;
+	rc = xlink_multiplexer_tx(event, &event_queued);
+	if (!event_queued)
+		xlink_destroy_event(event);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(xlink_read_data);
+
+enum xlink_error xlink_read_data_to_buffer(struct xlink_handle *handle,
+					   u16 chan, u8 *const message, u32 *size)
+{
+	enum xlink_error rc = 0;
+	struct xlink_link *link = NULL;
+	struct xlink_event *event = NULL;
+	int event_queued = 0;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_READ_TO_BUFFER_REQ,
+				   &link->handle, chan, *size, 0);
+	if (!event)
+		return X_LINK_ERROR;
+
+	event->data = message;
+	event->length = size;
+	rc = xlink_multiplexer_tx(event, &event_queued);
+	if (!event_queued)
+		xlink_destroy_event(event);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(xlink_read_data_to_buffer);
+
+enum xlink_error xlink_release_data(struct xlink_handle *handle,
+				    u16 chan, u8 * const data_addr)
+{
+	struct xlink_event *event;
+	struct xlink_link *link;
+	int event_queued = 0;
+	enum xlink_error rc;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	event = xlink_create_event(link->id, XLINK_RELEASE_REQ, &link->handle,
+				   chan, 0, 0);
+	if (!event)
+		return X_LINK_ERROR;
+
+	event->data = data_addr;
+	rc = xlink_multiplexer_tx(event, &event_queued);
+	if (!event_queued)
+		xlink_destroy_event(event);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(xlink_release_data);
+
+enum xlink_error xlink_disconnect(struct xlink_handle *handle)
+{
+	struct xlink_link *link;
+	enum xlink_error rc = X_LINK_ERROR;
+
+	if (!xlink || !handle)
+		return X_LINK_ERROR;
+
+	link = get_link_by_sw_device_id(handle->sw_device_id);
+	if (!link)
+		return X_LINK_ERROR;
+
+	// decrement refcount, if count is 0 lock mutex and disconnect
+	if (kref_put_mutex(&link->refcount, release_after_kref_put,
+			   &xlink->lock)) {
+		// deinitialize multiplexer connection
+		rc = xlink_multiplexer_disconnect(link->id);
+		if (rc) {
+			pr_err("multiplexer disconnect failed\n");
+			mutex_unlock(&xlink->lock);
+			return X_LINK_ERROR;
+		}
+		// TODO: reset device?
+		// invalidate link handle reference
+		link->handle.sw_device_id = XLINK_INVALID_SW_DEVICE_ID;
+		xlink->nmb_connected_links--;
+		mutex_unlock(&xlink->lock);
+	}
+	return rc;
+}
+EXPORT_SYMBOL_GPL(xlink_disconnect);
+
+/* Device tree driver match. */
+static const struct of_device_id kmb_xlink_of_match[] = {
+	{
+		.compatible = "intel,keembay-xlink",
+	},
+	{}
+};
+
+/* The xlink driver is a platform device. */
+static struct platform_driver kmb_xlink_driver = {
+	.probe = kmb_xlink_probe,
+	.remove = kmb_xlink_remove,
+	.driver = {
+			.name = DRV_NAME,
+			.of_match_table = kmb_xlink_of_match,
+		},
+};
+
+/*
+ * The remote host system will need to create an xlink platform
+ * device for the platform driver to match with
+ */
+#ifndef CONFIG_XLINK_LOCAL_HOST
+static struct platform_device pdev;
+static void kmb_xlink_release(struct device *dev) { return; }
+#endif
+
+static int kmb_xlink_init(void)
+{
+	int rc;
+
+	rc = platform_driver_register(&kmb_xlink_driver);
+#ifndef CONFIG_XLINK_LOCAL_HOST
+	pdev.dev.release = kmb_xlink_release;
+	pdev.name = DRV_NAME;
+	pdev.id = -1;
+	if (!rc) {
+		rc = platform_device_register(&pdev);
+		if (rc)
+			platform_driver_unregister(&kmb_xlink_driver);
+	}
+#endif
+	return rc;
+}
+module_init(kmb_xlink_init);
+
+static void kmb_xlink_exit(void)
+{
+#ifndef CONFIG_XLINK_LOCAL_HOST
+	platform_device_unregister(&pdev);
+#endif
+	platform_driver_unregister(&kmb_xlink_driver);
+}
+module_exit(kmb_xlink_exit);
+
+MODULE_DESCRIPTION("Keem Bay xlink Kernel Driver");
+MODULE_AUTHOR("Seamus Kelly <seamus.kelly@intel.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/misc/xlink-core/xlink-core.h b/drivers/misc/xlink-core/xlink-core.h
new file mode 100644
index 000000000000..5ba7ac653bf7
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-core.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xlink core header file.
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+
+#ifndef XLINK_CORE_H_
+#define XLINK_CORE_H_
+#include "xlink-defs.h"
+
+#define NUM_REG_EVENTS 4
+
+enum xlink_error do_xlink_write_volatile(struct xlink_handle *handle,
+					 u16 chan, u8 const *message,
+					 u32 size, u32 user_flag);
+
+enum xlink_error xlink_write_data_user(struct xlink_handle *handle,
+				       u16 chan, u8 const *pmessage,
+				       u32 size);
+#endif /* XLINK_CORE_H_ */
diff --git a/drivers/misc/xlink-core/xlink-defs.h b/drivers/misc/xlink-core/xlink-defs.h
new file mode 100644
index 000000000000..09aee36d5542
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-defs.h
@@ -0,0 +1,175 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xlink Defines.
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#ifndef __XLINK_DEFS_H
+#define __XLINK_DEFS_H
+
+#include <linux/slab.h>
+#include <linux/xlink.h>
+
+#define XLINK_MAX_BUF_SIZE		128U
+#define XLINK_MAX_DATA_SIZE		(1024U * 1024U * 1024U)
+#define XLINK_MAX_CONTROL_DATA_SIZE	100U
+#define XLINK_MAX_CONNECTIONS		16
+#define XLINK_PACKET_ALIGNMENT		64
+#define XLINK_INVALID_EVENT_ID		0xDEADBEEF
+#define XLINK_INVALID_CHANNEL_ID	0xDEAD
+#define XLINK_PACKET_QUEUE_CAPACITY	10000
+#define XLINK_EVENT_QUEUE_CAPACITY	10000
+#define XLINK_EVENT_HEADER_MAGIC	0x786C6E6B
+#define XLINK_PING_TIMEOUT_MS		5000U
+#define XLINK_MAX_DEVICE_NAME_SIZE	128
+#define XLINK_MAX_DEVICE_LIST_SIZE	8
+#define XLINK_INVALID_LINK_ID		0xDEADBEEF
+#define XLINK_INVALID_SW_DEVICE_ID	0xDEADBEEF
+
+#define NMB_CHANNELS			4096
+#define IP_CONTROL_CHANNEL		0x0A
+#define VPU_CONTROL_CHANNEL		0x400
+#define CONTROL_CHANNEL_OPMODE		RXB_TXB	// blocking
+#define CONTROL_CHANNEL_DATASIZE	128U	// size of internal rx/tx buffers
+#define CONTROL_CHANNEL_TIMEOUT_MS	0U	// wait indefinitely
+#define SIGXLNK				44	// signal XLink uses for callback signalling
+
+#define UNUSED(x) (void)(x)
+
+// the end of the IPC channel range (starting at zero)
+#define XLINK_IPC_MAX_CHANNELS	1024
+
+// used to extract the interface type from a sw device id
+#define SW_DEVICE_ID_INTERFACE_SHIFT	24U
+#define SW_DEVICE_ID_INTERFACE_MASK	0x7
+#define GET_INTERFACE_FROM_SW_DEVICE_ID(id) (((id) >> SW_DEVICE_ID_INTERFACE_SHIFT) & \
+					     SW_DEVICE_ID_INTERFACE_MASK)
+#define SW_DEVICE_ID_IPC_INTERFACE  0x0
+#define SW_DEVICE_ID_PCIE_INTERFACE 0x1
+#define SW_DEVICE_ID_USB_INTERFACE  0x2
+#define SW_DEVICE_ID_ETH_INTERFACE  0x3
+
+enum xlink_interface {
+	NULL_INTERFACE = -1,
+	IPC_INTERFACE = 0,
+	PCIE_INTERFACE,
+	USB_CDC_INTERFACE,
+	ETH_INTERFACE,
+	NMB_OF_INTERFACES,
+};
+
+static inline int get_interface_from_sw_device_id(u32 sw_device_id)
+{
+	u32 interface = 0;
+
+	interface = GET_INTERFACE_FROM_SW_DEVICE_ID(sw_device_id);
+	switch (interface) {
+	case SW_DEVICE_ID_IPC_INTERFACE:
+		return IPC_INTERFACE;
+	case SW_DEVICE_ID_PCIE_INTERFACE:
+		return PCIE_INTERFACE;
+	case SW_DEVICE_ID_USB_INTERFACE:
+		return USB_CDC_INTERFACE;
+	case SW_DEVICE_ID_ETH_INTERFACE:
+		return ETH_INTERFACE;
+	default:
+		return NULL_INTERFACE;
+	}
+}
+
+enum xlink_channel_status {
+	CHAN_CLOSED		= 0x0000,
+	CHAN_OPEN		= 0x0001,
+	CHAN_BLOCKED_READ	= 0x0010,
+	CHAN_BLOCKED_WRITE	= 0x0100,
+	CHAN_OPEN_PEER		= 0x1000,
+};
+
+enum xlink_event_origin {
+	EVENT_TX = 0,	// outgoing events
+	EVENT_RX,	// incoming events
+};
+
+enum xlink_event_type {
+	// request events
+	XLINK_WRITE_REQ = 0x00,
+	XLINK_WRITE_VOLATILE_REQ,
+	XLINK_READ_REQ,
+	XLINK_READ_TO_BUFFER_REQ,
+	XLINK_RELEASE_REQ,
+	XLINK_OPEN_CHANNEL_REQ,
+	XLINK_CLOSE_CHANNEL_REQ,
+	XLINK_PING_REQ,
+	XLINK_REQ_LAST,
+	// response events
+	XLINK_WRITE_RESP = 0x10,
+	XLINK_WRITE_VOLATILE_RESP,
+	XLINK_READ_RESP,
+	XLINK_READ_TO_BUFFER_RESP,
+	XLINK_RELEASE_RESP,
+	XLINK_OPEN_CHANNEL_RESP,
+	XLINK_CLOSE_CHANNEL_RESP,
+	XLINK_PING_RESP,
+	XLINK_RESP_LAST,
+};
+
+struct xlink_event_header {
+	u32 magic;
+	u32 id;
+	enum xlink_event_type type;
+	u32 chan;
+	size_t size;
+	u32 timeout;
+	u8  control_data[XLINK_MAX_CONTROL_DATA_SIZE];
+};
+
+struct xlink_event {
+	struct xlink_event_header header;
+	enum xlink_event_origin origin;
+	u32 link_id;
+	struct xlink_handle *handle;
+	int interface;
+	void *data;
+	struct task_struct *calling_pid;
+	char callback_origin;
+	char user_data;
+	void **pdata;
+	dma_addr_t paddr;
+	u32 *length;
+	struct list_head list;
+};
+
+static inline struct xlink_event *xlink_create_event(u32 link_id,
+						     enum xlink_event_type type,
+						     struct xlink_handle *handle,
+						     u32 chan, u32 size, u32 timeout)
+{
+	struct xlink_event *new_event = NULL;
+
+	// allocate new event
+	new_event = kzalloc(sizeof(*new_event), GFP_KERNEL);
+	if (!new_event)
+		return NULL;
+
+	// set event context
+	new_event->link_id	= link_id;
+	new_event->handle	= handle;
+	new_event->interface	= get_interface_from_sw_device_id(handle->sw_device_id);
+	new_event->user_data	= 0;
+
+	// set event header
+	new_event->header.magic	= XLINK_EVENT_HEADER_MAGIC;
+	new_event->header.id	= XLINK_INVALID_EVENT_ID;
+	new_event->header.type	= type;
+	new_event->header.chan	= chan;
+	new_event->header.size	= size;
+	new_event->header.timeout = timeout;
+	return new_event;
+}
+
+static inline void xlink_destroy_event(struct xlink_event *event)
+{
+	kfree(event);
+}
+#endif /* __XLINK_DEFS_H */
diff --git a/drivers/misc/xlink-core/xlink-ioctl.c b/drivers/misc/xlink-core/xlink-ioctl.c
new file mode 100644
index 000000000000..1f75ad38137b
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-ioctl.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * xlink Core Driver.
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/fs.h>
+#include <linux/cdev.h>
+#include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/kref.h>
+
+#include "xlink-defs.h"
+#include "xlink-core.h"
+#include "xlink-ioctl.h"
+
+#define CHANNEL_SET_USER_BIT(chan) ((chan) |= (1 << 15))
+
+static int copy_result_to_user(u32 *where, int rc)
+{
+	if (copy_to_user((void __user *)where, &rc, sizeof(rc)))
+		return -EFAULT;
+	return rc;
+}
+
+static enum xlink_error xlink_write_volatile_user(struct xlink_handle *handle,
+						  u16 chan, u8 const *message, u32 size)
+{
+	enum xlink_error rc = 0;
+
+	rc = do_xlink_write_volatile(handle, chan, message, size, 1);
+	return rc;
+}
+
+int ioctl_connect(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkconnect	con	= {};
+	int rc = 0;
+
+	if (copy_from_user(&con, (void __user *)arg,
+			   sizeof(struct xlinkconnect)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)con.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	rc = xlink_connect(&devh);
+	if (rc == X_LINK_SUCCESS) {
+		if (copy_to_user((void __user *)con.handle,
+				 &devh, sizeof(struct xlink_handle)))
+			return -EFAULT;
+	}
+
+	return copy_result_to_user(con.return_code, rc);
+}
+
+int ioctl_open_channel(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkopenchannel	op	= {};
+	int rc = 0;
+
+	if (copy_from_user(&op, (void __user *)arg,
+			   sizeof(struct xlinkopenchannel)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)op.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	rc = xlink_open_channel(&devh, op.chan, op.mode, op.data_size,
+				op.timeout);
+
+	return copy_result_to_user(op.return_code, rc);
+}
+
+int ioctl_read_data(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkreaddata	rd	= {};
+	int rc = 0;
+	u8 *rdaddr;
+	u32 size;
+	int interface;
+
+	if (copy_from_user(&rd, (void __user *)arg,
+			   sizeof(struct xlinkreaddata)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)rd.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	rc = xlink_read_data(&devh, rd.chan, &rdaddr, &size);
+	if (!rc) {
+		interface = get_interface_from_sw_device_id(devh.sw_device_id);
+		if (interface == IPC_INTERFACE) {
+			if (copy_to_user((void __user *)rd.pmessage, (void *)&rdaddr,
+					 sizeof(u32)))
+				return -EFAULT;
+		} else {
+			if (copy_to_user((void __user *)rd.pmessage, (void *)rdaddr,
+					 size))
+				return -EFAULT;
+		}
+		if (copy_to_user((void __user *)rd.size, (void *)&size, sizeof(size)))
+			return -EFAULT;
+	}
+
+	return copy_result_to_user(rd.return_code, rc);
+}
+
+int ioctl_write_data(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkwritedata	wr	= {};
+	int rc = 0;
+
+	if (copy_from_user(&wr, (void __user *)arg,
+			   sizeof(struct xlinkwritedata)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)wr.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	if (wr.size > XLINK_MAX_DATA_SIZE)
+		return -EFAULT;
+	rc = xlink_write_data_user(&devh, wr.chan, wr.pmessage, wr.size);
+
+	return copy_result_to_user(wr.return_code, rc);
+}
+
+int ioctl_write_volatile_data(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkwritedata	wr	= {};
+	int rc = 0;
+	u8 volbuf[XLINK_MAX_BUF_SIZE]; // buffer for volatile transactions
+
+	if (copy_from_user(&wr, (void __user *)arg,
+			   sizeof(struct xlinkwritedata)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)wr.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	if (wr.size > XLINK_MAX_BUF_SIZE)
+		return -EFAULT;
+	if (copy_from_user(volbuf, (void __user *)wr.pmessage, wr.size))
+		return -EFAULT;
+	rc = xlink_write_volatile_user(&devh, wr.chan, volbuf, wr.size);
+
+	return copy_result_to_user(wr.return_code, rc);
+}
+
+int ioctl_release_data(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkrelease	rel	= {};
+	int rc = 0;
+	u8 reladdr;
+
+	if (copy_from_user(&rel, (void __user *)arg,
+			   sizeof(struct xlinkrelease)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)rel.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	if (rel.addr) {
+		if (get_user(reladdr, (u32 __user *const)rel.addr))
+			return -EFAULT;
+		rc = xlink_release_data(&devh, rel.chan,
+					(u8 *)&reladdr);
+	} else {
+		rc = xlink_release_data(&devh, rel.chan, NULL);
+	}
+
+	return copy_result_to_user(rel.return_code, rc);
+}
+
+int ioctl_close_channel(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkopenchannel	op	= {};
+	int rc = 0;
+
+	if (copy_from_user(&op, (void __user *)arg,
+			   sizeof(struct xlinkopenchannel)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)op.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	rc = xlink_close_channel(&devh, op.chan);
+
+	return copy_result_to_user(op.return_code, rc);
+}
+
+int ioctl_disconnect(unsigned long arg)
+{
+	struct xlink_handle	devh	= {};
+	struct xlinkconnect	con	= {};
+	int rc = 0;
+
+	if (copy_from_user(&con, (void __user *)arg,
+			   sizeof(struct xlinkconnect)))
+		return -EFAULT;
+	if (copy_from_user(&devh, (void __user *)con.handle,
+			   sizeof(struct xlink_handle)))
+		return -EFAULT;
+	rc = xlink_disconnect(&devh);
+
+	return copy_result_to_user(con.return_code, rc);
+}
diff --git a/drivers/misc/xlink-core/xlink-ioctl.h b/drivers/misc/xlink-core/xlink-ioctl.h
new file mode 100644
index 000000000000..0f317c6c2b94
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-ioctl.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xlink ioctl header files.
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+
+#ifndef XLINK_IOCTL_H_
+#define XLINK_IOCTL_H_
+
+int ioctl_connect(unsigned long arg);
+int ioctl_open_channel(unsigned long arg);
+int ioctl_read_data(unsigned long arg);
+int ioctl_write_data(unsigned long arg);
+int ioctl_write_volatile_data(unsigned long arg);
+int ioctl_release_data(unsigned long arg);
+int ioctl_close_channel(unsigned long arg);
+int ioctl_disconnect(unsigned long arg);
+
+#endif /* XLINK_IOCTL_H_ */
diff --git a/drivers/misc/xlink-core/xlink-multiplexer.c b/drivers/misc/xlink-core/xlink-multiplexer.c
new file mode 100644
index 000000000000..9b1ed008bb56
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-multiplexer.c
@@ -0,0 +1,534 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * xlink Multiplexer.
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/version.h>
+#include <linux/cdev.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-direct.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/list.h>
+#include <linux/completion.h>
+#include <linux/sched/signal.h>
+
+#ifdef CONFIG_XLINK_LOCAL_HOST
+#include <linux/xlink-ipc.h>
+#endif
+
+#include "xlink-multiplexer.h"
+#include "xlink-platform.h"
+
+#define THR_UPR 85
+#define THR_LWR 80
+
+// timeout used for open channel
+#define OPEN_CHANNEL_TIMEOUT_MSEC 5000
+
+/* Channel mapping table. */
+struct xlink_channel_type {
+	enum xlink_interface remote_to_local;
+	enum xlink_interface local_to_ip;
+};
+
+struct xlink_channel_table_entry {
+	u16 start_range;
+	u16 stop_range;
+	struct xlink_channel_type type;
+};
+
+static const struct xlink_channel_table_entry default_channel_table[] = {
+	{0x0, 0x1, {PCIE_INTERFACE, IPC_INTERFACE}},
+	{0x2, 0x9, {USB_CDC_INTERFACE, IPC_INTERFACE}},
+	{0xA, 0x3FD, {PCIE_INTERFACE, IPC_INTERFACE}},
+	{0x3FE, 0x3FF, {ETH_INTERFACE, IPC_INTERFACE}},
+	{0x400, 0xFFE, {PCIE_INTERFACE, NULL_INTERFACE}},
+	{0xFFF, 0xFFF, {ETH_INTERFACE, NULL_INTERFACE}},
+	{NMB_CHANNELS, NMB_CHANNELS, {NULL_INTERFACE, NULL_INTERFACE}},
+};
+
+struct channel {
+	struct open_channel *opchan;
+	enum xlink_opmode mode;
+	enum xlink_channel_status status;
+	enum xlink_channel_status ipc_status;
+	u32 size;
+	u32 timeout;
+};
+
+struct packet {
+	u8 *data;
+	u32 length;
+	dma_addr_t paddr;
+	struct list_head list;
+};
+
+struct packet_queue {
+	u32 count;
+	u32 capacity;
+	struct list_head head;
+	struct mutex lock;  // lock to protect packet queue
+};
+
+struct open_channel {
+	u16 id;
+	struct channel *chan;
+	struct packet_queue rx_queue;
+	struct packet_queue tx_queue;
+	s32 rx_fill_level;
+	s32 tx_fill_level;
+	s32 tx_packet_level;
+	s32 tx_up_limit;
+	struct completion opened;
+	struct completion pkt_available;
+	struct completion pkt_consumed;
+	struct completion pkt_released;
+	struct task_struct *ready_calling_pid;
+	void *ready_callback;
+	struct task_struct *consumed_calling_pid;
+	void *consumed_callback;
+	char callback_origin;
+	struct mutex lock;  // lock to protect channel config
+};
+
+struct xlink_multiplexer {
+	struct device *dev;
+	struct channel channels[XLINK_MAX_CONNECTIONS][NMB_CHANNELS];
+};
+
+static struct xlink_multiplexer *xmux;
+
+/*
+ * Multiplexer Internal Functions
+ *
+ */
+
+static inline int chan_is_non_blocking_read(struct open_channel *opchan)
+{
+	if (opchan->chan->mode == RXN_TXN || opchan->chan->mode == RXN_TXB)
+		return 1;
+
+	return 0;
+}
+
+static inline int chan_is_non_blocking_write(struct open_channel *opchan)
+{
+	if (opchan->chan->mode == RXN_TXN || opchan->chan->mode == RXB_TXN)
+		return 1;
+
+	return 0;
+}
+
+static struct xlink_channel_type const *get_channel_type(u16 chan)
+{
+	struct xlink_channel_type const *type = NULL;
+	int i = 0;
+
+	while (default_channel_table[i].start_range < NMB_CHANNELS) {
+		if (chan >= default_channel_table[i].start_range &&
+		    chan <= default_channel_table[i].stop_range) {
+			type = &default_channel_table[i].type;
+			break;
+		}
+		i++;
+	}
+	return type;
+}
+
+static int is_channel_for_device(u16 chan, u32 sw_device_id,
+				 enum xlink_dev_type dev_type)
+{
+	struct xlink_channel_type const *chan_type = get_channel_type(chan);
+	int interface = NULL_INTERFACE;
+
+	if (chan_type) {
+		interface = get_interface_from_sw_device_id(sw_device_id);
+		if (dev_type == VPUIP_DEVICE) {
+			if (chan_type->local_to_ip == interface)
+				return 1;
+		} else {
+			if (chan_type->remote_to_local == interface)
+				return 1;
+		}
+	}
+	return 0;
+}
+
+static int is_control_channel(u16 chan)
+{
+	if (chan == IP_CONTROL_CHANNEL || chan == VPU_CONTROL_CHANNEL)
+		return 1;
+	else
+		return 0;
+}
+
+static int release_packet_from_channel(struct open_channel *opchan,
+				       struct packet_queue *queue,
+				       u8 * const addr,	u32 *size)
+{
+	u8 packet_found = 0;
+	struct packet *pkt = NULL;
+
+	if (!addr) {
+		// address is null, release first packet in queue
+		if (!list_empty(&queue->head)) {
+			pkt = list_first_entry(&queue->head, struct packet,
+					       list);
+			packet_found = 1;
+		}
+	} else {
+		// find packet in channel rx queue
+		list_for_each_entry(pkt, &queue->head, list) {
+			if (pkt->data == addr) {
+				packet_found = 1;
+				break;
+			}
+		}
+	}
+	if (!pkt || !packet_found)
+		return X_LINK_ERROR;
+	// packet found, deallocate and remove from queue
+	xlink_platform_deallocate(xmux->dev, pkt->data, pkt->paddr, pkt->length,
+				  XLINK_PACKET_ALIGNMENT, XLINK_NORMAL_MEMORY);
+	list_del(&pkt->list);
+	queue->count--;
+	opchan->rx_fill_level -= pkt->length;
+	if (size)
+		*size = pkt->length;
+	kfree(pkt);
+	return X_LINK_SUCCESS;
+}
+
+static int multiplexer_open_channel(u32 link_id, u16 chan)
+{
+	struct open_channel *opchan;
+
+	// channel already open
+	if (xmux->channels[link_id][chan].opchan)
+		return X_LINK_SUCCESS;
+
+	// allocate open channel
+	opchan = kzalloc(sizeof(*opchan), GFP_KERNEL);
+	if (!opchan)
+		return X_LINK_ERROR;
+
+	// initialize open channel
+	opchan->id = chan;
+	opchan->chan = &xmux->channels[link_id][chan];
+	// TODO: remove circular dependency
+	xmux->channels[link_id][chan].opchan = opchan;
+	INIT_LIST_HEAD(&opchan->rx_queue.head);
+	opchan->rx_queue.count = 0;
+	opchan->rx_queue.capacity = XLINK_PACKET_QUEUE_CAPACITY;
+	INIT_LIST_HEAD(&opchan->tx_queue.head);
+	opchan->tx_queue.count = 0;
+	opchan->tx_queue.capacity = XLINK_PACKET_QUEUE_CAPACITY;
+	opchan->rx_fill_level = 0;
+	opchan->tx_fill_level = 0;
+	opchan->tx_packet_level = 0;
+	opchan->tx_up_limit = 0;
+	init_completion(&opchan->opened);
+	init_completion(&opchan->pkt_available);
+	init_completion(&opchan->pkt_consumed);
+	init_completion(&opchan->pkt_released);
+	mutex_init(&opchan->lock);
+	return X_LINK_SUCCESS;
+}
+
+static int multiplexer_close_channel(struct open_channel *opchan)
+{
+	if (!opchan)
+		return X_LINK_ERROR;
+
+	// free remaining packets
+	while (!list_empty(&opchan->rx_queue.head)) {
+		release_packet_from_channel(opchan, &opchan->rx_queue,
+					    NULL, NULL);
+	}
+
+	while (!list_empty(&opchan->tx_queue.head)) {
+		release_packet_from_channel(opchan, &opchan->tx_queue,
+					    NULL, NULL);
+	}
+
+	// deallocate data structure and destroy
+	opchan->chan->opchan = NULL; // TODO: remove circular dependency
+	mutex_destroy(&opchan->rx_queue.lock);
+	mutex_destroy(&opchan->tx_queue.lock);
+	mutex_unlock(&opchan->lock);
+	mutex_destroy(&opchan->lock);
+	kfree(opchan);
+	return X_LINK_SUCCESS;
+}
+
+/*
+ * Multiplexer External Functions
+ *
+ */
+
+enum xlink_error xlink_multiplexer_init(void *dev)
+{
+	struct platform_device *plat_dev = (struct platform_device *)dev;
+
+	// allocate multiplexer data structure
+	xmux = kzalloc(sizeof(*xmux), GFP_KERNEL);
+	if (!xmux)
+		return X_LINK_ERROR;
+
+	xmux->dev = &plat_dev->dev;
+	return X_LINK_SUCCESS;
+}
+
+enum xlink_error xlink_multiplexer_connect(u32 link_id)
+{
+	int rc;
+
+	if (!xmux)
+		return X_LINK_ERROR;
+
+	// open ip control channel
+	rc = multiplexer_open_channel(link_id, IP_CONTROL_CHANNEL);
+	if (rc) {
+		goto r_cleanup;
+	} else {
+		xmux->channels[link_id][IP_CONTROL_CHANNEL].size = CONTROL_CHANNEL_DATASIZE;
+		xmux->channels[link_id][IP_CONTROL_CHANNEL].timeout = CONTROL_CHANNEL_TIMEOUT_MS;
+		xmux->channels[link_id][IP_CONTROL_CHANNEL].mode = CONTROL_CHANNEL_OPMODE;
+		xmux->channels[link_id][IP_CONTROL_CHANNEL].status = CHAN_OPEN;
+	}
+	// open vpu control channel
+	rc = multiplexer_open_channel(link_id, VPU_CONTROL_CHANNEL);
+	if (rc) {
+		goto r_cleanup;
+	} else {
+		xmux->channels[link_id][VPU_CONTROL_CHANNEL].size = CONTROL_CHANNEL_DATASIZE;
+		xmux->channels[link_id][VPU_CONTROL_CHANNEL].timeout = CONTROL_CHANNEL_TIMEOUT_MS;
+		xmux->channels[link_id][VPU_CONTROL_CHANNEL].mode = CONTROL_CHANNEL_OPMODE;
+		xmux->channels[link_id][VPU_CONTROL_CHANNEL].status = CHAN_OPEN;
+	}
+	return X_LINK_SUCCESS;
+
+r_cleanup:
+	xlink_multiplexer_disconnect(link_id);
+	return X_LINK_ERROR;
+}
+
+enum xlink_error xlink_multiplexer_disconnect(u32 link_id)
+{
+	int i;
+
+	if (!xmux)
+		return X_LINK_ERROR;
+
+	for (i = 0; i < NMB_CHANNELS; i++) {
+		if (xmux->channels[link_id][i].opchan)
+			multiplexer_close_channel(xmux->channels[link_id][i].opchan);
+	}
+	return X_LINK_SUCCESS;
+}
+
+enum xlink_error xlink_multiplexer_destroy(void)
+{
+	int i;
+
+	if (!xmux)
+		return X_LINK_ERROR;
+
+	// close all open channels and deallocate remaining packets
+	for (i = 0; i < XLINK_MAX_CONNECTIONS; i++)
+		xlink_multiplexer_disconnect(i);
+
+	// destroy multiplexer
+	kfree(xmux);
+	xmux = NULL;
+	return X_LINK_SUCCESS;
+}
+
+enum xlink_error xlink_multiplexer_tx(struct xlink_event *event,
+				      int *event_queued)
+{
+	int rc = X_LINK_SUCCESS;
+	u16 chan = 0;
+
+	if (!xmux || !event)
+		return X_LINK_ERROR;
+
+	chan = event->header.chan;
+
+	// verify channel ID is in range
+	if (chan >= NMB_CHANNELS)
+		return X_LINK_ERROR;
+
+	// verify communication to device on channel is valid
+	if (!is_channel_for_device(chan, event->handle->sw_device_id,
+				   event->handle->dev_type))
+		return X_LINK_ERROR;
+
+	// verify this is not a control channel
+	if (is_control_channel(chan))
+		return X_LINK_ERROR;
+
+	if (chan < XLINK_IPC_MAX_CHANNELS && event->interface == IPC_INTERFACE)
+		// event should be handled by passthrough
+		rc = xlink_passthrough(event);
+	return rc;
+}
+
+enum xlink_error xlink_passthrough(struct xlink_event *event)
+{
+	int rc = 0;
+#ifdef CONFIG_XLINK_LOCAL_HOST
+	struct xlink_ipc_context ipc = {0};
+	phys_addr_t physaddr = 0;
+	dma_addr_t vpuaddr = 0;
+	u32 timeout = 0;
+	u32 link_id;
+	u16 chan;
+
+	if (!xmux || !event)
+		return X_LINK_ERROR;
+
+	link_id = event->link_id;
+	chan = event->header.chan;
+	ipc.chan = chan;
+
+	if (ipc.chan >= XLINK_IPC_MAX_CHANNELS)
+		return rc;
+
+	switch (event->header.type) {
+	case XLINK_WRITE_REQ:
+		if (xmux->channels[link_id][chan].ipc_status == CHAN_OPEN) {
+			/* Translate physical address to VPU address */
+			vpuaddr = phys_to_dma(xmux->dev, *(u32 *)event->data);
+			event->data = &vpuaddr;
+			rc = xlink_platform_write(IPC_INTERFACE,
+						  event->handle->sw_device_id,
+						  event->data,
+						  &event->header.size, 0, &ipc);
+		} else {
+			/* channel not open */
+			rc = X_LINK_ERROR;
+		}
+		break;
+	case XLINK_WRITE_VOLATILE_REQ:
+		if (xmux->channels[link_id][chan].ipc_status == CHAN_OPEN) {
+			ipc.is_volatile = 1;
+			rc = xlink_platform_write(IPC_INTERFACE,
+						  event->handle->sw_device_id,
+						  event->data,
+						  &event->header.size, 0, &ipc);
+		} else {
+			/* channel not open */
+			rc = X_LINK_ERROR;
+		}
+		break;
+	case XLINK_READ_REQ:
+		if (xmux->channels[link_id][chan].ipc_status == CHAN_OPEN) {
+			/* if channel has receive blocking set,
+			 * then set timeout to U32_MAX
+			 */
+			if (xmux->channels[link_id][chan].mode == RXB_TXN ||
+			    xmux->channels[link_id][chan].mode == RXB_TXB) {
+				timeout = U32_MAX;
+			} else {
+				timeout = xmux->channels[link_id][chan].timeout;
+			}
+			rc = xlink_platform_read(IPC_INTERFACE,
+						 event->handle->sw_device_id,
+						 &vpuaddr,
+						 (size_t *)event->length,
+						 timeout, &ipc);
+			/* Translate VPU address to physical address */
+			physaddr = dma_to_phys(xmux->dev, vpuaddr);
+			*(phys_addr_t *)event->pdata = physaddr;
+		} else {
+			/* channel not open */
+			rc = X_LINK_ERROR;
+		}
+		break;
+	case XLINK_READ_TO_BUFFER_REQ:
+		if (xmux->channels[link_id][chan].ipc_status == CHAN_OPEN) {
+			/* if channel has receive blocking set,
+			 * then set timeout to U32_MAX
+			 */
+			if (xmux->channels[link_id][chan].mode == RXB_TXN ||
+			    xmux->channels[link_id][chan].mode == RXB_TXB) {
+				timeout = U32_MAX;
+			} else {
+				timeout = xmux->channels[link_id][chan].timeout;
+			}
+			ipc.is_volatile = 1;
+			rc = xlink_platform_read(IPC_INTERFACE,
+						 event->handle->sw_device_id,
+						 event->data,
+						 (size_t *)event->length,
+						 timeout, &ipc);
+			if (rc || *event->length > XLINK_MAX_BUF_SIZE)
+				rc = X_LINK_ERROR;
+		} else {
+			/* channel not open */
+			rc = X_LINK_ERROR;
+		}
+		break;
+	case XLINK_RELEASE_REQ:
+		break;
+	case XLINK_OPEN_CHANNEL_REQ:
+		if (xmux->channels[link_id][chan].ipc_status == CHAN_CLOSED) {
+			xmux->channels[link_id][chan].size = event->header.size;
+			xmux->channels[link_id][chan].timeout = event->header.timeout;
+			xmux->channels[link_id][chan].mode = (uintptr_t)event->data;
+			rc = xlink_platform_open_channel(IPC_INTERFACE,
+							 event->handle->sw_device_id,
+							 chan);
+			if (rc)
+				rc = X_LINK_ERROR;
+			else
+				xmux->channels[link_id][chan].ipc_status = CHAN_OPEN;
+		} else {
+			/* channel already open */
+			rc = X_LINK_ALREADY_OPEN;
+		}
+		break;
+	case XLINK_CLOSE_CHANNEL_REQ:
+		if (xmux->channels[link_id][chan].ipc_status == CHAN_OPEN) {
+			rc = xlink_platform_close_channel(IPC_INTERFACE,
+							  event->handle->sw_device_id,
+							  chan);
+			if (rc)
+				rc = X_LINK_ERROR;
+			else
+				xmux->channels[link_id][chan].ipc_status = CHAN_CLOSED;
+		} else {
+			/* can't close channel not open */
+			rc = X_LINK_ERROR;
+		}
+		break;
+	case XLINK_PING_REQ:
+	case XLINK_WRITE_RESP:
+	case XLINK_WRITE_VOLATILE_RESP:
+	case XLINK_READ_RESP:
+	case XLINK_READ_TO_BUFFER_RESP:
+	case XLINK_RELEASE_RESP:
+	case XLINK_OPEN_CHANNEL_RESP:
+	case XLINK_CLOSE_CHANNEL_RESP:
+	case XLINK_PING_RESP:
+		break;
+	default:
+		rc = X_LINK_ERROR;
+	}
+#else
+	rc = 0;
+#endif // CONFIG_XLINK_LOCAL_HOST
+	return rc;
+}
diff --git a/drivers/misc/xlink-core/xlink-multiplexer.h b/drivers/misc/xlink-core/xlink-multiplexer.h
new file mode 100644
index 000000000000..c978e5683b45
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-multiplexer.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xlink Multiplexer.
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#ifndef __XLINK_MULTIPLEXER_H
+#define __XLINK_MULTIPLEXER_H
+
+#include "xlink-defs.h"
+
+enum xlink_error xlink_multiplexer_init(void *dev);
+
+enum xlink_error xlink_multiplexer_connect(u32 link_id);
+
+enum xlink_error xlink_multiplexer_disconnect(u32 link_id);
+
+enum xlink_error xlink_multiplexer_destroy(void);
+
+enum xlink_error xlink_multiplexer_tx(struct xlink_event *event,
+				      int *event_queued);
+
+enum xlink_error xlink_multiplexer_rx(struct xlink_event *event);
+
+enum xlink_error xlink_passthrough(struct xlink_event *event);
+
+void *find_allocated_buffer(dma_addr_t paddr);
+
+int unregister_allocated_buffer(void *buf, dma_addr_t paddr);
+
+int core_release_packet_from_channel(u32 link_id, uint16_t chan,
+				     uint8_t * const addr);
+
+#endif /* __XLINK_MULTIPLEXER_H */
diff --git a/drivers/misc/xlink-core/xlink-platform.c b/drivers/misc/xlink-core/xlink-platform.c
new file mode 100644
index 000000000000..c34b69ee206b
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-platform.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * xlink Linux Kernel Platform API
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/fs.h>
+#include <linux/cdev.h>
+#include <linux/platform_device.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/xlink_drv_inf.h>
+
+#include "xlink-platform.h"
+
+#ifdef CONFIG_XLINK_LOCAL_HOST
+#include <linux/xlink-ipc.h>
+#else /* !CONFIG_XLINK_LOCAL_HOST */
+
+static inline int xlink_ipc_connect(u32 sw_device_id)
+{ return -1; }
+
+static inline int xlink_ipc_write(u32 sw_device_id, void *data,
+				  size_t * const size, u32 timeout, void *context)
+{ return -1; }
+
+static inline int xlink_ipc_read(u32 sw_device_id, void *data,
+				 size_t * const size, u32 timeout, void *context)
+{ return -1; }
+
+static inline int xlink_ipc_open_channel(u32 sw_device_id,
+					 u32 channel)
+{ return -1; }
+
+static inline int xlink_ipc_close_channel(u32 sw_device_id,
+					  u32 channel)
+{ return -1; }
+
+#endif /* CONFIG_XLINK_LOCAL_HOST */
+
+/*
+ * xlink low-level driver interface arrays
+ *
+ * note: array indices based on xlink_interface enum definition
+ */
+
+static int (*connect_fcts[NMB_OF_INTERFACES])(u32) = {
+		xlink_ipc_connect, xlink_pcie_connect, NULL, NULL};
+
+static int (*write_fcts[NMB_OF_INTERFACES])(u32, void *, size_t * const, u32) = {
+		NULL, xlink_pcie_write, NULL, NULL};
+
+static int (*read_fcts[NMB_OF_INTERFACES])(u32, void *, size_t * const, u32) = {
+		NULL, xlink_pcie_read, NULL, NULL};
+
+static int (*open_chan_fcts[NMB_OF_INTERFACES])(u32, u32) = {
+		xlink_ipc_open_channel, NULL, NULL, NULL};
+
+static int (*close_chan_fcts[NMB_OF_INTERFACES])(u32, u32) = {
+		xlink_ipc_close_channel, NULL, NULL, NULL};
+
+/*
+ * xlink low-level driver interface
+ */
+
+int xlink_platform_connect(u32 interface, u32 sw_device_id)
+{
+	if (interface >= NMB_OF_INTERFACES || !connect_fcts[interface])
+		return -1;
+
+	return connect_fcts[interface](sw_device_id);
+}
+
+int xlink_platform_write(u32 interface, u32 sw_device_id, void *data,
+			 size_t * const size, u32 timeout, void *context)
+{
+	if (interface == IPC_INTERFACE)
+		return xlink_ipc_write(sw_device_id, data, size, timeout,
+				context);
+
+	if (interface >= NMB_OF_INTERFACES || !write_fcts[interface])
+		return -1;
+
+	return write_fcts[interface](sw_device_id, data, size, timeout);
+}
+
+int xlink_platform_read(u32 interface, u32 sw_device_id, void *data,
+			size_t * const size, u32 timeout, void *context)
+{
+	if (interface == IPC_INTERFACE)
+		return xlink_ipc_read(sw_device_id, data, size, timeout,
+				context);
+
+	if (interface >= NMB_OF_INTERFACES || !read_fcts[interface])
+		return -1;
+
+	return read_fcts[interface](sw_device_id, data, size, timeout);
+}
+
+int xlink_platform_open_channel(u32 interface, u32 sw_device_id,
+				u32 channel)
+{
+	if (interface >= NMB_OF_INTERFACES || !open_chan_fcts[interface])
+		return -1;
+
+	return open_chan_fcts[interface](sw_device_id, channel);
+}
+
+int xlink_platform_close_channel(u32 interface, u32 sw_device_id,
+				 u32 channel)
+{
+	if (interface >= NMB_OF_INTERFACES || !close_chan_fcts[interface])
+		return -1;
+
+	return close_chan_fcts[interface](sw_device_id, channel);
+}
+
+void *xlink_platform_allocate(struct device *dev, dma_addr_t *handle,
+			      u32 size, u32 alignment,
+			      enum xlink_memory_region region)
+{
+#if defined(CONFIG_XLINK_PSS) || !defined(CONFIG_XLINK_LOCAL_HOST)
+	*handle = 0;
+	return kzalloc(size, GFP_KERNEL);
+#else
+	void *p;
+
+	if (region == XLINK_CMA_MEMORY) {
+		// size needs to be at least 4097 to be allocated from CMA
+		size = (size < PAGE_SIZE * 2) ? (PAGE_SIZE * 2) : size;
+		p = dma_alloc_coherent(dev, size, handle, GFP_KERNEL);
+		return p;
+	}
+	*handle = 0;
+	return kzalloc(size, GFP_KERNEL);
+#endif
+}
+
+void xlink_platform_deallocate(struct device *dev, void *buf,
+			       dma_addr_t handle, u32 size, u32 alignment,
+			       enum xlink_memory_region region)
+{
+#if defined(CONFIG_XLINK_PSS) || !defined(CONFIG_XLINK_LOCAL_HOST)
+	kfree(buf);
+#else
+	if (region == XLINK_CMA_MEMORY) {
+		// size needs to be at least 4097 to be allocated from CMA
+		size = (size < PAGE_SIZE * 2) ? (PAGE_SIZE * 2) : size;
+		dma_free_coherent(dev, size, buf, handle);
+	} else {
+		kfree(buf);
+	}
+#endif
+}
diff --git a/drivers/misc/xlink-core/xlink-platform.h b/drivers/misc/xlink-core/xlink-platform.h
new file mode 100644
index 000000000000..2c7c4c418099
--- /dev/null
+++ b/drivers/misc/xlink-core/xlink-platform.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xlink Linux Kernel Platform API
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#ifndef __XLINK_PLATFORM_H
+#define __XLINK_PLATFORM_H
+
+#include "xlink-defs.h"
+
+int xlink_platform_connect(u32 interface, u32 sw_device_id);
+
+int xlink_platform_write(u32 interface, u32 sw_device_id, void *data,
+			 size_t * const size, u32 timeout, void *context);
+
+int xlink_platform_read(u32 interface, u32 sw_device_id, void *data,
+			size_t * const size, u32 timeout, void *context);
+
+int xlink_platform_reset_device(u32 interface, u32 sw_device_id);
+
+int xlink_platform_boot_device(u32 interface, u32 sw_device_id,
+			       const char *binary_name);
+
+int xlink_platform_get_device_name(u32 interface, u32 sw_device_id,
+				   char *device_name, size_t name_size);
+
+int xlink_platform_get_device_list(u32 interface, u32 *sw_device_id_list,
+				   u32 *num_devices);
+
+int xlink_platform_get_device_status(u32 interface, u32 sw_device_id,
+				     u32 *device_status);
+
+int xlink_platform_set_device_mode(u32 interface, u32 sw_device_id,
+				   u32 power_mode);
+
+int xlink_platform_get_device_mode(u32 interface, u32 sw_device_id,
+				   u32 *power_mode);
+
+int xlink_platform_open_channel(u32 interface,  u32 sw_device_id,
+				u32 channel);
+
+int xlink_platform_close_channel(u32 interface,  u32 sw_device_id,
+				 u32 channel);
+
+int xlink_platform_register_for_events(u32 interface, u32 sw_device_id,
+				       xlink_device_event_cb event_notif_fn);
+
+int xlink_platform_unregister_for_events(u32 interface, u32 sw_device_id);
+
+enum xlink_memory_region {
+	XLINK_NORMAL_MEMORY = 0,
+	XLINK_CMA_MEMORY
+};
+
+void *xlink_platform_allocate(struct device *dev, dma_addr_t *handle,
+			      u32 size, u32 alignment,
+			      enum xlink_memory_region region);
+
+void xlink_platform_deallocate(struct device *dev, void *buf,
+			       dma_addr_t handle, u32 size, u32 alignment,
+			       enum xlink_memory_region region);
+
+#endif /* __XLINK_PLATFORM_H */
diff --git a/include/linux/xlink.h b/include/linux/xlink.h
new file mode 100644
index 000000000000..c22439d5aade
--- /dev/null
+++ b/include/linux/xlink.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xlink Linux Kernel API
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#ifndef __XLINK_H
+#define __XLINK_H
+
+#include <uapi/misc/xlink_uapi.h>
+
+enum xlink_dev_type {
+	HOST_DEVICE = 0,	/* used when communicating host to host*/
+	VPUIP_DEVICE		/* used when communicating host to vpu ip */
+};
+
+struct xlink_handle {
+	u32 sw_device_id;		/* identifies a device in the system */
+	enum xlink_dev_type dev_type;	/* determines direction of comms */
+};
+
+enum xlink_opmode {
+	RXB_TXB = 0,	/* blocking read, blocking write */
+	RXN_TXN,	/* non-blocking read, non-blocking write */
+	RXB_TXN,	/* blocking read, non-blocking write */
+	RXN_TXB		/* non-blocking read, blocking write */
+};
+
+enum xlink_device_power_mode {
+	POWER_DEFAULT_NOMINAL_MAX = 0,	/* no load reduction, default mode */
+	POWER_SUBNOMINAL_HIGH,		/* slight load reduction */
+	POWER_MEDIUM,			/* average load reduction */
+	POWER_LOW,			/* significant load reduction */
+	POWER_MIN,			/* maximum load reduction */
+	POWER_SUSPENDED			/* power off or device suspend */
+};
+
+enum xlink_error {
+	X_LINK_SUCCESS = 0,		/* xlink operation completed successfully */
+	X_LINK_ALREADY_INIT,		/* xlink already initialized */
+	X_LINK_ALREADY_OPEN,		/* channel already open */
+	X_LINK_COMMUNICATION_NOT_OPEN,	/* operation on a closed channel */
+	X_LINK_COMMUNICATION_FAIL,	/* communication failure */
+	X_LINK_COMMUNICATION_UNKNOWN_ERROR, /* error unknown */
+	X_LINK_DEVICE_NOT_FOUND,	/* device specified not found */
+	X_LINK_TIMEOUT,			/* operation timed out */
+	X_LINK_ERROR,			/* parameter error */
+	X_LINK_CHAN_FULL		/* channel has reached fill level */
+};
+
+enum xlink_device_status {
+	XLINK_DEV_OFF = 0,	/* device is off */
+	XLINK_DEV_ERROR,	/* device is busy and not available */
+	XLINK_DEV_BUSY,		/* device is available for use */
+	XLINK_DEV_RECOVERY,	/* device is in recovery mode */
+	XLINK_DEV_READY		/* device HW failure is detected */
+};
+
+/* xlink API */
+
+typedef void (*xlink_event)(u16 chan);
+typedef int (*xlink_device_event_cb)(u32 sw_device_id, u32 event_type);
+
+enum xlink_error xlink_initialize(void);
+
+enum xlink_error xlink_connect(struct xlink_handle *handle);
+
+enum xlink_error xlink_open_channel(struct xlink_handle *handle,
+				    u16 chan, enum xlink_opmode mode,
+				    u32 data_size, u32 timeout);
+
+enum xlink_error xlink_close_channel(struct xlink_handle *handle, u16 chan);
+
+enum xlink_error xlink_write_data(struct xlink_handle *handle,
+				  u16 chan, u8 const *message, u32 size);
+
+enum xlink_error xlink_write_volatile(struct xlink_handle *handle,
+				      u16 chan, u8 const *message, u32 size);
+
+enum xlink_error xlink_read_data(struct xlink_handle *handle,
+				 u16 chan, u8 **message, u32 *size);
+
+enum xlink_error xlink_read_data_to_buffer(struct xlink_handle *handle,
+					   u16 chan, u8 * const message,
+					   u32 *size);
+
+enum xlink_error xlink_release_data(struct xlink_handle *handle,
+				    u16 chan, u8 * const data_addr);
+
+enum xlink_error xlink_disconnect(struct xlink_handle *handle);
+
+/* API functions to be implemented
+ *
+ * enum xlink_error xlink_write_crc_data(struct xlink_handle *handle,
+ *		u16 chan, u8 const *message, size_t * const size);
+ *
+ * enum xlink_error xlink_read_crc_data(struct xlink_handle *handle,
+ *		u16 chan, u8 **message, size_t * const size);
+ *
+ * enum xlink_error xlink_read_crc_data_to_buffer(struct xlink_handle *handle,
+ *		u16 chan, u8 * const message, size_t * const size);
+ *
+ * enum xlink_error xlink_reset_all(void);
+ *
+ */
+
+#endif /* __XLINK_H */
diff --git a/include/uapi/misc/xlink_uapi.h b/include/uapi/misc/xlink_uapi.h
new file mode 100644
index 000000000000..77794299c4a6
--- /dev/null
+++ b/include/uapi/misc/xlink_uapi.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * xlink Linux Kernel API
+ *
+ * Copyright (C) 2018-2019 Intel Corporation
+ *
+ */
+#ifndef __XLINK_UAPI_H
+#define __XLINK_UAPI_H
+
+#include <linux/types.h>
+
+#define XLINK_MAGIC 'x'
+#define XL_OPEN_CHANNEL			_IOW(XLINK_MAGIC, 1, void*)
+#define XL_READ_DATA			_IOW(XLINK_MAGIC, 2, void*)
+#define XL_WRITE_DATA			_IOW(XLINK_MAGIC, 3, void*)
+#define XL_CLOSE_CHANNEL		_IOW(XLINK_MAGIC, 4, void*)
+#define XL_WRITE_VOLATILE		_IOW(XLINK_MAGIC, 5, void*)
+#define XL_READ_TO_BUFFER		_IOW(XLINK_MAGIC, 6, void*)
+#define XL_START_VPU			_IOW(XLINK_MAGIC, 7, void*)
+#define XL_STOP_VPU				_IOW(XLINK_MAGIC, 8, void*)
+#define XL_RESET_VPU			_IOW(XLINK_MAGIC, 9, void*)
+#define XL_CONNECT				_IOW(XLINK_MAGIC, 10, void*)
+#define XL_RELEASE_DATA			_IOW(XLINK_MAGIC, 11, void*)
+#define XL_DISCONNECT			_IOW(XLINK_MAGIC, 12, void*)
+#define XL_WRITE_CONTROL_DATA	_IOW(XLINK_MAGIC, 13, void*)
+#define XL_DATA_READY_CALLBACK	_IOW(XLINK_MAGIC, 14, void*)
+#define XL_DATA_CONSUMED_CALLBACK	_IOW(XLINK_MAGIC, 15, void*)
+#define XL_GET_DEVICE_NAME		_IOW(XLINK_MAGIC, 16, void*)
+#define XL_GET_DEVICE_LIST		_IOW(XLINK_MAGIC, 17, void*)
+#define XL_GET_DEVICE_STATUS	_IOW(XLINK_MAGIC, 18, void*)
+#define XL_BOOT_DEVICE			_IOW(XLINK_MAGIC, 19, void*)
+#define XL_RESET_DEVICE			_IOW(XLINK_MAGIC, 20, void*)
+#define XL_GET_DEVICE_MODE		_IOW(XLINK_MAGIC, 21, void*)
+#define XL_SET_DEVICE_MODE		_IOW(XLINK_MAGIC, 22, void*)
+#define XL_REGISTER_DEV_EVENT	_IOW(XLINK_MAGIC, 23, void*)
+#define XL_UNREGISTER_DEV_EVENT	_IOW(XLINK_MAGIC, 24, void*)
+
+struct xlinkopenchannel {
+	void *handle;
+	__u16 chan;
+	int mode;
+	__u32 data_size;
+	__u32 timeout;
+	__u32 *return_code;
+};
+
+struct xlinkcallback {
+	void *handle;
+	__u16 chan;
+	void (*callback)(__u16 chan);
+	__u32 *return_code;
+};
+
+struct xlinkwritedata {
+	void *handle;
+	__u16 chan;
+	void const *pmessage;
+	__u32 size;
+	__u32 *return_code;
+};
+
+struct xlinkreaddata {
+	void *handle;
+	__u16 chan;
+	void *pmessage;
+	__u32 *size;
+	__u32 *return_code;
+};
+
+struct xlinkreadtobuffer {
+	void *handle;
+	__u16 chan;
+	void *pmessage;
+	__u32 *size;
+	__u32 *return_code;
+};
+
+struct xlinkconnect {
+	void *handle;
+	__u32 *return_code;
+};
+
+struct xlinkrelease {
+	void *handle;
+	__u16 chan;
+	void *addr;
+	__u32 *return_code;
+};
+
+struct xlinkstartvpu {
+	char *filename;
+	int namesize;
+	__u32 *return_code;
+};
+
+struct xlinkstopvpu {
+	__u32 *return_code;
+};
+
+struct xlinkgetdevicename {
+	void *handle;
+	char *name;
+	__u32 name_size;
+	__u32 *return_code;
+};
+
+struct xlinkgetdevicelist {
+	__u32 *sw_device_id_list;
+	__u32 *num_devices;
+	__u32 *return_code;
+};
+
+struct xlinkgetdevicestatus {
+	void *handle;
+	__u32 *device_status;
+	__u32 *return_code;
+};
+
+struct xlinkbootdevice {
+	void *handle;
+	const char *binary_name;
+	__u32 binary_name_size;
+	__u32 *return_code;
+};
+
+struct xlinkresetdevice {
+	void *handle;
+	__u32 *return_code;
+};
+
+struct xlinkdevmode {
+	void *handle;
+	int *device_mode;
+	__u32 *return_code;
+};
+
+struct xlinkregdevevent {
+	void *handle;
+	__u32  *event_list;
+	__u32  num_events;
+	__u32 *return_code;
+};
+
+#endif /* __XLINK_UAPI_H */
-- 
2.17.1

