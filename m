Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FA44BA771
	for <lists+linux-doc@lfdr.de>; Thu, 17 Feb 2022 18:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242447AbiBQRtW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Feb 2022 12:49:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243869AbiBQRtV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Feb 2022 12:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1ED0B291FBF
        for <linux-doc@vger.kernel.org>; Thu, 17 Feb 2022 09:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645120146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rRIMKHhamSqp8VeNfr4XcAxWjxGDpns0iibC3SSvphI=;
        b=PJYa7RdA+can1t4YJ6vtAabVz/kfTAhs9suhvZv0mKahHPWDirzDH0IfEtSOkRX/6SBHJG
        ZpsimSG2PioXyoB0/CrWUkiXBqXnFR0tVT/wqFxDvSp2bmi2TJdu20mnCwgND7y1iJNoYf
        VrbRVKNgV47bqyTtdLFXnIoIQGB3nnY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-5IeQkg5lP4OG24ZVkaLp-g-1; Thu, 17 Feb 2022 12:49:04 -0500
X-MC-Unique: 5IeQkg5lP4OG24ZVkaLp-g-1
Received: by mail-wm1-f69.google.com with SMTP id m3-20020a7bcb83000000b0034f75d92f27so1992177wmi.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Feb 2022 09:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rRIMKHhamSqp8VeNfr4XcAxWjxGDpns0iibC3SSvphI=;
        b=EVxKuFG1o5OC2qgXO1F8eMPdvp/tYrWD8p1v7Kp35zO7g4Eh2oEd9GMZ1vJnQ4TvpH
         Odn90NuVINyLqpTWZMQRYUteIk4sw/v/WBohK6qeVVAV3bvgNPXf7QSBR7QNyr+qmenN
         u+WKqZEG1pESN+TwEZ+D8/8RibWfU42QDruCVLX+wSiW64xRPcMpheD6FVIFQ54R3Rnh
         Y9lzzeNZWy1KqSxxgyibmQtx4dBJqdo3PzU9CZLLfU+l5dEwIyLMUsLM7fCz0G2B7ke1
         A8DzOQXqo38oprRujik/hrs5wN48WPrlCmaWAE6V9/ceimCUC/8wOGjJtXuISic5nbqF
         9rbQ==
X-Gm-Message-State: AOAM5326CcHNFTwnl66Rpzxq9rOTSKg/eJtcmN+eNG57RNnJfFc6yriw
        fnBUME3+OdjHwtlhYTTfpBGZMyQGutOtVJghQbjObE74DFlqQ8f1RpGXHtVWeuPqe58PqT6YCXN
        DcejXfA47o93u79b3HCLO
X-Received: by 2002:a05:600c:35d1:b0:37c:d45c:af57 with SMTP id r17-20020a05600c35d100b0037cd45caf57mr7156015wmq.149.1645120143299;
        Thu, 17 Feb 2022 09:49:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ9zXHZ9F/mtgzKSHmwW5LPeJBNm3yMLCV+v3cbCHhyApAmjEFStihyj3q0BuKaMTUhMKzIw==
X-Received: by 2002:a05:600c:35d1:b0:37c:d45c:af57 with SMTP id r17-20020a05600c35d100b0037cd45caf57mr7155996wmq.149.1645120143067;
        Thu, 17 Feb 2022 09:49:03 -0800 (PST)
Received: from ?IPV6:2001:b07:646c:22c6:db53:7a2b:ef3c:adb0? ([2001:b07:646c:22c6:db53:7a2b:ef3c:adb0])
        by smtp.gmail.com with ESMTPSA id 14sm8654293wrb.34.2022.02.17.09.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 09:49:02 -0800 (PST)
Message-ID: <6c6fc4fa-6464-2dbf-40da-e3c61f322d95@redhat.com>
Date:   Thu, 17 Feb 2022 18:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC V2 17/21] watchdog/dev: Add tracepoints
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        "Peter.Enderborg@sony.com" <Peter.Enderborg@sony.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-trace-devel@vger.kernel.org" 
        <linux-trace-devel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
References: <cover.1644830251.git.bristot@kernel.org>
 <e67874c8b676ea8dfe38679efa25363889bb1e76.1644830251.git.bristot@kernel.org>
 <96f418b4-0ba8-01fe-ead0-2028bfc42560@sony.com>
 <ba924008-c0ab-4800-aac4-d9d9ae930c32@kernel.org>
 <ef1b1d99-6172-2b4d-9612-7ecbe8fc6c8b@roeck-us.net>
From:   Gabriele Paoloni <gpaoloni@redhat.com>
In-Reply-To: <ef1b1d99-6172-2b4d-9612-7ecbe8fc6c8b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 17/02/2022 18:27, Guenter Roeck wrote:
> On 2/17/22 08:27, Daniel Bristot de Oliveira wrote:
>> Hi Peter
>>
>> On 2/16/22 17:01, Peter.Enderborg@sony.com wrote:
>>> On 2/14/22 11:45, Daniel Bristot de Oliveira wrote:
>>>> Add a set of tracepoints, enabling the observability of the watchdog
>>>> device interactions with user-space.
>>>>
>>>> The events are:
>>>>     watchdog:watchdog_open
>>>>     watchdog:watchdog_close
>>>>     watchdog:watchdog_start
>>>>     watchdog:watchdog_stop
>>>>     watchdog:watchdog_set_timeout
>>>>     watchdog:watchdog_ping
>>>>     watchdog:watchdog_nowayout
>>>>     watchdog:watchdog_set_keep_alive
>>>>     watchdog:watchdog_keep_alive
>>>
>>> Some watchdogs have a bark functionality, I think it should be event
>>> for that too.
>>>
>>
>> I understand. The problems is that I do not see the bark abstraction
>> in the
>> watchdog_dev layer.
>>
> 
> I don't even know what "bark functionality" means. A new term for
> pretimeout ?
> Something else ?

From my understanding the bark timeout is actually the pretimeout
whereas the bite timeout is the actual timeout.
I think in the Kernel ftwdt010_wdt and qcom-wdt are bark/bite WTDs

Gab


> 
> Guenter
> 
>> In the case I am investigating (the safety_monitor/safety_app) the
>> bark is
>> outside of the "OS" view, it is an hardware action - like. shutdown.
>>
>> Am I missing something? Thoughts?
>>
>> -- Daniel
> 

