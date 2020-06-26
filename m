Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA5220B66A
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2020 18:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgFZQz5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jun 2020 12:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgFZQz4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 12:55:56 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E387C03E979
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 09:55:56 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a6so9259532wmm.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/lPkRY5zqjvg98KXV/ewwSSeHltl7MZJ65glZzN0dPQ=;
        b=pLjENJnipeX3viAS4oiwGwHuQxp+luxXZFGZNsk1Sebe+55YK89RfjyoqCEKXJitDd
         YXYUYb3XLd9ZDmYALGMwa8TWbueR6z6aF/OopHNtymeQR9ejUEvzisKPw7GcbVhVuOsi
         MUZ/dh/7IIJ9GD7K8KpZf/5xUtGUnq9ZV8hBt4XmxENUJF/2OBLINttSSpIjG9CqwuA2
         8raCwfevgitmS+cwaxCB7BRGADKtJMm9BXsrC3fJKhwfxo3T1mdTX12ko/nGX/r1Bdz4
         xgJe/d0jzWZA1edu+NZ/nHI+ijq/TIAoznbHKixq+PLEB4nLXz+o3yObJczwYPrmLjmN
         +vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/lPkRY5zqjvg98KXV/ewwSSeHltl7MZJ65glZzN0dPQ=;
        b=tCvHrtEOXW8s/jqBRVpWv33ezatLEUuUl3BYMW4EiFXz5cn8v/Fym4gvDwKF2prD1p
         Z1wjfehd9YJHShAUwKzBClx/m798xWMornLg2e7elGHVN2nz7OOMaFWHL7Hw07xkMv51
         Esn61zGkuLyawzjiN+S1OY5LSDKdXW6wFadhYNBbes1IBxwKf+8IxXKLBe+GdNLS1Znw
         EXslUHs/qthPbJz3qli5DZoLGmKd9BNs3VM89rNdrnL0i6FDQjNjlwryOxDyB5xhf2OQ
         eFRal9EfqmFDum2HnBPxnmO9S6dEzU+JtfW6iEvOTI+2i34IuQYDmN8Lt5t/KVavoEZK
         lRzQ==
X-Gm-Message-State: AOAM531EkvHj7ClGEIo/LHbkqgbAORz2B6yqK8hcuBCJ3JHEUl5zQmYk
        6oohATw0qkf8dAeg4i+EhiXeIQ==
X-Google-Smtp-Source: ABdhPJyxOs5CR2+PSateKUw0zxt3VRMZK9JAKGI+K8Yv+vIR129kqzmxqJ60onO4gKykLo9nuvF2Fw==
X-Received: by 2002:a1c:6102:: with SMTP id v2mr4539558wmb.6.1593190554931;
        Fri, 26 Jun 2020 09:55:54 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x5sm18654706wmg.2.2020.06.26.09.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 09:55:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/5] devres: move the size check from alloc_dr() into a separate function
Date:   Fri, 26 Jun 2020 18:55:32 +0200
Message-Id: <20200626165535.7662-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200626165535.7662-1-brgl@bgdev.pl>
References: <20200626165535.7662-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We will perform the same size check in devm_krealloc(). Move the relevant
code into a separate helper.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/devres.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index c34327219c34..1df1fb10b2d9 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -89,15 +89,23 @@ static struct devres_group * node_to_group(struct devres_node *node)
 	return NULL;
 }
 
+static bool check_dr_size(size_t size, size_t *tot_size)
+{
+	/* We must catch any near-SIZE_MAX cases that could overflow. */
+	if (unlikely(check_add_overflow(sizeof(struct devres),
+					size, tot_size)))
+		return false;
+
+	return true;
+}
+
 static __always_inline struct devres * alloc_dr(dr_release_t release,
 						size_t size, gfp_t gfp, int nid)
 {
 	size_t tot_size;
 	struct devres *dr;
 
-	/* We must catch any near-SIZE_MAX cases that could overflow. */
-	if (unlikely(check_add_overflow(sizeof(struct devres), size,
-					&tot_size)))
+	if (!check_dr_size(size, &tot_size))
 		return NULL;
 
 	dr = kmalloc_node_track_caller(tot_size, gfp, nid);
-- 
2.26.1

