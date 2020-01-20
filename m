Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 781F81426B3
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 10:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgATJMX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jan 2020 04:12:23 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45253 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgATJMX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jan 2020 04:12:23 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so23419343lfa.12;
        Mon, 20 Jan 2020 01:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=SJXLL8h9XjjYs2c5/Y2fbS35UdsII/Z7cphkXbXWjOc=;
        b=o8r8oLflx4VbTi5UqR9pvUrMBqPnWx0oD3M7iZvxGxZtQ00geBWy9U3YTy/dr5sexn
         JJJuzcFeUaCGg5MlBg/hgKy/6aBaNJGslChKdrK9KF/ThZ/4MlYj9FKhifsP0H5Xw41d
         fdcYgjLjJh4I7b45Cr8nGreDu/+x7ltdtgcN70w+/+M116Ss6OuEkpb+vYZ80TtHwVIw
         427B82icJ8SKCbbMF8J/DsKm9syPCkcpsPxrpDQSnxYg7Yc+B/idRIEqBmNskUxa5Yps
         kqZbdsmUNhe4F2XDT71Gk3CyfZsdlLuYy8n1wLoRxzI4Zt+ip7bNkQoc105158ypTAuj
         Gf/w==
X-Gm-Message-State: APjAAAXxyCj/3+VpAWGWyj+gHqRKL+3bQLvSQ0jkwZnzgR5MMuqiLy5Z
        66yMp1A+WXYBmB+iVw7I4io=
X-Google-Smtp-Source: APXvYqyeaA0zZM3l6tqS6nK2reG0GdArX/ej82f6kbL+O1m9emltaaD5vprveul5jEVAWK6962gIcw==
X-Received: by 2002:ac2:44a3:: with SMTP id c3mr12857824lfm.1.1579511539184;
        Mon, 20 Jan 2020 01:12:19 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g85sm16411715lfd.66.2020.01.20.01.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 01:12:18 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:12:06 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v12 00/10] Support ROHM BD71828 PMIC
Message-ID: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Patch series introducing support for ROHM BD71828 PMIC

ROHM BD71828 is a power management IC containing 7 bucks and 7 LDOs. All
regulators can be controlled individually via I2C. Bucks 1,2,6 and
7 can also be assigned to a "regulator group" controlled by run-levels.
Eg. Run level specific voltages and enable/disable statuses for each of
these bucks can be set via register interface. The buck run-level group
assignment (selection if buck is to be controlled individually or via
run-levels) can be changed at run-time via I2C.

This patch series brings only the basic support for controlling
regulators individually via I2C.

In addition to the bucks and LDOs there are:

- The usual clk gate
- 4 IO pins (mostly usable as GPO or tied to specific purpose)
- power button support
- RTC
- two LEDs
- battery charger
- HALL sensor input

This patch series adds support to regulators, clk, RTC and GPIOs.

Power-supply driver for charger or LED driver is not included in this series.

Changelog v12:
  - removed input: tag from MFD gpio-keys patch
  - dropped LED patches for now.

Changelog v11:
  - converted a macro to enum member as was requested by Lee.

Changelog v10:
  - Split RTC patch to a BD70528 fix (which hopefully goes to 5.4) and to
    BD71828 support

Changelog v9: (Changes suggested by Lee)
  - Added kerneldoc to struct rohm_dvs_config
  - cleaned few comments
  - updated copyright date
  - renamed variable 'mfd' to 'parent'.

Changelog v8:
  LEDs:
    - Fixed bunch of typos.
    - Corrected the commit message which errorneously contained the
      'leds-compatible' which I dropped in favour of match_property.
    - use max_brightness instead of LED_FULL if it is given when
      handling the default_state, "on".
    - clean fwnode_owned at the end of unsuccessful registration or
      at the end of deregistration.
    - fix the accidental linuxdoc comment.
    - rename led_find_fwnode to led_get_fwnode as it increases refcount.

Changelog v7:
  - Rebased on top of v5.5-rc2
  - Dropped already applied patches
    - basic regulator support (in regulator tree now)
    - regulator dt-bindings (in regulator tree now)
    - gpio devm function documentation (in GPIO tree now)
  - Dropped new devm-variant of gpio_array getting for MFD sub-devices who
    have consumer information in parent DT node as gpio consumer was
    dropped from the series
  - removed extra line-breaks from MFD driver and Makefile
  - fixed RTC patch subject line (added missing colon)
  - included a patch which adds compatible for ROHM BD71850 PMIC

Changelog v6:
  Rebased on top of v5.5-rc1
  LED core:
    - Do new fw-node look-up only if the new match data is given. That
      way behaviour for existing drivers is not changed
    - Handle generic LED properties by core only if explisitly requested
      in init-data. That way behaviour for existing drivers is not changed
      until they are verified to work.
  BD71828 LEDs:
    - Fix module loading by adding "dummy" of_device_id table.
  DT bindings:
    All:
    - Remove regulator run-level properties as run-level support was
      dropped for now.
    - Change SPDX to dual lisence
    LED:
    - added select: false
    - replace oneOf + const by enum
    Regulator:
    - remove forgotten comments
    - comment indenting
    MFD:
    - remove unnecessary descriptions
  Regulators:
    - Dropped patch 12 with run-level controls
    - Dropped unnecessary ramp_delay_supported() - ram_delay ops were
      already only filled for DVS bucks.
  GPIO:
    - rename internal function.
  RTC:
    - Added missing blank line
  
