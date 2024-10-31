Return-Path: <linux-doc+bounces-29471-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 046199B823C
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 19:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B765C283586
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 18:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BD71CB512;
	Thu, 31 Oct 2024 18:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DmRPKB6H"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D3C1C463F;
	Thu, 31 Oct 2024 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730397985; cv=none; b=LLsV0empd1eNISs/y8/w5ksrmhAXBKHGPY03eFDNn74d2LQkfL3zpSPtp2m0+D2+yXDINnBe/TW7ePUKZMzlJGe7usLftNK60Jb7Gnk70fqozhe4QTOb23FqzP7DzTAg1HkIOz7OnG91LnDyXBTAaO8/erKfYybr0K5PeTAE9X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730397985; c=relaxed/simple;
	bh=6P9xgPCLCn1gF47vP1Q/qpB7fXcZkuf7C7x8fmcRBzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FeO5fC/RQhv9h8FlW0KMNPb9whmYM/zfCGk49rURoGykxb1n2zMdtfB169iRpGMzlJueeCz0dZjDfuzRhKalAZhHgsNVm1xITrOv2Ufs68C2fKhXlrSh0nExWk6KvsoldA3GgB+cUSh+kh8OUAQe/7CyvsNo8tcAgAJc4+zL15s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DmRPKB6H; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D27A120011;
	Thu, 31 Oct 2024 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730397979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o4Wn/46pVuuaTENAL8EOOI2/SmJ1WAof8XzHSYEsemM=;
	b=DmRPKB6HIga9I8eQcU5I/3LLbAxC+8brWGgG/Od8P/wMszB6O9g57flE58ZYpsRBnca+ZY
	INy78ekCs1Keli9uH78rZxhAUsXa1sKJfuBLuWs1VlkBWePEMNDWUsMNxeWYzGfp94+IAS
	rn9Uep0ADNWxLYVuXsB/UUmwxZOYseu+YPdVz7jDs/CxSd/sRzI+ar8DgDlx6QHelfW5zF
	vYs7pP3KT09G+WwZf/3b5SBg92zfCNPqwqBkgBl6alwOpdbrpz+TXwpaxNX0+1bB66wGA5
	SPBK3raoKRKec+z3VRrQSEyYcK+QDjSCVUZWqx7REMEi1eiAtN9lypSSG5A4+g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 31 Oct 2024 19:06:07 +0100
Subject: [PATCH v13 7/7] drm/vkms: Add support for DRM_FORMAT_R*
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-yuv-v13-7-c67a337301ae@bootlin.com>
References: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
In-Reply-To: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 20241031-yuv-v13-0-bd5463126faa@bootlin.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6382;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6P9xgPCLCn1gF47vP1Q/qpB7fXcZkuf7C7x8fmcRBzQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8cP4dvN76fN6xEFIWCu8xg/bjkbtaiO2qslL
 lpHgNXjWiCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPHDwAKCRAgrS7GWxAs
 4pCTEAC65VaSi2wZd6K8QhpGEv+Pen4ly3ebwzJm8y8X7GyJlYkdgTshvbR6/THXmc9enl0BflT
 J0sLGrSA6WnFZgEuxfcPUzXYTxBdyjFvH3YCbYa+0EF5brYP+/ZYxivgn22P3Z/DCRkB3RHSTaF
 lkIzeCkoNiKMXcfEarPf8XlYgqQ3ieAj0xaS7DiqliGOUXj5thq++1hIYZ42kjzlFrnASVJQMlW
 RUvvSscwFJ4VeyjhweoQPOOv62A7SQmdRsQe0x8rt1QC6KMX0YUUuU534LXtPB86HXHLawC1cLc
 xWjasjZXUGcsdVldhjelw/pgLqluHzw8tdDKrxyEFmOOD5fm6Oi1PHDXulF9hR11Js/96oPKo7O
 G7JUX7ZJk7nFSvnml7LcblX+/20e0Wyv8wX7LhKZyXvj29hc/kqbYalUGxkG7h4befDygWfv1WQ
 rgGYDcEpUQF7WmIxgQw6hYyaLY9u4uvzGWP2T3E+YCA02Hfj/oNmu6++euii4DrplDSfpkd5hzs
 DmzOlV8HAz0O9gUTLFEr65Sw3iYzXA6UhZm6OL7Mv9TudwNQ9ZIayJrIIhVqv5cSvR5VxzzFTiI
 0h4eeiTRzMtm06SrgvKof8Mkcu9HcQV2pDh+Y5i8o95b9Z2uZzigO0JxwdbHe5qK4gOx7ZZ7lzE
 TuVdDbml2DJ2QaA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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
index 90adcc924c31..3db7fe1ae844 100644
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
@@ -606,6 +706,14 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
index 8f764a108b00..67f891e7ac58 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -30,6 +30,10 @@ static const u32 vkms_formats[] = {
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
2.46.2


