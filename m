Return-Path: <linux-doc+bounces-42585-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB19A809DE
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 14:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1620E7B50E0
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 12:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9F427BF7A;
	Tue,  8 Apr 2025 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBYdFFo9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1246C26A1AF;
	Tue,  8 Apr 2025 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116523; cv=none; b=g5l2ORSz03zM9PdZIwl8iZiNl22Q9JRPmcESWOunEXkuBoZV1O+PelPy+SQBabIN59a4BREaF9Fd6svQuiLjGKPRVEwhIRrxGaEd3rPWDAaAjlPqD9RRHY2b8MdgQbZmR5F5BZ93YtQa6CEq3lFmEVJPIwXrPjFdSvU0qv/jJII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116523; c=relaxed/simple;
	bh=PCGu+f8orD0Lme0tQVttJQRn6U1gwEkOMes9W36ZegU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8A9CxLtjjBGzu/rBlHcDr5negdOcBzqaaGjTSm1cE0JWzt/OpJ/vCS9ej2GhTKQaq4N/4s8jbeeH0R/InQIjnR0melS2V+mWP+7fxPpM+MAWmOZmnqwOfYSLPOX7WzLYYkCb9wPWY6kD1kNZIojVNCzlZNdzZXeQCd87Mm9qzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBYdFFo9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744116521; x=1775652521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PCGu+f8orD0Lme0tQVttJQRn6U1gwEkOMes9W36ZegU=;
  b=UBYdFFo9bxBfY7DeNIgqqX5L7tV6gl8wG0KqZLy1qehbX85NRR+8LVMY
   uWxb6Vm2TC1hzcth8lV2ukpzfPUgCDp3XqUgK155JlzE5domznv0ld9im
   qurwOeW8JGOkLnhR6SsodltFAYDtRuKsNCf+bf3gJ7+gSTwvxzYwM2Lpr
   Z8Kx5UgVG9xybmJYkz1ma3JIBmhQKdwwLInkSC7GEkvoLIUFfg3yW0CnX
   vncbVaBg/IF8B3jnJDvzYgVh1E4G4Y6i4MwtpBFXSYurDsfNydwCIz90K
   XcVGofveg2Odbr+7LKa1fOZYOwZKe+/qQcM/ojoPcUWTJygjB8hIkBTfm
   g==;
X-CSE-ConnectionGUID: 9GAJPuNdR8uYQCxjyWv01A==
X-CSE-MsgGUID: WEVULFWCRKCoOsVkQvKR9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56184879"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56184879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:48:40 -0700
X-CSE-ConnectionGUID: b6YVujnZRGm8H0Y6LAfA8A==
X-CSE-MsgGUID: 5OCkiZwpQbyZ9EFrMKqUNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133130680"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2025 05:48:31 -0700
Received: from mglak.igk.intel.com (mglak.igk.intel.com [10.237.112.146])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 5C96734314;
	Tue,  8 Apr 2025 13:48:28 +0100 (IST)
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
Subject: [PATCH iwl-next 05/14] libeth: add control queue support
Date: Tue,  8 Apr 2025 14:47:51 +0200
Message-ID: <20250408124816.11584-6-larysa.zaremba@intel.com>
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

Libeth will now support control queue setup and configuration APIs.
These are mainly used for mailbox communication between drivers and
control plane.

Make use of the page pool support for managing controlq buffers.

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
 drivers/net/ethernet/intel/libeth/Kconfig    |   8 +
 drivers/net/ethernet/intel/libeth/Makefile   |   4 +
 drivers/net/ethernet/intel/libeth/controlq.c | 608 +++++++++++++++++++
 include/net/libeth/controlq.h                | 251 ++++++++
 4 files changed, 871 insertions(+)
 create mode 100644 drivers/net/ethernet/intel/libeth/controlq.c
 create mode 100644 include/net/libeth/controlq.h

diff --git a/drivers/net/ethernet/intel/libeth/Kconfig b/drivers/net/ethernet/intel/libeth/Kconfig
index 070ad685fb74..3dad49420663 100644
--- a/drivers/net/ethernet/intel/libeth/Kconfig
+++ b/drivers/net/ethernet/intel/libeth/Kconfig
@@ -8,6 +8,14 @@ config LIBETH
 	  libeth is a common library containing routines shared between several
 	  drivers, but not yet promoted to the generic kernel API.
 
+config LIBETH_CP
+	tristate
+	select LIBETH
+	select LIBETH_PCI
+	help
+	  Common helper routines to communicate with the device Control Plane
+	  using virtchnl2 or related mailbox protocols.
+
 config LIBETH_PCI
 	tristate
 	help
diff --git a/drivers/net/ethernet/intel/libeth/Makefile b/drivers/net/ethernet/intel/libeth/Makefile
index 5f0fc9446acb..861fdabc7be3 100644
--- a/drivers/net/ethernet/intel/libeth/Makefile
+++ b/drivers/net/ethernet/intel/libeth/Makefile
@@ -5,6 +5,10 @@ obj-$(CONFIG_LIBETH)		+= libeth.o
 
 libeth-y			:= rx.o
 
