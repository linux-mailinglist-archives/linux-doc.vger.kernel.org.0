Return-Path: <linux-doc+bounces-12295-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5756F87FCED
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 12:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790EE1C21D5D
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 11:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716157F7C0;
	Tue, 19 Mar 2024 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="FPbDq+q6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AC7F47E;
	Tue, 19 Mar 2024 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710847993; cv=none; b=Yu69erFjG8VmuUJpY3QwJyHZemcwotD8Fvk4QZwrh2Gf7bQR9xxwukNRthg/Wcx8HIGtO2ckj9tF4xCsnnxfxexSnBB1VZR3cKU6JPOaXw/3Q6iLbm8pbapJwT2pi4+lRIeKC3KP6wE3LSmeeXK+3GTKFI+9ee4xwgWK4hy7+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710847993; c=relaxed/simple;
	bh=lEah9kcHJXNhaw/k95Ks0jSFuCJCoCbWFc7l63k23Gk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RkoFTbDs9btXH7XoKLHOQvpMEAE3k3mvw3qoQJKyetSFbX2M+jVfzeeTHVoszpQ4xMT7W0E4yxp2E0Z0u1P7qtb+SCGgHpKCXJALvu34yg0SsrQPNHKp+xaDcsLtrGOF35N5ovU4dBqoPOgJZNsadW7P+yp8XlWGzjynGjCmZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FPbDq+q6; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J7ZfGr012232;
	Tue, 19 Mar 2024 07:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=DKIM;
	 bh=pNtMEe2nR6XiKcJvIvj/NvzqC4Klhv79qhhcFQpaJwg=; b=FPbDq+q6Z07+
	L6gxmsesEP3O85qSVvWTQtOaokNxTaa784XW8VBuEMzhdmUnZ+YrzFG6YwhcDK/n
	s944SY9Ej9ann07GacZFT5nMa78X04QGf10OxuZSJfE5KXxSC9/tVYt0i4Cddj7J
	B/XPsPPj1e1AQ65+A2GcM/l/KWqBdBUXPk9xB834FYcjVYrf9U2vw09yDpR0rZfU
	a55v1FiH4hEIUBRkzBu/wSwV264ZqDgWCWPD7wvkbceQ+lM41HMOkEX29mgj+wxM
	11gPvx8UfizEpAxIdenZ3HCFsyvkSlSuBjGRf5yDAeE4NqqP3LkDblQqjJmrlWiT
	EqEFoGVxzw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3wy6f1rr2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 07:32:49 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 42JBWmJi003315
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 07:32:48 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Mar 2024 07:32:47 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Mar 2024 07:32:46 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 19 Mar 2024 07:32:46 -0400
Received: from radu.ad.analog.com ([10.48.65.243])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 42JBWKUR020586;
	Tue, 19 Mar 2024 07:32:40 -0400
From: Radu Sabau <radu.sabau@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Radu Sabau <radu.sabau@analog.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH v2 2/2] hwmon: pmbus: adp1050 : Add driver support
Date: Tue, 19 Mar 2024 13:32:03 +0200
Message-ID: <20240319113213.19083-2-radu.sabau@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319113213.19083-1-radu.sabau@analog.com>
References: <20240319113213.19083-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: or-2828TKMgFA9AHNYHavmxbpad0jPwU
X-Proofpoint-ORIG-GUID: or-2828TKMgFA9AHNYHavmxbpad0jPwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_01,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190089

Add support for ADP1050 Digital Controller for Isolated Power Supplies
with PMBus interface Voltage, Current and Temperature Monitor.

The ADP1050 implements several features to enable a robust
system of parallel and redundant operation for customers who
require high availability. The device can measure voltage,
current and temperature that can be used in different
techniques to identify and safely shut down an erroneous
power supply in parallel operation mode.

Signed-off-by: Radu Sabau <radu.sabau@analog.com>
---
 Documentation/hwmon/adp1050.rst | 69 +++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst   |  1 +
 drivers/hwmon/pmbus/Kconfig     | 10 +++++
 drivers/hwmon/pmbus/Makefile    |  1 +
 drivers/hwmon/pmbus/adp1050.c   | 58 +++++++++++++++++++++++++++
 5 files changed, 139 insertions(+)
 create mode 100644 Documentation/hwmon/adp1050.rst
 create mode 100644 drivers/hwmon/pmbus/adp1050.c

