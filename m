Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF1C492294
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jan 2022 10:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbiARJV1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Jan 2022 04:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233942AbiARJV0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jan 2022 04:21:26 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D849C061574
        for <linux-doc@vger.kernel.org>; Tue, 18 Jan 2022 01:21:26 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id d14so17005897ila.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Jan 2022 01:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5Zvs9+UMuisbE1S/G8Xv89qZmGNrRAyujh7XOE4Gpac=;
        b=WNs7c1MTDzC9jGA7BOWDtnQYV9lhuodolnBJBBDhbPGOnvPzIRjK3ikEJe7FpeZWF7
         khHNeCGff946aku7HKG4YWIraUbOgbcrban0UwppU+ZvLt5FwAd90Z6C41CEY9fpyNod
         4Xx8cWlhS025exLxB0ao3sOAsRH921YrlE6z/uUtrHvv9SJWc7VY4EtPUyfSiDaKKqDr
         hdRPjoope/KEeIneL+fkDjaHzun/u6EFFCHd0Gd10PGXeSknHaoyHcUEGJ8+UtjhrZwc
         4q2WEwVmfoZON9nDK44fxgg7jqC5p7GuiDxZalbaTsqTm1pcX8RGq7sGmeYCmQLq9QSa
         nv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5Zvs9+UMuisbE1S/G8Xv89qZmGNrRAyujh7XOE4Gpac=;
        b=023sU/Akca/TP7NXVUEQ0c1rBj0F/tQ6X87Lz0QJYTXDYTPUwS+p4npjXZseoHC4xJ
         QEiS4SWikZmT5rj8wJnKAiCvYDdKpDyjevROgmx6fwE0g6KE+LqbtaR4h24pNcIHMw0g
         4oQ+BjWJ3I5waAbHT1Q0jVLmKd+Mfw7+9+Nu2a1O3of6/5uyvmmQaY0sgZfYV0jnFk0x
         oQPWzICB2YHtKKmmpWZZwVWbI704im5vE5qGeT0iP/qGHsXyi1QBX/h6mDIlG1bCuyzG
         l1wv1c9i6sPIBRCBqk/snm+K3UzgXR552DvSDJNDzCiSSdPhCqVd8oAAPcQLdYrjTf2g
         Gklg==
X-Gm-Message-State: AOAM531aKeuQYxEJciX8n1ICOwonrdKPL2D4xOYTq1m1cJNe1olHZ6cG
        gqlWXVGwwhr3ACGEHDux2c/SXA==
X-Google-Smtp-Source: ABdhPJzuNClvh26yBkKaIbqUIdOMn/cTG48kphsbceegwXKy1WFnvwj3FQC5I7nUchi8DS+vx4TyJA==
X-Received: by 2002:a92:cd4b:: with SMTP id v11mr7081222ilq.3.1642497685350;
        Tue, 18 Jan 2022 01:21:25 -0800 (PST)
Received: from google.com ([2620:15c:183:200:40dc:e0ca:c949:a83b])
        by smtp.gmail.com with ESMTPSA id o10sm2389761iow.0.2022.01.18.01.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 01:21:24 -0800 (PST)
Date:   Tue, 18 Jan 2022 02:21:21 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Donald Carr <d@chaos-reins.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
Message-ID: <YeaGkZ50n7/mDuJX@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <YdSuSHa/Vjl6bPkg@google.com>
 <Yd1Css8+jsspeZHh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd1Css8+jsspeZHh@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 11, 2022 at 01:41:22AM -0700, Yu Zhao wrote:
> On Tue, Jan 04, 2022 at 01:30:00PM -0700, Yu Zhao wrote:
> > On Tue, Jan 04, 2022 at 01:22:19PM -0700, Yu Zhao wrote:
> > > TLDR
> > > ====
> > > The current page reclaim is too expensive in terms of CPU usage and it
> > > often makes poor choices about what to evict. This patchset offers an
> > > alternative solution that is performant, versatile and
> > > straightforward.
> > 
> > <snipped>
> > 
> > > Summery
> > > =======
> > > The facts are:
> > > 1. The independent lab results and the real-world applications
> > >    indicate substantial improvements; there are no known regressions.
> > > 2. Thrashing prevention, working set estimation and proactive reclaim
> > >    work out of the box; there are no equivalent solutions.
> > > 3. There is a lot of new code; nobody has demonstrated smaller changes
> > >    with similar effects.
> > > 
> > > Our options, accordingly, are:
> > > 1. Given the amount of evidence, the reported improvements will likely
> > >    materialize for a wide range of workloads.
> > > 2. Gauging the interest from the past discussions [14][15][16], the
> > >    new features will likely be put to use for both personal computers
> > >    and data centers.
> > > 3. Based on Google's track record, the new code will likely be well
> > >    maintained in the long term. It'd be more difficult if not
> > >    impossible to achieve similar effects on top of the existing
> > >    design.
> > 
> > Hi Andrew, Linus,
> > 
> > Can you please take a look at this patchset and let me know if it's
> > 5.17 material?
> > 
> > My goal is to get it merged asap so that users can reap the benefits
> > and I can push the sequels. Please examine the data provided -- I
> > think the unprecedented coverage and the magnitude of the improvements
> > warrant a green light.

My gratitude to Donald who has been helping test MGLRU since v2:

    Donald Carr (d@chaos-reins.com)

    Founder of Chaos Reins (http://chaos-reins.com), an SF based
    consultancy company specializing in designing/creating embedded
    Linux appliances.

Can you please provide your Tested-by tags? This will ensure the credit
for your contributions.

Thanks!
