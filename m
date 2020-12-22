Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB762DE2BF
	for <lists+linux-doc@lfdr.de>; Fri, 18 Dec 2020 13:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbgLRMYT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Dec 2020 07:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgLRMYT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Dec 2020 07:24:19 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA38C0617A7
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 04:23:38 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id w1so2897197ejf.11
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 04:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q5KjjPrbn9WR2MdEGDTRtTus2Vw4k9w92nCN62Th8qg=;
        b=UQKi0zIH+5RBkxjLICF+v+gLFuX5Yn/W4ogPzP5V4rmY3SGR7gUDPduCncrWW7RecZ
         7wtPBVcyR2wdwtN+1OkyNp9AM7ZWjYpRGd+2d4UyyrFoJaA0m7I5FJ02AMVCtFIP5YbG
         H2qh0kxKXwbuOesHnKGk8DP/SkkhpJNP+kc/fm0DCQ+6WjDTe0OK/aM3vqfSKJOgUxnh
         bsD/Bxdlwo78e+ZrI9p694YPJPkghUmemIZV36cJ1HubQ3mNtLUhCN0zYPfUyV9VSVfp
         r073sVIb5imENWeRbeLod1SoKtKN+DHcvH165E2ueeKSc/DJjrmvz6unJag37qvpAnU7
         i8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q5KjjPrbn9WR2MdEGDTRtTus2Vw4k9w92nCN62Th8qg=;
        b=ZYqhQwBtg2LDpfPPtYGW1d1O6g9vfiSXUJgd8LhJUVWVzlJmoH8qNtEC0y5zOo0uze
         Usy8YkHYyiYDYFjVEVRD8FfhbEjKjXUTa/eAP0z5aHnHi1LK+VhMSoUrDWY6ra00pkYa
         uQJOwgg9y6JMX9ZPDl3qOEfv8GcyQeTmhUJzchEIHiqLZzNQY71NcoYmwmkEaGOqdXvt
         8k6JyFPwCV9u/XFwHLZdAF0k7siQ1ZKHuySgMiHeFgYx/fjegW+TnK2MH3lZ/ORfEwpm
         MW6ilzBg6XJLFrCIxNooYv00xuiozgbfH+uylakw1Jes8hj9N89Qy1jcM7h2wauNvBZP
         PEqg==
X-Gm-Message-State: AOAM532wafpyNriWHkOzFXbaw+fetMbJ7nnCWGkGnud73bDa8JBNt/vt
        4717gUhbl+Tz//eoSl9qXAXXnfNHyNYpjBFUryH62g==
X-Google-Smtp-Source: ABdhPJzYpFY+fqtYFVTRAo67fRmzRQtjC2ddNY82HbsGhTh9P0LkvQeKOIes+HF7XU76kp1q3P/VHUBHVO7ShP4WC/s=
X-Received: by 2002:a17:906:4a4f:: with SMTP id a15mr3763164ejv.541.1608294217306;
 Fri, 18 Dec 2020 04:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-4-pasha.tatashin@soleen.com> <20201218093653.GS32193@dhcp22.suse.cz>
In-Reply-To: <20201218093653.GS32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 18 Dec 2020 07:23:00 -0500
Message-ID: <CA+CK2bAtD+m=-W-St7RqeFSkc7-3O4a32LOLY6LuVG4hOgJj=A@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] mm: apply per-task gfp constraints in fast path
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

On Fri, Dec 18, 2020 at 4:36 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 17-12-20 13:52:36, Pavel Tatashin wrote:
> [..]
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 469016222cdb..d9546f5897f4 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3234,11 +3234,12 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
> >  unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
> >                               gfp_t gfp_mask, nodemask_t *nodemask)
> >  {
> > +     gfp_t current_gfp_mask = current_gfp_context(gfp_mask);
> >       unsigned long nr_reclaimed;
> >       struct scan_control sc = {
> >               .nr_to_reclaim = SWAP_CLUSTER_MAX,
> > -             .gfp_mask = current_gfp_context(gfp_mask),
> > -             .reclaim_idx = gfp_zone(gfp_mask),
> > +             .gfp_mask = current_gfp_mask,
> > +             .reclaim_idx = gfp_zone(current_gfp_mask),
> >               .order = order,
> >               .nodemask = nodemask,
> >               .priority = DEF_PRIORITY,
> > @@ -4158,17 +4159,18 @@ static int __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned in
> >  {
> >       /* Minimum pages needed in order to stay on node */
> >       const unsigned long nr_pages = 1 << order;
> > +     gfp_t current_gfp_mask = current_gfp_context(gfp_mask);
> >       struct task_struct *p = current;
> >       unsigned int noreclaim_flag;
> >       struct scan_control sc = {
> >               .nr_to_reclaim = max(nr_pages, SWAP_CLUSTER_MAX),
> > -             .gfp_mask = current_gfp_context(gfp_mask),
> > +             .gfp_mask = current_gfp_mask,
> >               .order = order,
> >               .priority = NODE_RECLAIM_PRIORITY,
> >               .may_writepage = !!(node_reclaim_mode & RECLAIM_WRITE),
> >               .may_unmap = !!(node_reclaim_mode & RECLAIM_UNMAP),
> >               .may_swap = 1,
> > -             .reclaim_idx = gfp_zone(gfp_mask),
> > +             .reclaim_idx = gfp_zone(current_gfp_mask),
> >       };
> >
> >       trace_mm_vmscan_node_reclaim_begin(pgdat->node_id, order,
>
> I was hoping we had agreed these are not necessary and they shouldn't be
> touched in the patch.

Thank you for noticing, I was sure I removed these changes, not sure
what happened :(
They will be gone in the next version.

Thank you,
Pasha

> --
> Michal Hocko
> SUSE Labs
