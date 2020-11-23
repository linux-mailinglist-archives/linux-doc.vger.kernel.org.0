Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB472C1417
	for <lists+linux-doc@lfdr.de>; Mon, 23 Nov 2020 20:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390562AbgKWS5L (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 23 Nov 2020 13:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbgKWS5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Nov 2020 13:57:10 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E356C0613CF;
        Mon, 23 Nov 2020 10:57:09 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id l17so4656697pgk.1;
        Mon, 23 Nov 2020 10:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bT69tw4Fj0S2U2cAqoiBWYx6BxG04tgttwOAh/pCcHY=;
        b=PqlxGrtauOg2TPssRbAR5LDrvB3r+51IvZZTamg1CtqW+bS1h89yRSu+t34Gm+1vH9
         j5c9darJmc8Tz7CLO9njSnaG0rpFyJ2cB6txnVLq0kJx+eES4U6+DVzdthK8Xce9rsV0
         /tCOFJD4hF26k83wAGW9oOSR7T/E9P6DC0FMbXrQmz58QSd/jZhX4ptujX5UyBijHlF5
         uOZcnrYDCUpycC630EkZS8fKmwY4H4DasJBly4ZNihQPLH0ib1qzEnthpUksKmRtxH3X
         M00ci8ptntKRjwBT80UeFOwZbkfZOH9fXHjpq+i8ftNW4/WYcHWavjXItfKBt4xnVUO9
         RgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bT69tw4Fj0S2U2cAqoiBWYx6BxG04tgttwOAh/pCcHY=;
        b=a/YD3vCeYS+bSAprOPgbEJbzZg6B9uNg4GKVRtZTdnskBq38a/CL+frzzYsKINE2wL
         WdFkQsvOwkKGr9HJ1K3aTuwKJUzBIrF8Kk8Zb5CTXeGeIImAJBoVufXtkQZq3kOy8YUh
         kRZOlo5sMWydWjeLEVh0OZvqEDS+lrHoRBSPjIlVk1iHfoxniFQvnyWftmYTgRAKseRN
         fnf652F7NpzYpcr+P3UG1FZJjzbv8N/8vgd6Gk8SckFUC8/F4RtdZhugZ7CDbIXFfC+V
         /kvM9+Nl45bJGVyszHEMlgsLeVJIJqpMOssVjr2h+8sFmAkZgvk7h++0uKPyAhRwfAlG
         ezzQ==
X-Gm-Message-State: AOAM530P0+POoXH4eFiPfAmTXfzIYaw/y5NUG2mpm9RM1R5TOMLFBq9z
        KKaSzN3Z8tpxl+5QLy4Kq9c=
X-Google-Smtp-Source: ABdhPJxSKr2YClDepson7RhwPnHxyucn5L/1WFsn0yXPLcWK4Kl9iimri8uJg07BJd2tASyDPHK2Sg==
X-Received: by 2002:a17:90a:2c47:: with SMTP id p7mr374224pjm.48.1606157828865;
        Mon, 23 Nov 2020 10:57:08 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id w15sm11043098pgi.20.2020.11.23.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:57:08 -0800 (PST)
From:   rentao.bupt@gmail.com
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, taoren@fb.com, mikechoi@fb.com
Cc:     Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v5 1/2] hwmon: (max127) Add Maxim MAX127 hardware monitoring driver
Date:   Mon, 23 Nov 2020 10:56:57 -0800
Message-Id: <20201123185658.7632-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123185658.7632-1-rentao.bupt@gmail.com>
References: <20201123185658.7632-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tao Ren <rentao.bupt@gmail.com>

Add hardware monitoring driver for the Maxim MAX127 chip.

MAX127 min/max range handling code is inspired by the max197 driver.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v5:
   - fix i2c_transfer() error handling.
 Changes in v4:
   - delete unnecessary "#include" lines.
   - simplify i2c_transfer() error handling.
   - add mutex to protect ctrl_byte in write_min|max() functions.
 Changes in v3:
   - no code change. xdp maintainers were removed from to/cc list.
 Changes in v2:
   - replace devm_hwmon_device_register_with_groups() with
     devm_hwmon_device_register_with_info() API.
   - divide min/max read and write methods to separate functions.
   - fix raw-to-vin conversion logic.
   - refine ctrl_byte handling so mutex is not needed to protect the
     byte.
   - improve i2c_transfer() error handling.
   - a few other improvements (comments, variable naming, and etc.).

 drivers/hwmon/Kconfig  |   9 ++
 drivers/hwmon/Makefile |   1 +
 drivers/hwmon/max127.c | 352 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 362 insertions(+)
 create mode 100644 drivers/hwmon/max127.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 9d600e0c5584..716df51edc87 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -950,6 +950,15 @@ config SENSORS_MAX1111
 	  This driver can also be built as a module. If so, the module
 	  will be called max1111.
 
