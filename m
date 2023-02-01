Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173FA685DD0
	for <lists+linux-doc@lfdr.de>; Wed,  1 Feb 2023 04:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjBADTF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Jan 2023 22:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjBADTF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 22:19:05 -0500
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3AEF648A12;
        Tue, 31 Jan 2023 19:18:51 -0800 (PST)
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
        LIVER,40,3)
Received: from 192.168.10.47
        by mg.richtek.com with MailGates ESMTP Server V5.0(17471:0:AUTH_RELAY)
        (envelope-from <chiaen_wu@richtek.com>); Wed, 01 Feb 2023 11:18:27 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 1 Feb
 2023 11:18:26 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Wed, 1 Feb 2023 11:18:26 +0800
From:   ChiaEn Wu <chiaen_wu@richtek.com>
To:     <corbet@lwn.net>, <pavel@ucw.cz>, <lee@kernel.org>,
        <matthias.bgg@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <jacek.anaszewski@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <peterwu.pub@gmail.com>,
        <cy_huang@richtek.com>, <linux-leds@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <szunichen@gmail.com>,
        Alice Chen <alice_chen@richtek.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>
Subject: [PATCH v17 1/3] leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator support
Date:   Wed, 1 Feb 2023 11:17:27 +0800
Message-ID: <722bf19116258aee9fb184ea674a63eb28ecfd3c.1675246896.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675246896.git.chiaen_wu@richtek.com>
References: <cover.1675246896.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

The MediaTek MT6370 is a highly-integrated smart power management IC,
which includes a single cell Li-Ion/Li-Polymer switching battery
charger, a USB Type-C & Power Delivery (PD) controller, dual
Flash LED current sources, a RGB LED driver, a backlight WLED driver,
a display bias driver and a general LDO for portable devices.

Add support for the MediaTek MT6370 Current Sink Type LED Indicator
driver. It can control four channels current-sink RGB LEDs with 3 modes:
constant current, PWM, and breath mode.

Co-developed-by: Alice Chen <alice_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Alice Chen <alice_chen@richtek.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
v17
- Update the year of Copyright from 2022 to 2023

---
 drivers/leds/rgb/Kconfig           |   13 +
 drivers/leds/rgb/Makefile          |    1 +
 drivers/leds/rgb/leds-mt6370-rgb.c | 1009 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1023 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-mt6370-rgb.c

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 204cf47..7d86bb2 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -26,4 +26,17 @@ config LEDS_QCOM_LPG
 
 	  If compiled as a module, the module will be named leds-qcom-lpg.
 
