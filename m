Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E5C16EE8F
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2020 20:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731178AbgBYTCX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Feb 2020 14:02:23 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43420 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728787AbgBYTCW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 14:02:22 -0500
Received: by mail-pg1-f194.google.com with SMTP id u12so7308440pgb.10
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 11:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WnuAAHpvexBjIgdo0I3jrPe9EJ/pU5+xJDjbC5sUyiI=;
        b=KxKVlRjnC+d7tQegfRjfdNgx2ipP6nvGyd5QB8ZZzy7mmMUGCdScE2uEKcRHF+xH5I
         ZCvV0zy+a0nqzdjcr99NTvLBz+2Kb75n/PEHOX884PqVqBAe88B7QftJ2Hkp/ZphDMAk
         /7aI3moveWsQsnA4S+KrUiDOMkYspBNZumNzn5bEj7qdgjnal0nnMVAQsP02fljrdlXu
         TcMUh9ae9rdlKlrR6gR9UVLEUAs97wBzRSJ6Z6XrrwSuVmd4y8vSALYJuCatu1mAmM4w
         JOk2GuUTZonZaTimtjxPXazdOkBVYOtZCsm5JticS6tDGLMqdfX6uywoDec/Yag6N39F
         xmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WnuAAHpvexBjIgdo0I3jrPe9EJ/pU5+xJDjbC5sUyiI=;
        b=IobqZWYmd0Ql1wMBtftA3TyNcCA+BYGoGRwSurzoR+JUUz4Uzdv92mbo43ARK5MQlU
         x2SZBmmhd6KKm5IqCf6aHAZ8T+cvJ72gyU/TpRJ3CFO7CnkaISEHlSViN+HsEmUaqOFl
         NnA1HQIAlZ5DBDpKAS7fZkDCkMPx7NeKngZfXi4Tlcd+/zSJVBrmd3bXMuMLLsZ13fpS
         mMB8Og9U88nKnC/cV/ZaqilyIfcIIz9MFgIYYkCK/nxWXMege7ebT1+j8IpPhHhcH+0+
         4LyGB1rxheA1WTzjP39/gNpUXB3ysyp9ZsK6KvLyc4lLz9AZzbi0dro7qWUv/07fT7Nl
         J8Rw==
X-Gm-Message-State: APjAAAWlQPMG+v4reHzSyn4wHuDiC0HfNSYUt5iS30moCaDdRaQN0KJM
        DL50v+mL4PFXiAnGIyufl/dArsrKKNe0JCqZlVE3Rg==
X-Google-Smtp-Source: APXvYqxiqiqC/hdkXfuggm+uvyphsX1XfkSIzlfeJv1IXJ45qMugmyF98WdyHS+UQyAyVLn8W5R2X0INNO88GBDaO5I=
X-Received: by 2002:a63:fd17:: with SMTP id d23mr1344578pgh.159.1582657341835;
 Tue, 25 Feb 2020 11:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20200225102300.23895-1-sjpark@amazon.com> <20200225102300.23895-6-sjpark@amazon.com>
In-Reply-To: <20200225102300.23895-6-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 25 Feb 2020 11:02:10 -0800
Message-ID: <CAFd5g45-=8Qykkziy4mhMW+ZM4xqA1xnHJLGVveg=eGSC92=Nw@mail.gmail.com>
Subject: Re: [RFC v3 5/7] mm/damon-test: Add kunit test case for regions age accounting
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, aarcange@redhat.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, brendan.d.gregg@gmail.com, cai@lca.pw,
        Colin King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, dwmw@amazon.com,
        jolsa@redhat.com, kirill@shutemov.name,
        Mark Rutland <mark.rutland@arm.com>, mgorman@suse.de,
        minchan@kernel.org, mingo@redhat.com, namhyung@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, shuah <shuah@kernel.org>,
        SeongJae Park <sj38.park@gmail.com>, vbabka@suse.cz,
        vdavydov.dev@gmail.com, yang.shi@linux.alibaba.com,
        ying.huang@intel.com, linux-mm@kvack.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 25, 2020 at 2:25 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> After merges of regions, each region should know their last shape in
> proper way to measure the changes from the last modification and reset
> the age if the changes are significant.  This commit adds kunit test
> cases checking whether the regions are knowing their last shape properly
> after merges of regions.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
