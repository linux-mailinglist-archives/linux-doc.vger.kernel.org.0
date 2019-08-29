Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBB3A1D18
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 16:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfH2Oix (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 10:38:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55507 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfH2OiJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:38:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id g207so21981wmg.5
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixvkB7V43hKnmpubcJyfS56WaYg/zqMW9mNeR7sGzjo=;
        b=Jl/KOc3c/tWm63gxFSTjAo6PpfQzPmcUricXPWQVOnWUWtbA5tgLe8IG2LXNlz4c8W
         Ost5l50DOWqngoyPIPKalqof732a4QL679hkjpvIXoS7Qa4UwihRay+lui8HJGFE9jHg
         Z9CZ+mNBGNyc6KrrhnMjK6xHSx/25+A5LMc3//YEUindtzCENKZM5bedwY4GQRbSOka1
         s3rB2PkLMxP0jxvmN6OGq8rkVXGch4UD8nhXWKp1P1tt3s+CIxITJdI+wnu01pOR88RR
         Ks3m4R1XMFUTJt2Z+5Fg2lRELsLyNiOdhUdAlkFF4NwncUGRRk7YQJOs+GmUEI1/P1rh
         M8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixvkB7V43hKnmpubcJyfS56WaYg/zqMW9mNeR7sGzjo=;
        b=nKxBpJJQ/pFUSouAwHcC1PPSNr9wHUyO9jTrivN4AWc15M6UeOmUExji8jYnG6buNu
         LLEe7cXgB91oHH1yAjcOBnJFbrG+V42Of7cpJmcyHxHIbjdaKJGQ56CkusfbjmgDTkdl
         eqfoSAZwiU1Eq6oRRArnJVQDxFSo5NzupwHOxXKxn8FeXTODEXaGJBEW/NztL/rfw4KG
         XagCBZw5t6UBsM8XeK5DiaL4w3R9yds9Vug/gBCSrsHSa2rrSkRzhzI4H8G7sf4pR/BY
         x7zMqS8Smw9WFTE5i08Q2NbUyr5/KoDx2HHURiwt1rHhuSNOt5ts0gdIhlB3WFgxLkH6
         qsvA==
X-Gm-Message-State: APjAAAX8doGP8aHdPhsNfLDs7oQE/4SZs5tJmMBRV8Vr4W5ZGAsQiyj3
        NfszFZu33jsLn+t6ltGtNqzk4g==
X-Google-Smtp-Source: APXvYqzDBd56BXi2us4MHfKcSnqb+9nXEN8jrVhAop9QN4hsEPKbDM6lYwB97IRyI27AVhXumdDmkQ==
X-Received: by 2002:a1c:f20a:: with SMTP id s10mr12396085wmc.145.1567089486874;
        Thu, 29 Aug 2019 07:38:06 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:06 -0700 (PDT)
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
Subject: [PATCH 3/9] lib: devres: provide new variants for devm_ioremap_resource()
Date:   Thu, 29 Aug 2019 16:37:36 +0200
Message-Id: <20190829143742.24726-4-brgl@bgdev.pl>
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

Provide two new variants of devm_ioremap_resource() - one for nocache
and one for write-combined ioremap.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../driver-api/driver-model/devres.rst        |  2 ++
 include/linux/device.h                        |  4 +++
 lib/devres.c                                  | 29 +++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 8e3087662daf..20c4be0389ab 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -316,6 +316,8 @@ IOMAP
   devm_ioremap_nocache()
   devm_ioremap_wc()
   devm_ioremap_resource() : checks resource, requests memory region, ioremaps
+  devm_ioremap_resource_nocache()
+  devm_ioremap_resource_wc()
   devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
   devm_iounmap()
   pcim_iomap()
diff --git a/include/linux/device.h b/include/linux/device.h
index 6717adee33f0..e8aa916e8eb2 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -710,6 +710,10 @@ extern void devm_free_pages(struct device *dev, unsigned long addr);
 
 void __iomem *devm_ioremap_resource(struct device *dev,
 				    const struct resource *res);
+void __iomem *devm_ioremap_resource_nocache(struct device *dev,
+					    const struct resource *res);
+void __iomem *devm_ioremap_resource_wc(struct device *dev,
+				       const struct resource *res);
 
 void __iomem *devm_of_iomap(struct device *dev,
 			    struct device_node *node, int index,
diff --git a/lib/devres.c b/lib/devres.c
index a14c727128c1..f1297bcc8891 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -169,6 +169,35 @@ void __iomem *devm_ioremap_resource(struct device *dev,
 }
 EXPORT_SYMBOL(devm_ioremap_resource);
 
+/**
+ * devm_ioremap_resource_nocache() - nocache variant of devm_ioremap_resource()
+ * @dev: generic device to handle the resource for
+ * @res: resource to be handled
+ *
+ * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure. Usage example:
+ */
+void __iomem *devm_ioremap_resource_nocache(struct device *dev,
+					    const struct resource *res)
+{
+	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP_NC);
+}
+
+/**
+ * devm_ioremap_resource_wc() - write-combined variant of
+ *				devm_ioremap_resource()
+ * @dev: generic device to handle the resource for
+ * @res: resource to be handled
+ *
+ * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
+ * on failure. Usage example:
+ */
+void __iomem *devm_ioremap_resource_wc(struct device *dev,
+				       const struct resource *res)
+{
+	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP_WC);
+}
+
 /*
  * devm_of_iomap - Requests a resource and maps the memory mapped IO
  *		   for a given device_node managed by a given device
-- 
2.21.0

