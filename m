Return-Path: <linux-doc+bounces-28477-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 311AE9ADEBB
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 10:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 514C01C21DE7
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 08:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E101CDFBE;
	Thu, 24 Oct 2024 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOP1Igtp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996E1CDA3B;
	Thu, 24 Oct 2024 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757516; cv=none; b=crsJ8sYDvRY/HhVU3C6kFWmPbjySUTqAOeJLSK0051JdmnQoTMevgKe4p0wbappv6nJQYqUjyCo7AHZA8/rNm6RUBAi1hz6wZHwIQ6sWNXKEgRj94TQEj2pBghgHw6JiJOnL+JMHxHQo9WHWFS1n4kMF1FEU3lM9T33s6HYZ+b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757516; c=relaxed/simple;
	bh=u3CIwzMVE9ltp+YhtFi2xZQdN7Vgw1YCitcDDc0GccQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OUFmOz/FEGt+9WkxRDSKxDaaBFdgekFUPunHDvsbOtIr+ETPCgw4bbKRIAAx+s9fKSXgS2lIhQPjcEQu1R+XwGyJOPtjbrt+Q+5uKgYVsWwONQ2FfzaKrRNTvCOUWksxpYgUfMCO3/hmqkI9XSyiYGYqsS7tiJv86rax8zHTOvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOP1Igtp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729757514; x=1761293514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u3CIwzMVE9ltp+YhtFi2xZQdN7Vgw1YCitcDDc0GccQ=;
  b=UOP1IgtpmV04Ns2Nyi34j8h0mMSt9CeLILOwO/9T01BdvlILVygXstK4
   M5gpL4r4/DsCTM43raypbqC5qhoXNBPYiC6qMoMDkWM+yYCdXI8WGAWA9
   1R9baw1cMEjxpAH7HfUXg5Ts3fmqesQ769WBEoiNQP1RrcioenBH7RpRJ
   ap26tx/PGQyoxz8aJEzk9Cdlg0gg6uK5uVVGG5hW/8FVlpl6HQkua1MFM
   1LjOZZLHrPstW8iRoa6bhWl4w3uIMya81y0Lh+Ra+fnumx6KPy4jamIzM
   6U6Mi5Fqd893JDXetvZLFal33B2eLOBCBT0+AMPOmCEO7YfrvKyrxoiC5
   A==;
X-CSE-ConnectionGUID: HNWsmPRvT3W+dza6Rr6CWQ==
X-CSE-MsgGUID: QmZqG8Z2R/6B0avebmdMuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29501144"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29501144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:11:50 -0700
X-CSE-ConnectionGUID: uNjj/ILYQmGQbIlSeUklvQ==
X-CSE-MsgGUID: RNgfouXDSVOxS2oPKzS+Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80690994"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2024 01:11:47 -0700
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
Subject: [PATCH v1 19/22] HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces
Date: Thu, 24 Oct 2024 16:10:20 +0800
Message-Id: <20241024081023.1468951-20-even.xu@intel.com>
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

Add functions to query QuickI2C ACPI DSM/DSD parameters and use these
APIs to access all QuickI2C ACPI resources.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-quicki2c/pci-quicki2c.c             | 190 ++++++++++++++++++
 .../intel-quicki2c/quicki2c-dev.h             | 107 ++++++++++
 2 files changed, 297 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 9daa0ae2055e..035d0f5ce3b8 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (c) 2024 Intel Corporation */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -9,9 +10,185 @@
 #include <linux/pci.h>
 
 #include "intel-thc-dev.h"
+#include "intel-thc-hw.h"
 
 #include "quicki2c-dev.h"
 
