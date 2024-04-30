Return-Path: <linux-doc+bounces-15463-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57718B6CD6
	for <lists+linux-doc@lfdr.de>; Tue, 30 Apr 2024 10:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A669B2217F
	for <lists+linux-doc@lfdr.de>; Tue, 30 Apr 2024 08:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDC03BB21;
	Tue, 30 Apr 2024 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hGpw00D5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A478C8D7
	for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714465980; cv=none; b=UJ1VK3f+GI/0ltXhadbTNv4zQcrpV4woSBPMQrqJF+tmMTYvRjB7L6//C/Db/oLDit3tRJRtAgqlPmsLitGXQj9kc+LPabfZyixVwYFekpeGTLw9WpuYVixt6JINX0Hz1IP7YbcQRIz9kHO3p4t1C3NhBwsQ+4GgwA746P6Gr/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714465980; c=relaxed/simple;
	bh=vDxvw14jYsefudEpZMNJXt4tWyyKctJgWrO19ItTmtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRnvkbQNu8mJSVVhAusK4/sF2YZnmFipAYchRcZLucNABVuqtTMSTgY5jc8l7VjWjd70cXxv5eB7pYLn4n18Jb8vzzoDy4TOYKqDMjIEsdM2C0Dco+8k92YqkNVtvVWNCL4VDvM5pxC7DBDHl+leFXBQWET52nmxtSZmKayYSUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hGpw00D5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34801b1bc4aso998495f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1714465976; x=1715070776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhsN+4bmO+l1kKyJbA0YMs+ieT8yz4S2LaFS6+Yj0oU=;
        b=hGpw00D5phru+YS3td+Gd1L3wPWjk1Nx4KzLtKfr/rAmEZIpwJnhf89aXsfuXq0Kor
         xD9isW0kVTNX+Hy82QVjDoLc9+UYjynZhhnSm6lBTU3PH1JyuUGRwcAZWimr4vzLlUoG
         8P8Cr0WyrqR2dXEvx6UNR4rrbwKOGHRtYMom8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714465976; x=1715070776;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhsN+4bmO+l1kKyJbA0YMs+ieT8yz4S2LaFS6+Yj0oU=;
        b=e9gRfx511QV7KBBHgIP/JshiaEd0c+2YaXgg+yendm4VHzhKpunV3cmawK5xRPJQkc
         quG8gIOvaM0pRnVzpjO2LeU5gVnIP0GDtlzpVJAn0Mqg7q4FOlkH0aP6IyynTBloHzn6
         78657AKxgq391JlHWioIkpa15xkpg6A6mVXyJSMUPGzw1jR2KAynbKnLsYEJiWxyZIJx
         Q9nXGDyEHcSeEsyDvLlRZaxUxh9+iktonA+8T84nHn3pZOi6aXM/d6QFvQwgj3xahIwa
         SFtWJzH8ZMEMKy0RkCHNI1vLNJMX8P3ROsYmjwW915nqQagtYfHQ9tOsWa87CasSCZWD
         wKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRjdarV5KpI1uoVja/GpVN573N7EVVBI6KygSrcLLZoh8VwHu/g2ilNWsVDGeoehxDJp9unw/K1auYNmXCDIVf5TZYfeVbHHAM
X-Gm-Message-State: AOJu0YwaEdu8EnOFlzvAfyYyoB7H9YeeqYKennQg4oOhTnMfS2DJ28+E
	XWjKAumirGuhSxV/K0HepgGuq0EF43Ud/WXQLYUQeTfgyggUbP8WbpuVeReLMRc=
X-Google-Smtp-Source: AGHT+IHVnsMBrK40/sJpe8Vq2ZQaDcQyhE2EImnhWzEdl1eAh3l92PIr9hGg6PIQImRNBXuFsEVBKA==
X-Received: by 2002:a5d:42cb:0:b0:34d:8ccf:c9ce with SMTP id t11-20020a5d42cb000000b0034d8ccfc9cemr740457wrr.5.1714465975642;
        Tue, 30 Apr 2024 01:32:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id cs7-20020a056000088700b00346cdf48262sm31679892wrb.2.2024.04.30.01.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 01:32:55 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:32:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brandon Pollack <brpol@chromium.org>
Cc: marius.vlad@collabora.com, mairacanal@riseup.net, jshargo@chromium.org,
	hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
	linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
	tzimmermann@suse.de
