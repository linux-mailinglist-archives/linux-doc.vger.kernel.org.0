Return-Path: <linux-doc+bounces-28479-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 499169ADEBF
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 10:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F26CA287378
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 08:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BC01D174F;
	Thu, 24 Oct 2024 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUFdVI2o"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99E1CFECF;
	Thu, 24 Oct 2024 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757519; cv=none; b=iAcu5agIFG+Xvz0U1vMhG0d9RlDzev8n5glzaO8mxLLKKNbYBca3yIvYEoYM7FyxR92q8GBMCeUK5J5TyJ/juzyUi/PAXH573wNZLjiSjxBTdfq0CiYaf2pYnWko7cyElqmNwSTbaxG00Mtu61k2k+HH5iD2CUXoN/SgD2Ym11w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757519; c=relaxed/simple;
	bh=x0uDvN0LiEIGKnBbbkpHzikuMA2H3McSz3NIcjKGs38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jBOnbIM1b5k4BBhX/LwkLwSLLCZrZRoLycHCrM90S5+L6yvKTvaovZRh9cg3QldQS8T6baIWzJkDTk9DxwyfPxlro9LHap58CA12XPnpMVnuZB9eUWxcRkIs4TpljRM5FLKo60BQFGoLHtJUTdZeRUoszXAmHjee3xwjLF83eKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUFdVI2o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729757517; x=1761293517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x0uDvN0LiEIGKnBbbkpHzikuMA2H3McSz3NIcjKGs38=;
  b=cUFdVI2ouuoC/MhdV6qI6zyxcYUuTP87aHjx/mcEwww/tWtNMURLKSXd
   tJ4Wo2rIqDUQcGbOixGPbJDo2u4wy3qwDZNtx1nR1+mQNhkiaFEjsRf9c
   b3xGNVoBnSP7yUBlYBL1LDrA5j++Vzr+maURteOPABhO0XHpmuCCGqZS5
   ZnuXTVmojaJx8+rmDDHrMUHDYHWKzghb4eRfQHsroMA6Sm3xY0E5bBiTb
   9MEMmAgKIvzoBAhrmuTPQZMU3jHCH7HtueTSYM0kxtZUNJISbeJChnSQT
   sqJisOxPjnEcGzSHeuscKLWaPSy1KmM87JF79ZIPJ5Nq/ynuduBe539gM
   Q==;
X-CSE-ConnectionGUID: LGUxjtJcR+mru7KccJFCag==
X-CSE-MsgGUID: 7BnOFrb0Q2GU/TawW6CD1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29501164"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29501164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:11:57 -0700
X-CSE-ConnectionGUID: MkQPnStVRQaqyhYQODGAzA==
X-CSE-MsgGUID: weOAuKdGRy2XOXXc7O56TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80691086"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2024 01:11:53 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net
Cc: linux-input@vger.kernel.or,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v1 21/22] HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
Date: Thu, 24 Oct 2024 16:10:22 +0800
Message-Id: <20241024081023.1468951-22-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241024081023.1468951-1-even.xu@intel.com>
References: <20241024081023.1468951-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fully implement QuickI2C driver probe/remove callbacks, interrupt
handler, integrate HIDI2C protocol, enumerate HID device and register
HID device.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 271 ++++++++++++++++++
 .../intel-quicki2c/quicki2c-dev.h             |   6 +
 .../intel-quicki2c/quicki2c-protocol.c        |  27 ++
 .../intel-quicki2c/quicki2c-protocol.h        |   1 +
 4 files changed, 305 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 035d0f5ce3b8..0c1082f0da34 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -8,11 +8,14 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 
 #include "intel-thc-dev.h"
 #include "intel-thc-hw.h"
 
 #include "quicki2c-dev.h"
+#include "quicki2c-hid.h"
+#include "quicki2c-protocol.h"
 
 /* THC QuickI2C ACPI method to get device properties */
 /* HIDI2C device method */
@@ -210,6 +213,69 @@ static irqreturn_t quicki2c_irq_quick_handler(int irq, void *dev_id)
 	return IRQ_WAKE_THREAD;
 }
 
