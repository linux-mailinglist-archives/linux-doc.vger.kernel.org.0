Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0A32F532E
	for <lists+linux-doc@lfdr.de>; Wed, 13 Jan 2021 20:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbhAMTP3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jan 2021 14:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbhAMTP3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 14:15:29 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB11C061786
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 11:14:48 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id e18so4621439ejt.12
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5aTU8OrppExQUcP6FVeiibwynpQy0ibxwUp1/rbGZIk=;
        b=Sv2HxDCmKXdyTqJ93g5cCHC3Kr+3XqkqB3PIINmwUzxMxz3rLg7O0Pve18wur4cvOH
         q0p03maFJy0DMmSNRHJaKyFe9v+xXJyoC6n5p+lEGKIN/GAJ4J4wmBBXHuiZ8DtLcKba
         KNhMl+iVZfSFWg7zudOzcZSqvldMoNqNHSixspx/r9eQF3/XwD4LOcrZmj7wybXwclGH
         tKR7S5SAM6MMrp4PxFE3XyhdVn02FCB+5TviGD1HKox42sye33wyHtq037S3LkEb/Idh
         i6CvY2oEbiaJLlctaIUe9/pLg7PAQ+CjO0cjYBX6nxK+FadK2tjf9J05wC1zQl1tKkXt
         MJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5aTU8OrppExQUcP6FVeiibwynpQy0ibxwUp1/rbGZIk=;
        b=gWjEYAK/kBF942/HL838PzSpdgQGnJcR/4WRfYdYKh3ttMxdSlxfVXrd8K0fQoMBXZ
         +fnyb0EzLiTj8G6gn2krHO3eiGl2et9n7hLq45heXJbYyDf9IqQ3V8iXNA8keIZm4A8m
         TfEXZkXUSoU46iH6lE7yMPYjXuqmR9zulceD2gUcE8ITdvhQMwHrY/TjhmcRefFkWtZQ
         abVNFXzTERVxd4tcTr/G8jzJOoMHE/h/YnDpwNtapTHQfnd3ZxRy02lAHf8RuYra4r5j
         Fdkx65bb3yTCont8l562Bj6epr+cpwkTvBTc+A6/m0COY0NXTBx9QIX43oFR3oozRHn+
         sV1Q==
X-Gm-Message-State: AOAM530cxIc4VwRI/xK7ZduOMlDbjwst8qQQjjFo8Ndb5X+jh3Sch7tb
        hcvbcZ1QmIeJS7+GGKN1ZSJdzzNrOusat27Mzy0X/A==
X-Google-Smtp-Source: ABdhPJzN7cj8lor+g6eQXIJKxLe3OOGnVmi1MMEYtrIoJZ2nMFFGpb7NnFptxtpKrs9BIibDNfPkEmFPZXevSHQ0Too=
X-Received: by 2002:a17:906:7d98:: with SMTP id v24mr2664891ejo.129.1610565287094;
 Wed, 13 Jan 2021 11:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-6-pasha.tatashin@soleen.com> <20201218094324.GT32193@dhcp22.suse.cz>
 <CA+CK2bAKiWC5E4h4CZOqQrh4QzQQ-3_TUJgB=r4H23gu3cqvAA@mail.gmail.com> <20201218130825.GY32193@dhcp22.suse.cz>
In-Reply-To: <20201218130825.GY32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 13 Jan 2021 14:14:11 -0500
Message-ID: <CA+CK2bBLZu3X5P3qkaTV7To4qx2W79Y1MQdpJM3134LtkzkhXA@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] mm/gup: migrate pinned pages out of movable zone
To:     Michal Hocko <mhocko@suse.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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

On Fri, Dec 18, 2020 at 8:08 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Fri 18-12-20 07:24:53, Pavel Tatashin wrote:
> > On Fri, Dec 18, 2020 at 4:43 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Thu 17-12-20 13:52:38, Pavel Tatashin wrote:
> > > > +      * 1. Pinned pages: (long-term) pinning of movable pages is avoided
> > > > +      *    when pages are pinned and faulted, but it is still possible that
> > > > +      *    address space already has pages in ZONE_MOVABLE at the time when
> > > > +      *    pages are pinned (i.e. user has touches that memory before
> > > > +      *    pinning). In such case we try to migrate them to a different zone,
> > > > +      *    but if migration fails the pages can still end-up pinned in
> > > > +      *    ZONE_MOVABLE. In such case, memory offlining might retry a long
> > > > +      *    time and will only succeed once user application unpins pages.
> > >
> > > I still dislike this. Pinning can fail so there shouldn't be any reasons
> > > to break MOVABLE constrain for something that can be handled. If
> > > anything there should be a very good reasoning behind this decision
> > > documented.
> >
> > This is basically current behaviour, after patch 8, we can never pin
> > pages in the movable zone, so I will update this comment in that
> > patch.
>
> Then it would be much easier for review to state that the existing
> behavior is unchanged and do not update this comment just to remove it
> in a later patch. Because this patch should be straightforward change of
> the condition which pages to migrate (+some renaming which should be
> reasonably easy to follow).

Makes sense, I will update this comment correctly right away when the
behaviour changes.
