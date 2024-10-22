Return-Path: <linux-doc+bounces-28248-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2919AA301
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2024 15:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BA88B20FB1
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2024 13:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7827C1A00DF;
	Tue, 22 Oct 2024 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YrcWHSH7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B719F10A
	for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729603368; cv=none; b=cKn+84DY4OMUbsChrSZhA8+MgycG2VKdwh5tdUCYBezq3qg5NOWJpNg6wnXIRopQ+o6/KaLvFtdPYKjG8OcbKR1OuT78tpwGFMSqta9SCllIavqTm28Gii6u1Z1/SfgTT3dQro22lsF1jNraRPaGVu3TpB8TD+0WLmpl+0bTzd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729603368; c=relaxed/simple;
	bh=blsPbZFHeoLjv3GFa/ctO/PeQ1zaGEkirG72eP6ryPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNlqKLpKhl7SKyC7Awq8cB7ENOnyR1ZkFtcjIHgsY0eDFwJg6kOTiFLDuXisjYsBB8FrM8VjcEFPpO20XrGS9uDobGoXui0jARs/GvUKG1Kh/u+XzCYC3DOtPK01yP/wGopqgOomNQBFIzuiJGVYSzS3/ESZaAIetwVoSmtEznI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YrcWHSH7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c94b0b466cso6395526a12.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729603364; x=1730208164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkS7A28C1JtrPURYIx6oS6bqZCx0cfiiFumBuSy+Q4U=;
        b=YrcWHSH76xElK7zUxNrChWEY99vEEGmiPeL0lR77POOXg+j/xsYIpFVB1IlURajngc
         wv6s4u3M6HmK0EYnSlNcsgwftbaOWv4vj7FdtUIFBr5/2p2z5H40csxs3TOfpLbvEZ8k
         RV1NWFOnMrimVGplg+AQRMW29ZWG8xZpHm6ofQhpA2Y1h9zzDg+JtzX1M3Y/YLiG/yad
         ftV/zH8/MdkTASQbWaYBDsuVNVxN/aCPGA6PoFNsNOmHIiIaxM7/TlVHW2j+UK4vOk21
         nu6Z0d0KmFVtI296fI5naxoEzmFj+m+Z6PtMJhA52zxRPkWcJRsEH+zbtBWt0hZrOxvg
         YEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729603364; x=1730208164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkS7A28C1JtrPURYIx6oS6bqZCx0cfiiFumBuSy+Q4U=;
        b=m1QEb2PccxGStmHIw28KMdJBJBWIt71eMZ7oYopgdodw4+atIUNWR3drneggVEDdMZ
         wR+MbwJIiwf/QW42sc0EY9/6lAawaPfwSoO/mJbMADC2JXDIe4BvAFWTZo6s8zcZFv/r
         9JM0AhG4EF22DnTPLPWaUUla4IvGikXoVp5sy1sDNrsG9uZ7stcndT3LCe58NCr+D5CF
         g3TUU9uUIpl1XjoBnFbPkrQpjaBGF0BZBBjGaIp0TrguJG0AaPa+HtreqC4RTN3LH7GE
         7Mg/p3L7slAYsFa8j5pLUPX0pXcf1tRJld74cJBsKmmlmN/hBO928x1TqBpVlxA8eNPS
         qMZw==
X-Forwarded-Encrypted: i=1; AJvYcCWFPo91uwpRj2+gr9BTuph3CAgksbPm/3lTMTCc9+c/9UuO/yx14zdYR6w4jqPR5E9f9D0ZXD7sP44=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuD0VglboU542wrfXs0vAzf4yXiu67vnfJ/FWtkU+l4h8N1yOC
	o7mpmqEl3BIBjM9hyNp2SAJjoecOAAL0Mo5emrdDbEaUuKw+pjYgcyXvD+HIrKc=
X-Google-Smtp-Source: AGHT+IEHmdsP+W2QjbgbjVMmZhTaZtnr2OFVyqqt/HwvuidUh35lSlwgl0VBZ8GwJTTdidbNc4i6mA==
X-Received: by 2002:a05:6402:4028:b0:5c9:5701:f79e with SMTP id 4fb4d7f45d1cf-5ca0ae87a4cmr13053129a12.27.1729603364626;
        Tue, 22 Oct 2024 06:22:44 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c737c4sm3109496a12.96.2024.10.22.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 06:22:44 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 22 Oct 2024 15:22:39 +0200
Subject: [PATCH v3 4/5] iio: adc: ad7380: fix supplies for ad7380-4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-ad7380-fix-supplies-v3-4-f0cefe1b7fa6@baylibre.com>
References: <20241022-ad7380-fix-supplies-v3-0-f0cefe1b7fa6@baylibre.com>
In-Reply-To: <20241022-ad7380-fix-supplies-v3-0-f0cefe1b7fa6@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

ad7380-4 is the only device in the family that does not have an internal
reference. It uses "refin" as a required external reference.
All other devices in the family use "refio"" as an optional external
reference.

Fixes: 737413da8704 ("iio: adc: ad7380: add support for ad738x-4 4 channels variants")
Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index b107d8e97ab36f7aed4685f18e0f398d63fd1e8d..fb728570debe6432d5f991595cb35e9e7af8b740 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -89,6 +89,7 @@ struct ad7380_chip_info {
 	bool has_mux;
 	const char * const *supplies;
 	unsigned int num_supplies;
+	bool external_ref_only;
 	const char * const *vcm_supplies;
 	unsigned int num_vcm_supplies;
 	const unsigned long *available_scan_masks;
@@ -431,6 +432,7 @@ static const struct ad7380_chip_info ad7380_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = ad7380_supplies,
 	.num_supplies = ARRAY_SIZE(ad7380_supplies),
+	.external_ref_only = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
 };
@@ -1047,17 +1049,31 @@ static int ad7380_probe(struct spi_device *spi)
 				     "Failed to enable power supplies\n");
 	fsleep(T_POWERUP_US);
 
-	/*
-	 * If there is no REFIO supply, then it means that we are using
-	 * the internal 2.5V reference, otherwise REFIO is reference voltage.
-	 */
-	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "refio");
-	if (ret < 0 && ret != -ENODEV)
-		return dev_err_probe(&spi->dev, ret,
-				     "Failed to get refio regulator\n");
+	if (st->chip_info->external_ref_only) {
+		ret = devm_regulator_get_enable_read_voltage(&spi->dev,
+							     "refin");
+		if (ret < 0)
+			return dev_err_probe(&spi->dev, ret,
+					     "Failed to get refin regulator\n");
+
+		st->vref_mv = ret / 1000;
 
-	external_ref_en = ret != -ENODEV;
-	st->vref_mv = external_ref_en ? ret / 1000 : AD7380_INTERNAL_REF_MV;
+		/* these chips don't have a register bit for this */
+		external_ref_en = false;
+	} else {
+		/*
+		 * If there is no REFIO supply, then it means that we are using
+		 * the internal reference, otherwise REFIO is reference voltage.
+		 */
+		ret = devm_regulator_get_enable_read_voltage(&spi->dev,
+							     "refio");
+		if (ret < 0 && ret != -ENODEV)
+			return dev_err_probe(&spi->dev, ret,
+					     "Failed to get refio regulator\n");
+
+		external_ref_en = ret != -ENODEV;
+		st->vref_mv = external_ref_en ? ret / 1000 : AD7380_INTERNAL_REF_MV;
+	}
 
 	if (st->chip_info->num_vcm_supplies > ARRAY_SIZE(st->vcm_mv))
 		return dev_err_probe(&spi->dev, -EINVAL,

-- 
2.47.0


