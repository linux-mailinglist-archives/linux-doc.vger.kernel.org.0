Return-Path: <linux-doc+bounces-8669-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A152284DE14
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 11:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39DBF1F22536
	for <lists+linux-doc@lfdr.de>; Thu,  8 Feb 2024 10:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE9B71B4E;
	Thu,  8 Feb 2024 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="KTwkkLDU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE556DCF9;
	Thu,  8 Feb 2024 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387573; cv=none; b=EcmP2wARPv4eFhke9Tc/QzwR64Fc/o2QxDlTyYRPdVqFbDNCg7gWC2lGLkmWfv6okAsUQoi0PLo1Ye9vUt4do3YL3uaAWjdYMvKGSqdeHguTY0gzXALqUrG6m2Q+7MwcYbK03xfNb7is9ZhIkOIeIIVgWACkcCInP+i3EYM1qqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387573; c=relaxed/simple;
	bh=IhdPPw+v4K0SYmtzZnncCZMn/aCJQTkbFsEhQBk5K2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3cHFlwdKwWcRp7eXiahDUGdCr5aJ4mCU9g/SDyz4Nr34AwImN15z+WY4vMzTSeQZnPLp+hmEVks6z92ucW+eRYJ2txhhNkuuuT5OfC/BtKUsts/QdRGdIhOyz/3g5A40hbnx38mIAtkOckNRiv0wcvl+jLz21gZr/NJNTbLldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=KTwkkLDU; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4184GWBQ000444;
	Thu, 8 Feb 2024 02:19:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=5ZRdPybADTiEpnjRDPuHNUtaUYW54VG+NB5plyqWU1E=; b=KTw
	kkLDUYWCPLXsE+ij2juTABnHTkpPuZqN5vT8mS18DoUW/kEVWDrlfmtTJXGqLmxz
	Z7rwI2KLFx8EDdqQ2CG/Aig75kfesSyq5bFrMvpyl8Od7WUWDtIj9zKSGLL2FvdB
	FK6xFt3oFe/6/YIEDsKuY57Gw0g9G3eska9zKGUlgQ0TL9cK2FBCQ1zaosU475ZK
	9zpJ74pDzwCkknRDF0NJOZvd+6d5DSJEyB5Ytgbe7Z1qeJPvYx5X9HqQPfAlMX9U
	P6CfXvbNpJTLj1OsnpwUIflhNpnmX0iXxg8dTDN8VmwAC0hfqCgCYqN6VpW67GnV
	TDaBgL/8Y0bZ2eIEgAQ==
Received: from dc5-exch02.marvell.com ([199.233.59.182])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3w4qsq0wg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 02:19:08 -0800 (PST)
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 8 Feb
 2024 02:19:06 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 8 Feb 2024 02:19:06 -0800
Received: from ubuntu-PowerEdge-T110-II.sclab.marvell.com (unknown [10.106.27.86])
	by maili.marvell.com (Postfix) with ESMTP id C2ABD3F7072;
	Thu,  8 Feb 2024 02:19:05 -0800 (PST)
From: Shinas Rasheed <srasheed@marvell.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux-doc@vger.kernel.org>, <hgani@marvell.com>, <vimleshk@marvell.com>,
        <sedara@marvell.com>, <srasheed@marvell.com>, <egallen@redhat.com>,
        <mschmidt@redhat.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <horms@kernel.org>, <wizhao@redhat.com>, <kheib@redhat.com>,
        <konguyen@redhat.com>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Veerasenareddy Burru
	<vburru@marvell.com>,
        Satananda Burla <sburla@marvell.com>,
        Shannon Nelson
	<shannon.nelson@amd.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "Brett
 Creeley" <brett.creeley@amd.com>,
        Joshua Hay <joshua.a.hay@intel.com>, "Andrew Lunn" <andrew@lunn.ch>,
        Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next v7 1/8] octeon_ep_vf: Add driver framework and device initialization
Date: Thu, 8 Feb 2024 02:18:33 -0800
Message-ID: <20240208101841.3108103-2-srasheed@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208101841.3108103-1-srasheed@marvell.com>
References: <20240208101841.3108103-1-srasheed@marvell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7DjpQlIE4f6lM4yIYvM1jIg5OY8986s2
X-Proofpoint-GUID: 7DjpQlIE4f6lM4yIYvM1jIg5OY8986s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02

Add driver framework and device setup and initialization for Octeon
PCI Endpoint NIC VF.

Add implementation to load module, initialize, register network device,
cleanup and unload module.

Signed-off-by: Shinas Rasheed <srasheed@marvell.com>
---
V7:
  - Separated octep_vf_get_if_stats from octep_vf_main.h to later patch

V6: https://lore.kernel.org/all/20240207065207.3092004-2-srasheed@marvell.com/
  - Removed reuse of netif_tx_stop_all_queues, called implicitly in
    netif_tx_disable, when stopping netdev
  - Corrected error jump labels to have proper action-specific names in
    probe function
  - Removed singlethreaded workqueue implementation, since only tx
    timeout task is run. Run the same in the system workqueue
  - netdev_hold when tx_timeout happens to protect against free_netdev
    if race occurs between rmmod and a tx timeout. netdev_put the
    reference when timeout task ends to progress freeing netdev

V5: https://lore.kernel.org/all/20240129050254.3047778-2-srasheed@marvell.com/
  - No changes

V4: https://lore.kernel.org/all/20240108124213.2966536-2-srasheed@marvell.com/
  - No changes

V3: https://lore.kernel.org/all/20240105203823.2953604-2-srasheed@marvell.com/
  - Removed UINT64_MAX, which is unused

V2: https://lore.kernel.org/all/20231223134000.2906144-2-srasheed@marvell.com/
  - Removed linux/version.h header file from inclusion in
    octep_vf_main.c

V1: https://lore.kernel.org/all/20231221092844.2885872-2-srasheed@marvell.com/

 .../device_drivers/ethernet/index.rst         |   1 +
 .../ethernet/marvell/octeon_ep_vf.rst         |  24 +
 drivers/net/ethernet/marvell/Kconfig          |   1 +
 drivers/net/ethernet/marvell/Makefile         |   1 +
 .../net/ethernet/marvell/octeon_ep_vf/Kconfig |  19 +
 .../ethernet/marvell/octeon_ep_vf/Makefile    |   9 +
 .../marvell/octeon_ep_vf/octep_vf_cn9k.c      | 157 ++++++
 .../marvell/octeon_ep_vf/octep_vf_cnxk.c      | 158 ++++++
 .../marvell/octeon_ep_vf/octep_vf_config.h    | 160 ++++++
 .../marvell/octeon_ep_vf/octep_vf_main.c      | 516 ++++++++++++++++++
 .../marvell/octeon_ep_vf/octep_vf_main.h      | 331 +++++++++++
 .../marvell/octeon_ep_vf/octep_vf_mbox.c      |  96 ++++
 .../marvell/octeon_ep_vf/octep_vf_mbox.h      |  25 +
 .../marvell/octeon_ep_vf/octep_vf_regs_cn9k.h | 154 ++++++
 .../marvell/octeon_ep_vf/octep_vf_regs_cnxk.h | 162 ++++++
 .../marvell/octeon_ep_vf/octep_vf_rx.c        |  42 ++
 .../marvell/octeon_ep_vf/octep_vf_rx.h        | 224 ++++++++
 .../marvell/octeon_ep_vf/octep_vf_tx.c        |  43 ++
 .../marvell/octeon_ep_vf/octep_vf_tx.h        | 276 ++++++++++
 19 files changed, 2374 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/ethernet/marvell/octeon_ep_vf.rst
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/Kconfig
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/Makefile
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cn9k.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cnxk.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_config.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cn9k.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cnxk.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.h
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.c
 create mode 100644 drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.h

diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
index 43de285b8a92..6932d8c043c2 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -42,6 +42,7 @@ Contents:
    intel/ice
    marvell/octeontx2
    marvell/octeon_ep
+   marvell/octeon_ep_vf
    mellanox/mlx5/index
    microsoft/netvsc
    neterion/s2io
diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeon_ep_vf.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeon_ep_vf.rst
new file mode 100644
index 000000000000..603133d0b92f
--- /dev/null
+++ b/Documentation/networking/device_drivers/ethernet/marvell/octeon_ep_vf.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=======================================================================
+Linux kernel networking driver for Marvell's Octeon PCI Endpoint NIC VF
+=======================================================================
+
+Network driver for Marvell's Octeon PCI EndPoint NIC VF.
+Copyright (c) 2020 Marvell International Ltd.
+
+Overview
+========
+This driver implements networking functionality of Marvell's Octeon PCI
+EndPoint NIC VF.
+
+Supported Devices
+=================
+Currently, this driver support following devices:
+ * Network controller: Cavium, Inc. Device b203
+ * Network controller: Cavium, Inc. Device b403
+ * Network controller: Cavium, Inc. Device b103
+ * Network controller: Cavium, Inc. Device b903
+ * Network controller: Cavium, Inc. Device ba03
+ * Network controller: Cavium, Inc. Device bc03
+ * Network controller: Cavium, Inc. Device bd03
diff --git a/drivers/net/ethernet/marvell/Kconfig b/drivers/net/ethernet/marvell/Kconfig
index 884d64114bff..837295fecd17 100644
--- a/drivers/net/ethernet/marvell/Kconfig
+++ b/drivers/net/ethernet/marvell/Kconfig
@@ -180,6 +180,7 @@ config SKY2_DEBUG
 
 source "drivers/net/ethernet/marvell/octeontx2/Kconfig"
 source "drivers/net/ethernet/marvell/octeon_ep/Kconfig"
+source "drivers/net/ethernet/marvell/octeon_ep_vf/Kconfig"
 source "drivers/net/ethernet/marvell/prestera/Kconfig"
 
 endif # NET_VENDOR_MARVELL
diff --git a/drivers/net/ethernet/marvell/Makefile b/drivers/net/ethernet/marvell/Makefile
index ceba4aa4f026..a399defe25fd 100644
--- a/drivers/net/ethernet/marvell/Makefile
+++ b/drivers/net/ethernet/marvell/Makefile
@@ -12,5 +12,6 @@ obj-$(CONFIG_PXA168_ETH) += pxa168_eth.o
 obj-$(CONFIG_SKGE) += skge.o
 obj-$(CONFIG_SKY2) += sky2.o
 obj-y		+= octeon_ep/
