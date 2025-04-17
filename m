Return-Path: <linux-doc+bounces-43495-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2181A92462
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 19:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0771F3B4BDE
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 17:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1152566D7;
	Thu, 17 Apr 2025 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="bSaSMj3n"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382CC255E23;
	Thu, 17 Apr 2025 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912410; cv=none; b=VdMGzyCwWH3QPl3u3clXncUFZdxNmO2VMZSEWOzuQ4aJ4nsEhPtvTsCrRvumV6d2w9UF+cMnmweJpBbj9nM8xbAJ+NeTTmkDTk/INrc5BlFM4DMHdL15hexQObE0DtPClTi04J4RtB1mUuwNw5Nkk6SJ7H56t/Xjv6kQTiFzTZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912410; c=relaxed/simple;
	bh=zpPGTn9jBq6dlXLi2aKAfFOf1S875AgtFgpT+dNjwe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKxGUYHD/UgEaKgHgj6esaVwhRtZ9sLCFry4i+7r5iKuPEjGi/KQraj8ADdufVS0xIT+w8lF/6iBMjqa5fuxSuAPxiTF8gvdVDsPlQoB9a5CK7MF/tytbRwmBruKKuzfYqqs791gnqLGBuaQU8PQ+c6z4DXk6IgMcKuc+hnyS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=bSaSMj3n; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id D4E7B2E0895C;
	Thu, 17 Apr 2025 20:53:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1744912404;
	bh=5krtJAQ2Hs3Msl2turSRVjSkxAaMpQ5x31o5h0mc8ag=; h=From:To:Subject;
	b=bSaSMj3nl7wrP1gi03SdKUxIuOVWEGwnJEnh7MEoGhY5KOwYYa8VSsD1WnnHVK4dE
	 RIPuiKHbhGErUclgatM5JTbdeQcsTkKiGPgj+cMHzFHJlr2wLZ+uYiwFs2E7kyteCt
	 59/utkRZuS3KRUiiZG+7AoNmzPv/OjgYnUdY3wLA=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joaquin Ignacio Aramendia <samsagax@gmail.com>,
	Derek J Clark <derekjohn.clark@gmail.com>,
	Kevin Greenberg <kdgreenberg234@protonmail.com>,
	Joshua Tam <csinaction@pm.me>,
	Parth Menon <parthasarathymenon@gmail.com>,
	Eileen <eileen@one-netbook.com>,
	linux-kernel@vger.kernel.org,
	sre@kernel.org,
	linux@weissschuh.net,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	mario.limonciello@amd.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 03/15] platform/x86: oxpec: Move hwmon/oxp-sensors to
 platform/x86
Date: Thu, 17 Apr 2025 19:52:58 +0200
Message-ID: <20250417175310.3552671-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417175310.3552671-1-lkml@antheas.dev>
References: <20250417175310.3552671-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174491240451.24806.15948022686644251336@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The EC of OneXPlayer devices used to only control the fan.
This is no longer the case, with the EC of OneXPlayer gaining
additional functionality (turbo button, turbo led, battery controls).

As it will be beneficial from a complexity perspective
to retain this driver as a single unit, move it out
of hwmon, and into platform/x86. Also, remove the
hwmon documentation to prepare moving it to
Documentation/ABI/.

While at it, add myself to the maintainer's file.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 Documentation/hwmon/index.rst                 |  2 +-
 Documentation/hwmon/oxp-sensors.rst           | 89 -------------------
 MAINTAINERS                                   |  7 +-
 drivers/hwmon/Kconfig                         | 11 ---
 drivers/hwmon/Makefile                        |  1 -
 drivers/platform/x86/Kconfig                  | 12 +++
 drivers/platform/x86/Makefile                 |  3 +
 .../oxp-sensors.c => platform/x86/oxpec.c}    | 10 +--
 8 files changed, 24 insertions(+), 111 deletions(-)
 delete mode 100644 Documentation/hwmon/oxp-sensors.rst
 rename drivers/{hwmon/oxp-sensors.c => platform/x86/oxpec.c} (98%)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f0ddf6222c44d..a86f7aa9006e6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -189,7 +189,7 @@ Hardware Monitoring Kernel Drivers
    nzxt-kraken3
    nzxt-smart2
    occ
-   oxp-sensors
+   oxpec
    pc87360
    pc87427
    pcf8591
