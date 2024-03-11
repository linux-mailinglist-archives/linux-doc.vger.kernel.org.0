Return-Path: <linux-doc+bounces-11923-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5AD878237
	for <lists+linux-doc@lfdr.de>; Mon, 11 Mar 2024 15:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD8E1C22971
	for <lists+linux-doc@lfdr.de>; Mon, 11 Mar 2024 14:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9711140BF9;
	Mon, 11 Mar 2024 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKy0k/5x"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6799447F41;
	Mon, 11 Mar 2024 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168616; cv=none; b=Pv4UUaRRDn4FtdRMEUr3XjST7DmxTLxrX89FgEXslVes8fZfzpDUg+xC88Ka6V3LRj82BXGLGTDOD6FgTKuKjEOZv7kxxjCW1bmq4fUq6D7199H4TIY+WK4VjV5doTtobE8RK2kZUUYgn+/+QqM+uWmYWPVMXKcv5g7/+g2biZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168616; c=relaxed/simple;
	bh=xqWVlsbHOsm95if4S8KC73qtl4XxHLkRaNosbEV3xqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MEy4nBHQ2Q+7eBi5ECUcYwg4pm/JcK3fMn2IPlRxcJWmDp92fw1ybJNyzFvbIk2PVlP7WKydIzWuNjwPuH5HQX3SO/JWuYYCFIrLHfXinmWs9d8u+k4dDn1UU1UqZkyDvijtloqS5i3D/8dg8ruQututh+Qqzf0yk4aVXWaaqOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKy0k/5x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9BFC43399;
	Mon, 11 Mar 2024 14:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710168616;
	bh=xqWVlsbHOsm95if4S8KC73qtl4XxHLkRaNosbEV3xqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CKy0k/5xLbTtyLgWYZe80Ao0vtR812EBbSRWYn4kyRFddgD2q4crsWRfI1Z3NotcD
	 GhTN7SblCS8ViOWlT0ujNk2uLtaFeJnGbg9x5a/PGn74y1jY4WKJ9ah+oPzROetgjR
	 rIh6vExZ3PJvUXGaMMp6Ct5WuOM/o/xb/u/7WZ25318dAzLbHBaCgFkiSjlRxgGp5e
	 T243rXSUCOa41YzYBGei3VVSF7nu0o4L/Nlq7X5aLOpjuxKoPmOHvQbJ/mnp9LCwAV
	 XneOuwMVxUhl/jpgfIpX71YWTb0MvpM8karwOO4/jd7i1COY0WPyB20NK7OeNYohqR
	 KgndPrkxUMsQA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Mar 2024 15:49:33 +0100
Subject: [PATCH v9 05/27] drm/tests: Add output bpc tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-kms-hdmi-connector-state-v9-5-d45890323344@kernel.org>
References: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
In-Reply-To: <20240311-kms-hdmi-connector-state-v9-0-d45890323344@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=26460; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xqWVlsbHOsm95if4S8KC73qtl4XxHLkRaNosbEV3xqs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnvpdgDlzj8O36BN+LFKfkNfww4a13aqj85nstuiHMID
 Pz2ZuevjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkiygjw1T7fw8u377u/vFl
 Qc4k9hhXoZfCh+/4T3TMfei0Z9a+hTGMDHuyu562uN1cwymyL+WnYtMSvj9d1hXSze+TVxkndPL
 zcgAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we're tracking the output bpc count in the connector state,
