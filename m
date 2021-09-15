Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5ED40C7CE
	for <lists+linux-doc@lfdr.de>; Wed, 15 Sep 2021 16:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237875AbhIOPAz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Sep 2021 11:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233901AbhIOPAz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Sep 2021 11:00:55 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24842C061575
        for <linux-doc@vger.kernel.org>; Wed, 15 Sep 2021 07:59:36 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id a12so2042301qvz.4
        for <linux-doc@vger.kernel.org>; Wed, 15 Sep 2021 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P573y5Vc2zJUuuf0RRwx4Cvk5IBWAT6Ne62UqhX4bYU=;
        b=Bp8gUfAr1azAr/3FG2yM2/cwGeN6T4EF5Krx23caRq0ZMdS/q4W2WTqsWqzmgzLUT+
         +xXlZtuf+NA6/DWKxdwEdKEsocN/RrK8k9lEeUdsAk8FcZjEN/btABeccOE0wTk823zB
         A/Tpg/hqHk5Mw/HAhH+KsdpqQFtHKA3thT66fVa5NDlsQpaZyBwLmfYL7QpYL+2Y8yyi
         zyKebTydIhoK7/yWuSq/LKJVoLly0v26Pg7hecQ1bLZkmLmKsbSuqzNaydUXvAYqw/TN
         LpcxqhDbyosCIwX64guMvOY8QulPBTYRVucJPuSMt1hXQBFvDvQu3JU0WUIX0Snaqsrm
         Dg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P573y5Vc2zJUuuf0RRwx4Cvk5IBWAT6Ne62UqhX4bYU=;
        b=uaS5jpsycr6mz4F8i1d/FowMSVvWlvgpIIxFlm/igUzHZ07afsDjtZcdyy2deNlsN0
         +NWZEgbC6roJyHIbyedcSbmwQI5aZ5QP75e+t518PK2YagQD5+njA/rmot0kXDBkhECv
         hIaXixzHvs/T6cSRA4aHHryQ8N65W+UgS5B5qp/TnEf/LMNs4qDlzmJiRe+VyiYKZbXt
         LXk7+rUIRx3nljYk1qLMROaOsChN6XevVbkZPNuYHafN3c3QrPRFr4yonrCCwJAl78Xe
         IGMEtOPlulHH4aRDWolxJC1ZIMAjLs+vVXSjH0zHjfFNKKl81eH+szZQGlDFg32p1y6Q
         BMOw==
X-Gm-Message-State: AOAM530RLNJ5kBpoAYZ4xlfY7AtVlDCc+kRDEbcBDF0gTlKX6dl/MubE
        w+ODBAQsHXWcSrdvmClR8vBhIG1JlL3bGg==
X-Google-Smtp-Source: ABdhPJwRB1i8P/5MUsqecQu4H3LUbFlyF2TgQTNcjPoCkKhtdYqz9bQtL7i0zMYAUUN3+WsBh6P3RA==
X-Received: by 2002:ad4:436b:: with SMTP id u11mr138020qvt.26.1631717975370;
        Wed, 15 Sep 2021 07:59:35 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id b12sm166578qkk.3.2021.09.15.07.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 07:59:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mQWNp-000zui-M1; Wed, 15 Sep 2021 11:59:33 -0300
Date:   Wed, 15 Sep 2021 11:59:33 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        tglx@linutronix.de, hannes@cmpxchg.org, mhocko@kernel.org,
        vdavydov.dev@gmail.com, kirill.shutemov@linux.intel.com,
        mika.penttila@nextfour.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        songmuchun@bytedance.com
Subject: Re: [PATCH v2 0/9] Free user PTE page table pages
Message-ID: <20210915145933.GH3544071@ziepe.ca>
References: <20210819031858.98043-1-zhengqi.arch@bytedance.com>
 <5b9348fc-95fe-5be2-e9df-7c906e0c9b81@redhat.com>
 <41ceeec1-52c4-4e99-201c-e1e05b2afbbc@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41ceeec1-52c4-4e99-201c-e1e05b2afbbc@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 15, 2021 at 10:52:40PM +0800, Qi Zheng wrote:
> I am going to split this patch series as follows:
> 
> 1. Introduce the new dummy APIs, which is an empty implementation.
>    But I will explain its semantics.
> 2. Merge #6, #7 and #8, and call these dummy APIs in any necessary
>    location, and split some special cases into single patches, such as
>    pagefault and gup, etc. So that we can explain in more detail the
>    concurrency in these cases. For example, we don't need to hold any
>    pte_refcount in the fast path in gup on the x86_64 platform. Because
>    the PTE page can't be freed after the local CPU interrupt is closed
>    in the fast path in gup.
> 3. Introduce CONFIG_FREE_USER_PTE and implement these empty dummy APIs.
> 4. Add a description document.
> 
> And I try to add a function that combines pte_offset_map() and
> pte_try_get(). Maybe the func name is pte_try_map() recommended by
> Jason, or keep the pte_offset_map() unchanged?

It is part of the transformation, add a
pte_try_map()/pte_undo_try_map() and replace all the pte_offset_map()
callsites that can use the new API with it. The idea was that try_map
would incorporate the pmd_trans_unstable/etc mess so searching for
trans_unstable is a good place to start finding candidates. Some are
simple, some are tricky.

When you get to step 3 you just change pte_try_map() and the callsites
don't need changing.

Jason
