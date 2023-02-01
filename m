Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 365FF67E974
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jan 2023 16:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbjA0P3n (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Jan 2023 10:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbjA0P3m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 10:29:42 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA90D6278D
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 07:29:39 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso3737155wmq.5
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 07:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1suuUkzT2SD8pmtmuon89jC62J3QtPypnaFKVAj0JU=;
        b=bwY38uJB+sriymVN1affGyIH3e8EGQcrs8YKjvh5MGKqKsxw6S457orZdVhke9kKXe
         JFN3iG/hZYsCH1yFkY55DPzQu/hCMkuaYv2lJ0zIxRSGde2xfMnfSsEzpAlAa7K2zl5O
         XAHOlxaKN4Exj1XlBCMKtURAeuWmV7dKvmPu2/GLXzBa1e0PMjxPcsSqTs2DnT4k7T3/
         n4MVNJder0ih+AU/e5dHcPdnAlkEN54K9J7tQkx1smzT1plVkcicETKvBkiVZ8JS0e3h
         my2SABlbe1PZj0hALj/EC6MbjYwG25h35lC1cQP4PSB018xOy8/3zjFhcOr7MpimDzMs
         8MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1suuUkzT2SD8pmtmuon89jC62J3QtPypnaFKVAj0JU=;
        b=r+1F0VG1tIS6l5jgVsnJ++hSIX3fRoMBaXOsGj1eNhwyzUqpggpwhFoOrBbs6MRw7z
         b6aDvcvFN2efqY93uihWgIQyb9j20l7Zw2mLClKzF1fyGVMtk+ISj2d3afQDMqVJn1cR
         0Wy2fbmopKhy/C8oyhKZtRntbyxflHyFbV8RyicPML/ujQn3f24YkwQcZ9lvfKDN6jXt
         wBck0lkA15GN7U+i0miv5mUkTT+vH/Y8iv0LESvRcD3M81rPn3rEfr0wK9GcKzbf97b6
         6MSuqiaE5eMukvbZs/+FG4Js25x4FGUuHsyL57JgWs2cNahNtdXfKUC5rbjKkKWHRHCe
         GFwA==
X-Gm-Message-State: AFqh2kpDTTGES7tz9VRRMWL4nJQ4Kb/ecyox2xLgNvMxG8yGFQMgtoSq
        zdUBBBpRfPPpmhNu59lzfknUWyfBrzn0w/KA
X-Google-Smtp-Source: AMrXdXu3It+BDt9Fk5ZVJ6Wg+8jB7MrEqaO8ptgkjTk7HV5zV8bW1yAZRWRGkLqOzHVqCQBoQ74/5g==
X-Received: by 2002:a05:600c:a29e:b0:3d9:ee01:ae5b with SMTP id hu30-20020a05600ca29e00b003d9ee01ae5bmr39390660wmb.12.1674833378435;
        Fri, 27 Jan 2023 07:29:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c434700b003dc3f195abesm1262902wme.39.2023.01.27.07.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 07:29:37 -0800 (PST)
Message-ID: <7ce28c64-9d5f-78dc-6f81-665c32c3e00c@linaro.org>
Date:   Fri, 27 Jan 2023 16:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] dt-bindings: ramoops: Inherit reserve memory
 property
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>,
        linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <1674832236-6754-1-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674832236-6754-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/01/2023 16:10, Mukesh Ojha wrote:
> The reserved memory region for ramoops is assumed to be at a
> fixed and known location when read from the devicetree. This
> is not desirable in an environment where it is preferred the
> region to be dynamically allocated at runtime, as opposed to
> being fixed at compile time.
> 
> So, update the ramoops binding by inheriting some reserve memory
> property to allocate the ramoops region dynamically.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Guilherme G. Piccoli <gpiccoli@igalia.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v3:
>  - Fixed yaml error and updated commit text as per comment.
> 
> Change in v2:
>   - Added this patch as per changes going to be done in patch 3/3
> 
>  .../bindings/reserved-memory/ramoops.yaml          | 34 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.yaml b/Documentation/devicetree/bindings/reserved-memory/ramoops.yaml
> index 0391871..8741626 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/ramoops.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.yaml
> @@ -10,7 +10,8 @@ description: |
>    ramoops provides persistent RAM storage for oops and panics, so they can be
>    recovered after a reboot. This is a child-node of "/reserved-memory", and
>    is named "ramoops" after the backend, rather than "pstore" which is the
> -  subsystem.
> +  subsystem. This region can be reserved both statically or dynamically by
> +  using appropriate property in device tree.
>  
>    Parts of this storage may be set aside for other persistent log buffers, such
>    as kernel log messages, or for optional ECC error-correction data.  The total
> @@ -112,7 +113,13 @@ unevaluatedProperties: false
>  
>  required:
>    - compatible
> -  - reg
> +
> +oneOf:
> +  - required:
> +      - reg
> +
> +  - required:
> +      - size
>  
>  anyOf:
>    - required: [record-size]
> @@ -142,3 +149,26 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    / {
> +        compatible = "foo";
> +        model = "foo";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        reserved-memory {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
> +
> +            ramoops: ramoops_region {

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

