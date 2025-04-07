Return-Path: <linux-doc+bounces-42447-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC74A7EFDE
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 23:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6408316BA1F
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 21:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5EB224240;
	Mon,  7 Apr 2025 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AppEO3nQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B7222333A;
	Mon,  7 Apr 2025 21:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062692; cv=none; b=JRjB1aV+s0dSCrAwDWweEJ0XFXY/B4m70icd88vW0ztoQjB1VKaVfZUNzSsjgAv8dRWw3n/MkozfPAmdaZP/I4R9FMMbZiZTF69obPSeq8t01qCOHg0RbnPIcjMY2lWtxeIQQx93Rey8POo65XLKv7vXIvhf1fVi4uPIxzQ390Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062692; c=relaxed/simple;
	bh=RSjEecbmW0xnLOnOOp2/Kf2X0Tq4DeCOeR9hSF9EHQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxFmkcTBnAlr9/dwqmmOu5oefpfc+fgvqXMQzxKhTqFAAEiGQyAp9nU5usa44dOmYnn++boAiLzuNrlpm1/62PBbFfTsEHKJFkDImSVAVoYUgab7fIfx0FG0q0oZYuIs+ahstDH3jb8Jp11U3WOB4t7irciahnPleYKuJp1qM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AppEO3nQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744062691; x=1775598691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RSjEecbmW0xnLOnOOp2/Kf2X0Tq4DeCOeR9hSF9EHQA=;
  b=AppEO3nQOI7Vw95Hu6oDjTbSu8t+pmLUUZL+9ch9wPAhDZu3UONT/5XY
   MNQqO2J7n1EvNN6k9wltP9SOu3qCrLJpYxTAycqReA1gRfuoynYXUCbMZ
   5yuVwBXVcnctsTjSQXgo0STzaIPwq6D7N8fMjoU9j9znVrftKh6yfziZS
   ulNC9rzkF/jU2tUwtbuRg6EAhzVImZEvtmMbgobFZzwdyjD3I9gpwsG6y
   xBrF+NulfiqqlXpAhnI0MRJSotKTBTcfqXv7ZIT94q83X+SAxqXjTByzo
   Yvc0jjJBeTOKzIbgf++Ro1btb+eUF+rAPlIj1VZF64n8dcRHpzOBa50+G
   A==;
X-CSE-ConnectionGUID: joV6lLR/Qvimn8bPSWCe4A==
X-CSE-MsgGUID: 7B3XJ47lSLutz6RpWbQRkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49268588"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="49268588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 14:51:27 -0700
X-CSE-ConnectionGUID: QVguRZe+Te+V/Mch0BZF7Q==
X-CSE-MsgGUID: sssne++dQ9CbuxbFajMQ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="133055750"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2025 14:51:27 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: Jedrzej Jagielski <jedrzej.jagielski@intel.com>,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	jiri@resnulli.us,
	horms@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Bharath R <bharath.r@intel.com>
Subject: [PATCH net-next 03/15] ixgbe: add initial devlink support
Date: Mon,  7 Apr 2025 14:51:07 -0700
Message-ID: <20250407215122.609521-4-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250407215122.609521-1-anthony.l.nguyen@intel.com>
References: <20250407215122.609521-1-anthony.l.nguyen@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jedrzej Jagielski <jedrzej.jagielski@intel.com>

Add an initial support for devlink interface to ixgbe driver.

Similarly to i40e driver the implementation doesn't enable
devlink to manage device-wide configuration. Devlink instance
is created for each physical function of PCIe device.

Create separate directory for devlink related ixgbe files
and use naming scheme similar to the one used in the ice driver.

Add a stub for Documentation, to be extended by further patches.

Change struct ixgbe_adapter allocation to be done by devlink (Przemek),
as suggested by Jiri.

