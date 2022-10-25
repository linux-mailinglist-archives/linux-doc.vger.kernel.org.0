Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA2E60C855
	for <lists+linux-doc@lfdr.de>; Tue, 25 Oct 2022 11:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbiJYJg2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Oct 2022 05:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbiJYJf7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 05:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9265F101184
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666690524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RHcambJWvEK/XhdAms9KGjFabN2WVNwXlubD1rms2qI=;
        b=Pqu/XEJE268AykXYm08B3dt4XGN/ocBE1ad7Lsa/tw3DUGibL2q6Qs//yr8mY+3MTwzgaE
        M3GG7tbFGiuNO3YKccS9gZVpwzlzkOMCfN8I+UNkoklzxfgsQXx5uBLVI5XUrhHESCij3v
        1BqRSpCexvLzxRa/QHlmhdQOn3rbKRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-BKG1aKn1NPK3xGiyz-x09g-1; Tue, 25 Oct 2022 05:35:18 -0400
X-MC-Unique: BKG1aKn1NPK3xGiyz-x09g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFBEF800B23;
        Tue, 25 Oct 2022 09:35:17 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.195.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 35B9A492CA2;
        Tue, 25 Oct 2022 09:35:16 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc:     Tero Kristo <tero.kristo@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH hid v11 07/14] HID: bpf: introduce hid_hw_request()
Date:   Tue, 25 Oct 2022 11:34:51 +0200
Message-Id: <20221025093458.457089-8-benjamin.tissoires@redhat.com>
In-Reply-To: <20221025093458.457089-1-benjamin.tissoires@redhat.com>
References: <20221025093458.457089-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This function can not be called under IRQ, thus it is only available
while in SEC("syscall").
For consistency, this function requires a HID-BPF context to work with,
and so we also provide a helper to create one based on the HID unique
ID.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

no changes in v11

no changes in v10

changes in v9:
- fixed kfunc declaration aaccording to latest upstream changes

no changes in v8

changes in v7:
- hid_bpf_allocate_context: remove unused variable
- ensures buf is not NULL

changes in v6:
- rename parameter size into buf__sz to teach the verifier about
  the actual buffer size used by the call
- remove the allocated data in the user created context, it's not used

new-ish in v5
---
 drivers/hid/bpf/hid_bpf_dispatch.c | 132 +++++++++++++++++++++++++++++
 drivers/hid/hid-core.c             |   2 +
 include/linux/hid_bpf.h            |  13 ++-
 3 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf_dispatch.c
index efd4e4b4a615..c657222f914d 100644
--- a/drivers/hid/bpf/hid_bpf_dispatch.c
+++ b/drivers/hid/bpf/hid_bpf_dispatch.c
@@ -220,9 +220,141 @@ hid_bpf_attach_prog(unsigned int hid_id, int prog_fd, __u32 flags)
 	return __hid_bpf_attach_prog(hdev, prog_type, prog_fd, flags);
 }
 
