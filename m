Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A38F6ED874
	for <lists+linux-doc@lfdr.de>; Tue, 25 Apr 2023 01:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbjDXXRD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Apr 2023 19:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbjDXXRB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Apr 2023 19:17:01 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D711F9ED6;
        Mon, 24 Apr 2023 16:16:51 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OMk3EJ001988;
        Mon, 24 Apr 2023 23:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=mSOlbDQYf/1TtSZur3RnsJmeWQMuXZelxQkzTydncJY=;
 b=f5/WClTPpUmJ8AAbPnLI1LmKwfhF8go0X3UhDihUC3QxOcCRpPJ0r4VoUlOY+HKgiuOD
 3at3GPnGNQyMqRdTaKTYTErV4FONdrG5hXhyfbY4zkBtp0cl9IQxU9z5acbZBItdSvl7
 AGp5kH8hHDTSzEvN53l4ADBE8Kk0JhoIcleeqQAZxKUddRnpnX7jNeCJstAtR2yijblT
 vwxY3qfe/azZ0d6GiBNeL32G1NUAURu3cUf26azH5rIC6Mm9JOYMefnlO3eRQwBWPG8y
 p/HfE/TffVOL3rnzjl4YAyLYS72ngjVLQGCbhdALhFeAVE/gfJQ4LubGWS0xW/af73Q4 eA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5tjf16m4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Apr 2023 23:16:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ONGbbH029858
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Apr 2023 23:16:37 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 24 Apr 2023 16:16:36 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
CC:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v12 07/25] gunyah: rsc_mgr: Add resource manager RPC core
Date:   Mon, 24 Apr 2023 16:15:40 -0700
Message-ID: <20230424231558.70911-8-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424231558.70911-1-quic_eberman@quicinc.com>
References: <20230424231558.70911-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sDAqkigpbDhSMrCa05Ap-vmf9XG_CB2z
X-Proofpoint-ORIG-GUID: sDAqkigpbDhSMrCa05Ap-vmf9XG_CB2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240211
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The resource manager is a special virtual machine which is always
running on a Gunyah system. It provides APIs for creating and destroying
VMs, secure memory management, sharing/lending of memory between VMs,
and setup of inter-VM communication. Calls to the resource manager are
made via message queues.

This patch implements the basic probing and RPC mechanism to make those
API calls. Request/response calls can be made with gh_rm_call.
Drivers can also register to notifications pushed by RM via
gh_rm_register_notifier

Specific API calls that resource manager supports will be implemented in
subsequent patches.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/virt/Makefile          |   1 +
 drivers/virt/gunyah/Makefile   |   4 +
 drivers/virt/gunyah/rsc_mgr.c  | 702 +++++++++++++++++++++++++++++++++
 drivers/virt/gunyah/rsc_mgr.h  |  16 +
 include/linux/gunyah_rsc_mgr.h |  21 +
 5 files changed, 744 insertions(+)
 create mode 100644 drivers/virt/gunyah/Makefile
 create mode 100644 drivers/virt/gunyah/rsc_mgr.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr.h
 create mode 100644 include/linux/gunyah_rsc_mgr.h

diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index e9aa6fc96fab..a5817e2d7d71 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-$(CONFIG_EFI_SECRET)	+= coco/efi_secret/
 obj-$(CONFIG_SEV_GUEST)		+= coco/sev-guest/
 obj-$(CONFIG_INTEL_TDX_GUEST)	+= coco/tdx-guest/
