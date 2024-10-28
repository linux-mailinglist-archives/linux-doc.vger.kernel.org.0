Return-Path: <linux-doc+bounces-28832-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F79B2BEB
	for <lists+linux-doc@lfdr.de>; Mon, 28 Oct 2024 10:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 021931C21F40
	for <lists+linux-doc@lfdr.de>; Mon, 28 Oct 2024 09:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3291D435F;
	Mon, 28 Oct 2024 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jq0rJICZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DF11CCB37;
	Mon, 28 Oct 2024 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730109046; cv=none; b=uL2tyeyjBPp/prtClMT6WcEbh2LgBFztPAxEu9ZwtcB/auWsQPht3zKZxGN6mLySgAeOd/8Hwm7/l/jxZwqpd9fpsXD+lKkUlZcYQVunHTKVFJu/KQcvclpjww5YqAtCbYaS2I+wmRNgInBuYM1RjsW/6q0sraqk3gVSWXEpT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730109046; c=relaxed/simple;
	bh=JL6zdtCBj+lG/CHVQwCQECACUoTeQPn98GBk0kjRtrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meE/QCT7ZxsFA60AN+dmpiymIxJyUXVurSHdPT6GmDPXJu3f6CihjXVGdIQyDhqOU7mMXOQKbweKZO3V37ThtdUulskGiQ9m3V4XfSf0Xv9EJlJ09/fE/1r+Nmn2MVvDak7TkzMQNmIv4D2IVRtoB9rFXy0G3Zz59+EKrEA6/0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jq0rJICZ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C88A51BF20D;
	Mon, 28 Oct 2024 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730109041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SDslykrwknL3FVOFNX/i8okLHJLbqdHGtFBsKYYD4yw=;
	b=jq0rJICZhv5KrWU+MJs33iTafABnEp90i8xuG955buskZn8fCiSsLEIRYBYKU+LO7PEI3g
	SN/owTLiKUri4KuhrZqf2UlXs1JywY61LycVtlYb3i1r5y6raetoDHyUIkcVESn/ZHHqen
	dRhBp3fZkvX8bC3TJDvjRHmfLSi1+dh/WOOyCy0JmGKS4zhR2miNFryl5CWn2bmfBFPznd
	tKpE8h09333+oV6M3t2xRYDnch4+p4wwKzGzsW9AHw2D4GehzV+mh5p30XzugQauXDAl0C
	pmNKtFNgMxi4vxwvZdR19ZnNN5Beo73KQubTloLn+rxkca4WioS89MNXBrwMaA==
Date: Mon, 28 Oct 2024 10:50:38 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
	arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
	Simona Vetter <simona.vetter@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
	jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
	seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
	Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v12 08/15] drm/vkms: Re-introduce line-per-line
 composition algorithm
Message-ID: <Zx9eblYbZsFqn-hX@fedora>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
	arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
	Simona Vetter <simona.vetter@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
	jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
	seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
	Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-8-01c1ada6fec8@bootlin.com>
 <be1a9147-efbd-4c98-a0a4-7cf5a730fc70@riseup.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be1a9147-efbd-4c98-a0a4-7cf5a730fc70@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com

