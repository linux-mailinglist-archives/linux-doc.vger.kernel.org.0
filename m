Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C458E4792DD
	for <lists+linux-doc@lfdr.de>; Fri, 17 Dec 2021 18:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237068AbhLQRae (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 12:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54193 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236563AbhLQRae (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 12:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639762233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XpYrlXQGuGiTurswQoKfair4c1yoIHCy4su7rQT1jtY=;
        b=YdIM1VtZ8v/0V3zMitEIwSscVBefKBQhSpQSFba5BxxEQN5YKDAqQtma7Gvx/llhpGjVwF
        qJLr6HCLJfYEK4Z0WQK4KaVpjJb75C3osA3FKudyoWu7IMXY2B75O5jO7q2NqZzArZln/y
        6ijMmlaW2Q8tnnvF33zmxv5MW6BHFFQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-qqU7wVZZOKCZT71uAzjINA-1; Fri, 17 Dec 2021 12:30:32 -0500
X-MC-Unique: qqU7wVZZOKCZT71uAzjINA-1
Received: by mail-wr1-f70.google.com with SMTP id t30-20020adfa2de000000b001a24004e1fbso825797wra.10
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 09:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=XpYrlXQGuGiTurswQoKfair4c1yoIHCy4su7rQT1jtY=;
        b=3A+mkxyIxDMYnyKG5xua59hUqfn/5PPrbF1ftzPVKYIWU4iL4z1DxP6Yt2H8aPznCq
         pvHj4LDAUeUqs9Qy9vW4M+5ZEZsxp0Me6TPQMzoUkl2XbKaJ1HlYtlhCCuB+L8/84bBB
         nnPvFqe7I9EudAXl4zVpoJRPs0yPkMM0i9Fz2OYV0RSfoQkEdCVpb2rbSWyY9AwKA2O6
         s3SXDVov0tLVV8CT4Uo5qbjCFTQd1v4c7igHN7jFaibWhEltpfiDDjHrePD97X/RblmD
         2i/5YUrGrJQ0GaP7FiyRa7+uA5SNVIY+T2bHMk31J+zsamneyWAqWKgjqQNm1kDZdWIl
         fzIg==
X-Gm-Message-State: AOAM531bOOdJstQs8t7Enrv8Cm6JdQ5W9mAroFgjvP1eQ+udj39k8FAT
        DJNTmuTlL5eUsPLJo3zCEMy5kI2K8qomRi30hmB2ioxMW5s6PY0+nPOeCQgAM/3YGCH7BiUxWAT
        7Mv5Q1lM4VBj5OrPb+UZD
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr3514759wrz.545.1639762231059;
        Fri, 17 Dec 2021 09:30:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrXMA9V67jpui+rmft7WNUVQD8C+zSHOzezyGLBEqcDkWsoghcyJDIaNnyt3ahYOR9kJWzYQ==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr3514742wrz.545.1639762230870;
        Fri, 17 Dec 2021 09:30:30 -0800 (PST)
Received: from [192.168.3.132] (p4ff234b8.dip0.t-ipconnect.de. [79.242.52.184])
        by smtp.gmail.com with ESMTPSA id y15sm11233959wry.72.2021.12.17.09.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 09:30:30 -0800 (PST)
Message-ID: <8b2a8dc7-bad6-7c0f-12f8-a79c68f84508@redhat.com>
Date:   Fri, 17 Dec 2021 18:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 03/11] mm: simplify hugetlb and file-THP handling in
 __page_mapcount()
Content-Language: en-US
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
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20211217113049.23850-1-david@redhat.com>
 <20211217113049.23850-4-david@redhat.com>
 <10A6B16D-3570-4010-83B9-41A38B50C8A4@vmware.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <10A6B16D-3570-4010-83B9-41A38B50C8A4@vmware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.12.21 18:16, Nadav Amit wrote:
> 
>> On Dec 17, 2021, at 3:30 AM, David Hildenbrand <david@redhat.com> wrote:
>>
>> Let's return early for hugetlb, which really only relies on the compound
>> mapcount so far and does not support PageDoubleMap() yet. Use the chance
>> to cleanup the file-THP case to make it easier to grasp. While at it, use
>> head_compound_mapcount().
>>
>> This is a preparation for further changes.
> 
> It would be useful to add “no functional change intended” or something.

Absolutely, same applies to other "simplification" patches.

> 
>>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>> mm/util.c | 11 +++++++----
>> 1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/util.c b/mm/util.c
>> index 741ba32a43ac..3239e75c148d 100644
>> --- a/mm/util.c
>> +++ b/mm/util.c
>> @@ -732,15 +732,18 @@ int __page_mapcount(struct page *page)
>> {
>> 	int ret;
>>
>> -	ret = atomic_read(&page->_mapcount) + 1;
>> +	if (PageHuge(page))
>> +		return compound_mapcount(page);
> 
> Before you return, perhaps you can add an assertion like:
> 
> 	VM_BUG_ON(PageDoubleMap(page));
> 
> This would be make the code clearer and would ease debugging in the
> future (if support for double-map is expanded).
> 

I'd probably have to add this to a couple of places -- and I assume
anybody working on that has to grep the kernel for use of PageDoubleMap
already.

Thanks!

-- 
Thanks,

David / dhildenb

