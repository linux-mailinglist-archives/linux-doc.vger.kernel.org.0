Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3CE755DB6
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jul 2023 10:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjGQICX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Jul 2023 04:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjGQICV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jul 2023 04:02:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE970C7
        for <linux-doc@vger.kernel.org>; Mon, 17 Jul 2023 01:02:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so6465744e87.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Jul 2023 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580938; x=1692172938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybDWeGYh7QkWqKSuqnHy7+o3sCCASBcWk0Zen0RPF2c=;
        b=oQS7I5usrfXc9q0gkIN9Y65z8MX729Uvxqkggz/yHgR5zI/SEHh5DYqV2rdAXHZz6S
         xrXBD9MLtRN+12vp9l0UM+LnEfi6o3Pi+51jaJoKcnUt8mckvAdye4NiO4QMUPytFTk8
         5VN9v1rLHdxhj1u1Gk82EsVI2IRVURW7KldC3dBbuOsVBCk8nBIV3qqIvLHSJIiH4eH+
         Y2lOsr+kTeyQdF6QUXGRFSz6/nkz3mBMy5Xn5+uLI8OG2beLLYHveAtf0TC5lx5fuctf
         mGhsHS38S22KiPxT4CmPMHzmrrVDQUc6snqRe0pDy8L8YgdXFDILzekGXsgw3MNM7uzn
         eSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580938; x=1692172938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybDWeGYh7QkWqKSuqnHy7+o3sCCASBcWk0Zen0RPF2c=;
        b=OE37nrWoOvEbkCgkuMYZI3ulz/n2hRTchRQgLxYYJ3RtGe6skXcM2S1qV1sX9omvlK
         ad+F0fhd2eh0CNwAFti4OCBSYFvOl0UFyJL2aG5ucCKHy14Leg4pjCye/GXg8qLFIQ3/
         Xbjtqaj07C6k86Uom+CUf9MmdwYawcLlhWnMOrdlOXKcUGFGYnzPoiSzJKTRogdF9jbR
         dFWKujcLtrTWGQMuSQscAq3pZWJWuiheIc3kxKN1TI3bTyl5gh6An2qCE9Q1GXnVOao/
         YIlDDJjP3dc7XG59Y+B1ZpuI9FDxApYX9zvsqmKPEzm80dtNQnfFL34oI1+W8yuYcZoP
         SlqA==
X-Gm-Message-State: ABy/qLbQXAYh0S2J47wk0g08OmDNeNtHVurznFrNeLeF5DS/QvlKmoFG
        VetvDMV1xYs3TC/4BB9cRbJzrw==
X-Google-Smtp-Source: APBJJlGaWSnDlZyb6JY1n2wdxR3Lgs52I2miQt9O/go6p3/cQ8xCwjp0Gz89lXxwN9nZK8HZKTWn2w==
X-Received: by 2002:a05:6512:3c92:b0:4fa:5e76:7ad4 with SMTP id h18-20020a0565123c9200b004fa5e767ad4mr9100751lfv.10.1689580937881;
        Mon, 17 Jul 2023 01:02:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640206d000b0051e0bf5807bsm9518544edy.49.2023.07.17.01.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 01:02:17 -0700 (PDT)
Message-ID: <128bcf0e-9b74-0df1-6366-d553475fbad7@linaro.org>
Date:   Mon, 17 Jul 2023 10:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: (subset) [PATCH v3 00/18] Add basic Minidump kernel driver
 support
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <168945921478.1805013.7211960599963339759.b4-ty@kernel.org>
 <ZLSWTaMtr9UGmrDy@p14s>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZLSWTaMtr9UGmrDy@p14s>
Content-Type: text/plain; charset=UTF-8
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

On 17/07/2023 03:15, Mathieu Poirier wrote:
> On Sat, Jul 15, 2023 at 03:13:34PM -0700, Bjorn Andersson wrote:
>>
>> On Wed, 03 May 2023 22:32:14 +0530, Mukesh Ojha wrote:
>>> Minidump is a best effort mechanism to collect useful and predefined data
>>> for first level of debugging on end user devices running on Qualcomm SoCs.
>>> It is built on the premise that System on Chip (SoC) or subsystem part of
>>> SoC crashes, due to a range of hardware and software bugs. Hence, the
>>> ability to collect accurate data is only a best-effort. The data collected
>>> could be invalid or corrupted, data collection itself could fail, and so on.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [01/18] remoteproc: qcom: Expand MD_* as MINIDUMP_*
>>         commit: 318da1371246fdc1806011a27138175cfb078687
>>
> 
> Krzysztof asked for modifications on this patch.

I guess it is fine, no big issue.

Best regards,
Krzysztof

