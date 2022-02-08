Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19FCB4AD484
	for <lists+linux-doc@lfdr.de>; Tue,  8 Feb 2022 10:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234747AbiBHJQb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Feb 2022 04:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353379AbiBHJQb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 04:16:31 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E23DC03FEC1
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 01:16:29 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id h7so20299508iof.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 01:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O/lx//nLUVMx2EI4vj5HKtagrUsb3ZYCM82TQ4lEins=;
        b=GNZIO6/kuk+ic9l6Cd+p/G1mclOH/q3G/vT9SOJqWStL42meaNn/c/wFxfOu3vH9z1
         uOLAzQrhJq95IkE+TOApdAN1ebRCQvgTw7uDwp8aJjVbau9Q2hRunsd/UW0wOVvjYwd1
         LcpnpZOyuC0DTMEJBpVE1aNfStAYiHEPBjeyFGgD6lSx1oXM4Le3EOGAoBFH3e2WoeDV
         uIQBx1oy/xTb+3xXbPXk86a1+F/MI5UOjandFhzeQffQ3GTJisprjuAegNuPLc1FAiS7
         JphN+alAke3aQBct32r7k9yuTI6pGb/AYKbCAvQdosBGvl25eO7UHSAH5rqstI1IASX8
         bjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O/lx//nLUVMx2EI4vj5HKtagrUsb3ZYCM82TQ4lEins=;
        b=0ojKj6FlB4DcQUG2OtO9CsODfcNQVK4F1xRpSZu1QtcKJR8QVcElrXQiwGNy0WOkQ2
         RXpkHZIQkrAP3fXWtC8/svFFMjMJIeX1R+sMIGNRBlfPbkYY54HRrylTTYk5iHy36cOl
         EM7cW1PVNfnZl2QSss+arMY1vYZsRe1KR7vz+1eqbQpa6PXuzLb7lb4SGehA1SMSCOac
         uowG+L4XOOHyykmnPwxlWKm471ILHzx+kucosapU4DHzTp76tYZwR3k9+EZC1nEciS1X
         bEXcMelNJbLU/ovsUaYKMlsPcQImRayDxMnjfjqy3fL+YND2amhbM+N4JvBFEw8LAioj
         uUfQ==
X-Gm-Message-State: AOAM533/dB3pLEtreM2vCsYckuxVhZXUUbnegaHfbcJNUPW4dmsHycqI
        x3vDUzQ4pj90BwnKpX7l8G3r9A==
X-Google-Smtp-Source: ABdhPJw5yaI9Ui9SJAQTv5l/nY/N9q1YxRO/3oThR7TlMGDQjGNGWfY/7ovjRm8eOUtzjrPfeX8IwA==
X-Received: by 2002:a05:6638:1028:: with SMTP id n8mr1757754jan.318.1644311788671;
        Tue, 08 Feb 2022 01:16:28 -0800 (PST)
Received: from google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
        by smtp.gmail.com with ESMTPSA id k11sm7556042iob.23.2022.02.08.01.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 01:16:27 -0800 (PST)
Date:   Tue, 8 Feb 2022 02:16:24 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Barry Song <21cnbao@gmail.com>
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
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, page-reclaim@google.com,
        x86 <x86@kernel.org>
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
Message-ID: <YgI06D8MbEpchooF@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <CAGsJ_4zULJ5vPwn73Z5Bap3eRkAX+Yv24c-n41+zC7fN8xG60g@mail.gmail.com>
 <Ye+dPmO17JN2bNLL@google.com>
 <CAGsJ_4w5GM5r916XEz+gj=33A+b98kyJONLNpEnBMmX5XnPRmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4w5GM5r916XEz+gj=33A+b98kyJONLNpEnBMmX5XnPRmg@mail.gmail.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 28, 2022 at 09:54:09PM +1300, Barry Song wrote:
