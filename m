Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35595786A74
	for <lists+linux-doc@lfdr.de>; Thu, 24 Aug 2023 10:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235837AbjHXIpL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Aug 2023 04:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240599AbjHXIo6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 04:44:58 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ACF1995
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:44:31 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68bed8de5b9so444107b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692866671; x=1693471471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0h2wCokTLJGZ1d7u4CaVmkJlNkioh2OoblHBPOXP7Y=;
        b=GU+s3fTu2FDxNiPO58MSm3Vxp4woxATRdJTPDCQwLL020xXBUtA+4rnYDfxN1W9Q7K
         fMuLfJgKDC1gIgYy2HB5IAbX899ZwGBQqGxFPKqBFZqHNIG+hjC2mladvuojiZu++ecW
         Knx30ngXQpHJi832AuCm9Uic2F+d+JhZ0xVqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866671; x=1693471471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0h2wCokTLJGZ1d7u4CaVmkJlNkioh2OoblHBPOXP7Y=;
        b=Q1rptvipUxGoByWCL4BHwzF9WwuK3dOqujw1TxTjsAMh+RrcT7aUKnkNSjw0gkJOJs
         +ti1tRTHzn+8/7UKGd3UOsD2hthq5HJmFjB3Ogc3SKcvff5AXCCvfQn7U2isJqBGf7gx
         WadgiDh8NMZhZjQJp+pcKl5nGkuaghe0IVNlELI8z5yJwg39v7wj7DUzxwYrr4n7/dNj
         PKOs6r7XctVFbeOhuOchfJ/LHApkxPgRqsycW7fD0yd9JQRBkJcx6vnsWFDIxJgDfHhm
         0mUZ0tDE0oeLFPV5RLzdjnY4nXt3xupI9Kl5zgc8JGCa8EkPSDlFpzteQK5VlM1ZyNSS
         7Q+g==
X-Gm-Message-State: AOJu0Yzmok5PiXmtZ3jmDo0UIj6/iNOok6cv4TJVRyDb9OCdSKf0PIul
        aGpRd3fJFNrVKRoOtdXV+roReg==
X-Google-Smtp-Source: AGHT+IHGBOkAybyBRvbwW8FZvSLHgn3d4Dl+7Q7Y2duNrnaif+0P80U7WBGBKSEy6npZMepLI1LnLg==
X-Received: by 2002:a17:90b:a0e:b0:263:931b:bb5f with SMTP id gg14-20020a17090b0a0e00b00263931bbb5fmr11269635pjb.14.1692866671127;
        Thu, 24 Aug 2023 01:44:31 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id 12-20020a17090a194c00b00268188ea4b9sm1150216pjh.19.2023.08.24.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 01:44:30 -0700 (PDT)
From:   Brandon Pollack <brpol@chromium.org>
To:     marius.vlad@collabora.com, jshargo@chromium.org
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mairacanal@riseup.net,
        melissa.srw@gmail.com, mripard@kernel.org,
        rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de,
        airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mduggan@chromium.org,
        hirono@chromium.org, Brandon Pollack <brpol@chromium.org>
Subject: [PATCH v4 3/7] drm/vkms: Provide platform data when creating VKMS devices
Date:   Thu, 24 Aug 2023 08:40:34 +0000
Message-ID: <20230824084350.1062579-4-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824084350.1062579-1-brpol@chromium.org>
References: <20230824084350.1062579-1-brpol@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jim Shargo <jshargo@chromium.org>

This is a small refactor to make ConfigFS support easier. This should be
a no-op refactor.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Brandon Pollack <brpol@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 14 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h    |  9 ++++++---
 drivers/gpu/drm/vkms/vkms_output.c |  2 +-
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 65b1e2c52106..6c94c2b5d529 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -9,6 +9,7 @@
  * the GPU in DRM API tests.
  */
 
+#include "asm-generic/errno-base.h"
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -171,12 +172,14 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkms_output_init(vkmsdev, 0);
+	return vkmsdev->is_default ? vkms_output_init_default(vkmsdev) :
+				     -EINVAL;
 }
 
 static int vkms_platform_probe(struct platform_device *pdev)
 {
 	int ret;
+	struct vkms_device_setup *vkms_device_setup = pdev->dev.platform_data;
 	struct vkms_device *vkms_device;
 	void *grp;
 
@@ -195,6 +198,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
 	vkms_device->config.cursor = enable_cursor;
 	vkms_device->config.writeback = enable_writeback;
 	vkms_device->config.overlay = enable_overlay;
+	vkms_device->is_default = vkms_device_setup->is_default;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
@@ -258,6 +262,9 @@ static int __init vkms_init(void)
 {
 	int ret;
 	struct platform_device *pdev;
+	struct vkms_device_setup vkms_device_setup = {
+		.is_default = true,
+	};
 
 	ret = platform_driver_register(&vkms_platform_driver);
 	if (ret) {
@@ -265,8 +272,11 @@ static int __init vkms_init(void)
 		return ret;
 	}
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	pdev = platform_device_register_data(NULL, DRIVER_NAME, 0,
+					     &vkms_device_setup,
+					     sizeof(vkms_device_setup));
 	if (IS_ERR(pdev)) {
+		DRM_ERROR("Unable to register default vkms device\n");
 		platform_driver_unregister(&vkms_platform_driver);
 		return PTR_ERR(pdev);
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 761cd809617e..4262dcffd7e1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -132,17 +132,20 @@ struct vkms_output {
 	struct vkms_plane planes[VKMS_MAX_PLANES];
 };
 
-struct vkms_device;
-
 struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
 };
 
+struct vkms_device_setup {
+	bool is_default;
+};
+
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
+	bool is_default;
 	struct vkms_output output;
 	struct vkms_config config;
 };
@@ -166,7 +169,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 				 struct drm_plane *primary,
 				 struct drm_plane *cursor);
 
-int vkms_output_init(struct vkms_device *vkmsdev, int index);
+int vkms_output_init_default(struct vkms_device *vkmsdev);
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 				   enum drm_plane_type type);
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 86faf94f7408..bfc2e2362c6d 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -80,7 +80,7 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
 	return encoder;
 }
 
-int vkms_output_init(struct vkms_device *vkmsdev, int index)
+int vkms_output_init_default(struct vkms_device *vkmsdev)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-- 
2.42.0.rc1.204.g551eb34607-goog

