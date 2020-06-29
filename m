Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B6320E0EF
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 23:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbgF2UvC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 16:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbgF2TNc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:13:32 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AC6C08ECAC
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2020 23:50:20 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l17so14277796wmj.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2020 23:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kw/uv7mzLibBsj+LOWOIdk1Thny96wIQJHxJQ2eekIA=;
        b=SIZcYUqjXVEe8aMLi5SGPbYOBtdESkCMgL8suGnrl0Ahkbt5IgssgahqK/2ZJobC6l
         Zru4yIACrtfO3JJhea0gBpOzgKVGu1wHtE3+KKnPnvor3cgV/Jx68v2Z1HdA9yIjm5Ya
         nLupGdn7GehwjFWQD74IhdKCBaFBGW9+ZewUa3o6YmajgwDNrKexNV4xgN6EOXSN75pl
         K4/hyBCPM+GS48sgW+CTgH3wq3AZ5BWJroEAHyvJLugJrWczgUewtWDCH9smN3K69Ofy
         jcz55Pp54LrkY3D9986r7EAMb3bwh5pfB/1x4tlRDpBYQfI6G6XXO4MrEaUAef2xLuXc
         z8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kw/uv7mzLibBsj+LOWOIdk1Thny96wIQJHxJQ2eekIA=;
        b=A2vLhC84ld7XJBt6Tugf7XZ6mZPqBbfE9RJfh26M8mxoIMbs690DAuFi23Z2SPfL2L
         Nyg7recXqcIT36FK4/FpbURqmXFeML64bpDqDDrXr6L3lrIy/hCCzQDUJKSxIwjvHinY
         0s8BpRnckTAEF7uYj4TPxBGnBiVZcXmGz5xckWXM/v2DXqGgnah7C5/NLZArj7Z7eAc3
         X9ccoMiDm7VS3rnf+e3+S5UAd5WNpYKAEi5ob2oAsowT6EmQXmG5BYm+AaSaSJtc7Gji
         LxE0JZtHbMDwJuJt2zAlTrqNtFqaGHaM5RDQKNSU5CgzKBTyxsKysbYnT5VnUm5GgGTO
         JscA==
X-Gm-Message-State: AOAM530q15pHgMzRROSOaBry3rIfLbhb7YWT0656Ou7CMrb7rKeZ2wwP
        9I3dh3EwoocgPnu4qGoCiTxOcQ==
X-Google-Smtp-Source: ABdhPJw+V40exuzx/4bjMtVNs9KS0u1HH05sx9cQBmql8zhWKpmSYw8VZO59aPGiDhmCWJ2QUk9NJg==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr15841234wmi.85.1593413419047;
        Sun, 28 Jun 2020 23:50:19 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z25sm26400850wmk.28.2020.06.28.23.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 23:50:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/6] devres: handle zero size in devm_kmalloc()
Date:   Mon, 29 Jun 2020 08:50:06 +0200
Message-Id: <20200629065008.27620-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629065008.27620-1-brgl@bgdev.pl>
References: <20200629065008.27620-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Make devm_kmalloc() behave similarly to non-managed kmalloc(): return
ZERO_SIZE_PTR when requested size is 0. Update devm_kfree() to handle
this case.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/devres.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 1df1fb10b2d9..ed615d3b9cf1 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -819,6 +819,9 @@ void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
 {
 	struct devres *dr;
 
+	if (unlikely(!size))
+		return ZERO_SIZE_PTR;
+
 	/* use raw alloc_dr for kmalloc caller tracing */
 	dr = alloc_dr(devm_kmalloc_release, size, gfp, dev_to_node(dev));
 	if (unlikely(!dr))
@@ -950,10 +953,10 @@ void devm_kfree(struct device *dev, const void *p)
 	int rc;
 
 	/*
-	 * Special case: pointer to a string in .rodata returned by
-	 * devm_kstrdup_const().
+	 * Special cases: pointer to a string in .rodata returned by
+	 * devm_kstrdup_const() or NULL/ZERO ptr.
 	 */
-	if (unlikely(is_kernel_rodata((unsigned long)p)))
+	if (unlikely(is_kernel_rodata((unsigned long)p) || ZERO_OR_NULL_PTR(p)))
 		return;
 
 	rc = devres_destroy(dev, devm_kmalloc_release,
-- 
2.26.1

