Return-Path: <linux-doc+bounces-8147-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F38845EB2
	for <lists+linux-doc@lfdr.de>; Thu,  1 Feb 2024 18:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DBB728C413
	for <lists+linux-doc@lfdr.de>; Thu,  1 Feb 2024 17:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA72F6FB87;
	Thu,  1 Feb 2024 17:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mnUumbRJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37656FB88;
	Thu,  1 Feb 2024 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706809124; cv=none; b=cKpcW5kYwKxcgQuG4PvZDb7ycvPwGDyyRYt50MZ4Gz8ohRaCM89UqEprvjCeb8GjlgVLCAkWafaYo5d364WAjAoMGoNjnYvfXsYST3ZPjY6hu0kdth6c/L7Hg1ATuZk/BJmxHZF1zc3y01L8q3k6FN+Rp4KRrrH9pmcKKFpoN0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706809124; c=relaxed/simple;
	bh=DU0hI8fCYbHgDvs7Two4TcIzKB7Uo2ia6fgwN4gB6zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOXt3aKXfno69IVRV3rFMUm13fn41D9a1mP4+8MZWhk9ikWYOfslXn2hxai9IrjJ7kayTb5J9hSnCwZh5fa9lFSP5If6M25kg7mvU7O1RYdPsaWqDWj2yM5pnTp/dvWroEgJHPNWjuOEEroCCjPkQWkFBi8WwQdDyrbduTMwbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mnUumbRJ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 233201BF204;
	Thu,  1 Feb 2024 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706809119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Phm3LOaeo0CAt3mJTSZF3S+4OBemom8lCjPI30lOO+Q=;
	b=mnUumbRJjAfeE+fZXzwzLUPaPu23TiXrcMolGgfz8GCDIANhL7boNGpNkZpzaoHerB68/e
	UJ9h7JKxDMo5JLhC9V8xtMHAVqe59D1rVoHPBsfS84EZgxB0blpsGC6bCF9EsadwWpDIAg
	Wiu+WXYKcT+RxZsAeWDe2d0QE2XPyYVwfRjoc1MPcWurpl+9GkWjycB/6Qw4BaBZ8I6ZHM
	YPQCSlcnN/32Hwruo5HR0VBhIA20Tu4SPJXViJxmGz/+qdBJS2XXYq8nibBhGrumn7NSfZ
	vTng+5DYBfX6KypquIXKUPr/n7OZjdER+PRGWBq1XDAu1BTGFVTOdmoj/Zdomg==
Date: Thu, 1 Feb 2024 18:38:36 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Melissa Wen <melissa.srw@gmail.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com, seanpaul@google.com,
	nicolejadeyee@google.com, marcheu@google.com
Subject: Re: [PATCH v2 2/7] drm/vkms: Add support for multy-planar
 framebuffers
Message-ID: <ZbvXHECSBmH0NDZn@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Melissa Wen <melissa.srw@gmail.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com, seanpaul@google.com,
	nicolejadeyee@google.com, marcheu@google.com
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
 <20240110-vkms-yuv-v2-2-952fcaa5a193@riseup.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110-vkms-yuv-v2-2-952fcaa5a193@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com

Hello,

I think there are some bugs in this implementation of multi-planar 
support (and not mylty-planar, there is a typo in the title), especially 
for the "new" drm_format_info description which uses block_w and block_h.

I will propose two patches [1] solving these issues and hopefully also 
simplifying a bit the composition.

TBH I'm not an expert, it's my first ever contribution in DRM, so please 
don't hesitate to correct me if you thin I missunderstood something, it 
actually took me a bit of time to fully understand the whole series and 
how it interacted with the rest of the vkms driver.

