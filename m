Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139C0786A78
	for <lists+linux-doc@lfdr.de>; Thu, 24 Aug 2023 10:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238169AbjHXIpM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Aug 2023 04:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240613AbjHXIpC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 04:45:02 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09B619AF
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:44:37 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1c4dd644cf8so4360808fac.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692866677; x=1693471477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocyPAKKX521T6966Y+drdAvNfWff2ldNMCngIa6Z9vs=;
        b=PRI1CWOx5QBzD2xf1IjSW4h9G0oRr7kApFGm9cR/xOk5lczV0DAxvgxskUsu4JS0ih
         vyp9OrON4WNTax2yGwdwkpt4pYp0TGvrnuM4cFqlbpVUKG8cDZ3lWauWvZftxD+D9kV+
         WaGGrXprjXZrzY8Y8Pewp30LSwBX+tfg0fEF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866677; x=1693471477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocyPAKKX521T6966Y+drdAvNfWff2ldNMCngIa6Z9vs=;
        b=lERkggAekHq/23bLCq8porDivaFmv2gsBMMGc1mGBwYg2XYpTTJpU8f6Xe3jI57U09
         5/huf5r3SACvJHmONIV8DHLXw49srovZTt/VQsROiq2YZ7BIxkRnK28GBvmX4TvWXDPh
         ONE7DI0iqtoL6lb//6w0E/eNwSmtEPNpyQ98vnqR20FhHH5maMlsci1Zha9tF0KEaLOY
         aGnOAtR4xc1dg/HnUdOyvoHWuRZ7rtJmQfuPE90qECutDpzA6SkMNFkehYF7aBpjB4Ai
         EC7/Sb7X7F73rgWXAcTKRj5kc/yUlKyJ9E6fPjilBDgQ+o/1f1Uk1f5GhFA+pw99qAAa
         cq6A==
X-Gm-Message-State: AOJu0YyngRCdz2YzHqN/yBa4tkZNaNmoLzVLTLty/vb32aMNbJJk33CF
        PRd8Dz7jHjWn4xD1Ru7T5IIsPQ==
X-Google-Smtp-Source: AGHT+IGPoW3nuBqknD4KzXL5DQLBW7Sq8JH8Nndp5uNpswBdji+vhKLJit5EKEb6JUXD8JQeiKFpOA==
X-Received: by 2002:a05:6870:c154:b0:1bf:32c1:f326 with SMTP id g20-20020a056870c15400b001bf32c1f326mr18948517oad.45.1692866677166;
        Thu, 24 Aug 2023 01:44:37 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id 12-20020a17090a194c00b00268188ea4b9sm1150216pjh.19.2023.08.24.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 01:44:36 -0700 (PDT)
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
Subject: [PATCH v4 5/7] drm/vkms: Support enabling ConfigFS devices
Date:   Thu, 24 Aug 2023 08:40:36 +0000
Message-ID: <20230824084350.1062579-6-brpol@chromium.org>
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

VKMS now supports creating and using virtual devices!

In addition to the enabling logic, this commit also prevents users from
adding new objects once a card is registered.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Brandon Pollack <brpol@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_configfs.c |  37 ++--
 drivers/gpu/drm/vkms/vkms_crtc.c     |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.c      |   1 +
 drivers/gpu/drm/vkms/vkms_drv.h      |   4 +-
 drivers/gpu/drm/vkms/vkms_output.c   | 281 +++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_plane.c    |  10 +-
 6 files changed, 281 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index f2439629b37b..c28fa87c196e 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -506,29 +506,40 @@ static ssize_t device_enabled_store(struct config_item *item, const char *buf,
 {
 	struct vkms_configfs *configfs = item_to_configfs(item);
 	struct vkms_device *device;
-	int value, ret;
+	int enabled, ret;
 
-	ret = kstrtoint(buf, 0, &value);
+	ret = kstrtoint(buf, 0, &enabled);
 	if (ret)
 		return ret;
 
-	if (value != 1)
-		return -EINVAL;
-
-	mutex_lock(&configfs->lock);
-
-	if (configfs->vkms_device) {
+	if (enabled == 0) {
+		mutex_lock(&configfs->lock);
+		if (configfs->vkms_device) {
+			vkms_remove_device(configfs->vkms_device);
+			configfs->vkms_device = NULL;
+		}
 		mutex_unlock(&configfs->lock);
+
 		return len;
 	}
 
-	device = vkms_add_device(configfs);
-	mutex_unlock(&configfs->lock);
+	if (enabled == 1) {
+		mutex_lock(&configfs->lock);
+		if (!configfs->vkms_device) {
+			device = vkms_add_device(configfs);
+			if (IS_ERR(device)) {
+				mutex_unlock(&configfs->lock);
+				return -PTR_ERR(device);
+			}
+
+			configfs->vkms_device = device;
+		}
+		mutex_unlock(&configfs->lock);
 
-	if (IS_ERR(device))
-		return -PTR_ERR(device);
+		return len;
+	}
 
-	return len;
+	return -EINVAL;
 }
 
 CONFIGFS_ATTR(device_, enabled);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 74bbd675464b..2aa1c5246b7e 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -279,7 +279,7 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 
 struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 				 struct drm_plane *primary,
-				 struct drm_plane *cursor)
+				 struct drm_plane *cursor, const char *name)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_crtc *vkms_crtc;
@@ -291,7 +291,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 	vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
 
 	ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
