Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191A940FCD9
	for <lists+linux-doc@lfdr.de>; Fri, 17 Sep 2021 17:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhIQPmZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Sep 2021 11:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244026AbhIQPmX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 11:42:23 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD77C0613D5
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:41:00 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id a10so18682412qka.12
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G/b3XiXy0Sb8x2PtTRvVL/40239eORGz1ZL98EY1EC8=;
        b=fzPGLaz85DNSjT8BpuMHmKOqlTmjcQ0qE3xixhpENWlDBqA/2YO/GHW63weTUvqukt
         /hTvkY+SrTcPo885plyDeFM72/dI9tOCbng/4AcduL2xIMkCXnVtu7q+T7+a/dD51gTH
         L7gwVnqTw/HxFpzCGCbsHv4pnw4VgWgPaHdZVIoNesVklyEarxWWcfWZeFjT4RjtbAt0
         zKMyHOGfRmRVSf82T/XUmWcFRHrKWywI2DYIEWYrkh+TpOc6k/7I+sqzH4nT9t/FGY5F
         hAHLlOmKX+HDxFDYattoDa8cZNtr6c5DAixr6gOGgaZ9CCc1QkEkWDxuavEl/4geEn+l
         1U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G/b3XiXy0Sb8x2PtTRvVL/40239eORGz1ZL98EY1EC8=;
        b=UA6R1o7mjQDeAuHjrd93QjmmPfUB7efCJHjBC8TXYByvGl2vFY6+EUOiyDJVK5z3fq
         UbBZ2KQZWPNW1CUzS2aimKEACDDLGiItTCoKZjiEQvgFa3131Rl5mRYmEyRVVHuysbtn
         qEldMScivZlI2F5adtZq0tWaVnbeycRQzgE7OWCJmIkMpCi69BfQjDQaH23gqHH7pzSi
         Ju+KMMa2OpqkYDwG7Dv7acof+Ncff0E8whZSaGm5hTePe67af7AtNKPyIjo9ixA5k16+
         KGVu9rvB4BwFP5czJXXRbjSD830ao5Hw6xdwYobvej3csKnu2U/mEINw5P97saDWJWuH
         JgzQ==
X-Gm-Message-State: AOAM530euuvw2xQiqzIEL7pzDZ9dK8dO1d9k+CUoXCB3/LFL7z3nbIjB
        VfpUgbnYeAGDvLHuYgCQbPLtCg==
X-Google-Smtp-Source: ABdhPJwEOXquIsSStFswyl2f30Mm94RU8fNeBCXsfk8xn7q1LDa0ztl6hhBn29sVtbQXy6Bzc6IuSA==
X-Received: by 2002:a37:9b93:: with SMTP id d141mr10910675qke.236.1631893259801;
        Fri, 17 Sep 2021 08:40:59 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id l195sm3821941qke.98.2021.09.17.08.40.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 08:40:59 -0700 (PDT)
Date:   Fri, 17 Sep 2021 11:40:57 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/15] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154057.GI2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-10-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-10-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 16, 2021 at 11:15:46PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/omapdrm/omap_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 190afc564914..56013c3ef701 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -62,13 +62,15 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
>  				  unsigned num_clips)
>  {
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
>  
>  	drm_for_each_crtc(crtc, fb->dev)
>  		omap_crtc_flush(crtc);
>  
> -	drm_modeset_unlock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
>  
>  	return 0;

Return ret here

>  }
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
