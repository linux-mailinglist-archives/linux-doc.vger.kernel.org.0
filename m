Return-Path: <linux-doc+bounces-19014-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 130EB91009C
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jun 2024 11:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7143D1F218BE
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jun 2024 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514541A8C01;
	Thu, 20 Jun 2024 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mUVV6HMD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD01A8C2E
	for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876533; cv=none; b=hehOXjwOzNV9sfYl7b1AmZ+/yIg9OEwgZ8fWr+o7xf8Q9++SVnnaV4NCUFUiisPcq0zmuWSqY06ng+uu2m86ksXemV56LBRe32VSEwb+3+9+dmYjYI1p6PFeyDpAFaLikW9C3I3WCsDr9JxG2yHDiHhVCMB28v0aBndSxxgJFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876533; c=relaxed/simple;
	bh=0zkIEoVZ++nandR1WqdZqRFZpV+70DmGDT3COdPa5yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq76cIPqvK5eDrS8zkRQQr2MAKeq6Q6DhGHu3/sCGHcSKaxrZyMHjzCw6Ogh6/6rU/QX/o6pEXouvt9v6l7XSPnG8QOdh7nezWYfC22i8KVppMtS4i1BmDtC7E+PBJqChqALkIqSd7VWo9Oo6wvnXhC9pSRCdZLI58ymgoyrjaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mUVV6HMD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PIY6ukxg1hzU5v6O2K0J6XkNxb/hjJxTeUwR+Mj/s78=; b=mUVV6H
	MD3X9nmSfVSP7OYJTeGwlZLBkvI15y0pjSVQCpek3W8qjcN7mM/ixLfRB5OGZPvp
	5puDPFpOc3Xm7RCJUSzuOKmdSzcpgVdNtApCNSnKbKipluEFhA0B2LT1/TJT4HHb
	CCC74lsKMKQLKVlg+bCt81UUawtV0dONRBUL4aJltQRTEdtJCNtBWKj8vazcvugf
	aNMqISsvyH84bWibm2HmN2cViDkceZjyCYHMFiZ3eGif2Mr5jZXEdsMQoESN4uEY
	KFfc2xFs6Ud5swqaIlOZqXs3OFOLXGkmfeoHepDqt5Yn61HHc3vg6XGUnyp5xtmy
	bhKSzqMFjiEhueSA==
Received: (qmail 964891 invoked from network); 20 Jun 2024 11:42:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2024 11:42:07 +0200
X-UD-Smtp-Session: l3s3148p1@TbvRIE8bGtAgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 1/1] gpio: add sloppy logic analyzer using polling
Date: Thu, 20 Jun 2024 11:41:58 +0200
Message-ID: <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620094159.6785-1-wsa+renesas@sang-engineering.com>
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a sloppy logic analyzer using GPIOs. It comes with a script to
isolate a CPU for polling. While this is definitely not a production
level analyzer, it can be a helpful first view when remote debugging.
Read the documentation for details.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  93 +++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 344 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer.sh      | 246 +++++++++++++
 6 files changed, 702 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer.sh

