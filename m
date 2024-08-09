Return-Path: <linux-doc+bounces-22548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DA94D5CF
	for <lists+linux-doc@lfdr.de>; Fri,  9 Aug 2024 19:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E10D1C21486
	for <lists+linux-doc@lfdr.de>; Fri,  9 Aug 2024 17:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F5216087B;
	Fri,  9 Aug 2024 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Mp2TX81t"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5D1155A4E;
	Fri,  9 Aug 2024 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723226112; cv=none; b=GPiPWnmSMgt9M/vpUVMlvSM/og6e9NzKxks3MzWyELRwxQ4VPNoPgQl+QNjVxykr242A6eJRgvgRRvMrG56KeItmlFyerIYcQ30zTZaheD2IizXyYapTJpl4EQsPrY+1jVCs6dL0YsaCmy5WsFnIh/kDE4dMPhtcdI0SEeVc7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723226112; c=relaxed/simple;
	bh=Coglc5KDB61fNCdpTTcBxrhCbSHSV9DCexT6S0NgMmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jk671O97YZzNxmG44J32ZghvUM2mJ77CD361uQIdSwIavoO2E4bl2dIIDITVN5Pa74NL7dyj383kI+mj9MkIeRnYGXAuUOruS2dJST8q0WaXsNBfSqX0/XAYtjWsgbXqOawFuS8byYxq2hWd+iVUxEJYovCwOKOK1ZgAngtFhhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Mp2TX81t; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EECD7FF80B;
	Fri,  9 Aug 2024 17:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723226108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwNyyGPGJzwr2lv/F0oPJMnqwMVYLBZfV6e+sdpTuQk=;
	b=Mp2TX81tMlyYM7jDxIbvM+tuTgpBQ2krKoMxnPSXCrbmz0C2B+DkudR04Ob239eSJGP+Gv
	bjvWH3uT1Ka+PvOEnRqmpdzG/D1tjI2YANAn6X/8zrMFlhoConeWf38/2S+vBGDK9pmw94
	ATk4kLtIYmImprHOTYdwvszUaYpocX/cRr2cTaXMovYAk1uhmf4CKxGYLaZxk35yn8ugY+
	QA2uvg65GTPLI8oHUjsNxKi4Gay19X855leivXVb5PTqStIZpTbOc+ePlI3vhL+vHouofT
	4GVAKYhzHDOfZHfolH/KDcwyj2CwdpESgoPBAu1FehQjxQ6KkzvhLMaCMl7QAA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 09 Aug 2024 19:54:50 +0200
Subject: [PATCH v10 09/16] drm/vkms: Re-introduce line-per-line composition
 algorithm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-yuv-v10-9-1a7c764166f7@bootlin.com>
References: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
In-Reply-To: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=30163;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Coglc5KDB61fNCdpTTcBxrhCbSHSV9DCexT6S0NgMmo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmtlfq0wlennsBFfkzaosDE2cC6OFtESgV3Ptx1
 iaofbdh/DCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrZX6gAKCRAgrS7GWxAs
 4hsREACdkFLraGj1QuG19+HvNe/riMjYxZicc8+JNCQj2z6L5EZ3SF86US9vh8OxHAHh4UsU0cZ
 i0Ovh9XMzm0LE8o8oyw87c1NKJcnaGcyRZVodFu0ox8UZKYucS5+bKAvuEf18pt+2nHdUWhM1wn
 RsByY5gNzPAoUCkmj5JXD2Xa6p5EZFeWZ1acDY683fqTqejbNstntQs3adTxIApkqdl+dS8uAGb
 Qbpf1L2nkKeSF73FuItL1yvlzNlxhWAG0ESfrHIaLpBlIZjR7CM82SofcO6rwmY/+fXCvi4lven
 cdWa/AB9QS7fmPv/f6xUYIho8bkjOIXmeADxkSi1Cdi5ghg6LW0Ybm+/GNecIqDrtlNVylnkOvv
 msLoi1/LfIn0giN5QncSAJwukoj1hgF39M5SaNbE+zeiOwHsYxcCYzZgotrNNQdRYM/08BoW8r/
 be+N/Cg/Dtj8fokshVryv5FygAzSIlIU0eszcYS5BHKovjD4gnUoZTcpK+a/hfqfnl+vVwH8+s4
 3f4LC9Sa8lvtqoAGX7Dov1tsZgDCAvNtiI4zrtQL5ZoKRAhhXFgZZPAUpr9ceSGS6xtEYVSWqvF
 UquDtHnqr9Ql6ooFfSQ0aHvjHBm+snsbnN5ydM/bx0cCNg5RfCVdbjFZGfZe1GL5jbKSdccW54Z
 2F1kXBu6u7zguSA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

