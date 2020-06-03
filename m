Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F061ED7CF
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2020 23:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgFCVHk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Jun 2020 17:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgFCVHj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Jun 2020 17:07:39 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3037C08C5C0
        for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2020 14:07:39 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o6so2546351pgh.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2020 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eS1jlrF5dIoVCt2cap3U6PGFm0QYhhEb3nQkUTWhvqk=;
        b=RsT+DFYT6D5YsWzVi4cljkX8CV3M1DCiDfa7l7cRw1So9ilwxqWZPtREFmfeqfhhfQ
         viydwlm+nm3TKNhE+jQ3EvVLiGeHBBl1v1jPl8f8R3H0swgAKjUSCNs01d7E/b1GwE5L
         l0Xt2PdLhRSGqYrZipRsJUfxEGYTqEnRTbR0i4K7eOhr9soRf1TYS7uWa2Ve3ibKhDS0
         oJjh4n5FUeaugSBkB2Ul1oDC4UY8AIBCQI2xFkE148+o4QVMyvq7+BZeHLHQ/tuxzrgQ
         48yMpapCdgGy7G07EDRgCteGx+olUDymyJ6aGB7dUPGFvsuO9fGlHIyyzR155+uK7rph
         IUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eS1jlrF5dIoVCt2cap3U6PGFm0QYhhEb3nQkUTWhvqk=;
        b=SWcBHbLari5hIq8cgvOLs4HHz8J0XZ6Y6Nl9vsfKQq6Yl6GyFUWf41QNl0GyBI5fhk
         uEdeYdVkWZR5CboT08WZK6UfxjY5W38fO+hBgSnpLvjm9cuKdmmTtOzfBTB6Od9rjF6P
         Vlibxwtu8IUmuhQMRQQYaKNeHkGwqcEmf4p2T5RdKYs4C/+BoNXABTW2nRx1sMI4N/6e
         NochGQRd5ZwOUw+hwo5gWdaRwh8FZ08WhaWz/C+2SqQw40rtM8idzXEPmsKcI5GrjLpg
         xJCKZ3/32WJAQUfE1X3fk16pp07ItqmGyGZvjcx3GbLfQRWhPsfRc1PPxtzLC6HaZL2N
         giVQ==
X-Gm-Message-State: AOAM531Y5+cpPUPWvEWHUj6pLA0LJQBl0Gz4XETE/gTKQtbaRBac6JQN
        WgGpzOREymQJLBQrPO8sQtI2yfeBeJlXX2QleL86mA==
X-Google-Smtp-Source: ABdhPJzZ+Jd+/4HzFp2FSwwqa538R5MLRSyoU0QMAzZ5btgctS4vtQVLIOIwG8x59wIaAeIvxlcFBKtLlfOmH1eJvPg=
X-Received: by 2002:a63:d04b:: with SMTP id s11mr1183851pgi.384.1591218459042;
 Wed, 03 Jun 2020 14:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAFd5g447MLhQ5F2MeizMEM+V1kSUY7Cqjp-1XxrfdLvEzxXFEg@mail.gmail.com>
 <20200603124203.22719-1-sjpark@amazon.com>
In-Reply-To: <20200603124203.22719-1-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 3 Jun 2020 14:07:28 -0700
Message-ID: <CAFd5g45Wnwtv50AdekYjmBrJxE9UVDGRZptF9VsGnsfBwPtZ_A@mail.gmail.com>
Subject: Re: Re: [PATCH v14 13/15] mm/damon-test: Add a kunit test for
 recording setup
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        aarcange@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        brendan.d.gregg@gmail.com, cai@lca.pw,
        Colin King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, dwmw@amazon.com,
        foersleo@amazon.de, Ian Rogers <irogers@google.com>,
        jolsa@redhat.com, kirill@shutemov.name,
        Mark Rutland <mark.rutland@arm.com>, mgorman@suse.de,
        minchan@kernel.org, Ingo Molnar <mingo@redhat.com>,
        namhyung@kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>, riel@surriel.com,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, sblbir@amazon.com,
        Shakeel Butt <shakeelb@google.com>, shuah <shuah@kernel.org>,
        SeongJae Park <sj38.park@gmail.com>, snu@amazon.de,
        vbabka@suse.cz, vdavydov.dev@gmail.com, yang.shi@linux.alibaba.com,
        ying.huang@intel.com, linux-damon@amazon.com, linux-mm@kvack.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 3, 2020 at 5:42 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> On Tue, 2 Jun 2020 13:28:03 -0700 Brendan Higgins <brendanhiggins@google.com> wrote:
>
> > On Tue, Jun 2, 2020 at 6:16 AM SeongJae Park <sjpark@amazon.com> wrote:
> > >
> > > From: SeongJae Park <sjpark@amazon.de>
> > >
> > > This commit adds another unit test case for the recording setup.
> > >
> > > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> >
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>
> Thanks for the review!  As the previous patch is also for the kunit test and it
> already received your 'Reviewed-by', I would like to merge this patch into the
> previous one in the next spin.  If there is any problem, please let me know.

No problem. Feel free to do so.
