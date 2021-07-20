Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7E23CF994
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jul 2021 14:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237780AbhGTLrj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Jul 2021 07:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32245 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236193AbhGTLrV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jul 2021 07:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626784057;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zCBYtfj3pc7JRRIL/IaPTOryD+0TCF0beNILXobu+EQ=;
        b=TaASCC0KxZhuLZa80lLvoSYv2f4EVduSMDFU/xrcdDDlnbAL4LcBsw6zQ38TO/wN9fWXY0
        r6iP/ToOYFIrsCp6m1zmO+0KiUQSZR5LudPEIlpM1rDP9gIzt5wWm0GtyCqv0nVes3xDJz
        Hvi+h1FyT1dpP3XTYbXN/b7DJXrb9qY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-0Tjva_wTN6qGf-JcoOZpxg-1; Tue, 20 Jul 2021 08:27:36 -0400
X-MC-Unique: 0Tjva_wTN6qGf-JcoOZpxg-1
Received: by mail-wr1-f69.google.com with SMTP id h11-20020adffa8b0000b029013a357d7bdcso10256452wrr.18
        for <linux-doc@vger.kernel.org>; Tue, 20 Jul 2021 05:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zCBYtfj3pc7JRRIL/IaPTOryD+0TCF0beNILXobu+EQ=;
        b=sPN/U8jBkAsp8TgrwPQfjpQyJLazojpNHk2/lmLgcvqyQgniONQ28LG1jL9e2UZyJr
         E5asM6R78dDZxXCINcfVjw4SdgakYJO7XsLYd5Li/beGFYGo7nmAJqB2k7frCTf+cbiL
         59/Z17jWswKIUjMs2qB8PARx9oigGe2NeEuAfyVj7GjU6j910bPIG9SiUz1vInRImV0q
         686wOWG2yuDo9/oEztjOO9lMoaqnYpJ+2AGYaHw/FsgZJJlFEZn2RsTUjXSnCxUCcKfY
         rMLEW4yCsb1t1M8TwuJoRQ0mN0Wk1C3hoKGD0LtC/CFGz0In0mxwsLDh1i9Qqb+/SYCQ
         WHPQ==
X-Gm-Message-State: AOAM533S6aAKRurCS3jXAHhpRfOBFnMJjb+aPka7Z1BSV8dXrWRzefHb
        QP6sdixlGSukEcaPNyczxVwZ9SxiXSeosQ+gE1erraDJnH8MO6Sq2KVnVEQD36Et3gjzhgs4iLY
        DyIjHy3Jm62S8yKC7rwwOW3KuVeC+smVmn532UnwEt6vz0pq5dsBotn08hgSbWgBwtItW
X-Received: by 2002:a1c:a58b:: with SMTP id o133mr31337051wme.160.1626784055368;
        Tue, 20 Jul 2021 05:27:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoPErq8AXD17LnoOsMyHSaZoJQm3mECPqj4xPN3ZZWvqxj4dMX0J82Hf5UO8v+9IfOkYrapg==
X-Received: by 2002:a1c:a58b:: with SMTP id o133mr31337020wme.160.1626784055158;
        Tue, 20 Jul 2021 05:27:35 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id z13sm24131277wro.79.2021.07.20.05.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 05:27:34 -0700 (PDT)
To:     Peter Collingbourne <pcc@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>
Cc:     Jann Horn <jannh@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mm@kvack.org, kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
References: <20210717025757.3945742-1-pcc@google.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5] mm: introduce reference pages
Message-ID: <5487f28a-0a12-0789-4014-749de7fb9259@redhat.com>
Date:   Tue, 20 Jul 2021 14:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717025757.3945742-1-pcc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.07.21 04:57, Peter Collingbourne wrote:
> Introduce a new syscall, refpage_create, which returns a file
> descriptor which may be mapped using mmap. Such a mapping is similar
> to an anonymous mapping, but instead of clean pages being backed by the
> zero page, they are instead backed by a so-called reference page, whose
> contents are specified using an argument to refpage_create. Loads from
> the mapping will load directly from the reference page, and initial
> stores to the mapping will copy-on-write from the reference page.

I'm wondering, does the target use case really require the COW 
optimization like we have for the shared zeropage?

If we'd avoid having a reference page at all and only store the pattern, 
we could significantly reduce the memory consumption when using a lot of 
reference pages, especially per process multiple ones. I'm asking 
because ...

> 
> Reference pages are useful in circumstances where anonymous mappings
> combined with manual stores to memory would impose undesirable costs,
> either in terms of performance or RSS. Use cases are focused on heap
> allocators and include:
> 
> - Pattern initialization for the heap. This is where malloc(3) gives
>    you memory whose contents are filled with a non-zero pattern
>    byte, in order to help detect and mitigate bugs involving use
>    of uninitialized memory. Typically this is implemented by having
>    the allocator memset the allocation with the pattern byte before
>    returning it to the user, but for large allocations this can result
>    in a significant increase in RSS, especially for allocations that
>    are used sparsely. Even for dense allocations there is a needless
>    impact to startup performance when it may be better to amortize it
>    throughout the program. By creating allocations using a reference
>    page filled with the pattern byte, we can avoid these costs.

... I assume the first *sane* access to such a page is a write, and not 
a read.

> 
> - Pre-tagged heap memory. Memory tagging [1] is an upcoming ARMv8.5
>    feature which allows for memory to be tagged in order to detect
>    certain kinds of memory errors with low overhead. In order to set
>    up an allocation to allow memory errors to be detected, the entire
>    allocation needs to have the same tag. The issue here is similar to
>    pattern initialization in the sense that large tagged allocations
>    will be expensive if the tagging is done up front. The idea is that
>    the allocator would create reference pages with each of the possible
>    memory tags, and use those reference pages for the large allocations.

... and here as well.

Having a first access being a read sound more like an actual BUG (e.g., 
detect and mitigate bugs), which doesn't scream for needing a 
performance improvement or sacrificing a whole (unmovable/unswappable) 
reference page.

So, what would you lose when not populating a real reference pages at 
all and instead only populating the pattern when populating a fresh 
page? (and populating a fresh page even on read faults)


-- 
Thanks,

David / dhildenb

