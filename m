Return-Path: <linux-doc+bounces-32821-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6F9F27F5
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 02:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F1E71654C0
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 01:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CED14C59B;
	Mon, 16 Dec 2024 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB+xCbS5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B81814A4C7;
	Mon, 16 Dec 2024 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313351; cv=none; b=ID6nnmFuVatqcoGl1UvI6wFxdPZerYAd1qCL6lOK1GlneLBwS9ANR5btWGjFZaZkExx5WDGS74mPITIeLAYlzrUyL1S8Quciu0F6wtdQInjdwvcQ/aX9UQf4gV4FALoOVmot+iVnul0t6ybOmD4UGvZBtx3zVNi7bkukucXwgPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313351; c=relaxed/simple;
	bh=+/NltVkSFTTtiUQhqn0W1cki0vYuB7TObr/3B60AxuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=myU4MvC9c+QYJBvRobf1/+dJRiEGt9vzBJL5q825Rh9taf56jGvwLAk+oQPsid3t+z2AwujgH76FK3xF1YNMmsMJKkennI3AMRaTmFP10myMUgUfcJ1PTwHc3yQZTBZ6YCbqwGZ5nW00SdM4oUm8YNpG8G4E0O64ERCdORIbOik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB+xCbS5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313350; x=1765849350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/NltVkSFTTtiUQhqn0W1cki0vYuB7TObr/3B60AxuY=;
  b=gB+xCbS5GHzbRqqeXqptaX9B7lIfiPs5LeVjE4e5e7wCQ63H3P3X8y71
   MJfoLF1nEdYGdqWuDKE5VJCgA6B4t4Sw/tgnbgQxQhdzm4Pcq7Qxe/LUY
   OS/7B3ta10gEib0fdVQwMKJwqnHKpEgig1Jrh2PNazP/gLvlVAqrZqbKh
   l6mcii31Wb31xVt9VUtEoH6J687jSf3cbP1wqsKnZVECPWRJNCNEPWwkU
   XZxdJ+OZNAEGvLfYV5lCsvrcDYM4PXbR9baszIJy8MraLcM9ExhsR5/MG
   vKySiThYlngXk2Q+IVSk8P2Fi6SQITy+VXGerAA8pCFN2yb470/dMiZvY
   A==;
X-CSE-ConnectionGUID: gBUdLLqvQKSpPtaXCJqcCQ==
X-CSE-MsgGUID: irYelrcWTSmJ1iP2VppFpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34013027"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34013027"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:29 -0800
X-CSE-ConnectionGUID: N+Gko1PdTemTOWu6wRxvrw==
X-CSE-MsgGUID: 39fdFa1tROaX+imT8kVyQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084228"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:26 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 12/22] HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver hid layer
Date: Mon, 16 Dec 2024 09:41:17 +0800
Message-Id: <20241216014127.3722172-13-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241216014127.3722172-1-even.xu@intel.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add HID Low level driver callbacks and hid probe function to register
QucikSPI as a HID driver, and external touch device as a HID device.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-thc-hid/Makefile            |   1 +
 .../intel-quickspi/quickspi-dev.h             |  11 ++
 .../intel-quickspi/quickspi-hid.c             | 142 ++++++++++++++++++
 .../intel-quickspi/quickspi-hid.h             |  14 ++
 include/linux/hid-over-spi.h                  |  37 +++++
 5 files changed, 205 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h
 create mode 100644 include/linux/hid-over-spi.h

diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index 7669739a39b7..4dd9e815021d 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -11,5 +11,6 @@ intel-thc-objs += intel-thc/intel-thc-dma.o
 
 obj-$(CONFIG_INTEL_QUICKSPI) += intel-quickspi.o
 intel-quickspi-objs += intel-quickspi/pci-quickspi.o
+intel-quickspi-objs += intel-quickspi/quickspi-hid.o
 
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index cffc859efa19..335b32363d7f 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -4,6 +4,8 @@
 #ifndef _QUICKSPI_DEV_H_
 #define _QUICKSPI_DEV_H_
 
