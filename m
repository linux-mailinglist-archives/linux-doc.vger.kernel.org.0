Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB1C3FFB1A
	for <lists+linux-doc@lfdr.de>; Fri,  3 Sep 2021 09:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347994AbhICHah (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Sep 2021 03:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347888AbhICHaf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Sep 2021 03:30:35 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E845AC061575
        for <linux-doc@vger.kernel.org>; Fri,  3 Sep 2021 00:29:34 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u14so10126528ejf.13
        for <linux-doc@vger.kernel.org>; Fri, 03 Sep 2021 00:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HnKxxaQYNnWTD9UVNnr24MR8zjRJb29eptl0bMy8Qq4=;
        b=Qcz0qeTuAYOCren9Bte0rJrya/cpxtrK46NHFyqZw0Mlz1MB0RvC//GSaMk1pNJsge
         u1l1AxWZiJhMBK3JzofjfGSEYBUpXsUTMBf7NUbECF+itGa3CujJQbKacFN0ry9qY5sb
         uD0p6ZLx1KxONRQOhQCaMz4UJdNRNYFC7TLCEznC3HyfY1/arEYDJd+NiTAWJUrknYiV
         CPd+1Bm/vFwa4fA2rAD53RKml9MaerqrAEZcJj98yco2ot1fxHdEqhXaqZB3eT+HMsks
         kERZJGTZlreijmnTbeJsYTlUP9q9ayz1Y5ORKOI0wVDAFuuQ9zPqA3T3pzQC3Vrt0PV1
         HqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HnKxxaQYNnWTD9UVNnr24MR8zjRJb29eptl0bMy8Qq4=;
        b=M/0Yfwdmu6tSe8S3rDC59UP80xHD0h/wS8HXG8ntbUm4fCZTeAXMBnaBDdpumi7av9
         LTvAyISB/UVl1vbGIQC9SgKWLQosoRB/8e6Yf4gBZKOC16Pw5LAqzsmxbiv4ys5k6x2e
         yaou1Xhq7rEyKWUmegCLQnEeU1KewmjHKo2uJC+kR/PAchJxVQlKqRdYqtlM6ostyu4p
         TT6vxvTsLvV2EZTWHshs5rii9RHObCSJlQDJZuxyFEzVhRH5S/ZEzAW2po+DO8+edHEN
         93CnBWaPFR1kMd5/tbLDX/D3irt4r5Gp4pwGrnAxZtblj05Gr7cdOvqZopZCssc1A3Jk
         GxLw==
X-Gm-Message-State: AOAM531qiXlWqJvfHBD0PsCCGqU4MniYTpg2jxCfYiHOVf7nOaXbZZIj
        IWmUI5mgSzaWMVPq3vH4/NNpOw==
X-Google-Smtp-Source: ABdhPJwFO572GXMyC8Iym92Njj9JtaNsYe0AZpZmJobeLhP6IQXc2R3B8cIlE08zeVVXsXVevPaQ5g==
X-Received: by 2002:a17:906:d20a:: with SMTP id w10mr2724357ejz.426.1630654173566;
        Fri, 03 Sep 2021 00:29:33 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id a15sm2376969edr.2.2021.09.03.00.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 00:29:33 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     jic23@kernel.org, hdegoede@redhat.com, wens@csie.org,
        andriy.shevchenko@linux.intel.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 3/5] iio: adc: axp288_adc: convert probe to full device-managed
Date:   Fri,  3 Sep 2021 10:29:15 +0300
Message-Id: <20210903072917.45769-4-aardelean@deviqon.com>
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
 drivers/iio/adc/axp288_adc.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/adc/axp288_adc.c b/drivers/iio/adc/axp288_adc.c
index 5f5e8b39e4d2..a4b8be5b8f88 100644
--- a/drivers/iio/adc/axp288_adc.c
+++ b/drivers/iio/adc/axp288_adc.c
@@ -259,7 +259,7 @@ static int axp288_adc_probe(struct platform_device *pdev)
 	info->irq = platform_get_irq(pdev, 0);
 	if (info->irq < 0)
 		return info->irq;
-	platform_set_drvdata(pdev, indio_dev);
+
 	info->regmap = axp20x->regmap;
 	/*
 	 * Set ADC to enabled state at all time, including system suspend.
@@ -276,31 +276,12 @@ static int axp288_adc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(axp288_adc_channels);
 	indio_dev->info = &axp288_adc_iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
-	ret = iio_map_array_register(indio_dev, axp288_adc_default_maps);
+
+	ret = devm_iio_map_array_register(&pdev->dev, indio_dev, axp288_adc_default_maps);
 	if (ret < 0)
 		return ret;
 
-	ret = iio_device_register(indio_dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "unable to register iio device\n");
-		goto err_array_unregister;
-	}
-	return 0;
-
-err_array_unregister:
-	iio_map_array_unregister(indio_dev);
-
-	return ret;
-}
-
-static int axp288_adc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-
-	iio_device_unregister(indio_dev);
-	iio_map_array_unregister(indio_dev);
-
-	return 0;
+	return devm_iio_device_register(&pdev->dev, indio_dev);
 }
 
 static const struct platform_device_id axp288_adc_id_table[] = {
@@ -310,7 +291,6 @@ static const struct platform_device_id axp288_adc_id_table[] = {
 
 static struct platform_driver axp288_adc_driver = {
 	.probe = axp288_adc_probe,
-	.remove = axp288_adc_remove,
 	.id_table = axp288_adc_id_table,
 	.driver = {
 		.name = "axp288_adc",
-- 
2.31.1

