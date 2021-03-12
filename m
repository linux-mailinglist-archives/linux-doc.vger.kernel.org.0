Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F42338963
	for <lists+linux-doc@lfdr.de>; Fri, 12 Mar 2021 10:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbhCLJ5q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 Mar 2021 04:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233373AbhCLJ5Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Mar 2021 04:57:25 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235DAC061574
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 01:57:25 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id l11so4443163wrp.7
        for <linux-doc@vger.kernel.org>; Fri, 12 Mar 2021 01:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4SxFZ2/z04LDFxgHqyBoGQvdfw+6RqGbZM8dagLyJw=;
        b=NSFCrfknOrsPvrfuIpExT3BUcasO4VRkrBWbd+cmQWE3uVsiEEgDCT/IIg2YMnuKUJ
         PdHgGdscCIQkxCwS7SsvCflKdMJEuXNwhh4M7dYAXkRAGdCoRa+BPNI8KyiX3NpprHY6
         Kbl4n7QCdi/ejWni8u1zMp7XbGV8U1PILI0RCkaxH6TBcqdQavk6Tzr3LRaWnMG3mo1H
         zJ6pGVM+pXs89M6lVZBQ+oGmav3BJ51mcnRcbPhM0T4vtDPm02JJLKuI9MOzHf/iIBZx
         tpUhAMJlSqNK/z9kVodpE8/Oug/WJ5AWXilO9FXR2AS/z5Bnl3LECUeM7PFYchh+o6mF
         nvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4SxFZ2/z04LDFxgHqyBoGQvdfw+6RqGbZM8dagLyJw=;
        b=bOmmxgsB8FUy2q0pURPfsLrX08WWjbk1WPouTvizXRzi84Yo7tuu+XBT1DrGUfv4y8
         bdc6ClNeg5RaGu6p8BVLDGGS8iDbWi5qDE7bSsC+URzOVDvrivLGeaE2i2yrCT/YoWAk
         bdFRond7fN7WRnxJgpXCrLGbiTEnlL0jy1O6J0YwkDJTv9woFiK0WV0Gy5WI+W3na8vw
         Dtwi1xk02LLpCY7i2uj8ZG3D712Foke0bcxeNrIBmRpQHDrhosiT/kR49tM2U9wBYoNC
         L4lYRpGfIXcGHti5//b9jzq2fFao8xmnEhtAaIHz78zSbRRmE09AFGunGsm41ZhQYE40
         QGSg==
X-Gm-Message-State: AOAM5306b3FegoG0sCdPeLiccrGCh9uGzCMqaSBZLL3C0pGhEZ+KWjoB
        AUUZiBxdHe+hxwL2R2LNdOfCmw==
X-Google-Smtp-Source: ABdhPJyjBPFlgp5o53yubE8Q14+NsGqDJMmh9yVt4SWKqd7mJ4Oam8DVjEQDA9qo4HyU31R3LMcLDw==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr13192011wru.401.1615543043886;
        Fri, 12 Mar 2021 01:57:23 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id x13sm7031630wrt.75.2021.03.12.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:57:23 -0800 (PST)
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
Subject: [PATCH v4 02/11] configfs: use (1UL << bit) for internal flags
Date:   Fri, 12 Mar 2021 10:56:51 +0100
Message-Id: <20210312095700.16277-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312095700.16277-1-brgl@bgdev.pl>
References: <20210312095700.16277-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For better readability and maintenance: use the (1UL << bit) for flag
definitions.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/configfs/configfs_internal.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/configfs/configfs_internal.h b/fs/configfs/configfs_internal.h
index 9a3aed249692..b495c9f043d4 100644
--- a/fs/configfs/configfs_internal.h
+++ b/fs/configfs/configfs_internal.h
@@ -46,16 +46,16 @@ struct configfs_dirent {
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

