Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFF068C212
	for <lists+linux-doc@lfdr.de>; Mon,  6 Feb 2023 16:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjBFPp4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Feb 2023 10:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjBFPpy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 10:45:54 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE693C2E;
        Mon,  6 Feb 2023 07:45:18 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316C0jkH010974;
        Mon, 6 Feb 2023 15:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Q9xc3mJK+5pwT1sGK7/G7ZvV5ixPFOVuxpbzcSUFFdw=;
 b=lbDCUgaYcGirvKs7AKn8v6w5fhRhjcG3GPq5Cv1gwAm87EYrNlL/m6hJ0qoybwPIkg+/
 Lhrw+vzfDbaZagl7IrmDlWgwZBTRx7GQcJwgbIVsKfKfonv1YJZd2LMBs77bxL6lQsvq
 YV172ZyNqR90FNCtEOju0Y2hSL5HBw9GabVxEZgKrDb5WeufkHIIiQ7UTnHuhJ9qI9Ux
 zPLx2JuEeMog1znjuwFtXRnxMcSlmzr4WdODyCoA8F9DZ+3cg2LbP8nF9ukCFDrB3rqp
 Wg0v/W4/NOM+vufck5lwbVhb/Nk6hUvectYRO+s3Mqg09Czv7oW38Ob18la+BnmUl9G9 4A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhgng3v2b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Feb 2023 15:42:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 316FgL0j021715
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 6 Feb 2023 15:42:21 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Feb 2023 07:42:20 -0800
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC:     <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 6/8] accel/qaic: Add mhi_qaic_cntl
Date:   Mon, 6 Feb 2023 08:41:43 -0700
Message-ID: <1675698105-19025-7-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RZABJq-ZZpPznZCjd0Z2ieoPq8K0n0kp
X-Proofpoint-ORIG-GUID: RZABJq-ZZpPznZCjd0Z2ieoPq8K0n0kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060135
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Some of the MHI channels for an AIC100 device need to be routed to
userspace so that userspace can communicate directly with QSM.  The MHI
bus does not support this, and while the WWAN subsystem does (for the same
reasons), AIC100 is not a WWAN device.  Also, MHI is not something that
other accelerators are expected to share, thus an accel subsystem function
that meets this usecase is unlikely.

Create a QAIC specific MHI userspace shim that exposes these channels.

Start with QAIC_SAHARA which is required to boot AIC100 and is consumed by
the kickstart application as documented in aic100.rst

Each AIC100 instance (currently, up to 16) in a system will create a
chardev for QAIC_SAHARA.  This chardev will be found as
/dev/<mhi instance>_QAIC_SAHARA
For example - /dev/mhi0_QAIC_SAHARA

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/accel/qaic/mhi_qaic_ctrl.c | 586 +++++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/mhi_qaic_ctrl.h |  11 +
 2 files changed, 597 insertions(+)
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h

diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.c b/drivers/accel/qaic/mhi_qaic_ctrl.c
new file mode 100644
index 0000000..1f1ccf1
--- /dev/null
+++ b/drivers/accel/qaic/mhi_qaic_ctrl.c
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+#include <linux/kernel.h>
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+#include <linux/version.h>
+#include <linux/xarray.h>
+#include <uapi/linux/eventpoll.h>
+
+#include "qaic.h"
+
+#define MHI_QAIC_CTRL_DRIVER_NAME	"mhi_qaic_ctrl"
+#define MHI_QAIC_CTRL_MAX_MINORS	128
+#define MHI_MAX_MTU			0xffff
+static DEFINE_XARRAY_ALLOC(mqc_xa);
+static struct class *mqc_dev_class;
+static int mqc_dev_major;
+
+/**
+ * @brief struct mqc_buf - Buffer structure used to receive data from device
+ * @data: Address of data to read from
+ * @odata: Original address returned from *alloc() API. Used to free this buf.
+ * @len: Length of data in byte
+ * @node: This buffer will be part of list managed in struct mqc_dev
+ */
+struct mqc_buf {
+	void *data;
+	void *odata;
+	size_t len;
+	struct list_head node;
+};
+
+/**
+ * @brief struct mqc_dev - MHI QAIC Control Device
+ * @minor: MQC device node minor number
+ * @mhi_dev: Associated mhi device object
+ * @mtu: Max TRE buffer length
+ * @enabled: Flag to track the state of the MQC device
+ * @lock: Mutex lock to serialize access to open_count
+ * @read_lock: Mutex lock to serialize readers
+ * @write_lock: Mutex lock to serialize writers
+ * @ul_wq: Wait queue for writers
+ * @dl_wq: Wait queue for readers
+ * @dl_queue_lock: Spin lock to serialize access to download queue
+ * @dl_queue: Queue of downloaded buffers
+ * @open_count: Track open counts
+ * @ref_count: Reference count for this structure
+ */
+struct mqc_dev {
+	uint32_t minor;
+	struct mhi_device *mhi_dev;
+	size_t mtu;
+	bool enabled;
+	struct mutex lock;
+	struct mutex read_lock;
+	struct mutex write_lock;
+	wait_queue_head_t ul_wq;
+	wait_queue_head_t dl_wq;
+	spinlock_t dl_queue_lock;
+	struct list_head dl_queue;
+	unsigned int open_count;
+	struct kref ref_count;
+};
+
+static void mqc_dev_release(struct kref *ref)
+{
+	struct mqc_dev *mqcdev = container_of(ref, struct mqc_dev, ref_count);
+
+	mutex_destroy(&mqcdev->read_lock);
+	mutex_destroy(&mqcdev->write_lock);
+	mutex_destroy(&mqcdev->lock);
+	kfree(mqcdev);
+}
+
+static int mhi_qaic_ctrl_fill_dl_queue(struct mqc_dev *mqcdev)
+{
+	struct mhi_device *mhi_dev = mqcdev->mhi_dev;
+	struct mqc_buf *ctrlbuf;
+	int rx_budget;
+	int ret = 0;
+	void *data;
+
+	rx_budget = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
+	if (rx_budget < 0)
+		return -EIO;
+
+	while (rx_budget--) {
+		data = kzalloc(mqcdev->mtu + sizeof(*ctrlbuf), GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		ctrlbuf = data + mqcdev->mtu;
+		ctrlbuf->odata = data;
+
+		ret = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, data,
+				    mqcdev->mtu, MHI_EOT);
+		if (ret) {
+			kfree(data);
+			dev_err(&mhi_dev->dev, "Failed to queue buffer\n");
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int mhi_qaic_ctrl_dev_start_chan(struct mqc_dev *mqcdev)
+{
+	struct device *dev = &mqcdev->mhi_dev->dev;
+	int ret = 0;
+
+	ret = mutex_lock_interruptible(&mqcdev->lock);
+	if (ret)
+		return ret;
+	if (!mqcdev->enabled) {
+		ret = -ENODEV;
+		goto release_dev_lock;
+	}
+	if (!mqcdev->open_count) {
+		ret = mhi_prepare_for_transfer(mqcdev->mhi_dev);
+		if (ret) {
+			dev_err(dev, "Error starting transfer channels\n");
+			goto release_dev_lock;
+		}
+
+		ret = mhi_qaic_ctrl_fill_dl_queue(mqcdev);
+		if (ret) {
+			dev_err(dev, "Error filling download queue.\n");
+			goto mhi_unprepare;
+		}
+	}
+	mqcdev->open_count++;
+	mutex_unlock(&mqcdev->lock);
+
+	return 0;
+
+mhi_unprepare:
+	mhi_unprepare_from_transfer(mqcdev->mhi_dev);
+release_dev_lock:
+	mutex_unlock(&mqcdev->lock);
+	return ret;
+}
+
+static struct mqc_dev *mqc_dev_get_by_minor(unsigned int minor)
+{
+	struct mqc_dev *mqcdev;
+
+	xa_lock(&mqc_xa);
+	mqcdev = xa_load(&mqc_xa, minor);
+	if (mqcdev)
+		kref_get(&mqcdev->ref_count);
+	xa_unlock(&mqc_xa);
+
+	return mqcdev;
+}
+
+static int mhi_qaic_ctrl_open(struct inode *inode, struct file *filp)
+{
+	struct mqc_dev *mqcdev;
+	int ret;
+
+	mqcdev = mqc_dev_get_by_minor(iminor(inode));
+	if (!mqcdev) {
+		pr_debug("mqc: minor %d not found\n", iminor(inode));
+		return -EINVAL;
+	}
+
+	ret = mhi_qaic_ctrl_dev_start_chan(mqcdev);
+	if (ret) {
+		kref_put(&mqcdev->ref_count, mqc_dev_release);
+		return ret;
+	}
+
+	filp->private_data = mqcdev;
+
+	return 0;
+}
+
+static void mhi_qaic_ctrl_buf_free(struct mqc_buf *ctrlbuf)
+{
+	list_del(&ctrlbuf->node);
+	kfree(ctrlbuf->odata);
+}
+
+static void __mhi_qaic_ctrl_release(struct mqc_dev *mqcdev)
+{
+	struct mqc_buf *ctrlbuf, *tmp;
+
+	mhi_unprepare_from_transfer(mqcdev->mhi_dev);
+	wake_up_interruptible(&mqcdev->ul_wq);
+	wake_up_interruptible(&mqcdev->dl_wq);
+	/*
+	 * Free the dl_queue. As we have already unprepared mhi transfers, we
+	 * do not expect any callback functions that update dl_queue hence no need
+	 * to grab dl_queue lock.
+	 */
+	mutex_lock(&mqcdev->read_lock);
+	list_for_each_entry_safe(ctrlbuf, tmp, &mqcdev->dl_queue, node)
+		mhi_qaic_ctrl_buf_free(ctrlbuf);
+	mutex_unlock(&mqcdev->read_lock);
+}
+
+static int mhi_qaic_ctrl_release(struct inode *inode, struct file *file)
+{
+	struct mqc_dev *mqcdev = file->private_data;
+
+	mutex_lock(&mqcdev->lock);
+	mqcdev->open_count--;
+	if (!mqcdev->open_count && mqcdev->enabled)
+		__mhi_qaic_ctrl_release(mqcdev);
+	mutex_unlock(&mqcdev->lock);
+
+	kref_put(&mqcdev->ref_count, mqc_dev_release);
+
+	return 0;
+}
+
+static __poll_t mhi_qaic_ctrl_poll(struct file *file, poll_table *wait)
+{
+	struct mqc_dev *mqcdev = file->private_data;
+	struct mhi_device *mhi_dev;
+	__poll_t mask = 0;
+
+	mhi_dev = mqcdev->mhi_dev;
+
+	poll_wait(file, &mqcdev->ul_wq, wait);
+	poll_wait(file, &mqcdev->dl_wq, wait);
+
+	mutex_lock(&mqcdev->lock);
+	if (!mqcdev->enabled || !mqcdev->open_count) {
+		mutex_unlock(&mqcdev->lock);
+		return EPOLLERR;
+	}
+
+	spin_lock_bh(&mqcdev->dl_queue_lock);
+	if (!list_empty(&mqcdev->dl_queue))
+		mask |= EPOLLIN | EPOLLRDNORM;
+	spin_unlock_bh(&mqcdev->dl_queue_lock);
+
+	if (mutex_lock_interruptible(&mqcdev->write_lock)) {
+		mutex_unlock(&mqcdev->lock);
+		return EPOLLERR;
+	}
+	if (mhi_get_free_desc_count(mhi_dev, DMA_TO_DEVICE) > 0)
+		mask |= EPOLLOUT | EPOLLWRNORM;
+	mutex_unlock(&mqcdev->write_lock);
+	mutex_unlock(&mqcdev->lock);
+
+	dev_dbg(&mhi_dev->dev, "Client attempted to poll, returning mask 0x%x\n", mask);
+
+	return mask;
+}
+
+static int mhi_qaic_ctrl_tx(struct mqc_dev *mqcdev)
+{
+	int ret;
+
+	ret = wait_event_interruptible(mqcdev->ul_wq,
+				       (!mqcdev->enabled || !mqcdev->open_count ||
+				       mhi_get_free_desc_count(mqcdev->mhi_dev,
+							       DMA_TO_DEVICE) > 0));
+
+	if (!mqcdev->open_count)
+		return -EPIPE;
+	if (!mqcdev->enabled)
+		return -ENODEV;
+
+	return ret;
+}
+
+static ssize_t mhi_qaic_ctrl_write(struct file *file, const char __user *buf,
+				   size_t count, loff_t *offp)
+{
+	struct mqc_dev *mqcdev = file->private_data;
+	struct mhi_device *mhi_dev;
+	size_t bytes_xfered = 0;
+	struct device *dev;
+	int ret, nr_desc;
+
+	mhi_dev = mqcdev->mhi_dev;
+	dev = &mhi_dev->dev;
+
+	if (!mhi_dev->ul_chan)
+		return -EOPNOTSUPP;
+
+	if (!buf || !count)
+		return -EINVAL;
+
+	dev_dbg(dev, "Request to transfer %zu bytes\n", count);
+
+	ret = mhi_qaic_ctrl_tx(mqcdev);
+	if (ret) {
+		dev_err(dev, "Failed to write %d\n", ret);
+		return ret;
+	}
+
+	if (mutex_lock_interruptible(&mqcdev->write_lock))
+		return -EINTR;
+
+	nr_desc = mhi_get_free_desc_count(mhi_dev, DMA_TO_DEVICE);
+	if (nr_desc * mqcdev->mtu < count) {
+		ret = -EMSGSIZE;
+		dev_dbg(dev, "Buffer too big to transfer\n");
+		goto unlock_mutex;
+	}
+
+	while (count != bytes_xfered) {
+		enum mhi_flags flags;
+		size_t to_copy;
+		void *kbuf;
+
+		to_copy = min_t(size_t, count - bytes_xfered, mqcdev->mtu);
+		kbuf = kmalloc(to_copy, GFP_KERNEL);
+		if (!kbuf) {
+			ret = -ENOMEM;
+			goto unlock_mutex;
+		}
+
+		ret = copy_from_user(kbuf, buf + bytes_xfered, to_copy);
+		if (ret) {
+			kfree(kbuf);
+			ret = -EFAULT;
+			goto unlock_mutex;
+		}
+
+		if (bytes_xfered + to_copy == count)
+			flags = MHI_EOT;
+		else
+			flags = MHI_CHAIN;
+
+		ret = mhi_queue_buf(mhi_dev, DMA_TO_DEVICE, kbuf, to_copy, flags);
+		if (ret) {
+			kfree(kbuf);
+			dev_err(dev, "Failed to queue buf of size %zu\n", to_copy);
+			goto unlock_mutex;
+		}
+
+		bytes_xfered += to_copy;
+	}
+
+	mutex_unlock(&mqcdev->write_lock);
+	dev_dbg(dev, "bytes xferred: %zu\n", bytes_xfered);
+
+	return bytes_xfered;
+
+unlock_mutex:
+	mutex_unlock(&mqcdev->write_lock);
+	return ret;
+}
+
+static int mhi_qaic_ctrl_rx(struct mqc_dev *mqcdev)
+{
+	int ret;
+
+	ret = wait_event_interruptible(mqcdev->dl_wq, (!mqcdev->enabled || !mqcdev->open_count ||
+				       !list_empty(&mqcdev->dl_queue)));
+
+	if (!mqcdev->open_count)
+		return -EPERM;
+	if (!mqcdev->enabled)
+		return -ENODEV;
+
+	return ret;
+}
+
+static ssize_t mhi_qaic_ctrl_read(struct file *file, char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct mqc_dev *mqcdev = file->private_data;
+	struct mqc_buf *ctrlbuf;
+	size_t to_copy;
+	int ret;
+
+	if (!mqcdev->mhi_dev->dl_chan)
+		return -EOPNOTSUPP;
+
+	ret = mhi_qaic_ctrl_rx(mqcdev);
+	if (ret) {
+		dev_err(&mqcdev->mhi_dev->dev, "Failed to read %d\n", ret);
+		return ret;
+	}
+
+	if (mutex_lock_interruptible(&mqcdev->read_lock))
+		return -EINTR;
+
+	ctrlbuf = list_first_entry_or_null(&mqcdev->dl_queue, struct mqc_buf, node);
+	if (!ctrlbuf) {
+		mutex_unlock(&mqcdev->read_lock);
+		dev_dbg(&mqcdev->mhi_dev->dev, "Device has been released\n");
+		ret = -ENODEV;
+		goto error_out;
+	}
+
+	to_copy = min_t(size_t, count, ctrlbuf->len);
+	if (copy_to_user(buf, ctrlbuf->data, to_copy)) {
+		mutex_unlock(&mqcdev->read_lock);
+		dev_dbg(&mqcdev->mhi_dev->dev, "Failed to copy data to user buffer\n");
+		ret = -EFAULT;
+		goto error_out;
+	}
+
+	ctrlbuf->len -= to_copy;
+	ctrlbuf->data += to_copy;
+
+	if (!ctrlbuf->len) {
+		spin_lock_bh(&mqcdev->dl_queue_lock);
+		mhi_qaic_ctrl_buf_free(ctrlbuf);
+		spin_unlock_bh(&mqcdev->dl_queue_lock);
+		mhi_qaic_ctrl_fill_dl_queue(mqcdev);
+		dev_dbg(&mqcdev->mhi_dev->dev, "Read buf freed\n");
+	}
+
+	mutex_unlock(&mqcdev->read_lock);
+	return to_copy;
+
+error_out:
+	mutex_unlock(&mqcdev->read_lock);
+	return ret;
+}
+
+static const struct file_operations mhidev_fops = {
+	.owner = THIS_MODULE,
+	.open = mhi_qaic_ctrl_open,
+	.release = mhi_qaic_ctrl_release,
+	.read = mhi_qaic_ctrl_read,
+	.write = mhi_qaic_ctrl_write,
+	.poll = mhi_qaic_ctrl_poll,
+};
+
+static void mhi_qaic_ctrl_ul_xfer_cb(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_result)
+{
+	struct mqc_dev *mqcdev = dev_get_drvdata(&mhi_dev->dev);
+
+	dev_dbg(&mhi_dev->dev, "%s: status: %d xfer_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	kfree(mhi_result->buf_addr);
+
+	if (!mhi_result->transaction_status)
+		wake_up_interruptible(&mqcdev->ul_wq);
+}
+
+static void mhi_qaic_ctrl_dl_xfer_cb(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_result)
+{
+	struct mqc_dev *mqcdev = dev_get_drvdata(&mhi_dev->dev);
+	struct mqc_buf *ctrlbuf;
+
+	dev_dbg(&mhi_dev->dev, "%s: status: %d receive_len: %zu\n", __func__,
+		mhi_result->transaction_status, mhi_result->bytes_xferd);
+
+	if (mhi_result->transaction_status &&
+	    mhi_result->transaction_status != -EOVERFLOW) {
+		kfree(mhi_result->buf_addr);
+		return;
+	}
+
+	ctrlbuf = mhi_result->buf_addr + mqcdev->mtu;
+	ctrlbuf->data = mhi_result->buf_addr;
+	ctrlbuf->len = mhi_result->bytes_xferd;
+	spin_lock_bh(&mqcdev->dl_queue_lock);
+	list_add_tail(&ctrlbuf->node, &mqcdev->dl_queue);
+	spin_unlock_bh(&mqcdev->dl_queue_lock);
+
+	wake_up_interruptible(&mqcdev->dl_wq);
+}
+
+static int mhi_qaic_ctrl_probe(struct mhi_device *mhi_dev,
+			       const struct mhi_device_id *id)
+{
+	struct mqc_dev *mqcdev;
+	struct device *dev;
+	int ret;
+
+	mqcdev = kzalloc(sizeof(*mqcdev), GFP_KERNEL);
+	if (!mqcdev)
+		return -ENOMEM;
+
+	kref_init(&mqcdev->ref_count);
+	mutex_init(&mqcdev->lock);
+	mqcdev->mhi_dev = mhi_dev;
+
+	ret = xa_alloc(&mqc_xa, &mqcdev->minor, mqcdev, XA_LIMIT(0, MHI_QAIC_CTRL_MAX_MINORS),
+		       GFP_KERNEL);
+	if (ret) {
+		kfree(mqcdev);
+		return ret;
+	}
+
+	init_waitqueue_head(&mqcdev->ul_wq);
+	init_waitqueue_head(&mqcdev->dl_wq);
+	mutex_init(&mqcdev->read_lock);
+	mutex_init(&mqcdev->write_lock);
+	spin_lock_init(&mqcdev->dl_queue_lock);
+	INIT_LIST_HEAD(&mqcdev->dl_queue);
+	mqcdev->mtu = min_t(size_t, id->driver_data, MHI_MAX_MTU);
+	mqcdev->enabled = true;
+	mqcdev->open_count = 0;
+	dev_set_drvdata(&mhi_dev->dev, mqcdev);
+
+	dev = device_create(mqc_dev_class, &mhi_dev->dev,
+			    MKDEV(mqc_dev_major, mqcdev->minor),
+			    mqcdev, "%s", dev_name(&mhi_dev->dev));
+	if (IS_ERR(dev)) {
+		xa_erase(&mqc_xa, mqcdev->minor);
+		dev_set_drvdata(&mhi_dev->dev, NULL);
+		kfree(mqcdev);
+		return PTR_ERR(dev);
+	}
+
+	return 0;
+};
+
+static void mhi_qaic_ctrl_remove(struct mhi_device *mhi_dev)
+{
+	struct mqc_dev *mqcdev = dev_get_drvdata(&mhi_dev->dev);
+
+	device_destroy(mqc_dev_class, MKDEV(mqc_dev_major, mqcdev->minor));
+
+	mutex_lock(&mqcdev->lock);
+	mqcdev->enabled = false;
+	if (mqcdev->open_count)
+		__mhi_qaic_ctrl_release(mqcdev);
+	mutex_unlock(&mqcdev->lock);
+
+	xa_erase(&mqc_xa, mqcdev->minor);
+	kref_put(&mqcdev->ref_count, mqc_dev_release);
+}
+
+/* .driver_data stores max mtu */
+static const struct mhi_device_id mhi_qaic_ctrl_match_table[] = {
+	{ .chan = "QAIC_SAHARA", .driver_data = SZ_32K},
+	{},
+};
+MODULE_DEVICE_TABLE(mhi, mhi_qaic_ctrl_match_table);
+
+static struct mhi_driver mhi_qaic_ctrl_driver = {
+	.id_table = mhi_qaic_ctrl_match_table,
+	.remove = mhi_qaic_ctrl_remove,
+	.probe = mhi_qaic_ctrl_probe,
+	.ul_xfer_cb = mhi_qaic_ctrl_ul_xfer_cb,
+	.dl_xfer_cb = mhi_qaic_ctrl_dl_xfer_cb,
+	.driver = {
+		.name = MHI_QAIC_CTRL_DRIVER_NAME,
+	},
+};
+
+int mhi_qaic_ctrl_init(void)
+{
+	int ret;
+
+	ret = register_chrdev(0, MHI_QAIC_CTRL_DRIVER_NAME, &mhidev_fops);
+	if (ret < 0)
+		return ret;
+
+	mqc_dev_major = ret;
+	mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
+	if (IS_ERR(mqc_dev_class)) {
+		ret = PTR_ERR(mqc_dev_class);
+		goto unregister_chrdev;
+	}
+
+	ret = mhi_driver_register(&mhi_qaic_ctrl_driver);
+	if (ret)
+		goto destroy_class;
+
+	return 0;
+
+destroy_class:
+	class_destroy(mqc_dev_class);
+unregister_chrdev:
+	unregister_chrdev(mqc_dev_major, MHI_QAIC_CTRL_DRIVER_NAME);
+	return ret;
+}
+
+void mhi_qaic_ctrl_deinit(void)
+{
+	mhi_driver_unregister(&mhi_qaic_ctrl_driver);
+	class_destroy(mqc_dev_class);
+	unregister_chrdev(mqc_dev_major, MHI_QAIC_CTRL_DRIVER_NAME);
+	xa_destroy(&mqc_xa);
+}
diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.h b/drivers/accel/qaic/mhi_qaic_ctrl.h
new file mode 100644
index 0000000..0545540
--- /dev/null
+++ b/drivers/accel/qaic/mhi_qaic_ctrl.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __MHI_QAIC_CTRL_H__
+#define __MHI_QAIC_CTRL_H__
+
+int mhi_qaic_ctrl_init(void);
+void mhi_qaic_ctrl_deinit(void);
+#endif /* __MHI_QAIC_CTRL_H__ */
-- 
2.7.4

