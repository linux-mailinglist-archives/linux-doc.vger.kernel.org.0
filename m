Return-Path: <linux-doc+bounces-19309-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EAC915840
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 22:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AD942862F1
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 20:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581D01A0AFD;
	Mon, 24 Jun 2024 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZTx//brT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0B5B1E8
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 20:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719261998; cv=none; b=LJPFvh7RwuXt/FbwasYYzs5qI8cNVQb3u2rArHtbWXhoPOU14HHEfPrRKQDEh44LXcteCHEl/TQ2QoE8ZrtzLnnTCNYP5/m2pmUPJobYs1uD2sfJtIvQoKUMsoOXodRAaPY/FEHk+tJUzrXnt6Hc2Oifzs4yUSmWki0fPur25BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719261998; c=relaxed/simple;
	bh=M5ncsogjwIKi7yTwd3on+qTwjMFKb9OhWUuYpkcn5s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpWy0Ft0Zmj+YhgNWyFofCtp6nU4cwv8z50gu3DtlrUYEskhpD5l6Q8dfO4rHY5sqoUf1qQgsn/Suqbf2YD7fyIg8KRi3neJtd1OMQxEFf04/uJRbz7z00b2IAM4SxA5pjM8S4DKLTtAG6QqkCQ23G6xEbe59ftSmF2uB7X6V3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZTx//brT; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f97a4c4588so2810401a34.2
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 13:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719261994; x=1719866794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keq6dAlPadRHMn2hspGHDGXT5Yre2UihnSFV/6UPPyU=;
        b=ZTx//brTD8K18G842k/4ZHXiw/KkGaEtWETy9vIM1vMgW5Sl7JMOfF/fhCGUjHHcn6
         Zxs3t+h3cl4hx4Syk6eQgQUmLr/wzdm39GYHxvwEq+AKg1TeKxQYLUMxjMrvQpY8ofLS
         jIz5HA833nzMUDJr1XoMKbWJvreUNfmwGn/Lk57K3tSJDbH9OAAbr0JhdnZZZ1djPTXo
         VT2wpTBuM9IB9PaCLb1VgqN/BTatgBrSknDncVDdc5sq80WjfRg1Cip0X3LXJDqZCPUd
         MsqQAC2mWd6KcRsdscrrLgwdCszJGZq+WUMR864x/cExeWq437VfbFsqjXMOiusCCjAV
         4m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719261994; x=1719866794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keq6dAlPadRHMn2hspGHDGXT5Yre2UihnSFV/6UPPyU=;
        b=MeKckx695bxF7ssJtvAXFN8HKFJSKggHvYrvXH/TF3VuOgbverdsgfdift3SdX4wxf
         11fIRdLMLqzHlYtQtf9P0yZJHi5vHGsKryX2tdMFjGldWb1BpCy/MHIjpXuLKZOKyAsg
         BmigawzEU0LVoCWXaz6Rt+14SsvflJbxJdPdSqNzOTg/JAO1EsCLllW+3GbrO5FklRkc
         sSBGYsp/TAgcehk06VINjanyUVOT7B6zpA3AgA/zfaTovJiCoFykeRomZ2s1a/mDpC90
         ohULxT+7E+0s7mX2oRVEMlegecppc2fsp9VSEkpsD6p/7PrOCVJpX1BXBMNVAXK4S6tX
         0NkA==
X-Forwarded-Encrypted: i=1; AJvYcCUc7oD3KAhCgU6YybIQyglRPMX5gej+KJLWaoVgiYPK5kpWhyT1agMVefAYAhw70+pdLkWEjFhFydLVt2vITBU8hIlINv3CbJMn
X-Gm-Message-State: AOJu0YwcK6aMIsyGZvYGo5JbGO5X63FS17/M7O8bQ6pN4/CkmImeCg/N
	Sp1SdbavNxvSF/D7TDWPLmSvf0wC0ceW6CIvu0mbJ3WAPNEGp6lj76oUDIUOClM=
X-Google-Smtp-Source: AGHT+IF7EFvGMEWr3pSOe3ttWzuPOBO9uekNYTXi7CPcw+9uIitHHwkUX7fmGEK32jf/6d5fRZGkyA==
X-Received: by 2002:a05:6870:d629:b0:251:2766:deb5 with SMTP id 586e51a60fabf-25d0163f01bmr6692531fac.9.1719261994534;
        Mon, 24 Jun 2024 13:46:34 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4c106dbsm2092849fac.58.2024.06.24.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 13:46:34 -0700 (PDT)
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
Subject: [PATCH v3 2/2] iio: adc: ad7944: use devm_spi_optimize_message()
Date: Mon, 24 Jun 2024 15:46:08 -0500
Message-ID: <20240624-devm_spi_optimize_message-v3-2-912138c27b66@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624-devm_spi_optimize_message-v3-0-912138c27b66@baylibre.com>
References: <20240624-devm_spi_optimize_message-v3-0-912138c27b66@baylibre.com>
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


