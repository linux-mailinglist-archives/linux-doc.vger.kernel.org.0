Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41A140FCAF
	for <lists+linux-doc@lfdr.de>; Fri, 17 Sep 2021 17:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243286AbhIQPju (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Sep 2021 11:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241825AbhIQPjs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 11:39:48 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F53C061766
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:38:26 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id p4so18698868qki.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eYZWVg2Fo/lgTFAWwDOCdDsCtgn1QSeKcFBATt6HycE=;
        b=RZLdBWyS1zzwyQ8AWr+TO8IbeXMrv4GkD9yrNwWLkEQyOyCXnDQ5fSKQPUD/s0MhKg
         xPGzOeolgoxijwXPYafTXoIFsWJ9ZH5uTwiUOZtfmRRxJKeuYfHYRs1uljQBg7frLMPl
         hB2KoXeC7zy3aDwmTGMjYb7uwpHrgGCEhCUQ/7gSX9y0P86eoYQ0TI2zxNcUCG+42qfH
         CtKDkpmjAilFtakfPBxyf9AXRN+ZAnLX1wMYZX67q6M6bZu0FdgAYrAwrrnr63xoZJHl
         LYjs5GJ8k/UC4yxHxh5Zup/joyt2tOBuMeI9RbWPPU2MQCpcRDe0jZNAiziMVYTANnTP
         cA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eYZWVg2Fo/lgTFAWwDOCdDsCtgn1QSeKcFBATt6HycE=;
        b=OlE/TnT9nOkerhCgTsdGXE2/3hmx+95TkwO/841fuZvqBdu/uaa0GHTQDqfR5egsfA
         OFqt+dapSNh/ekBX1GaRITxMkFa6AAqqh5MqeAuqNK4ZAu0kFhogvNeJTDF+v9zMluq7
         2H5ujFsGKm2+t7PyxXDGzG6JxxxRAmYdENkLB7D2MvLdrDVfA1H/4RWelKLnQVk/bv+g
         1K9gRPpbTrK8cEX9w6poJND/CPPAmCiVh2iQA3LhQy1MnW59goBY2vY7FsagqA2ggpw6
         smKYdk9JJOYUlbrchOBX73EiEaggwDqX/zZwBAGqE2sYsfnBtCu+4SdjQXRpSrQ49Zgs
         41WA==
X-Gm-Message-State: AOAM531px+Ky9snoatEWGyc/Ta5zUbroqKJvw90aMJitW+IUVDFABzQf
        YllfbdmhlQcVHQFvkfpzBNFoGQ==
X-Google-Smtp-Source: ABdhPJy+sgrVHk4mPzMJ5HeDnAsFrNLkiNzTwH7QjEt5wPfTDeXlC4CDkLSMrSghu4zxd6CNGrA38A==
X-Received: by 2002:a05:620a:1397:: with SMTP id k23mr11014086qki.380.1631893105758;
        Fri, 17 Sep 2021 08:38:25 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id t194sm5357503qka.72.2021.09.17.08.38.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 08:38:25 -0700 (PDT)
Date:   Fri, 17 Sep 2021 11:38:24 -0400
From:   Sean Paul <sean@poorly.run>
To:     Fernando Ramos <greenfoo@u92.eu>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sean@poorly.run, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 07/15] drm/shmobile: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917153824.GG2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-8-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-8-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 16, 2021 at 11:15:44PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 7db01904d18d..8ee215ab614e 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -156,10 +156,12 @@ static int shmob_drm_pm_suspend(struct device *dev)
>  static int shmob_drm_pm_resume(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(sdev->ddev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(sdev->ddev, ctx, 0, ret);
>  	shmob_drm_crtc_resume(&sdev->crtc);
> -	drm_modeset_unlock_all(sdev->ddev);
> +	DRM_MODESET_LOCK_ALL_END(sdev->ddev, ctx, ret);
>  
>  	drm_kms_helper_poll_enable(sdev->ddev);
>  	return 0;
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
