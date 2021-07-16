Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9028C3CBD7F
	for <lists+linux-doc@lfdr.de>; Fri, 16 Jul 2021 22:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbhGPULR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Jul 2021 16:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35103 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232746AbhGPULQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jul 2021 16:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626466101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Da3jrWfUyIbwMDM6l84hMp2rVe+fWjtYvte2/A1hNbI=;
        b=M5igVqsEGvgQyoMATYMHfCdmMkLy8Q+df7eRN1HEkHIqCdRVLjxEVcECJZL9scP9C3MLF9
        ySUe7LwVPvI0ItajnJF017MdsbpzjzhxsTiRSHNlnHlTxgX8Me04ivlNUXj4jpimcbsGby
        X4jbsY2+4BmznFzAzHuYxLJQ/D1dmXI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-SEVbtnHsMjCHenP7aLy_xw-1; Fri, 16 Jul 2021 16:08:18 -0400
X-MC-Unique: SEVbtnHsMjCHenP7aLy_xw-1
Received: by mail-qt1-f198.google.com with SMTP id g4-20020ac80ac40000b029024ead0ebb62so7010615qti.13
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 13:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Da3jrWfUyIbwMDM6l84hMp2rVe+fWjtYvte2/A1hNbI=;
        b=OS0Ci9zWOvsP4CUMpqzfv6WQYQZqbnysc67MF6gVgGiHgfbmnV7YDjHrnEBJD0Ds/Y
         X732JRX9V9Ek3MwDUPNV/VIVcojrpOQHd4ipr/jGeQgss3a3Zslpzco+1YWVhvdR59PC
         egLi4y7f9agZdf/asJELlP7BMZ7+w5zXkuBclBvzcRWOK01BMKEL2cCRCp9S1ALjjsOS
         BzqB6v7XtZV70VdEd2UbDpmdqf4N2IsSvMwXkFlD460GdJtxXE2VU2ocOqVxYQwpxadJ
         UaTNbDuQnVycn9AN/nSw0dVZoxbpn2Wclx9UVBaRQH+Qof5zxjJz/wMibbBZVVvmxCJL
         Tskw==
X-Gm-Message-State: AOAM5321wOmJ0pnyDE1BE4f0TZAfZZLw2mFBmZ/vjrOHUN5LugpU5jT5
        O7h7CTEY1JniRWF2XIP3Vi0yGXpI5MzIb0zYMjNoth1Lz26H1PoHa1MDzNpjnY8jHvZ6phbaq4R
        61zZyGgXIN1TZNtWS3ES6
X-Received: by 2002:ac8:754a:: with SMTP id b10mr10913338qtr.355.1626466097624;
        Fri, 16 Jul 2021 13:08:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykJ0U6myLbIhbbKztUvaqmwgo8TjVazgJUJVB6Hy+oBjOANp/dqImPNP9CRmEIOK5etA0rUg==
X-Received: by 2002:ac8:754a:: with SMTP id b10mr10913314qtr.355.1626466097426;
        Fri, 16 Jul 2021 13:08:17 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id h7sm3533020qtq.79.2021.07.16.13.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 13:08:16 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 2/6] cgroup/cpuset: Clarify the use of invalid
 partition root
To:     Waiman Long <llong@redhat.com>, Tejun Heo <tj@kernel.org>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>
References: <20210621184924.27493-1-longman@redhat.com>
 <20210621184924.27493-3-longman@redhat.com>
 <YNcHOe3o//pIiByh@mtj.duckdns.org>
 <6ea1ac38-73e1-3f78-a5d2-a4c23bcd8dd1@redhat.com>
 <YONGk3iw/zrNzwLK@mtj.duckdns.org>
 <c6ae2d9b-ad6e-9bbd-b25c-f52b0ff6fb9b@redhat.com>
 <1bb119a1-d94a-6707-beac-e3ae5c03fae5@redhat.com>