+config LEDS_MT6370_RGB
+	tristate "LED Support for MediaTek MT6370 PMIC"
+	depends on MFD_MT6370
+	select LINEAR_RANGE
+	help
+	  Say Y here to enable support for MT6370_RGB LED device.
+	  In MT6370, there are four channel current-sink LED drivers that
+	  support hardware pattern for constant current, PWM, and breath mode.
+	  Isink4 channel can also be used as a CHG_VIN power good indicator.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "leds-mt6370-rgb".
+
 endif # LEDS_CLASS_MULTICOLOR
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index 0675bc0..8c01daf 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
+obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370-rgb.o
diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
new file mode 100644
index 00000000..2a5d582
--- /dev/null
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -0,0 +1,1009 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Richtek Technology Corp.
+ *
+ * Authors:
+ *   ChiYuan Huang <cy_huang@richtek.com>
+ *   Alice Chen <alice_chen@richtek.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/linear_range.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/util_macros.h>
+
+#include <asm/unaligned.h>
+
+enum {
+	MT6370_LED_ISNK1 = 0,
+	MT6370_LED_ISNK2,
+	MT6370_LED_ISNK3,
+	MT6370_LED_ISNK4,
+	MT6370_MAX_LEDS
+};
+
+enum mt6370_led_mode {
+	MT6370_LED_PWM_MODE = 0,
+	MT6370_LED_BREATH_MODE,
+	MT6370_LED_REG_MODE,
+	MT6370_LED_MAX_MODE
+};
+
+enum mt6370_led_field {
+	F_RGB_EN = 0,
+	F_CHGIND_EN,
+	F_LED1_CURR,
+	F_LED2_CURR,
+	F_LED3_CURR,
+	F_LED4_CURR,
+	F_LED1_MODE,
+	F_LED2_MODE,
+	F_LED3_MODE,
+	F_LED4_MODE,
+	F_LED1_DUTY,
+	F_LED2_DUTY,
+	F_LED3_DUTY,
+	F_LED4_DUTY,
+	F_LED1_FREQ,
+	F_LED2_FREQ,
+	F_LED3_FREQ,
+	F_LED4_FREQ,
+	F_MAX_FIELDS
+};
+
+enum mt6370_led_ranges {
+	R_LED123_CURR = 0,
+	R_LED4_CURR,
+	R_LED_TRFON,
+	R_LED_TOFF,
+	R_MAX_RANGES
+};
+
+enum mt6370_pattern {
+	P_LED_TR1 = 0,
+	P_LED_TR2,
+	P_LED_TF1,
+	P_LED_TF2,
+	P_LED_TON,
+	P_LED_TOFF,
+	P_MAX_PATTERNS
+};
+
+#define MT6370_REG_DEV_INFO			0x100
+#define MT6370_REG_RGB1_DIM			0x182
+#define MT6370_REG_RGB2_DIM			0x183
+#define MT6370_REG_RGB3_DIM			0x184
+#define MT6370_REG_RGB_EN			0x185
+#define MT6370_REG_RGB1_ISNK			0x186
+#define MT6370_REG_RGB2_ISNK			0x187
+#define MT6370_REG_RGB3_ISNK			0x188
+#define MT6370_REG_RGB1_TR			0x189
+#define MT6370_REG_RGB_CHRIND_DIM		0x192
+#define MT6370_REG_RGB_CHRIND_CTRL		0x193
+#define MT6370_REG_RGB_CHRIND_TR		0x194
+
+#define MT6372_REG_RGB_EN			0x182
+#define MT6372_REG_RGB1_ISNK			0x183
+#define MT6372_REG_RGB2_ISNK			0x184
+#define MT6372_REG_RGB3_ISNK			0x185
+#define MT6372_REG_RGB4_ISNK			0x186
+#define MT6372_REG_RGB1_DIM			0x187
+#define MT6372_REG_RGB2_DIM			0x188
+#define MT6372_REG_RGB3_DIM			0x189
+#define MT6372_REG_RGB4_DIM			0x18A
+#define MT6372_REG_RGB12_FREQ			0x18B
+#define MT6372_REG_RGB34_FREQ			0x18C
+#define MT6372_REG_RGB1_TR			0x18D
+
+#define MT6370_VENID_MASK			GENMASK(7, 4)
+#define MT6370_CHEN_BIT(id)			BIT(MT6370_LED_ISNK4 - id)
+#define MT6370_VIRTUAL_MULTICOLOR		5
+#define MC_CHANNEL_NUM				3
+#define MT6370_PWM_DUTY				(BIT(5) - 1)
+#define MT6372_PWM_DUTY				(BIT(8) - 1)
+
+struct mt6370_led {
+	/*
+	 * If the color of the LED in DT is set to
+	 *   - 'LED_COLOR_ID_RGB'
+	 *   - 'LED_COLOR_ID_MULTI'
+	 * The member 'index' of this struct will be set to
+	 * 'MT6370_VIRTUAL_MULTICOLOR'.
+	 * If so, this LED will choose 'struct led_classdev_mc mc' to use.
+	 * Instead, if the member 'index' of this struct is set to
+	 * 'MT6370_LED_ISNK1' ~ 'MT6370_LED_ISNK4', then this LED will choose
+	 * 'struct led_classdev isink' to use.
+	 */
+	union {
+		struct led_classdev isink;
+		struct led_classdev_mc mc;
+	};
+	struct mt6370_priv *priv;
+	enum led_default_state default_state;
+	u32 index;
+};
+
+struct mt6370_pdata {
+	const unsigned int *tfreq;
+	unsigned int tfreq_len;
+	u16 reg_rgb1_tr;
+	s16 reg_rgb_chrind_tr;
+	u8 pwm_duty;
+};
+
+struct mt6370_priv {
+	/* Per LED access lock */
+	struct mutex lock;
+	struct regmap *regmap;
+	struct regmap_field *fields[F_MAX_FIELDS];
+	const struct reg_field *reg_fields;
+	const struct linear_range *ranges;
+	struct reg_cfg *reg_cfgs;
+	const struct mt6370_pdata *pdata;
+	unsigned int leds_count;
+	unsigned int leds_active;
+	struct mt6370_led leds[];
+};
+
+static const struct reg_field common_reg_fields[F_MAX_FIELDS] = {
+	[F_RGB_EN]	= REG_FIELD(MT6370_REG_RGB_EN, 4, 7),
+	[F_CHGIND_EN]	= REG_FIELD(MT6370_REG_RGB_CHRIND_DIM, 7, 7),
+	[F_LED1_CURR]	= REG_FIELD(MT6370_REG_RGB1_ISNK, 0, 2),
+	[F_LED2_CURR]	= REG_FIELD(MT6370_REG_RGB2_ISNK, 0, 2),
+	[F_LED3_CURR]	= REG_FIELD(MT6370_REG_RGB3_ISNK, 0, 2),
+	[F_LED4_CURR]	= REG_FIELD(MT6370_REG_RGB_CHRIND_CTRL, 0, 1),
+	[F_LED1_MODE]	= REG_FIELD(MT6370_REG_RGB1_DIM, 5, 6),
+	[F_LED2_MODE]	= REG_FIELD(MT6370_REG_RGB2_DIM, 5, 6),
+	[F_LED3_MODE]	= REG_FIELD(MT6370_REG_RGB3_DIM, 5, 6),
+	[F_LED4_MODE]	= REG_FIELD(MT6370_REG_RGB_CHRIND_DIM, 5, 6),
+	[F_LED1_DUTY]	= REG_FIELD(MT6370_REG_RGB1_DIM, 0, 4),
+	[F_LED2_DUTY]	= REG_FIELD(MT6370_REG_RGB2_DIM, 0, 4),
+	[F_LED3_DUTY]	= REG_FIELD(MT6370_REG_RGB3_DIM, 0, 4),
+	[F_LED4_DUTY]	= REG_FIELD(MT6370_REG_RGB_CHRIND_DIM, 0, 4),
+	[F_LED1_FREQ]	= REG_FIELD(MT6370_REG_RGB1_ISNK, 3, 5),
+	[F_LED2_FREQ]	= REG_FIELD(MT6370_REG_RGB2_ISNK, 3, 5),
+	[F_LED3_FREQ]	= REG_FIELD(MT6370_REG_RGB3_ISNK, 3, 5),
+	[F_LED4_FREQ]	= REG_FIELD(MT6370_REG_RGB_CHRIND_CTRL, 2, 4),
+};
+
+static const struct reg_field mt6372_reg_fields[F_MAX_FIELDS] = {
+	[F_RGB_EN]	= REG_FIELD(MT6372_REG_RGB_EN, 4, 7),
+	[F_CHGIND_EN]	= REG_FIELD(MT6372_REG_RGB_EN, 3, 3),
+	[F_LED1_CURR]	= REG_FIELD(MT6372_REG_RGB1_ISNK, 0, 3),
+	[F_LED2_CURR]	= REG_FIELD(MT6372_REG_RGB2_ISNK, 0, 3),
+	[F_LED3_CURR]	= REG_FIELD(MT6372_REG_RGB3_ISNK, 0, 3),
+	[F_LED4_CURR]	= REG_FIELD(MT6372_REG_RGB4_ISNK, 0, 3),
+	[F_LED1_MODE]	= REG_FIELD(MT6372_REG_RGB1_ISNK, 6, 7),
+	[F_LED2_MODE]	= REG_FIELD(MT6372_REG_RGB2_ISNK, 6, 7),
+	[F_LED3_MODE]	= REG_FIELD(MT6372_REG_RGB3_ISNK, 6, 7),
+	[F_LED4_MODE]	= REG_FIELD(MT6372_REG_RGB4_ISNK, 6, 7),
+	[F_LED1_DUTY]	= REG_FIELD(MT6372_REG_RGB1_DIM, 0, 7),
+	[F_LED2_DUTY]	= REG_FIELD(MT6372_REG_RGB2_DIM, 0, 7),
+	[F_LED3_DUTY]	= REG_FIELD(MT6372_REG_RGB3_DIM, 0, 7),
+	[F_LED4_DUTY]	= REG_FIELD(MT6372_REG_RGB4_DIM, 0, 7),
+	[F_LED1_FREQ]	= REG_FIELD(MT6372_REG_RGB12_FREQ, 5, 7),
+	[F_LED2_FREQ]	= REG_FIELD(MT6372_REG_RGB12_FREQ, 2, 4),
+	[F_LED3_FREQ]	= REG_FIELD(MT6372_REG_RGB34_FREQ, 5, 7),
+	[F_LED4_FREQ]	= REG_FIELD(MT6372_REG_RGB34_FREQ, 2, 4),
+};
+
+/* Current unit: microamp, time unit: millisecond */
+static const struct linear_range common_led_ranges[R_MAX_RANGES] = {
+	[R_LED123_CURR]	= { 4000, 1, 6, 4000 },
+	[R_LED4_CURR]	= { 2000, 1, 3, 2000 },
+	[R_LED_TRFON]	= { 125, 0, 15, 200 },
+	[R_LED_TOFF]	= { 250, 0, 15, 400 },
+};
+
+static const struct linear_range mt6372_led_ranges[R_MAX_RANGES] = {
+	[R_LED123_CURR]	= { 2000, 1, 14, 2000 },
+	[R_LED4_CURR]	= { 2000, 1, 14, 2000 },
+	[R_LED_TRFON]	= { 125, 0, 15, 250 },
+	[R_LED_TOFF]	= { 250, 0, 15, 500 },
+};
+
+static const unsigned int common_tfreqs[] = {
+	10000, 5000, 2000, 1000, 500, 200, 5, 1,
+};
+
+static const unsigned int mt6372_tfreqs[] = {
+	8000, 4000, 2000, 1000, 500, 250, 8, 4,
+};
+
+static const struct mt6370_pdata common_pdata = {
+	.tfreq = common_tfreqs,
+	.tfreq_len = ARRAY_SIZE(common_tfreqs),
+	.pwm_duty = MT6370_PWM_DUTY,
+	.reg_rgb1_tr = MT6370_REG_RGB1_TR,
+	.reg_rgb_chrind_tr = MT6370_REG_RGB_CHRIND_TR,
+};
+
+static const struct mt6370_pdata mt6372_pdata = {
+	.tfreq = mt6372_tfreqs,
+	.tfreq_len = ARRAY_SIZE(mt6372_tfreqs),
+	.pwm_duty = MT6372_PWM_DUTY,
+	.reg_rgb1_tr = MT6372_REG_RGB1_TR,
+	.reg_rgb_chrind_tr = -1,
+};
+
+static enum mt6370_led_field mt6370_get_led_current_field(unsigned int led_no)
+{
+	switch (led_no) {
+	case MT6370_LED_ISNK1:
+		return F_LED1_CURR;
+	case MT6370_LED_ISNK2:
+		return F_LED2_CURR;
+	case MT6370_LED_ISNK3:
+		return F_LED3_CURR;
+	default:
+		return F_LED4_CURR;
+	}
+}
+
+static int mt6370_set_led_brightness(struct mt6370_priv *priv,
+				     unsigned int led_no, unsigned int level)
+{
+	enum mt6370_led_field sel_field;
+
+	sel_field = mt6370_get_led_current_field(led_no);
+
+	return regmap_field_write(priv->fields[sel_field], level);
+}
+
+static int mt6370_get_led_brightness(struct mt6370_priv *priv,
+				     unsigned int led_no, unsigned int *level)
+{
+	enum mt6370_led_field sel_field;
+
+	sel_field = mt6370_get_led_current_field(led_no);
+
+	return regmap_field_read(priv->fields[sel_field], level);
+}
+
+static int mt6370_set_led_duty(struct mt6370_priv *priv, unsigned int led_no,
+			       unsigned int ton, unsigned int toff)
+{
+	const struct mt6370_pdata *pdata = priv->pdata;
+	enum mt6370_led_field sel_field;
+	unsigned int divisor, ratio;
+
+	divisor = pdata->pwm_duty;
+	ratio = ton * divisor / (ton + toff);
+
+	switch (led_no) {
+	case MT6370_LED_ISNK1:
+		sel_field = F_LED1_DUTY;
+		break;
+	case MT6370_LED_ISNK2:
+		sel_field = F_LED2_DUTY;
+		break;
+	case MT6370_LED_ISNK3:
+		sel_field = F_LED3_DUTY;
+		break;
+	default:
+		sel_field = F_LED4_DUTY;
+		break;
+	}
+
+	return regmap_field_write(priv->fields[sel_field], ratio);
+}
+
+static int mt6370_set_led_freq(struct mt6370_priv *priv, unsigned int led_no,
+			       unsigned int ton, unsigned int toff)
+{
+	const struct mt6370_pdata *pdata = priv->pdata;
+	enum mt6370_led_field sel_field;
+	unsigned int tfreq_len = pdata->tfreq_len;
+	unsigned int tsum, sel;
+
+	tsum = ton + toff;
+
+	if (tsum > pdata->tfreq[0] || tsum < pdata->tfreq[tfreq_len - 1])
+		return -EOPNOTSUPP;
+
+	sel = find_closest_descending(tsum, pdata->tfreq, tfreq_len);
+
+	switch (led_no) {
+	case MT6370_LED_ISNK1:
+		sel_field = F_LED1_FREQ;
+		break;
+	case MT6370_LED_ISNK2:
+		sel_field = F_LED2_FREQ;
+		break;
+	case MT6370_LED_ISNK3:
+		sel_field = F_LED3_FREQ;
+		break;
+	default:
+		sel_field = F_LED4_FREQ;
+		break;
+	}
+
+	return regmap_field_write(priv->fields[sel_field], sel);
+}
+
+static void mt6370_get_breath_reg_base(struct mt6370_priv *priv,
+				       unsigned int led_no, unsigned int *base)
+{
+	const struct mt6370_pdata *pdata = priv->pdata;
+
+	if (pdata->reg_rgb_chrind_tr < 0) {
+		*base = pdata->reg_rgb1_tr + led_no * 3;
+		return;
+	}
+
+	switch (led_no) {
+	case MT6370_LED_ISNK1:
+	case MT6370_LED_ISNK2:
+	case MT6370_LED_ISNK3:
+		*base = pdata->reg_rgb1_tr + led_no * 3;
+		break;
+	default:
+		*base = pdata->reg_rgb_chrind_tr;
+		break;
+	}
+}
+
+static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
+				     struct led_pattern *pattern, u32 len,
+				     u8 *pattern_val, u32 val_len)
+{
+	enum mt6370_led_ranges sel_range;
+	struct led_pattern *curr;
+	unsigned int sel;
+	u32 val = 0;
+	int i;
+
+	if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
+		return -EINVAL;
+
+	/*
+	 * Pattern list
+	 * tr1:	 byte 0, b'[7: 4]
+	 * tr2:	 byte 0, b'[3: 0]
+	 * tf1:	 byte 1, b'[7: 4]
+	 * tf2:	 byte 1, b'[3: 0]
+	 * ton:	 byte 2, b'[7: 4]
+	 * toff: byte 2, b'[3: 0]
+	 */
+	for (i = 0; i < P_MAX_PATTERNS; i++) {
+		curr = pattern + i;
+
+		sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
+
+		linear_range_get_selector_within(priv->ranges + sel_range,
+						 curr->delta_t, &sel);
+
+		if (i % 2) {
+			val |= sel;
+		} else {
+			val <<= 8;
+			val |= sel << 4;
+		}
+	}
+
+	put_unaligned_be24(val, pattern_val);
+
+	return 0;
+}
+
+static int mt6370_set_led_mode(struct mt6370_priv *priv, unsigned int led_no,
+			       enum mt6370_led_mode mode)
+{
+	enum mt6370_led_field sel_field;
+
+	switch (led_no) {
+	case MT6370_LED_ISNK1:
+		sel_field = F_LED1_MODE;
+		break;
+	case MT6370_LED_ISNK2:
+		sel_field = F_LED2_MODE;
+		break;
+	case MT6370_LED_ISNK3:
+		sel_field = F_LED3_MODE;
+		break;
+	default:
+		sel_field = F_LED4_MODE;
+		break;
+	}
+
+	return regmap_field_write(priv->fields[sel_field], mode);
+}
+
+static int mt6370_mc_brightness_set(struct led_classdev *lcdev,
+				    enum led_brightness level)
+{
+	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
+	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
+	struct mt6370_priv *priv = led->priv;
+	struct mc_subled *subled;
+	unsigned int enable, disable;
+	int i, ret;
+
+	mutex_lock(&priv->lock);
+
+	led_mc_calc_color_components(mccdev, level);
+
+	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
+	if (ret)
+		goto out_unlock;
+
+	disable = enable;
+
+	for (i = 0; i < mccdev->num_colors; i++) {
+		u32 brightness;
+
+		subled = mccdev->subled_info + i;
+		brightness = min(subled->brightness, lcdev->max_brightness);
+		disable &= ~MT6370_CHEN_BIT(subled->channel);
+
+		if (level == 0) {
+			enable &= ~MT6370_CHEN_BIT(subled->channel);
+
+			ret = mt6370_set_led_mode(priv, subled->channel,
+						  MT6370_LED_REG_MODE);
+			if (ret)
+				goto out_unlock;
+
+			continue;
+		}
+
+		if (brightness == 0) {
+			enable &= ~MT6370_CHEN_BIT(subled->channel);
+			continue;
+		}
+
+		enable |= MT6370_CHEN_BIT(subled->channel);
+
+		ret = mt6370_set_led_brightness(priv, subled->channel,
+						brightness);
+		if (ret)
+			goto out_unlock;
+	}
+
+	ret = regmap_field_write(priv->fields[F_RGB_EN], disable);
+	if (ret)
+		goto out_unlock;
+
+	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
+
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int mt6370_mc_blink_set(struct led_classdev *lcdev,
+			       unsigned long *delay_on,
+			       unsigned long *delay_off)
+{
+	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
+	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
+	struct mt6370_priv *priv = led->priv;
+	struct mc_subled *subled;
+	unsigned int enable, disable;
+	int i, ret;
+
+	mutex_lock(&priv->lock);
+
+	if (!*delay_on && !*delay_off)
+		*delay_on = *delay_off = 500;
+
+	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
+	if (ret)
+		goto out_unlock;
+
+	disable = enable;
+
+	for (i = 0; i < mccdev->num_colors; i++) {
+		subled = mccdev->subled_info + i;
+
+		disable &= ~MT6370_CHEN_BIT(subled->channel);
+
+		ret = mt6370_set_led_duty(priv, subled->channel, *delay_on,
+					  *delay_off);
+		if (ret)
+			goto out_unlock;
+
+		ret = mt6370_set_led_freq(priv, subled->channel, *delay_on,
+					  *delay_off);
+		if (ret)
+			goto out_unlock;
+
+		ret = mt6370_set_led_mode(priv, subled->channel,
+					  MT6370_LED_PWM_MODE);
+		if (ret)
+			goto out_unlock;
+	}
+
+	/* Toggle to make pattern timing the same */
+	ret = regmap_field_write(priv->fields[F_RGB_EN], disable);
+	if (ret)
+		goto out_unlock;
+
+	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
+
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int mt6370_mc_pattern_set(struct led_classdev *lcdev,
+			struct led_pattern *pattern, u32 len, int repeat)
+{
+	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
+	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
+	struct mt6370_priv *priv = led->priv;
+	struct mc_subled *subled;
+	unsigned int reg_base, enable, disable;
+	u8 params[P_MAX_PATTERNS / 2];
+	int i, ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = mt6370_gen_breath_pattern(priv, pattern, len, params,
+					sizeof(params));
+	if (ret)
+		goto out_unlock;
+
+	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
+	if (ret)
+		goto out_unlock;
+
+	disable = enable;
+
+	for (i = 0; i < mccdev->num_colors; i++) {
+		subled = mccdev->subled_info + i;
+
+		mt6370_get_breath_reg_base(priv, subled->channel, &reg_base);
+		disable &= ~MT6370_CHEN_BIT(subled->channel);
+
+		ret = regmap_raw_write(priv->regmap, reg_base, params,
+				       sizeof(params));
+		if (ret)
+			goto out_unlock;
+
+		ret = mt6370_set_led_mode(priv, subled->channel,
+					  MT6370_LED_BREATH_MODE);
+		if (ret)
+			goto out_unlock;
+	}
+
+	/* Toggle to make pattern timing be the same */
+	ret = regmap_field_write(priv->fields[F_RGB_EN], disable);
+	if (ret)
+		goto out_unlock;
+
+	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
+
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
+{
+	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
+	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
+	struct mt6370_priv *priv = led->priv;
+	struct mc_subled *subled;
+	int i, ret;
+
+	mutex_lock(&led->priv->lock);
+
+	for (i = 0; i < mccdev->num_colors; i++) {
+		subled = mccdev->subled_info + i;
+
+		ret = mt6370_set_led_mode(priv, subled->channel,
+					  MT6370_LED_REG_MODE);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static int mt6370_isnk_brightness_set(struct led_classdev *lcdev,
+				      enum led_brightness level)
+{
+	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
+	struct mt6370_priv *priv = led->priv;
+	unsigned int enable;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
+	if (ret)
+		goto out_unlock;
+
+	if (level == 0) {
+		enable &= ~MT6370_CHEN_BIT(led->index);
+
+		ret = mt6370_set_led_mode(priv, led->index,
+					  MT6370_LED_REG_MODE);
+		if (ret)
+			goto out_unlock;
+	} else {
+		enable |= MT6370_CHEN_BIT(led->index);
+
+		ret = mt6370_set_led_brightness(priv, led->index, level);
+		if (ret)
+			goto out_unlock;
+	}
+
+	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
+
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int mt6370_isnk_blink_set(struct led_classdev *lcdev,
+				 unsigned long *delay_on,
+				 unsigned long *delay_off)
+{
+	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
+	struct mt6370_priv *priv = led->priv;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	if (!*delay_on && !*delay_off)
+		*delay_on = *delay_off = 500;
+
+	ret = mt6370_set_led_duty(priv, led->index, *delay_on, *delay_off);
+	if (ret)
+		goto out_unlock;
+
+	ret = mt6370_set_led_freq(priv, led->index, *delay_on, *delay_off);
+	if (ret)
+		goto out_unlock;
+
+	ret = mt6370_set_led_mode(priv, led->index, MT6370_LED_PWM_MODE);
+
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int mt6370_isnk_pattern_set(struct led_classdev *lcdev,
+				   struct led_pattern *pattern, u32 len,
+				   int repeat)
+{
+	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
+	struct mt6370_priv *priv = led->priv;
+	unsigned int reg_base;
+	u8 params[P_MAX_PATTERNS / 2];
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = mt6370_gen_breath_pattern(priv, pattern, len, params,
+					sizeof(params));
+	if (ret)
+		goto out_unlock;
+
+	mt6370_get_breath_reg_base(priv, led->index, &reg_base);
+
+	ret = regmap_raw_write(priv->regmap, reg_base, params, sizeof(params));
+	if (ret)
+		goto out_unlock;
+
+	ret = mt6370_set_led_mode(priv, led->index, MT6370_LED_BREATH_MODE);
+
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static inline int mt6370_isnk_pattern_clear(struct led_classdev *lcdev)
+{
+	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
+	struct mt6370_priv *priv = led->priv;
+	int ret;
+
+	mutex_lock(&led->priv->lock);
+	ret = mt6370_set_led_mode(priv, led->index, MT6370_LED_REG_MODE);
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static int mt6370_init_led_properties(struct device *dev,
+				      struct mt6370_led *led,
+				      struct led_init_data *init_data)
+{
+	struct mt6370_priv *priv = led->priv;
+	struct led_classdev *lcdev;
+	struct fwnode_handle *child;
+	enum mt6370_led_ranges sel_range;
+	u32 max_uA, max_level;
+	int ret;
+
+	if (led->index == MT6370_VIRTUAL_MULTICOLOR) {
+		struct mc_subled *sub_led;
+		u32 num_color = 0;
+
+		sub_led = devm_kcalloc(dev, MC_CHANNEL_NUM, sizeof(*sub_led),
+				       GFP_KERNEL);
+		if (!sub_led)
+			return -ENOMEM;
+
+		fwnode_for_each_child_node(init_data->fwnode, child) {
+			u32 reg, color;
+
+			ret = fwnode_property_read_u32(child, "reg", &reg);
+			if (ret || reg > MT6370_LED_ISNK3 ||
+			    priv->leds_active & BIT(reg)) {
+				fwnode_handle_put(child);
+				return -EINVAL;
+			}
+
+			ret = fwnode_property_read_u32(child, "color", &color);
+			if (ret) {
+				fwnode_handle_put(child);
+				return dev_err_probe(dev, ret, "LED %d, no color specified\n",
+						     led->index);
+			}
+
+			priv->leds_active |= BIT(reg);
+			sub_led[num_color].color_index = color;
+			sub_led[num_color].channel = reg;
+			sub_led[num_color].intensity = 0;
+			num_color++;
+		}
+
+		if (num_color < 2)
+			return dev_err_probe(dev, -EINVAL,
+					     "Multicolor must include 2 or more LED channels\n");
+
+		led->mc.num_colors = num_color;
+		led->mc.subled_info = sub_led;
+
+		lcdev = &led->mc.led_cdev;
+		lcdev->brightness_set_blocking = mt6370_mc_brightness_set;
+		lcdev->blink_set = mt6370_mc_blink_set;
+		lcdev->pattern_set = mt6370_mc_pattern_set;
+		lcdev->pattern_clear = mt6370_mc_pattern_clear;
+	} else {
+		lcdev = &led->isink;
+		lcdev->brightness_set_blocking = mt6370_isnk_brightness_set;
+		lcdev->blink_set = mt6370_isnk_blink_set;
+		lcdev->pattern_set = mt6370_isnk_pattern_set;
+		lcdev->pattern_clear = mt6370_isnk_pattern_clear;
+	}
+
+	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp",
+				       &max_uA);
+	if (ret) {
+		dev_warn(dev, "Not specified led-max-microamp, config to the minimum\n");
+		max_uA = 0;
+	}
+
+	if (led->index == MT6370_LED_ISNK4)
+		sel_range = R_LED4_CURR;
+	else
+		sel_range = R_LED123_CURR;
+
+	linear_range_get_selector_within(priv->ranges + sel_range, max_uA,
+					 &max_level);
+
+	lcdev->max_brightness = max_level;
+
+	led->default_state = led_init_default_state_get(init_data->fwnode);
+
+	return 0;
+}
+
+static int mt6370_isnk_init_default_state(struct mt6370_led *led)
+{
+	struct mt6370_priv *priv = led->priv;
+	unsigned int enable, level;
+	int ret;
+
+	ret = mt6370_get_led_brightness(priv, led->index, &level);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
+	if (ret)
+		return ret;
+
+	if (!(enable & MT6370_CHEN_BIT(led->index)))
+		level = 0;
+
+	switch (led->default_state) {
+	case LEDS_DEFSTATE_ON:
+		led->isink.brightness = led->isink.max_brightness;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		led->isink.brightness = min(level, led->isink.max_brightness);
+		break;
+	default:
+		led->isink.brightness = 0;
+		break;
+	}
+
+	return mt6370_isnk_brightness_set(&led->isink, led->isink.brightness);
+}
+
+static int mt6370_led_register(struct device *dev, struct mt6370_led *led,
+			       struct led_init_data *init_data)
+{
+	struct mt6370_priv *priv = led->priv;
+	int ret;
+
+	if (led->index == MT6370_VIRTUAL_MULTICOLOR) {
+		ret = mt6370_mc_brightness_set(&led->mc.led_cdev, 0);
+		if (ret)
+			return dev_err_probe(dev, ret, "Couldn't set multicolor brightness\n");
+
+		ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc,
+								init_data);
+		if (ret)
+			return dev_err_probe(dev, ret, "Couldn't register multicolor\n");
+	} else {
+		if (led->index == MT6370_LED_ISNK4) {
+			ret = regmap_field_write(priv->fields[F_CHGIND_EN], 1);
+			if (ret)
+				return dev_err_probe(dev, ret, "Failed to set CHRIND to SW\n");
+		}
+
+		ret = mt6370_isnk_init_default_state(led);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to init %d isnk state\n",
+					     led->index);
+
+		ret = devm_led_classdev_register_ext(dev, &led->isink,
+						     init_data);
+		if (ret)
+			return dev_err_probe(dev, ret, "Couldn't register isink %d\n", led->index);
+	}
+
+	return 0;
+}
+
+static int mt6370_check_vendor_info(struct mt6370_priv *priv)
+{
+	unsigned int devinfo, vid;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &devinfo);
+	if (ret)
+		return ret;
+
+	vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
+	if (vid == 0x9 || vid == 0xb) {
+		priv->reg_fields = mt6372_reg_fields;
+		priv->ranges = mt6372_led_ranges;
+		priv->pdata = &mt6372_pdata;
+	} else {
+		/* Common for MT6370/71 */
+		priv->reg_fields = common_reg_fields;
+		priv->ranges = common_led_ranges;
+		priv->pdata = &common_pdata;
+	}
+
+	return 0;
+}
+
+static int mt6370_leds_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mt6370_priv *priv;
+	struct fwnode_handle *child;
+	size_t count;
+	unsigned int i = 0;
+	int ret;
+
+	count = device_get_child_node_count(dev);
+	if (!count || count > MT6370_MAX_LEDS)
+		return dev_err_probe(dev, -EINVAL,
+				     "No child node or node count over max LED number %zu\n",
+				      count);
+
+	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->leds_count = count;
+	mutex_init(&priv->lock);
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to check vendor info\n");
+
+	ret = devm_regmap_field_bulk_alloc(dev, priv->regmap, priv->fields,
+					   priv->reg_fields, F_MAX_FIELDS);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to allocate regmap field\n");
+
+	device_for_each_child_node(dev, child) {
+		struct mt6370_led *led = priv->leds + i++;
+		struct led_init_data init_data = { .fwnode = child };
+		u32 reg, color;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, ret, "Failed to parse reg property\n");
+		}
+
+		if (reg >= MT6370_MAX_LEDS) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, -EINVAL, "Error reg property number\n");
+		}
+
+		ret = fwnode_property_read_u32(child, "color", &color);
+		if (ret) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, ret, "Failed to parse color property\n");
+		}
+
+		if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
+			reg = MT6370_VIRTUAL_MULTICOLOR;
+
+		if (priv->leds_active & BIT(reg)) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, -EINVAL, "Duplicate reg property\n");
+		}
+
+		priv->leds_active |= BIT(reg);
+
+		led->index = reg;
+		led->priv = priv;
+
+		ret = mt6370_init_led_properties(dev, led, &init_data);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
+		}
+
+		ret = mt6370_led_register(dev, led, &init_data);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mt6370_rgbled_device_table[] = {
+	{ .compatible = "mediatek,mt6370-indicator" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_rgbled_device_table);
+
+static struct platform_driver mt6370_rgbled_driver = {
+	.driver = {
+		.name = "mt6370-indicator",
+		.of_match_table = mt6370_rgbled_device_table,
+	},
+	.probe = mt6370_leds_probe,
+};
+module_platform_driver(mt6370_rgbled_driver);
+
+MODULE_AUTHOR("Alice Chen <alice_chen@richtek.com>");
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("MediaTek MT6370 RGB LED Driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