On 26/10/24 - 11:26, Ma�ra Canal wrote:
> Hi Louis,
> 
> On 07/10/24 13:10, Louis Chauvet wrote:
> > Re-introduce a line-by-line composition algorithm for each pixel format.
> > This allows more performance by not requiring an indirection per pixel
> > read. This patch is focused on readability of the code.
> > 
> > Line-by-line composition was introduced by [1] but rewritten back to
> > pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> > on performance, and it was merged.
> > 
> > This patch is almost a revert of [2], but in addition efforts have been
> > made to increase readability and maintainability of the rotation handling.
> > The blend function is now divided in two parts:
> > - Transformation of coordinates from the output referential to the source
> > referential
> > - Line conversion and blending
> > 
> > Most of the complexity of the rotation management is avoided by using
> > drm_rect_* helpers. The remaining complexity is around the clipping, to
> > avoid reading/writing outside source/destination buffers.
> > 
> > The pixel conversion is now done line-by-line, so the read_pixel_t was
> > replaced with read_pixel_line_t callback. This way the indirection is only
> > required once per line and per plane, instead of once per pixel and per
> > plane.
> > 
> > The read_line_t callbacks are very similar for most pixel format, but it
> > is required to avoid performance impact. Some helpers for color
> > conversion were introduced to avoid code repetition:
> > - *_to_argb_u16: perform colors conversion. They should be inlined by the
> >    compiler, and they are used to avoid repetition between multiple variants
> >    of the same format (argb/xrgb and maybe in the future for formats like
> >    bgr formats).
> > 
> > This new algorithm was tested with:
> > - kms_plane (for color conversions)
> > - kms_rotation_crc (for rotations of planes)
> > - kms_cursor_crc (for translations of planes)
> > - kms_rotation (for all rotations and formats combinations) [3]
> > The performance gain was mesured with kms_fb_stress [4] with some
> > modification to fix the writeback format.
> > 
> > The performance improvement is around 5 to 10%.
> > 
> > [1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to accept
> >       new formats")
> >       https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gmail.com/
> > [2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
> >       functionality")
> >       https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.com/
> > [3]: https://lore.kernel.org/igt-dev/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com/
> > [4]: https://lore.kernel.org/all/20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net/
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > 
> > # Conflicts:
> > #	drivers/gpu/drm/vkms/vkms_composer.c

I jut noticed this, I will remove it...

> > ---
> >   drivers/gpu/drm/vkms/vkms_composer.c | 234 ++++++++++++++++++++++++++++-------
> >   drivers/gpu/drm/vkms/vkms_drv.h      |  28 +++--
> >   drivers/gpu/drm/vkms/vkms_formats.c  | 224 ++++++++++++++++++++-------------
> >   drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
> >   drivers/gpu/drm/vkms/vkms_plane.c    |   5 +-
> >   5 files changed, 344 insertions(+), 149 deletions(-)
> > 
> 
> [...]
> 
> > -static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> > +static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
> >   {
> > -	__le16 *pixel = (__le16 *)in_pixel;
> > +	struct pixel_argb_u16 out_pixel;
> >   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> >   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> > @@ -226,40 +194,120 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pi
> >   	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> >   	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
> > -	out_pixel->a = (u16)0xffff;
> > -	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> > -	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> > -	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> > +	out_pixel.a = (u16)0xffff;
> > +	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> > +	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> > +	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> > +
> > +	return out_pixel;
> >   }
> > -/**
> > - * vkms_compose_row - compose a single row of a plane
> > - * @stage_buffer: output line with the composed pixels
> > - * @plane: state of the plane that is being composed
> > - * @y: y coordinate of the row
> > +/*
> > + * The following functions are read_line function for each pixel format supported by VKMS.
> > + *
> > + * They read a line starting at the point @x_start,@y_start following the @direction. The result
> > + * is stored in @out_pixel and in the format ARGB16161616.
> > + *
> > + * These functions are very repetitive, but the innermost pixel loops must be kept inside these
> > + * functions for performance reasons. Some benchmarking was done in [1] where having the innermost
> > + * loop factored out of these functions showed a slowdown by a factor of three.
> >    *
> > - * This function composes a single row of a plane. It gets the source pixels
> > - * through the y coordinate (see get_packed_src_addr()) and goes linearly
> > - * through the source pixel, reading the pixels and converting it to
> > - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
> > - * the source pixels are not traversed linearly. The source pixels are queried
> > - * on each iteration in order to traverse the pixels vertically.
> > + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
> >    */
> > -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> > +
> > +static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> > +			       enum pixel_read_direction direction, int count,
> > +			       struct pixel_argb_u16 out_pixel[])
> >   {
> > -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> > -	struct vkms_frame_info *frame_info = plane->frame_info;
> > -	u8 *src_pixels = get_packed_src_addr(frame_info, y, 0);
> > -	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +
> > +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> > +
> > +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		u8 *px = (u8 *)src_pixels;
> 
> Why are you converting u8* to u8*? There are repetitions of this pattern
> in this patch.

I think it was to be consistent between all the conversion functions. They 
are exactly the same, so having the casting (even useless one) at the same 
place may help to understand the code. 

I will remove this cast if you prefer.

> > +		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> > +			       enum pixel_read_direction direction, int count,
> > +			       struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +
> > +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> > +
> > +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		u8 *px = (u8 *)src_pixels;
> > +		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> > +				   int y_start, enum pixel_read_direction direction, int count,
> > +				   struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +
> > +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> > +
> > +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		u16 *px = (u16 *)src_pixels;
> > +		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> > +				   int y_start, enum pixel_read_direction direction, int count,
> > +				   struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +
> > +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> > +
> > +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		__le16 *px = (__le16 *)src_pixels;
> > +		*out_pixel = argb_u16_from_le16161616(cpu_to_le16(0xFFFF), px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
> > +			     int y_start, enum pixel_read_direction direction, int count,
> > +			     struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +
> > +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> > -	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
> > -		int x_pos = get_x_position(frame_info, limit, x);
> > +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> > -		if (drm_rotation_90_or_270(frame_info->rotation))
> > -			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1, 0)
> > -				+ frame_info->fb->format->cpp[0] * y;
> > +	while (out_pixel < end) {
> > +		__le16 *px = (__le16 *)src_pixels;
> > -		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> > +		*out_pixel = argb_u16_from_RGB565(px);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> >   	}
> >   }
> > @@ -359,25 +407,25 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
> >   }
> >   /**
> > - * get_pixel_read_function() - Retrieve the correct read_pixel function for a specific
> > + * get_pixel_read_line_function() - Retrieve the correct read_line function for a specific
> >    * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
> >    * the pointer is valid before using it in a vkms_plane_state.
> >    *
> >    * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> >    */
> > -pixel_read_t get_pixel_read_function(u32 format)
> > +pixel_read_line_t get_pixel_read_line_function(u32 format)
> >   {
> >   	switch (format) {
> >   	case DRM_FORMAT_ARGB8888:
> > -		return &ARGB8888_to_argb_u16;
> > +		return &ARGB8888_read_line;
> >   	case DRM_FORMAT_XRGB8888:
> > -		return &XRGB8888_to_argb_u16;
> > +		return &XRGB8888_read_line;
> >   	case DRM_FORMAT_ARGB16161616:
> > -		return &ARGB16161616_to_argb_u16;
> > +		return &ARGB16161616_read_line;
> >   	case DRM_FORMAT_XRGB16161616:
> > -		return &XRGB16161616_to_argb_u16;
> > +		return &XRGB16161616_read_line;
> >   	case DRM_FORMAT_RGB565:
> > -		return &RGB565_to_argb_u16;
> > +		return &RGB565_read_line;
> >   	default:
> >   		/*
> >   		 * This is a bug in vkms_plane_atomic_check(). All the supported
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> > index 3ecea4563254..8d2bef95ff79 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.h
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > @@ -5,7 +5,7 @@
> >   #include "vkms_drv.h"
> > -pixel_read_t get_pixel_read_function(u32 format);
> > +pixel_read_line_t get_pixel_read_line_function(u32 format);
> >   pixel_write_t get_pixel_write_function(u32 format);
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 10e9b23dab28..8875bed76410 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -112,7 +112,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >   	frame_info = vkms_plane_state->frame_info;
> >   	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
> >   	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> > -	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
> 
> If you won't use rotated anymore, delete it from the struct.

It is already done in this patch.

Thanks for your reviews,
Louis Chauvet

> Best Regards,
> - Ma�ra
> 
> >   	frame_info->fb = fb;
> >   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
> >   	drm_framebuffer_get(frame_info->fb);
> > @@ -122,10 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >   									  DRM_MODE_REFLECT_X |
> >   									  DRM_MODE_REFLECT_Y);
> > -	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
> > -			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> > -	vkms_plane_state->pixel_read = get_pixel_read_function(fmt);
> > +	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> >   }
> >   static int vkms_plane_atomic_check(struct drm_plane *plane,
> > 

