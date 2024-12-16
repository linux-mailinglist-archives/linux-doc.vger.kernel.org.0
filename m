Return-Path: <linux-doc+bounces-32825-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C32B9F280C
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 02:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D02F1658DD
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 01:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636F853E23;
	Mon, 16 Dec 2024 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGRC1IfO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB191898F2;
	Mon, 16 Dec 2024 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313367; cv=none; b=KCvdICWyAFHi6HOCLEoAKtsBNOjrVGd24hpqzjuiWERhcQmz3ce6axVWh9umXH2+PySFt5A8k/IvFr6uBflZWv1OPm+xl/ZgfhWFXK2JeP/t6nvr2+Vyl+PamWug8yKzJG7bvHhGEvayiBudTLc8v38FsXZPKOxVlxXOmyixxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313367; c=relaxed/simple;
	bh=4x5KuIkPK4WFWGdp7jeThHTUkRLeD1D/FOPjQaAiaMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u9UAaDeWekvszHkgI1syzBoirEJZEoPPqcKozO5xm1180xdfgh166ujFSGf0hNDTdBHWr9kxN0sC06mN+JfZxGI5swdlzkiZglFzd+O6MgwLu7ANU5oiaE50SCwWxIPE9fdNINDKgZRERfV+lwLoCJvEOZCnHDmqVdn6SpfORH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGRC1IfO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313365; x=1765849365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4x5KuIkPK4WFWGdp7jeThHTUkRLeD1D/FOPjQaAiaMw=;
  b=TGRC1IfOSWqbwXizxcFYjvOA+3BTXLw7pxyDMNAi4a5PsDn0WBNwNY6t
   ZZgYYzR5tUkVlKKETbUVbAIV2WNW1VDve3ihq07FBaJr6pdVpB0SFWYK+
   +rOvwnDOoq10rt47MgOSAm8I/1Q4YSPAoWv7FFoaT8mrmPSd24mK+9VQ+
   jnU512Y8K7KhW4KthhaWFmcIPBCzTbbaIKbcDiXkcXMIy7XdvGc6g+2oi
   q1keVONA4gY4PiEKFUmUSOI3oqHwV/rnD5xJkC3UgJa3HG0Dr7DkL/pIW
   ws1ERqJkS+LC4LBsGUIQOgczLk8bqWJCj4GUwV322L6EJaBMNU0jYTsQz
   w==;
X-CSE-ConnectionGUID: N+acSjF4S/2XSUkJrPf2Ew==
X-CSE-MsgGUID: 7yIjDcFrQZ+e8jpvPwMcjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34013084"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34013084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:44 -0800
X-CSE-ConnectionGUID: lU4wF3ZaSdiNH3a+sZypow==
X-CSE-MsgGUID: wocnPSNWRFCvkFgKw0IKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084254"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:41 -0800
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
Subject: [PATCH v3 16/22] HID: intel-thc-hid: intel-quickspi: Add PM implementation
Date: Mon, 16 Dec 2024 09:41:21 +0800
Message-Id: <20241216014127.3722172-17-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241216014127.3722172-1-even.xu@intel.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement THC QuickSPI driver power management callbacks.

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel-quickspi/pci-quickspi.c             | 246 ++++++++++++++++++
 .../intel-quickspi/quickspi-dev.h             |   8 +
 .../intel-quickspi/quickspi-hid.c             |   8 +
 3 files changed, 262 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index cc92e1a30411..4641e818dfa4 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 
 #include "intel-thc-dev.h"
 #include "intel-thc-hw.h"
@@ -281,6 +282,10 @@ static irqreturn_t quickspi_irq_thread_handler(int irq, void *dev_id)
 	if (qsdev->state == QUICKSPI_DISABLED)
 		return IRQ_HANDLED;
 
