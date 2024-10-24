Return-Path: <linux-doc+bounces-28471-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C49ADEA6
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 10:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B0A1F237CA
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 08:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869111B2188;
	Thu, 24 Oct 2024 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGPWQqLY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A21C174E;
	Thu, 24 Oct 2024 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757496; cv=none; b=lvfodD63Fuk5AwhWeYGD9PxPyycu/LwkWosugUjx1Xh3hXBvZBjjJsVUULWVyoAtSTjz59vNdrkB68leGAdmJ9XlYrb/RmRPSL2diQH7hd79neThSftjRr0lh9gT/jQJjpnGpfhyXeAo1OzzoYFbzZyIRI3sRVJWd3Jz+CYdRtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757496; c=relaxed/simple;
	bh=QtcNd8GZyrPWCp7MzaQgpTLRQeUnjuUWfswbM5iZlL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MfGhfBfq3hNcr7HyqyBZcomwUuldZxBylDWMzLrjxkZ8OCPKT9It8eYZ3M+rislBf1+PJe7C3jALucUgUumV2bGpkxuFgRKR4DYkraKqHYK9D9jf1wXXaYUL5+jCzTwDTgK3/lknp3I2qxHELPbjRXUxR0w1TvSmBnlHOEY8USU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGPWQqLY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729757491; x=1761293491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QtcNd8GZyrPWCp7MzaQgpTLRQeUnjuUWfswbM5iZlL4=;
  b=nGPWQqLYlOnpXVXM345k5RgVVJ674zRGAMachJbnXmokmGXVY/ZuSNxb
   GNpIPCtxDwhl79IWiiuue0nVAzTNdRy9jNUu9dycpqH7vLWWujkK0uo8M
   JwheOjZrCi6BdyxTWGUutYAanJRLU/wAGwd6YkGneeLYvKG/q0RCrxRJg
   zTUMmVMChKSrHLm9yxN7pnSQd7BMqL+2X9b9G3B+L3j8oYyY0BjcwKqQb
   wvkut+80A40BbF0z56LKZy5pyS3R16ow7orm45ujyVADkDonG9PovAJly
   5kAjNr9RYVCT+ve64YSZcaVfAy3HSgYBSmohkY391VxrySOCoWXLW9uLO
   A==;
X-CSE-ConnectionGUID: ZaeesoEHRt24fbAmwFEgGA==
X-CSE-MsgGUID: A/I/xEqYS5KYoI0Lqh1UNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29501073"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29501073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:11:31 -0700
X-CSE-ConnectionGUID: v7pdc0DKQo+znJQkEDgnHQ==
X-CSE-MsgGUID: bG98fmYkSKiVTelP5IjJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80690842"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2024 01:11:28 -0700
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
Subject: [PATCH v1 13/22] HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
Date: Thu, 24 Oct 2024 16:10:14 +0800
Message-Id: <20241024081023.1468951-14-even.xu@intel.com>
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

Add functions to query QuickSPI ACPI DSD parameters and provide APIs for
DSM method accessing.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-quickspi/pci-quickspi.c             | 189 ++++++++++++++++++
 .../intel-quickspi/quickspi-dev.h             |  54 +++++
 2 files changed, 243 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index e218c9d6b1bc..16789bdb1235 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (c) 2024 Intel Corporation */
 
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -9,6 +11,7 @@
 #include <linux/pci.h>
 
 #include "intel-thc-dev.h"
+#include "intel-thc-hw.h"
 
 #include "quickspi-dev.h"
 
@@ -20,6 +23,186 @@ struct quickspi_driver_data lnl = {
 	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,
 };
 
