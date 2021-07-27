Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4993D7F70
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jul 2021 22:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhG0UqZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Jul 2021 16:46:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31274 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231135AbhG0UqX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 16:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627418782;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jLNxJhgGZlPkzEzVhm7oQCluwCd8GOHL0Cl+fYd1lV8=;
        b=LGk5E7MPwbVBazHUM2ei9I5m9jOeQXqrU4Yen7lMaf1oZmzIxiPGP8xKQ2zVtiAiX9Jabu
        RLdDUnpz/f7X3k1tF6jew2EH0cAP5F8Z2zWEaaQw8U3TNPRmMB0b2R00afI66XSzvEVP/j
        RwRNTGO7SqyxccitD9ZTKJ7vTpnZgdM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-3Bibv6f-NWu9ItFwIgs6QA-1; Tue, 27 Jul 2021 16:46:20 -0400
X-MC-Unique: 3Bibv6f-NWu9ItFwIgs6QA-1
Received: by mail-qk1-f199.google.com with SMTP id s186-20020a3790c30000b02903b9ade0af31so92997qkd.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 13:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jLNxJhgGZlPkzEzVhm7oQCluwCd8GOHL0Cl+fYd1lV8=;
        b=liVLVQJ/VkV8oVqw8k0FX96LbFgfeVzRvee3+gR8HCwoa7AGfxD27nAiK4RS2tLBs5
         vEW891RGI2bLNIt3qHtyjh6qwz/2HB4I7ev0m0iLTORI7dk4qcEydLYfHcfxSTGM568+
         5dQ2qccGovnvifwfzU1NPdmOGTWLDkJ/frToqvuxVsQrzhX0CAPZhnyPci74zxtzy4h8
         QUw8oGbXOnscz1aiFRBQAQ1r1oH4VlhdH6zK8hUB0BWVEUm4tfIMa2ZYiqxtZrJuTKjT
         +ZmTc9rxG1Ew9gzrO1oJjN05Fn9vdIVLtZGWtfSQYUTZt6YtPnt7onqnpGw6g1cAbUog
         FBkA==
X-Gm-Message-State: AOAM532mqnmR9kf7yYsbvaq5cTZDgpr0jOZGyr65JUdUaafn2/6Fppy7
        3kxA+3tXJiA1o46lSjSdYgcYkn6bH0oesgUIuKTgenBdq9ZfEP/HLDui4TeuG0FB+NwwxvnXCbU
        oQ2smMIt/ty67UeIYEGH8
X-Received: by 2002:a37:a1cf:: with SMTP id k198mr24571212qke.259.1627418780527;
        Tue, 27 Jul 2021 13:46:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/2D4LFG2Y61uUgaJl1dx4vpK2+Wr8Pjq7SBty/+7+uZlr/4GzZWfAY4xFHyT9FitHLWBR7g==
X-Received: by 2002:a37:a1cf:: with SMTP id k198mr24571184qke.259.1627418780345;
        Tue, 27 Jul 2021 13:46:20 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id v4sm2171761qkf.52.2021.07.27.13.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 13:46:19 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 4/9] cgroup/cpuset: Enable event notification when
 partition become invalid
To:     Tejun Heo <tj@kernel.org>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
References: <20210720141834.10624-1-longman@redhat.com>
 <20210720141834.10624-5-longman@redhat.com>
 <YP9BxKXfhaoTE+LO@slm.duckdns.org>
 <8bed1ac2-f5f4-6d17-d539-4cd274b0f39e@redhat.com>
Message-ID: <5d1b7995-87f8-afde-5845-c97ff88bf431@redhat.com>
Date:   Tue, 27 Jul 2021 16:46:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8bed1ac2-f5f4-6d17-d539-4cd274b0f39e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/27/21 4:26 PM, Waiman Long wrote:
> On 7/26/21 7:14 PM, Tejun Heo wrote:
>> On Tue, Jul 20, 2021 at 10:18:29AM -0400, Waiman Long wrote:
>>> +static inline void notify_partition_change(struct cpuset *cs,
>>> +                       int old_prs, int new_prs)
>>> +{
>>> +    if ((old_prs == new_prs) ||
>>> +       ((old_prs != PRS_ERROR) && (new_prs != PRS_ERROR)))
>>> +        return;
>>> +    cgroup_file_notify(&cs->partition_file);
>> I'd generate an event on any state changes. The user have to read the 
>> file
>> to find out what happened anyway.
>>
>> Thanks.
>
> From my own testing with "inotify_add_watch(fd, file, IN_MODIFY)", 
> poll() will return with a event whenever a user write to 
> cpuset.cpus.partition control file. I haven't really look into the 
> sysfs code yet, but I believe event generation will be automatic in 
> this case. So I don't think I need to explicitly add a 
> cgroup_file_notify() when users modify the control file directly. 
> Other indirect modification may cause the partition value to change 
> to/from PRS_ERROR and I should have captured all those changes in this 
> patchset. I will update the patch to note this point to make it more 
> clear. 

After thinking about it a bit more it, it is probably not a problem to 
call cgroup_file_notify() for every change as this is not in a 
performance critical path anyway. I will do some more testing to find 
out if doing cgroup_file_notify() for regular file write will cause an 
extra duplicated event to be sent out, I will probably stay with the 
current patch. Otherwise, I can change it to always call 
cgroup_file_notify().

Cheers,
Longman

