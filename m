Return-Path: <linux-doc+bounces-43198-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E5A8A061
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 15:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23B3218836C1
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 13:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19569296D0A;
	Tue, 15 Apr 2025 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QyA+MeXU"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D72297A70;
	Tue, 15 Apr 2025 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725355; cv=none; b=abJH3BM7rL9ewqa4rJ8FTJGDqw8peJQAHfSu1F51UgqpYwx2aEt27YwlWuWHUw1EkiLK3nJAsAC4GS/onfMybcwE4cTpaddx0zeLWkB+xLA6NGHXR3aKBPTrsqHhkdIvrSJua1XCfNVQccZF6AEFWsZ5RP4yzbcVf2SaT4IVtfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725355; c=relaxed/simple;
	bh=iKOzetAfZReJAcdUlG7eolu/4x+NwgMFpiXfDMB5C4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=abufX+RYOOfBvtxBhQoBf2Sh/DvFyBIlUk9AuJGh8OLeaiahTylMCZi+cP7bDyn1hh/6yaJS7Opisu63V/YQiXVkQyImVANmE0x8VpVMmEYjumBDG164HsQtRdDaftaj2pP5f/r5qIsBBi7EKxlGzm87YMxXcaCw5icT9oib9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QyA+MeXU; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4627243B6F;
	Tue, 15 Apr 2025 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744725350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BFStFxiSNP6zsD+AVy+GK0+VsuHYEAh+UshoPL2W+PI=;
	b=QyA+MeXUWnp6pEbxl3KxBSTOmW/PF64EFp3sxeHIQg28FvjU5GmPxdKEuWkV6aWJ9jP3yQ
	jYuZ4ELlj0Q4sFAnyLBX1cmgyibhWLmxv6OLxJ+Sy6IqJAhmBkR3/eJU3Phmqbfw4Azf4a
	TaiK5KJZZeFgNlVx3qipAva/f3sbhDWsOllFjzWzAw6cL+SzlzTu+xrQhHzFCU9UWJQSsl
	NBUwpwkBgA9oNHFRd/S5vei7DFxfpYw+SnReYu0hAtFCUSwwqQj52eR2U/rMocqZCySYwB
	njKuaWqibkPLNmhSOvIioVLf/jCP0vArB2Wk2m5mbZJKCu7Sknv/p/6WpSpepw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:39 +0200
Subject: [PATCH v18 8/8] drm/vkms: Add support for DRM_FORMAT_R*
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-yuv-v18-8-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
In-Reply-To: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6382;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iKOzetAfZReJAcdUlG7eolu/4x+NwgMFpiXfDMB5C4Q=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVYv2iqDg6txz2cwAxi/bCFgY45fKWYaRKZz
 xn1pnJ1Rr+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lWAAKCRAgrS7GWxAs
 4vSPD/9MwtqczyZh/kFcUBOQLE97zHN6nmDGsazBH8w50PP3EJyXrROwLqlp/t0k3duE1ZsFCcm
 1RHaxkpuGy1SFKHB04vRay5PzGmrkhXH2jOn4WTjvVGsla6XNsVbhYyNxDFXD5/WvvzP9kzBmv1
 PFSbl6IpcW3CTYwAAjYBtNWu5rhgzICQq5IFt8cHq1stGI5YMWj+nUYjDB45SWMl1q9JM7QP4ef
 aO3q2W0U1Z8Affekm2zw63+pCo50tSfopufqkv+2mc48NJhclLJDdPAM9sjCd/XkwQZuGFQicku
 2AcuFIrQ6zul2ZcQZ4jI7fD7oXx1JHEZ+tD3UNZ6EY0P06rLT/azr/Lb6V1/czhJs8OM8driO6Z
 Tzj3lcXFY1mjWLRsj6PQWJeckdxpQ2rx8IOSGUef+Ux+/4xZazwDM3+ZPmdEF7OWHJtOf+u7YPN
 7A3+uCe6y9PwlR38M93c2oJTQNbSTZKNez2nBdO9ARL7Es0bnrFNQ9wx25PCIfiZK0bxM2rANu7
 +Ja1Xu2nTgx38hzE7wsF+u4/Vw6bNz624xKRHCKUhPC4pWud+0jLO9HQC+Qzjk/UgJJcfsVEzFe
 qg9M1icqGham9nfWNdQArUbTRNPfTs4JGwjTH6xdARQzBIorHdd+ZdGBzduO9R7vrUfWJldcBoo
 7/TeqSDQ9XsDHeA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvgfefgfehtefghfffteffgfehfeetledtvdduueeifedvtdeltdeuheejleeftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsv
 ghuphdrnhgvthdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrhgthhgvuhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-GND-Sasl: louis.chauvet@bootlin.com

