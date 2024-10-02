Return-Path: <linux-doc+bounces-26231-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD5F98CE81
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 10:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EF7EB215CC
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 08:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D16D194AD7;
	Wed,  2 Oct 2024 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS0qDiij"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D119414E;
	Wed,  2 Oct 2024 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856737; cv=none; b=ZlfIzYXizYI5FMNPhI3UGJrygQ9jayV8hkShdSixEOWHOlLK9MAGIiFRXmA4R018UpJZAU7Mjhn22al7TaeWk9l58hOWOQ46iqkBvzA7yM5hq/mSF2xB3n3U0yC5bVr2eV+BwERV8xxscUF0DO/Cy1xuLwaWEOsFOXwqdN9lq8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856737; c=relaxed/simple;
	bh=/1hNDbNc9K2NWdOzZPGpenMr4g+vI8BvZYEXbyPGh5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVR2jKHDAQj0dqbHzL+d0SxkmJ+cVEnEUjYkMMWTEJiFuLbRToc3/Y+QUF4F+60eeYGt9lt3H+HAlBcXq6IRKNirCSU7PvGMUxCN5n93vbyvb93bEXKbx6Y8jW4ryeJVVWWsm58bA3Gy01tMqHm4n+P4bYIxRhtbi+R69UxdRv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS0qDiij; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-71b8d10e9b3so3828671b3a.3;
        Wed, 02 Oct 2024 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727856735; x=1728461535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+ghNwKHdpdd7ALswgIDD4+fjaxC+eA6803VFX+pKoY=;
        b=GS0qDiijJuZrbyK4S95RRy+9fNOE2M972eYsJWGLCD0gFWFC1SyA/4x+LKiAwZRLyB
         k1f4xiKBKgx4nUcH0p2WwlJ/9MfXeuvA7orJy2rLFTTu6Sas91di8hPxiEuc1kIyFcIc
         DRU91jT52nQnSWNtuIOMaXBFQXhRMSNDHZ6aMtACOFJ748nI1Amv+IDkYywXjm1VCQBx
         YEmr+ayEkQC8/YvQEMJ6Tx3MGIDMVoxppncLo5yrPfYwFpo7JE3YcBtFVWQCKj1K9nwk
         VfxpHiXimx5o3ckN+epRdbmwhS3j2LeCouuHO7Eqr3PSALkBtntpsPuTMb/rV9A+loxU
         eRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727856735; x=1728461535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+ghNwKHdpdd7ALswgIDD4+fjaxC+eA6803VFX+pKoY=;
        b=YHEvXmrroZAWyr4mJ+MKvJEwh+0M7DmwTY/MLwgzWCVydZkixbIuMjNrBDuaBKX5IY
         uCslR/X/MNsUuyFgLtu1QKgNep9dzQGA3dafJ77lOtwrfVLGDze2x4pQoJyjWFDXvL9x
         CZQHhT6kEpfDRozXm6AQpzkO2B+zKufLbwNxuzp5HRfajNS1HcFlAMIWpAbAorr9BsHd
         TJOTN4K7hZ/j/tdBltkk9WdAMhtGKbWQ5iZ0zwb3/k4pKqG+4thfEJyO3Mq3vvRwFAyr
         W7rrLSQv+q0EUF9O3sulAV9A18GT0HhUTcFQWjk6BL5DZxhFWOkS4b6NeXHcrl3e0Vdv
         yMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUERxCc7dhBBJe1VobY+hqXb0CflOZxPXWy881NidnMMFr0nxuuC16URyLpv48QL3mHhsL/7Z9bru3m@vger.kernel.org, AJvYcCUhyS1SHM/51EMLIdyZrTlzXaZA+O8GzEMWtDb4SLZsAsRoxgGaqN7wHGl5puTqn8/2uYigevzG/qO9@vger.kernel.org, AJvYcCUqwp/6jzul0G+I8JKxPW0IK5KPViwRb6M/QFSAbRXkqnfT5hkDBr747pD+A5jLeOFJooQCAll9RkzRDfluQ9BBoFA=@vger.kernel.org, AJvYcCUyVd6fgJI+biTwHygjJ1DMhk/Ph0G459g7GO1YdA08CQBdO+VL7tpYXDTinwSBiHqqRKl7n5lf1Sia9B9N@vger.kernel.org, AJvYcCXqvySolxThved8/CgzTH5aVmbqKAoPeIHu50iE7p59xHyXFaj+ONAROBFLipzPztyt7yc3ZJBhdsvF5qo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7uLDf79EY2m2sLcDZvQRreEC7JLtIVcyHNxFUJ+HUVpMJNR89
	Ct5brIX9cAl9F2mxxYOlmtq3RvXCH/KV5zxie/JXpPiA9MLUx5F5
