Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8996230C31E
	for <lists+linux-doc@lfdr.de>; Tue,  2 Feb 2021 16:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbhBBPKz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Feb 2021 10:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbhBBPIR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Feb 2021 10:08:17 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D9DC061573
        for <linux-doc@vger.kernel.org>; Tue,  2 Feb 2021 07:07:37 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id f8so1107992ion.4
        for <linux-doc@vger.kernel.org>; Tue, 02 Feb 2021 07:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qSaBqeixyLoPS7VQTztlKi6qFU0Qbrugp50S56jr5mo=;
        b=qo7wdufOKgjOWexMGi1hjFJluj4S5JVNPRIcPOazUZET4YgNCdnnmfjDt7rOD69L9r
         Ah24o+deXPTmY5JRsgorml/Jj2mGs5Pl09/VAA8d7gurp3QJra6Vm7WTiAAZY5HyRsvt
         2TdIWnUF3/ppKAP1XrMqSMl/IFmUiLgl2wT+Yd3b+TEVHoL+eNWr36VbaSDeTO99HSu1
         7NSLf8Eo0A237Bne/JYdDAYiLAFNjwQTY7iWjqVbwmlEyjXVCJWp+EpXKDRkSdSy5LoE
         wqziZLeuJQx0gU9WXfBCqQjBKGyStmWHUzy2yQfB+SIfx8YxhjIEJsqVikiCGgDy8EF0
         oUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qSaBqeixyLoPS7VQTztlKi6qFU0Qbrugp50S56jr5mo=;
        b=rHfADwDdnloKZtWwXxBvUGRqe9i3JJKUciWS2qRDLUerVn9YdUJKid1ekp+PdkaDtL
         dVKxGEIZcpW3JGspLraLkq882jw3OM9bblvCUGVNYUC2twuulPjJ37+BWwAXY7UawNsm
         509CLdJ6aIigYZnvXLqD3hsh8HROJH8il8FUFG+MNBwac84n4+Gso3Cn+0eoSkckZmUG
         6JHno6XA5EZG0UufuVYxdPIKvU1F1LQJeY5ZY155vm6sCdW9HPfcyyFqhJ4uZrw/YGnG
         YfBBh0Hmi5ONU9NZxOM2SvfNFG08xfIMrZFshkmBqKPFRmD2dTJcCtsrFmkcS6TOaNXq
         5h4Q==
X-Gm-Message-State: AOAM533MhzWFvclVVhHUW+K4u+XHNBCghNJkHeAvkuGWiPzi6eOtnxjd
        oeH54zSRZ6Jnbm8MOX01nT+MvzZUym4P8RgZ5ZTlfw==
X-Google-Smtp-Source: ABdhPJzhMHWkMiRs3WM2ZLtw7rZyrwv1+Nw+UECr04uEP4/xVmh16Q9NhYcR2ZjVysW2tfQfvmsGva3x81dUDGR1PGY=
X-Received: by 2002:a5e:de04:: with SMTP id e4mr6413370iok.122.1612278456264;
 Tue, 02 Feb 2021 07:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20210202102915.19902-1-sjpark@amazon.com>
In-Reply-To: <20210202102915.19902-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 2 Feb 2021 07:07:24 -0800
Message-ID: <CALvZod7tv=z3XwGx3pn5qNHQd1EAnhvBaM3EGRjWmo7G2RJEuw@mail.gmail.com>
Subject: Re: [PATCH v23 07/15] mm/damon: Implement a debugfs-based user space interface
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Jonathan.Cameron@huawei.com,
        Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Rutland <mark.rutland@arm.com>,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, sblbir@amazon.com,
        Shuah Khan <shuah@kernel.org>, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 2, 2021 at 2:30 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> > On Mon, 1 Feb 2021 09:37:39 -0800 Shakeel Butt <shakeelb@google.com> wrote:
> >
> > > On Tue, Dec 15, 2020 at 3:59 AM SeongJae Park <sjpark@amazon.com> wrote:
> > > >
> > > > From: SeongJae Park <sjpark@amazon.de>
> > > >
> > > > DAMON is designed to be used by kernel space code such as the memory
> > > > management subsystems, and therefore it provides only kernel space API.
> > >
> > > Which kernel space APIs are being referred here?
> >
> > The symbols in 'include/linux/damon.h'
> >
> > >
> > > > That said, letting the user space control DAMON could provide some
> > > > benefits to them.  For example, it will allow user space to analyze
> > > > their specific workloads and make their own special optimizations.
> > > >
> > > > For such cases, this commit implements a simple DAMON application kernel
> > > > module, namely 'damon-dbgfs', which merely wraps the DAMON api and
> > > > exports those to the user space via the debugfs.
> > > >
> > [...]
> > > > +static ssize_t dbgfs_target_ids_write(struct file *file,
> > > > +               const char __user *buf, size_t count, loff_t *ppos)
> > > > +{
> > > > +       struct damon_ctx *ctx = file->private_data;
> > > > +       char *kbuf, *nrs;
> > > > +       unsigned long *targets;
> > > > +       ssize_t nr_targets;
> > > > +       ssize_t ret = count;
> > > > +       int i;
> > > > +       int err;
> > > > +
> > > > +       kbuf = user_input_str(buf, count, ppos);
> > > > +       if (IS_ERR(kbuf))
> > > > +               return PTR_ERR(kbuf);
> > > > +
> > > > +       nrs = kbuf;
> > > > +
> > > > +       targets = str_to_target_ids(nrs, ret, &nr_targets);
> > > > +       if (!targets) {
> > > > +               ret = -ENOMEM;
> > > > +               goto out;
> > > > +       }
> > > > +
> > > > +       if (targetid_is_pid(ctx)) {
> > > > +               for (i = 0; i < nr_targets; i++)
> > > > +                       targets[i] = (unsigned long)find_get_pid(
> > > > +                                       (int)targets[i]);
> > > > +       }
> > > > +
> > > > +       mutex_lock(&ctx->kdamond_lock);
> > > > +       if (ctx->kdamond) {
> > > > +               ret = -EINVAL;
> > > > +               goto unlock_out;
> > >
> > > You need to put_pid on the targets array.
> >
> > Good catch!
> >
> > >
> > > > +       }
> > > > +
> > > > +       err = damon_set_targets(ctx, targets, nr_targets);
> > > > +       if (err)
> > > > +               ret = err;
> > >
> > > You need to handle the partial failure from damon_set_targets().
> >
> > My intention is to keep partial success as is.
>
> But, we should put_pid() partial failures...  I will simply make this to
> completely fail with no registered target.
>

You can simplify by simply restricting to one pid/target per each write syscall.
