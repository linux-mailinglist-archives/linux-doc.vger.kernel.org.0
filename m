Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110723D65BB
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jul 2021 19:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238480AbhGZQrf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Jul 2021 12:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240568AbhGZQra (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jul 2021 12:47:30 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B1CC0AF6F2;
        Mon, 26 Jul 2021 10:18:24 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id r16so11554702edt.7;
        Mon, 26 Jul 2021 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=btFaY9MotnIA+O1Fe3R11iJ9ko4NRNdjdsQntfTuxTw=;
        b=fGGnz1epje5El+6C0HSQZ1kQ01p6TbQLKpXnw2mKM/cAra1gigmcRK7CryNFOeyBbP
         QOGbzjzyRddxPNydU1E1qOmHgvDpHpIioD2GV9c+Ichm2nktD2ql5IuVFtbKWWlrC9JL
         v+HUFzA2NiIsVapcSJmozibHJD23b9iZciOFS9CR4ojj2cc4os81qP1tBD3fdxx33Rsx
         dG4R2K6+HTJuc68QeJzFpeyHN+qT3xAbUqK3OV0z43N6HkKc0ewN2phwgmzJXW4plB6V
         4/QOshPM6QSD+o3MrELTUdQrb6ZAevPYLhXjpFmlGLRUd9kVAYeNfUu1u9Lt+98SKaPa
         jlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=btFaY9MotnIA+O1Fe3R11iJ9ko4NRNdjdsQntfTuxTw=;
        b=HzNBKE9eN9h8rOplZFEs5N++KmMPVc7ZZJfbzI/2pw6a4ftyzRMy3aMrax0pIulFRI
         4Lw6ENVnZ58c3ZG6EGc5lEpIRvQA1HDnaMWZWv7nt/jGh+gXGKh4JVS87AGLqYZ7S2dr
         7L7CqoCp5G3E7fZmdik3eKSDIW0QVBZR4Ap94sjEKdZQis7PLPh44XDlk7qlQGm3Sbnm
         qNHDH8UnKUgwwe1LVTxhO1X9LyWLdXOUjR0QTI3Xbi9T7tlcw2cuvBq+BVCESCyD4yAg
         8ovYtNsbdGJikLN6VbN0Q1hJruVrPG1qnadWBhy8LNiWcYfxwFLG3opxzJvOumQIJGb/
         X70Q==
X-Gm-Message-State: AOAM533WF1brFYAPRAshY/BlOoKhmB0tpkwfcnH+mJ5VAEi3xU0w13GF
        zcx2/o0Q8UpP3PGGQC6oHEYlViiJbIMWcduN
X-Google-Smtp-Source: ABdhPJwXFVM68N7iLdJn8RzD53rX8MQ8ZyhTXr7nxmjKIrIPmlNGFl4Eok9CXckxD0PaI0jzF6Bp5A==
X-Received: by 2002:a05:6402:160c:: with SMTP id f12mr2512316edv.122.1627319902719;
        Mon, 26 Jul 2021 10:18:22 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:132c:4c2b:f8ab:5392])
        by smtp.gmail.com with ESMTPSA id e7sm195932edk.3.2021.07.26.10.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 10:18:22 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Samin Guo <samin.guo@starfivetech.com>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] hwmon: (sfctemp) Add StarFive JH7100 temperature sensor
Date:   Mon, 26 Jul 2021 19:18:02 +0200
Message-Id: <20210726171802.1052716-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726171802.1052716-1-kernel@esmil.dk>
References: <20210726171802.1052716-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Register definitions and conversion constants based on sfctemp driver by
Samin in the StarFive 5.10 kernel.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/sfctemp.rst |  32 ++++
 MAINTAINERS                     |   8 +
 drivers/hwmon/Kconfig           |  10 ++
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/sfctemp.c         | 291 ++++++++++++++++++++++++++++++++
 6 files changed, 343 insertions(+)
 create mode 100644 Documentation/hwmon/sfctemp.rst
 create mode 100644 drivers/hwmon/sfctemp.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index bc01601ea81a..961b6d93bead 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -164,6 +164,7 @@ Hardware Monitoring Kernel Drivers
    sch5627
    sch5636
    scpi-hwmon
+   sfctemp
    sht15
    sht21
    sht3x
