Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7AF723FF0
	for <lists+linux-doc@lfdr.de>; Tue,  6 Jun 2023 12:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237339AbjFFKoU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Jun 2023 06:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235004AbjFFKnc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 06:43:32 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE71E171D
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 03:42:09 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so8305633a12.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jun 2023 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686048128; x=1688640128;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hztYX3lCCszrQN2sLS6OQQbXo0IrqmI3DHUIMhxyE4=;
        b=xt5rNJ5A92ysQqwhJJhYw0coJTIrKX4DgtbH5fGHfhu5LpDsAZHObPbCnwNHtaMZJq
         G1rbDd7KajXMFc+VlKEkb1tJTOGEcY7/xrhIrYpkQ6NAxSb06EhGap3os+1IPzumdbTF
         wbOv9kZC+/oWDrZJALtqTUYOSS/Mu1JkbYw8DDRMZ0b/QllhL3Mr/xv73KHFNAIlRoLT
         N353oc5ZG3FbdvSogTOYrSGcWRHNGgeZbzsm8NPlkfj4bGhDSe3Z3M8OgaaNxvm36rbO
         3HEAplByMqOIHmg9Atam/7BlRPW9QgKS8pJNMJM0zuw+kF8TNi4FSLN+vtrxaXlrXIfT
         LzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686048128; x=1688640128;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hztYX3lCCszrQN2sLS6OQQbXo0IrqmI3DHUIMhxyE4=;
        b=TA4NN2ofPUDaWDRhB9UyO+UtB6kdxrfbP2uTv6Dsc5vSggdVgJXaVB+/YNwdzSelrU
         JoztECR7WGGabtHQAG9FBhxO5esEewyA/4uoQpFGxO5mHHvb65pLwdLyogT9yC5SSy8x
         HOwYnTSzIAOORAcZ7xPs4ZL9qlbLblhYg560lxfGmWP0xIjqZ/dY7kpMVGPBe3jlpqrS
         X0nas3B7BYeXXbR3t3owzeXdbUtEZ+X6s7/H2Fd8s49pGgLZbtJNXnYCgk8Ka9Hc4QbS
         ykqamMog7CWX8ruM0ck0DHx3D9OSmYyGAjI2K9euYw+wKq0Bc8c08b2Bj9Eg8LsJmGzv
         UrRw==
X-Gm-Message-State: AC+VfDzWcjyKiQHeSrdfPPUvwvbrdEeLQJQDrCvsLVfJJCMtNouF9ADl
        jVk9Zef1oTNqw2UOnZTwvpPA3w==
X-Google-Smtp-Source: ACHHUZ4AfaeSpVY/ckQkqL5x95HhvZI47BGZCIoqkV64ZUEXQa8B+xm4b1XkP3o7H2cESv0dYCWcVw==
X-Received: by 2002:a17:907:7f10:b0:974:4f34:b04c with SMTP id qf16-20020a1709077f1000b009744f34b04cmr2114952ejc.41.1686048128277;
        Tue, 06 Jun 2023 03:42:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id fx4-20020a170906b74400b00977d0f1c5bcsm3115801ejb.69.2023.06.06.03.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:42:07 -0700 (PDT)
Message-ID: <636526b0-b5b3-aa80-49f7-fa805ebbac5c@linaro.org>
Date:   Tue, 6 Jun 2023 12:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [v5 1/5] dt-bindings: pwm: Add bindings for aspeed pwm controller
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au,
        lee@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, corbet@lwn.net,
        p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org,
        patrick@stwcx.xyz
References: <20230606094535.5388-1-billy_tsai@aspeedtech.com>
 <20230606094535.5388-2-billy_tsai@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606094535.5388-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/06/2023 11:45, Billy Tsai wrote:
> Add the aspeed pwm device which should be the child-node of pwm-tach mfd.
> 

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof

