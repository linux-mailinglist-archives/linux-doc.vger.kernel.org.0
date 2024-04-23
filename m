Return-Path: <linux-doc+bounces-14870-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D608AE2EA
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 12:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6D42B211F7
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 10:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7132B136988;
	Tue, 23 Apr 2024 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMs0wkaI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4486864CEC;
	Tue, 23 Apr 2024 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713869197; cv=none; b=bbbercuOHGcUCPISa1YZS+fNlJdUEqLBZlOEEqaU+0UfY+V3pVt3r6mFkTno+CdRTEJ5Dzc6RBgy2erzM36dpObJwNDKSvBwtM1+y1hgNjiYofsM8P91Yn76OuYkYS0eQJnTeua6lihotwu2Ul3MkqdE+L2V6vPYt1sISqng9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713869197; c=relaxed/simple;
	bh=uylYat3CNYwIxJeWmXQsQLoFR9nCRusRrMlXwlsGnYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLIyzxd7Ovv/pHGI2wJzXG8GdLERhI9LZ2PV8yt6oRjiWtV4CzfHJ4asm7IurJBtgcZub0ZORbnsOlcyzaQOKFSWRBPzZisFFknoVn3iL+nfL96pD3GXQlWEWjevnud7MEMCMBhlNkT939TcfonyurMbaPmufgzKdin9ZH8Qbxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMs0wkaI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716A7C32783;
	Tue, 23 Apr 2024 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713869196;
	bh=uylYat3CNYwIxJeWmXQsQLoFR9nCRusRrMlXwlsGnYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QMs0wkaIh5+0tYibW2YNxAEcdjEFvyKGki6at/aN/C9I7EUFZb3JvBYQuu+A5Dmy3
	 E3Y5/H9GiSDKaZLAQcPE9+pTBQg2IbrVFqOT6qetlIyVgbToSRzp/ba8CCByykGu8E
	 yAO8OTtLqY3lCO2YkW6warqpNUsf9HCU9udVC+aFNBWPJAUGHEQHoNHH4dkt2D/LpH
	 g1pwl/9ZFYLCvyzu7rJZO8jGf8oaCnJJqFY0SA38Oo1h5i7ZzBUNCJZTW/Dab1vjqe
	 iKYkZj9yVpLO/G5vk4Aqok8x97NZYCALYR+BWb0bxNRyRp0XxhGKvSkHdnfajp7Hjf
	 eLblocPM+cwuQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 23 Apr 2024 12:45:47 +0200
Subject: [PATCH v12 18/28] drm/tests: Add tests for Broadcast RGB property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-kms-hdmi-connector-state-v12-18-3338e4c0b189@kernel.org>
References: <20240423-kms-hdmi-connector-state-v12-0-3338e4c0b189@kernel.org>
In-Reply-To: <20240423-kms-hdmi-connector-state-v12-0-3338e4c0b189@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13780; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uylYat3CNYwIxJeWmXQsQLoFR9nCRusRrMlXwlsGnYE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnqE4Nc083lK8UyfvBbxa/7Zu14/oGIpu5s/VM/uKJad
 D1Uym52TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgImEGzLW5/y21OZXm2OZW115
 pfr88V2cn/e9WuD0yCB50ccJ3PMX5Lf4x9zQb6j+Gx0ww6Dx6gkuxobZfMv28capHs6L9/2vcSm
 vJq9s8QM9oTv70zuzj/84tK19xv+04y82Lgvku7Uz/sncoBMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

This had a bunch of kunit tests to make sure our code to handle the
Broadcast RGB property behaves properly.

This requires bringing a bit of infrastructure to create mock HDMI
connectors, with custom EDIDs.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c         | 116 ++++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 151 +++++++++++++++++++++
 2 files changed, 267 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 34d96f7fbb25..672b74bc9e23 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -564,10 +564,67 @@ static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
 static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
 	.name = "drm_get_tv_mode_from_name",
 	.test_cases = drm_get_tv_mode_from_name_tests,
 };
 
+struct drm_hdmi_connector_get_broadcast_rgb_name_test {
+	unsigned int kind;
+	const char *expected_name;
+};
+
+#define BROADCAST_RGB_TEST(_kind, _name)	\
+	{					\
+		.kind = _kind,			\
+		.expected_name = _name,		\
+	}
+
+static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name(struct kunit *test)
+{
+	const struct drm_hdmi_connector_get_broadcast_rgb_name_test *params =
+		test->param_value;
+
+	KUNIT_EXPECT_STREQ(test,
+			   drm_hdmi_connector_get_broadcast_rgb_name(params->kind),
+			   params->expected_name);
+}
+
+static const
+struct drm_hdmi_connector_get_broadcast_rgb_name_test
+drm_hdmi_connector_get_broadcast_rgb_name_valid_tests[] = {
+	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic"),
+	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_FULL, "Full"),
+	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235"),
+};
+
+static void
+drm_hdmi_connector_get_broadcast_rgb_name_valid_desc(const struct drm_hdmi_connector_get_broadcast_rgb_name_test *t,
+						     char *desc)
+{
+	sprintf(desc, "%s", t->expected_name);
+}
+
+KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_broadcast_rgb_name_valid,
+		  drm_hdmi_connector_get_broadcast_rgb_name_valid_tests,
+		  drm_hdmi_connector_get_broadcast_rgb_name_valid_desc);
+
+static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid(struct kunit *test)
+{
+	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_broadcast_rgb_name(3));
+};
+
+static struct kunit_case drm_hdmi_connector_get_broadcast_rgb_name_tests[] = {
+	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_broadcast_rgb_name,
+			 drm_hdmi_connector_get_broadcast_rgb_name_valid_gen_params),
+	KUNIT_CASE(drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid),
+	{ }
+};
+
+static struct kunit_suite drm_hdmi_connector_get_broadcast_rgb_name_test_suite = {
+	.name = "drm_hdmi_connector_get_broadcast_rgb_name",
+	.test_cases = drm_hdmi_connector_get_broadcast_rgb_name_tests,
+};
+
 struct drm_hdmi_connector_get_output_format_name_test {
 	unsigned int kind;
 	const char *expected_name;
 };
 
