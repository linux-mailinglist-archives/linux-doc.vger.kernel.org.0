Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB48461D5E
	for <lists+linux-doc@lfdr.de>; Mon, 29 Nov 2021 19:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349201AbhK2SOp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Nov 2021 13:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349599AbhK2SMo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Nov 2021 13:12:44 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7F9C03AD7F
        for <linux-doc@vger.kernel.org>; Mon, 29 Nov 2021 06:43:12 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id bk14so35028991oib.7
        for <linux-doc@vger.kernel.org>; Mon, 29 Nov 2021 06:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3mz1HPmHbMNrW+p+9eQAxOprfgUAji2Y3fPOhA732u0=;
        b=UYFA5+Kj7tvA2GXd53dZLzAwlSi6l7w/hTEzJ3H8A+QSaBrwkIe8WweXjIbXj3BELl
         eEBahNbVY5hxEA+m1Zsm/zHAH7vuo7iO9Gl/UAaFYO0N+uctB9MXeGvMxWld668gE72X
         ZpkrPa3wLVOeRFpp9PUS3nuus8d3b2MdtaCDRllfNTF1MiJRcjnyweEdXOB+gejWKaba
         rstv4lNGXUjQ1y0SH14O3YJdiUm9YqCn1bXP5QKKI+H7z3Pivs8/wkzEzplwbBGSVRfD
         q6IFlC/cNjnDA+eV1n9jQaWwaWtoxvLRocDUtogezJf9caNQXvpLif2bT2/FBaAkE/GO
         4eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3mz1HPmHbMNrW+p+9eQAxOprfgUAji2Y3fPOhA732u0=;
        b=FdqSU9QcsGzIZtLb0bAXzyaq0L9XhwhatClzqrYIx2Uy6n16uOvQS5RQBows2LVpsN
         FajbGnrLyfA4digLZ3N5yvzEYP6aPEzW3ZNpK9cqJDTNSWjSHsHRT3J4I75dI8NCA0To
         Tv+UQ8/fjQ5HulI09GKO6Q233Jl0C6JoHQC/8rvazpPPow6/oRyWnVRlZKXkH5zCDy38
         8h+5CvUhQzwSQsJIoFwQhCrYM17M8/4cJVhF+3/rGCAMWeErwriLW8U9NtNd2MNXbhOJ
         i8NjqrpsFPbW4Rs1RD/JynDBwR1oADE/d/AFiPLgQ4FOI1arqrOpgT6eDxiy5ZJruzYV
         ZbSg==
X-Gm-Message-State: AOAM533/naBUHdgeA8ORDKsPszb3nRUykz8Qw5oPa15OsXkY4RnRtB0a
        y3If3cOxQxyQ/vDd033QoLy1u90+4c/VUn1vuXEhng==
X-Google-Smtp-Source: ABdhPJxzBms38b97VrAR+iOn0cM/VBioe+AWcYnISh3nXwb94CqvfvGOQZiwp9KrhWts1M5WTIvE6H8tN6RT2BjBeuQ=
X-Received: by 2002:a05:6808:1903:: with SMTP id bf3mr41684658oib.7.1638196991401;
 Mon, 29 Nov 2021 06:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com> <20211118081027.3175699-4-elver@google.com>
 <YaSTn3JbkHsiV5Tm@boqun-archlinux> <YaSyGr4vW3yifWWC@elver.google.com> <YaTjJnl+Wc1qZbG/@boqun-archlinux>
In-Reply-To: <YaTjJnl+Wc1qZbG/@boqun-archlinux>
From:   Marco Elver <elver@google.com>
Date:   Mon, 29 Nov 2021 15:42:59 +0100
Message-ID: <CANpmjNMY7nhSq6aBLMusvbaMQ3LFJ=beHbDvbudg9B-NoFxEpA@mail.gmail.com>
Subject: Re: [PATCH v2 03/23] kcsan: Avoid checking scoped accesses from
 nested contexts
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
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

On Mon, 29 Nov 2021 at 15:27, Boqun Feng <boqun.feng@gmail.com> wrote:
[...]
> > This case is also possible:
> >
> >       static int v;
> >       static int x;
> >       int foo(..)
> >       {
> >               ASSERT_EXCLUSIVE_ACCESS_SCOPED(v);
> >               x++; // preempted during watchpoint for 'v' after checking x++
> >       }
> >
> > Here, all we need is for the scoped access to be checked after x++, end
> > up with a watchpoint for it, then enter scheduler code, which then
> > checked 'v', sees the conflicting watchpoint, and reports a nonsensical
> > race again.
> >
>
> Just to be clear, in both examples, the assumption is that 'v' is a
> variable that scheduler code doesn't access, right? Because if scheduler
> code does access 'v', then it's a problem that KCSAN should report. Yes,
> I don't know any variable that scheduler exports, just to make sure
> here.

Right. We might miss such cases where an ASSERT_EXCLUSIVE*_SCOPED()
could have pointed out a legitimate race with a nested context that
share ctx, like in scheduler, where the only time to detect it is if
some state change later in the scope makes a concurrent access
possible from that point in the scope. I'm willing to bet that there's
an extremely small chance we'll ever encounter such a case (famous
last words ;-)), i.e. the initial check_access() in
kcsan_begin_scoped_access() wouldn't detect it nor would the problem
manifest as a regular data race.

Thanks,
-- Marco
