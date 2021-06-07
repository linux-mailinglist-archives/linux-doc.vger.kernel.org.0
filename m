Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F76639D9BB
	for <lists+linux-doc@lfdr.de>; Mon,  7 Jun 2021 12:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhFGKgc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Jun 2021 06:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFGKgc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 06:36:32 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5A5C061766
        for <linux-doc@vger.kernel.org>; Mon,  7 Jun 2021 03:34:39 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w21so19620038edv.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S8qFjFtY77CWgD6xHMcfYVdqAsgYbpKAyPPGBYSbTi8=;
        b=J3fNjPwy69JWrSedpDkl2rDyaK5qIRIVYAhjdMhcM+mECiYwVqoBAqnfOqq4GM7Lya
         s/3Wz1ghGZEUMh4YUIjTZrf+nZCuAY7fNm0CMc3SA1fLwX22qm5NqAmPGDjvTqXV4+hR
         79SbLbgj4vf91KSN+7gfbkJrEa9fsmbxRVKfztzHJv/zNFHsIL6+BDb709ejeihEfYST
         mqgUXPeL/n1n2UtSQA7tjzTIG/0sjPhsnWrLdFWLVE9XcjU8GjysKzwIzkAyFaHqgurE
         +DnW1Puwe7S8gVZQqbNGsFCPnqmVdG4cg0edAzBBdPvWLYctYmN2q+W6LGkGz8WZdwqK
         VPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S8qFjFtY77CWgD6xHMcfYVdqAsgYbpKAyPPGBYSbTi8=;
        b=K26IWUKNCig+zYtlUayh/cOhmEw88B/2KrBcyGDOBVU6RBzOcpLoHd/1HM5qpgoIFu
         /8FrI8mG7SvPA7vgpU+avmUAl10cQV/cYtu9v7am/9/vq1eZkcfUdJ3dEw1FW0PJ9aoV
         Fb72Fw/Sw8PhVTZFtP8+wBJpVqauSBZx2jXnCdSqPYaAToSTHWr/Lg7ceAkrmoWk3qW/
         4o8fAPi2rymy4T5iiNMH1IcAO1Xi3+ygZJMQU5q9k77V4772c5nS0BJUP6lDG+PQTugq
         BoI9I1LCo+p8hS9BkunimxSHSvD/d3YdEs+QtgYa7NBzkBvmE9SpumyfUPDVbGstNrIi
         UxUQ==
X-Gm-Message-State: AOAM532t5XEN9hNDTcaLZDN67apVqRyhfEDKA+SDwiyRkKb8BM9ndgtG
        JOyU/B5r2N2g2nIMNY9QKF0bCA==
X-Google-Smtp-Source: ABdhPJx7Gv0KfJS83MdjOa9ptrArD2pPYSH1jJ6YpvueYfGljkizG/xhQXX7AALRICFin5LuV0Sz6g==
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr19271914edu.306.1623062076836;
        Mon, 07 Jun 2021 03:34:36 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-76.xnet.hr. [88.207.96.76])
        by smtp.googlemail.com with ESMTPSA id b25sm7521037edv.9.2021.06.07.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:34:36 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, trivial@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 1/3] hwmon: (pmbus) Add driver for Delta DPS-920AB PSU
Date:   Mon,  7 Jun 2021 12:34:29 +0200
Message-Id: <20210607103431.2039073-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds support for the Delta DPS-920AB PSU.

Only missing feature is fan control which the PSU supports.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v4:
* Alphabetically order documentation in index.rst
* Null terminate manufacturer and mode ID-s
* Drop debugfs directory and I2C clients from the
global structure, use local variables

Changes in v3:
* Use generic pmbus_read/write_word_data()
* Correct word data return code
* Cache PMBUS_MFR_ID and PMBUS_MFR_MODEL instead
of reading them everytime that debugfs is read

Changes in v2:
* Check for Manufacturer and Model
* Restrict word read/write to supported only
* Update documentation to reflect driver changes
* Add basic debugfs entries

 Documentation/hwmon/dps920ab.rst |  73 +++++++++++
 Documentation/hwmon/index.rst    |   1 +
 drivers/hwmon/pmbus/Kconfig      |   9 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/dps920ab.c   | 207 +++++++++++++++++++++++++++++++
 5 files changed, 291 insertions(+)
 create mode 100644 Documentation/hwmon/dps920ab.rst
 create mode 100644 drivers/hwmon/pmbus/dps920ab.c

diff --git a/Documentation/hwmon/dps920ab.rst b/Documentation/hwmon/dps920ab.rst
new file mode 100644
index 000000000000..c33b4cdc0a60
--- /dev/null
+++ b/Documentation/hwmon/dps920ab.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver dps920ab
+========================
+
+Supported chips:
+
+  * Delta DPS920AB
+
+    Prefix: 'dps920ab'
+
+    Addresses scanned: -
+
+Authors:
+    Robert Marko <robert.marko@sartura.hr>
+
+
+Description
+-----------
+
+This driver implements support for Delta DPS920AB 920W 54V DC single output
+power supply with PMBus support.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_alarm		Input current high alarm
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_alarm		Input voltage alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage
+in2_rated_min		Minimum rated output voltage
+in2_rated_max		Maximum rated output voltage
+in2_alarm		Output voltage alarm
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+
+power2_label		"pout1"
+power2_input		Measured output power
+power2_rated_max	Maximum rated output power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_alarm		Temperature alarm
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8d5a2df1ecb6..8abdaf440a3c 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -53,6 +53,7 @@ Hardware Monitoring Kernel Drivers
    da9055
    dell-smm-hwmon
    dme1737
