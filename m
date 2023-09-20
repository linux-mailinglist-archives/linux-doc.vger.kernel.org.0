Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC30C7A86D4
	for <lists+linux-doc@lfdr.de>; Wed, 20 Sep 2023 16:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236533AbjITOgc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Sep 2023 10:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236489AbjITOgW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 10:36:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FA41B0;
        Wed, 20 Sep 2023 07:36:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8C8C433CA;
        Wed, 20 Sep 2023 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695220571;
        bh=C/xF5Qf5LEEpxL3F1aDSqoe3Qetbk4k3uiVfkCBFhS8=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=jFlpWGvnAu3c8VCaqiXvfM/KJY/Zv97ApBzUJduBbmyTCBkffpPA6/rRAaYPuePwg
         AmZg5to90CbpahquxXCOgA4h5V/o9MqngRZI7YpMimc7SAZWLlOegHZZlz1pY8CUZp
         IgGSm1pBQQzRaTn8xvmTvrg8hpf02AeNosbzl0sA+UBLtQhp6OYa84GzPUXC+hFFyD
         rtt/7Y5NV7IioOSMIs2VtMXWGErd/iuKXwR+IMts1cECvRVTcGXHRZZD56pTnxQh/M
         A95Rr1whQMCPXBROMwSqzY3FMQVM6IdnP8j9Pips606GHeep264P/rK/JKEGd9cllP
         E8mKhKmTH8Uew==
From:   Maxime Ripard <mripard@kernel.org>
Date:   Wed, 20 Sep 2023 16:35:25 +0200
Subject: [PATCH RFC v2 10/37] drm/connector: hdmi: Compute bpc and format
 automatically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-10-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6421; i=mripard@kernel.org;
 h=from:subject:message-id; bh=C/xF5Qf5LEEpxL3F1aDSqoe3Qetbk4k3uiVfkCBFhS8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczJaeG/j1NjeXlb0Sja2awZqfWMYcdfXSqpPCdQ+8+
 H/ZChd0lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCLlNxkZzl75+vnF7dsiL/9e
 yV/B1+1rPi+S2WLJr8kT/NX8Ze9/yGD4wx11K7wkzpeT2Wuicerj/sLj9YyNC/klPvvu6d0StPs
 /BwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that we have all the infrastructure needed, we can add some code
that will, for a given connector state and mode, compute the best output
format and bpc.

The algorithm is the same one than the one already found in i915 and
vc4.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 174 +++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 9539b952fd8c..2f85422cccd4 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -635,6 +635,96 @@ connector_state_get_adjusted_mode(const struct drm_connector_state *state)
 	return &crtc_state->adjusted_mode;
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
+	if (vic == 1 && bpc != 8) {
+		drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
+		return false;
+	}
+
+	if (!info->is_hdmi &&
+	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
+		drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
+		return false;
+	}
+
+	if (!(connector->hdmi.supported_formats & BIT(format))) {
+		drm_dbg(dev, "%s format unsupported by the connector.\n",
+			drm_hdmi_connector_get_output_format_name(format));
+		return false;
+	}
+
+	switch (format) {
+	case HDMI_COLORSPACE_RGB:
+		drm_dbg(dev, "RGB Format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+			return false;
+
+		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "RGB format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV422:
+		drm_dbg(dev, "YUV422 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+			drm_dbg(dev, "Sink doesn't support YUV422.\n");
+			return false;
+		}
+
+		if (bpc != 12) {
+			drm_dbg(dev, "YUV422 only supports 12 bpc.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV422 format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV444:
+		drm_dbg(dev, "YUV444 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+			drm_dbg(dev, "Sink doesn't support YUV444.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV444 format supported in that configuration.\n");
+
+		return true;
+	}
+
+	return false;
+}
+
 static enum drm_mode_status
 hdmi_clock_valid(const struct drm_connector *connector,
 		 const struct drm_display_mode *mode,
@@ -669,6 +759,86 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	return 0;
 }
 
+static bool
+hdmi_try_format_bpc(const struct drm_connector *connector,
+		    struct drm_connector_state *state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	drm_dbg(dev, "Trying output format %s\n",
+		drm_hdmi_connector_get_output_format_name(fmt));
+
+	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc))
+		return false;
+
+	ret = hdmi_compute_clock(connector, state, mode, bpc, fmt);
+	if (ret)
+		return false;
+
+	return true;
+}
+
+static int
+hdmi_compute_format(const struct drm_connector *connector,
+		    struct drm_connector_state *state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc)
+{
+	struct drm_device *dev = connector->dev;
+
+	if (hdmi_try_format_bpc(connector, state, mode, bpc, HDMI_COLORSPACE_RGB)) {
+		state->hdmi.output_format = HDMI_COLORSPACE_RGB;
+		return 0;
+	}
+
+	if (hdmi_try_format_bpc(connector, state, mode, bpc, HDMI_COLORSPACE_YUV422)) {
+		state->hdmi.output_format = HDMI_COLORSPACE_YUV422;
+		return 0;
+	}
+
+	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
+
+	return -EINVAL;
+}
+
+static int
+hdmi_compute_config(const struct drm_connector *connector,
+		    struct drm_connector_state *state,
+		    const struct drm_display_mode *mode)
+{
+	struct drm_device *dev = connector->dev;
+	unsigned int max_bpc = clamp_t(unsigned int,
+				       state->max_bpc,
+				       8, connector->max_bpc);
+	unsigned int bpc;
+	int ret;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
+
+		ret = hdmi_compute_format(connector, state, mode, bpc);
+		if (ret)
+			continue;
+
+		state->hdmi.output_bpc = bpc;
+
+		drm_dbg(dev,
+			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
+			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+			state->hdmi.output_bpc,
+			drm_hdmi_connector_get_output_format_name(state->hdmi.output_format),
+			state->hdmi.tmds_char_rate);
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
@@ -692,9 +862,7 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		connector_state_get_adjusted_mode(new_state);
 	int ret;
 
-	ret = hdmi_compute_clock(connector, new_state, mode,
-				 new_state->hdmi.output_bpc,
-				 new_state->hdmi.output_format);
+	ret = hdmi_compute_config(connector, new_state, mode);
 	if (!ret)
 		return ret;
 

-- 
2.41.0

