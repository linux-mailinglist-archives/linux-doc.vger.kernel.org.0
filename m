Return-Path: <linux-doc+bounces-1504-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893627DD2F8
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285851F21EBA
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7EE1DFE1;
	Tue, 31 Oct 2023 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6oXmO6I"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE11D69C;
	Tue, 31 Oct 2023 16:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C89C433C9;
	Tue, 31 Oct 2023 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698771019;
	bh=3B4cKJeyaHEA4qnMRAdXt6vbTh9xnPoZLjBoO+s6BVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f6oXmO6IEfHNfNcLUIhrlI2oXYGCxQBbVvZ63TL08ZHxnksVl04Jmx9XuYe4PistH
	 UPdADyw3MeHW0zyfl6cGtgWZ40peZE2FHu3c3rx67WkD3DvH7XfuQbuPm1TZLQF+1n
	 QGbmRoi5cI8vP2OlNhADxARnkprPAUOziVwWGbzOZXQh3jg29EH69AsqRPtwdKtSg5
	 Vg/Hm8E6avS7nzTqMez1rCzznQuSm3DqmxOFslxhSWLZ32QSMVmSN40fcXSpyu7sID
	 xNWVq4CSyARTO1x/XpZOzTZCZKpOxYrNK2qgoprfgw02RqWL7MxKkVPBN5Qhm9iw5K
	 ioFf9P3bkVQ/g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:50 +0100
Subject: [PATCH RFC v3 37/37] drm/sun4i: hdmi: Switch to HDMI connector
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-37-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6185; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3B4cKJeyaHEA4qnMRAdXt6vbTh9xnPoZLjBoO+s6BVk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+vfXHtFWNeOb1GSd1rD1kEh0qatI6S7/+QaLD9b6v
 Xuwbd2zjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEwk7QkjQ2P3r4nXC60so0pF
 Zhi8fmqxw2q/k9S8n0s1tnf9NuwTfsTIMKPmhZrf+wabRAcd1gmJSzg5y9J1HeeeFjI9ULdst44
 NNwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The new HDMI connector infrastructure allows to remove some boilerplate,
especially to generate infoframes. Let's switch to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 80 ++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b7cf369b1906..8a9106a39f23 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -36,30 +36,24 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
-static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
-					   struct drm_display_mode *mode)
+static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type,
+				      const u8 *buffer, size_t len)
 {
-	struct hdmi_avi_infoframe frame;
-	u8 buffer[17];
-	int i, ret;
+	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
+	int i;
 
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame,
-						       &hdmi->connector, mode);
-	if (ret < 0) {
-		DRM_ERROR("Failed to get infoframes from mode\n");
-		return ret;
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		drm_err(connector->dev,
+			"Unsupported infoframe type: %u\n", type);
+		return 0;
 	}
 
-	ret = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (ret < 0) {
-		DRM_ERROR("Failed to pack infoframes\n");
-		return ret;
-	}
-
-	for (i = 0; i < sizeof(buffer); i++)
+	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
 
 	return 0;
+
 }
 
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
@@ -82,14 +76,18 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
-	struct drm_display_info *display = &hdmi->connector.display_info;
+	struct drm_connector *connector = &hdmi->connector;
+	struct drm_display_info *display = &connector->display_info;
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	unsigned long long tmds_rate = conn_state->hdmi.tmds_char_rate;
 	unsigned int x, y;
 	u32 val = 0;
 
 	DRM_DEBUG_DRIVER("Enabling the HDMI Output\n");
 
-	clk_set_rate(hdmi->mod_clk, mode->crtc_clock * 1000);
-	clk_set_rate(hdmi->tmds_clk, mode->crtc_clock * 1000);
+	clk_set_rate(hdmi->mod_clk, tmds_rate);
+	clk_set_rate(hdmi->tmds_clk, tmds_rate);
 
 	/* Set input sync enable */
 	writel(SUN4I_HDMI_UNKNOWN_INPUT_SYNC,
@@ -142,7 +140,8 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 
 	clk_prepare_enable(hdmi->tmds_clk);
 
-	sun4i_hdmi_setup_avi_infoframes(hdmi, mode);
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
 	val |= SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
 	val |= SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
 	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
@@ -195,7 +194,7 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
 	enum drm_mode_status status;
 
 	status = sun4i_hdmi_connector_clock_valid(connector, mode,
-						  mode->clock * 1000);
+						  conn_state->hdmi.tmds_char_rate);
 	if (status != MODE_OK)
 		return -EINVAL;
 
@@ -206,8 +205,11 @@ static enum drm_mode_status
 sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
 				struct drm_display_mode *mode)
 {
-	return sun4i_hdmi_connector_clock_valid(connector, mode,
-						mode->clock * 1000);
+	unsigned long long rate =
+		drm_connector_hdmi_compute_mode_clock(mode, 8,
+						      HDMI_COLORSPACE_RGB);
+
+	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
 }
 
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
@@ -253,6 +255,11 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 	return ddc;
 }
 
+static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
+	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
+	.write_infoframe	= sun4i_hdmi_write_infoframe,
+};
+
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
 	.atomic_check	= sun4i_hdmi_connector_atomic_check,
 	.mode_valid	= sun4i_hdmi_connector_mode_valid,
@@ -274,11 +281,17 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
+static void sun4i_hdmi_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+}
+
 static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
 	.detect			= sun4i_hdmi_connector_detect,
 	.fill_modes		= drm_helper_probe_single_connector_modes,
 	.destroy		= drm_connector_cleanup,
-	.reset			= drm_atomic_helper_connector_reset,
+	.reset			= sun4i_hdmi_connector_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -637,10 +650,19 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_connector_helper_add(&hdmi->connector,
 				 &sun4i_hdmi_connector_helper_funcs);
-	ret = drm_connector_init_with_ddc(drm, &hdmi->connector,
-					  &sun4i_hdmi_connector_funcs,
-					  DRM_MODE_CONNECTOR_HDMIA,
-					  hdmi->ddc_i2c);
+	ret = drmm_connector_hdmi_init(drm, &hdmi->connector,
+				       /*
+					* NOTE: Those are likely to be
+					* wrong, but I couldn't find the
+					* actual ones in the BSP.
+					*/
+				       "AW", "HDMI",
+				       &sun4i_hdmi_connector_funcs,
+				       &sun4i_hdmi_hdmi_connector_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       hdmi->ddc_i2c,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
 	if (ret) {
 		dev_err(dev,
 			"Couldn't initialise the HDMI connector\n");

-- 
2.41.0


