Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388FE7806A5
	for <lists+linux-doc@lfdr.de>; Fri, 18 Aug 2023 09:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358294AbjHRHwF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Aug 2023 03:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358370AbjHRHvl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 03:51:41 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F06C3A98
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 00:51:31 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bee82fad0fso4700105ad.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692345091; x=1692949891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xQIXi7bu5jPEvUoNFU5+d+V/znMEpTNbM7qk9XTFgo=;
        b=eq+hP22DvvnsKyaGb4GpJhSFcmtFPouNWaykjXJEmgiacy1UkdEVz0W1rPsG7a9/fR
         ehdeFrt203OKM4jnTgzNKywfKYAmB6eCpLRvxdnfZDve6x00cLtSc1a50r3VdHGTC3o2
         pVXiutp0JITLlvuGR+utPRcLr84Js0UL1ZPTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692345091; x=1692949891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xQIXi7bu5jPEvUoNFU5+d+V/znMEpTNbM7qk9XTFgo=;
        b=lNsQ7p5EYkClBpJly3dFARElZPUg3Z4gDJiq6liH09ly2qfrOtlHuk/BwH1Y/FUykN
         PaFCYt6lv6sJZjI5iWIMvWbXidnfWqaj5y36TSXo3irHhMcxarpg9IVb2lGzFVEwLHTV
         jp/xmOY2q3sjXEYThy/DLthBB5ha6N17ix3rvWBOHVDJN2yodk+Ul98Mp/hUHvfh1Yo7
         KsK/8NViMOWOYzpmxFAaQHoCdoM0gVTaV92dK9zw5uoj+4128zkbk1mNruHGzZyIifhV
         IezxB46ST1/O7PXDOcqynQMUltqJgRAHLDlLYpThSkyWia+6HsEZI0XGUJk8dx464W70
         b4lg==
X-Gm-Message-State: AOJu0YyPplu0SU90Jb2NArmFeWrxEN6vITJrthPI4qxIfbT426exez6m
        Kiio/qdr/3QGgyq4ilxxA6J1Ig==
X-Google-Smtp-Source: AGHT+IF2tQ2Roon7imWvNaqUz0mUnCZfJeO9cpLl58glxAIaBSV5L+dpgFsbym1qdL7JCpEhdtD7fw==
X-Received: by 2002:a17:903:32cb:b0:1bc:921c:eb48 with SMTP id i11-20020a17090332cb00b001bc921ceb48mr1845667plr.34.1692345090866;
        Fri, 18 Aug 2023 00:51:30 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b001ba066c589dsm1051834plb.137.2023.08.18.00.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 00:51:30 -0700 (PDT)
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
Subject: [PATCH v3 1/7] drm/vkms: Back VKMS with DRM memory management instead of static objects
Date:   Fri, 18 Aug 2023 07:43:06 +0000
Message-ID: <20230818075057.3426088-2-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230818075057.3426088-1-brpol@chromium.org>
References: <20230818075057.3426088-1-brpol@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jim Shargo <jshargo@chromium.org>

This is a small refactor to make ConfigFS support easier. Once we
support ConfigFS, there can be multiple devices instantiated by the
driver, and so moving everything into managed memory makes things much
easier.

This should be a no-op refactor.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Brandon Pollack <brpol@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 128 +++++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_drv.h    |   4 +-
 drivers/gpu/drm/vkms/vkms_output.c |   6 +-
 3 files changed, 71 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd0af086e7fa..387c832f5dc9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -9,10 +9,12 @@
  * the GPU in DRM API tests.
  */
 
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -37,8 +39,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static struct vkms_config *default_config;
-
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
@@ -96,9 +96,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+	seq_printf(m, "writeback=%d\n", vkmsdev->config.writeback);
+	seq_printf(m, "cursor=%d\n", vkmsdev->config.cursor);
+	seq_printf(m, "overlay=%d\n", vkmsdev->config.overlay);
 
 	return 0;
 }
@@ -166,121 +166,127 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.cursor_height = 512;
 	/* FIXME: There's a confusion between bpp and depth between this and
 	 * fbdev helpers. We have to go with 0, meaning "pick the default",
-	 * which ix XRGB8888 in all cases. */
+	 * which ix XRGB8888 in all cases.
+	 */
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
 	return vkms_output_init(vkmsdev, 0);
 }
 
-static int vkms_create(struct vkms_config *config)
+static int vkms_platform_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct platform_device *pdev;
 	struct vkms_device *vkms_device;
+	void *grp;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto out_unregister;
-	}
+	grp = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!grp)
+		return -ENOMEM;
 
 	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
 					 struct vkms_device, drm);
 	if (IS_ERR(vkms_device)) {
 		ret = PTR_ERR(vkms_device);
-		goto out_devres;
+		goto out_release_group;
 	}
+
 	vkms_device->platform = pdev;
