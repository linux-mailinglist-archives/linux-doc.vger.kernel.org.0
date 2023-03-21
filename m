Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E506C37E9
	for <lists+linux-doc@lfdr.de>; Tue, 21 Mar 2023 18:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjCURLf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Mar 2023 13:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCURLK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 13:11:10 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB826A59
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 10:10:47 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso179401wms.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 10:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679418632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qYUT8eH+GBja6dZkOJxD7CQwhf3OQ3evXxb7a7LNSw=;
        b=Xa0zmkQIPURsQo2FgkoWf077FU4a2vth7yfkAbAtOXMz+oJndYpCM6DzKqlxrNWpV2
         smAjwCh39v9JQD5v5kHdmeFiQfToVX/5YmVzmTY+vTUQ3i5WlHN0E1vCd+bbVgVgBc01
         ei26tR+jDGT82WP4OYVFCjmejL0GdnDAVCGP0LQwH7RC0RVKvOfnLDLORPAHMqzc/fnh
         93S2VYVLd3S/UiGagYgjACygFng8iL4wyYsYP6w3UwJ1B6F7O1P0QPgtExES9w3NMJpL
         H30LeCnHuDZrh5yx+5Zrw3JsHwVJA2lVptor6VVLttbIfQTXf7GXj/Igs6b1xOdXzJdf
         0hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qYUT8eH+GBja6dZkOJxD7CQwhf3OQ3evXxb7a7LNSw=;
        b=ocyZrxEk4VUulfI7blrgVlrWgB6RwmqtZ1IgPjlxMLb1/+9g+V0lY/5z4Ygyk2G6gC
         T3nMTOKuETadx3F0F86wypWEBUESr4th0VBTc1itBeZJoLMYJ3ujBCpw5qUVj257UkPG
         qp58DvI+k2slR7GwqmdO2pJ1H+lVVuQg9tln+J/DrsLngmVsuRFHI8PabKkF6ExyIB1E
         I2qfxH++li5qc4kUw/CyO7p/Y+S/RSvhG+4Rz21t4BzmSzywamagL9RTsLydi5alwDR4
         aSfD/YPAGGJ2qzocCmHLuHzMU3LUqZf6osXG0T+vlyrSa0e5uS3+7wZBpp+4myIdybeZ
         1VUA==
X-Gm-Message-State: AO0yUKUABxiz4FaFqwnGkn/B2/o+TCA7Wl2hEZmWg1XOzKuqsqVXIDzz
        Auv4lvl7baWaSh9l5pIyPxpUBA==
X-Google-Smtp-Source: AK7set+CsTxXxUK1o2M1y8S6MqJVg5uZTnu347GrYFtRbxwpZfMFkleW9sT8kULm2fM0quyujBJuwA==
X-Received: by 2002:a05:600c:254:b0:3ed:253c:621b with SMTP id 20-20020a05600c025400b003ed253c621bmr2968445wmj.21.1679418632523;
        Tue, 21 Mar 2023 10:10:32 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003eddf20ed5bsm8308347wmq.18.2023.03.21.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:10:32 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, arnd@arndb.de,
        gregkh@linuxfoundation.org, derek.kiernan@xilinx.com,
        dragan.cvetic@xilinx.com
Cc:     eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
Subject: [PATCH v3 4/4] misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM
Date:   Tue, 21 Mar 2023 18:10:20 +0100
Message-Id: <20230321171020.74736-5-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230321171020.74736-1-jpanis@baylibre.com>
References: <20230321171020.74736-1-jpanis@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This PFSM controls the operational modes of the PMIC:
- STANDBY and LP_STANDBY,
- ACTIVE state,
- MCU_ONLY state,
- RETENTION state, with or without DDR and/or GPIO retention.
Depending on the current operational mode, some voltage domains
remain energized while others can be off.

This PFSM is also used to trigger a firmware update, and provides
R/W access to device registers.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 drivers/misc/Kconfig                          |  12 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tps6594-pfsm.c                   | 304 ++++++++++++++++++
 include/uapi/linux/tps6594_pfsm.h             |  45 +++
 5 files changed, 363 insertions(+)
 create mode 100644 drivers/misc/tps6594-pfsm.c
 create mode 100644 include/uapi/linux/tps6594_pfsm.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 0a1882e296ae..07ff4d619db4 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -180,6 +180,7 @@ Code  Seq#    Include File                                           Comments
 'P'   00-0F  drivers/usb/class/usblp.c                               conflict!
 'P'   01-09  drivers/misc/pci_endpoint_test.c                        conflict!
 'P'   00-0F  xen/privcmd.h                                           conflict!
