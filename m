Return-Path: <linux-doc+bounces-9203-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFDB8533AF
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 15:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686FF1F2B43F
	for <lists+linux-doc@lfdr.de>; Tue, 13 Feb 2024 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714A35E208;
	Tue, 13 Feb 2024 14:54:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3BA5A7B3;
	Tue, 13 Feb 2024 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707836053; cv=none; b=JO1ayuGjGMjcWVGi9AbNFWqGtk8xwci5IOK2mrd47Gq/iUsCFjlTyLxPHlazdLOAizwgcW+U9u9pywRVjx/opg3Ib6L7hQQOU1877y4ndWk33boQazXbQAAbu5picpbxYkcFjCXUejspErxLZuKBuHRB0716L9BXgafm1ADDT58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707836053; c=relaxed/simple;
	bh=OBOzxij5rvQcXzM0u85dDPpnrrE8ixz74py0v2sZKAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ouSWWZ+/IayQCzHhmbh1teq73Sg7ITWVzpMvOhn4WHFySxNaurYIBCblYWy/ODx+sjA821v+u/k5XfOERLNR5W48crlv8B5kZDqACKr6DYCNl8sfbhloA/sW2dOsghScLJXVfaY4ooXjhAK6+sx8VkCYQYW6eOUA/AfypKgEG7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EDF2DA7;
	Tue, 13 Feb 2024 06:54:50 -0800 (PST)
