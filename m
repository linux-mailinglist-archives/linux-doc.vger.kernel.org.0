Return-Path: <linux-doc+bounces-12892-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425B88F2DE
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 00:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FA029CDA8
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 23:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED37156642;
	Wed, 27 Mar 2024 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FLsxfZAK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C9155314
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581551; cv=none; b=YJQDXDqN6QNpgfmfIYdASXeTwNrelCkgUIwCAVD0meYvxAtIwx3JMM/pacuUFE/J9zC4XMCA+bgp6D9UBZAcIfVvqVKhoIvbOkkUVVIvsptSYpN9RnfssoXYPPGGdOwVIAeid4ur0QYZkpeUoSr44x6/SIL6md7fSARk4IwMb1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581551; c=relaxed/simple;
	bh=A4uSmS5u3AK9wMfER4kmGXxo9e/XTrxNUtjD7xNvI4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=auRwXLh0JfZfuzmElieUtqzE2UNtmDOXm5BeyCRRvS1JsVDpAd9uYMFskN0/njCZZ7YV93MUGjaWTM2HaDBSLzmNRKTFjU3YBL4iO1Z+ybRNH0CY/qDq1qXqj9h0PO2S9N6aThmI+rOSrk9ThLIqOmk3x2ljyrMQ3TVLa5rcCAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FLsxfZAK; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so260873fac.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581546; x=1712186346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOfZtVlJMTFXxAc7ahXTmKHh36zHepITVD/rnFowmPs=;
        b=FLsxfZAKh8BjbYm+W01YP6N9iWrZlkBqSxRPHWnUHgqpCx5D+hoSXzK58imousK9Jb
         tMT6sFicqC9WDhjTchTLsmOeEhxFR0aobDj0WnMsS05W3QTJ+28lAoCS2bUWPQUbk/jj
         hqnQLOV9/Gfmbl0VHuHvpyHP1Xe+rMMvo/xfRog1B9w89nZ3Q8P3CbslgVTf60lgYg19
         UthiN4N8FT07gmwWjRlNc7tMtY2+QV46a5pGHH9a6/L2cDgzcFKMsTCvfBPmoT5uA0nq
         4+jDkN0qHK9647BPUdLTfN1ZeygEkUzjwHfHh8r3ovZd6bw5W1AV1Aqy6ujpS8qh4AEE
         gjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581546; x=1712186346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOfZtVlJMTFXxAc7ahXTmKHh36zHepITVD/rnFowmPs=;
        b=WOqZzkHS9Bx+qzcNrm8olc4pyASSJg3CY6Dd7TQT+icVJGfM3/K/KS0l4igzF3up6Q
         Uu5hQ0rf25oSgE9tf2uaFgIMTyZU0PwwtYpTufH7RIlSbd8jWR/rxjNYoXw8NPIMy+nP
         +XIIaBcveCfHm69nF0EkSqj9Xy99Vac2pkqyDYYhk+7rTe1RaR5VC1QDa38ZcP+OPZ7H
         1pTjACacvl/UqDV10dclXHD0wQE4RGwWAPnHDRRLQSSseNXZTN2d8ZsRB1VFxq+gRbL6
         7jSmrkCoImjTL6NUllJ8TcHKtJ7hfRlR01+gcjoA3TtDpbndmo/HEYc4QpoOpGe1ATi3
         h/lA==
X-Forwarded-Encrypted: i=1; AJvYcCXPu6z5n8MozmgermGftsojg7QDF2nrCqd2r8qK4N96QJJ01Uc8IIajPSU56ry7zWF8+JMK2SOWgcYZ9CoLW5Wi+me0MAD17jyY
X-Gm-Message-State: AOJu0Ywe+AbCbN2sHSaNXPXuPCHBgEa7NG3z0yO4O+otoR/NgtJojdC+
	ixYeIowY72ijdS0jHX8OcWHAhYS0SACAznGjmmqIMVVhZaPK7ue+AWwDrl8CsLo=
X-Google-Smtp-Source: AGHT+IHDalMeGbYz9hAS9r44V5EAC6s0DOMiI1r9BYhrkzsEOWfvPSTNn7XD4XpPvS+TyN3y5eBfbA==
X-Received: by 2002:a05:6870:d14a:b0:22a:4e4e:4d9d with SMTP id f10-20020a056870d14a00b0022a4e4e4d9dmr1284999oac.11.1711581545937;
        Wed, 27 Mar 2024 16:19:05 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:05 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH RFC 3/7] hwmon: (da9052) Use devm_regulator_get_enable_get_voltage()
Date: Wed, 27 Mar 2024 18:18:52 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-3-5f4517faa059@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
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
devm_regulator_get_enable_get_voltage().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/hwmon/da9052-hwmon.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index 2bd7ae8100d7..70e7bc72e980 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -26,7 +26,6 @@ struct da9052_hwmon {
 	struct mutex		hwmon_lock;
 	bool			tsi_as_adc;
 	int			tsiref_mv;
-	struct regulator	*tsiref;
 	struct completion	tsidone;
 };
 
@@ -414,32 +413,19 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 		device_property_read_bool(pdev->dev.parent, "dlg,tsi-as-adc");
 
 	if (hwmon->tsi_as_adc) {
-		hwmon->tsiref = devm_regulator_get(pdev->dev.parent, "tsiref");
-		if (IS_ERR(hwmon->tsiref)) {
-			err = PTR_ERR(hwmon->tsiref);
-			dev_err(&pdev->dev, "failed to get tsiref: %d", err);
+		err = devm_regulator_get_enable_get_voltage(pdev->dev.parent,
+							    "tsiref");
+		if (err < 0)
 			return err;
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
 
 		/* convert from microvolt (DT) to millivolt (hwmon) */
-		hwmon->tsiref_mv /= 1000;
+		hwmon->tsiref_mv = err / 1000;
 
 		/* TSIREF limits from datasheet */
 		if (hwmon->tsiref_mv < 1800 || hwmon->tsiref_mv > 2600) {
 			dev_err(hwmon->da9052->dev, "invalid TSIREF voltage: %d",
 				hwmon->tsiref_mv);
-			err = -ENXIO;
-			goto exit_regulator;
+			return -ENXIO;
 		}
 
 		/* disable touchscreen features */
@@ -456,7 +442,7 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(&pdev->dev, "Failed to register TSIRDY IRQ: %d",
 				err);
-			goto exit_regulator;
+			return err;
 		}
 	}
 
@@ -472,9 +458,6 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 exit_irq:
 	if (hwmon->tsi_as_adc)
 		da9052_free_irq(hwmon->da9052, DA9052_IRQ_TSIREADY, hwmon);
-exit_regulator:
-	if (hwmon->tsiref)
-		regulator_disable(hwmon->tsiref);
 
 	return err;
 }
@@ -483,10 +466,8 @@ static void da9052_hwmon_remove(struct platform_device *pdev)
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


