Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B03E42B87C
	for <lists+linux-doc@lfdr.de>; Wed, 13 Oct 2021 09:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238294AbhJMHLS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Oct 2021 03:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbhJMHLS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Oct 2021 03:11:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A515CC061746
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 00:09:14 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id c16so7495458lfb.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 00:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZMSfqssxjE37wIiOs10lPZQ3BHyZICBiMNu/viO9Wv8=;
        b=rZwwmSB0O6MunwUzqLxpVbT/59aCAtCIpWayoM9/SWKmDCW6I0WEpsajjGVvLWij2c
         ybOwVzD3dEoy6ZbDtAZpOKyLcG9zcVpSyrzLlSb4gyFIQX4myh3I2d6WFQJ0nHuTKmKF
         Kt/IYsB9C+xf8roofhcqu82qEr74K/v9oZukr1+4cw0Ir1uVKVNLYohfCpL9Sxp9KLHy
         0MfLZEcn+jGWaRBoJ8idinvqrZ0d1GQ82MEo6IqIFTs4xLSFxKS7XAzlcSZSRIr1Cb4v
         kSXxY7XUQ4LeBMciHeuKduZ186E68TK6Vl9mdFsYuuw9LyiqMrLaPzlvqbLsKzCW3BUD
         WkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZMSfqssxjE37wIiOs10lPZQ3BHyZICBiMNu/viO9Wv8=;
        b=0zbOrW1mnknGxBEbpSuADn2SGce/6vZxJ31Y0Wg79KTGSuECqolP6pZhJDdYWjE9x3
         +Y3zFk4h/ZuuKO7LGzfnMWsVMuZCHgDXbRbp8NugsQ0d8+F2FJc5CfBVfUGXLfqxRCBf
         fb9i78uoVB2XYR8ObXHQH/Se812aje56aVtWdhZnK/Lk3YKKY7ln7zmpT4TRVhQ1Zswr
         TS7dAny7GtEFrckq2wnZ7dy6zd2NWTvQIkj4V6Md0Fgb1wTc/KFEZu2BtA1xIO2glnUK
         CoG9sSOH0dEqmDqheE4n1HH2GX3KgFee7SQLIAL0aryFn8qNDEy/l8hRR3eIK8kiWTmB
         PCHA==
X-Gm-Message-State: AOAM532JVaIQcNJBtd9rqHsLqAiUfulFIuP17MfkEyBg7XZ6oXn3LhSR
        GSMf07XtayPdETVqZOL3sH9q3ABFe9hrvUw1g7qYjg==
X-Google-Smtp-Source: ABdhPJyR2s1TmAgABNpDg6esdyYm384WojAfLAKSbM0DVhqqaxhND78VpPMUiy5ZNLidqHGqJwrDL0N2dAW8NpM+cCs=
X-Received: by 2002:a05:6512:3b94:: with SMTP id g20mr39470692lfv.119.1634108953052;
 Wed, 13 Oct 2021 00:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211006071546.2540920-1-jens.wiklander@linaro.org> <20211006071546.2540920-4-jens.wiklander@linaro.org>
In-Reply-To: <20211006071546.2540920-4-jens.wiklander@linaro.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 13 Oct 2021 12:39:02 +0530
Message-ID: <CAFA6WYPZ-JbAhfvdWfbcgqBRnA9F-=o5k=ZzR_KYL+rAkVm3PA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] tee: fix put order in teedev_close_context()
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 6 Oct 2021 at 12:45, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Prior to this patch was teedev_close_context() calling tee_device_put()
> before teedev_ctx_put() leading to teedev_ctx_release() accessing
> ctx->teedev just after the reference counter was decreased on the
> teedev. Fix this by calling teedev_ctx_put() before tee_device_put().
>
> Fixes: 217e0250cccb ("tee: use reference counting for tee_context")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 2b37bc408fc3..85102d12d716 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -98,8 +98,10 @@ void teedev_ctx_put(struct tee_context *ctx)
>
>  static void teedev_close_context(struct tee_context *ctx)
>  {
> -       tee_device_put(ctx->teedev);
> +       struct tee_device *teedev = ctx->teedev;
> +
>         teedev_ctx_put(ctx);
> +       tee_device_put(teedev);
>  }
>
>  static int tee_open(struct inode *inode, struct file *filp)
> --
> 2.31.1
>