Reviewed-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Co-developed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Tested-by: Bharath R <bharath.r@intel.com>
Signed-off-by: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 Documentation/networking/devlink/index.rst    |  1 +
 Documentation/networking/devlink/ixgbe.rst    |  8 ++
 drivers/net/ethernet/intel/Kconfig            |  1 +
 drivers/net/ethernet/intel/ixgbe/Makefile     |  3 +-
 .../ethernet/intel/ixgbe/devlink/devlink.c    | 77 +++++++++++++++++++
 .../ethernet/intel/ixgbe/devlink/devlink.h    | 10 +++
 drivers/net/ethernet/intel/ixgbe/ixgbe.h      | 12 ++-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 30 +++++++-
 8 files changed, 138 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/networking/devlink/ixgbe.rst
 create mode 100644 drivers/net/ethernet/intel/ixgbe/devlink/devlink.c
 create mode 100644 drivers/net/ethernet/intel/ixgbe/devlink/devlink.h

diff --git a/Documentation/networking/devlink/index.rst b/Documentation/networking/devlink/index.rst
index 948c8c44e233..8319f43b5933 100644
--- a/Documentation/networking/devlink/index.rst
+++ b/Documentation/networking/devlink/index.rst
@@ -84,6 +84,7 @@ parameters, info versions, and other features it supports.
    i40e
    ionic
    ice
+   ixgbe
    mlx4
    mlx5
    mlxsw
diff --git a/Documentation/networking/devlink/ixgbe.rst b/Documentation/networking/devlink/ixgbe.rst
new file mode 100644
index 000000000000..c04ac51c6d85
--- /dev/null
+++ b/Documentation/networking/devlink/ixgbe.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================
+ixgbe devlink support
+=====================
+
+This document describes the devlink features implemented by the ``ixgbe``
+device driver.
diff --git a/drivers/net/ethernet/intel/Kconfig b/drivers/net/ethernet/intel/Kconfig
index 1640d2f27833..56ee58c9df21 100644
--- a/drivers/net/ethernet/intel/Kconfig
+++ b/drivers/net/ethernet/intel/Kconfig
@@ -147,6 +147,7 @@ config IXGBE
 	depends on PCI
 	depends on PTP_1588_CLOCK_OPTIONAL
 	select MDIO
+	select NET_DEVLINK
 	select PHYLIB
 	help
 	  This driver supports Intel(R) 10GbE PCI Express family of
diff --git a/drivers/net/ethernet/intel/ixgbe/Makefile b/drivers/net/ethernet/intel/ixgbe/Makefile
index b456d102655a..11f37140c0a3 100644
--- a/drivers/net/ethernet/intel/ixgbe/Makefile
+++ b/drivers/net/ethernet/intel/ixgbe/Makefile
@@ -4,12 +4,13 @@
 # Makefile for the Intel(R) 10GbE PCI Express ethernet driver
 #
 
+subdir-ccflags-y += -I$(src)
 obj-$(CONFIG_IXGBE) += ixgbe.o
 
 ixgbe-y := ixgbe_main.o ixgbe_common.o ixgbe_ethtool.o \
            ixgbe_82599.o ixgbe_82598.o ixgbe_phy.o ixgbe_sriov.o \
            ixgbe_mbx.o ixgbe_x540.o ixgbe_x550.o ixgbe_lib.o ixgbe_ptp.o \
-           ixgbe_xsk.o ixgbe_e610.o
+           ixgbe_xsk.o ixgbe_e610.o devlink/devlink.o
 
 ixgbe-$(CONFIG_IXGBE_DCB) +=  ixgbe_dcb.o ixgbe_dcb_82598.o \
                               ixgbe_dcb_82599.o ixgbe_dcb_nl.o
