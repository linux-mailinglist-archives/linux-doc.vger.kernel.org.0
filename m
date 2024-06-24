Return-Path: <linux-doc+bounces-19304-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 983CD91579C
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 22:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227BA1F24396
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 20:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54771A0730;
	Mon, 24 Jun 2024 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bUBXqmYl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BC1A0706
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719259851; cv=none; b=s2IOJzq+KUHEcqo+IZQdB95QGM1k3sgXQBygh4Oa3O8cnrgqNusLFrF1VRRK10ACj2MSo2Mqx8NrhlDgOkqpq64f475qkdG04NimVQN6HXRdrV7jKDt59DhZDU3k42pPJ0Kebhd7bTK7UFCCOgFzsi0K8ZyHFifrUbkYiDoAhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719259851; c=relaxed/simple;
	bh=M5ncsogjwIKi7yTwd3on+qTwjMFKb9OhWUuYpkcn5s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=krOgZ+MbnrxdmsqCIx7/1VJE9ckUmRMhj43y0qMq0Q5z9ucf6HqFRRAPjcicgRNgWxzOj8wriLtc+49coKTRVLlTGNlQYjAmyVyixk7fpXHwSKWWoWsi55LRqrUaF3nBqDmUNfl8sbdF1pt1tEdLAZhaLUmnXeOm+1+lFWC7dJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bUBXqmYl; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7009b8113ebso2044124a34.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719259849; x=1719864649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keq6dAlPadRHMn2hspGHDGXT5Yre2UihnSFV/6UPPyU=;
        b=bUBXqmYljuFxuT7DhU7xSY/xdwdacs+L9ZrPEUQoUNU6BJ+pLZZCqHGbrv7hLuiGrk
         q0++qLkOYpikCaijp3/L3I8anJkYqXhGexkOAD1EtjaPNbC+mjISD/CLL6SkmE38VHg2
         gzBrOZwnWzLKcXuqP8LKGzNGfM0sOBe10KFEdRKV7bHafwoUPCwwmg/uk6WYY1YjXW9x
         kO+EVaH5l2HV3WLqgfe9nzfQSx5Auwc9kxZ5hgvh94fhyR8RzMEZOuwjxxEYA7u04mHY
         jirY+th5GhMCFGeMnQzZ6DaMxWxIUDZbmtz+w6N3tmCx2okvhBrTUKlXaK/R6wJUIp7J
         V8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719259849; x=1719864649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keq6dAlPadRHMn2hspGHDGXT5Yre2UihnSFV/6UPPyU=;
        b=NnlgGH541DLOwfIoaxfu9an7/1u2VDz0cZvVt10OGaxwg3qOjYWPJIxOXW/EvAeruK
         fbxJkzbUzj52fxwkhyOWEQ3CPAWDCbflSmOgtyVq6HpgAOCdhRSMXuNI4S2+3PYNZY4d
         I7GeksyjkYE7v7yJ/pAfCLxytsVvtYVn7VswoBuZ8wbuL3BfYXeoPKSlYHE0zKwFBsXR
         4NLWO7rAfQsQRFi0riquIizjdBzNZRjcyETiY/YjDl5yhuOU8fwbckuM5yr6hGkdR2CB
         Mv93AjYluti1VphxTb1zpQVYOKvfofV3qDxHavTu422nTwKEiZO3+VcI5sy1Hw+iz6rB
         tZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYH3IYJ3eRV+MgdbXk61WGMw1xpcsRlXqhE6injss+3m3MYQnMs5xeFNduYD1ALsT/4ts+8ylMOc4sBwoPXW8tLW7eukjkETYw
X-Gm-Message-State: AOJu0YwT42ykObPoAilQHM1VIERm/Wfuoa38n3je2tRc/DcsOL6Q7vJt
	thTFm2mHSrVJJW8SobxdXbbttvmJ4Mt9IAxeQwm8rPsute+AgY+CmD41Gsks4jg=
X-Google-Smtp-Source: AGHT+IEPj9eNpk6KMJ4QV06JOfE04WXPuqL0pHd7jyIaZHBJE1mlZj/2+mYQhvjgxxXtWG6s8pSSQA==
X-Received: by 2002:a05:6870:e9a6:b0:258:42c8:7f69 with SMTP id 586e51a60fabf-25d06bf1b66mr5594096fac.23.1719259848943;
        Mon, 24 Jun 2024 13:10:48 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd498872csm2056581fac.21.2024.06.24.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 13:10:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v2 2/2] iio: adc: ad7944: use devm_spi_optimize_message()
