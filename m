Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827783E508B
	for <lists+linux-doc@lfdr.de>; Tue, 10 Aug 2021 03:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237183AbhHJBMo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Aug 2021 21:12:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47214 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229739AbhHJBMn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Aug 2021 21:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628557941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b7XJ3sqkjfHFuPFTck2dP2wBhFySTzytxDlqqd+iwHA=;
        b=h1OFKbIIeaeupfqAQWeURjAt5qoHseogEQGFEhh3RL8PrXaUpF13xi1G48mDcsW5MF+s9S
        weJqAxJvvoTMDTJc2MBycqwaj8kX1U70jFR+KS4uVLJjDHo8SoQBzlG22updBhcbR/SMvK
        XRS0KBIrlRYwIKkdJuRjzwXBa9DXq0k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-I4v62UH9NGK-WvHWexbIsw-1; Mon, 09 Aug 2021 21:12:20 -0400
X-MC-Unique: I4v62UH9NGK-WvHWexbIsw-1
Received: by mail-qk1-f200.google.com with SMTP id h5-20020a05620a0525b02903b861bec838so14212447qkh.7
        for <linux-doc@vger.kernel.org>; Mon, 09 Aug 2021 18:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=b7XJ3sqkjfHFuPFTck2dP2wBhFySTzytxDlqqd+iwHA=;
        b=i8M8Go4b+WDogJhW9arkSQvOAgZ9hgoUts5sXVAT2nzLbSJ0Rnm8QzHTW6j6TPY0a8
         35PLJRlwgKucP7qHujMphW59OmjEJh7EfgAtBLNUYqfjHw2NBJBaYi+UsI6ZelaHIlwF
         h79j0z6oq6eicptkCIsrB239esQSlKrrqD0qiVcgolmcq0xLYQxTwA0dMUEqlp/L1ODy
         SEhc4UtWuSAQsR/W5rl/u5RS/in5C55ld1f+H4aiGNIusrNqHAhzwShlSR/fgeoNrvct
         1Xs0xBWZjqSBnezCgCqG36q3VuQF6o/6PCzP30csd6BXBEOZaWO/dG/4jWp+L6JcgMrT
         rngQ==
X-Gm-Message-State: AOAM533xHaRJd7ZvSCzntk9OgGmbVvV9TC2RwEaNvGPJsLsPc70o1kY2
        sPY++ycwY3Y3j03BdNNz4HmI91OdKHWquVpoISG+ouMB9q7sFQR8rqBLBwvC0ZKbFFVOruGBxB/
        HGDJFKf8lVrdCzzaC9NnO
X-Received: by 2002:ac8:5385:: with SMTP id x5mr7914714qtp.369.1628557940373;
        Mon, 09 Aug 2021 18:12:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF6rIf3rD64IJtihYoHCyLMTR4SvYsVu31YT92d5TjMiatftJQfAismFO2/uJ2ApU7xiMVEQ==
X-Received: by 2002:ac8:5385:: with SMTP id x5mr7914688qtp.369.1628557940198;
        Mon, 09 Aug 2021 18:12:20 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id b22sm2183568qtr.2.2021.08.09.18.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 18:12:19 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 0/9] cgroup/cpuset: Add new cpuset partition type &
 empty effecitve cpus
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
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
References: <20210720141834.10624-1-longman@redhat.com>
 <YP9ChFvrGrDMGzbe@slm.duckdns.org>
 <b2f49b2e-d5a4-1504-bd0c-0bd82943d855@redhat.com>
 <YRGwXw3KW8eFhEa8@mtj.duckdns.org>
Message-ID: <1df2d0be-f2b7-3e57-e656-2bcdf2a3c821@redhat.com>
Date:   Mon, 9 Aug 2021 21:12:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRGwXw3KW8eFhEa8@mtj.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/9/21 6:46 PM, Tejun Heo wrote:
> Hello, Waiman. Sorry about the delay. Was off for a while.
>
> On Tue, Jul 27, 2021 at 05:14:27PM -0400, Waiman Long wrote:
>> However, if we have a complicated partition setup with multiple child
>> partitions. Invalid cpuset.cpus change in a parent partition will cause all
>> the child partitions to become invalid too. That is the scenario that I
>> don't want to happen inadvertently. Alternatively, we can restrict those
> I don't think there's anything fundamentally wrong with it given the
> requirement that userland has to monitor invalid state transitions.
> The same mass transition can happen through cpu hotplug operations,
> right?
>
>> invalid changes if a child partition exist and let it pass through and make
>> it invalid if it is a standalone partition.
>>
>> Please let me know which approach do you want me to take.
> I think it'd be best if we can stick to some principles rather than
> trying to adjust it for specific scenarios. e.g.:
>
> * If a given state can be reached through cpu hot [un]plug, any
>    configuration attempt which reaches the same state should be allowed
>    with the same end result as cpu hot [un]plug.
>
> * If a given state can't ever be reached in whichever way, the
>    configuration attempting to reach such state should be rejected.

OK, I got it. I will make the necessary changes and submit a new patch 
series.

Thanks,
Longman

