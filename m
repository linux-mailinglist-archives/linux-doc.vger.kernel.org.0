Return-Path: <linux-doc+bounces-15434-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E98B6681
	for <lists+linux-doc@lfdr.de>; Tue, 30 Apr 2024 01:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9C3CB22156
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 23:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451AE19DF65;
	Mon, 29 Apr 2024 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K9iiAVNG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A750199EB5
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 23:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714434041; cv=none; b=Z/Cz3OexkUWDNz7UDJ+1npyUpRfAkAZytOoOfhWWmMZmLBqRLA1Gen/kZ9j8yb9nCm4wbbGTVik25wrpq13/zlz0ZHytA04ODcVLe547w2mwuEx8XVKp4FspqcYh/CSeH/eJHdaPwMNGx6ZOS41NkXO9PfpRuAR11jX/eAzS3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714434041; c=relaxed/simple;
	bh=NUwBgmeSK3VKvI/ARdfWUNBS7Wbg1ExrHA4koeGcxm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ems/P6jMIBkQD1Gb5uzxi8rulVJi0jw6cE2q7tK6s7muuShz7s+4yH6j70OIkJw0pr0B4yyPT8tO2I4yF/6bURyoupDRfbPAY/JbJCpfOeB9CypVkp73v5D+cAgF71q7zSUIRFmOUrdZWnc2LnMFWdqMGFeIBzp/yS4VXhd1XEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K9iiAVNG; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2390335b67cso1438892fac.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 16:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714434037; x=1715038837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7M5L1jF+Kp9rDaa/Fjma53dz8N5rl7gUPtDyE6LZUDo=;
        b=K9iiAVNGKN9MnTEvkvb9qzEjylwdt6PrKJCjK9jUaNjF16En1bFd4+xCl4WyRd+uCL
         UIfmPB/fp8yLBc45WWscm51b75qPYC4MtQbIEgu94CQGdVZA0s7hzhZfNfLSIXO7E0jh
         RmcCp/UP0zMof4hTTwHGCj7DEI+NX5bDwgA/TOBWKWEC49Df09pZF1Pa9g2RBsvtKUba
         HA1ZLnNv2P5rq2PxWJJvfwlXa0IXwqK8QIX6jkytXacyZfxLkSV+W8RWMezm9Xr8TCSW
         utH/sYhCB+06jqlw2i8q0TGwY3a+nNwURYJ1EGChrnMqoZgF7xvP552JddzIgrDsd4Tk
         1VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714434037; x=1715038837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7M5L1jF+Kp9rDaa/Fjma53dz8N5rl7gUPtDyE6LZUDo=;
        b=q1/1bnUaycqMCdQeggKzaWTjjNiFiJJoFkgLlFhZ+kwOQGMqtbdRJLqrw+GDuFLGqM
         27DAtPrZQJApFNj51k/L/Epphvrwt+INH1xONbtWx+n8SDVY/oMkWCQTzz1S0sMi56gm
         6mRP7C+tFcrK+0FLoYhkyJZ/e3dtSoQzMLCtiD7YUt787Qp1Izno7kPxdqVXJZB7O4k+
         wnxqfB5XJqoNsziyhdZsT1lFXFxwWQd6hnr/o63HdyBCuWeD47gI6u44LbuyxW2j/9iU
         d8GYaIP6jfmo4Pn/z2VIrfU5ir0LV5XVtBXWtFvkZlB4D+REfRU1wALiAtA0knV8aEur
         l9tw==
X-Forwarded-Encrypted: i=1; AJvYcCUkg4tmnEWoOpTRlPNWMWW5p4GtlmHDPzmShrG4CgPgNvLqwZ0YfyVlTcgyM0ovFqaJv+6CJUav4zq+Z9Vi0vKqA2Bsq5rP6nD2
X-Gm-Message-State: AOJu0YwGbVN2WVHvmBG+Nr2cNjWqc+yrzEpE69AZXyrDptY9PtlK+RVE
	q6e1DPvXyOPhy9A0bNG79KvjKfSmDrAfWSSqFa5zTvubbi/PNXGeNchisOSy+UA=
