Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A31B2E0023
	for <lists+linux-doc@lfdr.de>; Mon, 21 Dec 2020 19:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgLUSlK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Dec 2020 13:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbgLUSlJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Dec 2020 13:41:09 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB02C0611CE;
        Mon, 21 Dec 2020 10:40:34 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c133so10818917wme.4;
        Mon, 21 Dec 2020 10:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yuvqfb3eqkcFuounQ//SI/2hZ9LQ3BeEwNo0ZFOOOCI=;
        b=uuyXeq6pRTGgrTfgzSSqUOq1yycnsJCNR0VXbC8NRYQv8m72JKj+PdHrpY1pHFKjpX
         kFSYBul5vmsJxZ+stGNFaePVQETSoacg7iKJMHfTd764P4KLINkWyysWXdHOk6MPHnpe
         u4CG7R9wzGDO2srwO3hxgn+zIYOYGG9c5mUB/t9l6HoT83bUb+FWX4E1xpH/eQN8Cm2L
         JAqZW+edoinSbLoVyGLiHXA6ZNcfdKcl1+NvqpVCLJNetc1YHZACv0dwATVoxDUw+TUI
         7RXppIZQHbpVizzXOVydN5sApGu/SKcHUuyNl1WKm7KV3l3OLDJpA/1o4PgY3oyHxhyh
         wcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yuvqfb3eqkcFuounQ//SI/2hZ9LQ3BeEwNo0ZFOOOCI=;
        b=f49574FzY4nmqjxj4/2IqpEcFHTf+AKFgoaMEO5gvp2DF9fSTv/SNnk4kIVfXRSxoR
         aEejD76M4FNCwhWYMvi6qww6omqEL9/T9op/b08x7B7akDVbQq/+w+lGJn6mmrSEQTEd
         bRabTnxR736P3AAEDu3IYB9Y7GYzzcYrjsxKhEAc93IartzbG6UvrWGEd3FJaTVJjVhm
         H3XB29Hv8sk33MG1xNnK2NMycDvLlkWDoEWas7sGmjKlQrVCX1uBlcBObL0Msf+h3k5i
         hrZ+7GY5vb0U8phny+PINBYnqRUIY9noOSg6Ftqzn9LCxLUEKIGm8O5gkRZgoGszYEgd
         c5YQ==
X-Gm-Message-State: AOAM532rhw6l5F2fABFyHHCPO7QNWxJ8U9E25x2LSp8kTkxlXljdJK6b
        xthDwkvKs44a/g07Hw4RkXYJUTZ8TxsfYQ==
X-Google-Smtp-Source: ABdhPJw8pV+VkLuZQDygSQKwrNjb/BPndqwHAYqnDRayG7Clf4MB746bkHOv3xFqD30OcjUgtuHoUA==
X-Received: by 2002:a1c:b407:: with SMTP id d7mr18197680wmf.34.1608576031590;
        Mon, 21 Dec 2020 10:40:31 -0800 (PST)
Received: from xws.fritz.box (pd9e5aae0.dip0.t-ipconnect.de. [217.229.170.224])
        by smtp.gmail.com with ESMTPSA id j7sm24528310wmb.40.2020.12.21.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 10:40:30 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 9/9] platform/surface: Add Surface ACPI Notify driver
Date:   Mon, 21 Dec 2020 19:39:59 +0100
Message-Id: <20201221183959.1186143-10-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221183959.1186143-1-luzmaximilian@gmail.com>
References: <20201221183959.1186143-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Surface ACPI Notify (SAN) device provides an ACPI interface to the
Surface Aggregator EC, specifically the Surface Serial Hub interface.
This interface allows EC requests to be made from ACPI code and can
convert a subset of EC events back to ACPI notifications.

Specifically, this interface provides a GenericSerialBus operation
region ACPI code can execute a request by writing the request command
data and payload to this operation region and reading back the
corresponding response via a write-then-read operation. Furthermore,
this interface provides a _DSM method to be called when certain events
from the EC have been received, essentially turning them into ACPI
notifications.

The driver provided in this commit essentially takes care of translating
the request data written to the operation region, executing the request,
waiting for it to finish, and finally writing and translating back the
response (if the request has one). Furthermore, this driver takes care
of enabling the events handled via ACPI _DSM calls. Lastly, this driver
also exposes an interface providing discrete GPU (dGPU) power-on
notifications on the Surface Book 2, which are also received via the
operation region interface (but not handled by the SAN driver directly),
making them accessible to other drivers (such as a dGPU hot-plug driver
that may be added later on).

On 5th and 6th generation Surface devices (Surface Pro 5/2017, Pro 6,
Book 2, Laptop 1 and 2), the SAN interface provides full battery and
thermal subsystem access, as well as other EC based functionality. On
those models, battery and thermal sensor devices are implemented as
standard ACPI devices of that type, however, forward ACPI calls to the
corresponding Surface Aggregator EC request via the SAN interface and
receive corresponding notifications (e.g. battery information change)
from it. This interface is therefore required to provide said
functionality on those devices.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---

Changes in v1 (from RFC):
 - add copyright lines
 - change SPDX identifier to GPL-2.0+ (was GPL-2.0-or-later)
 - fix invalid pointer calculation in san_evt_tmp
 - add explicit dependency on CONFIG_ACPI
 - remove default in Kconfig

Changes in v2:
 - drop explicit dependency on ACPI in Kconfig
 - use printk specifier for hex prefix instead of hard-coding it
 - spell check comments and strings, fix typos
 - unify comment style
 - run checkpatch --strict, fix warnings and style issues

