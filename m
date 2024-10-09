Return-Path: <linux-doc+bounces-26894-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CF9964F7
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 11:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EEB01C21E87
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 09:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6A8190079;
	Wed,  9 Oct 2024 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gK4I6E0Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72C18DF80
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728465588; cv=none; b=r0zwNStc0tHKPqol8wVP7zJx2RRNGS0M+PT6pzF/05n1ajClOPG6AZgIPk0bRLSSngmEdYPSjVgqBRwWXgEIY4fR9WZZtwiF0GPGi9HJI76TCAm3SOAzXE6aKmou5THSThJXtT3qlXrrUGZfila+zwHwguGpcstTVAFQg5+0X1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728465588; c=relaxed/simple;
	bh=i5ddTg9UYKxycz6OdhvhiiZOyT6VwY+Z1+h88aZcdf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdKQQKoNdvIvZu4DRId5skeq1X4zytUJ0CSgGsp7yTQJWspZbpy1SFzcUCgco7pm5VhvNoWqlFNEi5jLqxhFr7owdlfP6U6GVmyPBg+7CenXdeo1HW7+JLBXHtUxbpVlgZnFaEfu9cRKGY+e76xQJKLRMA4EYH+/84ZlLdegkks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gK4I6E0Y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43057f4a16eso8500375e9.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2024 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728465583; x=1729070383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h90tf0LvnuADZLFwaf8lb54SaNEZPrEuE8XroohvsMM=;
        b=gK4I6E0YXcYix3xCl0qM73jVpq9IVt1GzcItS9AMcDC01aQX/fQIJMEuakRcl8R9Aj
         C/EoIE+Lvl/ug3b/PfqwKIqKhbP+m/G8UyGzKVXRm39RlLcccGCV6QsoqDEaLETKHFKo
         gRtC1TAYE0JsSBnzP3mhUvB9D0w4VS8UShmOJuAjBZ6JAv6qQ3Q21DScXnC23Wbmxecq
         LRKTW62qAESP9lLc8JKRNMLbdMDCVuAAhNA/kJL2R3o8H0tPfngtCb3L5XQNLPMR0VFt
         olvh7Q8vxRtQ1h0B96McjDSZwbv9o43rWJHnA42Mo8OzuawnYWK7O99RRRfJ+251jd4O
         5qCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465583; x=1729070383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h90tf0LvnuADZLFwaf8lb54SaNEZPrEuE8XroohvsMM=;
        b=R7Fj2toCjtUAE7pzBBSUoS4GMMJ+Zh6mua6ImBRXApc3x8HXOhHOnH8kYJ99KWY9J8
         VsYiLAbjIcCklBPRSCCz5JcUEbD+fySNoJ2Yp0V41CMmC/2Od4cBmaTyX08JuHq/u7KF
         fNashGH1MOoflcelez3nrQikdLRt58OioWeKyjPSFaR6O21mTuhHcGxTIw4mwo2oZtWX
         4xJLDBoxoW2FaNZruvoxvKpELd6Hf8wUCoEA2mLUKM27hSb1CoqtuuVf4qHsvnORLfP8
         OBBkjvqIftN/50oySd2rX0a4RC6Q09+yMcvvWC6hKET2vNjAna9/E0rzs6+eEGcAvFUI
         bxig==
X-Forwarded-Encrypted: i=1; AJvYcCW1s4rbTerg5Q+qWyogFLNf1FlKi8Jf+g+3ZNXqpPrwWW4jadvvmdmYa8XDQ25FcooCHNeHWTAU87Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxw3NXL7b9shxXGIrUidyhgGFGHNIJzlL97RrgLmo8Ob1jEd27
	iOl6yZtriH2TwNsD44ZOW3gXCRO3pONe1AmlifWxHyPotResq1Kel7zm2roQ4kg=
X-Google-Smtp-Source: AGHT+IElACimG+6TwjNDTM+qcNBc3k1d495Knh8En6ogCVmjdYeIRzhQPpMAN7sQDp73kLPKsUKufA==
X-Received: by 2002:a05:600c:4706:b0:430:4db0:3fef with SMTP id 5b1f17b1804b1-430ccf3f49fmr12801225e9.15.1728465583009;
        Wed, 09 Oct 2024 02:19:43 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d59b1207sm13892765e9.31.2024.10.09.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 02:19:42 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Date: Wed, 09 Oct 2024 09:19:32 +0000
Subject: [PATCH v4 1/8] dt-bindings: iio: adc: ad7606: Remove spi-cpha from
 required
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-ad7606_add_iio_backend_support-v4-1-6971a8c0f1d5@baylibre.com>
References: <20241009-ad7606_add_iio_backend_support-v4-0-6971a8c0f1d5@baylibre.com>
In-Reply-To: <20241009-ad7606_add_iio_backend_support-v4-0-6971a8c0f1d5@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 aardelean@baylibre.com, dlechner@baylibre.com, jstephan@baylibre.com, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728465581; l=2087;
 i=gstols@baylibre.com; s=20240417; h=from:subject:message-id;
 bh=i5ddTg9UYKxycz6OdhvhiiZOyT6VwY+Z1+h88aZcdf0=;
 b=hZz/mRsl6+YEI2LEnuZTydZWDHLywT+t6zZIl3mZJRYm4Nlr+PT1obtugBuoKOJZI5Nh/R8PN
 bNbeUWoN1WICT0cuTktqkFSsg//KPUKZ3rXfd9PI4AJE65MGJMxV2BU
X-Developer-Key: i=gstols@baylibre.com; a=ed25519;
 pk=XvMm5WHuV67sGYOJZqIYzXndbaJOlNd8Q6li6vnb4Cs=

The documentation is erroneously stating that spi-cpha is required, and
the example is erroneously setting both spi-cpol and spi-cpha. According
to the datasheet, only cpol should be set.

On zedboard for instance, setting the devicetree as in the example will
simply not work.

Fixes: 416f882c3b40 ("dt-bindings: iio: adc: Migrate AD7606 documentation to yaml")
Fixes: 6e33a125df66 ("dt-bindings: iio: adc: Add docs for AD7606 ADC")
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index bec7cfba52a7..47081c79a1cf 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -39,6 +39,11 @@ properties:
   "#size-cells":
     const: 0
 
+  # According to the datasheet, "Data is clocked in from SDI on the falling
+  # edge of SCLK, while data is clocked out on DOUTA on the rising edge of
+  # SCLK".  Also, even if not stated textually in the datasheet, it is made
+  # clear on the diagrams that sclk idles at high.  Subsequently, in case SPI
+  # interface is used, the correct way is to only set spi-cpol.
   spi-cpha: true
 
   spi-cpol: true
@@ -168,7 +173,6 @@ patternProperties:
 required:
   - compatible
   - reg
-  - spi-cpha
   - avcc-supply
   - vdrive-supply
   - interrupts
@@ -255,7 +259,6 @@ examples:
             reg = <0>;
             spi-max-frequency = <1000000>;
             spi-cpol;
-            spi-cpha;
 
             avcc-supply = <&adc_vref>;
             vdrive-supply = <&vdd_supply>;
@@ -288,7 +291,6 @@ examples:
 
             spi-max-frequency = <1000000>;
             spi-cpol;
-            spi-cpha;
 
             avcc-supply = <&adc_vref>;
             vdrive-supply = <&vdd_supply>;

-- 
2.34.1


