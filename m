Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12ED1750685
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jul 2023 13:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbjGLLq1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Jul 2023 07:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjGLLq1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jul 2023 07:46:27 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488461980
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 04:46:25 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso110569641fa.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689162383; x=1691754383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6oxAFthf1na6BIIid11QqD+6DrC58Bsamx6gCqg45Q=;
        b=fOzZZHToBty9nPPlmtQ2xc4c0NmYr9Kp0112ouWMxCSKv3VrHxK/RwRA5NgFj20Nyj
         FUGlYZw3trPM35KO+vFdbY0gRdnWdT3urlvr7MIdQQBpQR/mEf3qWCowWNt9O+yd5mLW
         a4a6tN0COlwOQ4nL/jFZFuTDpPFf169C6Zze/Tcapou71FnuOSDGzkTKv6owQ8+dlBOw
         clbd1P26c+ajGDdEFk+xlsa1M42OPEO13GC8BEMHDx0bN4gaSRLs8yUzIizK411mHQ1I
         C6mNo5kohqHp/G3uLhJMwe7qyEyiLHJ5V8SUDfo+tq4neehmiynlElcPIniV+w2icgzh
         ghRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162383; x=1691754383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6oxAFthf1na6BIIid11QqD+6DrC58Bsamx6gCqg45Q=;
        b=ZNAQSRV7Ub1yuqn0PXDMfR05pyRw8+xMqEjjsnX6N08qPXL2nQDIuqZAZbVEsNHNRU
         gywFmimEGVFnRQQvL9aNFeKm1BDL0jiZDq0upML7z7BRPlwmEbdUz9RaKI2yIbfeIJjl
         epZIBHGIjnj8fFfWfPlwasAGcIHDr93LWqpqvhEOco3vMahWCB7SSxzY8WBt9cmdJ38k
         0S3ItTQi1wyKmSa1Ntv7KqRikDoTqXMJwP2D0tp6JwTWZw311iENSj7GP/10EG00eDKI
         SF6+17uOpEigTX8JD/Es2krTFws+1ypz+1CvG3WDGXZVpwrSyfzEbgpt7hNxYWFHYJek
         +Opw==
X-Gm-Message-State: ABy/qLZpFzC+V1DLPzFZr0kSUrLfHUEDFXKY/6GDMH6iMgd2NyfCGIt7
        LwanN+KpbnYgkdk1jWy0ZPHQYg==
X-Google-Smtp-Source: APBJJlH9tLxXyCwdjR9f+WErBAl9fkXrfQotNE+9Zu5RMfsAVFw4GCvJ/UQpv70M5B9nxMbbqanR1A==
X-Received: by 2002:a05:651c:120c:b0:2b5:80e0:f18e with SMTP id i12-20020a05651c120c00b002b580e0f18emr16876660lja.3.1689162383489;
        Wed, 12 Jul 2023 04:46:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b0099342c87775sm2477707eja.20.2023.07.12.04.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 04:46:22 -0700 (PDT)
Message-ID: <da79ac87-f112-be43-52b2-2293e1a99d9b@linaro.org>
Date:   Wed, 12 Jul 2023 13:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation/process: maintainer-soc: document
 dtbs_check requirement for Samsung
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
 <20230712-skier-ribcage-0d82be7e16fd@wendy>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712-skier-ribcage-0d82be7e16fd@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/07/2023 11:48, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 10:41:31AM +0200, Krzysztof Kozlowski wrote:
>> Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
>> bring any new dtbs_check warnings.  In fact this have been already
>> enforced and tested since few release.
>>
>> Cc: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> 
>> Not sure where to document this. Creating new maintainer profile for
>> Samsung SoC would be an overkill. OTOH, more SoCs might want to grow
>> this list, so this also scales poor.
> 
> To me, this portion of the document was "information to the
> submaintainer", which would be you, not information to the contributors
> to the platform. Adding the comment about Samsung SoC seems aimed at
> contributors?

Yes, I want to document it for contributors, so they won't be surprised.
Any hints where to store it? I could put it in the "About" tab of my
kernel.org repo, but no one checks this for contribution guidelines.

Best regards,
Krzysztof

