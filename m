Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C87A48A69E
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jan 2022 04:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346956AbiAKD4H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Jan 2022 22:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346553AbiAKD4H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jan 2022 22:56:07 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28BAC061748
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 19:56:06 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 127so27483215ybb.4
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 19:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HVGAaZCv1PtP8nOdf8xI+Otrs0pFsPi16+2M9IA8PMA=;
        b=PMIR9AavQUxk2P1t/gnE4Ha0f/Wgo4AGsu7oSS5EfdhLWF8hH2BmwauKecM1SCvCc8
         ZPNsxv3Pv6UF/oAzDxrHn5CnM183oJ6eGMdLuw5ubV3lsrrymJRvS+0lo6Js59b/ogs+
         789aymY4wOEYcHOnccO148G4FXL1zTw4TU7yDu4Hw07B0aDffLc178WULiA1vQUOa9m/
         Y+eNn1w8PU3VtZ9kIbZQ/R2GUczSOgbu3mPHfzjh/RXIMfYApAz7eSHYCxD89Fg10h4t
         2kC7d6BkUZO+EdnOqnOAan9LvAm2tSQFtoDhLD/1VWO2MI73ddmTFQ7CFE26E9k/BI6q
         E8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HVGAaZCv1PtP8nOdf8xI+Otrs0pFsPi16+2M9IA8PMA=;
        b=u/Kvgty+87RRuV1ruSwjy3klC/l7FQ4F453MOPuYn7fHhqlKpgminRHnkZQxocrId5
         NL/a6ELUFYqUHtT5Ct5zkv5CwOFfNqI6Cbl4kfGUKnu2zrUnZrte6BIlLMJMwL7yznOx
         Jhpcbok/2VOstGaqQ4fr+L1ntBZNT3wGbK7ufQfJpLoPjY7a93usPitURwWdR3aJOBIf
         snK493PIg+3n0kbTWP+gEl13M/DpDUy68X1J59lw1n2pI+DZ8bI2h8BHsGmWjimlaj8z
         ZZqugkyAurc0UpiaDwsFVm7kos6ZFzBmVXK85JOzEdg2qEC1HX5xavNRCJIg4bH0Zvza
         pfqg==
X-Gm-Message-State: AOAM533WlvsJHMgZ23UuMvaUBfX7t0XmEA6TvGRY4mRDZZBwK7jsrJ80
        3m5dUZsr/pzBob/CENBOW6+/QTtZT9128zsOyg0WNg==
X-Google-Smtp-Source: ABdhPJxP/fz5XneWYrZ3Wx1cmiJh3a6xFU3LDIaZKHY5WJjLnN6RdXEfwpfNlsi8HICN32LtNR4GsvrIMEGQVaYk/0s=
X-Received: by 2002:a05:6902:703:: with SMTP id k3mr3737793ybt.225.1641873365850;
 Mon, 10 Jan 2022 19:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20220111025138.1071848-1-surenb@google.com> <Ydz1jAp6RW3t0owj@sol.localdomain>
In-Reply-To: <Ydz1jAp6RW3t0owj@sol.localdomain>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 10 Jan 2022 19:55:54 -0800
Message-ID: <CAJuCfpGtnzLJNpUhq2dG97Vm-NDue3v747Fr77RVSKxC_Sfx8Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] psi: Fix uaf issue when psi trigger is destroyed
 while being polled
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Benjamin Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        cgroups mailinglist <cgroups@vger.kernel.org>,
        kernel-team <kernel-team@android.com>,
        syzbot <syzbot+cdb5dd11c97cc532efad@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 10, 2022 at 7:12 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Jan 10, 2022 at 06:51:38PM -0800, Suren Baghdasaryan wrote:
