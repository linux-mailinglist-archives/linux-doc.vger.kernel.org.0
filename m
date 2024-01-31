Return-Path: <linux-doc+bounces-7934-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3578430DF
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jan 2024 00:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22811B2413A
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 23:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6079E7AE70;
	Tue, 30 Jan 2024 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="HTWliAxJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB927EF17
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 23:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656032; cv=none; b=Zv8x1EoJ1VDsC1+Wd/we1NbfkCdApgrYm/hpGw8p28T1G2o61B4sTBgc16XwnTwPxIbCypFY5PBDSWOhfo0qJBqhVTKPI2uJywmj+wxiNZU+F4fdP85PDgZ3W5lUBuZrLFSskVityL13HUZWkpIpIVmvLWwKXU6/yZM5ChQwUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656032; c=relaxed/simple;
	bh=Fowyq8NobX0Ym3EDlrswcPrMJqTSU+6S5Ib7vRokd24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EeBkO+BriYEc6sSunHZN28tM1k9efb1eiuIsxpSmjlLWLG3VYq6tIGovQlvqkNee2j0yLT0ytaGtQ6mP0zP0H9BzriAj4unMuhkRy/IDc9wVFFT0WczDzYr421zTzN0j3jGpkWkvQbS56ZIuZ4KWvBCcXi2x5Do6uYHWKkXirng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=HTWliAxJ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68c3eb209f4so24834936d6.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 15:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706656029; x=1707260829; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewNuteH+7JWkkhgRcvRINUdox40DYgFQx21HLo3QlY4=;
        b=HTWliAxJW14RdrLxaB8hml1nXjIUamJUtNUHzL/JicDVEord8ccY24p5Eo2QzbtRX8
         Vs621hCfGRQTOFe/GC+unpRMQDM214A6VBUMEcS+DxFildxA0T+vdJqW+3XErgnV+7Pg
         VugZtWGpS4fdOvOPeRXXQGPe/+PdhgcBW8kGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706656029; x=1707260829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewNuteH+7JWkkhgRcvRINUdox40DYgFQx21HLo3QlY4=;
        b=NfWszqXVpP23x1KP9dITNHhQTfrDRWQ5APVa/I4CGwJ2PThmQmchZSOGxeGwIBiihC
         Z1Oost7mbZq8vYx4KL1MKssFeFKvydb50ab658G80mZoVkXwBCmilfmLKKdC4totUxcE
         8IGSojHgh06nQ6ZON/mluYgdzMWCzEcFAh2On2kUQlwTOF9C/VIQ9N4Dyl3Ck62A63dd
         t7ol/7M4nuOwoAamNRtpD+gfe8QelAhoqbJPs0sNjDSvdhrDBMNqbA//cGzA47oKLsxw
         aeB7+HWcEDBL35mJHi3Je96JNSRObca/hJG2MkaP+zaPR7SeHNIj6ysgFHv3b83l1Q6S
         znAg==
X-Gm-Message-State: AOJu0Yw4vzh44v/dNyKicFWbJw+LFBCI//yEcXKFQKlFaGn6QhCk+F9V
	t+JaVVPn5nRcUD5gU2R4R1okZYQUTN631kz732V5t1CJYeYX1pvZw7/HkXlhmAk=
X-Google-Smtp-Source: AGHT+IGFjdioi2Rm5rlL1SBGLSRvMXZjL0poEPhLt4unmPkEaxdkKQAZg7qeAJ5KhgW1YzIwJYLjpA==
X-Received: by 2002:a05:6214:21e8:b0:686:9f2e:d984 with SMTP id p8-20020a05621421e800b006869f2ed984mr6847qvj.22.1706656029290;
        Tue, 30 Jan 2024 15:07:09 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id di8-20020ad458e8000000b0068c47832171sm3081275qvb.65.2024.01.30.15.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 15:07:08 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/2] hwmon: add fan speed monitoring driver for Surface devices
Date: Tue, 30 Jan 2024 18:06:54 -0500
Message-Id: <20240130230654.4218-3-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240130230654.4218-1-ivor@iwanders.net>
References: <20240130230654.4218-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Adds a driver that provides read only access to the fan speed for Microsoft
Surface Pro devices. The fan speed is always regulated by the EC and cannot
be influenced directly.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
Changes in v4:
  - Return 0 from surface_fan_hwmon_read instead of ret.
  - Use PTR_ERR_OR_ZERO in probe instead of if statement.
Changes in v3:
  - Removed type and attr checks in read and is_visible.
  - Removed assigning sdev to ssam_device drvdata.
  - Propagate return from __ssam_fan_rpm_get.
  - Renamed hwmon chip name from 'fan' to 'surface_fan'.
  - Removed unnecessary platform_device header.
Changes in v2:
  - Removed all sysfs attributes except fan1_input. Simplified code
    and updated documentation accordingly.
---
 Documentation/hwmon/index.rst       |  1 +
 Documentation/hwmon/surface_fan.rst | 25 ++++++++
 MAINTAINERS                         |  8 +++
 drivers/hwmon/Kconfig               | 13 +++++
 drivers/hwmon/Makefile              |  1 +
 drivers/hwmon/surface_fan.c         | 91 +++++++++++++++++++++++++++++
 6 files changed, 139 insertions(+)
 create mode 100644 Documentation/hwmon/surface_fan.rst
 create mode 100644 drivers/hwmon/surface_fan.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 042e1cf95..4dfb3b9bd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -202,6 +202,7 @@ Hardware Monitoring Kernel Drivers
    smsc47m1
    sparx5-temp
    stpddc60
