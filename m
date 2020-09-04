Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E952E25DE74
	for <lists+linux-doc@lfdr.de>; Fri,  4 Sep 2020 17:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgIDPuQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Sep 2020 11:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgIDPqm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 11:46:42 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3396BC061264
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 08:46:36 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id b79so6498052wmb.4
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2020 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G/17FBPXPIWM8suCIksrM34pviF3YRrgB9AFaEGMFdE=;
        b=s1xR3LsW3xC8wWHiTS17D3noApVypmQZqsrQfpiRs3PVIwAeFMZZbmrhd8Ci29gUPJ
         qeOOKIOcwVPtsmoJlPGUTae8LZaB1lpmP6r4EJ1NBihJlqmxiuHREKgewRXkyhcbElzS
         SS1a0rIr4TASNOM3hcJ3cZB11T75Gewkn/+XChRfGta6FMOWhPlpWi43w+qSn+26/cg3
         pbuCojaEVkETdLTS/bA9q1uWIDfRtJyA3iW487kzDXs//zaJpMKiytj5yoUxgcrwimPG
         bUmkGN4uCR708R4v0zUpXw1XNhk53ufiFhyihcZ01PCTVRPSHlYYUYA4uWSsDCodiL31
         v+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G/17FBPXPIWM8suCIksrM34pviF3YRrgB9AFaEGMFdE=;
        b=RbIwbWDMbh56UayAMyF7tbYeLdqvCB2zcHrdOMV7/Ef5o8V7PDmWoKmg6MHLgBT4dy
         9FSsl+V/mOjn7sHOSxvWgA9DqfGT8gIQeGgcamtkSOoFVQ13h9r+nCVY5eH/ukzXG/YY
         kCcZp3ceEXC9O3zRR3vSu7gfsgmzqa6CauWZ5KNqSvnevmLicN9YBeGVDLInZtPI2sfz
         DqrwaMKCYj60hHu0e4AttPcfcOMYuDkC89I5Cn3Uwq40If2Y3kYvC1ODfq3OORBvdrGL
         5/Z9i9XuEMuAfZeMv9s8mnLYXxymaijH3N78D8vmVpO4xxpOp4ynNhsyLCe5jhICDdiE
         v3og==
X-Gm-Message-State: AOAM5326hTKOkbuOokCtluOOjv/9UlGl4bm3Lbj71KXgEmbMKWhjgxDT
        FiXg1PeW4cse/OXT3aXoVz0n+1JTEnAZsA==
X-Google-Smtp-Source: ABdhPJz+8ARUs/kkukG0PPhJ3TJmui9hHStd+idsyDCLVB6+Ez/AJZiQ1EBjt7zRf0qJu3eKFFnoJg==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr8050965wmg.164.1599234394881;
        Fri, 04 Sep 2020 08:46:34 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 03/23] lib: uaccess: provide getline_from_user()
Date:   Fri,  4 Sep 2020 17:45:27 +0200
Message-Id: <20200904154547.3836-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide a uaccess helper that allows callers to copy a single line from
user memory. This is useful for debugfs write callbacks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/uaccess.h |  3 +++
 lib/usercopy.c          | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 94b285411659..5aedd8ac5c31 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -333,6 +333,9 @@ long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
 		long count);
 long strnlen_user_nofault(const void __user *unsafe_addr, long count);
 
+ssize_t getline_from_user(char *dst, size_t dst_size,
+			  const char __user *src, size_t src_size);
+
 /**
  * get_kernel_nofault(): safely attempt to read from a location
  * @val: read into this variable
diff --git a/lib/usercopy.c b/lib/usercopy.c
index b26509f112f9..55aaaf93d847 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -87,3 +87,40 @@ int check_zeroed_user(const void __user *from, size_t size)
 	return -EFAULT;
 }
 EXPORT_SYMBOL(check_zeroed_user);
+
+/**
+ * getline_from_user - Copy a single line from user
+ * @dst: Where to copy the line to
+ * @dst_size: Size of the destination buffer
+ * @src: Where to copy the line from
+ * @src_size: Size of the source user buffer
+ *
+ * Copies a number of characters from given user buffer into the dst buffer.
+ * The number of bytes is limited to the lesser of the sizes of both buffers.
+ * If the copied string contains a newline, its first occurrence is replaced
+ * by a NULL byte in the destination buffer. Otherwise the function ensures
+ * the copied string is NULL-terminated.
+ *
+ * Returns the number of copied bytes or a negative error number on failure.
+ */
+
+ssize_t getline_from_user(char *dst, size_t dst_size,
+			  const char __user *src, size_t src_size)
+{
+	size_t size = min_t(size_t, dst_size, src_size);
+	char *c;
+	int ret;
+
+	ret = copy_from_user(dst, src, size);
+	if (ret)
+		return -EFAULT;
+
+	dst[size - 1] = '\0';
+
+	c = strchrnul(dst, '\n');
+	if (*c)
+		*c = '\0';
+
+	return c - dst;
+}
+EXPORT_SYMBOL(getline_from_user);
-- 
2.26.1