diff --git a/Documentation/hwmon/sfctemp.rst b/Documentation/hwmon/sfctemp.rst
new file mode 100644
index 000000000000..465edce2fea5
--- /dev/null
+++ b/Documentation/hwmon/sfctemp.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver sfctemp
+=====================
+
+Supported chips:
+ - StarFive JH7100
+
+Authors:
+ - Emil Renner Berthing <kernel@esmil.dk>
+
+Description
+-----------
+
+This driver adds support for reading the built-in temperature sensor on the
+JH7100 RISC-V SoC by StarFive Technology Co. Ltd.
+
+``sysfs`` interface
+-------------------
+
+The temperature sensor can be enabled, disabled and queried via the standard
+hwmon interface in sysfs under ``/sys/class/hwmon/hwmonX`` for some value of
+``X``:
+
+================ ==== =============================================
+Name             Perm Description
+================ ==== =============================================
+temp1_enable     RW   Enable or disable temperature sensor.
+                      Automatically enabled by the driver,
+                      but may be disabled to save power.
+temp1_input      RO   Temperature reading in milli-degrees Celsius.
+================ ==== =============================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 19135a9d778e..6fb1fd015c19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16751,6 +16751,14 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/ethernet/sfc/
 
+SFCTEMP HWMON DRIVER
+M:	Emil Renner Berthing <kernel@esmil.dk>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/starfive,jh7100-temp.yaml
+F:	Documentation/hwmon/sfctemp.rst
+F:	drivers/hwmon/sfctemp.c
+
 SFF/SFP/SFP+ MODULE SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e3675377bc5d..ef3e345d6ce3 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1762,6 +1762,16 @@ config SENSORS_STTS751
 	  This driver can also be built as a module. If so, the module
 	  will be called stts751.
 
+config SENSORS_SFCTEMP
+	tristate "Starfive JH7100 temperature sensor"
+	depends on OF && (RISCV || COMPILE_TEST)
+	help
+	  If you say yes here you get support for temperature sensor
+	  on the Starfive JH7100 SoC.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called sfctemp.
+
 config SENSORS_SMM665
 	tristate "Summit Microelectronics SMM665"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d712c61c1f5e..869f8806561e 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
+obj-$(CONFIG_SENSORS_SFCTEMP)	+= sfctemp.o
 obj-$(CONFIG_SENSORS_SL28CPLD)	+= sl28cpld-hwmon.o
 obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
 obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
