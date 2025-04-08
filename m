Return-Path: <linux-doc+bounces-42583-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA5A80A0A
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 15:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 156601BA6811
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24E927932C;
	Tue,  8 Apr 2025 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyIDUOtU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C1626E174;
	Tue,  8 Apr 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116516; cv=none; b=ftJED8XT+W9y/BTUjbJK1Clr5ZdaZlTll+oIvLwJ7o9hqOOUtECj/jU4fDHGtJybxzM5+IdAPnW/gMao40eyA1HFKbdAAfX6zj5UT3zl8nK7+v9R1LPDjssZ2rJripBydIE0v8ab2XhaxfibALzKJViLsfX28eZeQdzBqInHioU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116516; c=relaxed/simple;
	bh=C51W2bYAevP0TgGkjEZvxDY77miBNaUJ0m82Tss+SBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uud1Pnmqfptb4OZ/k3ee/TLklbAGG4174rCK4saK+gPGtr+LmEyvMnfmtuaFQIJDOpWycXe5p3jNJYHPCIV/zFeMUtgCBdkt395j32kFHdOIRoDYV6NtewYtkQWFyf3jSAJFgJxrhWjFA3BeGPft9SEMD1rkV5DihkVyvc5FODU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyIDUOtU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744116515; x=1775652515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C51W2bYAevP0TgGkjEZvxDY77miBNaUJ0m82Tss+SBw=;
  b=GyIDUOtUfTkC7hEF59n22/a5EI1hsoi+rL/r5MAe3EbmtLXepP/tB3Gr
   sktBt4XauM1wGEtWaT1LicpXm9JjaAl1s45330cFnBaZQ/nIMtnhEPm9p
   /TN3XtaJi9hyLAgXpadf8OdKGFv/9GvadFWIXKD8Ks01cMjmxIt7ASRWi
   c2SnQoDfhG814YqqQoCZL9YLMlvP/u0QIWaJmB5gROwK39wP+58focDiI
   4YUaXf8Qq7V0HV9vUrkgJEoezgkWTYHOz9CnsfZmSR+Tsw1og44An90/p
   U2pMDkBwQ85jaNCq/VW8DJcfJx7LZNV6P1i2Rl0EWim3yhNMyKxjDy5Gt
   A==;
X-CSE-ConnectionGUID: hs5YXS23TU6hGEwMcwVajg==
X-CSE-MsgGUID: cmJiL71dQjaze9ahbsGV8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56184846"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56184846"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:48:34 -0700
X-CSE-ConnectionGUID: OvHdJVtGQNuG2mJRS9Fr/g==
X-CSE-MsgGUID: 2zYGVvx5Q/q6oSpm9mkSOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133130653"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2025 05:48:27 -0700
Received: from mglak.igk.intel.com (mglak.igk.intel.com [10.237.112.146])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id E7EF434318;
	Tue,  8 Apr 2025 13:48:23 +0100 (IST)
From: Larysa Zaremba <larysa.zaremba@intel.com>
To: intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mustafa Ismail <mustafa.ismail@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Lee Trager <lee@trager.us>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Larysa Zaremba <larysa.zaremba@intel.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Wenjun Wu <wenjun1.wu@intel.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Karlsson, Magnus" <magnus.karlsson@intel.com>,
	Emil Tantilov <emil.s.tantilov@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Josh Hay <joshua.a.hay@intel.com>,
	Milena Olech <milena.olech@intel.com>,
	pavan.kumar.linga@intel.com,
	"Singhai, Anjali" <anjali.singhai@intel.com>,
	Phani R Burra <phani.r.burra@intel.com>
Subject: [PATCH iwl-next 03/14] libeth: add PCI device initialization helpers to libeth
Date: Tue,  8 Apr 2025 14:47:49 +0200
Message-ID: <20250408124816.11584-4-larysa.zaremba@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408124816.11584-1-larysa.zaremba@intel.com>
References: <20250408124816.11584-1-larysa.zaremba@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Phani R Burra <phani.r.burra@intel.com>

Add memory related support functions for drivers to access MMIO space and
allocate/free dma buffers.

Reviewed-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Signed-off-by: Phani R Burra <phani.r.burra@intel.com>
Co-developed-by: Victor Raj <victor.raj@intel.com>
Signed-off-by: Victor Raj <victor.raj@intel.com>
Co-developed-by: Sridhar Samudrala <sridhar.samudrala@intel.com>
Signed-off-by: Sridhar Samudrala <sridhar.samudrala@intel.com>
Co-developed-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Signed-off-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Co-developed-by: Larysa Zaremba <larysa.zaremba@intel.com>
Signed-off-by: Larysa Zaremba <larysa.zaremba@intel.com>
---
 drivers/net/ethernet/intel/libeth/Kconfig  |   6 +
 drivers/net/ethernet/intel/libeth/Makefile |   4 +
 drivers/net/ethernet/intel/libeth/pci.c    | 184 +++++++++++++++++++++
 include/net/libeth/pci.h                   |  55 ++++++
 4 files changed, 249 insertions(+)
 create mode 100644 drivers/net/ethernet/intel/libeth/pci.c
 create mode 100644 include/net/libeth/pci.h

