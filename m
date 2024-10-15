Return-Path: <linux-doc+bounces-27535-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4299E250
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 11:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27EC0283945
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 09:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DC71DDA35;
	Tue, 15 Oct 2024 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KAXVz5YS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512721D9A69
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983353; cv=none; b=nT3SbWaSEtrNdVv2djDhgQQTvZqhpiPSb5kwi9JjdF+1vfPb0+tXEXSUV3jcKsqKKqdQW4x7SututvZHZUm9FzW6cNfXALuS9cTaNtdMEtS8wrdTv1hJgiYHE0cRWSu88U/5URgQBQQyhPc8pOvBfl5/NrgnKg7ZXLD28HKusxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983353; c=relaxed/simple;
	bh=94lx/Ld+E5OpKCzIM1RHwElY0Ulkx3QoxENTPuiFl9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kz4EK91KBQ+eJFZ/bKYGrmiYx2iT9Auk6A/hWj4Lz4b5tEzIS5c8BARTF9wAACGTPX5Wii7VxScC3r8Enggir6JZUTOyEXpbX51sX9Egoe4efI95oF746xaDXGe/d/Z/MiM64LPAoTia1yhLGWyayO28LI1N0mulrE7Qlpc6qAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KAXVz5YS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2987865e87.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728983349; x=1729588149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4P9jNsfxGTdEuN0LRJp473yLVkeaSpjLa8sbBb+pIE=;
        b=KAXVz5YSDcMmApFA9KnHdXehmna9LSRDY5xVnj8Ghjq7BCI1DN1uTCWW4izN7gMJff
         Rkpg8Nn3ukm9VdU06YrqLpqv+BKbD93xgkCQVCf1+MnsxjewXBcmme6I6e3QU4N3Xdqx
         mmSohwuNT2NieMtt1LoHxbf+tI+O5sUAg2F8EKIU8fQ7LM2/KGd9UA+13jtmEJ3kr2FO
         28efpJ9RAl6EPgbn6518BR61QqENukUDz+m/xNYr2l0AptYz5it7RWZkhGrl2s/GFzOm
         gCXhBYYjkN4cdC3hNbfmYi2Dugn2QtE52cmFcMJevJ+pkQaas3nid7dk5Tnc/9XK/LCE
         adKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728983349; x=1729588149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4P9jNsfxGTdEuN0LRJp473yLVkeaSpjLa8sbBb+pIE=;
        b=XJvgi64nc7Cc+aXcBt1ANW4azQYysN6/ALXHDKLVHwKdrvJSzBVTBkFnp4Hz/37vWJ
         Ff8hNnvE8/S8iFfFNONgpLZPSDX1RoBOvv1jvi+g1rNJGheqolC7wsoEMYVEZ60QZZ20
         DDH7qwI/2AH0XYU4v6OfEqGJTMtwpN/3348fB51S22GH/NCWAF7NitYCYb09x1zisFM+
         dH0/qxDjTyk5SBhPQBhGbQcgP5IMqwdLML2XVgufjSRW0rXj2O5HmayLKW0Ay+tmVppr
         egg34lJgLTv0FkM6kTEZMJ6M6Z/aI8p7WuK4ZmyMYHQ2tPzqipilH2qH5aZjkWuiH/hP
         Q46A==
X-Forwarded-Encrypted: i=1; AJvYcCW9NIygVdD405IWcfHkxwm62auS8J6mjeBKFhtxjX6vh3bRLP6mnBOajG0xR50wmzqCLxYy6wv8EQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx96S1370Nqw5jX63I9XkqqCmw6Nw9tuGyYbD+UtVa9IzMKxZ8Z
	I3gdg6YqbDXlIvimZXKSE+XH2A7s9EDM1BkOX8lb9eBQlHI170jYdKEr0ZiVxSQ=
X-Google-Smtp-Source: AGHT+IHd8e0yHmD2HzmJcPRRsYNsSRuc0ugXHhF0fxJhFxcPmLKetgBbkAYd1+oBgEa1tGvuF19TFg==
X-Received: by 2002:a05:6512:3c95:b0:534:3cdc:dbef with SMTP id 2adb3069b0e04-539da547affmr7726602e87.43.1728983349304;
        Tue, 15 Oct 2024 02:09:09 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc123dasm1012882f8f.94.2024.10.15.02.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:09:08 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 15 Oct 2024 11:09:08 +0200
