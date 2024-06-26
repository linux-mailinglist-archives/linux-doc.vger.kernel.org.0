Return-Path: <linux-doc+bounces-19541-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 458039182FF
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 15:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6E551F21AB0
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 13:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A06185E7B;
	Wed, 26 Jun 2024 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3FFU1Xc"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35614532F;
	Wed, 26 Jun 2024 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409609; cv=none; b=bnkx5Io6LmW9OGmIZsMgPcR8lZoHvUOFoTbi3wxM8Rn2NqH0YKUppF+RyoUD4bf/wa+GHNIxEmZqEuS4MU9x84MBjTS8AB8daIMgAAdTVSCQxxzKlwMxVXJEisEY0EqLX1Givt35qnm96B0QQz4+QMQ2p/wSeU8eAdpIHlrZsCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409609; c=relaxed/simple;
	bh=tAsYMlo1Ovv0H5S+75rkuRY9Nw2ig/ce307eySvXa60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGpzNFra/IjlDFgWYhhRl2AQSmWZygDOq55kxV03mXzOmceJDfliKUxwl8fvK6e62UhqVyTfIhWW47LlEMZUaBIyY44g51PJvUWUrMJidV6OoHqi4BnD/gKkFl2oAQleqnm4rnErtvlEzubogjcuG63gNm6GjdTBpwwIj1nLaxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3FFU1Xc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E4CC32782;
	Wed, 26 Jun 2024 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719409609;
	bh=tAsYMlo1Ovv0H5S+75rkuRY9Nw2ig/ce307eySvXa60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f3FFU1XcFPE00VmE4pkVIEGq+CNRfcReImX2ssGtzDo0QTaWrmaF7n/9+KUpz5OYC
	 IFh5eEJ/UUZ0p6bzOeJDcGgDhh+rsqpR3g/iKybLPyW9kTZBeGlxlhzBWQ/oxZHPP/
	 TuK38jmqo8mmi1LkK9VqOt9QhVJoOF2/uSNvSgcepINAseUixsqZilmpzPhciH0zVr
	 PAO9+HQNJfyPs/JhkbXUe8NYHXvyrZAGUeW6hNgXYnSqA7Xc07t6pjOQcO889ZG5gk
	 yL+BVkegfUcFYXpkKnR/MgpAxrEv3I9k7F5FbOBu4f0q8oPxTPCTUT82PK11C3/P/X
	 2pdedVBvCjr6g==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Wed, 26 Jun 2024 15:46:23 +0200
Subject: [PATCH HID v2 02/13] HID: add source argument to HID low level
 functions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-hid_hw_req_bpf-v2-2-cfd60fb6c79f@kernel.org>
References: <20240626-hid_hw_req_bpf-v2-0-cfd60fb6c79f@kernel.org>
In-Reply-To: <20240626-hid_hw_req_bpf-v2-0-cfd60fb6c79f@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719409602; l=12470;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=tAsYMlo1Ovv0H5S+75rkuRY9Nw2ig/ce307eySvXa60=;
 b=99vHk1K8HHmAA6iAhZKj9V+UMcoTd6LneDJ1BK4kzWEfQqxbLE4PGKk7RWNBsEmx6wcoG+f6D
 5RWKs7q8LQCBPRPpggGG5p/x+i3J/a6245sssKP+Dk6JTel4fNn/RoV
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

This allows to know who actually sent what when we process the request
to the device.
This will be useful for a BPF firewall program to allow or not requests
coming from a dedicated hidraw node client.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

---

no changes in v2
---
 drivers/hid/bpf/hid_bpf_dispatch.c   | 12 ++---
 drivers/hid/bpf/hid_bpf_struct_ops.c |  2 +-
 drivers/hid/hid-core.c               | 85 ++++++++++++++++++++++--------------
 drivers/hid/hidraw.c                 | 10 ++---
 include/linux/hid.h                  |  6 +++
 include/linux/hid_bpf.h              | 16 ++++---
 6 files changed, 82 insertions(+), 49 deletions(-)

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index b7b11a7c69db..2df31decaac3 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -24,7 +24,7 @@ EXPORT_SYMBOL(hid_ops);
 
 u8 *
 dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type, u8 *data,
