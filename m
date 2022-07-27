Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D60582951
	for <lists+linux-doc@lfdr.de>; Wed, 27 Jul 2022 17:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbiG0PKF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Jul 2022 11:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbiG0PKE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 11:10:04 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79DA45F70
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 08:10:02 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso2516078pjo.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DejOeyc5Bty+6/iRLEMvFvVGs80thD2zi1F/z5KtilQ=;
        b=S4xk6iuqrK2V6O+FNHAsu2C7x4XJs+23oGUi5oHWTWQnBlli+yAG+HZmiWeLLlbpbM
         RtHNKyzYNQ98X6FHE7uMEGImP/fIXqGsdoSBUoLrmG1K2yz3+KjnFpBbq2yvEkc/tlWn
         zUTEw1Sl3/zTmYldqoh6SVe8Zabq4bwGO6R++U5wbsWMatVsJ3lWm7r72s1N0W31yKiC
         gz2M30fO7at6a+e80cvKZaQ9wByQaqZgUHjfyGOJUxVy6NoZKYyJAP3nEHZkbYXOjMJu
         qmDLVLKFFge0qg9+DNv4gYYiAzMT2+1fUuDMBSqcFglBV4wbKrWaxKIK6ZdRgTO08ldB
         Pb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DejOeyc5Bty+6/iRLEMvFvVGs80thD2zi1F/z5KtilQ=;
        b=qNE2kbytiY9GBb0yX/7/mrhBm+GMtV0r0QfbMviEIoFv32Kg9mn+fxPLF3HP/pVVan
         j/AsHxnZZOrm1ZYYsoXrtPjh7CE7UiJooOXtve0E+qxm/jw56afhHGGSJsUulVPRbmgz
         DNiQnvhoNsfgM7Cl5/5O+7vAoWJfOJPPUrYUuzEqnSdKKCOQNsi82WSf9QSNseP9nq/z
         KI8XtJE0wsdiQCqf6A0yxXzOk/et/35Y4b3KOtFimt+F49pgSrgvJ/ItDN4GA+1E59BI
         oIb31Z+nhpxQqkQBnUI+tXcTxFD5oiHSR+u4Jb6E0V567EwjIfMujkO/C3vqx4vPo0fU
         FTkw==
X-Gm-Message-State: AJIora/fLuFRGspu6QJGtxemqWLe1mgSWfQTXrWnoHc/sBY8xYkyNVAG
        4ZlzgWw2SeXjzJ9XVrOLYOUCnA==
X-Google-Smtp-Source: AGRyM1tJGcZbBWUjLKGbseXoJr5i9c7RB6dIOx70sfvMv3NlaLdAQvu5MhRh9in6aMFTdo++OnqdXA==
X-Received: by 2002:a17:90b:3d05:b0:1f3:e80:7b30 with SMTP id pt5-20020a17090b3d0500b001f30e807b30mr2957028pjb.185.1658934601992;
        Wed, 27 Jul 2022 08:10:01 -0700 (PDT)
Received: from [10.4.228.171] ([139.177.225.235])
        by smtp.gmail.com with ESMTPSA id k5-20020a17090ad08500b001ef87123615sm1815996pju.37.2022.07.27.08.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 08:10:01 -0700 (PDT)
Message-ID: <0a1f7ce7-2869-c189-3703-89bff2198874@bytedance.com>
Date:   Wed, 27 Jul 2022 23:09:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH 9/9] sched/psi: add PSI_IRQ to track IRQ/SOFTIRQ pressure
Content-Language: en-US
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-10-zhouchengming@bytedance.com>
 <Yt7gOhbqYzIKyhfv@cmpxchg.org>
 <5f91e194-439a-12c0-4987-5dea0e68a60a@bytedance.com>
 <YuE26+jMjnE4GZZ2@cmpxchg.org>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <YuE26+jMjnE4GZZ2@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/7/27 21:00, Johannes Weiner wrote:
> On Wed, Jul 27, 2022 at 07:28:37PM +0800, Chengming Zhou wrote:
>> On 2022/7/26 02:26, Johannes Weiner wrote:
>>> I think we can remove the NR_CPU task count, which frees up one
>>> u32. Something like the below diff should work (untested!)
>>
>> Hi, I tested ok, would you mind if I put this patch in this series?
>>
>> Subject: [PATCH] sched/psi: remove NR_ONCPU task accounting
>>
>> We put all fields updated by the scheduler in the first cacheline of
>> struct psi_group_cpu for performance.
>>
>> Since we want add another PSI_IRQ_FULL to track IRQ/SOFTIRQ pressure,
>> we need to reclaim space first. This patch remove NR_ONCPU task accounting
>> in struct psi_group_cpu, use TSK_ONCPU in state_mask to track instead.
> 
> Thanks for testing it, that sounds good.
> 
>> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
>> Reviewed-by: Chengming Zhou <zhouchengming@bytedance.com>
>> Tested-by: Chengming Zhou <zhouchengming@bytedance.com>
> 
> Since you're handling the patch, you need to add your own
> Signed-off-by: as well. And keep From: Johannes (git commit --author).

Got it. Thanks!