X-Google-Smtp-Source: AGHT+IE1NPCZCQDU+jVP0LvoB7qjCTR91VTqRypqmIABVgJdbDCG8jqGyuwITsYqcMVyDngqGN3QhA==
X-Received: by 2002:a05:6a00:21c2:b0:717:9120:35f with SMTP id d2e1a72fcca58-71dc5d6ebf1mr3760425b3a.27.1727856734953;
        Wed, 02 Oct 2024 01:12:14 -0700 (PDT)
Received: from Ubuntu22.. ([219.91.95.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652b4f6sm9618115b3a.174.2024.10.02.01.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:12:14 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 2/2] hwmon: (isl28022) new driver for ISL28022 power monitor
Date: Wed,  2 Oct 2024 16:11:30 +0800
Message-Id: <20241002081133.13123-3-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002081133.13123-1-yikai.tsai.wiwynn@gmail.com>
References: <20241002081133.13123-1-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Driver for Renesas ISL28022 power monitor with I2C interface.
The device monitors voltage, current via shunt resistor
and calculated power.

Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/isl28022.rst |  63 ++++
 MAINTAINERS                      |   2 +
 drivers/hwmon/Kconfig            |  11 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/isl28022.c         | 536 +++++++++++++++++++++++++++++++
 6 files changed, 614 insertions(+)
 create mode 100644 Documentation/hwmon/isl28022.rst
 create mode 100644 drivers/hwmon/isl28022.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index ea3b5be8fe4f..4d15664bc41e 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -96,6 +96,7 @@ Hardware Monitoring Kernel Drivers
    ir35221
    ir38064
    ir36021
+   isl28022
    isl68137
    it87
    jc42
diff --git a/Documentation/hwmon/isl28022.rst b/Documentation/hwmon/isl28022.rst
new file mode 100644
index 000000000000..8d4422a2dacd
--- /dev/null
+++ b/Documentation/hwmon/isl28022.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver isl28022
+======================
+
+Supported chips:
+
+  * Renesas ISL28022
+
+    Prefix: 'isl28022'
+
+    Addresses scanned: none
+
+    Datasheet: Publicly available at the Renesas website
+
+	       https://www.renesas.com/us/en/www/doc/datasheet/isl28022.pdf
+
+Author:
+    Carsten Spieß <mail@carsten-spiess.de>
+
+Description
+-----------
+
+The ISL28022 is a power monitor with I2C interface. The device monitors
+voltage, current via shunt resistor and calculated power.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+device explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+The shunt value in micro-ohms, shunt voltage range and averaging can be set
+with device properties.
+Please refer to the Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
+for bindings if the device tree is used.
+
+The driver supports only shunt and bus continuous ADC mode at 15bit resolution.
+Averaging can be set from 1 to 128 samples (power of 2) on both channels.
+Shunt voltage range of 40, 80, 160 or 320mV is allowed
+The bus voltage range is 60V fixed.
+
+Sysfs entries
+-------------
+
+The following attributes are supported. All attributes are read-only.
+
+======================= =======================================================
+in0_input		bus voltage (milli Volt)
+
+curr1_input		current (milli Ampere)
+power1_input		power (micro Watt)
+======================= =======================================================
+
+Debugfs entries
+---------------
+
+The following attributes are supported. All attributes are read-only.
+
+======================= =======================================================
+shunt_voltage		shunt voltage (micro Volt)
+======================= =======================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 950456f4d393..867cdda2f834 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12123,6 +12123,8 @@ M:	Carsten Spieß <mail@carsten-spiess.de>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
+F:	Documentation/hwmon/isl28022.rst
+F:	drivers/hwmon/isl28022.c
 
 ISOFS FILESYSTEM
 M:	Jan Kara <jack@suse.cz>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 65ea92529406..ad0f8c0a9535 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -853,6 +853,17 @@ config SENSORS_CORETEMP
 	  sensor inside your CPU. Most of the family 6 CPUs
 	  are supported. Check Documentation/hwmon/coretemp.rst for details.
 
+config SENSORS_ISL28022
+	tristate "Renesas ISL28022"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for ISL28022 power monitor.
+	  Check Documentation/hwmon/isl28022.rst for details.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called isl28022.
+
 config SENSORS_IT87
 	tristate "ITE IT87xx and compatibles"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 9554d2fdcf7b..4ea6f7c95315 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_SENSORS_INA2XX)	+= ina2xx.o
 obj-$(CONFIG_SENSORS_INA238)	+= ina238.o
 obj-$(CONFIG_SENSORS_INA3221)	+= ina3221.o
 obj-$(CONFIG_SENSORS_INTEL_M10_BMC_HWMON) += intel-m10-bmc-hwmon.o