diff --git a/drivers/hwmon/sfctemp.c b/drivers/hwmon/sfctemp.c
new file mode 100644
index 000000000000..35d3ca682e50
--- /dev/null
+++ b/drivers/hwmon/sfctemp.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright (C) 2021 Samin Guo <samin.guo@starfivetech.com>
+ */
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+/*
+ * TempSensor reset. The RSTN can be de-asserted once the analog core has
+ * powered up. Trst(min 100ns)
+ * 0:reset  1:de-assert
+ */
+#define SFCTEMP_RSTN	BIT(0)
+
+/*
+ * TempSensor analog core power down. The analog core will be powered up
+ * Tpu(min 50us) after PD is de-asserted. RSTN should be held low until the
+ * analog core is powered up.
+ * 0:power up  1:power down
+ */
+#define SFCTEMP_PD	BIT(1)
+
+/*
+ * TempSensor start conversion enable.
+ * 0:disable  1:enable
+ */
+#define SFCTEMP_RUN	BIT(2)
+
+/*
+ * TempSensor conversion value output.
+ * Temp(C)=DOUT*Y/4094 - K
+ */
+#define SFCTEMP_DOUT_POS	16
+#define SFCTEMP_DOUT_MSK	GENMASK(27, 16)
+
+/* DOUT to Celcius conversion constants */
+#define SFCTEMP_Y1000	237500L
+#define SFCTEMP_Z	4094L
+#define SFCTEMP_K1000	81100L
+
+struct sfctemp {
+	/* serialize access to hardware register and enabled below */
+	struct mutex lock;
+	struct completion conversion_done;
+	void __iomem *regs;
+	bool enabled;
+};
+
+static irqreturn_t sfctemp_isr(int irq, void *data)
+{
+	struct sfctemp *sfctemp = data;
+
+	complete(&sfctemp->conversion_done);
+	return IRQ_HANDLED;
+}
+
+static void sfctemp_power_up(struct sfctemp *sfctemp)
+{
+	/* make sure we're powered down first */
+	writel(SFCTEMP_PD, sfctemp->regs);
+	udelay(1);
+
+	writel(0, sfctemp->regs);
+	/* wait t_pu(50us) + t_rst(100ns) */
+	usleep_range(60, 200);
+
+	/* de-assert reset */
+	writel(SFCTEMP_RSTN, sfctemp->regs);
+	udelay(1); /* wait t_su(500ps) */
+}
+
+static void sfctemp_power_down(struct sfctemp *sfctemp)
+{
+	writel(SFCTEMP_PD, sfctemp->regs);
+}
+
+static void sfctemp_run_single(struct sfctemp *sfctemp)
+{
+	writel(SFCTEMP_RSTN | SFCTEMP_RUN, sfctemp->regs);
+	udelay(1);
+	writel(SFCTEMP_RSTN, sfctemp->regs);
+}
+
+static int sfctemp_enable(struct sfctemp *sfctemp)
+{
+	mutex_lock(&sfctemp->lock);
+	if (sfctemp->enabled)
+		goto done;
+
+	sfctemp_power_up(sfctemp);
+	sfctemp->enabled = true;
+done:
+	mutex_unlock(&sfctemp->lock);
+	return 0;
+}
+
+static int sfctemp_disable(struct sfctemp *sfctemp)
+{
+	mutex_lock(&sfctemp->lock);
+	if (!sfctemp->enabled)
+		goto done;
+
+	sfctemp_power_down(sfctemp);
+	sfctemp->enabled = false;
+done:
+	mutex_unlock(&sfctemp->lock);
+	return 0;
+}
+
+static void sfctemp_disable_action(void *data)
+{
+	sfctemp_disable(data);
+}
+
+static int sfctemp_convert(struct sfctemp *sfctemp, long *val)
+{
+	int ret;
+
+	mutex_lock(&sfctemp->lock);
+	if (!sfctemp->enabled) {
+		ret = -ENODATA;
+		goto out;
+	}
+
+	sfctemp_run_single(sfctemp);
+
+	ret = wait_for_completion_interruptible_timeout(&sfctemp->conversion_done,
+							msecs_to_jiffies(10));
+	if (ret <= 0) {
+		if (ret == 0)
+			ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	/* calculate temperature in milli Celcius */
+	*val = (long)((readl(sfctemp->regs) & SFCTEMP_DOUT_MSK) >> SFCTEMP_DOUT_POS)
+		* SFCTEMP_Y1000 / SFCTEMP_Z - SFCTEMP_K1000;
+
+	ret = 0;
+out:
+	mutex_unlock(&sfctemp->lock);
+	return ret;
+}
+
+static umode_t sfctemp_is_visible(const void *data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_enable:
+			return 0644;
+		case hwmon_temp_input:
+			return 0444;
+		}
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static int sfctemp_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct sfctemp *sfctemp = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_enable:
+			*val = sfctemp->enabled;
+			return 0;
+		case hwmon_temp_input:
+			return sfctemp_convert(sfctemp, val);
+		}
+		return -EINVAL;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int sfctemp_write(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long val)
+{
+	struct sfctemp *sfctemp = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_enable:
+			if (val == 0)
+				return sfctemp_disable(sfctemp);
+			if (val == 1)
+				return sfctemp_enable(sfctemp);
+			break;
+		}
+		return -EINVAL;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct hwmon_channel_info *sfctemp_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_ENABLE | HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops sfctemp_hwmon_ops = {
+	.is_visible = sfctemp_is_visible,
+	.read = sfctemp_read,
+	.write = sfctemp_write,
+};
+
+static const struct hwmon_chip_info sfctemp_chip_info = {
+	.ops = &sfctemp_hwmon_ops,
+	.info = sfctemp_info,
+};
+
+static int sfctemp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *hwmon_dev;
+	struct resource *mem;
+	struct sfctemp *sfctemp;
+	int ret;
+
+	sfctemp = devm_kzalloc(dev, sizeof(*sfctemp), GFP_KERNEL);
+	if (!sfctemp)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, sfctemp);
+	mutex_init(&sfctemp->lock);
+	init_completion(&sfctemp->conversion_done);
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	sfctemp->regs = devm_ioremap_resource(dev, mem);
+	if (IS_ERR(sfctemp->regs))
+		return PTR_ERR(sfctemp->regs);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_request_irq(dev, ret, sfctemp_isr,
+			       IRQF_SHARED, pdev->name, sfctemp);
+	if (ret) {
+		dev_err(dev, "request irq failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action(dev, sfctemp_disable_action, sfctemp);
+	if (ret)
+		return ret;
+
+	ret = sfctemp_enable(sfctemp);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, pdev->name, sfctemp,
+							 &sfctemp_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id sfctemp_of_match[] = {
+	{ .compatible = "starfive,jh7100-temp" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, sfctemp_of_match);
+
+static struct platform_driver sfctemp_driver = {
+	.driver = {
+		.name = "sfctemp",
+		.of_match_table = of_match_ptr(sfctemp_of_match),
+	},
+	.probe  = sfctemp_probe,
+};
+module_platform_driver(sfctemp_driver);
+
+MODULE_AUTHOR("Emil Renner Berthing");
+MODULE_DESCRIPTION("StarFive JH7100 temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.32.0

