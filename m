Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC35153D49A
	for <lists+linux-doc@lfdr.de>; Sat,  4 Jun 2022 03:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350523AbiFDB1M (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jun 2022 21:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239936AbiFDB05 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 21:26:57 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4563F5EDF4
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 18:25:10 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id r71so8510126pgr.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 18:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=H5GzO1GVZTXiX6PTnZ0maVWHXWhxKwJkxQUe242iFjg=;
        b=IhocYC3qHy8EUVb5O0v/ELOjI6SsqyJxjKf/Vu8dLAiHITnBEkWby7B4+ZNGaEqDjZ
         e/DBzSAm/IFgW10mDHfNUIwmrHI8YTpXqXdqGwbC32iHYtxJ4/0rn+5m8mzQ4vFbaBAw
         oPGAiSYv+WCSjvluB4FT0nP11wfPhnUdLvrHu2zXZ3ohwNKcr4OljPj7JqbJFZe/okca
         6FogBD7fWTBSaA1+Ld4DfHeJ1j1ald9nZ++kKpSSvAh0vIoYZ82LduuKRiCtLHM/Mb5/
         R8sINUYQkO9mK/H10qcDYXe+OWlB5JHIDPkwrlNgeDNFhz0yjincgxl0VJMvJLh2QwjE
         wiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H5GzO1GVZTXiX6PTnZ0maVWHXWhxKwJkxQUe242iFjg=;
        b=MX1P6+xYAmlShPDX1R06goj1jbI2vT9nOSTEdlEsDsXZlN2Ku6AwxKhXWxrkxIkzuc
         sBIY4wIrgKz/8NizWb2CL3K7W18aJYx3xOt4efYza6tzSzus8JZICmRW/6YlNHLQ+KXP
         GXxYRMaqSr8vyKF8mgR35EXyqDO+pxf7ALHM20YDV4eymijIerV7HOE+vh2pK01WeiBr
         9xbiBy0RNQhRALOoCtNMI6W7+jTo24mg4ij8EYAJkJouybvmphTYQ4BRSAdCM0ezwgP7
         FHdbFgfRe7EEq7631xDG6H48L6TgpmiZZbPUK2AdU87VcJrxLpvuKXU8yA34tHNtf/Ui
         PVPg==
X-Gm-Message-State: AOAM532Qc9MJ+rldls4oeV//fvbM7SSRHj7qLhDrYZ9rVPkCXFQ9Y+jb
        Q4HVRZ3l98HmrDTf1pXDQ8VfAg==
X-Google-Smtp-Source: ABdhPJx1//CyJ20BJCZkSYLm20hSsC3pDU2Dr4uzutt5qYu615ZOTb8FPdNEj/A4wW+9CG7lFUBURw==
X-Received: by 2002:a65:4bc5:0:b0:3da:ec0c:c5f2 with SMTP id p5-20020a654bc5000000b003daec0cc5f2mr11018632pgr.221.1654305884726;
        Fri, 03 Jun 2022 18:24:44 -0700 (PDT)
Received: from [10.4.187.25] ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id p17-20020a17090adf9100b001df2f8f0a45sm5983115pjv.1.2022.06.03.18.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 18:24:44 -0700 (PDT)
Message-ID: <68433856-6b7b-2e9e-6e86-77293da7453b@bytedance.com>
Date:   Sat, 4 Jun 2022 09:24:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] mm: memcontrol: separate {pgscan,pgsteal}_{kswapd,direct}
 items in memory.stat of cgroup v2
Content-Language: en-US
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux MM <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20220603070423.10025-1-zhengqi.arch@bytedance.com>
 <CALvZod6s8ss0Doe9y+X=3ZHvw0Ove9Lw3MdfKekXr0gVnJwA4w@mail.gmail.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CALvZod6s8ss0Doe9y+X=3ZHvw0Ove9Lw3MdfKekXr0gVnJwA4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2022/6/4 8:47 AM, Shakeel Butt wrote:
> On Fri, Jun 3, 2022 at 12:06 AM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
> [...]
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 176298f2f4de..0b9ca7e7df34 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -1442,11 +1442,17 @@ PAGE_SIZE multiple when read back.
>>            pgrefill (npn)
>>                  Amount of scanned pages (in an active LRU list)
>>
>> -         pgscan (npn)
>> -               Amount of scanned pages (in an inactive LRU list)
>> +         pgscan_kswapd (npn)
>> +               Amount of scanned pages by kswapd (in an inactive LRU list)
>>
>> -         pgsteal (npn)
>> -               Amount of reclaimed pages
>> +         pgscan_direct (npn)
>> +               Amount of scanned pages directly  (in an inactive LRU list)
>> +
>> +         pgsteal_kswapd (npn)
>> +               Amount of reclaimed pages by kswapd
>> +
>> +         pgsteal_direct (npn)
>> +               Amount of reclaimed pages directly
> 
> No objection to adding new fields but removing 'pgsteal' and 'pgscan'
> from the user visible API might break some applications.

Oh, got it. So do we need to keep pgscan and pgsteal fields? If it is, I
can add it back in patch v2.

Thanks,
Qi
