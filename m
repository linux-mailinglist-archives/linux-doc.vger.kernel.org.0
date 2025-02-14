Return-Path: <linux-doc+bounces-38153-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B0A35D8C
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2025 13:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5915016AFDB
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2025 12:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0021263F4B;
	Fri, 14 Feb 2025 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="j70F61ZL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993C263F5A
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 12:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739535802; cv=none; b=uO8t4wiEIp7xSnrYpO1NdoUjlapkirid9An7StlxboDi/l1jpjVfvGK/t6hHVtOb1yCiDik4CSfgnQ8Rn//yEuuM6uVV7T7H6jZZyvGFPeaABbN4UnK0OUUNIrjAia08mgbBhEXxGPt/YzF+mAb87L5D/llPkByNk6vMTA0lSM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739535802; c=relaxed/simple;
	bh=8rrqwFgDTm2gA4mj7sVUgnMI6tZZuBU3XZP0x7fXgj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aViY5//ekp8ruRrTn1cGAHrhjpDU1LMXhZcgXSxSKFajJRIGwUId0GZr4dlKCZTmHEpFmWD5WVzgCSG64MLZfXf6i+FnFlgfxrsL7yo02io3w0M+qXsql13xFTx18O5HyD5bNlWRBMnNl2EwH8EUl8bdOFMFTyqUhgKtYqww40o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=j70F61ZL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so1741180f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 04:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739535798; x=1740140598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNzmNXyLsKOSVj8hEg1gf1L94StWzXv3dxfzugH3wL8=;
        b=j70F61ZLZS8wxJGfw1JPMa4jFBg7JiGSweIraISGJkFJxrTaK1DiyaxS/Shfc8bK/J
         rf67mjsmbJS8WnJANJ5LNQJwRmUF6YG4Dv+WwQKTsdz5tA4hR3pQP4p19I2XHrvKHea2
         KvOFlHhoHL3aP7YBd6Oe5txPw7cCgl74nbJbbLPqtk4KW4/9amIWHoni3OR8RA0QpMBF
         PZ792Ddq9wPdhzI7VvcYQe6+KZK/+Te+ARTxuzQatnBgFnbwHuWLS7aU/tkMvfEcjrpH
         Rt8tEfQgeCqy/s7FqUWlA4adOtxrzz7lkqZ3gbyl0ZHW7MQg2U8T+jL7aPz6UkT9lsg7
         B79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739535798; x=1740140598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNzmNXyLsKOSVj8hEg1gf1L94StWzXv3dxfzugH3wL8=;
        b=WDedViP4NGtsj3mSLGoTUKFhqpTfWwK4AtR0Pbw8W2NZlhVtOrwzlLI6lRy8zwyR5l
         oiTurQW4GVnmngKhPlHNkZsyKgjVfGn+QQLTUe8jkvZG7ToSvye9mwGN0DhRw0Xpzebq
         KgmHCFsq0or3UADKvpZo/McKlfePJ/6WYZRKY1S3sLP2Lfcg80pv6n29nC/Wn5yVJ5nR
         ogGtmKlkzryMf6KPWX8m7bChxMSV//ujYXwlIBU3cnR4i/2uYdKUaGqVhnD/Zi5eNxxT
         jk0g0bZhqFil8LvXBTj0ev3eJC6QNLZo+WiTdrtZ9A4CXgWnf7MNp9WOzfsXC8smQEmi
         NQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWON75c0+hqjpahHOFG9TXzWlx4JBRvPrDNsU0qHTIPTQWtm6dUDik6kzqj9u5qiLSAtjzWzYgrLJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8+Ckk8BALIWiVqI7ni4z7YIaPT7Crm7AuTZ8W7Lf928ZehFi
	qF22hoF2jToGpdl15m6uT67FI+s5NNSzwy1mc7EyExtr9oScYXdTYflviRbBPtU=
X-Gm-Gg: ASbGnctwql17ijO4rSODQaBg2O5N5MT8c/DdJm5g2AcsyYv1d9LO8lzucyPLiqTfGGp
	xIhMnqGRY25Q7M22ICHGsiVk5WCxVKQ+h8VBqcmFHhYGiQ0I+RU7gSEM3fPbzMJwq2jvLomT8H1
	TUrLdygVMJpMRf2Koov0zZFyZ649hvfi1lVjjq82WAsC4mbYZN3Xr8UG8OBYVQGe20ef4ZZpD25
	8Xx5ibpfEoWd6JX5qiZ5jwWM68+6RCP8RHJGN8KnGyU0GB0sYzXYfMbwuuhpxdqR2KL1rhbLiIb
	vgj2KbjrQvk3cNr/GWB0cs2MdCDBJC9rAObDCYKziXdSKzK4yYk2W3fV/ZwVeuBHMS1YnSlH
X-Google-Smtp-Source: AGHT+IEiARyb0g8w3CmW73f7qJTgAK/p48+LYigBoS9IM1MgFpWYiwjxfppS2/mOLm+/lkksAauT0Q==
X-Received: by 2002:a5d:64eb:0:b0:38f:2176:45a0 with SMTP id ffacd0b85a97d-38f2176496fmr12623833f8f.33.1739535798429;
        Fri, 14 Feb 2025 04:23:18 -0800 (PST)
Received: from [127.0.0.1] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7b68sm4424654f8f.85.2025.02.14.04.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 04:23:18 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Date: Fri, 14 Feb 2025 13:22:35 +0100
Subject: [PATCH v4 5/6] iio: adc: ad4030: add support for ad4632-16 and
 ad4632-24
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-eblanc-ad4630_v1-v4-5-135dd66cab6a@baylibre.com>
References: <20250214-eblanc-ad4630_v1-v4-0-135dd66cab6a@baylibre.com>
In-Reply-To: <20250214-eblanc-ad4630_v1-v4-0-135dd66cab6a@baylibre.com>
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
index a5f08522175493b5574144352e71d3e70bb6ad3e..f1116e547ea3ca1cdeab7cbca09201710ad99c60 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -35,6 +35,8 @@
 #define     AD4030_REG_CHIP_GRADE_AD4030_24_GRADE	0x10
 #define     AD4030_REG_CHIP_GRADE_AD4630_16_GRADE	0x03
 #define     AD4030_REG_CHIP_GRADE_AD4630_24_GRADE	0x00
+#define     AD4030_REG_CHIP_GRADE_AD4632_16_GRADE	0x05
+#define     AD4030_REG_CHIP_GRADE_AD4632_24_GRADE	0x02
 #define     AD4030_REG_CHIP_GRADE_MASK_CHIP_GRADE	GENMASK(7, 3)
 #define AD4030_REG_SCRATCH_PAD			0x0A
 #define AD4030_REG_SPI_REVISION			0x0B
@@ -106,6 +108,9 @@
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
2.47.2


