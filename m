Return-Path: <linux-doc+bounces-3316-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58C7FB79F
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 11:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D79F1C21331
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 10:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E144F5EB;
	Tue, 28 Nov 2023 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roKZQ0UT"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF22B4E1D9;
	Tue, 28 Nov 2023 10:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334EBC433C8;
	Tue, 28 Nov 2023 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167176;
	bh=Ugkk2YNICB85GnhlSqD43ohZlCKXw7eOgoeDoDRfEYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=roKZQ0UTQtLeE+kJYHPKKM6Obu/KOCfNqBCx6hU6X2aJNNEqOcorc6wfLdTiW4gbs
	 AYpu2x4Flhqd/KOhUnrBGNlYEoLoA55F6iV1LdzK0VeoEjXVINXWB1eFHYw+t1AfJE
	 +9quavv+L5Xk6FZxg8QBIAG4miuY2UBVIfqqebZXWTqYp73h44Ie4JbKFP7IMoSqpj
	 QO8Ir+EGxQOIRk8PnjnEOwvCWS8AQi/e84ZM1bhHA0GX99CT8U4Fo0Sywl6sRLSsyj
	 PnEEfzUt9jhjozfGkzCBdxw7eEVp7U0a1haHbiJxfJSyXiFVxbMVRI8ALIsl+tTI7l
	 2Z4c6+2auStwg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:51 +0100
Subject: [PATCH v4 40/45] drm/rockchip: inno_hdmi: Switch to HDMI connector
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-40-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7097; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ugkk2YNICB85GnhlSqD43ohZlCKXw7eOgoeDoDRfEYo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y8L3zse8fqA0KeT3Uu05D8+XuUtnfD5+b14z6A6g
 +q/yee+dJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiRqqMDDOXGHPvTrlSavAg
 QCVi6/Q7/XPUv+dv/lBcfOJmRtOnt2oMf6WOy79rbEo3vuqRxPP12AXtx/lZHc43Oftfel4r05n
 5kAcA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The new HDMI connector infrastructure allows to remove some boilerplate,
especially to generate infoframes. Let's switch to it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 101 ++++++++++++++---------------------
 1 file changed, 41 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index d0b463d166fb..d5661ef5e00b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -223,9 +223,10 @@ static u32 inno_hdmi_get_frame_enable(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
-				    enum hdmi_infoframe_type type)
+static int inno_hdmi_disable_frame(struct drm_connector *connector,
+				   enum hdmi_infoframe_type type)
 {
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	u32 frame_index = inno_hdmi_get_frame_index(hdmi, type);
 	u32 disable = inno_hdmi_get_frame_disable(hdmi, type);
 	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
@@ -234,24 +235,23 @@ static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
 		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
+
+	return 0;
 }
 
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
+static int inno_hdmi_upload_frame(struct drm_connector *connector,
+				  enum hdmi_infoframe_type type,
+				  const u8 *buffer, size_t len)
 {
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	u32 enable = inno_hdmi_get_frame_enable(hdmi, type);
 	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
 	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-	ssize_t rc, i;
+	ssize_t i;
 
-	inno_hdmi_disable_frame(hdmi, type);
+	inno_hdmi_disable_frame(connector, type);
 
-	rc = hdmi_infoframe_pack(frame, packed_frame,
-				 sizeof(packed_frame));
-	if (rc < 0)
-		return rc;
-
-	for (i = 0; i < rc; i++)
+	for (i = 0; i < len; i++)
 		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
 			    packed_frame[i]);
 
@@ -261,41 +261,10 @@ static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
-				      struct drm_display_mode *mode)
-{
-	union hdmi_infoframe frame;
-	int rc;
-
-	rc = drm_hdmi_vendor_infoframe_from_display_mode(&frame.vendor.hdmi,
-							 &hdmi->connector,
-							 mode);
-	if (rc) {
-		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_VENDOR);
-		return rc;
-	}
-
-	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_VENDOR);
-}
-
-static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
-				      struct drm_display_mode *mode)
-{
-	union hdmi_infoframe frame;
-	int rc;
-
-	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						      &hdmi->connector,
-						      mode);
-	if (rc) {
-		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
-		return rc;
-	}
-
-	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
-
-	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
-}
+static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
+	.clear_infoframe	= inno_hdmi_disable_frame,
+	.write_infoframe	= inno_hdmi_upload_frame,
+};
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 {
@@ -374,9 +343,12 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 }
 
 static int inno_hdmi_setup(struct inno_hdmi *hdmi,
-			   struct drm_display_mode *mode)
+			   struct drm_crtc_state *new_crtc_state,
+			   struct drm_connector_state *new_conn_state)
 {
-	struct drm_display_info *display = &hdmi->connector.display_info;
+	struct drm_connector *connector = &hdmi->connector;
+	struct drm_display_info *display = &connector->display_info;
+	struct drm_display_mode *mode = &new_crtc_state->adjusted_mode;
 
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -390,10 +362,8 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
 	inno_hdmi_config_video_csc(hdmi);
 
-	if (display->is_hdmi) {
-		inno_hdmi_config_video_avi(hdmi, mode);
-		inno_hdmi_config_video_vsi(hdmi, mode);
-	}
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector,
+							   new_conn_state->state);
 
 	/*
 	 * When IP controller have configured to an accurate video
@@ -401,7 +371,7 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
 	 * clock rate, and reconfigure the DDC clock.
 	 */
-	inno_hdmi_i2c_init(hdmi, mode->clock * 1000);
+	inno_hdmi_i2c_init(hdmi, new_conn_state->hdmi.tmds_char_rate);
 
 	/* Unmute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -425,7 +395,7 @@ static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 	if (WARN_ON(!crtc_state))
 		return;
 
-	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
+	inno_hdmi_setup(hdmi, crtc_state, conn_state);
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
@@ -491,6 +461,12 @@ inno_hdmi_probe_single_connector_modes(struct drm_connector *connector,
 	return drm_helper_probe_single_connector_modes(connector, 1920, 1080);
 }
 
+static void inno_hdmi_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
+}
+
 static void inno_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_unregister(connector);
@@ -501,12 +477,13 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 	.fill_modes = inno_hdmi_probe_single_connector_modes,
 	.detect = inno_hdmi_connector_detect,
 	.destroy = inno_hdmi_connector_destroy,
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = inno_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
+	.atomic_check = drm_atomic_helper_connector_hdmi_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 };
 
@@ -533,10 +510,14 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 
 	drm_connector_helper_add(&hdmi->connector,
 				 &inno_hdmi_connector_helper_funcs);
-	drm_connector_init_with_ddc(drm, &hdmi->connector,
-				    &inno_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
+	drmm_connector_hdmi_init(drm, &hdmi->connector,
+				 "Rockchip", "Inno HDMI",
+				 &inno_hdmi_connector_funcs,
+				 &inno_hdmi_hdmi_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA,
+				 hdmi->ddc,
+				 BIT(HDMI_COLORSPACE_RGB),
+				 8);
 
 	drm_connector_attach_encoder(&hdmi->connector, encoder);
 

-- 
2.41.0


