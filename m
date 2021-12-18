Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2E8479B5A
	for <lists+linux-doc@lfdr.de>; Sat, 18 Dec 2021 15:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhLROba (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 18 Dec 2021 09:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbhLROba (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Dec 2021 09:31:30 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD74AC06173F
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 06:31:29 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id bn20so7955332ljb.8
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 06:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kc9+R56+8MDwRjsvf8i5sUSf8w2i6c6JQNVbPSuHRX8=;
        b=xR2uhj8UbddcxmP5jfJS/z074f0OYTuCQDGeyGFnIfWf9E8gTNi0IDJz/fI0Z/OAvc
         7fOm8mlCykK9BjpbCWzINJIR4sDD0LhvX0Z6ozTAVnEn7pFpCNe0vlaa7Pm1HymSWCGC
         C4lmPUmgydMmZdMZ19+fa3tpD8J7FSl6lEjNBPIA4SddyGzHR1fsDEAz5JxAcfDetypJ
         FI2LHJVemJJ/MpPe37oF483qw+8gPRxAkyUZV8FnQ89POjT0HdkGsm0Yf79ay9+a8M8W
         3VApEdP40S71I3ORpuPSDR2D33NRa/0ChyTexY2NEKJzRDHP6JwtzNPwPc7yrAfU9YzV
         2cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kc9+R56+8MDwRjsvf8i5sUSf8w2i6c6JQNVbPSuHRX8=;
        b=pv2r97IsWHmydBAMiQEoWgcghg3dfW5cJdOALTr/sAUJYsnlJx2oOJ2OsHEUkgF8+x
         +0kCdDYgd8M5ATJzEV7Xw3XCz6EJuR4Ncyneo+mpZ8ySuXXXsoGKXmILRM1Ibt/VBL5X
         RB+pqfatC8DXz1WLkHvKLAsGKf5ktckwsumxmIn10b8UdBOH1lHd9cigWJQdC+NDTkpH
         FxyZPJ8+70csVeRy7o1KXPEaK+4ZwvDo/AzzQEtAu9zPHcyZwucPVfIiwckpE/gLGs07
         4Xe8lG5zUZVXBdjRbQqaj1Po0DnDF2jwghKBoHtfhaAYs7jQIsal59eTIppHzT/LUnPw
         GniA==
X-Gm-Message-State: AOAM532WbC3AJJOegKuzMvWajUz9YlW0ZsouRcdFtKMhriaAv5gnMpUo
        JdMzvAeTg4vUkBmOZbBrC1UzSQ==
X-Google-Smtp-Source: ABdhPJzmI9OTT/xCA71zNk9+24raVNhyR/s+xVQncJY5pMt407MtgvqvPevD3vS+f21s18SmfZttYg==
X-Received: by 2002:a2e:8702:: with SMTP id m2mr6625821lji.55.1639837887862;
        Sat, 18 Dec 2021 06:31:27 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id h18sm2037126ljh.133.2021.12.18.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 06:31:27 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 6662C103A58; Sat, 18 Dec 2021 17:31:34 +0300 (+03)
Date:   Sat, 18 Dec 2021 17:31:34 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
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
        Nadav Amit <namit@vmware.com>, Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 03/11] mm: simplify hugetlb and file-THP handling in
 __page_mapcount()
Message-ID: <20211218143134.rdnyw6zarkysckrw@box.shutemov.name>
References: <20211217113049.23850-1-david@redhat.com>
 <20211217113049.23850-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217113049.23850-4-david@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 17, 2021 at 12:30:41PM +0100, David Hildenbrand wrote:
> Let's return early for hugetlb, which really only relies on the compound
> mapcount so far and does not support PageDoubleMap() yet. Use the chance
> to cleanup the file-THP case to make it easier to grasp. While at it, use
> head_compound_mapcount().
> 
> This is a preparation for further changes.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/util.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/util.c b/mm/util.c
> index 741ba32a43ac..3239e75c148d 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -732,15 +732,18 @@ int __page_mapcount(struct page *page)
>  {
>  	int ret;
>  
> -	ret = atomic_read(&page->_mapcount) + 1;
> +	if (PageHuge(page))
> +		return compound_mapcount(page);

It would be nice to make PageHuge() inlinable first. It's a shame the we
need to have to do a function call for PageHuge() check.

Otherwise, looks good:

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
