Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E274D55A47D
	for <lists+linux-doc@lfdr.de>; Sat, 25 Jun 2022 00:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbiFXWvI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Jun 2022 18:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiFXWvI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 18:51:08 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A6E2E093
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 15:51:07 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id h20so2389923ilj.13
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 15:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hdt4ZYpp63JRACIsbloHgicgraSn3MN/dM7NXJQ38ns=;
        b=DL0Yy/9Uqn6QLp2L9FMPSa14qJ2xpVciSvvIOpCJ8ZLFEYFVR9XAHEV1C+IURrGH3f
         +jBTpPSruIoY6t3oO63RyA8P0EVxB94mzRnyCMU7AkfBK5ZcDoVnVtL57SyXG6rsifvr
         RkNcfsIt9aTMZU2QfQxC/+9yuSQmRRKPGw3PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hdt4ZYpp63JRACIsbloHgicgraSn3MN/dM7NXJQ38ns=;
        b=Z6rAFgpJ91aiRkL7/5dNIgGJb/TMUdZY27Xu0nO6kuuyAGe3c0YJdwQFyt7UAdrDLG
         FAGH01FcbHTFeSja39EcxfPdUx3Q3TejI4kO0s1fLomw83fkDYXWTFA5CI9EfOAu3v2v
         0+Xi9PfMkDlGC2oANIxoz9oWHSuLFolnrsT1fJyf8JTR5D3/PEZBEV4NGQbdTYFBL9Id
         8LNzDzkluXXukVl7T9NmrCLCJsqPkmVd3B0jHjOZmQ1AsFNYxFmtI2BxGavmcYMd29q1
         Yk5eMeldREvr18UF4nI0RHnvh2V+cmWR472ewroChbqfT9zNw5t6XpyUP29J230rLUmX
         EKWg==
X-Gm-Message-State: AJIora+3CWv9lRr90AtpMb9S4Lsq1KPnfHW97xwArcn3V1UqOrOT9rfq
        RgWx4RTcyeN3UaKNniVspe9SgQ==
X-Google-Smtp-Source: AGRyM1u/FnJ52CsCRMaa4h061AAVxSmVj3hBpymHat5NnwOaXChjPl4I3PgKRMvF9p/y37at0a7nTw==
X-Received: by 2002:a05:6e02:1645:b0:2d6:5dd3:e627 with SMTP id v5-20020a056e02164500b002d65dd3e627mr731794ilu.268.1656111066780;
        Fri, 24 Jun 2022 15:51:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id q45-20020a056638346d00b00331563be3ecsm1613766jav.121.2022.06.24.15.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 15:51:06 -0700 (PDT)
Subject: Re: [PATCH 1/3] Documentation: kunit: remove duplicate kunit-tool.rst
To:     Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        brendanhiggins@google.com, davidgow@google.com
Cc:     linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20220603195626.121922-1-dlatypov@google.com>
 <87pmix3ktq.fsf@meer.lwn.net>
 <2c3399e9-4f4e-a71a-4030-e4e6d72b5d4e@linuxfoundation.org>
 <8735ft3co5.fsf@meer.lwn.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <96154234-7842-3bc9-d89f-eb20be40e6de@linuxfoundation.org>
Date:   Fri, 24 Jun 2022 16:51:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8735ft3co5.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/24/22 4:43 PM, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>>> So not that long ago these patches were going through Shuah...it seems
>>> that's not happening anymore?  I can pick up kunit docs patches,
>>> certainly.  I've taken the silence on these as assent and applied them.
>>>
>>
>> I am still taking ksefltest and kunit doc patches through my tree. I wait
>> for Brendan to ack at times. This one didn't show up in linux-kselftest
>> list it appears.
>>
>> If you cc linux-kselftest and I get an ack from Brendan, I will take this
>> through kselftest tree.
> 
> As I said up above, I went ahead and applied them.  I can drop them
> again if you want to carry them, just let me know.
> 

Jon, yes please go ahead and drop this one. I will wait for Brendan
to ack it. Reduces confusion in the future. Very often, there is code
dependencies as well.

Daniel, please don't skip kselftest list in the future.

thanks,
-- Shuah
