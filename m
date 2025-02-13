Return-Path: <linux-doc+bounces-38016-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49335A34FD3
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 21:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3BF416BC0D
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 20:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6D126E157;
	Thu, 13 Feb 2025 20:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbbUToxZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F526982A
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 20:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479538; cv=none; b=jG5Afq/l807KYyKYHTU7gFhGcac5AW2KYQT+R4VMwojPlJTvc/L2RTCPwjrxW9sVOpUCTUn5ls9gmwW7ObeXgCyPKqFS6+yGMSEjZ4uR3/0n55st+R2tmgTUKKqSGA+Wjekx3todCcWmxOHefZwYhmt4pdpUW9iQ+PVpmy5l0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479538; c=relaxed/simple;
	bh=ol4+Uh4RXhkCfaElnXsstFea4qbEQQd8BYJOhcttWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLgAYnEDQwnOJRHykiuDtOTo9L/MlyaHos2l1uNL2/xbc7VouOGOROJSi08eYzWD2JoRUUu2X7XRvvQsQDXYoBDLUJ+N19lRDdLF88AgIx1IMC2FeeoP0TS1cwnNKDYJ5hM4iRkQ8zMaYQRYsP/7y28syG1Lev+1E6etqQQASiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbbUToxZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739479535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PK18FIcy4oLbM6fUnLf0WUEyeX+4z0pTzvdXNwZxNJM=;
	b=UbbUToxZ0ZR6X1ZledMjxntL3y9y9dBOYIhdWWxuw7x1YhbCTViy7KOVgnQ9dONopRDZLh
	/jA94gslniPUKvLvLbhMAKujlCKW6EHJ3jp+Z62q+cdT8C1KVxDzLDoi0yCHEzxEI29hkT
	VcGX9fWdT5e0sFwvQ72ES+CSEDbkpGc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-f2NsLbtlPduq4P40vsc6nQ-1; Thu,
 13 Feb 2025 15:45:30 -0500
X-MC-Unique: f2NsLbtlPduq4P40vsc6nQ-1
X-Mimecast-MFC-AGG-ID: f2NsLbtlPduq4P40vsc6nQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B62B91800872;
	Thu, 13 Feb 2025 20:45:28 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 63CA819373D9;
	Thu, 13 Feb 2025 20:45:25 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:29 -0500
Subject: [PATCH 12/20] drm/panel/raydium-rm67191: Move to using
 mipi_dsi_*_multi() variants
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-12-67d94ff319cc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=4917;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ol4+Uh4RXhkCfaElnXsstFea4qbEQQd8BYJOhcttWCM=;
 b=avaiwEYNey5cNo1Fh8PVe8qPAb+M4hk40/vhD4E1IxHmhNEhjB8TnOEgXpVlPKw28rIjf9UCY
 fkGFuPgp4zrA6O72m5HZeGMl7TaFaBZeJMF9AJ45IX/CJ3mRsHDceMt
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
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 60 ++++++---------------------
 1 file changed, 13 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index b2029e0356358f55e7a13a32202f0e38c7f0434b..158cf165cab6064572b9234f9bf61e77f965fea5 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -311,6 +311,7 @@ static int rad_panel_enable(struct drm_panel *panel)
 {
 	struct rad_panel *rad = to_rad_panel(panel);
 	struct mipi_dsi_device *dsi = rad->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int color_format = color_format_from_dsi_format(dsi->format);
 	int ret;
@@ -329,11 +330,7 @@ static int rad_panel_enable(struct drm_panel *panel)
 		goto fail;
 
 	/* Software reset */
-	ret = mipi_dsi_dcs_soft_reset(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
 
 	usleep_range(15000, 17000);
 
@@ -344,38 +341,17 @@ static int rad_panel_enable(struct drm_panel *panel)
 		goto fail;
 	}
 	/* Set tear ON */
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear ON (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	/* Set tear scanline */
-	ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0x380);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear scanline (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx, 0x380);
 	/* Set pixel format */
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, color_format);
-	dev_dbg(dev, "Interface color format set to 0x%x\n", color_format);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, color_format);
 	/* Exit sleep mode */
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	usleep_range(5000, 7000);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display ON (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	backlight_enable(rad->backlight);
 
@@ -391,8 +367,7 @@ static int rad_panel_disable(struct drm_panel *panel)
 {
 	struct rad_panel *rad = to_rad_panel(panel);
 	struct mipi_dsi_device *dsi = rad->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
@@ -400,19 +375,11 @@ static int rad_panel_disable(struct drm_panel *panel)
 
 	usleep_range(10000, 12000);
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display OFF (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	usleep_range(5000, 10000);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	return 0;
 }
@@ -468,17 +435,16 @@ static int rad_bl_get_brightness(struct backlight_device *bl)
 static int rad_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct rad_panel *rad = mipi_dsi_get_drvdata(dsi);
-	int ret = 0;
 
 	if (!rad->prepared)
 		return 0;
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,
+						  bl->props.brightness);
 
 	return 0;
 }

-- 
2.47.0