Re-introduce a line-by-line composition algorithm for each pixel format.
This allows more performance by not requiring an indirection per pixel
read. This patch is focused on readability of the code.

Line-by-line composition was introduced by [1] but rewritten back to
pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
on performance, and it was merged.

This patch is almost a revert of [2], but in addition efforts have been
made to increase readability and maintainability of the rotation handling.
The blend function is now divided in two parts:
- Transformation of coordinates from the output referential to the source
referential
- Line conversion and blending

Most of the complexity of the rotation management is avoided by using
drm_rect_* helpers. The remaining complexity is around the clipping, to
avoid reading/writing outside source/destination buffers.

The pixel conversion is now done line-by-line, so the read_pixel_t was
replaced with read_pixel_line_t callback. This way the indirection is only
required once per line and per plane, instead of once per pixel and per
plane.

The read_line_t callbacks are very similar for most pixel format, but it
is required to avoid performance impact. Some helpers for color
conversion were introduced to avoid code repetition:
- *_to_argb_u16: perform colors conversion. They should be inlined by the
  compiler, and they are used to avoid repetition between multiple variants
  of the same format (argb/xrgb and maybe in the future for formats like
  bgr formats).

This new algorithm was tested with:
- kms_plane (for color conversions)
- kms_rotation_crc (for rotations of planes)
- kms_cursor_crc (for translations of planes)
- kms_rotation (for all rotations and formats combinations) [3]
The performance gain was mesured with kms_fb_stress [4] with some
modification to fix the writeback format.

The performance improvement is around 5 to 10%.

[1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to accept
     new formats")
     https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gmail.com/
[2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
     functionality")
     https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.com/
[3]: https://lore.kernel.org/igt-dev/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com/
[4]: https://lore.kernel.org/all/20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 234 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_drv.h      |  28 +++--
 drivers/gpu/drm/vkms/vkms_formats.c  | 224 ++++++++++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    |   5 +-
 5 files changed, 344 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4ebeaf58fa75..76d4aa8a0ef6 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -29,8 +29,8 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
  * @x_start: The start offset
  * @pixel_count: The number of pixels to blend
  *
- * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@x_start+@pixel_count in
- * output_buffer.
+ * The pixels @x_start..@x_start+@pixel_count in stage_buffer are blended at
+ * @x_start..@x_start+@pixel_count in output_buffer.
  *
  * The current DRM assumption is that pixel color values have been already
  * pre-multiplied with the alpha channel values. See more
@@ -41,7 +41,7 @@ static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
 				struct line_buffer *output_buffer, int x_start, int pixel_count)
 {
 	struct pixel_argb_u16 *out = &output_buffer->pixels[x_start];
-	const struct pixel_argb_u16 *in = stage_buffer->pixels;
+	const struct pixel_argb_u16 *in = &stage_buffer->pixels[x_start];
 
 	for (int i = 0; i < pixel_count; i++) {
 		out[i].a = (u16)0xffff;
@@ -51,33 +51,6 @@ static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
 	}
 }
 
-static int get_y_pos(struct vkms_frame_info *frame_info, int y)
-{
-	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
-		return drm_rect_height(&frame_info->rotated) - y - 1;
-
-	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
-	case DRM_MODE_ROTATE_90:
-		return frame_info->rotated.x2 - y - 1;
-	case DRM_MODE_ROTATE_270:
-		return y + frame_info->rotated.x1;
-	default:
-		return y;
-	}
-}
-
-static bool check_limit(struct vkms_frame_info *frame_info, int pos)
-{
-	if (drm_rotation_90_or_270(frame_info->rotation)) {
-		if (pos >= 0 && pos < drm_rect_width(&frame_info->rotated))
-			return true;
-	} else {
-		if (pos >= frame_info->rotated.y1 && pos < frame_info->rotated.y2)
-			return true;
-	}
-
-	return false;
-}
 
 static void fill_background(const struct pixel_argb_u16 *background_color,
 			    struct line_buffer *output_buffer)
