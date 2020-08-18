Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250B7248320
	for <lists+linux-doc@lfdr.de>; Tue, 18 Aug 2020 12:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgHRKf6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Aug 2020 06:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgHRKfo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Aug 2020 06:35:44 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF01C061344
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 03:35:44 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id i20so3509461qkk.8
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qlc8i4WcaLGzjuzLCQuYqKKSVFT1SJwivNfqZW5VqT4=;
        b=D+AXs5u4icCFXOrccNIya9OfdiSVGHptiCbS4U4MtOZK/btvSa9eX8FVKZBh1negDV
         FemQeVyJCt8wUbC+K0euzqx7jvOmXbQm5Dn3nJcMx6aDQnmw0A/HkuGACqgYd2kPfJiG
         vdcnekXyohzB2PvtYEUWuln9SFWFdhspRM8oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qlc8i4WcaLGzjuzLCQuYqKKSVFT1SJwivNfqZW5VqT4=;
        b=ENaMeY/XlP1KIt65NCZU7ilhiZs+gQ09KLLtySeShPu1oub9iGJcJa8UW+nhPcsiqa
         +2ZT3EJxX0snNLtjnoQz2y5h8TwfyTi+ZJAHeII7RcmE9zovP1c5eOGhMzjJs90Rc21b
         aCs/+8xvdU2BmWadyGMvJMUugqlQmD/0Y9MtZCQHhGkU6+JnzMTwqTtfOjX5CvubRkA0
         ekzPhfGNUK3Lyi/aDtQ2RmhS2EB6iKOfdhxBR6W/YqQ0qJxt9u1dN1Gg/OtCG+3Ym6sf
         AGacO4UPxbAHqTx10Pm+fzXSxxI9BOBfK7IXbP42P8uoNtLEJbU0TiDEyRRLhKCOK4cs
         526w==
X-Gm-Message-State: AOAM530VN56BnVfIioRYjsTrJYJ9NRPoJWarXZPNlR0ozFoOv+Ti78G1
        URCgRXFb8aRnnpnJUwKv2YOJog==
X-Google-Smtp-Source: ABdhPJyP9123mjcEB4Gacb/otH7/RlkpFN/q342fEZhyE2JQ0hS+aZmtOxf4Y511PcIOlkRd899Dhw==
X-Received: by 2002:a37:9c6:: with SMTP id 189mr16374124qkj.122.1597746941391;
        Tue, 18 Aug 2020 03:35:41 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:179c])
        by smtp.gmail.com with ESMTPSA id n6sm18455790qkh.74.2020.08.18.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 03:35:40 -0700 (PDT)
Date:   Tue, 18 Aug 2020 11:35:39 +0100
From:   Chris Down <chris@chrisdown.name>
To:     peterz@infradead.org
Cc:     Michal Hocko <mhocko@suse.com>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH 0/8] memcg: Enable fine-grained per process memory
 control
Message-ID: <20200818103539.GA156577@chrisdown.name>
References: <20200817140831.30260-1-longman@redhat.com>
 <20200818091453.GL2674@hirez.programming.kicks-ass.net>
 <20200818092617.GN28270@dhcp22.suse.cz>
 <20200818095910.GM2674@hirez.programming.kicks-ass.net>
 <20200818101756.GA155582@chrisdown.name>
 <20200818102616.GP2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200818102616.GP2674@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

peterz@infradead.org writes:
>On Tue, Aug 18, 2020 at 11:17:56AM +0100, Chris Down wrote:
>
>> I'd ask that you understand a bit more about the tradeoffs and intentions of
>> the patch before rushing in to declare its failure, considering it works
>> just fine :-)
>>
>> Clamping the maximal time allows the application to take some action to
>> remediate the situation, while still being slowed down significantly. 2
>> seconds per allocation batch is still absolutely plenty for any use case
>> I've come across. If you have evidence it isn't, then present that instead
>> of vague notions of "wrongness".
>
>There is no feedback from the freeing rate, therefore it cannot be
>correct in maintaining a maximum amount of pages.

memory.high is not about maintaining a maximum amount of pages. It's strictly 
best-effort, and the ramifications of a breach are typically fundamentally 
different than for dirty throttling.

>0.5 pages / sec is still non-zero, and if the free rate is 0, you'll
>crawl across whatever limit was set without any bounds. This is math
>101.
>
>It's true that I haven't been paying attention to mm in a while, but I
>was one of the original authors of the I/O dirty balancing, I do think I
>understand how these things work.

You're suggesting we replace a well understood, easy to reason about model with 
something non-trivially more complex, all on the back of you suggesting that 
the current approach is "wrong" without any evidence or quantification.

Peter, we're not going to throw out perfectly function memcg code simply 
because of your say so, especially when you've not asked for information or 
context about the tradeoffs involved, or presented any evidence that something 
perverse is actually happening.

Prescribing a specific solution modelled on some other code path here without 
producing evidence or measurements specific to the nuances of this particular 
endpoint is not a recipe for success.
