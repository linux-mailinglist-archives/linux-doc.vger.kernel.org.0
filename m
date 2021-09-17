Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A7440FC84
	for <lists+linux-doc@lfdr.de>; Fri, 17 Sep 2021 17:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242560AbhIQPg3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Sep 2021 11:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242339AbhIQPg2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 11:36:28 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8750FC061767
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:35:06 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id m21so18578552qkm.13
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=etpvimAGC3cFSoQItQRzFF1YIvwQ/FhTWX31CB58c7c=;
        b=Z6qLGjOnr0PSGw2+rTiwMy4FDwPeOnctu6jRcIo22IJml0l0/ciiA0jAKPcXyw/hCo
         Yg7f3oBGgezMvi4yyl+uyOEP0Q5MZtuH5UI2hhpO9yXGj1IjL6Qz5R6H9L00O1hhqV6v
         gm6WA16jRTFsDQXvyuxa0NVFw96QNUU6pX0EMHuNYejEL635ThiZZKALc8iOLssFJMoz
         6bv3cBANpCGiYLaYPFSWE3bhY5CpuO3F20uc6VkF00sp2q3ZR0OvcH4k8cf6oir+RRfH
         WjhZ+j9BqMciV1CvenBcVfEkQo/V/sA3Nha/0HSJT8cTl0y0ku0Z9BPxGuHJABLs23eT
         rFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=etpvimAGC3cFSoQItQRzFF1YIvwQ/FhTWX31CB58c7c=;
        b=MZw0SOJwANzgUYWXAQtonmjw3x7egtONxC1jhuvAKnHTOKEXhtCjL57VccgSkW8myx
         +WCr6JzCDFvYS1jou0mnrBNB3SdBbeiZylNpSLqWlKhxNcc4pXxv1Bu7rzPkJZCxg8jv
         SL9hLS5lqLwHwKTbgs1hm7Zt/wvhBMogPzovzgYlKf0vHMB/Dsk+SGf1215nIx6bKX0I
         eka67p6WIyrJV9u9+k+jJ93hNfLCe42ETwxn9OUv6O1WcSCWcWerrmJZ9B98VajqA8sU
         8WMoZOf+O/QQN7Ja059jMUO+d5GtGPfG7aeYksGoadHJ7WM1ATiOqUDhP+x4Jz4QtMP3
         1YRQ==
X-Gm-Message-State: AOAM530r9Pwxu+zCeGoFoSdVadS6mdcXcHqHrPCLAMj8mHPUARTmhz/j
        P8j3m2tu8Ajkr1fRlgHeJUfXuw==
X-Google-Smtp-Source: ABdhPJyPmLg1UvFfWoKe5JE6z4C3KPySZ0VD7+SIRxGUPboFqLU8Fxoj04i8QLcZPNOSwEU8IJbj/A==
X-Received: by 2002:a37:994:: with SMTP id 142mr11044413qkj.467.1631892905711;
        Fri, 17 Sep 2021 08:35:05 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id o22sm3838371qkk.132.2021.09.17.08.35.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 08:35:05 -0700 (PDT)
