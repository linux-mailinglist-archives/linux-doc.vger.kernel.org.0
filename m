Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35577479781
	for <lists+linux-doc@lfdr.de>; Sat, 18 Dec 2021 00:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhLQXaB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 18:30:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50368 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230327AbhLQXaB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 18:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639783800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=44k3vX/3wa5i6/dqpN9sIfa/Ujj2HmSF1zFXiCu3Mm0=;
        b=eZpJbmKXftOLEjnG2eAbNheBi8rBOX0T9OPbwVNSp0WXWozv4bcTPgCPdAYFoySO9uPeYP
        VwPbrKK4XDgDvVN7Lgfr7dieX4bkFYOGZ2dIUW0H/QInRQLfs7R6O+ZExHiRcKxlX4RT/p
        xzoIupgb6tImdRKoHCweKovE0Pc0jlk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-35dzodCwP_qGyVA_APT6aQ-1; Fri, 17 Dec 2021 18:29:59 -0500
X-MC-Unique: 35dzodCwP_qGyVA_APT6aQ-1
Received: by mail-wr1-f71.google.com with SMTP id k11-20020adfc70b000000b001a2333d9406so1053154wrg.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 15:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=44k3vX/3wa5i6/dqpN9sIfa/Ujj2HmSF1zFXiCu3Mm0=;
        b=av1r5K+8e4p+OEJKvh29WqaOk+zeMYfvXpHaa8+vM9P9YUcywelX1clj2ysd/4zQZK
         5KFKbAwcTqWJKxmqKFeB61in82ytZWSxrJfaKU4FqF1fdliXdxOPnXwQr1HUMtCbZBZ2
         ioT8DgCxVUtW+tjk4+udTA497+JG0hEvILPj7l101qWPIIkKzPuCnIifLxnpMzQIKGfU
         nhkrxC/RfQlDYWnhCUGudEDWvgCDkmA6MZrep/HpWGv9IHdZMmsJk+WKHDxwDSJ7BV8/
         Wau7JaeF04HqK5n7wphAKuVjvjPNaCBub4a627cjvi62q5hSZMevmqcqr1bgqCprXbdz
         ii6w==
X-Gm-Message-State: AOAM530IwFbhGDDxwkSvN5U284iRZ4QEs12f0Ra8C1GzbF9cDNOojG9E
        h0bgFIpEM4SJACo6AIAJqoCTGHPCUVFyq4kU8vCD9dJTjshBBg+tXVyIkL3hJ3X7fDsLM4ZtxuY
        v3+JvNeHAFLMF2lpkSCyA
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr3092001wrw.430.1639783798024;
        Fri, 17 Dec 2021 15:29:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrOBcBhv3bmTYRGqBn0i+Q7SvUP66HjwLl4pDIm//o4ltTp7UThcCYRGeLCoCRxNP5fxkKRA==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr3091992wrw.430.1639783797813;
        Fri, 17 Dec 2021 15:29:57 -0800 (PST)
Received: from [192.168.3.132] (p4ff234b8.dip0.t-ipconnect.de. [79.242.52.184])
        by smtp.gmail.com with ESMTPSA id z11sm9144942wmf.9.2021.12.17.15.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 15:29:57 -0800 (PST)
Message-ID: <0de1a3cb-8286-15bd-aec1-2b284bf8918a@redhat.com>
Date:   Sat, 18 Dec 2021 00:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>
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
References: <20211217113049.23850-1-david@redhat.com>
 <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <9c3ba92e-9e36-75a9-9572-a08694048c1d@redhat.com>
 <CAHk-=wghsZByyzCqb5EbKzZtAbrFvQCViD+jK9HQL4viqUb6Ow@mail.gmail.com>
 <e93f3fc9-00fd-5404-83f9-136b372e4867@redhat.com>
 <CAHk-=wiFhVXZH_ht_dYQ_g2WNuhvWVrv8MjZ8B8_g6Kz2cZrHw@mail.gmail.com>
 <02cf4dcf-74e8-9cbd-ffbf-8888f18a9e8a@redhat.com>
 <CAHk-=wiR2Q5TQn_Vy10esOOshAego4wTCxgfDtVCxAw74hP5hg@mail.gmail.com>
 <0aa27d7d-0db6-94ee-ca16-91d19997286b@redhat.com>
 <CAHk-=wgKACiq4sygvRwvJ7bE+dnbMVftoudEVvcbyws6G_FDyw@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
