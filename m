Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28ECA1CFE
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 16:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfH2OiO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 10:38:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53716 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbfH2OiO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:38:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id 10so3984084wmp.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0MCSm3PwhLeVZkLTF5crXAvat1wv6lwOmpNcM2aNtkA=;
        b=goztYIZL91fhNd7Q0e26K36T37XhDMhY9r1mWBqLUP77R6Fca/IWYIh+pU/sYypGqo
         AIG/cl+IQsJe92KLYVP7WYP+kzkACZsg7acw0iy+0WZx20r844FMHvhbeOKMJMv/dhP9
         9u74rEDU8/G1ig3+CkThjhsIivLAjuuwAx7sWCga3Rd+lrYBmBgJvR0GvuzZxKjMHpt3
         2z2HfVRae22htdzMQrUZx+GKJ+yvVnsBwQJf9J34KxztRFUCbnTCI3NZoNbexHBsqm8u
         07vKriwVFgPbjcGmcHNRWIhhOl7N8L8er8KugnPooYnDy99GFGGcfC/UVPfNEEUFCQrr
         Y1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MCSm3PwhLeVZkLTF5crXAvat1wv6lwOmpNcM2aNtkA=;
        b=k4rf0EJPDHxVf/qJLe42KVVlkrb+qlOOt45iOLUanPrytjUdknohs667SFNcHIXVZs
         OM0ouzwDWSJrwshYyxio1JawCAVEDN5ZYF5H7/ec8/XfPAgHyQMFu6cjUYnZzbX/+vHc
         kWmnSKHKBpEQTANGK7Mt793ttUFwdj9rjfda0DUMAaR3rluws+FF4od5iziCUACHZlLN
         RtUHYU1e0XhTumIjeNvHj04RlHPETtQOiklqurvBPeKOHF8QQPFHn3rxgeJYisU6Px1w
         eQnjtX8KEysgCWjahE1/KwwEP6dQz7rP8EQz+oujM60qhMuWj+qc7d0F+NtGQrp8Nx2C
         6sfg==
X-Gm-Message-State: APjAAAUAryE8Ss4TPIduce7rFOaHzb/Q3lEoA7a7J/LG6uYi58vCKUC3
        lxhc0/dAS84Q2pUUjr2nApJzmw==
X-Google-Smtp-Source: APXvYqx9ZRM6jA7Xi+MPZwFdPZ5Ui7XDERLRN1q9Q5CY6ZlmVljwQAixjqmpTApxKlfRhibyItWZGQ==
X-Received: by 2002:a05:600c:254e:: with SMTP id e14mr1004275wma.150.1567089492368;
        Thu, 29 Aug 2019 07:38:12 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:11 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 8/9] gpio: xgene: use devm_platform_ioremap_resource_nocache()
Date:   Thu, 29 Aug 2019 16:37:41 +0200
Message-Id: <20190829143742.24726-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new devm_platform_ioremap_resource_nocache() helper for memory
range mapping instead of devm_ioremap_nocache() combined with a call to
platform_get_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-xgene.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 2918363884de..559b8e53c2e0 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -155,7 +155,6 @@ static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
 
 static int xgene_gpio_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct xgene_gpio *gpio;
 	int err = 0;
 
@@ -165,16 +164,9 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		err = -EINVAL;
-		goto err;
-	}
-
-	gpio->base = devm_ioremap_nocache(&pdev->dev, res->start,
-							resource_size(res));
-	if (!gpio->base) {
-		err = -ENOMEM;
+	gpio->base = devm_platform_ioremap_resource_nocache(pdev, 0);
+	if (IS_ERR(gpio->base)) {
+		err = PTR_ERR(gpio->base);
 		goto err;
 	}
 
-- 
2.21.0