@@ -203,6 +176,182 @@ static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
 	return READ_LEFT_TO_RIGHT;
 }
 
+/**
+ * clamp_line_coordinates() - Compute and clamp the coordinate to read and write during the blend
+ * process.
+ *
+ * @direction: direction of the reading
+ * @current_plane: current plane blended
+ * @src_line: source line of the reading. Only the top-left coordinate is used. This rectangle
+ * must be rotated and have a shape of 1*pixel_count if @direction is vertical and a shape of
+ * pixel_count*1 if @direction is horizontal.
+ * @src_x_start: x start coordinate for the line reading
+ * @src_y_start: y start coordinate for the line reading
+ * @dst_x_start: x coordinate to blend the read line
+ * @pixel_count: number of pixels to blend
+ *
+ * This function is mainly a safety net to avoid reading outside the source buffer. As the
+ * userspace should never ask to read outside the source plane, all the cases covered here should
+ * be dead code.
+ */
+static void clamp_line_coordinates(enum pixel_read_direction direction,
+				   const struct vkms_plane_state *current_plane,
+				   const struct drm_rect *src_line, int *src_x_start,
+				   int *src_y_start, int *dst_x_start, int *pixel_count)
+{
+	/* By default the start points are correct */
+	*src_x_start = src_line->x1;
+	*src_y_start = src_line->y1;
+	*dst_x_start = current_plane->frame_info->dst.x1;
+
+	/* Get the correct number of pixel to blend, it depends of the direction */
+	switch (direction) {
+	case READ_LEFT_TO_RIGHT:
+	case READ_RIGHT_TO_LEFT:
+		*pixel_count = drm_rect_width(src_line);
+		break;
+	case READ_BOTTOM_TO_TOP:
+	case READ_TOP_TO_BOTTOM:
+		*pixel_count = drm_rect_height(src_line);
+		break;
+	}
+
+	/*
+	 * Clamp the coordinates to avoid reading outside the buffer
+	 *
+	 * This is mainly a security to avoid reading outside the buffer, the userspace should
+	 * never request to read outside the source buffer.
+	 */
+	switch (direction) {
+	case READ_LEFT_TO_RIGHT:
+	case READ_RIGHT_TO_LEFT:
+		if (*src_x_start < 0) {
+			*pixel_count += *src_x_start;
+			*dst_x_start -= *src_x_start;
+			*src_x_start = 0;
+		}
+		if (*src_x_start + *pixel_count > current_plane->frame_info->fb->width)
+			*pixel_count = max(0, (int)current_plane->frame_info->fb->width -
+				*src_x_start);
+		break;
+	case READ_BOTTOM_TO_TOP:
+	case READ_TOP_TO_BOTTOM:
+		if (*src_y_start < 0) {
+			*pixel_count += *src_y_start;
+			*dst_x_start -= *src_y_start;
+			*src_y_start = 0;
+		}
+		if (*src_y_start + *pixel_count > current_plane->frame_info->fb->height)
+			*pixel_count = max(0, (int)current_plane->frame_info->fb->height -
+				*src_y_start);
+		break;
+	}
+}
+
+/**
+ * blend_line() - Blend a line from a plane to the output buffer
+ *
+ * @current_plane: current plane to work on
+ * @y: line to write in the output buffer
+ * @crtc_x_limit: width of the output buffer
+ * @stage_buffer: temporary buffer to convert the pixel line from the source buffer
+ * @output_buffer: buffer to blend the read line into.
+ */
+static void blend_line(struct vkms_plane_state *current_plane, int y,
+		       int crtc_x_limit, struct line_buffer *stage_buffer,
+		       struct line_buffer *output_buffer)
+{
+	int src_x_start, src_y_start, dst_x_start, pixel_count;
+	struct drm_rect dst_line, tmp_src, src_line;
+
+	/* Avoid rendering useless lines */
+	if (y < current_plane->frame_info->dst.y1 ||
+	    y >= current_plane->frame_info->dst.y2)
+		return;
+
+	/*
+	 * dst_line is the line to copy. The initial coordinates are inside the
+	 * destination framebuffer, and then drm_rect_* helpers are used to
+	 * compute the correct position into the source framebuffer.
+	 */
+	dst_line = DRM_RECT_INIT(current_plane->frame_info->dst.x1, y,
+				 drm_rect_width(&current_plane->frame_info->dst),
+				 1);
+
+	drm_rect_fp_to_int(&tmp_src, &current_plane->frame_info->src);
+
+	/*
+	 * [1]: Clamping src_line to the crtc_x_limit to avoid writing outside of
+	 * the destination buffer
+	 */
+	dst_line.x1 = max_t(int, dst_line.x1, 0);
+	dst_line.x2 = min_t(int, dst_line.x2, crtc_x_limit);
+	/* The destination is completely outside of the crtc. */
+	if (dst_line.x2 <= dst_line.x1)
+		return;
+
+	src_line = dst_line;
+
+	/*
+	 * Transform the coordinate x/y from the crtc to coordinates into
+	 * coordinates for the src buffer.
+	 *
+	 * - Cancel the offset of the dst buffer.
+	 * - Invert the rotation. This assumes that
+	 *   dst = drm_rect_rotate(src, rotation) (dst and src have the
+	 *   same size, but can be rotated).
+	 * - Apply the offset of the source rectangle to the coordinate.
+	 */
+	drm_rect_translate(&src_line, -current_plane->frame_info->dst.x1,
+			   -current_plane->frame_info->dst.y1);
+	drm_rect_rotate_inv(&src_line, drm_rect_width(&tmp_src),
+			    drm_rect_height(&tmp_src),
+			    current_plane->frame_info->rotation);
+	drm_rect_translate(&src_line, tmp_src.x1, tmp_src.y1);
+
+	/* Get the correct reading direction in the source buffer. */
+
+	enum pixel_read_direction direction =
+		direction_for_rotation(current_plane->frame_info->rotation);
+
+	/* [2]: Compute and clamp the number of pixel to read */
+	clamp_line_coordinates(direction, current_plane, &src_line, &src_x_start, &src_y_start,
+			       &dst_x_start, &pixel_count);
+
+	if (pixel_count <= 0) {
+		/* Nothing to read, so avoid multiple function calls */
+		return;
+	}
+
+	/*
+	 * Modify the starting point to take in account the rotation
+	 *
+	 * src_line is the top-left corner, so when reading READ_RIGHT_TO_LEFT or
+	 * READ_BOTTOM_TO_TOP, it must be changed to the top-right/bottom-left
+	 * corner.
+	 */
+	if (direction == READ_RIGHT_TO_LEFT) {
+		// src_x_start is now the right point
+		src_x_start += pixel_count - 1;
+	} else if (direction == READ_BOTTOM_TO_TOP) {
+		// src_y_start is now the bottom point
+		src_y_start += pixel_count - 1;
+	}
+
+	/*
+	 * Perform the conversion and the blending
+	 *
+	 * Here we know that the read line (x_start, y_start, pixel_count) is
+	 * inside the source buffer [2] and we don't write outside the stage
+	 * buffer [1].
+	 */
+	current_plane->pixel_read_line(current_plane, src_x_start, src_y_start, direction,
+				       pixel_count, &stage_buffer->pixels[dst_x_start]);
+
+	pre_mul_alpha_blend(stage_buffer, output_buffer,
+			    dst_x_start, pixel_count);
+}
+
 /**
  * blend - blend the pixels from all planes and compute crc
  * @wb: The writeback frame buffer metadata
@@ -223,34 +372,25 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
-	int y_pos, x_dst, pixel_count;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
-	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
+	int crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
+	int crtc_x_limit = crtc_state->base.crtc->mode.hdisplay;
 
 	/*
 	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
 	 * complexity to avoid poor blending performance.
 	 *
-	 * The function vkms_compose_row() is used to read a line, pixel-by-pixel, into the staging
-	 * buffer.
+	 * The function pixel_read_line callback is used to read a line, using an efficient
+	 * algorithm for a specific format, into the staging buffer.
 	 */
