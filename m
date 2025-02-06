Return-Path: <linux-doc+bounces-37251-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40283A2B3CF
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 22:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20789188A442
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 21:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7F31DF970;
	Thu,  6 Feb 2025 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byqvHITT"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7F01DF74B
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876008; cv=none; b=Az7n1OkzACL05BqKqd+kYlDSjk1EgUcSI3DjRpElgirPCLK07393qK4Nxf1MyoAwiTcokXbdb980Fbdk2GC2OnXrfWopl+Fcvd3EIwlvubmcxn8wB0zZrWKstRLpNW2vd2r+Ljc8XAtXNFKxf6Amewh9lGPsu14CN4AIhQBrNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876008; c=relaxed/simple;
	bh=9CpnIlV7pjwK3l2a889dTo6xEZQ/5+5YEKIgGkmWaFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h17gPr6tj6NUY0ChtSPxghI5ouqJeSgOToRRF1gLXCE4bAoHG7YNAjpFeXoI5X3XSdh0Ho1J/ZaC/XUw/iv5Wfpjhn2iqt/87nYwOA6ZAiW3RC2aHzNscLgrbznuUCIatcgmJAzXd6jUJ/R79+0hXgJWpZ1KZ1+X8WDxtejMy2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byqvHITT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738876004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyXiRhLCxCJ7cDWiLdgm4uDG6RKwnonK4ZO/R1V2Btw=;
	b=byqvHITT0r7JfxljXpmmGePL0q9EVMR9khOBA63EAxYrSYLxD1hn2g6A6ZNXH1MqXJL7dM
	8rS0P6ShmazWHABCP4fsEdQ+T45LQ+uz2YUtfy90VQdVfUnN0tT/WyIf2+QkNLX1lH3p/L
	I27+sZnQg+UsrJ6rvP8nvaiTkqIsbWA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-cvqiUNRmNMuzKYGLCKRmaA-1; Thu,
 06 Feb 2025 16:06:41 -0500
X-MC-Unique: cvqiUNRmNMuzKYGLCKRmaA-1
X-Mimecast-MFC-AGG-ID: cvqiUNRmNMuzKYGLCKRmaA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83A8B1955D53;
	Thu,  6 Feb 2025 21:06:37 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1314B1800879;
	Thu,  6 Feb 2025 21:06:33 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:01 -0500
Subject: [PATCH 06/14] drm/panel/6e88a0-ams452ef01: Move to using
 mipi_dsi_dcs_write_seq_multi()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-6-4ff0c69e8897@redhat.com>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=3587;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=9CpnIlV7pjwK3l2a889dTo6xEZQ/5+5YEKIgGkmWaFE=;
 b=/fYjYzQjzYauYNdCdBVWNcVqUVOarIaNYxi0nI0neBfJX589v94GXX2WgchGfX0cvQx9aAb9P
 +uvEOZNw6yEBRTom6xMYagr9nd88PdeCEZXhUS8t1x5PoA8YnqX5Qk1
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Use mipi_dsi_dcs_write_seq_multi() instead of
mipi_dsi_dcs_write_seq()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier dsi_var;
expression dsi_device;
expression list es;
@@
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
...+>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   | 34 ++++++++++------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index d2df227abbea557acb849bfc76dd4b561158bf11..fde6852fe911477e4ddc333a779577fcf92bc21f 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -39,13 +39,14 @@ static void s6e88a0_ams452ef01_reset(struct s6e88a0_ams452ef01 *ctx)
 static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
-	mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c); // set Pixel Clock Divider polarity
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -55,23 +56,20 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 	msleep(120);
 
 	// set default brightness/gama
-	mipi_dsi_dcs_write_seq(dsi, 0xca,
-			       0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
-			       0x80, 0x80, 0x80,			// V203 R,G,B
-			       0x80, 0x80, 0x80,			// V151 R,G,B
-			       0x80, 0x80, 0x80,			// V87  R,G,B
-			       0x80, 0x80, 0x80,			// V51  R,G,B
-			       0x80, 0x80, 0x80,			// V35  R,G,B
-			       0x80, 0x80, 0x80,			// V23  R,G,B
-			       0x80, 0x80, 0x80,			// V11  R,G,B
-			       0x6b, 0x68, 0x71,			// V3   R,G,B
-			       0x00, 0x00, 0x00);			// V1   R,G,B
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x01, 0x00, 0x01, 0x00,
+				     0x01, 0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x6b, 0x68, 0x71, 0x00, 0x00,
+				     0x00);			// V1   R,G,B
 	// set default Amoled Off Ratio
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x40, 0x0a, 0x17, 0x00,
+				     0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x2c, 0x0b); // set default elvss voltage
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x03); // gamma/aor update
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {

-- 
2.47.0


