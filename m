Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4DA277022
	for <lists+linux-doc@lfdr.de>; Thu, 24 Sep 2020 13:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgIXLiy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Sep 2020 07:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbgIXLiy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 07:38:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DB3C0613D8
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so3177117wmi.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=38tFXZO/xNQY1Ryhqk0ixri0sl8E4vYZ3bH752VHOf4=;
        b=wfm3BVCIiKYb0LwpFdvrg59EW2nWHfTOqaUFAj0qo+jC5BNKds3G1c0EYc3wc4Jvo9
         qiTWqV8urdUlac6rowUlVB3KGHDQFXn9VyQZCFvIPQlNS1nRbDGDwtYIz2xWEtFdKWrB
         3eqLRs639j5AVmluOUpY8cPNScQWZB+Btfi5XBRpnWBC9xBjNwZ9NNEaafEGiL+YYXzW
         0TR2pR5H5hKhKk18KJVlRabUX83O2Muv34OPrV8zCUXFPIttKrYLHucMJ8FKmnjwaiLM
         UqoZiKh3t/nJM5pw4JF0MeTrAhAlVb9jDB8Y6fxJaRQqUzIoBpzJlaJ5dQMedFXna8c8
         Sy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=38tFXZO/xNQY1Ryhqk0ixri0sl8E4vYZ3bH752VHOf4=;
        b=LdE1Mfrn6ABGK92cF4DtTtCOdPDI9UXkfxekajGVWQZbJe2aCVFU/zOObtQRcryCnC
         UKFE4Gbe5lQLQvQQmVZJJ/NnYfWF6Yj2ioqjw/2t2hNtL5DbBfwZ0SxGKiflwwOlxaF6
         7XP07EQ7DxvGia9QNI3iVomSowOel5mItQ+KoIe6m2KF9yFF19YzLBRbciG8/Ca+cnz4
         +HcX5RQHr3hfuW33uKz8UmXGd0Rpl8v9pBjC/zTr9DqsI8dy+chn2GslWWCrqvaKVuYe
         lmN/zbpA630VK3MAqMXCx8HZN30lyjDvMLiMMtguTvAoNFY7rmp8B3hxCjExgdVyMJyx
         G5zw==
X-Gm-Message-State: AOAM531bIKPcNzbSHOlm6kaETNPelMkIjoVtGrbRE4govemihgZiGken
        MhwvbLiRFePAITzefswpphk/Jw==
X-Google-Smtp-Source: ABdhPJxRA+J/+iFKjoXyeKGk7hmuTJJI3JDJ9FyrQ9bljbCM2utr8gxH3eRWMklqkS0jxniqYwv+0Q==
X-Received: by 2002:a1c:3985:: with SMTP id g127mr4518078wma.32.1600947531822;
        Thu, 24 Sep 2020 04:38:51 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id y207sm3390133wmc.17.2020.09.24.04.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 04:38:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/9] gpio: mockup: drop unneeded includes
Date:   Thu, 24 Sep 2020 13:38:36 +0200
Message-Id: <20200924113842.11670-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200924113842.11670-1-brgl@bgdev.pl>
References: <20200924113842.11670-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This module doesn't need gpio/consumer.h - it's a provider. It also
doesn't use any symbols from init.h so let's remove both includes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1652897fdf90..c5092773afd8 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -8,9 +8,7 @@
  */
 
 #include <linux/debugfs.h>
-#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
-- 
2.26.1

