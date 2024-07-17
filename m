Return-Path: <linux-doc+bounces-20899-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED49D933755
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 08:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94D4A2839AE
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 06:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC3179A3;
	Wed, 17 Jul 2024 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeuG4jGW"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD2C171A1;
	Wed, 17 Jul 2024 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721198795; cv=none; b=Lw74ZL0qdrJB+30GDD7w6/ds1CYrGBK6PyvkosQlnAq5f56GWNZyVeAdxSUDiSWEyX4lCFGA6xx94ORMMBATth4iCMFw1L7F59+DGdNeIfVV9CeShq1uDlug1qaKtPrnm1Jd2edQa0WfVrmk1W4HgOV7JK3HWnRnA0JAl8H8hl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721198795; c=relaxed/simple;
	bh=G3NNi87UVrekIUvfH0uGnBD0BIFDPthAwkLv0RvYCs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlTLj80eQG+fzmU7/FJcXLmUZl/2rhkRc4O7Cq1tME4bnWCaDL9K9qhRJ8pRs55lVMU54k9Orczdw4eaNAKB8X6S5K2UQLiofWZwHPJVJ0Z5otWt+/ZhiA95XeRXNplqSVs8BB0F/kzp6cAh7WaM+A6hMbpFyTdZ2K5CtO+B/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeuG4jGW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E323C4AF0E;
	Wed, 17 Jul 2024 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721198794;
	bh=G3NNi87UVrekIUvfH0uGnBD0BIFDPthAwkLv0RvYCs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WeuG4jGWU7t/l2+ElblW/E4EOAeVkd87y0bOposdWvsPWXEBNgQKFT2gdkDYc2wDf
	 ABxdNsJYYkY3spRRVRNvI4Ny7ZJwm3UoUo48IWpRL0SQT8CQsAIm4pOPpFqQtIgjZU
	 z/C+SSLteoDkbbDHervTZFBWkcqQkmylLWN/owSmEVXvU5hUdFmtYaP4256hvK1iwL
	 obWfX2gDuZy25xXYp9w7S7dHfR0M1hBu7ENQ4vIkdoqjnNT3jKZNluUucsCJZKprsg
	 UZD2B1o49zlK6LCv4aEbvrd96qkgE+XLNYH/dNnMsB6tmE/SqECMDWu1fvuBDeUP35
	 rGSY02t5Rt4Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AD6C3DA4B;
	Wed, 17 Jul 2024 06:46:34 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+Cryolitia.gmail.com@kernel.org>
Date: Wed, 17 Jul 2024 14:46:26 +0800
Subject: [PATCH v3 1/2] hwmon: add GPD devices sensor driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240717-gpd_fan-v3-1-8d7efb1263b7@gmail.com>
References: <20240717-gpd_fan-v3-0-8d7efb1263b7@gmail.com>
In-Reply-To: <20240717-gpd_fan-v3-0-8d7efb1263b7@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Cryolitia PukNgae <Cryolitia@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, 
 =?utf-8?q?Marcin_Str=C4=85gowski?= <marcin@stragowski.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19649;
 i=Cryolitia@gmail.com; h=from:subject:message-id;
 bh=JgGi6+byJDahw0Q7I53MQIogAYpnum04figcQre6O9E=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0did012TXdNRm9GeXRlOUtlcjd5N2phY
 lVraHJUcEdVYzlEajM1OW12VmZOblVvQ2lmRVBQSDd5V0NnazZhCk9OMDFPYjAyVmJSWlpYSitK
 Nk14Q3dNakI0T3NtQ0pMaVdtdTVxbnZCUjZDTlJ4cU1JTlltVUNtTUhCeENzQkUKK0ZNNEdQWTN
 IVnF2Rk1IRWZmejRwME5zeDdwamozaThicjBlbXExODVYOHowKzBnblFWeFNkTDg5NTlzTFAvTw
 orS2s2ZDZaby9FT04wNGRNSks4ZWwxbnhWbVBQOU1uWjE3T2V1djR0M2R5dGVETktlVXVlc3Fyb
 3o3Vm1oUysyCjd4YWZVVFBSVTg1Si9OUlBSM2FqYnBQZ2d4S1NSVTZiejN0ODdYSVMrZkprMmJx
 OUpROVhYWFdxYUlxNytPV3IKVU8vVU1CWkcrZGt4RWFtM25UbktMUXYxMzdKYzNQYW9qaUYvUnB
 hLzlQRmpZWWF5RDFNbFh5NFU2RCt6Nm4wWApvNU9TZlpDcHp4TDdOeDVYZG5nK3FMbXljMEh1Z1
 JpdVIwRm5HdzVyT3J4dktPQjVhK096bmprdmFrOUV5L2NXCmlUZTE1a1loV1RrL0prWXFaN2pMK
 3dWSXlsMzZ4SGp2RjdPR05sLy9LZllwQUE9PQo9Ykg2VgotLS0tLUVORCBQR1AgTUVTU0FHRS0t
 LS0tCg==
