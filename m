Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D94542403
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jun 2022 08:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbiFHBCp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Jun 2022 21:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1587620AbiFGXx2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 19:53:28 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0355B296320
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 15:48:11 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id c62so18069770vsc.10
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=84rrjzvQjetXZ9VxR83Ek9L02yu9vPluECSHMeZ4QYY=;
        b=Njye/HHMhIRsWQNQTrirOwnYbtGHVMcDWltSM3mtC4vv0KfiUIELi4iWQiWjKOh/cr
         44afjRMkUuYSMaFGLOnk7jgyE4NaLqenvcaxIrJv2lD2CiihB9qbYNBOJghHCVnw+57c
         NpVo6B4PFmYArqCVJ9uEI8cMFi6NXJrAkBsQvUBBD+Asa+YdgJyYYQ2JK5P0TKEE4lUN
         JMWF98q1BGd+3Hnvoox8XQZdYYDPXfsJbm3Hl4xoS9vycwdkv9XjmJbgdyYyo5jJ/rdy
         m13A/2FB6qW9ce14YXBzzlr3UdW2zV98TVehhcolktO2macsN3Qd6K+CQeRUPrXbt60q
         uYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84rrjzvQjetXZ9VxR83Ek9L02yu9vPluECSHMeZ4QYY=;
        b=Gg4urn+WvlMIzGdlGQxzTgs8S69zxZX4+ApYXl17fruvcURbXJd3gwExNUQd+0WWJJ
         rJJyy2qy4bb/ETklIHe2JYLUD+Fq9pKSGmDp3ttRsYQCQJg4L5D3xQmuP4zRLKFn+wtx
         wq5WxRWQ+ToSjSRu7tOavlYMG3q5d4LoPR8PTNadlPgq7ny/LRRcjr96ncVHYqxAsdtU
         OSsp/uPxc0miSz67UHybXnFH/Wj72E2DsHvxChbEXNNkyF+xJnwgfjxWIqhItmmS8eit
         Ey1JmvuCBtnZcTisMJhzZfySL9c1Eb/KRBz0zOplSAklJAZR0T4EU10H728rNAR8ztSo
         mWlg==
X-Gm-Message-State: AOAM532hNQ/CdXvCDkwVEkhrdJdeYWsteT1ykcnLKPRHDIjRy+7u3PT0
        jHkvy29YoN4KeuMH10TYzIoDLEeq+Jj0j67ZNgORWg==
X-Google-Smtp-Source: ABdhPJzJGCLJjLlIACMJEiC10VEeYjtSEqkHHTTzYPcq6Bazd/VJ2+cIkHbjj4CZNkCrGD9oNsNuEO3KROdXMuwrwfE=
X-Received: by 2002:a05:6102:3e23:b0:34b:b6b0:2ae7 with SMTP id
 j35-20020a0561023e2300b0034bb6b02ae7mr7020910vsv.81.1654642089951; Tue, 07
 Jun 2022 15:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220518014632.922072-1-yuzhao@google.com> <a40e75a9-6c18-e859-9850-54f2f5f45c71@kernel.dk>
In-Reply-To: <a40e75a9-6c18-e859-9850-54f2f5f45c71@kernel.dk>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 7 Jun 2022 16:47:33 -0600
Message-ID: <CAOUHufbjFAz6m69YgJ6=gzb5m9=73d9a_FkVfqdb4E47Y368Xg@mail.gmail.com>
Subject: Re: [PATCH v11 00/14] Multi-Gen LRU Framework
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 17, 2022 at 8:05 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 5/17/22 7:46 PM, Yu Zhao wrote:
> > TLDR
> > ====
> > The current page reclaim is too expensive in terms of CPU usage and it
> > often makes poor choices about what to evict. This patchset offers an
> > alternative solution that is performant, versatile and
> > straightforward.
>
> Where's the changelog since v10?

Apologies for my laziness.

The changes are mainly nits, e.g., small refactorings, additional
comments, etc.; relatively major ones are:

* VM_BUG_ON() -> VM_WARN_ON_ONCE()
* Removed `depends on !MAXSMP`

There are no bug fixes or structural changes in v11. I do have a bug
fix [1] queued for the coming v12, which I have been benchmarking on
top of 5.19-rc1. So far I see no improvements or regressions, compared
with v10 on top of 5.18-rc1.

[1] https://forum.armbian.com/topic/20018-mglru-patches-to-bring-down-kswapd-cpu-usage
