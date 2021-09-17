Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045CC40FCF7
	for <lists+linux-doc@lfdr.de>; Fri, 17 Sep 2021 17:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244267AbhIQPoR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Sep 2021 11:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243634AbhIQPoP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 11:44:15 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7C4C061574
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:42:52 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id c7so13228511qka.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m0dCFB/mfZ3NoW8jcV3Ey7Co+ujM9o+NXfiHm7bltGo=;
        b=F8nNi3y2k7UHCutwkJnFaKCmLrIPkAilYWnn8NJfGMKZdgWTNzSRB41BT8XEaF4EN9
         zOqDbAw5kNzn0+XX5xgzKH7Z+5F3OSvxQf+Da/YnNgbXHoCpcdAqvqZ89foRH4ceGuR9
         4MrUsTpwBBhQ716EZr0jkZaf/pHgWVEWLAEG9EPUIOG5kGq06LEEzsgiFXGPZF250+gq
         20HCNXynRp2jJEyHbBqtLHvXdrUHfmgV3H8J14hbv2sXxLeZxXf4JQyMM2a98i0fBNiZ
         zWdZ84jgIMcG6m/w+H3U8iTX8s6PosdiH+IDiKj3/nfb7JLb9ntMCfEaZDTkXALQ/oRu
         w5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m0dCFB/mfZ3NoW8jcV3Ey7Co+ujM9o+NXfiHm7bltGo=;
        b=hHda7CDQA98kk4aLJJ6fbZOVyGxZAAornelfWImRPWxcXzMH6nqsAwaM92rQ74TL9u
         m+rgyMW3olEbvkZsw24b484EZbcna6xhAwL2wK/vqgUjYnnP+8IUj7LnUz7lybudBZMv
         c0rVG7m+mz9k1UtTAszTv9yiXN1nRlxLI7Iqk7KsAT5SdhZvNtgIog7mX+Y4SN2/hknb
         WtuJ2/SHS2tRnLvbrt+JZTjn/J2AiVZJ0xWuPEGGudG5dolqeYJFYz9XLEQZ6XEh/G7C
         zR+jB8ct4/Upha27pRRqCBKeL69NoC0rKhrvzQpx4paXzPdc9ibu5qL1OlxVRBt27Jq+
         XeTA==
X-Gm-Message-State: AOAM5308jFHQ4KY4ehdZRrzHPcmiinpmXH0rAi8s00E+nybFo1vPvJC4
        2GfLNv8eZ/ceo0Ehu76Bdy8YZA==
X-Google-Smtp-Source: ABdhPJw/rGUlpnFx6n+2dmNWgHTDFnPjlTeuUV940sLT48vl5prfdmAmwCynqp4L1RpXVV+z5tspCQ==
X-Received: by 2002:a05:620a:c4d:: with SMTP id u13mr11076334qki.411.1631893371837;
        Fri, 17 Sep 2021 08:42:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id z6sm4242154qtq.78.2021.09.17.08.42.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 08:42:51 -0700 (PDT)
Date:   Fri, 17 Sep 2021 11:42:50 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/15] drm/msm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154250.GL2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-12-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-12-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 16, 2021 at 11:15:48PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 768012243b44..4cbc79eaee17 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1172,14 +1172,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  	struct drm_display_mode *mode;
>  	struct drm_framebuffer *fb;
>  	struct drm_plane_state *state;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct dpu_crtc_state *cstate;
>  
>  	int i, out_width;
> +	int ret;

Please put ret with i & out_width

>  
>  	dpu_crtc = s->private;
>  	crtc = &dpu_crtc->base;
>  
> -	drm_modeset_lock_all(crtc->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(crtc->dev, ctx, 0, ret);
>  	cstate = to_dpu_crtc_state(crtc->state);
>  
>  	mode = &crtc->state->adjusted_mode;
> @@ -1263,7 +1265,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
>  	}
>  
> -	drm_modeset_unlock_all(crtc->dev);
> +	DRM_MODESET_LOCK_ALL_END(crtc->dev, ctx, ret);
>  
>  	return 0;

Return ret here

>  }
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