+'P'   00-03  linux/tps6594_pfsm.h                                    conflict!
 'Q'   all    linux/soundcard.h
 'R'   00-1F  linux/random.h                                          conflict!
 'R'   01     linux/rfkill.h                                          conflict!
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index c73c02801330..75e427f124b2 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -549,6 +549,18 @@ config TPS6594_ESM
 	  This driver can also be built as a module.  If so, the module
 	  will be called tps6594-esm.
 
+config TPS6594_PFSM
+	tristate "TI TPS6594 Pre-configurable Finite State Machine support"
+	depends on MFD_TPS6594
+	default MFD_TPS6594
+	help
+	  Support PFSM (Pre-configurable Finite State Machine) on TPS6594 PMIC devices.
+	  These devices integrate a finite state machine engine, which manages the state
+	  of the device during operating state transition.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called tps6594-pfsm.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 3dc69ec69912..f2a4d1ff65d4 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -66,3 +66,4 @@ obj-$(CONFIG_VCPU_STALL_DETECTOR)	+= vcpu_stall_detector.o
 obj-$(CONFIG_TMR_MANAGER)      += xilinx_tmr_manager.o
 obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
 obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
+obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
new file mode 100644
index 000000000000..e7b5ccfa1d4b
--- /dev/null
+++ b/drivers/misc/tps6594-pfsm.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PFSM (Pre-configurable Finite State Machine) driver for TI TPS6594/TPS6593/LP8764X PMICs
+ *
+ * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
+ */
+
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/ioctl.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/tps6594.h>
+
+#include <linux/tps6594_pfsm.h>
+
+#define TPS6594_STARTUP_DEST_MCU_ONLY_VAL 2
+#define TPS6594_STARTUP_DEST_ACTIVE_VAL   3
+#define TPS6594_STARTUP_DEST_SHIFT	  5
+#define TPS6594_STARTUP_DEST_MCU_ONLY	  (TPS6594_STARTUP_DEST_MCU_ONLY_VAL \
+					   << TPS6594_STARTUP_DEST_SHIFT)
+#define TPS6594_STARTUP_DEST_ACTIVE	  (TPS6594_STARTUP_DEST_ACTIVE_VAL \
+					   << TPS6594_STARTUP_DEST_SHIFT)
+
+/*
+ * To update the PMIC firmware, the user must be able to access
+ * page 0 (user registers) and page 1 (NVM control and configuration).
+ */
+#define TPS6594_PMIC_MAX_POS 0x200
+
+#define TPS6594_FILE_TO_PFSM(f) container_of((f)->private_data, struct tps6594_pfsm, miscdev)
+
+/**
+ * struct tps6594_pfsm - device private data structure
+ *
+ * @miscdev: misc device infos
+ * @regmap:  regmap for accessing the device registers
+ */
+struct tps6594_pfsm {
+	struct miscdevice miscdev;
+	struct regmap *regmap;
+};
+
+static ssize_t tps6594_pfsm_read(struct file *f, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct tps6594_pfsm *pfsm = TPS6594_FILE_TO_PFSM(f);
+	loff_t pos = *ppos;
+	unsigned int val;
+	int ret;
+	int i;
+
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= TPS6594_PMIC_MAX_POS)
+		return 0;
+	if (count > TPS6594_PMIC_MAX_POS - pos)
+		count = TPS6594_PMIC_MAX_POS - pos;
+
+	for (i = 0 ; i < count ; i++) {
+		ret = regmap_read(pfsm->regmap, pos + i, &val);
+		if (ret)
+			return ret;
+
+		if (put_user(val, buf + i))
+			return -EFAULT;
+	}
+
+	*ppos = pos + count;
+
+	return count;
+}
+
+static ssize_t tps6594_pfsm_write(struct file *f, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct tps6594_pfsm *pfsm = TPS6594_FILE_TO_PFSM(f);
+	loff_t pos = *ppos;
+	char val;
+	int ret;
+	int i;
+
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= TPS6594_PMIC_MAX_POS || !count)
+		return 0;
+	if (count > TPS6594_PMIC_MAX_POS - pos)
+		count = TPS6594_PMIC_MAX_POS - pos;
+
+	for (i = 0 ; i < count ; i++) {
+		if (get_user(val, buf + i))
+			return -EFAULT;
+
+		ret = regmap_write(pfsm->regmap, pos + i, val);
+		if (ret)
+			return ret;
+	}
+
+	*ppos = pos + count;
+
+	return count;
+}
+
+static int tps6594_pfsm_configure_ret_trig(struct regmap *regmap, u8 options)
+{
+	int ret;
+
+	if (options & PMIC_GPIO_RETENTION)
+		ret = regmap_set_bits(regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+				      TPS6594_BIT_TRIGGER_I2C(5) | TPS6594_BIT_TRIGGER_I2C(6));
+	else
+		ret = regmap_clear_bits(regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+					TPS6594_BIT_TRIGGER_I2C(5) | TPS6594_BIT_TRIGGER_I2C(6));
+	if (ret)
+		return ret;
+
+	if (options & PMIC_DDR_RETENTION)
+		ret = regmap_set_bits(regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+				      TPS6594_BIT_TRIGGER_I2C(7));
+	else
+		ret = regmap_clear_bits(regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+					TPS6594_BIT_TRIGGER_I2C(7));
+
+	return ret;
+}
+
+static long tps6594_pfsm_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
+{
+	struct tps6594_pfsm *pfsm = TPS6594_FILE_TO_PFSM(f);
+	struct pmic_state pfsm_state;
+	void __user *argp = (void __user *)arg;
+	int ret = -EINVAL;
+
+	switch (cmd) {
+	case PMIC_GOTO_STANDBY:
+		/* Disable LP mode */
+		ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_RTC_CTRL_2,
+					TPS6594_BIT_LP_STANDBY_SEL);
+		if (ret)
+			return ret;
+
+		/* Force trigger */
+		ret = regmap_write_bits(pfsm->regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+					TPS6594_BIT_TRIGGER_I2C(0), TPS6594_BIT_TRIGGER_I2C(0));
+		break;
+	case PMIC_GOTO_LP_STANDBY:
+		/* Enable LP mode */
+		ret = regmap_set_bits(pfsm->regmap, TPS6594_REG_RTC_CTRL_2,
+				      TPS6594_BIT_LP_STANDBY_SEL);
+		if (ret)
+			return ret;
+
+		/* Force trigger */
+		ret = regmap_write_bits(pfsm->regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+					TPS6594_BIT_TRIGGER_I2C(0), TPS6594_BIT_TRIGGER_I2C(0));
+		break;
+	case PMIC_UPDATE_PGM:
+		/* Force trigger */
+		ret = regmap_write_bits(pfsm->regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+					TPS6594_BIT_TRIGGER_I2C(3), TPS6594_BIT_TRIGGER_I2C(3));
+		break;
+	case PMIC_SET_STATE:
+		if (copy_from_user(&pfsm_state, argp, sizeof(pfsm_state)))
+			return -EFAULT;
+
+		switch (pfsm_state.state) {
+		case PMIC_ACTIVE_STATE:
+			/* Modify NSLEEP1-2 bits */
+			ret = regmap_set_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
+					      TPS6594_BIT_NSLEEP1B | TPS6594_BIT_NSLEEP2B);
+			break;
+		case PMIC_MCU_ONLY_STATE:
+			/* Configure retention triggers */
+			ret = tps6594_pfsm_configure_ret_trig(pfsm->regmap, pfsm_state.options);
+			if (ret)
+				return ret;
+
+			/* Modify NSLEEP1-2 bits */
+			ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
+						TPS6594_BIT_NSLEEP1B);
+			if (ret)
+				return ret;
+
+			ret = regmap_set_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
+					      TPS6594_BIT_NSLEEP2B);
+			break;
+		case PMIC_RETENTION_STATE:
+			/* Configure wake-up destination */
+			if (pfsm_state.options & PMIC_MCU_ONLY_STARTUP_DEST)
+				ret = regmap_write_bits(pfsm->regmap, TPS6594_REG_RTC_CTRL_2,
+							TPS6594_MASK_STARTUP_DEST,
+							TPS6594_STARTUP_DEST_MCU_ONLY);
+			else
+				ret = regmap_write_bits(pfsm->regmap, TPS6594_REG_RTC_CTRL_2,
+							TPS6594_MASK_STARTUP_DEST,
+							TPS6594_STARTUP_DEST_ACTIVE);
+			if (ret)
+				return ret;
+
+			/* Configure retention triggers */
+			ret = tps6594_pfsm_configure_ret_trig(pfsm->regmap, pfsm_state.options);
+			if (ret)
+				return ret;
+
+			/* Modify NSLEEP1-2 bits */
+			ret = regmap_clear_bits(pfsm->regmap, TPS6594_REG_FSM_NSLEEP_TRIGGERS,
+						TPS6594_BIT_NSLEEP2B);
+			break;
+		}
+
+		break;
+	}
+
+	return ret;
+}
+
+static const struct file_operations tps6594_pfsm_fops = {
+	.owner		= THIS_MODULE,
+	.llseek		= generic_file_llseek,
+	.read		= tps6594_pfsm_read,
+	.write		= tps6594_pfsm_write,
+	.unlocked_ioctl	= tps6594_pfsm_ioctl,
+};
+
+static irqreturn_t tps6594_pfsm_isr(int irq, void *dev_id)
+{
+	struct platform_device *pdev = dev_id;
+	int i;
+
+	for (i = 0 ; i < pdev->num_resources ; i++) {
+		if (irq == platform_get_irq_byname(pdev, pdev->resource[i].name)) {
+			dev_err(pdev->dev.parent, "%s event detected\n", pdev->resource[i].name);
+			return IRQ_HANDLED;
+		}
+	}
+
+	return IRQ_NONE;
+}
+
+static int tps6594_pfsm_probe(struct platform_device *pdev)
+{
+	struct tps6594_pfsm *pfsm;
+	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	int irq;
+	int ret;
+	int i;
+
+	pfsm = devm_kzalloc(dev, sizeof(struct tps6594_pfsm), GFP_KERNEL);
+	if (!pfsm)
+		return -ENOMEM;
+
+	pfsm->regmap = tps->regmap;
+
+	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
+	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
+					    tps->chip_id, tps->reg);
+	pfsm->miscdev.fops = &tps6594_pfsm_fops;
+	pfsm->miscdev.parent = dev->parent;
+
+	for (i = 0 ; i < pdev->num_resources ; i++) {
+		irq = platform_get_irq_byname(pdev, pdev->resource[i].name);
+		if (irq < 0)
+			return dev_err_probe(dev, irq, "Failed to get %s irq\n",
+					     pdev->resource[i].name);
+
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+						tps6594_pfsm_isr, IRQF_ONESHOT,
+						pdev->resource[i].name, pdev);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to request irq\n");
+	}
+
+	platform_set_drvdata(pdev, pfsm);
+
+	return misc_register(&pfsm->miscdev);
+}
+
+static int tps6594_pfsm_remove(struct platform_device *pdev)
+{
+	struct tps6594_pfsm *pfsm = platform_get_drvdata(pdev);
+
+	misc_deregister(&pfsm->miscdev);
+
+	return 0;
+}
+
+static struct platform_driver tps6594_pfsm_driver = {
+	.driver	= {
+		.name = "tps6594-pfsm",
+	},
+	.probe = tps6594_pfsm_probe,
+	.remove = tps6594_pfsm_remove,
+};
+
+module_platform_driver(tps6594_pfsm_driver);
+
+MODULE_ALIAS("platform:tps6594-pfsm");
+MODULE_AUTHOR("Julien Panis <jpanis@baylibre.com>");
+MODULE_DESCRIPTION("TPS6594 Pre-configurable Finite State Machine Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/tps6594_pfsm.h b/include/uapi/linux/tps6594_pfsm.h
new file mode 100644
index 000000000000..c3fd07df28b3
--- /dev/null
+++ b/include/uapi/linux/tps6594_pfsm.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Userspace ABI for TPS6594 PMIC Pre-configurable Finite State Machine
+ *
+ * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
+ */
+
+#ifndef __TPS6594_PFSM_H
+#define __TPS6594_PFSM_H
+
+#include <linux/const.h>
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/* PFSM state definitions */
+enum pfsm_state {
+	PMIC_ACTIVE_STATE,
+	PMIC_MCU_ONLY_STATE,
+	PMIC_RETENTION_STATE
+};
+
+/**
+ * struct pmic_state - PMIC state identification
+ * @state:   PFSM destination state
+ * @options: options for destination state
+ */
+struct pmic_state {
+	enum pfsm_state state;
+	__u8 options;
+};
+
+/* Commands */
+#define	PMIC_BASE			'P'
+
+#define	PMIC_GOTO_STANDBY		_IO(PMIC_BASE, 0)
+#define	PMIC_GOTO_LP_STANDBY		_IO(PMIC_BASE, 1)
+#define	PMIC_UPDATE_PGM			_IO(PMIC_BASE, 2)
+#define	PMIC_SET_STATE			_IOW(PMIC_BASE, 3, struct pmic_state)
+
+/* Options for destination state */
+#define PMIC_GPIO_RETENTION		_BITUL(0)
+#define PMIC_DDR_RETENTION		_BITUL(1)
+#define PMIC_MCU_ONLY_STARTUP_DEST	_BITUL(2)
+
+#endif /*  __TPS6594_PFSM_H */
-- 
2.37.3

