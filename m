Return-Path: <linux-doc+bounces-8965-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B1F85149A
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 14:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A172E1F239B5
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 13:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15183D38D;
	Mon, 12 Feb 2024 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6FJUdNp"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248C3A1CB;
	Mon, 12 Feb 2024 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743634; cv=none; b=sGRoRErLzT22/eJ2pRB34N/wI3xP3Wmn9vDBZ7OR8rIaaBWgA79Rz17ei06wj6LQ0Ihs5rBqEDHQ4PM/2ZKYWKk/YUXX+6uQMGWz51zAGZXHYuvuDB/j+6NyK1l6/2dUqyp5crlN6T/cRLKL8fCe/lM07VUWM5OLZAVzqTQj6h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743634; c=relaxed/simple;
	bh=YqHSxVxIl0Xk2E1KAi6ngsUqlW2QyXHW3UepbjKNKjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMqhYmQOrjwXOUGoagqqxXbmgjKbXZfKrqPimujAz9P12dnj+iKCgtYcxvQfj/IX+aF4hTg6Ek4MerrsHPfXn5lCn3LkjRT2vSVVRIyoBaxtjkpvjr1VSdRk693f7XEZS/icA0G5ndAjzgC6OLGR/rF0Q8Kkai3aqMhk0rYC5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6FJUdNp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A0DC43390;
	Mon, 12 Feb 2024 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707743633;
	bh=YqHSxVxIl0Xk2E1KAi6ngsUqlW2QyXHW3UepbjKNKjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T6FJUdNpIQxt28Y5MzOuJCn/ddh0OnYGQ5ef6Mf0LXCUmlLaeHusxJ9IJCszMfuUq
	 dXWFtFZXjCmNeNchQxMLCgtu3K8WIq+CUbrNZhxtMr50Orw1YUxDJ5zJdu2EH6xIgP
	 EE8UCA9IJlgHYUSdSu/PgyjzJvja1lZgvuTBzDEdGZ6yCXVVQgrpkCoCT/TePawxnK
	 5fk9YyYyV4mQR/Bc+rSYwY+mGIHPLlVjfxXj+GxjIttaOxpTaI05I2ECdh5lSQldwV
	 vo8hV2oK/KeMhD8PvDH8nhzXCyaUG95gfafI+3jKWX4mRDacZwXL+wcD4mDM807BM7
	 iD8iVWvYk0JLg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:12:52 +0100
Subject: [PATCH v6 09/36] drm/connector: hdmi: Add Broadcast RGB property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-9-f4bcdc979e6f@kernel.org>
References: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
In-Reply-To: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12127; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YqHSxVxIl0Xk2E1KAi6ngsUqlW2QyXHW3UepbjKNKjg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJJO5dlf0ZGTGnpkneND649d1K0L9DW5Y1Ubkz3+tX
 rggYvrfjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExE8gLDX0H9X8tVm/bH1Trq
 akxcuc/ZQ5lh9fXKq1P/3z7TldrwpJCRYecqTXEVFbkvVicY9zAIHJCTP7LT9sPPXwV/uY8F7Hp
 hygIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The i915 driver has a property to force the RGB range of an HDMI output.
The vc4 driver then implemented the same property with the same
semantics. KWin has support for it, and a PR for mutter is also there to
support it.

Both drivers implementing the same property with the same semantics,
plus the userspace having support for it, is proof enough that it's
pretty much a de-facto standard now and we can provide helpers for it.

Let's plumb it into the newly created HDMI connector.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/kms-properties.csv      |  1 -
 drivers/gpu/drm/drm_atomic.c              |  5 ++
 drivers/gpu/drm/drm_atomic_state_helper.c | 17 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_connector.c           | 85 +++++++++++++++++++++++++++++++
 include/drm/drm_connector.h               | 36 +++++++++++++
 6 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
index 0f9590834829..caef14c532d4 100644
--- a/Documentation/gpu/kms-properties.csv
+++ b/Documentation/gpu/kms-properties.csv
@@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
 ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
 ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
 ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
-i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."
 ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
 ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
 ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a91737adf8e7..93831850ffcd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1143,6 +1143,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