Subject: Re: [PATCH v6 5/7] drm/vkms: Support enabling ConfigFS devices
Message-ID: <ZjCstbN0IDG0jBjI@phenom.ffwll.local>
Mail-Followup-To: Brandon Pollack <brpol@chromium.org>,
	marius.vlad@collabora.com, mairacanal@riseup.net,
	jshargo@chromium.org, hamohammed.sa@gmail.com,
	rodrigosiqueiramelo@gmail.com, linux-doc@vger.kernel.org,
	hirono@chromium.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
	mduggan@chromium.org, mripard@kernel.org, tzimmermann@suse.de
References: <20230829053201.423261-1-brpol@chromium.org>
 <20230829053201.423261-6-brpol@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829053201.423261-6-brpol@chromium.org>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Tue, Aug 29, 2023 at 05:30:57AM +0000, Brandon Pollack wrote:
> From: Jim Shargo <jshargo@chromium.org>
> 
> VKMS now supports creating and using virtual devices!
> 
> In addition to the enabling logic, this commit also prevents users from
> adding new objects once a card is registered.

I forgot one comment ... I tried to look around really hard, but I'm not
seeing any code which prevents changes to immutable state once the device
is created?

Note that if we go with the design where you can only change enabled from
0 to 1 once it really doesn't matter much whether we block changes
afterwards, since they do not have any impact at all. But it would still
be nice, since for connector hotplug support we must make sure that the
encoders and all that stay around as-is.

Otoh there's no way to prevent dropping a config_item, so maybe we just
have to life with the fact that configfs is a lot more mutable than the
underlying drm objects. In that case I'd much prefer we switch over to the
model where you can only enable a configfs device instance once, otherwise
it's really confusing.
-Sima

> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Brandon Pollack <brpol@chromium.org>
> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c |  37 ++--
>  drivers/gpu/drm/vkms/vkms_crtc.c     |   4 +-
>  drivers/gpu/drm/vkms/vkms_drv.c      |   1 +
>  drivers/gpu/drm/vkms/vkms_drv.h      |   4 +-
>  drivers/gpu/drm/vkms/vkms_output.c   | 282 +++++++++++++++++++++++----
>  drivers/gpu/drm/vkms/vkms_plane.c    |  10 +-
>  6 files changed, 282 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index dae2e85d83a1..bc35dcc47585 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -508,29 +508,40 @@ static ssize_t device_enabled_store(struct config_item *item, const char *buf,
>  {
>  	struct vkms_configfs *configfs = item_to_configfs(item);
>  	struct vkms_device *device;
> -	int value, ret;
> +	int enabled, ret;
>  
> -	ret = kstrtoint(buf, 0, &value);
> +	ret = kstrtoint(buf, 0, &enabled);
>  	if (ret)
>  		return ret;
>  
> -	if (value != 1)
> -		return -EINVAL;
> -
> -	mutex_lock(&configfs->lock);
> -
> -	if (configfs->vkms_device) {
> +	if (enabled == 0) {
> +		mutex_lock(&configfs->lock);
> +		if (configfs->vkms_device) {
> +			vkms_remove_device(configfs->vkms_device);
> +			configfs->vkms_device = NULL;
> +		}
>  		mutex_unlock(&configfs->lock);
> +
>  		return len;
>  	}
>  
> -	device = vkms_add_device(configfs);
> -	mutex_unlock(&configfs->lock);
> +	if (enabled == 1) {
> +		mutex_lock(&configfs->lock);
> +		if (!configfs->vkms_device) {
> +			device = vkms_add_device(configfs);
> +			if (IS_ERR(device)) {
> +				mutex_unlock(&configfs->lock);
> +				return -PTR_ERR(device);
> +			}
> +
> +			configfs->vkms_device = device;
> +		}
> +		mutex_unlock(&configfs->lock);
>  
> -	if (IS_ERR(device))
> -		return -PTR_ERR(device);
> +		return len;
> +	}
>  
> -	return len;
> +	return -EINVAL;
>  }
>  
>  CONFIGFS_ATTR(device_, enabled);
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 74bbd675464b..2aa1c5246b7e 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -279,7 +279,7 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>  
>  struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
> -				 struct drm_plane *cursor)
> +				 struct drm_plane *cursor, const char *name)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_crtc *vkms_crtc;
> @@ -291,7 +291,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  	vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
>  
>  	ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
> -					 &vkms_crtc_funcs, NULL);
> +					 &vkms_crtc_funcs, name);
>  	if (ret) {
>  		DRM_ERROR("Failed to init CRTC\n");
>  		goto out_error;
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 819e880a8cf7..6e7f20681890 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -275,6 +275,7 @@ struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
>  			dev, &vkms_platform_driver.driver))) {
>  		pdev = to_platform_device(dev);
>  		max_id = max(max_id, pdev->id);
> +		put_device(dev);
>  	}
>  
>  	pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 8cdd7949f661..2b9545ada9c2 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -250,13 +250,13 @@ void vkms_remove_device(struct vkms_device *vkms_device);
>  /* CRTC */
>  struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
> -				 struct drm_plane *cursor);
> +				 struct drm_plane *cursor, const char *name);
>  
>  int vkms_output_init(struct vkms_device *vkmsdev);
>  int vkms_output_init_default(struct vkms_device *vkmsdev);
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type);
> +				   enum drm_plane_type type, char* name, ...);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index dc69959c5e1d..0ee1f3f4a305 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -2,8 +2,10 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> @@ -60,7 +62,8 @@ vkms_connector_init(struct vkms_device *vkms_device)
>  	return connector;
>  }
>  
> -static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
> +static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
> +					     char *name)
>  {
>  	struct drm_encoder *encoder;
>  	int ret;
> @@ -71,7 +74,7 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
>  	encoder = &vkms_device->output
>  			   .encoders[vkms_device->output.num_encoders++];
>  	ret = drm_encoder_init(&vkms_device->drm, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +			       DRM_MODE_ENCODER_VIRTUAL, name);
>  	if (ret) {
>  		memset(encoder, 0, sizeof(*encoder));
>  		vkms_device->output.num_encoders -= 1;
> @@ -82,7 +85,6 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
>  
>  int vkms_output_init_default(struct vkms_device *vkmsdev)
>  {
> -	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
> @@ -92,35 +94,34 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>  	int writeback;
>  	unsigned int n;
>  
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
> +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY,
> +				  "default-primary-plane");
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
>  	if (vkmsdev->config.overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			struct vkms_plane *overlay = vkms_plane_init(
> -				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> -			if (IS_ERR(overlay)) {
> -				ret = PTR_ERR(overlay);
> -				goto err_planes;
> -			}
> +			struct vkms_plane *overlay =
> +				vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY,
> +						"default-overlay-plane-%d", n);
> +			if (IS_ERR(overlay))
> +				return PTR_ERR(overlay);
>  		}
>  	}
>  
>  	if (vkmsdev->config.cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
> -		if (IS_ERR(cursor)) {
> -			ret = PTR_ERR(cursor);
> -			goto err_planes;
> -		}
> +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR,
> +					 "default-cursor-plane");
> +		if (IS_ERR(cursor))
> +			return PTR_ERR(cursor);
>  	}
>  
>  	vkms_crtc = vkms_crtc_init(vkmsdev, &primary->base,
> -				   cursor ? &cursor->base : NULL);
> +				   cursor ? &cursor->base : NULL,
> +				   "crtc-default");
>  	if (IS_ERR(vkms_crtc)) {
>  		DRM_ERROR("Failed to init crtc\n");
> -		ret = PTR_ERR(vkms_crtc);
> -		goto err_planes;
> +		return PTR_ERR(vkms_crtc);
>  	}
>  
>  	for (int i = 0; i < vkmsdev->output.num_planes; i++) {
> @@ -131,22 +132,20 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>  	connector = vkms_connector_init(vkmsdev);
>  	if (IS_ERR(connector)) {
>  		DRM_ERROR("Failed to init connector\n");
> -		ret = PTR_ERR(connector);
> -		goto err_connector;
> +		return PTR_ERR(connector);
>  	}
>  
> -	encoder = vkms_encoder_init(vkmsdev);
> +	encoder = vkms_encoder_init(vkmsdev, "encoder-default");
>  	if (IS_ERR(encoder)) {
>  		DRM_ERROR("Failed to init encoder\n");
> -		ret = PTR_ERR(encoder);
> -		goto err_encoder;
> +		return PTR_ERR(encoder);
>  	}
>  	encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach connector to encoder\n");
> -		goto err_attach;
> +		return ret;
>  	}
>  
>  	if (vkmsdev->config.writeback) {
> @@ -158,26 +157,235 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> +}
>  
> -err_attach:
> -	drm_encoder_cleanup(encoder);
> -
> -err_encoder:
> -	drm_connector_cleanup(connector);
> +static bool is_object_linked(struct vkms_config_links *links, unsigned long idx)
> +{
> +	return links->linked_object_bitmap & (1 << idx);
> +}
>  
> -err_connector:
> -	drm_crtc_cleanup(&vkms_crtc->base);
> +/**
> +* validate_vkms_configfs_no_dangling_objects - warn on unused objects in vkms
> +* configfs.
> +* @vkmsdev: vkms device
> +*
> +* This gives slightly more visible warning messaging to the user before the drm
> +* system finds the configuration invalid and prints it's debug information.  In
> +* this case the user may have accidentally not included some links, or the user
> +* could be testing this faulty configuration.
> +*/
> +static void
> +validate_vkms_configfs_no_dangling_objects(struct vkms_device *vkmsdev)
> +{
> +	struct vkms_configfs *configfs = vkmsdev->configfs;
> +	struct config_item *item;
> +
> +	// 1. Planes
> +	list_for_each_entry(item, &configfs->planes_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_plane *config_plane =
> +			item_to_config_plane(item);
> +		if (config_plane->possible_crtcs.linked_object_bitmap == 0)
> +			DRM_WARN(
> +				"Vkms configfs created plane %s has no linked crtcs",
> +				item->ci_name);
> +	}
>  
> -err_planes:
> -	for (int i = 0; i < output->num_planes; i++)
> -		drm_plane_cleanup(&output->planes[i].base);
> +	// 2. connectors
> +	list_for_each_entry(item, &configfs->connectors_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_connector *config_connector =
> +			item_to_config_connector(item);
> +		if (config_connector->possible_encoders.linked_object_bitmap ==
> +		    0) {
> +			DRM_WARN(
> +				"Vkms configfs created connector %s has no linked encoders",
> +				item->ci_name);
> +		}
> +	}
>  
> -	memset(output, 0, sizeof(*output));
> +	// 3. encoders
> +	list_for_each_entry(item, &configfs->encoders_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_encoder *config_encoder =
> +			item_to_config_encoder(item);
> +		if (config_encoder->possible_crtcs.linked_object_bitmap == 0) {
> +			DRM_WARN(
> +				"Vkms configfs created encoder %s has no linked crtcs",
> +				item->ci_name);
> +		}
> +	}
>  
> -	return ret;
> +	// 4. crtcs only require a primary plane to function, this is checked during
> +	// output initialization and returns an error.
>  }
>  
>  int vkms_output_init(struct vkms_device *vkmsdev)
>  {
> -	return -EOPNOTSUPP;
> +	struct drm_device *dev = &vkmsdev->drm;
> +	struct vkms_configfs *configfs = vkmsdev->configfs;
> +	struct vkms_output *output = &vkmsdev->output;
> +	struct plane_map {
> +		struct vkms_config_plane *config_plane;
> +		struct vkms_plane *plane;
> +	} plane_map[VKMS_MAX_PLANES] = { 0 };
> +	struct encoder_map {
> +		struct vkms_config_encoder *config_encoder;
> +		struct drm_encoder *encoder;
> +	} encoder_map[VKMS_MAX_OUTPUT_OBJECTS] = { 0 };
> +	struct config_item *item;
> +	int map_idx = 0;
> +
> +	// Ensure configfs has no unused objects, and warn if so.
> +	validate_vkms_configfs_no_dangling_objects(vkmsdev);
> +
> +	list_for_each_entry(item, &configfs->planes_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_plane *config_plane =
> +			item_to_config_plane(item);
> +		struct vkms_plane *plane = vkms_plane_init(
> +			vkmsdev, config_plane->type, item->ci_name);
> +
> +		if (IS_ERR(plane)) {
> +			DRM_ERROR("Unable to init plane from config: %s",
> +				  item->ci_name);
> +			return PTR_ERR(plane);
> +		}
> +
> +		plane_map[map_idx].config_plane = config_plane;
> +		plane_map[map_idx].plane = plane;
> +		map_idx += 1;
> +	}
> +
> +	map_idx = 0;
> +	list_for_each_entry(item, &configfs->encoders_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_encoder *config_encoder =
> +			item_to_config_encoder(item);
> +		struct drm_encoder *encoder =
> +			vkms_encoder_init(vkmsdev, item->ci_name);
> +
> +		if (IS_ERR(encoder)) {
> +			DRM_ERROR("Failed to init config encoder: %s",
> +				  item->ci_name);
> +			return PTR_ERR(encoder);
> +		}
> +		encoder_map[map_idx].config_encoder = config_encoder;
> +		encoder_map[map_idx].encoder = encoder;
> +		map_idx += 1;
> +	}
> +
> +	list_for_each_entry(item, &configfs->connectors_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_connector *config_connector =
> +			item_to_config_connector(item);
> +		struct drm_connector *connector = vkms_connector_init(vkmsdev);
> +
> +		if (IS_ERR(connector)) {
> +			DRM_ERROR("Failed to init connector from config: %s",
> +				  item->ci_name);
> +			return PTR_ERR(connector);
> +		}
> +
> +		for (int j = 0; j < output->num_encoders; j++) {
> +			struct encoder_map *encoder = &encoder_map[j];
> +
> +			if (is_object_linked(
> +				    &config_connector->possible_encoders,
> +				    encoder->config_encoder
> +					    ->encoder_config_idx)) {
> +				drm_connector_attach_encoder(connector,
> +							     encoder->encoder);
> +			}
> +		}
> +	}
> +
> +	list_for_each_entry(item, &configfs->crtcs_group.cg_children,
> +			    ci_entry) {
> +		struct vkms_config_crtc *config_crtc =
> +			item_to_config_crtc(item);
> +		struct vkms_crtc *vkms_crtc;
> +		struct drm_plane *primary = NULL, *cursor = NULL;
> +
> +		for (int j = 0; j < output->num_planes; j++) {
> +			struct plane_map *plane_entry = &plane_map[j];
> +			struct drm_plane *plane = &plane_entry->plane->base;
> +
> +			if (!is_object_linked(
> +				    &plane_entry->config_plane->possible_crtcs,
> +				    config_crtc->crtc_config_idx)) {
> +				continue;
> +			}
> +
> +			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> +				if (primary) {
> +					DRM_WARN(
> +						"Too many primary planes found for crtc %s.",
> +						item->ci_name);
> +					return -EINVAL;
> +				}
> +				primary = plane;
> +			} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
> +				if (cursor) {
> +					DRM_WARN(
> +						"Too many cursor planes found for crtc %s.",
> +						item->ci_name);
> +					return -EINVAL;
> +				}
> +				cursor = plane;
> +			}
> +		}
> +
> +		if (!primary) {
> +			DRM_WARN("No primary plane configured for crtc %s",
> +				 item->ci_name);
> +			return -EINVAL;
> +		}
> +
> +		vkms_crtc =
> +			vkms_crtc_init(vkmsdev, primary, cursor, item->ci_name);
> +		if (IS_ERR(vkms_crtc)) {
> +			DRM_WARN("Unable to init crtc from config: %s",
> +				 item->ci_name);
> +			return PTR_ERR(vkms_crtc);
> +		}
> +
> +		for (int j = 0; j < output->num_planes; j++) {
> +			struct plane_map *plane_entry = &plane_map[j];
> +
> +			if (!plane_entry->plane)
> +				break;
> +
> +			if (is_object_linked(
> +				    &plane_entry->config_plane->possible_crtcs,
> +				    config_crtc->crtc_config_idx)) {
> +				plane_entry->plane->base.possible_crtcs |=
> +					drm_crtc_mask(&vkms_crtc->base);
> +			}
> +		}
> +
> +		for (int j = 0; j < output->num_encoders; j++) {
> +			struct encoder_map *encoder_entry = &encoder_map[j];
> +
> +			if (is_object_linked(&encoder_entry->config_encoder
> +						      ->possible_crtcs,
> +					     config_crtc->crtc_config_idx)) {
> +				encoder_entry->encoder->possible_crtcs |=
> +					drm_crtc_mask(&vkms_crtc->base);
> +			}
> +		}
> +
> +		if (vkmsdev->config.writeback) {
> +			int ret = vkms_enable_writeback_connector(vkmsdev,
> +								  vkms_crtc);
> +			if (ret)
> +				DRM_WARN(
> +					"Failed to init writeback connector for config crtc: %s. Error code %d",
> +					item->ci_name, ret);
> +		}
> +	}
> +
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 950e6c930273..3198bf0dca73 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/iosys-map.h>
> +#include <linux/stdarg.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -215,20 +216,25 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type)
> +				   enum drm_plane_type type, char *name, ...)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_output *output = &vkmsdev->output;
>  	struct vkms_plane *plane;
> +	va_list va;
>  	int ret;
>  
>  	if (output->num_planes >= VKMS_MAX_PLANES)
>  		return ERR_PTR(-ENOMEM);
>  
>  	plane = &output->planes[output->num_planes++];
> +
> +	va_start(va, name);
>  	ret = drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_funcs,
>  				       vkms_formats, ARRAY_SIZE(vkms_formats),
> -				       NULL, type, NULL);
> +				       NULL, type, name, va);
> +	va_end(va);
> +
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -- 
> 2.42.0.rc2.253.gd59a3bf2b4-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