Date: Mon, 24 Jun 2024 15:10:31 -0500
Message-ID: <20240624-devm_spi_optimize_message-v2-2-58155c0180c2@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624-devm_spi_optimize_message-v2-0-58155c0180c2@baylibre.com>
References: <20240624-devm_spi_optimize_message-v2-0-58155c0180c2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

Use new devm_spi_optimize_message() helper to simplify repeated code
in the ad7944 driver.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7944.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/adc/ad7944.c b/drivers/iio/adc/ad7944.c
index 4602ab5ed2a6..a6ac17c13a29 100644
--- a/drivers/iio/adc/ad7944.c
+++ b/drivers/iio/adc/ad7944.c
@@ -134,18 +134,12 @@ AD7944_DEFINE_CHIP_INFO(ad7985, ad7944, 16, 0);
 /* fully differential */
 AD7944_DEFINE_CHIP_INFO(ad7986, ad7986, 18, 1);
 
-static void ad7944_unoptimize_msg(void *msg)
-{
-	spi_unoptimize_message(msg);
-}
-
 static int ad7944_3wire_cs_mode_init_msg(struct device *dev, struct ad7944_adc *adc,
 					 const struct iio_chan_spec *chan)
 {
 	unsigned int t_conv_ns = adc->always_turbo ? adc->timing_spec->turbo_conv_ns
 						   : adc->timing_spec->conv_ns;
 	struct spi_transfer *xfers = adc->xfers;
-	int ret;
 
 	/*
 	 * NB: can get better performance from some SPI controllers if we use
@@ -175,11 +169,7 @@ static int ad7944_3wire_cs_mode_init_msg(struct device *dev, struct ad7944_adc *
 
 	spi_message_init_with_transfers(&adc->msg, xfers, 3);
 
-	ret = spi_optimize_message(adc->spi, &adc->msg);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(dev, ad7944_unoptimize_msg, &adc->msg);
+	return devm_spi_optimize_message(dev, adc->spi, &adc->msg);
 }
 
 static int ad7944_4wire_mode_init_msg(struct device *dev, struct ad7944_adc *adc,
@@ -188,7 +178,6 @@ static int ad7944_4wire_mode_init_msg(struct device *dev, struct ad7944_adc *adc
 	unsigned int t_conv_ns = adc->always_turbo ? adc->timing_spec->turbo_conv_ns
 						   : adc->timing_spec->conv_ns;
 	struct spi_transfer *xfers = adc->xfers;
-	int ret;
 
 	/*
 	 * NB: can get better performance from some SPI controllers if we use
@@ -209,11 +198,7 @@ static int ad7944_4wire_mode_init_msg(struct device *dev, struct ad7944_adc *adc
 
 	spi_message_init_with_transfers(&adc->msg, xfers, 2);
 
-	ret = spi_optimize_message(adc->spi, &adc->msg);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(dev, ad7944_unoptimize_msg, &adc->msg);
+	return devm_spi_optimize_message(dev, adc->spi, &adc->msg);
 }
 
 static int ad7944_chain_mode_init_msg(struct device *dev, struct ad7944_adc *adc,
@@ -221,7 +206,6 @@ static int ad7944_chain_mode_init_msg(struct device *dev, struct ad7944_adc *adc
 				      u32 n_chain_dev)
 {
 	struct spi_transfer *xfers = adc->xfers;
-	int ret;
 
 	/*
 	 * NB: SCLK has to be low before we toggle CS to avoid triggering the
@@ -249,11 +233,7 @@ static int ad7944_chain_mode_init_msg(struct device *dev, struct ad7944_adc *adc
 
 	spi_message_init_with_transfers(&adc->msg, xfers, 2);
 
-	ret = spi_optimize_message(adc->spi, &adc->msg);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(dev, ad7944_unoptimize_msg, &adc->msg);
+	return devm_spi_optimize_message(dev, adc->spi, &adc->msg);
 }
 
 /**

-- 
2.45.2


