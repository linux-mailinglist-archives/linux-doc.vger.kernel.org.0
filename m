Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B642FC1C5
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jan 2021 22:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729933AbhASVDD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jan 2021 16:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404191AbhASUta (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 15:49:30 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82E5C061757
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 12:48:48 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id bx12so9178042edb.8
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 12:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkvwNS+El3HA8WD1wRriEqmYtWWjP+w29biUdXgRxJU=;
        b=dSjBpa02JgglRGcx2/84mL0OXTCylHCQoDPgRwYBgrdb1HeoN9e0E5ozaqSaHQmRJQ
         JEDFtdNYkjnRNQeiNWezHyCjWUGH/2rg0nNXA2QnrjGwXXd025IdsoTLQdA1uxQjS26+
         cPfLfAiBXrj9cUDr24KbI0YvsYJLrKTOlLQ32ydg1HKyynrHQjQKJJ0mAgh3hNwrLJOz
         zOStGtE9m+tRTCJAg3iZb5yyW4gCYRrXrq1RR6n6A1p7VVWXhf5XUvE71xzvcQbzG3+/
         E8PEOsIclx3toavM02OCpAK44+Zx/5/MsgZKKBWQUOVOYE8kOLdYwf9kSTkRErEiWDiw
         FCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkvwNS+El3HA8WD1wRriEqmYtWWjP+w29biUdXgRxJU=;
        b=cdoyvMp19dLS+JEuOSCRjr6Dz7lN0s9WYHzetVNv/3ZlFqcav5w6DpGEuUZHsqbWau
         DAjL5/GL0uTtpx7fec1roKOmInCQuV2ABCTC4HvYq5jcDozwB3SwhmoGEFxdRrzDxauP
         LfOgeaFeUx3hunW3598/glg2RGo4nakuq9WMeJmeeKC2hlgAXbeUMrtJ1p61qZKh2E5F
         zupoPM+YJWX1yKFi+6hjdej+eIUGuSuos0hRef8UCJcm28dgzWT6SgdRODpewZkI7YD/
         /pBLyQy0l+0RkzslUvyLrNXWsPsg7XbM+IeO8n6wxTRwV5C1uZCh81gvEodM7hH03aXP
         pq9Q==
X-Gm-Message-State: AOAM532lIrHHUi1bklEEa8TuyUwAX7u7tz4I+Px1EajL2vfPhGE9xdMw
        EAdUAGLnXCYaLgE/Fgg1Vd3nUD/iv1+kYKQCKdk/5w==
X-Google-Smtp-Source: ABdhPJwV9Ku3qyoq2kBTxOz6KgfvN81wwX3pQbkfxuQ92kJTO4QXY1Tul7nDV11Bbxd6oY64UzZ7b7Hp4cw5mc6tznY=
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr4912140edd.341.1611089327572;
 Tue, 19 Jan 2021 12:48:47 -0800 (PST)
MIME-Version: 1.0
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
 <20210119043920.155044-9-pasha.tatashin@soleen.com> <20210119183013.GB4605@ziepe.ca>
 <CA+CK2bBKbht34Hkg9YvhwYAiAjd3NMd_+Eir9wfx+07V-Y2TTA@mail.gmail.com>
 <20210119184751.GD4605@ziepe.ca> <CA+CK2bDGDR9B=n5d4Dz6my6kKyFF=6y79HJt-k-SCpLhF1fUQQ@mail.gmail.com>
In-Reply-To: <CA+CK2bDGDR9B=n5d4Dz6my6kKyFF=6y79HJt-k-SCpLhF1fUQQ@mail.gmail.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 19 Jan 2021 15:48:11 -0500
Message-ID: <CA+CK2bDo-9dP4JZeVscE65dhkJ9jPKk+0_6v0vQXTCM3m0J1DQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] mm/gup: do not allow zero page for pinned pages
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> I was thinking about a use case where userland would pin an address
> without FOLL_WRITE, because the PTE for that address is not going to
> be writable, but some device via DMA will write to it. Now, if we got
> a zero page we have a problem... If this usecase is not valid then the
> fix for movable zero page is make the zero page always come from a
> non-movable zone so we do not need to isolate it during migration, and
> so the memory can be offlined later.

I looked into making zero_page non-movable, and I am confused here.

huge zero page is already not movable:
get_huge_zero_page()
   zero_page = alloc_pages((GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE, ...

Base zero page can be in a movable zone, which is a bug: if there are
references to zero page, that page cannot be migrated, and we won't be
hot-remove memory area where that page is located. On x86, zero page
should always come from the bottom 4G of physical memory / DMA32 ZONE.

However, I see that sometimes it is not (I reproduce in QEMU emulator):
QEMU instance with 16G of memory and kernelcore=5G

Boot#1:
zero_pfn 48a8d
zero_pfn zone: ZONE_DMA32

Boot#2:
zero_pfn 20168d
zero_pfn zone: ZONE_MOVABLE (???)

The problem is that the x86 zero page comes from the .bss segment:
https://soleen.com/source/xref/linux/arch/x86/kernel/head_64.S?r=31d85460#583

Which, I thought would always be set within the first 4G of physical
memory. What is going on here?

Pasha
