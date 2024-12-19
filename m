Return-Path: <linux-doc+bounces-33338-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 027319F7F0A
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 17:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE08D1886BDD
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 16:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC6E228394;
	Thu, 19 Dec 2024 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OEC7zeeu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0F122756F
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624688; cv=none; b=UF8pWQPkafOBybJvbS5cQil3IyS0H8ts58VPS3/UAeQjcYHJIYJkcr4TaTcMK/2rjBwdt8jEgQS2ECudXsgBnFQbG3Ng3T1c/wIcwQq622NBR1se2Q+7dzRqQJWX2AyVAt1TwGScTEmkZ4MFs2nvvccUZCX6/WDvXK0lrJW3N00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624688; c=relaxed/simple;
	bh=nFnIfOF9HckiQVPLEYTXAe4absv1qpoUmvGDyy/vRXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iC+JiNiWSdIY0ZFTBXsp2seP2aklLa6JGcvRmNs2u8rAyQnaUNwNAAA7LSWZ6gG7IGevv+1rClgQYObsONoezJtX4I/T6ls1LFebJWCLvEwL83oYv+gGZCBAlzvbtLOS8di+P8B42f51wk2s0xnEvAFrOYrKSYLa0cpdZFct4uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OEC7zeeu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso5445875e9.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 08:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734624683; x=1735229483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgm4cGe8G3VOZX4lWhYMrkQ13uDE0JvRuXr0m2TwXeE=;
        b=OEC7zeeuHapRtS0i3E2vZML/IZTTUUeo0iAu6JXgnFnWthhJ91uFQGnVd4aV+Ybu30
         daJIXadPu4zl47ScI7IZ5tU42e8HVx/Gvkh+xAGWyL2WKd6tt5FenomQEA7u7pxxNSI6
         wgVK8FOb1YbUtQE6gJiD0unjSr+2w/1Vr6xGykTxhdNbJesRVffnJA9FoO7e0JsoLCxX
         a7EaA4VnWVWNH00Iiwdl/VGF1Ppj+BCxA+sFoJawBaaNgKxIs5c504rZnnATyveuFFrh
         0wHEwLfn6DCtYO0BoJVZSrKZSnFjHPhlbZpcSFIV4Cq8MU/fBFmwCifPp1M3qt35kWzB
         BQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624683; x=1735229483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgm4cGe8G3VOZX4lWhYMrkQ13uDE0JvRuXr0m2TwXeE=;
        b=hNixxBaWhuM1x9ocG0D2/rzH2WLm0lJTjURu6ZzmAB4UL2L/Md5neSM1ZxdxIpPayh
         El8sERkSVb/9WKd1U3zEQiTUk69wPa5Rs5QtoCXRLopaMl0QFmoLcs3/YMpDAG2lebEw
         SqEvLvbGwWDI/OLZ0PXzVBv+QelPmYePT4A9j8BpZi0pymTeQSFGHfhqAEMf85QKO8Wv
         7QCC9ST0ehEmTEm5LAAGNbIHMZZ+6GcHCjoj52s8v34GDkUdToJyWJ7fvuOGARQxkJTz
         1EU2xDrtXukth5exTz6d8SG6YAcu+a7PayCZK5be56975pYlFnWvmoKTiV75eDwTBUAH
         QX6w==
X-Forwarded-Encrypted: i=1; AJvYcCWWJzw3UimacJg0AyrTRhXg2ZElBxIASRcxEHpjWs5lODUJN1id+BJ2R9fZc+tlR2+CoXyYLYM0ZbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgR5ma2CeCCz06gs5GLSqT8A/T7ruLdLxYuC3xkofn8vh7+YeW
	REVZXLZzQNGENpZqQqij8BXWJVmkUn/ImbtC3f7BxBZXvXVmcrqR5Wptl0hO9TY=
X-Gm-Gg: ASbGnctWdq7gn3/tNgu8M7f5d0fg5YiB475NqNHhe6b3Zx+AzTYTjlUE33WW4B/LADI
	PoiZ2x9z+pXmjldpu8Eq0Law+tF0Bp5dFMM/srrRGCaan9gWUA59qs4jTpXrjwxEY4F2Sf5RXw3
	zeg6kg5l5DResVzoYCVQwxeYxb6HhmB51PDRjwxJVVsnBDhM2PJivx/mzcBDCx4VuGVDSdt5ra5
	vWXso2C0bC6w4vtDKxtfpdIsUZMRT/Zez7vcO3dECdCMH01RYSRKzMmfusoYjzJ+Vio0qQ8IrJz
	Ue/P9svHZuB2IXhHUoNSKCaNlGDU6DvauDKTGg==
X-Google-Smtp-Source: AGHT+IESPx4gaupBhjGuw+PyYRTgbnLD6gPMV47K4CjyfHGi3iBe2d8pQGzx/Fz5g0KINH8pRKh0NA==
X-Received: by 2002:a05:600c:3ca1:b0:434:fd77:5436 with SMTP id 5b1f17b1804b1-4365536f8eemr85026335e9.15.1734624683310;
        Thu, 19 Dec 2024 08:11:23 -0800 (PST)