diff --git a/Documentation/hwmon/oxp-sensors.rst b/Documentation/hwmon/oxp-sensors.rst
deleted file mode 100644
index 581c4dafbfa13..0000000000000
--- a/Documentation/hwmon/oxp-sensors.rst
+++ /dev/null
@@ -1,89 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0-or-later
-
-Kernel driver oxp-sensors
-=========================
-
-Authors:
-    - Derek John Clark <derekjohn.clark@gmail.com>
-    - Joaquín Ignacio Aramendía <samsagax@gmail.com>
-
-Description:
-------------
-
-Handheld devices from OneNetbook, AOKZOE, AYANEO, And OrangePi provide fan
-readings and fan control through their embedded controllers.
-
-Currently supports OneXPlayer devices, AOKZOE, AYANEO, and OrangePi
-handheld devices. AYANEO devices preceding the AIR and OneXPlayer devices
-preceding the Mini A07 are not supportable as the EC model is different
-and do not have manual control capabilities.
-
-Some OneXPlayer and AOKZOE models have a toggle for changing the behaviour
-of the "Turbo/Silent" button of the device. It will change the key event
-that it triggers with a flip of the `tt_toggle` attribute. See below for
-boards that support this function.
-
-Supported devices
------------------
-
-Currently the driver supports the following handhelds:
-
- - AOKZOE A1
- - AOKZOE A1 PRO
- - AYANEO 2
- - AYANEO 2S
- - AYANEO AIR
- - AYANEO AIR 1S
- - AYANEO AIR Plus (Mendocino)
- - AYANEO AIR Pro
- - AYANEO Flip DS
- - AYANEO Flip KB
- - AYANEO Geek
- - AYANEO Geek 1S
- - AYANEO KUN
- - OneXPlayer 2
- - OneXPlayer 2 Pro
- - OneXPlayer AMD
- - OneXPlayer mini AMD
- - OneXPlayer mini AMD PRO
- - OneXPlayer OneXFly
- - OneXPlayer X1 A
- - OneXPlayer X1 i
- - OneXPlayer X1 mini
- - OrangePi NEO-01
-
-"Turbo/Silent" button behaviour toggle is only supported on:
- - AOK ZOE A1
- - AOK ZOE A1 PRO
- - OneXPlayer 2
- - OneXPlayer 2 Pro
- - OneXPlayer mini AMD (only with updated alpha BIOS)
- - OneXPlayer mini AMD PRO
- - OneXPlayer OneXFly
- - OneXPlayer X1 A
- - OneXPlayer X1 i
- - OneXPlayer X1 mini
-
-Sysfs entries
--------------
-
-The following attributes are supported:
-
-fan1_input
-  Read Only. Reads current fan RPM.
-
-pwm1_enable
-  Read Write. Enable manual fan control. Write "1" to set to manual, write "0"
-  to let the EC control de fan speed. Read this attribute to see current status.
-
-pwm1
-  Read Write. Read this attribute to see current duty cycle in the range [0-255].
-  When pwm1_enable is set to "1" (manual) write any value in the range [0-255]
-  to set fan speed.
-
-tt_toggle
-  Read Write. Read this attribute to check the status of the turbo/silent
-  button behaviour function. Write "1" to activate the switch and "0" to
-  deactivate it. The specific keycodes and behaviour is specific to the device
-  both with this function on and off. This attribute is attached to the platform
-  driver and not to the hwmon driver (/sys/devices/platform/oxp-platform/tt_toggle)
diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f8..e584c1a25449a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18013,12 +18013,13 @@ S:	Maintained
 F:	drivers/mtd/nand/onenand/
 F:	include/linux/mtd/onenand*.h
 
-ONEXPLAYER FAN DRIVER
+ONEXPLAYER PLATFORM EC DRIVER
+M:	Antheas Kapenekakis <lkml@antheas.dev>
 M:	Derek John Clark <derekjohn.clark@gmail.com>
 M:	Joaquín Ignacio Aramendía <samsagax@gmail.com>
-L:	linux-hwmon@vger.kernel.org
+L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/hwmon/oxp-sensors.c
+F:	drivers/platform/x86/oxpec.c
 
 ONIE TLV NVMEM LAYOUT DRIVER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f91f713b0105d..5fd93aad2d6df 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1795,17 +1795,6 @@ config SENSORS_NZXT_SMART2
 
 source "drivers/hwmon/occ/Kconfig"
 
-config SENSORS_OXP
-	tristate "OneXPlayer EC fan control"
-	depends on ACPI_EC
-	depends on X86
-	help
-		If you say yes here you get support for fan readings and control over
-		OneXPlayer handheld devices. Only OneXPlayer mini AMD handheld variant
-		boards are supported.
-
-		Can also be built as a module. In that case it will be called oxp-sensors.
-
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 766c652ef22be..e3468d024ff39 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -183,7 +183,6 @@ obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
 obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
 obj-$(CONFIG_SENSORS_NZXT_KRAKEN3) += nzxt-kraken3.o
 obj-$(CONFIG_SENSORS_NZXT_SMART2) += nzxt-smart2.o
-obj-$(CONFIG_SENSORS_OXP) += oxp-sensors.o
 obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
 obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b5..739740c4bb535 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1201,6 +1201,18 @@ config SEL3350_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called sel3350-platform.
 
+config OXP_EC
+	tristate "OneXPlayer EC platform control"
+	depends on ACPI_EC
+	depends on HWMON
+	depends on X86
+	help
+		Enables support for the platform EC of OneXPlayer and AOKZOE
+		handheld devices. This includes fan speed, fan controls, and
+		disabling the default TDP behavior of the device. Due to legacy
+		reasons, this driver also provides hwmon functionality to Ayaneo
+		devices and the OrangePi Neo.
+
 endif # X86_PLATFORM_DEVICES
 
 config P2SB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 650dfbebb6c8c..38ffc4c98e786 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -154,3 +154,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
 
 # SEL
 obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
+
+# OneXPlayer
+obj-$(CONFIG_OXP_EC)			+= oxpec.o
diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/platform/x86/oxpec.c
similarity index 98%
rename from drivers/hwmon/oxp-sensors.c
rename to drivers/platform/x86/oxpec.c
index f7a64fbc8f33e..dc3a0871809cd 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/platform/x86/oxpec.c
@@ -1,11 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Platform driver for OneXPlayer, AOKZOE, AYANEO, and OrangePi Handhelds
- * that expose fan reading and control via hwmon sysfs.
- *
- * Old OXP boards have the same DMI strings and they are told apart by
- * the boot cpu vendor (Intel/AMD). Of these older models only AMD is
- * supported.
+ * Platform driver for OneXPlayer and AOKZOE devices. For the time being,
+ * it also exposes fan controls for AYANEO, and OrangePi Handhelds via
+ * hwmon sysfs.
  *
  * Fan control is provided via pwm interface in the range [0-255].
  * Old AMD boards use [0-100] as range in the EC, the written value is
@@ -16,6 +13,7 @@
  *
  * Copyright (C) 2022 Joaquín I. Aramendía <samsagax@gmail.com>
  * Copyright (C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
+ * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
  */
 
 #include <linux/acpi.h>
-- 
2.49.0