+	ret = pm_runtime_resume_and_get(qsdev->dev);
+	if (ret)
+		return IRQ_HANDLED;
+
 	int_mask = thc_interrupt_handler(qsdev->thc_hw);
 
 	if (int_mask & BIT(THC_FATAL_ERR_INT) || int_mask & BIT(THC_TXN_ERR_INT)) {
@@ -318,6 +323,9 @@ static irqreturn_t quickspi_irq_thread_handler(int irq, void *dev_id)
 		if (try_recover(qsdev))
 			qsdev->state = QUICKSPI_DISABLED;
 
+	pm_runtime_mark_last_busy(qsdev->dev);
+	pm_runtime_put_autosuspend(qsdev->dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -645,6 +653,13 @@ static int quickspi_probe(struct pci_dev *pdev,
 
 	qsdev->state = QUICKSPI_ENABLED;
 
+	/* Enable runtime power management */
+	pm_runtime_use_autosuspend(qsdev->dev);
+	pm_runtime_set_autosuspend_delay(qsdev->dev, DEFAULT_AUTO_SUSPEND_DELAY_MS);
+	pm_runtime_mark_last_busy(qsdev->dev);
+	pm_runtime_put_noidle(qsdev->dev);
+	pm_runtime_put_autosuspend(qsdev->dev);
+
 	dev_dbg(&pdev->dev, "QuickSPI probe success\n");
 
 	return 0;
@@ -680,6 +695,8 @@ static void quickspi_remove(struct pci_dev *pdev)
 	quickspi_hid_remove(qsdev);
 	quickspi_dma_deinit(qsdev);
 
+	pm_runtime_get_noresume(qsdev->dev);
+
 	quickspi_dev_deinit(qsdev);
 
 	pcim_iounmap_regions(pdev, BIT(0));
@@ -709,6 +726,234 @@ static void quickspi_shutdown(struct pci_dev *pdev)
 	quickspi_dev_deinit(qsdev);
 }
 
+static int quickspi_suspend(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	ret = quickspi_set_power(qsdev, HIDSPI_SLEEP);
+	if (ret)
+		return ret;
+
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, true);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qsdev->thc_hw, false);
+
+	thc_dma_unconfigure(qsdev->thc_hw);
+
+	return 0;
+}
+
+static int quickspi_resume(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	ret = thc_port_select(qsdev->thc_hw, THC_PORT_TYPE_SPI);
+	if (ret)
+		return ret;
+
+	thc_interrupt_config(qsdev->thc_hw);
+
+	thc_interrupt_enable(qsdev->thc_hw, true);
+
+	ret = thc_dma_configure(qsdev->thc_hw);
+	if (ret)
+		return ret;
+
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, false);
+	if (ret)
+		return ret;
+
+	ret = quickspi_set_power(qsdev, HIDSPI_ON);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int quickspi_freeze(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, true);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qsdev->thc_hw, false);
+
+	thc_dma_unconfigure(qsdev->thc_hw);
+
+	return 0;
+}
+
+static int quickspi_thaw(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	ret = thc_dma_configure(qsdev->thc_hw);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qsdev->thc_hw, true);
+
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int quickspi_poweroff(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, true);
+	if (ret)
+		return ret;
+
+	thc_interrupt_enable(qsdev->thc_hw, false);
+
+	thc_ltr_unconfig(qsdev->thc_hw);
+
+	quickspi_dma_deinit(qsdev);
+
+	return 0;
+}
+
+static int quickspi_restore(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+	int ret;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, true);
+	if (ret)
+		return ret;
+
+	/* Reconfig THC HW when back from hibernate */
+	ret = thc_port_select(qsdev->thc_hw, THC_PORT_TYPE_SPI);
+	if (ret)
+		return ret;
+
+	thc_spi_input_output_address_config(qsdev->thc_hw,
+					    qsdev->input_report_hdr_addr,
+					    qsdev->input_report_bdy_addr,
+					    qsdev->output_report_addr);
+
+	ret = thc_spi_read_config(qsdev->thc_hw, qsdev->spi_freq_val,
+				  qsdev->spi_read_io_mode,
+				  qsdev->spi_read_opcode,
+				  qsdev->spi_packet_size);
+	if (ret)
+		return ret;
+
+	ret = thc_spi_write_config(qsdev->thc_hw, qsdev->spi_freq_val,
+				   qsdev->spi_write_io_mode,
+				   qsdev->spi_write_opcode,
+				   qsdev->spi_packet_size,
+				   qsdev->performance_limit);
+	if (ret)
+		return ret;
+
+	thc_interrupt_config(qsdev->thc_hw);
+
+	thc_interrupt_enable(qsdev->thc_hw, true);
+
+	/* TIC may lose power, needs go through reset flow */
+	ret = reset_tic(qsdev);
+	if (ret)
+		return ret;
+
+	ret = thc_dma_configure(qsdev->thc_hw);
+	if (ret)
+		return ret;
+
+	thc_ltr_config(qsdev->thc_hw,
+		       qsdev->active_ltr_val,
+		       qsdev->low_power_ltr_val);
+
+	thc_change_ltr_mode(qsdev->thc_hw, THC_LTR_MODE_ACTIVE);
+
+	return 0;
+}
+
+static int quickspi_runtime_suspend(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	thc_change_ltr_mode(qsdev->thc_hw, THC_LTR_MODE_LP);
+
+	pci_save_state(pdev);
+
+	return 0;
+}
+
+static int quickspi_runtime_resume(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+	struct quickspi_device *qsdev;
+
+	qsdev = pci_get_drvdata(pdev);
+	if (!qsdev)
+		return -ENODEV;
+
+	thc_change_ltr_mode(qsdev->thc_hw, THC_LTR_MODE_ACTIVE);
+
+	return 0;
+}
+
+static const struct dev_pm_ops quickspi_pm_ops = {
+	.suspend = quickspi_suspend,
+	.resume = quickspi_resume,
+	.freeze = quickspi_freeze,
+	.thaw = quickspi_thaw,
+	.poweroff = quickspi_poweroff,
+	.restore = quickspi_restore,
+	.runtime_suspend = quickspi_runtime_suspend,
+	.runtime_resume = quickspi_runtime_resume,
+	.runtime_idle = NULL,
+};
+
 static const struct pci_device_id quickspi_pci_tbl[] = {
 	{PCI_DEVICE_DATA(INTEL, THC_MTL_DEVICE_ID_SPI_PORT1, &mtl), },
 	{PCI_DEVICE_DATA(INTEL, THC_MTL_DEVICE_ID_SPI_PORT2, &mtl), },
@@ -728,6 +973,7 @@ static struct pci_driver quickspi_driver = {
 	.probe = quickspi_probe,
 	.remove = quickspi_remove,
 	.shutdown = quickspi_shutdown,
+	.driver.pm = &quickspi_pm_ops,
 	.driver.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 };
 
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index c5257378c1e9..75179bb26767 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -47,6 +47,14 @@
 #define MAX_PACKET_SIZE_VALUE_MTL			128
 #define MAX_PACKET_SIZE_VALUE_LNL			256
 
+/*
+ * THC uses runtime auto suspend to dynamically switch between THC active LTR
+ * and low power LTR to save CPU power.
+ * Default value is 5000ms, that means if no touch event in this time, THC will
+ * change to low power LTR mode.
+ */
+#define DEFAULT_AUTO_SUSPEND_DELAY_MS			5000
+
 enum quickspi_dev_state {
 	QUICKSPI_NONE,
 	QUICKSPI_RESETING,
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
index 2553d4b42b51..ad52e402c28a 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
@@ -3,6 +3,7 @@
 
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/pm_runtime.h>
 
 #include "quickspi-dev.h"
 #include "quickspi-hid.h"
@@ -54,6 +55,10 @@ static int quickspi_hid_raw_request(struct hid_device *hid,
 	struct quickspi_device *qsdev = hid->driver_data;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(qsdev->dev);
+	if (ret)
+		return ret;
+
 	switch (reqtype) {
 	case HID_REQ_GET_REPORT:
 		ret = quickspi_get_report(qsdev, rtype, reportnum, buf);
@@ -66,6 +71,9 @@ static int quickspi_hid_raw_request(struct hid_device *hid,
 		break;
 	}
 
+	pm_runtime_mark_last_busy(qsdev->dev);
+	pm_runtime_put_autosuspend(qsdev->dev);
+
 	return ret;
 }
 
-- 
2.40.1