X-Developer-Key: i=Cryolitia@gmail.com; a=openpgp;
 fpr=1C3C6547538D7152310C0EEA84DD0C0130A54DF7
X-Endpoint-Received: by B4 Relay for Cryolitia@gmail.com/default with
 auth_id=186
X-Original-From: Cryolitia PukNgae <Cryolitia@gmail.com>
Reply-To: Cryolitia@gmail.com

From: Cryolitia PukNgae <Cryolitia@gmail.com>

Sensors driver for GPD Handhelds that expose fan reading and control via
hwmon sysfs.

Shenzhen GPD Technology Co., Ltd. manufactures a series of handheld
devices. This driver implements these functions through x86 port-mapped IO.
I have only tested it on my device Win Max 2 2023.

Tested-by: Marcin Strągowski <marcin@stragowski.com>
Signed-off-by: Cryolitia PukNgae <Cryolitia@gmail.com>
---
 MAINTAINERS             |   6 +
 drivers/hwmon/Kconfig   |  10 +
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/gpd-fan.c | 674 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 691 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index af4b4c271342..9ced72cec42b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9372,6 +9372,12 @@ F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	include/dt-bindings/clock/google,gs101.h
 K:	[gG]oogle.?[tT]ensor
 
+GPD FAN DRIVER
+M:	Cryolitia PukNgae <Cryolitia@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/gpd-fan.c
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b60fe2e58ad6..368165a25979 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -727,6 +727,16 @@ config SENSORS_GL520SM
 	  This driver can also be built as a module. If so, the module
 	  will be called gl520sm.
 
+config SENSORS_GPD
+	tristate "GPD EC fan control"
+	depends on X86
+	help
+	  If you say yes here you get support for fan readings and
+	  control over GPD handheld devices.
+
+	  Can also be built as a module. In that case it will be
+	  called gpd-fan.
+
 config SENSORS_G760A
 	tristate "GMT G760A"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b1c7056c37db..91c288451290 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_SENSORS_GIGABYTE_WATERFORCE) += gigabyte_waterforce.o
 obj-$(CONFIG_SENSORS_GL518SM)	+= gl518sm.o
 obj-$(CONFIG_SENSORS_GL520SM)	+= gl520sm.o
 obj-$(CONFIG_SENSORS_GSC)	+= gsc-hwmon.o
+obj-$(CONFIG_SENSORS_GPD)	+= gpd-fan.o
 obj-$(CONFIG_SENSORS_GPIO_FAN)	+= gpio-fan.o
 obj-$(CONFIG_SENSORS_GXP_FAN_CTRL) += gxp-fan-ctrl.o
 obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