---
 .../surface_aggregator/clients/index.rst      |   1 +
 .../surface_aggregator/clients/san.rst        |  44 +
 MAINTAINERS                                   |   2 +
 drivers/platform/surface/Kconfig              |  19 +
 drivers/platform/surface/Makefile             |   1 +
 .../platform/surface/surface_acpi_notify.c    | 886 ++++++++++++++++++
 include/linux/surface_acpi_notify.h           |  39 +
 7 files changed, 992 insertions(+)
 create mode 100644 Documentation/driver-api/surface_aggregator/clients/san.rst
 create mode 100644 drivers/platform/surface/surface_acpi_notify.c
 create mode 100644 include/linux/surface_acpi_notify.h

diff --git a/Documentation/driver-api/surface_aggregator/clients/index.rst b/Documentation/driver-api/surface_aggregator/clients/index.rst
index ab260ec82cfb..3ccabce23271 100644
--- a/Documentation/driver-api/surface_aggregator/clients/index.rst
+++ b/Documentation/driver-api/surface_aggregator/clients/index.rst
@@ -11,6 +11,7 @@ This is the documentation for client drivers themselves. Refer to
    :maxdepth: 1
 
    cdev
+   san
 
 .. only::  subproject and html
 
diff --git a/Documentation/driver-api/surface_aggregator/clients/san.rst b/Documentation/driver-api/surface_aggregator/clients/san.rst
new file mode 100644
index 000000000000..38c2580e7758
--- /dev/null
+++ b/Documentation/driver-api/surface_aggregator/clients/san.rst
@@ -0,0 +1,44 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. |san_client_link| replace:: :c:func:`san_client_link`
+.. |san_dgpu_notifier_register| replace:: :c:func:`san_dgpu_notifier_register`
+.. |san_dgpu_notifier_unregister| replace:: :c:func:`san_dgpu_notifier_unregister`
+
+===================
+Surface ACPI Notify
+===================
+
+The Surface ACPI Notify (SAN) device provides the bridge between ACPI and
+SAM controller. Specifically, ACPI code can execute requests and handle
+battery and thermal events via this interface. In addition to this, events
+relating to the discrete GPU (dGPU) of the Surface Book 2 can be sent from
+ACPI code (note: the Surface Book 3 uses a different method for this). The
+only currently known event sent via this interface is a dGPU power-on
+notification. While this driver handles the former part internally, it only
+relays the dGPU events to any other driver interested via its public API and
+does not handle them.
+
+The public interface of this driver is split into two parts: Client
+registration and notifier-block registration.
+
+A client to the SAN interface can be linked as consumer to the SAN device
+via |san_client_link|. This can be used to ensure that the a client
+receiving dGPU events does not miss any events due to the SAN interface not
+being set up as this forces the client driver to unbind once the SAN driver
+is unbound.
+
+Notifier-blocks can be registered by any device for as long as the module is
+loaded, regardless of being linked as client or not. Registration is done
+with |san_dgpu_notifier_register|. If the notifier is not needed any more, it
+should be unregistered via |san_dgpu_notifier_unregister|.
+
+Consult the API documentation below for more details.
+
+
+API Documentation
+=================
+
+.. kernel-doc:: include/linux/surface_acpi_notify.h
+
+.. kernel-doc:: drivers/platform/surface/surface_acpi_notify.c
+    :export:
diff --git a/MAINTAINERS b/MAINTAINERS
index f5a788f445a4..894c9ef1b8d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11699,7 +11699,9 @@ W:	https://github.com/linux-surface/surface-aggregator-module
 C:	irc://chat.freenode.net/##linux-surface
 F:	Documentation/driver-api/surface_aggregator/
 F:	drivers/platform/surface/aggregator/
+F:	drivers/platform/surface/surface_acpi_notify.c
 F:	drivers/platform/surface/surface_aggregator_cdev.c
+F:	include/linux/surface_acpi_notify.h
 F:	include/linux/surface_aggregator/
 F:	include/uapi/linux/surface_aggregator/
 
diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index 988b2de6b500..83b0a4c7b352 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -41,6 +41,25 @@ config SURFACE_3_POWER_OPREGION
 	  This driver provides support for ACPI operation
 	  region of the Surface 3 battery platform driver.
 
+config SURFACE_ACPI_NOTIFY
+	tristate "Surface ACPI Notify Driver"
+	depends on SURFACE_AGGREGATOR
+	help
+	  Surface ACPI Notify (SAN) driver for Microsoft Surface devices.
+
+	  This driver provides support for the ACPI interface (called SAN) of
+	  the Surface System Aggregator Module (SSAM) EC. This interface is used
+	  on 5th- and 6th-generation Microsoft Surface devices (including
+	  Surface Pro 5 and 6, Surface Book 2, Surface Laptops 1 and 2, and in
+	  reduced functionality on the Surface Laptop 3) to execute SSAM
+	  requests directly from ACPI code, as well as receive SSAM events and
+	  turn them into ACPI notifications. It essentially acts as a
+	  translation layer between the SSAM controller and ACPI.
+
+	  Specifically, this driver may be needed for battery status reporting,
+	  thermal sensor access, and real-time clock information, depending on
+	  the Surface device in question.
+
 config SURFACE_AGGREGATOR_CDEV
 	tristate "Surface System Aggregator Module User-Space Interface"
 	depends on SURFACE_AGGREGATOR
diff --git a/drivers/platform/surface/Makefile b/drivers/platform/surface/Makefile
index 161f0ad05795..3eb971006877 100644
--- a/drivers/platform/surface/Makefile
+++ b/drivers/platform/surface/Makefile
@@ -7,6 +7,7 @@
 obj-$(CONFIG_SURFACE3_WMI)		+= surface3-wmi.o
 obj-$(CONFIG_SURFACE_3_BUTTON)		+= surface3_button.o
 obj-$(CONFIG_SURFACE_3_POWER_OPREGION)	+= surface3_power.o