Received: from [127.0.0.1] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm57526225e9.33.2024.12.19.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 08:11:22 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Date: Thu, 19 Dec 2024 17:10:40 +0100
Subject: [PATCH v2 5/6] iio: adc: ad4030: add support for ad4632-16 and
 ad4632-24
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-eblanc-ad4630_v1-v2-5-f36e55907bf5@baylibre.com>
References: <20241219-eblanc-ad4630_v1-v2-0-f36e55907bf5@baylibre.com>
In-Reply-To: <20241219-eblanc-ad4630_v1-v2-0-f36e55907bf5@baylibre.com>
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

AD4632-24 and AD4632-16 are 2 channels ADCs. Both channels are
interleaved bit per bit on SDO line.

Both of them do not have evaluation board. As such, the support added
here can't be tested. Support is provided as best effort until someone get
their hands on one.

Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
 drivers/iio/adc/ad4030.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index 06e5a32d292e63eaf6f14ac79308a760736f78b4..0d4a488ea91c5c66338ff5cc7c7e648951427fda 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -34,6 +34,8 @@
 #define     AD4030_REG_CHIP_GRADE_AD4030_24_GRADE	0x10
 #define     AD4030_REG_CHIP_GRADE_AD4630_16_GRADE	0x03
 #define     AD4030_REG_CHIP_GRADE_AD4630_24_GRADE	0x00
+#define     AD4030_REG_CHIP_GRADE_AD4632_16_GRADE	0x05
+#define     AD4030_REG_CHIP_GRADE_AD4632_24_GRADE	0x02
 #define     AD4030_REG_CHIP_GRADE_MASK_CHIP_GRADE	GENMASK(7, 3)
 #define AD4030_REG_SCRATCH_PAD			0x0A
 #define AD4030_REG_SPI_REVISION			0x0B
@@ -107,6 +109,9 @@
 #define AD4030_TCYC_NS			500
 #define AD4030_TCYC_ADJUSTED_NS		(AD4030_TCYC_NS - AD4030_TCNVL_NS)
 #define AD4030_TRESET_PW_NS		50
+#define AD4632_TCYC_NS			2000
+#define AD4632_TCYC_ADJUSTED_NS		(AD4632_TCYC_NS - AD4030_TCNVL_NS)
+#define AD4030_TRESET_COM_DELAY_MS	750
 
 enum ad4030_out_mode {
 	AD4030_OUT_DATA_MD_DIFF,
@@ -1161,10 +1166,44 @@ static const struct ad4030_chip_info ad4630_24_chip_info = {
 	.tcyc_ns = AD4030_TCYC_ADJUSTED_NS,
 };
 
+static const struct ad4030_chip_info ad4632_16_chip_info = {
+	.name = "ad4632-16",
+	.available_masks = ad4630_channel_masks,
+	.channels = {
+		AD4030_CHAN_DIFF(0, ad4030_16_scan_types),
+		AD4030_CHAN_DIFF(1, ad4030_16_scan_types),
+		AD4030_CHAN_CMO(2, 0),
+		AD4030_CHAN_CMO(3, 1),
+		IIO_CHAN_SOFT_TIMESTAMP(4),
+	},
+	.grade = AD4030_REG_CHIP_GRADE_AD4632_16_GRADE,
+	.precision_bits = 16,
+	.num_voltage_inputs = 2,
+	.tcyc_ns = AD4632_TCYC_ADJUSTED_NS,
+};
+
+static const struct ad4030_chip_info ad4632_24_chip_info = {
+	.name = "ad4632-24",
+	.available_masks = ad4630_channel_masks,
+	.channels = {
+		AD4030_CHAN_DIFF(0, ad4030_24_scan_types),
+		AD4030_CHAN_DIFF(1, ad4030_24_scan_types),
+		AD4030_CHAN_CMO(2, 0),
+		AD4030_CHAN_CMO(3, 1),
+		IIO_CHAN_SOFT_TIMESTAMP(4),
+	},
+	.grade = AD4030_REG_CHIP_GRADE_AD4632_24_GRADE,
+	.precision_bits = 24,
+	.num_voltage_inputs = 2,
+	.tcyc_ns = AD4632_TCYC_ADJUSTED_NS,
+};
+
 static const struct spi_device_id ad4030_id_table[] = {
 	{ "ad4030-24", (kernel_ulong_t)&ad4030_24_chip_info },
 	{ "ad4630-16", (kernel_ulong_t)&ad4630_16_chip_info },
 	{ "ad4630-24", (kernel_ulong_t)&ad4630_24_chip_info },
+	{ "ad4632-16", (kernel_ulong_t)&ad4632_16_chip_info },
+	{ "ad4632-24", (kernel_ulong_t)&ad4632_24_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ad4030_id_table);
@@ -1173,6 +1212,8 @@ static const struct of_device_id ad4030_of_match[] = {
 	{ .compatible = "adi,ad4030-24", .data = &ad4030_24_chip_info },
 	{ .compatible = "adi,ad4630-16", .data = &ad4630_16_chip_info },
 	{ .compatible = "adi,ad4630-24", .data = &ad4630_24_chip_info },
+	{ .compatible = "adi,ad4632-16", .data = &ad4632_16_chip_info },
+	{ .compatible = "adi,ad4632-24", .data = &ad4632_24_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ad4030_of_match);

-- 
2.47.0