+/* THC QuickI2C ACPI method to get device properties */
+/* HIDI2C device method */
+static guid_t i2c_hid_guid =
+	GUID_INIT(0x3cdff6f7, 0x4267, 0x4555, 0xad, 0x05, 0xb3, 0x0a, 0x3d, 0x89, 0x38, 0xde);
+
+/* platform method */
+static guid_t thc_platform_guid =
+	GUID_INIT(0x84005682, 0x5b71, 0x41a4, 0x8d, 0x66, 0x81, 0x30, 0xf7, 0x87, 0xa1, 0x38);
+
+/**
+ * quicki2c_acpi_get_dsm_property - Query device ACPI DSM parameter
+ *
+ * @adev: point to ACPI device
+ * @guid: ACPI method's guid
+ * @rev: ACPI method's revision
+ * @func: ACPI method's function number
+ * @type: ACPI parameter's data type
+ * @prop_buf: point to return buffer
+ *
+ * This is a helper function for device to query its ACPI DSM parameters.
+ *
+ * Return: 0 if success or ENODEV on failed.
+ */
+static int quicki2c_acpi_get_dsm_property(struct acpi_device *adev, const guid_t *guid,
+					  u64 rev, u64 func, acpi_object_type type, void *prop_buf)
+{
+	acpi_handle handle = acpi_device_handle(adev);
+	union acpi_object *obj;
+
+	obj = acpi_evaluate_dsm_typed(handle, guid, rev, func, NULL, type);
+	if (!obj) {
+		acpi_handle_err(handle,
+				"Error _DSM call failed, rev: %d, func: %d, type: %d\n",
+				(int)rev, (int)func, (int)type);
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
+ * quicki2c_acpi_get_dsd_property - Query device ACPI DSD parameter
+ *
+ * @adev: point to ACPI device
+ * @dsd_method_name: ACPI method's property name
+ * @type: ACPI parameter's data type
+ * @prop_buf: point to return buffer
+ *
+ * This is a helper function for device to query its ACPI DSD parameters.
+ *
+ * Return: 0 if success or ENODEV on failed.
+ */
+static int quicki2c_acpi_get_dsd_property(struct acpi_device *adev, acpi_string dsd_method_name,
+					  acpi_object_type type, void *prop_buf)
+{
+	acpi_handle handle = acpi_device_handle(adev);
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object obj = { .type = type };
+	struct acpi_object_list arg_list = {
+		.count = 1,
+		.pointer = &obj,
+	};
+	union acpi_object *ret_obj;
+	acpi_status status;
+
+	status = acpi_evaluate_object(handle, dsd_method_name, &arg_list, &buffer);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle,
+				"Can't evaluate %s method: %d\n", dsd_method_name, status);
+		return -ENODEV;
+	}
+
+	ret_obj = buffer.pointer;
+
+	memcpy(prop_buf, ret_obj->buffer.pointer, ret_obj->buffer.length);
+
+	return 0;
+}
+
+/**
+ * quicki2c_get_acpi_resources - Query all quicki2c devices' ACPI parameters
+ *
+ * @qcdev: point to quicki2c device
+ *
+ * This function gets all quicki2c devices' ACPI resource.
+ *
+ * Return: 0 if success or error code on failed.
+ */
+static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(qcdev->dev);
+	struct quicki2c_subip_acpi_parameter i2c_param;
+	struct quicki2c_subip_acpi_config i2c_config;
+	int ret = -EINVAL;
+
+	if (!adev) {
+		dev_err(qcdev->dev, "Invalid acpi device pointer\n");
+		return ret;
+	}
+
+	qcdev->acpi_dev = adev;
+
+	ret = quicki2c_acpi_get_dsm_property(adev, &i2c_hid_guid,
+					     QUICKI2C_ACPI_REVISION_NUM,
+					     QUICKI2C_ACPI_FUNC_NUM_HID_DESC_ADDR,
+					     ACPI_TYPE_INTEGER,
+					     &qcdev->hid_desc_addr);
+	if (ret)
+		return ret;
+
+	ret = quicki2c_acpi_get_dsm_property(adev, &thc_platform_guid,
+					     QUICKI2C_ACPI_REVISION_NUM,
+					     QUICKI2C_ACPI_FUNC_NUM_ACTIVE_LTR_VAL,
+					     ACPI_TYPE_INTEGER,
+					     &qcdev->active_ltr_val);
+	if (ret)
+		return ret;
+
+	ret = quicki2c_acpi_get_dsm_property(adev, &thc_platform_guid,
+					     QUICKI2C_ACPI_REVISION_NUM,
+					     QUICKI2C_ACPI_FUNC_NUM_LP_LTR_VAL,
+					     ACPI_TYPE_INTEGER,
+					     &qcdev->low_power_ltr_val);
+	if (ret)
+		return ret;
+
+	ret = quicki2c_acpi_get_dsd_property(adev, QUICKI2C_ACPI_METHOD_NAME_ICRS,
+					     ACPI_TYPE_BUFFER, &i2c_param);
+	if (ret)
+		return ret;
+
+	if (i2c_param.addressing_mode != HIDI2C_ADDRESSING_MODE_7BIT)
+		return -EOPNOTSUPP;
+
+	qcdev->i2c_slave_addr = i2c_param.device_address;
+
+	ret = quicki2c_acpi_get_dsd_property(adev, QUICKI2C_ACPI_METHOD_NAME_ISUB,
+					     ACPI_TYPE_BUFFER, &i2c_config);
+	if (ret)
+		return ret;
+
+	if (i2c_param.connection_speed > 0 &&
+	    i2c_param.connection_speed <= QUICKI2C_SUBIP_STANDARD_MODE_MAX_SPEED) {
+		qcdev->i2c_speed_mode = THC_I2C_STANDARD;
+		qcdev->i2c_clock_hcnt = i2c_config.SMHX;
+		qcdev->i2c_clock_lcnt = i2c_config.SMLX;
+	} else if (i2c_param.connection_speed > QUICKI2C_SUBIP_STANDARD_MODE_MAX_SPEED &&
+		   i2c_param.connection_speed <= QUICKI2C_SUBIP_FAST_MODE_MAX_SPEED) {
+		qcdev->i2c_speed_mode = THC_I2C_FAST_AND_PLUS;
+		qcdev->i2c_clock_hcnt = i2c_config.FMHX;
+		qcdev->i2c_clock_lcnt = i2c_config.FMLX;
+	} else if (i2c_param.connection_speed > QUICKI2C_SUBIP_FAST_MODE_MAX_SPEED &&
+		   i2c_param.connection_speed <= QUICKI2C_SUBIP_FASTPLUS_MODE_MAX_SPEED) {
+		qcdev->i2c_speed_mode = THC_I2C_FAST_AND_PLUS;
+		qcdev->i2c_clock_hcnt = i2c_config.FPHX;
+		qcdev->i2c_clock_lcnt = i2c_config.FPLX;
+	} else if (i2c_param.connection_speed > QUICKI2C_SUBIP_FASTPLUS_MODE_MAX_SPEED &&
+		   i2c_param.connection_speed <= QUICKI2C_SUBIP_HIGH_SPEED_MODE_MAX_SPEED) {
+		qcdev->i2c_speed_mode = THC_I2C_HIGH_SPEED;
+		qcdev->i2c_clock_hcnt = i2c_config.HMHX;
+		qcdev->i2c_clock_lcnt = i2c_config.HMLX;
+	} else {
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 /**
  * quicki2c_irq_quick_handler - The ISR of the quicki2c driver
  *
@@ -92,12 +269,25 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
 		return ERR_PTR(ret);
 	}
 
+	ret = quicki2c_get_acpi_resources(qcdev);
+	if (ret) {
+		dev_err_once(dev, "Get ACPI resources failed, ret = %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
 	ret = thc_port_select(qcdev->thc_hw, THC_PORT_TYPE_I2C);
 	if (ret) {
 		dev_err_once(dev, "Failed to select THC port, ret = %d.\n", ret);
 		return ERR_PTR(ret);
 	}
 
+	ret = thc_i2c_subip_init(qcdev->thc_hw, qcdev->i2c_slave_addr,
+				 qcdev->i2c_speed_mode,
+				 qcdev->i2c_clock_hcnt,
+				 qcdev->i2c_clock_lcnt);
+	if (ret)
+		return ERR_PTR(ret);
+
 	thc_interrupt_config(qcdev->thc_hw);
 
 	thc_interrupt_enable(qcdev->thc_hw, true);
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 7cdbd7f4acd3..59907e59b96f 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -12,6 +12,25 @@
 /* Packet size value, the unit is 16 bytes */
 #define MAX_PACKET_SIZE_VALUE_LNL			256
 
+/* HIDI2C special ACPI parameters DSD name */
+#define QUICKI2C_ACPI_METHOD_NAME_ICRS		"ICRS"
+#define QUICKI2C_ACPI_METHOD_NAME_ISUB		"ISUB"
+
+/* HIDI2C special ACPI parameters DSM methods */
+#define QUICKI2C_ACPI_REVISION_NUM		1
+#define QUICKI2C_ACPI_FUNC_NUM_HID_DESC_ADDR	1
+#define QUICKI2C_ACPI_FUNC_NUM_ACTIVE_LTR_VAL	1
+#define QUICKI2C_ACPI_FUNC_NUM_LP_LTR_VAL	2
+
+#define QUICKI2C_SUBIP_STANDARD_MODE_MAX_SPEED		100000
+#define QUICKI2C_SUBIP_FAST_MODE_MAX_SPEED		400000
+#define QUICKI2C_SUBIP_FASTPLUS_MODE_MAX_SPEED		1000000
+#define QUICKI2C_SUBIP_HIGH_SPEED_MODE_MAX_SPEED	3400000
+
+#define QUICKI2C_DEFAULT_ACTIVE_LTR_VALUE	5
+#define QUICKI2C_DEFAULT_LP_LTR_VALUE		500
+#define QUICKI2C_RPM_TIMEOUT_MS			500
+
 enum quicki2c_dev_state {
 	QUICKI2C_NONE,
 	QUICKI2C_RESETING,
@@ -21,10 +40,80 @@ enum quicki2c_dev_state {
 	QUICKI2C_DISABLED,
 };
 
+enum {
+	HIDI2C_ADDRESSING_MODE_7BIT,
+	HIDI2C_ADDRESSING_MODE_10BIT,
+};
+
+/**
+ * struct quicki2c_subip_acpi_parameter - QuickI2C ACPI DSD parameters
+ * @device_address: I2C device slave address
+ * @connection_speed: I2C device expected connection speed
+ * @addressing_mode: I2C device slave address mode, 7bit or 10bit
+ *
+ * Those properties get from QUICKI2C_ACPI_METHOD_NAME_ICRS method, used for
+ * Bus parameter.
+ */
+struct quicki2c_subip_acpi_parameter {
+	u16 device_address;
+	u64 connection_speed;
+	u8 addressing_mode;
+} __packed;
+
+/**
+ * struct quicki2c_subip_acpi_config - QuickI2C ACPI DSD parameters
+ * @SMHX: Standard Mode (100 kbit/s) Serial Clock Line HIGH Period
+ * @SMLX: Standard Mode (100 kbit/s) Serial Clock Line LOW Period
+ * @SMTD: Standard Mode (100 kbit/s) Serial Data Line Transmit Hold Period
+ * @SMRD: Standard Mode (100 kbit/s) Serial Data Receive Hold Period
+ * @FMHX: Fast Mode (400 kbit/s) Serial Clock Line HIGH Period
+ * @FMLX: Fast Mode (400 kbit/s) Serial Clock Line LOW Period
+ * @FMTD: Fast Mode (400 kbit/s) Serial Data Line Transmit Hold Period
+ * @FMRD: Fast Mode (400 kbit/s) Serial Data Line Receive Hold Period
+ * @FMSL: Maximum length (in ic_clk_cycles) of suppressed spikes
+ *        in Standard Mode, Fast Mode and Fast Mode Plus
+ * @FPHX: Fast Mode Plus (1Mbit/sec) Serial Clock Line HIGH Period
+ * @FPLX: Fast Mode Plus (1Mbit/sec) Serial Clock Line LOW Period
+ * @FPTD: Fast Mode Plus (1Mbit/sec) Serial Data Line Transmit HOLD Period
+ * @FPRD: Fast Mode Plus (1Mbit/sec) Serial Data Line Receive HOLD Period
+ * @HMHX: High Speed Mode Plus (3.4Mbits/sec) Serial Clock Line HIGH Period
+ * @HMLX: High Speed Mode Plus (3.4Mbits/sec) Serial Clock Line LOW Period
+ * @HMTD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line Transmit HOLD Period
+ * @HMRD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line Receive HOLD Period
+ * @HMSL: Maximum length (in ic_clk_cycles) of suppressed spikes in High Speed Mode
+ *
+ * Those properties get from QUICKI2C_ACPI_METHOD_NAME_ISUB method, used for
+ * I2C timing configure.
+ */
+struct quicki2c_subip_acpi_config {
+	u64 SMHX;
+	u64 SMLX;
+	u64 SMTD;
+	u64 SMRD;
+
+	u64 FMHX;
+	u64 FMLX;
+	u64 FMTD;
+	u64 FMRD;
+	u64 FMSL;
+
+	u64 FPHX;
+	u64 FPLX;
+	u64 FPTD;
+	u64 FPRD;
+
+	u64 HMHX;
+	u64 HMLX;
+	u64 HMTD;
+	u64 HMRD;
+	u64 HMSL;
+};
+
 struct device;
 struct pci_dev;
 struct thc_device;
 struct hid_device;
+struct acpi_device;
 
 /**
  * struct quicki2c_device -  THC QuickI2C device struct
@@ -32,10 +121,18 @@ struct hid_device;
  * @pdev: point to PCI device
  * @thc_hw: point to THC device
  * @hid_dev: point to hid device
+ * @acpi_dev: point to ACPI device
  * @driver_data: point to quicki2c specific driver data
  * @state: THC I2C device state
  * @mem_addr: MMIO memory address
  * @dev_desc: device descriptor for HIDI2C protocol
+ * @i2c_slave_addr: HIDI2C device slave address
+ * @hid_desc_addr: Register address for retrieve HID device descriptor
+ * @active_ltr_val: THC active LTR value
+ * @low_power_ltr_val: THC low power LTR value
+ * @i2c_speed_mode: 0 - standard mode, 1 - fast mode, 2 - fast mode plus
+ * @i2c_clock_hcnt: I2C CLK high period time (unit in cycle count)
+ * @i2c_clock_lcnt: I2C CLK low period time (unit in cycle count)
  * @report_descriptor: store a copy of device report descriptor
  */
 struct quicki2c_device {
@@ -43,11 +140,21 @@ struct quicki2c_device {
 	struct pci_dev *pdev;
 	struct thc_device *thc_hw;
 	struct hid_device *hid_dev;
+	struct acpi_device *acpi_dev;
 	enum quicki2c_dev_state state;
 
 	void __iomem *mem_addr;
 
 	struct hidi2c_dev_descriptor dev_desc;
+	u8 i2c_slave_addr;
+	u16 hid_desc_addr;
+
+	u32 active_ltr_val;
+	u32 low_power_ltr_val;
+
+	u32 i2c_speed_mode;
+	u32 i2c_clock_hcnt;
+	u32 i2c_clock_lcnt;
 
 	u8 *report_descriptor;
 };
-- 
2.40.1


