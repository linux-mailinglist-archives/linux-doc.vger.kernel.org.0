Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2FC3FFB20
	for <lists+linux-doc@lfdr.de>; Fri,  3 Sep 2021 09:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348022AbhICHak (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Sep 2021 03:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347985AbhICHag (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Sep 2021 03:30:36 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69F8C0613D9
        for <linux-doc@vger.kernel.org>; Fri,  3 Sep 2021 00:29:36 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id e21so10139721ejz.12
        for <linux-doc@vger.kernel.org>; Fri, 03 Sep 2021 00:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sRN51ITeio36BmKOZHKuYdDeMC2KiPiz4hRTJqGRHxs=;
        b=oZ1/GD10pNbTMqZtG5+WSMrYwZ4exKqLG39SvVuQCVfzu8qWE2S18uVjXyusAQkrof
         Z4XCWsLG/I+BdV2gqMTh2eWNpIqSr2OPBk/XLhWtoIAO0Fx/TMRoEs2jOyOFo3cyK3qV
         79btbZKWwFRXJcwo09LcFKO8xguxT5iMjJSYqd5XG++7OhQj4AnU+45LDzM3bMxnGqSc
         j9/SdEzP/FXCIZSE0AHDe0LJtafs0ezwaUr68OwkwbJyC7yC3ssvfNpPGYTj8LjGwdzl
         M6cwWwztzQVs2+4Z+/P/fHcTaVffnFBvAze7f5qCf5lOc+IuQdyRkJQp4Q7pe3EUwq4J
         Tzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sRN51ITeio36BmKOZHKuYdDeMC2KiPiz4hRTJqGRHxs=;
        b=dzhRsMLSKGGXkozoATAnMFt8hR1MhtJ2bVVkiCF6/sAsXlmTAKedeygemEY2GiIkuB
         EdqbeNF6P4b6owIclsGGfa5AUS2LvgAqT6HlJWmKMM4LKKuve9wUE5GDctA02en2IUZV
         FEU4gmmwqkjKXLgMoPJYeNrZuQv7mKyrtBMZUIleuTaX5VD21mrM3Q1cnnsjJgEBAAB6
         gQRb30CLmojELQHA86CstxUcZVea5PUXHPel4lOcBmTC1pCdYEL0o/vyiYXAV9/E0bbT
         odEedyE7M/OP8vAh6KrPJuiTHlpwYfNPYKMgWcfxjw9pUiyea3qHKJ4Pw1oGqhWwhTnu
         zNnw==
X-Gm-Message-State: AOAM532JBFS4rU0ovw5GdZMh6uClEu4DdQlVI2ZVrIOAVe7WLKTDD6gd
        MvqtGF72a5/+LOkgGpzmAi3BLw==
X-Google-Smtp-Source: ABdhPJwbhypXgxq1/5TethM8Z4YGTujtW6LmbFATe/BLTvGE9aRV0BhnY8h/3yWGG2cENQ4zQ+0wGQ==
X-Received: by 2002:a17:906:d045:: with SMTP id bo5mr2648333ejb.461.1630654175433;
        Fri, 03 Sep 2021 00:29:35 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id a15sm2376969edr.2.2021.09.03.00.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 00:29:35 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     jic23@kernel.org, hdegoede@redhat.com, wens@csie.org,
        andriy.shevchenko@linux.intel.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 5/5] iio: adc: da9150-gpadc: convert probe to full-device managed
Date:   Fri,  3 Sep 2021 10:29:17 +0300
Message-Id: <20210903072917.45769-6-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903072917.45769-1-aardelean@deviqon.com>
References: <20210903072917.45769-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This change converts the probe of this driver to use device-managed
functions only, which means that the remove hook can be removed.
The remove hook has only 2 calls to iio_device_unregister() and
iio_map_array_unregister(). Both these can now be done via devm register
functions, now that there's also a devm_iio_map_array_register() function.

The platform_set_drvdata() can also be removed now.

This change also removes the error print for when the iio_device_register()
call fails. This isn't required now.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/iio/adc/da9150-gpadc.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/adc/da9150-gpadc.c b/drivers/iio/adc/da9150-gpadc.c
index 7a7a54a7ed76..8f0d3fb63b67 100644
--- a/drivers/iio/adc/da9150-gpadc.c
+++ b/drivers/iio/adc/da9150-gpadc.c
@@ -330,7 +330,6 @@ static int da9150_gpadc_probe(struct platform_device *pdev)
 	}
 	gpadc = iio_priv(indio_dev);
 
-	platform_set_drvdata(pdev, indio_dev);
 	gpadc->da9150 = da9150;
 	gpadc->dev = dev;
 	mutex_init(&gpadc->lock);
@@ -347,7 +346,7 @@ static int da9150_gpadc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = iio_map_array_register(indio_dev, da9150_gpadc_default_maps);
+	ret = devm_iio_map_array_register(&pdev->dev, indio_dev, da9150_gpadc_default_maps);
 	if (ret) {
 		dev_err(dev, "Failed to register IIO maps: %d\n", ret);
 		return ret;
@@ -359,28 +358,7 @@ static int da9150_gpadc_probe(struct platform_device *pdev)
 	indio_dev->channels = da9150_gpadc_channels;
 	indio_dev->num_channels = ARRAY_SIZE(da9150_gpadc_channels);
 
-	ret = iio_device_register(indio_dev);
-	if (ret) {
-		dev_err(dev, "Failed to register IIO device: %d\n", ret);
-		goto iio_map_unreg;
-	}
-
-	return 0;
-
-iio_map_unreg:
-	iio_map_array_unregister(indio_dev);
-
-	return ret;
-}
-
-static int da9150_gpadc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-
-	iio_device_unregister(indio_dev);
-	iio_map_array_unregister(indio_dev);
-
-	return 0;
+	return devm_iio_device_register(&pdev->dev, indio_dev);
 }
 
 static struct platform_driver da9150_gpadc_driver = {
@@ -388,7 +366,6 @@ static struct platform_driver da9150_gpadc_driver = {
 		.name = "da9150-gpadc",
 	},
 	.probe = da9150_gpadc_probe,
-	.remove = da9150_gpadc_remove,
 };
 
 module_platform_driver(da9150_gpadc_driver);
-- 
2.31.1

