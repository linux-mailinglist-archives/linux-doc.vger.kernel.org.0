Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAF233AE4C
	for <lists+linux-doc@lfdr.de>; Mon, 15 Mar 2021 10:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCOJOe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Mar 2021 05:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhCOJOH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Mar 2021 05:14:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B64C061574
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 02:14:06 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so16025476wmj.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=U8f7n8lud4q00hU8mI/B653jy/PEafeOOtIhqqzdpKJ2tSmvdp3wGR7Q9XUBRz/oit
         AiAnrPbfSo7d/h/j92VUUlup/tztdrH6N+bg9Z8m99JSt2rta3nPhbnsGDydn66OCOkN
         +GKWM0FqAyc/b/RNmuiqN8SLfBOxbboSk0DryGMqmwAOeh/wxvjlzSHlsIp63gvb7L2Y
         mxWOAasL7YreaNIDiCth2SMicwjwzxXSPr6UmmQk2WQNIBkmmOyj6j1s6vTXzObkbC9e
         nMQwpDSd9dlcFtATzNQ3Z7BilIkesNw7ZfSunDxbBF7DStmbRaYbrkV8bF0tyNl8J9vC
         aqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h87jccumC6oS/Oglf5H2ioMoJmQRJZD6wd7xhfpKIok=;
        b=HSZACtAtTJG4QBBHmwtp4gCJ1dJRQygTjFjYfhBo7ft0xtaI87NWu/p8JUDOjPzJb7
         AiQ4VprVe76LqW6RQCheXtQfJhPJmWTFdNdG5WeuI51Yq0cG/X4Yd1g7R9Zmbxu+gpip
         PkpLF/YmdTGt6EubFnk5Mek6ervApIvR99HUYoEemUbQfRCpcCV3bH1kDSvdNGAba30r
         II1PsDtZGk2GYUjgKjK8rT7pImqy954rbv5p4r9yXG/qTfF/V7IZHeR/1rw/5iOIph7m
         0wBZMQ2UClIrJtIOHcdsdTFCSH+lDDioNv3MSgi8L+YIMxaLNWls0wBCMD4iFSHJ43KA
         bOrA==
X-Gm-Message-State: AOAM531xhO4ehQESVnGmGpzHT7c+T9jb9o8vJ7DOSDYmlJ/9FmHOquih
        dYcxjykRNpF8mDPH11k/0P9/wA==
X-Google-Smtp-Source: ABdhPJxOwY7u3bt9Ri0rt82dLPfSz5l1XZbgoIPJxQeRy082joKhflRLifJ0gV3dNdoxgpbXU8dq1A==
X-Received: by 2002:a1c:e184:: with SMTP id y126mr25095042wmg.163.1615799644979;
        Mon, 15 Mar 2021 02:14:04 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:04 -0700 (PDT)
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
Subject: [PATCH v5 01/11] configfs: increase the item name length
Date:   Mon, 15 Mar 2021 10:13:50 +0100
Message-Id: <20210315091400.13772-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
References: <20210315091400.13772-1-brgl@bgdev.pl>
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
2.30.1

