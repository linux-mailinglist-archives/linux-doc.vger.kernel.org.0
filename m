Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70A0390053
	for <lists+linux-doc@lfdr.de>; Tue, 25 May 2021 13:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhEYLxV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 May 2021 07:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhEYLxU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 May 2021 07:53:20 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A0AC061574;
        Tue, 25 May 2021 04:51:50 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id q16so434200pls.6;
        Tue, 25 May 2021 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b+pvn2nXkSIJnrU7EGg7e76c9ZIrOlzh6tmn2/UaWAc=;
        b=ux/BjJOENvYmKF+ItVg8NVlJLXaqpULPGGtnzWVllw854nwWBHJtg7js6S0+4puWIT
         HNFk7FvLe6A5F4iSNA18uI+QwuYBI6cstX2kp6/jFPpHIWZdNLOyKm0v0zdbWVp0nKI6
         HqR4ofzG4AqYFMUnPPUM8HXxA7uzIl1hif+FJ/NNcv0XZMXnIM8V5AqQHqWwGZzomiRw
         3nryiUCt0I7ipoDmFjFB+XowZ+AeazKQGBOvY+51jezOPJxSVT++LWMbjlc9kwKkoOnB
         UN6CQFWOghl8Cb/qWvrTgU76fuRlCqvt25hSfMfxZm3nmOBOHI66kRc6nyQLiYuKA9g8
         Svkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b+pvn2nXkSIJnrU7EGg7e76c9ZIrOlzh6tmn2/UaWAc=;
        b=hpvXOlHb0haVdGjXzOJhI9iX34e+VHzahW+NvYJQlM1KzrqtjsmomRxlcoY09jBCVT
         BJ+NCCyJMJzRVl8HclvCB4IJTMdVmruSy8KyLDRn7QKt8jVh5PjF/j0rmLfqZc/OggHT
         7wrowr3dwhyMaiMvdXemiZ4bOk9tZJm3M3Qh3hkRGrQ5aowWU6H0nj4jPQkkB4wq2DeS
         9l9gFAMoaZwyQ6Krrxh9H/Hjjxu9TZI2xIQ7+RaaSadnhuEy3wFvEk6015BiuE2rs8c/
         h4jrA4+JsM3YIdSmHGMcaK5qu565vjF+KvX+y/WOOqrmKC05Lentlx8ErbXW4NHHLi/q
         DTag==
X-Gm-Message-State: AOAM531DoF+RY6V6cCDB2NXtGIRrU06MX7Gk0hZ4bXkHGiTjOKYRPSAd
        Jcbw2owQbyFXl4KhiLnE0CQ=
X-Google-Smtp-Source: ABdhPJz6/UGyoOENAI29h279nKb1UeFwzFTVYdRAISes6uazmeV+8/t7UzyopHxY49DpGs0pQGb9UQ==
X-Received: by 2002:a17:902:6b84:b029:ee:f966:1911 with SMTP id p4-20020a1709026b84b02900eef9661911mr29965113plk.69.1621943509655;
        Tue, 25 May 2021 04:51:49 -0700 (PDT)
Received: from localhost (14-200-114-182.static.tpgi.com.au. [14.200.114.182])
        by smtp.gmail.com with ESMTPSA id lj13sm1908099pjb.3.2021.05.25.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 04:51:47 -0700 (PDT)
Date:   Tue, 25 May 2021 21:51:44 +1000
From:   Balbir Singh <bsingharora@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, hch@infradead.org,
        jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com,
        peterx@redhat.com, hughd@google.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YKzk0ILRsyazMs2W@balbir-desktop>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 24, 2021 at 03:11:57PM -0700, Andrew Morton wrote:
> On Mon, 24 May 2021 23:27:22 +1000 Alistair Popple <apopple@nvidia.com> wrote:
> 
> > Some devices require exclusive write access to shared virtual
> > memory (SVM) ranges to perform atomic operations on that memory. This
> > requires CPU page tables to be updated to deny access whilst atomic
> > operations are occurring.
> > 
> > In order to do this introduce a new swap entry
> > type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
> > exclusive access by a device all page table mappings for the particular
> > range are replaced with device exclusive swap entries. This causes any
> > CPU access to the page to result in a fault.
> > 
> > Faults are resovled by replacing the faulting entry with the original
> > mapping. This results in MMU notifiers being called which a driver uses
> > to update access permissions such as revoking atomic access. After
> > notifiers have been called the device will no longer have exclusive
> > access to the region.
> > 
> > Walking of the page tables to find the target pages is handled by
> > get_user_pages() rather than a direct page table walk. A direct page
> > table walk similar to what migrate_vma_collect()/unmap() does could also
> > have been utilised. However this resulted in more code similar in
> > functionality to what get_user_pages() provides as page faulting is
> > required to make the PTEs present and to break COW.
> > 
> > ...
> >
> >  Documentation/vm/hmm.rst     |  17 ++++
> >  include/linux/mmu_notifier.h |   6 ++
> >  include/linux/rmap.h         |   4 +
> >  include/linux/swap.h         |   7 +-
> >  include/linux/swapops.h      |  44 ++++++++-
> >  mm/hmm.c                     |   5 +
> >  mm/memory.c                  | 128 +++++++++++++++++++++++-
> >  mm/mprotect.c                |   8 ++
> >  mm/page_vma_mapped.c         |   9 +-
> >  mm/rmap.c                    | 186 +++++++++++++++++++++++++++++++++++
> >  10 files changed, 405 insertions(+), 9 deletions(-)
> > 
> 
> This is quite a lot of code added to core MM for a single driver.
> 
> Is there any expectation that other drivers will use this code?
> 
> Is there a way of reducing the impact (code size, at least) for systems
> which don't need this code?
>
> How beneficial is this code to nouveau users?  I see that it permits a
> part of OpenCL to be implemented, but how useful/important is this in
> the real world?

That is a very good question! I've not reviewed the code, but a sample
program with the described use case would make things easy to parse.
I suspect that is not easy to build at the moment?

I wonder how we co-ordinate all the work the mm is doing, page migration,
reclaim with device exclusive access? Do we have any numbers for the worst
case page fault latency when something is marked away for exclusive access?
I presume for now this is anonymous memory only? SWP_DEVICE_EXCLUSIVE would
only impact the address space of programs using the GPU. Should the exclusively
marked range live in the unreclaimable list and recycled back to active/in-active
to account for the fact that

1. It is not reclaimable and reclaim will only hurt via page faults?
2. It ages the page correctly or at-least allows for that possibility when the
   page is used by the GPU.

Balbir Singh.
 
