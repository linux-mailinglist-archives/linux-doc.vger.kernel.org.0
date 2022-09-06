Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED755AE95E
	for <lists+linux-doc@lfdr.de>; Tue,  6 Sep 2022 15:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240406AbiIFNUM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Sep 2022 09:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240401AbiIFNT7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 09:19:59 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5B25D0D4;
        Tue,  6 Sep 2022 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=O7l6bsIBZ07/m+eMCIZN2WDJ+nmtoOTf9qn1F8ohlBE=; b=P/AAiMN4uuiCFJHmHhpYpivLzb
        Dt/CYrxcqUVBjGlEcxTwBTEgsOSgUnxFe+eev9DODxiB1BxjSdVFwgWw4Ma9ZlnR7hl5Y5o4uHigx
        zmCYljLM0IfYQZmCI77AN0A1MJv11wqFE3sW0Xm/oyznKFcbDcYGZoRFawOkelS5202VDHxtJDNh/
        +XN7NioSmyucTFb0MqFzfztXGaFMlkTK9mqxH5XzcDQpkG+Je6mRhTy1+WNjPedzKx60GVdOxoB/z
        MEwJVOXuyfyUlnbQaunBySVSL3Pp0RzwVVcXwlESIyp5U2SaPUcL4u/2dhE41TZ9437SzK8tdxz+t
        Y7OGt9ZQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38448 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oVYUY-0003s7-ET; Tue, 06 Sep 2022 14:19:50 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oVYUX-005CmY-Mr; Tue, 06 Sep 2022 14:19:49 +0100
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 5/7] platform/apple: Add new Apple Mac SMC driver
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVYUX-005CmY-Mr@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 06 Sep 2022 14:19:49 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Hector Martin <marcan@marcan.st>

This driver implements support for the SMC (System Management
Controller) in Apple Macs. In contrast to the existing applesmc driver,
it uses pluggable backends that allow it to support different SMC
implementations, and uses the MFD subsystem to expose the core SMC
functionality so that specific features (gpio, hwmon, battery, etc.) can
be implemented by separate drivers in their respective downstream
subsystems.

The initial RTKit backend adds support for Apple Silicon Macs (M1 et
al). We hope a backend for T2 Macs will be written in the future
(since those are not supported by applesmc), and eventually an x86
backend would allow us to fully deprecate applesmc in favor of this
driver.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/platform/Kconfig           |   2 +
 drivers/platform/Makefile          |   1 +
 drivers/platform/apple/Kconfig     |  49 ++++
 drivers/platform/apple/Makefile    |  11 +
 drivers/platform/apple/smc.h       |  28 ++
 drivers/platform/apple/smc_core.c  | 249 ++++++++++++++++
 drivers/platform/apple/smc_rtkit.c | 453 +++++++++++++++++++++++++++++
 include/linux/mfd/macsmc.h         |  86 ++++++
 8 files changed, 879 insertions(+)
 create mode 100644 drivers/platform/apple/Kconfig
 create mode 100644 drivers/platform/apple/Makefile
 create mode 100644 drivers/platform/apple/smc.h
 create mode 100644 drivers/platform/apple/smc_core.c
 create mode 100644 drivers/platform/apple/smc_rtkit.c
 create mode 100644 include/linux/mfd/macsmc.h

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index b437847b6237..5f8b9bcdb830 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -13,4 +13,6 @@ source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
 
+source "drivers/platform/apple/Kconfig"
+
 source "drivers/platform/x86/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 4de08ef4ec9d..3e5d5039a28c 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_APPLE_PLATFORMS)	+= apple/
