Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0DB659FBD0
	for <lists+linux-doc@lfdr.de>; Wed, 24 Aug 2022 15:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238460AbiHXNnW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Aug 2022 09:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238242AbiHXNmY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 09:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CE782873
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661348504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e3Bkq3aN6amBKLseh0Hxl3UHFIQU9oqlW2ZtdQVSRn4=;
        b=QDTaM5MEslXsRVG6NbHyBgydEHVuRixYXUbT/B2EVkeVWerI0l9L0/ZbKODjwrNpSAfw6B
        Ywpt84QwCZV8mMR9gbl557zmOngL4y6TXrSHymTj46eQ2J4uxclnAaRR1TzoMt6NJQ0o9V
        ZArbBv3N8BhbU9pjulqfTA/sNy2dgGc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-iJNxJag9PUen6a-RsQKLOQ-1; Wed, 24 Aug 2022 09:41:37 -0400
X-MC-Unique: iJNxJag9PUen6a-RsQKLOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1FD03801164;
        Wed, 24 Aug 2022 13:41:36 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.192.211])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A5A999459C;
        Wed, 24 Aug 2022 13:41:33 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>
Cc:     Tero Kristo <tero.kristo@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH bpf-next v9 10/23] HID: convert defines of HID class requests into a proper enum
Date:   Wed, 24 Aug 2022 15:40:40 +0200
Message-Id: <20220824134055.1328882-11-benjamin.tissoires@redhat.com>
In-Reply-To: <20220824134055.1328882-1-benjamin.tissoires@redhat.com>
References: <20220824134055.1328882-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This allows to export the type in BTF and so in the automatically
generated vmlinux.h. It will also add some static checks on the users
when we change the ll driver API (see not below).

Note that we need to also do change in the ll_driver API, but given
that this will have a wider impact outside of this tree, we leave this
as a TODO for the future.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

---

no changes in v9

no changes in v8

no changes in v7

new in v6
---
 drivers/hid/hid-core.c   |  6 +++---
 include/linux/hid.h      |  9 +++++----
 include/uapi/linux/hid.h | 14 ++++++++------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index ab98754522d9..aff37d6f587c 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1921,7 +1921,7 @@ static struct hid_report *hid_get_report(struct hid_report_enum *report_enum,
  * DO NOT USE in hid drivers directly, but through hid_hw_request instead.
  */
 int __hid_request(struct hid_device *hid, struct hid_report *report,
-		int reqtype)
+		enum hid_class_request reqtype)
 {
 	char *buf;
 	int ret;
@@ -2353,7 +2353,7 @@ EXPORT_SYMBOL_GPL(hid_hw_close);
  * @reqtype: hid request type
  */
 void hid_hw_request(struct hid_device *hdev,
-		    struct hid_report *report, int reqtype)
+		    struct hid_report *report, enum hid_class_request reqtype)
 {
 	if (hdev->ll_driver->request)
 		return hdev->ll_driver->request(hdev, report, reqtype);
@@ -2378,7 +2378,7 @@ EXPORT_SYMBOL_GPL(hid_hw_request);
  */
 int hid_hw_raw_request(struct hid_device *hdev,
 		       unsigned char reportnum, __u8 *buf,
-		       size_t len, enum hid_report_type rtype, int reqtype)
+		       size_t len, enum hid_report_type rtype, enum hid_class_request reqtype)
 {
 	if (len < 1 || len > HID_MAX_BUFFER_SIZE || !buf)
 		return -EINVAL;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index b1a33dbbc78e..8677ae38599e 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -923,7 +923,7 @@ struct hid_field *hidinput_get_led_field(struct hid_device *hid);
 unsigned int hidinput_count_leds(struct hid_device *hid);
 __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code);
 void hid_output_report(struct hid_report *report, __u8 *data);
-int __hid_request(struct hid_device *hid, struct hid_report *rep, int reqtype);
+int __hid_request(struct hid_device *hid, struct hid_report *rep, enum hid_class_request reqtype);
 u8 *hid_alloc_report_buf(struct hid_report *report, gfp_t flags);
 struct hid_device *hid_allocate_device(void);
 struct hid_report *hid_register_report(struct hid_device *device,
@@ -1100,10 +1100,11 @@ void hid_hw_stop(struct hid_device *hdev);
 int __must_check hid_hw_open(struct hid_device *hdev);
 void hid_hw_close(struct hid_device *hdev);
 void hid_hw_request(struct hid_device *hdev,
-		    struct hid_report *report, int reqtype);
+		    struct hid_report *report, enum hid_class_request reqtype);
 int hid_hw_raw_request(struct hid_device *hdev,
 		       unsigned char reportnum, __u8 *buf,
-		       size_t len, enum hid_report_type rtype, int reqtype);
+		       size_t len, enum hid_report_type rtype,
+		       enum hid_class_request reqtype);
 int hid_hw_output_report(struct hid_device *hdev, __u8 *buf, size_t len);
 
 /**
@@ -1131,7 +1132,7 @@ static inline int hid_hw_power(struct hid_device *hdev, int level)
  * @reqtype: hid request type
  */
 static inline int hid_hw_idle(struct hid_device *hdev, int report, int idle,
-		int reqtype)
+		enum hid_class_request reqtype)
 {
 	if (hdev->ll_driver->idle)
 		return hdev->ll_driver->idle(hdev, report, idle, reqtype);
diff --git a/include/uapi/linux/hid.h b/include/uapi/linux/hid.h
index b25b0bacaff2..a4dcb34386e3 100644
--- a/include/uapi/linux/hid.h
+++ b/include/uapi/linux/hid.h
@@ -58,12 +58,14 @@ enum hid_report_type {
  * HID class requests
  */
 
-#define HID_REQ_GET_REPORT		0x01
-#define HID_REQ_GET_IDLE		0x02
-#define HID_REQ_GET_PROTOCOL		0x03
-#define HID_REQ_SET_REPORT		0x09
-#define HID_REQ_SET_IDLE		0x0A
-#define HID_REQ_SET_PROTOCOL		0x0B
+enum hid_class_request {
+	HID_REQ_GET_REPORT		= 0x01,
+	HID_REQ_GET_IDLE		= 0x02,
+	HID_REQ_GET_PROTOCOL		= 0x03,
+	HID_REQ_SET_REPORT		= 0x09,
+	HID_REQ_SET_IDLE		= 0x0A,
+	HID_REQ_SET_PROTOCOL		= 0x0B,
+};
 
 /*
  * HID class descriptor types
-- 
2.36.1