> -static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
> +static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y, size_t index)
>  {
>  	struct drm_framebuffer *fb = frame_info->fb;
>  
> -	return fb->offsets[0] + (y * fb->pitches[0])
> -			      + (x * fb->format->cpp[0]);
> +	return fb->offsets[index] + (y * fb->pitches[index])
> +				  + (x * fb->format->cpp[index]);
>  }
>  
>  /*
> @@ -23,27 +23,25 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
>   * @frame_info: Buffer metadata
>   * @x: The x(width) coordinate of the 2D buffer
>   * @y: The y(Heigth) coordinate of the 2D buffer
> + * @index: The index of the plane on the 2D buffer
>   *
>   * Takes the information stored in the frame_info, a pair of coordinates, and
> - * returns the address of the first color channel.
> - * This function assumes the channels are packed together, i.e. a color channel
> - * comes immediately after another in the memory. And therefore, this function
> - * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + * returns the address of the first color channel on the desired index.
>   */
>  static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
> -				int x, int y)
> +				int x, int y, size_t index)
>  {
> -	size_t offset = pixel_offset(frame_info, x, y);
> +	size_t offset = pixel_offset(frame_info, x, y, index);
>  
>  	return (u8 *)frame_info->map[0].vaddr + offset;
>  }

This implementation of packed_pixels_addr will only work with
block_w == block_h == 1. For packed or tiled formats we will need to use
x/y information to extract the correct address, and this address will not 
be a single pixel. See below my explanation.

[...]

> @@ -130,17 +128,28 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  {
>  	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
>  	struct vkms_frame_info *frame_info = plane->frame_info;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> +	const struct drm_format_info *frame_format = frame_info->fb->format;
>  	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
> +	u8 *src_pixels[DRM_FORMAT_MAX_PLANES];
>  
> -	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
> +	for (size_t i = 0; i < frame_format->num_planes; i++)
> +		src_pixels[i] = get_packed_src_addr(frame_info, y, i);
> +
> +	for (size_t x = 0; x < limit; x++) {
>  		int x_pos = get_x_position(frame_info, limit, x);
>  
> -		if (drm_rotation_90_or_270(frame_info->rotation))
> -			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
> -				+ frame_info->fb->format->cpp[0] * y;
> +		if (drm_rotation_90_or_270(frame_info->rotation)) {
> +			for (size_t i = 0; i < frame_format->num_planes; i++) {
> +				src_pixels[i] = get_packed_src_addr(frame_info,
> +								    x + frame_info->rotated.y1, i);
> +				src_pixels[i] += frame_format->cpp[i] * y;

I find the current rotation management a bit complex to understand. This 
is not related to your patch, but as I had to understand this to create my 
second patch, I think this could be significanlty simplified.

Please see the below comment about frame_format->cpp, it applies here too. 
I think the "easy" way here is simply to reuse the method 
get_packed_src_addr every time you need a new pixel.

> +			}
> +		}
>  
>		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> +

The usage of cpp and pointer to specific pixel only work for non-packed 
and non-blocked pixels, but for example NV30 or Y0L0 need more 
informations about the exact location of the pixel to convert and write 
the correct pixel value (each pixel can't be referenced directly by a 
pointer). For example NV30 uses 5 bytes to store 3 pixels (10 bits each), 
so to access the "middle" one you need to read the 5 bytes and do a small 
computation to extract it's value.

I think a simple solution to handle most cases would be to profide two 
more parameters: the x and y positions of the pixel to copy, using 
"absolute coordinates" (i.e x=0,y=0 means the first byte of the src 
buffer, not the first pixel in the `drm_rect src`, this way the method 
`pixel_read` can extract the correct value).

This way it become easy to manage "complex" pixel representations in this 
loop: simply increment x/y and let the pixel_read method handle 
everything.

The second patch I will send is doing this. And as explained before, it 
will also simplify a lot the code related to rotation and translation (no 
more switch case everywhere to add offset to x/y, it simply use drm_rect_* 
helpers).

It's not optimal in term of performance (in some situation it will read 
the same block multiple time to generate different pixels), but I 
believe it still is an intersting trade-off.

In the future, if performance is actally critical, the whole composition 
loop will have to be specialized for each pixel formats: some can be 
treated line by line (as it's done today), but with blocks or packed 
pixels it's more complex.

> +		for (size_t i = 0; i < frame_format->num_planes; i++)
> +			src_pixels[i] += frame_format->cpp[i];

This is likely working with format with block_w != 1, see explanation 
above.

[...]

[1]: https://lore.kernel.org/dri-devel/20240201-yuv-v1-0-3ca376f27632@bootlin.com/T/#t

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