diff --git a/drivers/platform/apple/Kconfig b/drivers/platform/apple/Kconfig
new file mode 100644
index 000000000000..42525aa9fbbe
--- /dev/null
+++ b/drivers/platform/apple/Kconfig
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Apple Platform-Specific Drivers
+#
+
+menuconfig APPLE_PLATFORMS
+	bool "Apple Mac Platform-Specific Device Drivers"
+	default y
+	help
+	  Say Y here to get to see options for platform-specific device drivers
+	  for Apple devices. This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if APPLE_PLATFORMS
+
+config APPLE_SMC
+	tristate "Apple SMC Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default ARCH_APPLE
+	select MFD_CORE
+	help
+	  Build support for the Apple System Management Controller present in
+	  Apple Macs. This driver currently supports the SMC in Apple Silicon
+	  Macs. For x86 Macs, see the applesmc driver (SENSORS_APPLESMC).
+
+	  Say Y here if you have an Apple Silicon Mac.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called macsmc.
+
+if APPLE_SMC
+
+config APPLE_SMC_RTKIT
+	tristate "RTKit (Apple Silicon) backend"
+	depends on ARCH_APPLE || COMPILE_TEST
+	depends on APPLE_RTKIT
+	default ARCH_APPLE
+	help
+	  Build support for SMC communications via the RTKit backend. This is
+	  required for Apple Silicon Macs.
+
+	  Say Y here if you have an Apple Silicon Mac.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called macsmc-rtkit.
+
+endif
+endif
diff --git a/drivers/platform/apple/Makefile b/drivers/platform/apple/Makefile
new file mode 100644
index 000000000000..79fac195398b
--- /dev/null
+++ b/drivers/platform/apple/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/apple
+# Apple Platform-Specific Drivers
+#
+
+macsmc-y				+= smc_core.o
+macsmc-rtkit-y				+= smc_rtkit.o
+
+obj-$(CONFIG_APPLE_SMC)			+= macsmc.o
+obj-$(CONFIG_APPLE_SMC_RTKIT)		+= macsmc-rtkit.o
diff --git a/drivers/platform/apple/smc.h b/drivers/platform/apple/smc.h
new file mode 100644
index 000000000000..8ae51887b2c5
--- /dev/null
+++ b/drivers/platform/apple/smc.h
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC internal core definitions
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#ifndef _SMC_H
+#define _SMC_H
+
+#include <linux/mfd/macsmc.h>
+
+struct apple_smc_backend_ops {
+	int (*read_key)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*write_key)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*write_key_atomic)(void *cookie, smc_key key, void *buf, size_t size);
+	int (*rw_key)(void *cookie, smc_key key, void *wbuf, size_t wsize,
+		      void *rbuf, size_t rsize);
+	int (*get_key_by_index)(void *cookie, int index, smc_key *key);
+	int (*get_key_info)(void *cookie, smc_key key, struct apple_smc_key_info *info);
+};
+
+struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops,
+				  void *cookie);
+void *apple_smc_get_cookie(struct apple_smc *smc);
+int apple_smc_remove(struct apple_smc *smc);
+void apple_smc_event_received(struct apple_smc *smc, uint32_t event);
+
+#endif
diff --git a/drivers/platform/apple/smc_core.c b/drivers/platform/apple/smc_core.c
new file mode 100644
index 000000000000..daf029cd072f
--- /dev/null
+++ b/drivers/platform/apple/smc_core.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC core framework
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include "smc.h"
+
+struct apple_smc {
+	struct device *dev;
+
+	void *be_cookie;
+	const struct apple_smc_backend_ops *be;
+
+	struct mutex mutex;
+
+	u32 key_count;
+	smc_key first_key;
+	smc_key last_key;
+
+	struct blocking_notifier_head event_handlers;
+};
+
+static const struct mfd_cell apple_smc_devs[] = {
+	{
+		.name = "macsmc-gpio",
+	},
+	{
+		.name = "macsmc-hid",
+	},
+	{
+		.name = "macsmc-power",
+	},
+	{
+		.name = "macsmc-reboot",
+	},
+	{
+		.name = "macsmc-rtc",
+	},
+};
+
+int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->read_key(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_read);
+
+int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->write_key(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_write);
+
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+{
+	int ret;
+
+	/*
+	 * Will fail if SMC is busy. This is only used by SMC reboot/poweroff
+	 * final calls, so it doesn't really matter at that point.
+	 */
+	if (!mutex_trylock(&smc->mutex))
+		return -EBUSY;
+
+	ret = smc->be->write_key_atomic(smc->be_cookie, key, buf, size);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_write_atomic);
+
+int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+		 void *rbuf, size_t rsize)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->rw_key(smc->be_cookie, key, wbuf, wsize, rbuf, rsize);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_rw);
+
+int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->get_key_by_index(smc->be_cookie, index, key);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_get_key_by_index);
+
+int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info)
+{
+	int ret;
+
+	mutex_lock(&smc->mutex);
+	ret = smc->be->get_key_info(smc->be_cookie, key, info);
+	mutex_unlock(&smc->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(apple_smc_get_key_info);
+
+int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key)
+{
+	int start = 0, count = smc->key_count;
+	int ret;
+
+	if (key <= smc->first_key)
+		return 0;
+	if (key > smc->last_key)
+		return smc->key_count;
+
+	while (count > 1) {
+		int pivot = start + ((count - 1) >> 1);
+		smc_key pkey;
+
+		ret = apple_smc_get_key_by_index(smc, pivot, &pkey);
+		if (ret < 0)
+			return ret;
+
+		if (pkey == key)
+			return pivot;
+
+		pivot++;
+
+		if (pkey < key) {
+			count -= pivot - start;
+			start = pivot;
+		} else {
+			count = pivot - start;
+		}
+	}
+
+	return start;
+}
+EXPORT_SYMBOL(apple_smc_find_first_key_index);
+
+int apple_smc_get_key_count(struct apple_smc *smc)
+{
+	return smc->key_count;
+}
+EXPORT_SYMBOL(apple_smc_get_key_count);
+
+void apple_smc_event_received(struct apple_smc *smc, uint32_t event)
+{
+	dev_dbg(smc->dev, "Event: 0x%08x\n", event);
+	blocking_notifier_call_chain(&smc->event_handlers, event, NULL);
+}
+EXPORT_SYMBOL(apple_smc_event_received);
+
+int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n)
+{
+	return blocking_notifier_chain_register(&smc->event_handlers, n);
+}
+EXPORT_SYMBOL(apple_smc_register_notifier);
+
+int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n)
+{
+	return blocking_notifier_chain_unregister(&smc->event_handlers, n);
+}
+EXPORT_SYMBOL(apple_smc_unregister_notifier);
+
+void *apple_smc_get_cookie(struct apple_smc *smc)
+{
+	return smc->be_cookie;
+}
+EXPORT_SYMBOL(apple_smc_get_cookie);
+
+struct apple_smc *apple_smc_probe(struct device *dev, const struct apple_smc_backend_ops *ops, void *cookie)
+{
+	struct apple_smc *smc;
+	u32 count;
+	int ret;
+
+	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
+	if (!smc)
+		return ERR_PTR(-ENOMEM);
+
+	smc->dev = dev;
+	smc->be_cookie = cookie;
+	smc->be = ops;
+	mutex_init(&smc->mutex);
+	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
+
+	ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get key count"));
+	smc->key_count = be32_to_cpu(count);
+
+	ret = apple_smc_get_key_by_index(smc, 0, &smc->first_key);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get first key"));
+
+	ret = apple_smc_get_key_by_index(smc, smc->key_count - 1, &smc->last_key);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Failed to get last key"));
+
+	/* Enable notifications */
+	apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
+
+	dev_info(dev, "Initialized (%d keys %p4ch..%p4ch)\n",
+		 smc->key_count, &smc->first_key, &smc->last_key);
+
+	dev_set_drvdata(dev, smc);
+
+	ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));
+
+	return smc;
+}
+EXPORT_SYMBOL(apple_smc_probe);
+
+int apple_smc_remove(struct apple_smc *smc)
+{
+	mfd_remove_devices(smc->dev);
+
+	/* Disable notifications */
+	apple_smc_write_flag(smc, SMC_KEY(NTAP), 1);
+
+	return 0;
+}
+EXPORT_SYMBOL(apple_smc_remove);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC core");
diff --git a/drivers/platform/apple/smc_rtkit.c b/drivers/platform/apple/smc_rtkit.c
new file mode 100644
index 000000000000..3359498122fc
--- /dev/null
+++ b/drivers/platform/apple/smc_rtkit.c
@@ -0,0 +1,453 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC RTKit backend
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <asm/unaligned.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/soc/apple/rtkit.h>
+#include "smc.h"
+
+#define SMC_ENDPOINT			0x20
+
+/* Guess */
+#define SMC_SHMEM_SIZE			0x1000
+#define SMC_MAX_SIZE			255
+
+#define SMC_MSG_READ_KEY		0x10
+#define SMC_MSG_WRITE_KEY		0x11
+#define SMC_MSG_GET_KEY_BY_INDEX	0x12
+#define SMC_MSG_GET_KEY_INFO		0x13
+#define SMC_MSG_INITIALIZE		0x17
+#define SMC_MSG_NOTIFICATION		0x18
+#define SMC_MSG_RW_KEY			0x20
+
+#define SMC_DATA			GENMASK(63, 32)
+#define SMC_WSIZE			GENMASK(31, 24)
+#define SMC_SIZE			GENMASK(23, 16)
+#define SMC_ID				GENMASK(15, 12)
+#define SMC_MSG				GENMASK(7, 0)
+#define SMC_RESULT			SMC_MSG
+
+#define SMC_RECV_TIMEOUT		100
+
+struct apple_smc_rtkit {
+	struct device *dev;
+	struct apple_smc *core;
+	struct apple_rtkit *rtk;
+
+	struct completion init_done;
+	bool initialized;
+	bool alive;
+
+	struct resource *sram;
+	void __iomem *sram_base;
+	struct apple_rtkit_shmem shmem;
+
+	unsigned int msg_id;
+
+	bool atomic_pending;
+	struct completion cmd_done;
+	u64 cmd_ret;
+};
+
+static int apple_smc_rtkit_write_key_atomic(void *cookie, smc_key key, void *buf, size_t size)
+{
+	struct apple_smc_rtkit *smc = cookie;
+	int ret;
+	u64 msg;
+	u8 result;
+
+	if (size > SMC_MAX_SIZE || size == 0)
+		return -EINVAL;
+
+	if (!smc->alive)
+		return -EIO;
+
+	memcpy_toio(smc->shmem.iomem, buf, size);
+	smc->msg_id = (smc->msg_id + 1) & 0xf;
+	msg = (FIELD_PREP(SMC_MSG, SMC_MSG_WRITE_KEY) |
+	       FIELD_PREP(SMC_SIZE, size) |
+	       FIELD_PREP(SMC_ID, smc->msg_id) |
+	       FIELD_PREP(SMC_DATA, key));
+	smc->atomic_pending = true;
+
+	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT, msg, NULL, true);
+	if (ret < 0) {
+		dev_err(smc->dev, "Failed to send command (%d)\n", ret);
+		return ret;
+	}
+
+	while (smc->atomic_pending) {
+		ret = apple_rtkit_poll(smc->rtk);
+		if (ret < 0) {
+			dev_err(smc->dev, "RTKit poll failed (%llx)", msg);
+			return ret;
+		}
+		udelay(100);
+	}
+
+	if (FIELD_GET(SMC_ID, smc->cmd_ret) != smc->msg_id) {
+		dev_err(smc->dev, "Command sequence mismatch (expected %d, got %d)\n",
+			smc->msg_id, (unsigned int)FIELD_GET(SMC_ID, smc->cmd_ret));
+		return -EIO;
+	}
+
+	result = FIELD_GET(SMC_RESULT, smc->cmd_ret);
+	if (result != 0)
+		return -result;
+
+	return FIELD_GET(SMC_SIZE, smc->cmd_ret);
+}
+
+static int apple_smc_cmd(struct apple_smc_rtkit *smc, u64 cmd, u64 arg,
+			 u64 size, u64 wsize, u32 *ret_data)
+{
+	int ret;
+	u64 msg;
+	u8 result;
+
+	if (!smc->alive)
+		return -EIO;
+
+	reinit_completion(&smc->cmd_done);
+
+	smc->msg_id = (smc->msg_id + 1) & 0xf;
+	msg = (FIELD_PREP(SMC_MSG, cmd) |
+	       FIELD_PREP(SMC_SIZE, size) |
+	       FIELD_PREP(SMC_WSIZE, wsize) |
+	       FIELD_PREP(SMC_ID, smc->msg_id) |
+	       FIELD_PREP(SMC_DATA, arg));
+
+	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT, msg, NULL, false);
+	if (ret < 0) {
+		dev_err(smc->dev, "Failed to send command\n");
+		return ret;
+	}
+
+	do {
+		if (wait_for_completion_timeout(&smc->cmd_done,
+						msecs_to_jiffies(SMC_RECV_TIMEOUT)) == 0) {
+			dev_err(smc->dev, "Command timed out (%llx)", msg);
+			return -ETIMEDOUT;
+		}
+		if (FIELD_GET(SMC_ID, smc->cmd_ret) == smc->msg_id)
+			break;
+		dev_err(smc->dev, "Command sequence mismatch (expected %d, got %d)\n",
+			smc->msg_id, (unsigned int)FIELD_GET(SMC_ID, smc->cmd_ret));
+	} while(1);
+
+	result = FIELD_GET(SMC_RESULT, smc->cmd_ret);
+	if (result != 0)
+		return -result;
+
+	if (ret_data)
+		*ret_data = FIELD_GET(SMC_DATA, smc->cmd_ret);
+
+	return FIELD_GET(SMC_SIZE, smc->cmd_ret);
+}
+
+static int _apple_smc_rtkit_read_key(struct apple_smc_rtkit *smc, smc_key key,
+				     void *buf, size_t size, size_t wsize)
+{
+	int ret;
+	u32 rdata;
+	u64 cmd;
+
+	if (size > SMC_MAX_SIZE || size == 0)
+		return -EINVAL;
+
+	cmd = wsize ? SMC_MSG_RW_KEY : SMC_MSG_READ_KEY;
+
+	ret = apple_smc_cmd(smc, cmd, key, size, wsize, &rdata);
+	if (ret < 0)
+		return ret;
+
+	if (size <= 4)
+		memcpy(buf, &rdata, size);
+	else
+		memcpy_fromio(buf, smc->shmem.iomem, size);
+
+	return ret;
+}
+
+static int apple_smc_rtkit_read_key(void *cookie, smc_key key, void *buf, size_t size)
+{
+	return _apple_smc_rtkit_read_key(cookie, key, buf, size, 0);
+}
+
+static int apple_smc_rtkit_write_key(void *cookie, smc_key key, void *buf, size_t size)
+{
+	struct apple_smc_rtkit *smc = cookie;
+
+	if (size > SMC_MAX_SIZE || size == 0)
+		return -EINVAL;
+
+	memcpy_toio(smc->shmem.iomem, buf, size);
+	return apple_smc_cmd(smc, SMC_MSG_WRITE_KEY, key, size, 0, NULL);
+}
+
+static int apple_smc_rtkit_rw_key(void *cookie, smc_key key,
+				  void *wbuf, size_t wsize, void *rbuf, size_t rsize)
+{
+	struct apple_smc_rtkit *smc = cookie;
+
+	if (wsize > SMC_MAX_SIZE || wsize == 0)
+		return -EINVAL;
+
+	memcpy_toio(smc->shmem.iomem, wbuf, wsize);
+	return _apple_smc_rtkit_read_key(smc, key, rbuf, rsize, wsize);
+}
+
+static int apple_smc_rtkit_get_key_by_index(void *cookie, int index, smc_key *key)
+{
+	struct apple_smc_rtkit *smc = cookie;
+	int ret;
+
+	ret = apple_smc_cmd(smc, SMC_MSG_GET_KEY_BY_INDEX, index, 0, 0, key);
+
+	*key = swab32(*key);
+	return ret;
+}
+
+static int apple_smc_rtkit_get_key_info(void *cookie, smc_key key, struct apple_smc_key_info *info)
+{
+	struct apple_smc_rtkit *smc = cookie;
+	u8 key_info[6];
+	int ret;
+
+	ret = apple_smc_cmd(smc, SMC_MSG_GET_KEY_INFO, key, 0, 0, NULL);
+	if (ret >= 0 && info) {
+		info->size = key_info[0];
+		info->type_code = get_unaligned_be32(&key_info[1]);
+		info->flags = key_info[5];
+	}
+	return ret;
+}
+
+static const struct apple_smc_backend_ops apple_smc_rtkit_be_ops = {
+	.read_key = apple_smc_rtkit_read_key,
+	.write_key = apple_smc_rtkit_write_key,
+	.write_key_atomic = apple_smc_rtkit_write_key_atomic,
+	.rw_key = apple_smc_rtkit_rw_key,
+	.get_key_by_index = apple_smc_rtkit_get_key_by_index,
+	.get_key_info = apple_smc_rtkit_get_key_info,
+};
+
+static void apple_smc_rtkit_crashed(void *cookie)
+{
+	struct apple_smc_rtkit *smc = cookie;
+
+	dev_err(smc->dev, "SMC crashed! Your system will reboot in a few seconds...\n");
+	smc->alive = false;
+}
+
+static int apple_smc_rtkit_shmem_setup(void *cookie, struct apple_rtkit_shmem *bfr)
+{
+	struct apple_smc_rtkit *smc = cookie;
+	struct resource res = {
+		.start = bfr->iova,
+		.end = bfr->iova + bfr->size - 1,
+		.name = "rtkit_map",
+		.flags = smc->sram->flags,
+	};
+
+	if (!bfr->iova) {
+		dev_err(smc->dev, "RTKit wants a RAM buffer\n");
+		return -EIO;
+	}
+
+	if (res.end < res.start || !resource_contains(smc->sram, &res)) {
+		dev_err(smc->dev,
+			"RTKit buffer request outside SRAM region: %pR", &res);
+		return -EFAULT;
+	}
+
+	bfr->iomem = smc->sram_base + (res.start - smc->sram->start);
+	bfr->is_mapped = true;
+
+	return 0;
+}
+
+static void apple_smc_rtkit_shmem_destroy(void *cookie, struct apple_rtkit_shmem *bfr)
+{
+	// no-op
+}
+
+static bool apple_smc_rtkit_recv_early(void *cookie, u8 endpoint, u64 message)
+{
+	struct apple_smc_rtkit *smc = cookie;
+
+	if (endpoint != SMC_ENDPOINT) {
+		dev_err(smc->dev, "Received message for unknown endpoint 0x%x\n", endpoint);
+		return false;
+	}
+
+	if (!smc->initialized) {
+		int ret;
+
+		smc->shmem.iova = message;
+		smc->shmem.size = SMC_SHMEM_SIZE;
+		ret = apple_smc_rtkit_shmem_setup(smc, &smc->shmem);
+		if (ret < 0)
+			dev_err(smc->dev, "Failed to initialize shared memory\n");
+		else
+			smc->alive = true;
+		smc->initialized = true;
+		complete(&smc->init_done);
+	} else if (FIELD_GET(SMC_MSG, message) == SMC_MSG_NOTIFICATION) {
+		/* Handle these in the RTKit worker thread */
+		return false;
+	} else {
+		smc->cmd_ret = message;
+		if (smc->atomic_pending) {
+			smc->atomic_pending = false;
+		} else {
+			complete(&smc->cmd_done);
+		}
+	}
+
+	return true;
+}
+
+static void apple_smc_rtkit_recv(void *cookie, u8 endpoint, u64 message)
+{
+	struct apple_smc_rtkit *smc = cookie;
+
+	if (endpoint != SMC_ENDPOINT) {
+		dev_err(smc->dev, "Received message for unknown endpoint 0x%x\n", endpoint);
+		return;
+	}
+
+	if (FIELD_GET(SMC_MSG, message) != SMC_MSG_NOTIFICATION) {
+		dev_err(smc->dev, "Received unknown message from worker: 0x%llx\n", message);
+		return;
+	}
+
+	apple_smc_event_received(smc->core, FIELD_GET(SMC_DATA, message));
+}
+
+static const struct apple_rtkit_ops apple_smc_rtkit_ops = {
+	.crashed = apple_smc_rtkit_crashed,
+	.recv_message = apple_smc_rtkit_recv,
+	.recv_message_early = apple_smc_rtkit_recv_early,
+	.shmem_setup = apple_smc_rtkit_shmem_setup,
+	.shmem_destroy = apple_smc_rtkit_shmem_destroy,
+};
+
+static int apple_smc_rtkit_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct apple_smc_rtkit *smc;
+	int ret;
+
+	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
+	if (!smc)
+		return -ENOMEM;
+
+	smc->dev = dev;
+
+	smc->sram = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	if (!smc->sram)
+		return dev_err_probe(dev, EIO,
+				     "No SRAM region");
+
+	smc->sram_base = devm_ioremap_resource(dev, smc->sram);
+	if (IS_ERR(smc->sram_base))
+		return dev_err_probe(dev, PTR_ERR(smc->sram_base),
+				     "Failed to map SRAM region");
+
+	smc->rtk =
+		devm_apple_rtkit_init(dev, smc, NULL, 0, &apple_smc_rtkit_ops);
+	if (IS_ERR(smc->rtk))
+		return dev_err_probe(dev, PTR_ERR(smc->rtk),
+				     "Failed to intialize RTKit");
+
+	ret = apple_rtkit_wake(smc->rtk);
+	if (ret != 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to wake up SMC");
+
+	ret = apple_rtkit_start_ep(smc->rtk, SMC_ENDPOINT);
+	if (ret != 0) {
+		dev_err(dev, "Failed to start endpoint");
+		goto cleanup;
+	}
+
+	init_completion(&smc->init_done);
+	init_completion(&smc->cmd_done);
+
+	ret = apple_rtkit_send_message(smc->rtk, SMC_ENDPOINT,
+				       FIELD_PREP(SMC_MSG, SMC_MSG_INITIALIZE), NULL, false);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "Failed to send init message");
+		goto cleanup;
+	}
+
+	if (wait_for_completion_timeout(&smc->init_done,
+					msecs_to_jiffies(SMC_RECV_TIMEOUT)) == 0) {
+		ret = -ETIMEDOUT;
+		dev_err(dev, "Timed out initializing SMC");
+		goto cleanup;
+	}
+
+	if (!smc->alive) {
+		ret = -EIO;
+		goto cleanup;
+	}
+
+	smc->core = apple_smc_probe(dev, &apple_smc_rtkit_be_ops, smc);
+	if (IS_ERR(smc->core)) {
+		ret = PTR_ERR(smc->core);
+		goto cleanup;
+	}
+
+	return 0;
+
+cleanup:
+	/* Try to shut down RTKit, if it's not completely wedged */
+	if (apple_rtkit_is_running(smc->rtk))
+		apple_rtkit_quiesce(smc->rtk);
+
+	return ret;
+}
+
+static int apple_smc_rtkit_remove(struct platform_device *pdev)
+{
+	struct apple_smc *core = platform_get_drvdata(pdev);
+	struct apple_smc_rtkit *smc = apple_smc_get_cookie(core);
+
+	apple_smc_remove(core);
+
+	if (apple_rtkit_is_running(smc->rtk))
+		apple_rtkit_quiesce(smc->rtk);
+
+	return 0;
+}
+
+static const struct of_device_id apple_smc_rtkit_of_match[] = {
+	{ .compatible = "apple,smc" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apple_smc_rtkit_of_match);
+
+static struct platform_driver apple_smc_rtkit_driver = {
+	.driver = {
+		.name = "macsmc-rtkit",
+		.owner = THIS_MODULE,
+		.of_match_table = apple_smc_rtkit_of_match,
+	},
+	.probe = apple_smc_rtkit_probe,
+	.remove = apple_smc_rtkit_remove,
+};
+module_platform_driver(apple_smc_rtkit_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC RTKit backend driver");
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
new file mode 100644
index 000000000000..39b4dc4ca881
--- /dev/null
+++ b/include/linux/mfd/macsmc.h
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC core definitions
+ * Copyright (C) The Asahi Linux Contributors
+ */
+
+#ifndef _LINUX_MFD_MACSMC_H
+#define _LINUX_MFD_MACSMC_H
+
+struct apple_smc;
+
+typedef u32 smc_key;
+
+#define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
+#define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+
+#define APPLE_SMC_READABLE BIT(7)
+#define APPLE_SMC_WRITABLE BIT(6)
+#define APPLE_SMC_FUNCTION BIT(4)
+
+struct apple_smc_key_info {
+	u8 size;
+	u32 type_code;
+	u8 flags;
+};
+
+int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+		 void *rbuf, size_t rsize);
+
+int apple_smc_get_key_count(struct apple_smc *smc);
+int apple_smc_find_first_key_index(struct apple_smc *smc, smc_key key);
+int apple_smc_get_key_by_index(struct apple_smc *smc, int index, smc_key *key);
+int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_key_info *info);
+
+static inline bool apple_smc_key_exists(struct apple_smc *smc, smc_key key)
+{
+	return apple_smc_get_key_info(smc, key, NULL) >= 0;
+}
+
+#define APPLE_SMC_TYPE_OPS(type) \
+	static inline int apple_smc_read_##type(struct apple_smc *smc, smc_key key, type *p) \
+	{ \
+		int ret = apple_smc_read(smc, key, p, sizeof(*p)); \
+		return (ret < 0) ? ret : ((ret != sizeof(*p)) ? -EINVAL : 0); \
+	} \
+	static inline int apple_smc_write_##type(struct apple_smc *smc, smc_key key, type p) \
+	{ \
+		return apple_smc_write(smc, key, &p, sizeof(p)); \
+	} \
+	static inline int apple_smc_write_##type##_atomic(struct apple_smc *smc, smc_key key, type p) \
+	{ \
+		return apple_smc_write_atomic(smc, key, &p, sizeof(p)); \
+	} \
+	static inline int apple_smc_rw_##type(struct apple_smc *smc, smc_key key, \
+					      type w, type *r) \
+	{ \
+		int ret = apple_smc_rw(smc, key, &w, sizeof(w), r, sizeof(*r)); \
+		return (ret < 0) ? ret : ((ret != sizeof(*r)) ? -EINVAL : 0); \
+	}
+
+APPLE_SMC_TYPE_OPS(u64)
+APPLE_SMC_TYPE_OPS(u32)
+APPLE_SMC_TYPE_OPS(u16)
+APPLE_SMC_TYPE_OPS(u8)
+APPLE_SMC_TYPE_OPS(s64)
+APPLE_SMC_TYPE_OPS(s32)
+APPLE_SMC_TYPE_OPS(s16)
+APPLE_SMC_TYPE_OPS(s8)
+
+static inline int apple_smc_read_flag(struct apple_smc *smc, smc_key key)
+{
+	u8 val;
+	int ret = apple_smc_read_u8(smc, key, &val);
+	if (ret < 0)
+		return ret;
+	return val ? 1 : 0;
+}
+#define apple_smc_write_flag apple_smc_write_u8
+
+int apple_smc_register_notifier(struct apple_smc *smc, struct notifier_block *n);
+int apple_smc_unregister_notifier(struct apple_smc *smc, struct notifier_block *n);
+
+#endif
-- 
2.30.2

