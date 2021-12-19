Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE50747A25A
	for <lists+linux-doc@lfdr.de>; Sun, 19 Dec 2021 22:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhLSV1h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 19 Dec 2021 16:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236299AbhLSV1h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Dec 2021 16:27:37 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF621C061574
        for <linux-doc@vger.kernel.org>; Sun, 19 Dec 2021 13:27:36 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id i63so12800136lji.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Dec 2021 13:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZOShkgSsLUNxxfuqCgeDeOt2ke5//N9VVujAkHreXEg=;
        b=LqNmclrkwQCsbrNtIezCKp85izX4onfAiRFTRfPRPGRgPokTZlM7X1drmL6HICY2j9
         at/rEpYzr4ZXWvvP4fbrIrue8KwptDf7MKxC0s6vNlZujg3zNB3SersC3KyFG+JHqT3n
         b1+ZTJUiCalTiCm+t2714XkqPnvEoRzVbU9PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZOShkgSsLUNxxfuqCgeDeOt2ke5//N9VVujAkHreXEg=;
        b=qsGUv5QXlbV9LHOqp+YDWMoQL26R91cIT/3dYPqfMPLOWfGJ5PWhf8CvltEFYl4RIu
         uvQh6bp2w25hQgp7o345U4dlyR8aqfWv/5m8PuMkg6oJEgDUXKzpwoIKYQHQs2ABJvVg
         SUYJJtgxasd8ULQWHyD0dpUgEfzoQaWzrufyFu5HMxXlt+CSP7s3IEqvAQ7EHTkMEOFw
         6y+vW32cyXuO2LP7Xlw13c1u+Fqo5uAL4JtlhdplpL+VJ0/3veFdGpwWe4tT4TB9hWgS
         j2UluwcIbOSWnc5vE1AC1i7jYWXTONxQpryvrGClcpziFo5LKeZUaYqEeJfoaJWhRNct
         74pA==
X-Gm-Message-State: AOAM530GQhp6HBwP9bnqQOYMJ77LHNZ8VVBEN/CgwP3mChssKPkCoNAm
        eG5OimPnfbQzoc5a3Wz426kwRqgFsTBz/9sou70=
X-Google-Smtp-Source: ABdhPJwvOCvw4DUZFq9ovH/xzm4t7hfqr44JbMlWt+bNw+pl1jK2GL5QsPkBGvt7q6rc5lHT/YdGnQ==
X-Received: by 2002:a2e:5c5:: with SMTP id 188mr12343356ljf.257.1639949254656;
        Sun, 19 Dec 2021 13:27:34 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id u21sm2361869ljl.76.2021.12.19.13.27.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 13:27:34 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id b22so17332303lfb.9
        for <linux-doc@vger.kernel.org>; Sun, 19 Dec 2021 13:27:34 -0800 (PST)
X-Received: by 2002:adf:8b0e:: with SMTP id n14mr10364723wra.281.1639949243461;
 Sun, 19 Dec 2021 13:27:23 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wj7eSOhbWDeADL_BJKLzdDF5s_5R9v7d-4P3L6v1T3mpQ@mail.gmail.com>
 <20211218184233.GB1432915@nvidia.com> <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
 <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
 <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com> <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com> <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com> <Yb+gId/gXocrlJYD@casper.infradead.org>
In-Reply-To: <Yb+gId/gXocrlJYD@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 19 Dec 2021 13:27:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiAzmB-jiHvF+EZ1-b0X3ts4LAYHaVhzpzXEjmC0X95eg@mail.gmail.com>
Message-ID: <CAHk-=wiAzmB-jiHvF+EZ1-b0X3ts4LAYHaVhzpzXEjmC0X95eg@mail.gmail.com>
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

On Sun, Dec 19, 2021 at 1:12 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> Can we get rid of ->mapcount altogether?  Three states:
>  - Not mapped
>  - Mapped exactly once
>  - Possibly mapped more than once

I don't think even that is useful. We should get rid of mapcount entirely.

It doesn't actually help to know "mapped exactly once", exactly
because even when that's true, there may be non-mapped references to
the page.

Mapped references really aren't that special in general.

One case where it *can* be special is on virtually indexed cache
architectures, where "is this mapped anywhere else" can be an issue
for cache flushing.

There the page_mapcount() can actually really matter, but it's such an
odd case that I'm not convinced it should be something the kernel VM
code should bend over backwards for.

And the count could be useful for 'rmap' operations, where you can
stop walking the rmap once you've found all mapped cases (paghe
migration being one case of this). But again, I'm not convinced the
serialization is worth it, or that it's a noticeable win.

However, I'm not 100% convinced it's worth it even there, and I'm not
sure we necessarily use it there.

So in general, I think page_mapcount() can be useful as a count for
those things that are _literally_ about "where is this page mapped".
Page migration, virtual cache coherency, things like that can
literally be about "how many different virtual mappings can we find".

It's just that pages can have a number of non-mapped users too, so
mapcount isn't all that meaningful in general.

And you can look it up with rmap too, and so I do think it would be
worth discussing whether we really should strive to maintain
'mapcount' at all.

> I appreciate "Not mapped" is not a state that anon pages can
> meaningfully have (maybe when they go into the swap cache?)

Absolutely. And we can keep references around to an anonymous page
even without it having any mapping or swap cache at all (ie "gup +
unmap").

So "Not mapped at all" is a possible case, without the page being free'd.

                Linus
