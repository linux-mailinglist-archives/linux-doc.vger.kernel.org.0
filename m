Return-Path: <linux-doc+bounces-17039-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 371F38D0293
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2024 16:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A13A91F2518E
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2024 14:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955DF16C87F;
	Mon, 27 May 2024 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUKeWsR1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691DF16C87A;
	Mon, 27 May 2024 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818330; cv=none; b=ctccc5/+GLqdmyRydegSuKGvpcMIBifdu7zGvtqjJqmvfSlqVZFx0rBrAXwABYcu383aekfGo3/L2S5GLsuNwHsxOKMKMxqjtdK97uisJL9J6DJLSHRVBsc6vBDyGRThJXbM/W2sehavKrKHH/rwO6xS+3nYb/nnE/iUj7W/tbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818330; c=relaxed/simple;
	bh=oKtV1kiYRT/ia7Nyt+naQcbhLNlXTVdcSqSYEvDXcJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5GXQc5jafVpFvl6o+I4rfo3XLfOX9GdVWqgtPa0vW9G8XFkFEDtkq1MqU7mpGiBj4o7P2Am8LzjmTdJzMS0P4yqVXsnjf6QLSRNSFdwDr9GdCAvxMDtCgK893OFlrjSbZFme1nNGYKGt/YstgDNzpw0W0HcIIB9vvLsAICeeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUKeWsR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31D3C2BBFC;
	Mon, 27 May 2024 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818330;
	bh=oKtV1kiYRT/ia7Nyt+naQcbhLNlXTVdcSqSYEvDXcJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KUKeWsR1q8NCm3Dt17OsAtFNBy6UBWW4omabvA9c1lorji1MV7TW049ial4AOl5BI
	 +eYB0Ah62oF0BQ98yx+xe2ikxSPdrFWTn6KpS9y6Tg8Nw9WTwqHh4Jdj6oBPUJV+Ef
	 YvViYmoBUIum9r1VQsyIqndDUxX491+7pPEjjHwL+yUdq+jgrwrbBzuT43eIb4Eu1Y
	 +hHbZTPVLYLhj0RBpL3N4ln5vYVtEJQzvKPPBImHa5QXEhF1QmUuZUpIYRKqrSlKeP
	 DLEEX/pe215G8k21C7RC3zP2DxtrPzkjycgY9o/L/Al/uSioa2qc0TLZG9/W9vShad
	 rwp84DIpMpCbA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:58:04 +0200
Subject: [PATCH v15 15/29] drm/connector: hdmi: Compute bpc and format
 automatically
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-15-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
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
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12603; i=mripard@kernel.org;
 h=from:subject:message-id; bh=oKtV1kiYRT/ia7Nyt+naQcbhLNlXTVdcSqSYEvDXcJA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhE9Pe936s45n4r0z3nryRVBuL1LqNe+LrhG7uXRvQX
 12z4pdyx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIUDBjw8eLQrXPJr1b8e2Z
 jcfcPRatQXsFEhcemK5klC6pNFdh7jbhOZkGu7gdPq/u/Dtl52qdZsb67HXTrn1V32Hn5hZ1Nzr
 hn5KbzMN2r/M/kgRCFE+cuvNikZ74lPiV0poaXNtEdrzWePUCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have all the infrastructure needed, we can add some code
that will, for a given connector state and mode, compute the best output
format and bpc.

The algorithm is equivalent to the one already found in i915 and vc4.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 217 ++++++++++++++++++++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
 2 files changed, 230 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 063421835dba..1623b96cd97c 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: MIT
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -46,10 +48,130 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
 		return NULL;
 
 	return &crtc_state->mode;
 }
 
