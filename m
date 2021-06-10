Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA843A33E0
	for <lists+linux-doc@lfdr.de>; Thu, 10 Jun 2021 21:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhFJTXy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Jun 2021 15:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37687 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230247AbhFJTXv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 15:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623352914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DVG4CWGfyu4y0g9i2OCoAuUtkr+80/M03bPDGkS4TS8=;
        b=KrmRPXTQzgcO01RxmExyB/c/8VLB/qa3V4z+12QANBuu1neQI+ONGRiBe9rfO3Dgk9vprf
        zhzFySb7gd8RSMbu6pd4vPLZATtD+gtaMKN5acximHIWBeXtWdzD+o3qWeNk4TKUtCMth1
        8+xBul22Y5wXyPAlTXCBPQ6IvJnKDuw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Y8D8Kq-oNnKpzzbCbj28_A-1; Thu, 10 Jun 2021 15:21:53 -0400
X-MC-Unique: Y8D8Kq-oNnKpzzbCbj28_A-1
Received: by mail-qk1-f198.google.com with SMTP id t131-20020a37aa890000b02903a9f6c1e8bfso17410041qke.10
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 12:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DVG4CWGfyu4y0g9i2OCoAuUtkr+80/M03bPDGkS4TS8=;
        b=QtmtyPZ+0Y6owtDttwns0gmcd+2g3T+KTEFBl94p8B4hmw9M81fVRqj6nMUa6xzbIS
         CHmO32ub8aEU+I6OdOHSiKSsDELjCUDCMxCNO001/TlH/1JMAc+YPaInLGT2Xv8YzB13
         Vg8xtfdxDlpAb3aqcLXOmtmbXgq2arfSm9mo7XURVjMwR03p1hU2ZhpWy6873gLWYHvw
         Ra1ASBFqOefz7O/VuJZaTV02+kICwlg+ErcdBXV2uCofsX5lc4bw3W27WETyuVFbnyah
         Rw88o8r6BdAZvigeP5DC9c3DP2tnXB2dbSY+R3PHUW0/dwhucj+mb1NAJTzlczdb/oAe
         Qixg==
X-Gm-Message-State: AOAM5316MgbvWezdfSo3VIqkxzeO3WWERfYS+9MfAl/kq4HkT3oAAYve
        QMK+fmPYQfPafJzcpoEU0TzAHt6bME2d0BL6PcdJkOtRDISAnkF0ztWVrRsztmv29j6F5skqCvi
        SRGthjmfbiX9Cfo4adE/0
X-Received: by 2002:ac8:45cd:: with SMTP id e13mr342457qto.45.1623352913271;
        Thu, 10 Jun 2021 12:21:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeiZS804EdnkmC4YoAIb9fvGvqBRkzaFwj/cd9U44QFCAH/4ydLc0o5CPvxlig3jZUdN2jTQ==
X-Received: by 2002:ac8:45cd:: with SMTP id e13mr342442qto.45.1623352913114;
        Thu, 10 Jun 2021 12:21:53 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id s7sm3033177qkp.35.2021.06.10.12.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 12:21:52 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 2/5] cgroup/cpuset: Add new cpus.partition type with no
 load balancing
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>
References: <20210603212416.25934-1-longman@redhat.com>
 <20210603212416.25934-3-longman@redhat.com>
 <YMJhObisfWJ1PzgR@hirez.programming.kicks-ass.net>
Message-ID: <f81f4867-1fea-03fc-639a-2783fbd68abf@redhat.com>
Date:   Thu, 10 Jun 2021 15:21:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMJhObisfWJ1PzgR@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/10/21 3:00 PM, Peter Zijlstra wrote:
> On Thu, Jun 03, 2021 at 05:24:13PM -0400, Waiman Long wrote:
>> Cpuset v1 uses the sched_load_balance control file to determine if load
>> balancing should be enabled.  Cpuset v2 gets rid of sched_load_balance
>> as its use may require disabling load balancing at cgroup root.
>>
>> For workloads that require very low latency like DPDK, the latency
>> jitters caused by periodic load balancing may exceed the desired
>> latency limit.
>>
>> When cpuset v2 is in use, the only way to avoid this latency cost is to
>> use the "isolcpus=" kernel boot option to isolate a set of CPUs. After
>> the kernel boot, however, there is no way to add or remove CPUs from
>> this isolated set. For workloads that are more dynamic in nature, that
>> means users have to provision enough CPUs for the worst case situation
>> resulting in excess idle CPUs.
> Also, can we change isolcpus to create a default cgroup hierarchy
> instead of being the fugly hack that it is? I really hate isolcpus with
> a passion, it needs to die.
>
That is probably doable assuming that we can allow cpuset v2 to have a 
non-load balanced partition.

Depending on which cpuset version is set up, we can automatically set up 
a isolated subdirectory under / to contain cpus that are isolated. 
However, that will be a follow-on patch after this one.

Cheers,
Longman

