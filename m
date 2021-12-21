Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0F047C4A8
	for <lists+linux-doc@lfdr.de>; Tue, 21 Dec 2021 18:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhLURFy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Dec 2021 12:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbhLURFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Dec 2021 12:05:54 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91259C061574
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 09:05:53 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bu9so9261193lfb.7
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 09:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tpumo0oZR7f+gDBFHqsREUmpm9cZIvo2yly46BhRCj0=;
        b=GnWHKkT8GouwFL0+uYYjXFlw6cUV9SMjR9tfE+ltAxKnlGj6O8fPiy0df016fPcBVF
         ur7H0ohhQUm1jlCOawmSbmrG+S5D2KrKNMVbGo+rAxsmydeS+L3Nov+E+gzmxlPWmQWG
         XXN1CVC9l1BhNxY+GTrFGrL4Fw1U5HMdxtV74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tpumo0oZR7f+gDBFHqsREUmpm9cZIvo2yly46BhRCj0=;
        b=uTL0EOhCGvgDsg10r9pGLAHm39vOeLnLkPp1FdLxwhcxbcVR64knf3TTjHYJM58WTq
         Rqt2Frp0/fMVwslR3PZDr8kadyBXfaPctx0SBoso0OC9YwsMAmlum0SxNGjLZL4Fvi9Y
         yCa1u6J6AhO6zY22M/cjtSEV3nBeQ4Ht2JeDZm+faA16gHNtOU9uMAlo9jpYI/BNjBdI
         5x7dpFjYuu9ajM22r+OQ0sbvPfqz1r15FqgUgZrd0HbGsdrLVOHy830pduPwjmNmWtv9
         cK6gznpNyYlYdR5Lv7I8EqPCNmatIPexv1gZDIlBY7VZ6gCu698vkwykm8piMzv4NZH9
         Thmg==
X-Gm-Message-State: AOAM531BKq4MkEShjbdKqRUDd8/CF5289BDqpC4Z67/B9ayyI2cWK0cu
        QP5iTN3vwxvtz6wDT86OZBS8dt/ZUiHjI5rIUjk=
X-Google-Smtp-Source: ABdhPJzs3ERfhW99DwKZQSrn4OtyHCmIEUjTaCtqOsbSex8wH9O80Ml4FmQQMXpDzRMHZZV4cus/yg==
X-Received: by 2002:a05:6512:39c7:: with SMTP id k7mr3701383lfu.650.1640106351673;
        Tue, 21 Dec 2021 09:05:51 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id s17sm1237127lfp.231.2021.12.21.09.05.50
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 09:05:51 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id bp20so15139589lfb.6
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 09:05:50 -0800 (PST)
X-Received: by 2002:adf:8b0e:: with SMTP id n14mr3335003wra.281.1640106339578;
 Tue, 21 Dec 2021 09:05:39 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wj7eSOhbWDeADL_BJKLzdDF5s_5R9v7d-4P3L6v1T3mpQ@mail.gmail.com>
 <20211218184233.GB1432915@nvidia.com> <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
 <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
 <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com> <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com> <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com> <20211221010312.GC1432915@nvidia.com>
 <fd7e3195-4f36-3804-1793-d453d5bd3e9f@redhat.com>
In-Reply-To: <fd7e3195-4f36-3804-1793-d453d5bd3e9f@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 21 Dec 2021 09:05:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgQq3H6wfkW7+MmduVgBOqHeiXQN97yCMd+m1mM-1xCLQ@mail.gmail.com>
Message-ID: <CAHk-=wgQq3H6wfkW7+MmduVgBOqHeiXQN97yCMd+m1mM-1xCLQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     David Hildenbrand <david@redhat.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, Nadav Amit <namit@vmware.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 21, 2021 at 12:58 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 21.12.21 02:03, Jason Gunthorpe wrote:
>
> > I'm having a hard time imagining how gup_fast can maintain any sort of
> > bit - it lacks all forms of locks so how can we do an atomic test and
> > set between two pieces of data?
>
> And exactly that is to be figured out.

So my preference would be to just always maintain the "exclusive to
this VM" bit in the 'struct page', because that makes things easier to
think about.

[ Of course - the bit could be reversed, and be a 'not exclusive to
this VM' bit, semantically the set-or-cleared issue doesn't matter.
Also, when I talk about some "exclusive to this VM" bit, I'm purely
talking about pages that are marked PageAnon(), so the bit may or may
not even exist for other pager types ]

And then all GUP-fast would need to do is to refuse to look up a page
that isn't exclusive to that VM. We already have the situation that
GUP-fast can fail for non-writable pages etc, so it's just another
test.

> Note that I am trying to make also any kind of R/O pins on an anonymous
> page work as expected as well, to fix any kind of GUP after fork() and
> GUP before fork(). So taking a R/O pin on an !PageAnonExclusive() page
> similarly has to make sure that the page is exclusive -- even if it's
> mapped R/O (!).

I do think the existing "maybe_pinned()" logic is fine for that. The
"exclusive to this VM" bit can be used to *help* that decision -
because only an exclusive page can be pinned - bit I don't think it
should _replace_ that logic.

There's a quite fundamental difference between

 (a) COW and GUP: these two operations _have_ to know that they get an
exclusive page in order to re-use or look up the page respectively

 (b) the pre-cow logic in fork() or the "add this to the swap cache"
logic in vmscan that decides whether a page can be turned into a COW
page by adding a reference coutn to it (whether due to fork or swap
cache doesn't matter - the end result is the same).

The difference is that in (a) the thing we *have* to get right is
whether a page is exclusively owned by that VM or not. We can COW too
much, but we can never share a page unless it's exclusive. That's true
whether it's pinned or not.

In (b), the "have to get right" is different. In (b), it's perfectly
ok to COW an exclusive page and turn it non-exclusive. But we must
never COW a pinned page.

So (a) and (b) are very different situations, and have different logic.

If we always maintain an exclusive bit for AnonPage pages, then both
(a) and (b) can use that bit, but they'll use it very differently. In
(a) we'll refuse to look it up and will force a 'handle_mm_fault()' to
get an exclusive copy. And in (b), we just use it as a "we know only
exclusive pages can be pinned", so it's just another check for
page_needs_cow_for_dma(), the same way we currently check
"MMF_HAS_PINNED" to narrow down the whole "page count indicates this
may be a pinned page" question.

And the "page is exclusive" would actually be the *common* case for
almost all pages. Any time you've written to a page and you haven't
forked after the write (and it hasn't been turned into a swap page),
that page would be exclusive to that VM.

Doesn't this seem like really straightforward semantics to maintain
(and think about)?

I'd like the exclusive page bit to *not* be directly about "has this
page been pinned" exactly because we already have too many special
cases for GUP. It would be nicer to have a page bit that has very
clear semantics even in the absence of GUP.

             Linus
