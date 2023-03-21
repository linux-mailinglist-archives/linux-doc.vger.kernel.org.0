Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3B36C281E
	for <lists+linux-doc@lfdr.de>; Tue, 21 Mar 2023 03:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjCUC1B convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-doc@lfdr.de>); Mon, 20 Mar 2023 22:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjCUC1A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Mar 2023 22:27:00 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D505F392BD;
        Mon, 20 Mar 2023 19:26:57 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6429324E0EA;
        Tue, 21 Mar 2023 10:26:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 10:26:51 +0800
Received: from ubuntu.localdomain (183.27.97.64) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 10:26:50 +0800
From:   Hal Feng <hal.feng@starfivetech.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/2] hwmon: (sfctemp) Add StarFive JH71x0 temperature sensor
Date:   Tue, 21 Mar 2023 10:26:44 +0800
Message-ID: <20230321022644.107027-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230321022644.107027-1-hal.feng@starfivetech.com>
References: <20230321022644.107027-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Emil Renner Berthing <kernel@esmil.dk>

Add driver for the StarFive JH71x0 temperature sensor. You
can enable/disable it and read temperature in milli Celcius
through sysfs.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Co-developed-by: Samin Guo <samin.guo@starfivetech.com>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/sfctemp.rst |  33 ++++
 MAINTAINERS                     |   8 +
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/sfctemp.c         | 331 ++++++++++++++++++++++++++++++++
 6 files changed, 384 insertions(+)
 create mode 100644 Documentation/hwmon/sfctemp.rst
 create mode 100644 drivers/hwmon/sfctemp.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f1fe75f596a5..d72bb1df6431 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -184,6 +184,7 @@ Hardware Monitoring Kernel Drivers
    sch5627
    sch5636
    scpi-hwmon
+   sfctemp
    sht15
    sht21
    sht3x
diff --git a/Documentation/hwmon/sfctemp.rst b/Documentation/hwmon/sfctemp.rst
new file mode 100644
index 000000000000..9fbd5bb1f356
--- /dev/null
+++ b/Documentation/hwmon/sfctemp.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver sfctemp
+=====================
+
+Supported chips:
+ - StarFive JH7100
+ - StarFive JH7110
+
+Authors:
+ - Emil Renner Berthing <kernel@esmil.dk>
+
+Description
+-----------
+
+This driver adds support for reading the built-in temperature sensor on the
+JH7100 and JH7110 RISC-V SoCs by StarFive Technology Co. Ltd.
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
index d8ebab595b2a..d958238a82f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18911,6 +18911,14 @@ S:	Supported
 F:	Documentation/networking/devlink/sfc.rst
 F:	drivers/net/ethernet/sfc/
 
+SFCTEMP HWMON DRIVER
+M:	Emil Renner Berthing <kernel@esmil.dk>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
+F:	Documentation/hwmon/sfctemp.rst
+F:	drivers/hwmon/sfctemp.c
+
 SFF/SFP/SFP+ MODULE SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5b3b76477b0e..abb82a73dbaf 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1929,6 +1929,16 @@ config SENSORS_STTS751
 	  This driver can also be built as a module. If so, the module
 	  will be called stts751.
 
+config SENSORS_SFCTEMP
+	tristate "Starfive JH71x0 temperature sensor"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	help
+	  If you say yes here you get support for temperature sensor
+	  on the Starfive JH71x0 SoCs.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called sfctemp.
+
 config SENSORS_SMM665
 	tristate "Summit Microelectronics SMM665"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 88712b5031c8..386f4debe68b 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -181,6 +181,7 @@ obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
+obj-$(CONFIG_SENSORS_SFCTEMP)	+= sfctemp.o
 obj-$(CONFIG_SENSORS_SL28CPLD)	+= sl28cpld-hwmon.o
 obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
 obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