In-Reply-To: <CAHk-=wgKACiq4sygvRwvJ7bE+dnbMVftoudEVvcbyws6G_FDyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.12.21 23:58, Linus Torvalds wrote:
> On Fri, Dec 17, 2021 at 2:29 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> While I do care about future use cases, I cannot possibly see fork() not
>> requiring the mmap_lock in the foreseeable future. Just so much depends
>> on it as of now.
> 
> It's not that *fork()* depends on it.
> 
> Of course fork() takes the mmap_sem.
> 
> It's that fast-gup really really doesn't want it, and can't take it.

Oh, sorry, I was misreading your mail.

> 
> So any fast-gup user fundamentally cannot look at mapcount(), because
> that would be fundamentally wrong and racy, and could race with fork.
> 

So we're concerned about fork() racing with gup-fast-only. gup-fast-only
runs essentially lockless.

As we read an atomic mapcount, the relevant thing to happen would be
that we read an mapcount of 1 and decide to share the page, but there is
concurrent fork() such that the mapcount is increased.

So the parent process has to be the only process owning that page for
this to trigger (mapcount == 1). In that situation, we would pin the
page in gup-fast-only.

BUT this is just like GUP before fork() and caught using the
mm->write_protect_seq, so we'd immediately unpin it and not actually
return it from get-user-pages-fast. No harm done AFAIKS.


> And yet, as far as I can tell, that's *exactly* what your gup patches
> do, with gup_pte_range() adding
> 
> +               if (!pte_write(pte) && gup_must_unshare(flags, page, false)) {
> +                       put_compound_head(head, 1, flags);
> +                       goto pte_unmap;
> +               }
> 
> which looks at the page mapcount without holding the mmap sem at all.
> 
> And see my other email - I think there are other examples of your
> patches looking at data that isn't stable because you don't hold the
> right locks.

We rely on PageAnon(), PageKsm() and the mapcount. To my understanding,
they are stable for our use in pagefault handling code under mmap_lock
and in gup-fast because of above reasoning.

> 
> And you can't even do the optimistic case without taking the lock,
> because in your world, a COW that optimistically copies in the case of
> a race condition is fundamentally *wrong* and buggy. Because in your
> world-view, GUP and COW are very different and have different rules,
> but you need things to be *exact*, and they aren't.
> 
> And none of this is anything at least I can think about, because I
> don't see what the "design" is.
> 
> I really have a hard time following what the rules actually are. You
> seem to think that "page_mapcount()" is a really simple rule, and I
> fundamentally disagree. It's a _very_ complicated thing indeed, with
> locking issues, AND YOU ACTIVELY VIOLATE THE LOCKING RULES!
> 
> See why I'm so unhappy?

I see why your unhappy, and I appreciate the productive discussion :)
But I think we just have to complete the big picture of what we're
proposing and how the mapcount is safe to be used for this purpose.

I mean, I'm happy if you actually find a flaw in the current design
proposal.

> 
> We *did* do the page_mapcount() thing. It was bad. It forced COW to
> always take the page lock. There's a very real reason why I'm pushing
> my "let's have a _design_ here", instead of your "let's look at
> page_mapcount without even doing the locking".

The locking semantics just have to be clarified and written in stone --
if we don't find any flaws.

But this will be my last mail for today, have a nice weekend Linus!

-- 
Thanks,

David / dhildenb

