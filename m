Return-Path: <linux-doc+bounces-15897-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 098598BE395
	for <lists+linux-doc@lfdr.de>; Tue,  7 May 2024 15:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D5EE1C23D01
	for <lists+linux-doc@lfdr.de>; Tue,  7 May 2024 13:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D6415FA8F;
	Tue,  7 May 2024 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7ilwVMJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6FA15FA88;
	Tue,  7 May 2024 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087892; cv=none; b=QLSXmuFaanQY0WaGepc9tWvocm98T1a1+oaXB97HezwqqmCHJw48v/pk/8pCD50Jq3PvirMBPxUiax3Qz/nU+mczXVpaMg8V5VbqddA37MVX498YZuoocl+4eztZT2LrIz7j5+3cxqS+0U1o8xcBpOp8PGNPan20/PRF0ZnXCkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087892; c=relaxed/simple;
	bh=JRINILWiC5p90IRbD/BxY7cNI8xdzxL5sNRwNsYWVcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+/pU8LntrxrtXw4hXVpH1RZ+3SGlxWEriq7RTq7/22cXWMlhTRW0FD44JqIZSfGkiUOyMUgM3QQYSN6XC6XrW3yFNcLX510I+qEwGMPnP6iq7COhZKNsBoghsygp2Z86q6uWeeR+O3VbPPhNHayCJIAtcxVghxlX39TBziwhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7ilwVMJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0461AC4AF66;
	Tue,  7 May 2024 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715087892;
	bh=JRINILWiC5p90IRbD/BxY7cNI8xdzxL5sNRwNsYWVcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l7ilwVMJfCKlxWm86Ygi8xJmO4PhY8g9jECAqcdJBokuhA4rZT/BjJwbLZAyWn4Mz
	 lyJ4zNtKdD6I+jU2DjeK6VhMPehppaJs4hJDn2fJmvs0Eq7rb0zDM8/wlVPI5vfP4K
	 KnXx4SKz5goJkpipgRhuG7scdPoGs508WsXooERcSGtyLNitspOhRFSbm2omhGLtZ4
	 anxr/42f0pX+LD5qcAbtOVx32wjC99hN17TODKpFwOA+n0w7/zkBtdE2zA/8qoVvpB
	 980eL3UEgcjirzdyJwCIhKA5H4QMLZt8vFpDxLxO4tZMTFH/8d+QoB+UiFVY1dNeDA
	 AdqvvJ3vmuirQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:28 +0200
Subject: [PATCH v13 10/28] drm/tests: Add HDMI TDMS character rate tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-10-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11939; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JRINILWiC5p90IRbD/BxY7cNI8xdzxL5sNRwNsYWVcU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWmq9luY62Hoy/dn/NdXnN+RcfvTq+r37ypMXGsrETO
 3aW7mL61jGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmYjiBsT5zwcnZVRns6VKv
 t3nzsCw5YWWQf+7DlgpR/kfNvMEqfCXR82XtAy/p7MrZqW3XOtc2hLGhK1ZKbtFPuQlRK42eP7k
 23WLRdQ6h56Vdaw4rr9rz+QDvZhGzbwsYpz5jPxqbwLsw618cAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The previous patch added an helper to compute the TMDS character rate on
an HDMI connector. Let's add a few tests to make sure it works as
expected.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 296 +++++++++++++++++++++++++++++
 1 file changed, 296 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 72f22ec951d6..426d974d8d74 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -6,11 +6,15 @@
 #include <linux/i2c.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_kunit_helpers.h>
+#include <drm/drm_modes.h>
+
+#include <drm/display/drm_hdmi_helper.h>
 
 #include <kunit/test.h>
 
 #include "../drm_crtc_internal.h"
 
@@ -604,14 +608,306 @@ static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
 static struct kunit_suite drm_hdmi_connector_get_output_format_name_test_suite = {
 	.name = "drm_hdmi_connector_get_output_format_name",
 	.test_cases = drm_hdmi_connector_get_output_format_name_tests,
 };
 