+config SENSORS_MAX127
+	tristate "Maxim MAX127 12-bit 8-channel Data Acquisition System"
+	depends on I2C
+	help
+	  Say y here to support Maxim's MAX127 DAS chips.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called max127.
+
 config SENSORS_MAX16065
 	tristate "Maxim MAX16065 System Manager and compatibles"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 1083bbfac779..01ca5d3fbad4 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
 obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
 obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
+obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
 obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
 obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
 obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
new file mode 100644
index 000000000000..402ffdc2f425
--- /dev/null
+++ b/drivers/hwmon/max127.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for MAX127.
+ *
+ * Copyright (c) 2020 Facebook Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+/*
+ * MAX127 Control Byte. Refer to MAX127 datasheet, Table 1 "Control-Byte
+ * Format" for details.
+ */
+#define MAX127_CTRL_START	BIT(7)
+#define MAX127_CTRL_SEL_SHIFT	4
+#define MAX127_CTRL_RNG		BIT(3)
+#define MAX127_CTRL_BIP		BIT(2)
+#define MAX127_CTRL_PD1		BIT(1)
+#define MAX127_CTRL_PD0		BIT(0)
+
+#define MAX127_NUM_CHANNELS	8
+#define MAX127_SET_CHANNEL(ch)	(((ch) & 7) << MAX127_CTRL_SEL_SHIFT)
+
+/*
+ * MAX127 channel input ranges. Refer to MAX127 datasheet, Table 3 "Range
+ * and Polarity Selection" for details.
+ */
+#define MAX127_FULL_RANGE	10000	/* 10V */
+#define MAX127_HALF_RANGE	5000	/* 5V */
+
+/*
+ * MAX127 returns 2 bytes at read:
+ *   - the first byte contains data[11:4].
+ *   - the second byte contains data[3:0] (MSB) and 4 dummy 0s (LSB).
+ * Refer to MAX127 datasheet, "Read a Conversion (Read Cycle)" section
+ * for details.
+ */
+#define MAX127_DATA_LEN		2
+#define MAX127_DATA_SHIFT	4
+
+#define MAX127_SIGN_BIT		BIT(11)
+
+struct max127_data {
+	struct mutex lock;
+	struct i2c_client *client;
+	u8 ctrl_byte[MAX127_NUM_CHANNELS];
+};
+
+static int max127_select_channel(struct i2c_client *client, u8 ctrl_byte)
+{
+	int status;
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = 0,
+		.len = sizeof(ctrl_byte),
+		.buf = &ctrl_byte,
+	};
+
+	status = i2c_transfer(client->adapter, &msg, 1);
+	if (status < 0)
+		return status;
+	if (status != 1)
+		return -EIO;
+
+	return 0;
+}
+
+static int max127_read_channel(struct i2c_client *client, long *val)
+{
+	int status;
+	u8 i2c_data[MAX127_DATA_LEN];
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = I2C_M_RD,
+		.len = sizeof(i2c_data),
+		.buf = i2c_data,
+	};
+
+	status = i2c_transfer(client->adapter, &msg, 1);
+	if (status < 0)
+		return status;
+	if (status != 1)
+		return -EIO;
+
+	*val = (i2c_data[1] >> MAX127_DATA_SHIFT) |
+		((u16)i2c_data[0] << MAX127_DATA_SHIFT);
+	return 0;
+}
+
+static long max127_process_raw(u8 ctrl_byte, long raw)
+{
+	long scale, weight;
+
+	/*
+	 * MAX127's data coding is binary in unipolar mode with 1 LSB =
+	 * (Full-Scale/4096) and two’s complement binary in bipolar mode
+	 * with 1 LSB = [(2 x |FS|)/4096].
+	 * Refer to MAX127 datasheet, "Transfer Function" section for
+	 * details.
+	 */
+	scale = (ctrl_byte & MAX127_CTRL_RNG) ? MAX127_FULL_RANGE :
+						MAX127_HALF_RANGE;
+	if (ctrl_byte & MAX127_CTRL_BIP) {
+		weight = (raw & MAX127_SIGN_BIT);
+		raw &= ~MAX127_SIGN_BIT;
+		raw -= weight;
+		raw *= 2;
+	}
+
+	return raw * scale / 4096;
+}
+
+static int max127_read_input(struct max127_data *data, int channel, long *val)
+{
+	long raw;
+	int status;
+	struct i2c_client *client = data->client;
+	u8 ctrl_byte = data->ctrl_byte[channel];
+
+	mutex_lock(&data->lock);
+
+	status = max127_select_channel(client, ctrl_byte);
+	if (status)
+		goto exit;
+
+	status = max127_read_channel(client, &raw);
+	if (status)
+		goto exit;
+
+	*val = max127_process_raw(ctrl_byte, raw);
+
+exit:
+	mutex_unlock(&data->lock);
+	return status;
+}
+
+static int max127_read_min(struct max127_data *data, int channel, long *val)
+{
+	u8 rng_bip = (data->ctrl_byte[channel] >> 2) & 3;
+	static const int min_input_map[4] = {
+		0,			/* RNG=0, BIP=0 */
+		-MAX127_HALF_RANGE,	/* RNG=0, BIP=1 */
+		0,			/* RNG=1, BIP=0 */
+		-MAX127_FULL_RANGE,	/* RNG=1, BIP=1 */
+	};
+
+	*val = min_input_map[rng_bip];
+	return 0;
+}
+
+static int max127_read_max(struct max127_data *data, int channel, long *val)
+{
+	u8 rng_bip = (data->ctrl_byte[channel] >> 2) & 3;
+	static const int max_input_map[4] = {
+		MAX127_HALF_RANGE,	/* RNG=0, BIP=0 */
+		MAX127_HALF_RANGE,	/* RNG=0, BIP=1 */
+		MAX127_FULL_RANGE,	/* RNG=1, BIP=0 */
+		MAX127_FULL_RANGE,	/* RNG=1, BIP=1 */
+	};
+
+	*val = max_input_map[rng_bip];
+	return 0;
+}
+
+static int max127_write_min(struct max127_data *data, int channel, long val)
+{
+	u8 ctrl;
+
+	mutex_lock(&data->lock);
+
+	ctrl = data->ctrl_byte[channel];
+	if (val <= -MAX127_FULL_RANGE) {
+		ctrl |= (MAX127_CTRL_RNG | MAX127_CTRL_BIP);
+	} else if (val < 0) {
+		ctrl |= MAX127_CTRL_BIP;
+		ctrl &= ~MAX127_CTRL_RNG;
+	} else {
+		ctrl &= ~MAX127_CTRL_BIP;
+	}
+	data->ctrl_byte[channel] = ctrl;
+
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static int max127_write_max(struct max127_data *data, int channel, long val)
+{
+	mutex_lock(&data->lock);
+
+	if (val >= MAX127_FULL_RANGE)
+		data->ctrl_byte[channel] |= MAX127_CTRL_RNG;
+	else
+		data->ctrl_byte[channel] &= ~MAX127_CTRL_RNG;
+
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static umode_t max127_is_visible(const void *_data,
+				 enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	if (type == hwmon_in) {
+		switch (attr) {
+		case hwmon_in_input:
+			return 0444;
+
+		case hwmon_in_min:
+		case hwmon_in_max:
+			return 0644;
+
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int max127_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	int status;
+	struct max127_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_in)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_in_input:
+		status = max127_read_input(data, channel, val);
+		break;
+
+	case hwmon_in_min:
+		status = max127_read_min(data, channel, val);
+		break;
+
+	case hwmon_in_max:
+		status = max127_read_max(data, channel, val);
+		break;
+
+	default:
+		status = -EOPNOTSUPP;
+		break;
+	}
+
+	return status;
+}
+
+static int max127_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	int status;
+	struct max127_data *data = dev_get_drvdata(dev);
+
+	if (type != hwmon_in)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_in_min:
+		status = max127_write_min(data, channel, val);
+		break;
+
+	case hwmon_in_max:
+		status = max127_write_max(data, channel, val);
+		break;
+
+	default:
+		status = -EOPNOTSUPP;
+		break;
+	}
+
+	return status;
+}
+
+static const struct hwmon_ops max127_hwmon_ops = {
+	.is_visible = max127_is_visible,
+	.read = max127_read,
+	.write = max127_write,
+};
+
+static const struct hwmon_channel_info *max127_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
+	NULL,
+};
+
+static const struct hwmon_chip_info max127_chip_info = {
+	.ops = &max127_hwmon_ops,
+	.info = max127_info,
+};
+
+static int max127_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	int i;
+	struct device *hwmon_dev;
+	struct max127_data *data;
+	struct device *dev = &client->dev;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	mutex_init(&data->lock);
+	for (i = 0; i < ARRAY_SIZE(data->ctrl_byte); i++)
+		data->ctrl_byte[i] = (MAX127_CTRL_START |
+				      MAX127_SET_CHANNEL(i));
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &max127_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id max127_id[] = {
+	{ "max127", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max127_id);
+
+static struct i2c_driver max127_driver = {
+	.class		= I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "max127",
+	},
+	.probe		= max127_probe,
+	.id_table	= max127_id,
+};
+
+module_i2c_driver(max127_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mike Choi <mikechoi@fb.com>");
+MODULE_AUTHOR("Tao Ren <rentao.bupt@gmail.com>");
+MODULE_DESCRIPTION("MAX127 Hardware Monitoring driver");
-- 
2.17.1

