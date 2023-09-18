Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A027A4169
	for <lists+linux-doc@lfdr.de>; Mon, 18 Sep 2023 08:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239852AbjIRGlr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Sep 2023 02:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239851AbjIRGlY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Sep 2023 02:41:24 -0400
Received: from TWMBX02.aspeed.com (mail.aspeedtech.com [211.20.114.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C1010E;
        Sun, 17 Sep 2023 23:41:16 -0700 (PDT)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Sep
 2023 14:41:14 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Sep 2023 14:41:14 +0800
From:   Billy Tsai <billy_tsai@aspeedtech.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <corbet@lwn.net>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <p.zabel@pengutronix.de>,
        <billy_tsai@aspeedtech.com>, <naresh.solanki@9elements.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <BMC-SW@aspeedtech.com>, <patrick@stwcx.xyz>
Subject: [PATCH v9 0/3] Support pwm/tach driver for aspeed ast26xx
Date:   Mon, 18 Sep 2023 14:41:08 +0800
Message-ID: <20230918064111.2221594-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Received-SPF: Fail (TWMBX02.aspeed.com: domain of billy_tsai@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_FAIL,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Unlike the old design that the register setting of the TACH should based
on the configure of the PWM. In ast26xx, the dependency between pwm and
tach controller is eliminated and becomes a separate hardware block. One
is used to provide pwm output and another is used to monitor the frequency
of the input. This driver implements them by exposing two kernel
subsystems: PWM and HWMON. The PWM subsystem can be utilized alongside
existing drivers for controlling elements such as fans (pwm-fan.c),
beepers (pwm-beeper.c) and so on. Through the HWMON subsystem, the driver
provides sysfs interfaces for fan.

Changes since v8:
Fix the fail of fan div register setting. (FIELD_GET -> FIELD_PREP)
Change the type of tach-ch from uint32_t to uint8-array
Add additional properties and apply constraints to certain properties.

Changes since v7:
Cherry-pick the fan-common.yaml and add the following properties:
- min-rpm
- div
- mode
- tach-ch
Fix the warning which is reported by the kernel test robot.

Changes since v6:
Consolidate the PWM and TACH functionalities into a unified driver.

Changes since v5:
- pwm/tach:
  - Remove the utilization of common resources from the parent node.
  - Change the concept to 16 PWM/TACH controllers, each with one channel,
  instead of 1 PWM/TACH controller with 16 channels.
- dt-binding:
  - Eliminate the usage of simple-mfd.

Changes since v4:
- pwm:
  - Fix the return type of get_status function.
- tach:
  - read clk source once and re-use it
  - Remove the constants variables
  - Allocate tach_channel as array
  - Use dev->parent
- dt-binding:
  - Fix the order of the patches
  - Add example and description for tach child node
  - Remove pwm extension property

Changes since v3:
- pwm:
  - Remove unnecessary include header
  - Fix warning Prefer "GPL" over "GPL v2"
- tach:
  - Remove the paremeter min_rpm and max_rpm and return the tach value 
  directly without any polling or delay.
  - Fix warning Prefer "GPL" over "GPL v2"
- dt-binding:
  - Replace underscore in node names with dashes
  - Split per subsystem

Changes since v2:
- pwm:
  - Use devm_* api to simplify the error cleanup
  - Fix the multi-line alignment problem
- tach:
  - Add tach-aspeed-ast2600 to index.rst
  - Fix the multi-line alignment problem
  - Remove the tach enable/disable when read the rpm
  - Fix some coding format issue

Changes since v1:
- tach:
  - Add the document tach-aspeed-ast2600.rst
  - Use devm_* api to simplify the error cleanup.
  - Change hwmon register api to devm_hwmon_device_register_with_info

Billy Tsai (2):
  dt-bindings: hwmon: Support Aspeed g6 PWM TACH Control
  hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach

Naresh Solanki (1):
  dt-bindings: hwmon: fan: Add fan binding to schema

 .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    |  69 +++
 .../devicetree/bindings/hwmon/fan-common.yaml |  78 +++
 Documentation/hwmon/aspeed-g6-pwm-tach.rst    |  26 +
 Documentation/hwmon/index.rst                 |   1 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/aspeed-g6-pwm-tach.c            | 539 ++++++++++++++++++
 7 files changed, 725 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
 create mode 100644 Documentation/hwmon/aspeed-g6-pwm-tach.rst
 create mode 100644 drivers/hwmon/aspeed-g6-pwm-tach.c

-- 
2.25.1

