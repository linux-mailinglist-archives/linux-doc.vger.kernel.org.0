Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC6C7A8748
	for <lists+linux-doc@lfdr.de>; Wed, 20 Sep 2023 16:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236686AbjITOjB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Sep 2023 10:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbjITOiy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 10:38:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4A919A4;
        Wed, 20 Sep 2023 07:37:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6D6C433A9;
        Wed, 20 Sep 2023 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695220643;
        bh=fBonQ0XHrW4s6go71bEhf2QGqRqulcwzMi4AdpPOd0s=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=RN1mJQsMwZqaUTyikHxDEgv49LHSNCqdnX1uFkQe5ze+B3YT+FNDiraUnDHPE46QP
         uQ5gdpXpkd7tIZ2EYLlaQYpIX59zn74h93EGGWmnoKrJIVJiGcrsToHfnjFZG302pe
         NWQbhijad+qgXAb700B/2ByC43yRGp1f7rAVT8uLpO5oym2nxZzivnwyGyqvlLuEJc
         vD7WvZiQcexqirK5a5RdryD3ZZj2oro607d5MVv2wS1WwxDZUaSVadOGTQYwSm3AZK
         mTuhjfcyjDVrIGPFZ6LFfxRUGd42tFik1eEBj6p/ytYmfFVlZ9s+HYeqK3DHXhx32M
         2EWYsnbeWGdMw==
From:   Maxime Ripard <mripard@kernel.org>
Date:   Wed, 20 Sep 2023 16:35:51 +0200
Subject: [PATCH RFC v2 36/37] drm/sun4i: hdmi: Consolidate atomic_check and
 mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-36-17932daddd7d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4258; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fBonQ0XHrW4s6go71bEhf2QGqRqulcwzMi4AdpPOd0s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczFZR0YcLF7HXNJ/1sap75fuBW8BnrxCX9znxMN122
 Z8z3HI7SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMJENyowM96ar6/+wKj92+Zd3
 +WaDBbs6/tgrcLRF/i5YW1n92/jiA0aGuz9rOaMvKbIva9xq7iTq4MC8vr0heOsqK6HsrwJ1r/Z
 yAgA=
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

atomic_check and mode_valid do not check for the same things which can
lead to surprising result if the userspace commits a mode that didn't go
through mode_valid. Let's merge the two implementations into a function
called by both.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 74 +++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index c276d984da6b..b7cf369b1906 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -62,18 +62,6 @@ static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
 	return 0;
 }
 
-static int sun4i_hdmi_atomic_check(struct drm_encoder *encoder,
-				   struct drm_crtc_state *crtc_state,
-				   struct drm_connector_state *conn_state)
-{
-	struct drm_display_mode *mode = &crtc_state->mode;
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		return -EINVAL;
-
-	return 0;
-}
-
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -166,31 +154,61 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
 }
 
-static enum drm_mode_status sun4i_hdmi_mode_valid(struct drm_encoder *encoder,
-					const struct drm_display_mode *mode)
+static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
+	.atomic_disable	= sun4i_hdmi_disable,
+	.atomic_enable	= sun4i_hdmi_enable,
+};
+
+static enum drm_mode_status
+sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock)
 {
-	struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
-	unsigned long rate = mode->clock * 1000;
-	unsigned long diff = rate / 200; /* +-0.5% allowed by HDMI spec */
+	const struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
+	unsigned long diff = clock / 200; /* +-0.5% allowed by HDMI spec */
 	long rounded_rate;
 
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		return MODE_BAD;
+
 	/* 165 MHz is the typical max pixelclock frequency for HDMI <= 1.2 */
-	if (rate > 165000000)
+	if (clock > 165000000)
 		return MODE_CLOCK_HIGH;
-	rounded_rate = clk_round_rate(hdmi->tmds_clk, rate);
+
+	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
 	if (rounded_rate > 0 &&
-	    max_t(unsigned long, rounded_rate, rate) -
-	    min_t(unsigned long, rounded_rate, rate) < diff)
+	    max_t(unsigned long, rounded_rate, clock) -
+	    min_t(unsigned long, rounded_rate, clock) < diff)
 		return MODE_OK;
+
 	return MODE_NOCLOCK;
 }
 
-static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
-	.atomic_check	= sun4i_hdmi_atomic_check,
-	.atomic_disable	= sun4i_hdmi_disable,
-	.atomic_enable	= sun4i_hdmi_enable,
-	.mode_valid	= sun4i_hdmi_mode_valid,
-};
+static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc *crtc = conn_state->crtc;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	enum drm_mode_status status;
+
+	status = sun4i_hdmi_connector_clock_valid(connector, mode,
+						  mode->clock * 1000);
+	if (status != MODE_OK)
+		return -EINVAL;
+
+	return 0;
+}
+
+static enum drm_mode_status
+sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	return sun4i_hdmi_connector_clock_valid(connector, mode,
+						mode->clock * 1000);
+}
 
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
@@ -236,6 +254,8 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 }
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
+	.atomic_check	= sun4i_hdmi_connector_atomic_check,
+	.mode_valid	= sun4i_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };
 

-- 
2.41.0