Received: from mango.localdomain (TVHN20WD9G.budapest.arm.com [10.45.25.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77F2C3F7B4;
	Tue, 13 Feb 2024 06:54:07 -0800 (PST)
From: Balint Dobszay <balint.dobszay@arm.com>
To: op-tee@lists.trustedfirmware.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jens.wiklander@linaro.org,
	sumit.garg@linaro.org,
	corbet@lwn.net,
	balint.dobszay@arm.com,
	sudeep.holla@arm.com,
	gyorgy.szing@arm.com
Subject: [PATCH 2/3] tee: tstee: Add Trusted Services TEE driver
Date: Tue, 13 Feb 2024 15:52:38 +0100
Message-Id: <20240213145239.379875-3-balint.dobszay@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213145239.379875-1-balint.dobszay@arm.com>
References: <20240213145239.379875-1-balint.dobszay@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Trusted Services project provides a framework for developing and
deploying device Root of Trust services in FF-A Secure Partitions. The
FF-A SPs are accessible through the FF-A driver, but this doesn't
provide a user space interface. The goal of this TEE driver is to make
Trusted Services SPs accessible for user space clients.

All TS SPs have the same FF-A UUID, it identifies the RPC protocol used
by TS. A TS SP can host one or more services, a service is identified by
its service UUID. The same type of service cannot be present twice in
the same SP. During SP boot each service in an SP is assigned an
interface ID, this is just a short ID to simplify message addressing.
There is 1:1 mapping between TS SPs and TEE devices, i.e. a separate TEE
device is registered for each TS SP. This is required since contrary to
the generic TEE design where memory is shared with the whole TEE
implementation, in case of FF-A, memory is shared with a specific SP. A
user space client has to be able to separately share memory with each SP
based on its endpoint ID.

Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
---
 drivers/tee/Kconfig               |   1 +
 drivers/tee/Makefile              |   1 +
 drivers/tee/tstee/Kconfig         |  11 +
 drivers/tee/tstee/Makefile        |   3 +
 drivers/tee/tstee/core.c          | 501 ++++++++++++++++++++++++++++++
 drivers/tee/tstee/tstee_private.h |  92 ++++++
 include/uapi/linux/tee.h          |   1 +
 7 files changed, 610 insertions(+)
 create mode 100644 drivers/tee/tstee/Kconfig
 create mode 100644 drivers/tee/tstee/Makefile
 create mode 100644 drivers/tee/tstee/core.c
 create mode 100644 drivers/tee/tstee/tstee_private.h

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 73a147202e88..61b507c18780 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -15,5 +15,6 @@ if TEE
 
 source "drivers/tee/optee/Kconfig"
 source "drivers/tee/amdtee/Kconfig"
+source "drivers/tee/tstee/Kconfig"
 
 endif
diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
index 68da044afbfa..5488cba30bd2 100644
--- a/drivers/tee/Makefile
+++ b/drivers/tee/Makefile
@@ -5,3 +5,4 @@ tee-objs += tee_shm.o
 tee-objs += tee_shm_pool.o
 obj-$(CONFIG_OPTEE) += optee/
 obj-$(CONFIG_AMDTEE) += amdtee/
+obj-$(CONFIG_ARM_TSTEE) += tstee/
diff --git a/drivers/tee/tstee/Kconfig b/drivers/tee/tstee/Kconfig
new file mode 100644
index 000000000000..d32f91d47398
--- /dev/null
+++ b/drivers/tee/tstee/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config ARM_TSTEE
+	tristate "Arm Trusted Services TEE driver"
+	depends on ARM_FFA_TRANSPORT
+	default n
+	help
+	  The Trusted Services project provides a framework for developing and
+	  deploying device Root of Trust services in FF-A Secure Partitions.
+	  This driver provides an interface to make Trusted Services Secure
+	  Partitions accessible for user space clients, since the FF-A driver
+	  doesn't implement a user space interface directly.
diff --git a/drivers/tee/tstee/Makefile b/drivers/tee/tstee/Makefile
new file mode 100644
index 000000000000..5227020ebd30
--- /dev/null
+++ b/drivers/tee/tstee/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+arm-tstee-objs := core.o
+obj-$(CONFIG_ARM_TSTEE) = arm-tstee.o
diff --git a/drivers/tee/tstee/core.c b/drivers/tee/tstee/core.c
new file mode 100644
index 000000000000..8d6bbe4d03ed
--- /dev/null
+++ b/drivers/tee/tstee/core.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Arm Limited
+ */
+
+#define DRIVER_NAME "Arm TSTEE"
+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
+
+#include <linux/arm_ffa.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/stat.h>
+#include <linux/tee_drv.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+
+#include "tstee_private.h"
+
+#define FFA_DIRECT_REQ_ARG_NUM 5
+#define FFA_INVALID_MEM_HANDLE U64_MAX
+
+static void arg_list_to_ffa_data(const u32 *args, struct ffa_send_direct_data *data)
+{
+	data->data0 = args[0];
+	data->data1 = args[1];
+	data->data2 = args[2];
+	data->data3 = args[3];
+	data->data4 = args[4];
+}
+
+static void arg_list_from_ffa_data(const struct ffa_send_direct_data *data, u32 *args)
+{
+	args[0] = lower_32_bits(data->data0);
+	args[1] = lower_32_bits(data->data1);
+	args[2] = lower_32_bits(data->data2);
+	args[3] = lower_32_bits(data->data3);
+	args[4] = lower_32_bits(data->data4);
+}
+
+static void tstee_get_version(struct tee_device *teedev, struct tee_ioctl_version_data *vers)
+{
+	struct tstee *tstee = tee_get_drvdata(teedev);
+	struct tee_ioctl_version_data v = {
+		.impl_id = TEE_IMPL_ID_TSTEE,
+		/* FF-A endpoint ID only uses the lower 16 bits */
+		.impl_caps = lower_16_bits(tstee->ffa_dev->vm_id),
+		.gen_caps = 0,
+	};
+
+	*vers = v;
+}
+
+static int tstee_open(struct tee_context *ctx)
+{
+	struct ts_context_data *ctxdata;
+
+	ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
+	if (!ctxdata)
+		return -ENOMEM;
+
+	mutex_init(&ctxdata->mutex);
+	idr_init(&ctxdata->sess_ids);
+	INIT_LIST_HEAD(&ctxdata->sess_list);
+
+	ctx->data = ctxdata;
+
+	return 0;
+}
+
+static void tstee_release(struct tee_context *ctx)
+{
+	struct ts_context_data *ctxdata = ctx->data;
+	struct ts_session *sess, *sess_tmp;
+
+	if (!ctxdata)
+		return;
+
+	list_for_each_entry_safe(sess, sess_tmp, &ctxdata->sess_list, list_node) {
+		list_del(&sess->list_node);
+		idr_remove(&ctxdata->sess_ids, sess->session_id);
+		kfree(sess);
+	}
+
+	idr_destroy(&ctxdata->sess_ids);
+	mutex_destroy(&ctxdata->mutex);
+
+	kfree(ctxdata);
+	ctx->data = NULL;
+}
+
+static struct ts_session *find_session(struct ts_context_data *ctxdata, u32 session_id)
+{
+	struct ts_session *sess;
+
+	list_for_each_entry(sess, &ctxdata->sess_list, list_node)
+		if (sess->session_id == session_id)
+			return sess;
+
+	return NULL;
+}
+
+static int tstee_open_session(struct tee_context *ctx, struct tee_ioctl_open_session_arg *arg,
+			      struct tee_param *param __always_unused)
+{
+	struct tstee *tstee = tee_get_drvdata(ctx->teedev);
+	struct ffa_device *ffa_dev = tstee->ffa_dev;
+	struct ts_context_data *ctxdata = ctx->data;
+	struct ffa_send_direct_data ffa_data;
+	struct ts_session *sess = NULL;
+	u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
+	int sess_id;
+	int rc;
+
+	ffa_args[TS_RPC_CTRL_REG] = TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
+								  TS_RPC_OP_SERVICE_INFO);
+
+	memcpy((u8 *)(ffa_args + TS_RPC_SERVICE_INFO_UUID0), arg->uuid, UUID_SIZE);
+
+	arg_list_to_ffa_data(ffa_args, &ffa_data);
+	rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
+	if (rc)
+		return rc;
+
+	arg_list_from_ffa_data(&ffa_data, ffa_args);
+
+	if (ffa_args[TS_RPC_SERVICE_INFO_RPC_STATUS] != TS_RPC_OK)
+		return -ENODEV;
+
+	if (ffa_args[TS_RPC_SERVICE_INFO_IFACE] > U8_MAX)
+		return -EINVAL;
+
+	sess = kzalloc(sizeof(*sess), GFP_KERNEL);
+	if (!sess)
+		return -ENOMEM;
+
+	sess_id = idr_alloc(&ctxdata->sess_ids, sess, 1, 0, GFP_KERNEL);
+	if (sess_id < 0) {
+		kfree(sess);
+		return sess_id;
+	}
+
+	sess->session_id = sess_id;
+	sess->iface_id = ffa_args[TS_RPC_SERVICE_INFO_IFACE];
+
+	mutex_lock(&ctxdata->mutex);
+	list_add(&sess->list_node, &ctxdata->sess_list);
+	mutex_unlock(&ctxdata->mutex);
+
+	arg->session = sess_id;
+	arg->ret = 0;
+
+	return 0;
+}
+
+static int tstee_close_session(struct tee_context *ctx, u32 session)
+{
+	struct ts_context_data *ctxdata = ctx->data;
+	struct ts_session *sess;
+
+	mutex_lock(&ctxdata->mutex);
+	sess = find_session(ctxdata, session);
+	if (sess)
+		list_del(&sess->list_node);
+
+	mutex_unlock(&ctxdata->mutex);
+
+	if (!sess)
+		return -EINVAL;
+
+	idr_remove(&ctxdata->sess_ids, sess->session_id);
+	kfree(sess);
+
+	return 0;
+}
+
+static int tstee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_arg *arg,
+			     struct tee_param *param)
+{
+	struct tstee *tstee = tee_get_drvdata(ctx->teedev);
+	struct ffa_device *ffa_dev = tstee->ffa_dev;
+	struct ts_context_data *ctxdata = ctx->data;
+	struct ffa_send_direct_data ffa_data;
+	struct tee_shm *shm = NULL;
+	struct ts_session *sess;
+	u32 req_len, ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
+	int shm_id, rc;
+	u8 iface_id;
+	u64 handle;
+	u16 opcode;
+
+	mutex_lock(&ctxdata->mutex);
+	sess = find_session(ctxdata, arg->session);
+
+	/* Do this while holding the mutex to make sure that the session wasn't closed meanwhile */
+	if (sess)
+		iface_id = sess->iface_id;
+
+	mutex_unlock(&ctxdata->mutex);
+	if (!sess)
+		return -EINVAL;
+
+	opcode = lower_16_bits(arg->func);
+	shm_id = lower_32_bits(param[0].u.value.a);
+	req_len = lower_32_bits(param[0].u.value.b);
+
+	if (shm_id != 0) {
+		shm = tee_shm_get_from_id(ctx, shm_id);
+		if (IS_ERR(shm))
+			return PTR_ERR(shm);
+
+		if (shm->size < req_len) {
+			pr_err("request doesn't fit into shared memory buffer\n");
+			rc = -EINVAL;
+			goto out;
+		}
+
+		handle = shm->sec_world_id;
+	} else {
+		handle = FFA_INVALID_MEM_HANDLE;
+	}
+
+	ffa_args[TS_RPC_CTRL_REG] = TS_RPC_CTRL_PACK_IFACE_OPCODE(iface_id, opcode);
+	ffa_args[TS_RPC_SERVICE_MEM_HANDLE_LSW] = lower_32_bits(handle);
+	ffa_args[TS_RPC_SERVICE_MEM_HANDLE_MSW] = upper_32_bits(handle);
+	ffa_args[TS_RPC_SERVICE_REQ_LEN] = req_len;
+	ffa_args[TS_RPC_SERVICE_CLIENT_ID] = 0;
+
+	arg_list_to_ffa_data(ffa_args, &ffa_data);
+	rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
+	if (rc)
+		goto out;
+
+	arg_list_from_ffa_data(&ffa_data, ffa_args);
+
+	if (ffa_args[TS_RPC_SERVICE_RPC_STATUS] != TS_RPC_OK) {
+		pr_err("invoke_func rpc status: %d\n", ffa_args[TS_RPC_SERVICE_RPC_STATUS]);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	arg->ret = ffa_args[TS_RPC_SERVICE_STATUS];
+	if (shm && shm->size >= ffa_args[TS_RPC_SERVICE_RESP_LEN])
+		param[0].u.value.a = ffa_args[TS_RPC_SERVICE_RESP_LEN];
+
+out:
+	if (shm)
+		tee_shm_put(shm);
+
+	return rc;
+}
+
+static int tstee_shm_register(struct tee_context *ctx, struct tee_shm *shm, struct page **pages,
+			      size_t num_pages, unsigned long start __always_unused)
+{
+	struct tstee *tstee = tee_get_drvdata(ctx->teedev);
+	struct ffa_device *ffa_dev = tstee->ffa_dev;
+	struct ffa_mem_region_attributes mem_attr = {
+		.receiver = tstee->ffa_dev->vm_id,
+		.attrs = FFA_MEM_RW,
+		.flag = 0,
+	};
+	struct ffa_mem_ops_args mem_args = {
+		.attrs = &mem_attr,
+		.use_txbuf = true,
+		.nattrs = 1,
+		.flags = 0,
+	};
+	struct ffa_send_direct_data ffa_data;
+	struct sg_table sgt;
+	u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
+	int rc;
+
+	rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, 0, num_pages * PAGE_SIZE,
+				       GFP_KERNEL);
+	if (rc)
+		return rc;
+
+	mem_args.sg = sgt.sgl;
+	rc = ffa_dev->ops->mem_ops->memory_share(&mem_args);
+	sg_free_table(&sgt);
+	if (rc)
+		return rc;
+
+	shm->sec_world_id = mem_args.g_handle;
+
+	ffa_args[TS_RPC_CTRL_REG] = TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
+								  TS_RPC_OP_RETRIEVE_MEM);
+	ffa_args[TS_RPC_RETRIEVE_MEM_HANDLE_LSW] = lower_32_bits(shm->sec_world_id);
+	ffa_args[TS_RPC_RETRIEVE_MEM_HANDLE_MSW] = upper_32_bits(shm->sec_world_id);
+	ffa_args[TS_RPC_RETRIEVE_MEM_TAG_LSW] = 0;
+	ffa_args[TS_RPC_RETRIEVE_MEM_TAG_MSW] = 0;
+
+	arg_list_to_ffa_data(ffa_args, &ffa_data);
+	rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
+	if (rc) {
+		(void)ffa_dev->ops->mem_ops->memory_reclaim(shm->sec_world_id, 0);
+		return rc;
+	}
+
+	arg_list_from_ffa_data(&ffa_data, ffa_args);
+
+	if (ffa_args[TS_RPC_RETRIEVE_MEM_RPC_STATUS] != TS_RPC_OK) {
+		pr_err("shm_register rpc status: %d\n", ffa_args[TS_RPC_RETRIEVE_MEM_RPC_STATUS]);
+		ffa_dev->ops->mem_ops->memory_reclaim(shm->sec_world_id, 0);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int tstee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
+{
+	struct tstee *tstee = tee_get_drvdata(ctx->teedev);
+	struct ffa_device *ffa_dev = tstee->ffa_dev;
+	struct ffa_send_direct_data ffa_data;
+	u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
+	int rc;
+
+	ffa_args[TS_RPC_CTRL_REG] = TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
+								  TS_RPC_OP_RELINQ_MEM);
+	ffa_args[TS_RPC_RELINQ_MEM_HANDLE_LSW] = lower_32_bits(shm->sec_world_id);
+	ffa_args[TS_RPC_RELINQ_MEM_HANDLE_MSW] = upper_32_bits(shm->sec_world_id);
+
+	arg_list_to_ffa_data(ffa_args, &ffa_data);
+	rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
+	if (rc)
+		return rc;
+	arg_list_from_ffa_data(&ffa_data, ffa_args);
+
+	if (ffa_args[TS_RPC_RELINQ_MEM_RPC_STATUS] != TS_RPC_OK) {
+		pr_err("shm_unregister rpc status: %d\n", ffa_args[TS_RPC_RELINQ_MEM_RPC_STATUS]);
+		return -EINVAL;
+	}
+
+	rc = ffa_dev->ops->mem_ops->memory_reclaim(shm->sec_world_id, 0);
+
+	return rc;
+}
+
+static const struct tee_driver_ops tstee_ops = {
+	.get_version = tstee_get_version,
+	.open = tstee_open,
+	.release = tstee_release,
+	.open_session = tstee_open_session,
+	.close_session = tstee_close_session,
+	.invoke_func = tstee_invoke_func,
+	.shm_register = tstee_shm_register,
+	.shm_unregister = tstee_shm_unregister,
+};
+
+static const struct tee_desc tstee_desc = {
+	.name = "tstee-clnt",
+	.ops = &tstee_ops,
+	.owner = THIS_MODULE,
+};
+
+static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm, size_t size, size_t align)
+{
+	return tee_shm_pool_op_alloc_helper(pool, shm, size, align, tstee_shm_register);
+}
+
+static void pool_op_free(struct tee_shm_pool *pool, struct tee_shm *shm)
+{
+	tee_shm_pool_op_free_helper(pool, shm, tstee_shm_unregister);
+}
+
+static void pool_op_destroy_pool(struct tee_shm_pool *pool)
+{
+	kfree(pool);
+}
+
+static const struct tee_shm_pool_ops pool_ops = {
+	.alloc = pool_op_alloc,
+	.free = pool_op_free,
+	.destroy_pool = pool_op_destroy_pool,
+};
+
+static struct tee_shm_pool *tstee_create_shm_pool(void)
+{
+	struct tee_shm_pool *pool = kzalloc(sizeof(*pool), GFP_KERNEL);
+
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->ops = &pool_ops;
+
+	return pool;
+}
+
+static bool tstee_check_rpc_compatible(struct ffa_device *ffa_dev)
+{
+	struct ffa_send_direct_data ffa_data;
+	u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
+
+	ffa_args[TS_RPC_CTRL_REG] = TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
+								  TS_RPC_OP_GET_VERSION);
+
+	arg_list_to_ffa_data(ffa_args, &ffa_data);
+	if (ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data))
+		return false;
+
+	arg_list_from_ffa_data(&ffa_data, ffa_args);
+
+	return ffa_args[TS_RPC_GET_VERSION_RESP] == TS_RPC_PROTOCOL_VERSION;
+}
+
+static void tstee_deinit_common(struct tstee *tstee)
+{
+	tee_device_unregister(tstee->teedev);
+	if (tstee->pool)
+		tee_shm_pool_free(tstee->pool);
+
+	kfree(tstee);
+}
+
+static int tstee_probe(struct ffa_device *ffa_dev)
+{
+	struct tstee *tstee;
+	int rc;
+
+	ffa_dev->ops->msg_ops->mode_32bit_set(ffa_dev);
+
+	if (!tstee_check_rpc_compatible(ffa_dev))
+		return -EINVAL;
+
+	tstee = kzalloc(sizeof(*tstee), GFP_KERNEL);
+	if (!tstee)
+		return -ENOMEM;
+
+	tstee->ffa_dev = ffa_dev;
+
+	tstee->pool = tstee_create_shm_pool();
+	if (IS_ERR(tstee->pool)) {
+		rc = PTR_ERR(tstee->pool);
+		tstee->pool = NULL;
+		goto err;
+	}
+
+	tstee->teedev = tee_device_alloc(&tstee_desc, NULL, tstee->pool, tstee);
+	if (IS_ERR(tstee->teedev)) {
+		rc = PTR_ERR(tstee->teedev);
+		tstee->teedev = NULL;
+		goto err;
+	}
+
+	rc = tee_device_register(tstee->teedev);
+	if (rc)
+		goto err;
+
+	ffa_dev_set_drvdata(ffa_dev, tstee);
+
+	pr_info("driver initialized for endpoint 0x%x\n", ffa_dev->vm_id);
+
+	return 0;
+
+err:
+	tstee_deinit_common(tstee);
+	return rc;
+}
+
+static void tstee_remove(struct ffa_device *ffa_dev)
+{
+	tstee_deinit_common(ffa_dev->dev.driver_data);
+}
+
+static const struct ffa_device_id tstee_device_ids[] = {
+	/* TS RPC protocol UUID: bdcd76d7-825e-4751-963b-86d4f84943ac */
+	{ TS_RPC_UUID },
+	{}
+};
+
+static struct ffa_driver tstee_driver = {
+	.name = "arm_tstee",
+	.probe = tstee_probe,
+	.remove = tstee_remove,
+	.id_table = tstee_device_ids,
+};
+
+static int __init mod_init(void)
+{
+	return ffa_register(&tstee_driver);
+}
+module_init(mod_init)
+
+static void __exit mod_exit(void)
+{
+	ffa_unregister(&tstee_driver);
+}
+module_exit(mod_exit)
+
+MODULE_ALIAS("arm-tstee");
+MODULE_AUTHOR("Balint Dobszay <balint.dobszay@arm.com>");
+MODULE_DESCRIPTION("Arm Trusted Services TEE driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/tee/tstee/tstee_private.h b/drivers/tee/tstee/tstee_private.h
new file mode 100644
index 000000000000..81eeda220a5c
--- /dev/null
+++ b/drivers/tee/tstee/tstee_private.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Arm Limited
+ */
+
+#ifndef TSTEE_PRIVATE_H
+#define TSTEE_PRIVATE_H
+
+#include <linux/arm_ffa.h>
+#include <linux/bitops.h>
+#include <linux/idr.h>
+#include <linux/tee_drv.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+/* UUID of this protocol */
+#define TS_RPC_UUID UUID_INIT(0xbdcd76d7, 0x825e, 0x4751, \
+			      0x96, 0x3b, 0x86, 0xd4, 0xf8, 0x49, 0x43, 0xac)
+
+/* Protocol version*/
+#define TS_RPC_PROTOCOL_VERSION		(1)
+
+/* Status codes */
+#define TS_RPC_OK			(0)
+
+/* RPC control register */
+#define TS_RPC_CTRL_REG			(0)
+#define OPCODE_MASK			GENMASK(15, 0)
+#define IFACE_ID_MASK			GENMASK(23, 16)
+#define TS_RPC_CTRL_OPCODE(x)		((u16)(FIELD_GET(OPCODE_MASK, (x))))
+#define TS_RPC_CTRL_IFACE_ID(x)		((u8)(FIELD_GET(IFACE_ID_MASK, (x))))
+#define TS_RPC_CTRL_PACK_IFACE_OPCODE(i, o)	\
+	(FIELD_PREP(IFACE_ID_MASK, (i)) | FIELD_PREP(OPCODE_MASK, (o)))
+#define TS_RPC_CTRL_SAP_RC		BIT(30)
+#define TS_RPC_CTRL_SAP_ERR		BIT(31)
+
+/* Interface ID for RPC management operations */
+#define TS_RPC_MGMT_IFACE_ID		(0xff)
+
+/* Management calls */
+#define TS_RPC_OP_GET_VERSION		(0x0000)
+#define TS_RPC_GET_VERSION_RESP		(1)
+
+#define TS_RPC_OP_RETRIEVE_MEM		(0x0001)
+#define TS_RPC_RETRIEVE_MEM_HANDLE_LSW	(1)
+#define TS_RPC_RETRIEVE_MEM_HANDLE_MSW	(2)
+#define TS_RPC_RETRIEVE_MEM_TAG_LSW	(3)
+#define TS_RPC_RETRIEVE_MEM_TAG_MSW	(4)
+#define TS_RPC_RETRIEVE_MEM_RPC_STATUS	(1)
+
+#define TS_RPC_OP_RELINQ_MEM		(0x0002)
+#define TS_RPC_RELINQ_MEM_HANDLE_LSW	(1)
+#define TS_RPC_RELINQ_MEM_HANDLE_MSW	(2)
+#define TS_RPC_RELINQ_MEM_RPC_STATUS	(1)
+
+#define TS_RPC_OP_SERVICE_INFO		(0x0003)
+#define TS_RPC_SERVICE_INFO_UUID0	(1)
+#define TS_RPC_SERVICE_INFO_UUID1	(2)
+#define TS_RPC_SERVICE_INFO_UUID2	(3)
+#define TS_RPC_SERVICE_INFO_UUID3	(4)
+#define TS_RPC_SERVICE_INFO_RPC_STATUS	(1)
+#define TS_RPC_SERVICE_INFO_IFACE	(2)
+
+/* Service call */
+#define TS_RPC_SERVICE_MEM_HANDLE_LSW	(1)
+#define TS_RPC_SERVICE_MEM_HANDLE_MSW	(2)
+#define TS_RPC_SERVICE_REQ_LEN		(3)
+#define TS_RPC_SERVICE_CLIENT_ID	(4)
+#define TS_RPC_SERVICE_RPC_STATUS	(1)
+#define TS_RPC_SERVICE_STATUS		(2)
+#define TS_RPC_SERVICE_RESP_LEN		(3)
+
+struct tstee {
+	struct ffa_device *ffa_dev;
+	struct tee_device *teedev;
+	struct tee_shm_pool *pool;
+};
+
+struct ts_session {
+	struct list_head list_node;
+	u32 session_id;
+	u8 iface_id;
+};
+
+struct ts_context_data {
+	struct list_head sess_list;
+	struct idr sess_ids;
+	/* Serializes access to this struct */
+	struct mutex mutex;
+};
+
+#endif /* TSTEE_PRIVATE_H */
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 23e57164693c..d0430bee8292 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -56,6 +56,7 @@
  */
 #define TEE_IMPL_ID_OPTEE	1
 #define TEE_IMPL_ID_AMDTEE	2
+#define TEE_IMPL_ID_TSTEE	3
 
 /*
  * OP-TEE specific capabilities
-- 
2.34.1