+obj-$(CONFIG_SURFACE_ACPI_NOTIFY)	+= surface_acpi_notify.o
 obj-$(CONFIG_SURFACE_AGGREGATOR)	+= aggregator/
 obj-$(CONFIG_SURFACE_AGGREGATOR_CDEV)	+= surface_aggregator_cdev.o
 obj-$(CONFIG_SURFACE_GPE)		+= surface_gpe.o
diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
new file mode 100644
index 000000000000..8cd67a669c86
--- /dev/null
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -0,0 +1,886 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for the Surface ACPI Notify (SAN) interface/shim.
+ *
+ * Translates communication from ACPI to Surface System Aggregator Module
+ * (SSAM/SAM) requests and back, specifically SAM-over-SSH. Translates SSAM
+ * events back to ACPI notifications. Allows handling of discrete GPU
+ * notifications sent from ACPI via the SAN interface by providing them to any
+ * registered external driver.
+ *
+ * Copyright (C) 2019-2020 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#include <asm/unaligned.h>
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/rwsem.h>
+
+#include <linux/surface_aggregator/controller.h>
+#include <linux/surface_acpi_notify.h>
+
+struct san_data {
+	struct device *dev;
+	struct ssam_controller *ctrl;
+
+	struct acpi_connection_info info;
+
+	struct ssam_event_notifier nf_bat;
+	struct ssam_event_notifier nf_tmp;
+};
+
+#define to_san_data(ptr, member) \
+	container_of(ptr, struct san_data, member)
+
+
+/* -- dGPU notifier interface. ---------------------------------------------- */
+
+struct san_rqsg_if {
+	struct rw_semaphore lock;
+	struct device *dev;
+	struct blocking_notifier_head nh;
+};
+
+static struct san_rqsg_if san_rqsg_if = {
+	.lock = __RWSEM_INITIALIZER(san_rqsg_if.lock),
+	.dev = NULL,
+	.nh = BLOCKING_NOTIFIER_INIT(san_rqsg_if.nh),
+};
+
+static int san_set_rqsg_interface_device(struct device *dev)
+{
+	int status = 0;
+
+	down_write(&san_rqsg_if.lock);
+	if (!san_rqsg_if.dev && dev)
+		san_rqsg_if.dev = dev;
+	else
+		status = -EBUSY;
+	up_write(&san_rqsg_if.lock);
+
+	return status;
+}
+
+/**
+ * san_client_link() - Link client as consumer to SAN device.
+ * @client: The client to link.
+ *
+ * Sets up a device link between the provided client device as consumer and
+ * the SAN device as provider. This function can be used to ensure that the
+ * SAN interface has been set up and will be set up for as long as the driver
+ * of the client device is bound. This guarantees that, during that time, all
+ * dGPU events will be received by any registered notifier.
+ *
+ * The link will be automatically removed once the client device's driver is
+ * unbound.
+ *
+ * Return: Returns zero on success, %-ENXIO if the SAN interface has not been
+ * set up yet, and %-ENOMEM if device link creation failed.
+ */
+int san_client_link(struct device *client)
+{
+	const u32 flags = DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER;
+	struct device_link *link;
+
+	down_read(&san_rqsg_if.lock);
+
+	if (!san_rqsg_if.dev) {
+		up_read(&san_rqsg_if.lock);
+		return -ENXIO;
+	}
+
+	link = device_link_add(client, san_rqsg_if.dev, flags);
+	if (!link) {
+		up_read(&san_rqsg_if.lock);
+		return -ENOMEM;
+	}
+
+	if (READ_ONCE(link->status) == DL_STATE_SUPPLIER_UNBIND) {
+		up_read(&san_rqsg_if.lock);
+		return -ENXIO;
+	}
+
+	up_read(&san_rqsg_if.lock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(san_client_link);
+
+/**
+ * san_dgpu_notifier_register() - Register a SAN dGPU notifier.
+ * @nb: The notifier-block to register.
+ *
+ * Registers a SAN dGPU notifier, receiving any new SAN dGPU events sent from
+ * ACPI. The registered notifier will be called with &struct san_dgpu_event
+ * as notifier data and the command ID of that event as notifier action.
+ */
+int san_dgpu_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&san_rqsg_if.nh, nb);
+}
+EXPORT_SYMBOL_GPL(san_dgpu_notifier_register);
+
+/**
+ * san_dgpu_notifier_unregister() - Unregister a SAN dGPU notifier.
+ * @nb: The notifier-block to unregister.
+ */
+int san_dgpu_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&san_rqsg_if.nh, nb);
+}
+EXPORT_SYMBOL_GPL(san_dgpu_notifier_unregister);
+
+static int san_dgpu_notifier_call(struct san_dgpu_event *evt)
+{
+	int ret;
+
+	ret = blocking_notifier_call_chain(&san_rqsg_if.nh, evt->command, evt);
+	return notifier_to_errno(ret);
+}
+
+
+/* -- ACPI _DSM event relay. ------------------------------------------------ */
+
+#define SAN_DSM_REVISION	0
+
+/* 93b666c5-70c6-469f-a215-3d487c91ab3c */
+static const guid_t SAN_DSM_UUID =
+	GUID_INIT(0x93b666c5, 0x70c6, 0x469f, 0xa2, 0x15, 0x3d,
+		  0x48, 0x7c, 0x91, 0xab, 0x3c);
+
+enum san_dsm_event_fn {
+	SAN_DSM_EVENT_FN_BAT1_STAT = 0x03,
+	SAN_DSM_EVENT_FN_BAT1_INFO = 0x04,
+	SAN_DSM_EVENT_FN_ADP1_STAT = 0x05,
+	SAN_DSM_EVENT_FN_ADP1_INFO = 0x06,
+	SAN_DSM_EVENT_FN_BAT2_STAT = 0x07,
+	SAN_DSM_EVENT_FN_BAT2_INFO = 0x08,
+	SAN_DSM_EVENT_FN_THERMAL   = 0x09,
+	SAN_DSM_EVENT_FN_DPTF      = 0x0a,
+};
+
+enum sam_event_cid_bat {
+	SAM_EVENT_CID_BAT_BIX  = 0x15,
+	SAM_EVENT_CID_BAT_BST  = 0x16,
+	SAM_EVENT_CID_BAT_ADP  = 0x17,
+	SAM_EVENT_CID_BAT_PROT = 0x18,
+	SAM_EVENT_CID_BAT_DPTF = 0x4f,
+};
+
+enum sam_event_cid_tmp {
+	SAM_EVENT_CID_TMP_TRIP = 0x0b,
+};
+
+struct san_event_work {
+	struct delayed_work work;
+	struct device *dev;
+	struct ssam_event event;	/* must be last */
+};
+
+static int san_acpi_notify_event(struct device *dev, u64 func,
+				 union acpi_object *param)
+{
+	acpi_handle san = ACPI_HANDLE(dev);
+	union acpi_object *obj;
+	int status = 0;
+
+	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, 1 << func))
+		return 0;
+
+	dev_dbg(dev, "notify event %#04llx\n", func);
+
+	obj = acpi_evaluate_dsm_typed(san, &SAN_DSM_UUID, SAN_DSM_REVISION,
+				      func, param, ACPI_TYPE_BUFFER);
+	if (!obj)
+		return -EFAULT;
+
+	if (obj->buffer.length != 1 || obj->buffer.pointer[0] != 0) {
+		dev_err(dev, "got unexpected result from _DSM\n");
+		status = -EPROTO;
+	}
+
+	ACPI_FREE(obj);
+	return status;
+}
+
+static int san_evt_bat_adp(struct device *dev, const struct ssam_event *event)
+{
+	int status;
+
+	status = san_acpi_notify_event(dev, SAN_DSM_EVENT_FN_ADP1_STAT, NULL);
+	if (status)
+		return status;
+
+	/*
+	 * Ensure that the battery states get updated correctly. When the
+	 * battery is fully charged and an adapter is plugged in, it sometimes
+	 * is not updated correctly, instead showing it as charging.
+	 * Explicitly trigger battery updates to fix this.
+	 */
+
+	status = san_acpi_notify_event(dev, SAN_DSM_EVENT_FN_BAT1_STAT, NULL);
+	if (status)
+		return status;
+
+	return san_acpi_notify_event(dev, SAN_DSM_EVENT_FN_BAT2_STAT, NULL);
+}
+
+static int san_evt_bat_bix(struct device *dev, const struct ssam_event *event)
+{
+	enum san_dsm_event_fn fn;
+
+	if (event->instance_id == 0x02)
+		fn = SAN_DSM_EVENT_FN_BAT2_INFO;
+	else
+		fn = SAN_DSM_EVENT_FN_BAT1_INFO;
+
+	return san_acpi_notify_event(dev, fn, NULL);
+}
+
+static int san_evt_bat_bst(struct device *dev, const struct ssam_event *event)
+{
+	enum san_dsm_event_fn fn;
+
+	if (event->instance_id == 0x02)
+		fn = SAN_DSM_EVENT_FN_BAT2_STAT;
+	else
+		fn = SAN_DSM_EVENT_FN_BAT1_STAT;
+
+	return san_acpi_notify_event(dev, fn, NULL);
+}
+
+static int san_evt_bat_dptf(struct device *dev, const struct ssam_event *event)
+{
+	union acpi_object payload;
+
+	/*
+	 * The Surface ACPI expects a buffer and not a package. It specifically
+	 * checks for ObjectType (Arg3) == 0x03. This will cause a warning in
+	 * acpica/nsarguments.c, but that warning can be safely ignored.
+	 */
+	payload.type = ACPI_TYPE_BUFFER;
+	payload.buffer.length = event->length;
+	payload.buffer.pointer = (u8 *)&event->data[0];
+
+	return san_acpi_notify_event(dev, SAN_DSM_EVENT_FN_DPTF, &payload);
+}
+
+static unsigned long san_evt_bat_delay(u8 cid)
+{
+	switch (cid) {
+	case SAM_EVENT_CID_BAT_ADP:
+		/*
+		 * Wait for battery state to update before signaling adapter
+		 * change.
+		 */
+		return msecs_to_jiffies(5000);
+
+	case SAM_EVENT_CID_BAT_BST:
+		/* Ensure we do not miss anything important due to caching. */
+		return msecs_to_jiffies(2000);
+
+	default:
+		return 0;
+	}
+}
+
+static bool san_evt_bat(const struct ssam_event *event, struct device *dev)
+{
+	int status;
+
+	switch (event->command_id) {
+	case SAM_EVENT_CID_BAT_BIX:
+		status = san_evt_bat_bix(dev, event);
+		break;
+
+	case SAM_EVENT_CID_BAT_BST:
+		status = san_evt_bat_bst(dev, event);
+		break;
+
+	case SAM_EVENT_CID_BAT_ADP:
+		status = san_evt_bat_adp(dev, event);
+		break;
+
+	case SAM_EVENT_CID_BAT_PROT:
+		/*
+		 * TODO: Implement support for battery protection status change
+		 *       event.
+		 */
+		return true;
+
+	case SAM_EVENT_CID_BAT_DPTF:
+		status = san_evt_bat_dptf(dev, event);
+		break;
+
+	default:
+		return false;
+	}
+
+	if (status) {
+		dev_err(dev, "error handling power event (cid = %#04x)\n",
+			event->command_id);
+	}
+
+	return true;
+}
+
+static void san_evt_bat_workfn(struct work_struct *work)
+{
+	struct san_event_work *ev;
+
+	ev = container_of(work, struct san_event_work, work.work);
+	san_evt_bat(&ev->event, ev->dev);
+	kfree(ev);
+}
+
+static u32 san_evt_bat_nf(struct ssam_event_notifier *nf,
+			  const struct ssam_event *event)
+{
+	struct san_data *d = to_san_data(nf, nf_bat);
+	struct san_event_work *work;
+	unsigned long delay = san_evt_bat_delay(event->command_id);
+
+	if (delay == 0)
+		return san_evt_bat(event, d->dev) ? SSAM_NOTIF_HANDLED : 0;
+
+	work = kzalloc(sizeof(*work) + event->length, GFP_KERNEL);
+	if (!work)
+		return ssam_notifier_from_errno(-ENOMEM);
+
+	INIT_DELAYED_WORK(&work->work, san_evt_bat_workfn);
+	work->dev = d->dev;
+
+	memcpy(&work->event, event, sizeof(struct ssam_event) + event->length);
+
+	schedule_delayed_work(&work->work, delay);
+	return SSAM_NOTIF_HANDLED;
+}
+
+static int san_evt_tmp_trip(struct device *dev, const struct ssam_event *event)
+{
+	union acpi_object param;
+
+	/*
+	 * The Surface ACPI expects an integer and not a package. This will
+	 * cause a warning in acpica/nsarguments.c, but that warning can be
+	 * safely ignored.
+	 */
+	param.type = ACPI_TYPE_INTEGER;
+	param.integer.value = event->instance_id;
+
+	return san_acpi_notify_event(dev, SAN_DSM_EVENT_FN_THERMAL, &param);
+}
+
+static bool san_evt_tmp(const struct ssam_event *event, struct device *dev)
+{
+	int status;
+
+	switch (event->command_id) {
+	case SAM_EVENT_CID_TMP_TRIP:
+		status = san_evt_tmp_trip(dev, event);
+		break;
+
+	default:
+		return false;
+	}
+
+	if (status) {
+		dev_err(dev, "error handling thermal event (cid = %#04x)\n",
+			event->command_id);
+	}
+
+	return true;
+}
+
+static u32 san_evt_tmp_nf(struct ssam_event_notifier *nf,
+			  const struct ssam_event *event)
+{
+	struct san_data *d = to_san_data(nf, nf_tmp);
+
+	return san_evt_tmp(event, d->dev) ? SSAM_NOTIF_HANDLED : 0;
+}
+
+
+/* -- ACPI GSB OperationRegion handler -------------------------------------- */
+
+struct gsb_data_in {
+	u8 cv;
+} __packed;
+
+struct gsb_data_rqsx {
+	u8 cv;				/* Command value (san_gsb_request_cv). */
+	u8 tc;				/* Target category. */
+	u8 tid;				/* Target ID. */
+	u8 iid;				/* Instance ID. */
+	u8 snc;				/* Expect-response-flag. */
+	u8 cid;				/* Command ID. */
+	u16 cdl;			/* Payload length. */
+	u8 pld[];			/* Payload. */
+} __packed;
+
+struct gsb_data_etwl {
+	u8 cv;				/* Command value (should be 0x02). */
+	u8 etw3;			/* Unknown. */
+	u8 etw4;			/* Unknown. */
+	u8 msg[];			/* Error message (ASCIIZ). */
+} __packed;
+
+struct gsb_data_out {
+	u8 status;			/* _SSH communication status. */
+	u8 len;				/* _SSH payload length. */
+	u8 pld[];			/* _SSH payload. */
+} __packed;
+
+union gsb_buffer_data {
+	struct gsb_data_in   in;	/* Common input. */
+	struct gsb_data_rqsx rqsx;	/* RQSX input. */
+	struct gsb_data_etwl etwl;	/* ETWL input. */
+	struct gsb_data_out  out;	/* Output. */
+};
+
+struct gsb_buffer {
+	u8 status;			/* GSB AttribRawProcess status. */
+	u8 len;				/* GSB AttribRawProcess length. */
+	union gsb_buffer_data data;
+} __packed;
+
+#define SAN_GSB_MAX_RQSX_PAYLOAD  (U8_MAX - 2 - sizeof(struct gsb_data_rqsx))
+#define SAN_GSB_MAX_RESPONSE	  (U8_MAX - 2 - sizeof(struct gsb_data_out))
+
+#define SAN_GSB_COMMAND		0
+
+enum san_gsb_request_cv {
+	SAN_GSB_REQUEST_CV_RQST = 0x01,
+	SAN_GSB_REQUEST_CV_ETWL = 0x02,
+	SAN_GSB_REQUEST_CV_RQSG = 0x03,
+};
+
+#define SAN_REQUEST_NUM_TRIES	5
+
+static acpi_status san_etwl(struct san_data *d, struct gsb_buffer *b)
+{
+	struct gsb_data_etwl *etwl = &b->data.etwl;
+
+	if (b->len < sizeof(struct gsb_data_etwl)) {
+		dev_err(d->dev, "invalid ETWL package (len = %d)\n", b->len);
+		return AE_OK;
+	}
+
+	dev_err(d->dev, "ETWL(%#04x, %#04x): %.*s\n", etwl->etw3, etwl->etw4,
+		(unsigned int)(b->len - sizeof(struct gsb_data_etwl)),
+		(char *)etwl->msg);
+
+	/* Indicate success. */
+	b->status = 0x00;
+	b->len = 0x00;
+
+	return AE_OK;
+}
+
+static
+struct gsb_data_rqsx *san_validate_rqsx(struct device *dev, const char *type,
+					struct gsb_buffer *b)
+{
+	struct gsb_data_rqsx *rqsx = &b->data.rqsx;
+
+	if (b->len < sizeof(struct gsb_data_rqsx)) {
+		dev_err(dev, "invalid %s package (len = %d)\n", type, b->len);
+		return NULL;
+	}
+
+	if (get_unaligned(&rqsx->cdl) != b->len - sizeof(struct gsb_data_rqsx)) {
+		dev_err(dev, "bogus %s package (len = %d, cdl = %d)\n",
+			type, b->len, get_unaligned(&rqsx->cdl));
+		return NULL;
+	}
+
+	if (get_unaligned(&rqsx->cdl) > SAN_GSB_MAX_RQSX_PAYLOAD) {
+		dev_err(dev, "payload for %s package too large (cdl = %d)\n",
+			type, get_unaligned(&rqsx->cdl));
+		return NULL;
+	}
+
+	return rqsx;
+}
+
+static void gsb_rqsx_response_error(struct gsb_buffer *gsb, int status)
+{
+	gsb->status = 0x00;
+	gsb->len = 0x02;
+	gsb->data.out.status = (u8)(-status);
+	gsb->data.out.len = 0x00;
+}
+
+static void gsb_rqsx_response_success(struct gsb_buffer *gsb, u8 *ptr, size_t len)
+{
+	gsb->status = 0x00;
+	gsb->len = len + 2;
+	gsb->data.out.status = 0x00;
+	gsb->data.out.len = len;
+
+	if (len)
+		memcpy(&gsb->data.out.pld[0], ptr, len);
+}
+
+static acpi_status san_rqst_fixup_suspended(struct san_data *d,
+					    struct ssam_request *rqst,
+					    struct gsb_buffer *gsb)
+{
+	if (rqst->target_category == SSAM_SSH_TC_BAS && rqst->command_id == 0x0D) {
+		u8 base_state = 1;
+
+		/* Base state quirk:
+		 * The base state may be queried from ACPI when the EC is still
+		 * suspended. In this case it will return '-EPERM'. This query
+		 * will only be triggered from the ACPI lid GPE interrupt, thus
+		 * we are either in laptop or studio mode (base status 0x01 or
+		 * 0x02). Furthermore, we will only get here if the device (and
+		 * EC) have been suspended.
+		 *
+		 * We now assume that the device is in laptop mode (0x01). This
+		 * has the drawback that it will wake the device when unfolding
+		 * it in studio mode, but it also allows us to avoid actively
+		 * waiting for the EC to wake up, which may incur a notable
+		 * delay.
+		 */
+
+		dev_dbg(d->dev, "rqst: fixup: base-state quirk\n");
+
+		gsb_rqsx_response_success(gsb, &base_state, sizeof(base_state));
+		return AE_OK;
+	}
+
+	gsb_rqsx_response_error(gsb, -ENXIO);
+	return AE_OK;
+}
+
+static acpi_status san_rqst(struct san_data *d, struct gsb_buffer *buffer)
+{
+	u8 rspbuf[SAN_GSB_MAX_RESPONSE];
+	struct gsb_data_rqsx *gsb_rqst;
+	struct ssam_request rqst;
+	struct ssam_response rsp;
+	int status = 0;
+
+	gsb_rqst = san_validate_rqsx(d->dev, "RQST", buffer);
+	if (!gsb_rqst)
+		return AE_OK;
+
+	rqst.target_category = gsb_rqst->tc;
+	rqst.target_id = gsb_rqst->tid;
+	rqst.command_id = gsb_rqst->cid;
+	rqst.instance_id = gsb_rqst->iid;
+	rqst.flags = gsb_rqst->snc ? SSAM_REQUEST_HAS_RESPONSE : 0;
+	rqst.length = get_unaligned(&gsb_rqst->cdl);
+	rqst.payload = &gsb_rqst->pld[0];
+
+	rsp.capacity = ARRAY_SIZE(rspbuf);
+	rsp.length = 0;
+	rsp.pointer = &rspbuf[0];
+
+	/* Handle suspended device. */
+	if (d->dev->power.is_suspended) {
+		dev_warn(d->dev, "rqst: device is suspended, not executing\n");
+		return san_rqst_fixup_suspended(d, &rqst, buffer);
+	}
+
+	status = __ssam_retry(ssam_request_sync_onstack, SAN_REQUEST_NUM_TRIES,
+			      d->ctrl, &rqst, &rsp, SAN_GSB_MAX_RQSX_PAYLOAD);
+
+	if (!status) {
+		gsb_rqsx_response_success(buffer, rsp.pointer, rsp.length);
+	} else {
+		dev_err(d->dev, "rqst: failed with error %d\n", status);
+		gsb_rqsx_response_error(buffer, status);
+	}
+
+	return AE_OK;
+}
+
+static acpi_status san_rqsg(struct san_data *d, struct gsb_buffer *buffer)
+{
+	struct gsb_data_rqsx *gsb_rqsg;
+	struct san_dgpu_event evt;
+	int status;
+
+	gsb_rqsg = san_validate_rqsx(d->dev, "RQSG", buffer);
+	if (!gsb_rqsg)
+		return AE_OK;
+
+	evt.category = gsb_rqsg->tc;
+	evt.target = gsb_rqsg->tid;
+	evt.command = gsb_rqsg->cid;
+	evt.instance = gsb_rqsg->iid;
+	evt.length = get_unaligned(&gsb_rqsg->cdl);
+	evt.payload = &gsb_rqsg->pld[0];
+
+	status = san_dgpu_notifier_call(&evt);
+	if (!status) {
+		gsb_rqsx_response_success(buffer, NULL, 0);
+	} else {
+		dev_err(d->dev, "rqsg: failed with error %d\n", status);
+		gsb_rqsx_response_error(buffer, status);
+	}
+
+	return AE_OK;
+}
+
+static acpi_status san_opreg_handler(u32 function, acpi_physical_address command,
+				     u32 bits, u64 *value64, void *opreg_context,
+				     void *region_context)
+{
+	struct san_data *d = to_san_data(opreg_context, info);
+	struct gsb_buffer *buffer = (struct gsb_buffer *)value64;
+	int accessor_type = (function & 0xFFFF0000) >> 16;
+
+	if (command != SAN_GSB_COMMAND) {
+		dev_warn(d->dev, "unsupported command: %#04llx\n", command);
+		return AE_OK;
+	}
+
+	if (accessor_type != ACPI_GSB_ACCESS_ATTRIB_RAW_PROCESS) {
+		dev_err(d->dev, "invalid access type: %#04x\n", accessor_type);
+		return AE_OK;
+	}
+
+	/* Buffer must have at least contain the command-value. */
+	if (buffer->len == 0) {
+		dev_err(d->dev, "request-package too small\n");
+		return AE_OK;
+	}
+
+	switch (buffer->data.in.cv) {
+	case SAN_GSB_REQUEST_CV_RQST:
+		return san_rqst(d, buffer);
+
+	case SAN_GSB_REQUEST_CV_ETWL:
+		return san_etwl(d, buffer);
+
+	case SAN_GSB_REQUEST_CV_RQSG:
+		return san_rqsg(d, buffer);
+
+	default:
+		dev_warn(d->dev, "unsupported SAN0 request (cv: %#04x)\n",
+			 buffer->data.in.cv);
+		return AE_OK;
+	}
+}
+
+
+/* -- Driver setup. --------------------------------------------------------- */
+
+static int san_events_register(struct platform_device *pdev)
+{
+	struct san_data *d = platform_get_drvdata(pdev);
+	int status;
+
+	d->nf_bat.base.priority = 1;
+	d->nf_bat.base.fn = san_evt_bat_nf;
+	d->nf_bat.event.reg = SSAM_EVENT_REGISTRY_SAM;
+	d->nf_bat.event.id.target_category = SSAM_SSH_TC_BAT;
+	d->nf_bat.event.id.instance = 0;
+	d->nf_bat.event.mask = SSAM_EVENT_MASK_TARGET;
+	d->nf_bat.event.flags = SSAM_EVENT_SEQUENCED;
+
+	d->nf_tmp.base.priority = 1;
+	d->nf_tmp.base.fn = san_evt_tmp_nf;
+	d->nf_tmp.event.reg = SSAM_EVENT_REGISTRY_SAM;
+	d->nf_tmp.event.id.target_category = SSAM_SSH_TC_TMP;
+	d->nf_tmp.event.id.instance = 0;
+	d->nf_tmp.event.mask = SSAM_EVENT_MASK_TARGET;
+	d->nf_tmp.event.flags = SSAM_EVENT_SEQUENCED;
+
+	status = ssam_notifier_register(d->ctrl, &d->nf_bat);
+	if (status)
+		return status;
+
+	status = ssam_notifier_register(d->ctrl, &d->nf_tmp);
+	if (status)
+		ssam_notifier_unregister(d->ctrl, &d->nf_bat);
+
+	return status;
+}
+
+static void san_events_unregister(struct platform_device *pdev)
+{
+	struct san_data *d = platform_get_drvdata(pdev);
+
+	ssam_notifier_unregister(d->ctrl, &d->nf_bat);
+	ssam_notifier_unregister(d->ctrl, &d->nf_tmp);
+}
+
+#define san_consumer_printk(level, dev, handle, fmt, ...)			\
+do {										\
+	char *path = "<error getting consumer path>";				\
+	struct acpi_buffer buffer = {						\
+		.length = ACPI_ALLOCATE_BUFFER,					\
+		.pointer = NULL,						\
+	};									\
+										\
+	if (ACPI_SUCCESS(acpi_get_name(handle, ACPI_FULL_PATHNAME, &buffer)))	\
+		path = buffer.pointer;						\
+										\
+	dev_##level(dev, "[%s]: " fmt, path, ##__VA_ARGS__);			\
+	kfree(buffer.pointer);							\
+} while (0)
+
+#define san_consumer_dbg(dev, handle, fmt, ...) \
+	san_consumer_printk(dbg, dev, handle, fmt, ##__VA_ARGS__)
+
+#define san_consumer_warn(dev, handle, fmt, ...) \
+	san_consumer_printk(warn, dev, handle, fmt, ##__VA_ARGS__)
+
+static bool is_san_consumer(struct platform_device *pdev, acpi_handle handle)
+{
+	struct acpi_handle_list dep_devices;
+	acpi_handle supplier = ACPI_HANDLE(&pdev->dev);
+	acpi_status status;
+	int i;
+
+	if (!acpi_has_method(handle, "_DEP"))
+		return false;
+
+	status = acpi_evaluate_reference(handle, "_DEP", NULL, &dep_devices);
+	if (ACPI_FAILURE(status)) {
+		san_consumer_dbg(&pdev->dev, handle, "failed to evaluate _DEP\n");
+		return false;
+	}
+
+	for (i = 0; i < dep_devices.count; i++) {
+		if (dep_devices.handles[i] == supplier)
+			return true;
+	}
+
+	return false;
+}
+
+static acpi_status san_consumer_setup(acpi_handle handle, u32 lvl,
+				      void *context, void **rv)
+{
+	const u32 flags = DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER;
+	struct platform_device *pdev = context;
+	struct acpi_device *adev;
+	struct device_link *link;
+
+	if (!is_san_consumer(pdev, handle))
+		return AE_OK;
+
+	/* Ignore ACPI devices that are not present. */
+	if (acpi_bus_get_device(handle, &adev) != 0)
+		return AE_OK;
+
+	san_consumer_dbg(&pdev->dev, handle, "creating device link\n");
+
+	/* Try to set up device links, ignore but log errors. */
+	link = device_link_add(&adev->dev, &pdev->dev, flags);
+	if (!link) {
+		san_consumer_warn(&pdev->dev, handle, "failed to create device link\n");
+		return AE_OK;
+	}
+
+	return AE_OK;
+}
+
+static int san_consumer_links_setup(struct platform_device *pdev)
+{
+	acpi_status status;
+
+	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
+				     ACPI_UINT32_MAX, san_consumer_setup, NULL,
+				     pdev, NULL);
+
+	return status ? -EFAULT : 0;
+}
+
+static int san_probe(struct platform_device *pdev)
+{
+	acpi_handle san = ACPI_HANDLE(&pdev->dev);
+	struct ssam_controller *ctrl;
+	struct san_data *data;
+	acpi_status astatus;
+	int status;
+
+	ctrl = ssam_client_bind(&pdev->dev);
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl) == -ENODEV ? -EPROBE_DEFER : PTR_ERR(ctrl);
+
+	status = san_consumer_links_setup(pdev);
+	if (status)
+		return status;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &pdev->dev;
+	data->ctrl = ctrl;
+
+	platform_set_drvdata(pdev, data);
+
+	astatus = acpi_install_address_space_handler(san, ACPI_ADR_SPACE_GSBUS,
+						     &san_opreg_handler, NULL,
+						     &data->info);
+	if (ACPI_FAILURE(astatus))
+		return -ENXIO;
+
+	status = san_events_register(pdev);
+	if (status)
+		goto err_enable_events;
+
+	status = san_set_rqsg_interface_device(&pdev->dev);
+	if (status)
+		goto err_install_dev;
+
+	acpi_walk_dep_device_list(san);
+	return 0;
+
+err_install_dev:
+	san_events_unregister(pdev);
+err_enable_events:
+	acpi_remove_address_space_handler(san, ACPI_ADR_SPACE_GSBUS,
+					  &san_opreg_handler);
+	return status;
+}
+
+static int san_remove(struct platform_device *pdev)
+{
+	acpi_handle san = ACPI_HANDLE(&pdev->dev);
+
+	san_set_rqsg_interface_device(NULL);
+	acpi_remove_address_space_handler(san, ACPI_ADR_SPACE_GSBUS,
+					  &san_opreg_handler);
+	san_events_unregister(pdev);
+
+	/*
+	 * We have unregistered our event sources. Now we need to ensure that
+	 * all delayed works they may have spawned are run to completion.
+	 */
+	flush_scheduled_work();
+
+	return 0;
+}
+
+static const struct acpi_device_id san_match[] = {
+	{ "MSHW0091" },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, san_match);
+
+static struct platform_driver surface_acpi_notify = {
+	.probe = san_probe,
+	.remove = san_remove,
+	.driver = {
+		.name = "surface_acpi_notify",
+		.acpi_match_table = san_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(surface_acpi_notify);
+
+MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
+MODULE_DESCRIPTION("Surface ACPI Notify driver for Surface System Aggregator Module");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/surface_acpi_notify.h b/include/linux/surface_acpi_notify.h
new file mode 100644
index 000000000000..8e3e86c7d78c
--- /dev/null
+++ b/include/linux/surface_acpi_notify.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Interface for Surface ACPI Notify (SAN) driver.
+ *
+ * Provides access to discrete GPU notifications sent from ACPI via the SAN
+ * driver, which are not handled by this driver directly.
+ *
+ * Copyright (C) 2019-2020 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#ifndef _LINUX_SURFACE_ACPI_NOTIFY_H
+#define _LINUX_SURFACE_ACPI_NOTIFY_H
+
+#include <linux/notifier.h>
+#include <linux/types.h>
+
+/**
+ * struct san_dgpu_event - Discrete GPU ACPI event.
+ * @category: Category of the event.
+ * @target:   Target ID of the event source.
+ * @command:  Command ID of the event.
+ * @instance: Instance ID of the event source.
+ * @length:   Length of the event's payload data (in bytes).
+ * @payload:  Pointer to the event's payload data.
+ */
+struct san_dgpu_event {
+	u8 category;
+	u8 target;
+	u8 command;
+	u8 instance;
+	u16 length;
+	u8 *payload;
+};
+
+int san_client_link(struct device *client);
+int san_dgpu_notifier_register(struct notifier_block *nb);
+int san_dgpu_notifier_unregister(struct notifier_block *nb);
+
+#endif /* _LINUX_SURFACE_ACPI_NOTIFY_H */
-- 
2.29.2

