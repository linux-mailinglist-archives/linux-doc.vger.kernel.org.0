Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB086F69CD
	for <lists+linux-doc@lfdr.de>; Thu,  4 May 2023 13:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjEDLXc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 May 2023 07:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjEDLXa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 May 2023 07:23:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F4D448E
        for <linux-doc@vger.kernel.org>; Thu,  4 May 2023 04:23:28 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso623635a12.3
        for <linux-doc@vger.kernel.org>; Thu, 04 May 2023 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683199407; x=1685791407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmGbwYFNEmy6Gpm8yrNHDCBK7f21iG0oBHbCChuBDzo=;
        b=SeMuzx1Gc1+CNUffk3tXb9glV31wB13nDFWkjs1TzNEDXhdfW4WYUy+aj98mBZuNLU
         SBw/iZRKtKJ9wyziJ8NZTGfdACotPDwQZokqcbsZAMpaC7APRlN8fmJLYbVxmRg41W/x
         Td50c4agrfms7ylD9L2Zo94maP1nqHaer+xCKwrxPyYpNMkMjBvfpFn/SF6W4W6TaQHU
         MV/6/qAXYFkm4qVu4xY9eTAv3fj4Zb8AZlWBM/A7Gw3n2XOvC9EMi/+L54fyJLDBE9FB
         2IExxetd0AaEj1ckHbSa6pmNluCnrqGo638Ixb1Drz5sGmBXCHJrNGhQeHBpzFnQuFWS
         20AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199407; x=1685791407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmGbwYFNEmy6Gpm8yrNHDCBK7f21iG0oBHbCChuBDzo=;
        b=M9+ijOXFIJehatY+g+/8c8IEfB3Kt8N6rLp98AEGZM3YhMGMOGs+Ff7fRBIs3iMs1r
         t+EMCgbTccyS8v1chIn4HvsNSsPpAi9EkdrXtnAgoJtRw7fcoRdXvQOgxHKptcEU5dty
         k8qvvAl2UnisuYqZdMLmBcoWJHbNVzIEc1w/7MhsGRNoZyAxcQ1TAxrjZxitOH/Cz1/A
         XPSinqIViP7xBzFKK/HfnZwXLkzw6S6ov9J5OlhdaqpfGaz2TA2cBf9/uxoLcuSWTfKX
         0S9/Tb4Fdr6TB/DQEDWVnReZsQVAmRRWV1IdXIQMvPPwDpuM9dQotHFaWIsSytlvL9Te
         qZ2g==
X-Gm-Message-State: AC+VfDx3us51pDlHJH82ptcKyHosbeGj/lqprent3d6lUSySINOUtxQU
        0XB1umbNhA6xfdkXXbUC/WC0TQ==
X-Google-Smtp-Source: ACHHUZ5+YcuIOFTodzRF+A9gHgbijRgv3uMNtQwMfGepQcgFdqPPc1mpLKxrR/Scy6g4EpdHiOFHmQ==
X-Received: by 2002:aa7:df94:0:b0:50b:deb5:e1f0 with SMTP id b20-20020aa7df94000000b0050bdeb5e1f0mr1079609edy.11.1683199407047;
        Thu, 04 May 2023 04:23:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id o7-20020aa7c7c7000000b005066cadcc54sm1743430eds.43.2023.05.04.04.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:23:26 -0700 (PDT)
Message-ID: <ad9915b2-56ff-3f95-7c92-fae597d6ed43@linaro.org>
Date:   Thu, 4 May 2023 13:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 07/18] arm64: defconfig: Enable Qualcomm minidump
 driver
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-8-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1683133352-10046-8-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/05/2023 19:02, Mukesh Ojha wrote:
> Previous patches add the Qualcomm minidump driver support, so
> lets enable minidump config so that it can be used by kernel
> clients.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

This patchset is split too much. Defconfig change is one change. Not two
or three.

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a24609e..831c942 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1250,6 +1250,7 @@ CONFIG_QCOM_STATS=m
>  CONFIG_QCOM_WCNSS_CTRL=m
>  CONFIG_QCOM_APR=m
>  CONFIG_QCOM_ICC_BWMON=m
> +CONFIG_QCOM_MINIDUMP=y

This must be a module.

Best regards,
Krzysztof

