Return-Path: <linux-doc+bounces-1497-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 399757DD2EC
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E102D2813EF
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F5C1DDD4;
	Tue, 31 Oct 2023 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyUqjmVL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744C1D69C;
	Tue, 31 Oct 2023 16:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E42C433C8;
	Tue, 31 Oct 2023 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698770999;
	bh=TGSMVN8rfPhwS5amDVMAYsc9HM0SUQlWIoXQfpiVcYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nyUqjmVLefuK1Djqgzmy75i329b81PAjpNFrm9KO6OawK7kATuwXwyVfZwB6rCBHp
	 8DR7RpplSF1btzDrPfO90RH4EsQ9/m04bsOkm3LTPZ5EqnVJB1yoq/P3WLwMCsZHmJ
	 saUORzdV02EQeNdsR0YSCbWbPfaRY7r9TAqNCXKwzX7Z5ORbpGKQ58WrobNyGjHInf
	 qhOJaoc0yI+2Hu3QYl/kCzqkH/xYn/UbsA6BO93UKKADfGLGcDBPRlzjQxY7IfjvDo
	 fH0+lRBQ/a+ohD3oONRCthlBTS5edVTKICOTNauTwfnV11Sz48HRA5N/6gNBva4bCp
	 7kyDu5mo1jtDA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:43 +0100
Subject: [PATCH RFC v3 30/37] drm/rockchip: inno_hdmi: Switch to infoframe
 type
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-30-328b0fae43a7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TGSMVN8rfPhwS5amDVMAYsc9HM0SUQlWIoXQfpiVcYQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+vfPhx23PODeWto5t8n1lptK4PJ2o1VNgd6ZPMpqj
 sacXrc6SlkYxLgYZMUUWWKEzZfEnZr1upONbx7MHFYmkCEMXJwCMJHbUgz/S88qz/xfyvWpKfzI
 cms/vvcRk6bFzzxT9TPuXQnT/oMR+owMnfbLAy918HWu5NsQtlZR0mv7OoaN81aW+D07Fn55zaw
 j7AA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The inno_hdmi driver relies on its own internal infoframe type matching
the hardware.

This works fine, but in order to make further reworks easier, let's
switch to the HDMI spec definition of those types.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 71 +++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index bc7fb1278cb2..ed1d10efbef4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -156,61 +156,80 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
+static u32 inno_hdmi_get_frame_index(struct inno_hdmi *hdmi,
+				    enum hdmi_infoframe_type type)
+{
+	struct drm_device *drm = hdmi->connector.dev;
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		return INFOFRAME_VSI;
+	case HDMI_INFOFRAME_TYPE_AVI:
+		return INFOFRAME_AVI;
+	default:
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
+	}
+
+	return 0;
+}
+
 static u32 inno_hdmi_get_frame_mask(struct inno_hdmi *hdmi,
-				    u32 frame_index)
+				    enum hdmi_infoframe_type type)
 {
 	struct drm_device *drm = hdmi->connector.dev;
 
-	switch (frame_index) {
-	case INFOFRAME_VSI:
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return m_PACKET_VSI_EN;
-	case INFOFRAME_AVI:
+	case HDMI_INFOFRAME_TYPE_AVI:
 		return 0;
 	default:
-		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
 	}
 
 	return 0;
 }
 
 static u32 inno_hdmi_get_frame_disable(struct inno_hdmi *hdmi,
-				       u32 frame_index)
+				       enum hdmi_infoframe_type type)
 {
 	struct drm_device *drm = hdmi->connector.dev;
 
-	switch (frame_index) {
-	case INFOFRAME_VSI:
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return v_PACKET_VSI_EN(0);
-	case INFOFRAME_AVI:
+	case HDMI_INFOFRAME_TYPE_AVI:
 		return 0;
 	default:
-		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
 	}
 
 	return 0;
 }
 
 static u32 inno_hdmi_get_frame_enable(struct inno_hdmi *hdmi,
-				      u32 frame_index)
+				      enum hdmi_infoframe_type type)
 {
 	struct drm_device *drm = hdmi->connector.dev;
 
-	switch (frame_index) {
-	case INFOFRAME_VSI:
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return v_PACKET_VSI_EN(1);
-	case INFOFRAME_AVI:
+	case HDMI_INFOFRAME_TYPE_AVI:
 		return 0;
 	default:
-		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
 	}
 
 	return 0;
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    enum hdmi_infoframe_type type)
 {
-	u32 disable = inno_hdmi_get_frame_disable(hdmi, frame_index);
-	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
+	u32 frame_index = inno_hdmi_get_frame_index(hdmi, type);
+	u32 disable = inno_hdmi_get_frame_disable(hdmi, type);
+	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
 
 	if (mask)
 		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
@@ -219,14 +238,14 @@ static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
 }
 
 static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, u32 frame_index)
+				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
 {
-	u32 enable = inno_hdmi_get_frame_enable(hdmi, frame_index);
-	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
+	u32 enable = inno_hdmi_get_frame_enable(hdmi, type);
+	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
 	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
 	ssize_t rc, i;
 
-	inno_hdmi_disable_frame(hdmi, frame_index);
+	inno_hdmi_disable_frame(hdmi, type);
 
 	rc = hdmi_infoframe_pack(frame, packed_frame,
 				 sizeof(packed_frame));
@@ -253,11 +272,11 @@ static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
 							 &hdmi->connector,
 							 mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI);
+		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_VENDOR);
 		return rc;
 	}
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI);
+	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_VENDOR);
 }
 
 static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
@@ -270,13 +289,13 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 						      &hdmi->connector,
 						      mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI);
+		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
 		return rc;
 	}
 
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI);
+	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)

-- 
2.41.0


