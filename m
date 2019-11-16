Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56CEAFF4E7
	for <lists+linux-doc@lfdr.de>; Sat, 16 Nov 2019 19:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfKPS4v (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Nov 2019 13:56:51 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34288 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfKPS4v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Nov 2019 13:56:51 -0500
Received: by mail-lf1-f66.google.com with SMTP id l28so1083565lfj.1;
        Sat, 16 Nov 2019 10:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Da2HqV3tWwdvaCs0J9MaUdJFtFu1Kwz0kL6JcNeicY=;
        b=e16jSaLaR8Ub1FNXitH1R0e9R2E/5rgAKRwQ3ajmloUYkAdfM2mjkuCL9ofCSNazov
         o/VtrJk+hOZdX/f6kP6a3dB9lNwYD11td/mvk0ihYlqAJaxuPZ20r7uur/RvtdSiojal
         3hOh0erW2li91moxFUqcFNEZlPtaJPwpueJyP5VOzYcVCmm4m1hXdjv1wX7uR+4tUQVV
         zylR69pMQft00QP+X3251oy6XBnlw4pPXL/E3e4rgahZHOnFGaxtZBCz4h7rkuhad9g4
         FInKDI5jipWQlqbg07y7QK3qpNpjoKkwTqi8tIKR5YLovwwFEMGSyQh35SosdFI+IeWW
         ikaA==
X-Gm-Message-State: APjAAAUiugnBC2aM2LOCgLcpRXgda82DZ7JO+1N5ybsezGV43NpQgfSm
        7RgK5gOCj8Mevmz96NNQI4c=
X-Google-Smtp-Source: APXvYqyyfcZxSN4thMMhd4ZYsIotq2zi9BDc8BrzMq7tG8FtOivDb12JL1UJ65koUrFKN7lL9RVfqg==
X-Received: by 2002:a19:41c8:: with SMTP id o191mr15347024lfa.101.1573930607625;
        Sat, 16 Nov 2019 10:56:47 -0800 (PST)
Received: from localhost.localdomain (dyttqz39y2bkc1ryvyh3t-4.rev.dnainternet.fi. [2001:14bb:420:da5f:a0b0:502a:b811:1af])
        by smtp.gmail.com with ESMTPSA id x10sm630215ljc.58.2019.11.16.10.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 10:56:47 -0800 (PST)
Date:   Sat, 16 Nov 2019 20:56:38 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v4 03/16] dt-bindings: mfd: Document ROHM BD71828 bindings
Message-ID: <00abd88e370ec155b0717413d324a1c96c01a13d.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
and a 32.768 kHz clock gate.

Document the dt bindings drivers are using.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../bindings/mfd/rohm,bd71828-pmic.yaml       | 249 ++++++++++++++++++
 1 file changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
