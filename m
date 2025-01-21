Return-Path: <linux-doc+bounces-35791-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF360A17C39
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 11:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09A2E168873
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 10:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1329F1F152B;
	Tue, 21 Jan 2025 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VlQzKOzy"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31C1F12F3;
	Tue, 21 Jan 2025 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456501; cv=none; b=nAwL45hwkGRTfvQcG2C5WE4yCOY3ENFMTP3xxoHoc2l8B8BsY4cER+QNt2ZF1u+E/6W3ZtcknAfCASGIcXb6zUC9noOiDrruB/lmnnXjvBbuAU8ErCKlAI07BNi8JCMb/Tq972w37BT1N2XcbsCI4Ioagw5BT2KBlb5aks/fqJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456501; c=relaxed/simple;
	bh=zI9PBYaXL9n8tKDCycFK0oO5/fSOH1r4rcy6X4UZ82E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6Xf5kDOoxz9+XOCHvHDyAgZuQEWh7aJhU/RfqP8MiZ9lyXvhGPP/WJVtv9XZQEW/T6M7CA2xuFD86ieuaoRafclf4VuAuGRqC/DWB5ZJK5IrEe70mia/Vs66PwNu8C/pRio9BfEefimFqhPtGidm1e8cvUwd2RqotiKSbFKhA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VlQzKOzy; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55FB3240007;
	Tue, 21 Jan 2025 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737456497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJaae2di248INTyIxrbFsGIlO3L32V5gEL21XGT13do=;
	b=VlQzKOzyrDbPxUHrXVVP+aIaFNDMnt8IfU0zmEcWf4q1cGUzbTdNPdYNBNpwLJaU+HtRWC
	0pJ7EMcwQtfr1Vulf+kagcxVzdkeYqjmIaOMZBw9sE3S0M/3OZE+A8baUburtKeV/YpEV5
	rQpc18aW3Tba2aE2nPDeVfDmz6KRHKAVEMrrSURjcb0/ZWVrNEgUJK55AbJD0qEv0FH5Qj
	WlIcmLGr3oUJeikDp7fIV58sfao94d/kdr3ep9W8GtNwVjlOSg2nFciNZtLRKakHQV56+q
	ZVKbVm2ZkCGLewnc46yogtk92mHeJxjGSiPe1OfYRGrehmTfacyh5XpSGmH0+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:48:05 +0100
Subject: [PATCH v16 4/7] drm: Export symbols to use in tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-yuv-v16-4-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
In-Reply-To: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zI9PBYaXL9n8tKDCycFK0oO5/fSOH1r4rcy6X4UZ82E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3tppTuMKoBTd270uJuoPtxkhHJ/jo5Nwk3k4
 scVkVCSARKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497aQAKCRAgrS7GWxAs
 4ixkD/4pSZYD+j+DfrMajMvsPrmSkfli7JPwCuvgySG96Bk7/RkL949aDltE7o0/sMiahOLWeVk
 GKJ4h8K/eIyjlNJ5kuo2g9Eo4he732O2lyRAM4Nyp91P61+JSYv4e87+/QK5R0yd7z4WuO0tlSm
 62DyQhb27l+JmQvdPpstknpku+ibnejDjdSXII434WaF3PceUvywyHDluOe7gKTl1eNqXLpWQwi
 h35vIEUi/4bSP1sKaWvZYhJg2nAd6h9poT6gcmkDCIrUI9kJshYLoNVUa61wjTtDjMHdovDV05s
 NTY6blbKxm6sC/GfzX1nYAw6q3mP/lCvCS8R+u3NafhR2VfAZp5cS1MltxEvFEPFD6mJo+04tR8
 /GnOBX/pFMQ1Ty6v6Jcfy2xQzF+NqarP4kka9hz7nJLiATsLUnztdcDiK65hUEUiPRay+pJOzK1
 SoNeThXwvJaHU4nrHDZlUX6w3E++RbgvFiWm+ro2R7+GVqNyZ5YZs0FPOIXSZSRD37WvtED63OY
 ESGJuF1cKAN9Eh5560tDR7EZRk9kGoYgsK0KU7hrk9t4/aApISOvsGORea4HT4lShZMm1voOYvZ
 IogqGfFbMe6BomTC3zU4PURKIvOqMHXtH4s+Yabj+ZDdsBshjg8gqLK9IP3qPQHJGqfojyt790H
 uEkV3hnmdFBn8RA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..b73a998352d175a26c69e0878da28a6288cfc8b7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
 
@@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.47.1