diff --git a/drivers/net/ethernet/intel/ixgbe/devlink/devlink.c b/drivers/net/ethernet/intel/ixgbe/devlink/devlink.c
new file mode 100644
index 000000000000..6c3452cf5d7d
--- /dev/null
+++ b/drivers/net/ethernet/intel/ixgbe/devlink/devlink.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025, Intel Corporation. */
+
+#include "ixgbe.h"
+#include "devlink.h"
+
+static const struct devlink_ops ixgbe_devlink_ops = {
+};
+
+/**
+ * ixgbe_allocate_devlink - Allocate devlink instance
+ * @dev: device to allocate devlink for
+ *
+ * Allocate a devlink instance for this physical function.
+ *
+ * Return: pointer to the device adapter structure on success,
+ * ERR_PTR(-ENOMEM) when allocation failed.
+ */
+struct ixgbe_adapter *ixgbe_allocate_devlink(struct device *dev)
+{
+	struct ixgbe_adapter *adapter;
+	struct devlink *devlink;
+
+	devlink = devlink_alloc(&ixgbe_devlink_ops, sizeof(*adapter), dev);
+	if (!devlink)
+		return ERR_PTR(-ENOMEM);
+
+	adapter = devlink_priv(devlink);
+	adapter->devlink = devlink;
+
+	return adapter;
+}
+
+/**
+ * ixgbe_devlink_set_switch_id - Set unique switch ID based on PCI DSN
+ * @adapter: pointer to the device adapter structure
+ * @ppid: struct with switch id information
+ */
+static void ixgbe_devlink_set_switch_id(struct ixgbe_adapter *adapter,
+					struct netdev_phys_item_id *ppid)
+{
+	u64 id = pci_get_dsn(adapter->pdev);
+
+	ppid->id_len = sizeof(id);
+	put_unaligned_be64(id, &ppid->id);
+}
+
+/**
+ * ixgbe_devlink_register_port - Register devlink port
+ * @adapter: pointer to the device adapter structure
+ *
+ * Create and register a devlink_port for this physical function.
+ *
+ * Return: 0 on success, error code on failure.
+ */
+int ixgbe_devlink_register_port(struct ixgbe_adapter *adapter)
+{
+	struct devlink_port *devlink_port = &adapter->devlink_port;
+	struct devlink *devlink = adapter->devlink;
+	struct device *dev = &adapter->pdev->dev;
+	struct devlink_port_attrs attrs = {};
+	int err;
+
+	attrs.flavour = DEVLINK_PORT_FLAVOUR_PHYSICAL;
+	attrs.phys.port_number = adapter->hw.bus.func;
+	ixgbe_devlink_set_switch_id(adapter, &attrs.switch_id);
+
+	devlink_port_attrs_set(devlink_port, &attrs);
+
+	err = devl_port_register(devlink, devlink_port, 0);
+	if (err) {
+		dev_err(dev,
+			"devlink port registration failed, err %d\n", err);
+	}
+
+	return err;
+}
diff --git a/drivers/net/ethernet/intel/ixgbe/devlink/devlink.h b/drivers/net/ethernet/intel/ixgbe/devlink/devlink.h
new file mode 100644
index 000000000000..0b27653a3407
--- /dev/null
+++ b/drivers/net/ethernet/intel/ixgbe/devlink/devlink.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025, Intel Corporation. */
+
+#ifndef _IXGBE_DEVLINK_H_
+#define _IXGBE_DEVLINK_H_
+
+struct ixgbe_adapter *ixgbe_allocate_devlink(struct device *dev);
+int ixgbe_devlink_register_port(struct ixgbe_adapter *adapter);
+
+#endif /* _IXGBE_DEVLINK_H_ */
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe.h b/drivers/net/ethernet/intel/ixgbe/ixgbe.h
index 0efd6da874a5..6cb8772b1ebf 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe.h
@@ -17,6 +17,8 @@
 #include <linux/net_tstamp.h>
 #include <linux/ptp_clock_kernel.h>
 
+#include <net/devlink.h>
+
 #include "ixgbe_type.h"
 #include "ixgbe_common.h"
 #include "ixgbe_dcb.h"
