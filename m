Return-Path: <linux-doc+bounces-42592-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82720A80A83
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 15:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9A68C40E3
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 12:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696B527CCF2;
	Tue,  8 Apr 2025 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5pMkpES"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC97F26F47B;
	Tue,  8 Apr 2025 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116540; cv=none; b=iqLc99ak10bR2nUc1jqyv5UV7YPEY5+++Fj1wb+SnUNnQGo4/aP5WYmL1KYxgY32uTRtD4w+bfROsjA/8QmQCpFh3uZ5y42UU8CA7MycmgEZ19eb9QZapfVcT3KyGI31tXpLoxxqWbpt5Gqw8jhJMva2fC94rjCcb1ayW9cFxL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116540; c=relaxed/simple;
	bh=oAL7hIpjCbsfeS0Oi/3+yW7GJN8u6Bd8YF5MMSBcqDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Si0yiwydh8AMnpiYIasN+E+MYG2URNImuqITtf5ZDFDVAatg41n5BZMRghoFju8arGpS0qV2PnD0gH52LH7CTcPZFumDTNWMnr2yFQDgikuieHbrSUJMBfXb++7FQlUKOF9tf0VYMzG0nWYab1C1ryykz7k0l//IiuwKPM7SUcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5pMkpES; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744116538; x=1775652538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oAL7hIpjCbsfeS0Oi/3+yW7GJN8u6Bd8YF5MMSBcqDM=;
  b=d5pMkpESqeVxhMKiiKuhMHHVIFZmY1aMIeLZTBUhOtARR85qJb5UbcLi
   q5VhuGwgpSVFSaanGKTrccf4tIlNL/VrGZGYopURxdFA7/QO5wx+GNo5D
   J29yLTJ4GRAkdnvffKcaRez0q7nGOwQkC6Ath3Ri3x0nWKOtEFOfD80XT
   R8QdK8naV0oZCJrS62YGRyhwoU900wGlis1Wh89/3iSmmbsz5HAKy+/WJ
   hfgAv4AyByrII+hkrvJCpGSE51YpElq8cCZNETltFkbQ+etUUnrrrF58F
   ujcYiwFMhz0hL75ug3i1+xAOVLXfal6fvsnrk5NfO33mj1CPfdr5xU4fV
   A==;
X-CSE-ConnectionGUID: WqJCDrC1QkmkkLB1TvtEYg==
X-CSE-MsgGUID: UVcxATuhS1WSIsJsti/MQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56185000"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56185000"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:48:56 -0700
X-CSE-ConnectionGUID: +fLq/mn6QXmasDAGklg/gw==
X-CSE-MsgGUID: SQo+aJWmT3q+FJsv2YHRhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133130804"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2025 05:48:50 -0700
Received: from mglak.igk.intel.com (mglak.igk.intel.com [10.237.112.146])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 51BA03431A;
	Tue,  8 Apr 2025 13:48:47 +0100 (IST)
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
	"Singhai, Anjali" <anjali.singhai@intel.com>
Subject: [PATCH iwl-next 13/14] ixd: add the core initialization
Date: Tue,  8 Apr 2025 14:47:59 +0200
Message-ID: <20250408124816.11584-14-larysa.zaremba@intel.com>
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

As the mailbox is setup, initialize the core. This makes use of the
send and receive mailbox message framework for virtchnl communication
between the driver and device Control Plane (CP).

To start with, driver confirms the virtchnl version with the CP. Once
that is done, it requests and gets the required capabilities and
resources needed such as max vectors, queues, vports etc.

Use a unified way of handling the virtchnl messages, where a single
function handles all related memory management and the caller only provides
the callbacks to fill the send buffer and to handle the response.

Place generic control queue message handling separately to facilitate the
addition of protocols other than virtchannel in the future.