new file mode 100644
index 000000000000..17ea9fa463e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -0,0 +1,249 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd71828-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit bindings
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  BD71828GW is a single-chip power management IC for battery-powered portable
+  devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA
+  single-cell linear charger. Also included is a Coulomb counter, a real-time
+  clock (RTC), and a 32.768 kHz clock gate.
+
+  The BD71828 RUN state is divided into 4 configurable run-levels named RUN0,
+  RUN1, RUN2 and RUN3. Bucks 1, 2, 6 and 7 can be either controlled individually
+  via I2C, or some/all of them can be bound to run-levels and controlled as a
+  group. If bucks are controlled individually these run-levels are ignored. See
+  ../regulator/rohm,bd71828-regulator.yaml for how to define regulator voltages
+  for run-levels. Run-levels can be changed by I2C or GPIO depending on PMIC's
+  OTP configuration.
+
+properties:
+  compatible:
+    const: rohm,bd71828
+
+  reg:
+    description:
+      I2C slave address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt line the device is connected to.
+
+  gpio-controller: true
+      # Indicate BD71828 acts as a GPIO controller.
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the pin number and the second cell is used to specify
+      flags. See ../gpio/gpio.txt for more information.
+
+  clocks:
+    maxItems: 1
+    description:
+      The parent clock connected to PMIC.
+
+  "#clock-cells":
+    const: 0
+
+  rohm,charger-sense-resistor-ohms:
+    minimum: 10000000
+    maximum: 50000000
+    description: |
+      BD71827 and BD71828 have SAR ADC for measuring charging currents.
+      External sense resistor (RSENSE in data sheet) should be used. If some
+      other but 30MOhm resistor is used the resistance value should be given
+      here in Ohms.
+
+  regulators:
+    $ref: ../regulator/rohm,bd71828-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  leds:
+    $ref: ../leds/rohm,bd71828-leds.yaml
+
+  rohm,dvs-vsel-gpios:
+    maxItems: 2
+    description: |
+      GPIOs used to control PMIC run-levels. Should describe two GPIOs.
+      (See run-level control in data-sheet). If this property is omitted but
+      some bucks are marked to be controlled by run-levels - then OTP option
+      allowing run-level control via I2C is assumed.
+
+  gpio-reserved-ranges:
+    description: |
+      Usage of BD71828 GPIO pins can be changed via OTP. This property can be
+      used to mark the pins which should not be configured for GPIO. Please see
+      the ../gpio/gpio.txt for more information.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - "#clock-cells"
+  - regulators
+  - gpio-controller
+  - "#gpio-cells"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pmic: pmic@4b {
+            compatible = "rohm,bd71828";
+            reg = <0x4b>;
+
+            interrupt-parent = <&gpio1>;
+            interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+
+            clocks = <&osc 0>;
+            #clock-cells = <0>;
+            clock-output-names = "bd71828-32k-out";
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-reserved-ranges = <0 1>, <2 1>;
+
+            rohm,dvs-vsel-gpios = <&gpio1 12 0>, <&gpio1 13 0>;
+            rohm,charger-sense-resistor-ohms = <10000000>;
+
+            regulators {
+                buck1: BUCK1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                    rohm,dvs-runlvl-ctrl;
+                    rohm,dvs-runlevel-microvolts  = <500000>,
+                                                    <506250>,
+                                                    <512500>,
+                                                    <518750>;
+                    regulator-boot-on;
+                };
+                buck2: BUCK2 {
+                    regulator-name = "buck2";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                    rohm,dvs-runlvl-ctrl;
+                    rohm,dvs-runlevel-microvolts  = <500000>,
+                                                    <506250>,
+                                                    <512500>,
+                                                    <518750>;
+                    regulator-boot-on;
+                };
+                buck3: BUCK3 {
+                    regulator-name = "buck3";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-boot-on;
+                };
+                buck4: BUCK4 {
+                    regulator-name = "buck4";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+                buck5: BUCK5 {
+                    regulator-name = "buck5";
+                    regulator-min-microvolt = <2500000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+                buck6: BUCK6 {
+                    regulator-name = "buck6";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                    rohm,dvs-runlvl-ctrl;
+                    rohm,dvs-runlevel-microvolts  = <500000>,
+                                                    <506250>,
+                                                    <512500>,
+                                                    <518750>;
+                    regulator-boot-on;
+                };
+                buck7: BUCK7 {
+                    regulator-name = "buck7";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2000000>;
+                    regulator-ramp-delay = <2500>;
+                    rohm,dvs-runlvl-ctrl;
+                    rohm,dvs-runlevel-microvolts  = <500000>,
+                                                    <506250>,
+                                                    <512500>,
+                                                    <518750>;
+                    regulator-boot-on;
+                };
+                ldo1: LDO1 {
+                    regulator-name = "ldo1";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+                ldo2: LDO2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+                ldo3: LDO3 {
+                    regulator-name = "ldo3";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+                ldo4: LDO4 {
+                    regulator-name = "ldo4";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+                ldo5: LDO5 {
+                    regulator-name = "ldo5";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+                ldo6: LDO6 {
+                    regulator-name = "ldo6";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+                ldo7_reg: LDO7 {
+                    regulator-name = "ldo7";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+            };
+
+            leds {
+                compatible = "rohm,bd71828-leds";
+
+                led-1 {
+                    rohm,led-compatible = "bd71828-grnled";
+                    function = LED_FUNCTION_INDICATOR;
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+                led-2 {
+                    rohm,led-compatible = "bd71828-ambled";
+                    function = LED_FUNCTION_CHARGING;
+                    color = <LED_COLOR_ID_AMBER>;
+                };
+            };
+        };
+    };
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
