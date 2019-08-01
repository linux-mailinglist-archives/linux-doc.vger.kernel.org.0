Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D944F7E226
	for <lists+linux-doc@lfdr.de>; Thu,  1 Aug 2019 20:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbfHAS2q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Aug 2019 14:28:46 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33840 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728809AbfHAS2p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Aug 2019 14:28:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id 31so74652935wrm.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2019 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0LASMwAA/tL/BAH/uT4ThFdb6tOVmHfjXl+JLumhDUs=;
        b=T9SNBetjpP9aJmtLho0U4R1eQMvjfbE8ive2XLdxBpmHiR/lhyGZRF3woDGof8407y
         aTNpny9z7d3u6suklr4N8FS28ayUZIuEC1h8yJST1qoHX8vWCVzkefbjYJB5PKtbAsTS
         hQ32//bcAcSebAShg+dlMfH6TBtbJHEvyD9MrEvs2VC07K7yyBlmc9VqFguoYTPTTsuB
         v8dq8FtBZ4Le5ko2oQKgEi1mz1pTOlDqJ8eVXafDVRrupuPxgjJNiD46t8HThefgdM4B
         uXmKssFvph5ey1jB1r8+DIb0wv8SO9fPWdVSqjmp3o5QBnc/vB45lgHTj6PJU5OGG6oE
         VVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0LASMwAA/tL/BAH/uT4ThFdb6tOVmHfjXl+JLumhDUs=;
        b=jTx0djzu9+5qOI+p3Q1z+gHInhavVrvOjknE8YhO5PR2R8Qwt4w5FipFoXcXN5gs5W
         aSO/5A1PFgND+nLdfZMT1/KRsMZXL+MiLx9xu6huCCz1QCaEBjYsD7xzUa9WHfuq9780
         xjdbs2mJgjSfcu3lcoZdReBZyfAFNPLaVOpxpr/SWpVjyi1BJIYS6fU3HJ3ywICCpSAv
         13CufFqNNbc4Hh2ygkRXdhkGf2Z3wk8TvF3HYCe1w9+/OC/dOZAaj5X9WVFdw1RZsaIg
         ewM9GL3HuRmL0KcqUkb1K/G4BLu6EViLbfFsQ14I/0tnA1rdUKlm0E4w4LMKG54Elo5X
         CZ1w==
X-Gm-Message-State: APjAAAVAJJGmVNasBEncArSXWR0JL5H6qQlsTkB0EcjLpPXhx0qZ874F
        liZgM8G2/y2zYdPQSVuRghtl/3T0hCXtJZvANiUA/w==
X-Google-Smtp-Source: APXvYqy4P6VCuqoeuVUZ2KjNmm94cVgmTRIX91RWIsWFdz3OKNqiO12BvCI7yWcc++1AFK4h3az4ABTYL1GOqRxeFXo=
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr4809916wrs.93.1564684122173;
 Thu, 01 Aug 2019 11:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190730013310.162367-1-surenb@google.com> <20190730081122.GH31381@hirez.programming.kicks-ass.net>
 <CAJuCfpH7NpuYKv-B9-27SpQSKhkzraw0LZzpik7_cyNMYcqB2Q@mail.gmail.com> <20190801095112.GA31381@hirez.programming.kicks-ass.net>
In-Reply-To: <20190801095112.GA31381@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 1 Aug 2019 11:28:30 -0700
Message-ID: <CAJuCfpHGpsU4bVcRxpc3wOybAOtiTKAsB=BNAtZcGnt10j5gbA@mail.gmail.com>
Subject: Re: [PATCH 1/1] psi: do not require setsched permission from the
 trigger creator
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Ingo Molnar <mingo@redhat.com>, lizefan@huawei.com,
        Johannes Weiner <hannes@cmpxchg.org>, axboe@kernel.dk,
        Dennis Zhou <dennis@kernel.org>,
        Dennis Zhou <dennisszhou@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>,
        Nick Kralevich <nnk@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Peter,
Thanks for sharing your thoughts. I understand your point and I tend
to agree with it. I originally designed this using watchdog as the
example of a critical system health signal and in the context of
mobile device memory pressure is critical but I agree that there are
more important things in life. I checked and your proposal to change
it to FIFO-1 should still work for our purposes. Will test to make
sure and reply to your patch. Couple clarifications in-line.

On Thu, Aug 1, 2019 at 2:51 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jul 30, 2019 at 10:44:51AM -0700, Suren Baghdasaryan wrote:
> > On Tue, Jul 30, 2019 at 1:11 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Mon, Jul 29, 2019 at 06:33:10PM -0700, Suren Baghdasaryan wrote:
> > > > When a process creates a new trigger by writing into /proc/pressure/*
> > > > files, permissions to write such a file should be used to determine whether
> > > > the process is allowed to do so or not. Current implementation would also
> > > > require such a process to have setsched capability. Setting of psi trigger
> > > > thread's scheduling policy is an implementation detail and should not be
> > > > exposed to the user level. Remove the permission check by using _nocheck
> > > > version of the function.
> > > >
> > > > Suggested-by: Nick Kralevich <nnk@google.com>
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  kernel/sched/psi.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> > > > index 7acc632c3b82..ed9a1d573cb1 100644
> > > > --- a/kernel/sched/psi.c
> > > > +++ b/kernel/sched/psi.c
> > > > @@ -1061,7 +1061,7 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group,
> > > >                       mutex_unlock(&group->trigger_lock);
> > > >                       return ERR_CAST(kworker);
> > > >               }
> > > > -             sched_setscheduler(kworker->task, SCHED_FIFO, &param);
> > > > +             sched_setscheduler_nocheck(kworker->task, SCHED_FIFO, &param);
> > >
> > > ARGGH, wtf is there a FIFO-99!! thread here at all !?
> >
> > We need psi poll_kworker to be an rt-priority thread so that psi
>
> There is a giant difference between 'needs to be higher than OTHER' and
> FIFO-99.
>
> > notifications are delivered to the userspace without delay even when
> > the CPUs are very congested. Otherwise it's easy to delay psi
> > notifications by running a simple CPU hogger executing "chrt -f 50 dd
> > if=/dev/zero of=/dev/null". Because these notifications are
>
> So what; at that point that's exactly what you're asking for. Using RT
> is for those who know what they're doing.
>
> > time-critical for reacting to memory shortages we can't allow for such
> > delays.
>
> Furthermore, actual RT programs will have pre-allocated and locked any
> memory they rely on. They don't give a crap about your pressure
> nonsense.
>

This signal is used not to protect other RT tasks but to monitor
overall system memory health for the sake of system responsiveness.

> > Notice that this kworker is created only if userspace creates a psi
> > trigger. So unless you are using psi triggers you will never see this
> > kthread created.
>
> By marking it FIFO-99 you're in effect saying that your stupid
> statistics gathering is more important than your life. It will preempt
> the task that's in control of the band-saw emergency break, it will
> preempt the task that's adjusting the electromagnetic field containing
> this plasma flow.
>
> That's insane.

IMHO an opt-in feature stops being "stupid" as soon as the user opted
in to use it, therefore explicitly indicating interest in it. However
I assume you are using "stupid" here to indicate that it's "less
important" rather than it's "useless".

> I'm going to queue a patch to reduce this to FIFO-1, that will preempt
> regular OTHER tasks but will not perturb (much) actual RT bits.
>

Thanks for posting the fix.

> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