+obj-y				+= gunyah/
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
new file mode 100644
index 000000000000..0f5aec834698
--- /dev/null
+++ b/drivers/virt/gunyah/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+gunyah-y += rsc_mgr.o
+obj-$(CONFIG_GUNYAH) += gunyah.o
diff --git a/drivers/virt/gunyah/rsc_mgr.c b/drivers/virt/gunyah/rsc_mgr.c
new file mode 100644
index 000000000000..57a39f35d4c2
--- /dev/null
+++ b/drivers/virt/gunyah/rsc_mgr.c
@@ -0,0 +1,702 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/sched.h>
+#include <linux/gunyah.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/notifier.h>
+#include <linux/workqueue.h>
+#include <linux/completion.h>
+#include <linux/gunyah_rsc_mgr.h>
+#include <linux/platform_device.h>
+
+#include "rsc_mgr.h"
+
+#define RM_RPC_API_VERSION_MASK		GENMASK(3, 0)
+#define RM_RPC_HEADER_WORDS_MASK	GENMASK(7, 4)
+#define RM_RPC_API_VERSION		FIELD_PREP(RM_RPC_API_VERSION_MASK, 1)
+#define RM_RPC_HEADER_WORDS		FIELD_PREP(RM_RPC_HEADER_WORDS_MASK, \
+						(sizeof(struct gh_rm_rpc_hdr) / sizeof(u32)))
+#define RM_RPC_API			(RM_RPC_API_VERSION | RM_RPC_HEADER_WORDS)
+
+#define RM_RPC_TYPE_CONTINUATION	0x0
+#define RM_RPC_TYPE_REQUEST		0x1
+#define RM_RPC_TYPE_REPLY		0x2
+#define RM_RPC_TYPE_NOTIF		0x3
+#define RM_RPC_TYPE_MASK		GENMASK(1, 0)
+
+#define GH_RM_MAX_NUM_FRAGMENTS		62
+#define RM_RPC_FRAGMENTS_MASK		GENMASK(7, 2)
+
+struct gh_rm_rpc_hdr {
+	u8 api;
+	u8 type;
+	__le16 seq;
+	__le32 msg_id;
+} __packed;
+
+struct gh_rm_rpc_reply_hdr {
+	struct gh_rm_rpc_hdr hdr;
+	__le32 err_code; /* GH_RM_ERROR_* */
+} __packed;
+
+#define GH_RM_MAX_MSG_SIZE	(GH_MSGQ_MAX_MSG_SIZE - sizeof(struct gh_rm_rpc_hdr))
+
+/* RM Error codes */
+enum gh_rm_error {
+	GH_RM_ERROR_OK			= 0x0,
+	GH_RM_ERROR_UNIMPLEMENTED	= 0xFFFFFFFF,
+	GH_RM_ERROR_NOMEM		= 0x1,
+	GH_RM_ERROR_NORESOURCE		= 0x2,
+	GH_RM_ERROR_DENIED		= 0x3,
+	GH_RM_ERROR_INVALID		= 0x4,
+	GH_RM_ERROR_BUSY		= 0x5,
+	GH_RM_ERROR_ARGUMENT_INVALID	= 0x6,
+	GH_RM_ERROR_HANDLE_INVALID	= 0x7,
+	GH_RM_ERROR_VALIDATE_FAILED	= 0x8,
+	GH_RM_ERROR_MAP_FAILED		= 0x9,
+	GH_RM_ERROR_MEM_INVALID		= 0xA,
+	GH_RM_ERROR_MEM_INUSE		= 0xB,
+	GH_RM_ERROR_MEM_RELEASED	= 0xC,
+	GH_RM_ERROR_VMID_INVALID	= 0xD,
+	GH_RM_ERROR_LOOKUP_FAILED	= 0xE,
+	GH_RM_ERROR_IRQ_INVALID		= 0xF,
+	GH_RM_ERROR_IRQ_INUSE		= 0x10,
+	GH_RM_ERROR_IRQ_RELEASED	= 0x11,
+};
+
+/**
+ * struct gh_rm_connection - Represents a complete message from resource manager
+ * @payload: Combined payload of all the fragments (msg headers stripped off).
+ * @size: Size of the payload received so far.
+ * @msg_id: Message ID from the header.
+ * @type: RM_RPC_TYPE_REPLY or RM_RPC_TYPE_NOTIF.
+ * @num_fragments: total number of fragments expected to be received.
+ * @fragments_received: fragments received so far.
+ * @reply: Fields used for request/reply sequences
+ * @notification: Fields used for notifiations
+ */
+struct gh_rm_connection {
+	void *payload;
+	size_t size;
+	__le32 msg_id;
+	u8 type;
+
+	u8 num_fragments;
+	u8 fragments_received;
+
+	union {
+		/**
+		 * @ret: Linux return code, there was an error processing connection
+		 * @seq: Sequence ID for the main message.
+		 * @rm_error: For request/reply sequences with standard replies
+		 * @seq_done: Signals caller that the RM reply has been received
+		 */
+		struct {
+			int ret;
+			u16 seq;
+			enum gh_rm_error rm_error;
+			struct completion seq_done;
+		} reply;
+
+		/**
+		 * @rm: Pointer to the RM that launched the connection
+		 * @work: Triggered when all fragments of a notification received
+		 */
+		struct {
+			struct gh_rm *rm;
+			struct work_struct work;
+		} notification;
+	};
+};
+
+/**
+ * struct gh_rm - private data for communicating w/Gunyah resource manager
+ * @dev: pointer to device
+ * @tx_ghrsc: message queue resource to TX to RM
+ * @rx_ghrsc: message queue resource to RX from RM
+ * @msgq: mailbox instance of TX/RX resources above
+ * @msgq_client: mailbox client of above msgq
+ * @active_rx_connection: ongoing gh_rm_connection for which we're receiving fragments
+ * @last_tx_ret: return value of last mailbox tx
+ * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
+ * @next_seq: next ID to allocate (for xa_alloc_cyclic)
+ * @cache: cache for allocating Tx messages
+ * @send_lock: synchronization to allow only one request to be sent at a time
+ * @nh: notifier chain for clients interested in RM notification messages
+ */
+struct gh_rm {
+	struct device *dev;
+	struct gh_resource tx_ghrsc;
+	struct gh_resource rx_ghrsc;
+	struct gh_msgq msgq;
+	struct mbox_client msgq_client;
+	struct gh_rm_connection *active_rx_connection;
+	int last_tx_ret;
+
+	struct xarray call_xarray;
+	u32 next_seq;
+
+	struct kmem_cache *cache;
+	struct mutex send_lock;
+	struct blocking_notifier_head nh;
+};
+
+/**
+ * gh_rm_remap_error() - Remap Gunyah resource manager errors into a Linux error code
+ * @rm_error: "Standard" return value from Gunyah resource manager
+ */
+static inline int gh_rm_remap_error(enum gh_rm_error rm_error)
+{
+	switch (rm_error) {
+	case GH_RM_ERROR_OK:
+		return 0;
+	case GH_RM_ERROR_UNIMPLEMENTED:
+		return -EOPNOTSUPP;
+	case GH_RM_ERROR_NOMEM:
+		return -ENOMEM;
+	case GH_RM_ERROR_NORESOURCE:
+		return -ENODEV;
+	case GH_RM_ERROR_DENIED:
+		return -EPERM;
+	case GH_RM_ERROR_BUSY:
+		return -EBUSY;
+	case GH_RM_ERROR_INVALID:
+	case GH_RM_ERROR_ARGUMENT_INVALID:
+	case GH_RM_ERROR_HANDLE_INVALID:
+	case GH_RM_ERROR_VALIDATE_FAILED:
+	case GH_RM_ERROR_MAP_FAILED:
+	case GH_RM_ERROR_MEM_INVALID:
+	case GH_RM_ERROR_MEM_INUSE:
+	case GH_RM_ERROR_MEM_RELEASED:
+	case GH_RM_ERROR_VMID_INVALID:
+	case GH_RM_ERROR_LOOKUP_FAILED:
+	case GH_RM_ERROR_IRQ_INVALID:
+	case GH_RM_ERROR_IRQ_INUSE:
+	case GH_RM_ERROR_IRQ_RELEASED:
+		return -EINVAL;
+	default:
+		return -EBADMSG;
+	}
+}
+
+static int gh_rm_init_connection_payload(struct gh_rm_connection *connection, void *msg,
+					size_t hdr_size, size_t msg_size)
+{
+	size_t max_buf_size, payload_size;
+	struct gh_rm_rpc_hdr *hdr = msg;
+
+	if (msg_size < hdr_size)
+		return -EINVAL;
+
+	payload_size = msg_size - hdr_size;
+
+	connection->num_fragments = FIELD_GET(RM_RPC_FRAGMENTS_MASK, hdr->type);
+	connection->fragments_received = 0;
+
+	/* There's not going to be any payload, no need to allocate buffer. */
+	if (!payload_size && !connection->num_fragments)
+		return 0;
+
+	if (connection->num_fragments > GH_RM_MAX_NUM_FRAGMENTS)
+		return -EINVAL;
+
+	max_buf_size = payload_size + (connection->num_fragments * GH_RM_MAX_MSG_SIZE);
+
+	connection->payload = kzalloc(max_buf_size, GFP_KERNEL);
+	if (!connection->payload)
+		return -ENOMEM;
+
+	memcpy(connection->payload, msg + hdr_size, payload_size);
+	connection->size = payload_size;
+	return 0;
+}
+
+static void gh_rm_abort_connection(struct gh_rm *rm)
+{
+	switch (rm->active_rx_connection->type) {
+	case RM_RPC_TYPE_REPLY:
+		rm->active_rx_connection->reply.ret = -EIO;
+		complete(&rm->active_rx_connection->reply.seq_done);
+		break;
+	case RM_RPC_TYPE_NOTIF:
+		fallthrough;
+	default:
+		kfree(rm->active_rx_connection->payload);
+		kfree(rm->active_rx_connection);
+	}
+
+	rm->active_rx_connection = NULL;
+}
+
+static void gh_rm_notif_work(struct work_struct *work)
+{
+	struct gh_rm_connection *connection = container_of(work, struct gh_rm_connection,
+								notification.work);
+	struct gh_rm *rm = connection->notification.rm;
+
+	blocking_notifier_call_chain(&rm->nh, connection->msg_id, connection->payload);
+
+	put_device(rm->dev);
+	kfree(connection->payload);
+	kfree(connection);
+}
+
+static void gh_rm_process_notif(struct gh_rm *rm, void *msg, size_t msg_size)
+{
+	struct gh_rm_connection *connection;
+	struct gh_rm_rpc_hdr *hdr = msg;
+	int ret;
+
+	if (rm->active_rx_connection)
+		gh_rm_abort_connection(rm);
+
+	connection = kzalloc(sizeof(*connection), GFP_KERNEL);
+	if (!connection)
+		return;
+
+	connection->type = RM_RPC_TYPE_NOTIF;
+	connection->msg_id = hdr->msg_id;
+
+	get_device(rm->dev);
+	connection->notification.rm = rm;
+	INIT_WORK(&connection->notification.work, gh_rm_notif_work);
+
+	ret = gh_rm_init_connection_payload(connection, msg, sizeof(*hdr), msg_size);
+	if (ret) {
+		dev_err(rm->dev, "Failed to initialize connection for notification: %d\n", ret);
+		put_device(rm->dev);
+		kfree(connection);
+		return;
+	}
+
+	rm->active_rx_connection = connection;
+}
+
+static void gh_rm_process_rply(struct gh_rm *rm, void *msg, size_t msg_size)
+{
+	struct gh_rm_rpc_reply_hdr *reply_hdr = msg;
+	struct gh_rm_connection *connection;
+	u16 seq_id;
+
+	seq_id = le16_to_cpu(reply_hdr->hdr.seq);
+	connection = xa_load(&rm->call_xarray, seq_id);
+
+	if (!connection || connection->msg_id != reply_hdr->hdr.msg_id)
+		return;
+
+	if (rm->active_rx_connection)
+		gh_rm_abort_connection(rm);
+
+	if (gh_rm_init_connection_payload(connection, msg, sizeof(*reply_hdr), msg_size)) {
+		dev_err(rm->dev, "Failed to alloc connection buffer for sequence %d\n", seq_id);
+		/* Send connection complete and error the client. */
+		connection->reply.ret = -ENOMEM;
+		complete(&connection->reply.seq_done);
+		return;
+	}
+
+	connection->reply.rm_error = le32_to_cpu(reply_hdr->err_code);
+	rm->active_rx_connection = connection;
+}
+
+static void gh_rm_process_cont(struct gh_rm *rm, struct gh_rm_connection *connection,
+				void *msg, size_t msg_size)
+{
+	struct gh_rm_rpc_hdr *hdr = msg;
+	size_t payload_size = msg_size - sizeof(*hdr);
+
+	if (!rm->active_rx_connection)
+		return;
+
+	/*
+	 * hdr->fragments and hdr->msg_id preserves the value from first reply
+	 * or notif message. To detect mishandling, check it's still intact.
+	 */
+	if (connection->msg_id != hdr->msg_id ||
+		connection->num_fragments != FIELD_GET(RM_RPC_FRAGMENTS_MASK, hdr->type)) {
+		gh_rm_abort_connection(rm);
+		return;
+	}
+
+	memcpy(connection->payload + connection->size, msg + sizeof(*hdr), payload_size);
+	connection->size += payload_size;
+	connection->fragments_received++;
+}
+
+static void gh_rm_try_complete_connection(struct gh_rm *rm)
+{
+	struct gh_rm_connection *connection = rm->active_rx_connection;
+
+	if (!connection || connection->fragments_received != connection->num_fragments)
+		return;
+
+	switch (connection->type) {
+	case RM_RPC_TYPE_REPLY:
+		complete(&connection->reply.seq_done);
+		break;
+	case RM_RPC_TYPE_NOTIF:
+		schedule_work(&connection->notification.work);
+		break;
+	default:
+		dev_err_ratelimited(rm->dev, "Invalid message type (%u) received\n",
+					connection->type);
+		gh_rm_abort_connection(rm);
+		break;
+	}
+
+	rm->active_rx_connection = NULL;
+}
+
+static void gh_rm_msgq_rx_data(struct mbox_client *cl, void *mssg)
+{
+	struct gh_rm *rm = container_of(cl, struct gh_rm, msgq_client);
+	struct gh_msgq_rx_data *rx_data = mssg;
+	size_t msg_size = rx_data->length;
+	void *msg = rx_data->data;
+	struct gh_rm_rpc_hdr *hdr;
+
+	if (msg_size < sizeof(*hdr) || msg_size > GH_MSGQ_MAX_MSG_SIZE)
+		return;
+
+	hdr = msg;
+	if (hdr->api != RM_RPC_API) {
+		dev_err(rm->dev, "Unknown RM RPC API version: %x\n", hdr->api);
+		return;
+	}
+
+	switch (FIELD_GET(RM_RPC_TYPE_MASK, hdr->type)) {
+	case RM_RPC_TYPE_NOTIF:
+		gh_rm_process_notif(rm, msg, msg_size);
+		break;
+	case RM_RPC_TYPE_REPLY:
+		gh_rm_process_rply(rm, msg, msg_size);
+		break;
+	case RM_RPC_TYPE_CONTINUATION:
+		gh_rm_process_cont(rm, rm->active_rx_connection, msg, msg_size);
+		break;
+	default:
+		dev_err(rm->dev, "Invalid message type (%lu) received\n",
+			FIELD_GET(RM_RPC_TYPE_MASK, hdr->type));
+		return;
+	}
+
+	gh_rm_try_complete_connection(rm);
+}
+
+static void gh_rm_msgq_tx_done(struct mbox_client *cl, void *mssg, int r)
+{
+	struct gh_rm *rm = container_of(cl, struct gh_rm, msgq_client);
+
+	kmem_cache_free(rm->cache, mssg);
+	rm->last_tx_ret = r;
+}
+
+static int gh_rm_send_request(struct gh_rm *rm, u32 message_id,
+			      const void *req_buf, size_t req_buf_size,
+			      struct gh_rm_connection *connection)
+{
+	size_t buf_size_remaining = req_buf_size;
+	const void *req_buf_curr = req_buf;
+	struct gh_msgq_tx_data *msg;
+	struct gh_rm_rpc_hdr *hdr, hdr_template;
+	u32 cont_fragments = 0;
+	size_t payload_size;
+	void *payload;
+	int ret;
+
+	if (req_buf_size > GH_RM_MAX_NUM_FRAGMENTS * GH_RM_MAX_MSG_SIZE) {
+		dev_warn(rm->dev, "Limit (%lu bytes) exceeded for the maximum message size: %lu\n",
+			GH_RM_MAX_NUM_FRAGMENTS * GH_RM_MAX_MSG_SIZE, req_buf_size);
+		dump_stack();
+		return -E2BIG;
+	}
+
+	if (req_buf_size)
+		cont_fragments = (req_buf_size - 1) / GH_RM_MAX_MSG_SIZE;
+
+	hdr_template.api = RM_RPC_API;
+	hdr_template.type = FIELD_PREP(RM_RPC_TYPE_MASK, RM_RPC_TYPE_REQUEST) |
+				FIELD_PREP(RM_RPC_FRAGMENTS_MASK, cont_fragments);
+	hdr_template.seq = cpu_to_le16(connection->reply.seq);
+	hdr_template.msg_id = cpu_to_le32(message_id);
+
+	ret = mutex_lock_interruptible(&rm->send_lock);
+	if (ret)
+		return ret;
+
+	do {
+		msg = kmem_cache_zalloc(rm->cache, GFP_KERNEL);
+		if (!msg) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		/* Fill header */
+		hdr = (struct gh_rm_rpc_hdr *)&msg->data[0];
+		*hdr = hdr_template;
+
+		/* Copy payload */
+		payload = &msg->data[0] + sizeof(*hdr);
+		payload_size = min(buf_size_remaining, GH_RM_MAX_MSG_SIZE);
+		memcpy(payload, req_buf_curr, payload_size);
+		req_buf_curr += payload_size;
+		buf_size_remaining -= payload_size;
+
+		/* Force the last fragment to immediately alert the receiver */
+		msg->push = !buf_size_remaining;
+		msg->length = sizeof(*hdr) + payload_size;
+
+		ret = mbox_send_message(gh_msgq_chan(&rm->msgq), msg);
+		if (ret < 0) {
+			kmem_cache_free(rm->cache, msg);
+			break;
+		}
+
+		if (rm->last_tx_ret) {
+			ret = rm->last_tx_ret;
+			break;
+		}
+
+		hdr_template.type = FIELD_PREP(RM_RPC_TYPE_MASK, RM_RPC_TYPE_CONTINUATION) |
+					FIELD_PREP(RM_RPC_FRAGMENTS_MASK, cont_fragments);
+	} while (buf_size_remaining);
+
+out:
+	mutex_unlock(&rm->send_lock);
+	return ret < 0 ? ret : 0;
+}
+
+/**
+ * gh_rm_call: Achieve request-response type communication with RPC
+ * @rm: Pointer to Gunyah resource manager internal data
+ * @message_id: The RM RPC message-id
+ * @req_buf: Request buffer that contains the payload
+ * @req_buf_size: Total size of the payload
+ * @resp_buf: Pointer to a response buffer
+ * @resp_buf_size: Size of the response buffer
+ *
+ * Make a request to the Resource Manager and wait for reply back. For a successful
+ * response, the function returns the payload. The size of the payload is set in
+ * resp_buf_size. The resp_buf must be freed by the caller when 0 is returned
+ * and resp_buf_size != 0.
+ *
+ * req_buf should be not NULL for req_buf_size >0. If req_buf_size == 0,
+ * req_buf *can* be NULL and no additional payload is sent.
+ *
+ * Context: Process context. Will sleep waiting for reply.
+ * Return: 0 on success. <0 if error.
+ */
+int gh_rm_call(struct gh_rm *rm, u32 message_id, const void *req_buf, size_t req_buf_size,
+		void **resp_buf, size_t *resp_buf_size)
+{
+	struct gh_rm_connection *connection;
+	u32 seq_id;
+	int ret;
+
+	/* message_id 0 is reserved. req_buf_size implies req_buf is not NULL */
+	if (!rm || !message_id || (!req_buf && req_buf_size))
+		return -EINVAL;
+
+
+	connection = kzalloc(sizeof(*connection), GFP_KERNEL);
+	if (!connection)
+		return -ENOMEM;
+
+	connection->type = RM_RPC_TYPE_REPLY;
+	connection->msg_id = cpu_to_le32(message_id);
+
+	init_completion(&connection->reply.seq_done);
+
+	/* Allocate a new seq number for this connection */
+	ret = xa_alloc_cyclic(&rm->call_xarray, &seq_id, connection, xa_limit_16b, &rm->next_seq,
+				GFP_KERNEL);
+	if (ret < 0)
+		goto free;
+	connection->reply.seq = lower_16_bits(seq_id);
+
+	/* Send the request to the Resource Manager */
+	ret = gh_rm_send_request(rm, message_id, req_buf, req_buf_size, connection);
+	if (ret < 0)
+		goto out;
+
+	/* Wait for response */
+	ret = wait_for_completion_interruptible(&connection->reply.seq_done);
+	if (ret)
+		goto out;
+
+	/* Check for internal (kernel) error waiting for the response */
+	if (connection->reply.ret) {
+		ret = connection->reply.ret;
+		if (ret != -ENOMEM)
+			kfree(connection->payload);
+		goto out;
+	}
+
+	/* Got a response, did resource manager give us an error? */
+	if (connection->reply.rm_error != GH_RM_ERROR_OK) {
+		dev_warn(rm->dev, "RM rejected message %08x. Error: %d\n", message_id,
+			connection->reply.rm_error);
+		dump_stack();
+		ret = gh_rm_remap_error(connection->reply.rm_error);
+		kfree(connection->payload);
+		goto out;
+	}
+
+	/* Everything looks good, return the payload */
+	if (resp_buf_size)
+		*resp_buf_size = connection->size;
+	if (connection->size && resp_buf)
+		*resp_buf = connection->payload;
+	else {
+		/* kfree in case RM sent us multiple fragments but never any data in
+		 * those fragments. We would've allocated memory for it, but connection->size == 0
+		 */
+		kfree(connection->payload);
+	}
+
+out:
+	xa_erase(&rm->call_xarray, connection->reply.seq);
+free:
+	kfree(connection);
+	return ret;
+}
+
+
+int gh_rm_notifier_register(struct gh_rm *rm, struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&rm->nh, nb);
+}
+EXPORT_SYMBOL_GPL(gh_rm_notifier_register);
+
+int gh_rm_notifier_unregister(struct gh_rm *rm, struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&rm->nh, nb);
+}
+EXPORT_SYMBOL_GPL(gh_rm_notifier_unregister);
+
+static int gh_msgq_platform_probe_direction(struct platform_device *pdev, bool tx,
+					    struct gh_resource *ghrsc)
+{
+	struct device_node *node = pdev->dev.of_node;
+	int ret;
+	int idx = tx ? 0 : 1;
+
+	ghrsc->type = tx ? GH_RESOURCE_TYPE_MSGQ_TX : GH_RESOURCE_TYPE_MSGQ_RX;
+
+	ghrsc->irq = platform_get_irq(pdev, idx);
+	if (ghrsc->irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq%d: %d\n", idx, ghrsc->irq);
+		return ghrsc->irq;
+	}
+
+	ret = of_property_read_u64_index(node, "reg", idx, &ghrsc->capid);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get capid%d: %d\n", idx, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int gh_identify(void)
+{
+	struct gh_hypercall_hyp_identify_resp gh_api;
+
+	if (!arch_is_gh_guest())
+		return -ENODEV;
+
+	gh_hypercall_hyp_identify(&gh_api);
+
+	pr_info("Running under Gunyah hypervisor %llx/v%u\n",
+		FIELD_GET(GH_API_INFO_VARIANT_MASK, gh_api.api_info),
+		gh_api_version(&gh_api));
+
+	/* We might move this out to individual drivers if there's ever an API version bump */
+	if (gh_api_version(&gh_api) != GH_API_V1) {
+		pr_info("Unsupported Gunyah version: %u\n", gh_api_version(&gh_api));
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int gh_rm_drv_probe(struct platform_device *pdev)
+{
+	struct gh_msgq_tx_data *msg;
+	struct gh_rm *rm;
+	int ret;
+
+	ret = gh_identify();
+	if (ret)
+		return ret;
+
+	rm = devm_kzalloc(&pdev->dev, sizeof(*rm), GFP_KERNEL);
+	if (!rm)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rm);
+	rm->dev = &pdev->dev;
+
+	mutex_init(&rm->send_lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&rm->nh);
+	xa_init_flags(&rm->call_xarray, XA_FLAGS_ALLOC);
+	rm->cache = kmem_cache_create("gh_rm", struct_size(msg, data, GH_MSGQ_MAX_MSG_SIZE), 0,
+		SLAB_HWCACHE_ALIGN, NULL);
+	if (!rm->cache)
+		return -ENOMEM;
+
+	ret = gh_msgq_platform_probe_direction(pdev, true, &rm->tx_ghrsc);
+	if (ret)
+		goto err_cache;
+
+	ret = gh_msgq_platform_probe_direction(pdev, false, &rm->rx_ghrsc);
+	if (ret)
+		goto err_cache;
+
+	rm->msgq_client.dev = &pdev->dev;
+	rm->msgq_client.tx_block = true;
+	rm->msgq_client.rx_callback = gh_rm_msgq_rx_data;
+	rm->msgq_client.tx_done = gh_rm_msgq_tx_done;
+
+	return gh_msgq_init(&pdev->dev, &rm->msgq, &rm->msgq_client, &rm->tx_ghrsc, &rm->rx_ghrsc);
+err_cache:
+	kmem_cache_destroy(rm->cache);
+	return ret;
+}
+
+static int gh_rm_drv_remove(struct platform_device *pdev)
+{
+	struct gh_rm *rm = platform_get_drvdata(pdev);
+
+	mbox_free_channel(gh_msgq_chan(&rm->msgq));
+	gh_msgq_remove(&rm->msgq);
+	kmem_cache_destroy(rm->cache);
+
+	return 0;
+}
+
+static const struct of_device_id gh_rm_of_match[] = {
+	{ .compatible = "gunyah-resource-manager" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gh_rm_of_match);
+
+static struct platform_driver gh_rm_driver = {
+	.probe = gh_rm_drv_probe,
+	.remove = gh_rm_drv_remove,
+	.driver = {
+		.name = "gh_rsc_mgr",
+		.of_match_table = gh_rm_of_match,
+	},
+};
+module_platform_driver(gh_rm_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Resource Manager Driver");
diff --git a/drivers/virt/gunyah/rsc_mgr.h b/drivers/virt/gunyah/rsc_mgr.h
new file mode 100644
index 000000000000..8309b7bf4668
--- /dev/null
+++ b/drivers/virt/gunyah/rsc_mgr.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef __GH_RSC_MGR_PRIV_H
+#define __GH_RSC_MGR_PRIV_H
+
+#include <linux/gunyah.h>
+#include <linux/gunyah_rsc_mgr.h>
+#include <linux/types.h>
+
+struct gh_rm;
+int gh_rm_call(struct gh_rm *rsc_mgr, u32 message_id, const void *req_buf, size_t req_buf_size,
+		void **resp_buf, size_t *resp_buf_size);
+
+#endif
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
new file mode 100644
index 000000000000..f2a312e80af5
--- /dev/null
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _GUNYAH_RSC_MGR_H
+#define _GUNYAH_RSC_MGR_H
+
+#include <linux/list.h>
+#include <linux/notifier.h>
+#include <linux/gunyah.h>
+
+#define GH_VMID_INVAL		U16_MAX
+
+struct gh_rm;
+int gh_rm_notifier_register(struct gh_rm *rm, struct notifier_block *nb);
+int gh_rm_notifier_unregister(struct gh_rm *rm, struct notifier_block *nb);
+struct device *gh_rm_get(struct gh_rm *rm);
+void gh_rm_put(struct gh_rm *rm);
+
+#endif
-- 
2.40.0