Message-ID: <8c44b659-3fe4-b14f-fac1-cbd5b23010c3@redhat.com>
Date:   Fri, 16 Jul 2021 16:08:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1bb119a1-d94a-6707-beac-e3ae5c03fae5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/16/21 2:59 PM, Waiman Long wrote:
> On 7/16/21 2:44 PM, Waiman Long wrote:
>> On 7/5/21 1:51 PM, Tejun Heo wrote:
>>> Hello, Waiman.
>>>
>>> On Mon, Jun 28, 2021 at 09:06:50AM -0400, Waiman Long wrote:
>>>> The main reason for doing this is because normal cpuset control 
>>>> file actions
>>>> are under the direct control of the cpuset code. So it is up to us 
>>>> to decide
>>>> whether to grant it or deny it. Hotplug, on the other hand, is not 
>>>> under the
>>>> control of cpuset code. It can't deny a hotplug operation. This is 
>>>> the main
>>>> reason why the partition root error state was added in the first 
>>>> place.
>>> I have a difficult time convincing myself that this difference 
>>> justifies the
>>> behavior difference and it keeps bothering me that there is a state 
>>> which
>>> can be reached through one path but rejected by the other. I'll 
>>> continue
>>> below.
>>>
>>>> Normally, users can set cpuset.cpus to whatever value they want 
>>>> even though
>>>> they are not actually granted. However, turning on partition root 
>>>> is under
>>>> more strict control. You can't turn on partition root if the CPUs 
>>>> requested
>>>> cannot actually be granted. The problem with setting the state to just
>>>> partition error is that users may not be aware that the partition 
>>>> creation
>>>> operation fails.  We can't assume all users will do the proper error
>>>> checking. I would rather let them know the operation fails rather than
>>>> relying on them doing the proper check afterward.
>>>>
>>>> Yes, I agree that it is a different philosophy than the original 
>>>> cpuset
>>>> code, but I thought one reason of doing cgroup v2 is to simplify the
>>>> interface and make it a bit more erorr-proof. Since partition root 
>>>> creation
>>>> is a relatively rare operation, we can afford to make it more 
>>>> strict than
>>>> the other operations.
>>> So, IMO, one of the reasons why cgroup1 interface was such a mess was
>>> because each piece of interaction was designed ad-hoc without regard 
>>> to the
>>> overall consistency. One person feels a particular way of 
>>> interacting with
>>> the interface is "correct" and does it that way and another person does
>>> another part in a different way. In the end, we ended up with a messy
>>> patchwork.
>>>
>>> One problematic aspect of cpuset in cgroup1 was the handling of failure
>>> modes, which was caused by the same exact approach - we wanted the 
>>> interface
>>> to reject invalid configurations outright even though we didn't have 
>>> the
>>> ability to prevent those configurations from occurring through other 
>>> paths,
>>> which makes the failure mode more subtle by further obscuring them.
>>>
>>> I think a better approach would be having a clear signal and 
>>> mechanism to
>>> watch the state and explicitly requiring users to verify and monitor 
>>> the
>>> state transitions.
>>
>> Sorry for the late reply as I was busy with other works.
>>
>> I agree with you on principle. However, the reason why there are more 
>> restrictions on enabling partition is because I want to avoid forcing 
>> the users to always read back cpuset.partition.type to see if the 
>> operation succeeds instead of just getting an error from the 
>> operation. The former approach is more error prone. If you don't want 
>> changes in existing behavior, I can relax the checking and allow them 
>> to become an invalid partition if an illegal operation happens.
>>
>> Also there is now another cpuset patch to extend cpu isolation to 
>> cgroup v1 [1]. I think it is better suit to the cgroup v2 partition 
>> scheme, but cgroup v1 is still quite heavily out there.
>>
>> Please let me know what you want me to do and I will send out a v3 
>> version. 
>
> Note that the current cpuset partition implementation have implemented 
> some restrictions on when a partition can be enabled. However, I 
> missed some corner cases in the original implementation that allow 
> certain cpuset operations to make a partition invalid. I tried to plug 
> those holes in this patchset. However, if maintaining backward 
> compatibility is more important, I can leave those holes and update 
> the documentation to make sure that people check cpuset.partition.type 
> to confirm if their operation succeeds. 

I just realize that partition root set the CPU_EXCLUSIVE bit. So changes 
to cpuset.cpus that break exclusivity rule is not allowed anyway. This 
patchset is just adding additional checks so that cpuset.cpus changes 
that break the partition root rules will not be allowed. I can remove 
those additional checks for this patchset and allow cpuset.cpus changes 
that break the partition root rules to make it invalid instead. However, 
I still want invalid changes to cpuset.partition.type to be disallowed.

Cheers,
Longman

