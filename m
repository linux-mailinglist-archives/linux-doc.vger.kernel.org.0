Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514C0672F1B
	for <lists+linux-doc@lfdr.de>; Thu, 19 Jan 2023 03:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjASClm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Jan 2023 21:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjASClk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 21:41:40 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B0269B1A
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 18:41:38 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-12c8312131fso1142112fac.4
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 18:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Me2XPf4O6SWq3p7pWEomevXi2GmPF+VV+xeB9XNNvxw=;
        b=I7Mdw90H5kynxYr9YWlCwQ7m9MOYGt7v6hTtnWmpyPjd7CfbamgEcA1zHC7tV4WCwm
         9M/ZR1HcqjRqOlX9GK1z3GqtV/x6Xvgow5P7U7L6hwMFQutIFoLut2FOty0c5fjbFOjM
         Vc0hw1Ce8kfSzMvQtElw0JFuPCAiwnNLxxrZD+F1erxGDKF3A/aGPanF42o4f3LNGjO6
         TNP/MWqOmGNYL1AFmJsyHC0m/8MOLSPZuNWt4MxIRpTayUU34RtkW+zme2UNty0Wuris
         D4oOuEqcpOM+cE5NG0URwslGA0zCgZG/6Q6n/3jLBZ65CejQaHVwbi9jwM+8fgrExpmK
         aSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me2XPf4O6SWq3p7pWEomevXi2GmPF+VV+xeB9XNNvxw=;
        b=1Pl/rWg8z78Y9G52hl0MXIoAjgvM88vUt+iV4r0iNS755AqIgnl7qq8ZKREgEsE0lR
         NgmOP6ER3dP9gYEF5+9rDSvT01GULlSmCxcwCl3PipqegnuOjv0zCYyReGlEDhQizc4D
         BRAWyLyM96cQkrH63LfFv0KtzatQ8yxaurLsOext3/sTlFU6mm+crBZDhmu0FHH5hqJQ
         /wsLkOUI1wbdXWPHfz2fx6FqUk2AvvpBhXXIuIMahKDZgJnHWRzJoWL0GJfETiSV+zVM
         eUKF3aH4LI2RRk2qjhejlJbFLv8HfxfJ9TwtVvq0fUZyJhZM5cfgyrNDgm36xp1hVnam
         o5Ug==
X-Gm-Message-State: AFqh2kqjBV8dCVsQ+15kJpP9SRNoElCgTzBhcncW7u2RYER7oqw3HVyN
        AHKedC/zlyy3KlaOz986JV2Z+ajMLRV8UR+/J9ctyQ==
X-Google-Smtp-Source: AMrXdXs7i2pdD876eUEmuo5z11KKwoQV+8U0enpCfi2j1cyTfGutWr0JwGuxKyKXBWXfDRoO2CgwKzIPb7zQD9PJWJU=
X-Received: by 2002:a05:6871:4090:b0:15e:dd91:cbd9 with SMTP id
 kz16-20020a056871409000b0015edd91cbd9mr610195oab.228.1674096097812; Wed, 18
 Jan 2023 18:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20230113210703.62107-1-nhuck@google.com> <d6ec50c4-5fc3-eb17-e9e8-fce334038193@linux.alibaba.com>
 <CAJkfWY7duk+5tWpW3g1iMyV9Q5t5cGunC-dh3M0X25wNq0z-TA@mail.gmail.com>
In-Reply-To: <CAJkfWY7duk+5tWpW3g1iMyV9Q5t5cGunC-dh3M0X25wNq0z-TA@mail.gmail.com>
From:   Sandeep Dhavale <dhavale@google.com>
Date:   Wed, 18 Jan 2023 18:41:26 -0800
Message-ID: <CAB=BE-SBtqis6U423zP+-8MqYDqtokOdds=5B6rUrWJ6R1c99A@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Add WQ_SCHED_FIFO
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Gao Xiang <hsiangkao@linux.alibaba.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tejun Heo <tj@kernel.org>, Daeho Jeong <daehojeong@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 14, 2023 at 1:01 PM Nathan Huckleberry <nhuck@google.com> wrote:
>
> On Fri, Jan 13, 2023 at 6:20 PM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> >
> > Hi Nathan!
> >
> > On 2023/1/14 05:07, Nathan Huckleberry wrote:
> > > Add a WQ flag that allows workqueues to use SCHED_FIFO with the least
> > > imporant RT priority.  This can reduce scheduler latency for IO
> > > post-processing when the CPU is under load without impacting other RT
> > > workloads.  This has been shown to improve app startup time on Android
> > > [1].
> >
> > Thank you all for your effort on this.  Unfortunately I have no time to
> > setup the test [1] until now.  If it can be addressed as a new workqueue
> > feature, that would be much helpful to me.  Otherwise, I still need to
> > find a way to resolve the latest Android + EROFS latency problem.
> >
>
> The above patch and following diff should have equivalent performance
> to [1], but I have not tested it.
>
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index ccf7c55d477f..a9c3893ad1d4 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -201,7 +201,7 @@ static inline int z_erofs_init_workqueue(void)
>          * scheduling overhead, perhaps per-CPU threads should be better?
>          */
>         z_erofs_workqueue = alloc_workqueue("erofs_unzipd",
> -                                           WQ_UNBOUND | WQ_HIGHPRI,
> +                                           WQ_SCHED_FIFO,
>                                             onlinecpus + onlinecpus / 4);
>         return z_erofs_workqueue ? 0 : -ENOMEM;
>
> Thanks,
> Huck
>
>  }
>
Hello All,
With WQ_SCHED_FIFO and erofs patch mentioned above, I see that average
sched latency improves in the same ballpark as my previous
work proposed in [1] doing the same experiment (app launch tests) and
variation is reduced significantly.