new file mode 100644
index 000000000000..dddd3d575879
--- /dev/null
+++ b/drivers/hwmon/gpd-fan.c
@@ -0,0 +1,674 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/ioport.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DRIVER_NAME "gpdfan"
+
+// model param, see document
+static char *gpd_fan_model = "";
+module_param(gpd_fan_model, charp, 0444);
+
+// EC read/write locker
+// Should never access EC at the same time, otherwise system down.
+static DEFINE_MUTEX(gpd_fan_lock);
+
+// general struct declare start
+
+enum FAN_PWM_ENABLE {
+	DISABLE = 0,
+	MANUAL = 1,
+	AUTOMATIC = 2,
+};
+
+struct gpd_driver_priv {
+	enum FAN_PWM_ENABLE pwm_enable;
+	u8 pwm_value;
+
+	u16 fan_speed_cached;
+	u8 read_pwm_cached;
+
+	unsigned long fan_speed_last_update;
+	unsigned long read_pwm_last_update;
+
+	const struct gpd_model_quirk *const quirk;
+};
+
+struct gpd_model_ec_address {
+	const u8 addr_port;
+	const u8 data_port;
+	const u16 manual_control_enable;
+	const u16 rpm_read;
+	const u16 pwm_write;
+	const u16 pwm_max;
+};
+
+struct gpd_model_quirk {
+	const char *model_name;
+	const struct gpd_model_ec_address address;
+
+	s32 (*read_rpm)(struct gpd_driver_priv *data);
+	int (*set_pwm_enable)(struct gpd_driver_priv *data,
+			      enum FAN_PWM_ENABLE);
+	s16 (*read_pwm)(struct gpd_driver_priv *data);
+	int (*write_pwm)(const struct gpd_driver_priv *data, u8 val);
+};
+
+// general struct declare end
+
+// model quirk function declare start
+
+static s32 gpd_read_rpm(struct gpd_driver_priv *data);
+static s16 gpd_read_pwm(struct gpd_driver_priv *data);
+static int gpd_write_pwm(const struct gpd_driver_priv *data, u8 val);
+
+static int gpd_win_mini_set_pwm_enable(struct gpd_driver_priv *data,
+				       enum FAN_PWM_ENABLE pwm_enable);
+static int gpd_win_mini_write_pwm(const struct gpd_driver_priv *data, u8 val);
+
+static s32 gpd_win4_read_rpm(struct gpd_driver_priv *data);
+
+static s32 gpd_wm2_read_rpm(struct gpd_driver_priv *data);
+static s16 gpd_wm2_read_pwm(struct gpd_driver_priv *data);
+static int gpd_wm2_set_pwm_enable(struct gpd_driver_priv *data,
+				  enum FAN_PWM_ENABLE enable);
+static int gpd_wm2_write_pwm(const struct gpd_driver_priv *data, u8 val);
+
+// model quirk function declare end
+
+// model quirk struct declare start
+
+static const struct gpd_model_quirk gpd_win_mini_quirk = {
+	.model_name = "win_mini",
+	.address = {
+		.addr_port = 0x4E,
+		.data_port = 0x4F,
+		.manual_control_enable = 0x047A,
+		.rpm_read = 0x0478,
+		.pwm_write = 0x047A,
+		.pwm_max = 244,
+	},
+	.read_rpm = gpd_read_rpm,
+	.set_pwm_enable = gpd_win_mini_set_pwm_enable,
+	.read_pwm = gpd_read_pwm,
+	.write_pwm = gpd_win_mini_write_pwm,
+};
+
+static const struct gpd_model_quirk gpd_win4_quirk = {
+	.model_name = "win4",
+	.address = {
+		.addr_port = 0x2E,
+		.data_port = 0x2F,
+		.manual_control_enable = 0xC311,
+		.rpm_read = 0xC880,
+		.pwm_write = 0xC311,
+		.pwm_max = 127,
+	},
+	.read_rpm = gpd_win4_read_rpm,
+	// same as GPD Win Mini
+	.set_pwm_enable = gpd_win_mini_set_pwm_enable,
+	.read_pwm = gpd_read_pwm,
+	// same as GPD Win Mini
+	.write_pwm = gpd_win_mini_write_pwm,
+};
+
+static const struct gpd_model_quirk gpd_wm2_quirk = {
+	.model_name = "wm2",
+	.address = {
+		.addr_port = 0x4E,
+		.data_port = 0x4F,
+		.manual_control_enable = 0x0275,
+		.rpm_read = 0x0218,
+		.pwm_write = 0x1809,
+		.pwm_max = 184,
+	},
+	.read_rpm = gpd_wm2_read_rpm,
+	.set_pwm_enable = gpd_wm2_set_pwm_enable,
+	.read_pwm = gpd_wm2_read_pwm,
+	.write_pwm = gpd_wm2_write_pwm,
+};
+
+// model quirk struct declare end
+
+static const struct dmi_system_id gpd_devices[] = {
+	{
+		// GPD Win Mini
+		// GPD Win Mini with AMD Ryzen 8840U
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01")
+		},
+		.driver_data = &gpd_win_mini_quirk,
+	},
+	{
+		// GPD Win 4 with AMD Ryzen 6800U
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
+			DMI_MATCH(DMI_BOARD_VERSION, "Default string"),
+		},
+		.driver_data = &gpd_win4_quirk,
+	},
+	{
+		// GPD Win 4 with Ryzen 7840U
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
+			DMI_MATCH(DMI_BOARD_VERSION, "Ver. 1.0"),
+		},
+		.driver_data = &gpd_wm2_quirk,
+	},
+	{
+		// GPD Win Max 2 with Ryzen 6800U
+		// GPD Win Max 2 2023 with Ryzen 7840U
+		// GPD Win Max 2 2024 with Ryzen 8840U
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
+		},
+		.driver_data = &gpd_wm2_quirk,
+	},
+	{}
+};
+
+static const struct gpd_model_quirk *gpd_module_quirks[] = {
+	&gpd_win_mini_quirk, &gpd_win4_quirk, &gpd_wm2_quirk, NULL
+};
+
+// device EC truly access start
+
+static int gpd_ecram_read(const struct gpd_model_ec_address *address,
+			  u16 offset, u8 *val)
+{
+	int ret;
+
+	ret = mutex_lock_interruptible(&gpd_fan_lock);
+
+	if (ret)
+		return ret;
+
+	u16 addr_port = address->addr_port;
+	u16 data_port = address->data_port;
+
+	outb(0x2E, addr_port);
+	outb(0x11, data_port);
+	outb(0x2F, addr_port);
+	outb((u8)((offset >> 8) & 0xFF), data_port);
+
+	outb(0x2E, addr_port);
+	outb(0x10, data_port);
+	outb(0x2F, addr_port);
+	outb((u8)(offset & 0xFF), data_port);
+
+	outb(0x2E, addr_port);
+	outb(0x12, data_port);
+	outb(0x2F, addr_port);
+	*val = inb(data_port);
+
+	mutex_unlock(&gpd_fan_lock);
+	return 0;
+}
+
+static int gpd_ecram_write(const struct gpd_model_ec_address *address,
+			   u16 offset, u8 value)
+{
+	int ret = mutex_lock_interruptible(&gpd_fan_lock);
+
+	if (ret)
+		return ret;
+
+	u16 addr_port = address->addr_port;
+	u16 data_port = address->data_port;
+
+	outb(0x2E, addr_port);
+	outb(0x11, data_port);
+	outb(0x2F, addr_port);
+	outb((u8)((offset >> 8) & 0xFF), data_port);
+
+	outb(0x2E, addr_port);
+	outb(0x10, data_port);
+	outb(0x2F, addr_port);
+	outb((u8)(offset & 0xFF), data_port);
+
+	outb(0x2E, addr_port);
+	outb(0x12, data_port);
+	outb(0x2F, addr_port);
+	outb(value, data_port);
+
+	mutex_unlock(&gpd_fan_lock);
+	return 0;
+}
+
+// device EC truly access end
+
+// device quirk function implement start
+
+static s32
+gpd_read_cached_fan_speed(struct gpd_driver_priv *data,
+			  s32 (*read_uncached)(const struct gpd_driver_priv *))
+{
+	// Update per 1000 milliseconds
+	if (time_after(jiffies, data->fan_speed_last_update + HZ)) {
+		s32 ret = read_uncached(data);
+
+		if (ret < 0)
+			return ret;
+
+		data->fan_speed_cached = ret;
+		data->fan_speed_last_update = jiffies;
+	}
+	return data->fan_speed_cached;
+}
+
+static s32
+gpd_read_cached_pwm(struct gpd_driver_priv *data,
+		    s16 (*read_uncached)(const struct gpd_driver_priv *))
+{
+	// Update per 1000 milliseconds
+	if (time_after(jiffies, data->read_pwm_last_update + HZ)) {
+		s16 ret = read_uncached(data);
+
+		if (ret < 0)
+			return ret;
+
+		data->read_pwm_cached = ret;
+		data->read_pwm_last_update = jiffies;
+	}
+	return data->read_pwm_cached;
+}
+
+static s32 gpd_read_rpm_uncached(const struct gpd_driver_priv *data)
+{
+	u8 high, low;
+	int ret;
+	const struct gpd_model_ec_address *address = &data->quirk->address;
+
+	ret = gpd_ecram_read(address, address->rpm_read, &high);
+	if (ret)
+		return ret;
+	ret = gpd_ecram_read(address, address->rpm_read + 1, &low);
+	if (ret)
+		return ret;
+
+	return high << 8 | low;
+}
+
+static s32 gpd_read_rpm(struct gpd_driver_priv *data)
+{
+	return gpd_read_cached_fan_speed(data, gpd_read_rpm_uncached);
+}
+
+static s16 gpd_read_pwm(struct gpd_driver_priv *data)
+{
+	return data->pwm_value;
+}
+
+static int gpd_write_pwm(const struct gpd_driver_priv *data, u8 val)
+{
+	const struct gpd_model_ec_address *address = &data->quirk->address;
+
+	u8 actual = val * (address->pwm_max - 1) / 255 + 1;
+
+	return gpd_ecram_write(address, address->pwm_write, actual);
+}
+
+static int gpd_win_mini_set_pwm_enable(struct gpd_driver_priv *data,
+				       enum FAN_PWM_ENABLE pwm_enable)
+{
+	switch (pwm_enable) {
+	case DISABLE:
+		return gpd_write_pwm(data, 255);
+	case MANUAL:
+		return gpd_write_pwm(data, data->pwm_value);
+	case AUTOMATIC:
+		return gpd_write_pwm(data, 0);
+	}
+	return 0;
+}
+
+static int gpd_win_mini_write_pwm(const struct gpd_driver_priv *data, u8 val)
+{
+	if (data->pwm_enable == MANUAL)
+		return gpd_write_pwm(data, val);
+	return 0;
+}
+
+static s32 gpd_win4_read_rpm_uncached(const struct gpd_driver_priv *data)
+{
+	const struct gpd_model_ec_address *address = &data->quirk->address;
+	u8 PWMCTR;
+
+	gpd_ecram_read(address, 0x1841, &PWMCTR);
+	if (PWMCTR != 0x7F)
+		gpd_ecram_write(address, 0x1841, 0x7F);
+
+	s32 ret = gpd_read_rpm_uncached(data);
+
+	if (ret < 0)
+		return ret;
+
+	if (ret == 0) {
+		//re-init EC
+		u8 chip_id;
+
+		gpd_ecram_read(address, 0x2000, &chip_id);
+		if (chip_id == 0x55) {
+			u8 chip_ver;
+
+			if (gpd_ecram_read(address, 0x1060, &chip_ver)) {
+				gpd_ecram_write(address, 0x1060,
+						chip_ver | 0x80);
+			}
+		}
+	}
+	return ret;
+}
+
+static s32 gpd_win4_read_rpm(struct gpd_driver_priv *data)
+{
+	return gpd_read_cached_fan_speed(data, gpd_win4_read_rpm_uncached);
+}
+
+static s32 gpd_wm2_read_rpm_uncached(const struct gpd_driver_priv *data)
+{
+	const struct gpd_model_ec_address *address = &data->quirk->address;
+
+	for (u16 pwm_ctr_offset = 0x1841; pwm_ctr_offset <= 0x1843;
+	     pwm_ctr_offset++) {
+		u8 PWMCTR;
+
+		gpd_ecram_read(address, pwm_ctr_offset, &PWMCTR);
+		if (PWMCTR != 0xB8)
+			gpd_ecram_write(address, pwm_ctr_offset, 0xB8);
+	}
+	return gpd_read_rpm_uncached(data);
+}
+
+static s32 gpd_wm2_read_rpm(struct gpd_driver_priv *data)
+{
+	return gpd_read_cached_fan_speed(data, gpd_wm2_read_rpm_uncached);
+}
+
+static s16 gpd_wm2_read_pwm_uncached(const struct gpd_driver_priv *data)
+{
+	const struct gpd_model_ec_address *address = &data->quirk->address;
+	u8 var;
+	int ret = gpd_ecram_read(address, address->pwm_write, &var);
+
+	if (ret < 0)
+		return ret;
+
+	return var * 255 / address->pwm_max;
+}
+
+static s16 gpd_wm2_read_pwm(struct gpd_driver_priv *data)
+{
+	return gpd_read_cached_pwm(data, gpd_wm2_read_pwm_uncached);
+}
+
+static int gpd_wm2_set_pwm_enable(struct gpd_driver_priv *data,
+				  enum FAN_PWM_ENABLE enable)
+{
+	const struct gpd_model_ec_address *address = &data->quirk->address;
+
+	switch (enable) {
+	case DISABLE:
+		int ret = gpd_write_pwm(data, 255);
+
+		if (ret)
+			return ret;
+
+		return gpd_ecram_write(address, address->manual_control_enable,
+				       1);
+	case MANUAL:
+		ret = gpd_write_pwm(data, data->pwm_value);
+
+		if (ret)
+			return ret;
+
+		return gpd_ecram_write(address, address->manual_control_enable,
+				       1);
+	case AUTOMATIC:
+		ret = gpd_ecram_write(address, address->manual_control_enable,
+				      0);
+
+		// Immediately refresh the PWM value
+		gpd_read_cached_pwm(data, gpd_wm2_read_pwm_uncached);
+
+		return ret;
+	}
+	return 0;
+}
+
+static int gpd_wm2_write_pwm(const struct gpd_driver_priv *data, u8 val)
+{
+	if (data->pwm_enable != DISABLE)
+		return gpd_write_pwm(data, val);
+
+	return 0;
+}
+
+// device quirk function implement end
+
+// hwmon subsystem start
+
+static umode_t gpd_fan_hwmon_is_visible(__always_unused const void *drvdata,
+					enum hwmon_sensor_types type, u32 attr,
+					__always_unused int channel)
+{
+	if (type == hwmon_fan && attr == hwmon_fan_input) {
+		return 0444;
+	} else if (type == hwmon_pwm) {
+		switch (attr) {
+		case hwmon_pwm_enable:
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			return 0;
+		}
+	}
+	return 0;
+}
+
+static int gpd_fan_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, __always_unused int channel, long *val)
+{
+	struct gpd_driver_priv *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_fan) {
+		switch (attr) {
+		case hwmon_fan_input:
+			s32 ret = data->quirk->read_rpm(data);
+
+			if (ret < 0)
+				return ret;
+
+			*val = ret;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+	if (type == hwmon_pwm) {
+		switch (attr) {
+		case hwmon_pwm_enable:
+			*val = data->pwm_enable;
+			return 0;
+		case hwmon_pwm_input:
+			s16 ret = data->quirk->read_pwm(data);
+
+			if (ret < 0)
+				return ret;
+
+			*val = ret;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+	return -EOPNOTSUPP;
+}
+
+static int gpd_fan_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, __always_unused int channel, long val)
+{
+	struct gpd_driver_priv *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_pwm) {
+		switch (attr) {
+		case hwmon_pwm_enable:
+			if (!in_range(val, 0, 3))
+				return -EINVAL;
+			data->pwm_enable = val;
+			return data->quirk->set_pwm_enable(data,
+							   data->pwm_enable);
+		case hwmon_pwm_input:
+			u8 var = clamp_val(val, 0, 255);
+
+			data->pwm_value = var;
+			return data->quirk->write_pwm(data, var);
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops gpd_fan_ops = {
+	.is_visible = gpd_fan_hwmon_is_visible,
+	.read = gpd_fan_hwmon_read,
+	.write = gpd_fan_hwmon_write,
+};
+
+static const struct hwmon_channel_info *gpd_fan_hwmon_channel_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE), NULL
+};
+
+static struct hwmon_chip_info gpd_fan_chip_info = {
+	.ops = &gpd_fan_ops,
+	.info = gpd_fan_hwmon_channel_info
+};
+
+// hwmon subsystem end
+
+static int gpd_fan_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpd_driver_priv *data;
+	const struct resource *plat_res;
+	const struct device *dev_reg;
+	const struct resource *region_res;
+
+	data = dev_get_platdata(&pdev->dev);
+	if (IS_ERR_OR_NULL(data))
+		return -ENODEV;
+
+	plat_res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (IS_ERR_OR_NULL(plat_res))
+		return dev_err_probe(dev, PTR_ERR(plat_res),
+				     "Failed to get platform resource\n");
+
+	region_res = devm_request_region(dev, plat_res->start,
+					 resource_size(plat_res), DRIVER_NAME);
+	if (IS_ERR_OR_NULL(region_res))
+		return dev_err_probe(dev, PTR_ERR(region_res),
+				     "Failed to request region\n");
+
+	dev_reg = devm_hwmon_device_register_with_info(
+		dev, DRIVER_NAME, data, &gpd_fan_chip_info, NULL);
+	if (IS_ERR_OR_NULL(dev_reg))
+		return dev_err_probe(dev, PTR_ERR(region_res),
+				     "Failed to register hwmon device\n");
+
+	return 0;
+}
+
+static int gpd_fan_remove(__always_unused struct platform_device *pdev)
+{
+	struct gpd_driver_priv *data = dev_get_platdata(&pdev->dev);
+
+	data->pwm_enable = AUTOMATIC;
+	data->quirk->set_pwm_enable(data, AUTOMATIC);
+
+	return 0;
+}
+
+static struct platform_driver gpd_fan_driver = {
+	.probe = gpd_fan_probe,
+	.remove = gpd_fan_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+	},
+};
+
+static struct platform_device *gpd_fan_platform_device;
+
+static int __init gpd_fan_init(void)
+{
+	const struct gpd_model_quirk *match = NULL;
+
+	for (const struct gpd_model_quirk **p = gpd_module_quirks; *p; p++) {
+		if (strcmp(gpd_fan_model, (*p)->model_name) == 0) {
+			match = *p;
+			break;
+		}
+	}
+
+	if (!match)
+		match = dmi_first_match(gpd_devices)->driver_data;
+
+	if (!match)
+		return -ENODEV;
+
+	struct gpd_driver_priv data = {
+		.pwm_enable = AUTOMATIC,
+		.pwm_value = 255,
+		.fan_speed_cached = 0,
+		.read_pwm_cached = 0,
+		.fan_speed_last_update = jiffies,
+		.read_pwm_last_update = jiffies,
+		.quirk = match,
+	};
+
+	struct resource gpd_fan_resources[] = {
+		{
+			.start = data.quirk->address.addr_port,
+			.end = data.quirk->address.data_port,
+			.flags = IORESOURCE_IO,
+		},
+	};
+
+	gpd_fan_platform_device = platform_create_bundle(
+		&gpd_fan_driver, gpd_fan_probe, gpd_fan_resources, 1, &data,
+		sizeof(struct gpd_driver_priv));
+
+	if (IS_ERR(gpd_fan_platform_device)) {
+		pr_warn("Failed to create platform device\n");
+		return PTR_ERR(gpd_fan_platform_device);
+	}
+
+	return 0;
+}
+
+static void __exit gpd_fan_exit(void)
+{
+	platform_device_unregister(gpd_fan_platform_device);
+	platform_driver_unregister(&gpd_fan_driver);
+}
+
+module_init(gpd_fan_init)
+module_exit(gpd_fan_exit)
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cryolitia <Cryolitia@gmail.com>");
+MODULE_DESCRIPTION("GPD Devices fan control driver");
+MODULE_ALIAS("dmi:*:svnGPD:pnG1617-01:*");
+MODULE_ALIAS("dmi:*:svnGPD:pnG1618-04:*");
+MODULE_ALIAS("dmi:*:svnGPD:pnG1619-04:*");

-- 
2.45.2



