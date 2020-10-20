Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19B628DB24
	for <lists+linux-doc@lfdr.de>; Wed, 14 Oct 2020 10:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgJNIXH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Oct 2020 04:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726517AbgJNIWx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Oct 2020 04:22:53 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBA1C051113
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 01:22:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e23so1426444wme.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Swh+dZQyBdaPmN5as6qgR/sRrl/ojxXJRUzze+Qmp7c=;
        b=Z/VHBbtSTwP8FkfNNETkLr6RUIBBLouAgLw0uY8EmTB4tmRALqpeMFfKVFnLC50Mtt
         nm44MdEv54nNQXzvc5ciyucLEFG3UmguNDgeJeq3uiJX1ZxoD562aEuwyenz92rgHqO7
         mduo38uCnAjo9IiBA8jaGhqpJ5BxtELxrMqIwAM3V8MS8QcvYeVdIBQynr+SNMHTfWea
         S0PQvoeqsJXb87abZvORn5S+I8WY+nOAXwlDuCbyB/K7GjcypPs1IIHP2e1VlD2krtAJ
         RMJ07Amgc+2uCAPwGZpd5TqNPPOomLj4eCTH09dclssKq/zrMxMKeZ63fwSOw0Y/GT+d
         RvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Swh+dZQyBdaPmN5as6qgR/sRrl/ojxXJRUzze+Qmp7c=;
        b=JKGqX8sLfKsSGP6pPPfJZUahtvMSNENIBaLwoBaTsqQiY4sok4R7/G2riTVKo2hl1J
         RwaPWWlxlSxUWy4U3XOd+bWNnKGJZCLMPMyImdrCGZMYCKjyD5zBdrD7SUsatb1g0ybX
         Dz3o2SEzfl3SYxDnCvwMy6t+KPgDTOcYTiwoxtXYGgXlkqRjmNznGF+d1g94H2QrcC05
         19Zv910DrzG5AQ7AuZdU1Hbo2TEHMsypqeLMoX5g6OJGO1jXm2z4j5NE2/i6VL4HxY6m
         I6VgupgRCi86aCmXRhAPAhf9smJGyU5GFpdozb+H9bhFbzIbLrLVdZZo7N+ERJN13UeR
         LKzA==
X-Gm-Message-State: AOAM5305hG9pt9RqvENZdNWFAxloz64HEFSbm3GpxAf9VwbKcWvjkAC2
        KDxUDwnRLx3j4IQYq5Zy86DX3w==
X-Google-Smtp-Source: ABdhPJyhymZXHFLUxhQpIL4t7IHxHSPomNV81iEN402sS5TNy/a5RgPmeKkekvo2TU8sawSC/dDDKg==
X-Received: by 2002:a1c:ed15:: with SMTP id l21mr2360202wmh.26.1602663773822;
        Wed, 14 Oct 2020 01:22:53 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:8b3:b79b:6fb0:3e8f? ([2a01:e34:ed2f:f020:8b3:b79b:6fb0:3e8f])
        by smtp.googlemail.com with ESMTPSA id p11sm3798385wrm.44.2020.10.14.01.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:22:53 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Clarify abstract scale usage for power values in
 Energy Model, EAS and IPA
To:     Lukasz Luba <lukasz.luba@arm.com>, rjw@rjwysocki.net
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, amitk@kernel.org, corbet@lwn.net,
        Dietmar.Eggemann@arm.com, qperret@google.com,
        dianders@chromium.org, mka@chromium.org, rnayak@codeaurora.org
References: <20201002114426.31277-1-lukasz.luba@arm.com>
 <d2960f6a-1805-1fb4-98ae-4a756d20370b@arm.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <765e6603-b614-fb72-64ff-248b42474803@linaro.org>
Date:   Wed, 14 Oct 2020 10:22:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d2960f6a-1805-1fb4-98ae-4a756d20370b@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi Lukasz,

On 09/10/2020 11:16, Lukasz Luba wrote:
> Hi Rafael,
> 
> On 10/2/20 12:44 PM, Lukasz Luba wrote:
>> Hi all,
>>
>> The Energy Model supports power values expressed in an abstract scale.
>> This has an impact on Intelligent Power Allocation (IPA) and should be
>> documented properly. There is also a need to update the DT binding for
>> the
>> 'sustainable-power' and allow it to have abstract scale as well.
>>
>> Changes:
>> v2:
>> - updated sustainable power section in IPA documentation
>> - updated DT binding for the 'sustainable-power'
>>
>> The v1 of the patch set and related discussion can be found in [1].
>>
>> Regards,
>> Lukasz Luba
>>
>> [1]
>> https://lore.kernel.org/linux-doc/20200929121610.16060-1-lukasz.luba@arm.com/
>>
>>
>> Lukasz Luba (3):
>>    docs: Clarify abstract scale usage for power values in Energy Model
>>    PM / EM: update the comments related to power scale
>>    dt-bindings: thermal: update sustainable-power with abstract scale
>>
>>   .../devicetree/bindings/thermal/thermal-zones.yaml  | 13 +++++++++----
>>   .../driver-api/thermal/power_allocator.rst          | 13 ++++++++++++-
>>   Documentation/power/energy-model.rst                | 13 +++++++++++++
>>   Documentation/scheduler/sched-energy.rst            |  5 +++++
>>   include/linux/energy_model.h                        | 11 +++++------
>>   kernel/power/energy_model.c                         |  2 +-
>>   6 files changed, 45 insertions(+), 12 deletions(-)
>>
> 
> Could you take patch 1/3 and patch 2/3 via your PM tree,
> please? I will be very grateful.
> 
> These patches just update the documentation and comments regarding
> an issue that we can have: bogoWatts in the Energy Model (and we
> already have). One of the drawbacks is that we cannot derive real energy
> from these numbers. Will see how this would evolve.

The purpose of the energy model is to provide these power numbers.

If the SoC vendors do not want to share those numbers, then better to
not use the energy model at all.

If they want to use the EAS and the IPA at all costs without sharing the
power numbers, then it is up to them to take responsibility of providing
consistent numbers, not the community to document how to hack the energy
model.

And that is even more true as mentioned by Doug: the power numbers are
not impossible to measure.

Documenting the scale values give the opportunity to the SoC vendor to
never share the power numbers, and even worst, that implies all the
existing and future frameworks based on the energy model (and its
evolution) *must* comply with these dummy values. That is the promise of
a real pain.

IMO, we must keep a strong constraint on the power values for the energy
model.

However, nothing prevents to write a recipe on a website explaining how
to use the energy model without the power numbers with a big warning
that could not work in the future if the energy model evolves or it
could be incompatible with the IPA.

I suggest to solve the energy model main issue: the SoC vendor do not
want to share the power numbers. Why not give the opportunity to load a
firmware where the power numbers will be ? The firmware could be in a
vendor partition for example.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
