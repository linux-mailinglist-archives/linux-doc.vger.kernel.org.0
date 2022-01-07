Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C26C487C4D
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jan 2022 19:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiAGSpq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jan 2022 13:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiAGSpq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jan 2022 13:45:46 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A47C061574
        for <linux-doc@vger.kernel.org>; Fri,  7 Jan 2022 10:45:46 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id i14so8188244ioj.12
        for <linux-doc@vger.kernel.org>; Fri, 07 Jan 2022 10:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p008NdHOiM04X0Dpu/pu9oiwXT18U1iMKIaMOUwta5s=;
        b=B/Uhx8EFJ5WYIvauNc9iMRuJ++0RZzR7fXz+5FvLwZ85kP8HKGmqSXaOz4t4bHnU8J
         z9Wwt0S31FJ7l5stg7PF21iVm8k3vqgFUAYmCorfRVhr6uPaJ0GorEOknMUdUY3QfgIZ
         2WG8CZPFVfflIDgOQfJ+kbvk2leLwsXJf5kxQ671YANxqGm/pY4weNoode07JJeU+S+I
         y9RmrCoxrcbIKuEV0B9MPzWkDRc75TAY/3VyDIMuw/wzTft63zB+XwbXFZxxURh5ZJ4+
         QFR3YD5NGM7mLTSolCGPhJnlPFSgm1v24Ute5Yl8KubOplE1nTZbIDDc0e2zRwVw533D
         S/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p008NdHOiM04X0Dpu/pu9oiwXT18U1iMKIaMOUwta5s=;
        b=RqZQI8fHs/SnPCd5A9JbCjtZteC/KhzokU3sabFUwTV7keNrOGUOtqA7wUzBuzsV05
         wp9rpT2UUBsPepvG80egYrsQw1Q6rh8mVRXE2BOiKvHX6/wNMcsRb4oi11ufhKkr1T3j
         XIUSjqEMk82r11LRepzbqsBRg1srVnTeciOVFEoi1VpZlee74LYXETR28GEp22n7j06W
         zqZoXciM3Rj1vOVIt3rSYZRzPZ2IN9eyzaDgbn3o1b9UVd9A+pqLMQcIUtNDFytyvNWV
         +mpl1X+RkqU62A1Ow0B+lwFt+8Zg91e6fTpcxCJIAEIvujE4TNIhlxZDtSkKwnectF7J
         YmOA==
X-Gm-Message-State: AOAM533XO/9Nm4ll8g8QO9vIaEWqafnNCt6DgAIzYAfGgfOA2ZSwE0TD
        eH/ha2rhxnERq4u2upFJq/g1AA==
X-Google-Smtp-Source: ABdhPJywBvawzdrL2htRW0VR83BfsN4b8ddHZxLyhLH4FCWjvgyjBb53v1k0WApSbrQElQiJZThpCw==
X-Received: by 2002:a05:6602:1352:: with SMTP id i18mr31048171iov.195.1641581145332;
        Fri, 07 Jan 2022 10:45:45 -0800 (PST)
Received: from google.com ([2620:15c:183:200:8b41:537d:f5d3:269c])
        by smtp.gmail.com with ESMTPSA id t2sm3396421iob.1.2022.01.07.10.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 10:45:44 -0800 (PST)
Date:   Fri, 7 Jan 2022 11:45:40 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Michal Hocko <mhocko@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
Message-ID: <YdiKVJlClB3h1Kmg@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <YdSuSHa/Vjl6bPkg@google.com>
 <YdgKClGAuHlkzVbQ@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdgKClGAuHlkzVbQ@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 07, 2022 at 10:38:18AM +0100, Michal Hocko wrote:
> On Tue 04-01-22 13:30:00, Yu Zhao wrote:
> [...]
> > Hi Andrew, Linus,
> > 
> > Can you please take a look at this patchset and let me know if it's
> > 5.17 material?
> 
> I am still not done with the review and have seen at least few problems
> that would need to be addressed.
> 
> But more fundamentally I believe there are really some important
> questions to be answered. First and foremost this is a major addition
> to the memory reclaim and there should be a wider consensus that we
> really want to go that way. The patchset doesn't have a single ack nor
> reviewed-by AFAICS. I haven't seen a lot of discussion since v2
> (http://lkml.kernel.org/r/20210413065633.2782273-1-yuzhao@google.com)
> nor do I see any clarification on how concerns raised there have been
> addressed or at least how they are planned to be addressed.
> 
> Johannes has made some excellent points
> http://lkml.kernel.org/r/YHcpzZYD2fQyWvEQ@cmpxchg.org. Let me quote
> for reference part of it I find the most important:
> : Realistically, I think incremental changes are unavoidable to get this
> : merged upstream.
> : 
> : Not just in the sense that they need to be smaller changes, but also
> : in the sense that they need to replace old code. It would be
> : impossible to maintain both, focus development and testing resources,
> : and provide a reasonably stable experience with both systems tugging
> : at a complicated shared code base.
> : 
> : On the other hand, the existing code also has billions of hours of
> : production testing and tuning. We can't throw this all out overnight -
> : it needs to be surgical and the broader consequences of each step need
> : to be well understood.
> : 
> : We also have millions of servers relying on being able to do upgrades
> : for drivers and fixes in other subsystems that we can't put on hold
> : until we stabilized a new reclaim implementation from scratch.
> 
> Fully agreed on all points here.
> 
> I do appreciate there is a lot of work behind this patchset and I
> also do understand it has gained a considerable amount of testing as
> well. Your numbers are impressive but my experience tells me that it is
> equally important to understand the worst case behavior and there is not
> really much mentioned about those in changelogs.
> 
> We also shouldn't ignore costs the code is adding. One of them would be
> a further page flags depletion. We have been hitting problems on that
> front for years and many features had to be reworked to bypass a lack of
> space in page->flags.
> 
> I will be looking more into the code (especially the memcg side of it)
> but I really believe that a consensus on above Johannes' points need to
> be found first before this work can move forward.

Thanks for the summary. I appreciate your time and I agree your
assessment is fair.

So I've acknowledged your concerns, and you've acknowledged my numbers
(the performance improvements) are impressive.

Now we are in agreement, cheers.

Next, I argue that the benefits of this patchset outweigh its risks,
because, drawing from my past experience,
1. There have been many larger and/or riskier patchsets taken; I'll
   assemble a list if you disagree. And this patchset is fully guarded
   by #ifdef; Linus has also assessed on this point.
2. There have been none that came with the testing/benchmarking
   coverage as this one did. Please point me to some if I'm mistaken,
   and I'll gladly match them.

The numbers might not materialize in the real world; the code is not
perfect; and many other risks... But all the top eight open source
memory hogs were covered, which is unprecedented; memcached and fio
showed significant improvements and it only takes a few commands to
see for yourselves.

Regarding the acks and the reviewed-bys, I certainly can ask people
who have reaped the benefits of this patchset to do them, if it's
required. But I see less fun in that. I prefer to provide empirical
evidence and convince people who are on the other side of the aisle.
