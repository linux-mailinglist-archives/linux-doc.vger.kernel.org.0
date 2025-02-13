Return-Path: <linux-doc+bounces-38009-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC8A34FCC
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 21:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6254F18917A5
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 20:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA5226983B;
	Thu, 13 Feb 2025 20:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C8zrCuWB"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C69326981A
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479507; cv=none; b=IrTVgL08Cd4zwaW0l+34IsN4jOHdmgc90YQ0muTvnH62SHAt4t6vAk3KAZwEOKqKWsAaV1g3mSo0XMXVncutbzs3e9bNc2NzcJu4e4gjTFZuIEpPnSw3HcetxjHXqcX8mVUoUYBheVNV26ch/BuLajWfnXNk5nzm8hO7pFGs/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479507; c=relaxed/simple;
	bh=P6MfJCrjan4Mpobi9cgpSSc8GRm8lqpmywVPdHfP/k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mt+uqBhyWJIEuCMLKH0tV61pvTm8xJUX7gBUN8Az8Nsrntjs7FRfawvfXzdkSnyu4LwMDK9NCJrvt5ZorxYg2zJIBXiOYHSjjlC7ldY/mMNtafd+nFLRRuhYIZfKKA6Wt1xkFrH451/KPAy3oLDldXArewFWfbZnhj56g2yU3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C8zrCuWB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739479504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hqLmvup2Sea4jhYwCSUfiXHD+FvkO6EEqLzTP6+H1yA=;
	b=C8zrCuWBncCrDvPV0Iz7Tnok5R7Y0XwsnwaUOaOnrpQbZpZnwfAWK/j8thflce9nts1TVL
	UCAGP1QuImXMRkXPFjMlctJsFAstninsUfG/j2gDCADUIPaCN7ROaQ49jA7V4qXSMRcCfc
	bSFT/7KGd4wE6RCbl7nkW1sazfbqT/U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-252-mbXvAAEqP_aFq8s6HZs-6A-1; Thu,
 13 Feb 2025 15:45:01 -0500
X-MC-Unique: mbXvAAEqP_aFq8s6HZs-6A-1
X-Mimecast-MFC-AGG-ID: mbXvAAEqP_aFq8s6HZs-6A_1739479499
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBA7D1800264;
	Thu, 13 Feb 2025 20:44:58 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 60E2519373D9;
	Thu, 13 Feb 2025 20:44:54 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:21 -0500
Subject: [PATCH 04/20] drm/panel/boe-bf060y8m-aj0: Move to using
 mipi_dsi_*_multi() variants
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-4-67d94ff319cc@redhat.com>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
In-Reply-To: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=5700;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=P6MfJCrjan4Mpobi9cgpSSc8GRm8lqpmywVPdHfP/k4=;
 b=jfsWVg+meYNnRXC6Q5l0AYbwxuYDFhSrg5Pg7GcD8A4Mq7EKVgCzoLzZ2jVAlNkoQNq9WZM1P
 CH9a+z3f5sWCr+fNN1PRR934zhidcP51S9AXiurl/TKXvJQtcp9CzAJ
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Stop using deprecated API.
Used Coccinelle to make the change.

@rule_3@
identifier dsi_var;
identifier r;
identifier func;
type t;
position p;
expression dsi_device;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
(
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_set_display_off(dsi_var)@p;
+mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
|
.....//rest of the mipi APIs with _multi variant
)
<+...
-if(r < 0) {
-...
-}
...+>
}

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 75 +++++++++++---------------
 1 file changed, 30 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bbed27920107458d01efd9cf4986df..8903a6c889794330fa1f54a30e779c7d5fbc4b14 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -55,42 +55,34 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
 static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 {
 	struct mipi_dsi_device *dsi = boe->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
-	mipi_dsi_dcs_write_seq(dsi, 0xf8,
-			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x00, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
+				     DCS_ALLOW_HBM_RANGE);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00, 0x08, 0x10, 0x00,
+				     0x22, 0x00, 0x00, 0x2d);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	msleep(30);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc0,
-			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
-			       0x2a, 0x31, 0x39, 0x20, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
-			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
-			       0x5c, 0x5c, 0x5c);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x08, 0x48, 0x65, 0x33,
+				     0x33, 0x33, 0x2a, 0x31, 0x39, 0x20, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x00, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x20, 0x04, 0x10, 0x12,
+				     0x92, 0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83,
+				     0x83, 0x5c, 0x5c, 0x5c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x01, 0x2c, 0x00, 0x77,
+				     0x3e);
 
 	msleep(30);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 	msleep(50);
 
 	return 0;
@@ -99,24 +91,18 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 static int boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
 {
 	struct mipi_dsi_device *dsi = boe->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* OFF commands sent in HS mode */
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+
 	msleep(20);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
 	usleep_range(1000, 2000);
+
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
 	return 0;
@@ -233,12 +219,10 @@ static const struct drm_panel_funcs boe_bf060y8m_aj0_panel_funcs = {
 static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	u16 brightness = backlight_get_brightness(bl);
-	int ret;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);
 
 	return 0;
 }
@@ -246,6 +230,7 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
 static int boe_bf060y8m_aj0_bl_get_brightness(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
+
 	u16 brightness;
 	int ret;
 

-- 
2.47.0


