Return-Path: <linux-doc+bounces-36437-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3EBA22C41
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 12:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3DE23A7BB6
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 11:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616031C173F;
	Thu, 30 Jan 2025 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mUNXPksO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF21DF75E
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235338; cv=none; b=YAm+ESYNdPQh2BlXnz4Wr3J1J5Ry7abMezBV1OPSAVN9qkPohtWYvaJKzLEC220j5yhiufO3rvJ8tuDRQRQaHjZzFqmUt4jP2Pheb7yZGJ/mF/n0tewkIwC0a5YiAYYhij7EbeyZNUR6oLhhNoYWguq6xHEtRE0VRHiShqlgTlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235338; c=relaxed/simple;
	bh=oStt0b9oijEbUczgtM7VcspplLFnD40HtYIemY77r5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmxIIhB5m10nwt07nWTgKTh/4cum36YFAIs6S5LbOi4v9hzlroDmgSTwTfWmFDMKLDh5Bg1cbAj2+e9Z/2ohGhOBf/6CNE1wbmwVlRy8hqg4BYo4qyyYEQKiucfz0F7HpXIKGoXh6G1610YnLkU9VQehd4RPcy9U9ACNXcNT7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mUNXPksO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso546814f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 03:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738235333; x=1738840133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a06dSzY9S3stWOSz0sT2dmbhTmlOqBLvFAjVkMA1nYs=;
        b=mUNXPksOD39pJj9aLr2CEPSPzL+QSH7gakySdsIpQN95QuuH2gHlz3p0gWsNwGFIVe
         znfW5oCYeo8zLBn7Hbfp+evrYYBmVYN1XJbe85ulr9Q6a/OkvaKOyKIzjMkNFDheTnY2
         jB0iNN8ExG35e5tmRQqq5t7YlRDVqVM67D5nnC4LRQwTZcM7jLYsir3gq9HroiMzsERI
         fFLD9LU6GhM+Ah/FwPvkVW7BmgZ5nKa4oWGvLgGpsP8bCtolt9C3ZfWBlub6gzL5i1BH
         nK5+XdP0MBxfy9Z4TTdlBhIpollLDShCG5mRU19jGEFyhCJmdYBlaEP8AGPNOqmRqncn
         cnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235333; x=1738840133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a06dSzY9S3stWOSz0sT2dmbhTmlOqBLvFAjVkMA1nYs=;
        b=d97/CQHIDch4qWrE3cvRKr6BR6VW3WWMIuxLuhA15pRHZN8wcEHyeyAWtEk3Oo8nNO
         A2/8nHUafBZwb4meAB2J1mEBYkueYFQHcjwNOxY4lyr+fThpOabB9PBgCKdPGjaW+XhU
         VSj3FnQfqlzYls+pfjOtDl980sgbaVj/Mhl9zbf3xugWwm3Y2kqpptCaenacd/KuWMX6
         JmOvNzVXW6aMa87eXUQcfV/T0h83GSvIxYGRInFbdWcmheP8xAxJl0i8M2AZHxsVXQak
         4OmD6BLdwOaMlq+ZJqeiNdhd/hOPd8kLQY6Tw8uGMl5OYIVW/zPgbJqxPu6j7fDyqsrh
         DN0w==
X-Forwarded-Encrypted: i=1; AJvYcCUm9+LJZfyu73zvjV7WrZODrB/jSsO70hjivC118VVx5pJfMxboqMIBis+4A/cEWMI8JkizGMca1fk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8GlWGulXCNl3ieXnuAXk5uqSiGM5xXRSYqSGr0M6D3ESwgT4H
	7f8JQhpkF0RaUBy7J8M/jKb1l/Ir9uSXhBH4jwGdKlcDlcWjfRAMVFX1KW5hKf8=
X-Gm-Gg: ASbGncuOYAxKRX7w2LsYj8gmhVPayU8fnOY4q1vQbCSNfGEKr/d24tRo/OvLLmrBJKI
	MAOgN+8NwBVvhklDxMOO/DwqaFSWExu/pDFfB5Xnx1UceAVucJ52rJVSLrCD6Z13xatiGzH8F3V
	O7GvnetTTOboxPvUi9wNe/9cIQ5+1v9kHfL+ULHFQBglcUNY6DvqfuToIs3o76JegjfxtSESfOk
	b3R6vq1FS0Z9g7xuFwtNPFpQ/zX9k9uDWXfcm+ZAD1uRTVjwK9iS1H875S5tqw6EAzu0HP4iaC5
	FjtLox/DwHAAGR3U
