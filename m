Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45EF33896B
	for <lists+linux-doc@lfdr.de>; Fri, 12 Mar 2021 10:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233453AbhCLJ5t (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 Mar 2021 04:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbhCLJ5a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Mar 2021 04:57:30 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245E2C061762
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 01:57:30 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so4255931wma.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b9JrBKuO/UMxqLp0dR5QODxDjy8Sowg28gDkd3Cd158=;
        b=bHHoNDW3JRGsD6bPfO5HboJCO/DehCeddkWOaLZ9vSGTsmAg0oVXJ9+gQtURgmNP7I
         n++im+iQ6YWB0vmkGEf745KDWKRrqSgfZ2KLo90Sh6oTjTmK/FFUc+zLbD2hJagMHfS0
         mMqCprQNRAx3IcXo4YFwXB9+6XguRg+BvDxD9hPgPIsoufWytlSgkWOHa0/8bkC+kjJl
         PtbolL+SFbeuNgQAyzAQzkjF+Sp1aIj+DI9sOurvCX/BcpHVPPvWX8OfIwtrzFurZ8cF
         9Fiw+P72fYeXix3mf/tpg0ZllBC6xQjA4ZKLcB/oOgpcgqGNFMR/HYzhe0B77++Qg/dA
         RiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b9JrBKuO/UMxqLp0dR5QODxDjy8Sowg28gDkd3Cd158=;
        b=P9FxIKm0Sv6Bv9MWUn13dkPdMkvDc+ONtgofF5RwTbDJfa1exBVPM2cGI1l+LkAMc1
         kS//Bw/4EYLJKER5HLo6a7xB8r3fJun4jQQwTlWJL+indCapLyXrt+dnvncnM38mnPqK
         RrU8pfkmgor284SDMZgygBYciNwazi1bbqM63/WL3PjW4oIDJ0iaW+vgLogw7Q/AOahA
         JHodoq1CR2lqWJyqjB215KAr4gx9kcOPKzyQHHrtNBW1zu3glG/e/PQ8z91L4ObKDs64
         U7aPK1FVZnZAzscuzDUScrMyDdoH3RIYuBJlS0t3oupPZKG0c+9eQhosIR2RruwPvZ0c
         hPng==
X-Gm-Message-State: AOAM532DAAJ201K/AVSOsIDWWkKwmF7UYyh6UI7Xda+2FL7y6gJt0PQG
        Hc5RFvUXKr0AMMU8NPZd++e5vg==
X-Google-Smtp-Source: ABdhPJz/VCNVA1h2Dh1IIDQLX4482piL9UIP1+SIueczxwwCxKy9iyV8C1qVEFLMrj0+PNukBJKO2g==
X-Received: by 2002:a1c:1f04:: with SMTP id f4mr12505897wmf.12.1615543048903;
        Fri, 12 Mar 2021 01:57:28 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id x13sm7031630wrt.75.2021.03.12.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:57:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 07/11] lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
Date:   Fri, 12 Mar 2021 10:56:56 +0100
Message-Id: <20210312095700.16277-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312095700.16277-1-brgl@bgdev.pl>
References: <20210312095700.16277-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide managed variants of bitmap_alloc() and bitmap_zalloc().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap.h |  8 ++++++++
 lib/bitmap.c           | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 3282db97e06c..73d039476fa4 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -9,6 +9,8 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
+struct device;
+
 /*
  * bitmaps provide bit arrays that consume one or more unsigned
  * longs.  The bitmap interface and available operations are listed
@@ -122,6 +124,12 @@ unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
 unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
 void bitmap_free(const unsigned long *bitmap);
 
+/* Managed variants of the above. */
+unsigned long *devm_bitmap_alloc(struct device *dev,
+				 unsigned int nbits, gfp_t flags);
+unsigned long *devm_bitmap_zalloc(struct device *dev,
+				  unsigned int nbits, gfp_t flags);
+
 /*
  * lib/bitmap.c provides these functions:
  */
diff --git a/lib/bitmap.c b/lib/bitmap.c
index 78f70d9007ad..b4fd7fd084c6 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/ctype.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
@@ -1263,6 +1264,38 @@ void bitmap_free(const unsigned long *bitmap)
 }
 EXPORT_SYMBOL(bitmap_free);
 
+static void devm_bitmap_free(void *data)
+{
+	unsigned long *bitmap = data;
+
+	bitmap_free(bitmap);
+}
+
+unsigned long *devm_bitmap_alloc(struct device *dev,
+				 unsigned int nbits, gfp_t flags)
+{
+	unsigned long *bitmap;
+	int ret;
+
+	bitmap = bitmap_alloc(nbits, flags);
+	if (!bitmap)
+		return NULL;
+
+	ret = devm_add_action_or_reset(dev, devm_bitmap_free, bitmap);
+	if (ret)
+		return NULL;
+
+	return bitmap;
+}
+EXPORT_SYMBOL(devm_bitmap_alloc);
+
+unsigned long *devm_bitmap_zalloc(struct device *dev,
+				  unsigned int nbits, gfp_t flags)
+{
+	return devm_bitmap_alloc(dev, nbits, flags | __GFP_ZERO);
+}
+EXPORT_SYMBOL(devm_bitmap_zalloc);
+
 #if BITS_PER_LONG == 64
 /**
  * bitmap_from_arr32 - copy the contents of u32 array of bits to bitmap
-- 
2.30.1