-	for (size_t y = 0; y < crtc_y_limit; y++) {
+	for (int y = 0; y < crtc_y_limit; y++) {
 		fill_background(&background_color, output_buffer);
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			x_dst = plane[i]->frame_info->dst.x1;
-			pixel_count = min_t(int, drm_rect_width(&plane[i]->frame_info->dst),
-					    (int)stage_buffer->n_pixels);
-			y_pos = get_y_pos(plane[i]->frame_info, y);
-
-			if (!check_limit(plane[i]->frame_info, y_pos))
-				continue;
-
-			vkms_compose_row(stage_buffer, plane[i], y_pos);
-			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, pixel_count);
+			blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
 		}
 
 		apply_lut(crtc_state, output_buffer);
@@ -258,7 +398,7 @@ static void blend(struct vkms_writeback_job *wb,
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
-			vkms_writeback_row(wb, output_buffer, y_pos);
+			vkms_writeback_row(wb, output_buffer, y);
 	}
 }
 
@@ -269,7 +409,7 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
 	u32 n_active_planes = crtc_state->num_active_planes;
 
 	for (size_t i = 0; i < n_active_planes; i++)
-		if (!planes[i]->pixel_read)
+		if (!planes[i]->pixel_read_line)
 			return -1;
 
 	if (active_wb && !active_wb->pixel_write)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 857e7ce1fb9f..18d651ab0307 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -39,7 +39,6 @@
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
-	struct drm_rect rotated;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int rotation;
 };
