Return-Path: <linux-doc+bounces-27534-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4E99E24C
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 11:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683542846FB
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 09:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378C11DAC8D;
	Tue, 15 Oct 2024 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TwT9OVU+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595C1D9580
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983352; cv=none; b=C7pGQDjwwSIr5ihSKIZEhcjdTaHX8lJUdCLOcgg5oFemV0n21XZvmZojWBUO/HEQ1pOiiOLROM97L8zWM325pPrE+PKzYE5sKx9hmD3nXRJRJA5rbyCgrPP9haq5Mhgd8BdUz7Wugpl7fuXRIBcZEUh9H6fMzJ8vwCq53IpurJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983352; c=relaxed/simple;
	bh=o62uOnLdet39sGOU8s7LXAinW57s1Px5F5MzWy4QaUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYSRNJ9etbmmBPU+f+e+g/7uvT90n5vuCEVv0eXkTFMqYYGt90XrGCGK5S3VYIDYIWNiMdXuJR/fGvpbVRLc40PpFqcxSthItTvnNuGlgCz8y4EUzLOTXtawICO87bl+J2Zt13bgjWG+vMw3giqNhx97AQugTRNKF/b7Fn9t6wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TwT9OVU+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43117ed8adbso57220435e9.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728983348; x=1729588148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTy6VNLKeEKKTg69S3uNulsgrGlXdqfWHluaJ2NZUNs=;
        b=TwT9OVU+6mFxf4V+J65VJ4T2lg07misEpxnK53KwbDdZTr4x4AxiGTYKON64Bcmzh0
         ikUQzPwOp3ZSL5+FGjEGqsQx2UjAmZYXeecSTW7dzt0vM0ZsbzE8aPCVAZhkcxlJpP30
         NYWQpCmy2csXBuNPGNq2bvbkGTvXQmGg+F0dhr/nmc917yrBiuVlsqhlQSZuL6QVj71X
         hm25L3XKTX4pFQ9JCNJf5FFOuMxX1DfaW3lZPQOmNKYdU+M6pALdq9KR+cngbJWv3Xzn
         rRLjYy2L0m+XwPEoEnobEVwFZw+V0F66NTubBWf6mMXhXPveGjoKuQtNXifcAzXNidqg
         elfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728983348; x=1729588148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTy6VNLKeEKKTg69S3uNulsgrGlXdqfWHluaJ2NZUNs=;
        b=JhVMzaskVqnjJZDIpZPXte3+1PMpCgkIsgMDWlicM0zn95wO4ns3ktnuuhVa/BPeZI
         QZeQ269TPSwH7vy+12H142TwZ0+y7JLfQkXFrmIzkJeP9x4ms/yhIZhJeufLQdlMnEoW
         P7wo88zuQYW8U+7694b7i063WytP+88zoxeN5jYG5S6xzBBxtV8/iKFI2XFSAhR6PNJv
         80UPBij0ozzOWRwE0hqJdhhUAqQQcNsDLclMAXWGIkth7STLJHQeO4VE3szFWvp7X45+
         GgbMbymZfYFsQ4HcCx8X85/MjPLF7HlfDKWi3peu34QOOWn4XnOf53Qes1CN4oO7NY3+
         Nzhg==
X-Forwarded-Encrypted: i=1; AJvYcCUPGphCpP/lzwgTYyuY47px5XNy9AwCHkfRw+W4NHZDsC8l3N0M8/Fa/gY63w9TTG7z0DDIt1epZbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+sP8FgE/3AINudau0hKZ9BP2zXzAwD2m02FD7Yjirzn8fIVH
	gcWKR/wTQQAORu+PR9A8zDAGM62blwq+3yFF7J7YpMwVjEu0BnERayJ62+wF8jw=
X-Google-Smtp-Source: AGHT+IF1h+oXQTPOArXM1QcDAmgctLATg+guTpS56FPH/LhpgaycB2RtXYhpBTIaJ3MVVN/32EmSvA==
X-Received: by 2002:a05:600c:1c9c:b0:42c:a8cb:6a5a with SMTP id 5b1f17b1804b1-431255df67amr113061465e9.15.1728983348183;
        Tue, 15 Oct 2024 02:09:08 -0700 (PDT)
Received: from [192.168.1.64] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc123dasm1012882f8f.94.2024.10.15.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:09:07 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 15 Oct 2024 11:09:07 +0200
Subject: [PATCH RFC 2/4] iio: adc: ad7380: fix oversampling formula
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-ad7380-add-adaq4380-4-support-v1-2-d2e1a95fb248@baylibre.com>
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

The formula in the datasheet for oversampling time conversion seems to
be valid when device is at full speed using the maximum number of SDO
lines. The driver currently support only 1 SDO line. The formula will
produce larger delays than what is currently set, but some devices
actually require it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index e9784769baa9..15ca85c70ebd 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -77,6 +77,12 @@
 #define T_CONVERT_X_NS 500		/* xth conversion start time (oversampling) */
 #define T_POWERUP_MS 5			/* Power up */
 
+/*
+ * AD738x support several SDO lines to increase throughput, but driver currently
+ * supports only 1 SDO line (standard SPI transaction)
+ */
+#define AD7380_NUM_SDO_LINES		1
+
 struct ad7380_timing_specs {
 	const unsigned int t_csh_ns;	/* CS minimum high time */
 };
@@ -649,7 +655,8 @@ static int ad7380_set_ch(struct ad7380_state *st, unsigned int ch)
 
 	if (st->oversampling_ratio > 1)
 		xfer.delay.value = T_CONVERT_0_NS +
-			T_CONVERT_X_NS * (st->oversampling_ratio - 1);
+			T_CONVERT_X_NS * (st->oversampling_ratio - 1) *
+			st->chip_info->num_simult_channels / AD7380_NUM_SDO_LINES;
 
 	return spi_sync_transfer(st->spi, &xfer, 1);
 }
@@ -667,12 +674,13 @@ static void ad7380_update_xfers(struct ad7380_state *st,
 
 	/*
 	 * In the case of oversampling, conversion time is higher than in normal
-	 * mode. Technically T_CONVERT_X_NS is lower for some chips, but we use
-	 * the maximum value for simplicity for now.
+	 * mode: t_convert = T_CONVERT_0_NS + T_CONVERT_X_NS*(x - 1)*num_channel/number_of_sdo_lines
+	 * where x is the oversampling ratio
 	 */
 	if (st->oversampling_ratio > 1)
 		t_convert = T_CONVERT_0_NS + T_CONVERT_X_NS *
-			(st->oversampling_ratio - 1);
+			(st->oversampling_ratio - 1) *
+			st->chip_info->num_simult_channels / AD7380_NUM_SDO_LINES;
 
 	if (st->seq) {
 		xfer[0].delay.value = xfer[1].delay.value = t_convert;
@@ -1021,7 +1029,8 @@ static int ad7380_init(struct ad7380_state *st, bool external_ref_en)
 	/* SPI 1-wire mode */
 	return regmap_update_bits(st->regmap, AD7380_REG_ADDR_CONFIG2,
 				  AD7380_CONFIG2_SDO,
-				  FIELD_PREP(AD7380_CONFIG2_SDO, 1));
+				  FIELD_PREP(AD7380_CONFIG2_SDO,
+					     AD7380_NUM_SDO_LINES));
 }
 
 static int ad7380_probe(struct spi_device *spi)

-- 
2.46.0


