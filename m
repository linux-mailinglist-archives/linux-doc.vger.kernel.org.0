Return-Path: <linux-doc+bounces-33996-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4AA01D8E
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 03:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AAC81882629
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC811D6DC9;
	Mon,  6 Jan 2025 02:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYVYBTdO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3D51D6DB8;
	Mon,  6 Jan 2025 02:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130767; cv=none; b=LtenPEn25DQAFvxFb9fOhybW50moXuW6ENYuoam+fKqNwMClOYp0M8NxttCByMWi03HCAgbUyglNez+xYw8E71yrpq8TFINlzbdq3YTBav27oK/xcXsk5fFPUU1NVdacuUySv0yeT60Ittj18P+FJpnVfHvYGtwIaqChQQ2ulC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130767; c=relaxed/simple;
	bh=qZNoJFcD67lFfCHn8TOPrE7pxRBbqhHLcaFtSXCF6Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q4G1Rc8RFO78Pm0Gv/GZrsaGEHGGtwC+bh9M+GEnBlGtCht/lZUF5/Is+PMK4sJWn8vk4QfVJpUr0iiPDrZNIdbn2w8PfueSuDc0DiXo2RW/2JDYANKKlWfgzKZ+KZAhK7mRpk2KD9Iw3yCv4RXIrwttZylo6un0bzI6Urs5zS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYVYBTdO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130765; x=1767666765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qZNoJFcD67lFfCHn8TOPrE7pxRBbqhHLcaFtSXCF6Vs=;
  b=dYVYBTdOsPDnNH/jy7P7Zm8Eb793iMuFIbMRXAiLhvEy/HH7r1SZIxfv
   idSewkZNCEhZ7xdCmGzntwMhDYvToSIqfAuSa46pjLrvynmD+EWfETyBi
   Ha9P3lnOmyC5HXFfp7IH246DK/VB2DsOcuFDQvrR8bSko1AbRPJIg0DnX
   otYuyxZb2UdDgoknQdF3NPTepmWLK2MTA8gj7R/sTJDl5Ab6CSdyNH1Tz
   5b0/Tc49MG722LC64iClEmKR7oibbi+3q5MI8mNFPiOb9rE5hyp4vm/5c
   UOcITo95ki9xawRsfILWR/vvtBhaSggFDLxTOjEgonPFRvZYswgSk8PRM
   A==;
X-CSE-ConnectionGUID: auyYOssBQf22SlfQhNb9mg==
X-CSE-MsgGUID: LdOCm/xTQ3SS+q070BXefQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171528"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171528"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:44 -0800
X-CSE-ConnectionGUID: sNVhowYFSMWjrDFxJmSDaw==
X-CSE-MsgGUID: LFKEPVN1Sqis8p+OPgjm7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125596037"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:41 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org,
	mpearson-lenovo@squebb.ca
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 11/22] HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
Date: Mon,  6 Jan 2025 10:31:40 +0800
Message-Id: <20250106023151.3011329-12-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250106023151.3011329-1-even.xu@intel.com>
References: <20250106023151.3011329-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xinpeng Sun <xinpeng.sun@intel.com>

Create intel-quickspi folder and add Kconfig and Makefile for THC
QuickSPI driver. Add basic device structure, definitions and probe/remove
functions for QuickSPI driver.

Co-developed-by: Even Xu <even.xu@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/hid/intel-thc-hid/Kconfig             |  11 +
 drivers/hid/intel-thc-hid/Makefile            |   3 +
 .../intel-quickspi/pci-quickspi.c             | 287 ++++++++++++++++++
 .../intel-quickspi/quickspi-dev.h             |  61 ++++
 4 files changed, 362 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h

diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
index dc7c5a23f0ad..25a3729df92a 100644
--- a/drivers/hid/intel-thc-hid/Kconfig
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -17,4 +17,15 @@ config INTEL_THC_HID
 
 	  Say Y/M here if you want to support Intel THC. If unsure, say N.
 
+config INTEL_QUICKSPI
+	tristate "Intel QuickSPI driver based on Intel Touch Host Controller"
+	depends on INTEL_THC_HID
+	help
+	  Intel QuickSPI, based on Touch Host Controller (THC), implements
+	  HIDSPI (HID over SPI) protocol. It configures THC to work at SPI
+	  mode, and controls THC hardware sequencer to accelerate HIDSPI
+	  transaction flow.
+
+	  Say Y/M here if you want to support Intel QuickSPI. If unsure, say N.
+
 endmenu
diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index b9709cc5e9eb..7669739a39b7 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -9,4 +9,7 @@ obj-$(CONFIG_INTEL_THC_HID) += intel-thc.o
 intel-thc-objs += intel-thc/intel-thc-dev.o
 intel-thc-objs += intel-thc/intel-thc-dma.o
 
