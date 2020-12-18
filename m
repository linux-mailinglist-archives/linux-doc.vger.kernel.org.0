Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD712DE2E6
	for <lists+linux-doc@lfdr.de>; Fri, 18 Dec 2020 13:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgLRMoe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Dec 2020 07:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgLRMoe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Dec 2020 07:44:34 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C8AC061285
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 04:43:53 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id b9so3053879ejy.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Dec 2020 04:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VP62gLy4L6lfMGIRwtzfjFvE+h27PxSa+U0ikjWYO+Y=;
        b=X0hCklMnpRKCi/ALhX9mvgOwcS8w3p+GTPamqE39ttdKNscia4P58KD++FD2plVHEo
         A2UZwBioUoldfE+g1gnuZazRSXRtwyTvuOxtpxexB4ny4bAneoWMowNMk9+NyYIUf2tE
         fpmcwGa+RSYTcM6j2JIqqfqaD4QUyoutw2JvGnjh8ZNCVnoEaeXMnhl6/rs6njNIjw2u
         EnZXSgbc0WUzbI2WF28Za2/SO0iaCFCLXz58pWOZi2/vvGDTdfQOlTVEBtshkQw+6Pxj
         sj7yDpUPFFgfKQa11E681HdSZboZCp+5rRtgc3lOCDMxrce9g0AJLJRq1ieG7Dd3HOBR
         Wphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VP62gLy4L6lfMGIRwtzfjFvE+h27PxSa+U0ikjWYO+Y=;
        b=TNhl1VzFLl4gY1MD5UO2AgctGu3xOuY3yl6Ln6pFyVSuozeKAh2HMloWciYkENMysR
         ic1WEjbiI5AbJW+4JS8yHNGAI2iv1BCgWfbK9GIsG6tzu5zj5yTBevWu4mkxURW0wdcC
         IdMo/THYqwA+l7KndevyjOUmkGq9tn+nTCMeFuoXmRDGJJ5tCuaEz1dlww3IORu17VW0
         b0BpVUf5gb4Vhl5Knyh+IPfZfx0/L1LwEtEmMieWIX2p/W7NegOLXlXahItz6SE+EsSU
         ou/wj77HP2TTMTlYCLuwhoyiwIOIcWANyfNvoG+CWj5Yy2jKSEp8cJ+euS72RJYzmZzb
         vvBg==
X-Gm-Message-State: AOAM532M9sUEy26ZVJ2IBlXdlG4nMgud2PPhwToK2np2aL6GXSzeWTr6
        Qa0+U/aEEXNfIhX5XZGfhivbyfZrcmMUS1qjEmSKNQ==
X-Google-Smtp-Source: ABdhPJxxe+sAeq95UrfMrz6gv/whvetHEI4cy28Afan/x1ZYOwwIJMl5u7ZOqiPw7wthIMpPxtIbVN5HmHYvjWudbsA=
X-Received: by 2002:a17:906:7d98:: with SMTP id v24mr3816705ejo.129.1608295432506;
 Fri, 18 Dec 2020 04:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-9-pasha.tatashin@soleen.com> <20201218104655.GW32193@dhcp22.suse.cz>
In-Reply-To: <20201218104655.GW32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 18 Dec 2020 07:43:15 -0500
Message-ID: <CA+CK2bCn++2Sk4-Eunibj6f+JoOL77uJQXGU2+dScHQ3RgC7_Q@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mm/gup: limit number of gup migration failures,
 honor failures
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

On Fri, Dec 18, 2020 at 5:46 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 17-12-20 13:52:41, Pavel Tatashin wrote:
> [...]
> > +#define PINNABLE_MIGRATE_MAX 10
> > +#define PINNABLE_ISOLATE_MAX 100
>
> Why would we need to limit the isolation retries. Those should always be
> temporary failure unless I am missing something.

Actually, during development, I was retrying isolate errors
infinitely, but during testing found a hung where when FOLL_TOUCH
without FOLL_WRITE is passed (fault in kernel without write flag), the
zero page is faulted. The isolation of the zero page was failing every
time, therefore the process was hanging.

Since then, I fixed this problem by adding FOLL_WRITE unconditionally
to FOLL_LONGTERM, but I was worried about other possible bugs that
would cause hangs, so decided to limit isolation errors. If you think
it its not necessary, I can unlimit isolate retires.

> I am not sure about the
> PINNABLE_MIGRATE_MAX either. Why do we want to limit that? migrate_pages
> already implements its retry logic why do you want to count retries on
> top of that? I do agree that the existing logic is suboptimal because

True, but again, just recently, I worked on a race bug where pages can
end up in per-cpu list after lru_add_drain_all() but before isolation,
so I think retry is necessary.

> the migration failure might be ephemeral or permanent but that should be
> IMHO addressed at migrate_pages (resp. unmap_and_move) and simply report
> failures that are permanent - e.g. any potential pre-existing long term
> pin - if that is possible at all. If not what would cause permanent
> migration failure? OOM?

Yes, OOM is the main cause for migration failures. And also a few
cases described in movable zone comment, where it is possible during
boot some pages can be allocated by memblock in movable zone due to
lack of memory resources (even if those resources were added later),
hardware page poisoning is another rare example.

> --
> Michal Hocko
> SUSE Labs
