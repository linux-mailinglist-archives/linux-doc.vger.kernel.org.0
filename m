Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E17327C1ED
	for <lists+linux-doc@lfdr.de>; Tue, 29 Sep 2020 12:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgI2KK3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Sep 2020 06:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgI2KKZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 06:10:25 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76944C0613D5
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:25 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k10so4701130wru.6
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=phntrgnCeepxMe1Wdlpj5QWGZ7tKYeInWBovaO/TaFE=;
        b=JXc/8RJh1lusF2I0iw3khGo/dO8pv1/TNjPfhH6pcbNwCf7PSCJre5vB3wzDZnAmLo
         vV84UAqdfInBgDj/6df9pA5/CIqJTu8Tf1/rDQRzCoLqmQIo+6a6d5YX1t0pCtWOVuhd
         dA7u0nRgDVXky8fVIFOpYVMMtseCeitUFTi7czQb0coJxQGwjMtRNiScQYhyQXycvqJM
         vdCIsz7vX/qbm/tfLvnbMV7CZGhZyqAnrWri3Ml9EcsOJQTSLpqFzuYOkELDm1Q5m/Qo
         7Bw2cPLUBPNuk65xTfu/vp065Bs6UfrY2HzwXGhmSk02sBaqw4ilNR3mzPTCxa9mwNmG
         TRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=phntrgnCeepxMe1Wdlpj5QWGZ7tKYeInWBovaO/TaFE=;
        b=rHCGzNRRUcwTY12O4WLktGxlWLC741phSb/HJlbeX7839VfTDtQ8/iHAArPttqsRPc
         31UjxbpA09nYW067Scjb//VBpwhtT7itoHwMAdb1h+JLIF1DtZPcnnI9+K6BfCX7NaLh
         6pYzyLhind+jJgi7D4GND6fFvLB12Gm754QlQoS/BaqOCxyHqugHNO+DLCx+cQEDmYPd
         ARjTSAOAuYU57VLbWnnwqBW0HUjx07MeRryZKLuLmYfwO0OaRSpqtke4Rm1511p8FPZ3
         BHCiyzzMBHydbjbfVRcHMt9FsIg17CR72vkTkWezrJgMSOyskBv3YMyW8cm7J5gqvr1y
         0o2Q==
X-Gm-Message-State: AOAM530LcfNlD4n1Ml+Wf2026718GVv+kBfiF9SFiVmdnkGgAr4Wk+8p
        H4tQkZZy0D7OQ2g3oPx8jzHCqg==
X-Google-Smtp-Source: ABdhPJz6v4FwPTusQcod2iJJLQ4tN4Upb+tkpwWZmdqvj8rDLeQAl3l7asD47AC95qxevt2mQXydOw==
X-Received: by 2002:adf:e58b:: with SMTP id l11mr3609258wrm.210.1601374224157;
        Tue, 29 Sep 2020 03:10:24 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 08/10] gpio: mockup: pass the chip label as device property
Date:   Tue, 29 Sep 2020 12:10:02 +0200
Message-Id: <20200929101004.20288-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

While we do check the "chip-name" property in probe(), we never actually
use it. Let's pass the chip label to the driver using device properties
as we'll want to allow users to define their own once dynamically
created chips are supported.

The property is renamed to "chip-label" to not cause any confusion with
the actual chip name which is of the form: "gpiochipX".

If the "chip-label" property is missing, let's do what most devices in
drivers/gpio/ do and use dev_name().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 856ba5da1e8c..1466f480aacd 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -429,21 +429,14 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (rv)
 		return rv;
 
-	rv = device_property_read_string(dev, "chip-name", &name);
+	rv = device_property_read_string(dev, "chip-label", &name);
 	if (rv)
-		name = NULL;
+		name = dev_name(dev);
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	if (!name) {
-		name = devm_kasprintf(dev, GFP_KERNEL,
-				      "%s-%c", pdev->name, pdev->id + 'A');
-		if (!name)
-			return -ENOMEM;
-	}
-
 	mutex_init(&chip->lock);
 
 	gc = &chip->gc;
@@ -523,6 +516,7 @@ static int __init gpio_mockup_init(void)
 	int i, prop, num_chips, err = 0, base;
 	struct platform_device_info pdevinfo;
 	struct platform_device *pdev;
+	char chip_label[32];
 	u16 ngpio;
 
 	if ((gpio_mockup_num_ranges < 2) ||
@@ -556,6 +550,11 @@ static int __init gpio_mockup_init(void)
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 		prop = 0;
 
+		snprintf(chip_label, sizeof(chip_label),
+			 "gpio-mockup-%c", i + 'A');
+		properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
+							   chip_label);
+
 		base = gpio_mockup_range_base(i);
 		if (base >= 0)
 			properties[prop++] = PROPERTY_ENTRY_U32("gpio-base",
-- 
2.26.1

