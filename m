Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2717B727A10
	for <lists+linux-doc@lfdr.de>; Thu,  8 Jun 2023 10:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbjFHIgo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Jun 2023 04:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbjFHIgm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 04:36:42 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C6526B8
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 01:36:40 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5148e4a2f17so571815a12.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jun 2023 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686213399; x=1688805399;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KP6FTQbezAovuHn8DXvJcqsrbsf1/vJCY3Cy9QhDcuY=;
        b=l4G/0deA780yke9lCVpsQz9+5T9PPXsj68cOKT9hCDkYvKS49eun7pxuHW16iEZP/b
         T1rcaMRIMwY+8YXee5rtf22mLEczKIXKY1g6IJBzTYh471ju92mHUqknGGuLD0DTvK8Z
         gFaYicpruiY2UWFTlTY1B+9YGcvYGv9AmWpOuzaH0SqhJydXhDzbO6yxWhnK0fU60jhp
         bHyzWnQ2qhDJ8aEb4KEPr7YSKlujuWbYyaEDzbcjNUEjblTOKuqMBaiFHiZdGrUpFjbs
         N4XexIeytr493Pqqf1a1u5OohNOLFMz2kR6lq6Xx3EkEt8dXjJ7INiOHPvv8G4fVb2dz
         atLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686213399; x=1688805399;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KP6FTQbezAovuHn8DXvJcqsrbsf1/vJCY3Cy9QhDcuY=;
        b=FceMME2yxW8KSJp1xbCQL+h+ymE3UjQqLFsNwxdH5ju+HzaFh/xSNt0qtliBwotG8G
         fiPsKP9xPKJQ6p0MiDsCzcysuV0xTpbT7gam3KrMfninWSLTfjU6HuIgkLmOS2z6+3j6
         i8gXUuI2wAxQWRbWLPAPJ5KI3+hc2x3m2Uk7XaYTDs7eGrB7MTXJVh45WN/9eU6z/Jbd
         Lk8dC9aIQia9fUIZxKrfZaF3m2yP8gvtQjsxx+UHuvjpIKiU5sSnjRG1+hzReqSfrmYx
         dvV9fsKOjWBl9BtEYhIUJbTGmGCmd+lNqEOQ/YzH7DE0KzO0TCzi9DEkDN91uKca1i4A
         0ONQ==
X-Gm-Message-State: AC+VfDz2aGu5MZUwK3xbJ9+CwJos08TSINI6P24HXz+V8JGs/u4K+Hsx
        ixwi06QdFQsSw7v6G1YWg8IvXg==
X-Google-Smtp-Source: ACHHUZ4Rr0xFX57yVQfz1/k8GLc/jFvOpE/oXWcHFHi0S+gaR1ek3G1G18/OfI6o6YcStn+m8N0Kig==
X-Received: by 2002:a17:907:1c15:b0:96a:8c13:8dc0 with SMTP id nc21-20020a1709071c1500b0096a8c138dc0mr9105461ejc.37.1686213399231;
        Thu, 08 Jun 2023 01:36:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a14-20020a1709063a4e00b0097456b4085fsm383939ejf.190.2023.06.08.01.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 01:36:38 -0700 (PDT)
Message-ID: <9f8a9208-62d4-0c96-7d1c-a452d3d7e799@linaro.org>
Date:   Thu, 8 Jun 2023 10:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v6 1/4] dt-bindings: pwm: Add ASPEED PWM Control documentation
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>
References: <20230608021839.12769-1-billy_tsai@aspeedtech.com>
 <20230608021839.12769-2-billy_tsai@aspeedtech.com>
 <4dffd320-8e30-fb30-6ded-79519afddc21@linaro.org>
 <SG2PR06MB3365DD80EA2FD026D400C4A78B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
 <61278e12-ba39-4503-ca74-a7118b0f6e99@linaro.org>
 <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR06MB336528007D2685F8D95DF4078B50A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/06/2023 10:21, Billy Tsai wrote:
>         On 08/06/2023 09:47, Billy Tsai wrote:
>         >>
>         >>   >> +
>         >>   >> +allOf:
>         >>   >> +  - $ref: pwm.yaml#
>         >>   >> +
>         >>   >> +properties:
>         >>   >> +  compatible:
>         >>   >> +    enum:
>         >>   >> +      - aspeed,ast2600-pwm
>         >>   >> +
>         >>   >> +  "#pwm-cells":
>         >>   >> +    const: 3
>         >>
>         >>   > 3 cells? For one PWM? What are they?
>         >>
>         >> channel, period and polarity.
> 
>         > Don't cut my responses. You wrote you have one PWM output, so only one
>         > channel. What do you put then in the channel?
> 
> You need to put 0 in the cell of the channel, the example of the dts usage will like following:

If you always put 0 isn't this a proof that it's wrong?



Best regards,
Krzysztof

