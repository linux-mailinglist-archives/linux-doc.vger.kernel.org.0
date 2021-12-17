Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1FA479762
	for <lists+linux-doc@lfdr.de>; Fri, 17 Dec 2021 23:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhLQW70 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 17:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhLQW7Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 17:59:25 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEE5C061574
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 14:59:25 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z7so13304218edc.11
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 14:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rs3RPGk851m6kBvnTkDZNuCHS7bqxE4YiPXPeOnsMec=;
        b=WSqIxUtqn5jcmA6NC9BVpsfsO/6YYpI4P+quaDiBpik06F329fj372+mpAs6nkU6hi
         UgKtVq/JNx9O5+tUI1FaDEc9lAWL66/z1RpLwMtAJZ086ni6cHm+R02sIgHA08fo/qlY
         ertG4Ei0o7WJ3lUoVgGOz1iW744OYt4w3zD7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rs3RPGk851m6kBvnTkDZNuCHS7bqxE4YiPXPeOnsMec=;
        b=IacEkcV6Z7j7JLqVC4lDdi7YvW5mb8UFA+zvt/vYH93vPgTmQjSAXp5pG+0ceXSP6q
         /bkH+hG9cQiTn3joqTY+5QB5LbyaJJrVW47xiuUDc9XqmdEw4nsl3+pcE29wCnzNazMY
         FoLrGbkx2dlxCQ6YoJLnVf5jkW+8kUUOCt/qwR4TJY7aKSE0lYiZF3gj/KjO1bxJvNdZ
         2LY3/9bvaKOrpuQGdiJ7E7/t8R55t7ARQ8UuZwazpMa7wl2xQQFP0ZAc5lfePu2UP/ic
         E5vpHSN0yKag8eKGmPAMOboLfRkf6Up2v49YdVLGomjuze8ybV4xTeh0BENVBuzbv0NV
         BVmw==
X-Gm-Message-State: AOAM532s79CeWKlcpGltK9LAu8nSriNwJN4720YD0wcu8LXYmQ3jE3uw
        +VcQcC/D7sIcOoTKDBVAHQG7AtISjAZ2gFRbFco=
X-Google-Smtp-Source: ABdhPJwXEA+alUtIUAZS2FywevLvqrftGbMt/1RVb5ENsbfy7wC3uJ7wocSWaO8EfUQ9SWWiP7lOfw==
X-Received: by 2002:a17:907:6d28:: with SMTP id sa40mr4312789ejc.201.1639781963385;
        Fri, 17 Dec 2021 14:59:23 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id hq37sm3289493ejc.116.2021.12.17.14.59.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 14:59:23 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id j18so6789363wrd.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 14:59:23 -0800 (PST)
X-Received: by 2002:adf:f54e:: with SMTP id j14mr4140437wrp.442.1639781952748;
 Fri, 17 Dec 2021 14:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <9c3ba92e-9e36-75a9-9572-a08694048c1d@redhat.com> <CAHk-=wghsZByyzCqb5EbKzZtAbrFvQCViD+jK9HQL4viqUb6Ow@mail.gmail.com>
 <e93f3fc9-00fd-5404-83f9-136b372e4867@redhat.com> <CAHk-=wiFhVXZH_ht_dYQ_g2WNuhvWVrv8MjZ8B8_g6Kz2cZrHw@mail.gmail.com>
 <02cf4dcf-74e8-9cbd-ffbf-8888f18a9e8a@redhat.com> <CAHk-=wiR2Q5TQn_Vy10esOOshAego4wTCxgfDtVCxAw74hP5hg@mail.gmail.com>
 <0aa27d7d-0db6-94ee-ca16-91d19997286b@redhat.com>
In-Reply-To: <0aa27d7d-0db6-94ee-ca16-91d19997286b@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 14:58:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgKACiq4sygvRwvJ7bE+dnbMVftoudEVvcbyws6G_FDyw@mail.gmail.com>
Message-ID: <CAHk-=wgKACiq4sygvRwvJ7bE+dnbMVftoudEVvcbyws6G_FDyw@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
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

On Fri, Dec 17, 2021 at 2:29 PM David Hildenbrand <david@redhat.com> wrote:
>
> While I do care about future use cases, I cannot possibly see fork() not
> requiring the mmap_lock in the foreseeable future. Just so much depends
> on it as of now.

It's not that *fork()* depends on it.

Of course fork() takes the mmap_sem.

It's that fast-gup really really doesn't want it, and can't take it.

So any fast-gup user fundamentally cannot look at mapcount(), because
that would be fundamentally wrong and racy, and could race with fork.

And yet, as far as I can tell, that's *exactly* what your gup patches
do, with gup_pte_range() adding

+               if (!pte_write(pte) && gup_must_unshare(flags, page, false)) {
+                       put_compound_head(head, 1, flags);
+                       goto pte_unmap;
+               }

which looks at the page mapcount without holding the mmap sem at all.

And see my other email - I think there are other examples of your
patches looking at data that isn't stable because you don't hold the
right locks.

And you can't even do the optimistic case without taking the lock,
because in your world, a COW that optimistically copies in the case of
a race condition is fundamentally *wrong* and buggy. Because in your
world-view, GUP and COW are very different and have different rules,
but you need things to be *exact*, and they aren't.

And none of this is anything at least I can think about, because I
don't see what the "design" is.

I really have a hard time following what the rules actually are. You
seem to think that "page_mapcount()" is a really simple rule, and I
fundamentally disagree. It's a _very_ complicated thing indeed, with
locking issues, AND YOU ACTIVELY VIOLATE THE LOCKING RULES!

See why I'm so unhappy?

We *did* do the page_mapcount() thing. It was bad. It forced COW to
always take the page lock. There's a very real reason why I'm pushing
my "let's have a _design_ here", instead of your "let's look at
page_mapcount without even doing the locking".

And yes, I *know* that fork() takes the mmap_sem, and likely always
will. That really isn't the problem here. The problem is that your
page_mapcount() paths DO NOT take that lock.

Btw, maybe I'm misreading things. I looked at the individual patches,
I didn't apply them, maybe I missed something. But I don't think I am.

             Linus