+/* THC QuickSPI ACPI method to get device properties */
+/* HIDSPI Method: {6e2ac436-0fcf-41af-a265-b32a220dcfab} */
+static guid_t hidspi_guid =
+	GUID_INIT(0x6e2ac436, 0x0fcf, 0x41af, 0xa2, 0x65, 0xb3, 0x2a,
+		  0x22, 0x0d, 0xcf, 0xab);
+
+/* QuickSpi Method: {300D35b7-ac20-413e-8e9c-92e4dafd0afe} */
+static guid_t thc_quickspi_guid =
+	GUID_INIT(0x300d35b7, 0xac20, 0x413e, 0x8e, 0x9c, 0x92, 0xe4,
+		  0xda, 0xfd, 0x0a, 0xfe);
+
+/* Platform Method: {84005682-5b71-41a4-0x8d668130f787a138} */
+static guid_t thc_platform_guid =
+	GUID_INIT(0x84005682, 0x5b71, 0x41a4, 0x8d, 0x66, 0x81, 0x30,
+		  0xf7, 0x87, 0xa1, 0x38);
+
+/**
+ * thc_acpi_get_property - Query device ACPI parameter
+ *
+ * @adev: point to ACPI device
+ * @guid: ACPI method's guid
+ * @rev: ACPI method's revision
+ * @func: ACPI method's function number
+ * @type: ACPI parameter's data type
+ * @prop_buf: point to return buffer
+ *
+ * This is a helper function for device to query its ACPI parameters.
+ *
+ * Return: 0 if successful or ENODEV on failed.
+ */
+static int thc_acpi_get_property(struct acpi_device *adev, const guid_t *guid,
+				 u64 rev, u64 func, acpi_object_type type, void *prop_buf)
+{
+	acpi_handle handle = acpi_device_handle(adev);
+	union acpi_object *obj;
+
+	obj = acpi_evaluate_dsm_typed(handle, guid, rev, func, NULL, type);
+	if (!obj) {
+		acpi_handle_err(handle,
+				"Error _DSM call failed, rev: %llu, func: %llu, type: %u\n",
+				rev, func, type);
+		return -ENODEV;
+	}
+
+	if (type == ACPI_TYPE_INTEGER)
+		*(u32 *)prop_buf = (u32)obj->integer.value;
+	else if (type == ACPI_TYPE_BUFFER)
+		memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
+
+	ACPI_FREE(obj);
+
+	return 0;
+}
+
+/**
+ * quickspi_get_acpi_resources - Query all quickspi devices' ACPI parameters
+ *
+ * @qsdev: point to quickspi device
+ *
+ * This function gets all quickspi devices' ACPI resource.
+ *
+ * Return: 0 if successful or error code on failed.
+ */
+static int quickspi_get_acpi_resources(struct quickspi_device *qsdev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(qsdev->dev);
+	int ret = -EINVAL;
+
+	if (!adev) {
+		dev_err(qsdev->dev, "no valid ACPI companion\n");
+		return ret;
+	}
+
+	qsdev->acpi_dev = adev;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_HDR_ADDR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->input_report_hdr_addr);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_BDY_ADDR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->input_report_bdy_addr);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_OUTPUT_REP_ADDR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->output_report_addr);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_READ_OPCODE,
+				    ACPI_TYPE_BUFFER,
+				    &qsdev->spi_read_opcode);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_WRITE_OPCODE,
+				    ACPI_TYPE_BUFFER,
+				    &qsdev->spi_write_opcode);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &hidspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_IO_MODE,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->spi_read_io_mode);
+	if (ret)
+		return ret;
+
+	if (qsdev->spi_read_io_mode & SPI_WRITE_IO_MODE)
+		qsdev->spi_write_io_mode = FIELD_GET(SPI_IO_MODE_OPCODE, qsdev->spi_read_io_mode);
+	else
+		qsdev->spi_write_io_mode = THC_SINGLE_IO;
+
+	qsdev->spi_read_io_mode = FIELD_GET(SPI_IO_MODE_OPCODE, qsdev->spi_read_io_mode);
+
+	ret = thc_acpi_get_property(adev, &thc_quickspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_CONNECTION_SPEED,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->spi_freq_val);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &thc_quickspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_LIMIT_PACKET_SIZE,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->limit_packet_size);
+	if (ret)
+		return ret;
+
+	if (qsdev->limit_packet_size || !qsdev->driver_data)
+		qsdev->spi_packet_size = DEFAULT_MIN_PACKET_SIZE_VALUE;
+	else
+		qsdev->spi_packet_size = qsdev->driver_data->max_packet_size_value;
+
+	ret = thc_acpi_get_property(adev, &thc_quickspi_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_PERFORMANCE_LIMIT,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->performance_limit);
+	if (ret)
+		return ret;
+
+	qsdev->performance_limit = FIELD_GET(PERFORMANCE_LIMITATION, qsdev->performance_limit);
+
+	ret = thc_acpi_get_property(adev, &thc_platform_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_ACTIVE_LTR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->active_ltr_val);
+	if (ret)
+		return ret;
+
+	ret = thc_acpi_get_property(adev, &thc_platform_guid,
+				    ACPI_QUICKSPI_REVISION_NUM,
+				    ACPI_QUICKSPI_FUNC_NUM_LP_LTR,
+				    ACPI_TYPE_INTEGER,
+				    &qsdev->low_power_ltr_val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * quickspi_irq_quick_handler - The ISR of the quickspi driver
  *
@@ -109,6 +292,12 @@ static struct quickspi_device *quickspi_dev_init(struct pci_dev *pdev, void __io
 		return ERR_PTR(ret);
 	}
 
+	ret = quickspi_get_acpi_resources(qsdev);
+	if (ret) {
+		dev_err(dev, "Get ACPI resources failed, ret = %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
 	thc_interrupt_config(qsdev->thc_hw);
 
 	thc_interrupt_enable(qsdev->thc_hw, true);
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index 4699922c1c9b..4fc8be5f22e9 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -11,6 +11,28 @@
 #define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_SPI_PORT1	0xA849
 #define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_SPI_PORT2	0xA84B
 
+/* HIDSPI special ACPI parameters DSM methods */
+#define ACPI_QUICKSPI_REVISION_NUM			2
+#define ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_HDR_ADDR	1
+#define ACPI_QUICKSPI_FUNC_NUM_INPUT_REP_BDY_ADDR	2
+#define ACPI_QUICKSPI_FUNC_NUM_OUTPUT_REP_ADDR		3
+#define ACPI_QUICKSPI_FUNC_NUM_READ_OPCODE		4
+#define ACPI_QUICKSPI_FUNC_NUM_WRITE_OPCODE		5
+#define ACPI_QUICKSPI_FUNC_NUM_IO_MODE			6
+
+/* QickSPI device special ACPI parameters DSM methods */
+#define ACPI_QUICKSPI_FUNC_NUM_CONNECTION_SPEED		1
+#define ACPI_QUICKSPI_FUNC_NUM_LIMIT_PACKET_SIZE	2
+#define ACPI_QUICKSPI_FUNC_NUM_PERFORMANCE_LIMIT	3
+
+/* Platform special ACPI parameters DSM methods */
+#define ACPI_QUICKSPI_FUNC_NUM_ACTIVE_LTR		1
+#define ACPI_QUICKSPI_FUNC_NUM_LP_LTR			2
+
+#define SPI_WRITE_IO_MODE				BIT(13)
+#define SPI_IO_MODE_OPCODE				GENMASK(15, 14)
+#define PERFORMANCE_LIMITATION				GENMASK(15, 0)
+
 /* Packet size value, the unit is 16 bytes */
 #define DEFAULT_MIN_PACKET_SIZE_VALUE			4
 #define MAX_PACKET_SIZE_VALUE_MTL			128
@@ -37,6 +59,7 @@ struct device;
 struct pci_dev;
 struct thc_device;
 struct hid_device;
+struct acpi_device;
 
 /**
  * struct quickspi_device -  THC QuickSpi device struct
@@ -44,10 +67,26 @@ struct hid_device;
  * @pdev: point to PCI device
  * @thc_hw: point to THC device
  * @hid_dev: point to hid device
+ * @acpi_dev: point to ACPI device
  * @driver_data: point to quickspi specific driver data
  * @state: THC SPI device state
  * @mem_addr: MMIO memory address
  * @dev_desc: device descriptor for HIDSPI protocol
+ * @input_report_hdr_addr: device input report header address
+ * @input_report_bdy_addr: device input report body address
+ * @output_report_bdy_addr: device output report address
+ * @spi_freq_val: device supported max SPI frequnecy, in Hz
+ * @spi_read_io_mode: device supported SPI read io mode
+ * @spi_write_io_mode: device supported SPI write io mode
+ * @spi_read_opcode: device read opcode
+ * @spi_write_opcode: device write opcode
+ * @limit_packet_size: 1 - limit read/write packet to 64Bytes
+ *                     0 - device no packet size limiation for read/write
+ * @performance_limit: delay time, in ms.
+ *                     if device has performance limitation, must give a delay
+ *                     before write operation after a read operation.
+ * @active_ltr_val: THC active LTR value
+ * @low_power_ltr_val: THC low power LTR value
  * @report_descriptor: store a copy of device report descriptor
  */
 struct quickspi_device {
@@ -55,12 +94,27 @@ struct quickspi_device {
 	struct pci_dev *pdev;
 	struct thc_device *thc_hw;
 	struct hid_device *hid_dev;
+	struct acpi_device *acpi_dev;
 	struct quickspi_driver_data *driver_data;
 	enum quickspi_dev_state state;
 
 	void __iomem *mem_addr;
 
 	struct hidspi_dev_descriptor dev_desc;
+	u32 input_report_hdr_addr;
+	u32 input_report_bdy_addr;
+	u32 output_report_addr;
+	u32 spi_freq_val;
+	u32 spi_read_io_mode;
+	u32 spi_write_io_mode;
+	u32 spi_read_opcode;
+	u32 spi_write_opcode;
+	u32 limit_packet_size;
+	u32 spi_packet_size;
+	u32 performance_limit;
+
+	u32 active_ltr_val;
+	u32 low_power_ltr_val;
 
 	u8 *report_descriptor;
 };
-- 
2.40.1