diff --git a/Documentation/hwmon/adp1050.rst b/Documentation/hwmon/adp1050.rst
new file mode 100644
index 000000000000..e3e5bb650a51
--- /dev/null
+++ b/Documentation/hwmon/adp1050.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver adp1050
+=====================
+
+Supported chips:
+
+  * Analog Devices ADP1050
+
+    Prefix: 'adp1050'
+
+    Addresses scanned: I2C 0x70 - 0x77
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-
+sheets/ADP1050.pdf
+
+Authors:
+
+  - Radu Sabau <radu.sabau@analog.com>
+
+
+Description
+-----------
+
+This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
+Controller for Isolated Power Supply with PMBus interface.
+
+The ADP1050 is an advanced digital controller with a PMBus™
+interface targeting high density, high efficiency dc-to-dc power
+conversion used to monitor system temperatures, voltages and currents.
+Through the PMBus interface, the device can monitor input/output voltages,
+input current and temperature.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate
+the devices explicitly.
+Please see Documentation/i2c/instantiating-devices.rst for details.
+
+The vin scale monitor value and iin scale monitor value can be
+configured by a device tree property;see
+Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml for details
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data.
+
+Sysfs Attributes
+----------------
+
+================= ========================================
+in1_label         "vin"
+in1_input         Measured input voltage
+in1_alarm	  Input voltage alarm
+in2_label	  "vout1"
+in2_input	  Measured output voltage
+in2_crit	  Critical maximum output voltage
+in2_crit_alarm    Output voltage high alarm
+in2_lcrit	  Critical minimum output voltage
+in2_lcrit_alarm	  Output voltage critical low alarm
+curr1_label	  "iin"
+curr1_input	  Measured input current.
+curr1_alarm	  Input current alarm
+temp1_input       Measured temperature
+temp1_crit	  Critical high temperature
+temp1_crit_alarm  Chip temperature critical high alarm
+================= ========================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1ca7a4fe1f8f..9a4fd576e6f6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -33,6 +33,7 @@ Hardware Monitoring Kernel Drivers
    adm1266
    adm1275
    adm9240
+   adp1050
    ads7828
    adt7410
    adt7411
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 557ae0c414b0..38e794d83cc3 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -57,6 +57,16 @@ config SENSORS_ADM1275
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
 
+config SENSORS_ADP1050
+	tristate "Analog Devices ADP1050 digital controller for Power Supplies"
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices ADP1050 digital controller for isolated power supply with
+	  PMBus interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called adp1050.
+
 config SENSORS_BEL_PFE
 	tristate "Bel PFE Compatible Power Supplies"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f14ecf03ad77..95a8dea5e5ed 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ACBEL_FSG032) += acbel-fsg032.o
 obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
+obj-$(CONFIG_SENSORS_ADP1050)	+= adp1050.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
new file mode 100644
index 000000000000..0a49bea8e13b
--- /dev/null
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for Analog Devices ADP1050
+ *
+ * Copyright (C) 2024 Analog Devices, Inc.
+ */
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info adp1050_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		| PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_IIN | PMBUS_HAVE_TEMP
+		| PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int adp1050_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &adp1050_info);
+}
+
+static const struct i2c_device_id adp1050_id[] = {
+	{"adp1050", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, adp1050_id);
+
+static const struct of_device_id adp1050_of_match[] = {
+	{ .compatible = "adi,adp1050"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, adp1050_of_match);
+
+static struct i2c_driver adp1050_driver = {
+	.driver = {
+		.name = "adp1050",
+		.of_match_table = adp1050_of_match,
+	},
+	.probe = adp1050_probe,
+	.id_table = adp1050_id,
+};
+module_i2c_driver(adp1050_driver);
+
+MODULE_AUTHOR("Radu Sabau <radu.sabau@analog.com>");
+MODULE_DESCRIPTION("Analog Devices ADP1050 HWMON PMBus Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.34.1