+obj-$(CONFIG_LIBETH_CP)		+= libeth_cp.o
+
+libeth_cp-y			:= controlq.o
+
 obj-$(CONFIG_LIBETH_PCI)	+= libeth_pci.o
 
 libeth_pci-y			:= pci.o
diff --git a/drivers/net/ethernet/intel/libeth/controlq.c b/drivers/net/ethernet/intel/libeth/controlq.c
new file mode 100644
index 000000000000..2ce419591495
--- /dev/null
+++ b/drivers/net/ethernet/intel/libeth/controlq.c
@@ -0,0 +1,608 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2025 Intel Corporation */
+
+#include <linux/bitfield.h>
+
+#include <net/libeth/controlq.h>
+#include <net/libeth/rx.h>
+
+#define LIBETH_CTLQ_DESC_QWORD0(sz)			\
+	(LIBETH_CTLQ_DESC_FLAG_BUF |			\
+	 LIBETH_CTLQ_DESC_FLAG_RD |			\
+	 FIELD_PREP(LIBETH_CTLQ_DESC_DATA_LEN, sz))
+
+/**
+ * libeth_ctlq_free_fq - free fill queue resources, including buffers
+ * @ctlq: Rx control queue whose resources need to be freed
+ */
+static void libeth_ctlq_free_fq(struct libeth_ctlq_info *ctlq)
+{
+	struct libeth_fq fq = {
+		.fqes		= ctlq->rx_fqes,
+		.pp		= ctlq->pp,
+	};
+
+	for (u32 ntc = ctlq->next_to_clean; ntc != ctlq->next_to_post; ) {
+		page_pool_put_full_page(fq.fqes[ntc].page->pp,
+					fq.fqes[ntc].page, false);
+
+		if (++ntc >= ctlq->ring_len)
+			ntc = 0;
+	}
+
+	libeth_rx_fq_destroy(&fq);
+}
+
+/**
+ * libeth_ctlq_init_fq - initialize fill queue for an Rx controlq
+ * @ctlq: control queue that needs a Rx buffer allocation
+ *
+ * Return: %0 on success, -%errno on failure
+ */
+static int libeth_ctlq_init_fq(struct libeth_ctlq_info *ctlq)
+{
+	struct libeth_fq fq = {
+		.count		= ctlq->ring_len,
+		.truesize	= LIBETH_CTLQ_MAX_BUF_LEN,
+		.nid		= NUMA_NO_NODE,
+		.type		= LIBETH_FQE_SHORT,
+		.hsplit		= true,
+		.no_napi	= true,
+	};
+	int err;
+
+	err = libeth_rx_fq_create(&fq, ctlq->dev);
+	if (err)
+		return err;
+
+	ctlq->pp = fq.pp;
+	ctlq->rx_fqes = fq.fqes;
+	ctlq->truesize = fq.truesize;
+
+	return 0;
+}
+
+/**
+ * libeth_ctlq_reset_rx_desc - reset the descriptor with a new address
+ * @desc: descriptor to (re)initialize
+ * @addr: physical address to put into descriptor
+ * @mem_truesize: size of the accessible memory
+ */
+static void libeth_ctlq_reset_rx_desc(struct libeth_ctlq_desc *desc,
+				      dma_addr_t addr, u32 mem_truesize)
+{
+	u64 qword;
+
+	*desc = (struct libeth_ctlq_desc) {};
+	qword = LIBETH_CTLQ_DESC_QWORD0(mem_truesize);
+	desc->qword0 = cpu_to_le64(qword);
+
+	qword = FIELD_PREP(LIBETH_CTLQ_DESC_DATA_ADDR_HIGH,
+			   upper_32_bits(addr)) |
+		FIELD_PREP(LIBETH_CTLQ_DESC_DATA_ADDR_LOW,
+			   lower_32_bits(addr));
+	desc->qword3 = cpu_to_le64(qword);
+}
+
+/**
+ * libeth_ctlq_post_rx_buffs - post buffers to descriptor ring
+ * @ctlq: control queue that requires Rx descriptor ring to be initialized with
+ *	  new Rx buffers
+ *
+ * The caller must make sure that calls to libeth_ctlq_post_rx_buffs()
+ * and libeth_ctlq_recv() for separate queues are either serialized
+ * or used under ctlq->lock.
+ *
+ * Return: %0 on success, -%ENOMEM if any buffer could not be allocated
+ */
+int libeth_ctlq_post_rx_buffs(struct libeth_ctlq_info *ctlq)
+{
+	u32 ntp = ctlq->next_to_post, ntc = ctlq->next_to_clean, num_to_post;
+	const struct libeth_fq_fp fq = {
+		.pp		= ctlq->pp,
+		.fqes		= ctlq->rx_fqes,
+		.truesize	= ctlq->truesize,
+		.count		= ctlq->ring_len,
+	};
+	int ret = 0;
+
+	num_to_post = (ntc > ntp ? 0 : ctlq->ring_len) + ntc - ntp - 1;
+
+	while (num_to_post--) {
+		dma_addr_t addr;
+
+		addr = libeth_rx_alloc(&fq, ntp);
+		if (unlikely(addr == DMA_MAPPING_ERROR)) {
+			ret = -ENOMEM;
+			goto post_bufs;
+		}
+
+		libeth_ctlq_reset_rx_desc(&ctlq->descs[ntp], addr, fq.truesize);
+
+		if (unlikely(++ntp == ctlq->ring_len))
+			ntp = 0;
+	}
+
+post_bufs:
+	if (likely(ctlq->next_to_post != ntp)) {
+		ctlq->next_to_post = ntp;
+
+		writel(ntp, ctlq->reg.tail);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(libeth_ctlq_post_rx_buffs, "LIBETH_CP");
+
+/**
+ * libeth_ctlq_free_tx_msgs - Free Tx control queue messages
+ * @ctlq: Tx control queue being destroyed
+ * @num_msgs: number of messages allocated so far
+ */
+static void libeth_ctlq_free_tx_msgs(struct libeth_ctlq_info *ctlq,
+				     u32 num_msgs)
+{
+	for (u32 i = 0; i < num_msgs; i++)
+		kfree(ctlq->tx_msg[i]);
+
+	kvfree(ctlq->tx_msg);
+}
+
+/**
+ * libeth_ctlq_alloc_tx_msgs - Allocate Tx control queue messages
+ * @ctlq: Tx control queue being created
+ *
+ * Return: %0 on success, -%ENOMEM on allocation error
+ */
+static int libeth_ctlq_alloc_tx_msgs(struct libeth_ctlq_info *ctlq)
+{
+	ctlq->tx_msg = kvcalloc(ctlq->ring_len,
+				sizeof(*ctlq->tx_msg), GFP_KERNEL);
+	if (!ctlq->tx_msg)
+		return -ENOMEM;
+
+	for (u32 i = 0; i < ctlq->ring_len; i++) {
+		ctlq->tx_msg[i] = kzalloc(sizeof(*ctlq->tx_msg[i]), GFP_KERNEL);
+
+		if (!ctlq->tx_msg[i]) {
+			libeth_ctlq_free_tx_msgs(ctlq, i);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * libeth_cp_free_dma_mem - Free the previously allocated DMA memory
+ * @dev: device information
+ * @mem: DMA memory information
+ */
+static void libeth_cp_free_dma_mem(struct device *dev,
+				   struct libeth_cp_dma_mem *mem)
+{
+	dma_free_coherent(dev, mem->size, mem->va, mem->pa);
+	mem->va = NULL;
+}
+
+/**
+ * libeth_ctlq_dealloc_ring_res - Free memory allocated for control queue
+ * @ctlq: control queue that requires its ring memory to be freed
+ *
+ * Free the memory used by the ring, buffers and other related structures.
+ */
+static void libeth_ctlq_dealloc_ring_res(struct libeth_ctlq_info *ctlq)
+{
+	struct libeth_cp_dma_mem *dma = &ctlq->ring_mem;
+
+	if (ctlq->type == LIBETH_CTLQ_TYPE_TX)
+		libeth_ctlq_free_tx_msgs(ctlq, ctlq->ring_len);
+	else
+		libeth_ctlq_free_fq(ctlq);
+
+	libeth_cp_free_dma_mem(ctlq->dev, dma);
+}
+
+/**
+ * libeth_cp_alloc_dma_mem - Allocate a DMA memory
+ * @dev: device information
+ * @mem: memory for DMA information to be stored
+ * @size: size of the memory to allocate
+ *
+ * Return: virtual address of DMA memory or NULL.
+ */
+static void *libeth_cp_alloc_dma_mem(struct device *dev,
+				     struct libeth_cp_dma_mem *mem, u32 size)
+{
+	size = ALIGN(size, SZ_4K);
+
+	mem->va = dma_alloc_coherent(dev, size, &mem->pa, GFP_KERNEL);
+	mem->size = size;
+
+	return mem->va;
+}
+
+/**
+ * libeth_ctlq_alloc_queue_res - allocate memory for descriptor ring and bufs
+ * @ctlq: control queue that requires its ring resources to be allocated
+ *
+ * Return: %0 on success, -%errno on failure
+ */
+static int libeth_ctlq_alloc_queue_res(struct libeth_ctlq_info *ctlq)
+{
+	size_t size = array_size(ctlq->ring_len, sizeof(*ctlq->descs));
+	struct libeth_cp_dma_mem *dma = &ctlq->ring_mem;
+	int err = -ENOMEM;
+
+	if (!libeth_cp_alloc_dma_mem(ctlq->dev, dma, size))
+		return -ENOMEM;
+
+	ctlq->descs = dma->va;
+
+	if (ctlq->type == LIBETH_CTLQ_TYPE_TX) {
+		if (libeth_ctlq_alloc_tx_msgs(ctlq))
+			goto free_dma_mem;
+	} else {
+		err = libeth_ctlq_init_fq(ctlq);
+		if (err)
+			goto free_dma_mem;
+
+		err = libeth_ctlq_post_rx_buffs(ctlq);
+		if (err) {
+			libeth_ctlq_free_fq(ctlq);
+			goto free_dma_mem;
+		}
+	}
+
+	return 0;
+
+free_dma_mem:
+	libeth_cp_free_dma_mem(ctlq->dev, dma);
+
+	return err;
+}
+
+/**
+ * libeth_ctlq_init_regs - Initialize control queue registers
+ * @ctlq: control queue that needs to be initialized
+ *
+ * Initialize registers. The caller is expected to have already initialized the
+ * descriptor ring memory and buffer memory.
+ */
+static void libeth_ctlq_init_regs(struct libeth_ctlq_info *ctlq)
+{
+	u32 dword;
+
+	if (ctlq->type == VIRTCHNL2_QUEUE_TYPE_RX)
+		writel(ctlq->ring_len - 1, ctlq->reg.tail);
+
+	writel(0, ctlq->reg.head);
+	writel(lower_32_bits(ctlq->ring_mem.pa), ctlq->reg.addr_low);
+	writel(upper_32_bits(ctlq->ring_mem.pa), ctlq->reg.addr_high);
+
+	dword = FIELD_PREP(LIBETH_CTLQ_MBX_ATQ_LEN, ctlq->ring_len) |
+		ctlq->reg.len_ena_mask;
+	writel(dword, ctlq->reg.len);
+}
+
+/**
+ * libeth_find_ctlq - find the controlq for the given id and type
+ * @ctx: controlq context structure
+ * @type: type of controlq to find
+ * @id: controlq id to find
+ *
+ * Return: control queue info pointer on success, NULL on failure
+ */
+struct libeth_ctlq_info *libeth_find_ctlq(struct libeth_ctlq_ctx *ctx,
+					  enum virtchnl2_queue_type type,
+					  int id)
+{
+	struct libeth_ctlq_info *cq;
+
+	guard(spinlock)(&ctx->ctlqs_lock);
+
+	list_for_each_entry(cq, &ctx->ctlqs, list)
+		if (cq->qid == id && cq->type == type)
+			return cq;
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS_GPL(libeth_find_ctlq, "LIBETH_CP");
+
+/**
+ * libeth_ctlq_add - add one control queue
+ * @ctx: controlq context information
+ * @qinfo: information that requires for queue creation
+ *
+ * Allocate and initialize a control queue and add it to the control queue list.
+ * The ctlq parameter will be allocated/initialized and passed back to the
+ * caller if no errors occur.
+ *
+ * Note: libeth_ctlq_init must be called prior to any calls to libeth_ctlq_add.
+ *
+ * Return: added control queue info pointer on success, error pointer on failure
+ */
+static struct libeth_ctlq_info *
+libeth_ctlq_add(struct libeth_ctlq_ctx *ctx,
+		const struct libeth_ctlq_create_info *qinfo)
+{
+	struct libeth_ctlq_info *ctlq;
+
+	if (qinfo->id != LIBETH_CTLQ_MBX_ID)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	/* libeth_ctlq_init was not called */
+	scoped_guard(spinlock, &ctx->ctlqs_lock)
+		if (!ctx->ctlqs.next)
+			return ERR_PTR(-EINVAL);
+
+	ctlq = kvzalloc(sizeof(*ctlq), GFP_KERNEL);
+	if (!ctlq)
+		return ERR_PTR(-ENOMEM);
+
+	ctlq->type = qinfo->type;
+	ctlq->qid = qinfo->id;
+	ctlq->ring_len = qinfo->len;
+	ctlq->dev = &ctx->mmio_info.pdev->dev;
+	ctlq->reg = qinfo->reg;
+
+	if (libeth_ctlq_alloc_queue_res(ctlq)) {
+		kvfree(ctlq);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	libeth_ctlq_init_regs(ctlq);
+
+	spin_lock_init(&ctlq->lock);
+
+	scoped_guard(spinlock, &ctx->ctlqs_lock)
+		list_add(&ctlq->list, &ctx->ctlqs);
+
+	return ctlq;
+}
+
+/**
+ * libeth_ctlq_remove - deallocate and remove specified control queue
+ * @ctx: libeth context information
+ * @ctlq: specific control queue that needs to be removed
+ */
+static void libeth_ctlq_remove(struct libeth_ctlq_ctx *ctx,
+			       struct libeth_ctlq_info *ctlq)
+{
+	scoped_guard(spinlock, &ctx->ctlqs_lock)
+		list_del(&ctlq->list);
+
+	libeth_ctlq_dealloc_ring_res(ctlq);
+	kvfree(ctlq);
+}
+
+/**
+ * libeth_ctlq_init - main initialization routine for all control queues
+ * @ctx: libeth context information
+ * @qinfo: array of structs containing info for each queue to be initialized
+ * @numq: number of queues to initialize
+ *
+ * This initializes queue list and adds any number and any type of control
+ * queues. This is an all or nothing routine; if one fails, all previously
+ * allocated queues will be destroyed. This must be called prior to using
+ * the individual add/remove APIs.
+ *
+ * Return: %0 on success, -%errno on failure
+ */
+int libeth_ctlq_init(struct libeth_ctlq_ctx *ctx,
+		     const struct libeth_ctlq_create_info *qinfo,
+		     u32 numq)
+{
+	INIT_LIST_HEAD(&ctx->ctlqs);
+	spin_lock_init(&ctx->ctlqs_lock);
+
+	for (u32 i = 0; i < numq; i++) {
+		struct libeth_ctlq_info *ctlq;
+
+		ctlq = libeth_ctlq_add(ctx, &qinfo[i]);
+		if (IS_ERR(ctlq)) {
+			libeth_ctlq_deinit(ctx);
+			return PTR_ERR(ctlq);
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(libeth_ctlq_init, "LIBETH_CP");
+
+/**
+ * libeth_ctlq_deinit - destroy all control queues
+ * @ctx: libeth context information
+ */
+void libeth_ctlq_deinit(struct libeth_ctlq_ctx *ctx)
+{
+	struct libeth_ctlq_info *ctlq, *tmp;
+
+	list_for_each_entry_safe(ctlq, tmp, &ctx->ctlqs, list)
+		libeth_ctlq_remove(ctx, ctlq);
+}
+EXPORT_SYMBOL_NS_GPL(libeth_ctlq_deinit, "LIBETH_CP");
+
+/**
+ * libeth_ctlq_tx_desc_from_msg - initialize a Tx descriptor from a message
+ * @desc: descriptor to be initialized
+ * @msg: filled control queue message
+ */
+static void libeth_ctlq_tx_desc_from_msg(struct libeth_ctlq_desc *desc,
+					 const struct libeth_ctlq_msg *msg)
+{
+	const struct libeth_cp_dma_mem *dma = &msg->send_mem;
+	u64 qword;
+
+	qword = FIELD_PREP(LIBETH_CTLQ_DESC_FLAGS, msg->flags) |
+		FIELD_PREP(LIBETH_CTLQ_DESC_INFRA_OPCODE, msg->opcode) |
+		FIELD_PREP(LIBETH_CTLQ_DESC_PFID_VFID, msg->func_id);
+	desc->qword0 = cpu_to_le64(qword);
+
+	qword = FIELD_PREP(LIBETH_CTLQ_DESC_VIRTCHNL_OPCODE,
+			   msg->chnl_opcode) |
+		FIELD_PREP(LIBETH_CTLQ_DESC_VIRTCHNL_MSG_RET_VAL,
+			   msg->chnl_retval);
+	desc->qword1 = cpu_to_le64(qword);
+
+	qword = FIELD_PREP(LIBETH_CTLQ_DESC_MSG_PARAM0, msg->param0) |
+		FIELD_PREP(LIBETH_CTLQ_DESC_SW_COOKIE,
+			   msg->sw_cookie) |
+		FIELD_PREP(LIBETH_CTLQ_DESC_VIRTCHNL_FLAGS,
+			   msg->virt_flags);
+	desc->qword2 = cpu_to_le64(qword);
+
+	if (likely(msg->data_len)) {
+		desc->qword0 |=
+			cpu_to_le64(LIBETH_CTLQ_DESC_QWORD0(msg->data_len));
+		qword = FIELD_PREP(LIBETH_CTLQ_DESC_DATA_ADDR_HIGH,
+				   upper_32_bits(dma->pa)) |
+			FIELD_PREP(LIBETH_CTLQ_DESC_DATA_ADDR_LOW,
+				   lower_32_bits(dma->pa));
+	} else {
+		qword = msg->addr_param;
+	}
+
+	desc->qword3 = cpu_to_le64(qword);
+}
+
+/**
+ * libeth_ctlq_send - send a message to Control Plane or Peer
+ * @ctlq: specific control queue which is used for sending a message
+ * @q_msg: array of queue messages to be sent
+ * @num_q_msg: number of messages to send on control queue
+ *
+ * The control queue will hold a reference to each send message until
+ * the completion for that message has been cleaned.
+ *
+ * The caller must hold ctlq->lock.
+ *
+ * Return: %0 on success, -%errno on failure.
+ */
+int libeth_ctlq_send(struct libeth_ctlq_info *ctlq,
+		     struct libeth_ctlq_msg *q_msg, u32 num_q_msg)
+{
+	u32 num_desc_avail, ntu;
+
+	ntu = ctlq->next_to_use;
+
+	num_desc_avail = (ctlq->next_to_clean > ntu ? 0 : ctlq->ring_len) +
+			  ctlq->next_to_clean - ntu - 1;
+
+	if (num_desc_avail < num_q_msg)
+		return -EBUSY;
+
+	for (int i = 0; i < num_q_msg; i++) {
+		struct libeth_ctlq_msg *msg = &q_msg[i];
+		struct libeth_ctlq_desc *desc;
+
+		desc = &ctlq->descs[ntu];
+		libeth_ctlq_tx_desc_from_msg(desc, msg);
+
+		if (unlikely(++ntu == ctlq->ring_len))
+			ntu = 0;
+	}
+	writel(ntu, ctlq->reg.tail);
+	ctlq->next_to_use = ntu;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(libeth_ctlq_send, "LIBETH_CP");
+
+/**
+ * libeth_ctlq_fill_rx_msg - fill in a message from Rx descriptor and buffer
+ * @msg: message to be filled in
+ * @desc: received descriptor
+ * @rx_buf: fill queue buffer associated with the descriptor
+ */
+static void libeth_ctlq_fill_rx_msg(struct libeth_ctlq_msg *msg,
+				    const struct libeth_ctlq_desc *desc,
+				    struct libeth_fqe *rx_buf)
+{
+	u64 qword = le64_to_cpu(desc->qword0);
+
+	msg->flags = FIELD_GET(LIBETH_CTLQ_DESC_FLAGS, qword);
+	msg->opcode = FIELD_GET(LIBETH_CTLQ_DESC_INFRA_OPCODE, qword);
+	msg->data_len = FIELD_GET(LIBETH_CTLQ_DESC_DATA_LEN, qword);
+	msg->hw_retval = FIELD_GET(LIBETH_CTLQ_DESC_HW_RETVAL, qword);
+
+	qword = le64_to_cpu(desc->qword1);
+	msg->chnl_opcode =
+		FIELD_GET(LIBETH_CTLQ_DESC_VIRTCHNL_OPCODE, qword);
+	msg->chnl_retval =
+		FIELD_GET(LIBETH_CTLQ_DESC_VIRTCHNL_MSG_RET_VAL, qword);
+
+	qword = le64_to_cpu(desc->qword2);
+	msg->param0 =
+		FIELD_GET(LIBETH_CTLQ_DESC_MSG_PARAM0, qword);
+	msg->sw_cookie =
+		FIELD_GET(LIBETH_CTLQ_DESC_SW_COOKIE, qword);
+	msg->virt_flags =
+		FIELD_GET(LIBETH_CTLQ_DESC_VIRTCHNL_FLAGS, qword);
+
+	if (likely(msg->data_len)) {
+		msg->recv_mem = (struct kvec) {
+			.iov_base = page_address(rx_buf->page),
+			.iov_len = msg->data_len,
+		};
+		libeth_rx_sync_for_cpu(rx_buf, msg->data_len);
+	} else {
+		msg->recv_mem = (struct kvec) {};
+		msg->addr_param = le64_to_cpu(desc->qword3);
+		page_pool_put_full_page(rx_buf->page->pp, rx_buf->page,
+					false);
+	}
+}
+
+/**
+ * libeth_ctlq_recv - receive control queue message call back
+ * @ctlq: control queue that needs to processed for receive
+ * @msg: array of received control queue messages on this q;
+ * needs to be pre-allocated by caller for as many messages as requested
+ * @num_q_msg: number of messages that can be stored in msg buffer
+ *
+ * Called by interrupt handler or polling mechanism. Caller is expected
+ * to free buffers.
+ *
+ * The caller must make sure that calls to libeth_ctlq_post_rx_buffs()
+ * and libeth_ctlq_recv() for separate queues are either serialized
+ * or used under ctlq->lock.
+ *
+ * Return: number of messages received
+ */
+u32 libeth_ctlq_recv(struct libeth_ctlq_info *ctlq, struct libeth_ctlq_msg *msg,
+		     u32 num_q_msg)
+{
+	u32 ntc, i;
+
+	ntc = ctlq->next_to_clean;
+
+	for (i = 0; i < num_q_msg; i++) {
+		const struct libeth_ctlq_desc *desc = &ctlq->descs[ntc];
+		struct libeth_fqe *rx_buf = &ctlq->rx_fqes[ntc];
+		u64 qword;
+
+		qword = le64_to_cpu(desc->qword0);
+		if (!FIELD_GET(LIBETH_CTLQ_DESC_FLAG_DD, qword))
+			break;
+
+		dma_rmb();
+
+		if (unlikely(FIELD_GET(LIBETH_CTLQ_DESC_FLAG_ERR, qword)))
+			break;
+
+		libeth_ctlq_fill_rx_msg(&msg[i], desc, rx_buf);
+
+		if (unlikely(++ntc == ctlq->ring_len))
+			ntc = 0;
+	}
+
+	ctlq->next_to_clean = ntc;
+
+	return i;
+}
+EXPORT_SYMBOL_NS_GPL(libeth_ctlq_recv, "LIBETH_CP");
+
+MODULE_DESCRIPTION("Control Plane communication API");
+MODULE_IMPORT_NS("LIBETH");
+MODULE_LICENSE("GPL");
diff --git a/include/net/libeth/controlq.h b/include/net/libeth/controlq.h
new file mode 100644
index 000000000000..35e69d0f48a4
--- /dev/null
+++ b/include/net/libeth/controlq.h
@@ -0,0 +1,251 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Intel Corporation */
+
+#ifndef __LIBETH_CONTROLQ_H
+#define __LIBETH_CONTROLQ_H
+
+#include <linux/intel/virtchnl2.h>
+
+#include <net/libeth/pci.h>
+#include <net/libeth/rx.h>
+
+/* Default mailbox control queue */
+#define LIBETH_CTLQ_MBX_ID			-1
+#define LIBETH_CTLQ_MAX_BUF_LEN			SZ_4K
+
+#define LIBETH_CTLQ_TYPE_TX			0
+#define LIBETH_CTLQ_TYPE_RX			1
+
+/* Opcode used to send controlq message to the control plane */
+#define LIBETH_CTLQ_SEND_MSG_TO_CP		0x801
+#define LIBETH_CTLQ_SEND_MSG_TO_PEER		0x804
+
+/**
+ * struct libeth_ctlq_ctx - contains controlq info and MMIO region info
+ * @mmio_info: MMIO region info structure
+ * @ctlqs: list that stores all the control queues
+ * @ctlqs_lock: lock for control queue list
+ */
+struct libeth_ctlq_ctx {
+	struct libeth_mmio_info	mmio_info;
+	struct list_head	ctlqs;
+	spinlock_t		ctlqs_lock;	/* protects the ctlqs list */
+};
+
+/**
+ * struct libeth_ctlq_reg - structure representing virtual addresses of the
+ *			    controlq registers and masks
+ * @head: controlq head register address
+ * @tail: controlq tail register address
+ * @len: register address to write controlq length and enable bit
+ * @addr_high: register address to write the upper 32b of ring physical address
+ * @addr_low: register address to write the lower 32b of ring physical address
+ * @len_mask: mask to read the controlq length
+ * @len_ena_mask: mask to write the controlq enable bit
+ * @head_mask: mask to read the head value
+ */
+struct libeth_ctlq_reg {
+	void __iomem	*head;
+	void __iomem	*tail;
+	void __iomem	*len;
+	void __iomem	*addr_high;
+	void __iomem	*addr_low;
+	u32		len_mask;
+	u32		len_ena_mask;
+	u32		head_mask;
+};
+
+/**
+ * struct libeth_cp_dma_mem - structure for DMA memory
+ * @va: virtual address
+ * @pa: physical address
+ * @size: memory size
+ */
+struct libeth_cp_dma_mem {
+	void		*va;
+	dma_addr_t	pa;
+	size_t		size;
+};
+
+/**
+ * struct libeth_ctlq_msg - control queue message data
+ * @flags: refer to 'Flags sub-structure' definitions
+ * @opcode: infrastructure message opcode
+ * @data_len: size of the payload
+ * @func_id: queue id for the secondary mailbox queue, 0 for default mailbox
+ * @hw_retval: execution status from the HW
+ * @chnl_opcode: virtchnl message opcode
+ * @chnl_retval: virtchnl return value
+ * @param0: indirect message raw parameter0
+ * @sw_cookie: used to verify the response of the sent virtchnl message
+ * @virt_flags: virtchnl capability flags
+ * @addr_param: additional parameters in place of the address, given no buffer
+ * @recv_mem: virtual address and size of the buffer that contains
+ *	      the indirect response
+ * @send_mem: physical and virtual address of the DMA buffer,
+ *	      used for sending
+ */
+struct libeth_ctlq_msg {
+	u16			flags;
+	u16			opcode;
+	u16			data_len;
+	union {
+		u16		func_id;
+		u16		hw_retval;
+	};
+	u32			chnl_opcode;
+	u32			chnl_retval;
+	u32			param0;
+	u16			sw_cookie;
+	u16			virt_flags;
+	u64			addr_param;
+	union {
+		struct kvec	recv_mem;
+		struct	libeth_cp_dma_mem send_mem;
+	};
+};
+
+/**
+ * struct libeth_ctlq_create_info - control queue create information
+ * @type: control queue type (Rx or Tx)
+ * @id: queue offset passed as input, -1 for default mailbox
+ * @reg: registers accessed by control queue
+ * @len: controlq length
+ */
+struct libeth_ctlq_create_info {
+	enum virtchnl2_queue_type	type;
+	int				id;
+	struct libeth_ctlq_reg		reg;
+	u16				len;
+};
+
+/**
+ * struct libeth_ctlq_info - control queue information
+ * @list: used to add a controlq to the list of queues in libeth_ctlq_ctx
+ * @type: control queue type
+ * @qid: queue identifier
+ * @lock: control queue lock
+ * @ring_mem: descrtiptor ring DMA memory
+ * @descs: array of descrtiptors
+ * @rx_fqes: array of controlq Rx buffers
+ * @tx_msg: Tx messages sent to hardware
+ * @reg: registers used by control queue
+ * @dev: device that owns this control queue
+ * @pp: page pool for controlq Rx buffers
+ * @truesize: size to allocate per buffer
+ * @next_to_use: next available slot to send buffer
+ * @next_to_clean: next descrtiptor to be cleaned
+ * @next_to_post: next available slot to post buffers to after receive
+ * @ring_len: length of the descriptor ring
+ */
+struct libeth_ctlq_info {
+	struct list_head		list;
+	enum virtchnl2_queue_type	type;
+	int				qid;
+	spinlock_t			lock;	/* for concurrent processing */
+	struct libeth_cp_dma_mem	ring_mem;
+	struct libeth_ctlq_desc		*descs;
+	union {
+		struct libeth_fqe		*rx_fqes;
+		struct libeth_ctlq_msg		**tx_msg;
+	};
+	struct libeth_ctlq_reg		reg;
+	struct device			*dev;
+	struct page_pool		*pp;
+	u32				truesize;
+	u32				next_to_clean;
+	union {
+		u32			next_to_use;
+		u32			next_to_post;
+	};
+	u32				ring_len;
+};
+
+#define LIBETH_CTLQ_MBX_ATQ_LEN			GENMASK(9, 0)
+
+/* Flags sub-structure
+ * |0  |1  |2  |3  |4  |5  |6  |7  |8  |9  |10 |11 |12 |13 |14 |15 |
+ * |DD |CMP|ERR|  * RSV *  |FTYPE  | *RSV* |RD |VFC|BUF|  HOST_ID  |
+ */
+ /* libeth controlq descriptor qword0 details */
+#define LIBETH_CTLQ_DESC_FLAG_DD		BIT(0)
+#define LIBETH_CTLQ_DESC_FLAG_CMP		BIT(1)
+#define LIBETH_CTLQ_DESC_FLAG_ERR		BIT(2)
+#define LIBETH_CTLQ_DESC_FLAG_FTYPE_VM		BIT(6)
+#define LIBETH_CTLQ_DESC_FLAG_FTYPE_PF		BIT(7)
+#define LIBETH_CTLQ_DESC_FLAG_FTYPE		GENMASK(7, 6)
+#define LIBETH_CTLQ_DESC_FLAG_RD		BIT(10)
+#define LIBETH_CTLQ_DESC_FLAG_VFC		BIT(11)
+#define LIBETH_CTLQ_DESC_FLAG_BUF		BIT(12)
+#define LIBETH_CTLQ_DESC_FLAG_HOST_ID		GENMASK(15, 13)
+
+#define LIBETH_CTLQ_DESC_FLAGS			GENMASK(15, 0)
+#define LIBETH_CTLQ_DESC_INFRA_OPCODE		GENMASK_ULL(31, 16)
+#define LIBETH_CTLQ_DESC_DATA_LEN		GENMASK_ULL(47, 32)
+#define LIBETH_CTLQ_DESC_HW_RETVAL		GENMASK_ULL(63, 48)
+
+#define LIBETH_CTLQ_DESC_PFID_VFID		GENMASK_ULL(63, 48)
+
+/* libeth controlq descriptor qword1 details */
+#define LIBETH_CTLQ_DESC_VIRTCHNL_OPCODE	GENMASK(27, 0)
+#define LIBETH_CTLQ_DESC_VIRTCHNL_DESC_TYPE	GENMASK_ULL(31, 28)
+#define LIBETH_CTLQ_DESC_VIRTCHNL_MSG_RET_VAL	GENMASK_ULL(63, 32)
+
+/* libeth controlq descriptor qword2 details */
+#define LIBETH_CTLQ_DESC_MSG_PARAM0		GENMASK_ULL(31, 0)
+#define LIBETH_CTLQ_DESC_SW_COOKIE		GENMASK_ULL(47, 32)
+#define LIBETH_CTLQ_DESC_VIRTCHNL_FLAGS		GENMASK_ULL(63, 48)
+
+/* libeth controlq descriptor qword3 details */
+#define LIBETH_CTLQ_DESC_DATA_ADDR_HIGH		GENMASK_ULL(31, 0)
+#define LIBETH_CTLQ_DESC_DATA_ADDR_LOW		GENMASK_ULL(63, 32)
+
+/**
+ * struct libeth_ctlq_desc - control queue descriptor format
+ * @qword0: flags, message opcode, data length etc
+ * @qword1: virtchnl opcode, descriptor type and return value
+ * @qword2: indirect message parameters
+ * @qword3: indirect message buffer address
+ */
+struct libeth_ctlq_desc {
+	__le64			qword0;
+	__le64			qword1;
+	__le64			qword2;
+	__le64			qword3;
+};
+
+/**
+ * libeth_ctlq_release_rx_buf - Release Rx buffer for a specific control queue
+ * @ctlq: specific control queue that requires to access the Rx DMA pool
+ * @rx_buf: Rx buffer to be freed
+ *
+ * Driver uses this function to post back the Rx buffer after the usage.
+ */
+static inline void libeth_ctlq_release_rx_buf(struct libeth_ctlq_info *ctlq,
+					      struct kvec *rx_buf)
+{
+	struct page *page;
+
+	if (!rx_buf->iov_base)
+		return;
+
+	page = virt_to_page(rx_buf->iov_base);
+	page_pool_put_full_page(page->pp, page, false);
+}
+
+int libeth_ctlq_init(struct libeth_ctlq_ctx *ctx,
+		     const struct libeth_ctlq_create_info *qinfo,  u32 numq);
+void libeth_ctlq_deinit(struct libeth_ctlq_ctx *ctx);
+
+struct libeth_ctlq_info *libeth_find_ctlq(struct libeth_ctlq_ctx *ctx,
+					  enum virtchnl2_queue_type type,
+					  int id);
+
+int libeth_ctlq_send(struct libeth_ctlq_info *ctlq,
+		     struct libeth_ctlq_msg *q_msg, u32 num_q_msg);
+u32 libeth_ctlq_recv(struct libeth_ctlq_info *ctlq, struct libeth_ctlq_msg *msg,
+		     u32 num_q_msg);
+
+int libeth_ctlq_post_rx_buffs(struct libeth_ctlq_info *ctlq);
+
+#endif /* __LIBETH_CONTROLQ_H */
-- 
2.47.0


