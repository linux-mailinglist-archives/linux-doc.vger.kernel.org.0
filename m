Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0D1479823
	for <lists+linux-doc@lfdr.de>; Sat, 18 Dec 2021 03:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhLRCSR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 21:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbhLRCSQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 21:18:16 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD81C061574
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 18:18:16 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id x15so14704694edv.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 18:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AfupmJVw696CKh2wf7N7HMHG3vz5teOJsmL4ec+wmM8=;
        b=IUPaQZX69rMmZQKAKGGYWzmkdEjxHnCf/dJozdJRT6iSeScVVhJQA3eJPwRdZBnjtj
         4nl/n6cx4fG5pNmZRBZfXVsKfdHuTO+/HYnh1jqWn0GhuuYgZUGrnQPzaA4sv3RxWBpL
         /BjmCRMa66r7d4jQSZIIpjUkYeAoTWSKYRW7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AfupmJVw696CKh2wf7N7HMHG3vz5teOJsmL4ec+wmM8=;
        b=d6ji4mH1P2CUfre6SUqWi4nb3rM3PXcZJqZxeqsov/ORIT25glzrn4j6K6PUvTU0zN
         uNlHVporaYGcKP7fbczuT6e6Zd7OdTihVGStWsD3wGXWfmf/keJ44JiR/LI9GpUUdo7P
         feD4W5LWhMAi0S4oetzEfvKoq4LD+vxa3OMtbSNwG86ma2BcI2AuHDVhnK7UBdEVXeKI
         TEBbVv074l8XqZYq/f0ePzE5LZWzOV5MxhwqypFX4y2wbkY0cHCVlU/kZJ0OFAARnqs/
         ZJpop/gViDv1MgH8bUnbVgkET/rqgBAUCbuBjFfRCUTNK1hW45dFI3Ib0YlE5JpYtEqL
         11ag==
X-Gm-Message-State: AOAM531jGq4AWSxDm5gcEADy5F+/sLk7gkgbI+aEVx4j2DOjH67c1cgn
        mzqWxYF8ENw5jUMJAgR/riiU+g8wmoLxY5keNvE=
X-Google-Smtp-Source: ABdhPJwTTdN4YCcghXvbr5Sj3nascLc8h1ylBXNpg5rO3hkU5mIc8C5MBtc8aSP4/dCE4fJqTJpqqg==
X-Received: by 2002:a17:906:4e45:: with SMTP id g5mr4466722ejw.257.1639793894863;
        Fri, 17 Dec 2021 18:18:14 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id 9sm1750160ejd.199.2021.12.17.18.18.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 18:18:14 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so2646310wmb.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 18:18:14 -0800 (PST)
X-Received: by 2002:a05:600c:1914:: with SMTP id j20mr11833156wmq.26.1639793883730;
 Fri, 17 Dec 2021 18:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com> <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
 <20211217204705.GF6385@nvidia.com> <2E28C79D-F79C-45BE-A16C-43678AD165E9@vmware.com>
 <CAHk-=wgw5bEe8+qifra-aY9fAOf2Pscp1vuXX=f4hESyCK_xLg@mail.gmail.com>
In-Reply-To: <CAHk-=wgw5bEe8+qifra-aY9fAOf2Pscp1vuXX=f4hESyCK_xLg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 18:17:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjjNx2Ch2j7P+7vDceK39PpmrOqby3gXuTY4aj62dowFw@mail.gmail.com>
Message-ID: <CAHk-=wjjNx2Ch2j7P+7vDceK39PpmrOqby3gXuTY4aj62dowFw@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
To:     Nadav Amit <namit@vmware.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        David Hildenbrand <david@redhat.com>,
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

On Fri, Dec 17, 2021 at 5:53 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
> And then there's THP and HUGETLB, that I do think needs fixing and
> aren't about those two kinds of cases.
>
> I think we never got around to just doing the same thing we did for
> regular pages. I think the hugepage code simply doesn't follow that
> "COW on GUP, mark to not COW later" pattern.

In particular, do_huge_pmd_wp_page() has this pattern:

        /*
         * We can only reuse the page if nobody else maps the huge page or it's
         * part.
         */
        if (reuse_swap_page(page, NULL)) {
                ... mark it writable ...

and that never got converted to "only mark it writable if we actually
have exclusive access to this huge page".

So the problem is literally that reuse_swap_page() uses that
"page_mapcount()" logic, and doesn't take into account that the page
is actually used by a GUP reference.

Which is exactly why David then sees that "oh, we got a GUP reference
to it, and now we're seeing the writes come through". Because that
code looks at mapcount, and it shouldn't.

I think the hugepage code should use the exact same logic that the
regular wp fault code does.

                 Linus