let's add a few tests to make sure it works as expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/Makefile                     |   1 +
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 436 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 140 +++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
 4 files changed, 683 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index d6183b3d7688..b29ddfd90596 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -2,10 +2,11 @@
 
 obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
 	drm_kunit_helpers.o
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
+	drm_atomic_state_helper_test.o \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
 	drm_damage_helper_test.o \
 	drm_dp_mst_helper_test.o \
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
new file mode 100644
index 000000000000..5d1a1dbff433
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Kunit test for drm_atomic_state_helper functions
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_atomic_uapi.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_kunit_helpers.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
+#include <drm/drm_print.h>
+#include "../drm_crtc_internal.h"
+
+#include <kunit/test.h>
+
+#include "drm_kunit_edid.h"
+
+struct drm_atomic_helper_connector_hdmi_priv {
+	struct drm_device drm;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+
+	const char *current_edid;
+	size_t current_edid_len;
+};
+
+#define connector_to_priv(c) \
+	container_of_const(c, struct drm_atomic_helper_connector_hdmi_priv, connector)
+
+static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
+{
+	struct drm_device *drm = connector->dev;
+	struct drm_display_mode *mode, *preferred;
+
+	mutex_lock(&drm->mode_config.mutex);
+	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	list_for_each_entry(mode, &connector->modes, head)
+		if (mode->type & DRM_MODE_TYPE_PREFERRED)
+			preferred = mode;
+	mutex_unlock(&drm->mode_config.mutex);
+
+	return preferred;
+}
+
+static int light_up_connector(struct kunit *test,
+			      struct drm_device *drm,
+			      struct drm_crtc *crtc,
+			      struct drm_connector *connector,
+			      struct drm_display_mode *mode,
+			      struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_atomic_state *state;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return 0;
+}
+
+static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
+			      const char *edid, size_t edid_len)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv =
+		connector_to_priv(connector);
+	struct drm_device *drm = connector->dev;
+	int ret;
+
+	priv->current_edid = edid;
+	priv->current_edid_len = edid_len;
+
+	mutex_lock(&drm->mode_config.mutex);
+	ret = connector->funcs->fill_modes(connector, 4096, 4096);
+	mutex_unlock(&drm->mode_config.mutex);
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	return 0;
+}
+
+static int dummy_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv =
+		connector_to_priv(connector);
+	const struct drm_edid *edid;
+	unsigned int num_modes;
+
+	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
+	if (!edid)
+		return -EINVAL;
+
+	drm_edid_connector_update(connector, edid);
+	num_modes = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(edid);
+
+	return num_modes;
+}
+
+static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.get_modes	= dummy_connector_get_modes,
+};
+
+static void dummy_hdmi_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+}
+
+static const struct drm_connector_funcs dummy_connector_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.fill_modes		= drm_helper_probe_single_connector_modes,
+	.reset			= dummy_hdmi_connector_reset,
+};
+
+static
+struct drm_atomic_helper_connector_hdmi_priv *
+drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+				      unsigned int max_bpc)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_encoder *enc;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct drm_atomic_helper_connector_hdmi_priv, drm,
+						 DRIVER_MODESET | DRIVER_ATOMIC);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	test->priv = priv;
+
+	drm = &priv->drm;
+	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
+							    NULL,
+							    NULL,
+							    NULL, 0,
+							    NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->plane);
+
+	priv->crtc = drm_kunit_helper_create_crtc(test, drm,
+						  priv->plane, NULL,
+						  NULL,
+						  NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->crtc);
+
+	enc = &priv->encoder;
+	ret = drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
+
+	conn = &priv->connector;
+	ret = drmm_connector_hdmi_init(drm, conn,
+				       &dummy_connector_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       NULL,
+				       max_bpc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
+	drm_connector_attach_encoder(conn, enc);
+
+	drm_mode_config_reset(drm);
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return priv;
+}
+
+/*
+ * Test that if we change the maximum bpc property to a different value,
+ * we trigger a mode change on the connector's CRTC, which will in turn
+ * disable/enable the connector.
+ */
+static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
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
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
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
+	new_conn_state->hdmi.output_bpc = 8;
+
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
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
+	KUNIT_ASSERT_NE(test,
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
+}
+
+/*
+ * Test that if we set the output bpc property to the same value, we
+ * don't trigger a mode change on the connector's CRTC and leave the
+ * connector unaffected.
+ */
+static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
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
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
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
+	KUNIT_ASSERT_EQ(test,
+			new_conn_state->hdmi.output_bpc,
+			old_conn_state->hdmi.output_bpc);
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
+			old_conn_state->hdmi.output_bpc,
+			new_conn_state->hdmi.output_bpc);
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
+}
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
+	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
+	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_check_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_check",
+	.test_cases	= drm_atomic_helper_connector_hdmi_check_tests,
+};
+
+/*
+ * Test that if the connector was initialised with a maximum bpc of 8,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 8, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_8_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 8);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
+/*
+ * Test that if the connector was initialised with a maximum bpc of 10,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 10, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_10_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 10);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 10);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
+/*
+ * Test that if the connector was initialised with a maximum bpc of 12,
+ * the value of the max_bpc and max_requested_bpc properties out of
+ * reset are also set to 12, and output_bpc is set to 0 and will be
+ * filled at atomic_check time.
+ */
+static void drm_test_check_bpc_12_value(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test, 12);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	conn_state = conn->state;
+	KUNIT_EXPECT_EQ(test, conn_state->max_bpc, 12);
+	KUNIT_EXPECT_EQ(test, conn_state->max_requested_bpc, 12);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 0);
+}
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
+	KUNIT_CASE(drm_test_check_bpc_8_value),
+	KUNIT_CASE(drm_test_check_bpc_10_value),
+	KUNIT_CASE(drm_test_check_bpc_12_value),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_reset",
+	.test_cases 	= drm_atomic_helper_connector_hdmi_reset_tests,
+};
+
+kunit_test_suites(
+	&drm_atomic_helper_connector_hdmi_check_test_suite,
+	&drm_atomic_helper_connector_hdmi_reset_test_suite,
+);
+
+MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 2661eb64a5cd..2519b91de95e 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -10,10 +10,12 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
 
 #include <kunit/test.h>
 