@@ -80,26 +79,38 @@ enum pixel_read_direction {
 	READ_LEFT_TO_RIGHT
 };
 
+struct vkms_plane_state;
+
 /**
- * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
+ * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
  * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
  *
- * @in_pixel: pointer to the pixel to read
- * @out_pixel: pointer to write the converted pixel
+ * @plane: plane used as source for the pixel value
+ * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
+ * is non-negative and smaller than @plane->frame_info->fb->width.
+ * @y_start: Y (height) coordinate of the first pixel to copy. The caller must ensure that y_start
+ * is non-negative and smaller than @plane->frame_info->fb->height.
+ * @direction: direction to use for the copy, starting at @x_start/@y_start
+ * @count: number of pixels to copy
+ * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
+ * (included) to @out_pixel[@count] (excluded). The caller must ensure that out_pixel have a
+ * length of at least @count.
  */
-typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
+typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
+				  int y_start, enum pixel_read_direction direction, int count,
+				  struct pixel_argb_u16 out_pixel[]);
 
 /**
  * struct vkms_plane_state - Driver specific plane state
  * @base: base plane state
  * @frame_info: data required for composing computation
- * @pixel_read: function to read a pixel in this plane. The creator of a struct vkms_plane_state
- *	        must ensure that this pointer is valid
+ * @pixel_read_line: function to read a pixel line in this plane. The creator of a
+ *		     struct vkms_plane_state must ensure that this pointer is valid
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
-	pixel_read_t pixel_read;
+	pixel_read_line_t pixel_read_line;
 };
 
 struct vkms_plane {
@@ -203,7 +214,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
-void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index b90445270d7f..3cb154fabc2e 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -138,83 +138,51 @@ static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
 	*addr = (u8 *)frame_info->map[0].vaddr + offset;
 }
 
-static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
-				 int plane_index)
-{
-	int x_src = frame_info->src.x1 >> 16;
-	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
-	u8 *addr;
-	int rem_x, rem_y;
-
-	WARN_ONCE(drm_format_info_block_width(frame_info->fb->format, plane_index) != 1,
-		  "%s() only support formats with block_w == 1", __func__);
-	WARN_ONCE(drm_format_info_block_height(frame_info->fb->format, plane_index) != 1,
-		  "%s() only support formats with block_h == 1", __func__);
-
-	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x, &rem_y);
-
-	return addr;
-}
-
-static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
-{
-	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
-		return limit - x - 1;
-	return x;
-}
-
 /*
- * The following functions take pixel data from the buffer and convert them to the format
- * ARGB16161616 in @out_pixel.
+ * The following functions take pixel data (a, r, g, b, pixel, ...) and convert them to
+ * &struct pixel_argb_u16
  *
- * They are used in the vkms_compose_row() function to handle multiple formats.
+ * They are used in the `read_line`s functions to avoid duplicate work for some pixel formats.
  */
 
