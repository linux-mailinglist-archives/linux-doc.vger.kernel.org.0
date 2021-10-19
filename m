Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2849D433921
	for <lists+linux-doc@lfdr.de>; Tue, 19 Oct 2021 16:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbhJSOvd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Oct 2021 10:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbhJSOvc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Oct 2021 10:51:32 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886DAC06174E
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 07:49:19 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n7-20020a05600c4f8700b00323023159e1so3009663wmq.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=CfA563hilyt56iNHmUkoW2wUFBK5GuF9TMfmdurrOOeoQ6khDdZM33+YzAqH+IQX01
         Ng7Z/+pte9xqmGl1nlwBjvisFzcWUzwhI+4+fe+NDiw7SLsBQ5wMgFPvc+oGEqg47w/0
         mXd2TzyLRpEqnXS2gCX+QAUlRLJOjQcCN+8v36TLmUruBaxejklW/gi8r0XQcijb9s3T
         wDUnJjuuZnuGQxQrpxBC+lP/XvSMinGAecAghuPZ83ejaLVTSOA2ylxtHwmHNv7UWZxY
         nwCKrneF8y1OAp3mTsDgyVDkiikMLVaydlL8dVDqxCK6jGnb2LSNOQ42PYlJVQ9KLRLD
         fs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=AEM42n5ZdDQ1l0FOpyk/AtJi5wcVviiyefYL8CZPUt04zOzV+7Z417GJQ/1O/Vrr5H
         6bRAQqG2Fx2e/WZtwwKl1tCca0/uJQOv80hXl2KIPPn+MZUFRiGPhnE1czcPbm22Ho8r
         mXc2Sh92C0jL9k/t7JhdCQX4gvo/hUSucx0fNY9ENmVEXzjBUwtoiGEEnnUtdEYLYu0R
         WPZDy8p4s8IHqHjCyxptTDEG/HvuAdrgwUm6UIHFhpdTzfMWNH6c5L1FRmI71wd1QMJN
         16NhseqMLNuucBgWh3+qKXIrVDQomWaoCpqtTe7p6ONMbfIzUOB7fk/SxFwmRqcF2msV
         X5vA==
X-Gm-Message-State: AOAM531CAGxX/TMBrqK/vPaZtGV2pN8f9x/fv24DFCek+mijLdCIfkSC
        Sqqo3z60f9y2PxaqTp5v7/H8zw==
X-Google-Smtp-Source: ABdhPJzfEZ81w/PL1+YDbgsiyeP1xK5ABPhnV050vXPqcg79a1BlwqTRW8abCbKO9/GuoBv4cid7LQ==
X-Received: by 2002:a1c:98d7:: with SMTP id a206mr6440144wme.68.1634654958180;
        Tue, 19 Oct 2021 07:49:18 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j1sm16212752wrd.28.2021.10.19.07.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:49:17 -0700 (PDT)
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
Subject: [PATCH v8 1/8] configfs: increase the item name length
Date:   Tue, 19 Oct 2021 16:49:02 +0200
Message-Id: <20211019144909.21959-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211019144909.21959-1-brgl@bgdev.pl>
References: <20211019144909.21959-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

20 characters limit for item name is relatively small. Let's increase it
to 32 to fit '04-committable-children' - a name we'll use in the sample
code for committable items.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 97cfd13bae51..e398fb2e83b2 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -25,7 +25,7 @@
 #include <linux/kref.h>   /* struct kref */
 #include <linux/mutex.h>  /* struct mutex */
 
-#define CONFIGFS_ITEM_NAME_LEN	20
+#define CONFIGFS_ITEM_NAME_LEN	32
 
 struct module;
 
-- 
2.30.1