Changelog v5:
  Only LED patch (patch 15) changed, rest as in v4.
  LED:
    - Fixed issues reported by Dan Carpenter and kbuild-bot static
      analysis.
Changelog v4 (first non RFC):
  General:
    - Changed subdevice loading and chip version identification to use
      platform ID.
    - License identifiers changed to GPL-2.0-only
  MFD:
    - Styling fixes mostly
  DT-Bindings:
    - a few more checks as suggested by Rob Herring.
    - Order of DT patches changed.
    - me as maintainer
    - standard units to new properties (microvolts, ohms)
    - runlevel values in an array
  LED:
    - BD71828 driver added (back)
      - Added DT support
    - Added LED DT node lookup in led framework when init_data is given
      with DT node match information.
    - Added common property parsing for default-state and
      default-trigger.
  Regulators:
    - dropped sysfs interfaces
    - fixed module unload/reload by binding gpio consumer information to
      regulator device not to MFD.
  GPIO:
    - Added devm_gpiod_get_parent_array
    - added few missing devm functions to documentation

Changelog v3:
  DT-Bindings:
    - yamlify
    - add LED binding doc
  CLK:
    - Move clk register definitions from MFD headers to clk driver
  GPIO:
    - Add generic direction define and use it.
  LED:
    - Drop LED driver from the series (for now).

Changelog v2: Mainly RTC and GPIO fixes suggested by Alexandre and Bartosz
  General:
    -Patch ordering changed to provide dt binding documents right after the
     MFD core.
  DT-Bindings for regulators (Patch 3)
    -Fix typo in PMIC model number
  RTC (patch 11)
    -Reverted renaming in order to reduce patch size.
    -Reworded commit message
  BD71828 regulator (patch 7)
    -Add MODULE_ALIAS
  GPIO (patch 12)
    -Remove file-name from comment
    -prefix IN and OUT defines with chip type
    -improved documentation for the INPUT only pin.
    -removed empty left-over function
    -removed unnecessary #ifdef CONFIG_OF_GPIO
    -removed unnecessary error print
    -Add MODULE_ALIAS

Patch 1:
        dt-bindings for LEDs on BD71828 PMIC
Patch 2:
	dt-bindings for BD71828 PMIC
Patch 3:
	Convert rohm PMICs with common sub-devices to use platform_
	device_id to match MFD sub-devices
Patch 4:
	Add compatible for BD71850
Patch 5:
        BD71828 MFD core.
Patch 6:
	Power button support using GPIO keys.
Patch 7:
        CLK gate support using existing clk-bd718x7
Patch 8:
        Split existing bd718x7 regulator driver to generic ROHM dt
        parsing portion (used by more than one ROHM drivers) and
        bd718x8 specific parts
Patch 9:
        Fix BD70528 RTC HOUR mask
Patch 10:
        Support BD71828 RTC block using BD70528 RTC driver
Patch 11:
        Allow control of GP(I)O pins on BD71828 via GPIO subsystem

---


Matti Vaittinen (10):
  dt-bindings: leds: ROHM BD71282 PMIC LED driver
  dt-bindings: mfd: Document ROHM BD71828 bindings
  mfd: rohm PMICs - use platform_device_id to match MFD sub-devices
  mfd: bd718x7: Add compatible for BD71850
  mfd: bd71828: Support ROHM BD71828 PMIC - core
  mfd: bd71828: Add power-key support
  clk: bd718x7: Support ROHM BD71828 clk block
  regulator: bd718x7: Split driver to common and bd718x7 specific parts
  mfd: bd70528: Fix hour register mask
  rtc: bd70528: add BD71828 support

 .../bindings/leds/rohm,bd71828-leds.yaml      |  52 +++
 .../bindings/mfd/rohm,bd71828-pmic.yaml       | 193 ++++++++
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-bd718x7.c                     |  50 ++-
 drivers/mfd/Kconfig                           |  15 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd70528.c                    |   3 +-
 drivers/mfd/rohm-bd71828.c                    | 344 ++++++++++++++
 drivers/mfd/rohm-bd718x7.c                    |  43 +-
 drivers/regulator/Kconfig                     |   4 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd718x7-regulator.c         | 200 +++------
 drivers/regulator/rohm-regulator.c            |  95 ++++
 drivers/rtc/Kconfig                           |   3 +-
 drivers/rtc/rtc-bd70528.c                     | 220 +++++++--
 include/linux/mfd/rohm-bd70528.h              |  19 +-
 include/linux/mfd/rohm-bd71828.h              | 423 ++++++++++++++++++
 include/linux/mfd/rohm-bd718x7.h              |   6 -
 include/linux/mfd/rohm-generic.h              |  70 ++-
 include/linux/mfd/rohm-shared.h               |  21 +
 20 files changed, 1546 insertions(+), 223 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
 create mode 100644 drivers/mfd/rohm-bd71828.c
 create mode 100644 drivers/regulator/rohm-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71828.h
 create mode 100644 include/linux/mfd/rohm-shared.h


base-commit: b3a987b0264d ("Linux 5.5-rc6")
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
