Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8455479317
	for <lists+linux-doc@lfdr.de>; Fri, 17 Dec 2021 18:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236290AbhLQRt6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 12:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45278 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236285AbhLQRt6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 12:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639763397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hH32Mr09T44842vxV3B7WrEoq/VpUbXtp4OtPbsiQ8A=;
        b=erL70+I9zHgpCdDx8j15YwYvBMpHhGuGp+svmFpFss2CEQY15lX1jIP0LtnIuepyD9Hfg9
        agJVbqBydceyns5o6LN+KfvHlpr8CzbkWI8lYgwBXzg6Im80WTLAvZQHCcbcUKrTcjPuh7
        8c6u5KITS+xqxYrXwQ4vUwQ83aR4Dvw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-WBTDR_DmPkqxv0i_ZwjEgA-1; Fri, 17 Dec 2021 12:49:56 -0500
X-MC-Unique: WBTDR_DmPkqxv0i_ZwjEgA-1
Received: by mail-wm1-f71.google.com with SMTP id b83-20020a1c1b56000000b0033283ea5facso2094083wmb.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 09:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:organization:in-reply-to
         :content-transfer-encoding;
        bh=hH32Mr09T44842vxV3B7WrEoq/VpUbXtp4OtPbsiQ8A=;
        b=WrdG7m8Iv9mCpbEbV5LefKask3p0RYBR7Vw5hq4GcpORz5Dp4RDlY+RwBZJ9+Mwp4b
         lf5vrLWeE7qT7bQJv2UW4paTTDP6jgItWjNwt7/IGEL1fnis6ffK2OF7lho0W6iA+E5T
         uC2cTEbOQeOqn8CA1wt6LzUV5/9zo36PoC1QLdigYQEH5XthBtzrz5oQRBAQgm1TQynv
         Fd7z0BJq6E7Ojs5/OHfpab0TA7bO+3dty2Ygl32KGaCJEeoo0+hhYM603hLwbPIbTlq7
         rf8aXGh/5tZXOKiVlrIRdYKtJBxkiW7XZKvI46ulPrwOORmisIk6JYVvh6leebnmrK0Q
         XZ3g==
X-Gm-Message-State: AOAM531GKbo8hB2+WYmaCThRF/MYssfeICN9Igkpf1Ocp1ArL0HEdoQ1
        dae3e/C3//x3fJjcIBVEXBfO5Zf4av+xiCheFy+T1D4G7DHq3eeHnGq5vyp4Am+qoKGTp7JIVBm
        7fc7qThomJ7o5iwXlA0DE
X-Received: by 2002:adf:e0cd:: with SMTP id m13mr906512wri.128.1639763395434;
        Fri, 17 Dec 2021 09:49:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaFASAHJrtnfsNBUE2d+KqbUAQa6kV/aLZsG8AH+xUC0YXxdgETnWUDGLNs6zv4pSGuzN60g==
X-Received: by 2002:adf:e0cd:: with SMTP id m13mr906488wri.128.1639763395173;
        Fri, 17 Dec 2021 09:49:55 -0800 (PST)
Received: from [192.168.3.132] (p4ff234b8.dip0.t-ipconnect.de. [79.242.52.184])
        by smtp.gmail.com with ESMTPSA id bh16sm12335864wmb.1.2021.12.17.09.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 09:49:54 -0800 (PST)
Message-ID: <a832ca37-b078-6f62-f99f-b2703674c1d8@redhat.com>
Date:   Fri, 17 Dec 2021 18:49:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 01/11] seqlock: provide lockdep-free raw_seqcount_t
 variant
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
To:     Nadav Amit <namit@vmware.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
        Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <20211217113049.23850-1-david@redhat.com>
 <20211217113049.23850-2-david@redhat.com>
 <38BCB153-7E7C-4AAD-8657-E5C6F9E1EF9B@vmware.com>
 <058e97eb-1489-3d59-c6ee-94175dc13134@redhat.com>
Organization: Red Hat
In-Reply-To: <058e97eb-1489-3d59-c6ee-94175dc13134@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.12.21 18:29, David Hildenbrand wrote:
> On 17.12.21 18:02, Nadav Amit wrote:
>>
>>
>>> On Dec 17, 2021, at 3:30 AM, David Hildenbrand <david@redhat.com> wrote:
>>>
>>> Sometimes it is required to have a seqcount implementation that uses
>>> a structure with a fixed and minimal size -- just a bare unsigned int --
>>> independent of the kernel configuration. This is especially valuable, when
>>> the raw_ variants of the seqlock function will be used and the additional
>>> lockdep part of the seqcount_t structure remains essentially unused.
>>>
>>> Let's provide a lockdep-free raw_seqcount_t variant that can be used via
>>> the raw functions to have a basic seqlock.
>>>
>>> The target use case is embedding a raw_seqcount_t in the "struct page",
>>> where we really want a minimal size and cannot tolerate a sudden grow of
>>> the seqcount_t structure resulting in a significant "struct page"
>>> increase or even a layout change.
>>>
>>> Provide raw_read_seqcount_retry(), to make it easy to match to
>>> raw_read_seqcount_begin() in the code.
>>>
>>> Let's add a short documentation as well.
>>>
>>> Note: There might be other possible users for raw_seqcount_t where the
>>>      lockdep part might be completely unused and just wastes memory --
>>>      essentially any users that only use the raw_ function variants.
>>>
>>
>> Is it possible to force some policy when raw_seqcount_t is used to
>> prevent its abuse? For instance not to allow to acquire other (certain?)
>> locks when it is held?
>>
> 
> Good question ... in this series we won't be taking additional locks on
> the reader or the writer side. Something like lockdep_forbid() /
> lockdep_allow() to disallow any kind of locking. I haven't heard of
> anything like that, maybe someone reading along has a clue?
> 
> The writer side might be easy to handle, but some seqcount operations
> that don't do the full read()->retry() cycle are problematic
> (->raw_read_seqcount).

Sorry, I forgot to mention an important point: the raw_seqcount_t
doesn't give you any additional "power" to abuse.

You can just use the ordinary seqcount_t with the raw_ functions. One
example is mm->write_protect_seq . So whatever we would want to "invent"
should also apply to the raw_ functions in general --  which might be
undesired or impossible (IIRC IRQ context).

-- 
Thanks,

David / dhildenb