@@ -612,6 +614,8 @@ struct ixgbe_adapter {
 	struct bpf_prog *xdp_prog;
 	struct pci_dev *pdev;
 	struct mii_bus *mii_bus;
+	struct devlink *devlink;
+	struct devlink_port devlink_port;
 
 	unsigned long state;
 
@@ -830,9 +834,15 @@ struct ixgbe_adapter {
 	spinlock_t vfs_lock;
 };
 
+struct ixgbe_netdevice_priv {
+	struct ixgbe_adapter *adapter;
+};
+
 static inline struct ixgbe_adapter *ixgbe_from_netdev(struct net_device *netdev)
 {
-	return netdev_priv(netdev);
+	struct ixgbe_netdevice_priv *priv = netdev_priv(netdev);
+
+	return priv->adapter;
 }
 
 static inline int ixgbe_determine_xdp_q_idx(int cpu)
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index ae6e396744c0..3cc9760805bc 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -49,6 +49,7 @@
 #include "ixgbe_sriov.h"
 #include "ixgbe_model.h"
 #include "ixgbe_txrx_common.h"
+#include "devlink/devlink.h"
 
 char ixgbe_driver_name[] = "ixgbe";
 static const char ixgbe_driver_string[] =
@@ -11210,6 +11211,7 @@ static void ixgbe_set_fw_version(struct ixgbe_adapter *adapter)
 static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct net_device *netdev;
+	struct ixgbe_netdevice_priv *netdev_priv_wrapper;
 	struct ixgbe_adapter *adapter = NULL;
 	struct ixgbe_hw *hw;
 	const struct ixgbe_info *ii = ixgbe_info_tbl[ent->driver_data];
@@ -11263,7 +11265,13 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		indices = IXGBE_MAX_RSS_INDICES_X550;
 	}
 
-	netdev = alloc_etherdev_mq(sizeof(struct ixgbe_adapter), indices);
+	adapter = ixgbe_allocate_devlink(&pdev->dev);
+	if (IS_ERR(adapter)) {
+		err = PTR_ERR(adapter);
+		goto err_devlink;
+	}
+
+	netdev = alloc_etherdev_mq(sizeof(*netdev_priv_wrapper), indices);
 	if (!netdev) {
 		err = -ENOMEM;
 		goto err_alloc_etherdev;
@@ -11271,7 +11279,8 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	SET_NETDEV_DEV(netdev, &pdev->dev);
 
-	adapter = ixgbe_from_netdev(netdev);
+	netdev_priv_wrapper = netdev_priv(netdev);
+	netdev_priv_wrapper->adapter = adapter;
 
 	adapter->netdev = netdev;
 	adapter->pdev = pdev;
@@ -11617,6 +11626,11 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 	strcpy(netdev->name, "eth%d");
 	pci_set_drvdata(pdev, adapter);
+
+	devl_lock(adapter->devlink);
+	ixgbe_devlink_register_port(adapter);
+	SET_NETDEV_DEVLINK_PORT(adapter->netdev, &adapter->devlink_port);
+
 	err = register_netdev(netdev);
 	if (err)
 		goto err_register;
@@ -11671,11 +11685,15 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_netdev;
 
+	devl_register(adapter->devlink);
+	devl_unlock(adapter->devlink);
 	return 0;
 
 err_netdev:
 	unregister_netdev(netdev);
 err_register:
+	devl_port_unregister(&adapter->devlink_port);
+	devl_unlock(adapter->devlink);
 	ixgbe_release_hw_control(adapter);
 	ixgbe_clear_interrupt_scheme(adapter);
 	if (hw->mac.type == ixgbe_mac_e610)
@@ -11692,7 +11710,9 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	disable_dev = !test_and_set_bit(__IXGBE_DISABLED, &adapter->state);
 	free_netdev(netdev);
 err_alloc_etherdev:
+	devlink_free(adapter->devlink);
 	pci_release_mem_regions(pdev);
+err_devlink:
 err_pci_reg:
 err_dma:
 	if (!adapter || disable_dev)
@@ -11721,6 +11741,8 @@ static void ixgbe_remove(struct pci_dev *pdev)
 		return;
 
 	netdev  = adapter->netdev;
+	devl_lock(adapter->devlink);
+	devl_unregister(adapter->devlink);
 	ixgbe_dbg_adapter_exit(adapter);
 
 	set_bit(__IXGBE_REMOVING, &adapter->state);
@@ -11756,6 +11778,10 @@ static void ixgbe_remove(struct pci_dev *pdev)
 	if (netdev->reg_state == NETREG_REGISTERED)
 		unregister_netdev(netdev);
 
+	devl_port_unregister(&adapter->devlink_port);
+	devl_unlock(adapter->devlink);
+	devlink_free(adapter->devlink);
+
 	ixgbe_stop_ipsec_offload(adapter);
 	ixgbe_clear_interrupt_scheme(adapter);
 
-- 
2.47.1