Here is the table
|--------------+-----------+---------------+---------|
|              | Workqueue | WQ_SCHED_FIFO | Delta   |
|--------------+-----------+---------------+---------|
| Average (us) | 15253     | 3514          | -76.96% |
|--------------+-----------+---------------+---------|
| Median (us)  | 14001     | 3450          | -75.36% |
|--------------+-----------+---------------+---------|
| Minimum (us) | 3117      | 3097          | -0.64%  |
|--------------+-----------+---------------+---------|
| Maximum (us) | 30170     | 4896          | -83.77% |
|--------------+-----------+---------------+---------|
| Stdev        | 7166      | 319           |         |
|--------------+-----------+---------------+---------|

Thanks,
Sandeep.

[1] https://lore.kernel.org/linux-erofs/20230106073502.4017276-1-dhavale@google.com/

>
> > >
> > > Scheduler latency affects several drivers as evidenced by [1], [2], [3],
> > > [4].  Some of these drivers have moved post-processing into IRQ context.
> > > However, this can cause latency spikes for real-time threads and jitter
> > > related jank on Android.  Using a workqueue with SCHED_FIFO improves
> > > scheduler latency without causing latency problems for RT threads.
> >
> > softirq context is actually mainly for post-interrupt handling I think.
> > but considering decompression/verification/decryption all workload are much
> > complex than that and less important than real post-interrupt handling.
> > I don't think softirq context is the best place to handle these
> > CPU-intensive jobs.  Beside, it could cause some important work moving to
> > softirqd unexpectedly in the extreme cases.  Also such many post-processing
> > jobs are as complex as they could sleep so that softirq context is
> > unsuitable as well.
> >
> > Anyway, I second this proposal if possible:
> >
> > Acked-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> >
> > Thanks,
> > Gao Xiang
> >
> > >
> > > [1]:
> > > https://lore.kernel.org/linux-erofs/20230106073502.4017276-1-dhavale@google.com/
> > > [2]:
> > > https://lore.kernel.org/linux-f2fs-devel/20220802192437.1895492-1-daeho43@gmail.com/
> > > [3]:
> > > https://lore.kernel.org/dm-devel/20220722093823.4158756-4-nhuck@google.com/
> > > [4]:
> > > https://lore.kernel.org/dm-crypt/20200706173731.3734-1-ignat@cloudflare.com/
> > >
> > > This change has been tested on dm-verity with the following fio config:
> > >
> > > [global]
> > > time_based
> > > runtime=120
> > >
> > > [do-verify]
> > > ioengine=sync
> > > filename=/dev/testing
> > > rw=randread
> > > direct=1
> > >
> > > [burn_8x90%_qsort]
> > > ioengine=cpuio
> > > cpuload=90
> > > numjobs=8
> > > cpumode=qsort
> > >
> > > Before:
> > > clat (usec): min=13, max=23882, avg=29.56, stdev=113.29 READ:
> > > bw=122MiB/s (128MB/s), 122MiB/s-122MiB/s (128MB/s-128MB/s), io=14.3GiB
> > > (15.3GB), run=120001-120001msec
> > >
> > > After:
> > > clat (usec): min=13, max=23137, avg=19.96, stdev=105.71 READ:
> > > bw=180MiB/s (189MB/s), 180MiB/s-180MiB/s (189MB/s-189MB/s), io=21.1GiB
> > > (22.7GB), run=120012-120012msec
> > >
> > > Cc: Sandeep Dhavale <dhavale@google.com>
> > > Cc: Daeho Jeong <daehojeong@google.com>
> > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> > > ---
> > >   Documentation/core-api/workqueue.rst | 12 ++++++++++
> > >   include/linux/workqueue.h            |  9 +++++++
> > >   kernel/workqueue.c                   | 36 +++++++++++++++++++++-------
> > >   3 files changed, 48 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
> > > index 3b22ed137662..26faf2806c66 100644
> > > --- a/Documentation/core-api/workqueue.rst
> > > +++ b/Documentation/core-api/workqueue.rst
> > > @@ -216,6 +216,18 @@ resources, scheduled and executed.
> > >
> > >     This flag is meaningless for unbound wq.
> > >
> > > +``WQ_SCHED_FIFO``
> > > +  Work items of a fifo wq are queued to the fifo
> > > +  worker-pool of the target cpu.  Fifo worker-pools are
> > > +  served by worker threads with scheduler policy SCHED_FIFO and
> > > +  the least important real-time priority.  This can be useful
> > > +  for workloads where low latency is imporant.
> > > +
> > > +  A workqueue cannot be both high-priority and fifo.
> > > +
> > > +  Note that normal and fifo worker-pools don't interact with
> > > +  each other.  Each maintains its separate pool of workers and
> > > +  implements concurrency management among its workers.
> > >
> > >   ``max_active``
> > >   --------------
> > > diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> > > index ac551b8ee7d9..43a4eeaf8ff4 100644
> > > --- a/include/linux/workqueue.h
> > > +++ b/include/linux/workqueue.h
> > > @@ -134,6 +134,10 @@ struct workqueue_attrs {
> > >        * @nice: nice level
> > >        */
> > >       int nice;
> > > +     /**
> > > +      * @sched_fifo: is using SCHED_FIFO
> > > +      */
> > > +     bool sched_fifo;
> > >
> > >       /**
> > >        * @cpumask: allowed CPUs
> > > @@ -334,6 +338,11 @@ enum {
> > >        * http://thread.gmane.org/gmane.linux.kernel/1480396
> > >        */
> > >       WQ_POWER_EFFICIENT      = 1 << 7,
> > > +     /*
> > > +      * Low real-time priority workqueues can reduce scheduler latency
> > > +      * for latency sensitive workloads like IO post-processing.
> > > +      */
> > > +     WQ_SCHED_FIFO           = 1 << 8,
> > >
> > >       __WQ_DESTROYING         = 1 << 15, /* internal: workqueue is destroying */
> > >       __WQ_DRAINING           = 1 << 16, /* internal: workqueue is draining */
> > > diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> > > index 5dc67aa9d696..99c5e0a3dc28 100644
> > > --- a/kernel/workqueue.c
> > > +++ b/kernel/workqueue.c
> > > @@ -85,7 +85,7 @@ enum {
> > >       WORKER_NOT_RUNNING      = WORKER_PREP | WORKER_CPU_INTENSIVE |
> > >                                 WORKER_UNBOUND | WORKER_REBOUND,
> > >
> > > -     NR_STD_WORKER_POOLS     = 2,            /* # standard pools per cpu */
> > > +     NR_STD_WORKER_POOLS     = 3,            /* # standard pools per cpu */
> > >
> > >       UNBOUND_POOL_HASH_ORDER = 6,            /* hashed by pool->attrs */
> > >       BUSY_WORKER_HASH_ORDER  = 6,            /* 64 pointers */
> > > @@ -1949,7 +1949,8 @@ static struct worker *create_worker(struct worker_pool *pool)
> > >
> > >       if (pool->cpu >= 0)
> > >               snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
> > > -                      pool->attrs->nice < 0  ? "H" : "");
> > > +                      pool->attrs->sched_fifo ? "F" :
> > > +                      (pool->attrs->nice < 0  ? "H" : ""));
> > >       else
> > >               snprintf(id_buf, sizeof(id_buf), "u%d:%d", pool->id, id);
> > >
> > > @@ -1958,7 +1959,11 @@ static struct worker *create_worker(struct worker_pool *pool)
> > >       if (IS_ERR(worker->task))
> > >               goto fail;
> > >
> > > -     set_user_nice(worker->task, pool->attrs->nice);
> > > +     if (pool->attrs->sched_fifo)
> > > +             sched_set_fifo_low(worker->task);
> > > +     else
> > > +             set_user_nice(worker->task, pool->attrs->nice);
> > > +
> > >       kthread_bind_mask(worker->task, pool->attrs->cpumask);
> > >
> > >       /* successful, attach the worker to the pool */
> > > @@ -4323,9 +4328,17 @@ static void wq_update_unbound_numa(struct workqueue_struct *wq, int cpu,
> > >
> > >   static int alloc_and_link_pwqs(struct workqueue_struct *wq)
> > >   {
> > > -     bool highpri = wq->flags & WQ_HIGHPRI;
> > > +     int pool_index = 0;
> > >       int cpu, ret;
> > >
> > > +     if (wq->flags & WQ_HIGHPRI && wq->flags & WQ_SCHED_FIFO)
> > > +             return -EINVAL;
> > > +
> > > +     if (wq->flags & WQ_HIGHPRI)
> > > +             pool_index = 1;
> > > +     if (wq->flags & WQ_SCHED_FIFO)
> > > +             pool_index = 2;
> > > +
> > >       if (!(wq->flags & WQ_UNBOUND)) {
> > >               wq->cpu_pwqs = alloc_percpu(struct pool_workqueue);
> > >               if (!wq->cpu_pwqs)
> > > @@ -4337,7 +4350,7 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
> > >                       struct worker_pool *cpu_pools =
> > >                               per_cpu(cpu_worker_pools, cpu);
> > >
> > > -                     init_pwq(pwq, wq, &cpu_pools[highpri]);
> > > +                     init_pwq(pwq, wq, &cpu_pools[pool_index]);
> > >
> > >                       mutex_lock(&wq->mutex);
> > >                       link_pwq(pwq);
> > > @@ -4348,13 +4361,13 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
> > >
> > >       cpus_read_lock();
> > >       if (wq->flags & __WQ_ORDERED) {
> > > -             ret = apply_workqueue_attrs(wq, ordered_wq_attrs[highpri]);
> > > +             ret = apply_workqueue_attrs(wq, ordered_wq_attrs[pool_index]);
> > >               /* there should only be single pwq for ordering guarantee */
> > >               WARN(!ret && (wq->pwqs.next != &wq->dfl_pwq->pwqs_node ||
> > >                             wq->pwqs.prev != &wq->dfl_pwq->pwqs_node),
> > >                    "ordering guarantee broken for workqueue %s\n", wq->name);
> > >       } else {
> > > -             ret = apply_workqueue_attrs(wq, unbound_std_wq_attrs[highpri]);
> > > +             ret = apply_workqueue_attrs(wq, unbound_std_wq_attrs[pool_index]);
> > >       }
> > >       cpus_read_unlock();
> > >
> > > @@ -6138,7 +6151,8 @@ static void __init wq_numa_init(void)
> > >    */
> > >   void __init workqueue_init_early(void)
> > >   {
> > > -     int std_nice[NR_STD_WORKER_POOLS] = { 0, HIGHPRI_NICE_LEVEL };
> > > +     int std_nice[NR_STD_WORKER_POOLS] = { 0, HIGHPRI_NICE_LEVEL, 0 };
> > > +     bool std_sched_fifo[NR_STD_WORKER_POOLS] = { false, false, true };
> > >       int i, cpu;
> > >
> > >       BUILD_BUG_ON(__alignof__(struct pool_workqueue) < __alignof__(long long));
> > > @@ -6158,8 +6172,10 @@ void __init workqueue_init_early(void)
> > >                       BUG_ON(init_worker_pool(pool));
> > >                       pool->cpu = cpu;
> > >                       cpumask_copy(pool->attrs->cpumask, cpumask_of(cpu));
> > > -                     pool->attrs->nice = std_nice[i++];
> > > +                     pool->attrs->nice = std_nice[i];
> > > +                     pool->attrs->sched_fifo = std_sched_fifo[i];
> > >                       pool->node = cpu_to_node(cpu);
> > > +                     i++;
> > >
> > >                       /* alloc pool ID */
> > >                       mutex_lock(&wq_pool_mutex);
> > > @@ -6174,6 +6190,7 @@ void __init workqueue_init_early(void)
> > >
> > >               BUG_ON(!(attrs = alloc_workqueue_attrs()));
> > >               attrs->nice = std_nice[i];
> > > +             attrs->sched_fifo = std_sched_fifo[i];
> > >               unbound_std_wq_attrs[i] = attrs;
> > >
> > >               /*
> > > @@ -6183,6 +6200,7 @@ void __init workqueue_init_early(void)
> > >                */
> > >               BUG_ON(!(attrs = alloc_workqueue_attrs()));
> > >               attrs->nice = std_nice[i];
> > > +             attrs->sched_fifo = std_sched_fifo[i];
> > >               attrs->no_numa = true;
> > >               ordered_wq_attrs[i] = attrs;
> > >       }
