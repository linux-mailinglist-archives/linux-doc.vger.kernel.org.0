Return-Path: <linux-doc+bounces-38015-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5803AA34FD1
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 21:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09CE1888FBC
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 20:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE44269807;
	Thu, 13 Feb 2025 20:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BNu3gi30"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B832661AC
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 20:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479527; cv=none; b=BPjwiWQ4hDS7EfB2XsU/hYvRNaBlCz50vQ4A4L093RyPAjiV0bradV78vxD7PflMViA692gHnNrwPIBIyJbygmNdw6/uSZQIWEa5CIrGK2Hd6bI73qN2b/vV6Qcp3lFanrEt/UlKzVUoxxE/MtdGB/C3zpIiMSv2v7viATnQd+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479527; c=relaxed/simple;
	bh=YVnKv7P3SUbw4bNZwHLVNWFwRROtVegbCdxCq54aHYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0jXLMBLQyyv0m5vlK3JWu3/ktviB1SP4jy4kIhktuDeivvRX0jViVGlA2fuE5YefL5NAJ5BTDg+dhsGsLJ/JpA511cbtXH0QyFkuLbgj63zVKoA8k1rtI+0iRZVPwlswMuhTMoqD760P0PWoSlFwWBpUcKInJy8iygt31pRaAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BNu3gi30; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739479524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6GCPcEGJeCWftND3V2gkT0st58A+Xn2QYm2CZoqiCo=;
	b=BNu3gi30i1RWWXUMbAP4aRDNwebfknRfWjb/aQHTuaGG9EJP9b1wdWGfLs83k+oqda3y+x
	FslMufqgKbZb3kLfhOc/lVEeTGP5tKsqd3EVa9TIajUAuU1JxiPVTflPaiVc8Z3uGdP9l8
	BqWjpD+rjCpG/lFqrEekBlg1m7VyZlM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-7z8RvOnQNDeAd_9ndwHB3w-1; Thu,
 13 Feb 2025 15:45:23 -0500
X-MC-Unique: 7z8RvOnQNDeAd_9ndwHB3w-1
X-Mimecast-MFC-AGG-ID: 7z8RvOnQNDeAd_9ndwHB3w
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AAC51800878;
	Thu, 13 Feb 2025 20:45:21 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DB05819373D9;
	Thu, 13 Feb 2025 20:45:17 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:27 -0500
Subject: [PATCH 10/20] drm/panel/jdi-lt070me05000: Move to using
 mipi_dsi_*_multi() variants
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-10-67d94ff319cc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=5573;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=YVnKv7P3SUbw4bNZwHLVNWFwRROtVegbCdxCq54aHYE=;
 b=fdE0kRRKI/LvRq5N0CJWwbh8Li1YIammtmPOzedaPuKxZxlUvyO3ibO6ZBQEfP0ux77u2RrRm
 4ZUOg/B3EDzDQ40wyDQ/LXX86SsOCypeVLGvAMMYTWqW/lgckNPX551
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
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 81 +++++++-------------------
 1 file changed, 21 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index b1ce186de2616be03fa9f94d0e0724141e9dcbac..86bcd472875b422c7edefe9954dd0f769bcda5b9 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -48,34 +48,22 @@ static inline struct jdi_panel *to_jdi_panel(struct drm_panel *panel)
 static int jdi_panel_init(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &jdi->dsi->dev;
 	int ret;
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_soft_reset(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
 
 	usleep_range(10000, 20000);
 
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT << 4);
-	if (ret < 0) {
-		dev_err(dev, "failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, jdi->mode->hdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set column address: %d\n", ret);
-		return ret;
-	}
-
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, jdi->mode->vdisplay - 1);
-	if (ret < 0) {
-		dev_err(dev, "failed to set page address: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,
+					    MIPI_DCS_PIXEL_FMT_24BIT << 4);
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0,
+					      jdi->mode->hdisplay - 1);
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0,
+					    jdi->mode->vdisplay - 1);
 
 	/*
 	 * BIT(5) BCTRL = 1 Backlight Control Block On, Brightness registers
@@ -98,39 +86,21 @@ static int jdi_panel_init(struct jdi_panel *jdi)
 		return ret;
 	}
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	msleep(120);
 
-	ret = mipi_dsi_generic_write(dsi, (u8[]){0xB0, 0x00}, 2);
-	if (ret < 0) {
-		dev_err(dev, "failed to set mcap: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB0, 0x00}, 2);
 
 	mdelay(10);
 
 	/* Interface setting, video mode */
-	ret = mipi_dsi_generic_write(dsi, (u8[])
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[])
 				     {0xB3, 0x26, 0x08, 0x00, 0x20, 0x00}, 6);
-	if (ret < 0) {
-		dev_err(dev, "failed to set display interface setting: %d\n"
-			, ret);
-		return ret;
-	}
 
 	mdelay(20);
 
-	ret = mipi_dsi_generic_write(dsi, (u8[]){0xB0, 0x03}, 2);
-	if (ret < 0) {
-		dev_err(dev, "failed to set default values for mcap: %d\n"
-			, ret);
-		return ret;
-	}
+	mipi_dsi_generic_write_multi(&dsi_ctx, (u8[]){0xB0, 0x03}, 2);
 
 	return 0;
 }
@@ -138,33 +108,25 @@ static int jdi_panel_init(struct jdi_panel *jdi)
 static int jdi_panel_on(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
-	struct device *dev = &jdi->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display on: %d\n", ret);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return ret;
+	return 0;
 }
 
 static void jdi_panel_off(struct jdi_panel *jdi)
 {
 	struct mipi_dsi_device *dsi = jdi->dsi;
-	struct device *dev = &jdi->dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	msleep(100);
 }
@@ -317,13 +279,12 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
 static int dsi_dcs_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,
+						  bl->props.brightness);
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 

-- 
2.47.0