Co-developed-by: Amritha Nambiar <amritha.nambiar@intel.com>
Signed-off-by: Amritha Nambiar <amritha.nambiar@intel.com>
Reviewed-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Signed-off-by: Larysa Zaremba <larysa.zaremba@intel.com>
---
 drivers/net/ethernet/intel/ixd/Makefile       |   2 +
 drivers/net/ethernet/intel/ixd/ixd.h          |  10 +
 drivers/net/ethernet/intel/ixd/ixd_ctlq.c     | 148 +++++++++++++++
 drivers/net/ethernet/intel/ixd/ixd_ctlq.h     |  33 ++++
 drivers/net/ethernet/intel/ixd/ixd_lib.c      |  25 ++-
 drivers/net/ethernet/intel/ixd/ixd_main.c     |   3 +
 drivers/net/ethernet/intel/ixd/ixd_virtchnl.c | 178 ++++++++++++++++++
 drivers/net/ethernet/intel/ixd/ixd_virtchnl.h |  12 ++
 8 files changed, 410 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/intel/ixd/ixd_ctlq.c
 create mode 100644 drivers/net/ethernet/intel/ixd/ixd_ctlq.h
 create mode 100644 drivers/net/ethernet/intel/ixd/ixd_virtchnl.c
 create mode 100644 drivers/net/ethernet/intel/ixd/ixd_virtchnl.h

diff --git a/drivers/net/ethernet/intel/ixd/Makefile b/drivers/net/ethernet/intel/ixd/Makefile
index 164b2c86952f..90abf231fb16 100644
--- a/drivers/net/ethernet/intel/ixd/Makefile
+++ b/drivers/net/ethernet/intel/ixd/Makefile
@@ -6,5 +6,7 @@
 obj-$(CONFIG_IXD) += ixd.o
 
 ixd-y := ixd_main.o
+ixd-y += ixd_ctlq.o
 ixd-y += ixd_dev.o
 ixd-y += ixd_lib.o
+ixd-y += ixd_virtchnl.o
diff --git a/drivers/net/ethernet/intel/ixd/ixd.h b/drivers/net/ethernet/intel/ixd/ixd.h
index 7efa8db8c5ba..ca08b5ead3b5 100644
--- a/drivers/net/ethernet/intel/ixd/ixd.h
+++ b/drivers/net/ethernet/intel/ixd/ixd.h
@@ -10,19 +10,29 @@
  * struct ixd_adapter - Data structure representing a CPF
  * @cp_ctx: Control plane communication context
  * @init_task: Delayed initialization after reset
+ * @mbx_task: Control queue Rx handling
  * @xnm: virtchnl transaction manager
  * @asq: Send control queue info
  * @arq: Receive control queue info
