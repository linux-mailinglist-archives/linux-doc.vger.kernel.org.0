Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272E94795DE
	for <lists+linux-doc@lfdr.de>; Fri, 17 Dec 2021 21:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbhLQU47 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 15:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240935AbhLQU4v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 15:56:51 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E162C06173E
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:56:50 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id y22so12609694edq.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WIi3YNtCblZ4jVB4/T4i8TvZe8jCT7lhPE8MEkAn6qA=;
        b=KweCUE5QrDRl499PLxNb1SW4WvC7F+yYs+lq1TXYVhwnCNr/xHbEr85r6Nh4D30the
         6ZcPcSZ/y3xXiqcADRzs1V4A6WOdZU0S5jheyQb63bFhnnpkhr1bRNaXAtN6df5SvQnE
         6g9p5Hkcw8U4Rcyd7Bbo8gbeTEYt9wRBqPCBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIi3YNtCblZ4jVB4/T4i8TvZe8jCT7lhPE8MEkAn6qA=;
        b=dN6JGTGQFWFPaF2kkTot7BskLyf3vyAmNpcEBMTjQEb91NWpv/JBrnXmfB0/HoobRp
         Sa110KqnbiU/q9bWR20Jv6qGGpMlsYnWZx3evQWeYLB6X2ym4Ju7NNOHwYm2wOeH2+xA
         jCKEnuGi7KyYF99nwZOryXtx6yvGIyR95vgdAZFm/WI+4Oy71UgfDbp1fici+e+H/fSb
         N702io4R5OmMPcy7tMAir8cEe+S91/0buCzZlUDSCyOw0SOwiUvotl43jGVdMA0nTKhe
         a7+SrX4Q/gx9rmGzTxD1npoKu3UyO0gszT6wRq/fcniQZDY29GGdGQZWNDmwU6ATqREc
         B0FA==
X-Gm-Message-State: AOAM533x7YBQo+rQBxtx/nAUZGIfmNhCmhjqwcQUrGFfHmNyxItOa3VK
        emPR+jcav1+J7Ti7aW5QnH4vo6k/ly1CPS5BzF0=
X-Google-Smtp-Source: ABdhPJzpqereN3skIC0A4zQEediuVAj7Y1b+vOLAPfkSQ5bXBnKvC7bbL5dTYOmM9RItt+5aanL3DQ==
X-Received: by 2002:a17:907:e86:: with SMTP id ho6mr2733580ejc.208.1639774608882;
        Fri, 17 Dec 2021 12:56:48 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a16sm1928434ejk.8.2021.12.17.12.56.48
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 12:56:48 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id g14so12496855edb.8
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:56:48 -0800 (PST)
X-Received: by 2002:adf:d1a6:: with SMTP id w6mr3777696wrc.274.1639774597825;
 Fri, 17 Dec 2021 12:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com> <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
 <20211217204705.GF6385@nvidia.com>
In-Reply-To: <20211217204705.GF6385@nvidia.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 12:56:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgO9Zmc3S+cG=xFuUAgkZ3Ti9fOdUr4Q72EPwrxX67YAA@mail.gmail.com>
Message-ID: <CAHk-=wgO9Zmc3S+cG=xFuUAgkZ3Ti9fOdUr4Q72EPwrxX67YAA@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     David Hildenbrand <david@redhat.com>,
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
        Nadav Amit <namit@vmware.com>, Rik van Riel <riel@surriel.com>,
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

On Fri, Dec 17, 2021 at 12:47 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> To remind all, the GUP users, like RDMA, VFIO use
> FOLL_FORCE|FOLL_WRITE to get a 'r/o pin' specifically because of the
> COW breaking the coherence. In these case 'r/o pin' does not mean
> "snapshot the data", but its only a promise not to write to the pages
> and still desires coherence with the memory map.
>
> Eg in RDMA we know of apps asking for a R/O pin of something in .bss
> then filling that something with data finally doing the actual
> DMA. Breaking COW after pin breaks those apps.

I agree.

And my argument is that those kinds of things that ask for a R/O pin
are broken, and should just make sure to use the shared pins.

If the page was already writable, you can just re-use the page
directly (marking it pinned, so that any subsequent fork() does the
right pre-cow thing)

And if the page was *NOT* already writable, you do a COW - which might
be sharing the page directly too, if it has no other references.

What's the downside of just doing this properly?

Again: if a DMA user wants coherent memory, then it should use the
coherent pinning. Not some kind of "read-only sharing that looks at
crazy mapcounts that have absolutely zero relevance to whether the
page is coherent or not".

                   Linus