diff --git a/Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst b/Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
new file mode 100644
index 000000000000..d69f24c0d9e1
--- /dev/null
+++ b/Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
@@ -0,0 +1,93 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+Linux Kernel GPIO based sloppy logic analyzer
+=============================================
+
+:Author: Wolfram Sang
+
+Introduction
+============
+
+This document briefly describes how to run the GPIO based in-kernel sloppy
+logic analyzer running on an isolated CPU.
+
+The sloppy logic analyzer will utilize a few GPIO lines in input mode on a
+system to rapidly sample these digital lines, which will, if the Nyquist
+criteria is met, result in a time series log with approximate waveforms as they
+appeared on these lines. One way to use it is to analyze external traffic
+connected to these GPIO lines with wires (i.e. digital probes), acting as a
+common logic analyzer.
+
+Another feature is to snoop on on-chip peripherals if the I/O cells of these
+peripherals can be used in GPIO input mode at the same time as they are being
+used as inputs or outputs for the peripheral. That means you could e.g. snoop
+I2C traffic without any wiring (if your hardware supports it). In the pin
+control subsystem such pin controllers are called "non-strict": a certain pin
+can be used with a certain peripheral and as a GPIO input line at the same
+time.
+
+Note that this is a last resort analyzer which can be affected by latencies,
+non-deterministic code paths and non-maskable interrupts. It is called 'sloppy'
+for a reason. However, for e.g. remote development, it may be useful to get a
+first view and aid further debugging.
+
+Setup
+=====
+
+Your kernel must have CONFIG_DEBUG_FS and CONFIG_CPUSETS enabled. Ideally, your
+runtime environment does not utilize cpusets otherwise, then isolation of a CPU
+core is easiest. If you do need cpusets, check that helper script for the
+sloppy logic analyzer does not interfere with your other settings.
+
+Tell the kernel which GPIOs are used as probes. For a Device Tree based system,
+you need to use the following bindings. Because these bindings are only for
+debugging, there is no official schema::
+
+    i2c-analyzer {
+            compatible = "gpio-sloppy-logic-analyzer";
+            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
+            probe-names = "SCL", "SDA";
+    };
+
+Note that you must provide a name for every GPIO specified. Currently a
+maximum of 8 probes are supported. 32 are likely possible but are not
+implemented yet.
+
+Usage
+=====
+
+The logic analyzer is configurable via files in debugfs. However, it is
+strongly recommended to not use them directly, but to use the script
+``tools/gpio/gpio-sloppy-logic-analyzer``. Besides checking parameters more
+extensively, it will isolate the CPU core so you will have the least
+disturbance while measuring.
+
+The script has a help option explaining the parameters. For the above DT
+snippet which analyzes an I2C bus at 400kHz on a Renesas Salvator-XS board, the
+following settings are used: The isolated CPU shall be CPU1 because it is a big
+core in a big.LITTLE setup. Because CPU1 is the default, we don't need a
+parameter. The bus speed is 400kHz. So, the sampling theorem says we need to
+sample at least at 800kHz. However, falling edges of both signals in an I2C
+start condition happen faster, so we need a higher sampling frequency, e.g.
+``-s 1500000`` for 1.5MHz. Also, we don't want to sample right away but wait
+for a start condition on an idle bus. So, we need to set a trigger to a falling
+edge on SDA while SCL stays high, i.e. ``-t 1H+2F``. Last is the duration, let
+us assume 15ms here which results in the parameter ``-d 15000``. So,
+altogether::
+
+    gpio-sloppy-logic-analyzer -s 1500000 -t 1H+2F -d 15000
+
+Note that the process will return you back to the prompt but a sub-process is
+still sampling in the background. Unless this has finished, you will not find a
+result file in the current or specified directory. For the above example, we
+will then need to trigger I2C communication::
+
+    i2cdetect -y -r <your bus number>
+
+Result is a .sr file to be consumed with PulseView or sigrok-cli from the free
+`sigrok`_ project. It is a zip file which also contains the binary sample data
+which may be consumed by other software. The filename is the logic analyzer
+instance name plus a since-epoch timestamp.
+
+.. _sigrok: https://sigrok.org/
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index efa49cdc8e2e..6971ed581c08 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -32,6 +32,7 @@ Documentation/dev-tools/testing-overview.rst
    kunit/index
    ktap
    checkuapi
+   gpio-sloppy-logic-analyzer
 
 
 .. only::  subproject and html
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1c28a48915bb..44869de5e3fc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1891,4 +1891,21 @@ config GPIO_SIM
 
 endmenu
 