-static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static struct pixel_argb_u16 argb_u16_from_u8888(u8 a, u8 r, u8 g, u8 b)
 {
+	struct pixel_argb_u16 out_pixel;
 	/*
 	 * The 257 is the "conversion ratio". This number is obtained by the
 	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
 	 * the best color value in a pixel format with more possibilities.
 	 * A similar idea applies to others RGB color conversions.
 	 */
-	out_pixel->a = (u16)in_pixel[3] * 257;
-	out_pixel->r = (u16)in_pixel[2] * 257;
-	out_pixel->g = (u16)in_pixel[1] * 257;
-	out_pixel->b = (u16)in_pixel[0] * 257;
-}
+	out_pixel.a = (u16)a * 257;
+	out_pixel.r = (u16)r * 257;
+	out_pixel.g = (u16)g * 257;
+	out_pixel.b = (u16)b * 257;
 
-static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
-{
-	out_pixel->a = (u16)0xffff;
-	out_pixel->r = (u16)in_pixel[2] * 257;
-	out_pixel->g = (u16)in_pixel[1] * 257;
-	out_pixel->b = (u16)in_pixel[0] * 257;
+	return out_pixel;
 }
 
-static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static struct pixel_argb_u16 argb_u16_from_u16161616(u16 a, u16 r, u16 g, u16 b)
 {
-	__le16 *pixel = (__le16 *)in_pixel;
+	struct pixel_argb_u16 out_pixel;
+
+	out_pixel.a = a;
+	out_pixel.r = r;
+	out_pixel.g = g;
+	out_pixel.b = b;
 
-	out_pixel->a = le16_to_cpu(pixel[3]);
-	out_pixel->r = le16_to_cpu(pixel[2]);
-	out_pixel->g = le16_to_cpu(pixel[1]);
-	out_pixel->b = le16_to_cpu(pixel[0]);
+	return out_pixel;
 }
 
-static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static struct pixel_argb_u16 argb_u16_from_le16161616(__le16 a, __le16 r, __le16 g, __le16 b)
 {
-	__le16 *pixel = (__le16 *)in_pixel;
-
-	out_pixel->a = (u16)0xffff;
-	out_pixel->r = le16_to_cpu(pixel[2]);
-	out_pixel->g = le16_to_cpu(pixel[1]);
-	out_pixel->b = le16_to_cpu(pixel[0]);
+	return argb_u16_from_u16161616(le16_to_cpu(a), le16_to_cpu(r), le16_to_cpu(g),
+				       le16_to_cpu(b));
 }
 
-static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
+static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
 {
-	__le16 *pixel = (__le16 *)in_pixel;
+	struct pixel_argb_u16 out_pixel;
 
 	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
 	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
@@ -224,40 +192,120 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pi
 	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
 	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
 
-	out_pixel->a = (u16)0xffff;
-	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
-	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
-	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+	out_pixel.a = (u16)0xffff;
+	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
+	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
+	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
+
+	return out_pixel;
 }
 
-/**
- * vkms_compose_row - compose a single row of a plane
- * @stage_buffer: output line with the composed pixels
- * @plane: state of the plane that is being composed
- * @y: y coordinate of the row
+/*
+ * The following functions are read_line function for each pixel format supported by VKMS.
+ *
+ * They read a line starting at the point @x_start,@y_start following the @direction. The result
+ * is stored in @out_pixel and in the format ARGB16161616.
+ *
+ * These functions are very repetitive, but the innermost pixel loops must be kept inside these
+ * functions for performance reasons. Some benchmarking was done in [1] where having the innermost
+ * loop factored out of these functions showed a slowdown by a factor of three.
  *
- * This function composes a single row of a plane. It gets the source pixels
- * through the y coordinate (see get_packed_src_addr()) and goes linearly
- * through the source pixel, reading the pixels and converting it to
- * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
- * the source pixels are not traversed linearly. The source pixels are queried
- * on each iteration in order to traverse the pixels vertically.
+ * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
  */
