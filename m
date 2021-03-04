Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A8832D0B7
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 11:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238541AbhCDKb2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 05:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238516AbhCDKbQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 05:31:16 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD80C061762
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 02:30:08 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e10so26786959wro.12
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 02:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tX+a5h0CwfebfCzPciEkOjoZw92f9+5OTwDwclahb9c=;
        b=S22bEp/lQ+wgPshXexE4a6L9ShjGvgoPQqJeo5HuJhaERXd8vvyoV8leavK+Nl/MlQ
         ClNlw7/fV5rwsH/XE8tNiuWYiBCnLyLcf2qtecFlqkIgjN1XmdLdHN4FVzL9eYe0k3v/
         U0vZ03JT4aqZpEv+pfP+tgi1Y2IMrKcGcpKxgdX6CdJzJNC9nkGzMqCOiIQWyTvgpWDU
         zE8bs40cKa0tCqulW4V/HQnGifYlWeIJUyz3uFuNwNR0JqZE0ESm5hJAXq2Q6FuzeL/5
         eZekcdY2mNNMbiBmLXlQmiNClRbfJSjiAXvyKBg+da4bs/t9CEHEO2YmjeH8p4AGQ90K
         dWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tX+a5h0CwfebfCzPciEkOjoZw92f9+5OTwDwclahb9c=;
        b=ZYjmZHqUbIZlsiMaS1FoACacGb2FDxAY9N22IugErRqoZeiko1nRsDUoJn1Vs7eCHO
         WBEEhJoDLNe4S3DpA5UZvfWddSShaBn33yRe4AIupR/NK4rd80d/Par8zoWh/k200JPF
         82BhVdYrf+fJtoOQMvPb5z+DFYbNRiz/hEQ7kebtuPFMFmEUBisfNES5aa5tElgnwfdf
         +BhENxWusRg/8BRRQ3EycXfYLCFD9Selri6/hcRAI53TS8VzPCKLva6OqV3OBLj0nqUU
         BicEihyHY8Tmq2SaAnnT0vkDgzEe5lxiwm6qsMgBtaDfUf7m+W6qhPTWEOX53P0M/ja/
         9Szg==
X-Gm-Message-State: AOAM532KISvHEtAgzVrWyPYOVjKwTwxMrW4aEa+OHBnZRPNmXfLNauOM
        HxvFYXcrBGFwnXJe8j+kJGUmeBdpaQfOUg==
X-Google-Smtp-Source: ABdhPJzfb3hQojJAvThJsbOa3ghhSHpJUZBeN8kOAVh9zhmVgfChPt5ilIUuxrIXEDA/bES0G1HONQ==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr3405074wru.286.1614853807255;
        Thu, 04 Mar 2021 02:30:07 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:07 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 01/12] configfs: increase the item name length
Date:   Thu,  4 Mar 2021 11:24:41 +0100
Message-Id: <20210304102452.21726-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

20 characters limit for item name is relatively small. Let's increase it
to 32 to fit '04-committable-children' - a name we'll use in the sample
code for committable items.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 2e8c69b43c64..4f76dcc08134 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -27,7 +27,7 @@
 #include <linux/kref.h>   /* struct kref */
 #include <linux/mutex.h>  /* struct mutex */
 
-#define CONFIGFS_ITEM_NAME_LEN	20
+#define CONFIGFS_ITEM_NAME_LEN	32
 
 struct module;
 
-- 
2.29.1