+#include <linux/hid-over-spi.h>
+
 #define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT1		0x7E49
 #define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT2		0x7E4B
 #define PCI_DEVICE_ID_INTEL_THC_LNL_DEVICE_ID_SPI_PORT1		0xA849
@@ -38,24 +40,33 @@ struct quickspi_driver_data {
 struct device;
 struct pci_dev;
 struct thc_device;
+struct hid_device;
 
 /**
  * struct quickspi_device -  THC QuickSpi device struct
  * @dev: point to kernel device
  * @pdev: point to PCI device
  * @thc_hw: point to THC device
+ * @hid_dev: point to hid device
  * @driver_data: point to quickspi specific driver data
  * @state: THC SPI device state
  * @mem_addr: MMIO memory address
+ * @dev_desc: device descriptor for HIDSPI protocol
+ * @report_descriptor: store a copy of device report descriptor
  */
 struct quickspi_device {
 	struct device *dev;
 	struct pci_dev *pdev;
 	struct thc_device *thc_hw;
+	struct hid_device *hid_dev;
 	struct quickspi_driver_data *driver_data;
 	enum quickspi_dev_state state;
 
 	void __iomem *mem_addr;
+
+	struct hidspi_dev_descriptor dev_desc;
+
+	u8 *report_descriptor;
 };
 
 #endif /* _QUICKSPI_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
new file mode 100644
index 000000000000..eae53a749a38
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#include <linux/hid.h>
+#include <linux/input.h>
+
+#include "quickspi-dev.h"
+#include "quickspi-hid.h"
+
+/**
+ * quickspi_hid_parse() - HID core parse() callback
+ *
+ * @hid: HID device instance
+ *
+ * This function gets called during call to hid_add_device
+ *
+ * Return: 0 on success and non zero on error.
+ */
+static int quickspi_hid_parse(struct hid_device *hid)
+{
+	struct quickspi_device *qsdev = hid->driver_data;
+
+	if (qsdev->report_descriptor)
+		return hid_parse_report(hid, qsdev->report_descriptor,
+					le16_to_cpu(qsdev->dev_desc.rep_desc_len));
+
+	dev_err(qsdev->dev, "invalid report descriptor\n");
+	return -EINVAL;
+}
+
+static int quickspi_hid_start(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void quickspi_hid_stop(struct hid_device *hid)
+{
+}
+
+static int quickspi_hid_open(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void quickspi_hid_close(struct hid_device *hid)
+{
+}
+
+static int quickspi_hid_raw_request(struct hid_device *hid,
+				    unsigned char reportnum,
+				    __u8 *buf, size_t len,
+				    unsigned char rtype, int reqtype)
+{
+	return 0;
+}
+
+static int quickspi_hid_power(struct hid_device *hid, int lvl)
+{
+	return 0;
+}
+
+static struct hid_ll_driver quickspi_hid_ll_driver = {
+	.parse = quickspi_hid_parse,
+	.start = quickspi_hid_start,
+	.stop = quickspi_hid_stop,
+	.open = quickspi_hid_open,
+	.close = quickspi_hid_close,
+	.power = quickspi_hid_power,
+	.raw_request = quickspi_hid_raw_request,
+};
+
+/**
+ * quickspi_hid_probe() - Register HID low level driver
+ *
+ * @qsdev: point to quickspi device
+ *
+ * This function is used to allocate and add HID device.
+ *
+ * Return: 0 on success, non zero on error.
+ */
+int quickspi_hid_probe(struct quickspi_device *qsdev)
+{
+	struct hid_device *hid;
+	int ret;
+
+	hid = hid_allocate_device();
+	if (IS_ERR(hid))
+		return PTR_ERR(hid);
+
+	hid->ll_driver = &quickspi_hid_ll_driver;
+	hid->bus = BUS_PCI;
+	hid->dev.parent = qsdev->dev;
+	hid->driver_data = qsdev;
+	hid->version = le16_to_cpu(qsdev->dev_desc.version_id);
+	hid->vendor = le16_to_cpu(qsdev->dev_desc.vendor_id);
+	hid->product = le16_to_cpu(qsdev->dev_desc.product_id);
+	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "quickspi-hid",
+		 hid->vendor, hid->product);
+
+	ret = hid_add_device(hid);
+	if (ret) {
+		hid_destroy_device(hid);
+		return ret;
+	}
+
+	qsdev->hid_dev = hid;
+
+	return 0;
+}
+
+/**
+ * quickspi_hid_remove() - Destroy HID device
+ *
+ * @qsdev: point to quickspi device
+ *
+ * Return: 0 on success, non zero on error.
+ */
+void quickspi_hid_remove(struct quickspi_device *qsdev)
+{
+	hid_destroy_device(qsdev->hid_dev);
+}
+
+/**
+ * quickspi_hid_send_report() - Send HID input report data to HID core
+ *
+ * @qsdev: point to quickspi device
+ * @data: point to input report data buffer
+ * @data_len: the length of input report data
+ *
+ * Return: 0 on success, non zero on error.
+ */
+int quickspi_hid_send_report(struct quickspi_device *qsdev,
+			     void *data, size_t data_len)
+{
+	int ret;
+
+	ret = hid_input_report(qsdev->hid_dev, HID_INPUT_REPORT, data, data_len, 1);
+	if (ret)
+		dev_err(qsdev->dev, "Failed to send HID input report, ret = %d.\n", ret);
+
+	return ret;
+}
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h
new file mode 100644
index 000000000000..f640fa876a40
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _QUICKSPI_HID_H_
+#define _QUICKSPI_HID_H_
+
+struct quickspi_device;
+
+int quickspi_hid_send_report(struct quickspi_device *qsdev,
+			     void *data, size_t data_size);
+int quickspi_hid_probe(struct quickspi_device *qsdev);
+void quickspi_hid_remove(struct quickspi_device *qsdev);
+
+#endif /* _QUICKSPI_HID_H_ */
diff --git a/include/linux/hid-over-spi.h b/include/linux/hid-over-spi.h
new file mode 100644
index 000000000000..ddbe41c5d8fd
--- /dev/null
+++ b/include/linux/hid-over-spi.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Intel Corporation */
+
+#ifndef _HID_OVER_SPI_H_
+#define _HID_OVER_SPI_H_
+
+/**
+ * struct hidspi_dev_descriptor - HIDSPI device descriptor definition
+ * @dev_desc_len: The length of the complete device descriptor, fixed to 0x18 (24).
+ * @bcd_ver: The version number of the HIDSPI protocol supported.
+ *           In binary coded decimal (BCD) format. Must be fixed to 0x0300.
+ * @rep_desc_len: The length of the report descriptor
+ * @max_input_len: The length of the largest possible HID input (or feature) report
+ * @max_output_len: The length of the largest output (or feature) report
+ * @max_frag_len: The length of the largest fragment, where a fragment represents
+ *                the body of an input report.
+ * @vendor_id: Device manufacturers vendor ID
+ * @product_id: Device unique model/product ID
+ * @version_id: Device’s unique version
+ * @flags: Specify flags for the device’s operation
+ * @reserved: Reserved and should be 0
+ */
+struct hidspi_dev_descriptor {
+	__le16 dev_desc_len;
+	__le16 bcd_ver;
+	__le16 rep_desc_len;
+	__le16 max_input_len;
+	__le16 max_output_len;
+	__le16 max_frag_len;
+	__le16 vendor_id;
+	__le16 product_id;
+	__le16 version_id;
+	__le16 flags;
+	__le32 reserved;
+};
+
+#endif /* _HID_OVER_SPI_H_ */
-- 
2.40.1


