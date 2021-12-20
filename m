Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF0747B3D9
	for <lists+linux-doc@lfdr.de>; Mon, 20 Dec 2021 20:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhLTTjt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Dec 2021 14:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbhLTTje (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Dec 2021 14:39:34 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6A0C06175A
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 11:39:24 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bu9so2533104lfb.7
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 11:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0HEIGasiDjlyDxa0Yi+2EmuRxngp8FedzY8QNTfhikI=;
        b=X/tYG9QpqUmW6+H6ZYV0nRa4/njzoyToFNJ9zOYVkDvcTiybU29zVqv9btuh6Q6Zb+
         ZU8bp6ncsBiJHAlMaETRxIEeO1W44QSEarGybDoySgE1Kihe9Znw3ZOsf+trnjzPi50n
         9dzynaN+Ov3/Bl4U4xx2HsvgbBFtRQJeRiMJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HEIGasiDjlyDxa0Yi+2EmuRxngp8FedzY8QNTfhikI=;
        b=0zjZDxfG/YoNYpdmS/mwP4rLtMagRDLaE5PV5ydNdFqRWLJZ0qQriz6heou8edIo0/
         XVWrD95K82jLpOkshZsAvSjyxfehN46XDA7rgz2ntGbk9+dXwfIyv9d5DD26wbqANPi1
         xfNkYSJVJ8DhscKfr3IZlPNxuCw8mhI3jFH2yLjSymvCqzUuOd3NxN2U2/uhqvr3vEmf
         MRf6l+1mxGDK+dwQGpVAvZtvaEgNvPzwEKlb57tAyON3fY6er2JR3Gt5VCOH/P3XtBxQ
         l3LKnGzSJft5tNhoHIyGU0z0GF+1dw7UVK0GZFcKEUTk5AAI3IAvxyBFlb8CNBqbE0Rd
         CqCw==
X-Gm-Message-State: AOAM532ASjR0Tq8GRxTUps7iokiQ9h8QMpveCQvEoIiWAItwni0LuXF8
        K0eWLUrmgI+SdVLCvCSYXQ8gk8JlOUEITwfGi3s=
X-Google-Smtp-Source: ABdhPJxrnxmdof2BeGy/YFTO00c80ix8zsrgTvVLWf3/vhkMIeqfT1CO7yLh3GlR3r5vT4IXu9JRhA==
X-Received: by 2002:a05:6512:3ca6:: with SMTP id h38mr3106459lfv.496.1640029162452;
        Mon, 20 Dec 2021 11:39:22 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id x1sm1848358lfa.136.2021.12.20.11.39.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 11:39:22 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id k21so5947107lfu.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 11:39:22 -0800 (PST)
X-Received: by 2002:a5d:6211:: with SMTP id y17mr2559324wru.97.1640029151469;
 Mon, 20 Dec 2021 11:39:11 -0800 (PST)
MIME-Version: 1.0
References: <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
 <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
 <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com> <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com> <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com> <Yb+gId/gXocrlJYD@casper.infradead.org>
 <YcDNaoGcGS6ypucg@casper.infradead.org> <YcDRC7e0fNAMYi3m@casper.infradead.org>
In-Reply-To: <YcDRC7e0fNAMYi3m@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 20 Dec 2021 11:38:55 -0800
X-Gmail-Original-Message-ID: <CAHk-=whUE9RdzXcsQ6VrD5fNU3BtXWjhSa4XPy7bZQTHhdr3Rg@mail.gmail.com>
Message-ID: <CAHk-=whUE9RdzXcsQ6VrD5fNU3BtXWjhSa4XPy7bZQTHhdr3Rg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     Matthew Wilcox <willy@infradead.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Nadav Amit <namit@vmware.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
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

On Mon, Dec 20, 2021 at 10:53 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> It makes me wonder if reuse_swap_page() can also be based on refcount
> instead of mapcount?

I suspect it doesn't even need refcount.

For regular pages, after we've copied the page, all we do right now is

                if (page_copied)
                        free_swap_cache(old_page);

which is basically just an optimistic trylock_page() followed by
try_to_free_swap().

And that then pretty much simply checks "are there any swap users
left" and deletes it from the swap cache if not.

The "free_swap_cache()" thing is actually just an optimization to
avoid having memory pressure do it later.  So it doesn't have to be
exact.

In fact, I thought that swap is so unusual that it's not even needed
at all, but I was wrong. See how this was re-introduced in commit
f4c4a3f48480 ("mm: free idle swap cache page after COW") because yes,
some loads still have swap space allocated.

In theory, it would probably be a good idea at COW time to see if the
page ref is 2, and if it's a swap cache page, and try to do that swap
cache removal even earlier, so that the page actually gets re-used
(instead of copied and then the swap entry removed).

But swap is such a non-issue these days that I doubt it matters, and
it's probably better to keep the swap handling in the unusual path.

So mapcount and refcount aren't what matters for the swap cache.

The swap count obviously *does* matter - because it means that some
mapping has a reference to this swap entry (not as a page, but as an
actual swap pointer).

But the mapcount is irrelevant -  any users that have the swap page
actually mapped, don't actually need to be a swapcache page.

Even the refcount doesn't really matter, afaik. The only "refcount" we
care about is that swapcount - that's what actually reference counts
the swap cases.

try_to_free_swap() does check for one particular kind of reference: it
does a check for PageWriteback(). We don't want to remove the thing
from the swap cache if it's under active IO.

(This codepath does need the page lock, though, thus all those
"page_trylock()" things).

                   Linus
