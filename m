Return-Path: <linux-doc+bounces-1472-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D3E7DD2A3
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C3511C20C98
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01691DFC8;
	Tue, 31 Oct 2023 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDiUakTL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD8B1DDD4;
	Tue, 31 Oct 2023 16:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E446FC433C8;
	Tue, 31 Oct 2023 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698770929;
	bh=NE9ZQi0quukkEFgUc0oJfWhNAR8pjL+9EmU2GJrMnDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XDiUakTLpif9725+Vda0ONBIPTrOjSbkaSKI43oCZPRpyEg0gTEY47YatadFNSPZu
	 8zh8GOYPkB9bmHyoNqbVn1ZN7sxJQVtwZf6HLJN6sBvNsNACYSkUl5V8UByi7hKkOL
	 4LBPNr/zxOct1HoMOEzK+2KeGkgVN+cMOW4TCEk+WFE5NwpZK894AngVEpyTEee07F
	 xHMCYJnb/BZPp5TpEqoECa1zd/PO6yzbAGHm0LSOOM3H/OYJzctwHw/V3551QVYT99
	 0HL3oHisbzZtYkaBaTDL5jhK0DgRB8/8oNWAcD1rZKtEEWvorEF6630kRlNd3pBite
	 K76+Ocf2WaZ9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:18 +0100
Subject: [PATCH RFC v3 05/37] drm/connector: hdmi: Add output BPC to the
 connector state
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-5-328b0fae43a7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5152; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NE9ZQi0quukkEFgUc0oJfWhNAR8pjL+9EmU2GJrMnDw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+nf/L9EIj++dKN20a8/JzcLth77NXLTCvJNPdHb6u
 QVtV97JdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAim6oYGR5ZiG62sGK4EOet
 tzfRjfHfhbdn5k3xTuywL3vfaSFy+xPDP9UZysyKF1I8/mzoVmRe3sy+aD1H86d3kg15tYV/2Ds
 ZuAE=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We'll add automatic selection of the output BPC in a following patch,
but let's add it to the HDMI connector state already.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c              |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c |  8 +++++++-
 drivers/gpu/drm/drm_connector.c           | 20 +++++++++++++++++++-
 include/drm/drm_connector.h               | 13 ++++++++++++-
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 55cb117cd49a..51aac1b2aaaf 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1147,6 +1147,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
 		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
+		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index c3f124af64dc..406ba358aa14 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -570,6 +570,11 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_state)
 {
+	unsigned int max_bpc = connector->max_bpc;
+
+	new_state->max_bpc = max_bpc;
+	new_state->max_requested_bpc = max_bpc;
+	new_state->hdmi.output_bpc = max_bpc;
 	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
@@ -686,7 +691,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 
 	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
 
-	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
+	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
+	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 36d728e811ae..508d1c667732 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -459,6 +459,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
  * @ddc: optional pointer to the associated ddc adapter
+ * @max_bpc: Maximum bits per char the HDMI connector supports
  *
  * Initialises a preallocated HDMI connector. Connectors can be
  * subclassed as part of driver connector objects.
@@ -475,7 +476,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc)
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc)
 {
 	int ret;
 
@@ -487,6 +489,22 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	if (max_bpc) {
+		if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
+			return -EINVAL;
+
+		/*
+		 * drm_connector_attach_max_bpc_property() requires the
+		 * connector to have a state.
+		 */
+		if (connector->funcs->reset)
+			connector->funcs->reset(connector);
+
+		drm_connector_attach_hdr_output_metadata_property(connector);
+		drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
+		connector->max_bpc = max_bpc;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fc1fa754a40d..2d664b6ac0a6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1059,6 +1059,11 @@ struct drm_connector_state {
 		 * RGB Quantization Range or not?
 		 */
 		bool is_full_range;
+
+		/**
+		 * @output_bpc: Bits per color channel to output.
+		 */
+		unsigned int output_bpc;
 	} hdmi;
 };
 
@@ -1703,6 +1708,11 @@ struct drm_connector {
 	 */
 	struct drm_property_blob *path_blob_ptr;
 
+	/**
+	 * @max_bpc: Maximum bits per color channel the connector supports.
+	 */
+	unsigned int max_bpc;
+
 	/**
 	 * @max_bpc_property: Default connector property for the max bpc to be
 	 * driven out of the connector.
@@ -1942,7 +1952,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const struct drm_connector_funcs *funcs,
 			     int connector_type,
-			     struct i2c_adapter *ddc);
+			     struct i2c_adapter *ddc,
+			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);

-- 
2.41.0


