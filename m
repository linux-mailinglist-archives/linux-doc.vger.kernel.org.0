Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 993AD621981
	for <lists+linux-doc@lfdr.de>; Tue,  8 Nov 2022 17:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbiKHQdk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Nov 2022 11:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbiKHQdi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 11:33:38 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B13712AE9;
        Tue,  8 Nov 2022 08:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BgK1ohMbKS6L9KcI+5UCn87ienmHRdLAmDMnE7ZbuPk=; b=jiyxuxlkBeWJ9hSiY09bBNOND6
        2PkklXxqC5CAWyGK/c1PeuYc3wdlzYA37cGeHdH2p/jBRF/aagElPKAzkwW2FSpMEjEa/E8GRag6C
        zwSonIdMjnxGIlNmpEVqTrrTgO6CAPxz6P14zYSDbU6opbgW/RjzxHPxomX7dzEry3+oyXObnsZoE
        VLML29/bgVQrUXVQX/a6/XaxM6CUyJT0i/+vRsF3b1wWsonhuraWiBvfMmV/TZxe41HtRmDKkdNqy
        bjT9V9K9laiDv5tKj3nu9Io+XBIT6qMdJgkWmHau35E4HcVvx1iR+nQqWmoZKfhleWJy3FhMjmex6
        Lk9in9cQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49384 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1osRXZ-0003SR-Cu; Tue, 08 Nov 2022 16:33:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1osRXY-002mw9-Ml; Tue, 08 Nov 2022 16:33:32 +0000
In-Reply-To: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH v3 4/7] platform/apple: Add new Apple Mac SMC driver
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1osRXY-002mw9-Ml@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 08 Nov 2022 16:33:32 +0000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/platform/Kconfig              |   2 +
 drivers/platform/Makefile             |   1 +
 drivers/platform/apple/Kconfig        |  34 ++
 drivers/platform/apple/Makefile       |   7 +
 drivers/platform/apple/macsmc-rtkit.c | 455 ++++++++++++++++++++++++++
 5 files changed, 499 insertions(+)
 create mode 100644 drivers/platform/apple/Kconfig
 create mode 100644 drivers/platform/apple/Makefile
 create mode 100644 drivers/platform/apple/macsmc-rtkit.c

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index dbd327712205..31a361ecfc5e 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -15,4 +15,6 @@ source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
 
+source "drivers/platform/apple/Kconfig"
+
 source "drivers/platform/x86/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 41640172975a..d2baa4eb4f13 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_APPLE_PLATFORMS)	+= apple/
diff --git a/drivers/platform/apple/Kconfig b/drivers/platform/apple/Kconfig
new file mode 100644
index 000000000000..35963c348d05
--- /dev/null
+++ b/drivers/platform/apple/Kconfig
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Apple Platform-Specific Drivers
+#
+
+menuconfig APPLE_PLATFORMS
+	bool "Apple Mac Platform-Specific Device Drivers"
+	depends on ARCH_APPLE || X86 || COMPILE_TEST
+	default ARCH_APPLE
+	help
+	  Say Y here to get to see options for platform-specific device drivers
+	  for Apple devices. This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if APPLE_PLATFORMS
+
+config APPLE_SMC_RTKIT
+	tristate "Apple SMC RTKit backend"
+	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
+	depends on APPLE_RTKIT
+	default ARCH_APPLE
+	select MFD_MACSMC
+	help
+	  Build support for the Apple System Management Controller found in
+	  Apple Macs, communicated with via the RTKit backend. This is required
+	  for Apple Silicon Macs.
+
+	  Say Y here if you have an Apple Silicon Mac.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called macsmc-rtkit.
+
+endif
diff --git a/drivers/platform/apple/Makefile b/drivers/platform/apple/Makefile
new file mode 100644
index 000000000000..16cce9061ee8
--- /dev/null
+++ b/drivers/platform/apple/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/apple
+# Apple Platform-Specific Drivers
+#
+
+obj-$(CONFIG_APPLE_SMC_RTKIT)		+= macsmc-rtkit.o
diff --git a/drivers/platform/apple/macsmc-rtkit.c b/drivers/platform/apple/macsmc-rtkit.c
new file mode 100644
index 000000000000..81560fb73e06
--- /dev/null
+++ b/drivers/platform/apple/macsmc-rtkit.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC RTKit backend
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/mfd/macsmc.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/soc/apple/rtkit.h>
+#include <asm/unaligned.h>
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
+#define SMC_RECV_TIMEOUT		500
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
+		memcpy_fromio(key_info, smc->shmem.iomem, sizeof(key_info));
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
-- 
2.30.2