+static bool
+sink_supports_format_bpc(const struct drm_connector *connector,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode,
+			 unsigned int format, unsigned int bpc)
+{
+	struct drm_device *dev = connector->dev;
+	u8 vic = drm_match_cea_mode(mode);
+
+	/*
+	 * CTA-861-F, section 5.4 - Color Coding & Quantization states
+	 * that the bpc must be 8, 10, 12 or 16 except for the default
+	 * 640x480 VIC1 where the value must be 8.
+	 *
+	 * The definition of default here is ambiguous but the spec
+	 * refers to VIC1 being the default timing in several occasions
+	 * so our understanding is that for the default timing (ie,
+	 * VIC1), the bpc must be 8.
+	 */
+	if (vic == 1 && bpc != 8) {
+		drm_dbg_kms(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
+		return false;
+	}
+
+	if (!info->is_hdmi &&
+	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
+		drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc\n");
+		return false;
+	}
+
+	if (!(connector->hdmi.supported_formats & BIT(format))) {
+		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
+			    drm_hdmi_connector_get_output_format_name(format));
+		return false;
+	}
+
+	switch (format) {
+	case HDMI_COLORSPACE_RGB:
+		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
+
+		/*
+		 * In some cases, like when the EDID readout fails, or
+		 * is not an HDMI compliant EDID for some reason, the
+		 * color_formats field will be blank and not report any
+		 * format supported. In such a case, assume that RGB is
+		 * supported so we can keep things going and light up
+		 * the display.
+		 */
+		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+			drm_warn(dev, "HDMI Sink doesn't support RGB, something's wrong.\n");
+
+		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg_kms(dev, "RGB format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV420:
+		/* TODO: YUV420 is unsupported at the moment. */
+		drm_dbg_kms(dev, "YUV420 format isn't supported yet.\n");
+		return false;
+
+	case HDMI_COLORSPACE_YUV422:
+		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+			drm_dbg_kms(dev, "Sink doesn't support YUV422.\n");
+			return false;
+		}
+
+		if (bpc > 12) {
+			drm_dbg_kms(dev, "YUV422 only supports 12 bpc or lower.\n");
+			return false;
+		}
+
+		/*
+		 * HDMI Spec 1.3 - Section 6.5 Pixel Encodings and Color Depth
+		 * states that Deep Color is not relevant for YUV422 so we
+		 * don't need to check the Deep Color bits in the EDIDs here.
+		 */
+
+		drm_dbg_kms(dev, "YUV422 format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV444:
+		drm_dbg_kms(dev, "YUV444 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+			drm_dbg_kms(dev, "Sink doesn't support YUV444.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg_kms(dev, "YUV444 format supported in that configuration.\n");
+
+		return true;
+	}
+
+	drm_dbg_kms(dev, "Unsupported pixel format.\n");
+	return false;
+}
+
 static enum drm_mode_status
 hdmi_clock_valid(const struct drm_connector *connector,
 		 const struct drm_display_mode *mode,
 		 unsigned long long clock)
 {
@@ -90,10 +212,101 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	conn_state->hdmi.tmds_char_rate = clock;
 
 	return 0;
 }
 
+static bool
+hdmi_try_format_bpc(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	drm_dbg_kms(dev, "Trying %s output format\n",
+		    drm_hdmi_connector_get_output_format_name(fmt));
+
+	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
+		drm_dbg_kms(dev, "%s output format not supported with %u bpc\n",
+			    drm_hdmi_connector_get_output_format_name(fmt),
+			    bpc);
+		return false;
+	}
+
+	ret = hdmi_compute_clock(connector, conn_state, mode, bpc, fmt);
+	if (ret) {
+		drm_dbg_kms(dev, "Couldn't compute clock for %s output format and %u bpc\n",
+			    drm_hdmi_connector_get_output_format_name(fmt),
+			    bpc);
+		return false;
+	}
+
+	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
+		    drm_hdmi_connector_get_output_format_name(fmt),
+		    bpc, conn_state->hdmi.tmds_char_rate);
+
+	return true;
+}
+
+static int
+hdmi_compute_format(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc)
+{
+	struct drm_device *dev = connector->dev;
+
+	/*
+	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
+	 * devices, for modes that only support YCbCr420.
+	 */
+	if (hdmi_try_format_bpc(connector, conn_state, mode, bpc, HDMI_COLORSPACE_RGB)) {
+		conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
+		return 0;
+	}
+
+	drm_dbg_kms(dev, "Failed. No Format Supported for that bpc count.\n");
+
+	return -EINVAL;
+}
+
+static int
+hdmi_compute_config(const struct drm_connector *connector,
+		    struct drm_connector_state *conn_state,
+		    const struct drm_display_mode *mode)
+{
+	struct drm_device *dev = connector->dev;
+	unsigned int max_bpc = clamp_t(unsigned int,
+				       conn_state->max_bpc,
+				       8, connector->max_bpc);
+	unsigned int bpc;
+	int ret;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		drm_dbg_kms(dev, "Trying with a %d bpc output\n", bpc);
+
+		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
+		if (ret)
+			continue;
+
+		conn_state->hdmi.output_bpc = bpc;
+
+		drm_dbg_kms(dev,
+			    "Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
+			    mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+			    conn_state->hdmi.output_bpc,
+			    drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
+			    conn_state->hdmi.tmds_char_rate);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
  * @state: the DRM State object
  *
@@ -113,13 +326,11 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		drm_atomic_get_new_connector_state(state, connector);
 	const struct drm_display_mode *mode =
 		connector_state_get_mode(new_conn_state);
 	int ret;
 
-	ret = hdmi_compute_clock(connector, new_conn_state, mode,
-				 new_conn_state->hdmi.output_bpc,
-				 new_conn_state->hdmi.output_format);
+	ret = hdmi_compute_config(connector, new_conn_state, mode);
 	if (ret)
 		return ret;
 
 	if (old_conn_state->hdmi.output_bpc != new_conn_state->hdmi.output_bpc ||
 	    old_conn_state->hdmi.output_format != new_conn_state->hdmi.output_format) {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index ead998a691e7..a49a544d7b49 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -70,13 +70,10 @@ static int light_up_connector(struct kunit *test,
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	conn_state = drm_atomic_get_connector_state(state, connector);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
-	conn_state->hdmi.output_bpc = connector->max_bpc;
-	conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
-
 	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
@@ -251,14 +248,19 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	priv = drm_atomic_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
@@ -272,15 +274,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
 
-	new_conn_state->hdmi.output_bpc = 8;
+	new_conn_state->max_requested_bpc = 8;
 
 	KUNIT_ASSERT_NE(test,
-			old_conn_state->hdmi.output_bpc,
-			new_conn_state->hdmi.output_bpc);
+			old_conn_state->max_requested_bpc,
+			new_conn_state->max_requested_bpc);
 
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
@@ -320,14 +322,19 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	priv = drm_atomic_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
 	drm = &priv->drm;
 	crtc = priv->crtc;
@@ -670,11 +677,11 @@ static void drm_test_check_format_value(struct kunit *test)
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
 	conn_state = conn->state;
-	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, 0);
 }
 
 /*
  * Test that the value of the output format property out of reset is set
  * to 0, and will be computed at atomic_check time.

-- 
2.45.0


