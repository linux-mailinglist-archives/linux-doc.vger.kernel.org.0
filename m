Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B257619EA
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jul 2023 15:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjGYN2O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Jul 2023 09:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjGYN2N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jul 2023 09:28:13 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99D310E5
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 06:28:10 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-317715ec496so155213f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690291689; x=1690896489;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HL0T6H/EfUbYgBfW0MPg+n5xypCoWhi+Eukq1dYSLSU=;
        b=Yyqy/6LQz7P0c6LN2BJ8PYCKWIbJTGfBx5WmBhojsqhf1+nWU6KbwLK70p56PaKpkb
         3UBGxh06++q61haJ9+Ug1scKRTfZbR0SDEPuUfCiSwRiqF6EXUJF63BfiFD0KEp/PNbd
         NUSnvFr+9vY0Q+Kd46yOmC7NUx1uPGqTqCwG3EKf8MiZAmmXXpEkfzRtnfwlrRLcwolG
         xEfp12ZUCd1gFSuW6kS+fVWI9w5Y491kAJMlIPQqhmjOr9oXAeoskMmEFc6PSq5F6yry
         X3hS9AuUnBELD/3xt8+5pr/bJ2bT8E/AFsODzX9yBrjLNRyk1hDFlqxwizcRuaUI+N9e
         ml0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291689; x=1690896489;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HL0T6H/EfUbYgBfW0MPg+n5xypCoWhi+Eukq1dYSLSU=;
        b=gy7BjDvTZc6+fo6W298BWO+EMy1g51cNSFRZTQa70bfk+Iy7PvUirxw2GttqMFLegT
         2PLagz/6kY9ZweWZpt8sFwVpyOn5UJiaoxEjBpRgrkV3UMM3+sW5ch5xIr5wv19QJhD4
         dGObHM5jR3s7e3owVouJXhjG8P3+NEkVuJKdopsJpWxWsMUnkkfnNTQF1z5k8Jh65zDV
         NOEDMtOkA9EA+L28HngMwEXtBe6GR1nNFl9+v8mY1zX7eftffjjy/8gA06h3GRsSb9R4
         83R0fr10zF/mIynh/aWUFEMkUA5V+OTHDzV4f4qRwcPMZVcN0I/J6M8+Bb3xZNRYdzto
         0G2g==
X-Gm-Message-State: ABy/qLZ8r+ev7FoSOG5hbNNLy0KVP+r9lX50s1ZO5LWdpyIljv2AbRLA
        6OqfHg9WTnidarXamVzygWqu6w==
X-Google-Smtp-Source: APBJJlHKh1Rx41U19FhczWdPNN/82vyW/RshDVEPcQ4Q4DIvjB94EasFuMPtFRQ4ByoPGusL9OKOug==
X-Received: by 2002:a5d:484c:0:b0:317:6ea5:ab71 with SMTP id n12-20020a5d484c000000b003176ea5ab71mr989517wrs.30.1690291689222;
        Tue, 25 Jul 2023 06:28:09 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.203.142])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d6785000000b0031770443c4bsm947250wru.28.2023.07.25.06.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 06:28:08 -0700 (PDT)
Message-ID: <5ba5530d-cc5c-9e20-742c-946c0af6c98b@linaro.org>
Date:   Tue, 25 Jul 2023 15:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] docs: move mips under arch
Content-Language: en-US
To:     Costa Shulyupin <costa.shul@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Heiko Carstens <hca@linux.ibm.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Wu XiangCheng <bobwxc@email.cn>,
        Paul Cercueil <paul@crapouillou.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20230725043835.2249678-1-costa.shul@redhat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230725043835.2249678-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/7/23 06:38, Costa Shulyupin wrote:
> and fix all in-tree references.
> 
> Architecture-specific documentation is being moved into Documentation/arch/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
> 
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>   Documentation/arch/index.rst                                  | 2 +-
>   Documentation/{ => arch}/mips/booting.rst                     | 0
>   Documentation/{ => arch}/mips/features.rst                    | 0
>   Documentation/{ => arch}/mips/index.rst                       | 0
>   Documentation/{ => arch}/mips/ingenic-tcu.rst                 | 0
>   Documentation/devicetree/bindings/timer/ingenic,tcu.yaml      | 2 +-
>   Documentation/translations/zh_CN/arch/index.rst               | 2 +-
>   Documentation/translations/zh_CN/{ => arch}/mips/booting.rst  | 4 ++--
>   Documentation/translations/zh_CN/{ => arch}/mips/features.rst | 4 ++--
>   Documentation/translations/zh_CN/{ => arch}/mips/index.rst    | 4 ++--
>   .../translations/zh_CN/{ => arch}/mips/ingenic-tcu.rst        | 4 ++--
>   MAINTAINERS                                                   | 2 +-
>   12 files changed, 12 insertions(+), 12 deletions(-)
>   rename Documentation/{ => arch}/mips/booting.rst (100%)
>   rename Documentation/{ => arch}/mips/features.rst (100%)
>   rename Documentation/{ => arch}/mips/index.rst (100%)
>   rename Documentation/{ => arch}/mips/ingenic-tcu.rst (100%)
>   rename Documentation/translations/zh_CN/{ => arch}/mips/booting.rst (92%)
>   rename Documentation/translations/zh_CN/{ => arch}/mips/features.rst (65%)
>   rename Documentation/translations/zh_CN/{ => arch}/mips/index.rst (79%)
>   rename Documentation/translations/zh_CN/{ => arch}/mips/ingenic-tcu.rst (97%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

