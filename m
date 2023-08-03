Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1FB76E2CE
	for <lists+linux-doc@lfdr.de>; Thu,  3 Aug 2023 10:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbjHCITf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Aug 2023 04:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234465AbjHCITD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 04:19:03 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF17855A6
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 01:14:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso7017975e9.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 01:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691050455; x=1691655255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NqGaWIotnKqKyzVdO4mnhnn37JZzzgHfkaj/9pvpDBI=;
        b=ZOwjQWAn7JHFjvwUzCCaWOHFoV4nYBigZDxL/pA53A8MmqPc98WhkWB8eKdDp1OZKb
         HcoFU2/1PWdxhxf+VIgg2OJV9ovta9q+8rV+34rPjs9nhrkvlLexUxH10+8ZX1gzINTS
         byYzHarpU0kESe4wPMGatxISUIFO32Frcj5qZyW7dRIBfh43sh6FGUBDLmyoTPsta8Mr
         kRlmIaqzy7oAGbektaYUDXMUxVcMwIWzb1ZzLQG24QNflszZ+HfXkK4XRTqw+yFDd5/v
         PgB7ztMdy3NqlvBPEzvM1hqR9n8BBqDU8Hx2Sxfj70ZlMOd5IOZ1pzsyjI+fghEzQYze
         9Gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691050455; x=1691655255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqGaWIotnKqKyzVdO4mnhnn37JZzzgHfkaj/9pvpDBI=;
        b=DGA53qLcqALBRMy5dJTIiqEyIBUS4i5P7GxAivhUYHI+gKVRogmis4jOEczK9XotGO
         eKUm5F8BD+6OvV9uFoxYJw87uVqKeqdm192MEZlv45/t95qZ1k+QUQ/MVtzrG0fi+hlI
         KP19GqFUr3P5bct1Mf+iWAEF/YoaNhkt8CMEpmtezerSPAng0RwbcCxqERQcP87kemie
         LG1PRaGw81WXefz+MGkvz/SlbbdqVK++v0tImEmuox2RJcnEm3pOcvYquMOgG2L34/tz
         h3FP95Ss0Ic/3AcAW21f5qgni2bzxOG+npWmBmJ+NfRMO++Mnb6tB7LFQ2OLwDu0xJfM
         09sQ==
X-Gm-Message-State: ABy/qLYW4pDIcu+EkIuVQGkHU1Jruo2pcdzku6dnJe+TeA+D+250shUj
        X7zPcgQxbTXMXExiyVrxbURm0g==
X-Google-Smtp-Source: APBJJlHG7TGw7P8HEiLdxgaTyrTJbdQEUF5FJHRQOuTIptudXZcmxU7cKeKFDJfovphAgYX5+VJ/wA==
X-Received: by 2002:a05:600c:2a54:b0:3fa:934c:8350 with SMTP id x20-20020a05600c2a5400b003fa934c8350mr6677648wme.27.1691050454645;
        Thu, 03 Aug 2023 01:14:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966? ([2a01:e0a:982:cbb0:8656:583:d034:d966])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bcb03000000b003fbb06af219sm3567818wmj.32.2023.08.03.01.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 01:14:14 -0700 (PDT)
Message-ID: <7e8202d9-3207-bb22-d69d-b2c80eca2a02@linaro.org>
Date:   Thu, 3 Aug 2023 10:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: Fix todo indentation for panel
 prepared/enabled cleanup
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
 <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
Organization: Linaro Developer Services
In-Reply-To: <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/08/2023 16:47, Douglas Anderson wrote:
> In commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled
> in drm_panel") the formatting for a code block was not quite
> right. This caused an error when building htmldocs:
> 
>    Documentation/gpu/todo.rst:469: ERROR: Unexpected indentation.
> 
> Fix the error by using the proper syntax for a code block.
> 
> Fixes: d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20230802141724.0edce253@canb.auug.org.au
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   Documentation/gpu/todo.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index aa0052f9b93b..139980487ccf 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -465,7 +465,8 @@ Clean up checks for already prepared/enabled in panels
>   
>   In a whole pile of panel drivers, we have code to make the
>   prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
> -been called. To get some idea of the duplicated code, try:
> +been called. To get some idea of the duplicated code, try::
> +
>     git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>     git grep 'if.*>enabled' -- drivers/gpu/drm/panel
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
