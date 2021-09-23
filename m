Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87540416561
	for <lists+linux-doc@lfdr.de>; Thu, 23 Sep 2021 20:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242793AbhIWSvv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Sep 2021 14:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242795AbhIWSvv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 14:51:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B49AC061757
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 11:50:19 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u18so28784001lfd.12
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G+xBDmQPXKsiGLr3VFMM2p7CpCvy6Zy6mjF1IkZrEIc=;
        b=y3X4xo8LVdZMrchYSTb0hQnOCCOXfWzr6tEV4tU2YsVOLgy8fUwLfb1w8hP2yiP2GT
         ZRjEuMxdtKdzMTw1ktv61HJpmLMtARrXWmld/U1ns3nWx3mn1vPDzi6zUry/stv95Mgj
         2KYwwNIMeQ9MWVJQwIPAjHowZrMZEFPqcWRwYwBIZepnKm2qC4OeQNRnuFXWo8q3k9SG
         DT9dDeYx6ajv7y/8OrQ9HdINic5v1tcDb25oKDYb8xSu3GA5AW/eypqW3IttgTkfcAIU
         3FrnVA+hK5lUYEEMuNwQaqKPRYe3U8l1sPLxhZsuBvTh0mFTH3banaEkmb2Hox8BbWnT
         LQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G+xBDmQPXKsiGLr3VFMM2p7CpCvy6Zy6mjF1IkZrEIc=;
        b=E7iT780f3F75otWQYEq16MCVo1jV6hwpG/gQf/JMAfitWh4N0LJiJX5msHoe3T2ezv
         cwS5U7KdkWP8FkP8iEyp7GVKeLFn3EcA3/8FgsayKdoVRg4HWi0ICym1VJVQZaCxTt7N
         w5+SnGeBQQ2hE1YIjrJ3p0kZOBI8CyWoc3q506A2dW6fOiw1yD7S4AiXPhL81LS0agxj
         o0wTaE46kA22lfW0fIRKpF0Jh2y/wDWH3MjRTXyGGfHCr/s1Die89LxnFMs1PhZ8m5RM
         4aDSxx2j4RlgDMhnCMParX5ovyjgHR8jtJ3enRyuE3TJYbfpH4f+ItrSZKM8yk3DywtA
         UnLg==
X-Gm-Message-State: AOAM532r09QKrgL/GEtlInKSVP3pETFiC3IW7jJZ8avAu9VGBry3ES0j
        JoBvYiXuqgBLkv47bQalFaQPaYt5i1YBC4qpPiXnxA==
X-Google-Smtp-Source: ABdhPJxmuOPc/eEBZuFHS88X/WSvOdyPLq05/U0zOuP+5xD4VGlhAcmpTse2JIvNDLEh6CKIOgsb+rXfqVJ408et2/8=
X-Received: by 2002:a05:651c:20b:: with SMTP id y11mr6770656ljn.463.1632423017540;
 Thu, 23 Sep 2021 11:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631785820.git.mchehab+huawei@kernel.org> <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
In-Reply-To: <820bb7a1d7e0e51cbea72c9bee6bce806427d1f3.1631785820.git.mchehab+huawei@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Sep 2021 20:49:41 +0200
Message-ID: <CAPDyKFrZptmXAfJbf7eUyrQ0dMVSZbpdXw=CfK-LSYbEeMayig@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] dt-bindings: mmc: update mmc-card.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh@kernel.org>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 16 Sept 2021 at 11:55, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> renamed: Documentation/devicetree/bindings/mmc/mmc-card.txt
> to: Documentation/devicetree/bindings/mmc/mmc-card.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 922eefdafc80 ("dt-bindings: mmc: Convert MMC Card binding to a schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap_hsmmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index 7a29ad542e4a..9dafcbf969d9 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1510,7 +1510,7 @@ static void omap_hsmmc_init_card(struct mmc_host *mmc, struct mmc_card *card)
>                  * REVISIT: should be moved to sdio core and made more
>                  * general e.g. by expanding the DT bindings of child nodes
>                  * to provide a mechanism to provide this information:
> -                * Documentation/devicetree/bindings/mmc/mmc-card.txt
> +                * Documentation/devicetree/bindings/mmc/mmc-card.yaml
>                  */
>
>                 np = of_get_compatible_child(np, "ti,wl1251");
> --
> 2.31.1
>
