Return-Path: <linux-doc+bounces-1485-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7167DD2D3
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FA2BB20F0E
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D792C1DFC8;
	Tue, 31 Oct 2023 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdlO+r2N"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA65F1DDD4;
	Tue, 31 Oct 2023 16:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F532C433C9;
	Tue, 31 Oct 2023 16:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698770966;
	bh=NPcmog8rmIBDaqZDT4O0fzD3K2AFLpEEWCR2cLRhvQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CdlO+r2N5P/0P2SeY11Srvlw+32mXRp0+lYV9wKhTZ7A8/FvrxOPeRgDLCvgc2WJi
	 C3ZDT+UgsHiR5ADh0tTpohiAiqoPuni9nva4Db+FjxK78HBN7hQ+IGvIFVzMXftDZa
	 1arEfrJgwli72rHB2pgJX30TqcahxHP6lAXcLcQvNpxhweqGzQJlfLDty+eabMERUr
	 RL5Vd8eDdb3rxdqAOvcHl5Slp3nROjKe9R6knvOePBfTEhgF9KS5tLe5dQlMdhsViZ
	 znsNtqBK9A5+7PxebltYx4YwQBVJ6zZvGXHqVen0HOebmFgNQig90dvJpduRPVJg7f
	 f7U1fPAFYUIJw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:31 +0100
Subject: [PATCH RFC v3 18/37] drm/rockchip: inno_hdmi: Get rid of mode_set
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-18-328b0fae43a7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NPcmog8rmIBDaqZDT4O0fzD3K2AFLpEEWCR2cLRhvQQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+vdynt/9z7DzK9sR72lpq9+s+Nz870mor64sz1blF
 4vSt/IKdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiIs8Z/rsFPFhbkpu4ZL+Z
 VsAW9lwl9Yi1x6zs1z7meRMcGnJqXgIjww2pu2YSF/c4WzovEBd7k/LvJsdN/cr/5kncpd2rLMM
 VOAE=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We're not doing anything special in atomic_mode_set so we can simply
merge it into atomic_enable.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index cc86d273ca4a..4db18195246e 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -490,21 +490,22 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
-				       struct drm_crtc_state *crtc_state,
-				       struct drm_connector_state *conn_state)
-{
-	struct drm_display_mode *adj_mode = &crtc_state->adjusted_mode;
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-
-	inno_hdmi_setup(hdmi, adj_mode);
-}
-
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 				     struct drm_atomic_state *state)
 {
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 
+	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
@@ -533,7 +534,6 @@ static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 	.atomic_check	= inno_hdmi_encoder_atomic_check,
 	.atomic_enable	= inno_hdmi_encoder_enable,
 	.atomic_disable	= inno_hdmi_encoder_disable,
-	.atomic_mode_set	= inno_hdmi_encoder_mode_set,
 };
 
 static enum drm_connector_status

-- 
2.41.0


