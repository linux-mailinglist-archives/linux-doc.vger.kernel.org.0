Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43FE42262A
	for <lists+linux-doc@lfdr.de>; Tue,  5 Oct 2021 14:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234696AbhJEMS6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Oct 2021 08:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234611AbhJEMS6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 08:18:58 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CC3C06174E
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 05:17:07 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so25556934otv.4
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qtirudvd3CXF1rYRgKYcpMfzejgCL2epG1sP1VQEe9s=;
        b=KTwb/ogrtt/E591H/tN/VTYlhqrR9Vl5tddsqaZzE0kkrXYzv/GX8tid0+F3lr5qQq
         yPWVTg2B314ddDgSwSevNhKAu64R7YWiSygh+c8h3Asl4LsYrFegO/B6AISMwFJ6D8Vr
         XRXfMMIK8QWdqX+E7w/eSWk7FDRpKdoGDgzRD0PpaXqgSjJuzh6nSIptpD4f/Bs/ztSK
         2TK//39Gd5LVxzA5kd9wKdOxiLO1a+l5Db/we0xTTygfsehseuN2h/z0vzxEdg7X2hEt
         0wvhmExP39oZanRDPHEP3T1fKkhGJjnqPf1v/7cFh+00IaE9+I2+0LRHTzwjraO4OnYR
         TByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qtirudvd3CXF1rYRgKYcpMfzejgCL2epG1sP1VQEe9s=;
        b=C9Fq8p93Yc5eAh5bSGYG+RNcsRm6RzapjmFLxnYsbx5GP776NHjvYQFu9NVDUoTJ1B
         F2ehfTXUEHPYKnv5DdTWkNle77yiiHXaKYyrR+3FmgCNQT5lXBsZQ+kUGIiZJ98U5E7V
         sYxOk1F7ydzXlaqQBoGHQ7Tt3O9w1iqMQVLy3UpjVPPFzq7+ruP2+Dp4+noSPkOB4fuo
         u4VML/NBMJ9+O2Kk2Ns9YjRXKYhr5Cu7nDtblma1g6chpfHxzPVA2tZoB1C9VVrTZP1A
         1GGd+VI8DW+0wuuT9HMWro1ftvaTPXkt2e1qaGqYbO+OpCH6nZZBKwLHsBPja1RfHFzw
         xJLg==
X-Gm-Message-State: AOAM530PyYMxQGcdfrv+eX5XWnZkP+XW4/Fx0SxZfczB0fbFr5tKH2NG
        juvea3VnEaphZHbI7HqHyyyHsuRYNjKfkwjuhlOY7w==
X-Google-Smtp-Source: ABdhPJwjDgxSZtLpmCXXe/rrN8LcDZxzExGHH2uRskhVorKYUt+/6c8rdV+/ZTp3iqUz8WZjpWJJNavoVIUkrlZN2QA=
X-Received: by 2002:a9d:3e04:: with SMTP id a4mr14216116otd.329.1633436226924;
 Tue, 05 Oct 2021 05:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com> <20211005105905.1994700-17-elver@google.com>
 <YVw+4McyFdvU7ZED@hirez.programming.kicks-ass.net>
In-Reply-To: <YVw+4McyFdvU7ZED@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Tue, 5 Oct 2021 14:16:55 +0200
Message-ID: <CANpmjNO6H2imqsGaLYqimm0POvqA65Pd3OYji-QzONMn=Ht6Og@mail.gmail.com>
Subject: Re: [PATCH -rcu/kcsan 16/23] locking/atomics, kcsan: Add
 instrumentation for barriers
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     "Paul E . McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 5 Oct 2021 at 14:03, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Oct 05, 2021 at 12:58:58PM +0200, Marco Elver wrote:
> > @@ -59,6 +60,7 @@ atomic_add(int i, atomic_t *v)
> >  static __always_inline int
> >  atomic_add_return(int i, atomic_t *v)
> >  {
> > +     kcsan_mb();
> >       instrument_atomic_read_write(v, sizeof(*v));
> >       return arch_atomic_add_return(i, v);
> >  }
>
> This and others,.. is this actually correct? Should that not be
> something like:
>
>         kscan_mb();
>         instrument_atomic_read_write(...);
>         ret = arch_atomic_add_return(i, v);
>         kcsan_mb();
>         return ret;
>
> ?

In theory, yes, but right now it's redundant.

Because right now KCSAN only models "buffering", and no "prefetching".
So there's no way that a later instruction would be reordered before
this point. And atomic accesses are never considered for reordering,
so it's also impossible that it would  be reordered later.

Each kcsan_mb() is a call, so right now it makes sense to just have 1
call to be a bit more efficient.