-void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
+
+static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
+			       enum pixel_read_direction direction, int count,
+			       struct pixel_argb_u16 out_pixel[])
 {
-	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
-	struct vkms_frame_info *frame_info = plane->frame_info;
-	u8 *src_pixels = get_packed_src_addr(frame_info, y, 0);
-	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u8 *px = (u8 *)src_pixels;
+		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
+			       enum pixel_read_direction direction, int count,
+			       struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u8 *px = (u8 *)src_pixels;
+		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
+				   int y_start, enum pixel_read_direction direction, int count,
+				   struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		u16 *px = (u16 *)src_pixels;
+		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
+				   int y_start, enum pixel_read_direction direction, int count,
+				   struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
+
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
+
+	while (out_pixel < end) {
+		__le16 *px = (__le16 *)src_pixels;
+		*out_pixel = argb_u16_from_le16161616(cpu_to_le16(0xFFFF), px[2], px[1], px[0]);
+		out_pixel += 1;
+		src_pixels += step;
+	}
+}
+
+static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
+			     int y_start, enum pixel_read_direction direction, int count,
+			     struct pixel_argb_u16 out_pixel[])
+{
+	struct pixel_argb_u16 *end = out_pixel + count;
+	u8 *src_pixels;
+
+	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
 
-	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
-		int x_pos = get_x_position(frame_info, limit, x);
+	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
 
-		if (drm_rotation_90_or_270(frame_info->rotation))
-			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1, 0)
-				+ frame_info->fb->format->cpp[0] * y;
+	while (out_pixel < end) {
+		__le16 *px = (__le16 *)src_pixels;
 
-		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
+		*out_pixel = argb_u16_from_RGB565(px);
+		out_pixel += 1;
+		src_pixels += step;
 	}
 }
 
@@ -357,25 +405,25 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 }
 
 /**
- * get_pixel_conversion_function() - Retrieve the correct read_pixel function for a specific
+ * get_pixel_read_function() - Retrieve the correct read_line function for a specific
  * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
  * the pointer is valid before using it in a vkms_plane_state.
  *
  * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
  */
-pixel_read_t get_pixel_read_function(u32 format)
+pixel_read_line_t get_pixel_read_line_function(u32 format)
 {
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
-		return &ARGB8888_to_argb_u16;
+		return &ARGB8888_read_line;
 	case DRM_FORMAT_XRGB8888:
-		return &XRGB8888_to_argb_u16;
+		return &XRGB8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
-		return &ARGB16161616_to_argb_u16;
+		return &ARGB16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
-		return &XRGB16161616_to_argb_u16;
+		return &XRGB16161616_read_line;
 	case DRM_FORMAT_RGB565:
-		return &RGB565_to_argb_u16;
+		return &RGB565_read_line;
 	default:
 		/*
 		 * This is a bug in vkms_plane_atomic_check(). All the supported
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 3ecea4563254..8d2bef95ff79 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -5,7 +5,7 @@
 
 #include "vkms_drv.h"
 
-pixel_read_t get_pixel_read_function(u32 format);
+pixel_read_line_t get_pixel_read_line_function(u32 format);
 
 pixel_write_t get_pixel_write_function(u32 format);
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 10e9b23dab28..8875bed76410 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -112,7 +112,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info = vkms_plane_state->frame_info;
 	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
-	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
@@ -122,10 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 									  DRM_MODE_REFLECT_X |
 									  DRM_MODE_REFLECT_Y);
 
-	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
-			drm_rect_height(&frame_info->rotated), frame_info->rotation);
 
-	vkms_plane_state->pixel_read = get_pixel_read_function(fmt);
+	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,

-- 
2.44.2