> > With write operation on psi files replacing old trigger with a new one,
> > the lifetime of its waitqueue is totally arbitrary. Overwriting an
> > existing trigger causes its waitqueue to be freed and pending poll()
> > will stumble on trigger->event_wait which was destroyed.
> > Fix this by disallowing to redefine an existing psi trigger. If a write
> > operation is used on a file descriptor with an already existing psi
> > trigger, the operation will fail with EBUSY error.
> > Also bypass a check for psi_disabled in the psi_trigger_destroy as the
> > flag can be flipped after the trigger is created, leading to a memory
> > leak.
> >
> > Reported-by: syzbot+cdb5dd11c97cc532efad@syzkaller.appspotmail.com
> > Analyzed-by: Eric Biggers <ebiggers@kernel.org>
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Please include Fixes and Cc stable tags.

Ack.

>
> > diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
> > index cafb8c114a21..e6878238fb19 100644
> > --- a/kernel/cgroup/cgroup.c
> > +++ b/kernel/cgroup/cgroup.c
> > @@ -3642,6 +3642,12 @@ static ssize_t cgroup_pressure_write(struct kernfs_open_file *of, char *buf,
> >       cgroup_get(cgrp);
> >       cgroup_kn_unlock(of->kn);
> >
> > +     /* Allow only one trigger per file descriptor */
> > +     if (READ_ONCE(ctx->psi.trigger)) {
> > +             cgroup_put(cgrp);
> > +             return -EBUSY;
> > +     }
> > +
>
> Doesn't the task have exclusive access to the file at this point?  READ_ONCE()
> is only needed instead of a plain load when the field can be concurrently
> changed by another thread.

Yeah, you are right. Concurrent writes are serialized by of->mutex and
kernfs_release_file documents "@of is guaranteed to have no other file
operations in flight", so ->release() can't race with ->write(). Will
fix.

>
> > diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> > index 1652f2bb54b7..882bf62cc247 100644
> > --- a/kernel/sched/psi.c
> > +++ b/kernel/sched/psi.c
> > @@ -1151,7 +1151,6 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group,
> >       t->event = 0;
> >       t->last_event_time = 0;
> >       init_waitqueue_head(&t->event_wait);
> > -     kref_init(&t->refcount);
> >
> >       mutex_lock(&group->trigger_lock);
> >
> > @@ -1180,15 +1179,21 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group,
> >       return t;
> >  }
> >
> > -static void psi_trigger_destroy(struct kref *ref)
> > +void psi_trigger_destroy(void **trigger_ptr)
> >  {
> > -     struct psi_trigger *t = container_of(ref, struct psi_trigger, refcount);
> > -     struct psi_group *group = t->group;
> > +     struct psi_trigger *t;
> > +     struct psi_group *group;
> >       struct task_struct *task_to_destroy = NULL;
> >
> > -     if (static_branch_likely(&psi_disabled))
> > +     /*
> > +      * We do not check psi_disabled since it might have been disabled after
> > +      * the trigger got created.
> > +      */
> > +     t = xchg(trigger_ptr, NULL);
> > +     if (!t)
> >               return;
>
> Likewise, doesn't the task have exclusive access to the file at this point?
> This is only called during ->release().

Yes, will fix.

>
> And why does this take a pointer to a pointer instead of just the pointer?

That was done to do atomic xchg, but as you mentioned, it's not needed
here. Will change.

>
> > @@ -1305,14 +1289,24 @@ static ssize_t psi_write(struct file *file, const char __user *user_buf,
> >
> >       buf[buf_size - 1] = '\0';
> >
> > -     new = psi_trigger_create(&psi_system, buf, nbytes, res);
> > -     if (IS_ERR(new))
> > -             return PTR_ERR(new);
> > -
> >       seq = file->private_data;
> > +
> >       /* Take seq->lock to protect seq->private from concurrent writes */
> >       mutex_lock(&seq->lock);
> > -     psi_trigger_replace(&seq->private, new);
> > +
> > +     /* Allow only one trigger per file descriptor */
> > +     if (READ_ONCE(seq->private)) {
> > +             mutex_unlock(&seq->lock);
> > +             return -EBUSY;
> > +     }
>
> Likewise, what does this race against that would require the use of READ_ONCE()?

Will fix.
Thanks!

>
> - Eric
