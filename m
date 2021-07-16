Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1893CBE9D
	for <lists+linux-doc@lfdr.de>; Fri, 16 Jul 2021 23:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbhGPVb6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Jul 2021 17:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42030 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234231AbhGPVb5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jul 2021 17:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626470942;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YABHDSw9b5sWUS8tb4/mSbwzJgD3Ug0F6zV+ryBO8W8=;
        b=aRZr4WzqthHBGhZOykWgSaKdGrcUXbkDtWJciTiH0bjIxrT/1mUazWs3C8FFf3KWfx0gNs
        FXwXSusJqO9kvWpEdasZZFVdeBNhWxXbkvZzPla0P/FyL+JrNgfq2en3eokoTaKdf0LY4Y
        Mv8LphHvvLbHs6bj76TFFBlCU4Je5qQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-aEgi81-TMQKEgph8Nislbw-1; Fri, 16 Jul 2021 17:29:00 -0400
X-MC-Unique: aEgi81-TMQKEgph8Nislbw-1
Received: by mail-qk1-f199.google.com with SMTP id h12-20020a05620a400cb02903b8e915ccceso3989773qko.18
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 14:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YABHDSw9b5sWUS8tb4/mSbwzJgD3Ug0F6zV+ryBO8W8=;
        b=ObS6sxNsu18NkRIzi9yRccFMXZPUAZ1w8clWrtDlpGDvfKRh+4BsdPFWK7NS5IlJxS
         3LEFgF6Da+IO6kyekq+7UT6phfOHGmueyuer9xfJM3KWSnj6cR1dNShQiKattYsvqpRu
         ZYraHwXPygJVTwfSRrC9oPc8AacJQ8nqq9O3NmLdjjiEsDHPHu8yUCG3i37Ja3rwPM2m
         mNMegm1QGy6yH81bp2+eGiqSagg/qTlKknumO1cfZaF9Q8o5tXa3/NKebFSOnCf3V9xy
         4EifcgR9luGfcsLT0L1o0rRjduaLJag+rufOb0x+z4EER9dZDMp0VJ7+WhJdbgkbr3vt
         SCIQ==
X-Gm-Message-State: AOAM53317V9vIVtVNeI+zLRKfVeqE4UYGJ0e3QDYvIeDk0snLJ7DdlNQ
        Gkux+4Xewzbyih0IEtngIZY+fUrC7tGVsQ+7wILnGlB7haumeC4UcF1tckh4pB71CKx3vBkBSlV
        yJu0x2N/ziHAOiapq5RLs
X-Received: by 2002:ac8:6ec1:: with SMTP id f1mr11059656qtv.294.1626470940409;
        Fri, 16 Jul 2021 14:29:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/rGIlMZXPU7T3qfOnTizDJI9I0dX2kqwDbKljo69VftMGZBefLuWX+uvFXWRvzofzBsFBCg==
X-Received: by 2002:ac8:6ec1:: with SMTP id f1mr11059637qtv.294.1626470940260;
        Fri, 16 Jul 2021 14:29:00 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id p3sm3716072qti.31.2021.07.16.14.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 14:28:59 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 2/6] cgroup/cpuset: Clarify the use of invalid
 partition root
To:     Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>
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
 <8c44b659-3fe4-b14f-fac1-cbd5b23010c3@redhat.com>
 <YPHwG61qGDa3h6Wg@mtj.duckdns.org>
 <e8c538a8-bf5c-b04c-1b21-ac22cd158dd1@redhat.com>
 <YPH3sF56gK71CxXY@mtj.duckdns.org>
Message-ID: <4a804edc-17ec-d8fa-d8c1-273252ba0ee4@redhat.com>
Date:   Fri, 16 Jul 2021 17:28:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPH3sF56gK71CxXY@mtj.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/16/21 5:18 PM, Tejun Heo wrote:
> Hello,
>
> On Fri, Jul 16, 2021 at 05:12:17PM -0400, Waiman Long wrote:
>> Are you suggesting that we add a cpuset.cpus.events file that allows
>> processes to be notified if an event (e.g. hotplug) that changes a partition
>> root to invalid partition happens or when explicit change to a partition
>> root fails? Will that be enough to satisfy your requirement?
> Yeah, something like that or make the current state file generate events on
> state transitions.


Sure. I will change the patch to make cpuset.cpus.partition generates 
event when its state change. Thanks for the suggestion. It definitely 
makes it better.

Cheers,
Longman