+#include "../drm_crtc_internal.h"
+
 struct drm_connector_init_priv {
 	struct drm_device drm;
 	struct drm_connector connector;
 	struct i2c_adapter ddc;
 };
@@ -204,10 +206,143 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 				       NULL,
 				       8);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
+/*
+ * Test that the registration of a connector with an invalid maximum bpc
+ * count fails.
+ */
+static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       9);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a null maximum bpc
+ * count fails.
+ */
+static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       0);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 8 succeeds, registers the max bpc property, but doesn't register the
+ * HDR output metadata one.
+ */
+static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 8);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 10 succeeds and registers the max bpc and HDR output metadata
+ * properties.
+ */
+static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       10);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 10);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
+/*
+ * Test that the registration of a connector with a maximum bpc count of
+ * 12 succeeds and registers the max bpc and HDR output metadata
+ * properties.
+ */
+static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	struct drm_connector *connector = &priv->connector;
+	struct drm_property *prop;
+	uint64_t val;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+				       &dummy_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       12);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	prop = connector->max_bpc_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+
+	ret = drm_object_property_get_value(&connector->base, prop, &val);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, val, 12);
+
+	prop = priv->drm.mode_config.hdr_output_metadata_property;
+	KUNIT_ASSERT_NOT_NULL(test, prop);
+	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
+}
+
 /*
  * Test that the registration of an HDMI connector with an HDMI
  * connector type succeeds.
  */
 static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
@@ -282,10 +417,15 @@ KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
 		  drm_connector_hdmi_init_type_invalid_tests,
 		  drm_connector_hdmi_init_type_desc);
 
 static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_8),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_10),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_12),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_invalid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
 			 drm_connector_hdmi_init_type_invalid_gen_params),
diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
new file mode 100644
index 000000000000..0366dd29c820
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
@@ -0,0 +1,106 @@
+#ifndef DRM_KUNIT_EDID_H_
+#define DRM_KUNIT_EDID_H_
+
+/*
+ * edid-decode (hex):
+ *
+ * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
+ * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
+ * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
+ * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
+ * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
+ * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
+ * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
+ *
+ * 02 03 1b 81 e3 05 00 20 41 10 e2 00 4a 6d 03 0c
+ * 00 12 34 00 28 20 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0
+ *
+ * ----------------
+ *
+ * Block 0, Base EDID:
+ *   EDID Structure Version & Revision: 1.3
+ *   Vendor & Product Identification:
+ *     Manufacturer: LNX
+ *     Model: 42
+ *     Made in: 2023
+ *   Basic Display Parameters & Features:
+ *     Digital display
+ *     DFP 1.x compatible TMDS
+ *     Maximum image size: 160 cm x 90 cm
+ *     Gamma: 2.20
+ *     Monochrome or grayscale display
+ *     First detailed timing is the preferred timing
+ *   Color Characteristics:
+ *     Red  : 0.0000, 0.0000
+ *     Green: 0.0000, 0.0000
+ *     Blue : 0.0000, 0.0000
+ *     White: 0.0000, 0.0000
+ *   Established Timings I & II:
+ *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *   Standard Timings: none
+ *   Detailed Timing Descriptors:
+ *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
+ *                  Hfront   88 Hsync  44 Hback  148 Hpol P
+ *                  Vfront    4 Vsync   5 Vback   36 Vpol P
+ *     Display Product Name: 'Test EDID'
+ *     Display Range Limits:
+ *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
+ *     Dummy Descriptor:
+ *   Extension blocks: 1
+ * Checksum: 0x92
+ *
+ * ----------------
+ *
+ * Block 1, CTA-861 Extension Block:
+ *   Revision: 3
+ *   Underscans IT Video Formats by default
+ *   Native detailed modes: 1
+ *   Colorimetry Data Block:
+ *     sRGB
+ *   Video Data Block:
+ *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
+ *   Video Capability Data Block:
+ *     YCbCr quantization: No Data
+ *     RGB quantization: Selectable (via AVI Q)
+ *     PT scan behavior: No Data
+ *     IT scan behavior: Always Underscanned
+ *     CE scan behavior: Always Underscanned
+ *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
+ *     Source physical address: 1.2.3.4
+ *     Maximum TMDS clock: 200 MHz
+ *     Extended HDMI video details:
+ * Checksum: 0xd0  Unused space in Extension Block: 100 bytes
+ */
+static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
+  0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
+  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
+  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
+  0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
+  0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
+  0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
+  0x46, 0x00, 0x00, 0xc4, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x02, 0x03, 0x1b, 0x81,
+  0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x6d, 0x03, 0x0c,
+  0x00, 0x12, 0x34, 0x00, 0x28, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0xd0
+};
+
+#endif // DRM_KUNIT_EDID_H_

-- 
2.43.2


