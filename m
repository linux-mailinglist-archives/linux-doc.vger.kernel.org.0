Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D6330320F
	for <lists+linux-doc@lfdr.de>; Tue, 26 Jan 2021 03:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbhAYPn0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jan 2021 10:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730282AbhAYPnR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 10:43:17 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F07C061221
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 07:39:31 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id n6so15861178edt.10
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 07:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rra/deV4BpPfJHrSK+j1oedRvhTg8xlMYVP/CjTCdbo=;
        b=oT2pKEpwEYuKqNalnjLTRHdVcq6t3+B3XXVLdpXKu3V4ApIJJzXxasqADy9EZXqUXh
         n/BuUY/5ALgsbICzl3RIKCjVDYUHtIYek61hqI9KUL/2LNmRfnQ0GzO+XTL2MXbd3aK/
         UsbqMjXr25onQ0szEsqlgipwxapnw7EPmLS3cPXyk2d8H28WIA52mQ7Yvol7ZM9ht9Zh
         4+OwuM1jkeN51/bu6vR4JrA/Y4arNiozGdwTdv4f8cWHV411+H+g+HOBpzxam46DRzaS
         2ThNiPt5XjxOw3h37ikX+KNHPGrNudfwkzs0vddCFZbZchOu9DDhuhN4cG8oBxIGQClP
         mP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rra/deV4BpPfJHrSK+j1oedRvhTg8xlMYVP/CjTCdbo=;
        b=mbqtz6QrojFTOpLsqiicYkjEJVKNz0BxclQvLB2d7FAD/I9hoGYCPXrMk/pus35JDq
         mmRCuHbtMh3bj4RdEcCxpdvcdkKDLOVGrieKyQOKGZtSKRioyC1fufOxRYFqgO8bSUPh
         jwig/IP4fR1AWRugY9eFEkhmaPVvLNlP09QLJMAXtLTt1cEqH/oejxWzA5sdA9QPf+uP
         FiGfg1kf7zsNKpChhkkfOKP5xq5yJlVoIYk5KfdUVLobQjkKH9xDFr6uzigkUbavC+ns
         5qfk06BHlvszSJvaxPDxYWbtNy95B7Z6WFqZFz0Yyawd89klIxNyK7fFT0nZsADLqk6D
         zAZw==
X-Gm-Message-State: AOAM530MSkZ5o68WN1xyWK+9j0PPz5EGjLs+HDF0YHp86L7+g/y9VYb6
        ijJXbU6Lp+5KX6EhvUJ9a6JwD1iwzVcc5ixfyE9jFQ==
X-Google-Smtp-Source: ABdhPJzFrqfAwV4lIbCCiVu+IspFq83jhqoaMG65PKSTrukGguTs7XiN5FLFH6wPnByDVaUokuQk0Sd4Y5Qva95xCmU=
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr934395edd.341.1611589170542;
 Mon, 25 Jan 2021 07:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
 <20210120014333.222547-9-pasha.tatashin@soleen.com> <20210120131400.GF4605@ziepe.ca>
 <CA+CK2bCu-uWWOxS_sPhfgzXTq-cqYFsHK_QFo7F+rStKpJJDRA@mail.gmail.com> <20210125142819.GU4605@ziepe.ca>
In-Reply-To: <20210125142819.GU4605@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Mon, 25 Jan 2021 10:38:54 -0500
Message-ID: <CA+CK2bBa+8dOatFgUB405yyKnSYfX-iaypzXpAhOmZN_KNBMhA@mail.gmail.com>
Subject: Re: [PATCH v6 08/14] mm/gup: do not migrate zero page
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
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
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

On Mon, Jan 25, 2021 at 9:28 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Jan 20, 2021 at 09:26:41AM -0500, Pavel Tatashin wrote:
>
> > I thought about this, and it would code a little cleaner. But, the
> > reason I did not is because zero_page is perfectly pinnable, it is not
> > pinnable only when it is in a movable zone (and it should not be in a
> > movable zones for other reasons as well), but that is another bug that
> > needs to be resolved, and once that bug is resolved this condition can
> > be removed from gup migration.
>
> My point is you've defined the zero page to be pinnable no matter what
> zone it is in, so is_pinnable(zero_page) == true

Sure, I will move it inside is_pinnable in the next update.

Thank you,
Pasha

>
> Jason
