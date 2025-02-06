Return-Path: <linux-doc+bounces-37255-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F204CA2B3E0
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 22:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CE04163749
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 21:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651311E0090;
	Thu,  6 Feb 2025 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NwADOCWT"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011E1E009F
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 21:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876020; cv=none; b=hTQDnjHCWCAb20MjS87LXM+gCxfa9CJbLzYCY45dsRDTrV0AXwstHbmN2S5+4gx+H1t+ta5ENwFysROlkqYTrL1f7wEf1IKbdrDzUc7mCNCQXBwVpN5OQ/8H4L9tLAbXRoEObeQHskPd0u7V15rfzAfJHf/s0OQdxGkX9fkwuzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876020; c=relaxed/simple;
	bh=rcOYFwPQfRAU3APR4rkecMHa1pO4ou4ZbBf2oyKESIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QN1juBm2JwFYpL+sMfzAVaNXhuRM/2FscJp+aF3fAGuDfOdc0vCoIVPaXHtZWeeKDTs+3jECQAkfqZGaERbAweHVafxAPFuwHFzFWV3FkAWx3yyyiq4OOm2Zya5NrGNGYunACtrYaq8X+gAYnSYqar1BuS0IDWqVi1C1QyLrBSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NwADOCWT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738876017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YQoTigHQbJ4dwxfyMraLqszMcvvsitMtJlyCloWmRnA=;
	b=NwADOCWTLmm0pCTHCqW06swsKj6OAqhAwXzS6XGH8HoFlW9gy+N+r1FIzcpTv7IxClbF1X
	XfxOQNi3WqAVBlyx0dPEKW7gvGk4ODeOJMs39KhojJcLUd32LG+PvXC7lfw06ODAJAcUVW
	+8743VneYFWbZ30WVATiZYJ8n+/G/z0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-k167-e6hOXOtfJodOr5g-g-1; Thu,
 06 Feb 2025 16:06:53 -0500
X-MC-Unique: k167-e6hOXOtfJodOr5g-g-1
X-Mimecast-MFC-AGG-ID: k167-e6hOXOtfJodOr5g-g
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DC931800570;
	Thu,  6 Feb 2025 21:06:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 780401800115;
	Thu,  6 Feb 2025 21:06:48 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:05 -0500
Subject: [PATCH 10/14] drm/panel/visionox-r66451: Move to using
 mipi_dsi_dcs_write_seq_multi()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-10-4ff0c69e8897@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=7735;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rcOYFwPQfRAU3APR4rkecMHa1pO4ou4ZbBf2oyKESIE=;
 b=MmkBMjrJLfMjU8/wLsKce4/Wu4NTom9lY/7/LH5o4cOdJB715yEiqxROo7IENzbBP9JkRQplk
 Rtw7VotWtLeA2rEpI0p/Nvv/OZV8JIuexLK9Zb/s34QzfnwlPtpptHo
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
 drivers/gpu/drm/panel/panel-visionox-r66451.c | 118 ++++++++++++++------------
 1 file changed, 62 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
index 493f2a6076f8d878606e0644b100bc98f275dc12..0194c63f5482d1a816b0d3b4e0152c328f8e056b 100644
--- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
+++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
@@ -42,65 +42,71 @@ static void visionox_r66451_reset(struct visionox_r66451 *ctx)
 static int visionox_r66451_on(struct visionox_r66451 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc2,
-			       0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
-			       0x09, 0x3c);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7,
-			       0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
-			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
-			       0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xde,
-			       0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18,
-			       0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc4,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
-	mipi_dsi_dcs_write_seq(dsi, 0xcf,
-			       0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
-			       0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
-			       0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0xd3,
-			       0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 0x07,
-			       0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
-			       0x3c, 0x9c);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7,
-			       0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
-			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
-			       0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xd8,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
-			       0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
-			       0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf,
-			       0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0x39, 0x04, 0x09, 0x34);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x09, 0x24, 0x0c, 0x00,
+				     0x00, 0x0c, 0x00, 0x00, 0x00, 0x09, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7, 0x00, 0xb9, 0x3c, 0x00,
+				     0x40, 0x04, 0x00, 0xa0, 0x0a, 0x00, 0x40,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
+				     0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x40, 0x00, 0x18, 0x00,
+				     0x18, 0x00, 0x18, 0x00, 0x18, 0x10, 0x00,
+				     0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x00, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x02, 0x00, 0x00, 0x00, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcf, 0x64, 0x0b, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x0b,
+				     0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+				     0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3, 0x45, 0x00, 0x00, 0x01,
+				     0x13, 0x15, 0x00, 0x15, 0x07, 0x0f, 0x77,
+				     0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
+				     0x3c, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7, 0x00, 0xb9, 0x34, 0x00,
+				     0x40, 0x04, 0x00, 0xa0, 0x0a, 0x00, 0x40,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
+				     0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd8, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x3a, 0x00,
+				     0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
+				     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x0a, 0x00, 0x0a, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x0a, 0x00,
+				     0x32, 0x00, 0x0a, 0x00, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42, 0x58, 0x81,
+				     0x2d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f,
+				     0x53, 0xf1, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x34, 0xb4, 0x00, 0x00,
+				     0x00, 0x39, 0x04, 0x09, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x50, 0x00, 0x00, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x01, 0x00, 0x00, 0x00,
+				     0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
 	mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
 	mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);

-- 
2.47.0


