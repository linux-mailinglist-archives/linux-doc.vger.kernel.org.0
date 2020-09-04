Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A277725DE5F
	for <lists+linux-doc@lfdr.de>; Fri,  4 Sep 2020 17:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgIDPtg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Sep 2020 11:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgIDPqx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 11:46:53 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E487C061251
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 08:46:44 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z9so6523276wmk.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2020 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YZpX0q+mO37+kQBR4DVC/6zJd6Q2vMMFs8yeO9lM6k=;
        b=DHwiLfdYkiuvwGGyuQJVAWH5TI6urmfg9xYzHsNJZRaq+W2VOEzGuDZHADH8b43f72
         IdWm7NgZqeHyUMOex7xd1L+sKPbyTQU6bkDGKC+laJrmoA7AkcOWL7irwhKLtGgT8Sqf
         F8QMnwZ2j3f3Ev1NBQFKglsSE0ukhsx0DeGQmvPfA7s4XdmrdEBZCJLsDuZdy2py60av
         7ddrLxRGhrc5nQk/J7X0Rd3701tAIqugtMXJWgIrCfExr2MwqBB6KT7fKNh50zVYZgFr
         KhutLsEsf7K3xZSOrPpo6OUVFbEEAZGhgmuf6GDrIPY3Qah5PrJ+GtBed+JpjV2iCFmm
         akIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YZpX0q+mO37+kQBR4DVC/6zJd6Q2vMMFs8yeO9lM6k=;
        b=DE4jGOxbLO23AUjmStM8VJhBhTTVL45AbpmOXXWt5JGKcuHAr9zKK3hYnz2yTnMKYI
         q5w/A6r+jDkr20883s/aeJpK1ftKMOdY4p8Q+CJk99jBK0ITJmVg5zQVn3lNxBbzp6+N
         vTBeNsxk5bgRHpAYNUz7VjUQjX04g9Bcx5ip6+ymCbgbLwMIPgNA9aMT9VZ/g4CkFle5
         hY9/LHwtqF/T/yI0GLzZNRtZ5Inmb7pv9RvmahQowsCy+QVLXbu02jUAw6u/iZNqOjDB
         xjX51qyO0L4im7+IX3HmJaa0FdPNnDdxyrNgwiY3MI3s2MWJ6IBmQMNUzseASK1fxdBK
         EqqQ==
X-Gm-Message-State: AOAM533teG9O9PmA8CMdct6hUHmg9fJX/9/GQyWE+uycPMSsvXzYBtl8
        +J91dMBw8+VswVgDM/HFlCilcg==
X-Google-Smtp-Source: ABdhPJxcZNGnXPvX9i5H6bEC8G5YKnDdSyG1Hc0LLO25M6dxNysSMjIVg6JhStAhJl/uVlArUPCUtg==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr7818256wmb.7.1599234403325;
        Fri, 04 Sep 2020 08:46:43 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 10/23] gpio: mockup: fix resource leak in error path
Date:   Fri,  4 Sep 2020 17:45:34 +0200
Message-Id: <20200904154547.3836-11-brgl@bgdev.pl>
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

If the module init function fails after creating the debugs directory,
it's never removed. Add proper cleanup calls to avoid this resource
leak.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 78c97f7b6893..19c092f814fd 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -550,6 +550,7 @@ static int __init gpio_mockup_init(void)
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
 		pr_err("error registering platform driver\n");
+		debugfs_remove_recursive(gpio_mockup_dbg_dir);
 		return err;
 	}
 
@@ -580,6 +581,7 @@ static int __init gpio_mockup_init(void)
 			pr_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
+			debugfs_remove_recursive(gpio_mockup_dbg_dir);
 			return PTR_ERR(pdev);
 		}
 
-- 
2.26.1