+ * @vc_ver: Negotiated virtchnl version
+ * @caps: Negotiated virtchnl capabilities
  */
 struct ixd_adapter {
 	struct libeth_ctlq_ctx cp_ctx;
 	struct {
 		struct delayed_work init_work;
 		u8 reset_retries;
+		u8 vc_retries;
 	} init_task;
+	struct delayed_work mbx_task;
 	struct libeth_ctlq_xn_manager *xnm;
 	struct libeth_ctlq_info *asq;
 	struct libeth_ctlq_info *arq;
+	struct {
+		u32 major;
+		u32 minor;
+	} vc_ver;
+	struct virtchnl2_get_capabilities caps;
 };
 
 /**
diff --git a/drivers/net/ethernet/intel/ixd/ixd_ctlq.c b/drivers/net/ethernet/intel/ixd/ixd_ctlq.c
new file mode 100644
index 000000000000..d17987c71eed
--- /dev/null
+++ b/drivers/net/ethernet/intel/ixd/ixd_ctlq.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2025 Intel Corporation */
+
+#include "ixd.h"
+#include "ixd_ctlq.h"
+#include "ixd_virtchnl.h"
+
+/**
+ * ixd_ctlq_clean_sq - Clean the send control queue after sending the message
+ * @adapter: The adapter that sent the messages
+ * @num_sent: Number of sent messages to be released
+ *
+ * Free the libeth send resources after sending the message and handling
+ * the response.
+ */
+static void ixd_ctlq_clean_sq(struct ixd_adapter *adapter, u16 num_sent)
+{
+	if (!num_sent)
+		return;
+
+	struct libeth_ctlq_xn_clean_params params = {
+		.ctlq = adapter->asq,
+		.ctx = &adapter->cp_ctx,
+		.num_msgs = num_sent,
+		.rel_tx_buf = kfree,
+	};
+
+	libeth_ctlq_xn_send_clean(&params);
+}
+
+/**
+ * ixd_ctlq_init_sparams - Initialize control queue send parameters
+ * @adapter: The adapter with initialized mailbox
+ * @sparams: Parameters to initialize
+ * @msg_buf: DMA-mappable pointer to the message being sent
+ * @msg_size: Message size
+ */
+static void ixd_ctlq_init_sparams(struct ixd_adapter *adapter,
+				  struct libeth_ctlq_xn_send_params *sparams,
+				  void *msg_buf, size_t msg_size)
+{
+	*sparams = (struct libeth_ctlq_xn_send_params) {
+		.rel_tx_buf = kfree,
+		.xnm = adapter->xnm,
+		.ctlq = adapter->asq,
+		.timeout_ms = IXD_CTLQ_TIMEOUT,
+		.send_buf = (struct kvec) {
+			.iov_base = msg_buf,
+			.iov_len = msg_size,
+		},
+	};
+}
+
+/**
+ * ixd_ctlq_do_req - Perform a standard virtchnl request
+ * @adapter: The adapter with initialized mailbox
+ * @req: virtchnl request description
+ *
+ * Return: %0 if a message was sent and received a response
+ * that was successfully handled by the custom callback,
+ * negative error otherwise.
+ */
+int ixd_ctlq_do_req(struct ixd_adapter *adapter, const struct ixd_ctlq_req *req)
+{
+	struct libeth_ctlq_xn_send_params send_params = {};
+	u8 onstack_send_buff[LIBETH_CP_TX_COPYBREAK];
+	struct kvec *recv_mem;
+	void *send_buff;
+	int err;
+
+	send_buff = libeth_cp_can_send_onstack(req->send_size) ?
+		    &onstack_send_buff : kzalloc(req->send_size, GFP_KERNEL);
+	if (!send_buff)
+		return -ENOMEM;
+
+	ixd_ctlq_init_sparams(adapter, &send_params, send_buff,
+			      req->send_size);
+
+	send_params.chnl_opcode = req->opcode;
+
+	if (req->send_buff_init)
+		req->send_buff_init(adapter, send_buff, req->ctx);
+
+	err = libeth_ctlq_xn_send(&send_params);
+	if (err)
+		return err;
+
+	recv_mem = &send_params.recv_mem;
+	if (req->recv_process)
+		err = req->recv_process(adapter, recv_mem->iov_base,
+					recv_mem->iov_len, req->ctx);
+
+	ixd_ctlq_clean_sq(adapter, 1);
+	libeth_ctlq_release_rx_buf(adapter->arq, recv_mem);
+
+	return err;
+}
+
+/**
+ * ixd_ctlq_handle_msg - Default control queue message handler
+ * @ctx: Control plane communication context
+ * @msg: Message received
+ */
+static void ixd_ctlq_handle_msg(struct libeth_ctlq_ctx *ctx,
+				struct libeth_ctlq_msg *msg)
+{
+	struct ixd_adapter *adapter = pci_get_drvdata(ctx->mmio_info.pdev);
+
+	if (ixd_vc_can_handle_msg(msg))
+		ixd_vc_recv_event_msg(adapter, msg);
+	else
+		dev_dbg_ratelimited(ixd_to_dev(adapter),
+				    "Received an unsupported opcode 0x%x from the CP\n",
+				    msg->chnl_opcode);
+
+	libeth_ctlq_release_rx_buf(adapter->arq, &msg->recv_mem);
+}
+
+/**
+ * ixd_ctlq_recv_mb_msg - Receive a potential message over mailbox periodically
+ * @adapter: The adapter with initialized mailbox
+ */
+static void ixd_ctlq_recv_mb_msg(struct ixd_adapter *adapter)
+{
+	struct libeth_ctlq_xn_recv_params xn_params = {
+		.xnm = adapter->xnm,
+		.ctlq = adapter->arq,
+		.ctlq_msg_handler = ixd_ctlq_handle_msg,
+	};
+
+	libeth_ctlq_xn_recv(&xn_params);
+}
+
+/**
+ * ixd_ctlq_rx_task - Periodically check for mailbox responses and events
+ * @work: work handle
+ */
+void ixd_ctlq_rx_task(struct work_struct *work)
+{
+	struct ixd_adapter *adapter;
+
+	adapter = container_of(work, struct ixd_adapter, mbx_task.work);
+
+	queue_delayed_work(system_unbound_wq, &adapter->mbx_task,
+			   msecs_to_jiffies(300));
+
+	ixd_ctlq_recv_mb_msg(adapter);
+}
diff --git a/drivers/net/ethernet/intel/ixd/ixd_ctlq.h b/drivers/net/ethernet/intel/ixd/ixd_ctlq.h
new file mode 100644
index 000000000000..f450a3a0828f
--- /dev/null
+++ b/drivers/net/ethernet/intel/ixd/ixd_ctlq.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Intel Corporation */
+
+#ifndef _IXD_CTLQ_H_
+#define _IXD_CTLQ_H_
+
+#include "linux/intel/virtchnl2.h"
+
+#define IXD_CTLQ_TIMEOUT 2000
+
+/**
+ * struct ixd_ctlq_req - Standard virtchnl request description
+ * @opcode: protocol opcode, only virtchnl2 is needed for now
+ * @send_size: required length of the send buffer
+ * @send_buff_init: function to initialize the allocated send buffer
+ * @recv_process: function to handle the CP response
+ * @ctx: additional context for callbacks
+ */
+struct ixd_ctlq_req {
+	enum virtchnl2_op opcode;
+	size_t send_size;
+	void (*send_buff_init)(struct ixd_adapter *adapter, void *send_buff,
+			       void *ctx);
+	int (*recv_process)(struct ixd_adapter *adapter, void *recv_buff,
+			    size_t recv_size, void *ctx);
+	void *ctx;
+};
+
+int ixd_ctlq_do_req(struct ixd_adapter *adapter,
+		    const struct ixd_ctlq_req *req);
+void ixd_ctlq_rx_task(struct work_struct *work);
+
+#endif /* _IXD_CTLQ_H_ */
diff --git a/drivers/net/ethernet/intel/ixd/ixd_lib.c b/drivers/net/ethernet/intel/ixd/ixd_lib.c
index 42ba7e7da35c..201545a74cd8 100644
--- a/drivers/net/ethernet/intel/ixd/ixd_lib.c
+++ b/drivers/net/ethernet/intel/ixd/ixd_lib.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2025 Intel Corporation */
 
 #include "ixd.h"