+obj-$(CONFIG_SENSORS_ISL28022)	+= isl28022.o
 obj-$(CONFIG_SENSORS_IT87)	+= it87.o
 obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
 obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
new file mode 100644
index 000000000000..31bbbd0242e3
--- /dev/null
+++ b/drivers/hwmon/isl28022.c
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * isl28022.c - driver for Renesas ISL28022 power monitor chip monitoring
+ *
+ * Copyright (c) 2023 Carsten Spieß <mail@carsten-spiess.de>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+/* ISL28022 registers */
+#define ISL28022_REG_CONFIG	0x00
+#define ISL28022_REG_SHUNT	0x01
+#define ISL28022_REG_BUS	0x02
+#define ISL28022_REG_POWER	0x03
+#define ISL28022_REG_CURRENT	0x04
+#define ISL28022_REG_CALIB	0x05
+#define ISL28022_REG_SHUNT_THR	0x06
+#define ISL28022_REG_BUS_THR	0x07
+#define ISL28022_REG_INT	0x08
+#define ISL28022_REG_AUX	0x09
+#define ISL28022_REG_MAX	ISL28022_REG_AUX
+
+/* ISL28022 config flags */
+/* mode flags */
+#define ISL28022_MODE_SHIFT	0
+#define ISL28022_MODE_MASK	0x0007
+
+#define ISL28022_MODE_PWR_DOWN	0x0
+#define ISL28022_MODE_TRG_S	0x1
+#define ISL28022_MODE_TRG_B	0x2
+#define ISL28022_MODE_TRG_SB	0x3
+#define ISL28022_MODE_ADC_OFF	0x4
+#define ISL28022_MODE_CONT_S	0x5
+#define ISL28022_MODE_CONT_B	0x6
+#define ISL28022_MODE_CONT_SB	0x7
+
+/* shunt ADC settings */
+#define ISL28022_SADC_SHIFT	3
+#define ISL28022_SADC_MASK	0x0078
+
+#define ISL28022_BADC_SHIFT	7
+#define ISL28022_BADC_MASK	0x0780
+
+#define ISL28022_ADC_12		0x0	/* 12 bit ADC */
+#define ISL28022_ADC_13		0x1	/* 13 bit ADC */
+#define ISL28022_ADC_14		0x2	/* 14 bit ADC */
+#define ISL28022_ADC_15		0x3	/* 15 bit ADC */
+#define ISL28022_ADC_15_1	0x8	/* 15 bit ADC, 1 sample */
+#define ISL28022_ADC_15_2	0x9	/* 15 bit ADC, 2 samples */
+#define ISL28022_ADC_15_4	0xA	/* 15 bit ADC, 4 samples */
+#define ISL28022_ADC_15_8	0xB	/* 15 bit ADC, 8 samples */
+#define ISL28022_ADC_15_16	0xC	/* 15 bit ADC, 16 samples */
+#define ISL28022_ADC_15_32	0xD	/* 15 bit ADC, 32 samples */
+#define ISL28022_ADC_15_64	0xE	/* 15 bit ADC, 64 samples */
+#define ISL28022_ADC_15_128	0xF	/* 15 bit ADC, 128 samples */
+
+/* shunt voltage range */
+#define ISL28022_PG_SHIFT	11
+#define ISL28022_PG_MASK	0x1800
+
+#define ISL28022_PG_40		0x0	/* +/-40 mV */
+#define ISL28022_PG_80		0x1	/* +/-80 mV */
+#define ISL28022_PG_160		0x2	/* +/-160 mV */
+#define ISL28022_PG_320		0x3	/* +/-3200 mV */
+
+/* bus voltage range */
+#define ISL28022_BRNG_SHIFT	13
+#define ISL28022_BRNG_MASK	0x6000
+
+#define ISL28022_BRNG_16	0x0	/* 16 V */
+#define ISL28022_BRNG_32	0x1	/* 32 V */
+#define ISL28022_BRNG_60	0x3	/* 60 V */
+
+/* reset */
+#define ISL28022_RESET		0x8000
+
+struct isl28022_data {
+	struct regmap		*regmap;
+	u32			shunt;
+	u32			gain;
+	u32			average;
+};
+
+static int isl28022_read_in(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct isl28022_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+	u16 sign_bit;
+
+	switch (channel) {
+	case 0:
+		switch (attr) {
+		case hwmon_in_input:
+			err = regmap_read(data->regmap,
+					  ISL28022_REG_BUS, &regval);
+			if (err < 0)
+				return err;
+			/* driver supports only 60V mode (BRNG 11) */
+			*val = (long)(((u16)regval) & 0xFFFC);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case 1:
+		switch (attr) {
+		case hwmon_in_input:
+			err = regmap_read(data->regmap,
+					  ISL28022_REG_SHUNT, &regval);
+			if (err < 0)
+				return err;
+			switch (data->gain) {
+			case 8:
+				sign_bit = (regval >> 15) & 0x01;
+				*val = (long)((((u16)regval) & 0x7FFF) -
+					(sign_bit * 32768)) / 100;
+				break;
+			case 4:
+				sign_bit = (regval >> 14) & 0x01;
+				*val = (long)((((u16)regval) & 0x3FFF) -
+					(sign_bit * 16384)) / 100;
+				break;
+			case 2:
+				sign_bit = (regval >> 13) & 0x01;
+				*val = (long)((((u16)regval) & 0x1FFF) -
+					(sign_bit * 8192)) / 100;
+				break;
+			case 1:
+				sign_bit = (regval >> 12) & 0x01;
+				*val = (long)((((u16)regval) & 0x0FFF) -
+					(sign_bit * 4096)) / 100;
+				break;
+			}
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int isl28022_read_current(struct device *dev, u32 attr, long *val)
+{
+	struct isl28022_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	switch (attr) {
+	case hwmon_curr_input:
+		err = regmap_read(data->regmap,
+				  ISL28022_REG_CURRENT, &regval);
+		if (err < 0)
+			return err;
+		*val = ((long)regval * 1250L * (long)data->gain) /
+			(long)data->shunt;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int isl28022_read_power(struct device *dev, u32 attr, long *val)
+{
+	struct isl28022_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+	int err;
+
+	switch (attr) {
+	case hwmon_power_input:
+		err = regmap_read(data->regmap,
+				  ISL28022_REG_POWER, &regval);
+		if (err < 0)
+			return err;
+		*val = ((51200000L * ((long)data->gain)) /
+			(long)data->shunt) * (long)regval;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_in:
+		return isl28022_read_in(dev, attr, channel, val);
+	case hwmon_curr:
+		return isl28022_read_current(dev, attr, val);
+	case hwmon_power:
+		return isl28022_read_power(dev, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static umode_t isl28022_is_visible(const void *data, enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			return 0444;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *isl28022_info[] = {
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT,	/* channel 0: bus voltage (mV) */
+			   HWMON_I_INPUT),	/* channel 1: shunt voltage (mV) */
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT),	/* channel 1: current (mA) */
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT),	/* channel 1: power (µW) */
+	NULL
+};
+
+static const struct hwmon_ops isl28022_hwmon_ops = {
+	.is_visible = isl28022_is_visible,
+	.read = isl28022_read,
+};
+
+static const struct hwmon_chip_info isl28022_chip_info = {
+	.ops = &isl28022_hwmon_ops,
+	.info = isl28022_info,
+};
+
+static bool isl28022_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ISL28022_REG_CONFIG:
+	case ISL28022_REG_CALIB:
+	case ISL28022_REG_SHUNT_THR:
+	case ISL28022_REG_BUS_THR:
+	case ISL28022_REG_INT:
+	case ISL28022_REG_AUX:
+		return true;
+	}
+
+	return false;
+}
+
+static bool isl28022_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ISL28022_REG_CONFIG:
+	case ISL28022_REG_SHUNT:
+	case ISL28022_REG_BUS:
+	case ISL28022_REG_POWER:
+	case ISL28022_REG_CURRENT:
+	case ISL28022_REG_INT:
+	case ISL28022_REG_AUX:
+		return true;
+	}
+	return true;
+}
+
+static const struct regmap_config isl28022_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = ISL28022_REG_MAX,
+	.writeable_reg = isl28022_is_writeable_reg,
+	.volatile_reg = isl28022_is_volatile_reg,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int shunt_voltage_show(struct seq_file *seqf, void *unused)
+{
+	struct isl28022_data *data = seqf->private;
+	unsigned int regval;
+	int err;
+
+	err = regmap_read(data->regmap,
+			  ISL28022_REG_SHUNT, &regval);
+	if (err)
+		return err;
+
+	/* print shunt voltage in micro volt  */
+	seq_printf(seqf, "%d\n", regval * 10);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(shunt_voltage);
+
+static struct dentry *isl28022_debugfs_root;
+
+static void isl28022_debugfs_remove(void *res)
+{
+	debugfs_remove_recursive(res);
+}
+
+static void isl28022_debugfs_init(struct i2c_client *client, struct isl28022_data *data)
+{
+	char name[16];
+	struct dentry *debugfs;
+
+	scnprintf(name, sizeof(name), "%d-%04hx", client->adapter->nr, client->addr);
+
+	debugfs = debugfs_create_dir(name, isl28022_debugfs_root);
+	debugfs_create_file("shunt_voltage", 0444, debugfs, data, &shunt_voltage_fops);
+
+	devm_add_action_or_reset(&client->dev, isl28022_debugfs_remove, debugfs);
+}
+
+/*
+ * read property values and make consistency checks.
+ *
+ * following values for shunt range and resistor are allowed:
+ *   40 mV -> gain 1, shunt min.  800 micro ohms
+ *   80 mV -> gain 2, shunt min. 1600 micro ohms
+ *  160 mV -> gain 4, shunt min. 3200 micro ohms
+ *  320 mV -> gain 8, shunt min. 6400 micro ohms
+ */
+static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
+{
+	u32 val;
+	int err;
+
+	err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
+	if (err == -EINVAL)
+		val = 10000;
+	else if (err < 0)
+		return err;
+	data->shunt = val;
+
+	err = device_property_read_u32(dev, "renesas,shunt-range-microvolt", &val);
+	if (err == -EINVAL)
+		val = 320000;
+	else if (err < 0)
+		return err;
+
+	switch (val) {
+	case 40000:
+		data->gain = 1;
+		if (data->shunt < 800)
+			goto shunt_invalid;
+		break;
+	case 80000:
+		data->gain = 2;
+		if (data->shunt < 1600)
+			goto shunt_invalid;
+		break;
+	case 160000:
+		data->gain = 4;
+		if (data->shunt < 3200)
+			goto shunt_invalid;
+		break;
+	case 320000:
+		data->gain = 8;
+		if (data->shunt < 6400)
+			goto shunt_invalid;
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+							 "renesas,shunt-range-microvolt invalid value %d\n",
+							 val);
+	}
+
+	err = device_property_read_u32(dev, "renesas,average-samples", &val);
+	if (err == -EINVAL)
+		val = 1;
+	else if (err < 0)
+		return err;
+	if (val > 128 || hweight32(val) != 1)
+		return dev_err_probe(dev, -EINVAL,
+							 "renesas,average-samples invalid value %d\n",
+							 val);
+
+	data->average = val;
+
+	return 0;
+
+shunt_invalid:
+	return dev_err_probe(dev, -EINVAL,
+						 "renesas,shunt-resistor-microvolt invalid value %d\n",
+						 data->shunt);
+}
+
+/*
+ * write configuration and calibration registers
+ *
+ * The driver supports only shunt and bus continuous ADC mode at 15bit resolution
+ * with averaging from 1 to 128 samples (pow of 2) on both channels.
+ * Shunt voltage gain 1,2,4 or 8 is allowed.
+ * The bus voltage range is 60V fixed.
+ */
+static int isl28022_config(struct isl28022_data *data)
+{
+	int err;
+	u16 config;
+	u16 calib;
+
+	config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
+			(ISL28022_BRNG_60 << ISL28022_BRNG_SHIFT) |
+			(__ffs(data->gain) << ISL28022_PG_SHIFT) |
+			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_SADC_SHIFT) |
+			((ISL28022_ADC_15_1 + __ffs(data->average)) << ISL28022_BADC_SHIFT);
+
+	calib = data->shunt ? 0x8000 / data->gain : 0;
+
+	err = regmap_write(data->regmap, ISL28022_REG_CONFIG, config);
+	if (err < 0)
+		return err;
+
+	return regmap_write(data->regmap, ISL28022_REG_CALIB, calib);
+}
+
+static int isl28022_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct isl28022_data *data;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter,
+					 I2C_FUNC_SMBUS_BYTE_DATA |
+					 I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(struct isl28022_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	err = isl28022_read_properties(dev, data);
+	if (err)
+		return err;
+
+	data->regmap = devm_regmap_init_i2c(client, &isl28022_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	err = isl28022_config(data);
+	if (err)
+		return err;
+
+	isl28022_debugfs_init(client, data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data, &isl28022_chip_info, NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
+	return 0;
+}
+
+static const struct i2c_device_id isl28022_ids[] = {
+	{ "isl28022", 0},
+	{ /* LIST END */ }
+};
+MODULE_DEVICE_TABLE(i2c, isl28022_ids);
+
+static const struct of_device_id __maybe_unused isl28022_of_match[] = {
+	{ .compatible = "renesas,isl28022"},
+	{ /* LIST END */ }
+};
+MODULE_DEVICE_TABLE(of, isl28022_of_match);
+
+static struct i2c_driver isl28022_driver = {
+	.class		= I2C_CLASS_HWMON,
+	.driver = {
+		.name	= "isl28022",
+	},
+	.probe	= isl28022_probe,
+	.id_table	= isl28022_ids,
+};
+
+static int __init
+isl28022_init(void)
+{
+	int err;
+
+	isl28022_debugfs_root = debugfs_create_dir("isl28022", NULL);
+	err = i2c_add_driver(&isl28022_driver);
+	if (!err)
+		return 0;
+
+	debugfs_remove_recursive(isl28022_debugfs_root);
+	return err;
+}
+
+static void __exit
+isl28022_exit(void)
+{
+	i2c_del_driver(&isl28022_driver);
+	debugfs_remove_recursive(isl28022_debugfs_root);
+}
+
+module_init(isl28022_init);
+module_exit(isl28022_exit);
+
+MODULE_AUTHOR("Carsten Spieß <mail@carsten-spiess.de>");
+MODULE_DESCRIPTION("ISL28022 driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


