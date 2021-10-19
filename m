Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E346433924
	for <lists+linux-doc@lfdr.de>; Tue, 19 Oct 2021 16:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhJSOve (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Oct 2021 10:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhJSOvd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Oct 2021 10:51:33 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D58C061746
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 07:49:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id m42so12116823wms.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N6iEJB4pcSblX4SdZfQ+pj8u1PpQ7EP4J6z216v/Emw=;
        b=6frqcHJMSSBXrhTMy16Dv/4ylBbg1oct3aZ/+Z3lNhHXzj5n9dCYm2lw73QPMX4KQS
         l8SHabYuAPvknvT02p1Ym+TLKNxPFlVCTUyj3hab8pquQkGLdpX7cGru/haS6qqLIZid
         rVRhPHqFLFX0nbG6Omr3kkitIzeI/vGI1zTexMPbYpDvQ7fLa7OTZpMX1P+DODanIIkN
         Is5voaP20xpIZbsCUwvGZXO1ir8/8xkWR97G/rK5N3D1D1Rj/QhdEusbjRqL0d527nFe
         D8tvApwPqi6ggBlsx8ZBHMprlze6cf2kpuidIfOyFxpoF8TNPBR0uVhVYN8g0FIyar1K
         VCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N6iEJB4pcSblX4SdZfQ+pj8u1PpQ7EP4J6z216v/Emw=;
        b=1y4SYu+CqLlZWXavrpeYg7LYmxb9it9JNYJ1VDMNL8ZVGrkwGpiDecsninQefo+oG4
         ZHdaiPiXQdh2RRo4OSjW7RuwBevHQMTXcXMrOkiry6ikhaXamF6VxvcthS1IQAPET5mO
         cgM0pQQy/rfl2DpqpTF18XfSrxTBRL5S3Z1TCjxgHNHNuj9hKHBmjepCYM+ZttBdhvnT
         F5HDN7oUULpQxI23NUOuRQTdYDRdMaQBxZBNWVg1AGc4Kma77bdECBpd5l2pU+mlue1a
         xY43FvaOUxhsvsqT+NrzxSypvjfgokTSdqK+a2Ecc+IEepomhHRgoUaDhjyY4kRWgdih
         jb6w==
X-Gm-Message-State: AOAM5332N8tCbYPg+LmOsBobuLh9J3Tl790e2+Zqoeciud1nbfzusK52
        4A7MJRcBaj3+XcpnaDLQaK3KKA==
X-Google-Smtp-Source: ABdhPJzqbSgKupMRxSSLdbTJsqKSCm7t+AJOAWDDlG+zyzFLr0gbR5g3oO0ATMl7d/gVjOY90gzZww==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr42789132wrb.318.1634654959349;
        Tue, 19 Oct 2021 07:49:19 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j1sm16212752wrd.28.2021.10.19.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:49:18 -0700 (PDT)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v8 2/8] configfs: use (1UL << bit) for internal flags
Date:   Tue, 19 Oct 2021 16:49:03 +0200
Message-Id: <20211019144909.21959-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211019144909.21959-1-brgl@bgdev.pl>
References: <20211019144909.21959-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For better readability and maintenance: use the (1UL << bit) for flag
definitions.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/configfs/configfs_internal.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/configfs/configfs_internal.h b/fs/configfs/configfs_internal.h
index c0395363eab9..0c7a3d857fde 100644
--- a/fs/configfs/configfs_internal.h
+++ b/fs/configfs/configfs_internal.h
@@ -44,16 +44,16 @@ struct configfs_dirent {
 	struct configfs_fragment *s_frag;
 };
 
-#define CONFIGFS_ROOT		0x0001
-#define CONFIGFS_DIR		0x0002
-#define CONFIGFS_ITEM_ATTR	0x0004
-#define CONFIGFS_ITEM_BIN_ATTR	0x0008
-#define CONFIGFS_ITEM_LINK	0x0020
-#define CONFIGFS_USET_DIR	0x0040
-#define CONFIGFS_USET_DEFAULT	0x0080
-#define CONFIGFS_USET_DROPPING	0x0100
-#define CONFIGFS_USET_IN_MKDIR	0x0200
-#define CONFIGFS_USET_CREATING	0x0400
+#define CONFIGFS_ROOT			(1UL << 0)
+#define CONFIGFS_DIR			(1UL << 1)
+#define CONFIGFS_ITEM_ATTR		(1UL << 2)
+#define CONFIGFS_ITEM_BIN_ATTR		(1UL << 3)
+#define CONFIGFS_ITEM_LINK		(1UL << 5)
+#define CONFIGFS_USET_DIR		(1UL << 6)
+#define CONFIGFS_USET_DEFAULT		(1UL << 7)
+#define CONFIGFS_USET_DROPPING		(1UL << 8)
+#define CONFIGFS_USET_IN_MKDIR		(1UL << 9)
+#define CONFIGFS_USET_CREATING		(1UL << 10)
 #define CONFIGFS_NOT_PINNED	(CONFIGFS_ITEM_ATTR | CONFIGFS_ITEM_BIN_ATTR)
 
 extern struct mutex configfs_symlink_mutex;
-- 
2.30.1