+#include "ixd_virtchnl.h"
 
 #define IXD_DFLT_MBX_Q_LEN 64
 
@@ -94,6 +95,8 @@ int ixd_init_dflt_mbx(struct ixd_adapter *adapter)
 		return -ENOENT;
 	}
 
+	queue_delayed_work(system_unbound_wq, &adapter->mbx_task, 0);
+
 	return 0;
 }
 
@@ -103,6 +106,8 @@ int ixd_init_dflt_mbx(struct ixd_adapter *adapter)
  */
 void ixd_deinit_dflt_mbx(struct ixd_adapter *adapter)
 {
+	cancel_delayed_work_sync(&adapter->mbx_task);
+
 	if (adapter->arq || adapter->asq)
 		libeth_ctlq_xn_deinit(adapter->xnm, &adapter->cp_ctx);
 
@@ -136,8 +141,26 @@ void ixd_init_task(struct work_struct *work)
 
 	adapter->init_task.reset_retries = 0;
 	err = ixd_init_dflt_mbx(adapter);
-	if (err)
+	if (err) {
 		dev_err(ixd_to_dev(adapter),
 			"Failed to initialize the default mailbox: %pe\n",
 			ERR_PTR(err));
+		return;
+	}
+
+	if (!ixd_vc_dev_init(adapter)) {
+		adapter->init_task.vc_retries = 0;
+		return;
+	}
+
+	ixd_deinit_dflt_mbx(adapter);
+	if (++adapter->init_task.vc_retries > 5) {
+		dev_err(ixd_to_dev(adapter),
+			"Failed to establish mailbox communications with the hardware\n");
+		return;
+	}
+
+	ixd_trigger_reset(adapter);
+	queue_delayed_work(system_unbound_wq, &adapter->init_task.init_work,
+			   msecs_to_jiffies(500));
 }
diff --git a/drivers/net/ethernet/intel/ixd/ixd_main.c b/drivers/net/ethernet/intel/ixd/ixd_main.c
index bba6fa2dda57..97679cf4527f 100644
--- a/drivers/net/ethernet/intel/ixd/ixd_main.c
+++ b/drivers/net/ethernet/intel/ixd/ixd_main.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2025 Intel Corporation */
 
 #include "ixd.h"
