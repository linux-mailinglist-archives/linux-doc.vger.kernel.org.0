Return-Path: <linux-doc+bounces-22064-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A307C94617E
	for <lists+linux-doc@lfdr.de>; Fri,  2 Aug 2024 18:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19383B22D3D
	for <lists+linux-doc@lfdr.de>; Fri,  2 Aug 2024 16:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20D6136357;
	Fri,  2 Aug 2024 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mMK/OXM9"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4B1A34B6;
	Fri,  2 Aug 2024 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722615018; cv=none; b=q0iO3nlhz0ulIVxUwshvdrITO1txRFC5EJwU/IJnkR2pZC7IY2OlzS7jVXjKmZ/Ox/hvtxRplItSX7LXyZ0LnQ34hH81V78Rs8IE4vfDwFSzH00sZqJaloRWh6WX9UFcnBjaTmbXqUI3XzS7B7DwLZa+RXHuDIJ/H8aTmXu/KMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722615018; c=relaxed/simple;
	bh=ACEYIpiVhjCctbnptnIAm7lDmz/vZ/QLXwJmmYgbBUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTtvVo4FxfGgIhVn82tfPmnnDBQZI4iqWtuQdXhJGUEmEqaHtgxY5zOmLoGBsAMnx56dmpXPDsaztuo+hpbY0JYe3ExmehcEM3nFsWPALcM/sddyjeZdDmUr4cQZRKvTZ471PLGmJOyhj++Ygvf8YOEiPC/SUHtTtoTOMnHLcFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mMK/OXM9; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C6511C0009;
	Fri,  2 Aug 2024 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722615008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oatrO+Zn6Z2g1+VEXJDjEAV1HZntZ06AW3bzksnypl8=;
	b=mMK/OXM90OzJ7AjY1Y16keAS3F3m74FooeQVr2My6KGaP4qQ0GIUkDsy2ACwh/N6lG/Bj2
	KRrBEQ8Yd6/0MN40sm24UhRy3Lsv71Y507PFBxxwcTOvlRVMJrDV4DCW/KoHspkHtX023y
	qxtywoAQov8I2A+N08l0iryOExYow+gF0AFW1GwZj85C6Lf2YEURY1TjuG7l1pG6979ki7
	BGEkHhN5G92MtYQ2B9KenxQgs8G7Vt+qy/U99t3Qeca/U7EdbeGBilPVUt5aw5dZ+/Hq7K
	epxOSJRCUKGnTpWJ4wvt3AryXqNnW/GbL6WNmY6osqvksxI+U1D+g+ieptxENw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 02 Aug 2024 18:09:47 +0200
Subject: [PATCH v9 02/17] drm/vkms: Use drm_frame directly
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240802-yuv-v9-2-08a706669e16@bootlin.com>
References: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
In-Reply-To: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4272;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Y21h1r1y+wrDzu5ZKkrZxUMErBBuFIpVTlThoHiWIEY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmrQTZtxqXd1aFlTAMANKDchc7GjYoVD5e/gW3s
 9aF0k9wyS+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZq0E2QAKCRAgrS7GWxAs
 4lNPEACivceb46OE5QCVmJRiuzBar7GvGjQWkQu5aS+YNicJw/8yaK+UUyW0fwFeRhbgSbK/lqu
 bUUGNeaga1vccMxXpuRn5wYyMpLlMNMgCiRsawfyHSa5Wmsd9C1k2K7SbdPCDDAvArB7a6sEfNY
 ojATgCsQBBzZ07u1sByuFqiEya2kJgD469ppGwRry/VkBSPg71aKBgMgKrrVGn97PH3dFN0y9UF
 5QI5wG6l43MOT2YDtfmR6RTLMbtQWwmRdSjzzpBXB/09w3kzySzsvmfBxtjYAeqpgwvezzEsRv2
 D1BokWCCTO1YH3WSXKlkxqixADqdNp3YKw9bNchij1pZQ2wZcofVbtPMAlKdwjZcD6RlEYBNbbM
 rexQjd87gMP69ZB/fyU98Xg/ZRTs2XzPF0NNLLVBttxaDmDy0fdzUtvzF8dJfvyAytyj+oEnNNi
 OsGLQi8lf9NnoulWWhZTVkTq8nsbj+TG+/is5OkdTe6EHr5gHYRIGUm9WUe6Uovg1z+stFsNPNf
 3LKJirJlfadU7m+y4kfv0fzlL/xMuWlTOlITqrgO/hXs+w143oL6aisF9+c0KWFtLEMXmwE6DkL
 13RgesY3H3ofQtqSe0aip8WmUg6uO4bsQyc68IHUDeJcfD/1QhD2i31LzhTnwpqa93rfZ8V4ZJv
 rgaNe8jbaY1irYQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

From: Arthur Grillo <arthurgrillo@riseup.net>

Remove intermidiary variables and access the variables directly from
drm_frame. These changes should be noop.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
[Louis Chauvet: Applied review from Maíra]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       |  3 ---
 drivers/gpu/drm/vkms/vkms_formats.c   | 11 ++++++-----
 drivers/gpu/drm/vkms/vkms_plane.c     |  3 ---
 drivers/gpu/drm/vkms/vkms_writeback.c |  5 -----
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5e46ea5b96dc..8ac320564334 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -31,9 +31,6 @@ struct vkms_frame_info {
 	struct drm_rect rotated;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int rotation;
-	unsigned int offset;
-	unsigned int pitch;
-	unsigned int cpp;
 };
 
 struct pixel_argb_u16 {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 36046b12f296..d597c48452ac 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -11,8 +11,9 @@
 
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
-	return frame_info->offset + (y * frame_info->pitch)
-				  + (x * frame_info->cpp);
+	struct drm_framebuffer *fb = frame_info->fb;
+
+	return fb->offsets[0] + (y * fb->pitches[0]) + (x * fb->format->cpp[0]);
 }
 
 /*
@@ -131,12 +132,12 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	u8 *src_pixels = get_packed_src_addr(frame_info, y);
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 
-	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp) {
+	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
 		int x_pos = get_x_position(frame_info, limit, x);
 
 		if (drm_rotation_90_or_270(frame_info->rotation))
 			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
-				+ frame_info->cpp * y;
+				+ frame_info->fb->format->cpp[0] * y;
 
 		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
 	}
@@ -223,7 +224,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
 
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->cpp)
+	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->fb->format->cpp[0])
 		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 5a8d295e65f2..21b5adfb44aa 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -125,9 +125,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
 			drm_rect_height(&frame_info->rotated), frame_info->rotation);
 
-	frame_info->offset = fb->offsets[0];
-	frame_info->pitch = fb->pitches[0];
-	frame_info->cpp = fb->format->cpp[0];
 	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index bc724cbd5e3a..c8582df1f739 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -149,11 +149,6 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
-
-	wb_frame_info->offset = fb->offsets[0];
-	wb_frame_info->pitch = fb->pitches[0];
-	wb_frame_info->cpp = fb->format->cpp[0];
-
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->pixel_write = get_pixel_write_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);

-- 
2.44.2