-	vkms_device->config = config;
-	config->dev = vkms_device;
+	vkms_device->config.cursor = enable_cursor;
+	vkms_device->config.writeback = enable_writeback;
+	vkms_device->config.overlay = enable_overlay;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
-
 	if (ret) {
 		DRM_ERROR("Could not initialize DMA support\n");
-		goto out_devres;
+		goto out_release_group;
 	}
 
 	ret = drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
-		goto out_devres;
+		goto out_release_group;
 	}
 
 	ret = vkms_modeset_init(vkms_device);
-	if (ret)
-		goto out_devres;
+	if (ret) {
+		DRM_ERROR("Unable to initialize modesetting\n");
+		goto out_release_group;
+	}
 
 	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
 			      ARRAY_SIZE(vkms_config_debugfs_list));
 
 	ret = drm_dev_register(&vkms_device->drm, 0);
-	if (ret)
-		goto out_devres;
+	if (ret) {
+		DRM_ERROR("Unable to register device with id %d\n", pdev->id);
+		goto out_release_group;
+	}
 
 	drm_fbdev_generic_setup(&vkms_device->drm, 0);
+	platform_set_drvdata(pdev, vkms_device);
+	devres_close_group(&pdev->dev, grp);
 
 	return 0;
 
-out_devres:
-	devres_release_group(&pdev->dev, NULL);
-out_unregister:
-	platform_device_unregister(pdev);
+out_release_group:
+	devres_release_group(&pdev->dev, grp);
 	return ret;
 }
 
-static int __init vkms_init(void)
+static int vkms_platform_remove(struct platform_device *pdev)
 {
-	int ret;
-	struct vkms_config *config;
-
-	config = kmalloc(sizeof(*config), GFP_KERNEL);
-	if (!config)
-		return -ENOMEM;
-
-	default_config = config;
+	struct vkms_device *vkms_device;
 
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
+	vkms_device = platform_get_drvdata(pdev);
+	if (!vkms_device)
+		return 0;
 
-	ret = vkms_create(config);
-	if (ret)
-		kfree(config);
-
-	return ret;
+	drm_dev_unregister(&vkms_device->drm);
+	drm_atomic_helper_shutdown(&vkms_device->drm);
+	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+static struct platform_driver vkms_platform_driver = {
+	.probe = vkms_platform_probe,
+	.remove = vkms_platform_remove,
+	.driver.name = DRIVER_NAME,
+};
+
+static int __init vkms_init(void)
 {
+	int ret;
 	struct platform_device *pdev;
 
-	if (!config->dev) {
-		DRM_INFO("vkms_device is NULL.\n");
-		return;
+	ret = platform_driver_register(&vkms_platform_driver);
+	if (ret) {
+		DRM_ERROR("Unable to register platform driver\n");
+		return ret;
 	}
 
-	pdev = config->dev->platform;
-
-	drm_dev_unregister(&config->dev->drm);
-	drm_atomic_helper_shutdown(&config->dev->drm);
-	devres_release_group(&pdev->dev, NULL);
-	platform_device_unregister(pdev);
+	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&vkms_platform_driver);
+		return PTR_ERR(pdev);
+	}
 
-	config->dev = NULL;
+	return 0;
 }
 
 static void __exit vkms_exit(void)
 {
-	if (default_config->dev)
-		vkms_destroy(default_config);
+	struct device *dev;
+
+	while ((dev = platform_find_device_by_driver(
+			NULL, &vkms_platform_driver.driver))) {
+		// platform_find_device_by_driver increments the refcount. Drop
+		// it so we don't leak memory.
+		put_device(dev);
+		platform_device_unregister(to_platform_device(dev));
+	}
 
-	kfree(default_config);
+	platform_driver_unregister(&vkms_platform_driver);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index c7ae6c2ba1df..4c35d6305f2a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -124,15 +124,13 @@ struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
-	/* only set when instantiated */
-	struct vkms_device *dev;
 };
 
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
 	struct vkms_output output;
-	const struct vkms_config *config;
+	struct vkms_config config;
 };
 
 #define drm_crtc_to_vkms_output(target) \
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 5ce70dd946aa..963a64cf068b 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -62,7 +62,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	if (vkmsdev->config->overlay) {
+	if (vkmsdev->config.overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
 			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
 			if (ret)
@@ -70,7 +70,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		}
 	}
 
-	if (vkmsdev->config->cursor) {
+	if (vkmsdev->config.cursor) {
 		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
 		if (IS_ERR(cursor))
 			return PTR_ERR(cursor);
@@ -103,7 +103,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		goto err_attach;
 	}
 
-	if (vkmsdev->config->writeback) {
+	if (vkmsdev->config.writeback) {
 		writeback = vkms_enable_writeback_connector(vkmsdev);
 		if (writeback)
 			DRM_ERROR("Failed to init writeback connector\n");
-- 
2.42.0.rc1.204.g551eb34607-goog

