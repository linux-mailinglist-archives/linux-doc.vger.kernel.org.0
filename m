Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239AF333066
	for <lists+linux-doc@lfdr.de>; Tue,  9 Mar 2021 22:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhCIU7k (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Mar 2021 15:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhCIU7g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 15:59:36 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DD5C06175F
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 12:59:35 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id e23so3799489wmh.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 12:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4SxFZ2/z04LDFxgHqyBoGQvdfw+6RqGbZM8dagLyJw=;
        b=L4BejmRSHgDZSn8N12ZHnNzdgeSoEDt4vOykZhpWhx440GQv5dOnJt34x47tqczDaF
         gzoTCE488MYjF34Z9QnNryJEvJ9SNJBkvULvd/g9rGsXvWtbA+x/yUp+2zp+yPP9/0Ib
         nI8LBOm11NfYDQuYjd0okoexmC4W0+JUFXfafEaOIJPdJQrJFFGfjJEzpbpzNsHRcMdn
         xjesV4J7/0t4/rPiF7DE2c55RoWAz2H17qnysa3+JqXPRTJdUTKCkHODW7tVaWjc944M
         1HKf53909HWuoNNPGT1nOmEwCaGMNWLIUGhRSzL1xscuenYL46MCYbdnF8McYxcmTt6b
         eliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4SxFZ2/z04LDFxgHqyBoGQvdfw+6RqGbZM8dagLyJw=;
        b=Ho1amCBGRZjzBydgn3yOCyqKkMjbCQ6p1QoqsXWrQ5Qd2RWVgiKE//fsce6NkhRAhM
         5UVe/dxCZuOayT+Fn5nhgXl4+PqbnvxGYYrevuhCU68Yg8N9vyMU6eSYXer9MCHjPGSP
         ZhKxMYEHp+4nRCnwcPkSeRe1HNegO/D4pndb/GP3bCePhjPtNSdSAiZxVRdjdEMxcpal
         O3TnaEqpS/Kp1VJNBx/exyaAKt8zfWEtAfsL/indNQluSHodk0oXuiiLGP+gjkpApC5r
         282GOi0mUby9dT84HcwUtCXKhEi5D8X2XAeLAad/PmgG9189CjuuY4z0jLLIdHHOQ7TN
         QXkw==
X-Gm-Message-State: AOAM531cySuKNaw5/l5TUz+LwFymjM1IlZs7uncFfxGmDcbBCT1gBEmQ
        E4ppmt42RmGzEz3hNNzZg4A5Yg==
X-Google-Smtp-Source: ABdhPJweiTl/D6VcjUWfy+BDY7phoLsGYzyRRMJlqLOPRA8opETaoT3ZRwzeh/aYsPF5+QWewx5eYw==
X-Received: by 2002:a05:600c:214d:: with SMTP id v13mr6097678wml.162.1615323574516;
        Tue, 09 Mar 2021 12:59:34 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:34 -0800 (PST)
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
Subject: [PATCH v3 02/11] configfs: use (1UL << bit) for internal flags
Date:   Tue,  9 Mar 2021 21:59:12 +0100
Message-Id: <20210309205921.15992-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
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