-					 &vkms_crtc_funcs, NULL);
+					 &vkms_crtc_funcs, name);
 	if (ret) {
 		DRM_ERROR("Failed to init CRTC\n");
 		goto out_error;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 819e880a8cf7..6e7f20681890 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -275,6 +275,7 @@ struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
 			dev, &vkms_platform_driver.driver))) {
 		pdev = to_platform_device(dev);
 		max_id = max(max_id, pdev->id);
+		put_device(dev);
 	}
 
 	pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8cdd7949f661..2b9545ada9c2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -250,13 +250,13 @@ void vkms_remove_device(struct vkms_device *vkms_device);
 /* CRTC */
 struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 				 struct drm_plane *primary,
-				 struct drm_plane *cursor);
+				 struct drm_plane *cursor, const char *name);
 
 int vkms_output_init(struct vkms_device *vkmsdev);
 int vkms_output_init_default(struct vkms_device *vkmsdev);
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type);
+				   enum drm_plane_type type, char* name, ...);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index dc69959c5e1d..9dde3a929789 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -2,8 +2,10 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -60,7 +62,8 @@ vkms_connector_init(struct vkms_device *vkms_device)
 	return connector;
 }
 
-static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
+static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
+					     char *name)
 {
 	struct drm_encoder *encoder;
 	int ret;
@@ -71,7 +74,7 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
 	encoder = &vkms_device->output
 			   .encoders[vkms_device->output.num_encoders++];
 	ret = drm_encoder_init(&vkms_device->drm, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+			       DRM_MODE_ENCODER_VIRTUAL, name);
 	if (ret) {
 		memset(encoder, 0, sizeof(*encoder));
 		vkms_device->output.num_encoders -= 1;
@@ -82,7 +85,6 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
 
 int vkms_output_init_default(struct vkms_device *vkmsdev)
 {
-	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
@@ -92,35 +94,34 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
 	int writeback;
 	unsigned int n;
 
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
+	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY,
+				  "default-primary-plane");
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config.overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			struct vkms_plane *overlay = vkms_plane_init(
-				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
-			if (IS_ERR(overlay)) {
-				ret = PTR_ERR(overlay);
-				goto err_planes;
-			}
+			struct vkms_plane *overlay =
+				vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY,
+						"default-overlay-plane-%d", n);
+			if (IS_ERR(overlay))
+				return PTR_ERR(overlay);
 		}
 	}
 
 	if (vkmsdev->config.cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
-		if (IS_ERR(cursor)) {
-			ret = PTR_ERR(cursor);
-			goto err_planes;
-		}
+		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR,
+					 "default-cursor-plane");
+		if (IS_ERR(cursor))
+			return PTR_ERR(cursor);
 	}
 
 	vkms_crtc = vkms_crtc_init(vkmsdev, &primary->base,
-				   cursor ? &cursor->base : NULL);
+				   cursor ? &cursor->base : NULL,
+				   "crtc-default");
 	if (IS_ERR(vkms_crtc)) {
 		DRM_ERROR("Failed to init crtc\n");
-		ret = PTR_ERR(vkms_crtc);
-		goto err_planes;
+		return PTR_ERR(vkms_crtc);
 	}
 
 	for (int i = 0; i < vkmsdev->output.num_planes; i++) {
@@ -131,22 +132,20 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-		ret = PTR_ERR(connector);
-		goto err_connector;
+		return PTR_ERR(connector);
 	}
 
