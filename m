Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD4648BC9E
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jan 2022 02:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235152AbiALBqf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Jan 2022 20:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347942AbiALBqd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 20:46:33 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EE0C061751
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 17:46:32 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a5so1468097wrh.5
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 17:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jfvsr8PR3GjeTvciCbxfFgfs5vC3rlXelyaQOInqWns=;
        b=jpZOnqubfJ0hnEhpOd1UgVHFjcFGZvUD1EvP6SUEZcQOhrbAaa/xGlMNgtViJBEN9b
         TS3Onjx6QOHUseMhJ6AfbRR2PDachzWW+PUvAdKLONL7MyYYGMUJ78xcqa/j7jyBNv/E
         dRhbsnB3ka3OxcsW7aSwD2gLXVIQvG1sFSpl/7JE/9V/+eFAathAKk49OJlM9DLNszjz
         XySZdrGz3n2rjofi9CcsyOShAntfICBUPa8Rf3BKmlOHDdC+yCeviyV+OHx4JU5P7HFu
         QQ79C5sDc5LafR3I85TgyVETbURK8Sw7vAKO8XyaL7XO/OMZ2OIqy5cCNL4pwoCKyFeS
         Xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jfvsr8PR3GjeTvciCbxfFgfs5vC3rlXelyaQOInqWns=;
        b=zAKRxB7Fd5ssNFfTKmAniAnf7FfB7IsF8ebNzzKRB+lHwFzwp7d5oY19oPVtOObvA2
         toq1nqm95dIkLp+yyf/caRmppvK1qwV/OTLoogmXuA8DwoXj/uar4JNX4+UhIJSqUafl
         Q2+vDtqqaqCsiX1F/tE4+eF6iRCPwTbfg8rao7YMb0+NAuRFa7mYOTNkh3rMTz4AQNzt
         bdMcR/8qw9VpyomVsnMhlhb+poWOWc3Fj21jFZBz95bo6f+8h+fHDSd2kbftZRre5XrI
         DOMkwBZLrP2SzDjocv8GSnvln3AWDKZUYa2fLt139018plrEvb5mo7t/ttwBuSucQHLn
         XzXw==
X-Gm-Message-State: AOAM531U9RivO7QWAN8rKcmIwjAH7WC5BJI/jy7IVGRWy5m7/th0NIzA
        Ec4sE9uzGsytj2PW5Xaxz79i4Cv9CJWoDw4IpMrhyA==
X-Google-Smtp-Source: ABdhPJwtHkljLUOCxyakqEbUb2j/J0vIrKEKy0mZ5iJW02TGkn+sQPf3J4n7Od0UkQ8UTmgDmDmQZVMrdAYemlDlCY0=
X-Received: by 2002:adf:f151:: with SMTP id y17mr5748842wro.547.1641951991215;
 Tue, 11 Jan 2022 17:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20220104202227.2903605-1-yuzhao@google.com> <YdSuSHa/Vjl6bPkg@google.com>
 <Yd1Css8+jsspeZHh@google.com>
In-Reply-To: <Yd1Css8+jsspeZHh@google.com>
From:   Suleiman Souhlal <suleiman@google.com>
Date:   Wed, 12 Jan 2022 10:46:19 +0900
Message-ID: <CABCjUKBiECMEgnMaCrfApVbWPgw3UuwNH+-Y9ME+2ogJSm+p-Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
To:     Yu Zhao <yuzhao@google.com>
Cc:     Alexandre Frade <kernel@xanmod.org>,
        Brian Geffon <bgeffon@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Steven Barrett <steven@liquorix.net>,
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
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, page-reclaim@google.com, x86@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 11, 2022 at 5:41 PM Yu Zhao <yuzhao@google.com> wrote:
>
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
>
> Downstream kernel maintainers who have been carrying MGLRU for more than
> 3 versions, can you please provide your Acked-by tags?
>
> Having this patchset in the mainline will make your job easier :)
>
>    Alexandre - the XanMod Kernel maintainer
>                https://xanmod.org
>
>    Brian     - the Chrome OS kernel memory maintainer
>                https://www.chromium.org
>
>    Jan       - the Arch Linux Zen kernel maintainer
>                https://archlinux.org
>
>    Steven    - the Liquorix kernel maintainer
>                https://liquorix.net
>
>    Suleiman  - the ARCVM (Android downstream) kernel memory maintainer
>                https://chromium.googlesource.com/chromiumos/third_party/kernel

Android on ChromeOS has been using MGLRU for a while now, with great results.
It would be great for more people to more easily be able to benefit from it.

Acked-by: Suleiman Souhlal <suleiman@google.com>

-- Suleiman