> On Tue, Jan 25, 2022 at 7:48 PM Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Sun, Jan 23, 2022 at 06:43:06PM +1300, Barry Song wrote:
> > > On Wed, Jan 5, 2022 at 7:17 PM Yu Zhao <yuzhao@google.com> wrote:
> >
> > <snipped>
> >
> > > > Large-scale deployments
> > > > -----------------------
> > > > We've rolled out MGLRU to tens of millions of Chrome OS users and
> > > > about a million Android users. Google's fleetwide profiling [13] shows
> > > > an overall 40% decrease in kswapd CPU usage, in addition to
> > >
> > > Hi Yu,
> > >
> > > Was the overall 40% decrease of kswap CPU usgae seen on x86 or arm64?
> > > And I am curious how much we are taking advantage of NONLEAF_PMD_YOUNG.
> > > Does it help a lot in decreasing the cpu usage?
> >
> > Hi Barry,
> >
> > The fleet-wide profiling data I shared was from x86. For arm64, I only
> > have data from synthetic benchmarks at the moment, and it also shows
> > similar improvements.
> >
> > For Chrome OS (individual users), walk_pte_range(), the function that
> > would benefit from ARCH_HAS_NONLEAF_PMD_YOUNG, only uses a small
> > portion (<4%) of kswapd CPU time. So ARCH_HAS_NONLEAF_PMD_YOUNG isn't
> > that helpful.
> 
> Hi Yu,
> Thanks!
> 
> In the current kernel, depending on reverse mapping, while memory is
> under pressure,
> the cpu usage of kswapd can be very very high especially while a lot of pages
> have large mapcount, thus a huge reverse mapping cost.

Agreed. I've posted v7 which includes kswapd profiles collected from an
arm64 v8.2 laptop under memory pressure.

> Regarding  <4%, I guess the figure came from machines with NONLEAF_PMD_YOUNG？

No, it's from Snapdragon 7c. Please see the kswapd profiles in v7.

> In this case, we can skip many PTE scans while PMD has no accessed bit
> set. But for
> a machine without NONLEAF, will the figure of cpu usage be much larger?

So NONLEAF_PMD_YOUNG at most can save 4% CPU usage from kswapd. But
this definitely can vary, depending on the workloads.

> > > If so, this might be
> > > a good proof that arm64 also needs this hardware feature?
> > > In short, I am curious how much the improvement in this patchset depends
> > > on the hardware ability of NONLEAF_PMD_YOUNG.
> >
> > For data centers, I do think ARCH_HAS_NONLEAF_PMD_YOUNG has some value.
> > In addition to cold/hot memory scanning, there are other use cases like
> > dirty tracking, which can benefit from the accessed bit on non-leaf
> > entries. I know some proprietary software uses this capability on x86
> > for different purposes than this patchset does. And AFAIK, x86 is the
> > only arch that supports this capability, e.g., risc-v and ppc can only
> > set the accessed bit in PTEs.
> 
> Yep. NONLEAF is a nice feature.
> 
> btw, page table should have a separate DIRTY bit, right?

Yes.

> wouldn't dirty page
> tracking depend on the DIRTY bit rather than the accessed bit?

It depends on the goal.

> so x86 also has
> NONLEAF dirty bit?

No.

> Or they are scanning accessed bit of PMD before
> scanning DIRTY bits of PTEs?

A mandatory sync to disk must use the dirty bit to ensure data
integrity. But for a voluntary sync to disk, it can use the accessed
bit to narrow the search of dirty pages.

A mandatory sync is used to free specific dirty pages. A voluntary sync
is used to keep the number of dirty pages low in general and it doesn't
target any specific dirty pages.

> > In fact, I've discussed this with one of the arm maintainers Will. So
> > please check with him too if you are interested in moving forward with
> > the idea. I might be able to provide with additional data if you need
> > it to make a decision.
> 
> I am interested in running it and have some data without NONLEAF
> especially while free memory is very limited and the system has memory
> thrashing.

The v7 has a switch to disable this feature on x86. If you can run your
workloads on x86, then it might be able to help you measure the difference.