This add the support for:
- R1/R2/R4/R8

R1 format was tested with [1] and [2].

[1]: https://lore.kernel.org/r/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com
[2]: https://lore.kernel.org/igt-dev/20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com/

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 110 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_plane.c   |   4 ++
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 9972780f3fa9..6d0227c6635a 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -249,6 +249,16 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
 	return out_pixel;
 }
 
+static struct pixel_argb_u16 argb_u16_from_gray8(u8 gray)
+{
+	return argb_u16_from_u8888(255, gray, gray, gray);
+}
+
+static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
+{
+	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 							    const struct conversion_matrix *matrix)
 {
@@ -286,7 +296,7 @@ EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
  * The following functions are read_line function for each pixel format supported by VKMS.
  *
  * They read a line starting at the point @x_start,@y_start following the @direction. The result
- * is stored in @out_pixel and in the format ARGB16161616.
+ * is stored in @out_pixel and in a 64 bits format, see struct pixel_argb_u16.
  *
  * These functions are very repetitive, but the innermost pixel loops must be kept inside these
  * functions for performance reasons. Some benchmarking was done in [1] where having the innermost
@@ -295,6 +305,96 @@ EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
  * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
  */
 
+static void Rx_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	int bits_per_pixel = drm_format_info_bpp(plane->frame_info->fb->format, 0);
+	u8 *src_pixels;
+	int rem_x, rem_y;
+
+	WARN_ONCE(drm_format_info_block_height(plane->frame_info->fb->format, 0) != 1,
+		  "%s() only support formats with block_h == 1", __func__);
+
+	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
+	int bit_offset = (8 - bits_per_pixel) - rem_x * bits_per_pixel;
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+	int mask = (0x1 << bits_per_pixel) - 1;
+	int lum_per_level = 0xFFFF / mask;
+
+	if (direction == READ_LEFT_TO_RIGHT || direction == READ_RIGHT_TO_LEFT) {
+		int restart_bit_offset;
+		int step_bit_offset;
+
+		if (direction == READ_LEFT_TO_RIGHT) {
+			restart_bit_offset = 8 - bits_per_pixel;
+			step_bit_offset = -bits_per_pixel;
+		} else {
+			restart_bit_offset = 0;
+			step_bit_offset = bits_per_pixel;
+		}
+
+		while (out_pixel < end) {
+			u8 val = ((*src_pixels) >> bit_offset) & mask;
+
+			*out_pixel = argb_u16_from_grayu16((int)val * lum_per_level);
+
+			bit_offset += step_bit_offset;
+			if (bit_offset < 0 || 8 <= bit_offset) {
+				bit_offset = restart_bit_offset;
+				src_pixels += step;
+			}
+			out_pixel += 1;
+		}
+	} else if (direction == READ_TOP_TO_BOTTOM || direction == READ_BOTTOM_TO_TOP) {
+		while (out_pixel < end) {
+			u8 val = (*src_pixels >> bit_offset) & mask;
+			*out_pixel = argb_u16_from_grayu16((int)val * lum_per_level);
+			src_pixels += step;
+			out_pixel += 1;
+		}
+	}
+}
+
+static void R1_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
+}
+
+static void R2_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
+}
+
+static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	Rx_read_line(plane, x_start, y_start, direction, count, out_pixel);
+}
+
+static void R8_read_line(const struct vkms_plane_state *plane, int x_start,
+			 int y_start, enum pixel_read_direction direction, int count,
+			 struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	while (out_pixel < end) {
+		*out_pixel = argb_u16_from_gray8(*src_pixels);
+		src_pixels += step;
+		out_pixel += 1;
+	}
+}
+
 static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
 			       enum pixel_read_direction direction, int count,
 			       struct pixel_argb_u16 out_pixel[])
@@ -636,6 +736,14 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
 		return &planar_yuv_read_line;
+	case DRM_FORMAT_R1:
+		return &R1_read_line;
+	case DRM_FORMAT_R2:
+		return &R2_read_line;
+	case DRM_FORMAT_R4:
+		return &R4_read_line;
+	case DRM_FORMAT_R8:
+		return &R8_read_line;
 	default:
 		/*
 		 * This is a bug in vkms_plane_atomic_check(). All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index fbfbe424e558..e3fdd161d0f0 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -31,6 +31,10 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_YVU420,
 	DRM_FORMAT_YVU422,
 	DRM_FORMAT_YVU444,
+	DRM_FORMAT_R1,
+	DRM_FORMAT_R2,
+	DRM_FORMAT_R4,
+	DRM_FORMAT_R8,
 };
 
 static struct drm_plane_state *

-- 
2.49.0


