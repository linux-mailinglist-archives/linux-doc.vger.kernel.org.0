Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95243BB399
	for <lists+linux-doc@lfdr.de>; Mon,  5 Jul 2021 01:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhGDXSZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 4 Jul 2021 19:18:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232807AbhGDXNT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 4 Jul 2021 19:13:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2F2961970;
        Sun,  4 Jul 2021 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625440156;
        bh=VuBZkuYORyCKJqQ3ug2x8UyRbKpNijoZunM6p8muHn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dY+AOugLzww6NlPKHX3sa8VkNzu0see5e9OvigLQb4BY+bfMWgMGgA9H+h1OLUGQE
         8G1oHx4l8wyBXhtNjEnrZbikkHH2s6NXeYn096BoPekVkmKYOii1lKT004wF/p5epF
         n5fVFM0flB0tSsl5D4RFycPZjNq8mRaF1XCkoxsaahIJzSp2W5ednc3AX0Osx9uQpr
         lNm1wW+9A+HQPc63t/9colFVT7YEx+PbJxxlDDhO2zZP3m9BCv2MscYu5oGg/p8Vir
         BYzhiGDBTRjS4/H88IqfLVdHHiXE0wkpLcL05ywi1W7WCkyDNzogMQqN01SpB0fdvI
         FVvM16mV3gUaA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <kubernat@cesnet.cz>,
        =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <kubernat@ceesnet.cz>,
        Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 54/70] hwmon: (max31790) Report correct current pwm duty cycles
Date:   Sun,  4 Jul 2021 19:07:47 -0400
Message-Id: <20210704230804.1490078-54-sashal@kernel.org>
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

[ Upstream commit 897f6339893b741a5d68ae8e2475df65946041c2 ]

The MAX31790 has two sets of registers for pwm duty cycles, one to request
a duty cycle and one to read the actual current duty cycle. Both do not
have to be the same.

When reporting the pwm duty cycle to the user, the actual pwm duty cycle
from pwm duty cycle registers needs to be reported. When setting it, the
pwm target duty cycle needs to be written. Since we don't know the actual
pwm duty cycle after a target pwm duty cycle has been written, set the
valid flag to false to indicate that actual pwm duty cycle should be read
from the chip instead of using cached values.

Cc: Jan Kundrát <jan.kundrat@cesnet.cz>
Cc: Václav Kubernát <kubernat@cesnet.cz>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Václav Kubernát <kubernat@ceesnet.cz>
Reviewed-by: Jan Kundrát <jan.kundrat@cesnet.cz>
Link: https://lore.kernel.org/r/20210526154022.3223012-3-linux@roeck-us.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/hwmon/max31790.rst | 3 ++-
 drivers/hwmon/max31790.c         | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/max31790.rst b/Documentation/hwmon/max31790.rst
index f301385d8cef..54ff0f49e28f 100644
--- a/Documentation/hwmon/max31790.rst
+++ b/Documentation/hwmon/max31790.rst
@@ -39,5 +39,6 @@ fan[1-12]_input    RO  fan tachometer speed in RPM
 fan[1-12]_fault    RO  fan experienced fault
 fan[1-6]_target    RW  desired fan speed in RPM
 pwm[1-6]_enable    RW  regulator mode, 0=disabled, 1=manual mode, 2=rpm mode
-pwm[1-6]           RW  fan target duty cycle (0-255)
+pwm[1-6]           RW  read: current pwm duty cycle,
+                       write: target pwm duty cycle (0-255)
 ================== === =======================================================
diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 86e6c71db685..8ad7a45bfe68 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -104,7 +104,7 @@ static struct max31790_data *max31790_update_device(struct device *dev)
 				data->tach[NR_CHANNEL + i] = rv;
 			} else {
 				rv = i2c_smbus_read_word_swapped(client,
-						MAX31790_REG_PWMOUT(i));
+						MAX31790_REG_PWM_DUTY_CYCLE(i));
 				if (rv < 0)
 					goto abort;
 				data->pwm[i] = rv;
@@ -299,10 +299,10 @@ static int max31790_write_pwm(struct device *dev, u32 attr, int channel,
 			err = -EINVAL;
 			break;
 		}
-		data->pwm[channel] = val << 8;
+		data->valid = false;
 		err = i2c_smbus_write_word_swapped(client,
 						   MAX31790_REG_PWMOUT(channel),
-						   data->pwm[channel]);
+						   val << 8);
 		break;
 	case hwmon_pwm_enable:
 		fan_config = data->fan_config[channel];
-- 
2.30.2

