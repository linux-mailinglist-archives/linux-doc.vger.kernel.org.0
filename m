Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355103BB3D7
	for <lists+linux-doc@lfdr.de>; Mon,  5 Jul 2021 01:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhGDXUR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 4 Jul 2021 19:20:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232496AbhGDXNU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 4 Jul 2021 19:13:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6693861971;
        Sun,  4 Jul 2021 23:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625440158;
        bh=eTrAhuEnhf1jwS563QR50Re9w5Dovg9QzGL1lL+ozPY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a594L1MkaFh4g8w5f8pKFIhmHxYLEJjghZRo6ucJgM7Wba/UgfmdIaVCjZbEZ117b
         Onn5hlJ1+whJc7U3q2OC8IEtFi5rK7pnF8ZrH+oW28UNCTrR5LC75Da/s1kNCf6lMq
         5AziMuoXHXnXUzAEBEbUYxWwDXO3htYm6bEdoM+6UGZF5/PcsM0HiHuSR9O2HXgjDl
         CS/unGcqRgs0OV9ay4MhiS75GgCaP/LDBQ6BKx+bw6VjQMM15Hxm+QXyNivcx3Tw59
         SnkArMfneAscdMqGw8+6yCyebvfpXSZtFpllv1VhtYjjXTEH2OzZMzscs7zQHIb33f
         Gzf7V5KG53now==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <kubernat@cesnet.cz>,
        Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 55/70] hwmon: (max31790) Fix pwmX_enable attributes
Date:   Sun,  4 Jul 2021 19:07:48 -0400
Message-Id: <20210704230804.1490078-55-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230804.1490078-1-sashal@kernel.org>
References: <20210704230804.1490078-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit 148c847c9e5a54b99850617bf9c143af9a344f92 ]

pwmX_enable supports three possible values:

0: Fan control disabled. Duty cycle is fixed to 0%
1: Fan control enabled, pwm mode. Duty cycle is determined by
   values written into Target Duty Cycle registers.
2: Fan control enabled, rpm mode
   Duty cycle is adjusted such that fan speed matches
   the values in Target Count registers

The current code does not do this; instead, it mixes pwm control
configuration with fan speed monitoring configuration. Worse, it
reports that pwm control would be disabled (pwmX_enable==0) when
it is in fact enabled in pwm mode. Part of the problem may be that
the chip sets the "TACH input enable" bit on its own whenever the
mode bit is set to RPM mode, but that doesn't mean that "TACH input
enable" accurately reflects the pwm mode.

Fix it up and only handle pwm control with the pwmX_enable attributes.
In the documentation, clarify that disabling pwm control (pwmX_enable=0)
sets the pwm duty cycle to 0%. In the code, explain why TACH_INPUT_EN
is set together with RPM_MODE.

While at it, only update the configuration register if the configuration
has changed, and only update the cached configuration if updating the
chip configuration was successful.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Václav Kubernát <kubernat@cesnet.cz>
Reviewed-by: Jan Kundrát <jan.kundrat@cesnet.cz>
Link: https://lore.kernel.org/r/20210526154022.3223012-4-linux@roeck-us.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/hwmon/max31790.rst |  2 +-
 drivers/hwmon/max31790.c         | 41 ++++++++++++++++++++------------
 2 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index 54ff0f49e28f..7b097c3b9b90 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -38,7 +38,7 @@ Sysfs entries
 fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
-pwm[1-6]_enable    RW  regulator mode, 0=disabled, 1=manual mode, 2=rpm mode
+pwm[1-6]_enable    RW  regulator mode, 0=disabled (duty cycle=0%), 1=manual mode, 2=rpm mode
 pwm[1-6]           RW  read: current pwm duty cycle,
                        write: target pwm duty cycle (0-255)
 ================== === =======================================================
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 8ad7a45bfe68..76aa96f5b984 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -27,6 +27,7 @@
 
 /* Fan Config register bits */
 #define MAX31790_FAN_CFG_RPM_MODE	0x80
+#define MAX31790_FAN_CFG_CTRL_MON	0x10
 #define MAX31790_FAN_CFG_TACH_INPUT_EN	0x08
 #define MAX31790_FAN_CFG_TACH_INPUT	0x01
 
@@ -271,12 +272,12 @@ static int max31790_read_pwm(struct device *dev, u32 attr, int channel,
 		*val = data->pwm[channel] >> 8;
 		return 0;
 	case hwmon_pwm_enable:
-		if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
+		if (fan_config & MAX31790_FAN_CFG_CTRL_MON)
+			*val = 0;
+		else if (fan_config & MAX31790_FAN_CFG_RPM_MODE)
 			*val = 2;
-		else if (fan_config & MAX31790_FAN_CFG_TACH_INPUT_EN)
-			*val = 1;
 		else
-			*val = 0;
+			*val = 1;
 		return 0;
 	default:
 		return -EOPNOTSUPP;
@@ -307,23 +308,33 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
 	case hwmon_pwm_enable:
 		fan_config = data->fan_config[channel];
 		if (val == 0) {
-			fan_config &= ~(MAX31790_FAN_CFG_TACH_INPUT_EN |
-					MAX31790_FAN_CFG_RPM_MODE);
+			fan_config |= MAX31790_FAN_CFG_CTRL_MON;
+			/*
+			 * Disable RPM mode; otherwise disabling fan speed
+			 * monitoring is not possible.
+			 */
+			fan_config &= ~MAX31790_FAN_CFG_RPM_MODE;
 		} else if (val == 1) {
-			fan_config = (fan_config |
-				      MAX31790_FAN_CFG_TACH_INPUT_EN) &
-				     ~MAX31790_FAN_CFG_RPM_MODE;
+			fan_config &= ~(MAX31790_FAN_CFG_CTRL_MON | MAX31790_FAN_CFG_RPM_MODE);
 		} else if (val == 2) {
-			fan_config |= MAX31790_FAN_CFG_TACH_INPUT_EN |
-				      MAX31790_FAN_CFG_RPM_MODE;
+			fan_config &= ~MAX31790_FAN_CFG_CTRL_MON;
+			/*
+			 * The chip sets MAX31790_FAN_CFG_TACH_INPUT_EN on its
+			 * own if MAX31790_FAN_CFG_RPM_MODE is set.
+			 * Do it here as well to reflect the actual register
+			 * value in the cache.
+			 */
+			fan_config |= (MAX31790_FAN_CFG_RPM_MODE | MAX31790_FAN_CFG_TACH_INPUT_EN);
 		} else {
 			err = -EINVAL;
 			break;
 		}
-		data->fan_config[channel] = fan_config;
-		err = i2c_smbus_write_byte_data(client,
-					MAX31790_REG_FAN_CONFIG(channel),
-					fan_config);
+		if (fan_config != data->fan_config[channel]) {
+			err = i2c_smbus_write_byte_data(client, MAX31790_REG_FAN_CONFIG(channel),
+							fan_config);
+			if (!err)
+				data->fan_config[channel] = fan_config;
+		}
 		break;
 	default:
 		err = -EOPNOTSUPP;
-- 
2.30.2