+/*
+ * Test that for a given mode, with 8bpc and an RGB output the TMDS
+ * character rate is equal to the mode pixel clock.
+ */
+static void drm_test_drm_hdmi_compute_mode_clock_rgb(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1000ULL, rate);
+}
+
+/*
+ * Test that for a given mode, with 10bpc and an RGB output the TMDS
+ * character rate is equal to 1.25 times the mode pixel clock.
+ */
+static void drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1250, rate);
+}
+
+/*
+ * Test that for the VIC-1 mode, with 10bpc and an RGB output the TMDS
+ * character rate computation fails.
+ */
+static void drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_RGB);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a given mode, with 12bpc and an RGB output the TMDS
+ * character rate is equal to 1.5 times the mode pixel clock.
+ */
+static void drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1500, rate);
+}
+
+/*
+ * Test that for the VIC-1 mode, with 12bpc and an RGB output the TMDS
+ * character rate computation fails.
+ */
+static void drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 1);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_RGB);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a mode with the pixel repetition flag, the TMDS
+ * character rate is indeed double the mode pixel clock.
+ */
+static void drm_test_drm_hdmi_compute_mode_clock_rgb_double(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	unsigned long long rate;
+	struct drm_device *drm = &priv->drm;
+
+	mode = drm_display_mode_from_cea_vic(drm, 6);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_TRUE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, (mode->clock * 1000ULL) * 2, rate);
+}
+
+/*
+ * Test that the TMDS character rate computation for the VIC modes
+ * explicitly listed in the spec as supporting YUV420 succeed and return
+ * half the mode pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv420_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+	unsigned int vic = *(unsigned int *)test->param_value;
+
+	mode = drm_display_mode_from_cea_vic(drm, vic);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, (mode->clock * 1000ULL) / 2, rate);
+}
+
+static const unsigned int drm_hdmi_compute_mode_clock_yuv420_vic_valid_tests[] = {
+	96, 97, 101, 102, 106, 107,
+};
+
+static void drm_hdmi_compute_mode_clock_yuv420_vic_desc(const unsigned int *vic, char *desc)
+{
+	sprintf(desc, "VIC %u", *vic);
+}
+
+KUNIT_ARRAY_PARAM(drm_hdmi_compute_mode_clock_yuv420_valid,
+		  drm_hdmi_compute_mode_clock_yuv420_vic_valid_tests,
+		  drm_hdmi_compute_mode_clock_yuv420_vic_desc);
+
+/*
+ * Test that for a given mode listed supporting it and an YUV420 output
+ * with 10bpc, the TMDS character rate is equal to 0.625 times the mode
+ * pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned int vic =
+		drm_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, vic);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, 0);
+
+	KUNIT_EXPECT_EQ(test, mode->clock * 625, rate);
+}
+
+/*
+ * Test that for a given mode listed supporting it and an YUV420 output
+ * with 12bpc, the TMDS character rate is equal to 0.75 times the mode
+ * pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned int vic =
+		drm_hdmi_compute_mode_clock_yuv420_vic_valid_tests[0];
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, vic);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_YUV420);
+	KUNIT_ASSERT_GT(test, rate, 0);
+
+	KUNIT_EXPECT_EQ(test, mode->clock * 750, rate);
+}
+
+/*
+ * Test that for a given mode, the computation of the TMDS character
+ * rate with 8bpc and a YUV422 output fails.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_YUV422);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a given mode, the computation of the TMDS character
+ * rate with 10bpc and a YUV422 output fails.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 10, HDMI_COLORSPACE_YUV422);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+/*
+ * Test that for a given mode, the computation of the TMDS character
+ * rate with 12bpc and a YUV422 output succeeds and returns a rate equal
+ * to the mode pixel clock.
+ */
+static void drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const struct drm_display_mode *mode;
+	struct drm_device *drm = &priv->drm;
+	unsigned long long rate;
+
+	mode = drm_display_mode_from_cea_vic(drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+
+	KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
+
+	rate = drm_hdmi_compute_mode_clock(mode, 12, HDMI_COLORSPACE_YUV422);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, mode->clock * 1000, rate);
+}
+
+static struct kunit_case drm_hdmi_compute_mode_clock_tests[] = {
+	KUNIT_CASE(drm_test_drm_hdmi_compute_mode_clock_rgb),
+	KUNIT_CASE(drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc),
+	KUNIT_CASE(drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1),
+	KUNIT_CASE(drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc),
+	KUNIT_CASE(drm_test_drm_hdmi_compute_mode_clock_rgb_12bpc_vic_1),
+	KUNIT_CASE(drm_test_drm_hdmi_compute_mode_clock_rgb_double),
+	KUNIT_CASE_PARAM(drm_test_connector_hdmi_compute_mode_clock_yuv420_valid,
+			 drm_hdmi_compute_mode_clock_yuv420_valid_gen_params),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_10_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv420_12_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc),
+	KUNIT_CASE(drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc),
+	{ }
+};
+
+static struct kunit_suite drm_hdmi_compute_mode_clock_test_suite = {
+	.name = "drm_test_connector_hdmi_compute_mode_clock",
+	.init = drm_test_connector_init,
+	.test_cases = drm_hdmi_compute_mode_clock_tests,
+};
+
 kunit_test_suites(
 	&drmm_connector_hdmi_init_test_suite,
 	&drmm_connector_init_test_suite,
 	&drm_get_tv_mode_from_name_test_suite,
+	&drm_hdmi_compute_mode_clock_test_suite,
 	&drm_hdmi_connector_get_output_format_name_test_suite
 );
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");

-- 
2.45.0