Date:   Fri, 17 Sep 2021 11:35:04 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/15] drm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917153504.GD2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-5-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-5-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 16, 2021 at 11:15:41PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/drm_client_modeset.c |  5 +++--
>  drivers/gpu/drm/drm_crtc_helper.c    | 18 ++++++++++++------
>  drivers/gpu/drm/drm_fb_helper.c      | 10 ++++++----
>  drivers/gpu/drm/drm_framebuffer.c    |  6 ++++--
>  4 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 5f5184f071ed..43f772543d2a 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1062,9 +1062,10 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
>  	struct drm_device *dev = client->dev;
>  	struct drm_mode_set *mode_set;
>  	struct drm_plane *plane;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int ret = 0;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	drm_for_each_plane(plane, dev) {
>  		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
>  			drm_plane_force_disable(plane);
> @@ -1093,7 +1094,7 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
>  			goto out;
>  	}
>  out:
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index bff917531f33..f3ce073dff79 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -218,11 +218,14 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
>   */
>  void drm_helper_disable_unused_functions(struct drm_device *dev)
>  {
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
> +
>  	WARN_ON(drm_drv_uses_atomic_modeset(dev));
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	__drm_helper_disable_unused_functions(dev);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  }
>  EXPORT_SYMBOL(drm_helper_disable_unused_functions);
>  
> @@ -942,12 +945,14 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
>  	struct drm_crtc *crtc;
>  	struct drm_encoder *encoder;
>  	const struct drm_crtc_helper_funcs *crtc_funcs;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int encoder_dpms;
>  	bool ret;
> +	int err;
>  
>  	WARN_ON(drm_drv_uses_atomic_modeset(dev));
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
>  	drm_for_each_crtc(crtc, dev) {
>  
>  		if (!crtc->enabled)
> @@ -982,7 +987,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
>  
>  	/* disable the unused connectors while restoring the modesetting */
>  	__drm_helper_disable_unused_functions(dev);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
>  }
>  EXPORT_SYMBOL(drm_helper_resume_force_mode);
>  
> @@ -1002,9 +1007,10 @@ EXPORT_SYMBOL(drm_helper_resume_force_mode);
>  int drm_helper_force_disable_all(struct drm_device *dev)
>  {
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int ret = 0;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	drm_for_each_crtc(crtc, dev)
>  		if (crtc->enabled) {
>  			struct drm_mode_set set = {
> @@ -1016,7 +1022,7 @@ int drm_helper_force_disable_all(struct drm_device *dev)
>  				goto out;
>  		}
>  out:
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_helper_force_disable_all);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 3ab078321045..6860223f0068 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -940,10 +940,11 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  	struct drm_fb_helper *fb_helper = info->par;
>  	struct drm_mode_set *modeset;
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
>  	u16 *r, *g, *b;
>  	int ret = 0;
>  
> -	drm_modeset_lock_all(fb_helper->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(fb_helper->dev, ctx, 0, ret);
>  	drm_client_for_each_modeset(modeset, &fb_helper->client) {
>  		crtc = modeset->crtc;
>  		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
> @@ -970,7 +971,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  			goto out;
>  	}
>  out:
> -	drm_modeset_unlock_all(fb_helper->dev);
> +	DRM_MODESET_LOCK_ALL_END(fb_helper->dev, ctx, ret);
>  
>  	return ret;
>  }
> @@ -1441,10 +1442,11 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
>  	struct drm_fb_helper *fb_helper = info->par;
>  	struct drm_client_dev *client = &fb_helper->client;
>  	struct drm_mode_set *modeset;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int ret = 0;
>  
>  	mutex_lock(&client->modeset_mutex);
> -	drm_modeset_lock_all(fb_helper->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(fb_helper->dev, ctx, 0, ret);
>  	drm_client_for_each_modeset(modeset, client) {
>  		modeset->x = var->xoffset;
>  		modeset->y = var->yoffset;
> @@ -1457,7 +1459,7 @@ static int pan_display_legacy(struct fb_var_screeninfo *var,
>  			}
>  		}
>  	}
> -	drm_modeset_unlock_all(fb_helper->dev);
> +	DRM_MODESET_LOCK_ALL_END(fb_helper->dev, ctx, ret);
>  	mutex_unlock(&client->modeset_mutex);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 07f5abc875e9..205e9aa9a409 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -1059,8 +1059,10 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
>  	struct drm_device *dev = fb->dev;
>  	struct drm_crtc *crtc;
>  	struct drm_plane *plane;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	/* remove from any CRTC */
>  	drm_for_each_crtc(crtc, dev) {
>  		if (crtc->primary->fb == fb) {
> @@ -1082,7 +1084,7 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
>  			drm_plane_force_disable(plane);
>  		}
>  	}
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  }
>  
>  /**
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