+   surface_fan
    sy7636a-hwmon
    tc654
    tc74
diff --git a/Documentation/hwmon/surface_fan.rst b/Documentation/hwmon/surface_fan.rst
new file mode 100644
index 000000000..07942574c
--- /dev/null
+++ b/Documentation/hwmon/surface_fan.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver surface_fan
+=========================
+
+Supported Devices:
+
+  * Microsoft Surface Pro 9
+
+Author: Ivor Wanders <ivor@iwanders.net>
+
+Description
+-----------
+
+This provides monitoring of the fan found in some Microsoft Surface Pro devices,
+like the Surface Pro 9. The fan is always controlled by the onboard controller.
+
+Sysfs interface
+---------------
+
+======================= ======= =========================================
+Name                    Perm    Description
+======================= ======= =========================================
+``fan1_input``          RO      Current fan speed in RPM.
+======================= ======= =========================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 439cf523b..8e7870af3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14078,6 +14078,14 @@ F:	Documentation/driver-api/surface_aggregator/clients/dtx.rst
 F:	drivers/platform/surface/surface_dtx.c
 F:	include/uapi/linux/surface_aggregator/dtx.h
 
+MICROSOFT SURFACE SENSOR FAN DRIVER
+M:	Maximilian Luz <luzmaximilian@gmail.com>
+M:	Ivor Wanders <ivor@iwanders.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/surface_fan.rst
+F:	drivers/hwmon/surface_fan.c
+
 MICROSOFT SURFACE GPE LID SUPPORT DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 307477b8a..4b4d999af 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1965,6 +1965,19 @@ config SENSORS_SMM665
 	  This driver can also be built as a module. If so, the module will
 	  be called smm665.
 
+config SENSORS_SURFACE_FAN
+	tristate "Surface Fan Driver"
+	depends on SURFACE_AGGREGATOR
+	help
+	  Driver that provides monitoring of the fan on Surface Pro devices that
+	  have a fan, like the Surface Pro 9.
+
+	  This makes the fan's current speed accessible through the hwmon
+	  system. It does not provide control over the fan, the firmware is
+	  responsible for that, this driver merely provides monitoring.
+
+	  Select M or Y here, if you want to be able to read the fan's speed.
+
 config SENSORS_ADC128D818
 	tristate "Texas Instruments ADC128D818"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3f4b0fda0..5ae214c06 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -198,6 +198,7 @@ obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
+obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
 obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
 obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
 obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
diff --git a/drivers/hwmon/surface_fan.c b/drivers/hwmon/surface_fan.c
new file mode 100644
index 000000000..31cd5da9e
--- /dev/null
+++ b/drivers/hwmon/surface_fan.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Surface Fan driver for Surface System Aggregator Module. It provides access
+ * to the fan's rpm through the hwmon system.
+ *
+ * Copyright (C) 2023 Ivor Wanders <ivor@iwanders.net>
+ */
+
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/surface_aggregator/device.h>
+#include <linux/types.h>
+
+// SSAM
+SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_fan_rpm_get, __le16, {
+	.target_category = SSAM_SSH_TC_FAN,
+	.command_id      = 0x01,
+});
+
+// hwmon
+umode_t surface_fan_hwmon_is_visible(const void *drvdata,
+				     enum hwmon_sensor_types type, u32 attr,
+				     int channel)
+{
+	return 0444;
+}
+
+static int surface_fan_hwmon_read(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, long *val)
+{
+	struct ssam_device *sdev = dev_get_drvdata(dev);
+	int ret;
+	__le16 value;
+
+	ret = __ssam_fan_rpm_get(sdev, &value);
+	if (ret)
+		return ret;
+
+	*val = le16_to_cpu(value);
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *const surface_fan_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops surface_fan_hwmon_ops = {
+	.is_visible = surface_fan_hwmon_is_visible,
+	.read = surface_fan_hwmon_read,
+};
+
+static const struct hwmon_chip_info surface_fan_chip_info = {
+	.ops = &surface_fan_hwmon_ops,
+	.info = surface_fan_info,
+};
+
+static int surface_fan_probe(struct ssam_device *sdev)
+{
+	struct device *hdev;
+
+	hdev = devm_hwmon_device_register_with_info(&sdev->dev,
+						    "surface_fan", sdev,
+						    &surface_fan_chip_info,
+						    NULL);
+
+	return PTR_ERR_OR_ZERO(hdev);
+}
+
+static const struct ssam_device_id ssam_fan_match[] = {
+	{ SSAM_SDEV(FAN, SAM, 0x01, 0x01) },
+	{},
+};
+MODULE_DEVICE_TABLE(ssam, ssam_fan_match);
+
+static struct ssam_device_driver surface_fan = {
+	.probe = surface_fan_probe,
+	.match_table = ssam_fan_match,
+	.driver = {
+		.name = "surface_fan",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_ssam_device_driver(surface_fan);
+
+MODULE_AUTHOR("Ivor Wanders <ivor@iwanders.net>");
+MODULE_DESCRIPTION("Fan Driver for Surface System Aggregator Module");
+MODULE_LICENSE("GPL");
-- 
2.17.1