+obj-$(CONFIG_INTEL_QUICKSPI) += intel-quickspi.o
+intel-quickspi-objs += intel-quickspi/pci-quickspi.o
+
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
new file mode 100644
index 000000000000..a997c9a570d4
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/pci.h>
+
+#include "intel-thc-dev.h"
+
+#include "quickspi-dev.h"
+
+struct quickspi_driver_data mtl = {
+	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_MTL,
+};
+
+struct quickspi_driver_data lnl = {
+	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,
+};
+
+struct quickspi_driver_data ptl = {
+	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,
+};
+
+/**
+ * quickspi_irq_quick_handler - The ISR of the quickspi driver
+ *
+ * @irq: The irq number
+ * @dev_id: pointer to the device structure
+ *
+ * Return: IRQ_WAKE_THREAD if further process needed.
+ */
+static irqreturn_t quickspi_irq_quick_handler(int irq, void *dev_id)
+{
+	struct quickspi_device *qsdev = dev_id;
+
+	if (qsdev->state == QUICKSPI_DISABLED)
+		return IRQ_HANDLED;
+
+	/* Disable THC interrupt before current interrupt be handled */
+	thc_interrupt_enable(qsdev->thc_hw, false);
+
+	return IRQ_WAKE_THREAD;
+}
+
+/**
+ * quickspi_irq_thread_handler - IRQ thread handler of quickspi driver
+ *
+ * @irq: The IRQ number
+ * @dev_id: pointer to the quickspi device structure
+ *
+ * Return: IRQ_HANDLED to finish this handler.
+ */
+static irqreturn_t quickspi_irq_thread_handler(int irq, void *dev_id)
+{
+	struct quickspi_device *qsdev = dev_id;
+	int int_mask;
+
+	if (qsdev->state == QUICKSPI_DISABLED)
+		return IRQ_HANDLED;
+
+	int_mask = thc_interrupt_handler(qsdev->thc_hw);
+
+	thc_interrupt_enable(qsdev->thc_hw, true);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * quickspi_dev_init - Initialize quickspi device
+ *
+ * @pdev: pointer to the thc pci device
+ * @mem_addr: The pointer of MMIO memory address
+ * @id: point to pci_device_id structure
+ *
+ * Alloc quickspi device structure and initialized THC device,
+ * then configure THC to HIDSPI mode.
+ *
+ * If success, enable THC hardware interrupt.
+ *
+ * Return: pointer to the quickspi device structure if success
+ * or NULL on failed.
+ */
+static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __iomem *mem_addr,
+						 const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = devm_kzalloc(dev, sizeof(struct quickspi_device), GFP_KERNEL);
+	if (!qsdev)
+		return ERR_PTR(-ENOMEM);
+
+	qsdev->pdev = pdev;
+	qsdev->dev = dev;
+	qsdev->mem_addr = mem_addr;
+	qsdev->driver_data = (struct quickspi_driver_data *)id->driver_data;
+
+	/* thc hw init */
+	qsdev->thc_hw = thc_dev_init(qsdev->dev, qsdev->mem_addr);
+	if (IS_ERR(qsdev->thc_hw)) {
+		ret = PTR_ERR(qsdev->thc_hw);
+		dev_err(dev, "Failed to initialize THC device context, ret = %d.\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = thc_port_select(qsdev->thc_hw, THC_PORT_TYPE_SPI);
+	if (ret) {
+		dev_err(dev, "Failed to select THC port, ret = %d.\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	thc_interrupt_config(qsdev->thc_hw);
+
+	thc_interrupt_enable(qsdev->thc_hw, true);
+
+	return qsdev;
+}
+
+/**
+ * quickspi_dev_deinit - De-initialize quickspi device
+ *
+ * @qsdev: pointer to the quickspi device structure
+ *
+ * Disable THC interrupt and deinitilize THC.
+ */
+static void quickspi_dev_deinit(struct quickspi_device *qsdev)
+{
+	thc_interrupt_enable(qsdev->thc_hw, false);
+}
+
+/*
+ * quickspi_probe: Quickspi driver probe function
+ *
+ * @pdev: point to pci device
+ * @id: point to pci_device_id structure
+ *
+ * Return 0 if success or error code on failure.
+ */
+static int quickspi_probe(struct pci_dev *pdev,
+			  const struct pci_device_id *id)
+{
+	struct quickspi_device *qsdev;
+	void __iomem *mem_addr;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable PCI device, ret = %d.\n", ret);
+		return ret;
+	}
+
+	pci_set_master(pdev);
+
+	ret = pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get PCI regions, ret = %d.\n", ret);
+		goto disable_pci_device;
+	}
+
+	mem_addr = pcim_iomap_table(pdev)[0];
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err(&pdev->dev, "No usable DMA configuration %d\n", ret);
+			goto unmap_io_region;
+		}
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Failed to allocate IRQ vectors. ret = %d\n", ret);
+		goto unmap_io_region;
+	}
+
+	pdev->irq = pci_irq_vector(pdev, 0);
+
+	qsdev = quickspi_dev_init(pdev, mem_addr, id);
+	if (IS_ERR(qsdev)) {
+		dev_err(&pdev->dev, "QuickSPI device init failed\n");
+		ret = PTR_ERR(qsdev);
+		goto unmap_io_region;
+	}
+
+	pci_set_drvdata(pdev, qsdev);
+
+	ret = devm_request_threaded_irq(&pdev->dev, pdev->irq,
+					quickspi_irq_quick_handler,
+					quickspi_irq_thread_handler,
+					IRQF_ONESHOT, KBUILD_MODNAME,
+					qsdev);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to request threaded IRQ, irq = %d.\n", pdev->irq);
+		goto dev_deinit;
+	}
+
+	return 0;
+
+dev_deinit:
+	quickspi_dev_deinit(qsdev);
+unmap_io_region:
+	pcim_iounmap_regions(pdev, BIT(0));
+disable_pci_device:
+	pci_clear_master(pdev);
+
+	return ret;
+}
+
+/**
+ * quickspi_remove - Device Removal Routine
+ *
+ * @pdev: PCI device structure
+ *
+ * This is called by the PCI subsystem to alert the driver
+ * that it should release a PCI device.
+ */
+static void quickspi_remove(struct pci_dev *pdev)
+{
+	struct quickspi_device *qsdev;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return;
+
+	quickspi_dev_deinit(qsdev);
+
+	pcim_iounmap_regions(pdev, BIT(0));
+	pci_clear_master(pdev);
+}
+
+/**
+ * quickspi_shutdown - Device Shutdown Routine
+ *
+ * @pdev: PCI device structure
+ *
+ * This is called from the reboot notifier
+ * it's a simplified version of remove so we go down
+ * faster.
+ */
+static void quickspi_shutdown(struct pci_dev *pdev)
+{
+	struct quickspi_device *qsdev;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return;
+
+	quickspi_dev_deinit(qsdev);
+}
+
+static const struct pci_device_id quickspi_pci_tbl[] = {
+	{PCI_DEVICE_DATA(INTEL, THC_MTL_DEVICE_ID_SPI_PORT1, &mtl), },
+	{PCI_DEVICE_DATA(INTEL, THC_MTL_DEVICE_ID_SPI_PORT2, &mtl), },
+	{PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_SPI_PORT1, &lnl), },
+	{PCI_DEVICE_DATA(INTEL, THC_LNL_DEVICE_ID_SPI_PORT2, &lnl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_SPI_PORT1, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_SPI_PORT2, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT1, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT2, &ptl), },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, quickspi_pci_tbl);
+
+static struct pci_driver quickspi_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = quickspi_pci_tbl,
+	.probe = quickspi_probe,
+	.remove = quickspi_remove,
+	.shutdown = quickspi_shutdown,
+	.driver.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+};
+
+module_pci_driver(quickspi_driver);
+
+MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
+MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
+
+MODULE_DESCRIPTION("Intel(R) QuickSPI Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("INTEL_THC");
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
new file mode 100644
index 000000000000..cffc859efa19
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _QUICKSPI_DEV_H_
+#define _QUICKSPI_DEV_H_
+
+#define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT1		0x7E49
+#define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT2		0x7E4B
+#define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_SPI_PORT1		0xA849
+#define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_SPI_PORT2		0xA84B
+#define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_SPI_PORT1	0xE349
+#define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_SPI_PORT2	0xE34B
+#define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT1	0xE449
+#define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2	0xE44B
+
+/* Packet size value, the unit is 16 bytes */
+#define DEFAULT_MIN_PACKET_SIZE_VALUE			4
+#define MAX_PACKET_SIZE_VALUE_MTL			128
+#define MAX_PACKET_SIZE_VALUE_LNL			256
+
+enum quickspi_dev_state {
+	QUICKSPI_NONE,
+	QUICKSPI_RESETING,
+	QUICKSPI_RESETED,
+	QUICKSPI_INITED,
+	QUICKSPI_ENABLED,
+	QUICKSPI_DISABLED,
+};
+
+/**
+ * struct quickspi_driver_data - Driver specific data for quickspi device
+ * @max_packet_size_value: identify max packet size, unit is 16 bytes
+ */
+struct quickspi_driver_data {
+	u32 max_packet_size_value;
+};
+
+struct device;
+struct pci_dev;
+struct thc_device;
+
+/**
+ * struct quickspi_device -  THC QuickSpi device struct
+ * @dev: point to kernel device
+ * @pdev: point to PCI device
+ * @thc_hw: point to THC device
+ * @driver_data: point to quickspi specific driver data
+ * @state: THC SPI device state
+ * @mem_addr: MMIO memory address
+ */
+struct quickspi_device {
+	struct device *dev;
+	struct pci_dev *pdev;
+	struct thc_device *thc_hw;
+	struct quickspi_driver_data *driver_data;
+	enum quickspi_dev_state state;
+
+	void __iomem *mem_addr;
+};
+
+#endif /* _QUICKSPI_DEV_H_ */
-- 
2.40.1


