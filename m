Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0876F61E1AF
	for <lists+linux-doc@lfdr.de>; Sun,  6 Nov 2022 11:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiKFKkL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 6 Nov 2022 05:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiKFKkL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Nov 2022 05:40:11 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5762425D5
        for <linux-doc@vger.kernel.org>; Sun,  6 Nov 2022 02:40:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j16so13099240lfe.12
        for <linux-doc@vger.kernel.org>; Sun, 06 Nov 2022 02:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hy5N22BpARKaJzqpJuq2/NEKYC2Fhc4A8Sg9hguEVA8=;
        b=S75r7pvYMadC9PSS2c+Wd+6k5dM0w3C0P0gogwtiqC46FvJxSCKmVRf62qL4ZllmIp
         X6/RFJnbfP0oQUHznGwJrFIBsJN7zp+sqJki10B6Ei7ucPjFaRHuCDvU9esJPhb6vMo9
         xM/1btnjEmGqYcipYa317JZa7KVGgVI1YJkaBO3qBFJUevwHXbLOKrd4Z/X5ZWYC2vS8
         wXc/aQQdKSyX3m+BMnRzbuyKxETERfExC3ovnIUHIHS5uu3Cu0VAbNa4UkxI+3mgWG7a
         ekOJ3kToFBvKsAfZl28DKwU8LhVWNk5GIhmdaDJwAx+59QGbAzn+7hMPNyJfLA92XYGJ
         6Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy5N22BpARKaJzqpJuq2/NEKYC2Fhc4A8Sg9hguEVA8=;
        b=KzYjH0CdgQla6Y2gpxzzzlRHzC8x1gBr2wj+aMCBXYF1X3th/fMDVv6dTyaZveXg9p
         9theQfFO+NwVs81ym0QsvtoOrtHtn8h/Iqr07ZId9ANgERKyPSquoH5LnNGvmmQ8qPW3
         MI9YUoji7dW/WqrUGeeYsFUjpfCS3CsjeIzqzBI1qp8iUPZvXj1GNqxF4EAmkzLsBl+Z
         C8cuP8R9KZx3NeApKAQf4kKJFZXBJGtkDNVJGYQrDQZlIDqPMfewBiQwW3Y3/OOGkL9p
         PDfZ5G7h304RhCSxL3dT18v8ZKu3PiTMKmI4VVKwK/GA0CIdqkH2I044NkgGKXg8Ynic
         khIg==
X-Gm-Message-State: ACrzQf3O0rHBkTfi6i+uQI0cGa+xnkDmr4EvtuBWuRLPh5jNRL1o6zZZ
        Fjf40+1wOYWGxxwgLEnPj0PzeA==
X-Google-Smtp-Source: AMsMyM6noxGoBuZzh4cVN3T75v56NmIEoYOqzwnW86ZQ9lPU4V6cHxR3c+S7r4c3yzZX0NJ9Jv5nxQ==
X-Received: by 2002:ac2:58ca:0:b0:4a2:d337:bb0 with SMTP id u10-20020ac258ca000000b004a2d3370bb0mr16513780lfo.452.1667731208735;
        Sun, 06 Nov 2022 02:40:08 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id y17-20020a196411000000b004b1b0f12cb4sm637543lfb.201.2022.11.06.02.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 02:40:08 -0800 (PST)
Message-ID: <408e68d0-1ae1-6d56-d008-61de14214326@linaro.org>
Date:   Sun, 6 Nov 2022 11:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 5/6] ARM: multi_v7_defconfig: Add GXP Fan and SPI
 support
Content-Language: en-US
To:     nick.hawkins@hpe.com, jdelvare@suse.com, linux@roeck-us.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        verdun@hpe.com, corbet@lwn.net, linux@armlinux.org.uk,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221104193657.105130-1-nick.hawkins@hpe.com>
 <20221104193657.105130-6-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104193657.105130-6-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/11/2022 20:36, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> In order for HPE platforms to be supported by linux on GXP it is

s/linux/Linux/

> necessary for there to be fan and spi driver support. There fan driver
> can support up to 16 fans that are driven by pwm through the CPLD. The

s/pwm/PWM/

> SPI driver supports access to the core flash and bios part. The SPI
> driver spi-gxp was added previously to linux.

s/linux/Linux/

> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 12b35008571f..92a854e7b01b 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -445,6 +445,7 @@ CONFIG_SPI_CADENCE=y
>  CONFIG_SPI_DAVINCI=y
>  CONFIG_SPI_FSL_QUADSPI=m
>  CONFIG_SPI_GPIO=m
> +CONFIG_SPI_GXP=m
>  CONFIG_SPI_FSL_DSPI=m
>  CONFIG_SPI_OMAP24XX=y
>  CONFIG_SPI_ORION=y
> @@ -535,6 +536,7 @@ CONFIG_SENSORS_NTC_THERMISTOR=m
>  CONFIG_SENSORS_PWM_FAN=m
>  CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>  CONFIG_SENSORS_INA2XX=m
> +CONFIG_SENSORS_GXP_FAN_CTRL=m
>  CONFIG_CPU_THERMAL=y
>  CONFIG_DEVFREQ_THERMAL=y
>  CONFIG_IMX_THERMAL=y

Best regards,
Krzysztof