+/**
+ * try_recover - Try to recovery THC and Device
+ * @qcdev: pointer to quicki2c device
+ *
+ * This function is a error handler, called when fatal error happens.
+ * It try to reset Touch Device and re-configure THC to recovery
+ * transferring between Device and THC.
+ *
+ * Return: 0 if successful or error code on failed
+ */
+static int try_recover(struct quicki2c_device *qcdev)
+{
+	int ret;
+
+	thc_dma_unconfigure(qcdev->thc_hw);
+
+	ret = thc_dma_configure(qcdev->thc_hw);
+	if (ret) {
+		dev_err(qcdev->dev, "Reconfig DMA failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int handle_input_report(struct quicki2c_device *qcdev)
+{
+	struct hidi2c_report_packet *pkt = (struct hidi2c_report_packet *)qcdev->input_buf;
+	int rx_dma_finished = 0;
+	size_t report_len;
+	int ret;
+
+	while (!rx_dma_finished) {
+		ret = thc_rxdma_read(qcdev->thc_hw, THC_RXDMA2,
+				     (u8 *)pkt, &report_len,
+				     &rx_dma_finished);
+		if (ret)
+			return ret;
+
+		if (!pkt->len) {
+			if (qcdev->state == QUICKI2C_RESETING) {
+				qcdev->reset_ack = true;
+				wake_up(&qcdev->reset_ack_wq);
+
+				qcdev->state = QUICKI2C_RESETED;
+			} else {
+				dev_warn(qcdev->dev, "unexpected DIR happen\n");
+			}
+
+			continue;
+		}
+
+		/* discard samples before driver probe complete */
+		if (qcdev->state != QUICKI2C_ENABLED)
+			continue;
+
+		quicki2c_hid_send_report(qcdev, pkt->data,
+					 HIDI2C_DATA_LEN(le16_to_cpu(pkt->len)));
+	}
+
+	return 0;
+}
+
 /**
  * quicki2c_irq_thread_handler - IRQ thread handler of quicki2c driver
  *
@@ -221,6 +287,7 @@ static irqreturn_t quicki2c_irq_quick_handler(int irq, void *dev_id)
 static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 {
 	struct quicki2c_device *qcdev = dev_id;
+	int err_recover = 0;
 	int int_mask;
 
 	if (qcdev->state == QUICKI2C_DISABLED)
@@ -228,8 +295,25 @@ static irqreturn_t quicki2c_irq_thread_handler(int irq, void *dev_id)
 
 	int_mask = thc_interrupt_handler(qcdev->thc_hw);
 
+	if (int_mask & BIT(THC_FATAL_ERR_INT) || int_mask & BIT(THC_TXN_ERR_INT) ||
+	    int_mask & BIT(THC_UNKNOWN_INT)) {
+		err_recover = 1;
+		goto exit;
+	}
+
+	if (int_mask & BIT(THC_RXDMA2_INT)) {
+		err_recover = handle_input_report(qcdev);
+		if (err_recover)
+			goto exit;
+	}
+
+exit:
 	thc_interrupt_enable(qcdev->thc_hw, true);
 
+	if (err_recover)
+		if (try_recover(qcdev))
+			qcdev->state = QUICKI2C_DISABLED;
+
 	return IRQ_HANDLED;
 }
 
@@ -260,6 +344,9 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 	qcdev->pdev = pdev;
 	qcdev->dev = dev;
 	qcdev->mem_addr = mem_addr;
+	qcdev->state = QUICKI2C_DISABLED;
+
+	init_waitqueue_head(&qcdev->reset_ack_wq);
 
 	/* thc hw init */
 	qcdev->thc_hw = thc_dev_init(qcdev->dev, qcdev->mem_addr);
@@ -292,6 +379,8 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 
 	thc_interrupt_enable(qcdev->thc_hw, true);
 
+	qcdev->state = QUICKI2C_INITED;
+
 	return qcdev;
 }
 
@@ -305,6 +394,114 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
 {
 	thc_interrupt_enable(qcdev->thc_hw, false);
+	thc_ltr_unconfig(qcdev->thc_hw);
+
+	qcdev->state = QUICKI2C_DISABLED;
+}
+
+/**
+ * quicki2c_dma_init - Configure THC DMA for quicki2c device
+ * @qcdev: pointer to the quicki2c device structure
+ *
+ * This function uses TIC's parameters(such as max input length, max output
+ * length) to allocate THC DMA buffers and configure THC DMA engines.
+ *
+ * Return: 0 if success or error code on failed.
+ */
+static int quicki2c_dma_init(struct quicki2c_device *qcdev)
+{
+	size_t swdma_max_len;
+	int ret;
+
+	swdma_max_len = max(le16_to_cpu(qcdev->dev_desc.max_input_len),
+			    le16_to_cpu(qcdev->dev_desc.report_desc_len));
+
+	ret = thc_dma_set_max_packet_sizes(qcdev->thc_hw, 0,
+					   le16_to_cpu(qcdev->dev_desc.max_input_len),
+					   le16_to_cpu(qcdev->dev_desc.max_output_len),
+					   swdma_max_len);
+	if (ret)
+		return ret;
+
+	ret = thc_dma_allocate(qcdev->thc_hw);
+	if (ret) {
+		dev_err(qcdev->dev, "Allocate THC DMA buffer failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	/* Enable RxDMA */
+	ret = thc_dma_configure(qcdev->thc_hw);
+	if (ret) {
+		dev_err(qcdev->dev, "Configure THC DMA failed, ret = %d\n", ret);
+		thc_dma_unconfigure(qcdev->thc_hw);
+		thc_dma_release(qcdev->thc_hw);
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * quicki2c_dma_deinit - Release THC DMA for quicki2c device
+ * @qcdev: pointer to the quicki2c device structure
+ *
+ * Stop THC DMA engines and release all DMA buffers.
+ *
+ */
+static void quicki2c_dma_deinit(struct quicki2c_device *qcdev)
+{
+	thc_dma_unconfigure(qcdev->thc_hw);
+	thc_dma_release(qcdev->thc_hw);
+}
+
+/**
+ * quicki2c_alloc_report_buf - Alloc report buffers
+ * @qcdev: pointer to the quicki2c device structure
+ *
+ * Allocate report descritpor buffer, it will be used for restore TIC HID
+ * report descritpor.
+ *
+ * Allocate input report buffer, it will be used for receive HID input report
+ * data from TIC.
+ *
+ * Allocate output report buffer, it will be used for store HID output report,
+ * such as set feature.
+ *
+ * Return: 0 if success or error code on failed.
+ */
+static int quicki2c_alloc_report_buf(struct quicki2c_device *qcdev)
+{
+	size_t max_report_len;
+
+	qcdev->report_descriptor = devm_kzalloc(qcdev->dev,
+						le16_to_cpu(qcdev->dev_desc.report_desc_len),
+						GFP_KERNEL);
+	if (!qcdev->report_descriptor)
+		return -ENOMEM;
+
+	/*
+	 * Some HIDI2C devices don't declare input/output max length correctly,
+	 * give default 4K buffer to avoid DMA buffer overrun.
+	 */
+	max_report_len = max(le16_to_cpu(qcdev->dev_desc.max_input_len), SZ_4K);
+
+	qcdev->input_buf = devm_kzalloc(qcdev->dev, max_report_len, GFP_KERNEL);
+	if (!qcdev->input_buf)
+		return -ENOMEM;
+
+	if (!le16_to_cpu(qcdev->dev_desc.max_output_len))
+		qcdev->dev_desc.max_output_len = cpu_to_le16(SZ_4K);
+
+	max_report_len = max(le16_to_cpu(qcdev->dev_desc.max_output_len),
+			     max_report_len);
+
+	qcdev->report_buf = devm_kzalloc(qcdev->dev, max_report_len, GFP_KERNEL);
+	if (!qcdev->report_buf)
+		return -ENOMEM;
+
+	qcdev->report_len = max_report_len;
+
+	return 0;
 }
 
 /*
@@ -313,6 +510,18 @@ static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
  * @pdev: point to pci device
  * @id: point to pci_device_id structure
  *
+ * This function initializes THC and HIDI2C device, the flow is:
+ * - do THC pci device initialization
+ * - query HIDI2C ACPI parameters
+ * - configure THC to HIDI2C mode
+ * - go through HIDI2C enumeration flow
+ *   |- read device descriptor
+ *   |- reset HIDI2C device
+ * - enable THC interrupt and DMA
+ * - read report descriptor
+ * - register HID device
+ * - enable runtime power management
+ *
  * Return 0 if success or error code on failed.
  */
 static int quicki2c_probe(struct pci_dev *pdev,
@@ -365,6 +574,10 @@ static int quicki2c_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, qcdev);
 
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, true);
+	if (ret)
+		goto dev_deinit;
+
 	ret = devm_request_threaded_irq(&pdev->dev, pdev->irq,
 					quicki2c_irq_quick_handler,
 					quicki2c_irq_thread_handler,
@@ -376,8 +589,60 @@ static int quicki2c_probe(struct pci_dev *pdev,
 		goto dev_deinit;
 	}
 
+	ret = quicki2c_get_device_descriptor(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Get device descriptor failed, ret = %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_alloc_report_buf(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Alloc report buffers failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_dma_init(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Setup THC DMA failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = thc_interrupt_quiesce(qcdev->thc_hw, false);
+	if (ret)
+		goto dev_deinit;
+
+	ret = quicki2c_set_power(qcdev, HIDI2C_ON);
+	if (ret) {
+		dev_err(&pdev->dev, "Set Power On command failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_reset(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Reset HIDI2C device failed, ret= %d\n", ret);
+		goto dev_deinit;
+	}
+
+	ret = quicki2c_get_report_descriptor(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Get report descriptor failed, ret = %d\n", ret);
+		goto dma_deinit;
+	}
+
+	ret = quicki2c_hid_probe(qcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register HID device, ret = %d\n", ret);
+		goto dma_deinit;
+	}
+
+	qcdev->state = QUICKI2C_ENABLED;
+
+	dev_dbg(&pdev->dev, "QuickI2C probe success\n");
+
 	return 0;
 
+dma_deinit:
+	quicki2c_dma_deinit(qcdev);
 dev_deinit:
 	quicki2c_dev_deinit(qcdev);
 unmap_io_region:
@@ -405,6 +670,9 @@ static void quicki2c_remove(struct pci_dev *pdev)
 	if (!qcdev)
 		return;
 
+	quicki2c_hid_remove(qcdev);
+	quicki2c_dma_deinit(qcdev);
+
 	quicki2c_dev_deinit(qcdev);
 
 	pcim_iounmap_regions(pdev, BIT(0));
@@ -429,6 +697,9 @@ static void quicki2c_shutdown(struct pci_dev *pdev)
 	if (!qcdev)
 		return;
 
+	/* Must stop DMA before reboot to avoid DMA entering into unknown state */
+	quicki2c_dma_deinit(qcdev);
+
 	quicki2c_dev_deinit(qcdev);
 }
 
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 043126803997..d9fac30da827 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -5,6 +5,7 @@
 #define _QUICKI2C_DEV_H_
 
 #include <linux/hid-over-i2c.h>
+#include <linux/workqueue.h>
 
 #define THC_LNL_DEVICE_ID_I2C_PORT1	0xA848
 #define THC_LNL_DEVICE_ID_I2C_PORT2	0xA84A
@@ -137,6 +138,8 @@ struct acpi_device;
  * @input_buf: store a copy of latest input report data
  * @report_buf: store a copy of latest input/output report packet from set/get feature
  * @report_len: the length of input/output report packet
+ * @reset_ack_wq: workqueue for waiting reset response from device
+ * @reset_ack: indicate reset response received or not
  */
 struct quicki2c_device {
 	struct device *dev;
@@ -163,6 +166,9 @@ struct quicki2c_device {
 	u8 *input_buf;
 	u8 *report_buf;
 	u32 report_len;
+
+	wait_queue_head_t reset_ack_wq;
+	bool reset_ack;
 };
 
 #endif /* _QUICKI2C_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index 6e6463abe894..2810283df708 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -190,3 +190,30 @@ int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 
 	return buf_len;
 }
+
+#define HIDI2C_RESET_TIMEOUT		5
+
+int quicki2c_reset(struct quicki2c_device *qcdev)
+{
+	int ret;
+
+	qcdev->reset_ack = false;
+	qcdev->state = QUICKI2C_RESETING;
+
+	ret = write_cmd_to_txdma(qcdev, HIDI2C_RESET, HIDI2C_RESERVED, 0, NULL, 0);
+	if (ret) {
+		dev_err_once(qcdev->dev, "Send reset command failed, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_event_interruptible_timeout(qcdev->reset_ack_wq, qcdev->reset_ack,
+					       HIDI2C_RESET_TIMEOUT * HZ);
+	if (ret <= 0 || !qcdev->reset_ack) {
+		dev_err_once(qcdev->dev,
+			     "Wait reset response timed out ret:%d timeout:%ds\n",
+			     ret, HIDI2C_RESET_TIMEOUT);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
index 3a0d66c7d9ef..bf4908cce59c 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
@@ -15,5 +15,6 @@ int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 			unsigned int reportnum, void *buf, u32 buf_len);
 int quicki2c_get_device_descriptor(struct quicki2c_device *qcdev);
 int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev);
+int quicki2c_reset(struct quicki2c_device *qcdev);
 
 #endif /* _QUICKI2C_PROTOCOL_H_ */
-- 
2.40.1


