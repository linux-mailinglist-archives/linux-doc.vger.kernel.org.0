Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0839227C20B
	for <lists+linux-doc@lfdr.de>; Tue, 29 Sep 2020 12:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgI2KLM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Sep 2020 06:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727663AbgI2KKR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 06:10:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF51C0613D1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z1so4720880wrt.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Ji8d51UZNthiwaFwQiiDA22tNDSUGquN8QOwnTBLMs=;
        b=dYn7ozwsu9fg/NjCG2J03XJS8gkymmXk+ZLjMvvFMy5YAsZb7wz4hUSy3iEQiWZQNP
         RPpxTHq0AyQ5etyPB+k11seysp+LrevA+87AsjBF3FqrCGsmj3s64V0FgPDhy1PKgCYT
         PTg/9yqwPbDzNxGWjzyaaqR7bGsGdliYQiuT7d2nKEIF6b6LTlgSDShNDZZZtI9Y10OC
         wrX6We+gzKz3zE5uBusmtL1fvrmkEoYQueI8AqPPHMo81IApcB7Wg2DprCiAJB/jt+eU
         z3f4tbHfi24RzvVJIJQRJ402fGnxI49OIYXPnDOu7IypL3hhhNnQIwQpo3l23Spad2/T
         XxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Ji8d51UZNthiwaFwQiiDA22tNDSUGquN8QOwnTBLMs=;
        b=UvdgIxyK3d9UBdhees9KGp8lsl3iTo0G+Y1vLQP/hjblR1+NNvMTQWwYRPyKKvRuxu
         zO0HnKCO0vj7tL7JjNllLY/XsdiOY6p4D+6/9iUecScoEycWA+bZVs8LGiSYsN8rrq4I
         Pyxc9wPEdyFfKVCRx6LSY7qi4q3j4EnNmLpHpqEalPiBoAnzvBSC7RCOQEYxMKK7AC4T
         WU1CIqc16C87jFJymPtPV3asB+N5D401hqEgd3wlkAuOimeneQaW+lUKVd0Uib7eEsLX
         vaC1x9dBgUg8IrbKzKuzYlU8JMDpb5a1x8WlT5n0zMC2ZyRK7zafI17AeZw6XiyriV/2
         ux9A==
X-Gm-Message-State: AOAM5327uOVJxrJT/kEbI4QvQylom5sPNazaEEam2jKhvycmBtT/HSiG
        rwWJZ90iQwyovWaREbMn2VQ++Q==
X-Google-Smtp-Source: ABdhPJxMbY4zNLxYSqL/hs2GeeOd4gbGIk3Je7AqtBA5FUlPfloGghminqaN+JIdSsNscq6TH9/Wpw==
X-Received: by 2002:adf:f34a:: with SMTP id e10mr3315435wrp.91.1601374215541;
        Tue, 29 Sep 2020 03:10:15 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 01/10] lib: string_helpers: provide kfree_strarray()
Date:   Tue, 29 Sep 2020 12:09:55 +0200
Message-Id: <20200929101004.20288-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's a common pattern of dynamically allocating an array of char
pointers and then also dynamically allocating each string in this
array. Provide a helper for freeing such a string array with one call.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/string_helpers.h |  2 ++
 lib/string_helpers.c           | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 86f150c2a6b6..fa06dcdc481e 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -94,4 +94,6 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
 char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
 char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
+void kfree_strarray(char **array, size_t n);
+
 #endif
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 963050c0283e..efeee2353613 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -649,3 +649,27 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
 	return pathname;
 }
 EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
+
+/**
+ * kfree_strarray - free a number of dynamically allocated strings contained
+ *                  in an array and the array itself
+ *
+ * @array: Dynamically allocated array of strings to free. If NULL - the
+ *         function does nothing.
+ * @n: Number of strings (starting from the beginning of the array) to free.
+ *
+ * Passing a non-null @array and @n == 0 as well as NULL @array  are valid
+ * use-cases.
+ */
+void kfree_strarray(char **array, size_t n)
+{
+	unsigned int i;
+
+	if (!array)
+		return;
+
+	for (i = 0; i < n; i++)
+		kfree(array[i]);
+	kfree(array);
+}
+EXPORT_SYMBOL_GPL(kfree_strarray);
-- 
2.26.1

