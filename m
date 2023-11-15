Return-Path: <linux-doc+bounces-1471-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395E7DD2A2
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF88A1C20C26
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0EE1DFCC;
	Tue, 31 Oct 2023 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5jlh4WK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D10A1DDD4;
	Tue, 31 Oct 2023 16:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E82C433C8;
	Tue, 31 Oct 2023 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698770926;
	bh=TzJM3Cq+aKhNUMbLeP67D/3B1e/vg4ASjkjOAY8gJTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b5jlh4WKBTgffrO82bOhCN3p+UZr8fkCIbrqyNltFBYvqsXuD8stXXgO04Ac/mHH7
	 ATAEAK1zpg2PBLKRbjhWJoO9AI7My3BxFZteWlO2tZzdC/bHzAKp2h1bUYTaC7u/SN
	 V4O+cO2Q18+GIVAQZmveHux8yy+CctpRAykxc8fFKAUX++W4zG6+19Rpp50dl58Lq1
	 zsEFl/7hbsrmoo7MRP4RLpFIT2j8fLKgb6ERumRRnBOrS1w61GM8CP4qEn89fiWrvH
	 a49SrnXwHD6jjOWcphYrMKD5BrCqfJCx2YHXpIYTwxQ5np8zbjK7+HAfrOFQ3JqIdz
	 YUFYiV93N/Ivg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:17 +0100
Subject: [PATCH RFC v3 04/37] drm/connector: hdmi: Add RGB Quantization
 Range to the connector state
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-4-328b0fae43a7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4775; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TzJM3Cq+aKhNUMbLeP67D/3B1e/vg4ASjkjOAY8gJTE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+nerrkxezbjAwpLrYujqTVMaX3rwOOrM9XBJVDibt
 6/d7svkjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkegsjw4o7Tx4uvLrYVfqg
 VLeVQrnz+ewtYfPcDe4ubZV980R4eS7Df39xvbl7T2X/1oub9a70QbOBWeZzfQOnw6L8r5nTSg0
 sGAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

HDMI controller drivers will need to figure out the RGB range they need
to configure based on a mode and property values. Let's expose that in
the HDMI connector state so drivers can just use that value.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c              |  4 ++-
 drivers/gpu/drm/drm_atomic_state_helper.c | 44 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  1 +
 include/drm/drm_connector.h               |  6 +++++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b1b56dcaa76b..55cb117cd49a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1143,9 +1143,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
+		drm_printf(p, "\tis_full_range=%c\n", state->hdmi.is_full_range ? 'y' : 'n');
+	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 37193c6f9fca..c3f124af64dc 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -31,6 +31,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
@@ -622,6 +623,47 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
 
+static const struct drm_display_mode *
+connector_state_get_mode(const struct drm_connector_state *conn_state)
+{
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+
+	state = conn_state->state;
+	if (!state)
+		return NULL;
+
+	crtc = conn_state->crtc;
+	if (!crtc)
+		return NULL;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!crtc_state)
+		return NULL;
+
+	return &crtc_state->mode;
+}
+
+static bool hdmi_is_full_range(const struct drm_connector *connector,
+			       const struct drm_connector_state *state)
+{
+	const struct drm_display_info *display = &connector->display_info;
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(state);
+
+	if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
+		return true;
+
+	if (state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return false;
+
+	if (!display->is_hdmi)
+		return true;
+
+	return drm_default_rgb_quant_range(mode);
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
@@ -642,6 +684,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
+	new_state->hdmi.is_full_range = hdmi_is_full_range(connector, new_state);
+
 	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
 		struct drm_crtc *crtc = new_state->crtc;
 		struct drm_crtc_state *crtc_state;
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index d59d2b3aef9a..8072ac18e536 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -88,6 +88,7 @@ void
 __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
 void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 					  struct drm_connector_state *state);
+
 void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
 						     struct drm_private_state *state);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 168009f588ab..fc1fa754a40d 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1053,6 +1053,12 @@ struct drm_connector_state {
 		 * Broadcast RGB selection value.
 		 */
 		enum drm_hdmi_broadcast_rgb broadcast_rgb;
+
+		/**
+		 * @is_full_range: Is the output supposed to use a full
+		 * RGB Quantization Range or not?
+		 */
+		bool is_full_range;
 	} hdmi;
 };
 

-- 
2.41.0


