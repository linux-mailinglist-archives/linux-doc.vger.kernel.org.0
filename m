Return-Path: <linux-doc+bounces-10448-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8B86011E
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 19:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8971C248D0
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 18:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A396E608;
	Thu, 22 Feb 2024 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVygD9Mn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE86E5F0;
	Thu, 22 Feb 2024 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625716; cv=none; b=P0YUgC44Q0p1T5z5RQS1KPktWS23EeyN/ewSsomhMP3zMKZyuN6OfLRylOsZShn0j6tci9/sl27F/QJtflwk6+0GYKuEotMXoyKK2kD+/qt/DfQzzCe3ADVrrwhQ7QQfbqZHKyZDlvNRRAIaoK+q3M2KzfgFLFMbVqQmC2LiEL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625716; c=relaxed/simple;
	bh=Nt2VIdXgQ6yHIy600gnsz7R43r+JMRxEty0mQ9gtv1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIHnKrk8UAG680mlEN/YCipUugVeLQItcssdr9RVThf59YK7nKwD7HOSO/m62jaXLarlB3VTAKX3chPcrkTrjuxFk0it3AQ7ijJGR0TDlBDI4sweo48okenqfjztBgUzXdHILpAhtGJL+958XNshfRSbheBoWAiwv/dGcWxgFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVygD9Mn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DB8C433C7;
	Thu, 22 Feb 2024 18:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708625716;
	bh=Nt2VIdXgQ6yHIy600gnsz7R43r+JMRxEty0mQ9gtv1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JVygD9Mn83OnObyjPklDK+LjVfaA4t8ZIrGgtKOU0MiURSlyfZjoEgQubTLZVdnCM
	 +vsN7t9ethnWJRXuxjansKCXc/pYNZTpF+uLBxm406KCbv2UDE9HSabBCMCQz1iASv
	 A9H+M4tHzDgDVNOFqNIoXKTvwTFSj9fcYH7jpxXzefW6my6lkCyEPNv+pFHb2gcY1Y
	 7pSClwEX/5eRYwRDPHyhBHuWBbp2nWfhuemy9MiJ5dT7dSEs2yDFzwf2SwjlyRROdK
	 YMpqu2PtrSZXNMYGX/51vSce3fNoXhCz/f8h3nhyMNUDcEZaiAsmuLz6cj62iQrUDA
	 O0O9uw4txQNUg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Feb 2024 19:14:03 +0100
Subject: [PATCH v7 17/36] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-kms-hdmi-connector-state-v7-17-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9943; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Nt2VIdXgQ6yHIy600gnsz7R43r+JMRxEty0mQ9gtv1I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnX+z7/CI6QYTPs6duXIqL7b/IeiTaGL0ezp9QwZy5SK
 13v7p/cUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgInUhjIyrL1cNmlZ3hJ3NpFj
 WhZ3GLa7+9Rv7j3svfv4u2fnonWlFBkZmq8lPT60munZZFNpRY3GlQ0P9t17H154ceYRv7Znt4/
 u5AYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Most of the HDMI controllers have an upper TMDS character rate limit
they can't exceed. On "embedded"-grade display controllers, it will
typically be lower than what high-grade monitors can provide these days,
so drivers will filter the TMDS character rate based on the controller
capabilities.

To make that easier to handle for drivers, let's provide an optional
hook to be implemented by drivers so they can tell the HDMI controller
helpers if a given TMDS character rate is reachable for them or not.

This will then be useful to figure out the best format and bpc count for
a given mode.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c          |  9 +++++++
 drivers/gpu/drm/drm_connector.c                    |  4 +++
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   |  4 +++
 drivers/gpu/drm/tests/drm_connector_test.c         | 14 ++++++++++
 include/drm/drm_connector.h                        | 30 ++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 63a96c691460..448b4a73d1c8 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -667,11 +667,20 @@ hdmi_clock_valid(const struct drm_connector *connector,
 		 const struct drm_display_mode *mode,
 		 unsigned long long clock)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	const struct drm_display_info *info = &connector->display_info;
 
 	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
 		return MODE_CLOCK_HIGH;
 
+	if (funcs && funcs->tmds_char_rate_valid) {
+		enum drm_mode_status status;
+
+		status = funcs->tmds_char_rate_valid(connector, mode, clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	return MODE_OK;
 }
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8cc1332f11c2..591d2d500f61 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -457,6 +457,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
  * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
  * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
@@ -476,6 +477,7 @@ EXPORT_SYMBOL(drmm_connector_init);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
@@ -512,6 +514,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	connector->hdmi.funcs = hdmi_funcs;
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index dfed45b250a5..989661ad3aee 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -110,6 +110,9 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return 0;
 }
 
+static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -192,6 +195,7 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 	conn = &priv->connector;
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       &dummy_connector_funcs,
+				       &dummy_connector_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       formats,
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 882b9269148e..732c59a1d4d5 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -22,6 +22,9 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+};
+
 static const struct drm_connector_funcs dummy_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
@@ -187,6 +190,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -205,6 +209,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -223,6 +228,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -241,6 +247,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -263,6 +270,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -297,6 +305,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -331,6 +340,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -361,6 +371,7 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       0,
@@ -379,6 +390,7 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_YUV422),
@@ -398,6 +410,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
@@ -431,6 +444,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
 				       connector_type,
 				       &priv->ddc,
 				       BIT(HDMI_COLORSPACE_RGB),
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3917ea93986..8cda902934cd 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1058,6 +1058,30 @@ struct drm_connector_state {
 	} hdmi;
 };
 
+/**
+ * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_hdmi_funcs {
+	/**
+	 * @tmds_char_rate_valid:
+	 *
+	 * This callback is invoked at atomic_check time to figure out
+	 * whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * The @tmds_char_rate_valid callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*tmds_char_rate_valid)(const struct drm_connector *connector,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+};
+
 /**
  * struct drm_connector_funcs - control connectors on a given device
  *
@@ -1926,6 +1950,11 @@ struct drm_connector {
 		 * supported by the controller.
 		 */
 		unsigned long supported_formats;
+
+		/**
+		 * @funcs: HDMI connector Control Functions
+		 */
+		const struct drm_connector_hdmi_funcs *funcs;
 	} hdmi;
 };
 
@@ -1948,6 +1977,7 @@ int drmm_connector_init(struct drm_device *dev,
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,

-- 
2.43.2


