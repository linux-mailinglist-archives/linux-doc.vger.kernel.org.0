Return-Path: <linux-doc+bounces-23116-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAFE955BA9
	for <lists+linux-doc@lfdr.de>; Sun, 18 Aug 2024 08:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF7F6B20DD9
	for <lists+linux-doc@lfdr.de>; Sun, 18 Aug 2024 06:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284C112B8B;
	Sun, 18 Aug 2024 06:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="NS9c4Pls"
X-Original-To: linux-doc@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034112B63;
	Sun, 18 Aug 2024 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723964288; cv=none; b=ZlxJXTN8lwBwRjsASRODBorS0Kd74Hb1cqvGGAjhet21jeYQjBTOWMlpjdq9ItA3YG4AwQj8xCelxYOA9XsoIJV2vQlQKbus81N6z2VhSUxYTEhAB3qoJ7HsT5RenE6sPTQtjdfiAqRA7BO2Rdb4Gig70demhmWPRJHzp8VOU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723964288; c=relaxed/simple;
	bh=Q+CWVM1eWnfL/atd6pTcZYYzfcoTGsOu2mcBkfKzYg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OV7YUdw3F7a2adqp7h6aqR1GZxq+XxcPTSkxyJdLhsX8QbvFCa4WhMGLlfEYG+1l1PvauUwr+6aEndvr+y4HHzK80/6KfHYcBMYaQAWbz5ZGFmNTEk4gjEGzey1M8P3SVl3UHaYXUQu72KmxxipLrHMzHKA/k27iUFrTNbyKzMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=NS9c4Pls; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723964282;
	bh=Q+CWVM1eWnfL/atd6pTcZYYzfcoTGsOu2mcBkfKzYg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NS9c4Plso9foostRPNCT7hRHGrLsb19jl9Jo5XxvGopgy5utCTH59Tioo8Js4D/pz
	 oK8DFBhRPSHCjwmAisYaunM5uP930ZhUVFJPF5mh9U+JIBluFUxO71QI0+mfGQxNoK
	 lkSF8XPmoPYXyLjIbZXvhoZs9MUtLOPK8vY97gbU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 08:56:40 +0200
Subject: [PATCH v5 4/4] drm: panel-backlight-quirks: Add Framework 13
 glossy and 2.8k panels
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240818-amdgpu-min-backlight-quirk-v5-4-b6c0ead0c73d@weissschuh.net>
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
In-Reply-To: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723964281; l=1323;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=JArR9JICCmn0YbpAXfNY1dO1o7oSdk/p0an/HUTd+vk=;
 b=Rrxx/lWLRCElyhM3NLXM7Y1RbYccBezq6Ebt7sXZz5G+WufPs5/MF7dgAWgsUguCrcZKjBFVz
 V3iYs09bJepALcAYk6jzF35zPK77j8qthmKA39/9UhPZJsS8zlFgbn+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

From: "Dustin L. Howett" <dustin@howett.net>

I have tested these panels on the Framework Laptop 13 AMD with firmware
revision 3.05 (latest at time of submission).

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index f2aefff618dd..c477d98ade2b 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -25,6 +25,22 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.name = "NE135FBM-N41",
 		.min_brightness = 0,
 	},
+	/* 13 inch glossy panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x095f),
+		.ident.name = "NE135FBM-N41",
+		.min_brightness = 0,
+	},
+	/* 13 inch 2.8k panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0cb4),
+		.ident.name = "NE135A1M-NY1",
+		.min_brightness = 0,
+	},
 };
 
 static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,

-- 
2.46.0


