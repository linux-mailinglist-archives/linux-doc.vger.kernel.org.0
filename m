Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90697479879
	for <lists+linux-doc@lfdr.de>; Sat, 18 Dec 2021 04:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhLRDhR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 22:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhLRDhR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 22:37:17 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF4CC061574
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 19:37:16 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id y22so15112242edq.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 19:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=83Xcfaye/oCagrVxR06HPkUeHOAm9jlfZc3XXOxBSxE=;
        b=UdhXhGrxIVVjBAhE1tG5QDFxd3MjLEl7IW9JiZFv7x4Sm08/pVCTGJCS5oxsGwTVhs
         J+q/QYg7ZosglyichPV1OkhqfIehNaxoT9AxjmfFlWg7zRETdmafmJ2RG4JR7WmHxLRm
         3SWT3EfiBhyiEtHJlFUtafpYS3HvFcUAb6VXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=83Xcfaye/oCagrVxR06HPkUeHOAm9jlfZc3XXOxBSxE=;
        b=gh2IvrR2YakQBZWQBIKeiHc3dhqdWhOxJF/3x3L+ws/Mwk7TRuwmxZ69/XN2AQEPDn
         1CifoHoU8kA7qwcCcwDAkNqAXOVIf2haFlY7f38jcSHguzUKRHd5FtfnmDAc4Iw2wO9z
         5wAcAwnhbPJA0RUQBVW1U+/6dc0ObStwU8glZPHwyzbwb/qh92hGLfmskzGpSQIuYgfT
         cLksGqgVt8I3jK6UPZz5cgrCicGG7LxqWM4R3s3I4vQkz8rmf6GtVGVTFS8IbDRnrJGc
         KUEg7rQ1WlH1r+52SoRDzI9DStfYA9T8I6rAW/y2dZfNZkHxSG67QmLY1/s3wpzY/yFX
         BiKw==
X-Gm-Message-State: AOAM533g25WNObDHlG0BkYPwMpeq2iwMTeOkjIGP8KGijMarZeBPpmQY
        vXZJuIup4OtfPcCuEcK7vUQexfHWcHAxEGnraBQ=
X-Google-Smtp-Source: ABdhPJwca1houo30q1lAt/jcbrJExHO7/IIlWL00EeTOvo/6Iqezb3PSM7zJ+BDGIOJMLVz63zW8SA==
X-Received: by 2002:a17:907:2d0b:: with SMTP id gs11mr4817487ejc.700.1639798634939;
        Fri, 17 Dec 2021 19:37:14 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id b73sm2003633edf.37.2021.12.17.19.37.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 19:37:14 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id g132so1334wmg.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 19:37:14 -0800 (PST)
X-Received: by 2002:a05:600c:1914:: with SMTP id j20mr12004454wmq.26.1639798623645;
 Fri, 17 Dec 2021 19:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com> <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
 <20211217204705.GF6385@nvidia.com> <2E28C79D-F79C-45BE-A16C-43678AD165E9@vmware.com>
 <CAHk-=wgw5bEe8+qifra-aY9fAOf2Pscp1vuXX=f4hESyCK_xLg@mail.gmail.com>
 <CAHk-=wjjNx2Ch2j7P+7vDceK39PpmrOqby3gXuTY4aj62dowFw@mail.gmail.com> <CAHk-=wj+VpgJ3RfRQNxYS3xN9O01rwWnSBX7mztxFaE6BTLzFw@mail.gmail.com>
In-Reply-To: <CAHk-=wj+VpgJ3RfRQNxYS3xN9O01rwWnSBX7mztxFaE6BTLzFw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 19:36:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgnR6F9vbA0B474J80nYWGbtnHncqPiSiuPCGWf5kbfQA@mail.gmail.com>
Message-ID: <CAHk-=wgnR6F9vbA0B474J80nYWGbtnHncqPiSiuPCGWf5kbfQA@mail.gmail.com>
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

On Fri, Dec 17, 2021 at 6:42 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> IOW, I think that this stupid (AND UNTESTED) patch should likely just
> fix David's test-case with the hugepage and splice thing..

Looking at that patch, the page lock is entirely pointless.

It existed because of that broken reuse_swap_page() that tried to
count page mappings etc, but once you get rid of that - like we got
rid of it for the regular pages - it's not even needed.

So as we hold the page table lock, and see a page_count() of 1, we
could be done without any page lock at all. So that whole
trylock/unlock is actually unnecessary.

That said, it's possibly woth re-using any swap cache pages at this
point, and that would want the page lock. So some complexity in this
area is likely worth it. Similar to how we did it in commit
f4c4a3f48480 ("mm: free idle swap cache page after COW") for regular
pages.

So that patch is not great, but I think it works as a guiding one.

And notice how *simple* it is. It doesn't require careful counting of
swap entries that depend on page locking.

                Linus