Subject: [PATCH RFC 3/4] iio: adc: ad7380: add support for adaq4370-4 and
 adaq4380-4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241015-ad7380-add-adaq4380-4-support-v1-3-d2e1a95fb248@baylibre.com>
References: <20241015-ad7380-add-adaq4380-4-support-v1-0-d2e1a95fb248@baylibre.com>
In-Reply-To: <20241015-ad7380-add-adaq4380-4-support-v1-0-d2e1a95fb248@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.1

adaq4370-4 (2MSPS) and adaq4380-4 (4MSPS) are quad-channel precision data
acquisition signal chain μModule solutions compatible with the ad738x
family, with the following differences:

- configurable gain in front of each 4 adc
- internal reference is 3V derived from refin-supply (5V)
- additional supplies

This implies that IIO_CHAN_INFO_SCALE can not be shared by type.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 116 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 112 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 15ca85c70ebd..12c19913d75d 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -13,6 +13,8 @@
  * ad7381-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/ad7381-4.pdf
  * ad7383/4-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/ad7383-4-ad7384-4.pdf
  * ad7386/7/8-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/ad7386-4-7387-4-7388-4.pdf
+ * adaq4370-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/adaq4370-4.pdf
+ * adaq4380-4 : https://www.analog.com/media/en/technical-documentation/data-sheets/adaq4380-4.pdf
  */
 
 #include <linux/align.h>
@@ -22,11 +24,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
+#include <linux/units.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -36,6 +40,8 @@
 #define MAX_NUM_CHANNELS		8
 /* 2.5V internal reference voltage */
 #define AD7380_INTERNAL_REF_MV		2500
+/* 3.3V internal reference voltage for ADAQ */
+#define ADAQ4380_INTERNAL_REF_MV	3300
 
 /* reading and writing registers is more reliable at lower than max speed */
 #define AD7380_REG_WR_SPEED_HZ		10000000
@@ -82,6 +88,7 @@
  * supports only 1 SDO line (standard SPI transaction)
  */
 #define AD7380_NUM_SDO_LINES		1
+#define AD7380_DEFAULT_GAIN_MILLI	1000
 
 struct ad7380_timing_specs {
 	const unsigned int t_csh_ns;	/* CS minimum high time */
@@ -92,10 +99,12 @@ struct ad7380_chip_info {
 	const struct iio_chan_spec *channels;
 	unsigned int num_channels;
 	unsigned int num_simult_channels;
+	bool has_hardware_gain;
 	bool has_mux;
 	const char * const *supplies;
 	unsigned int num_supplies;
 	bool external_ref_only;
+	bool adaq_internal_ref_only;
 	const char * const *vcm_supplies;
 	unsigned int num_vcm_supplies;
 	const unsigned long *available_scan_masks;
@@ -187,11 +196,12 @@ static const struct iio_scan_type ad7380_scan_type_16_u[] = {
 	},
 };
 
-#define AD7380_CHANNEL(index, bits, diff, sign) {				\
+#define _AD7380_CHANNEL(index, bits, diff, sign, gain) {			\
 	.type = IIO_VOLTAGE,							\
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |				\
+		((gain) ? BIT(IIO_CHAN_INFO_SCALE) : 0) |			\
 		((diff) ? 0 : BIT(IIO_CHAN_INFO_OFFSET)),			\
-	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |			\
+	.info_mask_shared_by_type = ((gain) ? 0 : BIT(IIO_CHAN_INFO_SCALE)) |	\
 		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),				\
 	.info_mask_shared_by_type_available =					\
 		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),				\
