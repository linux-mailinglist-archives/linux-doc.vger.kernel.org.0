Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7591625DE28
	for <lists+linux-doc@lfdr.de>; Fri,  4 Sep 2020 17:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgIDPr1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Sep 2020 11:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgIDPrK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 11:47:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B18C061232
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 08:46:50 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l9so6513426wme.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2020 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZXNzTcdhYOLT/AXbUue/WL7HnvjNCgkZ3cLbmDzVGrc=;
        b=RrJg++r4d2sHRcNO3FHpdXscTwZC2S1z6mTa4gXaNzK1juMkhcaKgspDfWpLneE8ew
         tHNr9Istt1yOiqL4bpXNH0QTSrkeP/0+Sm0lWzrBSnNzA8Ipt1xnsSsJLqMRrfXfgPdL
         ByP89m21osn8Id9E+Wyld2kuBz/37527FByOq0o3H71SYeQv7QKjZwhPK8OLk7ZZ1+ln
         E6BINQjI5QOfdhbly6Mg+N5QR3sey2pYn/ItHPnMoSmlC2iJkFNPzpvM5K7zwL6RYcjj
         gqdPy1/YiAdUWwlNY/7Qrbz14NPumdr00luxiTymMknoqxMZo8w0KTk1eN2juH0xrC0s
         99hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZXNzTcdhYOLT/AXbUue/WL7HnvjNCgkZ3cLbmDzVGrc=;
        b=iNKP3z18RIOqbOFmTgNYvL332n3z0JNFHmZ1g14XtTb8Ufm8H0Cd/W8alB2LfQEPQf
         lqefNo0x1Ex+Hk4W3bpztAiGI1vOO8cTyNyCqP8fJya8wAZz7hVRtUoM9go5oqSKd+7e
         P36gmQf3dWd9VyN0QJPk4dnqu7BkPSwcPEz9v0tBki9hD7+FVi5z0cni6SOT3anMucqM
         W7nzn1qdS4MghML0IlDm5RK+t94pFsaBsir5QzKkDAvYxw+lv67l6R3hdMYIuKBM2Pfg
         XvPqS7Q/Uk8v70TvmNZDV4Qtedu4cMxshNQH4/xxwdsy7CZOA1JzM5Pn+OIX45tF9Apr
         vh6w==
X-Gm-Message-State: AOAM532F6qAlw94nvr6NWWaGIfjw2ViqByma4J9Et6+9A3wyD/xjrEns
        uO0y7txowjwdfeAWw8RoU07r4w==
X-Google-Smtp-Source: ABdhPJxbT8FJfkefQNct8r1fnLwo5GotdwatKA46ZNCj44Ghck2jGtAw2L6A6tWWrFk0Rc/2fDW1Jg==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr8253559wmc.188.1599234408930;
        Fri, 04 Sep 2020 08:46:48 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 15/23] gpio: mockup: use dynamic device IDs
Date:   Fri,  4 Sep 2020 17:45:39 +0200
Message-Id: <20200904154547.3836-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're currently creating chips at module init time only so using a
static index for dummy devices is fine. We want to support dynamically
created chips however so we need to switch to dynamic device IDs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 96976ba66598..995e37fef9c5 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -9,6 +9,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/gpio/driver.h>
+#include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
@@ -70,6 +71,8 @@ module_param_named(gpio_mockup_named_lines,
 
 static struct dentry *gpio_mockup_dbg_dir;
 
+static DEFINE_IDA(gpio_mockup_ida);
+
 static int gpio_mockup_range_base(unsigned int index)
 {
 	return gpio_mockup_ranges[index * 2];
@@ -480,8 +483,12 @@ static LIST_HEAD(gpio_mockup_devices);
 
 static void gpio_mockup_unregister_one_device(struct gpio_mockup_device *dev)
 {
+	int id;
+
 	list_del(&dev->list);
+	id = dev->pdev->id;
 	platform_device_unregister(dev->pdev);
+	ida_free(&gpio_mockup_ida, id);
 	kfree(dev);
 }
 
@@ -587,12 +594,19 @@ static int __init gpio_mockup_init(void)
 		}
 
 		pdevinfo.name = "gpio-mockup";
-		pdevinfo.id = i;
 		pdevinfo.properties = properties;
 
+		pdevinfo.id = ida_alloc(&gpio_mockup_ida, GFP_KERNEL);
+		if (pdevinfo.id < 0) {
+			kfree_strarray(line_names, ngpio);
+			err = pdevinfo.id;
+			goto err_out;
+		}
+
 		mockup_dev = kzalloc(sizeof(*mockup_dev), GFP_KERNEL);
 		if (!mockup_dev) {
 			kfree_strarray(line_names, ngpio);
+			ida_free(&gpio_mockup_ida, pdevinfo.id);
 			err = -ENOMEM;
 			goto err_out;
 		}
@@ -601,6 +615,7 @@ static int __init gpio_mockup_init(void)
 		kfree_strarray(line_names, ngpio);
 		if (IS_ERR(mockup_dev->pdev)) {
 			pr_err("error registering device");
+			ida_free(&gpio_mockup_ida, pdevinfo.id);
 			kfree(mockup_dev);
 			err = PTR_ERR(mockup_dev->pdev);
 			goto err_out;
-- 
2.26.1