+/**
+ * hid_bpf_allocate_context - Allocate a context to the given HID device
+ *
+ * @hid_id: the system unique identifier of the HID device
+ *
+ * @returns A pointer to &struct hid_bpf_ctx on success, %NULL on error.
+ */
+noinline struct hid_bpf_ctx *
+hid_bpf_allocate_context(unsigned int hid_id)
+{
+	struct hid_device *hdev;
+	struct hid_bpf_ctx_kern *ctx_kern = NULL;
+	struct device *dev;
+
+	if (!hid_bpf_ops)
+		return NULL;
+
+	dev = bus_find_device(hid_bpf_ops->bus_type, NULL, &hid_id, device_match_id);
+	if (!dev)
+		return NULL;
+
+	hdev = to_hid_device(dev);
+
+	ctx_kern = kzalloc(sizeof(*ctx_kern), GFP_KERNEL);
+	if (!ctx_kern)
+		return NULL;
+
+	ctx_kern->ctx.hid = hdev;
+
+	return &ctx_kern->ctx;
+}
+
+/**
+ * hid_bpf_release_context - Release the previously allocated context @ctx
+ *
+ * @ctx: the HID-BPF context to release
+ *
+ */
+noinline void
+hid_bpf_release_context(struct hid_bpf_ctx *ctx)
+{
+	struct hid_bpf_ctx_kern *ctx_kern;
+
+	if (!ctx)
+		return;
+
+	ctx_kern = container_of(ctx, struct hid_bpf_ctx_kern, ctx);
+
+	kfree(ctx_kern);
+}
+
+/**
+ * hid_bpf_hw_request - Communicate with a HID device
+ *
+ * @ctx: the HID-BPF context previously allocated in hid_bpf_allocate_context()
+ * @buf: a %PTR_TO_MEM buffer
+ * @buf__sz: the size of the data to transfer
+ * @rtype: the type of the report (%HID_INPUT_REPORT, %HID_FEATURE_REPORT, %HID_OUTPUT_REPORT)
+ * @reqtype: the type of the request (%HID_REQ_GET_REPORT, %HID_REQ_SET_REPORT, ...)
+ *
+ * @returns %0 on success, a negative error code otherwise.
+ */
+noinline int
+hid_bpf_hw_request(struct hid_bpf_ctx *ctx, __u8 *buf, size_t buf__sz,
+		   enum hid_report_type rtype, enum hid_class_request reqtype)
+{
+	struct hid_device *hdev = (struct hid_device *)ctx->hid; /* discard const */
+	struct hid_report *report;
+	struct hid_report_enum *report_enum;
+	u8 *dma_data;
+	u32 report_len;
+	int ret;
+
+	/* check arguments */
+	if (!ctx || !hid_bpf_ops || !buf)
+		return -EINVAL;
+
+	switch (rtype) {
+	case HID_INPUT_REPORT:
+	case HID_OUTPUT_REPORT:
+	case HID_FEATURE_REPORT:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (reqtype) {
+	case HID_REQ_GET_REPORT:
+	case HID_REQ_GET_IDLE:
+	case HID_REQ_GET_PROTOCOL:
+	case HID_REQ_SET_REPORT:
+	case HID_REQ_SET_IDLE:
+	case HID_REQ_SET_PROTOCOL:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (buf__sz < 1)
+		return -EINVAL;
+
+	report_enum = hdev->report_enum + rtype;
+	report = hid_bpf_ops->hid_get_report(report_enum, buf);
+	if (!report)
+		return -EINVAL;
+
+	report_len = hid_report_len(report);
+
+	if (buf__sz > report_len)
+		buf__sz = report_len;
+
+	dma_data = kmemdup(buf, buf__sz, GFP_KERNEL);
+	if (!dma_data)
+		return -ENOMEM;
+
+	ret = hid_bpf_ops->hid_hw_raw_request(hdev,
+					      dma_data[0],
+					      dma_data,
+					      buf__sz,
+					      rtype,
+					      reqtype);
+
+	if (ret > 0)
+		memcpy(buf, dma_data, ret);
+
+	kfree(dma_data);
+	return ret;
+}
+
 /* for syscall HID-BPF */
 BTF_SET8_START(hid_bpf_syscall_kfunc_ids)
 BTF_ID_FLAGS(func, hid_bpf_attach_prog)
+BTF_ID_FLAGS(func, hid_bpf_allocate_context, KF_ACQUIRE | KF_RET_NULL)
+BTF_ID_FLAGS(func, hid_bpf_release_context, KF_RELEASE)
+BTF_ID_FLAGS(func, hid_bpf_hw_request)
 BTF_SET8_END(hid_bpf_syscall_kfunc_ids)
 
 static const struct btf_kfunc_id_set hid_bpf_syscall_kfunc_set = {
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 6bee65624551..5dac2a1cc205 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2918,6 +2918,8 @@ int hid_check_keys_pressed(struct hid_device *hid)
 EXPORT_SYMBOL_GPL(hid_check_keys_pressed);
 
 static struct hid_bpf_ops hid_ops = {
+	.hid_get_report = hid_get_report,
+	.hid_hw_raw_request = hid_hw_raw_request,
 	.owner = THIS_MODULE,
 	.bus_type = &hid_bus_type,
 };
diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
index 277afae784ec..bf83d5811c51 100644
--- a/include/linux/hid_bpf.h
+++ b/include/linux/hid_bpf.h
@@ -61,11 +61,15 @@ struct hid_bpf_ctx {
 int hid_bpf_device_event(struct hid_bpf_ctx *ctx);
 
 /* Following functions are kfunc that we export to BPF programs */
-/* only available in tracing */
+/* available everywhere in HID-BPF */
 __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx, unsigned int offset, const size_t __sz);
 
 /* only available in syscall */
 int hid_bpf_attach_prog(unsigned int hid_id, int prog_fd, __u32 flags);
+int hid_bpf_hw_request(struct hid_bpf_ctx *ctx, __u8 *buf, size_t buf__sz,
+		       enum hid_report_type rtype, enum hid_class_request reqtype);
+struct hid_bpf_ctx *hid_bpf_allocate_context(unsigned int hid_id);
+void hid_bpf_release_context(struct hid_bpf_ctx *ctx);
 
 /*
  * Below is HID internal
@@ -84,7 +88,14 @@ enum hid_bpf_prog_type {
 	HID_BPF_PROG_TYPE_MAX,
 };
 
+struct hid_report_enum;
+
 struct hid_bpf_ops {
+	struct hid_report *(*hid_get_report)(struct hid_report_enum *report_enum, const u8 *data);
+	int (*hid_hw_raw_request)(struct hid_device *hdev,
+				  unsigned char reportnum, __u8 *buf,
+				  size_t len, enum hid_report_type rtype,
+				  enum hid_class_request reqtype);
 	struct module *owner;
 	struct bus_type *bus_type;
 };
-- 
2.36.1

