Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F11C443EE0
	for <lists+linux-doc@lfdr.de>; Wed,  3 Nov 2021 10:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbhKCJFp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Nov 2021 05:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhKCJFn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Nov 2021 05:05:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53411C06120D
        for <linux-doc@vger.kernel.org>; Wed,  3 Nov 2021 02:03:06 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so3784363lfu.5
        for <linux-doc@vger.kernel.org>; Wed, 03 Nov 2021 02:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VnwvHhRVfMlj7AENVrBuyzJTfXlbVoFinbin3zZfQAE=;
        b=LtXm3dA7MQ6dUNvqq9edcqNrUoFg9/UAnmZ1CHv6+aujdVvSNJYsxYlqkNAWJnjFDu
         EuMwqGhcM2uwOWPAWym7ZlX2vNC196HRZJGPCmEv3YJdpFkmNguTHtCWf6SUo0OQ4itT
         ie9vQdfMVF91b5xD78Ql3AJmxrj7Gk2oisFYjqhN64yCjQpbX5E96on+mHhvN7K1JaBx
         f/FV3HmS7701JBzt0/RnV25Xi5cmuKr2h5FsvTd+ja0W2A1/GzYKXxSeBryXo4NF59yR
         iBm7v4ASoe+OG4Eh10bk7A7xK4BfO8fdJQxp1zcleOfExezfIxXJYSh8FIRqGKAOukxf
         tOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VnwvHhRVfMlj7AENVrBuyzJTfXlbVoFinbin3zZfQAE=;
        b=0SMKKaQEhMXkwSu4dNjgvFKhosaENyhH6oRCv/SotbpM//eRAyYTvZqK/XAip0f4Jz
         3QUergON3c4inRa4C4tIwRC0cQYmQNGa2Nb0OjBtv7DI1GxG5yRxg2CamSkQKbpvXvRl
         cAADp4onmasZkYjdUFYxtFqig7RMZFtVpmGEIfQso1H7pxLdNsrCXi3qga1tN4OXnRGC
         1zS6h0jkaaJUmxUFpxMisg652ChrgDeWSUAN3zbmmuxjjnTMR3RF7oFW8CMXKpO3jbVX
         RCTN/bwWK7AxZ0gvv2pL3ETYGaq3aEkYm0zkKWxLeToiFeJuOstgU1KFKBczR04ttoyP
         1Feg==
X-Gm-Message-State: AOAM532CUtMx/2ahiKhtdg+aPDWb6jPOkgwUXBojZ6tvcgCDVwE+eaTT
        9ryqoziByGWg8hUAI2CiZJ/LpQ==
X-Google-Smtp-Source: ABdhPJyAVI+qjX3kgLD2yOVvS/SSMgrb3OQm3fGGTr4NZa/pynv4ZVDjFADk2PIC4TobgYqrWzCJBg==
X-Received: by 2002:a05:6512:31d2:: with SMTP id j18mr19318412lfe.229.1635930184683;
        Wed, 03 Nov 2021 02:03:04 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id w16sm124373lfr.233.2021.11.03.02.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 02:03:04 -0700 (PDT)
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>, jens.vankeirsbilck@kuleuven.be,
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 4/6] tee: export teedev_open() and teedev_close_context()
Date:   Wed,  3 Nov 2021 10:02:53 +0100
Message-Id: <20211103090255.998070-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103090255.998070-1-jens.wiklander@linaro.org>
References: <20211103090255.998070-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Exports the two functions teedev_open() and teedev_close_context() in
order to make it easier to create a driver internal struct tee_context.

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c  |  6 ++++--
 include/linux/tee_drv.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 85102d12d716..3fc426dad2df 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -43,7 +43,7 @@ static DEFINE_SPINLOCK(driver_lock);
 static struct class *tee_class;
 static dev_t tee_devt;
 
-static struct tee_context *teedev_open(struct tee_device *teedev)
+struct tee_context *teedev_open(struct tee_device *teedev)
 {
 	int rc;
 	struct tee_context *ctx;
@@ -70,6 +70,7 @@ static struct tee_context *teedev_open(struct tee_device *teedev)
 	return ERR_PTR(rc);
 
 }
+EXPORT_SYMBOL_GPL(teedev_open);
 
 void teedev_ctx_get(struct tee_context *ctx)
 {
@@ -96,13 +97,14 @@ void teedev_ctx_put(struct tee_context *ctx)
 	kref_put(&ctx->refcount, teedev_ctx_release);
 }
 
-static void teedev_close_context(struct tee_context *ctx)
+void teedev_close_context(struct tee_context *ctx)
 {
 	struct tee_device *teedev = ctx->teedev;
 
 	teedev_ctx_put(ctx);
 	tee_device_put(teedev);
 }
+EXPORT_SYMBOL_GPL(teedev_close_context);
 
 static int tee_open(struct inode *inode, struct file *filp)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index a1f03461369b..468a7d83dc6c 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -587,4 +587,18 @@ struct tee_client_driver {
 #define to_tee_client_driver(d) \
 		container_of(d, struct tee_client_driver, driver)
 
+/**
+ * teedev_open() - Open a struct tee_device
+ * @teedev:	Device to open
+ *
+ * @return a pointer to struct tee_context on success or an ERR_PTR on failure.
+ */
+struct tee_context *teedev_open(struct tee_device *teedev);
+
+/**
+ * teedev_close_context() - closes a struct tee_context
+ * @ctx:	The struct tee_context to close
+ */
+void teedev_close_context(struct tee_context *ctx);
+
 #endif /*__TEE_DRV_H*/
-- 
2.31.1

