Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBBC4795DA
	for <lists+linux-doc@lfdr.de>; Fri, 17 Dec 2021 21:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240923AbhLQUzk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 15:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35250 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240911AbhLQUzk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 15:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639774539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gt0DtLTTM3E0C5XUm2JmJz4pNU1PDieeF6+dQqYh0XM=;
        b=fxL/3KU80an27dPD4irGlzchE2t4TBIvi9s7G77nI9Zct+l8TuaSC9+2ftOG6v0GUi1qm/
        3Kbrok7PxhXZfLkVa/j0Mk0DySw6xa7rlY9yqlX4qgUdQwwQpKHDM5P/1cq3G096m4cOoN
        fpap1bPb0iuWHu4/AHskVfRxERPoRYk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-LghFh6reOyiJrvs8GA_SoA-1; Fri, 17 Dec 2021 15:55:38 -0500
X-MC-Unique: LghFh6reOyiJrvs8GA_SoA-1
Received: by mail-wm1-f72.google.com with SMTP id v62-20020a1cac41000000b0033719a1a714so1221699wme.6
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=gt0DtLTTM3E0C5XUm2JmJz4pNU1PDieeF6+dQqYh0XM=;
        b=H2alKHUBlFUb8qy+BV0H7yn020iIxphOrtEG5X0u3DQfWop9kVZYPwdDqEfrQDG+/I
         gN4VqmlmS5vvEoUMLjt/CTqBqKR5vdCaDcx8cpNLt/TuU8FCprzgrafvreqhjFRpzJ9a
         +wyhFPuJ0wzBRk78ac7bbkm3VhOBV7MFrofjec7JO9oSc4v89r7/DZrtrAZYoXiveHJx
         RYATztTLI/odol72agTpjDi8D9aul3fiq1hb8Icxu7+ZxJkzy8NusSki+KWc3wMbGtVn
         ZmDapujwyY4f8aNbIbRmpQC7WT8dMxSuDPd2qCOM+l8S1tk5Cuqc1UKuO1KzTgn/F0pr
         55Jw==
X-Gm-Message-State: AOAM530s1TBy/45Kne+4bQvbuU5+DV2odILNVrZwEzwWH2/CMKOVTeUO
        Pq35F/VriEqBQdo5zTFYHkjnmc9GYESQBttyW6R5ZO6uvLwRgodK7Bih1he47o5as8d/8z699v5
        w25uLiqZ3koXc9PO/hoEr
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr9035996wme.58.1639774536973;
        Fri, 17 Dec 2021 12:55:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2VIGy81gYhcxxwp937rzdgjfMqRdg6hjw0UIMF9SiLBF1P2rxY4ZqXf8403kKG7hOqOFIcw==
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr9035975wme.58.1639774536777;
        Fri, 17 Dec 2021 12:55:36 -0800 (PST)
Received: from [192.168.3.132] (p4ff234b8.dip0.t-ipconnect.de. [79.242.52.184])
        by smtp.gmail.com with ESMTPSA id s189sm9283243wme.0.2021.12.17.12.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 12:55:36 -0800 (PST)
Message-ID: <e93f3fc9-00fd-5404-83f9-136b372e4867@redhat.com>
Date:   Fri, 17 Dec 2021 21:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAHk-=wghsZByyzCqb5EbKzZtAbrFvQCViD+jK9HQL4viqUb6Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.12.21 21:51, Linus Torvalds wrote:
> On Fri, Dec 17, 2021 at 12:45 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> If a page is mapped exactly once, page_mapcount(page) == 1 and there is
>> nothing to do.
> 
> Why?
> 
> You state that, but you stating that doesn't magically make it so.
> 
> What makes "mapcount==1" stable and special? Your "it's an
> atomic_read()" argument is nonsense - it implies that the count can be
> changing, but you will get _one_ answer.

And I explained how it can not increment. And the only way is via
fork(), which cannot run concurrently.

> 
> What makes that one answer of a changing count special?
> 
> What if there are other references to that same page, gotten with
> vmsplice(), and just about to be mapped into another address space?

If we have a shared anonymous page we cannot have GUP references, not
even R/O ones. Because GUP would have unshared and copied the page,
resulting in a R/O mapped anonymous page.

What am I missing?


-- 
Thanks,

David / dhildenb

