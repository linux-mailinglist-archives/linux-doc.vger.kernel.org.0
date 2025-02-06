Return-Path: <linux-doc+bounces-37252-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A75A2B3D0
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 22:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B539188A128
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 21:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45C91DF985;
	Thu,  6 Feb 2025 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ec5b+82w"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452011DF96F
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876009; cv=none; b=LhSBETH1EJtAVmqBf3K6pHQiJlOYSgwpVAkucUtbwrzHujQulNUYIZecWG+cUdrHS6Du1r9uqDJ3Ru5+JVDNYohZWu6s+dEYEkTrkvflaay5skx9Lw43NBYyqWj6yNTCLlTL9RIs+4Heb61SjXVNDMoq9xzsnSXIjKWiy6aA9BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876009; c=relaxed/simple;
	bh=zZTz4cnnKL1DVqdQgZMn6E9y9/MOglAh/pKGJ6UQ8ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTqa+tULox+JNtIhZitTmmojkVVM2CFEakJKFMx3AhT9TXjG4NeYluO8aNGcyO318WSCtBo/e8/xFLY7KmViG1VsFDdflg4bkq+aQQdmVkDTaWalEktaOldh9I2MhmglgxWbOQruvuB6lELLWs2e64uyu8zIAwUfD7Et54aBwUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ec5b+82w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738876007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvc7nraXqLnlF2tjN41g2O2hVzEwhtL/gSMTSuMhe5s=;
	b=Ec5b+82wHmB8f4MItsJsCdkmCG3KQa6Ttr8Uxm3qbLZ4NX54hNw7E2Y2s9ll/XVkYwhfKn
	AwBZCf/oAPlWNERzS5jzC8/IejRwC8cYlsB3JuaYEOd1ubBwsP37FRTnAKRoTqN0YLFncS
	9Rki58IPBe+Dct8BvcPK2cEG2mPEsTg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-zX-neWLwOHqEWkTWGWrn7w-1; Thu,
 06 Feb 2025 16:06:43 -0500
X-MC-Unique: zX-neWLwOHqEWkTWGWrn7w-1
X-Mimecast-MFC-AGG-ID: zX-neWLwOHqEWkTWGWrn7w
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3672C195604F;
	Thu,  6 Feb 2025 21:06:41 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D434A1800570;
	Thu,  6 Feb 2025 21:06:37 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:02 -0500
Subject: [PATCH 07/14] drm/panel/samsung-sofef00: Move to using
 mipi_dsi_dcs_write_seq_multi()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-7-4ff0c69e8897@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=2532;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=zZTz4cnnKL1DVqdQgZMn6E9y9/MOglAh/pKGJ6UQ8ig=;
 b=cFkHX7WtRST0CYgQ+gRuVPoe+3Yw+Km8yIpfIlAG4EyOkBK9NmD6/YM/Sk36Egn/a27Y/K9sK
 Q2h+vIkfxCjCy07rtx+e1bpZuIMHnKH7rIdM4jHVfvuP+tXk5llBIZU
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Use mipi_dsi_dcs_write_seq_multi() instead of
mipi_dsi_dcs_write_seq()

Used Coccinelle patch to do this change:
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
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 04ce925b3d9dbd91841f4b4e4a12320eac8e03af..09663c53ec500ab66de3eaaea6e6deb09ccc0fe0 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -44,6 +44,7 @@ static void sofef00_panel_reset(struct sofef00_panel *ctx)
 static int sofef00_panel_on(struct sofef00_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -56,7 +57,7 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 	}
 	usleep_range(10000, 11000);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret < 0) {
@@ -64,13 +65,15 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
+				     0x00);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {

-- 
2.47.0


