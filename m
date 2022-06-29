Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B5D560670
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jun 2022 18:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbiF2QqW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jun 2022 12:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiF2Qpu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jun 2022 12:45:50 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C3535878
        for <linux-doc@vger.kernel.org>; Wed, 29 Jun 2022 09:45:31 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id p14so10682433ile.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jun 2022 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xGIU+aRPCYaMBfL+8XL6sraQKPPP1WAl6hN6GjVRnm0=;
        b=ZLTOZGyhHOsDXU9kON9b5y+LQvnnaHc11gH1140IIjaZ/QzAsI3uZ0Zl7HrBUctSMC
         AJGGcAXit/fC21y+87Lea8X3Z0udGhItxi+Nl8SgS9EhjgSoby0BAwDAJ19YqdUti1HK
         18B8di56pIVsQrA35xlGeeFhLiDg7vIQclYKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xGIU+aRPCYaMBfL+8XL6sraQKPPP1WAl6hN6GjVRnm0=;
        b=NjOGTdw/Y2yZqGBR0UswkzbMlIkcZNQVd5y+ZLToRptPDf5mg59qxIbTgmwfCWkvvj
         Om9VGqfeDVPhPyQYwfZpAsgC1CcId7xvSEEJsxX5CuGwpulFqI7hh/6jWDodtblr6+E2
         YQLvQxrbgAM8zMZY6BKKUAgcR5hniTlYYSG6mPV5ZWXagIT9S575zRTq/+Lm/GDpb2ry
         bOucLPSv7CC3k/rJrYEiFtBQ43Y2Jrwdcw1iTKhT0xbm+7zGFXQq6fnYUr/qxU246xXO
         7OkDYes0JUP3t4DVEMdGAn7cVIc5XVmwqZicvAiRKsiRkX2Ph8R/sX3+TcgQ5wQakshq
         CBUg==
X-Gm-Message-State: AJIora8XjpvGTAYjBEHxUm038GJfeBcrPnE2D2AQi6oJWsAGjpZsZCbn
        UFDrBqm0FKXukgUas2Ks0HASuA==
X-Google-Smtp-Source: AGRyM1svrUEQkOYs/zv+vQ4Xxcu9a59RDyYG4Qo6FelRQT8rNSrPlrN4x8Mlsnkms2FHETr1M+85DQ==
X-Received: by 2002:a92:b00e:0:b0:2d6:538b:b866 with SMTP id x14-20020a92b00e000000b002d6538bb866mr2348519ilh.199.1656521130140;
        Wed, 29 Jun 2022 09:45:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x17-20020a029711000000b0033a29ec646dsm7511423jai.4.2022.06.29.09.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 09:45:29 -0700 (PDT)
Subject: Re: [PATCH 1/3] Documentation: kunit: remove duplicate kunit-tool.rst
To:     Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        brendanhiggins@google.com, davidgow@google.com
Cc:     linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220603195626.121922-1-dlatypov@google.com>
 <87pmix3ktq.fsf@meer.lwn.net>
 <2c3399e9-4f4e-a71a-4030-e4e6d72b5d4e@linuxfoundation.org>
 <8735ft3co5.fsf@meer.lwn.net>
 <96154234-7842-3bc9-d89f-eb20be40e6de@linuxfoundation.org>
 <87lethyc57.fsf@meer.lwn.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <aeac8d90-fab5-7887-77f0-48b8d5f715c7@linuxfoundation.org>
Date:   Wed, 29 Jun 2022 10:45:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lethyc57.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/27/22 4:28 PM, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> On 6/24/22 4:43 PM, Jonathan Corbet wrote:
>>> Shuah Khan <skhan@linuxfoundation.org> writes:
>>>
>>>>> So not that long ago these patches were going through Shuah...it seems
>>>>> that's not happening anymore?  I can pick up kunit docs patches,
>>>>> certainly.  I've taken the silence on these as assent and applied them.
>>>>>
>>>>
>>>> I am still taking ksefltest and kunit doc patches through my tree. I wait
>>>> for Brendan to ack at times. This one didn't show up in linux-kselftest
>>>> list it appears.
>>>>
>>>> If you cc linux-kselftest and I get an ack from Brendan, I will take this
>>>> through kselftest tree.
>>>
>>> As I said up above, I went ahead and applied them.  I can drop them
>>> again if you want to carry them, just let me know.
>>>
>>
>> Jon, yes please go ahead and drop this one. I will wait for Brendan
>> to ack it. Reduces confusion in the future. Very often, there is code
>> dependencies as well.
> 
> OK, I have dropped those three commits.  Note that I also had to drop
> Randy's patch which had been waiting since April:
> 
>    https://lore.kernel.org/linux-doc/20220401024707.10550-1-rdunlap%40infradead.org/
> 
> since it conflicts with the above.  So you'll want to pick that one up
> too.
> 

Thank you. I will pick these 3 up.

thanks,
-- Shuah

