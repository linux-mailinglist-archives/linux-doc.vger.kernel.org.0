Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D508927701D
	for <lists+linux-doc@lfdr.de>; Thu, 24 Sep 2020 13:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbgIXLjE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Sep 2020 07:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbgIXLjD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 07:39:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172DAC0613D7
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:39:01 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so3429193wrx.7
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yQHFpzhsra7eF21NOHukB6Qo7UOtUhx3yAmCZtWq61g=;
        b=r8b8KCmCtWNNk5vpqJp3h6gV8JUjmH+9nkgQlRWIpvpCe15Egu+DmAzUrIe0+Yt96W
         Rij7NuiRrkA3uJ7qfOLBfpyvflwiXdGU3TxfNluhmbILQfpFYnkDj+8n7mrewCAafUvr
         /truc/o799wMS7i6DaMzbM1H/F4/u3uulFwzcrkGDiWOQ4LW8f53YwWnu33SoNbT4elg
         4/tWzUdMAriSaZmVmogZOM9qD5aFcYT3/6SHnRktCdE0tNgZqKUbTdFyJWwo68d/8Yct
         oJcH35ymLp6PEkL/omBLkdbMfZ7Xxq/iD0Wr9cxKGVA/CM/JjjOMRhRpBl9LQkKJ04PJ
         CCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yQHFpzhsra7eF21NOHukB6Qo7UOtUhx3yAmCZtWq61g=;
        b=WMJPRfv96NJ1lhW2iqhZb1NwlesTRRZ6dOJ4O/aU8/hG4cAEQDMbFbZ8wAv+V7bA7Z
         SlZqtRkIuLCWa6Oyi19tyOze7XSCfojLOaJGBdLFzC9ll0zkqXuVmaMhy9E4+dRarv1L
         iJEIdjmv6bpc8c2XKc8TnK7H3kUBaFxXGmV9++/H5BoLILW2pa7xDigTvAYj+RV5i3Dc
         Gpt/pQqbpFDwRNG2plPjzGZcXCHjeyDVPOLnFZgdfoHzlWJrMEk4SRibhAfSn0VKZiCV
         AnCSjbK+RykA67dI03oiCEb+naaUgOliY78iyiBpqYdmjSgZJIYB1OJ48/BYuEsKOz5x
         WeUQ==
X-Gm-Message-State: AOAM531l0FqZVu5VDZXLiMTO6nfamNm6qKQcgV+hxzmOK+OaqZowrNSS
        E81d5UKT1H9h0CKZzNOWvX6Q/w==
X-Google-Smtp-Source: ABdhPJxGiaGWw+Oo0LZopqCdypwJOIA8psg2/o3jQx2VSOTghc7eAxRwv5BwZ+SEVu1hHvtfdhg5kQ==
X-Received: by 2002:adf:a4cc:: with SMTP id h12mr4555529wrb.123.1600947539806;
        Thu, 24 Sep 2020 04:38:59 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id y207sm3390133wmc.17.2020.09.24.04.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 04:38:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 7/9] gpio: mockup: pass the chip label as device property
Date:   Thu, 24 Sep 2020 13:38:40 +0200
Message-Id: <20200924113842.11670-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200924113842.11670-1-brgl@bgdev.pl>
References: <20200924113842.11670-1-brgl@bgdev.pl>
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
index de778b52f355..5b2686f9e07d 100644
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