+#include "ixd_ctlq.h"
 #include "ixd_lan_regs.h"
 
 MODULE_DESCRIPTION("Intel(R) Control Plane Function Device Driver");
@@ -19,6 +20,7 @@ static void ixd_remove(struct pci_dev *pdev)
 
 	/* Do not mix removal with (re)initialization */
 	cancel_delayed_work_sync(&adapter->init_task.init_work);
+
 	/* Leave the device clean on exit */
 	ixd_trigger_reset(adapter);
 	ixd_deinit_dflt_mbx(adapter);
@@ -111,6 +113,7 @@ static int ixd_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	INIT_DELAYED_WORK(&adapter->init_task.init_work,
 			  ixd_init_task);
+	INIT_DELAYED_WORK(&adapter->mbx_task, ixd_ctlq_rx_task);
 
 	ixd_trigger_reset(adapter);
 	queue_delayed_work(system_unbound_wq, &adapter->init_task.init_work,
diff --git a/drivers/net/ethernet/intel/ixd/ixd_virtchnl.c b/drivers/net/ethernet/intel/ixd/ixd_virtchnl.c
new file mode 100644
index 000000000000..a1c2ccf36175
--- /dev/null
+++ b/drivers/net/ethernet/intel/ixd/ixd_virtchnl.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2025 Intel Corporation */
+
+#include "ixd.h"
+#include "ixd_ctlq.h"
+#include "ixd_virtchnl.h"
+
+/**
+ * ixd_vc_recv_event_msg - Handle virtchnl event message
+ * @adapter: The adapter handling the message
+ * @ctlq_msg: Message received
+ */
+void ixd_vc_recv_event_msg(struct ixd_adapter *adapter,
+			   struct libeth_ctlq_msg *ctlq_msg)
+{
+	int payload_size = ctlq_msg->data_len;
+	struct virtchnl2_event *v2e;
+
+	if (payload_size < sizeof(*v2e)) {
+		dev_warn_ratelimited(ixd_to_dev(adapter),
+				     "Failed to receive valid payload for event msg (op 0x%X len %u)\n",
+				     ctlq_msg->chnl_opcode,
+				     payload_size);
+		return;
+	}
+
+	v2e = (struct virtchnl2_event *)ctlq_msg->recv_mem.iov_base;
+
+	dev_dbg(ixd_to_dev(adapter), "Got event 0x%X from the CP\n",
+		le32_to_cpu(v2e->event));
+}
+
+/**
+ * ixd_vc_can_handle_msg - Decide if an event has to be handled by virtchnl code
+ * @ctlq_msg: Message received
+ *
+ * Return: %true if virtchnl code can handle the event, %false otherwise
+ */
+bool ixd_vc_can_handle_msg(struct libeth_ctlq_msg *ctlq_msg)
+{
+	return ctlq_msg->chnl_opcode == VIRTCHNL2_OP_EVENT;
+}
+
+/**
+ * ixd_handle_caps - Handle VIRTCHNL2_OP_GET_CAPS response
+ * @adapter: The adapter for which the capabilities are being updated
+ * @recv_buff: Buffer containing the response
+ * @recv_size: Response buffer size
+ * @ctx: unused
+ *
+ * Return: %0 if the response format is correct and was handled as expected,
+ * negative error otherwise.
+ */
+static int ixd_handle_caps(struct ixd_adapter *adapter, void *recv_buff,
+			   size_t recv_size, void *ctx)
+{
+	if (recv_size < sizeof(adapter->caps))
+		return -EBADMSG;
+
+	adapter->caps = *(typeof(adapter->caps) *)recv_buff;
+
+	return 0;
+}
+
+/**
+ * ixd_req_vc_caps - Request and save device capability
+ * @adapter: The adapter to get the capabilities for
+ *
+ * Return: success or error if sending the get capability message fails
+ */
+static int ixd_req_vc_caps(struct ixd_adapter *adapter)
+{
+	const struct ixd_ctlq_req req = {
+		.opcode = VIRTCHNL2_OP_GET_CAPS,
+		.send_size = sizeof(struct virtchnl2_get_capabilities),
+		.ctx = NULL,
+		.send_buff_init = NULL,
+		.recv_process = ixd_handle_caps,
+	};
+
+	return ixd_ctlq_do_req(adapter, &req);
+}
+
+/**
+ * ixd_get_vc_ver - Get version info from adapter
+ *
+ * Return: filled in virtchannel2 version info, ready for sending
+ */
+static struct virtchnl2_version_info ixd_get_vc_ver(void)
+{
+	return (struct virtchnl2_version_info) {
+		.major = cpu_to_le32(VIRTCHNL2_VERSION_MAJOR_2),
+		.minor = cpu_to_le32(VIRTCHNL2_VERSION_MINOR_0),
+	};
+}
+
+static void ixd_fill_vc_ver(struct ixd_adapter *adapter, void *send_buff,
+			    void *ctx)
+{
+	*(struct virtchnl2_version_info *)send_buff = ixd_get_vc_ver();
+}
+
+/**
+ * ixd_handle_vc_ver - Handle VIRTCHNL2_OP_VERSION response
+ * @adapter: The adapter for which the version is being updated
+ * @recv_buff: Buffer containing the response
+ * @recv_size: Response buffer size
+ * @ctx: Unused
+ *
+ * Return: %0 if the response format is correct and was handled as expected,
+ * negative error otherwise.
+ */
+static int ixd_handle_vc_ver(struct ixd_adapter *adapter, void *recv_buff,
+			     size_t recv_size, void *ctx)
+{
+	struct virtchnl2_version_info need_ver = ixd_get_vc_ver();
+	struct virtchnl2_version_info *recv_ver;
+
+	if (recv_size < sizeof(need_ver))
+		return -EBADMSG;
+
+	recv_ver = recv_buff;
+	if (le32_to_cpu(need_ver.major) > le32_to_cpu(recv_ver->major))
+		return -EOPNOTSUPP;
+
+	adapter->vc_ver.major = le32_to_cpu(recv_ver->major);
+	adapter->vc_ver.minor = le32_to_cpu(recv_ver->minor);
+
+	return 0;
+}
+
+/**
+ * ixd_req_vc_version - Request and save Virtchannel2 version
+ * @adapter: The adapter to get the version for
+ *
+ * Return: success or error if sending fails or the response was not as expected
+ */
+static int ixd_req_vc_version(struct ixd_adapter *adapter)
+{
+	const struct ixd_ctlq_req req = {
+		.opcode = VIRTCHNL2_OP_VERSION,
+		.send_size = sizeof(struct virtchnl2_version_info),
+		.ctx = NULL,
+		.send_buff_init = ixd_fill_vc_ver,
+		.recv_process = ixd_handle_vc_ver,
+	};
+
+	return ixd_ctlq_do_req(adapter, &req);
+}
+
+/**
+ * ixd_vc_dev_init - virtchnl device core initialization
+ * @adapter: device information
+ *
+ * Return: %0 on success or error if any step of the initialization fails
+ */
+int ixd_vc_dev_init(struct ixd_adapter *adapter)
+{
+	int err;
+
+	err = ixd_req_vc_version(adapter);
+	if (err) {
+		dev_warn(ixd_to_dev(adapter),
+			 "Getting virtchnl version failed, error=%pe\n",
+			 ERR_PTR(err));
+		return err;
+	}
+
+	err = ixd_req_vc_caps(adapter);
+	if (err) {
+		dev_warn(ixd_to_dev(adapter),
+			 "Getting virtchnl capabilities failed, error=%pe\n",
+			 ERR_PTR(err));
+		return err;
+	}
+
+	return err;
+}
diff --git a/drivers/net/ethernet/intel/ixd/ixd_virtchnl.h b/drivers/net/ethernet/intel/ixd/ixd_virtchnl.h
new file mode 100644
index 000000000000..65da427e91b7
--- /dev/null
+++ b/drivers/net/ethernet/intel/ixd/ixd_virtchnl.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Intel Corporation */
+
+#ifndef _IXD_VIRTCHNL_H_
+#define _IXD_VIRTCHNL_H_
+
+int ixd_vc_dev_init(struct ixd_adapter *adapter);
+bool ixd_vc_can_handle_msg(struct libeth_ctlq_msg *ctlq_msg);
+void ixd_vc_recv_event_msg(struct ixd_adapter *adapter,
+			   struct libeth_ctlq_msg *ctlq_msg);
+
+#endif /* _IXD_VIRTCHNL_H_ */
-- 
2.47.0


