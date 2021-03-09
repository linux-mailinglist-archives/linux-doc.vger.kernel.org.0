Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE4533307B
	for <lists+linux-doc@lfdr.de>; Tue,  9 Mar 2021 22:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhCIVAL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Mar 2021 16:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhCIU7k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 15:59:40 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D7DC061762
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 12:59:40 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l22so3811530wme.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 12:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b9JrBKuO/UMxqLp0dR5QODxDjy8Sowg28gDkd3Cd158=;
        b=gNj6Q50g6ug1gUrCDzjA9E7LWc0DnilcsqHr7HBJOv7TwIV06hKwzSPWgiJdFQ3zI6
         Y10x4QoKsKKn7Qj/7mhwA92T3OTe2X2ON4yI47AXu05//eR534zFAYK+H7+V6iaqGPJO
         j/vxPZy2oFHoH1zjg84vpNdxZUd6Nyf9nXRg9ySqn49aMo/YZairKosQ18ZpzKiZy6HC
         NfTcvas0X+3sQen4loVpZnsyxYAP/vDoHkhERMwBhaHrmYqryZ+jkKNpAkKsvsd84fdg
         T15h7wVBB3YH9zJz9MwHoP3X3xOsT2mwu6TVF/SD8bOCMWZI+NAh4xejeI+rs2vBPQYz
         bOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b9JrBKuO/UMxqLp0dR5QODxDjy8Sowg28gDkd3Cd158=;
        b=EO8yp8sVgiBXn6sJLna43yaANkpiyWgcyUy1nmIC+Qwg3xfCt6DbLA3JzJ1fi8cMmq
         vSB2Q8lTrIYvA+pzhTp32LM8EbnYt413HL3gMYc0n0ntd+DWJi7G6zKp2QH+ux2Znq8L
         koVmdJ7mAd1zRZNzUy4UUWDn5tFxIDbEK57jA1NTUUaodIDOmJjY7CfMS5umpp+RB2Lo
         AS99PrigX7b4lKGfVO7ZQZ2rFkmOZCJhGGdRB697cMi4MT8Fd3vzw2cwpYhUe/kLtYQl
         c7lbi5+cA71hV3cNT6uUjLV5snihI0SewnYAXVn27EkJKOe1/SY7Yi+F9vNm3PXI2J1C
         wVCQ==
X-Gm-Message-State: AOAM5324X7aEzzDmas5FHxmpd053VuhycvqfOW5KvjaclvPDeYOpsseD
        loSrM43disPZhVm+Z5wBVSawZQ==
X-Google-Smtp-Source: ABdhPJwk7UNTHRHU2S57yojtXBtoPnR3X8fgidczapk6qJPjcUluXTyCPbKjWKmWroltXPKxnXYd/A==
X-Received: by 2002:a7b:cdef:: with SMTP id p15mr6149042wmj.0.1615323578909;
        Tue, 09 Mar 2021 12:59:38 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:38 -0800 (PST)
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
Subject: [PATCH v3 07/11] lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
Date:   Tue,  9 Mar 2021 21:59:17 +0100
Message-Id: <20210309205921.15992-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
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