diff --git a/drivers/net/ethernet/intel/libeth/Kconfig b/drivers/net/ethernet/intel/libeth/Kconfig
index 480293b71dbc..070ad685fb74 100644
--- a/drivers/net/ethernet/intel/libeth/Kconfig
+++ b/drivers/net/ethernet/intel/libeth/Kconfig
@@ -7,3 +7,9 @@ config LIBETH
 	help
 	  libeth is a common library containing routines shared between several
 	  drivers, but not yet promoted to the generic kernel API.
+
+config LIBETH_PCI
+	tristate
+	help
+	  Helper functions for management of PCI resources belonging
+	  to networking devices.
diff --git a/drivers/net/ethernet/intel/libeth/Makefile b/drivers/net/ethernet/intel/libeth/Makefile
index 52492b081132..5f0fc9446acb 100644
--- a/drivers/net/ethernet/intel/libeth/Makefile
+++ b/drivers/net/ethernet/intel/libeth/Makefile
@@ -4,3 +4,7 @@
 obj-$(CONFIG_LIBETH)		+= libeth.o
 
 libeth-y			:= rx.o
+
+obj-$(CONFIG_LIBETH_PCI)	+= libeth_pci.o
+
+libeth_pci-y			:= pci.o
diff --git a/drivers/net/ethernet/intel/libeth/pci.c b/drivers/net/ethernet/intel/libeth/pci.c
new file mode 100644
index 000000000000..63cf56a07ce9
--- /dev/null
+++ b/drivers/net/ethernet/intel/libeth/pci.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2025 Intel Corporation */
+
+#include <net/libeth/pci.h>
+
+/**
+ * libeth_find_mmio_region - find if MMIO region is present in the list
+ * @mmio_list: list that contains MMIO region info
+ * @offset: MMIO region start offset
+ * @bar_idx: BAR index where the offset to search
+ *
+ * Return: MMIO region pointer or NULL if the region info is not present.
+ */
+static struct libeth_pci_mmio_region *
+libeth_find_mmio_region(const struct list_head *mmio_list,
+			resource_size_t offset, int bar_idx)
+{
+	struct libeth_pci_mmio_region *mr;
+
+	list_for_each_entry(mr, mmio_list, list)
+		if (mr->bar_idx == bar_idx && mr->offset == offset)
+			return mr;
+
+	return NULL;
+}
+
+/**
+ * __libeth_pci_get_mmio_addr - get the MMIO virtual address
+ * @mmio_info: contains list of MMIO regions
+ * @offset: register offset of find
+ * @num_args: number of additional arguments present
+ *
+ * This function finds the virtual address of a register offset by iterating
+ * through the non-linear MMIO regions that are mapped by the driver.
+ *
+ * Return: valid MMIO virtual address or NULL.
+ */
+void __iomem *__libeth_pci_get_mmio_addr(struct libeth_mmio_info *mmio_info,
+					 resource_size_t offset,
+					 int num_args, ...)
+{
+	struct libeth_pci_mmio_region *mr;
+	int bar_idx = 0;
+	va_list args;
+
+	if (num_args) {
+		va_start(args, num_args);
+		bar_idx = va_arg(args, int);
+		va_end(args);
+	}
+
+	list_for_each_entry(mr, &mmio_info->mmio_list, list)
+		if (bar_idx == mr->bar_idx && offset >= mr->offset &&
+		    offset < mr->offset + mr->size) {
+			offset -= mr->offset;
+
+			return mr->addr + offset;
+		}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS_GPL(__libeth_pci_get_mmio_addr, "LIBETH_PCI");
+
+/**
+ * __libeth_pci_map_mmio_region - map PCI device MMIO region
+ * @mmio_info: struct to store the mapped MMIO region
+ * @offset: MMIO region start offset
+ * @size: MMIO region size
+ * @num_args: number of additional arguments present
+ *
+ * Return: true on success, false on memory map failure.
+ */
+bool __libeth_pci_map_mmio_region(struct libeth_mmio_info *mmio_info,
+				  resource_size_t offset,
+				  resource_size_t size, int num_args, ...)
+{
+	struct pci_dev *pdev = mmio_info->pdev;
+	struct libeth_pci_mmio_region *mr;
+	resource_size_t pa;
+	void __iomem *va;
+	int bar_idx = 0;
+	va_list args;
+
+	if (num_args) {
+		va_start(args, num_args);
+		bar_idx = va_arg(args, int);
+		va_end(args);
+	}
+
+	mr = libeth_find_mmio_region(&mmio_info->mmio_list, offset, bar_idx);
+	if (mr) {
+		pci_warn(pdev, "Mapping of BAR%u with offset %llu already exists\n",
+			 bar_idx, offset);
+		return true;
+	}
+
+	pa = pci_resource_start(pdev, bar_idx) + offset;
+	va = ioremap(pa, size);
+	if (!va) {
+		pci_err(pdev, "Failed to allocate BAR%u region\n", bar_idx);
+		return false;
+	}
+
+	mr = kvzalloc(sizeof(*mr), GFP_KERNEL);
+	if (!mr) {
+		iounmap(va);
+		return false;
+	}
+
+	mr->addr = va;
+	mr->offset = offset;
+	mr->size = size;
+	mr->bar_idx = bar_idx;
+
+	list_add_tail(&mr->list, &mmio_info->mmio_list);
+
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(__libeth_pci_map_mmio_region, "LIBETH_PCI");
+
+/**
+ * libeth_pci_unmap_all_mmio_regions - unmap all PCI device MMIO regions
+ * @mmio_info: contains list of MMIO regions to unmap
+ */
+void libeth_pci_unmap_all_mmio_regions(struct libeth_mmio_info *mmio_info)
+{
+	struct libeth_pci_mmio_region *mr, *tmp;
+
+	list_for_each_entry_safe(mr, tmp, &mmio_info->mmio_list, list) {
+		iounmap(mr->addr);
+		list_del(&mr->list);
+		kfree(mr);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(libeth_pci_unmap_all_mmio_regions, "LIBETH_PCI");
+
+/**
+ * libeth_pci_init_dev - enable and reserve PCI regions of the device
+ * @pdev: PCI device information
+ *
+ * Return: %0 on success, -%errno on failure.
+ */
+int libeth_pci_init_dev(struct pci_dev *pdev)
+{
+	int err;
+
+	err = pci_enable_device(pdev);
+	if (err)
+		return err;
+
+	err = pci_request_mem_regions(pdev, pci_name(pdev));
+	if (err)
+		goto disable_dev;
+
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (err)
+		goto rel_regions;
+
+	pci_set_master(pdev);
+
+	return 0;
+
+rel_regions:
+	pci_release_regions(pdev);
+disable_dev:
+	pci_disable_device(pdev);
+
+	return err;
+}
+EXPORT_SYMBOL_NS_GPL(libeth_pci_init_dev, "LIBETH_PCI");
+
+/**
+ * libeth_pci_deinit_dev - disable and release the PCI regions of the device
+ * @pdev: PCI device information
+ */
+void libeth_pci_deinit_dev(struct pci_dev *pdev)
+{
+	pci_disable_device(pdev);
+	pci_release_regions(pdev);
+}
+EXPORT_SYMBOL_NS_GPL(libeth_pci_deinit_dev, "LIBETH_PCI");
+
+MODULE_DESCRIPTION("Common Ethernet PCI library");
+MODULE_LICENSE("GPL");
diff --git a/include/net/libeth/pci.h b/include/net/libeth/pci.h
new file mode 100644
index 000000000000..6ae8032c2c8a
--- /dev/null
+++ b/include/net/libeth/pci.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Intel Corporation */
+
+#ifndef __LIBETH_PCI_H
+#define __LIBETH_PCI_H
+
+#include <linux/pci.h>
+
+/**
+ * struct libeth_pci_mmio_region - structure for MMIO region info
+ * @list: used to add a MMIO region to the list of MMIO regions in
+ *	  libeth_mmio_info
+ * @addr: virtual address of MMIO region start
+ * @offset: start offset of the MMIO region
+ * @size: size of the MMIO region
+ * @bar_idx: BAR index to which the MMIO region belongs to
+ */
+struct libeth_pci_mmio_region {
+	struct list_head	list;
+	void __iomem		*addr;
+	resource_size_t		offset;
+	resource_size_t		size;
+	u16			bar_idx;
+};
+
+/**
+ * struct libeth_mmio_info - contains list of MMIO regions
+ * @pdev: PCI device pointer
+ * @mmio_list: list of MMIO regions
+ */
+struct libeth_mmio_info {
+	struct pci_dev		*pdev;
+	struct list_head	mmio_list;
+};
+
+#define libeth_pci_map_mmio_region(mmio_info, offset, size, ...)	\
+	__libeth_pci_map_mmio_region(mmio_info, offset, size,		\
+				     COUNT_ARGS(__VA_ARGS__), ##__VA_ARGS__)
+
+#define libeth_pci_get_mmio_addr(mmio_info, offset, ...)		\
+	__libeth_pci_get_mmio_addr(mmio_info, offset,			\
+				   COUNT_ARGS(__VA_ARGS__), ##__VA_ARGS__)
+
+bool __libeth_pci_map_mmio_region(struct libeth_mmio_info *mmio_info,
+				  resource_size_t offset,
+				  resource_size_t size,
+				  int num_args, ...);
+void __iomem *__libeth_pci_get_mmio_addr(struct libeth_mmio_info *mmio_info,
+					 resource_size_t region_offset,
+					 int num_args, ...);
+void libeth_pci_unmap_all_mmio_regions(struct libeth_mmio_info *mmio_info);
+int libeth_pci_init_dev(struct pci_dev *pdev);
+void libeth_pci_deinit_dev(struct pci_dev *pdev);
+
+#endif /* __LIBETH_PCI_H */
-- 
2.47.0


