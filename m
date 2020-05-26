Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1C31CA442
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2020 08:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgEHGkX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 May 2020 02:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727909AbgEHGkW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 May 2020 02:40:22 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5AAC05BD09
        for <linux-doc@vger.kernel.org>; Thu,  7 May 2020 23:40:22 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v63so431614pfb.10
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2020 23:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wKID/Cl4tUQxiQJpuetvI2JFoStwB5HzL1GiVfb5+cA=;
        b=i8ZcQCpAllHeEr1aHeWq2vIRYm4Xx5t0+HHrz3Z7O3f+6+t5f9E5knP3XB7ZroAzRR
         F45r9mSaTdqojAf8TmM34xYOd17MdlRZnRVelUlCL1DDpbqNepvGzwzmDPBuPL88PVZl
         UHun6+gAU4XsV8S5FEMS1Dvb5xTg4rIdPyKbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKID/Cl4tUQxiQJpuetvI2JFoStwB5HzL1GiVfb5+cA=;
        b=UKlesDxvnXU1X7mQf0WYq9VfOkhFIOYYpga8DBMODW3rrzvJc/B4gWquW5XK26/+gS
         2+iQLvQAd3jWVVFsCeC1WZpU3RNgTct4pqUM4Tzsr+RFnQLmMSv2i9m7SMMddgE+3wFx
         EDNljqcPwuyhn8fk5YjondLKJhWN5nmEkQu84+Dv3beL43C4rG86iA+gnvhxj3tDp+fX
         XGA3cBUIS53drQFXaYnnjs17LNR4hU1nJ7nIj5Tn0F6h5p1TALTm6fGJ285ty1c4aTTx
         gdoimBlAvI5OmU4Lq3pBx3A5OnmvZIcPjdNJRYp9zmW0QS9uBpepIIFpXRF0odHn6wYC
         /mxQ==
X-Gm-Message-State: AGi0PuZJwlz4vw4gfGLNF221pVAgcAsS4gFuGvo7SwTqaRnyBHMKDfk1
        STu7s44PetnWjuCQeJUQbURcng==
X-Google-Smtp-Source: APiQypLfMwSWfqyHjhWWcMDEtuWVrnUuoVlaew9c4twdZv4OpDw51QuFRDD2qG1PeuMABCCofJYkAw==
X-Received: by 2002:a63:ad08:: with SMTP id g8mr973395pgf.40.1588920021542;
        Thu, 07 May 2020 23:40:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e11sm632749pgs.41.2020.05.07.23.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 23:40:16 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/12] pstore/blk: Provide way to query pstore configuration
Date:   Thu,  7 May 2020 23:40:02 -0700
Message-Id: <20200508064004.57898-11-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508064004.57898-1-keescook@chromium.org>
References: <20200508064004.57898-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

In order to configure itself, the MTD backend needs to be able to query
the current pstore configuration. Introduce pstore_blk_usr_info() for
this purpose.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-10-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c            | 37 ++++++++++++++++++++++++++++++-------
 include/linux/pstore_blk.h | 10 ++++++++++
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index e33e58afd4cb..c6d99d5dcd7f 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -86,6 +86,17 @@ static struct bdev_info {
 	sector_t start_sect;
 } g_bdev_info;
 
+#define check_size(name, alignsize) ({				\
+	long _##name_ = (name);					\
+	_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
+	if (_##name_ & ((alignsize) - 1)) {			\
+		pr_info(#name " must align to %d\n",		\
+				(alignsize));			\
+		_##name_ = ALIGN(name, (alignsize));		\
+	}							\
+	_##name_;						\
+})
+
 /**
  * struct psblk_device - back-end pstore/blk driver structure.
  *
@@ -140,13 +151,11 @@ static int psblk_register_do(struct psblk_device *dev)
 	if (!dev->flags)
 		dev->flags = UINT_MAX;
 #define verify_size(name, alignsize, enable) {				\
-		long _##name_ = (enable) ? (name) : 0;			\
-		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
-		if (_##name_ & ((alignsize) - 1)) {			\
-			pr_info(#name " must align to %d\n",		\
-					(alignsize));			\
-			_##name_ = ALIGN(name, (alignsize));		\
-		}							\
+		long _##name_;						\
+		if (enable)						\
+			_##name_ = check_size(name, alignsize);		\
+		else							\
+			_##name_ = 0;					\
 		name = _##name_ / 1024;					\
 		pstore_zone_info->name = _##name_;				\
 	}
@@ -465,6 +474,20 @@ int psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect)
 }
 EXPORT_SYMBOL_GPL(psblk_blkdev_info);
 
+/* get information of pstore/blk */
+int pstore_blk_usr_info(struct pstore_blk_info *info)
+{
+	strncpy(info->device, blkdev, 80);
+	info->max_reason = max_reason;
+	info->kmsg_size = check_size(kmsg_size, 4096);
+	info->pmsg_size = check_size(pmsg_size, 4096);
+	info->ftrace_size = check_size(ftrace_size, 4096);
+	info->console_size = check_size(console_size, 4096);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pstore_blk_usr_info);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
 MODULE_DESCRIPTION("pstore backend for block devices");
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 828b0763d477..dd5213044e21 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -27,4 +27,14 @@ int  psblk_register_blkdev(unsigned int major, unsigned int flags,
 void psblk_unregister_blkdev(unsigned int major);
 int  psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect);
 
+struct pstore_blk_info {
+	char device[80];
+	enum kmsg_dump_reason max_reason;
+	unsigned long kmsg_size;
+	unsigned long pmsg_size;
+	unsigned long console_size;
+	unsigned long ftrace_size;
+};
+int pstore_blk_usr_info(struct pstore_blk_info *info);
+
 #endif
-- 
2.20.1

