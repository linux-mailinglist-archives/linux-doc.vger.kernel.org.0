Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC71CDFFC4
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2019 10:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388593AbfJVInd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Oct 2019 04:43:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55866 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388580AbfJVInd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 04:43:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id g24so6998074wmh.5
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 01:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZ1Tq+ivlbf6wvBItm5ezP35meDLqciZhTnvN+fTm4c=;
        b=qo2Rv1Z0eU58gxydRv0Vkp/sQ4ZWOor6U2TGeot378xkLW05i6u8erMQgr5oTHKHDE
         ie3oe1p7R28yNhdIv0Ox+XUpoVLlU4ZyalBZ08W7riO+HoNlWafKNM42GDBgZM0CHAAY
         TnMcpNxXsHkCVWyik9ycmBgZg5fl4VOocfRl0Zr9v6tznkse8nh9Skjvo3aEjbk7h6YO
         FX1ZYt1w4gxxusYkyZ8pJnPEQ7jGXeBOUUwL7jaHIXsCDFWpSRjngYt9KpKFJ9N0QbWZ
         lq2tWMsPL4Dn7dp0/0MLW12TNCSeB3deS4yWiUb6GMmP8nD8kvI4QOf9ktGRYUHXzs/g
         FUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZ1Tq+ivlbf6wvBItm5ezP35meDLqciZhTnvN+fTm4c=;
        b=TAndGAxqW7zCcto7i5EGCW6c+NiKu5YALW9sZr/lh1AMPxf5TRxTXTxikmI3y93Ql1
         004a64WIMjyRPX4gQPf4Nvdd7b19XpZw/WU2tXcsqLA1Ij0NeuFO+oH60Nr2MH6C+Zoc
         sUWZi5jWuOcrLYy+bzu/eAHFuTw2vQT4s1nI+13+EjiZT3Ar1qTtfRXEmuipswNHvVK/
         EAenwZ+7XJ2XQZt6eBfBZCuDh0FqnLhAbzbtM4k+Kn8GxzDMZF1AEgOFpJ5olz5ZvcGr
         MCjobWPhaokmCZOxoW7dhvSuRxCmejTfeJShgyn0wEC4OTmSflg5cZUicRpoWhA5rs8h
         8F9g==
X-Gm-Message-State: APjAAAVDETO62J0sHIlRNhxJaGH6hSwqDIwWNCT5pX8vNmkf9Wwz2LJG
        XupgHeIMLWwulRIua8cIu5F/SQ==
X-Google-Smtp-Source: APXvYqw/J3ds+oC16fHETYZXedeWZdwc9CgxmFHnir6eR67aWv7FN0tpje9jq/xy7X/gyh11GE6QlA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr1949030wmb.125.1571733810379;
        Tue, 22 Oct 2019 01:43:30 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 7/8] gpio: mvebu: use devm_platform_ioremap_resource_byname()
Date:   Tue, 22 Oct 2019 10:43:17 +0200
Message-Id: <20191022084318.22256-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use devm_platform_ioremap_resource_byname() instead of calling
platform_get_resource_byname() and devm_ioremap_resource() separately.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-mvebu.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 6c0687694341..2f0f50336b9a 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -773,23 +773,12 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct mvebu_pwm *mvpwm;
-	struct resource *res;
 	u32 set;
 
 	if (!of_device_is_compatible(mvchip->chip.of_node,
 				     "marvell,armada-370-gpio"))
 		return 0;
 
-	/*
-	 * There are only two sets of PWM configuration registers for
-	 * all the GPIO lines on those SoCs which this driver reserves
-	 * for the first two GPIO chips. So if the resource is missing
-	 * we can't treat it as an error.
-	 */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm");
-	if (!res)
-		return 0;
-
 	if (IS_ERR(mvchip->clk))
 		return PTR_ERR(mvchip->clk);
 
@@ -812,7 +801,13 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 	mvchip->mvpwm = mvpwm;
 	mvpwm->mvchip = mvchip;
 
-	mvpwm->membase = devm_ioremap_resource(dev, res);
+	/*
+	 * There are only two sets of PWM configuration registers for
+	 * all the GPIO lines on those SoCs which this driver reserves
+	 * for the first two GPIO chips. So if the resource is missing
+	 * we can't treat it as an error.
+	 */
+	mvpwm->membase = devm_platform_ioremap_resource_byname(pdev, "pwm");
 	if (IS_ERR(mvpwm->membase))
 		return PTR_ERR(mvpwm->membase);
 
-- 
2.23.0