X-Google-Smtp-Source: AGHT+IEkVlk2cV8mp+ZOarfU3l4tFQus8TZbqOG542aqbSglrecsjyn0xdubyW2FSqkOsnvvP58lDA==
X-Received: by 2002:a05:6870:1604:b0:22e:dea0:83c6 with SMTP id b4-20020a056870160400b0022edea083c6mr14055773oae.10.1714434037262;
        Mon, 29 Apr 2024 16:40:37 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id hp22-20020a0568709a9600b0023b58aa20afsm2144508oab.25.2024.04.29.16.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 16:40:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 3/7] hwmon: (da9052) Use devm_regulator_get_enable_read_voltage()
Date: Mon, 29 Apr 2024 18:40:11 -0500
Message-ID: <20240429-regulator-get-enable-get-votlage-v2-3-b1f11ab766c1@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
References: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

We can reduce boilerplate code by using
devm_regulator_get_enable_read_voltage().

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
* rename to devm_regulator_get_enable_read_voltage()
* add local variable tsiref_uv instead of using err
* restored error message via dev_err_probe()
* shortened pdev->dev to dev in lines we are touching anyway
---
 drivers/hwmon/da9052-hwmon.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index 2bd7ae8100d7..7fb0c57dfef5 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -26,7 +26,6 @@ struct da9052_hwmon {
 	struct mutex		hwmon_lock;
 	bool			tsi_as_adc;
 	int			tsiref_mv;
-	struct regulator	*tsiref;
 	struct completion	tsidone;
 };
 
@@ -397,7 +396,7 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct da9052_hwmon *hwmon;
 	struct device *hwmon_dev;
-	int err;
+	int err, tsiref_uv;
 
 	hwmon = devm_kzalloc(dev, sizeof(struct da9052_hwmon), GFP_KERNEL);
 	if (!hwmon)
@@ -414,32 +413,20 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 		device_property_read_bool(pdev->dev.parent, "dlg,tsi-as-adc");
 
 	if (hwmon->tsi_as_adc) {
-		hwmon->tsiref = devm_regulator_get(pdev->dev.parent, "tsiref");
-		if (IS_ERR(hwmon->tsiref)) {
-			err = PTR_ERR(hwmon->tsiref);
-			dev_err(&pdev->dev, "failed to get tsiref: %d", err);
-			return err;
-		}
-
-		err = regulator_enable(hwmon->tsiref);
-		if (err)
-			return err;
-
-		hwmon->tsiref_mv = regulator_get_voltage(hwmon->tsiref);
-		if (hwmon->tsiref_mv < 0) {
-			err = hwmon->tsiref_mv;
-			goto exit_regulator;
-		}
+		tsiref_uv = devm_regulator_get_enable_read_voltage(dev->parent,
+								   "tsiref");
+		if (tsiref_uv < 0)
+			return dev_err_probe(dev, tsiref_uv,
+					     "failed to get tsiref voltage\n");
 
 		/* convert from microvolt (DT) to millivolt (hwmon) */
-		hwmon->tsiref_mv /= 1000;
+		hwmon->tsiref_mv = tsiref_uv / 1000;
 
 		/* TSIREF limits from datasheet */
 		if (hwmon->tsiref_mv < 1800 || hwmon->tsiref_mv > 2600) {
 			dev_err(hwmon->da9052->dev, "invalid TSIREF voltage: %d",
 				hwmon->tsiref_mv);
-			err = -ENXIO;
-			goto exit_regulator;
+			return -ENXIO;
 		}
 
 		/* disable touchscreen features */
@@ -456,7 +443,7 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(&pdev->dev, "Failed to register TSIRDY IRQ: %d",
 				err);
-			goto exit_regulator;
+			return err;
 		}
 	}
 
@@ -472,9 +459,6 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 exit_irq:
 	if (hwmon->tsi_as_adc)
 		da9052_free_irq(hwmon->da9052, DA9052_IRQ_TSIREADY, hwmon);
-exit_regulator:
-	if (hwmon->tsiref)
-		regulator_disable(hwmon->tsiref);
 
 	return err;
 }
@@ -483,10 +467,8 @@ static void da9052_hwmon_remove(struct platform_device *pdev)
 {
 	struct da9052_hwmon *hwmon = platform_get_drvdata(pdev);
 
-	if (hwmon->tsi_as_adc) {
+	if (hwmon->tsi_as_adc)
 		da9052_free_irq(hwmon->da9052, DA9052_IRQ_TSIREADY, hwmon);
-		regulator_disable(hwmon->tsiref);
-	}
 }
 
 static struct platform_driver da9052_hwmon_driver = {

-- 
2.43.2