-			      u32 *size, int interrupt)
+			      u32 *size, int interrupt, u64 source)
 {
 	struct hid_bpf_ctx_kern ctx_kern = {
 		.ctx = {
@@ -50,7 +50,7 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_type type
 	rcu_read_lock();
 	list_for_each_entry_rcu(e, &hdev->bpf.prog_list, list) {
 		if (e->hid_device_event) {
-			ret = e->hid_device_event(&ctx_kern.ctx, type);
+			ret = e->hid_device_event(&ctx_kern.ctx, type, source);
 			if (ret < 0) {
 				rcu_read_unlock();
 				return ERR_PTR(ret);
@@ -359,7 +359,8 @@ hid_bpf_hw_request(struct hid_bpf_ctx *ctx, __u8 *buf, size_t buf__sz,
 					      dma_data,
 					      size,
 					      rtype,
-					      reqtype);
+					      reqtype,
+					      (__u64)ctx);
 
 	if (ret > 0)
 		memcpy(buf, dma_data, ret);
@@ -398,7 +399,8 @@ hid_bpf_hw_output_report(struct hid_bpf_ctx *ctx, __u8 *buf, size_t buf__sz)
 
 	ret = hid_ops->hid_hw_output_report(hdev,
 						dma_data,
-						size);
+						size,
+						(__u64)ctx);
 
 	kfree(dma_data);
 	return ret;
@@ -429,7 +431,7 @@ hid_bpf_input_report(struct hid_bpf_ctx *ctx, enum hid_report_type type, u8 *buf
 
 	hdev = (struct hid_device *)ctx->hid; /* discard const */
 
-	return hid_ops->hid_input_report(hdev, type, buf, size, 0);
+	return hid_ops->hid_input_report(hdev, type, buf, size, 0, (__u64)ctx);
 }
 __bpf_kfunc_end_defs();
 
diff --git a/drivers/hid/bpf/hid_bpf_struct_ops.c b/drivers/hid/bpf/hid_bpf_struct_ops.c
index 5f200557ff12..8063db1c8d62 100644
--- a/drivers/hid/bpf/hid_bpf_struct_ops.c
+++ b/drivers/hid/bpf/hid_bpf_struct_ops.c
@@ -257,7 +257,7 @@ static void hid_bpf_unreg(void *kdata)
 	hid_put_device(hdev);
 }
 
-static int __hid_bpf_device_event(struct hid_bpf_ctx *ctx, enum hid_report_type type)
+static int __hid_bpf_device_event(struct hid_bpf_ctx *ctx, enum hid_report_type type, __u64 source)
 {
 	return 0;
 }
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index aed8850a4d01..0775a32f5272 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2025,19 +2025,9 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 }
 EXPORT_SYMBOL_GPL(hid_report_raw_event);
 
-/**
- * hid_input_report - report data from lower layer (usb, bt...)
- *
- * @hid: hid device
- * @type: HID report type (HID_*_REPORT)
- * @data: report contents
- * @size: size of data parameter
- * @interrupt: distinguish between interrupt and control transfers
- *
- * This is data entry for lower layers.
- */
-int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
-		     int interrupt)
+
+static int __hid_input_report(struct hid_device *hid, enum hid_report_type type,
+			      u8 *data, u32 size, int interrupt, u64 source)
 {
 	struct hid_report_enum *report_enum;
 	struct hid_driver *hdrv;
@@ -2057,7 +2047,7 @@ int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data
 	report_enum = hid->report_enum + type;
 	hdrv = hid->driver;
 
-	data = dispatch_hid_bpf_device_event(hid, type, data, &size, interrupt);
+	data = dispatch_hid_bpf_device_event(hid, type, data, &size, interrupt, source);
 	if (IS_ERR(data)) {
 		ret = PTR_ERR(data);
 		goto unlock;
@@ -2092,6 +2082,23 @@ int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data
 	up(&hid->driver_input_lock);
 	return ret;
 }
+
+/**
+ * hid_input_report - report data from lower layer (usb, bt...)
+ *
+ * @hid: hid device
+ * @type: HID report type (HID_*_REPORT)
+ * @data: report contents
+ * @size: size of data parameter
+ * @interrupt: distinguish between interrupt and control transfers
+ *
+ * This is data entry for lower layers.
+ */
+int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8 *data, u32 size,
+		     int interrupt)
+{
+	return __hid_input_report(hid, type, data, size, interrupt, 0);
+}
 EXPORT_SYMBOL_GPL(hid_input_report);
 
 bool hid_match_one_id(const struct hid_device *hdev,
@@ -2392,6 +2399,24 @@ void hid_hw_request(struct hid_device *hdev,
 }
 EXPORT_SYMBOL_GPL(hid_hw_request);
 
+int __hid_hw_raw_request(struct hid_device *hdev,
+			 unsigned char reportnum, __u8 *buf,
+			 size_t len, enum hid_report_type rtype,
+			 enum hid_class_request reqtype,
+			 __u64 source)
+{
+	unsigned int max_buffer_size = HID_MAX_BUFFER_SIZE;
+
+	if (hdev->ll_driver->max_buffer_size)
+		max_buffer_size = hdev->ll_driver->max_buffer_size;
+
+	if (len < 1 || len > max_buffer_size || !buf)
+		return -EINVAL;
+
+	return hdev->ll_driver->raw_request(hdev, reportnum, buf, len,
+					    rtype, reqtype);
+}
+
 /**
  * hid_hw_raw_request - send report request to device
  *
@@ -2409,6 +2434,12 @@ EXPORT_SYMBOL_GPL(hid_hw_request);
 int hid_hw_raw_request(struct hid_device *hdev,
 		       unsigned char reportnum, __u8 *buf,
 		       size_t len, enum hid_report_type rtype, enum hid_class_request reqtype)
+{
+	return __hid_hw_raw_request(hdev, reportnum, buf, len, rtype, reqtype, 0);
+}
+EXPORT_SYMBOL_GPL(hid_hw_raw_request);
+
+int __hid_hw_output_report(struct hid_device *hdev, __u8 *buf, size_t len, __u64 source)
 {
 	unsigned int max_buffer_size = HID_MAX_BUFFER_SIZE;
 
@@ -2418,10 +2449,11 @@ int hid_hw_raw_request(struct hid_device *hdev,
 	if (len < 1 || len > max_buffer_size || !buf)
 		return -EINVAL;
 
-	return hdev->ll_driver->raw_request(hdev, reportnum, buf, len,
-					    rtype, reqtype);
+	if (hdev->ll_driver->output_report)
+		return hdev->ll_driver->output_report(hdev, buf, len);
+
+	return -ENOSYS;
 }
-EXPORT_SYMBOL_GPL(hid_hw_raw_request);
 
 /**
  * hid_hw_output_report - send output report to device
@@ -2434,18 +2466,7 @@ EXPORT_SYMBOL_GPL(hid_hw_raw_request);
  */
 int hid_hw_output_report(struct hid_device *hdev, __u8 *buf, size_t len)
 {
-	unsigned int max_buffer_size = HID_MAX_BUFFER_SIZE;
-
-	if (hdev->ll_driver->max_buffer_size)
-		max_buffer_size = hdev->ll_driver->max_buffer_size;
-
-	if (len < 1 || len > max_buffer_size || !buf)
-		return -EINVAL;
-
-	if (hdev->ll_driver->output_report)
-		return hdev->ll_driver->output_report(hdev, buf, len);
-
-	return -ENOSYS;
+	return __hid_hw_output_report(hdev, buf, len, 0);
 }
 EXPORT_SYMBOL_GPL(hid_hw_output_report);
 
@@ -2972,9 +2993,9 @@ EXPORT_SYMBOL_GPL(hid_check_keys_pressed);
 #ifdef CONFIG_HID_BPF
 static struct hid_ops __hid_ops = {
 	.hid_get_report = hid_get_report,
-	.hid_hw_raw_request = hid_hw_raw_request,
-	.hid_hw_output_report = hid_hw_output_report,
-	.hid_input_report = hid_input_report,
+	.hid_hw_raw_request = __hid_hw_raw_request,
+	.hid_hw_output_report = __hid_hw_output_report,
+	.hid_input_report = __hid_input_report,
 	.owner = THIS_MODULE,
 	.bus_type = &hid_bus_type,
 };
diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 2bc762d31ac7..6d2a6d38e42a 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -140,7 +140,7 @@ static ssize_t hidraw_send_report(struct file *file, const char __user *buffer,
 
 	if ((report_type == HID_OUTPUT_REPORT) &&
 	    !(dev->quirks & HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP)) {
-		ret = hid_hw_output_report(dev, buf, count);
+		ret = __hid_hw_output_report(dev, buf, count, (__u64)file);
 		/*
 		 * compatibility with old implementation of USB-HID and I2C-HID:
 		 * if the device does not support receiving output reports,
@@ -150,8 +150,8 @@ static ssize_t hidraw_send_report(struct file *file, const char __user *buffer,
 			goto out_free;
 	}
 
-	ret = hid_hw_raw_request(dev, buf[0], buf, count, report_type,
-				HID_REQ_SET_REPORT);
+	ret = __hid_hw_raw_request(dev, buf[0], buf, count, report_type,
+				   HID_REQ_SET_REPORT, (__u64)file);
 
 out_free:
 	kfree(buf);
@@ -227,8 +227,8 @@ static ssize_t hidraw_get_report(struct file *file, char __user *buffer, size_t
 		goto out_free;
 	}
 
-	ret = hid_hw_raw_request(dev, report_number, buf, count, report_type,
-				 HID_REQ_GET_REPORT);
+	ret = __hid_hw_raw_request(dev, report_number, buf, count, report_type,
+				   HID_REQ_GET_REPORT, (__u64)file);
 
 	if (ret < 0)
 		goto out_free;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8e06d89698e6..dac2804b4562 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1125,6 +1125,12 @@ int __must_check hid_hw_open(struct hid_device *hdev);
 void hid_hw_close(struct hid_device *hdev);
 void hid_hw_request(struct hid_device *hdev,
 		    struct hid_report *report, enum hid_class_request reqtype);
+int __hid_hw_raw_request(struct hid_device *hdev,
+			 unsigned char reportnum, __u8 *buf,
+			 size_t len, enum hid_report_type rtype,
+			 enum hid_class_request reqtype,
+			 __u64 source);
+int __hid_hw_output_report(struct hid_device *hdev, __u8 *buf, size_t len, __u64 source);
 int hid_hw_raw_request(struct hid_device *hdev,
 		       unsigned char reportnum, __u8 *buf,
 		       size_t len, enum hid_report_type rtype,
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index 65d7e0acc8c2..a54741db0415 100644
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@ -66,10 +66,12 @@ struct hid_ops {
 	int (*hid_hw_raw_request)(struct hid_device *hdev,
 				  unsigned char reportnum, __u8 *buf,
 				  size_t len, enum hid_report_type rtype,
-				  enum hid_class_request reqtype);
-	int (*hid_hw_output_report)(struct hid_device *hdev, __u8 *buf, size_t len);
+				  enum hid_class_request reqtype,
+				  __u64 source);
+	int (*hid_hw_output_report)(struct hid_device *hdev, __u8 *buf, size_t len,
+				    __u64 source);
 	int (*hid_input_report)(struct hid_device *hid, enum hid_report_type type,
-				u8 *data, u32 size, int interrupt);
+				u8 *data, u32 size, int interrupt, u64 source);
 	struct module *owner;
 	const struct bus_type *bus_type;
 };
@@ -110,7 +112,8 @@ struct hid_bpf_ops {
 	 *
 	 * Context: Interrupt context.
 	 */
-	int (*hid_device_event)(struct hid_bpf_ctx *ctx, enum hid_report_type report_type);
+	int (*hid_device_event)(struct hid_bpf_ctx *ctx, enum hid_report_type report_type,
+				__u64 source);
 
 	/**
 	 * @hid_rdesc_fixup: called when the probe function parses the report descriptor
@@ -146,7 +149,7 @@ struct hid_bpf {
 
 #ifdef CONFIG_HID_BPF
 u8 *dispatch_hid_bpf_device_event(struct hid_device *hid, enum hid_report_type type, u8 *data,
-				  u32 *size, int interrupt);
+				  u32 *size, int interrupt, u64 source);
 int hid_bpf_connect_device(struct hid_device *hdev);
 void hid_bpf_disconnect_device(struct hid_device *hdev);
 void hid_bpf_destroy_device(struct hid_device *hid);
@@ -154,7 +157,8 @@ void hid_bpf_device_init(struct hid_device *hid);
 u8 *call_hid_bpf_rdesc_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *size);
 #else /* CONFIG_HID_BPF */
 static inline u8 *dispatch_hid_bpf_device_event(struct hid_device *hid, enum hid_report_type type,
-						u8 *data, u32 *size, int interrupt) { return data; }
+						u8 *data, u32 *size, int interrupt,
+						u64 source) { return data; }
 static inline int hid_bpf_connect_device(struct hid_device *hdev) { return 0; }
 static inline void hid_bpf_disconnect_device(struct hid_device *hdev) {}
 static inline void hid_bpf_destroy_device(struct hid_device *hid) {}

-- 
2.44.0


