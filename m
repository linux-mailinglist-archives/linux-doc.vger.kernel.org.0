Return-Path: <linux-doc+bounces-29455-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D91C9B81C3
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 18:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A421F22624
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 17:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CB51CB338;
	Thu, 31 Oct 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hwlDPPDc"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C01C9B9A;
	Thu, 31 Oct 2024 17:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730397231; cv=none; b=KZOU7C3CNu+6LB4U7ohlJEK16y7gNOzu6mmpg0cNbvWD7N4ujC80tvpjd/BIMtWoDm1XRXmoP/Hl7nknTrUMkFWsv1ZBt2Elfe2GNFRs9WzGTqBOC0bRfOBhM/TL9YHsnMqGPHgedoQqxPIZk8vTCqGUs8zmWyB1YvUA25YFqec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730397231; c=relaxed/simple;
	bh=JEfqJm+ZjNrd0HRCXf+3IpbuUc2vRJzj0Cqmn8I4SPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KV/IqkNzN7VLwP6J8a5/SpYZkboGMPwPrE8oNT1RmHl/GBtAPJ3JbEFO2IaFCtjdDhjteQMN4Z7CFx/+9md9NonkI018WJyGg44pYQqhIgxamlL/94JnwP7N/gjtAHlMnOk0JAuFskFWhwgvgFElomFEAMwvEMd6z3p78CZidYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hwlDPPDc; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5986E000B;
	Thu, 31 Oct 2024 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730397227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ep0B8W0dWDgOAnvfxKLWEqaGgJI444n/Y1F+rhWVIA=;
	b=hwlDPPDcF2F1MNZmaN1UXUpAAFW/mtR1/yP7tF60d5d7IY64t+e5lHAc92fgzNvTQJ3GXy
	WuGiDLAU3X/dnDuPmfH9H+Xrqm2MiJzx+2cIorGz8TTS7fvEg9hRHEN01v5qulvVq2uJlD
	SPjqz/KKwJtg38RH9IATb14CyCgjAXtTauXNjMYMVfexldqNS1nLAqU1KH3ueQcpmaguho
	YDEDBwFUn3UMSI9r/KTOLmD1qEH0NgS6VJ0rw4VN2TwRVnqdqGB+cJe8Ec7eV2q/a3uNHg
	5a+EnV37s8J0WWKk+sL36PW0AH2YGgxAR6gsEc/yIMj5GZ6pI+S/UHNGaagrmg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 31 Oct 2024 18:53:30 +0100
Subject: [PATCH v13 6/9] drm/vkms: Avoid computing blending limits inside
 pre_mul_alpha_blend
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-yuv-v13-6-bd5463126faa@bootlin.com>
References: <20241031-yuv-v13-0-bd5463126faa@bootlin.com>
In-Reply-To: <20241031-yuv-v13-0-bd5463126faa@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4077;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JEfqJm+ZjNrd0HRCXf+3IpbuUc2vRJzj0Cqmn8I4SPA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8Qc9L4X+UkP6vtV7DEEj7VGoPTBzxH006Of6
 MrzHzN8rsuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPEHAAKCRAgrS7GWxAs
 4gkoD/9hYLIgpFc5NFsRwmGgLWuipiY2Jx3czupymdOeapqnnKWBarM20iqmjLh7hHHVr5KMnC3
 a/8wATu1iwvlESDfDmYB/QnYJ4wnJPwic2RW/WRZIg8btUvfZwS2uJnfGZN6P0idDVSM56hX3wB
 dJNRIwipeXKFZ3fku2Y7nQ8dobOtqfOkbbRWFYqed7I12/ZQL1ixXEVi/Z3R/NyH58cYUiS9Mrh
 EreKgCqIt4fvL+jUKvpVY9JVEtHtrYxQ+hlX+y+C3j/s62YmsC1cUDQnb3nMoLGnxh1loiJBaMu
 dWchuglvAga1G4eyAGOor1IgQwlDRBV1PhhrDlkk5IQzVA+J6PZmoTRZI3WgWA6oMCWvjpDJEkj
 FUskMkS95Tfsq8sSAI2LBHYHnsvIz4ku6RPtmzzXWUNUHOZZa7qc63vFtebDwLvH14PxMVhTVsy
 Am7Oke0zKB+DDr4bHvDl8rDjLbWkLpiP92H+z6+5+EocBLNlnmcPsFulMq1ufvYEFvj/Qy73oXE
 5geifVJgwIuvcMKOMqh83bhnjtmGUg1/MRnOO4nFEbWoZfvXe1Wv2eb/ITVdetH1Bffj/QM9OKY
 HXyT8I+oShoFgD7O823nCI+34SJ4H2O1m1Vl8Ete+loIFm/aKPsTo9Z8zDZxsP9ryFLH+RNywYN
 ZNTuzUKisL7QZIw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

The pre_mul_alpha_blend is dedicated to blending, so to avoid mixing
different concepts (coordinate calculation and color management), extract
the x_limit and x_dst computation outside of this helper.
It also increases the maintainability by grouping the computation related
to coordinates in the same place: the loop in `blend`.

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 40 +++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 931e214b225c..ecac0bc858a0 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -24,34 +24,30 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 
 /**
  * pre_mul_alpha_blend - alpha blending equation
- * @frame_info: Source framebuffer's metadata
  * @stage_buffer: The line with the pixels from src_plane
  * @output_buffer: A line buffer that receives all the blends output
+ * @x_start: The start offset
+ * @pixel_count: The number of pixels to blend
  *
- * Using the information from the `frame_info`, this blends only the
- * necessary pixels from the `stage_buffer` to the `output_buffer`
- * using premultiplied blend formula.
+ * The pixels [0;@pixel_count) in stage_buffer are blended at [@x_start;@x_start+@pixel_count) in
+ * output_buffer.
  *
  * The current DRM assumption is that pixel color values have been already
  * pre-multiplied with the alpha channel values. See more
  * drm_plane_create_blend_mode_property(). Also, this formula assumes a
  * completely opaque background.
  */
-static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
-				struct line_buffer *stage_buffer,
-				struct line_buffer *output_buffer)
+static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
+				struct line_buffer *output_buffer, int x_start, int pixel_count)
 {
-	int x_dst = frame_info->dst.x1;
-	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
-	struct pixel_argb_u16 *in = stage_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (int x = 0; x < x_limit; x++) {
-		out[x].a = (u16)0xffff;
-		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
-		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
-		out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
+	struct pixel_argb_u16 *out = &output_buffer->pixels[x_start];
+	const struct pixel_argb_u16 *in = stage_buffer->pixels;
+
+	for (int i = 0; i < pixel_count; i++) {
+		out[i].a = (u16)0xffff;
+		out[i].r = pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
+		out[i].g = pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
+		out[i].b = pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
 	}
 }
 
@@ -183,7 +179,7 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
-	int y_pos;
+	int y_pos, x_dst, pixel_count;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
@@ -201,14 +197,16 @@ static void blend(struct vkms_writeback_job *wb,
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
+			x_dst = plane[i]->frame_info->dst.x1;
+			pixel_count = min_t(int, drm_rect_width(&plane[i]->frame_info->dst),
+					    (int)stage_buffer->n_pixels);
 			y_pos = get_y_pos(plane[i]->frame_info, y);
 
 			if (!check_limit(plane[i]->frame_info, y_pos))
 				continue;
 
 			vkms_compose_row(stage_buffer, plane[i], y_pos);
-			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
-					    output_buffer);
+			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, pixel_count);
 		}
 
 		apply_lut(crtc_state, output_buffer);

-- 
2.46.2