+obj-y		+= octeon_ep_vf/
 obj-y		+= octeontx2/
 obj-y		+= prestera/
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/Kconfig b/drivers/net/ethernet/marvell/octeon_ep_vf/Kconfig
new file mode 100644
index 000000000000..dbd1267bda0c
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Marvell's Octeon PCI Endpoint NIC VF Driver Configuration
+#
+
+config OCTEON_EP_VF
+	tristate "Marvell Octeon PCI Endpoint NIC VF Driver"
+	depends on 64BIT
+	depends on PCI
+	help
+	  This driver supports networking functionality of Marvell's
+	  Octeon PCI Endpoint NIC VF.
+
+	  To know the list of devices supported by this driver, refer
+	  documentation in
+	  <file:Documentation/networking/device_drivers/ethernet/marvell/octeon_ep_vf.rst>.
+
+	  To compile this drivers as a module, choose M here. Name of the
+	  module is octeon_ep_vf.
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/Makefile b/drivers/net/ethernet/marvell/octeon_ep_vf/Makefile
new file mode 100644
index 000000000000..694eb9b46e99
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Network driver for Marvell's Octeon PCI Endpoint NIC VF
+#
+
+obj-$(CONFIG_OCTEON_EP_VF) += octeon_ep_vf.o
+
+octeon_ep_vf-y := octep_vf_main.o octep_vf_cn9k.o octep_vf_cnxk.o \
+		  octep_vf_tx.o octep_vf_rx.o octep_vf_mbox.o
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cn9k.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cn9k.c
new file mode 100644
index 000000000000..c24ef2265205
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cn9k.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#include <linux/pci.h>
+#include <linux/netdevice.h>
+#include <linux/etherdevice.h>
+
+#include "octep_vf_config.h"
+#include "octep_vf_main.h"
+#include "octep_vf_regs_cn9k.h"
+
+/* Reset all hardware Tx/Rx queues */
+static void octep_vf_reset_io_queues_cn93(struct octep_vf_device *oct)
+{
+}
+
+/* Initialize configuration limits and initial active config */
+static void octep_vf_init_config_cn93_vf(struct octep_vf_device *oct)
+{
+	struct octep_vf_config *conf = oct->conf;
+	u64 reg_val;
+
+	reg_val = octep_vf_read_csr64(oct, CN93_VF_SDP_R_IN_CONTROL(0));
+	conf->ring_cfg.max_io_rings = (reg_val >> CN93_VF_R_IN_CTL_RPVF_POS) &
+				      CN93_VF_R_IN_CTL_RPVF_MASK;
+	conf->ring_cfg.active_io_rings = conf->ring_cfg.max_io_rings;
+
+	conf->iq.num_descs = OCTEP_VF_IQ_MAX_DESCRIPTORS;
+	conf->iq.instr_type = OCTEP_VF_64BYTE_INSTR;
+	conf->iq.db_min = OCTEP_VF_DB_MIN;
+	conf->iq.intr_threshold = OCTEP_VF_IQ_INTR_THRESHOLD;
+
+	conf->oq.num_descs = OCTEP_VF_OQ_MAX_DESCRIPTORS;
+	conf->oq.buf_size = OCTEP_VF_OQ_BUF_SIZE;
+	conf->oq.refill_threshold = OCTEP_VF_OQ_REFILL_THRESHOLD;
+	conf->oq.oq_intr_pkt = OCTEP_VF_OQ_INTR_PKT_THRESHOLD;
+	conf->oq.oq_intr_time = OCTEP_VF_OQ_INTR_TIME_THRESHOLD;
+
+	conf->msix_cfg.ioq_msix = conf->ring_cfg.active_io_rings;
+}
+
+/* Setup registers for a hardware Tx Queue  */
+static void octep_vf_setup_iq_regs_cn93(struct octep_vf_device *oct, int iq_no)
+{
+}
+
+/* Setup registers for a hardware Rx Queue  */
+static void octep_vf_setup_oq_regs_cn93(struct octep_vf_device *oct, int oq_no)
+{
+}
+
+/* Setup registers for a VF mailbox */
+static void octep_vf_setup_mbox_regs_cn93(struct octep_vf_device *oct, int q_no)
+{
+}
+
+/* Tx/Rx queue interrupt handler */
+static irqreturn_t octep_vf_ioq_intr_handler_cn93(void *data)
+{
+	return IRQ_HANDLED;
+}
+
+/* Re-initialize Octeon hardware registers */
+static void octep_vf_reinit_regs_cn93(struct octep_vf_device *oct)
+{
+}
+
+/* Enable all interrupts */
+static void octep_vf_enable_interrupts_cn93(struct octep_vf_device *oct)
+{
+}
+
+/* Disable all interrupts */
+static void octep_vf_disable_interrupts_cn93(struct octep_vf_device *oct)
+{
+}
+
+/* Get new Octeon Read Index: index of descriptor that Octeon reads next. */
+static u32 octep_vf_update_iq_read_index_cn93(struct octep_vf_iq *iq)
+{
+	return 0;
+}
+
+/* Enable a hardware Tx Queue */
+static void octep_vf_enable_iq_cn93(struct octep_vf_device *oct, int iq_no)
+{
+}
+
+/* Enable a hardware Rx Queue */
+static void octep_vf_enable_oq_cn93(struct octep_vf_device *oct, int oq_no)
+{
+}
+
+/* Enable all hardware Tx/Rx Queues assigned to VF */
+static void octep_vf_enable_io_queues_cn93(struct octep_vf_device *oct)
+{
+}
+
+/* Disable a hardware Tx Queue assigned to VF */
+static void octep_vf_disable_iq_cn93(struct octep_vf_device *oct, int iq_no)
+{
+}
+
+/* Disable a hardware Rx Queue assigned to VF */
+static void octep_vf_disable_oq_cn93(struct octep_vf_device *oct, int oq_no)
+{
+}
+
+/* Disable all hardware Tx/Rx Queues assigned to VF */
+static void octep_vf_disable_io_queues_cn93(struct octep_vf_device *oct)
+{
+}
+
+/* Dump hardware registers (including Tx/Rx queues) for debugging. */
+static void octep_vf_dump_registers_cn93(struct octep_vf_device *oct)
+{
+}
+
+/**
+ * octep_vf_device_setup_cn93() - Setup Octeon device.
+ *
+ * @oct: Octeon device private data structure.
+ *
+ * - initialize hardware operations.
+ * - get target side pcie port number for the device.
+ * - set initial configuration and max limits.
+ */
+void octep_vf_device_setup_cn93(struct octep_vf_device *oct)
+{
+	oct->hw_ops.setup_iq_regs = octep_vf_setup_iq_regs_cn93;
+	oct->hw_ops.setup_oq_regs = octep_vf_setup_oq_regs_cn93;
+	oct->hw_ops.setup_mbox_regs = octep_vf_setup_mbox_regs_cn93;
+
+	oct->hw_ops.ioq_intr_handler = octep_vf_ioq_intr_handler_cn93;
+	oct->hw_ops.reinit_regs = octep_vf_reinit_regs_cn93;
+
+	oct->hw_ops.enable_interrupts = octep_vf_enable_interrupts_cn93;
+	oct->hw_ops.disable_interrupts = octep_vf_disable_interrupts_cn93;
+
+	oct->hw_ops.update_iq_read_idx = octep_vf_update_iq_read_index_cn93;
+
+	oct->hw_ops.enable_iq = octep_vf_enable_iq_cn93;
+	oct->hw_ops.enable_oq = octep_vf_enable_oq_cn93;
+	oct->hw_ops.enable_io_queues = octep_vf_enable_io_queues_cn93;
+
+	oct->hw_ops.disable_iq = octep_vf_disable_iq_cn93;
+	oct->hw_ops.disable_oq = octep_vf_disable_oq_cn93;
+	oct->hw_ops.disable_io_queues = octep_vf_disable_io_queues_cn93;
+	oct->hw_ops.reset_io_queues = octep_vf_reset_io_queues_cn93;
+
+	oct->hw_ops.dump_registers = octep_vf_dump_registers_cn93;
+	octep_vf_init_config_cn93_vf(oct);
+}
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cnxk.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cnxk.c
new file mode 100644
index 000000000000..af07a4a6edc5
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_cnxk.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#include <linux/pci.h>
+#include <linux/netdevice.h>
+#include <linux/etherdevice.h>
+
+#include "octep_vf_config.h"
+#include "octep_vf_main.h"
+#include "octep_vf_regs_cnxk.h"
+
+/* Reset all hardware Tx/Rx queues */
+static void octep_vf_reset_io_queues_cnxk(struct octep_vf_device *oct)
+{
+}
+
+/* Initialize configuration limits and initial active config */
+static void octep_vf_init_config_cnxk_vf(struct octep_vf_device *oct)
+{
+	struct octep_vf_config *conf = oct->conf;
+	u64 reg_val;
+
+	reg_val = octep_vf_read_csr64(oct, CNXK_VF_SDP_R_IN_CONTROL(0));
+	conf->ring_cfg.max_io_rings = (reg_val >> CNXK_VF_R_IN_CTL_RPVF_POS) &
+				      CNXK_VF_R_IN_CTL_RPVF_MASK;
+	conf->ring_cfg.active_io_rings = conf->ring_cfg.max_io_rings;
+
+	conf->iq.num_descs = OCTEP_VF_IQ_MAX_DESCRIPTORS;
+	conf->iq.instr_type = OCTEP_VF_64BYTE_INSTR;
+	conf->iq.db_min = OCTEP_VF_DB_MIN;
+	conf->iq.intr_threshold = OCTEP_VF_IQ_INTR_THRESHOLD;
+
+	conf->oq.num_descs = OCTEP_VF_OQ_MAX_DESCRIPTORS;
+	conf->oq.buf_size = OCTEP_VF_OQ_BUF_SIZE;
+	conf->oq.refill_threshold = OCTEP_VF_OQ_REFILL_THRESHOLD;
+	conf->oq.oq_intr_pkt = OCTEP_VF_OQ_INTR_PKT_THRESHOLD;
+	conf->oq.oq_intr_time = OCTEP_VF_OQ_INTR_TIME_THRESHOLD;
+	conf->oq.wmark = OCTEP_VF_OQ_WMARK_MIN;
+
+	conf->msix_cfg.ioq_msix = conf->ring_cfg.active_io_rings;
+}
+
+/* Setup registers for a hardware Tx Queue  */
+static void octep_vf_setup_iq_regs_cnxk(struct octep_vf_device *oct, int iq_no)
+{
+}
+
+/* Setup registers for a hardware Rx Queue  */
+static void octep_vf_setup_oq_regs_cnxk(struct octep_vf_device *oct, int oq_no)
+{
+}
+
+/* Setup registers for a VF mailbox */
+static void octep_vf_setup_mbox_regs_cnxk(struct octep_vf_device *oct, int q_no)
+{
+}
+
+/* Tx/Rx queue interrupt handler */
+static irqreturn_t octep_vf_ioq_intr_handler_cnxk(void *data)
+{
+	return IRQ_HANDLED;
+}
+
+/* Re-initialize Octeon hardware registers */
+static void octep_vf_reinit_regs_cnxk(struct octep_vf_device *oct)
+{
+}
+
+/* Enable all interrupts */
+static void octep_vf_enable_interrupts_cnxk(struct octep_vf_device *oct)
+{
+}
+
+/* Disable all interrupts */
+static void octep_vf_disable_interrupts_cnxk(struct octep_vf_device *oct)
+{
+}
+
+/* Get new Octeon Read Index: index of descriptor that Octeon reads next. */
+static u32 octep_vf_update_iq_read_index_cnxk(struct octep_vf_iq *iq)
+{
+	return 0;
+}
+
+/* Enable a hardware Tx Queue */
+static void octep_vf_enable_iq_cnxk(struct octep_vf_device *oct, int iq_no)
+{
+}
+
+/* Enable a hardware Rx Queue */
+static void octep_vf_enable_oq_cnxk(struct octep_vf_device *oct, int oq_no)
+{
+}
+
+/* Enable all hardware Tx/Rx Queues assigned to VF */
+static void octep_vf_enable_io_queues_cnxk(struct octep_vf_device *oct)
+{
+}
+
+/* Disable a hardware Tx Queue assigned to VF */
+static void octep_vf_disable_iq_cnxk(struct octep_vf_device *oct, int iq_no)
+{
+}
+
+/* Disable a hardware Rx Queue assigned to VF */
+static void octep_vf_disable_oq_cnxk(struct octep_vf_device *oct, int oq_no)
+{
+}
+
+/* Disable all hardware Tx/Rx Queues assigned to VF */
+static void octep_vf_disable_io_queues_cnxk(struct octep_vf_device *oct)
+{
+}
+
+/* Dump hardware registers (including Tx/Rx queues) for debugging. */
+static void octep_vf_dump_registers_cnxk(struct octep_vf_device *oct)
+{
+}
+
+/**
+ * octep_vf_device_setup_cnxk() - Setup Octeon device.
+ *
+ * @oct: Octeon device private data structure.
+ *
+ * - initialize hardware operations.
+ * - get target side pcie port number for the device.
+ * - set initial configuration and max limits.
+ */
+void octep_vf_device_setup_cnxk(struct octep_vf_device *oct)
+{
+	oct->hw_ops.setup_iq_regs = octep_vf_setup_iq_regs_cnxk;
+	oct->hw_ops.setup_oq_regs = octep_vf_setup_oq_regs_cnxk;
+	oct->hw_ops.setup_mbox_regs = octep_vf_setup_mbox_regs_cnxk;
+
+	oct->hw_ops.ioq_intr_handler = octep_vf_ioq_intr_handler_cnxk;
+	oct->hw_ops.reinit_regs = octep_vf_reinit_regs_cnxk;
+
+	oct->hw_ops.enable_interrupts = octep_vf_enable_interrupts_cnxk;
+	oct->hw_ops.disable_interrupts = octep_vf_disable_interrupts_cnxk;
+
+	oct->hw_ops.update_iq_read_idx = octep_vf_update_iq_read_index_cnxk;
+
+	oct->hw_ops.enable_iq = octep_vf_enable_iq_cnxk;
+	oct->hw_ops.enable_oq = octep_vf_enable_oq_cnxk;
+	oct->hw_ops.enable_io_queues = octep_vf_enable_io_queues_cnxk;
+
+	oct->hw_ops.disable_iq = octep_vf_disable_iq_cnxk;
+	oct->hw_ops.disable_oq = octep_vf_disable_oq_cnxk;
+	oct->hw_ops.disable_io_queues = octep_vf_disable_io_queues_cnxk;
+	oct->hw_ops.reset_io_queues = octep_vf_reset_io_queues_cnxk;
+
+	oct->hw_ops.dump_registers = octep_vf_dump_registers_cnxk;
+	octep_vf_init_config_cnxk_vf(oct);
+}
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_config.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_config.h
new file mode 100644
index 000000000000..e03a647b0110
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_config.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#ifndef _OCTEP_VF_CONFIG_H_
+#define _OCTEP_VF_CONFIG_H_
+
+/* Tx instruction types by length */
+#define OCTEP_VF_32BYTE_INSTR  32
+#define OCTEP_VF_64BYTE_INSTR  64
+
+/* Tx Queue: maximum descriptors per ring */
+#define OCTEP_VF_IQ_MAX_DESCRIPTORS    1024
+/* Minimum input (Tx) requests to be enqueued to ring doorbell */
+#define OCTEP_VF_DB_MIN                8
+/* Packet threshold for Tx queue interrupt */
+#define OCTEP_VF_IQ_INTR_THRESHOLD     0x0
+
+/* Minimum watermark for backpressure */
+#define OCTEP_VF_OQ_WMARK_MIN 256
+
+/* Rx Queue: maximum descriptors per ring */
+#define OCTEP_VF_OQ_MAX_DESCRIPTORS   1024
+
+/* Rx buffer size: Use page size buffers.
+ * Build skb from allocated page buffer once the packet is received.
+ * When a gathered packet is received, make head page as skb head and
+ * page buffers in consecutive Rx descriptors as fragments.
+ */
+#define OCTEP_VF_OQ_BUF_SIZE          (SKB_WITH_OVERHEAD(PAGE_SIZE))
+#define OCTEP_VF_OQ_PKTS_PER_INTR     128
+#define OCTEP_VF_OQ_REFILL_THRESHOLD  (OCTEP_VF_OQ_MAX_DESCRIPTORS / 4)
+
+#define OCTEP_VF_OQ_INTR_PKT_THRESHOLD   1
+#define OCTEP_VF_OQ_INTR_TIME_THRESHOLD  10
+
+#define OCTEP_VF_MSIX_NAME_SIZE      (IFNAMSIZ + 32)
+
+/* Tx Queue wake threshold
+ * wakeup a stopped Tx queue if minimum 2 descriptors are available.
+ * Even a skb with fragments consume only one Tx queue descriptor entry.
+ */
+#define OCTEP_VF_WAKE_QUEUE_THRESHOLD 2
+
+/* Minimum MTU supported by Octeon network interface */
+#define OCTEP_VF_MIN_MTU        ETH_MIN_MTU
+/* Maximum MTU supported by Octeon interface*/
+#define OCTEP_VF_MAX_MTU        (10000 - (ETH_HLEN + ETH_FCS_LEN))
+/* Default MTU */
+#define OCTEP_VF_DEFAULT_MTU    1500
+
+/* Macros to get octeon config params */
+#define CFG_GET_IQ_CFG(cfg)             ((cfg)->iq)
+#define CFG_GET_IQ_NUM_DESC(cfg)        ((cfg)->iq.num_descs)
+#define CFG_GET_IQ_INSTR_TYPE(cfg)      ((cfg)->iq.instr_type)
+#define CFG_GET_IQ_INSTR_SIZE(cfg)      (64)
+#define CFG_GET_IQ_DB_MIN(cfg)          ((cfg)->iq.db_min)
+#define CFG_GET_IQ_INTR_THRESHOLD(cfg)  ((cfg)->iq.intr_threshold)
+
+#define CFG_GET_OQ_NUM_DESC(cfg)          ((cfg)->oq.num_descs)
+#define CFG_GET_OQ_BUF_SIZE(cfg)          ((cfg)->oq.buf_size)
+#define CFG_GET_OQ_REFILL_THRESHOLD(cfg)  ((cfg)->oq.refill_threshold)
+#define CFG_GET_OQ_INTR_PKT(cfg)          ((cfg)->oq.oq_intr_pkt)
+#define CFG_GET_OQ_INTR_TIME(cfg)         ((cfg)->oq.oq_intr_time)
+#define CFG_GET_OQ_WMARK(cfg)             ((cfg)->oq.wmark)
+
+#define CFG_GET_PORTS_ACTIVE_IO_RINGS(cfg) ((cfg)->ring_cfg.active_io_rings)
+#define CFG_GET_PORTS_MAX_IO_RINGS(cfg) ((cfg)->ring_cfg.max_io_rings)
+
+#define CFG_GET_CORE_TICS_PER_US(cfg)     ((cfg)->core_cfg.core_tics_per_us)
+#define CFG_GET_COPROC_TICS_PER_US(cfg)   ((cfg)->core_cfg.coproc_tics_per_us)
+
+#define CFG_GET_IOQ_MSIX(cfg)            ((cfg)->msix_cfg.ioq_msix)
+
+/* Hardware Tx Queue configuration. */
+struct octep_vf_iq_config {
+	/* Size of the Input queue (number of commands) */
+	u16 num_descs;
+
+	/* Command size - 32 or 64 bytes */
+	u16 instr_type;
+
+	/* Minimum number of commands pending to be posted to Octeon before driver
+	 * hits the Input queue doorbell.
+	 */
+	u16 db_min;
+
+	/* Trigger the IQ interrupt when processed cmd count reaches
+	 * this level.
+	 */
+	u32 intr_threshold;
+};
+
+/* Hardware Rx Queue configuration. */
+struct octep_vf_oq_config {
+	/* Size of Output queue (number of descriptors) */
+	u16 num_descs;
+
+	/* Size of buffer in this Output queue. */
+	u16 buf_size;
+
+	/* The number of buffers that were consumed during packet processing
+	 * by the driver on this Output queue before the driver attempts to
+	 * replenish the descriptor ring with new buffers.
+	 */
+	u16 refill_threshold;
+
+	/* Interrupt Coalescing (Packet Count). Octeon will interrupt the host
+	 * only if it sent as many packets as specified by this field.
+	 * The driver usually does not use packet count interrupt coalescing.
+	 */
+	u32 oq_intr_pkt;
+
+	/* Interrupt Coalescing (Time Interval). Octeon will interrupt the host
+	 * if at least one packet was sent in the time interval specified by
+	 * this field. The driver uses time interval interrupt coalescing by
+	 * default. The time is specified in microseconds.
+	 */
+	u32 oq_intr_time;
+
+	/* Water mark for backpressure.
+	 * Output queue sends backpressure signal to source when
+	 * free buffer count falls below wmark.
+	 */
+	u32 wmark;
+};
+
+/* Tx/Rx configuration */
+struct octep_vf_ring_config {
+	/* Max number of IOQs */
+	u16 max_io_rings;
+
+	/* Number of active IOQs */
+	u16 active_io_rings;
+};
+
+/* Octeon MSI-x config. */
+struct octep_vf_msix_config {
+	/* Number of IOQ interrupts */
+	u16 ioq_msix;
+};
+
+/* Data Structure to hold configuration limits and active config */
+struct octep_vf_config {
+	/* Input Queue attributes. */
+	struct octep_vf_iq_config iq;
+
+	/* Output Queue attributes. */
+	struct octep_vf_oq_config oq;
+
+	/* MSI-X interrupt config */
+	struct octep_vf_msix_config msix_cfg;
+
+	/* NIC VF ring Configuration */
+	struct octep_vf_ring_config ring_cfg;
+};
+#endif /* _OCTEP_VF_CONFIG_H_ */
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c
new file mode 100644
index 000000000000..2ade88698f65
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.c
@@ -0,0 +1,516 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/aer.h>
+#include <linux/netdevice.h>
+#include <linux/etherdevice.h>
+#include <linux/rtnetlink.h>
+#include <linux/vmalloc.h>
+
+#include "octep_vf_config.h"
+#include "octep_vf_main.h"
+
+struct workqueue_struct *octep_vf_wq;
+
+/* Supported Devices */
+static const struct pci_device_id octep_vf_pci_id_tbl[] = {
+	{PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, OCTEP_PCI_DEVICE_ID_CN93_VF)},
+	{PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, OCTEP_PCI_DEVICE_ID_CNF95N_VF)},
+	{PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, OCTEP_PCI_DEVICE_ID_CN98_VF)},
+	{PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, OCTEP_PCI_DEVICE_ID_CN10KA_VF)},
+	{PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, OCTEP_PCI_DEVICE_ID_CNF10KA_VF)},
+	{PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, OCTEP_PCI_DEVICE_ID_CNF10KB_VF)},
+	{PCI_DEVICE(PCI_VENDOR_ID_CAVIUM, OCTEP_PCI_DEVICE_ID_CN10KB_VF)},
+	{0, },
+};
+MODULE_DEVICE_TABLE(pci, octep_vf_pci_id_tbl);
+
+MODULE_AUTHOR("Veerasenareddy Burru <vburru@marvell.com>");
+MODULE_DESCRIPTION(OCTEP_VF_DRV_STRING);
+MODULE_LICENSE("GPL");
+
+static void octep_vf_link_up(struct net_device *netdev)
+{
+	netif_carrier_on(netdev);
+	netif_tx_start_all_queues(netdev);
+}
+
+static void octep_vf_set_rx_state(struct octep_vf_device *oct, bool up)
+{
+	int err;
+
+	err = octep_vf_mbox_set_rx_state(oct, up);
+	if (err)
+		netdev_err(oct->netdev, "Set Rx state to %d failed with err:%d\n", up, err);
+}
+
+static int octep_vf_get_link_status(struct octep_vf_device *oct)
+{
+	int err;
+
+	err = octep_vf_mbox_get_link_status(oct, &oct->link_info.oper_up);
+	if (err)
+		netdev_err(oct->netdev, "Get link status failed with err:%d\n", err);
+	return oct->link_info.oper_up;
+}
+
+static void octep_vf_set_link_status(struct octep_vf_device *oct, bool up)
+{
+	int err;
+
+	err = octep_vf_mbox_set_link_status(oct, up);
+	if (err) {
+		netdev_err(oct->netdev, "Set link status to %d failed with err:%d\n", up, err);
+		return;
+	}
+	oct->link_info.oper_up = up;
+}
+
+/**
+ * octep_vf_open() - start the octeon network device.
+ *
+ * @netdev: pointer to kernel network device.
+ *
+ * setup Tx/Rx queues, interrupts and enable hardware operation of Tx/Rx queues
+ * and interrupts..
+ *
+ * Return: 0, on successfully setting up device and bring it up.
+ *         -1, on any error.
+ */
+static int octep_vf_open(struct net_device *netdev)
+{
+	struct octep_vf_device *oct = netdev_priv(netdev);
+	int err, ret;
+
+	netdev_info(netdev, "Starting netdev ...\n");
+	netif_carrier_off(netdev);
+
+	oct->hw_ops.reset_io_queues(oct);
+
+	if (octep_vf_setup_iqs(oct))
+		goto setup_iq_err;
+	if (octep_vf_setup_oqs(oct))
+		goto setup_oq_err;
+
+	err = netif_set_real_num_tx_queues(netdev, oct->num_oqs);
+	if (err)
+		goto set_queues_err;
+	err = netif_set_real_num_rx_queues(netdev, oct->num_iqs);
+	if (err)
+		goto set_queues_err;
+
+	oct->link_info.admin_up = 1;
+	octep_vf_set_rx_state(oct, true);
+
+	ret = octep_vf_get_link_status(oct);
+	if (!ret)
+		octep_vf_set_link_status(oct, true);
+
+	/* Enable the input and output queues for this Octeon device */
+	oct->hw_ops.enable_io_queues(oct);
+
+	/* Enable Octeon device interrupts */
+	oct->hw_ops.enable_interrupts(oct);
+
+	octep_vf_oq_dbell_init(oct);
+
+	ret = octep_vf_get_link_status(oct);
+	if (ret)
+		octep_vf_link_up(netdev);
+
+	return 0;
+
+set_queues_err:
+	octep_vf_free_oqs(oct);
+setup_oq_err:
+	octep_vf_free_iqs(oct);
+setup_iq_err:
+	return -1;
+}
+
+/**
+ * octep_vf_stop() - stop the octeon network device.
+ *
+ * @netdev: pointer to kernel network device.
+ *
+ * stop the device Tx/Rx operations, bring down the link and
+ * free up all resources allocated for Tx/Rx queues and interrupts.
+ */
+static int octep_vf_stop(struct net_device *netdev)
+{
+	struct octep_vf_device *oct = netdev_priv(netdev);
+
+	netdev_info(netdev, "Stopping the device ...\n");
+
+	/* Stop Tx from stack */
+	netif_carrier_off(netdev);
+	netif_tx_disable(netdev);
+
+	octep_vf_set_link_status(oct, false);
+	octep_vf_set_rx_state(oct, false);
+
+	oct->link_info.admin_up = 0;
+	oct->link_info.oper_up = 0;
+
+	oct->hw_ops.disable_interrupts(oct);
+
+	octep_vf_clean_iqs(oct);
+
+	oct->hw_ops.disable_io_queues(oct);
+	oct->hw_ops.reset_io_queues(oct);
+	octep_vf_free_oqs(oct);
+	octep_vf_free_iqs(oct);
+	netdev_info(netdev, "Device stopped !!\n");
+	return 0;
+}
+
+/**
+ * octep_vf_start_xmit() - Enqueue packet to Octoen hardware Tx Queue.
+ *
+ * @skb: packet skbuff pointer.
+ * @netdev: kernel network device.
+ *
+ * Return: NETDEV_TX_BUSY, if Tx Queue is full.
+ *         NETDEV_TX_OK, if successfully enqueued to hardware Tx queue.
+ */
+static netdev_tx_t octep_vf_start_xmit(struct sk_buff *skb,
+				       struct net_device *netdev)
+{
+	return NETDEV_TX_OK;
+}
+
+/**
+ * octep_vf_tx_timeout_task - work queue task to Handle Tx queue timeout.
+ *
+ * @work: pointer to Tx queue timeout work_struct
+ *
+ * Stop and start the device so that it frees up all queue resources
+ * and restarts the queues, that potentially clears a Tx queue timeout
+ * condition.
+ **/
+static void octep_vf_tx_timeout_task(struct work_struct *work)
+{
+	struct octep_vf_device *oct = container_of(work, struct octep_vf_device,
+						tx_timeout_task);
+	struct net_device *netdev = oct->netdev;
+
+	rtnl_lock();
+	if (netif_running(netdev)) {
+		octep_vf_stop(netdev);
+		octep_vf_open(netdev);
+	}
+	rtnl_unlock();
+	netdev_put(netdev, NULL);
+}
+
+/**
+ * octep_vf_tx_timeout() - Handle Tx Queue timeout.
+ *
+ * @netdev: pointer to kernel network device.
+ * @txqueue: Timed out Tx queue number.
+ *
+ * Schedule a work to handle Tx queue timeout.
+ */
+static void octep_vf_tx_timeout(struct net_device *netdev, unsigned int txqueue)
+{
+	struct octep_vf_device *oct = netdev_priv(netdev);
+
+	netdev_hold(netdev, NULL, GFP_ATOMIC);
+	schedule_work(&oct->tx_timeout_task);
+}
+
+static const struct net_device_ops octep_vf_netdev_ops = {
+	.ndo_open                = octep_vf_open,
+	.ndo_stop                = octep_vf_stop,
+	.ndo_start_xmit          = octep_vf_start_xmit,
+	.ndo_tx_timeout          = octep_vf_tx_timeout,
+};
+
+static const char *octep_vf_devid_to_str(struct octep_vf_device *oct)
+{
+	switch (oct->chip_id) {
+	case OCTEP_PCI_DEVICE_ID_CN93_VF:
+		return "CN93XX";
+	case OCTEP_PCI_DEVICE_ID_CNF95N_VF:
+		return "CNF95N";
+	case OCTEP_PCI_DEVICE_ID_CN10KA_VF:
+		return "CN10KA";
+	case OCTEP_PCI_DEVICE_ID_CNF10KA_VF:
+		return "CNF10KA";
+	case OCTEP_PCI_DEVICE_ID_CNF10KB_VF:
+		return "CNF10KB";
+	case OCTEP_PCI_DEVICE_ID_CN10KB_VF:
+		return "CN10KB";
+	default:
+		return "Unsupported";
+	}
+}
+
+/**
+ * octep_vf_device_setup() - Setup Octeon Device.
+ *
+ * @oct: Octeon device private data structure.
+ *
+ * Setup Octeon device hardware operations, configuration, etc ...
+ */
+int octep_vf_device_setup(struct octep_vf_device *oct)
+{
+	struct pci_dev *pdev = oct->pdev;
+
+	/* allocate memory for oct->conf */
+	oct->conf = kzalloc(sizeof(*oct->conf), GFP_KERNEL);
+	if (!oct->conf)
+		return -ENOMEM;
+
+	/* Map BAR region 0 */
+	oct->mmio.hw_addr = ioremap(pci_resource_start(oct->pdev, 0),
+				    pci_resource_len(oct->pdev, 0));
+	if (!oct->mmio.hw_addr) {
+		dev_err(&pdev->dev,
+			"Failed to remap BAR0; start=0x%llx len=0x%llx\n",
+			pci_resource_start(oct->pdev, 0),
+			pci_resource_len(oct->pdev, 0));
+		goto ioremap_err;
+	}
+	oct->mmio.mapped = 1;
+
+	oct->chip_id = pdev->device;
+	oct->rev_id = pdev->revision;
+	dev_info(&pdev->dev, "chip_id = 0x%x\n", pdev->device);
+
+	switch (oct->chip_id) {
+	case OCTEP_PCI_DEVICE_ID_CN93_VF:
+	case OCTEP_PCI_DEVICE_ID_CNF95N_VF:
+	case OCTEP_PCI_DEVICE_ID_CN98_VF:
+		dev_info(&pdev->dev, "Setting up OCTEON %s VF PASS%d.%d\n",
+			 octep_vf_devid_to_str(oct), OCTEP_VF_MAJOR_REV(oct),
+			 OCTEP_VF_MINOR_REV(oct));
+		octep_vf_device_setup_cn93(oct);
+		break;
+	case OCTEP_PCI_DEVICE_ID_CNF10KA_VF:
+	case OCTEP_PCI_DEVICE_ID_CN10KA_VF:
+	case OCTEP_PCI_DEVICE_ID_CNF10KB_VF:
+	case OCTEP_PCI_DEVICE_ID_CN10KB_VF:
+		dev_info(&pdev->dev, "Setting up OCTEON %s VF PASS%d.%d\n",
+			 octep_vf_devid_to_str(oct), OCTEP_VF_MAJOR_REV(oct),
+			 OCTEP_VF_MINOR_REV(oct));
+		octep_vf_device_setup_cnxk(oct);
+		break;
+	default:
+		dev_err(&pdev->dev, "Unsupported device\n");
+		goto unsupported_dev;
+	}
+
+	return 0;
+
+unsupported_dev:
+	iounmap(oct->mmio.hw_addr);
+ioremap_err:
+	kfree(oct->conf);
+	return -EOPNOTSUPP;
+}
+
+/**
+ * octep_vf_device_cleanup() - Cleanup Octeon Device.
+ *
+ * @oct: Octeon device private data structure.
+ *
+ * Cleanup Octeon device allocated resources.
+ */
+static void octep_vf_device_cleanup(struct octep_vf_device *oct)
+{
+	dev_info(&oct->pdev->dev, "Cleaning up Octeon Device ...\n");
+
+	if (oct->mmio.mapped)
+		iounmap(oct->mmio.hw_addr);
+
+	kfree(oct->conf);
+	oct->conf = NULL;
+}
+
+static int octep_vf_get_mac_addr(struct octep_vf_device *oct, u8 *addr)
+{
+	return octep_vf_mbox_get_mac_addr(oct, addr);
+}
+
+/**
+ * octep_vf_probe() - Octeon PCI device probe handler.
+ *
+ * @pdev: PCI device structure.
+ * @ent: entry in Octeon PCI device ID table.
+ *
+ * Initializes and enables the Octeon PCI device for network operations.
+ * Initializes Octeon private data structure and registers a network device.
+ */
+static int octep_vf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	struct octep_vf_device *octep_vf_dev;
+	struct net_device *netdev;
+	int err;
+
+	err = pci_enable_device(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to enable PCI device\n");
+		return  err;
+	}
+
+	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (err) {
+		dev_err(&pdev->dev, "Failed to set DMA mask !!\n");
+		goto disable_pci_device;
+	}
+
+	err = pci_request_mem_regions(pdev, OCTEP_VF_DRV_NAME);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to map PCI memory regions\n");
+		goto disable_pci_device;
+	}
+
+	pci_set_master(pdev);
+
+	netdev = alloc_etherdev_mq(sizeof(struct octep_vf_device),
+				   OCTEP_VF_MAX_QUEUES);
+	if (!netdev) {
+		dev_err(&pdev->dev, "Failed to allocate netdev\n");
+		err = -ENOMEM;
+		goto mem_regions_release;
+	}
+	SET_NETDEV_DEV(netdev, &pdev->dev);
+
+	octep_vf_dev = netdev_priv(netdev);
+	octep_vf_dev->netdev = netdev;
+	octep_vf_dev->pdev = pdev;
+	octep_vf_dev->dev = &pdev->dev;
+	pci_set_drvdata(pdev, octep_vf_dev);
+
+	err = octep_vf_device_setup(octep_vf_dev);
+	if (err) {
+		dev_err(&pdev->dev, "Device setup failed\n");
+		goto netdevice_free;
+	}
+	INIT_WORK(&octep_vf_dev->tx_timeout_task, octep_vf_tx_timeout_task);
+
+	netdev->netdev_ops = &octep_vf_netdev_ops;
+	netif_carrier_off(netdev);
+
+	if (octep_vf_setup_mbox(octep_vf_dev)) {
+		dev_err(&pdev->dev, "VF Mailbox setup failed\n");
+		err = -ENOMEM;
+		goto device_cleanup;
+	}
+
+	if (octep_vf_mbox_version_check(octep_vf_dev)) {
+		dev_err(&pdev->dev, "PF VF Mailbox version mismatch\n");
+		err = -EINVAL;
+		goto delete_mbox;
+	}
+
+	netdev->hw_features = NETIF_F_SG;
+	netdev->min_mtu = OCTEP_VF_MIN_MTU;
+	netdev->max_mtu = OCTEP_VF_MAX_MTU;
+	netdev->mtu = OCTEP_VF_DEFAULT_MTU;
+
+	netdev->features |= netdev->hw_features;
+	octep_vf_get_mac_addr(octep_vf_dev, octep_vf_dev->mac_addr);
+	eth_hw_addr_set(netdev, octep_vf_dev->mac_addr);
+	err = register_netdev(netdev);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to register netdev\n");
+		goto delete_mbox;
+	}
+	dev_info(&pdev->dev, "Device probe successful\n");
+	return 0;
+
+delete_mbox:
+	octep_vf_delete_mbox(octep_vf_dev);
+device_cleanup:
+	octep_vf_device_cleanup(octep_vf_dev);
+netdevice_free:
+	free_netdev(netdev);
+mem_regions_release:
+	pci_release_mem_regions(pdev);
+disable_pci_device:
+	pci_disable_device(pdev);
+	dev_err(&pdev->dev, "Device probe failed\n");
+	return err;
+}
+
+/**
+ * octep_vf_remove() - Remove Octeon PCI device from driver control.
+ *
+ * @pdev: PCI device structure of the Octeon device.
+ *
+ * Cleanup all resources allocated for the Octeon device.
+ * Unregister from network device and disable the PCI device.
+ */
+static void octep_vf_remove(struct pci_dev *pdev)
+{
+	struct octep_vf_device *oct = pci_get_drvdata(pdev);
+	struct net_device *netdev;
+
+	if (!oct)
+		return;
+
+	octep_vf_mbox_dev_remove(oct);
+	cancel_work_sync(&oct->tx_timeout_task);
+	netdev = oct->netdev;
+	if (netdev->reg_state == NETREG_REGISTERED)
+		unregister_netdev(netdev);
+	octep_vf_delete_mbox(oct);
+	octep_vf_device_cleanup(oct);
+	pci_release_mem_regions(pdev);
+	free_netdev(netdev);
+	pci_disable_device(pdev);
+}
+
+static struct pci_driver octep_vf_driver = {
+	.name = OCTEP_VF_DRV_NAME,
+	.id_table = octep_vf_pci_id_tbl,
+	.probe = octep_vf_probe,
+	.remove = octep_vf_remove,
+};
+
+/**
+ * octep_vf_init_module() - Module initialization.
+ *
+ * create common resource for the driver and register PCI driver.
+ */
+static int __init octep_vf_init_module(void)
+{
+	int ret;
+
+	pr_info("%s: Loading %s ...\n", OCTEP_VF_DRV_NAME, OCTEP_VF_DRV_STRING);
+
+	ret = pci_register_driver(&octep_vf_driver);
+	if (ret < 0) {
+		pr_err("%s: Failed to register PCI driver; err=%d\n",
+		       OCTEP_VF_DRV_NAME, ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * octep_vf_exit_module() - Module exit routine.
+ *
+ * unregister the driver with PCI subsystem and cleanup common resources.
+ */
+static void __exit octep_vf_exit_module(void)
+{
+	pr_info("%s: Unloading ...\n", OCTEP_VF_DRV_NAME);
+
+	pci_unregister_driver(&octep_vf_driver);
+
+	pr_info("%s: Unloading complete\n", OCTEP_VF_DRV_NAME);
+}
+
+module_init(octep_vf_init_module);
+module_exit(octep_vf_exit_module);
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h
new file mode 100644
index 000000000000..4359e0e585ec
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_main.h
@@ -0,0 +1,331 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#ifndef _OCTEP_VF_MAIN_H_
+#define _OCTEP_VF_MAIN_H_
+
+#include "octep_vf_tx.h"
+#include "octep_vf_rx.h"
+#include "octep_vf_mbox.h"
+
+#define OCTEP_VF_DRV_NAME	"octeon_ep_vf"
+#define OCTEP_VF_DRV_STRING	"Marvell Octeon EndPoint NIC VF Driver"
+
+#define  OCTEP_PCI_DEVICE_ID_CN93_VF   0xB203    //93xx VF
+#define  OCTEP_PCI_DEVICE_ID_CNF95N_VF 0xB403    //95N VF
+#define  OCTEP_PCI_DEVICE_ID_CN98_VF	0xB103
+#define  OCTEP_PCI_DEVICE_ID_CN10KA_VF  0xB903
+#define  OCTEP_PCI_DEVICE_ID_CNF10KA_VF 0xBA03
+#define  OCTEP_PCI_DEVICE_ID_CNF10KB_VF 0xBC03
+#define  OCTEP_PCI_DEVICE_ID_CN10KB_VF  0xBD03
+
+#define  OCTEP_VF_MAX_QUEUES   63
+#define  OCTEP_VF_MAX_IQ       OCTEP_VF_MAX_QUEUES
+#define  OCTEP_VF_MAX_OQ       OCTEP_VF_MAX_QUEUES
+
+#define OCTEP_VF_MAX_MSIX_VECTORS OCTEP_VF_MAX_OQ
+
+#define  OCTEP_VF_IQ_INTR_RESEND_BIT  59
+#define  OCTEP_VF_OQ_INTR_RESEND_BIT  59
+
+#define  IQ_INSTR_PENDING(iq)  ({ typeof(iq) iq__ = (iq); \
+				  ((iq__)->host_write_index - (iq__)->flush_index) & \
+				  (iq__)->ring_size_mask; \
+				})
+#define  IQ_INSTR_SPACE(iq)    ({ typeof(iq) iq_ = (iq); \
+				  (iq_)->max_count - IQ_INSTR_PENDING(iq_); \
+				})
+
+/* PCI address space mapping information.
+ * Each of the 3 address spaces given by BAR0, BAR2 and BAR4 of
+ * Octeon gets mapped to different physical address spaces in
+ * the kernel.
+ */
+struct octep_vf_mmio {
+	/* The physical address to which the PCI address space is mapped. */
+	u8 __iomem *hw_addr;
+
+	/* Flag indicating the mapping was successful. */
+	int mapped;
+};
+
+struct octep_vf_hw_ops {
+	void (*setup_iq_regs)(struct octep_vf_device *oct, int q);
+	void (*setup_oq_regs)(struct octep_vf_device *oct, int q);
+	void (*setup_mbox_regs)(struct octep_vf_device *oct, int mbox);
+
+	irqreturn_t (*non_ioq_intr_handler)(void *ioq_vector);
+	irqreturn_t (*ioq_intr_handler)(void *ioq_vector);
+	void (*reinit_regs)(struct octep_vf_device *oct);
+	u32  (*update_iq_read_idx)(struct octep_vf_iq *iq);
+
+	void (*enable_interrupts)(struct octep_vf_device *oct);
+	void (*disable_interrupts)(struct octep_vf_device *oct);
+
+	void (*enable_io_queues)(struct octep_vf_device *oct);
+	void (*disable_io_queues)(struct octep_vf_device *oct);
+	void (*enable_iq)(struct octep_vf_device *oct, int q);
+	void (*disable_iq)(struct octep_vf_device *oct, int q);
+	void (*enable_oq)(struct octep_vf_device *oct, int q);
+	void (*disable_oq)(struct octep_vf_device *oct, int q);
+	void (*reset_io_queues)(struct octep_vf_device *oct);
+	void (*dump_registers)(struct octep_vf_device *oct);
+};
+
+/* Octeon mailbox data */
+struct octep_vf_mbox_data {
+	/* Holds the offset of received data via mailbox. */
+	u32 data_index;
+
+	/* Holds the received data via mailbox. */
+	u8 recv_data[OCTEP_PFVF_MBOX_MAX_DATA_BUF_SIZE];
+};
+
+/* wrappers around work structs */
+struct octep_vf_mbox_wk {
+	struct work_struct work;
+	void *ctxptr;
+};
+
+/* Octeon device mailbox */
+struct octep_vf_mbox {
+	/* A mutex to protect access to this q_mbox. */
+	struct mutex lock;
+
+	u32 state;
+
+	/* SLI_MAC_PF_MBOX_INT for PF, SLI_PKT_MBOX_INT for VF. */
+	u8 __iomem *mbox_int_reg;
+
+	/* SLI_PKT_PF_VF_MBOX_SIG(0) for PF,
+	 * SLI_PKT_PF_VF_MBOX_SIG(1) for VF.
+	 */
+	u8 __iomem *mbox_write_reg;
+
+	/* SLI_PKT_PF_VF_MBOX_SIG(1) for PF,
+	 * SLI_PKT_PF_VF_MBOX_SIG(0) for VF.
+	 */
+	u8 __iomem *mbox_read_reg;
+
+	/* Octeon mailbox data */
+	struct octep_vf_mbox_data mbox_data;
+
+	/* Octeon mailbox work handler to process Mbox messages */
+	struct octep_vf_mbox_wk wk;
+};
+
+/* Tx/Rx queue vector per interrupt. */
+struct octep_vf_ioq_vector {
+	char name[OCTEP_VF_MSIX_NAME_SIZE];
+	struct napi_struct napi;
+	struct octep_vf_device *octep_vf_dev;
+	struct octep_vf_iq *iq;
+	struct octep_vf_oq *oq;
+	cpumask_t affinity_mask;
+};
+
+/* Octeon hardware/firmware offload capability flags. */
+#define OCTEP_VF_CAP_TX_CHECKSUM BIT(0)
+#define OCTEP_VF_CAP_RX_CHECKSUM BIT(1)
+#define OCTEP_VF_CAP_TSO         BIT(2)
+
+/* Link modes */
+enum octep_vf_link_mode_bit_indices {
+	OCTEP_VF_LINK_MODE_10GBASE_T    = 0,
+	OCTEP_VF_LINK_MODE_10GBASE_R,
+	OCTEP_VF_LINK_MODE_10GBASE_CR,
+	OCTEP_VF_LINK_MODE_10GBASE_KR,
+	OCTEP_VF_LINK_MODE_10GBASE_LR,
+	OCTEP_VF_LINK_MODE_10GBASE_SR,
+	OCTEP_VF_LINK_MODE_25GBASE_CR,
+	OCTEP_VF_LINK_MODE_25GBASE_KR,
+	OCTEP_VF_LINK_MODE_25GBASE_SR,
+	OCTEP_VF_LINK_MODE_40GBASE_CR4,
+	OCTEP_VF_LINK_MODE_40GBASE_KR4,
+	OCTEP_VF_LINK_MODE_40GBASE_LR4,
+	OCTEP_VF_LINK_MODE_40GBASE_SR4,
+	OCTEP_VF_LINK_MODE_50GBASE_CR2,
+	OCTEP_VF_LINK_MODE_50GBASE_KR2,
+	OCTEP_VF_LINK_MODE_50GBASE_SR2,
+	OCTEP_VF_LINK_MODE_50GBASE_CR,
+	OCTEP_VF_LINK_MODE_50GBASE_KR,
+	OCTEP_VF_LINK_MODE_50GBASE_LR,
+	OCTEP_VF_LINK_MODE_50GBASE_SR,
+	OCTEP_VF_LINK_MODE_100GBASE_CR4,
+	OCTEP_VF_LINK_MODE_100GBASE_KR4,
+	OCTEP_VF_LINK_MODE_100GBASE_LR4,
+	OCTEP_VF_LINK_MODE_100GBASE_SR4,
+	OCTEP_VF_LINK_MODE_NBITS
+};
+
+/* Hardware interface link state information. */
+struct octep_vf_iface_link_info {
+	/* Bitmap of Supported link speeds/modes. */
+	u64 supported_modes;
+
+	/* Bitmap of Advertised link speeds/modes. */
+	u64 advertised_modes;
+
+	/* Negotiated link speed in Mbps. */
+	u32 speed;
+
+	/* MTU */
+	u16 mtu;
+
+	/* Autonegotiation state. */
+#define OCTEP_VF_LINK_MODE_AUTONEG_SUPPORTED   BIT(0)
+#define OCTEP_VF_LINK_MODE_AUTONEG_ADVERTISED  BIT(1)
+	u8 autoneg;
+
+	/* Pause frames setting. */
+#define OCTEP_VF_LINK_MODE_PAUSE_SUPPORTED   BIT(0)
+#define OCTEP_VF_LINK_MODE_PAUSE_ADVERTISED  BIT(1)
+	u8 pause;
+
+	/* Admin state of the link (ifconfig <iface> up/down */
+	u8  admin_up;
+
+	/* Operational state of the link: physical link is up down */
+	u8  oper_up;
+};
+
+/* Hardware interface stats information. */
+struct octep_vf_iface_rxtx_stats {
+	/* Hardware Interface Rx statistics */
+	struct octep_vf_iface_rx_stats iface_rx_stats;
+
+	/* Hardware Interface Tx statistics */
+	struct octep_vf_iface_tx_stats iface_tx_stats;
+};
+
+struct octep_vf_fw_info {
+	/* pkind value to be used in every Tx hardware descriptor */
+	u8 pkind;
+	/* front size data */
+	u8 fsz;
+	/* supported rx offloads OCTEP_VF_RX_OFFLOAD_* */
+	u16 rx_ol_flags;
+	/* supported tx offloads OCTEP_VF_TX_OFFLOAD_* */
+	u16 tx_ol_flags;
+};
+
+/* The Octeon device specific private data structure.
+ * Each Octeon device has this structure to represent all its components.
+ */
+struct octep_vf_device {
+	struct octep_vf_config *conf;
+
+	/* Octeon Chip type. */
+	u16 chip_id;
+	u16 rev_id;
+
+	/* Device capabilities enabled */
+	u64 caps_enabled;
+	/* Device capabilities supported */
+	u64 caps_supported;
+
+	/* Pointer to basic Linux device */
+	struct device *dev;
+	/* Linux PCI device pointer */
+	struct pci_dev *pdev;
+	/* Netdev corresponding to the Octeon device */
+	struct net_device *netdev;
+
+	/* memory mapped io range */
+	struct octep_vf_mmio mmio;
+
+	/* MAC address */
+	u8 mac_addr[ETH_ALEN];
+
+	/* Tx queues (IQ: Instruction Queue) */
+	u16 num_iqs;
+	/* Pointers to Octeon Tx queues */
+	struct octep_vf_iq *iq[OCTEP_VF_MAX_IQ];
+
+	/* Rx queues (OQ: Output Queue) */
+	u16 num_oqs;
+	/* Pointers to Octeon Rx queues */
+	struct octep_vf_oq *oq[OCTEP_VF_MAX_OQ];
+
+	/* Hardware port number of the PCIe interface */
+	u16 pcie_port;
+
+	/* Hardware operations */
+	struct octep_vf_hw_ops hw_ops;
+
+	/* IRQ info */
+	u16 num_irqs;
+	u16 num_non_ioq_irqs;
+	char *non_ioq_irq_names;
+	struct msix_entry *msix_entries;
+	/* IOq information of it's corresponding MSI-X interrupt. */
+	struct octep_vf_ioq_vector *ioq_vector[OCTEP_VF_MAX_QUEUES];
+
+	/* Hardware Interface Tx statistics */
+	struct octep_vf_iface_tx_stats iface_tx_stats;
+	/* Hardware Interface Rx statistics */
+	struct octep_vf_iface_rx_stats iface_rx_stats;
+
+	/* Hardware Interface Link info like supported modes, aneg support */
+	struct octep_vf_iface_link_info link_info;
+
+	/* Mailbox to talk to VFs */
+	struct octep_vf_mbox *mbox;
+
+	/* Work entry to handle Tx timeout */
+	struct work_struct tx_timeout_task;
+
+	/* offset for iface stats */
+	u32 ctrl_mbox_ifstats_offset;
+
+	/* Negotiated Mbox version */
+	u32 mbox_neg_ver;
+
+	/* firmware info */
+	struct octep_vf_fw_info fw_info;
+};
+
+static inline u16 OCTEP_VF_MAJOR_REV(struct octep_vf_device *oct)
+{
+	u16 rev = (oct->rev_id & 0xC) >> 2;
+
+	return (rev == 0) ? 1 : rev;
+}
+
+static inline u16 OCTEP_VF_MINOR_REV(struct octep_vf_device *oct)
+{
+	return (oct->rev_id & 0x3);
+}
+
+/* Octeon CSR read/write access APIs */
+#define octep_vf_write_csr(octep_vf_dev, reg_off, value) \
+	writel(value, (octep_vf_dev)->mmio.hw_addr + (reg_off))
+
+#define octep_vf_write_csr64(octep_vf_dev, reg_off, val64) \
+	writeq(val64, (octep_vf_dev)->mmio.hw_addr + (reg_off))
+
+#define octep_vf_read_csr(octep_vf_dev, reg_off)         \
+	readl((octep_vf_dev)->mmio.hw_addr + (reg_off))
+
+#define octep_vf_read_csr64(octep_vf_dev, reg_off)         \
+	readq((octep_vf_dev)->mmio.hw_addr + (reg_off))
+
+extern struct workqueue_struct *octep_vf_wq;
+
+int octep_vf_device_setup(struct octep_vf_device *oct);
+int octep_vf_setup_iqs(struct octep_vf_device *oct);
+void octep_vf_free_iqs(struct octep_vf_device *oct);
+void octep_vf_clean_iqs(struct octep_vf_device *oct);
+int octep_vf_setup_oqs(struct octep_vf_device *oct);
+void octep_vf_free_oqs(struct octep_vf_device *oct);
+void octep_vf_oq_dbell_init(struct octep_vf_device *oct);
+void octep_vf_device_setup_cn93(struct octep_vf_device *oct);
+void octep_vf_device_setup_cnxk(struct octep_vf_device *oct);
+int octep_vf_iq_process_completions(struct octep_vf_iq *iq, u16 budget);
+int octep_vf_oq_process_rx(struct octep_vf_oq *oq, int budget);
+void octep_vf_mbox_work(struct work_struct *work);
+#endif /* _OCTEP_VF_MAIN_H_ */
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c
new file mode 100644
index 000000000000..1c1fe293fc50
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+#include <linux/types.h>
+#include <linux/pci.h>
+#include <linux/netdevice.h>
+#include "octep_vf_config.h"
+#include "octep_vf_main.h"
+
+int octep_vf_setup_mbox(struct octep_vf_device *oct)
+{
+	int ring = 0;
+
+	oct->mbox = vzalloc(sizeof(*oct->mbox));
+	if (!oct->mbox)
+		return -1;
+
+	mutex_init(&oct->mbox->lock);
+
+	oct->hw_ops.setup_mbox_regs(oct, ring);
+	INIT_WORK(&oct->mbox->wk.work, octep_vf_mbox_work);
+	oct->mbox->wk.ctxptr = oct;
+	dev_info(&oct->pdev->dev, "setup vf mbox successfully\n");
+	return 0;
+}
+
+void octep_vf_delete_mbox(struct octep_vf_device *oct)
+{
+	if (oct->mbox) {
+		if (work_pending(&oct->mbox->wk.work))
+			cancel_work_sync(&oct->mbox->wk.work);
+
+		mutex_destroy(&oct->mbox->lock);
+		vfree(oct->mbox);
+		oct->mbox = NULL;
+		dev_info(&oct->pdev->dev, "Deleted vf mbox successfully\n");
+	}
+}
+
+int octep_vf_mbox_version_check(struct octep_vf_device *oct)
+{
+	return 0;
+}
+
+void octep_vf_mbox_work(struct work_struct *work)
+{
+}
+
+int octep_vf_mbox_set_mtu(struct octep_vf_device *oct, int mtu)
+{
+	return 0;
+}
+
+int octep_vf_mbox_set_mac_addr(struct octep_vf_device *oct, char *mac_addr)
+{
+	return 0;
+}
+
+int octep_vf_mbox_get_mac_addr(struct octep_vf_device *oct, char *mac_addr)
+{
+	return 0;
+}
+
+int octep_vf_mbox_set_rx_state(struct octep_vf_device *oct, bool state)
+{
+	return 0;
+}
+
+int octep_vf_mbox_set_link_status(struct octep_vf_device *oct, bool status)
+{
+	return 0;
+}
+
+int octep_vf_mbox_get_link_status(struct octep_vf_device *oct, u8 *oper_up)
+{
+	return 0;
+}
+
+int octep_vf_mbox_dev_remove(struct octep_vf_device *oct)
+{
+	return 0;
+}
+
+int octep_vf_mbox_get_fw_info(struct octep_vf_device *oct)
+{
+	return 0;
+}
+
+int octep_vf_mbox_set_offloads(struct octep_vf_device *oct, u16 tx_offloads,
+			       u16 rx_offloads)
+{
+	return 0;
+}
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h
new file mode 100644
index 000000000000..14f4fb19445b
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_mbox.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Marvell Octeon EP (EndPoint) Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+#ifndef _OCTEP_VF_MBOX_H_
+#define _OCTEP_VF_MBOX_H_
+
+#define OCTEP_PFVF_MBOX_MAX_DATA_BUF_SIZE 256
+
+int octep_vf_setup_mbox(struct octep_vf_device *oct);
+void octep_vf_delete_mbox(struct octep_vf_device *oct);
+int octep_vf_mbox_set_mtu(struct octep_vf_device *oct, int mtu);
+int octep_vf_mbox_set_mac_addr(struct octep_vf_device *oct, char *mac_addr);
+int octep_vf_mbox_get_mac_addr(struct octep_vf_device *oct, char *mac_addr);
+int octep_vf_mbox_version_check(struct octep_vf_device *oct);
+int octep_vf_mbox_set_rx_state(struct octep_vf_device *oct, bool state);
+int octep_vf_mbox_set_link_status(struct octep_vf_device *oct, bool status);
+int octep_vf_mbox_get_link_status(struct octep_vf_device *oct, u8 *oper_up);
+int octep_vf_mbox_dev_remove(struct octep_vf_device *oct);
+int octep_vf_mbox_get_fw_info(struct octep_vf_device *oct);
+int octep_vf_mbox_set_offloads(struct octep_vf_device *oct, u16 tx_offloads, u16 rx_offloads);
+
+#endif
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cn9k.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cn9k.h
new file mode 100644
index 000000000000..25e2a876ebba
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cn9k.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+#ifndef _OCTEP_VF_REGS_CN9K_H_
+#define _OCTEP_VF_REGS_CN9K_H_
+
+/*############################ RST #########################*/
+#define     CN93_VF_CONFIG_XPANSION_BAR         0x38
+#define     CN93_VF_CONFIG_PCIE_CAP             0x70
+#define     CN93_VF_CONFIG_PCIE_DEVCAP          0x74
+#define     CN93_VF_CONFIG_PCIE_DEVCTL          0x78
+#define     CN93_VF_CONFIG_PCIE_LINKCAP         0x7C
+#define     CN93_VF_CONFIG_PCIE_LINKCTL         0x80
+#define     CN93_VF_CONFIG_PCIE_SLOTCAP         0x84
+#define     CN93_VF_CONFIG_PCIE_SLOTCTL         0x88
+
+#define     CN93_VF_RING_OFFSET                    BIT_ULL(17)
+
+/*###################### RING IN REGISTERS #########################*/
+#define    CN93_VF_SDP_R_IN_CONTROL_START          0x10000
+#define    CN93_VF_SDP_R_IN_ENABLE_START           0x10010
+#define    CN93_VF_SDP_R_IN_INSTR_BADDR_START      0x10020
+#define    CN93_VF_SDP_R_IN_INSTR_RSIZE_START      0x10030
+#define    CN93_VF_SDP_R_IN_INSTR_DBELL_START      0x10040
+#define    CN93_VF_SDP_R_IN_CNTS_START             0x10050
+#define    CN93_VF_SDP_R_IN_INT_LEVELS_START       0x10060
+#define    CN93_VF_SDP_R_IN_PKT_CNT_START          0x10080
+#define    CN93_VF_SDP_R_IN_BYTE_CNT_START         0x10090
+
+#define    CN93_VF_SDP_R_IN_CONTROL(ring)          \
+	(CN93_VF_SDP_R_IN_CONTROL_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_ENABLE(ring)          \
+	(CN93_VF_SDP_R_IN_ENABLE_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_INSTR_BADDR(ring)          \
+	(CN93_VF_SDP_R_IN_INSTR_BADDR_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_INSTR_RSIZE(ring)          \
+	(CN93_VF_SDP_R_IN_INSTR_RSIZE_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_INSTR_DBELL(ring)          \
+	(CN93_VF_SDP_R_IN_INSTR_DBELL_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_CNTS(ring)          \
+	(CN93_VF_SDP_R_IN_CNTS_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_INT_LEVELS(ring)          \
+	(CN93_VF_SDP_R_IN_INT_LEVELS_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_PKT_CNT(ring)          \
+	(CN93_VF_SDP_R_IN_PKT_CNT_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_IN_BYTE_CNT(ring)          \
+	(CN93_VF_SDP_R_IN_BYTE_CNT_START + ((ring) * CN93_VF_RING_OFFSET))
+
+/*------------------ R_IN Masks ----------------*/
+
+/** Rings per Virtual Function **/
+#define    CN93_VF_R_IN_CTL_RPVF_MASK    (0xF)
+#define	   CN93_VF_R_IN_CTL_RPVF_POS     (48)
+
+/* Number of instructions to be read in one MAC read request.
+ * setting to Max value(4)
+ **/
+#define    CN93_VF_R_IN_CTL_IDLE                  BIT_ULL(28)
+#define    CN93_VF_R_IN_CTL_RDSIZE                (0x3ULL << 25)
+#define    CN93_VF_R_IN_CTL_IS_64B                BIT_ULL(24)
+#define    CN93_VF_R_IN_CTL_D_NSR                 BIT_ULL(8)
+#define    CN93_VF_R_IN_CTL_D_ESR                 BIT_ULL(6)
+#define    CN93_VF_R_IN_CTL_D_ROR                 BIT_ULL(5)
+#define    CN93_VF_R_IN_CTL_NSR                   BIT_ULL(3)
+#define    CN93_VF_R_IN_CTL_ESR                   BIT_ULL(1)
+#define    CN93_VF_R_IN_CTL_ROR                   BIT_ULL(0)
+
+#define    CN93_VF_R_IN_CTL_MASK     (CN93_VF_R_IN_CTL_RDSIZE | CN93_VF_R_IN_CTL_IS_64B)
+
+/*###################### RING OUT REGISTERS #########################*/
+#define    CN93_VF_SDP_R_OUT_CNTS_START            0x10100
+#define    CN93_VF_SDP_R_OUT_INT_LEVELS_START      0x10110
+#define    CN93_VF_SDP_R_OUT_SLIST_BADDR_START     0x10120
+#define    CN93_VF_SDP_R_OUT_SLIST_RSIZE_START     0x10130
+#define    CN93_VF_SDP_R_OUT_SLIST_DBELL_START     0x10140
+#define    CN93_VF_SDP_R_OUT_CONTROL_START         0x10150
+#define    CN93_VF_SDP_R_OUT_ENABLE_START          0x10160
+#define    CN93_VF_SDP_R_OUT_PKT_CNT_START         0x10180
+#define    CN93_VF_SDP_R_OUT_BYTE_CNT_START        0x10190
+
+#define    CN93_VF_SDP_R_OUT_CONTROL(ring)          \
+	(CN93_VF_SDP_R_OUT_CONTROL_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_ENABLE(ring)          \
+	(CN93_VF_SDP_R_OUT_ENABLE_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_SLIST_BADDR(ring)          \
+	(CN93_VF_SDP_R_OUT_SLIST_BADDR_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_SLIST_RSIZE(ring)          \
+	(CN93_VF_SDP_R_OUT_SLIST_RSIZE_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_SLIST_DBELL(ring)          \
+	(CN93_VF_SDP_R_OUT_SLIST_DBELL_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_CNTS(ring)          \
+	(CN93_VF_SDP_R_OUT_CNTS_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_INT_LEVELS(ring)          \
+	(CN93_VF_SDP_R_OUT_INT_LEVELS_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_PKT_CNT(ring)          \
+	(CN93_VF_SDP_R_OUT_PKT_CNT_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_OUT_BYTE_CNT(ring)          \
+	(CN93_VF_SDP_R_OUT_BYTE_CNT_START + ((ring) * CN93_VF_RING_OFFSET))
+
+/*------------------ R_OUT Masks ----------------*/
+#define    CN93_VF_R_OUT_INT_LEVELS_BMODE            BIT_ULL(63)
+#define    CN93_VF_R_OUT_INT_LEVELS_TIMET            (32)
+
+#define    CN93_VF_R_OUT_CTL_IDLE                    BIT_ULL(40)
+#define    CN93_VF_R_OUT_CTL_ES_I                    BIT_ULL(34)
+#define    CN93_VF_R_OUT_CTL_NSR_I                   BIT_ULL(33)
+#define    CN93_VF_R_OUT_CTL_ROR_I                   BIT_ULL(32)
+#define    CN93_VF_R_OUT_CTL_ES_D                    BIT_ULL(30)
+#define    CN93_VF_R_OUT_CTL_NSR_D                   BIT_ULL(29)
+#define    CN93_VF_R_OUT_CTL_ROR_D                   BIT_ULL(28)
+#define    CN93_VF_R_OUT_CTL_ES_P                    BIT_ULL(26)
+#define    CN93_VF_R_OUT_CTL_NSR_P                   BIT_ULL(25)
+#define    CN93_VF_R_OUT_CTL_ROR_P                   BIT_ULL(24)
+#define    CN93_VF_R_OUT_CTL_IMODE                   BIT_ULL(23)
+
+/* ##################### Mail Box Registers ########################## */
+/* SDP PF to VF Mailbox Data Register */
+#define    CN93_VF_SDP_R_MBOX_PF_VF_DATA_START    0x10210
+/* SDP Packet PF to VF Mailbox Interrupt Register */
+#define    CN93_VF_SDP_R_MBOX_PF_VF_INT_START     0x10220
+/* SDP VF to PF Mailbox Data Register */
+#define    CN93_VF_SDP_R_MBOX_VF_PF_DATA_START    0x10230
+
+#define    CN93_VF_SDP_R_MBOX_PF_VF_INT_ENAB         BIT_ULL(1)
+#define    CN93_VF_SDP_R_MBOX_PF_VF_INT_STATUS       BIT_ULL(0)
+
+#define    CN93_VF_SDP_R_MBOX_PF_VF_DATA(ring)          \
+	(CN93_VF_SDP_R_MBOX_PF_VF_DATA_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_MBOX_PF_VF_INT(ring)          \
+	(CN93_VF_SDP_R_MBOX_PF_VF_INT_START + ((ring) * CN93_VF_RING_OFFSET))
+
+#define    CN93_VF_SDP_R_MBOX_VF_PF_DATA(ring)          \
+	(CN93_VF_SDP_R_MBOX_VF_PF_DATA_START + ((ring) * CN93_VF_RING_OFFSET))
+#endif /* _OCTEP_VF_REGS_CN9K_H_ */
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cnxk.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cnxk.h
new file mode 100644
index 000000000000..2e156745ef64
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_regs_cnxk.h
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+#ifndef _OCTEP_VF_REGS_CNXK_H_
+#define _OCTEP_VF_REGS_CNXK_H_
+
+/*############################ RST #########################*/
+#define     CNXK_VF_CONFIG_XPANSION_BAR         0x38
+#define     CNXK_VF_CONFIG_PCIE_CAP             0x70
+#define     CNXK_VF_CONFIG_PCIE_DEVCAP          0x74
+#define     CNXK_VF_CONFIG_PCIE_DEVCTL          0x78
+#define     CNXK_VF_CONFIG_PCIE_LINKCAP         0x7C
+#define     CNXK_VF_CONFIG_PCIE_LINKCTL         0x80
+#define     CNXK_VF_CONFIG_PCIE_SLOTCAP         0x84
+#define     CNXK_VF_CONFIG_PCIE_SLOTCTL         0x88
+
+#define     CNXK_VF_RING_OFFSET                    (0x1ULL << 17)
+
+/*###################### RING IN REGISTERS #########################*/
+#define    CNXK_VF_SDP_R_IN_CONTROL_START          0x10000
+#define    CNXK_VF_SDP_R_IN_ENABLE_START           0x10010
+#define    CNXK_VF_SDP_R_IN_INSTR_BADDR_START      0x10020
+#define    CNXK_VF_SDP_R_IN_INSTR_RSIZE_START      0x10030
+#define    CNXK_VF_SDP_R_IN_INSTR_DBELL_START      0x10040
+#define    CNXK_VF_SDP_R_IN_CNTS_START             0x10050
+#define    CNXK_VF_SDP_R_IN_INT_LEVELS_START       0x10060
+#define    CNXK_VF_SDP_R_IN_PKT_CNT_START          0x10080
+#define    CNXK_VF_SDP_R_IN_BYTE_CNT_START         0x10090
+#define    CNXK_VF_SDP_R_ERR_TYPE_START            0x10400
+
+#define CNXK_VF_SDP_R_ERR_TYPE(ring)                 \
+	(CNXK_VF_SDP_R_ERR_TYPE_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_CONTROL(ring)          \
+	(CNXK_VF_SDP_R_IN_CONTROL_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_ENABLE(ring)          \
+	(CNXK_VF_SDP_R_IN_ENABLE_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_INSTR_BADDR(ring)          \
+	(CNXK_VF_SDP_R_IN_INSTR_BADDR_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_INSTR_RSIZE(ring)          \
+	(CNXK_VF_SDP_R_IN_INSTR_RSIZE_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_INSTR_DBELL(ring)          \
+	(CNXK_VF_SDP_R_IN_INSTR_DBELL_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_CNTS(ring)          \
+	(CNXK_VF_SDP_R_IN_CNTS_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_INT_LEVELS(ring)          \
+	(CNXK_VF_SDP_R_IN_INT_LEVELS_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_PKT_CNT(ring)          \
+	(CNXK_VF_SDP_R_IN_PKT_CNT_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_IN_BYTE_CNT(ring)          \
+	(CNXK_VF_SDP_R_IN_BYTE_CNT_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+/*------------------ R_IN Masks ----------------*/
+
+/** Rings per Virtual Function **/
+#define    CNXK_VF_R_IN_CTL_RPVF_MASK    (0xF)
+#define	   CNXK_VF_R_IN_CTL_RPVF_POS     (48)
+
+/* Number of instructions to be read in one MAC read request.
+ * setting to Max value(4)
+ **/
+#define    CNXK_VF_R_IN_CTL_IDLE                  (0x1ULL << 28)
+#define    CNXK_VF_R_IN_CTL_RDSIZE                (0x3ULL << 25)
+#define    CNXK_VF_R_IN_CTL_IS_64B                (0x1ULL << 24)
+#define    CNXK_VF_R_IN_CTL_D_NSR                 (0x1ULL << 8)
+#define    CNXK_VF_R_IN_CTL_D_ESR                 (0x1ULL << 6)
+#define    CNXK_VF_R_IN_CTL_D_ROR                 (0x1ULL << 5)
+#define    CNXK_VF_R_IN_CTL_NSR                   (0x1ULL << 3)
+#define    CNXK_VF_R_IN_CTL_ESR                   (0x1ULL << 1)
+#define    CNXK_VF_R_IN_CTL_ROR                   (0x1ULL << 0)
+
+#define    CNXK_VF_R_IN_CTL_MASK     (CNXK_VF_R_IN_CTL_RDSIZE | CNXK_VF_R_IN_CTL_IS_64B)
+
+/*###################### RING OUT REGISTERS #########################*/
+#define    CNXK_VF_SDP_R_OUT_CNTS_START            0x10100
+#define    CNXK_VF_SDP_R_OUT_INT_LEVELS_START      0x10110
+#define    CNXK_VF_SDP_R_OUT_SLIST_BADDR_START     0x10120
+#define    CNXK_VF_SDP_R_OUT_SLIST_RSIZE_START     0x10130
+#define    CNXK_VF_SDP_R_OUT_SLIST_DBELL_START     0x10140
+#define    CNXK_VF_SDP_R_OUT_CONTROL_START         0x10150
+#define    CNXK_VF_SDP_R_OUT_WMARK_START           0x10160
+#define    CNXK_VF_SDP_R_OUT_ENABLE_START          0x10170
+#define    CNXK_VF_SDP_R_OUT_PKT_CNT_START         0x10180
+#define    CNXK_VF_SDP_R_OUT_BYTE_CNT_START        0x10190
+
+#define    CNXK_VF_SDP_R_OUT_CONTROL(ring)          \
+	(CNXK_VF_SDP_R_OUT_CONTROL_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_ENABLE(ring)          \
+	(CNXK_VF_SDP_R_OUT_ENABLE_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_SLIST_BADDR(ring)          \
+	(CNXK_VF_SDP_R_OUT_SLIST_BADDR_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_SLIST_RSIZE(ring)          \
+	(CNXK_VF_SDP_R_OUT_SLIST_RSIZE_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_SLIST_DBELL(ring)          \
+	(CNXK_VF_SDP_R_OUT_SLIST_DBELL_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_WMARK(ring)          \
+	(CNXK_VF_SDP_R_OUT_WMARK_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_CNTS(ring)          \
+	(CNXK_VF_SDP_R_OUT_CNTS_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_INT_LEVELS(ring)          \
+	(CNXK_VF_SDP_R_OUT_INT_LEVELS_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_PKT_CNT(ring)          \
+	(CNXK_VF_SDP_R_OUT_PKT_CNT_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_OUT_BYTE_CNT(ring)          \
+	(CNXK_VF_SDP_R_OUT_BYTE_CNT_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+/*------------------ R_OUT Masks ----------------*/
+#define    CNXK_VF_R_OUT_INT_LEVELS_BMODE            BIT_ULL(63)
+#define    CNXK_VF_R_OUT_INT_LEVELS_TIMET            (32)
+
+#define    CNXK_VF_R_OUT_CTL_IDLE                    BIT_ULL(40)
+#define    CNXK_VF_R_OUT_CTL_ES_I                    BIT_ULL(34)
+#define    CNXK_VF_R_OUT_CTL_NSR_I                   BIT_ULL(33)
+#define    CNXK_VF_R_OUT_CTL_ROR_I                   BIT_ULL(32)
+#define    CNXK_VF_R_OUT_CTL_ES_D                    BIT_ULL(30)
+#define    CNXK_VF_R_OUT_CTL_NSR_D                   BIT_ULL(29)
+#define    CNXK_VF_R_OUT_CTL_ROR_D                   BIT_ULL(28)
+#define    CNXK_VF_R_OUT_CTL_ES_P                    BIT_ULL(26)
+#define    CNXK_VF_R_OUT_CTL_NSR_P                   BIT_ULL(25)
+#define    CNXK_VF_R_OUT_CTL_ROR_P                   BIT_ULL(24)
+#define    CNXK_VF_R_OUT_CTL_IMODE                   BIT_ULL(23)
+
+/* ##################### Mail Box Registers ########################## */
+/* SDP PF to VF Mailbox Data Register */
+#define    CNXK_VF_SDP_R_MBOX_PF_VF_DATA_START    0x10210
+/* SDP Packet PF to VF Mailbox Interrupt Register */
+#define    CNXK_VF_SDP_R_MBOX_PF_VF_INT_START     0x10220
+/* SDP VF to PF Mailbox Data Register */
+#define    CNXK_VF_SDP_R_MBOX_VF_PF_DATA_START    0x10230
+
+#define    CNXK_VF_SDP_R_MBOX_PF_VF_INT_ENAB         BIT_ULL(1)
+#define    CNXK_VF_SDP_R_MBOX_PF_VF_INT_STATUS       BIT_ULL(0)
+
+#define    CNXK_VF_SDP_R_MBOX_PF_VF_DATA(ring)          \
+	(CNXK_VF_SDP_R_MBOX_PF_VF_DATA_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_MBOX_PF_VF_INT(ring)          \
+	(CNXK_VF_SDP_R_MBOX_PF_VF_INT_START + ((ring) * CNXK_VF_RING_OFFSET))
+
+#define    CNXK_VF_SDP_R_MBOX_VF_PF_DATA(ring)          \
+	(CNXK_VF_SDP_R_MBOX_VF_PF_DATA_START + ((ring) * CNXK_VF_RING_OFFSET))
+#endif /* _OCTEP_VF_REGS_CNXK_H_ */
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.c
new file mode 100644
index 000000000000..4f1a8157ce39
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#include <linux/pci.h>
+#include <linux/etherdevice.h>
+
+#include "octep_vf_config.h"
+#include "octep_vf_main.h"
+
+/**
+ * octep_vf_setup_oqs() - setup resources for all Rx queues.
+ *
+ * @oct: Octeon device private data structure.
+ */
+int octep_vf_setup_oqs(struct octep_vf_device *oct)
+{
+	return -1;
+}
+
+/**
+ * octep_vf_oq_dbell_init() - Initialize Rx queue doorbell.
+ *
+ * @oct: Octeon device private data structure.
+ *
+ * Write number of descriptors to Rx queue doorbell register.
+ */
+void octep_vf_oq_dbell_init(struct octep_vf_device *oct)
+{
+}
+
+/**
+ * octep_vf_free_oqs() - Free resources of all Rx queues.
+ *
+ * @oct: Octeon device private data structure.
+ */
+void octep_vf_free_oqs(struct octep_vf_device *oct)
+{
+}
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.h
new file mode 100644
index 000000000000..fe46838b5200
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_rx.h
@@ -0,0 +1,224 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#ifndef _OCTEP_VF_RX_H_
+#define _OCTEP_VF_RX_H_
+
+/* struct octep_vf_oq_desc_hw - Octeon Hardware OQ descriptor format.
+ *
+ * The descriptor ring is made of descriptors which have 2 64-bit values:
+ *
+ *   @buffer_ptr: DMA address of the skb->data
+ *   @info_ptr:  DMA address of host memory, used to update pkt count by hw.
+ *               This is currently unused to save pci writes.
+ */
+struct octep_vf_oq_desc_hw {
+	dma_addr_t buffer_ptr;
+	u64 info_ptr;
+};
+
+static_assert(sizeof(struct octep_vf_oq_desc_hw) == 16);
+
+#define OCTEP_VF_OQ_DESC_SIZE    (sizeof(struct octep_vf_oq_desc_hw))
+
+/* Rx offload flags */
+#define OCTEP_VF_RX_OFFLOAD_VLAN_STRIP		BIT(0)
+#define OCTEP_VF_RX_OFFLOAD_IPV4_CKSUM		BIT(1)
+#define OCTEP_VF_RX_OFFLOAD_UDP_CKSUM		BIT(2)
+#define OCTEP_VF_RX_OFFLOAD_TCP_CKSUM		BIT(3)
+
+#define OCTEP_VF_RX_OFFLOAD_CKSUM		(OCTEP_VF_RX_OFFLOAD_IPV4_CKSUM | \
+						 OCTEP_VF_RX_OFFLOAD_UDP_CKSUM | \
+						 OCTEP_VF_RX_OFFLOAD_TCP_CKSUM)
+
+#define OCTEP_VF_RX_IP_CSUM(flags)		((flags) & \
+						 (OCTEP_VF_RX_OFFLOAD_IPV4_CKSUM | \
+						  OCTEP_VF_RX_OFFLOAD_TCP_CKSUM | \
+						  OCTEP_VF_RX_OFFLOAD_UDP_CKSUM))
+
+/* bit 0 is vlan strip */
+#define OCTEP_VF_RX_CSUM_IP_VERIFIED		BIT(1)
+#define OCTEP_VF_RX_CSUM_L4_VERIFIED		BIT(2)
+
+#define OCTEP_VF_RX_CSUM_VERIFIED(flags)	((flags) & \
+						 (OCTEP_VF_RX_CSUM_L4_VERIFIED | \
+						  OCTEP_VF_RX_CSUM_IP_VERIFIED))
+
+/* Extended Response Header in packet data received from Hardware.
+ * Includes metadata like checksum status.
+ * this is valid only if hardware/firmware published support for this.
+ * This is at offset 0 of packet data (skb->data).
+ */
+struct octep_vf_oq_resp_hw_ext {
+	/* Reserved. */
+	u64 rsvd:48;
+
+	/* rx offload flags */
+	u16 rx_ol_flags;
+};
+
+static_assert(sizeof(struct octep_vf_oq_resp_hw_ext) == 8);
+
+#define  OCTEP_VF_OQ_RESP_HW_EXT_SIZE   (sizeof(struct octep_vf_oq_resp_hw_ext))
+
+/* Length of Rx packet DMA'ed by Octeon to Host.
+ * this is in bigendian; so need to be converted to cpu endian.
+ * Octeon writes this at the beginning of Rx buffer (skb->data).
+ */
+struct octep_vf_oq_resp_hw {
+	/* The Length of the packet. */
+	__be64 length;
+};
+
+static_assert(sizeof(struct octep_vf_oq_resp_hw) == 8);
+
+#define OCTEP_VF_OQ_RESP_HW_SIZE   (sizeof(struct octep_vf_oq_resp_hw))
+
+/* Pointer to data buffer.
+ * Driver keeps a pointer to the data buffer that it made available to
+ * the Octeon device. Since the descriptor ring keeps physical (bus)
+ * addresses, this field is required for the driver to keep track of
+ * the virtual address pointers. The fields are operated by
+ * OS-dependent routines.
+ */
+struct octep_vf_rx_buffer {
+	struct page *page;
+
+	/* length from rx hardware descriptor after converting to cpu endian */
+	u64 len;
+};
+
+#define OCTEP_VF_OQ_RECVBUF_SIZE    (sizeof(struct octep_vf_rx_buffer))
+
+/* Output Queue statistics. Each output queue has four stats fields. */
+struct octep_vf_oq_stats {
+	/* Number of packets received from the Device. */
+	u64 packets;
+
+	/* Number of bytes received from the Device. */
+	u64 bytes;
+
+	/* Number of times failed to allocate buffers. */
+	u64 alloc_failures;
+};
+
+#define OCTEP_VF_OQ_STATS_SIZE   (sizeof(struct octep_vf_oq_stats))
+
+/* Hardware interface Rx statistics */
+struct octep_vf_iface_rx_stats {
+	/* Received packets */
+	u64 pkts;
+
+	/* Octets of received packets */
+	u64 octets;
+
+	/* Received PAUSE and Control packets */
+	u64 pause_pkts;
+
+	/* Received PAUSE and Control octets */
+	u64 pause_octets;
+
+	/* Filtered DMAC0 packets */
+	u64 dmac0_pkts;
+
+	/* Filtered DMAC0 octets */
+	u64 dmac0_octets;
+
+	/* Packets dropped due to RX FIFO full */
+	u64 dropped_pkts_fifo_full;
+
+	/* Octets dropped due to RX FIFO full */
+	u64 dropped_octets_fifo_full;
+
+	/* Error packets */
+	u64 err_pkts;
+
+	/* Filtered DMAC1 packets */
+	u64 dmac1_pkts;
+
+	/* Filtered DMAC1 octets */
+	u64 dmac1_octets;
+
+	/* NCSI-bound packets dropped */
+	u64 ncsi_dropped_pkts;
+
+	/* NCSI-bound octets dropped */
+	u64 ncsi_dropped_octets;
+
+	/* Multicast packets received. */
+	u64 mcast_pkts;
+
+	/* Broadcast packets received. */
+	u64 bcast_pkts;
+
+};
+
+/* The Descriptor Ring Output Queue structure.
+ * This structure has all the information required to implement a
+ * Octeon OQ.
+ */
+struct octep_vf_oq {
+	u32 q_no;
+
+	struct octep_vf_device *octep_vf_dev;
+	struct net_device *netdev;
+	struct device *dev;
+
+	struct napi_struct *napi;
+
+	/* The receive buffer list. This list has the virtual addresses
+	 * of the buffers.
+	 */
+	struct octep_vf_rx_buffer *buff_info;
+
+	/* Pointer to the mapped packet credit register.
+	 * Host writes number of info/buffer ptrs available to this register
+	 */
+	u8 __iomem *pkts_credit_reg;
+
+	/* Pointer to the mapped packet sent register.
+	 * Octeon writes the number of packets DMA'ed to host memory
+	 * in this register.
+	 */
+	u8 __iomem *pkts_sent_reg;
+
+	/* Statistics for this OQ. */
+	struct octep_vf_oq_stats stats;
+
+	/* Packets pending to be processed */
+	u32 pkts_pending;
+	u32 last_pkt_count;
+
+	/* Index in the ring where the driver should read the next packet */
+	u32 host_read_idx;
+
+	/* Number of  descriptors in this ring. */
+	u32 max_count;
+	u32 ring_size_mask;
+
+	/* The number of descriptors pending refill. */
+	u32 refill_count;
+
+	/* Index in the ring where the driver will refill the
+	 * descriptor's buffer
+	 */
+	u32 host_refill_idx;
+	u32 refill_threshold;
+
+	/* The size of each buffer pointed by the buffer pointer. */
+	u32 buffer_size;
+	u32 max_single_buffer_size;
+
+	/* The 8B aligned descriptor ring starts at this address. */
+	struct octep_vf_oq_desc_hw *desc_ring;
+
+	/* DMA mapped address of the OQ descriptor ring. */
+	dma_addr_t desc_ring_dma;
+};
+
+#define OCTEP_VF_OQ_SIZE   (sizeof(struct octep_vf_oq))
+#endif	/* _OCTEP_VF_RX_H_ */
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.c b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.c
new file mode 100644
index 000000000000..232ba479ecf6
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#include <linux/pci.h>
+#include <linux/etherdevice.h>
+
+#include "octep_vf_config.h"
+#include "octep_vf_main.h"
+
+/**
+ * octep_vf_clean_iqs()  - Clean Tx queues to shutdown the device.
+ *
+ * @oct: Octeon device private data structure.
+ *
+ * Free the buffers in Tx queue descriptors pending completion and
+ * reset queue indices
+ */
+void octep_vf_clean_iqs(struct octep_vf_device *oct)
+{
+}
+
+/**
+ * octep_vf_setup_iqs() - setup resources for all Tx queues.
+ *
+ * @oct: Octeon device private data structure.
+ */
+int octep_vf_setup_iqs(struct octep_vf_device *oct)
+{
+	return -1;
+}
+
+/**
+ * octep_vf_free_iqs() - Free resources of all Tx queues.
+ *
+ * @oct: Octeon device private data structure.
+ */
+void octep_vf_free_iqs(struct octep_vf_device *oct)
+{
+}
diff --git a/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.h b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.h
new file mode 100644
index 000000000000..f338b975103c
--- /dev/null
+++ b/drivers/net/ethernet/marvell/octeon_ep_vf/octep_vf_tx.h
@@ -0,0 +1,276 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Marvell Octeon EP (EndPoint) VF Ethernet Driver
+ *
+ * Copyright (C) 2020 Marvell.
+ *
+ */
+
+#ifndef _OCTEP_VF_TX_H_
+#define _OCTEP_VF_TX_H_
+
+#define IQ_SEND_OK          0
+#define IQ_SEND_STOP        1
+#define IQ_SEND_FAILED     -1
+
+#define TX_BUFTYPE_NONE          0
+#define TX_BUFTYPE_NET           1
+#define TX_BUFTYPE_NET_SG        2
+#define NUM_TX_BUFTYPES          3
+
+/* Hardware format for Scatter/Gather list
+ *
+ * 63      48|47     32|31     16|15       0
+ * -----------------------------------------
+ * |  Len 0  |  Len 1  |  Len 2  |  Len 3  |
+ * -----------------------------------------
+ * |                Ptr 0                  |
+ * -----------------------------------------
+ * |                Ptr 1                  |
+ * -----------------------------------------
+ * |                Ptr 2                  |
+ * -----------------------------------------
+ * |                Ptr 3                  |
+ * -----------------------------------------
+ */
+struct octep_vf_tx_sglist_desc {
+	u16 len[4];
+	dma_addr_t dma_ptr[4];
+};
+
+static_assert(sizeof(struct octep_vf_tx_sglist_desc) == 40);
+
+/* Each Scatter/Gather entry sent to hardwar hold four pointers.
+ * So, number of entries required is (MAX_SKB_FRAGS + 1)/4, where '+1'
+ * is for main skb which also goes as a gather buffer to Octeon hardware.
+ * To allocate sufficient SGLIST entries for a packet with max fragments,
+ * align by adding 3 before calcuating max SGLIST entries per packet.
+ */
+#define OCTEP_VF_SGLIST_ENTRIES_PER_PKT ((MAX_SKB_FRAGS + 1 + 3) / 4)
+#define OCTEP_VF_SGLIST_SIZE_PER_PKT \
+	(OCTEP_VF_SGLIST_ENTRIES_PER_PKT * sizeof(struct octep_vf_tx_sglist_desc))
+
+struct octep_vf_tx_buffer {
+	struct sk_buff *skb;
+	dma_addr_t dma;
+	struct octep_vf_tx_sglist_desc *sglist;
+	dma_addr_t sglist_dma;
+	u8 gather;
+};
+
+#define OCTEP_VF_IQ_TXBUFF_INFO_SIZE (sizeof(struct octep_vf_tx_buffer))
+
+/* VF Hardware interface Tx statistics */
+struct octep_vf_iface_tx_stats {
+	/* Total frames sent on the interface */
+	u64 pkts;
+
+	/* Total octets sent on the interface */
+	u64 octs;
+
+	/* Packets sent to a broadcast DMAC */
+	u64 bcst;
+
+	/* Packets sent to the multicast DMAC */
+	u64 mcst;
+
+	/* Packets dropped */
+	u64 dropped;
+
+	/* Reserved */
+	u64 reserved[13];
+};
+
+/* VF Input Queue statistics */
+struct octep_vf_iq_stats {
+	/* Instructions posted to this queue. */
+	u64 instr_posted;
+
+	/* Instructions copied by hardware for processing. */
+	u64 instr_completed;
+
+	/* Instructions that could not be processed. */
+	u64 instr_dropped;
+
+	/* Bytes sent through this queue. */
+	u64 bytes_sent;
+
+	/* Gather entries sent through this queue. */
+	u64 sgentry_sent;
+
+	/* Number of transmit failures due to TX_BUSY */
+	u64 tx_busy;
+
+	/* Number of times the queue is restarted */
+	u64 restart_cnt;
+};
+
+/* The instruction (input) queue.
+ * The input queue is used to post raw (instruction) mode data or packet
+ * data to Octeon device from the host. Each input queue (up to 4) for
+ * a Octeon device has one such structure to represent it.
+ */
+struct octep_vf_iq {
+	u32 q_no;
+
+	struct octep_vf_device *octep_vf_dev;
+	struct net_device *netdev;
+	struct device *dev;
+	struct netdev_queue *netdev_q;
+
+	/* Index in input ring where driver should write the next packet */
+	u16 host_write_index;
+
+	/* Index in input ring where Octeon is expected to read next packet */
+	u16 octep_vf_read_index;
+
+	/* This index aids in finding the window in the queue where Octeon
+	 * has read the commands.
+	 */
+	u16 flush_index;
+
+	/* Statistics for this input queue. */
+	struct octep_vf_iq_stats stats;
+
+	/* Pointer to the Virtual Base addr of the input ring. */
+	struct octep_vf_tx_desc_hw *desc_ring;
+
+	/* DMA mapped base address of the input descriptor ring. */
+	dma_addr_t desc_ring_dma;
+
+	/* Info of Tx buffers pending completion. */
+	struct octep_vf_tx_buffer *buff_info;
+
+	/* Base pointer to Scatter/Gather lists for all ring descriptors. */
+	struct octep_vf_tx_sglist_desc *sglist;
+
+	/* DMA mapped addr of Scatter Gather Lists */
+	dma_addr_t sglist_dma;
+
+	/* Octeon doorbell register for the ring. */
+	u8 __iomem *doorbell_reg;
+
+	/* Octeon instruction count register for this ring. */
+	u8 __iomem *inst_cnt_reg;
+
+	/* interrupt level register for this ring */
+	u8 __iomem *intr_lvl_reg;
+
+	/* Maximum no. of instructions in this queue. */
+	u32 max_count;
+	u32 ring_size_mask;
+
+	u32 pkt_in_done;
+	u32 pkts_processed;
+
+	u32 status;
+
+	/* Number of instructions pending to be posted to Octeon. */
+	u32 fill_cnt;
+
+	/* The max. number of instructions that can be held pending by the
+	 * driver before ringing doorbell.
+	 */
+	u32 fill_threshold;
+};
+
+/* Hardware Tx Instruction Header */
+struct octep_vf_instr_hdr {
+	/* Data Len */
+	u64 tlen:16;
+
+	/* Reserved */
+	u64 rsvd:20;
+
+	/* PKIND for SDP */
+	u64 pkind:6;
+
+	/* Front Data size */
+	u64 fsz:6;
+
+	/* No. of entries in gather list */
+	u64 gsz:14;
+
+	/* Gather indicator 1=gather*/
+	u64 gather:1;
+
+	/* Reserved3 */
+	u64 reserved3:1;
+};
+
+static_assert(sizeof(struct octep_vf_instr_hdr) == 8);
+
+/* Tx offload flags */
+#define OCTEP_VF_TX_OFFLOAD_VLAN_INSERT	BIT(0)
+#define OCTEP_VF_TX_OFFLOAD_IPV4_CKSUM	BIT(1)
+#define OCTEP_VF_TX_OFFLOAD_UDP_CKSUM	BIT(2)
+#define OCTEP_VF_TX_OFFLOAD_TCP_CKSUM	BIT(3)
+#define OCTEP_VF_TX_OFFLOAD_SCTP_CKSUM	BIT(4)
+#define OCTEP_VF_TX_OFFLOAD_TCP_TSO	BIT(5)
+#define OCTEP_VF_TX_OFFLOAD_UDP_TSO	BIT(6)
+
+#define OCTEP_VF_TX_OFFLOAD_CKSUM	(OCTEP_VF_TX_OFFLOAD_IPV4_CKSUM | \
+					 OCTEP_VF_TX_OFFLOAD_UDP_CKSUM | \
+					 OCTEP_VF_TX_OFFLOAD_TCP_CKSUM)
+
+#define OCTEP_VF_TX_OFFLOAD_TSO		(OCTEP_VF_TX_OFFLOAD_TCP_TSO | \
+					 OCTEP_VF_TX_OFFLOAD_UDP_TSO)
+
+#define OCTEP_VF_TX_IP_CSUM(flags)	((flags) & \
+					 (OCTEP_VF_TX_OFFLOAD_IPV4_CKSUM | \
+					  OCTEP_VF_TX_OFFLOAD_TCP_CKSUM | \
+					  OCTEP_VF_TX_OFFLOAD_UDP_CKSUM))
+
+#define OCTEP_VF_TX_TSO(flags)		((flags) & \
+					 (OCTEP_VF_TX_OFFLOAD_TCP_TSO | \
+					  OCTEP_VF_TX_OFFLOAD_UDP_TSO))
+
+struct tx_mdata {
+	/* offload flags */
+	u16 ol_flags;
+
+	/* gso size */
+	u16 gso_size;
+
+	/* gso flags */
+	u16 gso_segs;
+
+	/* reserved */
+	u16 rsvd1;
+
+	/* reserved */
+	u64 rsvd2;
+};
+
+static_assert(sizeof(struct tx_mdata) == 16);
+
+/* 64-byte Tx instruction format.
+ * Format of instruction for a 64-byte mode input queue.
+ *
+ * only first 16-bytes (dptr and ih) are mandatory; rest are optional
+ * and filled by the driver based on firmware/hardware capabilities.
+ * These optional headers together called Front Data and its size is
+ * described by ih->fsz.
+ */
+struct octep_vf_tx_desc_hw {
+	/* Pointer where the input data is available. */
+	u64 dptr;
+
+	/* Instruction Header. */
+	union {
+		struct octep_vf_instr_hdr ih;
+		u64 ih64;
+	};
+
+	union  {
+		u64 txm64[2];
+		struct tx_mdata txm;
+	};
+
+	/* Additional headers available in a 64-byte instruction. */
+	u64 exhdr[4];
+};
+
+static_assert(sizeof(struct octep_vf_tx_desc_hw) == 64);
+
+#define OCTEP_VF_IQ_DESC_SIZE (sizeof(struct octep_vf_tx_desc_hw))
+#endif /* _OCTEP_VF_TX_H_ */
-- 
2.25.1