X-Google-Smtp-Source: AGHT+IEMDBEdg4FruAG2K9bn8JF2w9wXBAz0j1wEVreDJqJt11v6Yti9Xzd7awJZBgwwtTaTP2UAlA==
X-Received: by 2002:a5d:5743:0:b0:385:e394:37ed with SMTP id ffacd0b85a97d-38c51951c6fmr4934030f8f.18.1738235331209;
        Thu, 30 Jan 2025 03:08:51 -0800 (PST)
Received: from [127.0.0.1] ([2a01:e0a:448:76e0:2c72:cd2d:79b2:82ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bb2sm1689225f8f.34.2025.01.30.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 03:08:50 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Date: Thu, 30 Jan 2025 12:08:27 +0100
Subject: [PATCH v3 3/6] iio: adc: ad4030: add averaging support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-eblanc-ad4630_v1-v3-3-052e8c2d897d@baylibre.com>
References: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
In-Reply-To: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Esteban Blanc <eblanc@baylibre.com>
X-Mailer: b4 0.14.2

This add support for the averaging mode of AD4030 using oversampling IIO
attribute

Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
 drivers/iio/adc/ad4030.c | 130 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 114 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index e06424b7f2590d28a57943949b070cd7e185fbb7..ef76f077feb0b995938b7acdddf3d45c990ea8ef 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -114,6 +114,11 @@ enum ad4030_out_mode {
 	AD4030_OUT_DATA_MD_32_PATTERN
 };
 
+enum {
+	AD4030_SCAN_TYPE_NORMAL,
+	AD4030_SCAN_TYPE_AVG,
+};
+
 struct ad4030_chip_info {
 	const char *name;
 	const unsigned long *available_masks;
@@ -129,10 +134,12 @@ struct ad4030_state {
 	struct spi_device *spi;
 	struct regmap *regmap;
 	const struct ad4030_chip_info *chip;
+	const struct iio_scan_type *current_scan_type;
 	struct gpio_desc *cnv_gpio;
 	int vref_uv;
 	int vio_uv;
 	int offset_avail[3];
+	unsigned int avg_log2;
 	enum ad4030_out_mode mode;
 
 	/*
@@ -186,7 +193,11 @@ struct ad4030_state {
  * - voltage0-voltage1
  * - voltage2-voltage3
  */
-#define AD4030_CHAN_DIFF(_idx, _storage, _real, _shift) {		\
+#define AD4030_CHAN_DIFF(_idx, _scan_type) {				\
+	.info_mask_shared_by_all =					\
+		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),			\
+	.info_mask_shared_by_all_available =				\
+		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),			\
 	.info_mask_separate = BIT(IIO_CHAN_INFO_SCALE) |		\
 		BIT(IIO_CHAN_INFO_CALIBSCALE) |				\
 		BIT(IIO_CHAN_INFO_CALIBBIAS) |				\
@@ -200,15 +211,16 @@ struct ad4030_state {
 	.channel2 = (_idx) * 2 + 1,					\
 	.scan_index = (_idx),						\
 	.differential = true,						\
-	.scan_type = {							\
-		.sign = 's',						\
-		.storagebits = _storage,				\
-		.realbits = _real,					\
-		.shift = _shift,					\
-		.endianness = IIO_BE,					\
-	},								\
+	.has_ext_scan_type = 1,						\
+	.ext_scan_type = _scan_type,					\
+	.num_ext_scan_type = ARRAY_SIZE(_scan_type),			\
 }
 
+static const int ad4030_average_modes[] = {
+	1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384,
+	32768, 65536
+};
+
 static int ad4030_enter_config_mode(struct ad4030_state *st)
 {
 	st->tx_data[0] = AD4030_REG_ACCESS;
@@ -475,6 +487,27 @@ static int ad4030_set_chan_calibbias(struct iio_dev *indio_dev,
 				 st->tx_data, AD4030_REG_OFFSET_BYTES_NB);
 }
 
+static int ad4030_set_avg_frame_len(struct iio_dev *dev, int avg_val)
+{
+	struct ad4030_state *st = iio_priv(dev);
+	unsigned int avg_log2 = ilog2(avg_val);
+	unsigned int last_avg_idx = ARRAY_SIZE(ad4030_average_modes) - 1;
+	int ret;
+
+	if (avg_val < 0 || avg_val > ad4030_average_modes[last_avg_idx])
+		return -EINVAL;
+
+	ret = regmap_write(st->regmap, AD4030_REG_AVG,
+			   AD4030_REG_AVG_MASK_AVG_SYNC |
+			   FIELD_PREP(AD4030_REG_AVG_MASK_AVG_VAL, avg_log2));
+	if (ret)
+		return ret;
+
+	st->avg_log2 = avg_log2;
+
+	return 0;
+}
+
 static bool ad4030_is_common_byte_asked(struct ad4030_state *st,
 					unsigned int mask)
 {
@@ -485,11 +518,18 @@ static int ad4030_set_mode(struct iio_dev *indio_dev, unsigned long mask)
 {
 	struct ad4030_state *st = iio_priv(indio_dev);
 
-	if (ad4030_is_common_byte_asked(st, mask))
+	if (st->avg_log2 > 0)
+		st->mode = AD4030_OUT_DATA_MD_30_AVERAGED_DIFF;
+	else if (ad4030_is_common_byte_asked(st, mask))
 		st->mode = AD4030_OUT_DATA_MD_24_DIFF_8_COM;
 	else
 		st->mode = AD4030_OUT_DATA_MD_DIFF;
 
+	st->current_scan_type = iio_get_current_scan_type(indio_dev,
+							  st->chip->channels);
+	if (IS_ERR(st->current_scan_type))
+		return PTR_ERR(st->current_scan_type);
+
 	return regmap_update_bits(st->regmap, AD4030_REG_MODES,
 				  AD4030_REG_MODES_MASK_OUT_DATA_MODE,
 				  st->mode);
@@ -498,9 +538,11 @@ static int ad4030_set_mode(struct iio_dev *indio_dev, unsigned long mask)
 static int ad4030_conversion(struct iio_dev *indio_dev)
 {
 	struct ad4030_state *st = iio_priv(indio_dev);
-	const struct iio_scan_type scan_type = indio_dev->channels->scan_type;
-	unsigned char diff_realbytes = BITS_TO_BYTES(scan_type.realbits);
+	unsigned char diff_realbytes =
+		BITS_TO_BYTES(st->current_scan_type->realbits);
 	unsigned int bytes_to_read;
+	unsigned long cnv_nb = BIT(st->avg_log2);
+	unsigned int i;
 	int ret;
 
 	/* Number of bytes for one differential channel */
@@ -511,10 +553,12 @@ static int ad4030_conversion(struct iio_dev *indio_dev)
 	/* Mulitiply by the number of hardware channels */
 	bytes_to_read *= st->chip->num_voltage_inputs;
 
-	gpiod_set_value_cansleep(st->cnv_gpio, 1);
-	ndelay(AD4030_TCNVH_NS);
-	gpiod_set_value_cansleep(st->cnv_gpio, 0);
-	ndelay(st->chip->tcyc_ns);
+	for (i = 0; i < cnv_nb; i++) {
+		gpiod_set_value_cansleep(st->cnv_gpio, 1);
+		ndelay(AD4030_TCNVH_NS);
+		gpiod_set_value_cansleep(st->cnv_gpio, 0);
+		ndelay(st->chip->tcyc_ns);
+	}
 
 	ret = spi_read(st->spi, st->rx_data.raw, bytes_to_read);
 	if (ret)
@@ -594,6 +638,12 @@ static int ad4030_read_avail(struct iio_dev *indio_dev,
 		*type = IIO_VAL_INT_PLUS_NANO;
 		return IIO_AVAIL_RANGE;
 
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+		*vals = ad4030_average_modes;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(ad4030_average_modes);
+		return IIO_AVAIL_LIST;
+
 	default:
 		return -EINVAL;
 	}
@@ -603,6 +653,8 @@ static int ad4030_read_raw_dispatch(struct iio_dev *indio_dev,
 				    struct iio_chan_spec const *chan, int *val,
 				    int *val2, long info)
 {
+	struct ad4030_state *st = iio_priv(indio_dev);
+
 	switch (info) {
 	case IIO_CHAN_INFO_RAW:
 		return ad4030_single_conversion(indio_dev, chan, val);
@@ -613,6 +665,10 @@ static int ad4030_read_raw_dispatch(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_CALIBBIAS:
 		return ad4030_get_chan_calibbias(indio_dev, chan, val);
 
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+		*val = BIT(st->avg_log2);
+		return IIO_VAL_INT;
+
 	default:
 		return -EINVAL;
 	}
@@ -651,6 +707,9 @@ static int ad4030_write_raw_dispatch(struct iio_dev *indio_dev,
 			return -EINVAL;
 		return ad4030_set_chan_calibbias(indio_dev, chan, val);
 
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+		return ad4030_set_avg_frame_len(indio_dev, val);
+
 	default:
 		return -EINVAL;
 	}
@@ -702,12 +761,21 @@ static int ad4030_read_label(struct iio_dev *indio_dev,
 	return sprintf(label, "common-mode%lu\n", chan->address);
 }
 
+static int ad4030_get_current_scan_type(const struct iio_dev *indio_dev,
+					const struct iio_chan_spec *chan)
+{
+	struct ad4030_state *st = iio_priv(indio_dev);
+
+	return st->avg_log2 ? AD4030_SCAN_TYPE_AVG : AD4030_SCAN_TYPE_NORMAL;
+}
+
 static const struct iio_info ad4030_iio_info = {
 	.read_avail = ad4030_read_avail,
 	.read_raw = ad4030_read_raw,
 	.write_raw = ad4030_write_raw,
 	.debugfs_reg_access = ad4030_reg_access,
 	.read_label = ad4030_read_label,
+	.get_current_scan_type = ad4030_get_current_scan_type,
 };
 
 static int ad4030_buffer_preenable(struct iio_dev *indio_dev)
@@ -722,8 +790,21 @@ static int ad4030_buffer_preenable(struct iio_dev *indio_dev)
 	return 0;
 }
 
+static bool ad4030_validate_scan_mask(struct iio_dev *indio_dev,
+				      const unsigned long *scan_mask)
+{
+	struct ad4030_state *st = iio_priv(indio_dev);
+
+	/* Asking for both common channels and averaging */
+	if (st->avg_log2 && ad4030_is_common_byte_asked(st, *scan_mask))
+		return false;
+
+	return true;
+}
+
 static const struct iio_buffer_setup_ops ad4030_buffer_setup_ops = {
 	.preenable = ad4030_buffer_preenable,
+	.validate_scan_mask = ad4030_validate_scan_mask,
 };
 
 static int ad4030_regulators_get(struct ad4030_state *st)
@@ -893,11 +974,28 @@ static const unsigned long ad4030_channel_masks[] = {
 	0,
 };
 
+static const struct iio_scan_type ad4030_24_scan_types[] = {
+	[AD4030_SCAN_TYPE_NORMAL] = {
+		.sign = 's',
+		.storagebits = 32,
+		.realbits = 24,
+		.shift = 8,
+		.endianness = IIO_BE,
+	},
+	[AD4030_SCAN_TYPE_AVG] = {
+		.sign = 's',
+		.storagebits = 32,
+		.realbits = 30,
+		.shift = 2,
+		.endianness = IIO_BE,
+	},
+};
+
 static const struct ad4030_chip_info ad4030_24_chip_info = {
 	.name = "ad4030-24",
 	.available_masks = ad4030_channel_masks,
 	.channels = {
-		AD4030_CHAN_DIFF(0, 32, 24, 8),
+		AD4030_CHAN_DIFF(0, ad4030_24_scan_types),
 		AD4030_CHAN_CMO(1, 0),
 		IIO_CHAN_SOFT_TIMESTAMP(2),
 	},

-- 
2.47.2