@@ -622,10 +679,67 @@ static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
 static struct kunit_suite drm_hdmi_connector_get_output_format_name_test_suite = {
 	.name = "drm_hdmi_connector_get_output_format_name",
 	.test_cases = drm_hdmi_connector_get_output_format_name_tests,
 };
 
+static void drm_test_drm_connector_attach_broadcast_rgb_property(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	int ret;
+
+	ret = drmm_connector_init(&priv->drm, connector,
+				  &dummy_funcs,
+				  DRM_MODE_CONNECTOR_HDMIA,
+				  &priv->ddc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = drm_connector_attach_broadcast_rgb_property(connector);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	prop = connector->broadcast_rgb_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_connector_attach_broadcast_rgb_property(connector);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	prop = connector->broadcast_rgb_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+static struct kunit_case drm_connector_attach_broadcast_rgb_property_tests[] = {
+	KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property),
+	KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector),
+	{ }
+};
+
+static struct kunit_suite drm_connector_attach_broadcast_rgb_property_test_suite = {
+	.name = "drm_connector_attach_broadcast_rgb_property",
+	.init = drm_test_connector_init,
+	.test_cases = drm_connector_attach_broadcast_rgb_property_tests,
+};
+
 /*
  * Test that for a given mode, with 8bpc and an RGB output the TMDS
  * character rate is equal to the mode pixel clock.
  */
 static void drm_test_drm_hdmi_compute_mode_clock_rgb(struct kunit *test)
@@ -916,12 +1030,14 @@ static struct kunit_suite drm_hdmi_compute_mode_clock_test_suite = {
 };
 
 kunit_test_suites(
 	&drmm_connector_hdmi_init_test_suite,
 	&drmm_connector_init_test_suite,
+	&drm_connector_attach_broadcast_rgb_property_test_suite,
 	&drm_get_tv_mode_from_name_test_suite,
 	&drm_hdmi_compute_mode_clock_test_suite,
+	&drm_hdmi_connector_get_broadcast_rgb_name_test_suite,
 	&drm_hdmi_connector_get_output_format_name_test_suite
 );
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 968204781928..ff9a882201eb 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -225,10 +225,138 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	return priv;
 }
 
+/*
+ * Test that if we change the RGB quantization property to a different
+ * value, we trigger a mode change on the connector's CRTC, which will
+ * in turn disable/enable the connector.
+ */
+static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.broadcast_rgb,
+			new_conn_state->hdmi.broadcast_rgb);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+	KUNIT_EXPECT_EQ(test, new_conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_FULL);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
+}
+
+/*
+ * Test that if we set the RGB quantization property to the same value,
+ * we don't trigger a mode change on the connector's CRTC and leave the
+ * connector unaffected.
+ */
+static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state->hdmi.broadcast_rgb = old_conn_state->hdmi.broadcast_rgb;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	KUNIT_EXPECT_EQ(test,
+			old_conn_state->hdmi.broadcast_rgb,
+			new_conn_state->hdmi.broadcast_rgb);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
+}
+
 /*
  * Test that if we change the maximum bpc property to a different value,
  * we trigger a mode change on the connector's CRTC, which will in turn
  * disable/enable the connector.
  */
@@ -1064,10 +1192,12 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 8);
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
 }
 
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
+	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
+	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
 	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback),
 	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
 	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
@@ -1095,10 +1225,30 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 static struct kunit_suite drm_atomic_helper_connector_hdmi_check_test_suite = {
 	.name		= "drm_atomic_helper_connector_hdmi_check",
 	.test_cases	= drm_atomic_helper_connector_hdmi_check_tests,
 };
 
+/*
+ * Test that the value of the Broadcast RGB property out of reset is set
+ * to auto.
+ */
+static void drm_test_check_broadcast_rgb_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_AUTO);
+}
+
 /*
  * Test that if the connector was initialised with a maximum bpc of 8,
  * the value of the max_bpc and max_requested_bpc properties out of
  * reset are also set to 8, and output_bpc is set to 0 and will be
  * filled at atomic_check time.
@@ -1212,10 +1362,11 @@ static void drm_test_check_tmds_char_value(struct kunit *test)
 	conn_state = conn->state;
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, 0);
 }
 
 static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
+	KUNIT_CASE(drm_test_check_broadcast_rgb_value),
 	KUNIT_CASE(drm_test_check_bpc_8_value),
 	KUNIT_CASE(drm_test_check_bpc_10_value),
 	KUNIT_CASE(drm_test_check_bpc_12_value),
 	KUNIT_CASE(drm_test_check_format_value),
 	KUNIT_CASE(drm_test_check_tmds_char_value),

-- 
2.44.0