diff --git a/drivers/hwmon/sfctemp.c b/drivers/hwmon/sfctemp.c
new file mode 100644
index 000000000000..d7484e2b8100
--- /dev/null
+++ b/drivers/hwmon/sfctemp.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright (C) 2021 Samin Guo <samin.guo@starfivetech.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
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
+	void __iomem *regs;
+	struct clk *clk_sense;
+	struct clk *clk_bus;
+	struct reset_control *rst_sense;
+	struct reset_control *rst_bus;
+	bool enabled;
+};
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
+static void sfctemp_run(struct sfctemp *sfctemp)
+{
+	writel(SFCTEMP_RSTN | SFCTEMP_RUN, sfctemp->regs);
+	udelay(1);
+}
+
+static void sfctemp_stop(struct sfctemp *sfctemp)
+{
+	writel(SFCTEMP_RSTN, sfctemp->regs);
+}
+
+static int sfctemp_enable(struct sfctemp *sfctemp)
+{
+	int ret = 0;
+
+	mutex_lock(&sfctemp->lock);
+	if (sfctemp->enabled)
+		goto done;
+
+	ret = clk_prepare_enable(sfctemp->clk_bus);
+	if (ret)
+		goto err;
+	ret = reset_control_deassert(sfctemp->rst_bus);
+	if (ret)
+		goto err_disable_bus;
+
+	ret = clk_prepare_enable(sfctemp->clk_sense);
+	if (ret)
+		goto err_assert_bus;
+	ret = reset_control_deassert(sfctemp->rst_sense);
+	if (ret)
+		goto err_disable_sense;
+
+	sfctemp_power_up(sfctemp);
+	sfctemp_run(sfctemp);
+	sfctemp->enabled = true;
+done:
+	mutex_unlock(&sfctemp->lock);
+	return ret;
+
+err_disable_sense:
+	clk_disable_unprepare(sfctemp->clk_sense);
+err_assert_bus:
+	reset_control_assert(sfctemp->rst_bus);
+err_disable_bus:
+	clk_disable_unprepare(sfctemp->clk_bus);
+err:
+	mutex_unlock(&sfctemp->lock);
+	return ret;
+}
+
+static int sfctemp_disable(struct sfctemp *sfctemp)
+{
+	mutex_lock(&sfctemp->lock);
+	if (!sfctemp->enabled)
+		goto done;
+
+	sfctemp_stop(sfctemp);
+	sfctemp_power_down(sfctemp);
+	reset_control_assert(sfctemp->rst_sense);
+	clk_disable_unprepare(sfctemp->clk_sense);
+	reset_control_assert(sfctemp->rst_bus);
+	clk_disable_unprepare(sfctemp->clk_bus);
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
+		default:
+			return 0;
+		}
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
+		default:
+			return -EINVAL;
+		}
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
+			return -EINVAL;
+		default:
+			return -EINVAL;
+		}
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
+	struct sfctemp *sfctemp;
+	int ret;
+
+	sfctemp = devm_kzalloc(dev, sizeof(*sfctemp), GFP_KERNEL);
+	if (!sfctemp)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, sfctemp);
+	mutex_init(&sfctemp->lock);
+
+	sfctemp->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sfctemp->regs))
+		return PTR_ERR(sfctemp->regs);
+
+	sfctemp->clk_sense = devm_clk_get(dev, "sense");
+	if (IS_ERR(sfctemp->clk_sense))
+		return dev_err_probe(dev, PTR_ERR(sfctemp->clk_sense),
+				     "error getting sense clock\n");
+
+	sfctemp->clk_bus = devm_clk_get(dev, "bus");
+	if (IS_ERR(sfctemp->clk_bus))
+		return dev_err_probe(dev, PTR_ERR(sfctemp->clk_bus),
+				     "error getting bus clock\n");
+
+	sfctemp->rst_sense = devm_reset_control_get_exclusive(dev, "sense");
+	if (IS_ERR(sfctemp->rst_sense))
+		return dev_err_probe(dev, PTR_ERR(sfctemp->rst_sense),
+				     "error getting sense reset\n");
+
+	sfctemp->rst_bus = devm_reset_control_get_exclusive(dev, "bus");
+	if (IS_ERR(sfctemp->rst_bus))
+		return dev_err_probe(dev, PTR_ERR(sfctemp->rst_bus),
+				     "error getting busreset\n");
+
+	ret = reset_control_assert(sfctemp->rst_sense);
+	if (ret)
+		return dev_err_probe(dev, ret, "error asserting sense reset\n");
+
+	ret = reset_control_assert(sfctemp->rst_bus);
+	if (ret)
+		return dev_err_probe(dev, ret, "error asserting bus reset\n");
+
+	ret = devm_add_action(dev, sfctemp_disable_action, sfctemp);
+	if (ret)
+		return ret;
+
+	ret = sfctemp_enable(sfctemp);
+	if (ret)
+		return dev_err_probe(dev, ret, "error enabling temperature sensor: %d\n", ret);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sfctemp", sfctemp,
+							 &sfctemp_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id sfctemp_of_match[] = {
+	{ .compatible = "starfive,jh7100-temp" },
+	{ .compatible = "starfive,jh7110-temp" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sfctemp_of_match);
+
+static struct platform_driver sfctemp_driver = {
+	.probe  = sfctemp_probe,
+	.driver = {
+		.name = "sfctemp",
+		.of_match_table = sfctemp_of_match,
+	},
+};
+module_platform_driver(sfctemp_driver);
+
+MODULE_AUTHOR("Emil Renner Berthing");
+MODULE_DESCRIPTION("StarFive JH71x0 temperature sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.38.1