+		drm_printf(p, "\tbroadcast_rgb=%s\n",
+			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
+
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
 			drm_printf(p, "\tfb=%d\n", state->writeback_job->fb->base.id);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7ad1dffe66d9..d93bc7f5faee 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -584,6 +584,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_state)
 {
+	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
 
@@ -651,6 +652,22 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
 int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 					   struct drm_atomic_state *state)
 {
+	struct drm_connector_state *old_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_state =
+		drm_atomic_get_new_connector_state(state, connector);
+
+	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
+		struct drm_crtc *crtc = new_state->crtc;
+		struct drm_crtc_state *crtc_state;
+
+		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		crtc_state->mode_changed = true;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 29d4940188d4..2b415b4ed506 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		state->max_requested_bpc = val;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		state->privacy_screen_sw_state = val;
+	} else if (property == connector->broadcast_rgb_property) {
+		state->hdmi.broadcast_rgb = val;
 	} else if (connector->funcs->atomic_set_property) {
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
@@ -859,6 +861,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->max_requested_bpc;
 	} else if (property == connector->privacy_screen_sw_state_property) {
 		*val = state->privacy_screen_sw_state;
+	} else if (property == connector->broadcast_rgb_property) {
+		*val = state->hdmi.broadcast_rgb;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d9961cce8245..53abf213a045 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1183,6 +1183,29 @@ static const u32 dp_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
 	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
 
+static const struct drm_prop_enum_list broadcast_rgb_names[] = {
+	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
+	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
+	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
+};
+
+/*
+ * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI connector RGB broadcast selection
+ * @broadcast_rgb: Broadcast RGB selection to compute name of
+ *
+ * Returns: the name of the Broadcast RGB selection, or NULL if the type
+ * is not valid.
+ */
+const char *
+drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb)
+{
+	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return NULL;
+
+	return broadcast_rgb_names[broadcast_rgb].name;
+}
+EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
+
 /**
  * DOC: standard connector properties
  *
@@ -1655,6 +1678,35 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
 /**
  * DOC: HDMI connector properties
  *
+ * Broadcast RGB (HDMI specific)
+ *      Indicates the Quantization Range (Full vs Limited) used. The color
+ *      processing pipeline will be adjusted to match the value of the
+ *      property, and the Infoframes will be generated and sent accordingly.
+ *
+ *      The CRTC attached to the connector must be configured by user-space to
+ *      always produce full-range pixels.
+ *
+ *      The value of this property can be one of the following:
+ *
+ *      Automatic:
+ *              The quantization range is selected automatically based on the
+ *              mode according to the HDMI specifications (HDMI 1.4b - Section
+ *              6.6 - Video Quantization Ranges).
+ *
+ *      Full:
+ *              Full quantization range is forced.
+ *
+ *      Limited 16:235:
+ *              Limited quantization range is forced. Unlike the name suggests,
+ *              this works for any number of bits-per-component.
+ *
+ *      Property values other than Automatic can result in colors being off (if
+ *      limited is selected but the display expects full), or a black screen
+ *      (if full is selected but the display expects limited).
+ *
+ *      Drivers can set up this property by calling
+ *      drm_connector_attach_broadcast_rgb_property().
+ *
  * content type (HDMI specific):
  *	Indicates content type setting to be used in HDMI infoframes to indicate
  *	content type for the external device, so that it adjusts its display
@@ -2517,6 +2569,39 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 }
 EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
 
+/**
+ * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" property
+ * @connector: connector to attach the property on.
+ *
+ * This is used to add support for forcing the RGB range on a connector
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	prop = connector->broadcast_rgb_property;
+	if (!prop) {
+		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
+						"Broadcast RGB",
+						broadcast_rgb_names,
+						ARRAY_SIZE(broadcast_rgb_names));
+		if (!prop)
+			return -EINVAL;
+
+		connector->broadcast_rgb_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop,
+				   DRM_HDMI_BROADCAST_RGB_AUTO);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_broadcast_rgb_property);
+
 /**
  * drm_connector_attach_colorspace_property - attach "Colorspace" property
  * @connector: connector to attach the property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 000a2a156619..3867a4c01b78 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -368,6 +368,30 @@ enum drm_panel_orientation {
 	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+/**
+ * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for an HDMI @drm_connector
+ */
+enum drm_hdmi_broadcast_rgb {
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
+	 * automatically based on the mode.
+	 */
+	DRM_HDMI_BROADCAST_RGB_AUTO,
+
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
+	 */
+	DRM_HDMI_BROADCAST_RGB_FULL,
+
+	/**
+	 * @DRM_HDMI_BROADCAST_RGB_LIMITED: Limited range RGB is forced.
+	 */
+	DRM_HDMI_BROADCAST_RGB_LIMITED,
+};
+
+const char *
+drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
+
 /**
  * struct drm_monitor_range_info - Panel's Monitor range in EDID for
  * &drm_display_info
@@ -1037,6 +1061,11 @@ struct drm_connector_state {
 	 * @drm_atomic_helper_connector_hdmi_check().
 	 */
 	struct {
+		/**
+		 * @broadcast_rgb: Connector property to pass the
+		 * Broadcast RGB selection value.
+		 */
+		enum drm_hdmi_broadcast_rgb broadcast_rgb;
 	} hdmi;
 };
 
@@ -1706,6 +1735,12 @@ struct drm_connector {
 	 */
 	struct drm_property *privacy_screen_hw_state_property;
 
+	/**
+	 * @broadcast_rgb_property: Connector property to set the
+	 * Broadcast RGB selection to output with.
+	 */
+	struct drm_property *broadcast_rgb_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 << 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
@@ -2026,6 +2061,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask);
 int drm_connector_attach_vrr_capable_property(
 		struct drm_connector *connector);
+int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
 int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,

-- 
2.43.0


