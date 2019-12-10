Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B8811875F
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2019 12:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfLJLw3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Dec 2019 06:52:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26664 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727715AbfLJLvv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Dec 2019 06:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575978710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9iewXkgZ98kUOBpFLU0jCIRcpaJJCeUS5vqH0PGqdK8=;
        b=hPWYbFSwxLeEOo51L1OzCiEk36HasmZMoyw9EMQUND68TtWs3h0XI51ctr0l0gLQLMdIZ8
        +ywgDF3UfBhXRzxIxm0KZTo63vmAn71S9F2M+yPrl5xHEOHl5hPLRYOsNK+fpyrCpK0UPB
        Mk1fXC+vlvxpwN3B6WSmYQ/RMS+LHVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-C22tcfImPcynyBIkcH4M7A-1; Tue, 10 Dec 2019 06:51:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77998028C9;
        Tue, 10 Dec 2019 11:51:44 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.144])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6397A5DA2C;
        Tue, 10 Dec 2019 11:51:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v10 05/10] test_firmware: add support for firmware_request_platform
Date:   Tue, 10 Dec 2019 12:51:12 +0100
Message-Id: <20191210115117.303935-6-hdegoede@redhat.com>
In-Reply-To: <20191210115117.303935-1-hdegoede@redhat.com>
References: <20191210115117.303935-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: C22tcfImPcynyBIkcH4M7A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for testing firmware_request_platform through a new
trigger_request_platform trigger.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 lib/test_firmware.c | 68 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index 251213c872b5..9af00cfc8979 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/vmalloc.h>
+#include <linux/efi_embedded_fw.h>
=20
 #define TEST_FIRMWARE_NAME=09"test-firmware.bin"
 #define TEST_FIRMWARE_NUM_REQS=094
@@ -507,12 +508,76 @@ static ssize_t trigger_request_store(struct device *d=
ev,
 }
 static DEVICE_ATTR_WO(trigger_request);
=20
+#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
+static ssize_t trigger_request_platform_store(struct device *dev,
+=09=09=09=09=09      struct device_attribute *attr,
+=09=09=09=09=09      const char *buf, size_t count)
+{
+=09static const u8 test_data[] =3D {
+=09=090x55, 0xaa, 0x55, 0xaa, 0x01, 0x02, 0x03, 0x04,
+=09=090x55, 0xaa, 0x55, 0xaa, 0x05, 0x06, 0x07, 0x08,
+=09=090x55, 0xaa, 0x55, 0xaa, 0x10, 0x20, 0x30, 0x40,
+=09=090x55, 0xaa, 0x55, 0xaa, 0x50, 0x60, 0x70, 0x80
+=09};
+=09struct efi_embedded_fw fw;
+=09int rc;
+=09char *name;
+
+=09name =3D kstrndup(buf, count, GFP_KERNEL);
+=09if (!name)
+=09=09return -ENOSPC;
+
+=09pr_info("inserting test platform fw '%s'\n", name);
+=09fw.name =3D name;
+=09fw.data =3D (void *)test_data;
+=09fw.length =3D sizeof(test_data);
+=09list_add(&fw.list, &efi_embedded_fw_list);
+
+=09pr_info("loading '%s'\n", name);
+
+=09mutex_lock(&test_fw_mutex);
+=09release_firmware(test_firmware);
+=09test_firmware =3D NULL;
+=09rc =3D firmware_request_platform(&test_firmware, name, dev);
+=09if (rc) {
+=09=09pr_info("load of '%s' failed: %d\n", name, rc);
+=09=09goto out;
+=09}
+=09if (test_firmware->size !=3D sizeof(test_data) ||
+=09    memcmp(test_firmware->data, test_data, sizeof(test_data)) !=3D 0) {
+=09=09pr_info("firmware contents mismatch for '%s'\n", name);
+=09=09rc =3D -EINVAL;
+=09=09goto out;
+=09}
+=09pr_info("loaded: %zu\n", test_firmware->size);
+=09rc =3D count;
+
+out:
+=09mutex_unlock(&test_fw_mutex);
+
+=09list_del(&fw.list);
+=09kfree(name);
+
+=09return rc;
+}
+static DEVICE_ATTR_WO(trigger_request_platform);
+#endif
+
 static DECLARE_COMPLETION(async_fw_done);
=20
 static void trigger_async_request_cb(const struct firmware *fw, void *cont=
ext)
 {
 =09test_firmware =3D fw;
 =09complete(&async_fw_done);
+
+
+
+
+
+
+
+
+
 }
=20
 static ssize_t trigger_async_request_store(struct device *dev,
@@ -903,6 +968,9 @@ static struct attribute *test_dev_attrs[] =3D {
 =09TEST_FW_DEV_ATTR(trigger_request),
 =09TEST_FW_DEV_ATTR(trigger_async_request),
 =09TEST_FW_DEV_ATTR(trigger_custom_fallback),
+#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
+=09TEST_FW_DEV_ATTR(trigger_request_platform),
+#endif
=20
 =09/* These use the config and can use the test_result */
 =09TEST_FW_DEV_ATTR(trigger_batched_requests),
--=20
2.23.0