-	encoder = vkms_encoder_init(vkmsdev);
+	encoder = vkms_encoder_init(vkmsdev, "encoder-default");
 	if (IS_ERR(encoder)) {
 		DRM_ERROR("Failed to init encoder\n");
-		ret = PTR_ERR(encoder);
-		goto err_encoder;
+		return PTR_ERR(encoder);
 	}
 	encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config.writeback) {
@@ -158,26 +157,234 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
 	drm_mode_config_reset(dev);
 
 	return 0;
+}
 
-err_attach:
-	drm_encoder_cleanup(encoder);
-
-err_encoder:
-	drm_connector_cleanup(connector);
+static bool is_object_linked(struct vkms_config_links *links, unsigned long idx)
+{
+	return links->linked_object_bitmap & (1 << idx);
+}
 
-err_connector:
-	drm_crtc_cleanup(&vkms_crtc->base);
+/**
+* validate_vkms_configfs_no_dangling_objects - warn on unused objects in vkms configfs.
+*
+* This gives slightly more visible warning messaging to the user before the drm
+* system finds the configuration invalid and prints it's debug information.  In
+* this case the user may have accidentally not included some links, or the user
+* could be testing this faulty configuration.
+*
+*/
+static void
+validate_vkms_configfs_no_dangling_objects(struct vkms_device *vkmsdev)
+{
+	struct vkms_configfs *configfs = vkmsdev->configfs;
+	struct config_item *item;
+
+	// 1. Planes
+	list_for_each_entry(item, &configfs->planes_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_plane *config_plane =
+			item_to_config_plane(item);
+		if (config_plane->possible_crtcs.linked_object_bitmap == 0)
+			DRM_WARN(
+				"Vkms configfs created plane %s has no linked crtcs",
+				item->ci_name);
+	}
 
-err_planes:
-	for (int i = 0; i < output->num_planes; i++)
-		drm_plane_cleanup(&output->planes[i].base);
+	// 2. connectors
+	list_for_each_entry(item, &configfs->connectors_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_connector *config_connector =
+			item_to_config_connector(item);
+		if (config_connector->possible_encoders.linked_object_bitmap ==
+		    0) {
+			DRM_WARN(
+				"Vkms configfs created connector %s has no linked encoders",
+				item->ci_name);
+		}
+	}
 
-	memset(output, 0, sizeof(*output));
+	// 3. encoders
+	list_for_each_entry(item, &configfs->encoders_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_encoder *config_encoder =
+			item_to_config_encoder(item);
+		if (config_encoder->possible_crtcs.linked_object_bitmap == 0) {
+			DRM_WARN(
+				"Vkms configfs created encoder %s has no linked crtcs",
+				item->ci_name);
+		}
+	}
 
-	return ret;
+	// 4. crtcs only require a primary plane to function, this is checked during
+	// output initialization and returns an error.
 }
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
-	return -EOPNOTSUPP;
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_configfs *configfs = vkmsdev->configfs;
+	struct vkms_output *output = &vkmsdev->output;
+	struct plane_map {
+		struct vkms_config_plane *config_plane;
+		struct vkms_plane *plane;
+	} plane_map[VKMS_MAX_PLANES] = { 0 };
+	struct encoder_map {
+		struct vkms_config_encoder *config_encoder;
+		struct drm_encoder *encoder;
+	} encoder_map[VKMS_MAX_OUTPUT_OBJECTS] = { 0 };
+	struct config_item *item;
+	int map_idx = 0;
+
+	// Ensure configfs has no unused objects, and warn if so.
+	validate_vkms_configfs_no_dangling_objects(vkmsdev);
+
+	list_for_each_entry(item, &configfs->planes_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_plane *config_plane =
+			item_to_config_plane(item);
+		struct vkms_plane *plane = vkms_plane_init(
+			vkmsdev, config_plane->type, item->ci_name);
+
+		if (IS_ERR(plane)) {
+			DRM_ERROR("Unable to init plane from config: %s",
+				  item->ci_name);
+			return PTR_ERR(plane);
+		}
+
+		plane_map[map_idx].config_plane = config_plane;
+		plane_map[map_idx].plane = plane;
+		map_idx += 1;
+	}
+
+	map_idx = 0;
+	list_for_each_entry(item, &configfs->encoders_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_encoder *config_encoder =
+			item_to_config_encoder(item);
+		struct drm_encoder *encoder =
+			vkms_encoder_init(vkmsdev, item->ci_name);
+
+		if (IS_ERR(encoder)) {
+			DRM_ERROR("Failed to init config encoder: %s",
+				  item->ci_name);
+			return PTR_ERR(encoder);
+		}
+		encoder_map[map_idx].config_encoder = config_encoder;
+		encoder_map[map_idx].encoder = encoder;
+		map_idx += 1;
+	}
+
+	list_for_each_entry(item, &configfs->connectors_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_connector *config_connector =
+			item_to_config_connector(item);
+		struct drm_connector *connector = vkms_connector_init(vkmsdev);
+
+		if (IS_ERR(connector)) {
+			DRM_ERROR("Failed to init connector from config: %s",
+				  item->ci_name);
+			return PTR_ERR(connector);
+		}
+
+		for (int j = 0; j < output->num_encoders; j++) {
+			struct encoder_map *encoder = &encoder_map[j];
+
+			if (is_object_linked(
+				    &config_connector->possible_encoders,
+				    encoder->config_encoder
+					    ->encoder_config_idx)) {
+				drm_connector_attach_encoder(connector,
+							     encoder->encoder);
+			}
+		}
+	}
+
+	list_for_each_entry(item, &configfs->crtcs_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_crtc *config_crtc =
+			item_to_config_crtc(item);
+		struct vkms_crtc *vkms_crtc;
+		struct drm_plane *primary = NULL, *cursor = NULL;
+
+		for (int j = 0; j < output->num_planes; j++) {
+			struct plane_map *plane_entry = &plane_map[j];
+			struct drm_plane *plane = &plane_entry->plane->base;
+
+			if (!is_object_linked(
+				    &plane_entry->config_plane->possible_crtcs,
+				    config_crtc->crtc_config_idx)) {
+				continue;
+			}
+
+			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+				if (primary) {
+					DRM_WARN(
+						"Too many primary planes found for crtc %s.",
+						item->ci_name);
+					return -EINVAL;
+				}
+				primary = plane;
+			} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+				if (cursor) {
+					DRM_WARN(
+						"Too many cursor planes found for crtc %s.",
+						item->ci_name);
+					return -EINVAL;
+				}
+				cursor = plane;
+			}
+		}
+
+		if (!primary) {
+			DRM_WARN("No primary plane configured for crtc %s",
+				 item->ci_name);
+			return -EINVAL;
+		}
+
+		vkms_crtc =
+			vkms_crtc_init(vkmsdev, primary, cursor, item->ci_name);
+		if (IS_ERR(vkms_crtc)) {
+			DRM_WARN("Unable to init crtc from config: %s",
+				 item->ci_name);
+			return PTR_ERR(vkms_crtc);
+		}
+
+		for (int j = 0; j < output->num_planes; j++) {
+			struct plane_map *plane_entry = &plane_map[j];
+
+			if (!plane_entry->plane)
+				break;
+
+			if (is_object_linked(
+				    &plane_entry->config_plane->possible_crtcs,
+				    config_crtc->crtc_config_idx)) {
+				plane_entry->plane->base.possible_crtcs |=
+					drm_crtc_mask(&vkms_crtc->base);
+			}
+		}
+
+		for (int j = 0; j < output->num_encoders; j++) {
+			struct encoder_map *encoder_entry = &encoder_map[j];
+
+			if (is_object_linked(&encoder_entry->config_encoder
+						      ->possible_crtcs,
+					     config_crtc->crtc_config_idx)) {
+				encoder_entry->encoder->possible_crtcs |=
+					drm_crtc_mask(&vkms_crtc->base);
+			}
+		}
+
+		if (vkmsdev->config.writeback) {
+			int ret = vkms_enable_writeback_connector(vkmsdev,
+								  vkms_crtc);
+			if (ret)
+				DRM_WARN(
+					"Failed to init writeback connector for config crtc: %s. Error code %d",
+					item->ci_name, ret);
+		}
+	}
+
+	drm_mode_config_reset(dev);
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 950e6c930273..3198bf0dca73 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/iosys-map.h>
+#include <linux/stdarg.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -215,20 +216,25 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type)
+				   enum drm_plane_type type, char *name, ...)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_output *output = &vkmsdev->output;
 	struct vkms_plane *plane;
+	va_list va;
 	int ret;
 
 	if (output->num_planes >= VKMS_MAX_PLANES)
 		return ERR_PTR(-ENOMEM);
 
 	plane = &output->planes[output->num_planes++];
+
+	va_start(va, name);
 	ret = drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_funcs,
 				       vkms_formats, ARRAY_SIZE(vkms_formats),
-				       NULL, type, NULL);
+				       NULL, type, name, va);
+	va_end(va);
+
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.42.0.rc1.204.g551eb34607-goog