@@ -205,6 +215,12 @@ static const struct iio_scan_type ad7380_scan_type_16_u[] = {
 	.num_ext_scan_type = ARRAY_SIZE(ad7380_scan_type_##bits##_##sign),	\
 }
 
+#define AD7380_CHANNEL(index, bits, diff, sign)		\
+	_AD7380_CHANNEL(index, bits, diff, sign, false)
+
+#define ADAQ4380_CHANNEL(index, bits, diff, sign)	\
+	_AD7380_CHANNEL(index, bits, diff, sign, true)
+
 #define DEFINE_AD7380_2_CHANNEL(name, bits, diff, sign)	\
 static const struct iio_chan_spec name[] = {		\
 	AD7380_CHANNEL(0, bits, diff, sign),		\
@@ -221,6 +237,15 @@ static const struct iio_chan_spec name[] = {		\
 	IIO_CHAN_SOFT_TIMESTAMP(4),			\
 }
 
+#define DEFINE_ADAQ4380_4_CHANNEL(name, bits, diff, sign)	\
+static const struct iio_chan_spec name[] = {			\
+	ADAQ4380_CHANNEL(0, bits, diff, sign),			\
+	ADAQ4380_CHANNEL(1, bits, diff, sign),			\
+	ADAQ4380_CHANNEL(2, bits, diff, sign),			\
+	ADAQ4380_CHANNEL(3, bits, diff, sign),			\
+	IIO_CHAN_SOFT_TIMESTAMP(4),				\
+}
+
 #define DEFINE_AD7380_8_CHANNEL(name, bits, diff, sign)	\
 static const struct iio_chan_spec name[] = {		\
 	AD7380_CHANNEL(0, bits, diff, sign),		\
@@ -239,6 +264,7 @@ DEFINE_AD7380_2_CHANNEL(ad7380_channels, 16, 1, s);
 DEFINE_AD7380_2_CHANNEL(ad7381_channels, 14, 1, s);
 DEFINE_AD7380_4_CHANNEL(ad7380_4_channels, 16, 1, s);
 DEFINE_AD7380_4_CHANNEL(ad7381_4_channels, 14, 1, s);
+DEFINE_ADAQ4380_4_CHANNEL(adaq4380_4_channels, 16, 1, s);
 /* pseudo differential */
 DEFINE_AD7380_2_CHANNEL(ad7383_channels, 16, 0, s);
 DEFINE_AD7380_2_CHANNEL(ad7384_channels, 14, 0, s);
@@ -257,6 +283,10 @@ static const char * const ad7380_supplies[] = {
 	"vcc", "vlogic",
 };
 
+static const char * const adaq4380_supplies[] = {
+	"ldo", "vcc", "vlogic", "vs-p", "vs-n", "refin",
+};
+
 static const char * const ad7380_2_channel_vcm_supplies[] = {
 	"aina", "ainb",
 };
@@ -516,6 +546,32 @@ static const struct ad7380_chip_info ad7388_4_chip_info = {
 	.timing_specs = &ad7380_4_timing,
 };
 
+static const struct ad7380_chip_info adaq4370_4_chip_info = {
+	.name = "adaq4370-4",
+	.channels = adaq4380_4_channels,
+	.num_channels = ARRAY_SIZE(adaq4380_4_channels),
+	.num_simult_channels = 4,
+	.supplies = adaq4380_supplies,
+	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
+	.adaq_internal_ref_only = true,
+	.has_hardware_gain = true,
+	.available_scan_masks = ad7380_4_channel_scan_masks,
+	.timing_specs = &ad7380_4_timing,
+};
+
+static const struct ad7380_chip_info adaq4380_4_chip_info = {
+	.name = "adaq4380-4",
+	.channels = adaq4380_4_channels,
+	.num_channels = ARRAY_SIZE(adaq4380_4_channels),
+	.num_simult_channels = 4,
+	.supplies = adaq4380_supplies,
+	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
+	.adaq_internal_ref_only = true,
+	.has_hardware_gain = true,
+	.available_scan_masks = ad7380_4_channel_scan_masks,
+	.timing_specs = &ad7380_4_timing,
+};
+
 struct ad7380_state {
 	const struct ad7380_chip_info *chip_info;
 	struct spi_device *spi;
@@ -526,6 +582,7 @@ struct ad7380_state {
 	bool seq;
 	unsigned int vref_mv;
 	unsigned int vcm_mv[MAX_NUM_CHANNELS];
+	unsigned int gain_milli[MAX_NUM_CHANNELS];
 	/* xfers, message an buffer for reading sample data */
 	struct spi_transfer normal_xfer[2];
 	struct spi_message normal_msg;
@@ -876,8 +933,15 @@ static int ad7380_read_raw(struct iio_dev *indio_dev,
 		 *    * (2 × VREF) / 2^N, for differential chips
 		 *    * VREF / 2^N, for pseudo-differential chips
 		 * where N is the ADC resolution (i.e realbits)
+		 *
+		 * The gain is stored as a fraction of 1000 and, as we need to
+		 * divide vref_mv by the gain, we invert the gain/1000 fraction.
 		 */
-		*val = st->vref_mv;
+		if (st->chip_info->has_hardware_gain)
+			*val = mult_frac(st->vref_mv, MILLI,
+					 st->gain_milli[chan->scan_index]);
+		else
+			*val = st->vref_mv;
 		*val2 = scan_type->realbits - chan->differential;
 
 		return IIO_VAL_FRACTIONAL_LOG2;
@@ -1058,7 +1122,19 @@ static int ad7380_probe(struct spi_device *spi)
 				     "Failed to enable power supplies\n");
 	msleep(T_POWERUP_MS);
 
-	if (st->chip_info->external_ref_only) {
+	if (st->chip_info->adaq_internal_ref_only) {
+		/*
+		 * ADAQ chips use fixed internal reference but still
+		 * require an external reference supply to power it.
+		 * "refin" is already enabled with other power supplies
+		 * in bulk_get_enable().
+		 */
+
+		st->vref_mv = ADAQ4380_INTERNAL_REF_MV;
+
+		/* these chips don't have a register bit for this */
+		external_ref_en = false;
+	} else if (st->chip_info->external_ref_only) {
 		ret = devm_regulator_get_enable_read_voltage(&spi->dev,
 							     "refin");
 		if (ret < 0)
@@ -1104,6 +1180,34 @@ static int ad7380_probe(struct spi_device *spi)
 		st->vcm_mv[i] = ret / 1000;
 	}
 
+	for (i = 0; i < MAX_NUM_CHANNELS; i++)
+		st->gain_milli[i] = AD7380_DEFAULT_GAIN_MILLI;
+
+	if (st->chip_info->has_hardware_gain) {
+		device_for_each_child_node_scoped(&spi->dev, node) {
+			unsigned int channel, gain;
+
+			ret = fwnode_property_read_u32(node, "reg", &channel);
+			if (ret)
+				return dev_err_probe(&spi->dev, ret,
+						     "Failed to read reg property\n");
+
+			if (channel >= st->chip_info->num_channels - 1)
+				return dev_err_probe(&spi->dev, -EINVAL,
+						     "Invalid channel number %i\n",
+						     channel);
+
+			ret = fwnode_property_read_u32(node, "adi,gain-milli",
+						       &gain);
+			if (ret && ret != -EINVAL)
+				return dev_err_probe(&spi->dev, ret,
+						     "Failed to read gain for channel %i\n",
+						     channel);
+			if (ret != -EINVAL)
+				st->gain_milli[channel] = gain;
+		}
+	}
+
 	st->regmap = devm_regmap_init(&spi->dev, NULL, st, &ad7380_regmap_config);
 	if (IS_ERR(st->regmap))
 		return dev_err_probe(&spi->dev, PTR_ERR(st->regmap),
@@ -1186,6 +1290,8 @@ static const struct of_device_id ad7380_of_match_table[] = {
 	{ .compatible = "adi,ad7386-4", .data = &ad7386_4_chip_info },
 	{ .compatible = "adi,ad7387-4", .data = &ad7387_4_chip_info },
 	{ .compatible = "adi,ad7388-4", .data = &ad7388_4_chip_info },
+	{ .compatible = "adi,adaq4370-4", .data = &adaq4370_4_chip_info },
+	{ .compatible = "adi,adaq4380-4", .data = &adaq4380_4_chip_info },
 	{ }
 };
 
@@ -1204,6 +1310,8 @@ static const struct spi_device_id ad7380_id_table[] = {
 	{ "ad7386-4", (kernel_ulong_t)&ad7386_4_chip_info },
 	{ "ad7387-4", (kernel_ulong_t)&ad7387_4_chip_info },
 	{ "ad7388-4", (kernel_ulong_t)&ad7388_4_chip_info },
+	{ "adaq4370-4", (kernel_ulong_t)&adaq4370_4_chip_info },
+	{ "adaq4380-4", (kernel_ulong_t)&adaq4380_4_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ad7380_id_table);

-- 
2.46.0


