Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17152201CC8
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2020 22:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391473AbgFSU43 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Jun 2020 16:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389280AbgFSU40 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Jun 2020 16:56:26 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41615C06174E
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2020 13:56:25 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n9so4402489plk.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2020 13:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gBOXJkfJCu0sdxn7ZdsBsc6b9MlbPo9DaUYf2xdlizc=;
        b=0v7YfgMVZh9Y1bQFnGqY5KlUmOzZp79g6dWctU09tV4oV4CJu/DLfQp6Albxi1cpzG
         80PscWWcOO8/UqVDfBaWquzCdx4EWyCv9ed1v8K6iLa4SnHb97YAToaAAiIkTAccZRXX
         /FNHI/0LdYYzoeH0SDLMRrnqIXGth5LxByqPsHu7cO40w7JWeIALreOMAEY226m5qGsX
         tpu3otL2KMzXnyehxMkHSAeI8uvRqIgZzLj0ZtQSnVJJAQIOQtTggMTT+Y/gDppELARu
         3X1H1Ecf8w33rdgb9jYm8nt8RDXLN18k5KdeSQNuVKwXEyAkRCVfdsCi+MDJ/XpVKJmw
         +apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gBOXJkfJCu0sdxn7ZdsBsc6b9MlbPo9DaUYf2xdlizc=;
        b=Dbsle72JvMmRSiyGZwyrcaR9heDt28iYynFmxHMeR9mC8K8KM0EqELlZXixQNZkiPB
         qQXYLSznS9sfjY07PRTvHbs4Qy6+G/P3qNnCR2rdKqBI6S60eLKSZHHYu3PpDKVZ5u22
         TpsM2rnKUXgS/Hw90UXisdb8XX4gRvA2sG119AwZec1H+LtM2svSkoL3vxxq7YXrIIhr
         pvZmT7ylN4yALMYHKKAvyXgXmb9ixzAvAUJrAdPnVuNVAa773sKOND0NXWrUcnGB/E6f
         JDxXh0Ug26ZqIZbSOgDMD8M8Vlpri6vb1PLIi3dh4ya9n4enk+xORtZQpcK5bRMlLJEn
         Ci4A==
X-Gm-Message-State: AOAM533XR+XIHyJ8402MhDiVC/bh+PHyvVbhEU1sq3ZGwTm9vMDk0De8
        AskG8kA0zAYlCtnn15VbNnzdQA==
X-Google-Smtp-Source: ABdhPJxUaBhu1790cFJrBeounLiHhQSO3mNlP5GXa//tvqNcmE/bl/EP50d1xWTrZ7mWJGc7znJWBg==
X-Received: by 2002:a17:90a:4d87:: with SMTP id m7mr4973909pjh.26.1592600184803;
        Fri, 19 Jun 2020 13:56:24 -0700 (PDT)
Received: from ?IPv6:2620:10d:c085:21c1::1762? ([2620:10d:c090:400::5:a8e1])
        by smtp.gmail.com with ESMTPSA id n2sm6674047pfd.125.2020.06.19.13.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:56:24 -0700 (PDT)
Subject: Re: [PATCH v2] docs: block: Create blk-mq documentation
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        krisman@collabora.com
References: <20200605175536.19681-1-andrealmeid@collabora.com>
 <20200619134503.60ab689b@lwn.net>
 <cdab3be8-0d39-5085-34b5-7bf11cc7fb60@infradead.org>
 <a9b6447f-1b24-5f71-3661-c6ea5fe8ba6e@kernel.dk>
 <d99e90ae-27b8-163e-c90f-53778116ac10@collabora.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0066df94-d726-7f24-93d0-0a6329d68163@kernel.dk>
Date:   Fri, 19 Jun 2020 14:56:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d99e90ae-27b8-163e-c90f-53778116ac10@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/19/20 2:51 PM, André Almeida wrote:
> On 6/19/20 5:49 PM, Jens Axboe wrote:
>> On 6/19/20 1:47 PM, Randy Dunlap wrote:
>>> On 6/19/20 12:45 PM, Jonathan Corbet wrote:
>>>> On Fri,  5 Jun 2020 14:55:36 -0300
>>>> André Almeida <andrealmeid@collabora.com> wrote:
>>>>
>>>>> Create a documentation providing a background and explanation around the
>>>>> operation of the Multi-Queue Block IO Queueing Mechanism (blk-mq).
>>>>>
>>>>> The reference for writing this documentation was the source code and
>>>>> "Linux Block IO: Introducing Multi-queue SSD Access on Multi-core
>>>>> Systems", by Axboe et al.
>>>>>
>>>>> Signed-off-by: André Almeida <andrealmeid@collabora.com>
>>>>> ---
>>>>> Changes from v1:
>>>>> - Fixed typos
>>>>> - Reworked blk_mq_hw_ctx
>>>>
>>>> Jens, what's your pleasure on this one?  Should I take it, or do you want
>>>> it...?
>>>
>>> I wouldn't mind seeing a v3.
>>
>> Agree - Jon, I'd be happy with you taking it once a v3 is posted with the
>> remaining issues ironed out.
>>
> 
> Just sent a v3 some minutes ago, please check it out :)

Just did, see email :-)

-- 
Jens Axboe

