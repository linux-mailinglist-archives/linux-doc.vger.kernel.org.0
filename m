Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF144F0850
	for <lists+linux-doc@lfdr.de>; Sun,  3 Apr 2022 09:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiDCHtX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 3 Apr 2022 03:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355101AbiDCHtW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Apr 2022 03:49:22 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F47E31DC3
        for <linux-doc@vger.kernel.org>; Sun,  3 Apr 2022 00:47:29 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id bg10so14044148ejb.4
        for <linux-doc@vger.kernel.org>; Sun, 03 Apr 2022 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GvEskk/jcFfdPgnj5+oAPUcqZMlMyOlYENCxSeZGj6Y=;
        b=rzHiUiDaJUoD6+l9WKV3gPvtiOf8MK9qRru6WhD4es4aAL04tQhPT99W5GCiC0p9yu
         e8Hmiur5SShzMicWAFPczjfvPTV0K0V/trCLiZyFxZpxZmCUIsbSIc97AvkTmWJ5bdGP
         HNWa/B5bKwD30fUyU6UHV6JozZtY0VWVufZc1AI6t8yFpmAD2nC6YmbwdrBD2VNNrQk8
         N6Pk1RWrQSuFXCJjxu/NpbI2zTu1mruzw0lSW1xlCbzTSI+1CYdvMtP5g+WQwoLMOPsy
         ZSZYcoO5dbhcSGAb93UDyIGLeyNowEmRV2bIOHRouqZiSnLdzTXSn/0SIvemeCPqjXrZ
         dfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GvEskk/jcFfdPgnj5+oAPUcqZMlMyOlYENCxSeZGj6Y=;
        b=CLKbqKL/ejo4HmMCw6ZujvkmiYefjec2pI0ncSnsnpaGXuuWEnTPPd1MYV6vb9i3qB
         C/kgdxJi31qp+uwpDZIhiZRpjr2rSVAJ5SeCX/AXZWBZwVjKCcT4746ZGQqzo5nuIIwy
         QLDMHamqoVTHYbZEFo6kcaj8fpwBxl2WJvCLnxkzt4aJ72KPIdVhquWlxRl8KXarscSI
         ONT/QQHcz5QVNgZeTeIYXc1x2CHrPJ7mbSCIjr6pftsr6Feqxj96h26KN3JUoR6jTNZ5
         YI8I4P8HrYsw5U0pH7e2zwQ1+FgY4ViTVDLp60cXEtIJT7T/zqnI+1UQJPSAWj8xOTAY
         7v2g==
X-Gm-Message-State: AOAM530i06y6cuEZ83ylVAjSuuuGV1mqJ27HKN0l3HUZE5B2RzLn32rt
        2gl9F0bCpcRBC8B+mUbWFT7HP4UOWwK2Njix
X-Google-Smtp-Source: ABdhPJzlXrY3xRevI4ad0Zmz1UB26BYq2l/c2aldwLrSIH8K44mLl/k8ZHF0I/zMrZND8R/D+uQL8w==
X-Received: by 2002:a17:907:6284:b0:6e0:f895:15a with SMTP id nd4-20020a170907628400b006e0f895015amr6379638ejc.713.1648972047581;
        Sun, 03 Apr 2022 00:47:27 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id dn4-20020a17090794c400b006dbec4f4acbsm2950582ejc.6.2022.04.03.00.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 00:47:27 -0700 (PDT)
Message-ID: <3eddb954-3d90-8fa8-31e5-4e6c356a7421@linaro.org>
Date:   Sun, 3 Apr 2022 09:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] Documentation/process: mention patch changelog in review
 process
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>
References: <20220402100706.57507-1-krzysztof.kozlowski@linaro.org>
 <c3ea5966-cfc3-8e36-3f0d-dbaf1b1665b9@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c3ea5966-cfc3-8e36-3f0d-dbaf1b1665b9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/04/2022 07:58, Bagas Sanjaya wrote:
> On 02/04/22 17.07, Krzysztof Kozlowski wrote:
>> Extend the "Respond to review comments" section of "Submitting patches"
>> with reference to patch changelogs.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   Documentation/process/submitting-patches.rst | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> index fb496b2ebfd3..9bb4e8c0f635 100644
>> --- a/Documentation/process/submitting-patches.rst
>> +++ b/Documentation/process/submitting-patches.rst
>> @@ -318,7 +318,10 @@ understands what is going on.
>>   Be sure to tell the reviewers what changes you are making and to thank them
>>   for their time.  Code review is a tiring and time-consuming process, and
>>   reviewers sometimes get grumpy.  Even in that case, though, respond
>> -politely and address the problems they have pointed out.
>> +politely and address the problems they have pointed out.  When sending a next
>> +version, add a ``patch changelog`` to the cover letter or to individual patches
>> +explaining difference aganst previous submission (see
>> +:ref:`the_canonical_patch_format`).
>>   
>>   See Documentation/process/email-clients.rst for recommendations on email
>>   clients and mailing list etiquette.
> 
> What about range-diffs?

What about it? I extend here the versioning of patches, which does not
come with range-diffs.

Best regards,
Krzysztof
