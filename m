Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9172124C267
	for <lists+linux-doc@lfdr.de>; Thu, 20 Aug 2020 17:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgHTPou (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Aug 2020 11:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729156AbgHTPot (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Aug 2020 11:44:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F70C061385
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2020 08:44:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m22so2615901ljj.5
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2020 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aW5D54Ks5bX7GTCPUNj/OhuX5CYhQx8WbzzDnGuedJk=;
        b=TxIGJoGSvER1kxH5GBxsgjNclU/AHsfEWRdVgil+xYIRkguO4qQMTt9DnDGU5jJOgy
         ogCuH/O85Igrb+7qvogcO8TLebRhFiMUvflPiN3DNoKb1coNIoBP0m2nvYjW7k0ZxBGX
         vw0GTxaHMuB3GeaQqRqQzKcE1xNc2dEJbI79H2tjq/EAlHrz3eSIexo0BLHo1DYtNg6X
         sRZ3T2aD9KQwcUdy7oeWWXxgVRVmnxLtQUkg19ZUgeU8YB4bdNSt5V6ME2c/QeUPjmOF
         Omd+pN5k1hP+EGsNGYyVto9WNbDs4wzBn6xY3Fdu/OByVHWyHuM+LNaWwejOVK4fmFjw
         u3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aW5D54Ks5bX7GTCPUNj/OhuX5CYhQx8WbzzDnGuedJk=;
        b=NFna6OJ50xiLeURT0rmPydtG1AfmK0o5SCna4N7iPuqRrDFtgEBVEOC4e60qeT22r5
         je1aW4B2xvUZetXln9FyYZKkbOdSJpo9FvQMZ6Zq088u6gbqyou6ZhVWKepD8nF5LENz
         UglmBTBJkbKulg3VtL0iogRgamiy4/Kn0WHSohXDnwU1zeTFELI/j/OG8v6W/YQ66iM2
         ioydU76VfNsVBwgY2TvB9YVy70blw0X2y6K34H800tHpxTYfj+ap2mjOkb0IzBCIcBKs
         9TC8PA+yv3dV4EUF9g3R3MsXd/bifn/6sJU2715jphWpe8FxAO2Tcyaq33FaBCxsvUTX
         r2rg==
X-Gm-Message-State: AOAM532zqe6/CSvdND/a3pDZCxTXfwcvSP63lv8WNhQiJ131amoa0uQx
        LR4IfdR01Un4IC9jmqE0mancTqrbUmC81qU1bBjLHg==
X-Google-Smtp-Source: ABdhPJyOZc54KS+mHAonnQxVVG97p8XeDrNjnguZlqikAmyZwh9t7GuPdIbj3CDjTwWyvxCjtXg082HL/ahD1OPebpE=
X-Received: by 2002:a05:651c:233:: with SMTP id z19mr1964269ljn.347.1597938286213;
 Thu, 20 Aug 2020 08:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALvZod6RS66aSFjWHvpbjuinz2mwbGDnz+gh5L7dp+c3D_Zy1w@mail.gmail.com>
 <20200820071052.24271-1-sjpark@amazon.com>
In-Reply-To: <20200820071052.24271-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 20 Aug 2020 08:44:33 -0700
Message-ID: <CALvZod7a=zr8VX3T2KOheUJ-THjGz=O+JBdcjw4iraN3m9jSJg@mail.gmail.com>
Subject: Re: [RFC v7 00/10] DAMON: Support Physical Memory Address Space Monitoring
To:     SeongJae Park <sjpark@amazon.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        "Du, Fan" <fan.du@intel.com>, foersleo@amazon.de,
        Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>, mark.rutland@arm.com,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, rppt@kernel.org,
        sblbir@amazon.com, shuah@kernel.org, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 20, 2020 at 12:11 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> On Wed, 19 Aug 2020 18:21:44 -0700 Shakeel Butt <shakeelb@google.com> wrote:
>
> > On Tue, Aug 18, 2020 at 12:25 AM SeongJae Park <sjpark@amazon.com> wrote:
> > >
> > > From: SeongJae Park <sjpark@amazon.de>
> > >
> > > Changes from Previous Version
> > > =============================
> > >
> > > - Use 42 as the fake target id for paddr instead of -1
> > > - Fix a typo
> > >
> > > Introduction
> > > ============
> > >
> > > DAMON[1] programming interface users can extend DAMON for any address space by
> > > configuring the address-space specific low level primitives with appropriate
> > > ones including their own implementations.  However, because the implementation
> > > for the virtual address space is only available now, the users should implement
> > > their own for other address spaces.  Worse yet, the user space users who rely
> > > on the debugfs interface and user space tool, cannot implement their own.
> > >
> > > This patchset implements another reference implementation of the low level
> > > primitives for the physical memory address space.  With this change, hence, the
> > > kernel space users can monitor both the virtual and the physical address spaces
> > > by simply changing the configuration in the runtime.  Further, this patchset
> > > links the implementation to the debugfs interface and the user space tool for
> > > the user space users.
> > >
> > > Note that the implementation supports only the user memory, as same to the idle
> > > page access tracking feature.
> > >
> > > [1] https://lore.kernel.org/linux-mm/20200706115322.29598-1-sjpark@amazon.com/
> > >
> >
> > I am still struggling to find the benefit of this feature the way it
> > is implemented i.e. region based physical address space monitoring.
> > What exactly am I supposed to do for a given hot (or cold) physical
> > region? In a containerized world, that region can contain pages from
> > any cgroup. I can not really do anything about the accesses PHY-DAMON
> > provides me for a region.
>
> Technically speaking, this patchset introduces an implementation of DAMON's low
> level primitives for physical address space of LRU-listed pages.  In other
> words, it is not designed for cgroups case.

So, this RFC is for a system running a single workload which comprises
multiple processes. Instead of registering each process with DAMON,
just monitor the whole physical memory, right?

Though I am still not sure how the output from DAMON can be used in
this case. DAMON told me a physical region is cold, how do I find out
processes that have mapped the pages in that region to do
process_madvise(PAGEOUT) on them?