+menu "GPIO hardware hacking tools"
+
+config GPIO_SLOPPY_LOGIC_ANALYZER
+	tristate "Sloppy GPIO logic analyzer"
+	depends on (GPIOLIB || COMPILE_TEST) && CPUSETS && DEBUG_FS && EXPERT
+	help
+	  This option enables support for a sloppy logic analyzer using polled
+	  GPIOs. Use the 'tools/gpio/gpio-sloppy-logic-analyzer' script with
+	  this driver. The script will make it easier to use and will also
+	  isolate a CPU for the polling task. Note that this is a last resort
+	  analyzer which can be affected by latencies, non-deterministic code
+	  paths, or NMIs. However, for e.g. remote development, it may be useful
+	  to get a first view and aid further debugging.
+
+	  If this driver is built as a module it will be called
+	  'gpio-sloppy-logic-analyzer'.
+endmenu
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e2a53013780e..9889f5b962bf 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
+obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
new file mode 100644
index 000000000000..aed6d1f6cfc3
--- /dev/null
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sloppy logic analyzer using GPIOs (to be run on an isolated CPU)
+ *
+ * Use the 'gpio-sloppy-logic-analyzer' script in the 'tools/gpio' folder for
+ * easier usage and further documentation. Note that this is a last resort
+ * analyzer which can be affected by latencies and non-deterministic code
+ * paths. However, for e.g. remote development, it may be useful to get a first
+ * view and aid further debugging.
+ *
+ * Copyright (C) Wolfram Sang <wsa@sang-engineering.com>
+ * Copyright (C) Renesas Electronics Corporation
+ */
+
+#include <linux/ctype.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/ktime.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/sizes.h>
+#include <linux/timekeeping.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+
+#define GPIO_LA_NAME "gpio-sloppy-logic-analyzer"
+#define GPIO_LA_DEFAULT_BUF_SIZE SZ_256K
+/* can be increased but then we need to extend the u8 buffers */
+#define GPIO_LA_MAX_PROBES 8
+#define GPIO_LA_NUM_TESTS 1024
+
+struct gpio_la_poll_priv {
+	struct mutex blob_lock; /* serialize access to the blob (data) */
+	u32 buf_idx;
+	struct gpio_descs *descs;
+	unsigned long delay_ns;
+	unsigned long acq_delay;
+	struct debugfs_blob_wrapper blob;
+	struct dentry *debug_dir;
+	struct dentry *blob_dent;
+	struct debugfs_blob_wrapper meta;
+	struct device *dev;
+	unsigned int trig_len;
+	u8 *trig_data;
+};
+
+static struct dentry *gpio_la_poll_debug_dir;
+
+static __always_inline int gpio_la_get_array(struct gpio_descs *d, unsigned long *sptr)
+{
+	int ret;
+
+	ret = gpiod_get_array_value(d->ndescs, d->desc, d->info, sptr);
+	if (ret == 0 && fatal_signal_pending(current))
+		ret = -EINTR;
+
+	return ret;
+}
+
+static int fops_capture_set(void *data, u64 val)
+{
+	struct gpio_la_poll_priv *priv = data;
+	u8 *la_buf = priv->blob.data;
+	unsigned long state = 0; /* zeroed because GPIO arrays are bitfields */
+	unsigned long delay;
+	ktime_t start_time;
+	unsigned int i;
+	int ret;
+
+	if (!val)
+		return 0;
+
+	if (!la_buf)
+		return -ENOMEM;
+
+	if (!priv->delay_ns)
+		return -EINVAL;
+
+	mutex_lock(&priv->blob_lock);
+	if (priv->blob_dent) {
+		debugfs_remove(priv->blob_dent);
+		priv->blob_dent = NULL;
+	}
+
+	priv->buf_idx = 0;
+
+	local_irq_disable();
+	preempt_disable_notrace();
+
+	/* Measure delay of reading GPIOs */
+	start_time = ktime_get();
+	for (i = 0; i < GPIO_LA_NUM_TESTS; i++) {
+		ret = gpio_la_get_array(priv->descs, &state);
+		if (ret)
+			goto out;
+	}
+
+	priv->acq_delay = ktime_sub(ktime_get(), start_time) / GPIO_LA_NUM_TESTS;
+	if (priv->delay_ns < priv->acq_delay) {
+		ret = -ERANGE;
+		goto out;
+	}
+
+	delay = priv->delay_ns - priv->acq_delay;
+
+	/* Wait for triggers */
+	for (i = 0; i < priv->trig_len; i += 2) {
+		do {
+			ret = gpio_la_get_array(priv->descs, &state);
+			if (ret)
+				goto out;
+
+			ndelay(delay);
+		} while ((state & priv->trig_data[i]) != priv->trig_data[i + 1]);
+	}
+
+	/* With triggers, final state is also the first sample */
+	if (priv->trig_len)
+		la_buf[priv->buf_idx++] = state;
+
+	/* Sample */
+	while (priv->buf_idx < priv->blob.size) {
+		ret = gpio_la_get_array(priv->descs, &state);
+		if (ret)
+			goto out;
+
+		la_buf[priv->buf_idx++] = state;
+		ndelay(delay);
+	}
+out:
+	preempt_enable_notrace();
+	local_irq_enable();
+	if (ret)
+		dev_err(priv->dev, "couldn't read GPIOs: %d\n", ret);
+
+	kfree(priv->trig_data);
+	priv->trig_data = NULL;
+	priv->trig_len = 0;
+
+	priv->blob_dent = debugfs_create_blob("sample_data", 0400, priv->debug_dir, &priv->blob);
+	mutex_unlock(&priv->blob_lock);
+
+	return ret;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_capture, NULL, fops_capture_set, "%llu\n");
+
+static int fops_buf_size_get(void *data, u64 *val)
+{
+	struct gpio_la_poll_priv *priv = data;
+
+	*val = priv->blob.size;
+
+	return 0;
+}
+
+static int fops_buf_size_set(void *data, u64 val)
+{
+	struct gpio_la_poll_priv *priv = data;
+	int ret = 0;
+	void *p;
+
+	if (!val)
+		return -EINVAL;
+
+	mutex_lock(&priv->blob_lock);
+
+	vfree(priv->blob.data);
+	p = vzalloc(val);
+	if (!p) {
+		val = 0;
+		ret = -ENOMEM;
+	}
+
+	priv->blob.data = p;
+	priv->blob.size = val;
+
+	mutex_unlock(&priv->blob_lock);
+	return ret;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fops_buf_size, fops_buf_size_get, fops_buf_size_set, "%llu\n");
+
+static int trigger_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static ssize_t trigger_write(struct file *file, const char __user *ubuf,
+			     size_t count, loff_t *offset)
+{
+	struct seq_file *m = file->private_data;
+	struct gpio_la_poll_priv *priv = m->private;
+	char *buf;
+
+	/* upper limit is arbitrary but should be less than PAGE_SIZE */
+	if (count > 2048 || count & 1)
+		return -EINVAL;
+
+	buf = memdup_user(ubuf, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	priv->trig_data = buf;
+	priv->trig_len = count;
+
+	return count;
+}
+
+static const struct file_operations fops_trigger = {
+	.owner = THIS_MODULE,
+	.open = trigger_open,
+	.write = trigger_write,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
+static int gpio_la_poll_probe(struct platform_device *pdev)
+{
+	struct gpio_la_poll_priv *priv;
+	struct device *dev = &pdev->dev;
+	const char *devname = dev_name(dev);
+	const char *gpio_names[GPIO_LA_MAX_PROBES];
+	char *meta = NULL;
+	unsigned int i, meta_len = 0;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	devm_mutex_init(dev, &priv->blob_lock);
+
+	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
+
+	priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
+	if (IS_ERR(priv->descs))
+		return PTR_ERR(priv->descs);
+
+	/* artificial limit to keep 1 byte per sample for now */
+	if (priv->descs->ndescs > GPIO_LA_MAX_PROBES)
+		return -EFBIG;
+
+	ret = device_property_read_string_array(dev, "probe-names", gpio_names,
+						priv->descs->ndescs);
+	if (ret >= 0 && ret != priv->descs->ndescs)
+		ret = -EBADR;
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "error naming the GPIOs");
+
+	for (i = 0; i < priv->descs->ndescs; i++) {
+		unsigned int add_len;
+		char *new_meta, *consumer_name;
+
+		if (gpiod_cansleep(priv->descs->desc[i]))
+			return -EREMOTE;
+
+		consumer_name = kasprintf(GFP_KERNEL, "%s: %s", devname, gpio_names[i]);
+		if (!consumer_name)
+			return -ENOMEM;
+		gpiod_set_consumer_name(priv->descs->desc[i], consumer_name);
+		kfree(consumer_name);
+
+		/* '10' is length of 'probe00=\n\0' */
+		add_len = strlen(gpio_names[i]) + 10;
+
+		new_meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);
+		if (!new_meta)
+			return -ENOMEM;
+
+		meta = new_meta;
+		meta_len += snprintf(meta + meta_len, add_len, "probe%02u=%s\n",
+				     i + 1, gpio_names[i]);
+	}
+
+	platform_set_drvdata(pdev, priv);
+	priv->dev = dev;
+
+	priv->meta.data = meta;
+	priv->meta.size = meta_len;
+	priv->debug_dir = debugfs_create_dir(devname, gpio_la_poll_debug_dir);
+	debugfs_create_blob("meta_data", 0400, priv->debug_dir, &priv->meta);
+	debugfs_create_ulong("delay_ns", 0600, priv->debug_dir, &priv->delay_ns);
+	debugfs_create_ulong("delay_ns_acquisition", 0400, priv->debug_dir, &priv->acq_delay);
+	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
+	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
+	debugfs_create_file_unsafe("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
+
+	return 0;
+}
+
+static void gpio_la_poll_remove(struct platform_device *pdev)
+{
+	struct gpio_la_poll_priv *priv = platform_get_drvdata(pdev);
+
+	mutex_lock(&priv->blob_lock);
+	debugfs_remove_recursive(priv->debug_dir);
+	mutex_unlock(&priv->blob_lock);
+}
+
+static const struct of_device_id gpio_la_poll_of_match[] = {
+	{ .compatible = GPIO_LA_NAME },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpio_la_poll_of_match);
+
+static struct platform_driver gpio_la_poll_device_driver = {
+	.probe = gpio_la_poll_probe,
+	.remove_new = gpio_la_poll_remove,
+	.driver = {
+		.name = GPIO_LA_NAME,
+		.of_match_table = gpio_la_poll_of_match,
+	}
+};
+
+static int __init gpio_la_poll_init(void)
+{
+	gpio_la_poll_debug_dir = debugfs_create_dir(GPIO_LA_NAME, NULL);
+
+	return platform_driver_register(&gpio_la_poll_device_driver);
+}
+/*
+ * Non-strict pin controllers can read GPIOs while being muxed to something else.
+ * To support that, we need to claim GPIOs before further pinmuxing happens. So,
+ * we probe early using 'late_initcall'
+ */
+late_initcall(gpio_la_poll_init);
+
+static void __exit gpio_la_poll_exit(void)
+{
+	platform_driver_unregister(&gpio_la_poll_device_driver);
+	debugfs_remove_recursive(gpio_la_poll_debug_dir);
+}
+module_exit(gpio_la_poll_exit);
+
+MODULE_AUTHOR("Wolfram Sang <wsa@sang-engineering.com>");
+MODULE_DESCRIPTION("Sloppy logic analyzer using GPIOs");
+MODULE_LICENSE("GPL");
diff --git a/tools/gpio/gpio-sloppy-logic-analyzer.sh b/tools/gpio/gpio-sloppy-logic-analyzer.sh
new file mode 100755
index 000000000000..ed21a110df5e
--- /dev/null
+++ b/tools/gpio/gpio-sloppy-logic-analyzer.sh
@@ -0,0 +1,246 @@
+#!/bin/sh -eu
+# SPDX-License-Identifier: GPL-2.0
+#
+# Helper script for the Linux Kernel GPIO sloppy logic analyzer
+#
+# Copyright (C) Wolfram Sang <wsa@sang-engineering.com>
+# Copyright (C) Renesas Electronics Corporation
+
+samplefreq=1000000
+numsamples=250000
+cpusetdefaultdir='/sys/fs/cgroup'
+cpusetprefix='cpuset.'
+debugdir='/sys/kernel/debug'
+ladirname='gpio-sloppy-logic-analyzer'
+outputdir="$PWD"
+neededcmds='taskset zip'
+max_chans=8
+duration=
+initcpu=
+listinstances=0
+lainstance=
+lasysfsdir=
+triggerdat=
+trigger_bindat=
+progname="${0##*/}"
+print_help()
+{
+	cat << EOF
+$progname - helper script for the Linux Kernel Sloppy GPIO Logic Analyzer
+Available options:
+	-c|--cpu <n>: which CPU to isolate for sampling. Only needed once. Default <1>.
+		      Remember that a more powerful CPU gives you higher sampling speeds.
+		      Also CPU0 is not recommended as it usually does extra bookkeeping.
+	-d|--duration-us <SI-n>: number of microseconds to sample. Overrides -n, no default value.
+	-h|--help: print this help
+	-i|--instance <str>: name of the logic analyzer in case you have multiple instances. Default
+			     to first instance found
+	-k|--kernel-debug-dir <str>: path to the kernel debugfs mountpoint. Default: <$debugdir>
+	-l|--list-instances: list all available instances
+	-n|--num_samples <SI-n>: number of samples to acquire. Default <$numsamples>
+	-o|--output-dir <str>: directory to put the result files. Default: current dir
+	-s|--sample_freq <SI-n>: desired sampling frequency. Might be capped if too large.
+				 Default: <1000000>
+	-t|--trigger <str>: pattern to use as trigger. <str> consists of two-char pairs. First
+			    char is channel number starting at "1". Second char is trigger level:
+			    "L" - low; "H" - high; "R" - rising; "F" - falling
+			    These pairs can be combined with "+", so "1H+2F" triggers when probe 1
+			    is high while probe 2 has a falling edge. You can have multiple triggers
+			    combined with ",". So, "1H+2F,1H+2R" is like the example before but it
+			    waits for a rising edge on probe 2 while probe 1 is still high after the
+			    first trigger has been met.
+			    Trigger data will only be used for the next capture and then be erased.
+
+<SI-n> is an integer value where SI units "T", "G", "M", "K" are recognized, e.g. '1M500K' is 1500000.
+
+Examples:
+Samples $numsamples values at 1MHz with an already prepared CPU or automatically prepares CPU1 if needed,
+use the first logic analyzer instance found:
+	'$progname'
+Samples 50us at 2MHz waiting for a falling edge on channel 2. CPU and instance as above:
+	'$progname -d 50 -s 2M -t "2F"'
+
+Note that the process exits after checking all parameters but a sub-process still works in
+the background. The result is only available once the sub-process finishes.
+
+Result is a .sr file to be consumed with PulseView from the free Sigrok project. It is
+a zip file which also contains the binary sample data which may be consumed by others.
+The filename is the logic analyzer instance name plus a since-epoch timestamp.
+EOF
+}
+
+fail()
+{
+	echo "$1"
+	exit 1
+}
+
+parse_si()
+{
+	conv_si="$(printf $1 | sed 's/[tT]+\?/*1000G+/g; s/[gG]+\?/*1000M+/g; s/[mM]+\?/*1000K+/g; s/[kK]+\?/*1000+/g; s/+$//')"
+	si_val="$((conv_si))"
+}
+set_newmask()
+{
+	for f in $(find "$1" -iname "$2"); do echo "$newmask" > "$f" 2>/dev/null || true; done
+}
+
+init_cpu()
+{
+	isol_cpu="$1"
+
+	[ -d "$lacpusetdir" ] || mkdir "$lacpusetdir"
+
+	cur_cpu=$(cat "${lacpusetfile}cpus")
+	[ "$cur_cpu" = "$isol_cpu" ] && return
+	[ -z "$cur_cpu" ] || fail "CPU$isol_cpu requested but CPU$cur_cpu already isolated"
+
+	echo "$isol_cpu" > "${lacpusetfile}cpus" || fail "Could not isolate CPU$isol_cpu. Does it exist?"
+	echo 1 > "${lacpusetfile}cpu_exclusive"
+	echo 0 > "${lacpusetfile}mems"
+
+	oldmask=$(cat /proc/irq/default_smp_affinity)
+	newmask=$(printf "%x" $((0x$oldmask & ~(1 << isol_cpu))))
+
+	set_newmask '/proc/irq' '*smp_affinity'
+	set_newmask '/sys/devices/virtual/workqueue/' 'cpumask'
+
+	# Move tasks away from isolated CPU
+	for p in $(ps -o pid | tail -n +2); do
+		mask=$(taskset -p "$p") || continue
+		# Ignore tasks with a custom mask, i.e. not equal $oldmask
+		[ "${mask##*: }" = "$oldmask" ] || continue
+		taskset -p "$newmask" "$p" || continue
+	done 2>/dev/null >/dev/null
+
+	# Big hammer! Working with 'rcu_momentary_dyntick_idle()' for a more fine-grained solution
+	# still printed warnings. Same for re-enabling the stall detector after sampling.
+	echo 1 > /sys/module/rcupdate/parameters/rcu_cpu_stall_suppress
+
+	cpufreqgov="/sys/devices/system/cpu/cpu$isol_cpu/cpufreq/scaling_governor"
+	[ -w "$cpufreqgov" ] && echo 'performance' > "$cpufreqgov" || true
+}
+
+parse_triggerdat()
+{
+	oldifs="$IFS"
+	IFS=','; for trig in $1; do
+		mask=0; val1=0; val2=0
+		IFS='+'; for elem in $trig; do
+			chan=${elem%[lhfrLHFR]}
+			mode=${elem#$chan}
+			# Check if we could parse something and the channel number fits
+			[ "$chan" != "$elem" ] && [ "$chan" -le $max_chans ] || fail "Trigger syntax error: $elem"
+			bit=$((1 << (chan - 1)))
+			mask=$((mask | bit))
+			case $mode in
+				[hH]) val1=$((val1 | bit)); val2=$((val2 | bit));;
+				[fF]) val1=$((val1 | bit));;
+				[rR]) val2=$((val2 | bit));;
+			esac
+		done
+		trigger_bindat="$trigger_bindat$(printf '\\%o\\%o' $mask $val1)"
+		[ $val1 -ne $val2 ] && trigger_bindat="$trigger_bindat$(printf '\\%o\\%o' $mask $val2)"
+	done
+	IFS="$oldifs"
+}
+
+do_capture()
+{
+	taskset "$1" echo 1 > "$lasysfsdir"/capture || fail "Capture error! Check kernel log"
+
+	srtmp=$(mktemp -d)
+	echo 1 > "$srtmp"/version
+	cp "$lasysfsdir"/sample_data "$srtmp"/logic-1-1
+	cat > "$srtmp"/metadata << EOF
+[global]
+sigrok version=0.2.0
+
+[device 1]
+capturefile=logic-1
+total probes=$(wc -l < "$lasysfsdir"/meta_data)
+samplerate=${samplefreq}Hz
+unitsize=1
+EOF
+	cat "$lasysfsdir"/meta_data >> "$srtmp"/metadata
+
+	zipname="$outputdir/${lasysfsdir##*/}-$(date +%s).sr"
+	zip -jq "$zipname" "$srtmp"/*
+	rm -rf "$srtmp"
+	delay_ack=$(cat "$lasysfsdir"/delay_ns_acquisition)
+	[ "$delay_ack" -eq 0 ] && delay_ack=1
+	echo "Logic analyzer done. Saved '$zipname'"
+	echo "Max sample frequency this time: $((1000000000 / delay_ack))Hz."
+}
+
+rep=$(getopt -a -l cpu:,duration-us:,help,instance:,list-instances,kernel-debug-dir:,num_samples:,output-dir:,sample_freq:,trigger: -o c:d:hi:k:ln:o:s:t: -- "$@") || exit 1
+eval set -- "$rep"
+while true; do
+	case "$1" in
+	-c|--cpu) initcpu="$2"; shift;;
+	-d|--duration-us) parse_si $2; duration=$si_val; shift;;
+	-h|--help) print_help; exit 0;;
+	-i|--instance) lainstance="$2"; shift;;
+	-k|--kernel-debug-dir) debugdir="$2"; shift;;
+	-l|--list-instances) listinstances=1;;
+	-n|--num_samples) parse_si $2; numsamples=$si_val; shift;;
+	-o|--output-dir) outputdir="$2"; shift;;
+	-s|--sample_freq) parse_si $2; samplefreq=$si_val; shift;;
+	-t|--trigger) triggerdat="$2"; shift;;
+	--) break;;
+	*) fail "error parsing command line: $*";;
+	esac
+	shift
+done
+
+for f in $neededcmds; do
+	command -v "$f" >/dev/null || fail "Command '$f' not found"
+done
+
+# print cpuset mountpoint if any, errorcode > 0 if noprefix option was found
+cpusetdir=$(awk '$3 == "cgroup" && $4 ~ /cpuset/ { print $2; exit (match($4, /noprefix/) > 0) }' /proc/self/mounts) || cpusetprefix=''
+if [ -z "$cpusetdir" ]; then
+	cpusetdir="$cpusetdefaultdir"
+	[ -d $cpusetdir ] || mkdir $cpusetdir
+	mount -t cgroup -o cpuset none $cpusetdir || fail "Couldn't mount cpusets. Not in kernel or already in use?"
+fi
+
+lacpusetdir="$cpusetdir/$ladirname"
+lacpusetfile="$lacpusetdir/$cpusetprefix"
+sysfsdir="$debugdir/$ladirname"
+
+[ "$samplefreq" -ne 0 ] || fail "Invalid sample frequency"
+
+[ -d "$sysfsdir" ] || fail "Could not find logic analyzer root dir '$sysfsdir'. Module loaded?"
+[ -x "$sysfsdir" ] || fail "Could not access logic analyzer root dir '$sysfsdir'. Need root?"
+
+[ $listinstances -gt 0 ] && find "$sysfsdir" -mindepth 1 -type d | sed 's|.*/||' && exit 0
+
+if [ -n "$lainstance" ]; then
+	lasysfsdir="$sysfsdir/$lainstance"
+else
+	lasysfsdir=$(find "$sysfsdir" -mindepth 1 -type d -print -quit)
+fi
+[ -d "$lasysfsdir" ] || fail "Logic analyzer directory '$lasysfsdir' not found!"
+[ -d "$outputdir" ] || fail "Output directory '$outputdir' not found!"
+
+[ -n "$initcpu" ] && init_cpu "$initcpu"
+[ -d "$lacpusetdir" ] || { echo "Auto-Isolating CPU1"; init_cpu 1; }
+
+ndelay=$((1000000000 / samplefreq))
+echo "$ndelay" > "$lasysfsdir"/delay_ns
+
+[ -n "$duration" ] && numsamples=$((samplefreq * duration / 1000000))
+echo $numsamples > "$lasysfsdir"/buf_size
+
+if [ -n "$triggerdat" ]; then
+	parse_triggerdat "$triggerdat"
+	printf "$trigger_bindat" > "$lasysfsdir"/trigger 2>/dev/null || fail "Trigger data '$triggerdat' rejected"
+fi
+
+workcpu=$(cat "${lacpusetfile}effective_cpus")
+[ -n "$workcpu" ] || fail "No isolated CPU found"
+cpumask=$(printf '%x' $((1 << workcpu)))
+instance=${lasysfsdir##*/}
+echo "Setting up '$instance': $numsamples samples at ${samplefreq}Hz with ${triggerdat:-no} trigger using CPU$workcpu"
+do_capture "$cpumask" &
-- 
2.43.0


