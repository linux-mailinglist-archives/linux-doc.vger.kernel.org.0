Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12BE705944
	for <lists+linux-doc@lfdr.de>; Tue, 16 May 2023 23:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjEPVFv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 May 2023 17:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjEPVFu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 17:05:50 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FD644AD
        for <linux-doc@vger.kernel.org>; Tue, 16 May 2023 14:05:49 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aaef97652fso1170785ad.0
        for <linux-doc@vger.kernel.org>; Tue, 16 May 2023 14:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684271149; x=1686863149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SFkd1dKbP6tnltyZPTScAM9Myy8k7lmViwxiQ8QCDqw=;
        b=ieBBJkzv1FX3uTWdfVYvnVTnwp7CFL1tJvfcS7PSzpipTI9ACNGqJJGkikhfV0mPaC
         CWzAaP2Yz6w5qEAcDi+dTWOSUSI34tT1Xmagj0xqnPGDqELUjLr8HDJmSPmfrvxvMlA9
         WU8o+BldDx/WK/rKGewb4xTSSKQNTdTC3D0FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684271149; x=1686863149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFkd1dKbP6tnltyZPTScAM9Myy8k7lmViwxiQ8QCDqw=;
        b=T5GuKlaoTOe8CJ9XkDafbeLEyNKifl4HxQIi9aqzjWKdGgDPkoubepVi7d6hMmvAdP
         j//weXtyiEEs624/nQLsG/xjRangRLnPeOEf7/00g0slFBhf9ErsgJfm1tigxDZadu5K
         Tsc7CPOTkbEGuHpJ1zZWxDC3HoHLEA9cpZe5cqiGG/ke/4zepndnKxgdQt79sdfRT9qe
         po4jHLD+Fll7vs8EPcrbntaAz3SMA8xQDES+lRi0JM+mpMDepkx2D/YD7+LM8VJ1MtXq
         d0dfwiYdbdgygV6+M8vLDssLfdHRTCweDnr+T9edJ9zt5/F98lI+pvecg1Ijqd/mOJVX
         /jAQ==
X-Gm-Message-State: AC+VfDzGMBowI8/tUxdTkVfoWI0sVZ872rO6wAG65l1DxQreuEVsXS6b
        bpvJNFeAZtNhSiX/572FJRle8Q==
X-Google-Smtp-Source: ACHHUZ5a0ti3E2WIToW5A8qJAvAtO1IxkLJPMPANL+k0TkT4HGTFx6lglKrZlkZWGkIMUmQI2aU0rA==
X-Received: by 2002:a17:902:c10c:b0:1ae:403f:d838 with SMTP id 12-20020a170902c10c00b001ae403fd838mr2744666pli.27.1684271148839;
        Tue, 16 May 2023 14:05:48 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j4-20020a17090276c400b00194caf3e975sm15909763plt.208.2023.05.16.14.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:05:48 -0700 (PDT)
Date:   Tue, 16 May 2023 14:05:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     corbet@lwn.net, torvalds@linux-foundation.org,
        linux-doc@vger.kernel.org, workflows@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] MAINTAINERS: direct process doc changes to a dedicated ML
Message-ID: <202305161404.7605E653B@keescook>
References: <20230511020204.910178-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511020204.910178-1-kuba@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 10, 2023 at 07:02:04PM -0700, Jakub Kicinski wrote:
> It's hard to keep track of changes to the process docs.
> Subsystem maintainers should probably know what's going on,
> to ensure reasonably uniform developer experience across
> trees.
> 
> We also need a place where process discussions can be held
> (i.e. designated mailing list which can be CCed on naturally
> arising discussions). I'm using workflows@ in this RFC,
> but a new list may be better.
> 
> No change to the patch flow intended.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> I've been pondering the lack of cross-maintainer communication
> as the kernel grows, and I hope this could help bring us together
> a little. Plus twice over the last 2 weeks someone popped up on
> netdev with what I personally considered incorrect interpretation
> of the process docs, so it'd be nice to CC a list on my replies
> so I can be corrected, in case I'm wrong.

I like this as a place to start. I wonder if there are people that
should be included in some discussions that aren't already subscribed to
the workflows list?

But, FWIW,

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Opinions more than welcome!
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c78e61a3387..58239fbc7007 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6223,6 +6223,12 @@ X:	Documentation/power/
>  X:	Documentation/spi/
>  X:	Documentation/userspace-api/media/
>  
> +DOCUMENTATION PROCESS
> +M:	Jonathan Corbet <corbet@lwn.net>
> +S:	Maintained
> +F:	Documentation/process/
> +L:	workflows@vger.kernel.org
> +
>  DOCUMENTATION REPORTING ISSUES
>  M:	Thorsten Leemhuis <linux@leemhuis.info>
>  L:	linux-doc@vger.kernel.org
> -- 
> 2.40.1
> 

-- 
Kees Cook
