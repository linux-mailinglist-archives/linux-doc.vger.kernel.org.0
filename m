Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756A04795B4
	for <lists+linux-doc@lfdr.de>; Fri, 17 Dec 2021 21:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237170AbhLQUoO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 15:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240926AbhLQUoM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 15:44:12 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF2AC06173F
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:44:11 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id g14so12398222edb.8
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JJnsIIpunEWMbh/Qgzu/ClbtA+crRRC9ykjwMsxp4Xg=;
        b=Q7KfwzCp7ey3Od1yatE7bs9sLO+eQCx8S/bb7oiRSzyMiKD0DWQ2xXPhmdnChne7nw
         86EM0hENEKAQr1TC1SKiTfMK5A+B3tCj9YW0qlShYCfu1WuGRaW1hfigEOBc39FylfMA
         K1VH5SRGwn742s/Dv9UxpopSjgjurI0JlTzfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JJnsIIpunEWMbh/Qgzu/ClbtA+crRRC9ykjwMsxp4Xg=;
        b=cy/JGhmMT0kKz1E4xK9THvoSY4GLcRO5SHRC9ADwDPs2Gjz07WgmgsInyTocGmgxgb
         Gg9sMMkuFTPkFRUjK4fbhCoq0A4bvKpqf2ksKokySn0jcTmLob31wUs5vL2QvpGI+raB
         /5gFBOn46PR4rNySL8C6ZD3M+qz75k4PDKnsyvM0imQmttpD2wbO0zLM0L/GjIBucMHe
         E/tHZNhF/ZZl9UyGwez44P81OwB4Pq476ZxOylzoAm4RJD0hyyTWfS+OxPRCo/N4r3fs
         tre2/WQLmqRiQysfzKCSDpivQM2MZyDPaz1SeZrzai/kMgXk+cG6v/LFWFTtej44smEG
         okRQ==
X-Gm-Message-State: AOAM5312BwqZhkK4sWC7z8XRL+7y3dMDRZu5G8iguLqH4C+2gEeng/Ue
        sTUgJD4xBmSpaHF6EkkWS12ZlaRmf8qo7fcuAhs=
X-Google-Smtp-Source: ABdhPJxK2ol4rv/HXdG1VGWZWX4P0KgnucVu2/tdIiEGwIrveFlk3y5NbiIySvsVwCY36MC6VSeSRg==
X-Received: by 2002:a05:6402:3512:: with SMTP id b18mr4523887edd.347.1639773850330;
        Fri, 17 Dec 2021 12:44:10 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id e4sm3365895ejs.13.2021.12.17.12.44.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 12:44:10 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id p36-20020a05600c1da400b003457428ec78so3711250wms.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Dec 2021 12:44:09 -0800 (PST)
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr11177984wmj.155.1639773838912;
 Fri, 17 Dec 2021 12:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20211217113049.23850-1-david@redhat.com> <20211217113049.23850-7-david@redhat.com>
 <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com> <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
 <CAHk-=wgD1Y_hV3eCRL55m+sGfmwic0wbq+0LV8youYKirHJTog@mail.gmail.com>
In-Reply-To: <CAHk-=wgD1Y_hV3eCRL55m+sGfmwic0wbq+0LV8youYKirHJTog@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Dec 2021 12:43:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wge4Pcrhg-uCyCRVaUBb5B4NdSxb3TNhB5pnnqDqw6Ztg@mail.gmail.com>
Message-ID: <CAHk-=wge4Pcrhg-uCyCRVaUBb5B4NdSxb3TNhB5pnnqDqw6Ztg@mail.gmail.com>
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

On Fri, Dec 17, 2021 at 12:39 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> At the time of such a shared pin, you can do what we already do:
> re-use the page if it has a refcount of 1. Or do an early COW event
> (feel free to avoid the "mark it writable and dirty").

Note that this also depends on fork() doing the right thing, marking
things for "a fork() can not share this page any more".

Which it does for regular pages, and is exactly what that
page_needs_cow_for_dma() logic is all about (and the special
write_protect_seq around gup/fork).

I do believe that huge-pages don't do it right. But I think that as
you try to fix hugepages, you are now breaking the normal case.

If all your logic was only about hugepages, I wouldn't care so much.
But you are playing questionable games with code that I think is
correct.

Please explain why.

              Linus