+   dps920ab
    drivetemp
    ds1621
    ds620
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 32d2fc850621..865ade0aa205 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -66,6 +66,15 @@ config SENSORS_IBM_CFFPS
 	  This driver can also be built as a module. If so, the module will
 	  be called ibm-cffps.
 
+config SENSORS_DPS920AB
+	tristate "Delta DPS920AB Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for Delta
+	  DPS920AB Power Supplies.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called dps920ab.
+
 config SENSORS_INSPUR_IPSPS
 	tristate "INSPUR Power System Power Supply"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 6a4ba0fdc1db..f59ba0123d68 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
+obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
new file mode 100644
index 000000000000..692a86cdfb6d
--- /dev/null
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Delta DPS920AB PSU
+ *
+ * Copyright (C) 2021 Delta Networks, Inc.
+ * Copyright (C) 2021 Sartura Ltd.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+struct dps920ab_data {
+	char *mfr_model;
+	char *mfr_id;
+};
+
+static int dps920ab_read_word_data(struct i2c_client *client, int page, int phase, int reg)
+{
+	/*
+	 * This masks commands which are not supported.
+	 * PSU advertises that all features are supported,
+	 * in reality that unfortunately is not true.
+	 * So enable only those that the datasheet confirms.
+	 */
+	switch (reg) {
+	case PMBUS_FAN_COMMAND_1:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_STATUS_WORD:
+	case PMBUS_READ_VIN:
+	case PMBUS_READ_IIN:
+	case PMBUS_READ_VOUT:
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_READ_TEMPERATURE_2:
+	case PMBUS_READ_TEMPERATURE_3:
+	case PMBUS_READ_FAN_SPEED_1:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_PIN:
+	case PMBUS_MFR_VOUT_MIN:
+	case PMBUS_MFR_VOUT_MAX:
+	case PMBUS_MFR_IOUT_MAX:
+	case PMBUS_MFR_POUT_MAX:
+		return pmbus_read_word_data(client, page, phase, reg);
+	default:
+		return -ENXIO;
+	}
+}
+
+static int dps920ab_write_word_data(struct i2c_client *client, int page, int reg,
+				    u16 word)
+{
+	/*
+	 * This masks commands which are not supported.
+	 * PSU only has one R/W register and that is
+	 * for the fan.
+	 */
+	switch (reg) {
+	case PMBUS_FAN_COMMAND_1:
+		return pmbus_write_word_data(client, page, reg, word);
+	default:
+		return -EACCES;
+	}
+}
+
+static struct pmbus_driver_info dps920ab_info = {
+	.pages = 1,
+
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_FAN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_TEMP  | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+		PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12 |
+		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_word_data = dps920ab_read_word_data,
+	.write_word_data = dps920ab_write_word_data,
+};
+
+static int dps920ab_mfr_id_show(struct seq_file *s, void *data)
+{
+	struct dps920ab_data *priv = s->private;
+
+	seq_printf(s, "%s\n", priv->mfr_id);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(dps920ab_mfr_id);
+
+static int dps920ab_mfr_model_show(struct seq_file *s, void *data)
+{
+	struct dps920ab_data *priv = s->private;
+
+	seq_printf(s, "%s\n", priv->mfr_model);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(dps920ab_mfr_model);
+
+static void dps920ab_init_debugfs(struct dps920ab_data *data, struct i2c_client *client)
+{
+	struct dentry *debugfs_dir;
+	struct dentry *root;
+
+	root = pmbus_get_debugfs_dir(client);
+	if (!root)
+		return;
+
+	debugfs_dir = debugfs_create_dir(client->name, root);
+	if (!debugfs_dir)
+		return;
+
+	debugfs_create_file("mfr_id",
+			    0400,
+			    debugfs_dir,
+			    data,
+			    &dps920ab_mfr_id_fops);
+
+	debugfs_create_file("mfr_model",
+			    0400,
+			    debugfs_dir,
+			    data,
+			    &dps920ab_mfr_model_fops);
+}
+
+static int dps920ab_probe(struct i2c_client *client)
+{
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	struct dps920ab_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
+		return ret;
+	}
+
+	buf[ret] = '\0';
+	if (ret != 5 || strncmp(buf, "DELTA", 5)) {
+		buf[ret] = '\0';
+		dev_err(&client->dev, "Unsupported Manufacturer ID '%s'\n", buf);
+		return -ENODEV;
+	}
+	data->mfr_id = devm_kstrdup(&client->dev, buf, GFP_KERNEL);
+	if (!data->mfr_id)
+		return -ENOMEM;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
+		return ret;
+	}
+
+	buf[ret] = '\0';
+	if (ret != 11 || strncmp(buf, "DPS-920AB", 9)) {
+		dev_err(&client->dev, "Unsupported Manufacturer Model '%s'\n", buf);
+		return -ENODEV;
+	}
+	data->mfr_model = devm_kstrdup(&client->dev, buf, GFP_KERNEL);
+	if (!data->mfr_model)
+		return -ENOMEM;
+
+	ret = pmbus_do_probe(client, &dps920ab_info);
+	if (ret)
+		return ret;
+
+	dps920ab_init_debugfs(data, client);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
+	{ .compatible = "delta,dps920ab", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, dps920ab_of_match);
+
+static struct i2c_driver dps920ab_driver = {
+	.driver = {
+		   .name = "dps920ab",
+		   .of_match_table = of_match_ptr(dps920ab_of_match),
+	},
+	.probe_new = dps920ab_probe,
+};
+
+module_i2c_driver(dps920ab_driver);
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_DESCRIPTION("PMBus driver for Delta DPS920AB PSU");
+MODULE_LICENSE("GPL");
-- 
2.31.1

