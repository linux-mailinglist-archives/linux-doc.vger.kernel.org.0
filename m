Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CF6479E0E
	for <lists+linux-doc@lfdr.de>; Sat, 18 Dec 2021 23:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhLRWyI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 18 Dec 2021 17:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhLRWyH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Dec 2021 17:54:07 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BE9C061574
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 14:54:07 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id z7so22298755edc.11
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 14:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJf35OulebkWfKFhXCfv+327LAJ4W2k8OGIoJTIXfIo=;
        b=dG1V9TzLGCecXWNdRV5Ieb7V7jx4XXm42+n2J/149xEOJE5Tg0NmZ+cfF1j3OVD1dv
         4/abdSFzcm6W1ZofMPLzp3kY7w8JfzzYfQK7mjkdLbDcoe+KW25lfWOyG0w7OTq2no74
         0E+b/2RDV5qKx9L2+ASDLVxYRIEppRhgOV7FQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJf35OulebkWfKFhXCfv+327LAJ4W2k8OGIoJTIXfIo=;
        b=ZYLw1hL5MbwLFEpI+6H8v7Q9K9JYZQVwjazXCOtj4DxfAFxAxZO89eKHvxVZgSu4xt
         y9vtIEAzsg758t9bKRllAjlMXpteMZSaMjAbGQ8cs7OoCVosAR9ZaA3RMuRSu8KQfahI
         4ibXy8zejEJTfkQ8qI6YgWE11fMKOHnVK2c5qWTyCpX4Lq+ng/bLO5CIUN8C1X+nBl7G
         0++V5y0QbEskMmzxo+j0A9E+mErzEp/5QUWufekt1h9tVYTsDOjrE1xzDoVWjJMm2+5u
         AvXsfNvqQ1zTXPzowAqBFTqT9tDMDvAxDxlCYYlCnaBMGhkxMXkU7QAjYYR1zPGpVPhh
         0zzA==
X-Gm-Message-State: AOAM533jcQiw96YTXwYqrC/uLqnbqN9IMnZVIrAPQpHsNraKqZBjBzg2
        jJ9snIUw6HGqk1FcZaVvBIfRo+7ExWCd2BqsYiw=
X-Google-Smtp-Source: ABdhPJz2syD8B9PAHjqt1dqjsX2RzfWdJ7ejdMQO6DOfD8J8RgYrMmJ1l7B9DckwBqrKUMueLda8AA==
X-Received: by 2002:aa7:d906:: with SMTP id a6mr7207686edr.363.1639868045731;
        Sat, 18 Dec 2021 14:54:05 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id qf22sm2547493ejc.85.2021.12.18.14.54.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 14:54:05 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so3975960wmb.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 14:54:05 -0800 (PST)
X-Received: by 2002:a05:600c:1e01:: with SMTP id ay1mr6056643wmb.152.1639868034874;
 Sat, 18 Dec 2021 14:53:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com> <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
 <20211217204705.GF6385@nvidia.com> <2E28C79D-F79C-45BE-A16C-43678AD165E9@vmware.com>
 <CAHk-=wgw5bEe8+qifra-aY9fAOf2Pscp1vuXX=f4hESyCK_xLg@mail.gmail.com>
 <20211218030509.GA1432915@nvidia.com> <5C0A673F-8326-4484-B976-DA844298DB29@vmware.com>
 <CAHk-=wj7eSOhbWDeADL_BJKLzdDF5s_5R9v7d-4P3L6v1T3mpQ@mail.gmail.com>
 <20211218184233.GB1432915@nvidia.com> <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
In-Reply-To: <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Dec 2021 14:53:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
Message-ID: <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     Nadav Amit <namit@vmware.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        David Hildenbrand <david@redhat.com>,
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

On Sat, Dec 18, 2021 at 1:49 PM Nadav Amit <namit@vmware.com> wrote:
>
> Yes, I guess that you pin the pages early for RDMA registration, which
> is also something you may do for IO-uring buffers. This would render
> userfaultfd unusable.

I think this is all on usefaultfd.

That code literally stole two of the bits from the page table layout -
bits that we could have used for better things.

And guess what? Because it required those two bits in the page tables,
and because that's non-portable, it turns out that UFFD_WP can only be
enabled and only works on x86-64 in the first place.

So UFFS_WP is fundamentally non-portable. Don't use it.

Anyway, the good news is that I think that exactly because uffd_wp
stole two bits from the page table layout, it already has all the
knowledge it needs to handle this entirely on its own. It's just too
lazy to do so now.

In particular, it has that special UFFD_WP bit that basically says
"this page is actually writable, but I've made it read-only just to
get the fault for soft-dirty".

And the hint here is that if the page truly *was* writable, then COW
just shouldn't happen, and all that the page fault code should do is
set soft-dirty and return with the page set writable.

And if the page was *not* writable, then UFFD_WP wasn't actually
needed in the first place, but the uffd code just sets it blindly.

Notice? It _should_ be just an operation based purely on the page
table contents, never even looking at the page AT ALL. Not even the
page count, much less some mapcount thing.

Done right, that soft-dirty thing could work even with no page backing
at all, I think.

But as far as I know, we've actually never seen a workload that does
all this, so.. Does anybody even have a test-case?

Because I do think that UFFD_WP really should never really look at the
page, and this issue is actually independent of the "page_count() vs
page_mapcount()" discussion.

(Somewhat related aside: Looking up the page is actually one of the
more expensive operations of a page fault and a lot of other page
table manipulation functions - it's where most of the cache misses
happen. That's true on the page fault side, but it's also true for
things like copy_page_range() etc)

                 Linus
