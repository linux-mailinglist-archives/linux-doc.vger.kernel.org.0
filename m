Return-Path: <linux-doc+bounces-1495-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD27DD2EA
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 17:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51374B20DE6
	for <lists+linux-doc@lfdr.de>; Tue, 31 Oct 2023 16:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964C01DFCC;
	Tue, 31 Oct 2023 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiN72kjx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B781D69C;
	Tue, 31 Oct 2023 16:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF742C433C8;
	Tue, 31 Oct 2023 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698770994;
	bh=a4BpgPVlN4us8i8ZAKm55WYfRM8D4UzuiG9jC3POA78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aiN72kjxTIgwlSdP1Zseysb9S37svfxeQOijJA7ibJ6UyCQtF+TRHDtXe0+NDcZTJ
	 yUk9k1Eqbl4ryka7NNjrFxJTINiwEN3CPNXL9C/u6HvYbv47tChXlF0to19Cv8R2XH
	 txLVOlG/zDo2BPLiBe03o3uCEVkBCvSPUahlibuT7QlSrco3VaHy/viF5stetmvCS1
	 VQa9weYPiaOUdC/S9fliDupi/fafoPbHZfKdhlWHi0AK4Fhw291LM0ahl4QQ8ZkLRR
	 jVeRq/U2tZvfUzTilLMh4OyQXxEb0iMfRFMadQ+Xf6GSlTN5RIOjvrYLiLctsVP4E0
	 RFUmHSn9bAkIw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:41 +0100
Subject: [PATCH RFC v3 28/37] drm/rockchip: inno_hdmi: Move infoframe
 disable to separate function
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-28-328b0fae43a7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525; i=mripard@kernel.org;
 h=from:subject:message-id; bh=a4BpgPVlN4us8i8ZAKm55WYfRM8D4UzuiG9jC3POA78=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+vfXnXhjqpxsenDCwwptZptVS/4rFl85PW/xofzaM
 LXrZgd+dpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiNQsZGRY7dHb/3d/IsZJn
 h1LNQbP/949bfforrvHK57nM2wl68wMZfrP3B5tIfW675Kq5lWtP6V+3X0lcSnsOtfS3OQSUhAv
 sYgYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The code to upload infoframes to the controller uses a weird construct
which, based on the previous function call return code, will either
disable or enable that infoframe.

In order to get rid of that argument, let's split the function to
disable the infoframe into a separate function and make it obvious what
we are doing in the error path.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 53 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 59b2b676b7b8..e3a421d98dd4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -156,33 +156,38 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
-				  union hdmi_infoframe *frame, u32 frame_index,
-				  u32 mask, u32 disable, u32 enable)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    u32 frame_index,
+				    u32 mask, u32 disable)
 {
 	if (mask)
 		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
+}
 
-	if (setup_rc >= 0) {
-		u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-		ssize_t rc, i;
+static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
+				  union hdmi_infoframe *frame, u32 frame_index,
+				  u32 mask, u32 disable, u32 enable)
+{
+	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
+	ssize_t rc, i;
 
-		rc = hdmi_infoframe_pack(frame, packed_frame,
-					 sizeof(packed_frame));
-		if (rc < 0)
-			return rc;
+	inno_hdmi_disable_frame(hdmi, frame_index, mask, disable);
 
-		for (i = 0; i < rc; i++)
-			hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
-				    packed_frame[i]);
+	rc = hdmi_infoframe_pack(frame, packed_frame,
+				 sizeof(packed_frame));
+	if (rc < 0)
+		return rc;
 
-		if (mask)
-			hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
-	}
+	for (i = 0; i < rc; i++)
+		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
+			    packed_frame[i]);
 
-	return setup_rc;
+	if (mask)
+		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
+
+	return 0;
 }
 
 static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
@@ -194,8 +199,13 @@ static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_vendor_infoframe_from_display_mode(&frame.vendor.hdmi,
 							 &hdmi->connector,
 							 mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI,
+					m_PACKET_VSI_EN, v_PACKET_VSI_EN(0));
+		return rc;
+	}
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_VSI,
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI,
 		m_PACKET_VSI_EN, v_PACKET_VSI_EN(0), v_PACKET_VSI_EN(1));
 }
 
@@ -208,9 +218,14 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 						      &hdmi->connector,
 						      mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI, 0, 0);
+		return rc;
+	}
+
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI, 0, 0, 0);
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI, 0, 0, 0);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)

-- 
2.41.0


